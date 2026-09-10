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
  ├─ "retry"      → gotoScene(composer.getSceneName("current"))   [fikset 2026-09-10,
  │                  gikk før alltid til level 1 uansett hvilken bane du var på]
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

Alt merket **død kode** under er siden 2026-09-10 flyttet til `dod-kode/`
i stedet for prosjektroten (ikke slettet, se `dod-kode/README.md`).
Beskrivelsene under er uendret siden det ikke påvirker hva filene gjør.

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
  pausemenu1. Fikk pcall-sikkerhetsnettet på alle tre knappene
  (retry/main menu/levels) 2026-09-10, samme dekning som
  pausemenu1.lua nå.
- `dodmenu2.lua` til `dodmenu9.lua` — **100 % død kode**, samme bekreftelse
  som pausemenu2-9.

### Baner
- `level1.lua` — **ferdig, fungerer.** Egen, unik grafikk for banestykkene
  (`level1/1-4.png`). Kollisjonsformene i `shapedefs.lua` ("1","2","3","4")
  ble sporet fra denne banens bilder.
- `level2.lua`, `level3.lua`, `level4.lua` — **spillbare, men ufullstendig
  innhold.** Ifølge Ørjan er disse "ferdige", men bruker plassholder-grafikk
  (se under) og de samme (feil) kollisjonsformene som level1.
- `level5.lua` til `level9.lua` — **ufullstendige, ifølge Ørjan.**
  Var 100 % byte-identiske filer med knuste bildestier (bekreftet med
  `diff`). **Stiene rettet 2026-09-10** (Ørjan: greit å gjøre siden
  spillet ikke er under aktiv grafikk-utvikling), bildene refereres nå
  med riktig mappe-prefiks (`background/back_cave.png`,
  `level5/1.png` osv, samme mønster som `level2.lua`-`level4.lua`).
  De fem filene er dermed ikke lenger byte-identiske (hver har sin
  egen `levelN/`-sti), men deler fortsatt de samme plassholderbildene
  og de samme (feil) kollisjonsformene som level1 (se punkt 1 under
  "Kjente feil").
- **Alle ni baner bruker identiske plassholderbilder** for banestykkene
  (`levelN/1.png` til `4.png`), unntatt level1 som har unike bilder.
  Bekreftet med MD5-sjekksum, se `TIL-ORJAN.md`.

### Banevalg-systemet
- `ogt_levelmanager.lua` / `ogt_lmdata.lua` — **i bruk**, tredjeparts-aktig
  "level select grid"-bibliotek (paginert rutenett, lås/opplåsing,
  stjerner). `ogt_lmdata.lua` er konfigurasjonen (antall baner, låste
  baner, bildefiler). To ting funnet ved gjennomgang 2026-09-10, begge
  **fikset samme dag**: `k.beforeLeaving()` (kjører hver gang du
  trykker en banerute) lagde en splash-sprite som aldri ble fjernet,
  fjernes nå i `selectLevel()` sin `goto()` rett før scenebyttet. Og
  selve scenebyttet når du trykker en banerute (`sceneMgr.gotoScene()`
  i `selectLevel`) manglet pcall-sikkerhetsnettet som resten av kjeden
  dit (pausemeny → gotochooselevel → chooselevel → init/makeGrid) fikk
  under feilsøkingen, har det nå også.

### Delte spillobjekter
- `perspective.lua` — kamerasystem (parallakse, lag), tredjepartsbibliotek
  ("Perspective" av Caleb P), urørt.
- `shapedefs.lua` — auto-generert av PhysicsEditor, kollisjonsformer. Se
  "Kjente feil".
- `liv.lua` — "liv" = spillerens liv/poengsum, lagres via `GGData.lua`.
  **Trekkes bare fra når du bruker en knapp i pause-/dødsmenyen
  (retry/main menu/levels), ikke av noe som skjer inni selve
  spillingen.** Ørjan bekreftet 2026-09-10: liv skal ha reell
  betydning (ikke ferdig kodet), og skal kunne nå null, da skal
  spilleren kunne se en reklame for å få liv tilbake (1 min reklame =
  1 liv, lang reklame = flere), eller heller starte på nytt fra bane 1
  om man ikke vil se reklame. Bugen som hindret telleren fra
  noensinne å nå null er fikset (`liv.endreliv()` la feilaktig til 2
  liv i stedet for å trekke fra ved siste liv). "Retry" i
  `pausemenu1.lua`/`dodmenu1.lua` sjekker nå `liv.erTom()`: har du
  liv igjen, restartes gjeldende bane; er du tom, går du i stedet til
  `gotolevel1` (start fra bane 1), som en fallback siden selve
  reklame-visningen ennå IKKE er bygget (krever et valg av
  annonse-SDK, ingen faktisk "vil du se reklame?"-dialog finnes ennå).
  Dødsskjermen (`showOverlay("dodmenu1")`) trigges fortsatt av noe
  helt separat: en fysikk-kollisjon mellom et "dod"-objekt og
  spillerens hode (`del9`), uavhengig av live-telleren.
- `mark.lua` — bygger spillerkarakterens kroppsdeler (hale/hode),
  fysikk-leddet sammen. **`require`t av `menu.lua` og `level1.lua`,
  men `mark.hent()` blir aldri faktisk kalt noe sted** (begge fanger
  funksjonen i en lokal variabel og bruker den ikke). `level1.lua`
  bygger i stedet spillerkroppen med ca 90-100 linjer kopiert kode
  rett i egen fil. Reelt sett dødt, bortsett fra at selve `require`-
  kallet kjører harmløst.
  **Om kollisjonsboksene på marken (spurt av Ørjan 2026-09-10):**
  `shapedefs.lua` har faktisk ferdige `"hale"`/`"hode"`-former, men de
  brukes IKKE av `level1.lua` sin ormekropp. I stedet brukes
  hånd-skrevne, innebygde former (`del1Shape`/`del9Shape`). Sjekket
  hvorfor: `del1` (halen) krympes fra 55×35 til 27×17 rett før
  kollisjonsformen legges på, og de innebygde formene stemmer med den
  krympede størrelsen, mens `shapedefs.lua` sine `"hale"`/`"hode"`
  er sporet fra bildet i original (ukrympet) størrelse. Å bytte dem
  inn direkte ville gitt en dobbelt så stor usynlig kollisjonsboks.
  Ikke rørt fysikk-koden på dette, se "Kjente feil" punkt 5 for
  hvorfor (Ørjan sjekker om en nyere, 3-delt versjon av marken
  finnes).
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
   bilder. Ørjan har bekreftet (2026-09-10) at alle baner skal ha egne
   formsett i `shapedefs.lua`, per i dag ligger bare level1 sitt der
   (helt til slutt i fila). Venter på at de andre banenes former spores
   i PhysicsEditor, ikke noe AI kan gjøre uten kildebildene i riktig
   verktøy.
2. **Plassholder-grafikk.** level2-9 deler identiske banestykke-bilder.
   (Også i `TIL-ORJAN.md`.) Fortsatt uendret, venter på ny grafikk.
3. **"Neste bane"-knappen er hardkodet til level 2**, i level2.lua til
   level9.lua (`showOverlay("gotolevel2")` i `goto2`-funksjonen), uansett
   hvilken bane som faktisk fullføres. `level1.lua` gjør det riktig (viser
   `gotochooselevel`, tilbake til banevalg-skjermen) — de andre åtte burde
   trolig gjøre det samme. Ikke fikset ennå, Ørjan har ikke tatt stilling
   til denne spesifikt.
4. ~~"Retry" fra pausemenyen går alltid til bane 1~~ **Fikset
   2026-09-10.** Ørjan bekreftet at retry skal starte banen du faktisk
   var på. `pausemenu1.lua` og `dodmenu1.lua` bruker nå
   `composer.getSceneName("current")` i stedet for hardkodet
   `"gotolevel1"`. Ikke testet i faktisk nettleser ennå.
5. **Marken skal kunne "knekke"** (brekke i to ved landing), beskrevet
   av Ørjan som bygget av 3 biter med motoriserte ledd, men koden i
   dette repoet har en 9-leddet ormekropp uten noen knekk-mekanikk.
   Ørjan skal sjekke om han har en nyere versjon der dette faktisk er
   kodet. Ikke rørt fysikk-koden på dette punktet før den versjonen er
   funnet, siden det ville vært å gjette på en funksjon som kanskje
   allerede finnes et annet sted.
6. **Dobbeltklikk for å gjøre marken slapp virket ikke.** Fant koden
   (`trykk_knapp` i `level1.lua`), den brukte `event.numTaps == 2` fra
   Runtime "tap"-eventet, som ikke ser ut til å synkroniseres pålitelig
   med HTML5-eksportens museklikk. I tillegg satte "touch ended"-fasen
   alltid motorene på igjen uansett, så selv om dobbeltklikket ble
   oppdaget ville neste berøring slått dem på igjen momentant.
   **Fikset 2026-09-10:** dobbeltklikk oppdages nå selv, ved å måle tid
   mellom to "began"-faser (300 ms vindu), og "ended" lar motorene være
   av når marken er slapp. Ikke testet i faktisk nettleser ennå.

## Anbefalt ryddeplan

1. ~~Slett trygt~~ **Gjort, flyttet i stedet for slettet (2026-09-10),
   og Ørjan har bekreftet at dette er riktig fremgangsmåte** ("ta vare
   på død kode på den måten det er gjort til nå"): de 31 bekreftet
   ubrukte filene (`pausemenu2.lua`-`pausemenu9.lua`,
   `dodmenu2.lua`-`dodmenu9.lua`, `gotolevel3.lua`-`gotolevel9.lua`,
   `menu1.lua`, `menu backup.lua`, `options.lua`, `brett.lua`, `play.lua`,
   `hoydehopp.lua`, `game.lua`, `livddadas.lua`) ligger i `dod-kode/`
   i stedet for prosjektroten, se `dod-kode/README.md` for hvor hver kom
   fra. Ingenting av dette gjorde noe i det hele tatt, spillet fungerer
   identisk.
2. **"Retry"-bugen er fikset** (punkt 4 over). **"Neste bane"-bugen
   (punkt 3) er fortsatt åpen**, Ørjan har ikke tatt stilling til den
   spesifikt ennå.
3. **Vurder å slå sammen** de 9 nesten-identiske `levelN.lua`-filene til én
   parameterisert fil som leser banenummer fra en tabell (bilder,
   kollisjonsformer, startposisjon), i stedet for kopiert kode. Stor jobb,
   men ville gjort det mulig å faktisk fylle inn manglende bane-innhold ett
   sted i stedet for ni.
4. Fjern feilsøkings-`checkpoint()`-kallene og `pcall`-innpakningene som ble
   lagt til under HTML5-portingen (se "Husk før dette regnes som ferdig"
   øverst i `TIL-ORJAN.md`) når spillet er stabilt.
