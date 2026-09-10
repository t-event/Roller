# Til Ørjan

Hei Ørjan! Mathias delte Dropbox-mappen din (NewNewNew Roller) og ba AI se
hva som kunne gjøres med spillet. Denne fila er en logg over alt som er
gjort med koden din, i vanlig språk, oppdatert etter hvert.

## Husk før dette regnes som ferdig

- **Lås banene igjen, når Ørjan sier fra.** `ogt_lmdata.lua` har
  `k.numUnlocked` satt til 9, og `ogt_levelmanager.lua` har en direkte
  override (`for x = 1, k.totalLevels do k.levelLocked[x] = false end`,
  rett før `levelInfo.locked = k.levelLocked`) som tvinger alt ulåst
  uansett lagret fremgang. Begge er merket "TEMP for debugging".
  Ørjan bekreftet 2026-09-10 at banene skal holdes åpne ENDA, for
  fortsatt testing, så dette er bevisst latt urørt. Ikke fjern før han
  sier fra at testingen er ferdig, ellers er hele bane-progresjonen i
  spillet meningsløs.
- **Fjern feilsøkings-sjekkpunktene.** `checkpoint(...)`-kallene i
  `main.lua`, `level1.lua`, `menu.lua`, `ogt_levelmanager.lua`, og
  pcall-innpakningene i `gotolevel1.lua`/`gotomenu.lua`/
  `gotochooselevel.lua`/`pausemenu1.lua` var midlertidige for å finne
  krasjer. Trygge å la stå (de gjør ingenting skadelig), men ryddigst
  å fjerne når alt fungerer. `dodmenu1.lua` fikk aldri samme
  sikkerhetsnett som `pausemenu1.lua` (se 2026-09-10-oppføringen under),
  vurder å legge det til der også hvis feilsøkingen fortsetter, ellers
  er det ikke noe å fjerne der.

## 2026-09-09

- **Hentet hele mappen fra Dropbox og lagt den i et eget GitHub-repo**
  (`t-event/roller`, privat). Alt er kopiert uendret, ingenting er
  omskrevet eller "ryddet opp i". 306 filer, ca 28 MB, alt kom med:
  all Lua-koden, ssk2-biblioteket du bygde på, og all grafikk/lyd.
- **Sjekket at koden fortsatt er hel** etter overføringen. Alle 142
  Lua-filene er syntaktisk gyldige (ingen skrivefeil eller skader).
  Krysset også alle bilde-/lydreferanser i koden mot filene som faktisk
  ligger i mappen: 855 referanser sjekket, 43 "mangler" — men de ser ut
  til å være rester fra før spillet var ferdig (f.eks. `Brett1.png`,
  `verden6/7/8.png`), altså noe som aldri fantes i mappen vi fikk, ikke
  noe som gikk tapt nå.
- **Satt opp en automatisk nettleser-versjon.** Mathias har iPhone, du har
  Android, og Solar2D-spill kjører ikke rett fra en lenke som en
  nettside normalt gjør. Løsningen: en GitHub Actions-jobb
  (`.github/workflows/build-html5.yml`) som bygger spillet om til HTML5
  med Solar2Ds eget byggeverktøy (CoronaBuilder) og publiserer det på
  GitHub Pages. Når det er satt opp, kan hvem som helst åpne
  `https://t-event.github.io/Roller/` i en vanlig nettleser på telefon
  eller PC, ingen installasjon.
- **Første forsøk på HTML5-bygget feilet, funnet og fikset.**
  CoronaBuilder krasjet med en nil-feil (`webPackageApp.lua:165`) fordi
  den prøvde å finne en fil (`webtemplate.zip`) via en snarvei som bare
  opprettes når Solar2D er installert og kjørt normalt på en maskin, noe
  en fersk GitHub-runner aldri har gjort. Løste det ved å pakke ut
  disk-imaget lokalt og se hvor filen faktisk lå, og pekte
  byggeoppskriften rett på den i stedet for å stole på snarveien.
- **Andre forsøk hang i over 15 minutter** uten output eller feil, mest
  sannsynlig fordi CoronaBuilder prøver å nå en gammel
  aktiverings-/lisensserver fra da Corona SDK var kommersielt, som ikke
  svarer lenger. Avbrøt kjøringen og la inn en vaktbikkje som dreper
  byggeprosessen etter 8 minutter og feiler tydelig i stedet, pluss en
  hard 20-minutters grense på hele jobben som siste sikkerhetsnett.
  Tredje forsøk kjører nå.
- **Gjort repoet offentlig** (var privat) fordi GitHub Pages på gratis
  konto krever offentlig repo. Betyr at hele koden og grafikken din nå
  er synlig og klonbar for alle på nett, verdt å vite.
- **Tredje forsøk drept av vaktbikkja etter 8 minutter**, fortsatt uten
  noen feilmelding. Gravde i Solar2D sin egen kildekode og fant den
  egentlige forklaringen: et modul som brukes til å hente
  tredjeparts-plugins overskriver den globale loggefunksjonen med en
  stille versjon med mindre man eksplisitt ber om detaljert logging. Så
  det trenger ikke ha hengt i det hele tatt, det kan ha jobbet helt
  stille i bakgrunnen. Skrudde på detaljert logging og ga det mer tid
  (15 min vaktbikkje, 25 min jobbgrense) for å se hva som faktisk skjer.
- **Fjerde forsøk fortsatt helt stille i 15 minutter**, selv med detaljert
  logging på. Det viste at forrige forklaring var feil, den detaljerte
  loggingen jeg skrudde på traff ikke koden som faktisk kjørte. Leste
  meg videre gjennom Solar2Ds kildekode og fant den ekte årsaken: det
  monterte Solar2D-disk-imaget (`Util/S2D`) lå inni selve prosjektmappen,
  og HTML5-byggeverktøyet kopierer *alt* i prosjektmappen inn i spillet
  som ressurser. Det prøvde altså å kopiere hele det ~270MB store
  SDK-et (Android/iOS-verktøy, Java-runtime, Xcode-maler) inn i spillet
  ditt, filbyte for filbyte. Så det hang ikke, det gjorde en enorm feil
  jobb. Samme problem gjaldt outputmappen. Flyttet begge utenfor
  prosjektmappen. Femte forsøk kjører nå, forventer at dette er det som
  faktisk løser det.
- **Femte forsøk lyktes, på 50 sekunder.** Bekrefter at problemet
  virkelig var mappestrukturen, ikke noe med selve spillet eller koden
  din. `gh-pages`-grenen ble opprettet automatisk med den ferdige
  nettleser-versjonen. Spillet ligger nå på
  `https://t-event.github.io/Roller/` (kan ta et par minutter etter at
  Pages er slått på i repo-innstillingene før lenken virker første
  gang).
- **Siden lastet, men krasjet med det samme.** "attempt to call method
  'addEventListener' (a nil value)" rett ved oppstart, dette er
  Solar2Ds egen standard krasjskjerm, ikke noe fra spillets egen
  feilhåndtering (den var ikke satt opp enda når krasjet skjedde).
  Mistenker `ssk.meters.create_fps`/`create_mem` i `main.lua` (linje
  8-9), de kaller `Runtime:addEventListener` og
  `objekt:addEventListener("touch")` synkront, før feilhåndtereren i
  linje 29 er klar, og HTML5-målet i Solar2D har kjente hull
  sammenlignet med iOS/Android. Dette er bare et FPS-/minnebruk-overlay
  for feilsøking, ikke noe spillet trenger, så jeg skrudde det av kun
  for HTML5 (andre plattformer er urørt). Nytt bygg kjører nå, venter
  på bekreftelse fra Mathias om det faktisk løste det.
- **FPS-/minne-fiksen virket, men avdekket et nytt krasj lenger inn.**
  "attempt to index a nil value" inne i Solar2Ds `composer`-bibliotek
  sin egen `gotoScene`/`dispatchEvent`, altså i selve
  scenebytte-mekanismen når `gotolevel1`-scenen skal vises første gang.
  Fortsatt bare "?" i stedet for filnavn/linjenummer i feilmeldingen,
  så la til `settings.build.neverStripDebugInfo = true` i
  `build.settings` for å beholde den informasjonen i bygg fremover.
  Nytt bygg kjører nå, forventer en mye mer presis feilmelding neste
  gang.
- **Nytt bygg publisert** (47 sekunder), nå med filnavn/linjenummer i
  feilmeldinger. Venter på at Mathias tester siden og limer inn den nye
  feilmeldingen.
- **Notat fra deg (via Mathias): bare 4 av de 9 banene er ferdige.**
  Bra å vite når vi etter hvert kommer forbi oppstartskrasjen og skal
  teste selve spillingen, level 5-9 er trolig ikke noe å bruke tid på å
  feilsøke.
- **Presis feilmelding kom, og den var faktisk fiksbar!**
  `bad argument #2 to 'newImageSheet' (... width og height ...)`, i
  `gotolevel1.lua` sitt sprite-ark for splash-animasjonen (`last.png`).
  Målte den faktiske PNG-fila direkte: 3600×1080 piksler, et 3×2-rutenett
  á 1200×540. Koden oppga aldri hvor stort hele arket er, bare
  rutestørrelsen, og Solar2D klarte tydeligvis å gjette riktig på
  telefonen din men ikke på web. La til `sheetContentWidth`/
  `sheetContentHeight` (den robuste måten å gjøre dette på), samme
  kopierte kodesnutt fantes i 12 filer (alle `gotolevelN.lua`,
  `gotomenu.lua`, `gotochooselevel.lua`, `ogt_levelmanager.lua`),
  rettet alle. Nytt bygg kjører nå.
- **Sprite-ark-fiksen virket, men et nytt krasj lenger inn:**
  `module 'ssk2.display.layers' not found: not enough memory` under
  `ssk.init()`. "Ikke nok minne" er et ekte signal, ikke bare en
  feiltekst, nettleser-versjonen kjører i en begrenset minnepakke
  (WebAssembly). Fant at ssk2-biblioteket ditt allerede har en
  innebygd HTML5-modus (`_G.HTML5_MODE`) som skrur av et par moduler
  som bruker filsystemtilgang som ikke gir mening i en nettleser, men
  `main.lua` brukte den aldri. Slått på nå
  (`ssk.init({ html5 = true })`). Nytt bygg kjører, usikker på om det
  er nok alene siden dette kan være en reell minnegrense i
  nettleser-målet, ikke bare denne ene tingen.
- **Nytt bygg publisert.** Venter på at Mathias tester på nytt.
- **Notat fra deg (via Mathias):** du husker at én fil ikke klarte å
  ha alle banene under selve utviklingen, og måtte deles opp (derfor
  egne `levelN.lua`-filer per bane i stedet for én stor fil). Trolig
  ikke samme begrensning som minnekrasjen over (den skjer i
  ssk2-biblioteket, ikke i banefilene), men bra å vite at prosjektet
  har støtt på slike grenser før. Kan bety flere lignende overraskelser
  dukker opp etter hvert som vi kommer lenger inn i spillet.

- **Minnekrasjen er borte, spillet kjører nå gjennom oppstarten!**
  Mathias melder at "skjermen glitcher" i stedet for en krasjmelding,
  altså et rent visuelt problem nå, ikke en feil som stopper koden.
  Ber om skjermbilde/opptak for å kunne se hva som faktisk skjer før
  jeg gjetter på en fiks.
- **"Glitchen" var ikke en feil.** Spillet er laget for liggende
  skjermorientering, men en nettside kan ikke tvinge telefonen din til
  å rotere slik en ekte app gjør, den bruker uansett hvordan du holder
  den. I stående modus blir spillet "letterboxet" ned til en tynn
  stripe for å beholde riktig størrelsesforhold. Løste seg av seg selv
  ved å rotere telefonen til liggende.
- **Nytt krasj etter rotering:** samme type feil som tidligere
  ("attempt to index a nil value"), nå i selve `level1.lua` når
  splash-animasjonen bytter til den ekte banen. `scene:create`-
  funksjonen der er over 2000 linjer, umulig å lese seg fram til
  presist uten linjenummer. Fant også at
  `neverStripDebugInfo`-innstillingen jeg la til aldri kunne virket for
  HTML5 uansett, det er en begrensning i Solar2Ds kommandolinje-
  byggeverktøy (fungerer bare via Simulator-appens egen "Bygg for
  web"-dialog, som vi ikke kan bruke i en automatisk byggejobb).
  Løsning: satte inn 9 usynlige "sjekkpunkter" spredt gjennom
  funksjonen og fanget opp krasjet slik at feilmeldingen og siste
  sjekkpunkt vises direkte på skjermen. Midlertidig feilsøkingskode,
  fjernes når krasjet er funnet. Nytt bygg kjører nå.
- **`level1` lastet faktisk denne gangen!** Mathias kom inn i selve
  banen og fikk opp pausemenyen, men krasjet (samme feiltype) da han
  trykket "main menu" der. Det er en annen kjede
  (`pausemenu1.lua` → `gotomenu.lua` → `menu.lua`) enn den vi allerede
  hadde sjekkpunkter i. Utvidet samme teknikk dit: fanget opp
  scenebyttene i `pausemenu1.lua` og `gotomenu.lua`, og la 6
  sjekkpunkter i `menu.lua` sin `scene:create` (kortere fil, 200
  linjer). Nytt bygg kjører nå.
- **Sjekkpunkt-overlayet funket, og fant en ekte bug!** Etter litt fram
  og tilbake med tilsynelatende ustabil visning (bare mellomlagring i
  Safari som måtte tvinges på nytt) viste skjermen tydelig:
  `Checkpoint: menu:after_camera_scale`. Rett kode: `menu.lua` lastet
  `"bg1.png"` fra rota, men filen ligger faktisk i `background/`-mappen.
  Samme kopier-lim-inn-feil fantes i `level2.lua`, `level3.lua` og
  `level4.lua` (dine fire ferdige baner), bakgrunnsbilder manglet
  `background/`-prefikset og banespesifikke bilder (1-4.png) manglet
  sitt eget `levelN/`-prefiks, noe `level1.lua` hadde riktig. Rettet
  alle fire filene likt. Sjekket samtidig at `brett.lua`, `menu1.lua`,
  `options.lua` og `play.lua` (som også har knuste bildereferanser) er
  død kode som aldri nås i spillet, rørte ikke de. Nytt bygg kjører nå,
  dette kan faktisk være den siste brikken.

- **Notat fra deg om N.png-mønsteret:** i banemappene (`level1/`,
  `level2/` osv) tilsvarer `1.png` bane 1, `2.png` bane 2, og så
  videre, det bekrefter at fiksen over (hver banefil skal peke på sin
  egen `levelN/`-mappe, slik `level1.lua` allerede gjorde riktig) var
  riktig retning.

- **Låst opp alle 9 banene midlertidig** (`k.numUnlocked` i
  `ogt_lmdata.lua`, var 1, satt til 9) slik at Mathias kan teste
  banene direkte uten å spille seg gjennom dem. Husk å sette denne
  tilbake til 1 når feilsøkingen er ferdig.

- **Mathias meldte at level 2 sin bakgrunn ikke stemmer med hvor
  ballen faktisk kolliderer med gulvet.** Dette er IKKE en
  porteringsbug, det ville sett likt ut på Android. `shapedefs.lua`
  har bare ett sett usynlige kollisjonsformer kalt "1", "2", "3", "4"
  (sporet av PhysicsEditor fra ett bestemt bilde), men `level1.lua`,
  `level2.lua`, `level3.lua` og `level4.lua` bruker alle sammen akkurat
  de samme fire formene, selv om hver bane har sine egne bakkebilder
  (`level1/1.png`, `level2/1.png` osv). Kollisjonen stemmer bare med
  bildet den opprinnelig ble sporet fra (sannsynligvis level 1, siden
  den fungerer perfekt), de andre banene får feil usynlig gulv i
  forhold til bildet de faktisk viser. Krever at du sporer formene på
  nytt i PhysicsEditor per banebilde, eller sier fra om bildene egentlig
  skal ha samme grunnform som level 1 sitt (da er det noe annet som er
  galt). Ikke noe jeg kan gjette meg fram til selv.
- **Bekreftet med filsjekksummer: `level2/` til `level9/` bruker
  helt identiske bilder** (samme MD5 på 1.png, 2.png, 3.png, 4.png i
  alle åtte mappene), mens `level1/` har sine egne, unike bilder. Bare
  bane 1 har ferdig, tilpasset grafikk, de åtte andre deler ett og
  samme plassholder-sett. Forklarer sannsynligvis hele
  "feil bakgrunn på bane 2"-observasjonen: det er ikke en kodefeil,
  det er kunst som aldri ble laget ferdig per bane.

- **🎉 "Main menu"-krasjen er fikset, bekreftet av Mathias.** Spillet
  går nå hele veien fra oppstart, gjennom en bane, til pausemeny og
  tilbake til hovedmeny uten å krasje. Neste: Mathias melder at
  bane 2 ikke har riktig bilde der banen faktisk er, sannsynligvis en
  liten, ufarlig content-bug (feil banelayout-bilde), ikke noe som
  stopper spillet. Ser nærmere på det.

- **2026-09-10.** Nytt krasj funnet: "retry"-knappen i pausemenyen
  krasjet etter tredje forsøk (samme addEventListener-feil). Den
  eneste av pausemenyens tre knapper som ikke allerede var fanget opp
  med sikkerhetsnettet vårt, siden problemet med "main menu" og
  "levels" knappene ble oppdaget først. Lagt til samme fangst der.
  Nytt bygg kjører nå. Neste feilmelding bør vise nøyaktig sjekkpunkt.

- **2026-09-10, samme dag.** Nok et krasj etter to retry-trykk, men
  denne gangen med den vanlige Solar2D-varselboksen, ikke vår røde
  sjekkpunkt-boks. Det var nøkkelen: krasjen skjedde IKKE inni
  `pcall`-en rundt `composer.gotoScene` i `pausemenu1.lua` (den fanger
  fint), men et sted composer selv styrer bak kulissene, utenfor det vi
  hadde satt sikkerhetsnett rundt.

  Fant roten: `gotolevel1.lua`, `gotomenu.lua` og `gotochooselevel.lua`
  kalte alle `composer.removeScene(...)` på seg selv i `scene:hide`
  sin **"will"**-fase i stedet for **"did"**. "Will" skjer i det
  overgangsanimasjonen starter, ikke når den er ferdig, så
  `removeScene()` der river ned scenens visningsgruppe og laster ut
  Lua-modulen mens composers egen fade/overgang fortsatt jobber mot den
  samme gruppa. `gotolevel1` er splash-skjermen retry-knappen alltid
  går via, så hver retry gjentok akkurat dette, og etter et par runder
  endte composers interne tilstand opp korrupt nok til å krasje dypt
  inne i selve composer-biblioteket, langt fra våre pcall-er. Flyttet
  `removeScene()`-kallet til "did"-fasen i alle tre filene (etter at
  overgangen faktisk er ferdig), som er slik composer selv sier den
  skal brukes. Samme fiks i `gotolevel2.lua`, som har nøyaktig samme
  kopierte feil.

  **Ekstra funn i `gotolevel2.lua`, ikke rørt ennå:** utenom
  "will/did"-bugen har filen to andre feil som ser ut som rester fra
  kopiering av `gotolevel1.lua`, print-tekstene sier fortsatt
  "gotolevel1" og filen går videre til `"level1"` (linje 42) i stedet
  for `"level2"`, og kallet på linje 104 fjerner scenen `"gotolevel1"`
  i stedet for `"gotolevel2"`. Kombinert med den fra før dokumenterte
  "neste bane"-bugen (alltid `gotolevel2`, uansett bane) betyr dette at
  hele splash-skjermen mellom en fullført bane og neste bane trolig
  aldri har fungert som tiltenkt. Rørte den ikke nå, siden det henger
  sammen med den større, allerede kjente "neste bane"-bugen og bør
  fikses samlet, ikke gjettes fram til stykkevis.

## 2026-09-10, grundig linje-for-linje gjennomgang av hele koden

Gikk gjennom samtlige 61 egne Lua-filer (alt utenom `ssk2/`) på nytt,
denne gangen faktisk lest, ikke skummet: diff mellom filer som skal
være like, grep etter reelle referanser i stedet for å stole på gamle
notater, og sjekket at asset-filene som refereres faktisk finnes på
disk. Bekreftet det meste av det som allerede sto i dette dokumentet
og i `KODEBASE.md`, men fant noen nye ting:

- **`mark.lua` sin `mark.hent()` blir aldri kalt.** Både `menu.lua` og
  `level1.lua` gjør `require("mark")` og fanger opp `mark.hent`-
  funksjonen i en lokal variabel, men ingen av dem faktisk *kaller*
  den. I stedet har `level1.lua` ca 90-100 linjer kopiert kode som
  bygger spillerkroppen (`del1`-`del9`) rett inn i fila selv, samme
  mønster som det ferdig-dokumenterte kaoset i `hoydehopp.lua`/
  `game.lua`. `mark.lua` er dermed i praksis dødt, bortsett fra at
  `require`-kallet kjører harmløst. Rørte den ikke, siden jeg ikke vet
  om du planla å faktisk ta den i bruk igjen.
- **"Liv" (livene i spillet) kan aldri nå null.** I `liv.lua`,
  `liv.endreliv(val)`: når `liv_igjen == 1`, LEGGER funksjonen til 2
  liv i stedet for å trekke fra, så sekvensen blir 3→2→1→3→2→1→... i
  det uendelige. Og siden `liv.endreliv(1)` bare kalles fra
  "retry"/"main menu"/"levels"-knappene i pause- og dødsmenyen (aldri
  fra selve spillingen), og ingenting noe sted sjekker
  `liv.returnScore()` mot null for å faktisk avslutte spillet, er
  live-telleren per nå bare et tall som vises, uten konsekvens. Selve
  "du døde"-skjermen (`showOverlay("dodmenu1")`) trigges av noe helt
  annet: en kollisjon mellom et "dod"-objekt (faren) og hodet på
  ormekroppen (`del9`), se `level1.lua` rundt linje 1080-1103. Ikke
  rørt, siden jeg ikke vet om liv-systemet er ment å faktisk bety noe
  ennå eller er en bevisst "kan ikke tape ennå"-sikring mens resten
  bygges ferdig.
- **`dodmenu1.lua` mangler samme sikkerhetsnett som `pausemenu1.lua`.**
  Alle tre knappene der (`resume`/`resume1`/`resume3`, altså retry/
  main menu/levels) kaller `composer.gotoScene(...)` helt direkte, uten
  `pcall` og uten sjekkpunkt. `dodmenu1.lua` er dødsskjermen for ALLE
  ni baner, akkurat som `pausemenu1.lua` er pauseskjermen for alle ni,
  og den navigerer til nøyaktig de samme stedene
  (`gotolevel1`/`gotomenu`/`gotochooselevel`) som fikk "will/did"-fiksen
  i dag. Rot-årsaken er nå fikset uansett, men hvis noe nytt krasjer
  langs denne veien, vil du ikke få en rød sjekkpunkt-boks fra
  dødsskjermen slik du ville fått fra pauseskjermen. Verdt å legge til
  samme mønster her hvis dere fortsetter feilsøkingen.
- **`ogt_levelmanager.lua` lekker en sprite for hver banevelging.**
  `k.beforeLeaving()` (kalt rett før du går inn i en bane fra
  banevalg-rutenettet) lager en ny splash-sprite
  (`last = display.newSprite(...)`, global variabel) og spiller den,
  men opprydningen er kommentert bort (`--display.remove( last )`,
  `--last = nil`). Hver gang du velger en bane fra rutenettet blir det
  ett usynlig (eller kanskje ikke usynlig?) objekt til liggende igjen.
  Ufarlig i en kort testøkt, men kan bli mange objekter over en lang
  spilløkt med mye fram-og-tilbake til banevalget.
- **Selve banevalget mangler sikkerhetsnettet.** Den faktiske
  scenebytte-linja når du trykker en banerute
  (`sceneMgr.gotoScene(newScene, ...)` inni `selectLevel` sin `goto()`
  i `ogt_levelmanager.lua`, rundt linje 166) har ingen `pcall`. Resten
  av kjeden dit (pausemeny → `gotochooselevel` → `chooselevel` →
  `ogt_levelmanager.lua` sin `init`/`makeGrid`) ble instrumentert i går,
  men selve trykket på banen ble stående ubeskyttet.
  `ogt_levelmanager.lua` har forøvrig egne sjekkpunkt-kall
  (`checkpoint("ogt_lm:...")`, 4 stykker) som heller ikke sto nevnt i
  "husk før dette regnes som ferdig"-lista øverst i dette dokumentet,
  lagt til der nå.
- **`level6.lua` til `level9.lua` er bokstavelig talt 100 % identiske
  filer**, bekreftet med `diff` (null forskjell, ikke bare samme
  bilder). Og nå med konkrete detaljer på hvorfor bildene deres er
  knuste: de refererer bilder UTEN mappe-prefiks
  (`"back_cave.png"`, `"dirt1.png"`, `"1.png"`-`"4.png"`), mens de
  faktiske filene bare finnes under `background/` og under sin egen
  `levelN/`-mappe (`background/back_cave.png`, `level5/1.png` osv).
  `level2.lua`-`level4.lua` har IKKE denne bugen, de bruker riktige
  stier. Dette bekrefter og konkretiserer det som sto i `KODEBASE.md`
  fra før, ikke noe overraskende nytt, men nå med eksakte stier å
  rette hvis/når disse banene prioriteres.
- **To dødekode-filer har byttet om egne interne navn.** `game.lua`
  (til tross for filnavnet) inneholder en gammel `liv`-modul
  (`liv_igjen`, `liv.txt`, kaller udefinerte `saveScore()`/
  `loadScore()` — ville krasjet hvis den noensinne ble brukt).
  `livddadas.lua` (til tross for SITT filnavn) inneholder i stedet en
  gammel `game`-modul (`score.txt`, `high_score`, fungerende internt).
  Begge er fortsatt 100 % ubrukte og urørt, men verdt å vite om navnet
  lurer deg hvis du noen gang vurderer å gjenopplive en av dem.
- **To mindre bugs i allerede-død kode**, kun for katalogens skyld:
  `options.lua` sjekker `if event.phase == began then` (linje 67) uten
  anførselstegn rundt "began", så den sammenligner mot en udefinert
  global variabel (alltid usann) — "rask meny"-hjørnet ville aldri
  reagert selv om fila var i bruk. `brett.lua` bygger en riktig
  `options`-tabell for overgangseffekt, men sender i steden den
  udefinerte globalen `brett` til `composer.gotoScene()` (linje 27),
  så tilbake-knappen ville alltid brukt standard-overgang. `brett.lua`
  har også tre av fire banetile-knapper som peker til scener
  (`"play2"`, `"play3"`, `"play4"`) som ikke finnes noe sted i
  prosjektet i det hele tatt, bare `"play"` (→ `play.lua`) er reell.

## Død kode (finnes i repoet, men brukes aldri)

**Oppdatering 2026-09-10:** alle disse filene, pluss `pausemenu2.lua`-
`pausemenu9.lua`, `dodmenu2.lua`-`dodmenu9.lua`, `gotolevel3.lua`-
`gotolevel9.lua`, `game.lua` og `livddadas.lua`, er flyttet til
`dod-kode/` i stedet for prosjektroten. Ikke slettet, bare samlet på ett
sted, se `dod-kode/README.md`. Beskrivelsene under er fortsatt riktige,
bare filstien er ny.

Disse filene har egne bugs (knuste bilde-stier), men er ikke fikset
fordi ingenting i spillet faktisk navigerer dit, verken via `require`
eller `composer.gotoScene`/`showOverlay`. Trygge å ignorere, eller
slette permanent hvis du bekrefter du ikke trenger noe av det (se
spørsmål 6 i `sporsmal.md`):

- `brett.lua` — refererer `"backgroun1d.jpg"` (finnes ikke, sannsynlig
  skrivefeil for et bakgrunnsbilde). Selv uten den bugen navigeres det
  aldri hit.
- `menu1.lua` — refererer `"background.jpg"` (finnes ikke). En
  alternativ/tidligere versjon av `menu.lua`, gjettevis.
- `options.lua` — samme `"backgroun1d.jpg"`-referanse som `brett.lua`.
- `play.lua` — refererer `"images/eforest02.jpg"` (finnes ikke). Ser ut
  som en stjerne-/resultatskjerm som aldri ble koblet til noe.
- `menu backup.lua` — en eldre, ikke-instrumentert kopi av `menu.lua`
  (ingen `checkpoint()`-kall, ellers nesten identisk). Refererer
  bilder uten `background/`-prefiks (f.eks `"bg1.png"` i stedet for
  `"background/bg1.png"`), som heller ikke finnes på den stien.
- `hoydehopp.lua` — en fysikk-lekeplass (to komplette 9-ledds
  ormekropper), ingen knust bilde-referanse denne gangen (`del1.jpg`
  finnes faktisk, om enn inkonsekvent blandet med `.png` samme sted i
  fila), men ingen steder navigert til.

## Hvor ting ligger

- Selve spillkoden som faktisk brukes: repo-roten (`main.lua`,
  `level1.lua` osv, akkurat som i Dropbox-mappen din).
- Bekreftet ubrukt kode: `dod-kode/`, se `dod-kode/README.md`.
- Byggeoppskrift for nettleser-versjonen: `Util/recipe-html5.lua` og
  `Util/build-html5.sh`.
- README.md har en kort oversikt og instruksjoner for å kjøre spillet i
  Solar2D Simulator som før.
- `sporsmal.md` har åpne spørsmål til deg fra gjennomgangen, ikke noe
  som haster, bare ting Mathias/AI ikke kunne avgjøre selv.

Denne fila fylles på etter hvert som mer skjer.

## 2026-09-10, avslutning for denne økta

Oppsummert hva som er gjort i dag: fant og fikset retry-krasjen (se
egen oppføring over), gjorde en grundig linje-for-linje gjennomgang av
hele kodebasen og fant flere ting utover selve krasjen (også over),
skrev spørsmål til deg i `sporsmal.md`, og flyttet 31 bekreftet ubrukte
filer til `dod-kode/` i stedet for å slette dem. README.md er også
rettet, den kalte hovedpersonen en "ball" der den faktisk er en mark.

Ingen åpne krasjer akkurat nå, retry-fiksen er bygget og publisert på
GitHub Pages. Det som gjenstår er i hovedsak spørsmål til deg (se
`sporsmal.md`) og de to kjente spillbarhets-bugene (neste bane / retry
går til feil bane, se "Kjente feil" i `KODEBASE.md`), ikke noe som
haster før du har svart på spørsmålene.

## 2026-09-10, Ørjan svarte på spørsmålene i sporsmal.md

Svarene og hva som ble gjort med hvert av dem (full spørsmålstekst i
`sporsmal.md`):

1. **Liv skal ha en betydning, bare ikke ferdig kodet ennå.** Man skal
   starte med et visst antall liv, og ved null liv skal man kunne se
   en reklame for å få liv tilbake (1 min reklame = 1 liv, lang
   reklame = f.eks 3 liv). Fant og fikset selve bugen som hindret
   telleren fra å nå null i det hele tatt (`liv.endreliv()` la
   feilaktig til 2 liv i stedet for å trekke fra ved siste liv). Lagt
   til `liv.erTom()` i `liv.lua` som en enkel sjekk videre kode kan
   bruke. **Bygget IKKE selve reklame-integrasjonen**, det krever et
   valg av annonse-SDK/nettverk som ikke er min avgjørelse å ta, og
   ingenting kaller `liv.erTom()` ennå.
2. **Marken skal kunne "knekke".** Ørjan beskriver den som bygget av
   3 biter med motoriserte ledd som strekker seg ut og til slutt
   knekker ved landing. Koden i dette repoet har i stedet en
   9-leddet ormekropp (del1-del9) uten noen knekk-mekanikk i det hele
   tatt, altså stemmer ikke det som ligger her med beskrivelsen.
   Ørjan skal sjekke om han har en nyere versjon der dette faktisk er
   kodet ferdig. Sjekket samtidig "kan du legge inn kollisjonsboksene
   på marken": `shapedefs.lua` har faktisk ferdige `"hale"`/`"hode"`
   kollisjonsformer, men de brukes ikke, `level1.lua` bruker egne
   hånd-skrevne former i stedet. Grunnen: halen krympes fra 55×35 til
   27×17 i koden før kollisjonsformen legges på, og de hånd-skrevne
   formene stemmer med den krympede størrelsen, mens
   `shapedefs.lua` sine er sporet fra bildet i original størrelse. Å
   bytte dem inn direkte ville gitt en dobbelt så stor, usynlig
   kollisjonsboks. **Rørte ikke fysikk-koden her**, siden det virker
   som riktig steg er å vente på den nyere versjonen Ørjan skal lete
   etter, fremfor å gjette på en knekk-mekanikk som kanskje allerede
   finnes ferdig et annet sted.
3. **Shapedefs.lua skal ha flere ting i seg.** Bekreftet: i dag ligger
   bare level1 sine kollisjonsformer der (helt til slutt i fila), men
   alle ni baner skal ha sine egne. Krever at formene spores i
   PhysicsEditor fra hver banes bilder, noe som må gjøres av noen med
   verktøyet og kildebildene, ikke noe jeg kan gjette meg fram til.
   Ikke gjort.
4. **og 5. Retry skal starte den banen du faktisk var på**, ikke alltid
   bane 1. **Fikset**: `pausemenu1.lua` og `dodmenu1.lua` sin
   "retry"-knapp bruker nå `composer.getSceneName("current")` for å
   finne riktig bane i stedet for hardkodet `"gotolevel1"`.
   `dodmenu1.lua` fikk samtidig samme pcall-sikkerhetsnett som
   `pausemenu1.lua` allerede hadde på denne knappen. Ikke testet i
   faktisk nettleser ennå, bør sjekkes på alle ni baner.
6. **Ta vare på død kode slik det er gjort til nå.** Bekreftet at
   `dod-kode/`-mappen (fra i går) var riktig fremgangsmåte, ingen
   endring nødvendig.
7. **Hold banene åpne for testing enda.** Bekreftet, `k.numUnlocked`
   og opplåsings-overriden i `ogt_levelmanager.lua` er bevisst latt
   urørt (se oppdatert notat øverst i denne fila under "Husk før
   dette regnes som ferdig").
8. **Rett stiene siden spillet ikke er under aktiv grafikk-utvikling.**
   **Fikset**: `level5.lua`-`level9.lua` var 100 % identiske filer med
   bilde-referanser uten mappe-prefiks. Hver av de fem har nå sin
   egen, riktige `levelN/`-sti (ikke lenger byte-identiske med
   hverandre), og bakgrunnsbildene har fått `background/`-prefiks.
   Deler fortsatt plassholderbilder og feil kollisjonsformer med
   level1, det er ikke noe stien alene kan fikse.

**Ny feil meldt i samme melding, utenfor spørsmålslista:** dobbeltklikk
skal gjøre marken helt slapp, men virket ikke. Fant koden
(`trykk_knapp` i `level1.lua`), den brukte Runtime "tap"-eventets
`event.numTaps == 2`, som ikke ser ut til å synkroniseres pålitelig med
museklikk i HTML5-eksporten. I tillegg satte "touch ended"-fasen alltid
motorene på igjen uansett, uavhengig av om marken nettopp var gjort
slapp, så selv om dobbeltklikket hadde blitt riktig oppdaget ville
neste berøring momentant slått motorene på igjen. **Fikset**:
dobbeltklikk oppdages nå selv ved å måle tid mellom to `"began"`-faser
(300 ms vindu), uavhengig av `numTaps`, og `"ended"`-fasen lar motorene
være av når marken er slapp. **Ikke testet i faktisk nettleser ennå**,
usikker på om 300 ms-vinduet føles riktig, si fra om det bør justeres.

Alt kodet i dag er pushet, og en ny HTML5-build er trigget for å teste.

## 2026-09-10, presisering av liv/reklame-flyten

Mathias presiserte: "om man ikke ønsker å se reklame skal man kunne starte
på nytt fra level 1." Det svarer på hva som skal skje i den siden av
reklame-valget som ikke krever et annonse-SDK, så koblet det inn med det
samme.

`pausemenu1.lua` og `dodmenu1.lua` sin "retry"-knapp sjekker nå
`liv.erTom()` etter at livet for dette forsøket er trukket fra: har du
fortsatt liv igjen, restartes banen du var på (som i går). Er du tom for
liv, går du i stedet til `gotolevel1` (start fra bane 1), siden det er
fallback-oppførselen når man ikke vil/kan se reklame. Det finnes fortsatt
ingen faktisk "vil du se reklame?"-dialog, det kommer når noen velger et
annonse-SDK og bygger det. Inntil da er "start fra bane 1" alt som skjer
når du går tom for liv, ingen spørring, siden reklame-alternativet ikke
finnes ennå.

Ikke testet i faktisk nettleser.

## 2026-09-10, tre til, samme mønster

Mathias spurte om det var noe annet jeg umiddelbart ville fikse. Tre
lavrisiko-ting som følger nøyaktig samme mønster som allerede var
godkjent i dag:

- **`dodmenu1.lua` sine to gjenstående knapper** ("main menu"/"levels")
  fikk samme pcall-sikkerhetsnett som "retry" fikk tidligere i dag.
  Samme dekning som `pausemenu1.lua` nå.
- **Sprite-lekkasjen i `ogt_levelmanager.lua`** (splash-bildet som
  aldri ble fjernet ved banevalg) er fikset, fjernes nå rett før
  scenebyttet til den valgte banen.
- **Selve banevalget** (`sceneMgr.gotoScene()` i `selectLevel`) har nå
  samme pcall-sikkerhetsnett som resten av kjeden dit.

Ikke testet i faktisk nettleser ennå. Pushet og ny build trigget.

## 2026-09-10, retry-fiksen krasjet hardt på ekte telefon

Mathias testet på iPhone: hver eneste gang han trykket retry kom Chrome
sin egen "kan ikke åpne denne siden"-feil (skjermbilde vedlagt), ikke
vår røde sjekkpunkt-boks. Det er en helt annen alvorlighetsgrad enn de
Lua-feilene pcall har fanget til nå, dette er nettleseren som gir opp
hele siden.

Mistanke: `composer.getSceneName("current")`, brukt i går sin
retry-fiks, kalles fra INNSIDEN av et overlay (pausemenu1/dodmenu1).
Den returnerer trolig overlayets eget navn ("pausemenu1"), ikke banen
som faktisk ligger under, siden overlays er en egen greie i Composer
sin scene-stack. Å be Composer gå til `"pausemenu1"` som en vanlig
scene mens `"pausemenu1"` samtidig kjører som overlay er nok
inkonsistent nok til å krasje dypt i selve motoren (WASM/HTML5-delen),
utenfor det pcall i Lua kan fange opp. Derfor ingen rød boks, bare et
nettleser-nivå havari.

**Fikset med en mer robust metode, uten å stole på Composer sin egen
"hvilken scene er jeg i"-introspeksjon:** hver `levelN.lua` (1-9)
setter nå `lm.currentLevel = N` selv, helt i starten av `scene:create`.
Retry i `pausemenu1.lua`/`dodmenu1.lua` bruker `"level" ..
lm.currentLevel` direkte i stedet for å spørre Composer om noe. Siden
`lm.currentLevel` settes av selve banefila uansett hvordan du kom dit
(direkte fra appstart, fra banevalg, eller fra en tidligere retry),
er dette pålitelig uansett vei inn.

**Viktig: ikke testet i faktisk nettleser ennå**, siden jeg ikke kan
kjøre HTML5-bygget selv. Dette er andre forsøk på samme bug, så vær
ekstra oppmerksom når du tester denne gangen.
