#!/usr/bin/env python3
"""
Lager bane 7 (level7/1-4.png og lib/shapedefs7.lua) rett fra Ørjans tegning,
Util/bane7/tegning.jpg.

Kjør fra roten av repoet:

    pip install numpy scipy pillow
    python3 Util/bane7/lag_bane7.py            # lager bilder og kollisjon
    python3 Util/bane7/lag_bane7.py --sjekk    # bare målinger, skriver ingenting

HVORDAN TEGNINGEN LESES
Tegningen viser HELE banen, ikke én flis: rød prikk = spawn, lilla strek =
dødslinja (i spillet `dod`, rotert 31,48 grader), gul strek = målet
(`mal2`, rotert 45 grader, nederst til høyre). De fire blå massene er de
fire flisene, én masse per flis.

Hver blå kontur hentes ut som en fylt form, roteres slik at den lilla
streken (39,6 grader i tegningen) får spillets vinkel (31,48 grader), og
skaleres inn i sin flis. Skalaen er ikke helt lik i x og y: tegningen har
gap på rundt 650 px mellom massene målt i flis, og det går ikke å hoppe
over. Massene er derfor strukket bortover til gapet over flisekanten blir
hoppbart. Mål og plassering står i MAAL under.

Konturen kommer rett fra streken i tegningen, glattet litt, så knekkene,
hodene og de bølgete kantene er Ørjans egne. Formen er en fri, lukket
kontur, ikke en topp- og bunnkurve, så endene blir runde.
"""
import math
import sys

import numpy as np
from PIL import Image, ImageDraw
from scipy import ndimage as nd

TEGNING = "Util/bane7/tegning.jpg"
W, H = 3840, 2351          # én flis i bildepunkter

# Plassering av hver masse i sin flis: venstre og høyre kant, øverste og
# nederste punkt, i bildepunkter. Satt slik at
#  - flis 1 har bakke 111-210 px under spawn,
#  - marken lander på eller bak toppen av hodet på neste masse, ikke på
#    den avrundede venstresiden av det (da må den klatre),
#  - ingenting rører flisekanten.
# Gapet over flisekanten er derfor kort (45-90 px), med et fall på
# 900-1200 px rett ned på neste hode. Tegningen er ikke rotert: de flate
# toppene på hodene skal være flate. Dreies den slik at den lilla streken
# får spillets vinkel, begynner toppene å stige mot høyre.
MAAL = [
    dict(x0=60, x1=3790, y0=150, y1=2200),
    dict(x0=12, x1=3790, y0=170, y1=2270),
    dict(x0=12, x1=3790, y0=170, y1=2270),
    dict(x0=12, x1=3560, y0=170, y1=2270),
]

GLATTING = 1.6   # sigma i tegningspiksler (1 tegningspiksel er ca 15 i flis)

KANT = (72, 33, 6)       # rim, målt i level4/1.png
OVERGANG = (41, 16, 2)
KROPP = (38, 14, 1)
STREK = (10, 2, 0)


def hent_masser():
    a = np.asarray(Image.open(TEGNING).convert("RGB")).astype(int)
    r, g, b = a[..., 0], a[..., 1], a[..., 2]
    blaa = (b > 150) & (r < 100) & (g < 140)
    lilla = (r > 100) & (b > 150) & (g < 100)
    # Dødslinja lukker bunnen av noen av konturene, så den er med når
    # hullene fylles, men ikke i selve massene.
    strek = nd.binary_dilation(blaa | lilla, iterations=4)
    inni = nd.binary_fill_holes(strek) & ~strek
    lx_, ly_ = np.nonzero(lilla.T)
    lilla_y = np.full(a.shape[1], np.inf)
    for x in range(a.shape[1]):
        ys_ = ly_[lx_ == x]
        if len(ys_):
            lilla_y[x] = np.median(ys_)
    under_lilla = np.arange(a.shape[0])[:, None] > lilla_y[None, :] - 3
    lab, n = nd.label(inni)
    storrelse = nd.sum(inni, lab, range(1, n + 1))
    store = [i + 1 for i in range(n) if storrelse[i] > 5000]
    bokser = nd.find_objects(lab)
    masser = []
    for bi in store:
        m = lab == bi
        sy, sx = bokser[bi - 1]
        for j in range(1, n + 1):
            if j in store:
                continue
            cy, cx = nd.center_of_mass(lab == j)
            if sy.start <= cy < sy.stop and sx.start <= cx < sx.stop:
                m |= lab == j
        m = nd.binary_dilation(m, iterations=7)
        m = nd.binary_fill_holes(m)
        m = nd.binary_erosion(m, iterations=2)
        # Den lilla streken er dødslinja, ikke en kontur: det som ligger på
        # eller under den er ikke en del av massen. Det tar også bort den
        # spisse haken nederst til venstre på første masse, der den blå og
        # den lilla streken møtes.
        m &= ~under_lilla
        # Fjerner smale flak (under ca 10 tegningspiksler) som oppstår der
        # den blå og den lilla streken går tett i tett langs bunnen.
        m = nd.binary_opening(m, iterations=5)
        lab_m, n_m = nd.label(m)
        if n_m > 1:
            m = lab_m == (1 + np.argmax(nd.sum(m, lab_m, range(1, n_m + 1))))
        masser.append(m)
    masser.sort(key=lambda m: np.nonzero(m)[1].min())
    assert len(masser) == 4, len(masser)
    return masser


def lag_maske(masse, maal):
    """Tegningsmasse -> glatt maske i flisa (float 0..1, 0,5 er kanten)."""
    ys, xs = np.nonzero(masse)
    X0, X1, Y0, Y1 = xs.min(), xs.max(), ys.min(), ys.max()
    sx = (maal["x1"] - maal["x0"]) / (X1 - X0)
    sy = (maal["y1"] - maal["y0"]) / (Y1 - Y0)

    glatt = nd.gaussian_filter(masse.astype(float), GLATTING)
    yy, xx = np.mgrid[0:H, 0:W].astype(float)
    tx = (xx - maal["x0"]) / sx + X0
    ty = (yy - maal["y0"]) / sy + Y0
    f = nd.map_coordinates(glatt, [ty, tx], order=1, cval=0.0)
    return f, (sx, sy)


def slip_lepper(f, fra, toleranse=25):
    """Fjerner stein som stikker opp over det laveste punktet marken
    allerede har vært på, regnet fra x=fra og mot høyre. Det tar de
    oppbøyde leppene ytterst på noen av massene, der marken ellers ble
    liggende i dumpa foran. Returnerer antall piksler fjernet."""
    m = f >= 0.5
    laveste = -1
    fjernet = 0
    rort = []
    for x in range(int(fra), f.shape[1]):
        k = m[:, x]
        if not k.any():
            continue
        t = k.argmax()
        if laveste < 0 or t > laveste:
            laveste = t
            continue
        if laveste - t > toleranse:
            grense = laveste - toleranse
            # bare det øverste løpet, ikke tak eller overheng lenger nede
            u = t
            while u < grense and k[u]:
                u += 1
            f[t:u, x] = 0.0
            fjernet += u - t
            rort.append(x)
    if rort:
        # glatt kanten der det er slipt, ellers blir kuttet en rett strek
        a, b = max(min(rort) - 60, 0), min(max(rort) + 60, f.shape[1])
        glatt = nd.gaussian_filter((f[:, a:b] >= 0.5).astype(float), 6)
        f[:, a:b] = glatt
    return fjernet


def rund_kant(f):
    """Alfa med ca 1,5 px antialiasing langs kanten."""
    gy, gx = np.gradient(f)
    grad = np.hypot(gx, gy)
    grad[grad < 1e-4] = 1e-4
    return np.clip((f - 0.5) / grad / 1.5 + 0.5, 0, 1)


def loddrett_dybde(m):
    """Avstand rett opp og rett ned til lufta, per piksel."""
    ned = np.zeros(m.shape, np.int32)
    opp = np.zeros(m.shape, np.int32)
    for y in range(m.shape[0]):
        ned[y] = np.where(m[y], (ned[y - 1] if y else 0) + 1, 0)
    for y in range(m.shape[0] - 1, -1, -1):
        opp[y] = np.where(m[y], (opp[y + 1] if y < m.shape[0] - 1 else 0) + 1, 0)
    return np.minimum(ned, opp)


def mal(f, frø):
    rng = np.random.default_rng(frø)
    m = f >= 0.5
    alfa = rund_kant(f)

    d_lodd = loddrett_dybde(m).astype(float)
    d_eukl = nd.distance_transform_edt(m)
    d = np.minimum(d_lodd, d_eukl * 2.5)

    # hvor dypt rimen går varierer langsomt bortover, 55-85 px
    stoy = nd.gaussian_filter1d(rng.normal(size=W + 400), 120)[200:-200]
    stoy /= np.abs(stoy).max()
    R = 70 + 15 * stoy[None, :]

    t1 = np.clip((d - R) / 70, 0, 1)[..., None]
    t2 = np.clip((d - R - 70) / 30, 0, 1)[..., None]
    farge = (np.array(KANT) * (1 - t1) + np.array(OVERGANG) * t1)
    farge = farge * (1 - t2) + np.array(KROPP) * t2

    ts = np.clip(2.0 - d_eukl, 0, 1)[..., None]   # konturstrek, ca 1,5 px
    farge = farge * (1 - ts) + np.array(STREK) * ts

    bilde = Image.fromarray(np.dstack([farge, alfa * 255]).round().astype(np.uint8), "RGBA")

    # korn: én avlang prikk per 90x90-rute, 16 x 10 px, bare inni massen
    korn = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    for gy in range(0, H, 90):
        for gx in range(0, W, 90):
            x = gx + rng.uniform(0, 90)
            y = gy + rng.uniform(0, 90)
            xi, yi = int(x), int(y)
            if xi >= W or yi >= H or d_eukl[yi, xi] < 22:
                continue
            flekk = Image.new("RGBA", (40, 40), (0, 0, 0, 0))
            lang, kort = rng.uniform(10, 18), rng.uniform(6, 10)
            ImageDraw.Draw(flekk).ellipse(
                (20 - lang / 2, 20 - kort / 2, 20 + lang / 2, 20 + kort / 2),
                fill=(24, 8, 0, int(rng.uniform(110, 190))))
            flekk = flekk.rotate(rng.uniform(0, 180), resample=Image.BICUBIC)
            korn.alpha_composite(flekk, (xi - 20, yi - 20))
    korn_a = np.asarray(korn).copy()
    korn_a[..., 3] = (korn_a[..., 3] * m).astype(np.uint8)
    bilde.alpha_composite(Image.fromarray(korn_a, "RGBA"))
    return bilde


def lopene(kolonne):
    """(topp, bunn) for hver sammenhengende strekning stein i en kolonne."""
    k = np.concatenate([[False], kolonne, [False]]).astype(np.int8)
    dk = np.diff(k)
    return list(zip(np.nonzero(dk == 1)[0], np.nonzero(dk == -1)[0]))


def finn_lop(m, x, a, b):
    """Løpet i kolonne x som overlapper [a, b] mest."""
    best = None
    for t, u in lopene(m[:, x]):
        o = min(u, b) - max(t, a)
        if o > 0 and (best is None or o > best[0]):
            best = (o, t, u)
    return None if best is None else best[1:]


def kollisjon(m):
    """Trapeser med loddrette sider, høyst 100 px bortover, tynnere øverst.

    En kolonne deles i to så lenge toppkanten avviker mer enn 8 px (bunnen
    40 px) fra den rette linja mellom kolonnens to sider, ned til 6 px
    bredde. Ellers legger kollisjonen en usynlig rampe over hakk og
    overheng."""
    ys, xs = np.nonzero(m)
    former = []

    def lop_ved(x, a, b):
        return finn_lop(m, x, a, b)

    def passer(v, h, a, b, lv, lh):
        for x in range(v + 1, h):
            l = lop_ved(x, a, b)
            if l is None:
                return False
            k = (x - v) / (h - v)
            if abs(l[0] - (lv[0] + k * (lh[0] - lv[0]))) > 8:
                return False
            if abs(l[1] - (lv[1] + k * (lh[1] - lv[1]))) > 40:
                return False
        return True

    def sider(v, h, a, b):
        lv, lh = lop_ved(v, a, b), lop_ved(h, a, b)
        while lv is None and v < h:
            v += 2
            lv = lop_ved(v, a, b)
        while lh is None and h > v:
            h -= 2
            lh = lop_ved(h, a, b)
        if lv is None or lh is None or h - v < 3:
            return None
        return v, h, lv, lh

    def kolonne(x0, x1):
        xc = (x0 + x1) // 2
        biter = [sider(x0, x1, a, b) for a, b in lopene(m[:, xc])]
        biter = [(bit, a, b) for bit, (a, b) in zip(biter, lopene(m[:, xc])) if bit]
        # ulikt antall løp på sidene og i midten betyr et overhengende
        # tupp som ellers ikke får kollisjon
        ulikt = len({len(lopene(m[:, x])) for x in (x0, xc, x1)}) > 1
        if x1 - x0 > 6 and (ulikt or not all(
                passer(v, h, a, b, lv, lh) for (v, h, lv, lh), a, b in biter)):
            midt = (x0 + x1) // 2
            kolonne(x0, midt)
            kolonne(midt, x1)
            return
        for bit, a, b in biter:
            legg_til(*bit)

    def legg_til(v, h, lv, lh):
        (tv, bv), (th, bh) = lv, lh
        # skiver 80, 160, 320 ... px tjukke nedover
        kutt = [0.0]
        dybde, tykk = 0.0, 80.0
        maks = max(bv - tv, bh - th)
        while dybde + tykk < maks - 40:
            dybde += tykk
            kutt.append(dybde)
            tykk = min(tykk * 2, 640)
        kutt.append(None)

        def y(topp, bunn, k):
            return bunn if k is None else min(topp + k, bunn)
        for i in range(len(kutt) - 1):
            y1v, y2v = y(tv, bv, kutt[i]), y(tv, bv, kutt[i + 1])
            y1h, y2h = y(th, bh, kutt[i]), y(th, bh, kutt[i + 1])
            if max(y2v - y1v, y2h - y1h) < 14:
                continue
            punkter = [(v, y1v), (h, y1h), (h, y2h), (v, y2v)]
            unike = []
            for q in punkter:
                if q not in unike:
                    unike.append(q)
            if len(unike) >= 3:
                former.append(unike)

    for x0 in range(xs.min(), xs.max() + 1, 100):
        x1 = min(x0 + 100, xs.max())
        if x1 - x0 < 4:
            continue
        kolonne(x0, x1)
    return former


def til_spill(px, py):
    return round((px - 1920) * 2), round((py - 1175.5) * 2)


def skriv_shapedefs(alle_former):
    gammel = open("lib/shapedefs7.lua", encoding="utf-8").read()
    start = gammel.index('\t\t["del1"]')
    hale = gammel[start:]
    ut = [HODE, "local unpack = unpack\nlocal pairs = pairs\nlocal ipairs = ipairs\n\n",
          "local M = {}\n\nfunction M.physicsData(scale)\n\tlocal physics = { data =\n\t{\n"]
    for nr, former in enumerate(alle_former, 1):
        ut.append('\t\t["%d"] = {\n' % nr)
        biter = []
        for f in former:
            punkt = "  ,  ".join("%d, %d" % til_spill(px, py) for px, py in f)
            biter.append(
                "                    {\n"
                '                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, \n'
                "                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },\n"
                "                    shape = {  %s  }\n"
                "                    }\n" % punkt)
        ut.append("                     ,\n".join(biter))
        ut.append("\t\t}\n\t\t,\n")
    ut.append(hale)
    open("lib/shapedefs7.lua", "w", encoding="utf-8").write("".join(ut))


HODE = """-- This file is for use with Corona(R) SDK
--
-- Kollisjonsformer for bane 7, generert av Util/bane7/lag_bane7.py rett
-- fra Ørjans tegning (Util/bane7/tegning.jpg). Ikke rediger for hånd:
-- endre scriptet og kjør det på nytt, så følger bildene med.
--
-- Hver form er et trapes på 100 px bortover med loddrette sider og
-- hjørnene på massens egen kontur, så bilde og kollisjon kommer fra samme
-- maske. Skivene er 80 px øverst og dobles nedover.
--
-- Koordinatene er bekreftet mot bane 3 og 4 sine egne shapedefs:
--    X = (bildepiksel_x - 1920) * 2,  Y = (bildepiksel_y - 1175.5) * 2
--
-- "del1" (markens egen form) er uendret.
--
-- Usage example:
--			local scaleFactor = 1.0
--			local physicsData = (require "lib.shapedefs7").physicsData(scaleFactor)
--			local shape = display.newImage("objectname.png")
--			physics.addBody( shape, physicsData:get("objectname") )
--

-- copy needed functions to local scope
"""


# ---------------------------------------------------------------- målinger

G = 294.0   # Solar2D sin standard tyngdekraft, 9,8 m/s2 * 30 enheter/m


def overflate(m):
    """Øverste steinpiksel per kolonne, -1 der det ikke er stein."""
    har = m.any(axis=0)
    return np.where(har, m.argmax(axis=0), -1)


def baerer(m, x, tykk=120):
    """Om kolonne x har minst `tykk` px stein rett under overflaten."""
    k = m[:, x]
    if not k.any():
        return False
    t = k.argmax()
    return k[t:t + tykk].all()


# Marken står i del1.x = 0 og går 189 enheter bakover. I bane 7 er flisene
# (firkant1.x), dod og mal2 flyttet 600 enheter mot venstre i level7.lua,
# så marken starter over hodet på første masse. Marken selv kan ikke
# flyttes: med del1.x = 600 ble fysikken NaN og banen krasjet.
FIRKANT1_X = 2900
SPAWN_X = (-189, 0)
SPAWN_Y = 0


def til_bilde(X, Y):
    """Spillkoordinat -> bildepunkt i flis 1."""
    return (X - FIRKANT1_X) / 2 + 1920, (Y - 2300) / 2 + 1175.5


def kast(fra_x, fra_y, v, treff):
    """Følger et fritt fall fra (fra_x, fra_y) med fart v enheter/s mot
    høyre, i bildepunkter. treff(x, y) sier om noe er truffet."""
    vx, g, t = v / 2.0, G / 2.0, 0.0
    while t < 20:
        t += 0.004
        x, y = fra_x + vx * t, fra_y + 0.5 * g * t * t
        r = treff(x, y)
        if r:
            return r, x, y
    return None, None, None


def motbakke(m, fra):
    """Største stigning marken må opp etter x=fra, målt 400 px fremover."""
    top = overflate(m)
    xs = [x for x in range(int(fra), W) if top[x] >= 0 and baerer(m, x, 40)]
    verst, hvor = 0, None
    for x in xs:
        foran = [top[u] for u in range(x, min(x + 400, W)) if top[u] >= 0]
        if top[x] - min(foran) > verst:
            verst, hvor = top[x] - min(foran), x
    return verst, hvor


def ledge(m):
    xr = max(x for x in range(W) if baerer(m, x))
    return xr, overflate(m)[xr]


def landinger(a, b):
    """Hvor marken lander i flis b når den ruller av høyre ende av flis a,
    med 156, 200 og 248 enheter/s."""
    xr, yr = ledge(a)
    tb = overflate(b)

    def treff(x, y):
        u = int(x) - W
        if 0 <= u < W and tb[u] >= 0 and y - H >= tb[u]:
            return u
        if y >= 567 + 0.6122 * x:
            return "død"
        return None
    return [kast(xr, yr, fart, treff)[0] for fart in (156, 200, 248)]


def starter(masker):
    """Første x marken kan stå på i hver flis: spawn i flis 1, ellers den
    nærmeste landingen."""
    ut = [int(til_bilde(SPAWN_X[0], 0)[0])]
    for i in range(3):
        land = [l for l in landinger(masker[i], masker[i + 1]) if not isinstance(l, str)]
        ut.append(min(land) if land else None)
    return ut


def sjekk(masker):
    ok = True
    print("\nMålinger (bildepunkter, spillenheter = 2 x bildepunkter)")
    m1 = masker[0]
    top = overflate(m1)
    x0, x1 = (int(til_bilde(X, 0)[0]) for X in SPAWN_X)
    sy = til_bilde(0, SPAWN_Y)[1]
    fall = [top[x] - sy for x in range(x0, x1 + 1)]
    print("  spawn over x=%d-%d, fall %d-%d px (ekte baner 111-210)" % (x0, x1, min(fall), max(fall)))
    ok &= min(fall) >= 90 and max(fall) <= 230

    for i, m in enumerate(masker):
        kant = m[0].any() or m[-1].any() or m[:, 0].any() or m[:, -1].any()
        print("  flis %d: fyllgrad %.1f %%, rører kanten: %s" % (i + 1, m.mean() * 100, kant))
        ok &= not kant

    for i in range(3):
        a, b = masker[i], masker[i + 1]
        xr, yr = ledge(a)
        xl = min(x for x in range(W) if baerer(b, x))
        yl = overflate(b)[xl]
        gap, drop = W - xr + xl, H + yl - yr
        land = landinger(a, b)
        print("  hopp flis %d->%d: gap %d px, fall %d px, lander ved x=%s med 156/200/248 e/s"
              % (i + 1, i + 2, gap, drop, land))
        ok &= drop > 0 and all(not isinstance(l, str) for l in land)
    starter_ = starter(masker)

    for i, m in enumerate(masker):
        verst, hvor = motbakke(m, starter_[i])
        print("  flis %d: verste motbakke fra x=%d: %d px (ved x=%s)" % (i + 1, starter_[i], verst, hvor))
        ok &= verst <= 30

    # målet: marken ruller av høyre ende av flis 4 og skal treffe mal2 før dod
    m = masker[3]
    xr = max(x for x in range(W) if baerer(m, x))
    yr = overflate(m)[xr]

    def maal(x, y):
        if y - 1972 >= -(x - 4150) and abs(x - 4150) <= 530:
            return "mål"
        if y >= 567 + 0.6122 * x:
            return "død"
        return None
    treff = [kast(xr, yr, v, maal)[0] for v in (156, 200, 248)]
    print("  ut av flis 4 fra (%d, %d) med 156/200/248 e/s: %s" % (xr, yr, ", ".join(treff)))
    ok &= all(t == "mål" for t in treff)
    return ok


def main():
    masser = hent_masser()
    felt = []
    for i, (masse, maal) in enumerate(zip(masser, MAAL)):
        f, (sx, sy) = lag_maske(masse, maal)
        print("flis %d: skala %.1f bortover, %.1f nedover (strukket %.2f)" % (i + 1, sx, sy, sx / sy))
        felt.append(f)
    for i, fra in enumerate(starter([f >= 0.5 for f in felt])):
        n = slip_lepper(felt[i], fra)
        print("flis %d: slipt bort %d px oppbøyd kant etter x=%d" % (i + 1, n, fra))
    masker = [f >= 0.5 for f in felt]
    ok = sjekk(masker)
    if "--sjekk" in sys.argv:
        return
    if not ok:
        print("\nMålingene er ikke innenfor kravene, skriver ingenting.")
        sys.exit(1)
    alle = []
    for i, (f, m) in enumerate(zip(felt, masker)):
        mal(f, 70 + i).save("level7/%d.png" % (i + 1), optimize=True)
        alle.append(kollisjon(m))
        print("level7/%d.png skrevet, %d kollisjonsklosser" % (i + 1, len(alle[-1])))
    skriv_shapedefs(alle)
    print("lib/shapedefs7.lua skrevet, %d klosser totalt" % sum(len(a) for a in alle))


if __name__ == "__main__":
    main()
