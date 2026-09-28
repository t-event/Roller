#!/usr/bin/env python3
"""
Baner i bane 4 sin stil, tegnet som masser i verdenskoordinater
(bildepunkter, flis 1 øverst til venstre, flisene i den faste diagonalen
som i bane 1-7: flis k dekker x 3840k..3840(k+1), y 2351k..2351(k+1)).

Målene er hentet fra bane 4 (se KODEBASE.md, "Bane 4 målt"):
- rulleflatene heller 13-31 grader (median 24, 90 % under 41),
- maks-hoppet: kant etter en ~30 graders tilløpsbakke, 520 px bortover og
  260 px ned til toppen av neste masse,
- is ligger på toppene av søyler (flis 2-3) og i sprekker,
- isdalen i flis 4: V-formet gulv under et overheng, 10-50 px åpning i
  bunnen, is på begge sider; marken må være slapp,
- tak med drypp over rulleflata som i bane 3 (44-400 px åpning).

Kjør fra roten av repoet:
    python3 Util/baner/hule.py 5 --konsept   # oversiktsbilde med forklaring
"""
import math
import sys

import numpy as np
from PIL import Image, ImageDraw
from scipy import ndimage as nd

sys.path.insert(0, "Util/baner")
import lag_bane as L  # noqa: E402

W, H = L.W, L.H

# Is-farger målt i level4/2-4.png (KODEBASE.md): kald konturstrek,
# glans, midt, dyp.
IS_LAG = [(0, 2, (15, 50, 63)), (2, 7, (36, 96, 118)), (7, 16, (30, 84, 104)), (16, 30, (20, 60, 74))]


# ------------------------------------------------------------ bane 5

def bane5():
    """Returnerer (masser, is). masser: navn -> punktliste (verden, px).
    is: liste med (navn, x0, x1, "topp" | "bunn")."""
    m = {}
    # Flis 1 --------------------------------------------------------
    # A: startsøyle, toppen heller ~30 grader fra spawn ned til kanten for
    # maks-hoppet.
    m["A"] = [(30, 190), (160, 205), (420, 330), (760, 560), (1080, 770),
              (1105, 1150), (1085, 1700), (1095, 2215), (900, 2245),
              (300, 2240), (70, 2215), (45, 1500), (20, 700)]
    # B: kile. Venstre topp 520 px bort og 265 px ned fra A sin kant, som
    # maks-hoppet i bane 4.
    m["B"] = [(1600, 1035), (1720, 1030), (2050, 1150), (2600, 1370),
              (3100, 1590), (3480, 1720), (3640, 1790), (3700, 1950),
              (3640, 2230), (2400, 2250), (1580, 2240), (1545, 1950),
              (1570, 1500), (1590, 1200)]
    # C: tak med drypp over B (som bane 3), 330 px over rulleflata.
    m["C"] = [(2180, 620), (2700, 700), (3300, 880), (3790, 1010),
              (3790, 1260), (3500, 1330), (3300, 1260), (3000, 1150),
              (2700, 1050), (2450, 980), (2230, 930)]
    m["C1"] = [(2530, 1000), (2620, 1230), (2710, 1030)]      # drypp
    m["C2"] = [(2980, 1130), (3060, 1380), (3150, 1170)]
    m["C3"] = [(3350, 1270), (3420, 1490), (3500, 1300)]
    # Flis 2 --------------------------------------------------------
    ox, oy = 3840, 2351
    m["D"] = [(ox + 150, oy + 90), (ox + 420, oy + 190), (ox + 760, oy + 410),
              (ox + 790, oy + 900), (ox + 770, oy + 2200), (ox + 170, oy + 2230),
              (ox + 140, oy + 1200)]
    m["E"] = [(ox + 980, oy + 660), (ox + 1250, oy + 760), (ox + 1540, oy + 960),
              (ox + 1560, oy + 1500), (ox + 1540, oy + 2230), (ox + 990, oy + 2240),
              (ox + 960, oy + 1300)]
    m["F"] = [(ox + 1800, oy + 1250), (ox + 2400, oy + 1480), (ox + 3000, oy + 1760),
              (ox + 3550, oy + 1990), (ox + 3760, oy + 2080), (ox + 3780, oy + 2240),
              (ox + 1820, oy + 2250), (ox + 1780, oy + 1700)]
    m["G"] = [(ox + 2120, oy + 700), (ox + 2900, oy + 900), (ox + 3620, oy + 1180),
              (ox + 3620, oy + 1560), (ox + 3200, oy + 1470), (ox + 2700, oy + 1260),
              (ox + 2200, oy + 1060)]
    m["G1"] = [(ox + 2470, oy + 1160), (ox + 2560, oy + 1390), (ox + 2650, oy + 1200)]
    m["G2"] = [(ox + 3020, oy + 1370), (ox + 3110, oy + 1610), (ox + 3200, oy + 1410)]
    # Flis 3: tunnel med tak -----------------------------------------
    ox, oy = 7680, 4702
    m["H"] = [(ox + 90, oy + 110), (ox + 900, oy + 440), (ox + 1900, oy + 820),
              (ox + 2800, oy + 1170), (ox + 3600, oy + 1560), (ox + 3780, oy + 1700),
              (ox + 3760, oy + 2250), (ox + 100, oy + 2240), (ox + 60, oy + 1200)]
    m["I"] = [(ox + 800, oy + 60), (ox + 1500, oy + 20), (ox + 2400, oy + 260),
              (ox + 3300, oy + 520), (ox + 3350, oy + 880), (ox + 2900, oy + 820),
              (ox + 2400, oy + 620), (ox + 2000, oy + 560), (ox + 1500, oy + 330),
              (ox + 1000, oy + 170)]
    m["I1"] = [(ox + 1720, oy + 430), (ox + 1810, oy + 640), (ox + 1900, oy + 470)]
    m["I2"] = [(ox + 2220, oy + 590), (ox + 2300, oy + 800), (ox + 2390, oy + 630)]
    m["I3"] = [(ox + 2670, oy + 710), (ox + 2770, oy + 950), (ox + 2860, oy + 760)]
    # Flis 4: isdal under overheng (som bane 4 flis 4) ---------------
    ox, oy = 11520, 7053
    m["J"] = [(ox + 60, oy + 150), (ox + 450, oy + 360), (ox + 800, oy + 640),
              (ox + 1150, oy + 900), (ox + 1300, oy + 960), (ox + 1450, oy + 900),
              (ox + 1650, oy + 830), (ox + 2100, oy + 1010), (ox + 2900, oy + 1350),
              (ox + 3600, oy + 1650), (ox + 3780, oy + 1760), (ox + 3760, oy + 2250),
              (ox + 80, oy + 2240), (ox + 40, oy + 1000)]
    m["K"] = [(ox + 700, oy + 120), (ox + 1500, oy + 60), (ox + 2400, oy + 260),
              (ox + 2900, oy + 600), (ox + 2950, oy + 800), (ox + 2750, oy + 700),
              (ox + 2300, oy + 520), (ox + 1800, oy + 560), (ox + 1500, oy + 720),
              (ox + 1350, oy + 900), (ox + 1250, oy + 860), (ox + 1050, oy + 740),
              (ox + 800, oy + 470)]
    ice = [("D", 3840 + 330, 3840 + 780, "topp"), ("E", 3840 + 1100, 3840 + 1560, "topp"),
           ("H", 7680 + 1500, 7680 + 2600, "topp"),
           ("J", 11520 + 800, 11520 + 1700, "topp"), ("K", 11520 + 1000, 11520 + 1550, "bunn")]
    return m, ice


BANER = {5: bane5}

# Tak som henger ned fra berget over: flat topp helt opp mot flisekanten,
# mindre avrunding.
TAK = {"C", "G", "I"}


# ------------------------------------------------------------ tegning

def chaikin(pkt, runder=4):
    """Runder hjørnene i et lukket polygon (Chaikin: kutter hvert hjørne
    en firedel inn fra begge sider, flere ganger)."""
    p = np.asarray(pkt, float)
    for _ in range(runder):
        q = np.roll(p, -1, axis=0)
        p = np.stack([0.75 * p + 0.25 * q, 0.25 * p + 0.75 * q], axis=1).reshape(-1, 2)
    return p


def organisk_kontur(pkt, fro, store=18.0, drypp=False, tak=False):
    """Lukket, avrundet kontur med bølgete kant: hjørnene rundes med
    Chaikin, og kanten forskyves langs normalen med bølger i tre
    størrelser (350, 110 og 40 px)."""
    rng = np.random.default_rng(fro)
    p = chaikin(pkt, 2 if drypp else 3)
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
    oktaver = [(420.0, store), (150.0, store * 0.15)]
    if drypp:
        oktaver = [(60.0, 4.0)]
    for bolge, amp in oktaver:
        k = max(1, int(round(tot / bolge)))   # helt antall bølger rundt
        for _ in range(2):
            fase = rng.uniform(0, 2 * math.pi)
            forsk += amp / 2 * np.sin(2 * math.pi * k * t / tot + fase)
    return np.stack([x + nx * forsk, y + ny * forsk], axis=1)


def flis_felt(masser, k):
    """Glatt felt (0..1) for flis k, pluss en maske per masse."""
    ox, oy = 3840 * k, 2351 * k
    felt = np.zeros((H, W), np.float32)
    per = {}
    for i, (navn, pkt) in enumerate(masser.items()):
        xs = [p[0] - ox for p in pkt]
        ys = [p[1] - oy for p in pkt]
        if max(xs) < 0 or min(xs) > W or max(ys) < 0 or min(ys) > H:
            continue
        kontur = organisk_kontur(pkt, 500 + i, drypp=len(navn) > 1, tak=navn in TAK)
        lokal = [(float(x - ox), float(y - oy)) for x, y in kontur]
        im = Image.new("L", (W, H), 0)
        ImageDraw.Draw(im).polygon(lokal, fill=255)
        f = nd.gaussian_filter((np.asarray(im) > 127).astype(np.float32), 7)
        per[navn] = f >= 0.5
        felt = np.maximum(felt, f)
    return felt, per


def is_maske(masker, ice, k):
    ox = 3840 * k
    ut = np.zeros((H, W), bool)
    for navn, x0, x1, side in ice:
        if navn not in masker:
            continue
        m = masker[navn]
        a, b = max(int(x0 - ox), 0), min(int(x1 - ox), W)
        if a >= b:
            continue
        sub = m[:, a:b]
        if side == "topp":
            topp = np.where(sub.any(0), sub.argmax(0), H)
            dy = np.arange(H)[:, None] - topp[None, :]
            ut[:, a:b] |= sub & (dy >= 0) & (dy < 30)
        else:
            bunn = H - 1 - np.where(sub[::-1].any(0), sub[::-1].argmax(0), H)
            dy = bunn[None, :] - np.arange(H)[:, None]
            ut[:, a:b] |= sub & (dy >= 0) & (dy < 30)
    return ut


def mal_is(bilde, felt, ismaske):
    """Legger is oppå steinen der ismaske er sann, med dybde fra lufta."""
    m = felt >= 0.5
    d = nd.distance_transform_edt(m)
    a = np.asarray(bilde).copy()
    for d0, d1, farge in IS_LAG:
        sel = ismaske & (d >= d0) & (d < d1)
        a[sel, 0], a[sel, 1], a[sel, 2] = farge
    return Image.fromarray(a, "RGBA")


def konsept(bane):
    masser, ice = BANER[bane]()
    fliser = []
    for k in range(4):
        felt, per = flis_felt(masser, k)
        bilde = L.mal(felt, 10 * bane + k)
        bilde = mal_is(bilde, felt, is_maske(per, ice, k))
        fliser.append(bilde)
        print("flis", k + 1, "tegnet")
    return fliser


if __name__ == "__main__":
    bane = int(sys.argv[1])
    fliser = konsept(bane)
    S = sys.argv[2] if len(sys.argv) > 2 else "."
    for k, b in enumerate(fliser):
        b.save("%s/konsept%d_%d.png" % (S, bane, k + 1))
