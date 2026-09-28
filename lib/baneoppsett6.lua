-- Generert av Util/baner/hule.py 6. Ikke rediger for hånd.
-- Plassering av flisene (sentrum), dødslinja, målet og bakgrunnen for bane 6,
-- i spillenheter. Marken står som i alle baner i del1 = (0, 0).
return {
    fliser = {
        { x = 2800, y = 1911 },
        { x = 7820, y = 4493 },
        { x = 13160, y = 6827 },
        { x = 19380, y = 10153 },
    },
    dod = { x = 11030, y = 7260, rotasjon = 25.88 },
    mal2 = { x = 22060, y = 10999 },
    kamera = { x_maks = 20560, y_maks = 10341 },
    -- BARE FOR TESTING: banen flyttes så marken starter 1200 px før slutten.
    teststart = { x = 19960, y = 9917 },
    bakgrunn = { rotasjon = 26.50, steg_x = 1789, steg_y = 892 },
}
