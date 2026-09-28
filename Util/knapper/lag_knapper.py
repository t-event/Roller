#!/usr/bin/env python3
"""
Lager knapper og steiner i samme stil som de som finnes (2026-09-28).

Kjør fra roten av repoet:   python3 Util/knapper/lag_knapper.py

- Knappene tar pausemenuresume.png, fjerner teksten og skriver ny tekst
  med samme farge og en fet antikva (Liberation Serif Bold, som ligner
  skriften i de gamle knappene). De lagres i dobbel oppløsning og vises
  i 109 x 45 som de andre.
- Steinen "Controls" på startskjermen lages av storyknapp.png: teksten
  males over med steinfargen rundt, og ny tekst risses inn skrått som i
  "Story", "Games" og "Settings".
"""
import numpy as np
from PIL import Image, ImageDraw, ImageFont, ImageFilter

SERIF = "/usr/share/fonts/truetype/liberation/LiberationSerif-Bold.ttf"
DEJAVU = "/usr/share/fonts/truetype/dejavu/DejaVuSerif-Bold.ttf"

KNAPPER = {
    "pausemenucontrols.png": "Controls",
    "knapp_hoydehopp.png": "High jump",
    "knapp_lengdehopp.png": "Long jump",
    "knapp_100m.png": "100 m",
    "knapp_start.png": "Start",
    "knapp_opp.png": "Bar up",
    "knapp_ned.png": "Bar down",
    "knapp_igjen.png": "Again",
    "knapp_games.png": "Games",
    "knapp_ok.png": "OK",
}


def tom_knapp():
    a = np.array(Image.open("pausemenuresume.png").convert("RGBA")).astype(np.int32)
    inn = a[6:39, 6:103]
    lys = inn[..., 0] > 60
    inn[lys, :3] = 57
    a[6:39, 6:103] = inn
    return Image.fromarray(a.astype(np.uint8), "RGBA").resize((218, 90), Image.LANCZOS)


def knapp(tekst):
    im = tom_knapp()
    d = ImageDraw.Draw(im)
    storrelse = 40
    while True:
        f = ImageFont.truetype(SERIF, storrelse)
        b = d.textbbox((0, 0), tekst, font=f)
        if b[2] - b[0] <= 180 or storrelse <= 20:
            break
        storrelse -= 2
    # midtstilt etter skriftlinja (anchor "mm"), ikke bokstavene, så
    # "High jump" og "Start" står på samme høyde
    d.text((109, 46), tekst, font=f, fill=(159, 159, 159, 255), anchor="mm")
    return im


def stein(kilde, tekst, vinkel):
    im = Image.open(kilde).convert("RGBA")
    a = np.array(im).astype(np.float32)
    rgb = a[..., :3]
    lum = rgb.mean(axis=2)
    alfa = a[..., 3] > 200
    # teksten er mørkere enn steinen rundt: finn den mot et utglattet felt
    glatt = np.array(Image.fromarray(lum.astype(np.uint8)).filter(ImageFilter.MedianFilter(61))).astype(np.float32)
    h, w = lum.shape
    yy, xx = np.mgrid[0:h, 0:w]
    midt = (yy > h * 0.2) & (yy < h * 0.8) & (xx > w * 0.02) & (xx < w * 0.98)
    tekstmaske = alfa & midt & (lum < glatt - 5)
    tekstmaske = np.array(Image.fromarray((tekstmaske * 255).astype(np.uint8)).filter(ImageFilter.MaxFilter(11))) > 0
    # mal over med steinfargen fra et kraftig utglattet bilde uten teksten
    fyll = rgb.copy()
    for k in range(3):
        kanal = rgb[..., k].copy()
        kanal[tekstmaske | ~alfa] = np.nan    # gjennomsiktige piksler er ikke stein
        # enkel innfylling: gjennomsnitt av kjente naboer, mange runder
        for _ in range(60):
            m = np.isnan(kanal)
            if not m.any():
                break
            p = np.pad(kanal, 1, mode="edge")
            nab = np.stack([p[:-2, 1:-1], p[2:, 1:-1], p[1:-1, :-2], p[1:-1, 2:]])
            snitt = np.nanmean(nab, axis=0)
            kanal[m] = snitt[m]
        kanal[np.isnan(kanal)] = rgb[..., k][np.isnan(kanal)]
        fyll[..., k] = kanal
    rgb = np.where(tekstmaske[..., None], fyll, rgb)
    a[..., :3] = rgb
    ut = Image.fromarray(np.clip(a, 0, 255).astype(np.uint8), "RGBA")
    # ny tekst, risset inn: mørk tekst med lys kant under
    lag = Image.new("RGBA", ut.size, (0, 0, 0, 0))
    d = ImageDraw.Draw(lag)
    f = ImageFont.truetype(DEJAVU, 46)
    x, y = w / 2, h * 0.42
    d.text((x + 2, y + 3), tekst, font=f, fill=(196, 128, 80, 190), anchor="mm")
    d.text((x, y), tekst, font=f, fill=(112, 72, 48, 255), anchor="mm",
           stroke_width=2, stroke_fill=(84, 48, 28, 255))
    lag = lag.rotate(vinkel, resample=Image.BICUBIC, center=(w / 2, h * 0.42))
    ut.alpha_composite(lag)
    return ut


def main():
    for navn, tekst in KNAPPER.items():
        knapp(tekst).save(navn, optimize=True)
        print(navn)
    stein("storyknapp.png", "Controls", 12).save("controlsknapp.png", optimize=True)
    print("controlsknapp.png")


if __name__ == "__main__":
    main()
