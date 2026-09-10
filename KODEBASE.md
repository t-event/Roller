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

## Mappestruktur

**Endret 2026-09-10.** Prosjektet var tidligere helt flatt (alle `.lua`-
filer i roten). Nå:

- Roten: bare `main.lua` og `config.lua` (må ligge her, Solar2D krever det),
  pluss `build.settings`, mappene under, og alle asset-mapper (bilder/lyd)
  som ikke er rørt.
- `scenes/` — alle Composer-scener (splash-skjermer, menyer, pause-/
  dødsmeny, alle ni baner).
- `lib/` — delte moduler som ikke er egne scener (fysikkformer, kamera,
  liv/poeng, banevalg-systemet, tredjeparts lagringsbibliotek).
- `dod-kode/` — bekreftet ubrukt kode, se `dod-kode/README.md`.
- `opprinnelig-fra-dropbox/` — de 306 originale filene fra Dropbox, helt
  urørt, lagt til 2026-09-10 så Ørjan kan bla i dem direkte på GitHub.
  Ikke en del av selve spillet, se `opprinnelig-fra-dropbox/README.md`.
  Ekskludert fra alle bygg via `excludeFiles` i `build.settings`, ellers
  hadde HTML5-bunten blitt ~28 MB større for ingenting siden
  `Util/recipe-html5.lua` bruker hele repo-roten som `projectPath`.
- `ssk2/` — tredjepartsbibliotek, urørt.

I Solar2D er `require("navn")` og `composer.gotoScene("navn")` bokstavelig
talt en fil-sti, så alle scenenavn heter nå `"scenes.navn"` (f.eks
`"scenes.level1"`) og alle modul-`require`-kall heter `"lib.navn"` (f.eks
`require("lib.liv")`). Bilde-/lyd-stier er IKKE påvirket, de er alltid
relative til prosjektroten uansett hvilken `.lua`-fil som laster dem.

## Faktisk scene-flyt (bekreftet ved å spore alle `gotoScene`/`showOverlay`-kall)

```
main.lua
  └─ gotoScene("scenes.gotolevel1")        [alltid, uansett]
       └─ (1.5s) gotoScene("scenes.level1")

scenes/level1.lua .. level9.lua     [selve banen, valgt via chooselevel-gridet]
  ├─ showOverlay("scenes.dodmenu1")        [alltid dodmenu1, uansett hvilken bane]
  ├─ showOverlay("scenes.pausemenu1")      [alltid pausemenu1, uansett hvilken bane]
  └─ showOverlay("scenes.gotochooselevel")   [alle ni baner, tilbake til banevalg,
                  fikset 2026-09-10, level2-9 gikk før alltid til gotolevel2]

scenes/pausemenu1.lua (delt av alle baner)
  ├─ "retry"      → gotoScene("scenes.level" .. lm.currentLevel)   [fikset 2026-09-10,
  │                  gikk før alltid til level 1 uansett hvilken bane du var på]
  ├─ "main menu"  → gotoScene("scenes.gotomenu") → gotoScene("scenes.menu")
  └─ "levels"     → gotoScene("scenes.gotochooselevel") → gotoScene("scenes.chooselevel")
                     └─ lm.init() (lib/ogt_levelmanager.lua) bygger rutenettet
                          └─ trykk på en rute → gotoScene("scenes.level" .. N)
                             [rett til levelN, IKKE via gotolevelN]

scenes/dodmenu1.lua (delt av alle baner)
  └─ samme struktur som pausemenu1.lua, "retry"/"main menu"/"levels"

scenes/chooselevel.lua / gotochooselevel.lua
  → lm.init() i lib/ogt_levelmanager.lua, som leser lib/ogt_lmdata.lua
```

**Viktigst å forstå:** Selve banevalget hopper rett til `levelN`, ikke via
`gotolevelN`. `gotolevel1.lua`-splashen nås bare på selve appstart, den
eneste `gotolevelN`-fila som fortsatt er i bruk (`gotolevel2.lua` til
`gotolevel9.lua` ligger i `dod-kode/`, se der for historikken).

## Fil-for-fil, gruppert

Filnavnene under er skrevet uten mappe-prefiks for lesbarhet (`gotolevel1.lua`
i stedet for `scenes/gotolevel1.lua`), se "Mappestruktur" over for hvor de
faktisk ligger nå. Alt merket **død kode** ligger i `dod-kode/`
i stedet for i `scenes/`/`lib/` (ikke slettet, se `dod-kode/README.md`).
Beskrivelsene under er ellers uendret siden flyttingen ikke påvirker hva
filene gjør.

### Kjerne / alltid i bruk
- `main.lua` — appens startpunkt, laster ssk2, går til `gotolevel1`.
- `config.lua` — skjermoppløsning (540×960, kun landscape), skaleringsmodus.
- `build.settings` — orientering, feilsøkingsinnstillinger.

### Splash-skjermer ("gotoX")
- `gotolevel1.lua` — **i bruk**, appens faktiske startskjerm.
- `gotolevel2.lua` til `gotolevel9.lua` — **død kode** (`dod-kode/`).
  `gotolevel2.lua` var **i bruk, men bugget** fram til 2026-09-10: vist
  fra "neste bane"-knappen i level2 til level9
  (`goto2`/`showOverlay("gotolevel2")`), uansett hvilken bane som faktisk
  fullføres, og selv den gikk videre til bane 1, ikke bane 2. `level1.lua`
  gjorde det riktig fra før (går til `gotochooselevel`, tilbake til
  banevalg). Fikset ved å la alle ni baner gjøre som `level1.lua`, se
  "Kjente feil". `gotolevel3.lua`-`gotolevel9.lua` var alltid dødt,
  ingenting navigerte dit noensinne.
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
3. ~~"Neste bane"-knappen er hardkodet til level 2~~ **Fikset 2026-09-10.**
   Ørjan tok ikke stilling til denne spesifikt, men mest nærliggende var å
   la level2.lua-level9.lua gjøre som `level1.lua` alltid gjorde riktig:
   `goto2`-funksjonen viser nå `gotochooselevel` (tilbake til banevalg)
   i stedet for det hardkodede, bugget `showOverlay("gotolevel2")`.
   `gotolevel2.lua` mistet dermed sin eneste referanse og er flyttet til
   `dod-kode/`. Ikke testet i faktisk nettleser ennå.
4. ~~"Retry" fra pausemenyen går alltid til bane 1~~ **Fikset
   2026-09-10, i to omganger.** Ørjan bekreftet at retry skal starte
   banen du faktisk var på. Første forsøk brukte
   `composer.getSceneName("current")`, som viste seg å krasje
   nettleseren hardt (Chrome-feilen "kan ikke åpne denne siden", ikke
   engang vår egen røde feilboks) hver eneste gang, testet av Mathias
   på telefon. Mistanke: kalt fra et overlay (pausemenu1/dodmenu1)
   returnerer den trolig overlayets eget navn, ikke banen under, og å
   gotoScene til et scenenavn som samtidig kjører som overlay er nok
   alvorlig nok til å krasje WASM-motoren i stedet for å gi en
   fangbar Lua-feil. Byttet til en mer robust løsning: hver
   `levelN.lua` setter `lm.currentLevel = N` selv, tidlig i
   `scene:create`, og retry bruker `"level" .. lm.currentLevel`
   direkte i stedet for å spørre Composer.

   Testet av Mathias/Ørjan, krasjet fortsatt, denne gangen et uhåndtert
   "attempt to compare nil with number" fra selve motoren. Årsak:
   `composer.removeScene( destination )` (fiksen for slow-motion,
   se punkt under) ble kalt helt uten `pcall` på banen som fortsatt
   var den aktive scenen, mens pausemeny/dødsmeny lå som overlay oppå
   den. Composer støtter ikke å rive ned en scene mens dens egen
   overlay fortsatt vises. **Fikset 2026-09-10**: `composer.hideOverlay()`
   legges nå til rett før `removeScene()` i begge menyenes `resume()`,
   se `TIL-ORJAN.md`. Ikke testet i faktisk nettleser ennå.
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
   av når marken er slapp. Samme fiks i `level2.lua`-`level9.lua` også
   (delte nøyaktig samme buggede kode), ikke bare `level1.lua`. Ikke
   testet i faktisk nettleser ennå.
7. **Utilsiktede globale variabler, bekreftet mot Solar2D sin egen
   dokumentasjon (2026-09-10).** Solar2D advarer eksplisitt: fjernes
   ikke Runtime-lyttere, fortsetter de å kjøre og lekker minne, siden
   Runtime-eventet er globalt. Fant flere funksjoner skrevet uten
   `local` (utilsiktet globale) i banefilene: `trykk_knapp` (alle ni
   baner), `kill` (bane 2-9, aldri kalt noe sted), `lock`/`goto`
   (`menu.lua`). **Fikset**, men `trykk_knapp` krevde ekstra
   forsiktighet: `pausemenu1.lua`/`dodmenu1.lua` prøvde å fjerne den
   som om den var global, på tvers av filer. Løst ved å gjøre
   `trykk_knapp` fil-scoped i hver banefil (synlig for både
   `scene:create` og `scene:hide` som egen `local`), og fjerne de
   virkningsløse cross-fil-forsøkene i pausemeny/dødsmeny (opprydningen
   skjer nå riktig i banens egen `scene:hide`, tvunget gjennom av
   `composer.removeScene()`-fiksen fra samme dag). Oppdaget samtidig at
   `onCollision`/`onCollision1`/`knekk` **allerede var** korrekt lokale
   i banefilene, og at pausemeny/dødsmeny sine forsøk på å fjerne DEM
   på tvers av filer **aldri har fungert** (refererte en udefinert
   global) — trolig en medvirkende årsak til slow-motion-bugen (punkt
   nedenfor), siden lyttere som ikke fjernes hoper seg opp nøyaktig
   slik Solar2D sin dokumentasjon advarer om. Disse virkningsløse
   linjene er også fjernet.

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
2. **"Retry"- og "neste bane"-bugene er begge fikset** (punkt 3 og 4
   over). Ingen kjente åpne spillbarhets-bugs igjen, kun de to som
   venter på nytt innhold fra Ørjan (delte kollisjonsformer,
   plassholder-grafikk, punkt 1 og 2 over).
3. **Vurder å slå sammen** de 9 nesten-identiske `levelN.lua`-filene til én
   parameterisert fil som leser banenummer fra en tabell (bilder,
   kollisjonsformer, startposisjon), i stedet for kopiert kode. Stor jobb,
   men ville gjort det mulig å faktisk fylle inn manglende bane-innhold ett
   sted i stedet for ni.
4. Fjern feilsøkings-`checkpoint()`-kallene og `pcall`-innpakningene som ble
   lagt til under HTML5-portingen (se "Husk før dette regnes som ferdig"
   øverst i `TIL-ORJAN.md`) når spillet er stabilt.
5. **Fjernet ca 1170 linjer utkommentert dødkode (2026-09-10)**, fra
   `level1.lua`-`level9.lua`, `menu.lua`, `liv.lua` og `mark.lua`.
   Dette var gamle, forlatte forsøk skrevet inn som `--[[ ... ]]`-
   blokker (aldri kjørende kode). Verifisert med et eget skript som
   følger Lua sin faktiske kommentar-syntaks (en `--[[`-blokk avsluttes
   av den FØRSTE `]]` den finner, uansett hva som står etter) i stedet
   for en enklere, upresis metode som først ga feil svar og nesten
   fjernet ekte, kjørende kode ved en feiltagelse — fanget opp før noe
   ble skrevet til disk. Lisens-/changelog-kommentarene i
   `ogt_levelmanager.lua`/`ogt_lmdata.lua`/`perspective.lua` (også
   `--[[ ]]`-blokker, men ekte dokumentasjon, ikke dødkode) er bevisst
   IKKE rørt. Hver fil er syntaks-sjekket med `luac -p` og diffet mot
   forrige versjon for å bekrefte at kun linjer ble fjernet, aldri
   endret eller lagt til.
6. **Merket `camera`/`grp` som bevisste globaler (2026-09-10)**, med
   `_G.`-prefiks på definisjonsstedet i `level1.lua`-`level9.lua` og
   `menu.lua`, per Solar2D sin egen anbefaling om å gjøre tiltenkte
   globaler eksplisitte. Disse to kan IKKE gjøres til vanlige lokale
   variabler slik `trykk_knapp` ble (punkt 7 i "Kjente feil"):
   `lib/liv.lua` sin `liv.hent()` (viser livstall/-ikon, kalt fra alle
   ni baner) skriver `grp:insert(...)` direkte og har ingen annen måte
   å nå banens visningsgruppe på. `pausemenu1.lua`/`dodmenu1.lua` og
   `gotoX`-filene har sin egen, selvstendige `grp`/`camera` som ikke er
   bekreftet delt med noe annet (lavere prioritet, ikke rørt ennå).
