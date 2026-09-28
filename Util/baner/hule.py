#!/usr/bin/env python3
"""
Grottebaner (bane 5-9): én sammenhengende grotte nedover, med gulv, tak,
gap, søyler, is og isdaler, tegnet organisk.

Kjør fra roten av repoet:

    pip install numpy scipy pillow
    python3 Util/baner/hule.py 5 --sjekk      # bare målinger og oversiktsbilde
    python3 Util/baner/hule.py 5              # skriver level5/*.png,
                                              # lib/shapedefs5.lua og
                                              # lib/baneoppsett5.lua

HVORDAN
Banen beskrives som en rekke partier langs gulvet (se BANER nederst):
bakke, hopp, søyletrapp, isdal, med tak og is over valgte strekninger.
Verktøyet lager gulvlinja fra partiene, bygger masser rundt den (gulv
under, tak over, overheng over isdaler, drypp under tak), og tegner alt
med runde hjørner og rolige bølger langs kanten.

Koordinater er "verdenspiksler": 1 px = 2 spillenheter, og marken står
som i alle baner i del1 = (0, 0), altså i verden (-95..0, 0).

Flisene (4 bilder på 3840 x 2351) legges fritt langs grotta med litt
overlapp, så gulv og tak kan gå sammenhengende fra flis til flis. Hver
verdenspiksel tegnes bare i én flis (den første som dekker den).
Plasseringen, dødslinja, målet og bakgrunnsretningen skrives til
lib/baneoppsettN.lua, som levelN.lua leser.

MÅL FRA BANE 4 (se KODEBASE.md, "Bane 4 målt")
- rulleflatene heller 13-31 grader, median 24, sjelden over 41,
- maks-hoppet: 30 graders tilløp, 520 px bort og 265 px ned,
- isdalen: V-gulv under overheng, 10-50 px åpning i bunnen, is på begge
  sider, marken må være slapp,
- tak med drypp over rulleflata som i bane 3 (44-400 px åpning).
"""
import math
import sys

import numpy as np
from PIL import Image, ImageDraw
from scipy import ndimage as nd

sys.path.insert(0, "Util/baner")
import lag_bane as L  # noqa: E402

W, H = L.W, L.H
OVERLAPP = 350            # hvor mye neste flis starter før forrige slutter
MARG = 60                 # minste avstand fra stein til flisekanten

# Is-farger målt i level4/2-4.png: kald konturstrek, glans, midt, dyp.
IS_LAG = [(0, 2, (15, 50, 63)), (2, 7, (36, 96, 118)), (7, 16, (30, 84, 104)), (16, 30, (20, 60, 74))]


# ------------------------------------------------------------ geometri

class Grotte:
    """Bygger gulvlinja og massene fra en liste med partier."""

    def __init__(self, start=(-420, -60)):
        self.x, self.y = start
        self.biter = [[(self.x, self.y)]]      # gulvbiter (mellom hopp)
        self.tak = []                            # (x0, x1, klaring, tykk, drypp)
        self.is_ = []                            # (x0, x1)
        self.overheng = []                       # isdaler: (x0, x1)
        self.soyler = set()                      # indekser til biter som er søyler
        self.merker = []                         # (x, y, tekst) til oversikten

    def punkt(self, x, y):
        self.x, self.y = x, y
        self.biter[-1].append((x, y))

    def bakke(self, lengde, grader, bue=0.0, steg=90):
        """Nedoverbakke `lengde` px bortover. `bue` endrer vinkelen jevnt
        (grader fra start til slutt), så bakken ikke blir rett."""
        n = max(2, int(lengde / steg))
        for i in range(1, n + 1):
            g = grader + bue * (i / n - 0.5)
            dx = lengde / n
            self.punkt(self.x + dx, self.y + dx * math.tan(math.radians(g)))

    def hopp(self, bort, ned, tekst=None):
        """Gulvet slutter (kant) og fortsetter `bort` px lenger bort og
        `ned` px lenger ned."""
        if tekst:
            self.merker.append((self.x + bort / 2, self.y - 120, tekst))
        self.biter.append([])
        self.punkt(self.x + bort, self.y + ned)

    def soyletrapp(self, antall, bredde, gap, ned, grader=22, is_paa=False):
        """Frittstående søyler som trapper ned, som i bane 4."""
        for i in range(antall):
            self.hopp(gap, ned)
            self.soyler.add(len(self.biter) - 1)
            x0 = self.x
            self.bakke(bredde, grader, bue=6)
            if is_paa:
                self.is_.append((x0 + bredde * 0.25, self.x - 20))
        self.hopp(gap, ned)

    def isdal(self, bredde, dybde, ut, klaring=45):
        """V-formet dal med is og overheng: gulvet går `dybde` ned og opp
        igjen til en kant `ut` px lavere enn der dalen startet. Taket over
        går ned til `klaring` px over bunnen, så marken må være slapp."""
        x0, y0 = self.x, self.y
        n = 16
        for i in range(1, n + 1):
            t = i / n
            if t <= 0.55:
                u = t / 0.55
                dy = dybde * (1 - math.cos(math.pi * u)) / 2
            else:
                u = (t - 0.55) / 0.45
                dy = dybde - (dybde - ut) * (1 - math.cos(math.pi * u)) / 2
            self.punkt(x0 + bredde * t, y0 + dy)
        self.is_.append((x0 - 40, self.x + 40))
        self.overheng.append((x0 - 120, self.x + 300, klaring, x0 + 0.55 * bredde))
        self.merker.append((x0 + bredde / 2, y0 - 330, "isdal: vær slapp"))

    def tak_over(self, lengde_foran, klaring, tykk=240, drypp=()):
        """Tak over de neste `lengde_foran` px (legges til når gulvet der er
        bygget). drypp: posisjoner (0..1) langs taket med drypp."""
        self.tak.append((self.x, self.x + lengde_foran, klaring, tykk, drypp))

    def is_over(self, lengde_foran):
        self.is_.append((self.x, self.x + lengde_foran))

    # --------------------------------------------------------- masser

    def gulv_y(self, x):
        """Gulvhøyden (toppen av rulleflata) i x, interpolert over gap."""
        pts = [p for b in self.biter for p in b]
        xs = np.array([p[0] for p in pts])
        ys = np.array([p[1] for p in pts])
        o = np.argsort(xs)
        return float(np.interp(x, xs[o], ys[o]))

    def masser(self, fro):
        rng = np.random.default_rng(fro)
        m = {}
        # gulvbiter: et bånd av stein som følger rulleflata, tynnere mot
        # endene så kantene blir runde. Søyler går dypere og smalner nedover.
        for i, b in enumerate(self.biter):
            if len(b) < 2:
                continue
            topp = list(b)
            xs = np.array([p[0] for p in topp])
            ys = np.array([p[1] for p in topp])
            soyle = i in self.soyler
            lengde = xs[-1] - xs[0]
            fase = rng.uniform(0, 2 * math.pi, 2)
            u = (xs - xs[0]) / max(lengde, 1)
            if soyle:
                dyp = rng.uniform(0.9, 1.0) * (UNDER_SOYLE - 60)
                midt = (xs[0] + xs[-1]) / 2
                bunn = [(xs[-1] - 10, ys[-1] + 140),
                        (midt + lengde * 0.3, ys.max() + dyp * 0.7),
                        (midt + lengde * 0.18, ys.max() + dyp),
                        (midt - lengde * 0.2, ys.max() + dyp - rng.uniform(0, 40)),
                        (midt - lengde * 0.32, ys.max() + dyp * 0.6),
                        (xs[0] + 10, ys[0] + 120)]
            else:
                tykk = (UNDER - 70) * (0.84 + 0.08 * np.sin(2 * math.pi * u * max(1, lengde / 900) + fase[0])
                                       + 0.06 * np.sin(2 * math.pi * u * max(2, lengde / 350) + fase[1]))
                ende = np.clip(np.minimum(xs - xs[0], xs[-1] - xs) / 220, 0, 1)
                tykk *= 0.5 + 0.5 * np.sqrt(ende)
                bunn = [(x, y + t) for x, y, t in zip(xs[::-1], ys[::-1], tykk[::-1])]
            m["gulv%d" % i] = topp + bunn
        # tak
        for j, (x0, x1, klaring, tykk, drypp) in enumerate(self.tak):
            xs = np.linspace(x0, x1, 18)
            under = [(x, self.gulv_y(x) - klaring) for x in xs]
            # tynnere mot endene, så taket ender rundt og ikke kantete
            ende = [min(1.0, min(x - x0, x1 - x) / 260) for x in xs]
            over = [(x, y - tykk * (0.35 + 0.65 * math.sqrt(e)) - rng.uniform(-40, 60) * e)
                    for (x, y), e in zip(under[::-1], ende[::-1])]
            m["tak%d" % j] = under + over
            for k, t in enumerate(drypp):
                x = x0 + (x1 - x0) * t
                y = self.gulv_y(x) - klaring
                lang = klaring * rng.uniform(0.35, 0.5)
                m["drypp%d_%d" % (j, k)] = [(x - 55, y - 30), (x, y + lang), (x + 55, y - 30)]
        # overheng over isdaler: underkanten følger gulvet med `klaring`
        # i bunnen og mer åpning mot endene, krøller seg opp til høyre.
        for j, (x0, x1, klaring, bunnpunkt) in enumerate(self.overheng):
            xs = np.linspace(x0, x1, 22)
            mid = (x0 + x1) / 2
            under = []
            for x in xs:
                avst = abs(x - bunnpunkt) / ((x1 - x0) / 2)   # 0 over bunnen av dalen
                k = klaring + 170 * avst ** 1.6
                under.append((x, self.gulv_y(x) - k))
            over = [(x, y - 240 - 120 * math.sin(math.pi * (x - x0) / (x1 - x0)))
                    for x, y in under[::-1]]
            over[0] = (over[0][0] + 80, over[0][1] - 120)     # krøll til høyre
            m["overheng%d" % j] = under + over
            del mid
        return m


# ------------------------------------------------------------ tegning

def chaikin(pkt, runder=3):
    p = np.asarray(pkt, float)
    for _ in range(runder):
        q = np.roll(p, -1, axis=0)
        p = np.stack([0.75 * p + 0.25 * q, 0.25 * p + 0.75 * q], axis=1).reshape(-1, 2)
    return p


def organisk_kontur(pkt, fro, store=16.0, liten=False):
    """Lukket kontur med runde hjørner og rolige bølger langs kanten."""
    rng = np.random.default_rng(fro)
    p = chaikin(pkt, 2 if liten else 3)
    ring = np.vstack([p, p[:1]])
    seg = np.diff(ring, axis=0)
    s = np.concatenate([[0], np.cumsum(np.hypot(seg[:, 0], seg[:, 1]))])
    tot = s[-1]
    t = np.arange(0, tot, 6.0)
    x = np.interp(t, s, ring[:, 0])
    y = np.interp(t, s, ring[:, 1])
    dx = np.gradient(x)
    dy = np.gradient(y)
    n = np.hypot(dx, dy) + 1e-9
    nx, ny = dy / n, -dx / n
    forsk = np.zeros_like(t)
    oktaver = [(60.0, 3.0)] if liten else [(420.0, store), (150.0, store * 0.15)]
    for bolge, amp in oktaver:
        k = max(1, int(round(tot / bolge)))
        for _ in range(2):
            forsk += amp / 2 * np.sin(2 * math.pi * k * t / tot + rng.uniform(0, 2 * math.pi))
    return np.stack([x + nx * forsk, y + ny * forsk], axis=1)


def felt_for(masser, ox, oy, bredde, hoyde, fro):
    """Glatt felt (0..1) for et utsnitt av verden, pluss en maske per masse."""
    felt = np.zeros((hoyde, bredde), np.float32)
    per = {}
    for i, (navn, pkt) in enumerate(sorted(masser.items())):
        xs = [p[0] - ox for p in pkt]
        ys = [p[1] - oy for p in pkt]
        if max(xs) < -200 or min(xs) > bredde + 200 or max(ys) < -200 or min(ys) > hoyde + 200:
            continue
        kontur = organisk_kontur(pkt, fro + i, liten=navn.startswith("drypp"))
        lokal = [(float(x - ox), float(y - oy)) for x, y in kontur]
        im = Image.new("L", (bredde, hoyde), 0)
        ImageDraw.Draw(im).polygon(lokal, fill=255)
        f = nd.gaussian_filter((np.asarray(im) > 127).astype(np.float32), 7)
        per[navn] = f >= 0.5
        felt = np.maximum(felt, f)
    return felt, per


def is_maske(grotte, per, ox, oy, bredde, hoyde):
    """Is på toppen av gulvet i is-strekningene, og på undersiden av
    overheng."""
    ut = np.zeros((hoyde, bredde), bool)
    gulv = np.zeros((hoyde, bredde), bool)
    for navn, m in per.items():
        if navn.startswith("gulv"):
            gulv |= m
    topp = np.where(gulv.any(0), gulv.argmax(0), hoyde)
    dy = np.arange(hoyde)[:, None] - topp[None, :]
    xs = np.arange(bredde) + ox
    for x0, x1 in grotte.is_:
        sel = (xs >= x0) & (xs <= x1)
        ut[:, sel] |= gulv[:, sel] & (dy[:, sel] >= 0) & (dy[:, sel] < 30)
    for navn, m in per.items():
        if navn.startswith("overheng"):
            bunn = hoyde - 1 - np.where(m[::-1].any(0), m[::-1].argmax(0), hoyde)
            d2 = bunn[None, :] - np.arange(hoyde)[:, None]
            ut |= m & (d2 >= 0) & (d2 < 30)
    return ut


def mal_is(bilde, felt, ismaske):
    m = felt >= 0.5
    d = nd.distance_transform_edt(m)
    a = np.asarray(bilde).copy()
    for d0, d1, farge in IS_LAG:
        sel = ismaske & (d >= d0) & (d < d1)
        a[sel, 0], a[sel, 1], a[sel, 2] = farge
    return Image.fromarray(a, "RGBA")


# ------------------------------------------------------------ fliser

UNDER = 330      # så mye plass under gulvet i hver flis (steinbåndet)
UNDER_SOYLE = 620  # under søyler, som går dypere
OVER_FRI = 60    # over gulvet trengs bare plass der det er stein (tak, overheng)


def over_behov(grotte, x0, x1):
    """Hvor høyt over gulvet det må være plass i x0..x1 (tak + drypp,
    overheng, ellers litt luft)."""
    behov = OVER_FRI
    for t0, t1, klaring, tykk, _ in grotte.tak:
        if t1 > x0 and t0 < x1:
            behov = max(behov, klaring + tykk + 90)
    for o0, o1, klaring, _ in grotte.overheng:
        if o1 > x0 and o0 < x1:
            behov = max(behov, 700)
    return behov


def under_behov(grotte, x):
    """Hvor mye plass under gulvet i x: mer der det står søyler."""
    for i in grotte.soyler:
        b = grotte.biter[i]
        if b[0][0] - 60 <= x <= b[-1][0] + 60:
            return UNDER_SOYLE
    return UNDER


def plasser_fliser(grotte, masser):
    """Legger 4 fliser langs gulvet. Hver flis dekker så mye av gulvet som
    får plass i høyden (gulv, tak over og UNDER px stein under); neste flis
    starter OVERLAPP px før forrige slutter. Returnerer origo og hvor langt
    gulvet er dekket."""
    x_slutt = max(p[0] for b in grotte.biter for p in b)
    ox = -520
    origo = []
    dekket = ox
    for k in range(4):
        beste = None
        for bredde in range(W - 2 * MARG, 600, -40):
            xs = np.linspace(ox + MARG, ox + MARG + bredde, 50)
            gy = np.array([grotte.gulv_y(x) for x in xs])
            over = np.array([over_behov(grotte, x - 150, x + 150) for x in xs])
            topp = (gy - over).min()
            if k == 0:
                topp = min(topp, -160)       # marken står i y = 0
            under = np.array([under_behov(grotte, x) for x in xs])
            if (gy + under).max() - topp <= H - 2 * MARG:
                beste = (bredde, int(topp - MARG))
                break
        if beste is None:
            raise SystemExit("flis %d: gulvet er for bratt til å få plass" % (k + 1))
        bredde, oy = beste
        origo.append((int(ox), oy))
        dekket = ox + MARG + bredde
        if dekket >= x_slutt + 300:
            break
        ox = dekket - OVERLAPP
    return origo, dekket, x_slutt


def eier(origo):
    """Hvilke piksler i hver flis som tegnes der (første flis som dekker en
    verdenspiksel eier den)."""
    ut = []
    for k, (ox, oy) in enumerate(origo):
        m = np.ones((H, W), bool)
        for j in range(k):
            px, py = origo[j]
            x0, x1 = max(px - ox, 0), min(px + W - ox, W)
            y0, y1 = max(py - oy, 0), min(py + H - oy, H)
            if x0 < x1 and y0 < y1:
                m[y0:y1, x0:x1] = False
        ut.append(m)
    return ut


# ------------------------------------------------------------ baner

def bane5(g):
    """Lettest: to vanlige hopp og ett maks-hopp, to tak med drypp, litt is."""
    g.bakke(1300, 28, bue=6)
    g.hopp(380, 250)
    g.tak_over(800, 460)
    g.bakke(900, 20, bue=-6)
    g.tak_over(2100, 420, drypp=(0.3, 0.7))
    g.bakke(1200, 18, bue=8)
    g.is_over(700)
    g.bakke(900, 24, bue=-4)
    g.hopp(300, 300)
    g.bakke(1600, 24, bue=10)
    g.hopp(500, 265, "maks-hopp")
    g.bakke(1300, 20, bue=-8)
    g.tak_over(1600, 380, drypp=(0.2, 0.5, 0.8))
    g.bakke(1700, 17, bue=6)
    g.bakke(1300, 24)


def bane6(g):
    """Søyletrapp med is, tunnel med drypp, to hopp, isbakke."""
    g.bakke(1200, 28, bue=6)
    g.hopp(420, 260)
    g.bakke(1000, 22, bue=-6)
    g.soyletrapp(3, 380, 210, 250, is_paa=True)
    g.bakke(800, 20, bue=6)
    g.tak_over(2300, 340, drypp=(0.15, 0.4, 0.65, 0.9))
    g.bakke(2100, 17, bue=-6)
    g.is_over(900)
    g.bakke(900, 26, bue=4)
    g.bakke(900, 30, bue=-4)
    g.hopp(500, 265, "maks-hopp")
    g.bakke(1500, 20, bue=6)
    g.bakke(700, 24)


def bane7(g):
    """Første isdal (marken må være slapp), tak, søyler, maks-hopp."""
    g.bakke(1300, 28, bue=6)
    g.hopp(500, 265, "maks-hopp")
    g.bakke(1000, 20, bue=-6)
    g.tak_over(1900, 320, drypp=(0.25, 0.55, 0.85))
    g.bakke(1900, 17, bue=6)
    g.bakke(500, 24)
    g.isdal(700, 230, 90, klaring=55)
    g.bakke(900, 22, bue=-6)
    g.soyletrapp(2, 420, 240, 280, is_paa=True)
    g.bakke(1400, 26, bue=6)
    g.hopp(360, 300)
    g.bakke(1500, 20, bue=-6)
    g.bakke(700, 24)


def bane8(g):
    """Lang, trang tunnel, isdal, søyletrapp med is, maks-hopp og gap."""
    g.bakke(1100, 28, bue=6)
    g.hopp(440, 240)
    g.tak_over(800, 330, drypp=(0.5,))
    g.bakke(900, 22, bue=-6)
    g.soyletrapp(3, 360, 220, 250, is_paa=True)
    g.bakke(700, 20)
    g.tak_over(2100, 270, drypp=(0.1, 0.3, 0.5, 0.7, 0.9))
    g.bakke(2100, 17, bue=-8)
    g.isdal(650, 240, 100, klaring=48)
    g.bakke(1300, 28, bue=6)
    g.hopp(520, 265, "maks-hopp")
    g.bakke(900, 20, bue=-6)
    g.is_over(500)
    g.bakke(500, 24)


def bane9(g):
    """Vanskeligst: to isdaler, trangt tak, to maks-hopp, søyler med is,
    lang isbakke."""
    g.bakke(1100, 30, bue=4)
    g.hopp(520, 265, "maks-hopp")
    g.bakke(600, 22, bue=-6)
    g.isdal(650, 250, 110, klaring=42)
    g.bakke(500, 20)
    g.tak_over(1800, 230, drypp=(0.15, 0.35, 0.55, 0.75, 0.95))
    g.bakke(1800, 17, bue=-6)
    g.soyletrapp(2, 340, 240, 270, is_paa=True)
    g.bakke(500, 24, bue=6)
    g.is_over(900)
    g.bakke(700, 26, bue=-4)
    g.isdal(650, 240, 100, klaring=42)
    g.bakke(900, 30, bue=4)
    g.hopp(520, 265, "maks-hopp")
    g.tak_over(1300, 260, drypp=(0.3, 0.7))
    g.bakke(900, 22, bue=-6)
    g.bakke(600, 24)


BANER = {5: bane5, 6: bane6, 7: bane7, 8: bane8, 9: bane9}


def palett(bane):
    """Fra brun jord (bane 5, samme farger som bane 4) mot grå stein
    (bane 9), som SPILLIDE.md beskriver."""
    t = (bane - 5) / 4 * 0.85
    brun = dict(KANT=(72, 33, 6), OVERGANG=(41, 16, 2), KROPP=(38, 14, 1))
    gra = dict(KANT=(74, 68, 62), OVERGANG=(42, 39, 36), KROPP=(34, 32, 30))
    return {k: tuple(int(round(brun[k][i] * (1 - t) + gra[k][i] * t)) for i in range(3)) for k in brun}


def bygg(bane):
    """Bygger banen. Får den ikke plass i 4 fliser, kortes siste bakke
    (etter siste hopp) inn til den gjør det."""
    g = Grotte()
    BANER[bane](g)
    while True:
        masser = g.masser(100 * bane)
        origo, dekket, x_slutt = plasser_fliser(g, masser)
        if dekket >= x_slutt + 300 and len(origo) <= 4:
            break
        siste = g.biter[-1]
        if len(siste) < 3 or siste[-1][0] - siste[0][0] < KAMERA_STOPP + 200:
            raise SystemExit("bane %d får ikke plass i 4 fliser" % bane)
        siste.pop()
        g.x, g.y = siste[-1]
    print("bane %d: %d fliser, gulvet dekket til x=%d av %d" % (bane, len(origo), dekket, x_slutt))
    return g, masser, origo


def innenfor(origo, ox, oy, bredde, hoyde):
    """Glatt felt som er 1 inne i unionen av flisene (minus MARG) og 0
    utenfor, for et utsnitt. Stein som går ut av alle flisene får da en
    avrundet kant med kontur i stedet for et kutt."""
    m = np.zeros((hoyde, bredde), bool)
    for px, py in origo:
        x0, x1 = max(px - ox + MARG, 0), min(px + W - ox - MARG, bredde)
        y0, y1 = max(py - oy + MARG, 0), min(py + H - oy - MARG, hoyde)
        if x0 < x1 and y0 < y1:
            m[y0:y1, x0:x1] = True
    return nd.gaussian_filter(m.astype(np.float32), 18)


def tegn_flis(bane, g, masser, origo, k, pad=400):
    """Bilde, maske og is-maske for flis k. Tegnes med `pad` px nabostein
    rundt, så skyggen er lik på begge sider av en flisegrense."""
    ox, oy = origo[k]
    bx, by = ox - pad, oy - pad
    bw, bh = W + 2 * pad, H + 2 * pad
    felt, per = felt_for(masser, bx, by, bw, bh, 1000 * bane)
    felt = np.minimum(felt, innenfor(origo, bx, by, bw, bh))
    ism = is_maske(g, per, bx, by, bw, bh) & (felt >= 0.5)
    bilde = L.mal(felt, 10 * bane + k)
    bilde = mal_is(bilde, felt, ism)
    crop = (pad, pad, pad + W, pad + H)
    bilde = bilde.crop(crop)
    e = eier(origo)[k]
    a = np.asarray(bilde).copy()
    a[~e, 3] = 0
    maske = (felt[pad:pad + H, pad:pad + W] >= 0.5) & e
    return Image.fromarray(a, "RGBA"), maske, ism[pad:pad + H, pad:pad + W] & e


def friksjoner(former, ismaske):
    """friction per kollisjonsform: 0.05 (is) når toppkanten ligger på is,
    ellers 3 som resten av spillet."""
    ut = []
    for f in former:
        (v, y1v), (h, y1h) = f[0], f[1]
        xs = np.linspace(v, h, 8).astype(int).clip(0, W - 1)
        ys = np.linspace(y1v, y1h, 8).astype(int) + 6
        ys = ys.clip(0, H - 1)
        paa_is = ismaske[ys, xs].mean() >= 0.5
        ut.append(0.05 if paa_is else 3)
    return ut


def skriv_shapedefs(bane, alle, alle_frik):
    gammel = open("lib/shapedefs8.lua", encoding="utf-8").read()
    hale = gammel[gammel.index('\t\t["del1"]'):]
    hode = L.HODE.replace("{N}", str(bane)).replace(
        "generert av Util/baner/lag_bane.py rett\n-- fra Ørjans tegning (Util/baner/tegning%d.jpg)" % bane,
        "generert av Util/baner/hule.py")
    ut = [hode, "local unpack = unpack\nlocal pairs = pairs\nlocal ipairs = ipairs\n\n",
          "local M = {}\n\nfunction M.physicsData(scale)\n\tlocal physics = { data =\n\t{\n"]
    for nr, (former, frik) in enumerate(zip(alle, alle_frik), 1):
        ut.append('\t\t["%d"] = {\n' % nr)
        biter = []
        for f, fr in zip(former, frik):
            punkt = "  ,  ".join("%d, %d" % L.til_spill(px, py) for px, py in f)
            biter.append(
                "                    {\n"
                '                    pe_fixture_id = "%s", density = 2, friction = %s, bounce = 0, \n'
                "                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },\n"
                "                    shape = {  %s  }\n"
                "                    }\n" % ("is" if fr < 1 else "", fr, punkt))
        ut.append("                     ,\n".join(biter))
        ut.append("\t\t}\n\t\t,\n")
    ut.append(hale)
    open("lib/shapedefs%d.lua" % bane, "w", encoding="utf-8").write("".join(ut))


def dodslinje(g):
    """Rett linje under all gulv man kan stå på (verden, px): y = a x + b."""
    pts = [p for b in g.biter for p in b]
    a = (pts[-1][1] - pts[0][1]) / (pts[-1][0] - pts[0][0])
    b = max(y - a * x for x, y in pts) + 260
    return a, b


def teststart_pos(g, x):
    """Spillenheter for en marke med hodet i x px, litt over gulvet."""
    topp = min(g.gulv_y(x - k) for k in range(0, 100, 10))
    return 2 * x, 2 * (topp - 90)


KAMERA_STOPP = 900
MAL_FOR_SLUTT = 150


def skriv_oppsett(bane, g, origo, teststart=None):
    """teststart: px før slutten av gulvet der marken skal starte (bare
    for testing, se lib/teststart.lua)."""
    a, b = dodslinje(g)
    # Som i bane 1-4: kameraet stopper KAMERA_STOPP px før slutten av
    # gulvet, og marken ruller videre ut av skjermen (halve skjermen er
    # 400 px) før den treffer målet MAL_FOR_SLUTT px før slutten.
    slutt = g.biter[-1][-1]
    mx, my = slutt[0] - MAL_FOR_SLUTT, g.gulv_y(slutt[0] - MAL_FOR_SLUTT)
    kx = slutt[0] - KAMERA_STOPP
    ky = g.gulv_y(kx) - 20
    vinkel = math.atan2(my, mx)
    linjer = ["-- Generert av Util/baner/hule.py %d. Ikke rediger for hånd." % bane,
              "-- Plassering av flisene (sentrum), dødslinja, målet og bakgrunnen for bane %d," % bane,
              "-- i spillenheter. Marken står som i alle baner i del1 = (0, 0).",
              "return {", "    fliser = {"]
    for ox, oy in origo:
        linjer.append("        { x = %d, y = %d }," % (2 * (ox + W / 2), 2 * (oy + H / 2)))
    dx_ = mx / 2
    linjer += ["    },",
               "    dod = { x = %d, y = %d, rotasjon = %.2f }," % (2 * dx_, 2 * (a * dx_ + b), math.degrees(math.atan(a))),
               # målet krysser gulvet like før slutten av banen
               "    mal2 = { x = %d, y = %d }," % (2 * mx, 2 * my),
               # kameraet følger marken hit, så ruller den ut til høyre
               "    kamera = { x_maks = %d, y_maks = %d }," % (2 * kx, 2 * ky),
               ] + ([] if teststart is None else [
               "    -- BARE FOR TESTING: banen flyttes så marken starter %d px før slutten." % teststart,
               "    teststart = { x = %d, y = %d }," % teststart_pos(g, slutt[0] - teststart),
               ]) + [
               "    bakgrunn = { rotasjon = %.2f, steg_x = %d, steg_y = %d }," % (
                   math.degrees(vinkel), round(1999 * math.cos(vinkel)), round(1999 * math.sin(vinkel))),
               "}", ""]
    open("lib/baneoppsett%d.lua" % bane, "w", encoding="utf-8").write("\n".join(linjer))


def sjekk(g):
    """Spawn og hopp mot målene fra bane 4."""
    ok = True
    fall = [g.gulv_y(x) for x in range(-95, 1, 5)]
    print("  spawn: gulvet %d-%d px under marken (ekte baner 111-210)" % (min(fall), max(fall)))
    ok &= 90 <= min(fall) and max(fall) <= 230
    for i in range(1, len(g.biter)):
        a, b = g.biter[i - 1][-1], g.biter[i][0]
        til = g.biter[i - 1]
        # tilløp: fall over de siste 600 px før kanten
        xs = [p for p in til if p[0] >= a[0] - 600]
        vinkel = math.degrees(math.atan2(a[1] - xs[0][1], a[0] - xs[0][0])) if xs[0] != a else 0
        bort, ned = b[0] - a[0], b[1] - a[1]
        # maks-hoppet i bane 4 er 520 bort / 265 ned etter 30 graders tilløp
        vanske = bort / 520 * math.sqrt(265 / max(ned, 1))
        print("  hopp %d: %d px bort, %d px ned, tilløp %.0f grader, %.0f %% av maks-hoppet i bane 4"
              % (i, bort, ned, vinkel, vanske * 100))
        ok &= vanske <= 1.02 and ned > 0
    return ok


def main():
    bane = int(sys.argv[1])
    g, masser, origo = bygg(bane)
    ok = sjekk(g)
    if "--sjekk" in sys.argv:
        return
    if "--oppsett" in sys.argv or "--teststart" in sys.argv:
        # bare lib/baneoppsettN.lua, bildene og formene er uendret
        ts = None
        if "--teststart" in sys.argv:
            ts = int(sys.argv[sys.argv.index("--teststart") + 1])
        skriv_oppsett(bane, g, origo, ts)
        print("lib/baneoppsett%d.lua skrevet" % bane)
        return
    if not ok:
        raise SystemExit("målingene er utenfor kravene, skriver ingenting")
    for nokkel, verdi in palett(bane).items():
        setattr(L, nokkel, verdi)
    alle, alle_frik = [], []
    for k in range(len(origo)):
        bilde, maske, ism = tegn_flis(bane, g, masser, origo, k)
        bilde.save("level%d/%d.png" % (bane, k + 1), optimize=True)
        former = L.kollisjon(maske)
        alle.append(former)
        alle_frik.append(friksjoner(former, ism))
        print("level%d/%d.png skrevet, %d kollisjonsklosser (%d på is)"
              % (bane, k + 1, len(former), sum(1 for f in alle_frik[-1] if f < 1)))
    skriv_shapedefs(bane, alle, alle_frik)
    skriv_oppsett(bane, g, origo)
    print("lib/shapedefs%d.lua og lib/baneoppsett%d.lua skrevet" % (bane, bane))


if __name__ == "__main__":
    main()
