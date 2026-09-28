#!/usr/bin/env python3
"""
Lager en bane (levelN/1-4.png og lib/shapedefsN.lua) rett fra Ørjans
tegning, Util/baner/tegningN.jpg. Bane 7 og 8 er laget slik.

Kjør fra roten av repoet:

    pip install numpy scipy pillow
    python3 Util/baner/lag_bane.py 8            # lager bilder og kollisjon
    python3 Util/baner/lag_bane.py 8 --sjekk    # bare målinger, skriver ingenting

Ny bane: legg tegningen i Util/baner/, legg banen til i BANER under, kjør
med --sjekk og juster MAAL og forskyvning til målingene er innenfor.
Husk å sette forskyvningen inn i levelN.lua (firkant1.x, dod.x, mal2.x)
og bytte til lib.shapedefsN der.

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
#
# forskyvning: hvor mange enheter flisene, dod og mal2 er flyttet mot
# venstre i levelN.lua, slik at marken (som alltid står i del1.x = 0)
# starter der toppen av første masse begynner å helle nedover.
BANER = {
    7: dict(
        maal=[
            dict(x0=60, x1=3790, y0=150, y1=2200),
            dict(x0=12, x1=3790, y0=170, y1=2270),
            dict(x0=12, x1=3790, y0=170, y1=2270),
            dict(x0=12, x1=3560, y0=170, y1=2270),
        ],
        forskyvning=1130,
        # Den publiserte bane 7 ble slipt fra x=375 i flis 1 (spawn før
        # banen ble flyttet 1130 i stedet for 600). Låst slik at scriptet
        # gjenskaper den byte for byte.
        slip_fra_flis1=375,
    ),
    # Bane 8 bruker fri plassering (se plasser_fritt): massene skaleres likt
    # i begge retninger, og flisene legges der hoppene går opp, i stedet
    # for i den faste diagonalen. Posisjonene skrives til
    # lib/baneoppsett8.lua, som level8.lua leser.
    8: dict(
        fri=True,
        # Tegningen dreies 20 grader mot klokka: uten dreiing gikk banen i
        # 55 grader og var alt for bratt (Mathias 2026-09-28). Nå 41 grader.
        vri=20,
        skala_maks=9.5,     # bildepunkter i flis per tegningspiksel
        hopp_bort=180,      # hodetoppen på neste masse ligger så langt til
        hopp_ned=600,       # høyre for og under kanten på den forrige
        klipp_lilla=False,
    ),
    # Bane 9 har ingen egen tegning. Den bruker massene fra tegning 7 og 8
    # om hverandre, hver med en jevn tilfeldig deformasjon (frø) og litt
    # annen bredde, så formene blir nye men i samme stil. Massene fra
    # tegning 8 dreies 20 grader som i bane 8.
    9: dict(
        fri=True,
        kilder=[
            dict(tegning=7, masse=3, vri=0, fro=91, bredde=1.10),
            dict(tegning=8, masse=4, vri=20, fro=92, bredde=0.90),
            dict(tegning=7, masse=2, vri=0, fro=93, bredde=1.15),
            dict(tegning=8, masse=2, vri=20, fro=94, bredde=1.05),
        ],
        skala_maks=9.5,
        hopp_bort=180,
        hopp_ned=600,
    ),
}

# Settes av main() ut fra banenummeret.
BANE = None
TEGNING = None
MAAL = None
FIRKANT1_X = None

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
        # spisse haken nederst til venstre på første masse i bane 7, der den
        # blå og den lilla streken møtes. I tegning 8 krysser den lilla
        # streken inn i massene, og der er avskjæringen slått av.
        if BANER[BANE].get("klipp_lilla", True):
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
    H, W = f.shape   # fungerer for utsnitt av alle størrelser
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
    # "del1" (markens egen form) hentes fra en eksisterende fil
    kilde = "lib/shapedefs%d.lua" % BANE
    try:
        gammel = open(kilde, encoding="utf-8").read()
    except FileNotFoundError:
        gammel = open("lib/shapedefs7.lua", encoding="utf-8").read()
    start = gammel.index('\t\t["del1"]')
    hale = gammel[start:]
    ut = [HODE.replace("{N}", str(BANE)), "local unpack = unpack\nlocal pairs = pairs\nlocal ipairs = ipairs\n\n",
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
    open(kilde, "w", encoding="utf-8").write("".join(ut))


HODE = """-- This file is for use with Corona(R) SDK
--
-- Kollisjonsformer for bane {N}, generert av Util/baner/lag_bane.py rett
-- fra Ørjans tegning (Util/baner/tegning{N}.jpg). Ikke rediger for hånd:
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
--			local physicsData = (require "lib.shapedefs{N}").physicsData(scaleFactor)
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


# Marken står i del1.x = 0 og går 189 enheter bakover. Flisene (firkant1.x),
# dod og mal2 er flyttet mot venstre i levelN.lua i stedet, se BANER.
# Marken selv kan ikke flyttes: med del1.x = 600 i bane 7 ble fysikken NaN
# og banen krasjet.
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
    # Bakken skal helle nedover mot høyre fra spawn (ekte baner: 136-303 px
    # fall over de neste 300 px) og ikke falle bort bak marken. Står den
    # på venstre kant av en flat topp, vipper den bakover og faller ut.
    helning = top[x0 + 300] - top[x0]
    bak = max(top[x] for x in range(x0 - 150, x0 + 1)) - top[x0]
    print("  fra spawn: %d px fall over 300 px (ekte 136-303), bakken bak marken "
          "ligger inntil %d px lavere" % (helning, bak))
    ok &= helning >= 100 and bak <= 40

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

# ------------------------------------------------------------ fri plassering

def til_bilde_f(X, forskyvning):
    """Spill-x -> bildepunkt-x i flis 1 når flis 1 er flyttet `forskyvning`
    enheter mot venstre."""
    return (X - (3500 - forskyvning)) / 2 + 1920


def lag_maske_fri(masse, s, x0, y0):
    """Tegningsmasse -> glatt maske i flisa med lik skala s i x og y, med
    øvre venstre hjørne av massen i (x0, y0)."""
    ys, xs = np.nonzero(masse)
    glatt = nd.gaussian_filter(masse.astype(float), GLATTING)
    yy, xx = np.mgrid[0:H, 0:W].astype(float)
    tx = (xx - x0) / s + xs.min()
    ty = (yy - y0) / s + ys.min()
    return nd.map_coordinates(glatt, [ty, tx], order=1, cval=0.0)


def hodetopp(m):
    """Høyeste punkt på overflaten i venstre halvdel av massen."""
    top = overflate(m)
    xs = [x for x in range(W) if top[x] >= 0 and baerer(m, x, 40)]
    venstre = xs[: max(1, len(xs) // 2)]
    x = min(venstre, key=lambda u: top[u])
    return x, top[x]


def spawnpunkt(m):
    """Første x etter hodetoppen der bakken heller nedover mot høyre som i
    de ekte banene (minst 100 px fall over 300 px), hele marken (95 px)
    står i helningen med minst 20 px fall under seg, og ingen bakke bak
    marken ligger lavere. Står marken på selve kammen, blir den liggende i
    balanse (bane 8, første forsøk: 40 px lavere bak, marken rørte seg
    ikke på 50 sekunder)."""
    top = overflate(m)
    hx, _ = hodetopp(m)
    for x in range(hx, W - 400):
        if top[x] < 0 or top[x + 300] < 0:
            continue
        bak = max(top[u] for u in range(max(x - 150, 0), x + 1) if top[u] >= 0) - top[x]
        if top[x + 300] - top[x] >= 100 and top[x + 95] - top[x] >= 20 and bak <= 0:
            return x
    raise SystemExit("fant ikke noe spawnpunkt i flis 1")


def deformer(masse, fro, bredde=1.0, styrke=9.0):
    """Jevn tilfeldig deformasjon av en tegningsmasse: forskyver hvert punkt
    inntil `styrke` tegningspiksler i et mykt felt (sigma 22 px), og
    strekker massen `bredde` ganger bortover."""
    rng = np.random.default_rng(fro)
    h, w = masse.shape
    pad = 40
    m = np.pad(masse, pad)
    H2, W2 = m.shape
    felt = []
    for _ in range(2):
        f = nd.gaussian_filter(rng.normal(size=(H2, W2)), 22)
        felt.append(f / np.abs(f).max() * styrke)
    yy, xx = np.mgrid[0:H2, 0:W2].astype(float)
    ys, xs = np.nonzero(m)
    cx = xs.mean()
    kx = cx + (xx - cx) / bredde + felt[0]
    ky = yy + felt[1]
    ut = nd.map_coordinates(nd.gaussian_filter(m.astype(float), 1.0), [ky, kx], order=1) >= 0.5
    lab, n = nd.label(ut)
    if n > 1:
        ut = lab == (1 + np.argmax(nd.sum(ut, lab, range(1, n + 1))))
    return ut


def hent_kilder(kilder):
    """Massene til en bane uten egen tegning, hentet fra andre tegninger."""
    global BANE, TEGNING
    lagret = BANE, TEGNING
    cache, ut = {}, []
    for k in kilder:
        if k["tegning"] not in cache:
            BANE, TEGNING = k["tegning"], "Util/baner/tegning%d.jpg" % k["tegning"]
            cache[k["tegning"]] = hent_masser()
        masse = cache[k["tegning"]][k["masse"] - 1]
        masse = drei(masse, k.get("vri", 0))
        ut.append(deformer(masse, k["fro"], k.get("bredde", 1.0), styrke=14.0))
    BANE, TEGNING = lagret
    return ut


def drei(masse, grader):
    """Dreier en tegningsmasse mot klokka (grader > 0 gjør en masse som
    heller ned mot høyre slakere)."""
    if not grader:
        return masse
    im = Image.fromarray((masse * 255).astype(np.uint8))
    im = im.rotate(grader, resample=Image.BILINEAR, expand=True)
    return np.asarray(im) >= 128


INN_FRA_KANT = 180


def plasser_fritt(masser, cfg):
    """Lager maskene og regner ut hvor hver flis skal ligge.

    Returnerer (felt, origo, forskyvning): felt er maskene per flis, origo
    er øvre venstre hjørne av hver flis i bildepunkter i flis 1 sitt
    koordinatsystem, forskyvning er hvor mange enheter flis 1 flyttes mot
    venstre så markens bakende (del8, x=-189) står over spawnpunktet."""
    felt = []
    if "kilder" not in cfg:
        masser = [drei(m, cfg.get("vri", 0)) for m in masser]
    for i, masse in enumerate(masser):
        ys, xs = np.nonzero(masse)
        h, w = ys.max() - ys.min(), xs.max() - xs.min()
        s = min(cfg["skala_maks"], (H - 120) / h, (W - 120) / w)
        y0 = 60
        if i == 0:
            # flis 1: løft eller senk massen så bakken ligger ca 160 px
            # under marken der den starter (ekte baner 111-210)
            f = lag_maske_fri(masse, s, 60, y0)
            sx_ = spawnpunkt(f >= 0.5)
            # (fremste del av marken skal heller ikke falle mer enn 200 px)
            topp = overflate(f >= 0.5)
            y0 += 26 + min(160, 200 - (topp[sx_ + 95] - topp[sx_])) - topp[sx_]
            if y0 < 20 or y0 + h * s > H - 20:
                raise SystemExit("flis 1: massen får ikke plass med riktig spawn-fall")
        felt.append(lag_maske_fri(masse, s, 60, y0))
        print("flis %d: skala %.1f i begge retninger" % (i + 1, s))
    masker = [f >= 0.5 for f in felt]
    spawn_x = spawnpunkt(masker[0])
    forskyvning = int(round(2 * (spawn_x - til_bilde_f(SPAWN_X[0], 0))))
    origo = [(0, 0)]
    # Korteste flukt: 156 enheter/s bortover, fall hopp_ned.
    flukt = 78 * math.sqrt(2 * cfg["hopp_ned"] / (G / 2))
    for k in range(3):
        lx, ly = ledge(masker[k])
        px, py = hodetopp(masker[k + 1])
        venstre = int(np.nonzero(masker[k + 1].any(axis=0))[0].min())
        # Marken skal lande minst INN_FRA_KANT inn fra venstre kant av neste
        # masse. Sitter hodetoppen langt ute på kanten, flyttes neste flis
        # nærmere, ellers lander marken på den runde kanten og ruller av
        # (bane 9, første forsøk).
        bort = int(min(cfg["hopp_bort"], (px - venstre) + flukt - INN_FRA_KANT - 20))
        ox, oy = origo[k]
        origo.append((ox + lx + bort - px, oy + ly + cfg["hopp_ned"] - py))
    return felt, origo, forskyvning


def verden_treff(masker, origo, x, y, unntatt=None):
    """Hvilken flis (indeks, lokal x) har stein i verdenspunktet (x, y)."""
    for j, (m, (ox, oy)) in enumerate(zip(masker, origo)):
        if j == unntatt:
            continue
        u, v = int(x - ox), int(y - oy)
        if 0 <= u < W and 0 <= v < H and m[v, u]:
            return j, u
    return None


def dodslinje(masker, origo):
    """Rett linje y = a x + b (verden, bildepunkter) under all bakke man
    kan stå på, med samme helning som banen fra spawn til siste kant."""
    punkter = []
    for m, (ox, oy) in zip(masker, origo):
        top = overflate(m)
        for x in range(0, W, 20):
            if top[x] >= 0:
                punkter.append((ox + x, oy + top[x]))
    lx, ly = ledge(masker[3])
    a = (origo[3][1] + ly) / (origo[3][0] + lx)
    b = max(py - a * px for px, py in punkter) + 250
    return a, b


def maalpunkt(masker, origo):
    lx, ly = ledge(masker[3])
    return origo[3][0] + lx + 350, origo[3][1] + ly + 450


def landinger_fri(masker, origo, k, dod):
    """Hvor marken lander når den ruller av kanten på flis k: (flis, x)
    per fart, eller 'død'."""
    a, b = dod
    lx, ly = ledge(masker[k])
    fx, fy = origo[k][0] + lx, origo[k][1] + ly

    def treff(x, y):
        t = verden_treff(masker, origo, x, y, unntatt=k)
        if t:
            return t
        if y >= a * x + b:
            return "død"
        return None
    return [kast(fx, fy, v, treff)[0] for v in (156, 200, 248)]


def sjekk_fri(masker, origo, forskyvning, dod, maal):
    ok = True
    print("\nMålinger (bildepunkter, spillenheter = 2 x bildepunkter)")
    m1 = masker[0]
    top = overflate(m1)
    x0 = int(round(til_bilde_f(SPAWN_X[0], forskyvning)))
    fall = [top[x] - 26 for x in range(x0, x0 + 96)]
    helning = top[x0 + 300] - top[x0]
    bak = max(top[x] for x in range(x0 - 150, x0 + 1) if top[x] >= 0) - top[x0]
    print("  spawn over x=%d-%d, fall %d-%d px (ekte 111-210), %d px fall over 300 px "
          "(ekte 136-303), bakken bak marken inntil %d px lavere"
          % (x0, x0 + 95, min(fall), max(fall), helning, bak))
    under = top[x0 + 95] - top[x0]
    print("  fall under selve marken: %d px (bane 7: 27)" % under)
    ok &= min(fall) >= 90 and max(fall) <= 230 and helning >= 100 and bak <= 0 and under >= 20

    for i, m in enumerate(masker):
        kant = m[0].any() or m[-1].any() or m[:, 0].any() or m[:, -1].any()
        print("  flis %d: origo %s, fyllgrad %.1f %%, rører kanten: %s"
              % (i + 1, origo[i], m.mean() * 100, kant))
        ok &= not kant

    # massene fra ulike fliser skal ikke gå inn i hverandre
    for i in range(4):
        for j in range(i + 1, 4):
            dx, dy = origo[j][0] - origo[i][0], origo[j][1] - origo[i][1]
            if abs(dx) >= W or abs(dy) >= H:
                continue
            a_ = masker[i][max(dy, 0):H + min(dy, 0), max(dx, 0):W + min(dx, 0)]
            b_ = masker[j][max(-dy, 0):H + min(-dy, 0), max(-dx, 0):W + min(-dx, 0)]
            n = int((a_ & b_).sum())
            if n:
                print("  OVERLAPP flis %d og %d: %d px" % (i + 1, j + 1, n))
                ok = False

    starter_ = [x0]
    for k in range(3):
        land = landinger_fri(masker, origo, k, dod)
        print("  hopp flis %d->%d: lander %s med 156/200/248 e/s"
              % (k + 1, k + 2, ["død" if l == "død" else "flis %d x=%d" % (l[0] + 1, l[1])
                                for l in land]))
        riktig = [l for l in land if l != "død" and l[0] == k + 1]
        ok &= len(riktig) == 3
        venstre = int(np.nonzero(masker[k + 1].any(axis=0))[0].min())
        if riktig:
            inn = min(l[1] for l in riktig) - venstre
            print("  hopp flis %d->%d: nærmeste landing %d px inn fra venstre kant (krav %d)"
                  % (k + 1, k + 2, inn, INN_FRA_KANT))
            ok &= inn >= INN_FRA_KANT
        starter_.append(min(l[1] for l in riktig) if riktig else 0)

    for i, m in enumerate(masker):
        verst, hvor = motbakke(m, starter_[i])
        print("  flis %d: verste motbakke fra x=%d: %d px (ved x=%s)" % (i + 1, starter_[i], verst, hvor))
        ok &= verst <= 30

    a, b = dod
    lx, ly = ledge(masker[3])
    fx, fy = origo[3][0] + lx, origo[3][1] + ly
    cx, cy = maal

    def mal_treff(x, y):
        if y - cy >= -(x - cx) and abs(x - cx) <= 530:
            return "mål"
        if y >= a * x + b or verden_treff(masker, origo, x, y, unntatt=3):
            return "død"
        return None
    treff = [kast(fx, fy, v, mal_treff)[0] for v in (156, 200, 248)]
    print("  ut av flis 4 med 156/200/248 e/s: %s" % ", ".join(str(t) for t in treff))
    ok &= all(t == "mål" for t in treff)
    return ok, starter_


def skriv_oppsett(origo, forskyvning, dod, maal):
    """lib/baneoppsettN.lua: posisjonene levelN.lua trenger, i spillenheter."""
    f1x = 3500 - forskyvning

    def enheter(px, py):
        return (px - 1920) * 2 + f1x, (py - 1175.5) * 2 + 2300
    a, b = dod
    dx_ = maal[0] / 2
    dodx, dody = enheter(dx_, a * dx_ + b)
    mx, my = enheter(*maal)
    linjer = ["-- Generert av Util/baner/lag_bane.py %d. Ikke rediger for hånd." % BANE,
              "-- Plassering av flisene (sentrum), dødslinja, målet og bakgrunnen for bane %d," % BANE,
              "-- i spillenheter. Marken står som i alle baner i del1 = (0, 0).",
              "return {",
              "    fliser = {"]
    for ox, oy in origo:
        linjer.append("        { x = %d, y = %d }," % (round(2 * ox + f1x), round(2 * oy + 2300)))
    linjer += ["    },",
               "    dod = { x = %d, y = %d, rotasjon = %.2f }," % (round(dodx), round(dody), math.degrees(math.atan(a))),
               "    mal2 = { x = %d, y = %d }," % (round(mx), round(my)),
               # Bakgrunnen legges langs linja fra spawn (0, 0) til målet,
               # med samme steglengde mellom bitene som de andre banene
               # (1705, 1044 langs 31,48 grader, altså 1999 enheter).
               "    bakgrunn = { rotasjon = %.2f, steg_x = %d, steg_y = %d },"
               % (math.degrees(math.atan2(my, mx)),
                  round(1999 * math.cos(math.atan2(my, mx))),
                  round(1999 * math.sin(math.atan2(my, mx)))),
               "}", ""]
    open("lib/baneoppsett%d.lua" % BANE, "w", encoding="utf-8").write("\n".join(linjer))


def main_fri(cfg):
    masser = hent_kilder(cfg["kilder"]) if "kilder" in cfg else hent_masser()
    felt, origo, forskyvning = plasser_fritt(masser, cfg)
    masker = [f >= 0.5 for f in felt]
    dod = dodslinje(masker, origo)
    maal = maalpunkt(masker, origo)
    _, starter_ = sjekk_fri(masker, origo, forskyvning, dod, maal)
    for i, fra in enumerate(starter_):
        n = slip_lepper(felt[i], fra)
        print("flis %d: slipt bort %d px oppbøyd kant etter x=%d" % (i + 1, n, fra))
    masker = [f >= 0.5 for f in felt]
    dod = dodslinje(masker, origo)
    maal = maalpunkt(masker, origo)
    ok, _ = sjekk_fri(masker, origo, forskyvning, dod, maal)
    return felt, masker, ok, (origo, forskyvning, dod, maal)


def main():
    global BANE, TEGNING
    tall = [a for a in sys.argv[1:] if a.isdigit()]
    if len(tall) != 1 or int(tall[0]) not in BANER:
        sys.exit("Bruk: python3 Util/baner/lag_bane.py <bane> [--sjekk], bane er en av %s"
                 % sorted(BANER))
    BANE = int(tall[0])
    TEGNING = "Util/baner/tegning%d.jpg" % BANE
    cfg = BANER[BANE]
    oppsett = None
    if cfg.get("fri"):
        felt, masker, ok, oppsett = main_fri(cfg)
    else:
        felt, masker, ok = main_fast(cfg)
    if "--sjekk" in sys.argv:
        return
    if not ok:
        print("\nMålingene er ikke innenfor kravene, skriver ingenting.")
        sys.exit(1)
    alle = []
    for i, (f, m) in enumerate(zip(felt, masker)):
        mal(f, 10 * BANE + i).save("level%d/%d.png" % (BANE, i + 1), optimize=True)
        alle.append(kollisjon(m))
        print("level%d/%d.png skrevet, %d kollisjonsklosser" % (BANE, i + 1, len(alle[-1])))
    skriv_shapedefs(alle)
    print("lib/shapedefs%d.lua skrevet, %d klosser totalt" % (BANE, sum(len(a) for a in alle)))
    if oppsett:
        skriv_oppsett(*oppsett)
        print("lib/baneoppsett%d.lua skrevet" % BANE)


def main_fast(cfg):
    """Bane 7: én masse per flis i den faste diagonalen."""
    global MAAL, FIRKANT1_X
    MAAL = cfg["maal"]
    FIRKANT1_X = 3500 - cfg["forskyvning"]
    masser = hent_masser()
    felt = []
    for i, (masse, maal) in enumerate(zip(masser, MAAL)):
        f, (sx, sy) = lag_maske(masse, maal)
        print("flis %d: skala %.1f bortover, %.1f nedover (strukket %.2f)" % (i + 1, sx, sy, sx / sy))
        felt.append(f)
    fra_liste = starter([f >= 0.5 for f in felt])
    if "slip_fra_flis1" in cfg:
        fra_liste[0] = cfg["slip_fra_flis1"]
    for i, fra in enumerate(fra_liste):
        n = slip_lepper(felt[i], fra)
        print("flis %d: slipt bort %d px oppbøyd kant etter x=%d" % (i + 1, n, fra))
    masker = [f >= 0.5 for f in felt]
    ok = sjekk(masker)
    return felt, masker, ok


if __name__ == "__main__":
    main()
