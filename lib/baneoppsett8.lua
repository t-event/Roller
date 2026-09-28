-- Generert av Util/baner/hule.py 8. Ikke rediger for hånd.
-- Plassering av flisene (sentrum), dødslinja, målet og bakgrunnen for bane 8,
-- i spillenheter. Marken står som i alle baner i del1 = (0, 0).
return {
    fliser = {
        { x = 2800, y = 1911 },
        { x = 7980, y = 4621 },
        { x = 13960, y = 7027 },
        { x = 20660, y = 10349 },
    },
    dod = { x = 10500, y = 6867, rotasjon = 24.92 },
    mal2 = { x = 21000, y = 10032 },
    kamera = { x_maks = 19500, y_maks = 9420 },
    -- BARE FOR TESTING: banen flyttes så marken starter 1200 px før slutten.
    teststart = { x = 18900, y = 8985 },
    bakgrunn = { rotasjon = 25.54, steg_x = 1804, steg_y = 862 },
}
