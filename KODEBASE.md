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
  reklame-SDK ennå. **Utvidet 2026-09-15** med kjøp av forsøk, etter
  ønske fra Mathias: tre pakker (10 forsøk / 15 kr, 25 / 29 kr,
  100 / 79 kr) i tabellen `PAKKER` øverst i fila. Kjøpene er også
  PLACEHOLDER, en bekreft/avbryt-boks som sier rett ut at ingen betaling
  er koblet til spillet og at forsøkene er gratis. Både reklame og kjøp
  ender i `giForsokOgFortsett()`, som legger til forsøk
  (`liv.addToScore`), lagrer og går til `gotoretry`, så bare
  `visKjopPlaceholder()` skal byttes ut med et ekte `store.purchase(
  pakke.id )` den dagen produktene finnes. Priser og antall er tall uten
  dekning i noen butikk. Lagt ut i **to kolonner** (reklame til venstre,
  kjøp til høyre, "fortsett uten" i full bredde nederst) fordi
  innholdsflaten er liggende, se punkt 12 i "Kjente feil". Se
  `TIL-ORJAN.md` for detaljer.

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
> **VIKTIG, 2026-09-15, siste runde: bane 5 og 6 er tegnet på nytt med
> NYE former i bane 1-4 sin stil.** Historikken i to steg:
>
> 1. Først ble den prosedyregenererte grafikken kastet og erstattet med
>    kopier av ekte fliser fra bane 2/3/4, etter at Mathias sammenlignet
>    bildene: "5 og 6 ser ikke like bra ut, vil ha identisk bakke og tak
>    utseende som de første banene."
> 2. Så presiserte han hva han egentlig mente: "Jeg mente jeg ville ha
>    looken, ikke ren kopi. Så du må lage nye baner med samme look."
>    Kopiene er derfor også borte. Bane 5 og 6 har nå egne former, malt i
>    en stil som er **målt** ut av den ekte kunsten.
>
> Selve stilmodellen står i "Bane 5 og 6: stilmodellen" rett under
> `level6.lua`, og den er verdt å lese før man rører terreng i dette
> spillet. Kort: kunsten er to flate farger, ikke en gradering, og
> kantstreken ligger bare på vannrette kanter.
>
> **Alt som står om generator-scriptet, luftlommer, hengende tak,
> `ceiling_curve()`, `apply_gap_taper()` og fargemåling i avsnittene
> nedenfor er historikk** fra de tidligere forsøkene, beholdt fordi det
> forklarer hvorfor ting ble prøvd, men ingenting av det er i bruk nå.

- `level5.lua` — **egen bane, 2026-09-15.** Første
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

### Bane 5 og 6 etter byttet (2026-09-15, gjeldende)

Flisene og kollisjonsformene kommer nå rett fra bane 2/3/4. Ingen
generator er involvert lenger, og `level5.lua`/`level6.lua` selv er
uendret (de peker på samme filnavn som før):

| Plass | Bane 5 | Bane 6 |
|---|---|---|
| flis 1 | `level3/1.png` + `shapedefs3` sin `["1"]` | `level4/1.png` + `shapedefs4` sin `["1"]` |
| flis 2 | `level2/2.png` + `shapedefs2` sin `["2"]` | `level3/2.png` + `shapedefs3` sin `["2"]` |
| flis 3 | `level4/3.png` + `shapedefs4` sin `["3"]` | `level2/3.png` + `shapedefs2` sin `["3"]` |
| flis 4 | `level3/4.png` + `shapedefs3` sin `["4"]` | `level4/4.png` + `shapedefs4` sin `["4"]` |

Hver flis er hentet fra den PLASSEN den hadde i sin egen bane (flis 1
brukes som flis 1 osv.), fordi bakken starter og slutter i ulik høyde
avhengig av plass i rekka. Målte start- og slutthøyde på alle 16
håndtegnede flisene først, og kontrollerte at fallet fra én flis til
neste havner innenfor spennet som allerede finnes i bane 1-4 (673-5244
enheter). Kombinasjonene over gir 1144-3606, altså godt innenfor.
Kontrollerte også at marken ikke spawner inni fjell med de valgte flis
1-ene (`level1/1.png` ville gjort nettopp det, den er en flat plate helt
øverst, så den er ikke brukt).

Bildene er tonet ett hakk mørkere for bane 5 og to for bane 6 (samme
0,98-faktor per hakk som før, kun rød/grønn), som er den eneste
forskjellen fra originalkunsten. Det er gjort ved å endre selve
palett-tabellen i PNG-ene, så pikslene ellers er bit for bit like
originalen, og filene holder seg små (90-200 kB, mot 1,6 MB for de
prosedyregenererte).

Bane 5 har fortsatt den ekstra halve flis-lengden mellom flis 2 og 3
(`firkant3` i `level5.lua`), altså et bevisst hull. Med den nye kunsten
er spranget 3974 enheter bortover og 3751 nedover, som krever rundt 790
enheter/s fart ut fra kanten. Ikke testet i praksis, se `TIL-ORJAN.md`.

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

  **Visningen (`liv.hent()`) endret 2026-09-15**, per Mathias: tallet
  viser nå hvor mange forsøk du har igjen ETTER det du holder på med
  (`liv_igjen - 1`, aldri under 0), ikke den rå telleren. Står det 0 er
  dette siste forsøk, og dør du kommer reklame-skjermen. Før viste den
  "1" på siste forsøk, som fikk folk til å tro de hadde ett forsøk i
  bakhånd. Selve telleren og alt regnestykket rundt er uendret, kun
  visningen. `scenes/adoffer.lua` sier derfor "forsøk" og ikke "liv"
  på knappene sine, ellers ville "+1 liv" sett ut som om ingenting
  skjedde (telleren står på 0 både før og under det ekstra forsøket).
  Samme funksjon fikk samtidig en **retry-knapp**: trykk på
  livteller/markikonet, så spretter det opp en retry-knapp rett under
  (trykk igjen for å skjule den). Den gjør nøyaktig det samme som
  retry-knappen i pausemenyen, inkludert `liv.erTom()`-sjekken og
  omveien om `scenes.gotoretry`. Ligger her, altså ett sted for alle ni
  banene. `livText`/`livbilde` var utilsiktede globaler og er nå lokale,
  og den gamle telleren fjernes før en ny tegnes (banefilene kaller
  `liv.hent()` både med en gang og igjen etter tre sekunder, så det lå
  hele tiden to oppå hverandre).
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

### Bane 5 og 6: stilmodellen

Målt på tolv ekte fliser (bane 2, 3 og 4) 2026-09-15, og det er denne
modellen `level5/1-4.png` og `level6/1-4.png` er tegnet etter.

**Kunsten er to flate farger, ikke en gradering.**

| | farge |
|---|---|
| kropp | `rgb(38,14,1)` |
| kantstrek | `rgb(72,33,6)` |

Resten av paletten (25-49 indekser per fil) er blandinger mellom de to
og det gjennomsiktige. Flere forsøk på en glatt gradering lignet aldri,
og dette er grunnen.

**Kantstreken ligger bare på vannrette kanter.** Dette er det viktigste
enkeltpunktet, og det som ble bommet på i alle de tidligere forsøkene:

| kanten vender | andel med kantstrek |
|---|---|
| opp | 93 % (spenn 74-100) |
| ned | 92 % (spenn 78-100) |
| loddrett | 18 % (spenn 6-35) |

Legger man lik kantfarge rundt hele formen, ser steinen ut som en
utstanset plate i stedet for noe lys faller på ovenfra. Streken er
median 43 piksler dyp, p90 87.

**Formene** er alle bygget av én kloss: en skive med en toppkurve og en
bunnkurve. Høyt tårn er en smal tjukk skive, kile er en der toppen
stuper mens bunnen står (så massen spisser seg ut i en tunge), takskår
er en tynn fritt liggende skive, og hulemunn er en tjukk skive som
spisser seg ut over gulvet. Topp og bunn må IKKE gå parallelt, da blir
alt flate bånd uten karakter.

**Konturene** er en glattet tilfeldig gange med noen få bevisste knekk,
ikke summer av sinuser. Sinuser gir tette skvulp (cirka 150 px mellom
hver bølge); den ekte kunsten har lange sveip på 500-900 px.

Verktøyene som gjorde dette ligger ikke i repoet, de var
engangs-scripts. Tallene over er det som trengs for å gjøre det om
igjen.

**Kollisjonen** er 281 (bane 5) og 285 (bane 6) fixtures, rundt 70 per
flis, mot 67-308 i de ekte banene. Hver fixture er et trapes på 70 px
med hjørnene på skivens egen topp- og bunnkurve, så bilde og kollisjon
kommer fra de samme kurvene. Trapeser tynnere enn 14 px slippes, så de
hårtynne spissene på kilene er rent visuelle. Koordinatavbildning,
bekreftet mot bane 3 og 4 sine egne shapedefs:

    X = (bildepiksel_x - 1920) * 2
    Y = (bildepiksel_y - 1175.5) * 2

og hjørnene må ha positiv signert flate (alle 400 undersøkte fixtures i
`lib/shapedefs4.lua` har det).

**Målt spillbarhet:** takhøyde 852-1676 enheter, fall mellom fliser
1722-4523 (mot 673-5244 i bane 1-4), spawn har 893/910 px fritt fall,
dødslinje-klaring 600-632, hull i gulvet 186-414 enheter.

Bildene er lagret som palett-PNG med egen gjennomsiktighet per indeks,
samme format som den ekte kunsten, 79-97 kB per flis.

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
9. **Samme feilklasse, to til, funnet 2026-09-15 med `luacheck`** (som
   fanger feil variabelnavn/global-bruk, i motsetning til `luac -p` som
   bare sjekker syntaks — se `TIL-ORJAN.md` for hvordan den ble kjørt
   mot denne kodebasen, som bruker `goto` som funksjonsnavn):
   - `onCollision`/`onCollision1`/`onCollision2` var `local function`
     inni `scene:create`, mens `goSomewhere`/`goto`/`goto1`/`goto2`
     (fil-nivå, kjøres når banen lastes) refererte dem i sine egne
     `Runtime:removeEventListener()`-kall. Siden Lua avgjør
     variabel-referanser ved hvor i kildekoden de STÅR, ikke når koden
     kjører, pekte de referansene alltid på udefinerte globaler (alltid
     nil), ikke de faktiske lytterne — fjernet ingenting hver gang
     spilleren forlot banen (pause/død/fullført), nøyaktig den typen
     Runtime-lytter-lekkasje Solar2D advarer mot i punkt 7 over.
   - `eventTimer` (kroppsdel-knekk sin 3-sekunders forsinkede
     dødsskjerm-timer) var `local`, mens `pausemenu1.lua`/
     `dodmenu1.lua`/`gotomenu.lua` alle prøver å avbryte akkurat den med
     `timer.cancel(eventTimer)` når spilleren forlater banen på annen
     måte. Samme problem, denne gangen på tvers av FILER: de tre andre
     filenes kall traff alltid en egen, alltid udefinert global, aldri
     banens faktiske timer, så en ventende knekk-dødstimer kunne fyre
     av `goto()` flere sekunder etter at spilleren allerede hadde
     forlatt banen.

   **Fikset**: `onCollision`/`onCollision1`/`onCollision2`
   forhåndsdeklarert på fil-nivå (samme mønster som `trykk_knapp` i
   punkt 7), `eventTimer` gjort til bevisst global (`_G.eventTimer`,
   samme mønster som `_G.camera`/`_G.grp`). Alle ni banefiler. Bekreftet
   med `luacheck` at begge varselklassene er borte etter fiksen. Se
   `TIL-ORJAN.md` for hvilke andre `luacheck`-funn som ble sjekket og
   vurdert ufarlige (`scaleFactor`, `rot`, `reff`, `angel`, `punktsant`,
   `stovteller1-9`, `last`).
10. **Dødssonen tok slutt før banen gjorde (funnet 2026-09-15).**
    `dod`-objektet, som er det eneste som utløser dødsmenyen når man
    faller, er ETT rektangel på 70000x50 rotert 31,48 grader, altså én
    lang, men endelig, diagonal linje under banen. Regnet ut at den
    slutter ved x = 28409, mens siste flis slutter ved x = 30380 og
    målet (`mal2`) står ved x = 31000: de siste ~2600 enhetene av hver
    bane, nøyaktig der man er når man holder på å fullføre, hadde ingen
    dødssone i det hele tatt. Falt man av bakken der, falt marken videre
    i det uendelige uten at dødsmenyen kom (meldt av Mathias for bane 2,
    men gjelder alle ni). **Fikset** med en `enterFrame`-sjekk i alle ni
    banefiler: finner flisa marken er over og utløser vanlig død
    (`goto()`) om den har falt under underkanten av den flisa, eller er
    kommet en flisbredde utenfor første/siste flis. `dod` er urørt, den
    tar fortsatt de vanlige tilfellene raskere. Et første forsøk med én
    felles skrå linje under alle flisene ble målt mot den ekte
    bakke-kunsten og forkastet: den lå 160-170 enheter OVER bakken på
    slutten av bane 1 og 3 (en rett linje gjennom flis-sentrene skjærer
    opp i flisene i venstre halvdel av hver flis), altså død uten grunn.
    Per-flis-grensen er verifisert kolonne for kolonne mot alle 36
    bakke-bildene: minste klaring til bakken er 864 enheter, positiv
    overalt.

11. **Reklame-/kjøpsskjermen sendte spilleren til feil bane, eller til
    en bane som ikke finnes (funnet 2026-09-15).** `scenes/adoffer.lua`
    sender spilleren tilbake i banen via `scenes.gotoretry`, som starter
    `lm.currentLevel`. Den settes av hver `levelN.lua` når banen åpnes.
    Men liv-sjekken som ble lagt inn i `selectLevel()`
    (`lib/ogt_levelmanager.lua`) tidligere samme dag returnerte til
    `scenes.adoffer` FØR linja `k.currentLevel = event.target.levelNum`.
    Valgte man bane 4 med 0 liv og så reklame eller kjøpte forsøk, havnet
    man derfor i den banen man spilte sist. Rett etter appstart, der
    `k.currentLevel` fortsatt står på startverdien 0 (`ogt_lmdata.lua`),
    ble målet `scenes.level0`, som ikke finnes, og man fikk den røde
    feilboksen fra `pcall`-innpakningen. **Fikset** ved å flytte
    `k.currentLevel`/`k.displayText` opp FØR liv-sjekken, så valget
    huskes uansett hvilken vei `selectLevel()` går ut.

12. **Innholdsflaten er 960 x 540, ikke 540 x 960 (fallgruve, ikke en
    feil i spillet).** `config.lua` sier `width = 540, height = 960`,
    men `build.settings` har `orientation.default = "landscapeRight"`,
    og Corona bytter om innholdsflaten i landskap. Ved kjøring er
    `display.contentWidth` = 960 og `display.contentHeight` = 540.
    Leser man tallene rett ut av `config.lua` og legger noe på y = 700,
    havner det utenfor skjermen. Det skjedde med første utgave av
    kjøpspakkene på `scenes/adoffer.lua` 2026-09-15: to av tre pakker og
    "fortsett uten" var usynlige. Bekreftet ved måling på et skjermbilde
    fra Mathias: knappene var 956 piksler brede der 520 enheter skulle
    bli det (1,835 px/enhet), synlig flate 1393 x 642 enheter, og
    forskyvningen på 51 enheter er `display.screenOriginY` for
    letterbox-kanten (540 + 2 x 51 = 642). **Regel:** bruk alltid
    `display.contentWidth`/`display.contentHeight`, aldri tallene fra
    `config.lua`. Skal noe dekke hele den synlige flaten inkludert
    letterbox-kantene, bruk
    `display.viewableContentWidth - display.screenOriginX * 2` (samme
    uttrykk som `gotoretry.lua` bruker, verifisert mot målingen over).

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
