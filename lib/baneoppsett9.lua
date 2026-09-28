-- Generert av Util/baner/hule.py 9. Ikke rediger for hånd.
-- Plassering av flisene (sentrum), dødslinja, målet og bakgrunnen for bane 9,
-- i spillenheter. Marken står som i alle baner i del1 = (0, 0).
return {
    fliser = {
        { x = 2800, y = 1911 },
        { x = 9660, y = 3871 },
        { x = 14120, y = 6657 },
        { x = 20580, y = 8679 },
    },
    dod = { x = 10769, y = 6138, rotasjon = 24.46 },
    mal2 = { x = 21539, y = 10064 },
    kamera = { x_maks = 20039, y_maks = 9408 },
    -- BARE FOR TESTING: banen flyttes så marken starter 1200 px før slutten.
    teststart = { x = 19439, y = 8953 },
    bakgrunn = { rotasjon = 25.04, steg_x = 1811, steg_y = 846 },
}
