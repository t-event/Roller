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
  └─ gotoScene("scenes.gotomenu")        [endret 2026-09-15, matcher Ørjans
                  nyere versjon; gikk før rett til gotolevel1/bane 1]
       └─ (1.5s) gotoScene("scenes.menu")
            └─ trykk "storyknapp" → (2s) gotoScene("scenes.chooselevel")

scenes/level1.lua .. level9.lua     [selve banen, valgt via chooselevel-gridet]
  ├─ showOverlay("scenes.dodmenu1")        [alltid dodmenu1, uansett hvilken bane]
  ├─ showOverlay("scenes.pausemenu1")      [alltid pausemenu1, uansett hvilken bane]
  └─ mål nådd ("mal2" vs "del4")  → lm.unlockNextLevel() → showOverlay("scenes.gotonextlevel")
                  [alle ni baner. Endret 2026-09-15, gikk før alltid til
                  "gotochooselevel"/banevalget (fikset dit 2026-09-10, level2-9
                  gikk før alltid til gotolevel2). Se scenes/gotonextlevel.lua.]

scenes/pausemenu1.lua (delt av alle baner)
  ├─ "retry"      → gotoScene("scenes.gotoretry")   [egen mellomscene, fikset
  │                  2026-09-10 i to omganger, se "Kjente feil" punkt 4]
  │                  └─ (0.8s) removeScene + gotoScene("scenes.level" .. lm.currentLevel)
  │                  [om liv.erTom(): går i stedet til "scenes.adoffer", se under.
  │                  Endret 2026-09-15, gikk før rett til "scenes.gotolevel1"]
  ├─ "main menu"  → gotoScene("scenes.gotomenu") → gotoScene("scenes.menu")
  └─ "levels"     → gotoScene("scenes.gotochooselevel") → gotoScene("scenes.chooselevel")
                     └─ lm.init() (lib/ogt_levelmanager.lua) bygger rutenettet
                          └─ trykk på en rute → gotoScene("scenes.level" .. N)
                             [rett til levelN, IKKE via gotolevelN]

scenes/dodmenu1.lua (delt av alle baner)
  └─ samme struktur som pausemenu1.lua, "retry"/"main menu"/"levels", samme
     "gotoretry"-omvei og samme "adoffer"-avstikker når liv.erTom().

scenes/adoffer.lua (ny 2026-09-15, "ingen liv igjen"-skjermen)
  ├─ "se kort reklame"  → placeholder-nedtelling → liv.addToScore(1) → gotoScene("scenes.gotoretry")
  ├─ "se lang reklame"  → placeholder-nedtelling → liv.addToScore(3) → gotoScene("scenes.gotoretry")
  └─ "fortsett uten"    → liv.new() (10 liv) + liv.lagreliv() → gotoScene("scenes.gotolevel1")
                  [full livsrefill lagt til 2026-09-15, gikk før til bane 1
                  med fortsatt 0 liv]

scenes/gotonextlevel.lua (ny 2026-09-15, "banen er fullført"-splashen)
  └─ (0.8s) removeScene + gotoScene("scenes.level" .. (lm.currentLevel+1))
                  [om lm.anotherLevel() er usann (siste bane fullført):
                  gotoScene("scenes.gotochooselevel") i stedet, tilbake til
                  banevalget som før]

scenes/chooselevel.lua / gotochooselevel.lua
  → lm.init() i lib/ogt_levelmanager.lua, som leser lib/ogt_lmdata.lua
```

**Viktigst å forstå:** Selve banevalget hopper rett til `levelN`, ikke via
`gotolevelN`. `gotolevel1.lua`-splashen nås på appstart, og på "retry" når
spilleren er tom for liv velger "fortsett uten" på `scenes/adoffer.lua`
(se over). `gotoretry.lua` er en tilsvarende splash, men for
"retry på gjeldende bane" (se "Kjente feil" punkt 4 for hvorfor den finnes).
Disse to er de eneste `gotolevelN`-lignende filene som fortsatt er i bruk
(`gotolevel2.lua` til `gotolevel9.lua` ligger i `dod-kode/`, se der for
historikken).

## Fil-for-fil, gruppert

Filnavnene under er skrevet uten mappe-prefiks for lesbarhet (`gotolevel1.lua`
i stedet for `scenes/gotolevel1.lua`), se "Mappestruktur" over for hvor de
faktisk ligger nå. Alt merket **død kode** ligger i `dod-kode/`
i stedet for i `scenes/`/`lib/` (ikke slettet, se `dod-kode/README.md`).
Beskrivelsene under er ellers uendret siden flyttingen ikke påvirker hva
filene gjør.

### Kjerne / alltid i bruk
- `main.lua` — appens startpunkt, laster ssk2, går til hovedmenyen
  (`gotomenu`, endret 2026-09-15, se "Faktisk scene-flyt" over).
- `config.lua` — skjermoppløsning (540×960, kun landscape), skaleringsmodus.
- `build.settings` — orientering, feilsøkingsinnstillinger.

### Splash-skjermer ("gotoX")
- `gotolevel1.lua` — **i bruk**, appens faktiske startskjerm, og der
  "fortsett uten"-knappen på `scenes/adoffer.lua` går når spilleren er
  tom for liv og ikke vil se reklame (se `lib/liv.lua`).
- `gotoretry.lua` — **ny fil, 2026-09-10, i bruk**. Samme mønster som
  `gotolevel1.lua`, men for "retry på gjeldende bane" i stedet for
  "start på nytt fra bane 1". Se "Kjente feil" punkt 4 for hvorfor den
  finnes (retry krasjet fortsatt uten den).
- `gotolevel2.lua` til `gotolevel9.lua` — **død kode** (`dod-kode/`).
  `gotolevel2.lua` var **i bruk, men bugget** fram til 2026-09-10: vist
  fra "neste bane"-knappen i level2 til level9
  (`goto2`/`showOverlay("gotolevel2")`), uansett hvilken bane som faktisk
  fullføres, og selv den gikk videre til bane 1, ikke bane 2. `level1.lua`
  gjorde det riktig fra før (går til `gotochooselevel`, tilbake til
  banevalg). Fikset ved å la alle ni baner gjøre som `level1.lua`, se
  "Kjente feil". `gotolevel3.lua`-`gotolevel9.lua` var alltid dødt,
  ingenting navigerte dit noensinne. **Ikke å forveksle** med den nye
  `gotonextlevel.lua` under, en helt annen (og riktig virkende) fil som
  faktisk går videre til neste bane.
- `gotonextlevel.lua` — **ny fil, 2026-09-15, i bruk**. Vises fra alle ni
  baners `goto2()` når `mal2`/`del4`-målet nås (fullført bane), i stedet
  for at koden gikk rett til `gotochooselevel` (banevalget). Går videre
  til `scenes.level` .. `(lm.currentLevel+1)` om det finnes en neste bane
  (`lm.anotherLevel()`), ellers til `gotochooselevel` som før (siste
  bane fullført). Samme trygge splash-mønster som `gotoretry.lua`.
- `gotomenu.lua`, `gotochooselevel.lua` — **i bruk**, splash mellom
  pausemeny og hhv. hovedmeny/banevalg.
- `adoffer.lua` — **ny fil, 2026-09-15, i bruk**. Vises fra
  `pausemenu1.lua`/`dodmenu1.lua` sin "retry" når `liv.erTom()`, i
  stedet for at koden gikk rett til `gotolevel1`. Kort reklame gir 1
  liv, lang reklame gir 3, "fortsett uten" kaller `liv.new()` (fulle
  10 liv igjen) før den går til `gotolevel1` som før (lagt til
  2026-09-15, gikk før dit med fortsatt 0 liv). Selve reklamen er en
  tydelig merket PLACEHOLDER (nedtelling), ikke koblet til noe
  reklame-SDK ennå. Se `TIL-ORJAN.md` for detaljer.

### Menyer
- `menu.lua` — **i bruk**, hovedmeny (bg1-5, "spill"-knapp til `chooselevel`).
- `chooselevel.lua` — **i bruk**, viser banevalg-rutenettet
  (delegerer til `ogt_levelmanager.lua`).
- `menu1.lua`, `menu backup.lua`, `options.lua`, `brett.lua`, `play.lua`,
  `hoydehopp.lua` — **død kode**, ikke navigert til noe sted, flere har i
  tillegg egne knuste bilde-referanser (se `TIL-ORJAN.md`).

### Pause-/dødsmeny
- `pausemenu1.lua` — **i bruk, av ALLE ni baner**. Eneste pausemeny som
  faktisk vises. To feil fra samme runde rettet 2026-09-15 (se
  `TIL-ORJAN.md`): (1) `resume1()` ("main menu") og `resume3()`
  ("levels") manglet `liv.erTom()`-sjekken som `resume()` ("retry")
  alt hadde, så de trakk liv og gikk rett til målet uansett, uten å
  vise `scenes.adoffer` når livet ble tomt. (2) `resume()`, `resume1()`
  og `resume3()` kalte alle `physics.start()` rett etter de startet
  navigering bort fra banen, noe som satte fysikken til banen man
  FORLOT i gang igjen midt i fade-overgangen (marken falt synlig videre
  i et sekund eller to). Kun `resume4()` ("fortsett spillet", den
  eneste knappen som blir i samme bane) skal kalle `physics.start()`.
- `pausemenu2.lua` til `pausemenu9.lua` — **100 % død kode**. Bekreftet:
  ingen fil i hele repoet refererer til `"pausemenu2"` gjennom `"pausemenu9"`
  i det hele tatt.
- `dodmenu1.lua` — **i bruk, av ALLE ni baner**. Samme mønster som
  pausemenu1. Fikk pcall-sikkerhetsnettet på alle tre knappene
  (retry/main menu/levels) 2026-09-10, samme dekning som
  pausemenu1.lua nå. Samme to feil og samme fiks som pausemenu1.lua
  over, 2026-09-15 (har ingen `resume4`/"fortsett"-knapp i det hele
  tatt, så her ble `physics.start()` fjernet fra alle tre knappene).
- `dodmenu2.lua` til `dodmenu9.lua` — **100 % død kode**, samme bekreftelse
  som pausemenu2-9.

### Baner
- `level1.lua` — **ferdig, fungerer.** Egen, unik grafikk for banestykkene
  (`level1/1-4.png`). Kollisjonsformene i `lib/shapedefs.lua` ("1","2","3","4")
  ble sporet fra denne banens bilder.
- `level2.lua`, `level3.lua`, `level4.lua` — **byttet ut 2026-09-14** med
  Ørjans nyere versjon (mottatt som zip fra Mathias). Egne, riktig sporede
  kollisjonsformer i `lib/shapedefs2.lua`/`shapedefs3.lua`/`shapedefs4.lua`
  (ikke lenger `lib/shapedefs.lua` sine, som var sporet fra bane 1 og ikke
  stemte, se "Kjente feil" nedenfor), sammen med nye bakke-bilder
  (`level2/1-4.png` osv, alle byttet ut samtidig med formene siden de hører
  sammen). Har nå samme fulle knekk-/støveffekt-system som `level1.lua`
  (`onLocalCollision1`-`onLocalCollision9`, ni "knott"-fysikkobjekter).
  Portert til `scenes.`/`lib.`-mappestrukturen og alle våre etablerte
  rettelser (retry via `scenes.gotoretry`, `lm.currentLevel`-sporing,
  dobbeltklikk-fiksen, `transition.cancel()`+`.stage`-vakt), se
  `TIL-ORJAN.md` for detaljene og hva som bevisst IKKE ble tatt med fra
  Ørjans zip (egne per-bane pausemeny/dødsmeny-filer, blant annet).
- `level7.lua` til `level9.lua` — **fortsatt ufullstendige, ifølge Ørjan.**
  Var 100 % byte-identiske filer med knuste bildestier (bekreftet med
  `diff`). **Stiene rettet 2026-09-10** (Ørjan: greit å gjøre siden
  spillet ikke er under aktiv grafikk-utvikling), bildene refereres nå
  med riktig mappe-prefiks (`background/back_cave.png`,
  `level7/1.png` osv). Disse filene er dermed ikke lenger byte-identiske
  (hver har sin egen `levelN/`-sti), men deler fortsatt de samme
  plassholderbildene og de samme (feil, sporet fra bane 1) kollisjonsformene
  i `lib/shapedefs.lua` (se "Kjente feil"). Ørjans zip dekket bare bane 1-4,
  så disse tre venter fortsatt på tilsvarende retting. Bane 5 og 6 fikk
  hver sin egen prosedyregenererte bane 2026-09-15, se under.
- `level5.lua` — **egen, prosedyregenerert bane, 2026-09-15.** Første
  bane med ordentlig innhold utover bane 1-4: nedoverbakke (samme
  diagonale flis-plassering som alle andre baner, se "Faktisk
  scene-flyt") og et hull man kan falle gjennom og dø i (`firkant3`
  flyttet en ekstra halv flis-lengde unna `firkant2`, fanget opp av
  den eksisterende `dod`-dødssonen). Grafikken (`level5/1-4.png`) er
  ikke håndtegnet som resten av spillet, men generert med et
  Python-script; selve kollisjonsformen i `lib/shapedefs5.lua` er
  regnet ut direkte fra de samme koordinatene kurven ble tegnet med
  (ikke sporet i etterkant), så form og bilde stemmer eksakt overens
  per konstruksjon. `del1` (marken sin egen form) kopiert uendret fra
  `lib/shapedefs4.lua`. Hver flis har sin EGEN bratte
  nedoverbakke-kurve (fra ~12 % ned ved venstrekant til ~83 % ned ved
  høyrekant, målt fra bane 4 sin ekte kunst), ikke én jevn kurve over
  alle fire flisene som i det aller første forsøket — den jevne
  varianten plasserte bakken altfor langt fra der marken faktisk
  starter (verdenskoordinat 0,0), så marken falt gjennom tomt rom uten
  at noen bakke kom i syne. Se `TIL-ORJAN.md` for hele prosessen,
  inkludert et mellomsteg der bane 4 sine bilder ble lånt midlertidig
  for å teste selve mekanikken isolert fra grafikken, og en
  skaleringsfeil (kollisjonsformene var regnet ut i kildebildets
  pikselstørrelse, 3840×2351, i stedet for den faktiske viste
  størrelsen 7680×4702 som `display.newImageRect` strekker til). To
  runder til, samme dag: kollisjonen fulgte fortsatt kurven dårlig
  (bare 6 rette linjestykker per flis, økt til 40), og selve terrenget
  var for kantete (den gamle boks-filtrerte støyen ga alltid en
  sagtakket rest uansett glattingsbredde, byttet til jevn
  "value noise" mellom en håndfull kontrollpunkter). Enda en runde,
  samme dag: parallax-bakgrunnen brukte en gammel, ubrukt bildesett
  (`background/dirt1.png`/`back_cave.png`, uten "1"-prefiks) i feil
  størrelse (klemt til halv høyde) og for få fliser (12 mot bane 4 sine
  20, gikk tom for bakgrunn før banen var over). Hele
  bakgrunns-oppsettet byttet ut med en eksakt kopi av bane 4 sitt.
  Terrenget fikk i tillegg en avrundet, ikke hardt avkuttet, start og
  slutt (`apply_edge_taper()` i generator-scriptet, kun de ytterste 90
  pikslene på flis 1 sin venstrekant og flis 4 sin høyrekant, resten
  urørt). Se `TIL-ORJAN.md` for alle detaljene, inkludert
  generator-scriptet (ligger i en økt-scratchpad, ikke i selve
  repoet). Siste runde, samme dag: bakken var én ubrutt skråning,
  Mathias ba om at den skal se ut som en faktisk hule med ganger og
  rom, slik bane 1-4 sin håndtegnede kunst har (flere separate
  bakkestykker med luft mellom, ikke én sammenhengende flate). Lagt
  til `gap_ranges()` (to luftlommer per flis, holdt unna
  kant-avrundingen og markens faktiske startpunkt) og
  `ceiling_curve()` (et hengende, rent visuelt hule-tak nær toppen av
  bildet, ingen kollisjon). Samme prinsipp som hullet mellom flis 2/3,
  bare i mindre skala og inni hver flis. **Bane 6 fikk samme
  hule-behandling samtidig** (se under), bakgrunnsfiksen og
  kant-avrundingen over gjelder fortsatt bare bane 5.
- `level6.lua` — **egen, prosedyregenerert bane, 2026-09-15.** Bygget
  rett med den ferdig fiksede generatoren fra bane 5 (riktig
  visningsskala, 40 kollisjons-linjestykker per flis, jevn
  "value noise"-kurve, luftlommer og hengende tak for hule-følelsen),
  bare med andre tilfeldighetsfrø så terrenget ser annerledes ut enn
  bane 5, og uten hullet mellom flis 2/3 (vanlig diagonal
  flis-cascade, ingen ekstra avstand mellom flisene, samme som bane
  1-4). Ny `lib/shapedefs6.lua`, byttet ut fra den delte, feile
  `lib/shapedefs.lua`. `del1`-formen (marken) kopiert uendret fra
  `lib/shapedefs4.lua`, identisk med bane 5 sin. Har IKKE fått
  bane 5 sin bakgrunnsfiks eller kant-avrunding ennå (de ble bedt om
  spesifikt for bane 5).

  **Runde til, samme dag (etter mer nettleser-testing):** fire separate
  rettelser i generator-scriptet, alle i `TIL-ORJAN.md` sin
  2026-09-15-oppføring "tak-kollisjon, pigger ved hullene, og gradert
  farge" i detalj. Kort: (1) `ceiling_curve()` regnet før helt
  uavhengig av `tile_curve()` (gulvet), og kunne dermed strekke seg
  LENGER ned enn gulvet enkelte steder (opptil 239px inni gulvet på
  det verste), som gjorde at marken landet oppå taket i stedet for på
  gulvet. Regner nå taket i forhold til gulvet, garantert minst
  `MIN_TUNNEL` (220px) klaring, eller fjerner taket helt der selv ikke
  det er plass. (2) Tak sin nedre klipp-grense hevet fra H*0.03 til
  H*0.05 for et tydeligere solid fjell-lag. (3) `apply_gap_taper()`
  skrevet om fra bunnen (femte forsøk, se kommentarene i selve
  scriptet for de fire mislykkede forsøkene før): hull-kanter avrundes
  nå med en ekte kvart-sirkel av fast radius (`FILLET_RADIUS`) som
  aldri senker gulvet mer enn radiusen, i stedet for å tynne gulvet
  til null tykkelse (som alltid ga et nål/pigg-utseende uansett hvor
  glatt avrundingen matematisk var). Antall hull per flis varierer nå
  (1-3, var alltid 2), bredden varierer (70-130px, var alltid 100px),
  og et tredje, finere støy-lag er lagt til gulv-kurven for mindre
  mekanisk utseende. (4) `_shade()` byttet til `_shade_by_distance()`:
  bruker en ekte 2D-avstandstransform (nærmeste gjennomsiktige piksel i
  alle retninger, ikke bare rett opp) for rim/fill-fargeovergangen,
  målt direkte mot `level4/2.png`, som pakker rim-fargen rundt ALLE
  eksponerte kanter (hull, undersiden av taket) i stedet for bare den
  øverste gulv-flaten. Regenererte alle åtte `level5/6/1-4.png` og
  begge `shapedefs5/6.lua`. Samme frø-mønster for bane 6 som før
  (`+1000` på alle nye støy-frø òg).

**Fargeprogresjon (mørkere jo lenger ut i spillet):** designprinsipp
fra Mathias, hver bane skal være mørkere enn forrige, som å dra dypere
ned i en hule, men VELDIG gradvis, spilleren skal knapt merke det.
Målt presist fra bane 3/4 sin faktiske kunst (ikke bane 1, som er
opplæringsbanen og en outlier): dyp bakkefarge ~(38,14,1), kantfarge
~(63,27,4). Bane 5 sin farge er dette ett "mørke-steg" (faktor 0,98 på
rød/grønn kanal, satt ned fra en først altfor merkbar 0,85) mørkere,
bane 6 to steg (0,98²). Blåkanalen holdes på bunnivå (1) i stedet for
å skaleres videre ned, den store overgangen skjedde allerede mellom
bane 1 og 2 i den ekte kunsten. Se `TIL-ORJAN.md` for målingene.

**Luftlommene og taket, presisert:** luftlommene skal kun ligge inni
hver flis (aldri ved flis-skjøtene, det var allerede riktig), og deres
kanter skal være avrundet, ikke rette utstansinger (`apply_gap_taper()`
i generator-scriptet). Det hengende taket måtte i tillegg trekkes vekk
helt i starten av flis 1, markens faktiske startpunkt (verdenskoordinat
0,0) treffer lokal rad ~25 i bildet, rett der taket ellers ville
startet, så uten dette sto marken visuelt inni fjellet ved spawn
(`apply_ceiling_spawn_clearance()`). Se `TIL-ORJAN.md` for tallene.

**Kollisjonsformene, funnet ved å faktisk tegne dem oppå kunsten:**
`SEGMENTS_PER_TILE = 40` sine jevnt fordelte samplingspunkter (~96px
mellomrom) var bredere enn en luftlomme sin kant-avrunding (70px),
så ett enkelt linjestykke kunne gå fra normal bakkehøyde til bunnen
av bildet uten noe punkt innimellom, en høy tynn feilaktig SOLID
kollisjonsvegg tvers gjennom det som skulle være åpent rom. Fikset
med `_dense_grid()`: samme 40-punkts grunnfordeling, med ekstra tette
punkter presset inn rundt hver rask overgang (luftlomme-kanter,
kant-avrunding). Taket har nå også egne kollisjonsformer (var rent
visuelt før), samme trapes-teknikk speilvendt fra toppen (y=0) ned
til tak-kurven. Antall fixtures per flis gikk fra ~40 til over 130.
Se `TIL-ORJAN.md` for detaljene og hvordan feilen ble oppdaget
(et referansebilde med kollisjonsformene tegnet oppå kunsten).

**Tak-klaringen ved spawn, rettet på nytt:** forrige forsøk på
`apply_ceiling_spawn_clearance()` hadde riktig idé men et fortegn
baklengs i egen verifikasjon (regnet "tak-verdi minus markens rad" og
kalte positivt trygt, riktig sjekk er omvendt siden taket er solid
FRA toppen av bildet OG NED), så marken spawnet fortsatt 125 enheter
inni fjellet i praksis, til tross for en rapportert "trygg klaring".
Skrevet om til en flat, trygg sone (`SPAWN_CLEAR_FLAT`, tak presset
mot null) som dekker markens HELE kroppsbredde ved spawn (alle ni
kroppsdelene deler samme rad, kolonner ca 60-170), etterfulgt av en
lengre glidende overgang (`SPAWN_CLEAR_RAMP`) tilbake til normal
tak-dybde. Se `TIL-ORJAN.md` for hele regnefeilen og den nye,
kolonne-for-kolonne-sjekkede klaringen.

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
  `k.numUnlocked` (hvor mange baner som er åpne fra start) satt tilbake
  til **4** 2026-09-15 (sto til `k.totalLevels`/9, en midlertidig
  debug-overstyring fra en tidligere økt), etter at Ørjans egen nyere
  `ogt_lmdata.lua` bekreftet 4 som riktig verdi — det er nøyaktig så
  mange baner som faktisk er ferdige, se `level2.lua`-punktet lenger
  ned og "Kjente feil".
  `selectLevel()` sjekker nå liv FØR banen startes (2026-09-15, per
  Mathias): kunne før starte en hvilken som helst ulåst bane direkte
  fra banevalget selv med 0 liv, uten at reklame-for-liv-skjermen
  (`scenes/adoffer.lua`) noen gang ble vist — liv ble kun sjekket i
  pause-/dødsmenyen. Kaller `liv.lastliv()` (må lastes på nytt her,
  banevalget kan nås før noen bane er åpnet denne økten) og går til
  `scenes.adoffer` i stedet for valgt bane om `liv.erTom()`.

### Delte spillobjekter
- `perspective.lua` — kamerasystem (parallakse, lag), tredjepartsbibliotek
  ("Perspective" av Caleb P), urørt. Lag 1 av 8 er alltid fremst (tegnes
  sist av `Perspective.createView()`, siden løkka går `numLayers` ned
  til 1 og `view:insert()` legger til bakerst i lista). Pauseknappen
  (`knapp1`) legges i lag 2 med `parallaxRatio = 0` (så den ikke ruller
  med kameraet) i alle ni `levelN.lua`, men lag 2 lå likevel BAK lag 1
  der banen/marken/gulvet ligger, altså bak selve banen. Rettet
  2026-09-15 ved å legge til `camera:layer(2):toFront()` rett etter i
  alle ni banefiler (flytter kun rekkefølgen lag 2 tegnes i, endrer
  ikke hvilket lag noe tilhører eller rulle-oppførselen). Se
  `TIL-ORJAN.md`.
- `shapedefs.lua` — auto-generert av PhysicsEditor, kollisjonsformer. Se
  "Kjente feil".
- `liv.lua` — "liv" = spillerens liv/poengsum, lagres til fil
  (`system.pathForFile("liv.txt", ...)`, på HTML5 vedvarende
  nettleser-lagring). **Trekkes bare fra når du bruker en knapp i
  pause-/dødsmenyen (retry/main menu/levels), ikke av noe som skjer
  inni selve spillingen.** Ørjan bekreftet 2026-09-10: liv skal ha
  reell betydning (ikke ferdig kodet), og skal kunne nå null, da skal
  spilleren kunne se en reklame for å få liv tilbake (1 min reklame =
  1 liv, lang reklame = flere), eller heller starte på nytt fra bane 1
  om man ikke vil se reklame. Bugen som hindret telleren fra
  noensinne å nå null er fikset (`liv.endreliv()` la feilaktig til 2
  liv i stedet for å trekke fra ved siste liv). "Retry" i
  `pausemenu1.lua`/`dodmenu1.lua` sjekker nå `liv.erTom()`: har du
  liv igjen, restartes gjeldende bane; er du tom, går du i stedet til
  `scenes.adoffer` (ny fil, 2026-09-15, se "Splash-skjermer"), som
  viser reklame-for-liv-skjermen Ørjan beskrev. `liv.addToScore(val)`
  og `liv.new()` var begge tomme stubber fram til 2026-09-15, fylt inn
  til hhv. å legge til liv (reklame-knappene) og nullstille til fulle
  10 liv igjen (`adoffer.lua` sin "fortsett uten"-knapp, per Mathias:
  å starte helt på nytt bør gi fulle liv, ikke fortsatt 0). Reklamevisningen
  selv er fortsatt en PLACEHOLDER (nedtelling, ikke et faktisk
  SDK-kall), men resten av flyten (legg til/nullstill liv, lagre, gå
  videre til riktig bane) er ferdig kodet. Dødsskjermen
  (`showOverlay("dodmenu1")`) trigges
  fortsatt av noe helt separat: en fysikk-kollisjon mellom et
  "dod"-objekt og spillerens hode (`del9`), uavhengig av
  live-telleren.
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

1. ~~Delte kollisjonsformer~~ **Bane 1-4 løst 2026-09-14, bane 5-9
   fortsatt åpent.** `lib/shapedefs.lua` har bare ett sett former
   ("1"-"4"), sporet fra level1 sine bilder, men ble likevel brukt av
   ALLE baner — stemte bare for bane 1. Ørjan sendte en nyere versjon
   av spillet med egne, riktig sporede formsett for bane 2-4
   (`lib/shapedefs2.lua`/`shapedefs3.lua`/`shapedefs4.lua`, hentet inn
   sammen med nye bakke-bilder som formene faktisk hører sammen med).
   Bane 5-9 venter fortsatt på egne formsett i PhysicsEditor, ikke noe
   AI kan gjøre uten kildebildene i riktig verktøy.
2. **Plassholder-grafikk.** level5-9 deler fortsatt identiske
   banestykke-bilder (level1-4 har hver sine egne, ekte bilder siden
   2026-09-14). (Også i `TIL-ORJAN.md`.) Venter på ny grafikk for
   resten.
3. ~~"Neste bane"-knappen er hardkodet til level 2~~ **Fikset 2026-09-10,
   utvidet 2026-09-15.** Ørjan tok ikke stilling til denne spesifikt,
   men mest nærliggende var å la level2.lua-level9.lua gjøre som
   `level1.lua` alltid gjorde riktig: `goto2`-funksjonen viste
   `gotochooselevel` (tilbake til banevalg) i stedet for det
   hardkodede, buggede `showOverlay("gotolevel2")`. `gotolevel2.lua`
   mistet dermed sin eneste referanse og ble flyttet til `dod-kode/`.
   Mathias ba 2026-09-15 om at man i stedet skal gå automatisk videre
   til neste bane når man klarer en. `goto2` viser nå den nye
   `scenes/gotonextlevel.lua` i stedet for `gotochooselevel` direkte,
   den nye splashen går videre til neste bane (`lm.anotherLevel()`) og
   faller selv tilbake til `gotochooselevel` når siste bane er
   fullført. Ikke testet i faktisk nettleser ennå.
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
   overlay fortsatt vises.

   Første forsøk på å fikse det (`composer.hideOverlay()` rett før
   `removeScene()`, i samme funksjon) løste det IKKE, krasjet fortsatt
   med samme feilmelding ved retry etter en knekk-død (se punkt 5).
   **Fikset på nytt 2026-09-10**, denne gangen med en strukturell
   endring i stedet for å prøve å rekkefølge kallene riktigere: en ny
   mellomscene `scenes/gotoretry.lua` (samme mønster som
   `scenes/gotolevel1.lua`, se `TIL-ORJAN.md`) gjør at banen som skal
   restartes ALDRI rives ned mens dens egen meny fortsatt vises som
   overlay oppå den. Pausemeny/dødsmeny sin `resume()` gjør nå bare en
   helt vanlig `gotoScene("scenes.gotoretry", ...)` (Composer skjuler
   overlayen trygt for dette selv), og selve `removeScene()` +
   `gotoScene()` til gjeldende bane skjer først når mellomscenen er
   den aktive, uten overlay oppå seg. Rettet samtidig samme (hittil
   ubekreftede) latente bug i `gotolevel1.lua` sin egen `goto()`, som
   manglet en tilsvarende `removeScene()`.

   `gotoretry`-omveien virket (bekreftet: en ANNEN feilmelding kom nå
   i stedet, se under). **Fikset på nytt 2026-09-10, ny separat bug**:
   `level1.lua` (kun bane 1) har en "kjøletid"-effekt per kroppsdel
   (`onLocalCollision1`-`onLocalCollision9`): slår av delens egen
   kollisjonslytter ved landing, viser en støv-sprite i 1 sekund, slår
   lytteren på igjen når `transition.to()` sitt `onComplete` fyrer.
   `transition.to()` avbrytes ikke av at scenen skjules, så et retry
   midt i den ventetiden fikk `onComplete` til å fyre mot en kroppsdel
   som allerede var revet ned, krasj: "attempt to call method
   'addEventListener' (a nil value)". Fikset med `transition.cancel()`
   i `scene:hide` sin "did"-fase, i alle ni banefiler (kun `level1.lua`
   kan faktisk krasje slik, resten fikk den som forsiktighetsregel).

   Samme krasj kom likevel igjen. **Fikset på nytt 2026-09-10**:
   `transition.cancel()` i `scene:hide` kom for sent, den fasen skjer
   først når HELE gotoretry-overgangen (500ms fade) er ferdig, og en
   ventende støveffekt kunne fyre av `onComplete` midt i de 500ms'ene.
   Flyttet `transition.cancel()` til helt øverst i `resume()` i
   pausemeny/dødsmeny, altså i samme øyeblikk retry trykkes. La i
   tillegg til en `.stage`-sjekk (fjernede Corona-objekter har
   `.stage == nil`) rundt selve `addEventListener`-kallet i alle ni
   `del1`-`del9`-blokkene i `level1.lua`, som ekstra sikring uansett
   tidsvindu. Ikke testet i faktisk nettleser ennå.
5. ~~Marken skal kunne "knekke"~~ **Var faktisk allerede kodet, bare
   avslått. Fikset 2026-09-10.** Den forrige vurderingen her, at
   9-leddet-ormen manglet knekk-mekanikk helt, var feil. Mathias
   forklarte (fra Ørjan) hvordan den skal virke: hver kroppsdel har,
   i tillegg til sin egen physics body, et eget "knott"-kollisjonsobjekt
   weldet fast oppå, og når to NABO-knotter kolliderer (marken bøyd for
   hardt), skal motor-jointene mellom delene fjernes, blod-spriten vises,
   og dødsmenyen aktiveres. Fant at akkurat dette står ferdig implementert
   i `knekk(event)` i alle ni banefiler (knott1/knott2 opp til knott8/knott9,
   fjerner riktig `pivot_jointN`, spawner blod, kaller `goto` som viser
   `scenes.dodmenu1` etter 3 sekunder) — men selve
   `Runtime:addEventListener("collision", knekk)`-linja som faktisk kobler
   funksjonen til kollisjoner var kommentert bort i alle ni filer, så
   mekanikken kjørte aldri. Skrudd på. Opprydningen i `scene:hide` fjernet
   allerede lytteren riktig ved sceneskifte, så ingen ekstra opprydning
   trengtes.

   **Fungerte fortsatt ikke i bane 1.** `level1.lua` manglet i tillegg
   selve `knott1`-`knott9`-fysikkobjektene (usynlige sensorer weldet på
   hver kroppsdel) som `level2.lua`-`level9.lua` har, uten dem kunne
   ikke kollisjonssjekken i `knekk()` noensinne bli sann i bane 1.
   Kopiert inn fra `level2.lua` (kroppen er identisk mellom filene).
   Se `TIL-ORJAN.md`. Ikke testet i faktisk nettleser ennå.
6. **Dobbeltklikk for å gjøre marken slapp virket ikke.** Fant koden
   (`trykk_knapp` i `level1.lua`), den brukte `event.numTaps == 2` fra
   Runtime "tap"-eventet, som ikke ser ut til å synkroniseres pålitelig
   med HTML5-eksportens museklikk. I tillegg satte "touch ended"-fasen
   alltid motorene på igjen uansett, så selv om dobbeltklikket ble
   oppdaget ville neste berøring slått dem på igjen momentant.
   **Fikset 2026-09-10:** dobbeltklikk oppdages nå selv, ved å måle tid
   mellom to "began"-faser (300 ms vindu), og "ended" lar motorene være
   av når marken er slapp. Samme fiks i `level2.lua`-`level9.lua` også
   (delte nøyaktig samme buggede kode), ikke bare `level1.lua`.

   **Fulgt opp 2026-09-15:** samme 300ms-vindu-sjekk gjaldt begge veier,
   altså dobbeltklikk krevdes også for å gjøre marken stram igjen, ikke
   bare for å gjøre den slapp. Mathias: skal bare trenge ett klikk for
   å bli stram igjen. Endret til at ett enkelt klikk umiddelbart gjør
   marken stram når den allerede er slapp (ingen tidssjekk i det
   tilfellet), dobbeltklikk kreves fortsatt for å gjøre den slapp i
   utgangspunktet. Alle ni banefiler.
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
8. **"Klarer man banen går man ikke videre, det klikker bare" (funnet
   2026-09-15).** Alvorlig, sannsynligvis like gammel som spillet selv:
   `onCollision1` (mål-nådd-sjekken) i alle ni `levelN.lua` inneholdt
   `Runtime:removeEventListener(collision1)` — `collision1` er en
   udefinert global (skulle vært selve funksjonsnavnet
   `onCollision1`), så kallet kastet en Lua-feil hver gang målet ble
   nådd. `main.lua` sin `Runtime:addEventListener("unhandledError",
   ...)` fanger nettopp denne typen feil og skriver den bare til
   konsollen (undertrykker Solar2D sin egen synlige feilboks), så
   spilleren så ingenting skje. `del4.isSensor = false`,
   `lm.unlockNextLevel()` og `goto2()` (viser "neste bane") stod alle
   etter denne linja og ble dermed aldri kjørt. **Fikset**: byttet til
   riktig kall, `Runtime:removeEventListener("collision",
   onCollision1)`, i alle ni banefiler. Se `TIL-ORJAN.md` for
   fullstendig forklaring, inkludert hvorfor dette trolig også forklarer
   observerte "feilmeldinger" ved banefullføring uavhengig av antall
   liv igjen.

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
