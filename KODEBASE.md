# Kodebase-oversikt

Dette er et arkitektur-/kartleggingsdokument, ikke en logg (den er
`TIL-ORJAN.md`). Formålet er å gi et grunnlag for å rydde opp: hva finnes,
hva brukes faktisk, og hva er død kode som trygt kan slettes.

## Motoren

Corona/Solar2D, scene-basert via biblioteket `composer`. Hver "scene" er en
egen `.lua`-fil som returnerer et `scene`-objekt med `create`/`show`/`hide`/
`destroy`-hendelser. Navigering skjer med `composer.gotoScene("navn")` (bytter
hele scenen) eller `composer.showOverlay("navn", ...)` (legger en scene oppå
uten å fjerne den under, brukes til pause-/dødsmeny).

`ssk2/` er et eksternt, generelt utility-bibliotek (Roaming Gamer SSK2),
urørt tredjepartskode, ikke noe å rydde i.

## Faktisk scene-flyt (bekreftet ved å spore alle `gotoScene`/`showOverlay`-kall)

```
main.lua
  └─ gotoScene("gotolevel1")        [alltid, uansett]
       └─ (1.5s) gotoScene("level1")

level1.lua .. level9.lua            [selve banen, valgt via chooselevel-gridet]
  ├─ showOverlay("dodmenu1")        [alltid dodmenu1, uansett hvilken bane]
  ├─ showOverlay("pausemenu1")      [alltid pausemenu1, uansett hvilken bane]
  └─ level1: showOverlay("gotochooselevel")   [riktig, tilbake til banevalg]
     level2-9: showOverlay("gotolevel2")      [BUG: hardkodet, se "Kjente feil"]

pausemenu1.lua (delt av alle baner)
  ├─ "retry"      → gotoScene("gotolevel1")     [alltid level 1, ikke gjeldende bane]
  ├─ "main menu"  → gotoScene("gotomenu") → gotoScene("menu")
  └─ "levels"     → gotoScene("gotochooselevel") → gotoScene("chooselevel")
                     └─ lm.init() (ogt_levelmanager.lua) bygger rutenettet
                          └─ trykk på en rute → gotoScene("level" .. N)
                             [rett til levelN, IKKE via gotolevelN]

dodmenu1.lua (delt av alle baner)
  └─ samme struktur som pausemenu1.lua, "retry"/"main menu"/"levels"

chooselevel.lua / gotochooselevel.lua
  → lm.init() i ogt_levelmanager.lua, som leser ogt_lmdata.lua
```

**Viktigst å forstå:** Selve banevalget hopper rett til `levelN`, ikke via
`gotolevelN`. `gotolevelN`-filene (splash-animasjonen med `last.png`) nås
bare på selve appstart (`gotolevel1`) og via den hardkodede
`showOverlay("gotolevel2")`-bugen i alle baners "neste bane"-knapp.

## Fil-for-fil, gruppert

### Kjerne / alltid i bruk
- `main.lua` — appens startpunkt, laster ssk2, går til `gotolevel1`.
- `config.lua` — skjermoppløsning (540×960, kun landscape), skaleringsmodus.
- `build.settings` — orientering, feilsøkingsinnstillinger.

### Splash-skjermer ("gotoX")
- `gotolevel1.lua` — **i bruk**, appens faktiske startskjerm.
- `gotolevel2.lua` — **i bruk, men bugget**: vises fra "neste bane"-knappen
  i level2 til level9 (`goto2`/`showOverlay("gotolevel2")`), uansett hvilken
  bane som faktisk fullføres. `level1.lua` gjør det riktig (går til
  `gotochooselevel`, tilbake til banevalg), de andre åtte har en
  kopiert/glemt hardkoding igjen fra et tidligere utviklingsstadium.
- `gotolevel3.lua` til `gotolevel9.lua` — **død kode**, ingenting i spillet
  navigerer dit.
- `gotomenu.lua`, `gotochooselevel.lua` — **i bruk**, splash mellom
  pausemeny og hhv. hovedmeny/banevalg.

### Menyer
- `menu.lua` — **i bruk**, hovedmeny (bg1-5, "spill"-knapp til `chooselevel`).
- `chooselevel.lua` — **i bruk**, viser banevalg-rutenettet
  (delegerer til `ogt_levelmanager.lua`).
- `menu1.lua`, `menu backup.lua`, `options.lua`, `brett.lua`, `play.lua`,
  `hoydehopp.lua` — **død kode**, ikke navigert til noe sted, flere har i
  tillegg egne knuste bilde-referanser (se `TIL-ORJAN.md`).

### Pause-/dødsmeny
- `pausemenu1.lua` — **i bruk, av ALLE ni baner**. Eneste pausemeny som
  faktisk vises.
- `pausemenu2.lua` til `pausemenu9.lua` — **100 % død kode**. Bekreftet:
  ingen fil i hele repoet refererer til `"pausemenu2"` gjennom `"pausemenu9"`
  i det hele tatt.
- `dodmenu1.lua` — **i bruk, av ALLE ni baner**. Samme mønster som
  pausemenu1, men **mangler pcall-/sjekkpunkt-sikkerhetsnettet** som
  pausemenu1.lua fikk under feilsøkingen. Alle tre knappene (retry/
  main menu/levels) kaller `composer.gotoScene()` helt direkte.
- `dodmenu2.lua` til `dodmenu9.lua` — **100 % død kode**, samme bekreftelse
  som pausemenu2-9.

### Baner
- `level1.lua` — **ferdig, fungerer.** Egen, unik grafikk for banestykkene
  (`level1/1-4.png`). Kollisjonsformene i `shapedefs.lua` ("1","2","3","4")
  ble sporet fra denne banens bilder.
- `level2.lua`, `level3.lua`, `level4.lua` — **spillbare, men ufullstendig
  innhold.** Ifølge Ørjan er disse "ferdige", men bruker plassholder-grafikk
  (se under) og de samme (feil) kollisjonsformene som level1.
- `level5.lua` til `level9.lua` — **ufullstendige, ifølge Ørjan.** Har i
  tillegg egne knuste bilde-stier (samme mønster som level2-4 hadde før vi
  fikset dem), ikke rettet siden disse ikke er prioritert. Bekreftet med
  `diff`: alle fem er **100 % byte-identiske filer**, ikke bare samme
  plassholderbilder. De knuste stiene er konkret: bildene refereres uten
  mappe-prefiks (`"back_cave.png"`, `"dirt1.png"`, `"1.png"`-`"4.png"`),
  mens filene faktisk ligger under `background/` og under sin egen
  `levelN/`-mappe. `level2.lua`-`level4.lua` har korrekte stier og er
  ikke rammet.
- **Alle ni baner bruker identiske plassholderbilder** for banestykkene
  (`levelN/1.png` til `4.png`), unntatt level1 som har unike bilder.
  Bekreftet med MD5-sjekksum, se `TIL-ORJAN.md`.

### Banevalg-systemet
- `ogt_levelmanager.lua` / `ogt_lmdata.lua` — **i bruk**, tredjeparts-aktig
  "level select grid"-bibliotek (paginert rutenett, lås/opplåsing,
  stjerner). `ogt_lmdata.lua` er konfigurasjonen (antall baner, låste
  baner, bildefiler). To ting funnet ved gjennomgang: `k.beforeLeaving()`
  (kjører hver gang du trykker en banerute) lager en splash-sprite som
  aldri fjernes (opprydningen er kommentert bort), så hvert banevalg
  legger igjen ett objekt til. Og selve scenebyttet når du trykker en
  banerute (`sceneMgr.gotoScene()` i `selectLevel`) mangler pcall-
  sikkerhetsnettet som resten av kjeden dit (pausemeny →
  gotochooselevel → chooselevel → init/makeGrid) fikk under
  feilsøkingen.

### Delte spillobjekter
- `perspective.lua` — kamerasystem (parallakse, lag), tredjepartsbibliotek
  ("Perspective" av Caleb P), urørt.
- `shapedefs.lua` — auto-generert av PhysicsEditor, kollisjonsformer. Se
  "Kjente feil".
- `liv.lua` — "liv" = spillerens liv/poengsum, lagres via `GGData.lua`.
  **Trekkes bare fra når du bruker en knapp i pause-/dødsmenyen
  (retry/main menu/levels), ikke av noe som skjer inni selve
  spillingen**, og `liv.endreliv()` legger faktisk TIL 2 liv i stedet
  for å trekke fra når telleren når 1 (`liv_igjen == 1`), så tallet
  kan aldri nå null i praksis. Ingenting i koden sjekker uansett
  `liv.returnScore()` mot null. Selve dødsskjermen
  (`showOverlay("dodmenu1")`) trigges av en helt separat ting: en
  fysikk-kollisjon mellom et "dod"-objekt og spillerens hode
  (`del9`). Lives-tallet som vises er altså kosmetisk per nå, uten
  konsekvens for spillet.
- `mark.lua` — bygger spillerkarakterens kroppsdeler (hale/hode),
  fysikk-leddet sammen. **`require`t av `menu.lua` og `level1.lua`,
  men `mark.hent()` blir aldri faktisk kalt noe sted** (begge fanger
  funksjonen i en lokal variabel og bruker den ikke). `level1.lua`
  bygger i stedet spillerkroppen med ca 90-100 linjer kopiert kode
  rett i egen fil. Reelt sett dødt, bortsett fra at selve `require`-
  kallet kjører harmløst.
- `gameUI.lua` — liten delt hjelpefunksjon (`dragBody`), i bruk.
- `GGData.lua` — tredjeparts lagringsbibliotek, urørt.
- `game.lua`, `livddadas.lua` — **død kode**, gamle/kommenterte varianter av
  `liv.lua`, aldri `require`t noe sted. Snodig detalj: filnavn og innhold
  er byttet om. `game.lua` inneholder (til tross for navnet) en gammel
  `liv`-modul med udefinerte `saveScore()`/`loadScore()`-kall (ville
  krasjet hvis den noen gang ble brukt). `livddadas.lua` inneholder i
  stedet en gammel `game`-modul (score.txt/high_score, fungerende
  internt). Ufarlig siden begge er 100 % ubrukte, men en felle for
  filnavn-basert gjetting hvis noen vurderer å gjenopplive en av dem.

## Kjente feil (utover det som allerede er fikset, se `TIL-ORJAN.md`)

1. **Delte kollisjonsformer.** `shapedefs.lua` har bare ett sett former
   ("1"-"4"), men brukes av alle baner. Stemmer bare med level1 sine
   bilder. (Dokumentert i `TIL-ORJAN.md` fra før.)
2. **Plassholder-grafikk.** level2-9 deler identiske banestykke-bilder.
   (Også i `TIL-ORJAN.md`.)
3. **"Neste bane"-knappen er hardkodet til level 2**, i level2.lua til
   level9.lua (`showOverlay("gotolevel2")` i `goto2`-funksjonen), uansett
   hvilken bane som faktisk fullføres. `level1.lua` gjør det riktig (viser
   `gotochooselevel`, tilbake til banevalg-skjermen) — de andre åtte burde
   trolig gjøre det samme.
4. **"Retry" fra pausemenyen går alltid til bane 1**
   (`composer.gotoScene("gotolevel1")` i `pausemenu1.lua`), ikke til banen
   du faktisk var på.

## Anbefalt ryddeplan

1. **Slett trygt** (ingen referanser noe sted, bekreftet flere ganger):
   `pausemenu2.lua`-`pausemenu9.lua`, `dodmenu2.lua`-`dodmenu9.lua`,
   `gotolevel3.lua`-`gotolevel9.lua`, `menu1.lua`, `menu backup.lua`,
   `options.lua`, `brett.lua`, `play.lua`, `hoydehopp.lua`, `game.lua`,
   `livddadas.lua`. Det er **23 filer**, over en firedel av alle
   `.lua`-filene i prosjektet, som ikke gjør noe i det hele tatt.
2. **Fiks "neste bane" og "retry"-bugene** (punkt 3 og 4 over) før mer
   opprydding, siden de påvirker faktisk spillbarhet.
3. **Vurder å slå sammen** de 9 nesten-identiske `levelN.lua`-filene til én
   parameterisert fil som leser banenummer fra en tabell (bilder,
   kollisjonsformer, startposisjon), i stedet for kopiert kode. Stor jobb,
   men ville gjort det mulig å faktisk fylle inn manglende bane-innhold ett
   sted i stedet for ni.
4. Fjern feilsøkings-`checkpoint()`-kallene og `pcall`-innpakningene som ble
   lagt til under HTML5-portingen (se "Husk før dette regnes som ferdig"
   øverst i `TIL-ORJAN.md`) når spillet er stabilt.
