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

## 2026-09-10, full opprydding av mappestruktur

Mathias ba om full opprydding i kode og mappestruktur, og valgte
eksplisitt "flytt aktive filer til undermapper" og "gjør det i én stor
omgang, test til slutt" fremfor små, trygge biter. Advarte om risikoen
først (nøyaktig denne typen endring var årsaken til retry-krasjen
rett over), men kjørte det gitt svaret.

**Gjort:** hele prosjektet, som tidligere var 27 `.lua`-filer flatt i
roten, er nå delt i `scenes/` (alle Composer-scener) og `lib/` (delte
moduler som ikke er egne scener). Bare `main.lua` og `config.lua` ble
igjen i roten (Solar2D krever det). Full liste og begrunnelse i
"Mappestruktur"-avsnittet i `KODEBASE.md`.

Fremgangsmåte for å unngå akkurat den typen glipp som skjedde med
linjeslutt tidligere i dag: kartla FØRST hver eneste streng-referanse
til hvert av de 25 filnavnene på tvers av hele den levende kodebasen
(ikke `dod-kode/`, den er urørt siden ingenting peker dit uansett) med
grep, bygde et skript som gjør presise erstatninger (kun hele
anførselstegn-innhold, ikke delstrenger, så f.eks `"levelWidth"`
aldri kunne bli truffet), kjørte det på én fil om gangen med
linjeslutt bevart (lærdom fra i sted), luac-sjekket alle 27 filene
etterpå, og gjorde til slutt et bredt grep-søk etter alt som kunne
ligne en glemt referanse før filene faktisk ble flyttet.

Fant tre pre-eksisterende, allerede-ødelagte referanser
(`composer.removeScene("pausemenu")`/`"dodmenu"` uten tallet, og
`"reload"` i en kommentar) som pekte på scener som aldri har
eksistert, verken før eller etter flyttingen. Rørte dem ikke, de var
no-ops før også, ikke noe reorganiseringen skapte.

**Ikke testet i faktisk nettleser ennå, og kan IKKE verifiseres av meg
selv** siden `require()`/`gotoScene()`-stier bare løses ved kjøretid,
ikke av `luac` sin syntaks-sjekk. Dette er den mest risikofylte
endringen så langt i dag, akkurat den typen som forårsaket
retry-krasjen over. Test grundig: appstart, alle ni baner (både via
banevalg og "neste bane"), pause/død-menyene sine tre knapper hver,
og retry på flere baner.

## 2026-09-10, siste kjente spillbarhets-bug fikset

Mathias spurte om jeg heller burde bygge spillet helt på nytt etter
Solar2D-dokumentasjonen. Svar: nei, for mye fungerende, innstilt
innhold (fysikk, layout) står udokumentert i selve koden og ville
risikert å gå tapt i et gjenoppbygg jeg ikke kan teste live selv, og
Ørjan jobber fortsatt aktivt med spillet selv. Anbefalte å fortsette
som i kveld, og ta det store steget (slå ni banefiler sammen til én
parameterisert) som et bevisst, eget steg når banene er ferdige.

Fortsatte deretter med "neste bane"-bugen (punkt 3 i "Kjente feil"),
den siste åpne spillbarhets-bugen. Ørjan tok ikke stilling til den
spesifikt i svarene sine, men `level1.lua` har alltid gjort det
riktige (tilbake til banevalg etter fullført bane), så lot de andre
åtte gjøre det samme i stedet for å gjette på noe annet.

`level2.lua`-`level9.lua` sin `goto2`-funksjon viser nå
`gotochooselevel` i stedet for det hardkodede, bugget
`showOverlay("gotolevel2")`. Det gjorde `gotolevel2.lua` helt uten
referanser (den var den eneste veien dit), så den er flyttet til
`dod-kode/` sammen med resten av den døde koden, se
`dod-kode/README.md`.

Ingen kjente åpne spillbarhets-bugs igjen nå, bare de to som venter på
nytt innhold fra Ørjan (kollisjonsformer, plassholder-grafikk).

**Ikke testet i faktisk nettleser ennå.**

## 2026-09-10, retry ga slow motion og virket fortsatt ikke riktig

Mathias testet: spillet gikk i slow motion, og restart fungerte
fortsatt ikke som det skal.

Mistanke: retry kaller `composer.gotoScene()` til **samme banenavn
som allerede er den aktive scenen** (du er på bane 2, trykker retry,
`destination` blir `"scenes.level2"`, mens du fortsatt står i
`"scenes.level2"` med pausemenyen som overlay oppå). Composer
håndterer trolig ikke det tilfellet som en vanlig scenebytte, den kan
la den gamle instansen (fysikkverden, ledd, Runtime-lyttere som
`onCollision`, `trykk_knapp`, `knekk`) henge igjen i stedet for å rive
den ned, mens `scene:create` likevel kjører på nytt oppå. Det ville
forklare begge symptomene med én årsak: dobbelt sett fysikkobjekter
og -lyttere gjør simuleringen tyngre for hver retry (slow motion), og
den gamle, ikke-nullstilte tilstanden er grunnen til at banen ikke
"restarter" ordentlig.

**Fikset:** lagt til `composer.removeScene(destination)` rett før
`composer.gotoScene(destination, ...)` i retry-knappen, i både
`pausemenu1.lua` og `dodmenu1.lua`. Tvinger en fullstendig nedriving
av banens gamle instans (fysikk, ledd, display-objekter, selve
Lua-modulen) før den lastes helt på nytt, uansett om Composer ville
gjort det automatisk eller ikke. Harmløst no-op i tilfellene der
scenen ikke var lastet fra før (f.eks. `gotolevel1`-fallbacken når du
er tom for liv).

**Ikke testet i faktisk nettleser ennå.** Dette er et forsøk basert på
resonnement om Composer sin livssyklus, ikke noe jeg kan bekrefte selv
uten en simulator. Si fra om slow motion / dårlig restart fortsatt
skjer etter denne, så må vi grave dypere (f.eks. sjekke om selve
pausemeny-overlayet blir riktig ryddet bort også).

## 2026-09-10, sjekket faktisk dokumentasjon, og la til forklaringer i koden

Mathias spurte om jeg faktisk hadde studert Solar2D sin dokumentasjon.
Ærlig svar: nei, ikke underveis, alt har vært basert på det jeg vet om
Corona/Solar2D fra før kombinert med lesing av koden og symptomene
dere har rapportert. Fikk tilgang til nettsøk nå og sjekket noen av
antakelsene fra i kveld mot faktisk dokumentasjon (docs.coronalabs.com
var blokkert direkte for meg, fant sitater via søk i stedet):

- `composer.getSceneName("current")` + `gotoScene()` til samme navn er
  faktisk et **dokumentert mønster** for å laste gjeldende scene på
  nytt, ikke i seg selv ugyldig slik jeg konkluderte i går kveld etter
  telefon-krasjen. Årsaken til den krasjen er dermed fortsatt ikke
  100 % forklart, men uansett løst i praksis siden vi byttet til
  `lm.currentLevel` i stedet.
- `composer.gotoScene()` skjuler automatisk et aktivt overlay, så
  pausemeny-overlayet er bekreftet ikke kilden til noe av dagens bugs.
- `composer.removeScene()` sender en destroy-hendelse og fjerner
  scenen helt, harmløst hvis den ikke var lastet. Bekrefter at
  slow-motion-fiksen (riv ned banen før retry laster den på nytt) er
  den offisielt riktige måten å tvinge fram en ren tilstand på.

Ba meg samtidig rydde opp og legge til forklaringer på norsk i selve
filene, ikke bare i disse dokumentene. Gikk gjennom alt som er endret
i kveld og la til/utvidet kommentarer der de manglet: "will vs
did"-fiksen i `gotolevel1.lua`/`gotomenu.lua`/`gotochooselevel.lua`,
liv-bugen i `liv.lua`, sprite-lekkasjen og pcall-en i
`ogt_levelmanager.lua`, hvorfor `mark.lua` sin `mark.hent()` aldri
kalles, og hvorfor `level1.lua` sin hale bruker en egen kollisjonsform
i stedet for `shapedefs.lua` sin ferdige.

**Fant samtidig at dobbeltklikk-bugen (rettet i `level1.lua` i går) var
identisk kopiert inn i `level2.lua`-`level9.lua` også**, ufikset der.
Siden banene skal holdes åpne for testing (Ørjans svar på spørsmål 7),
rettet samme fiks der også, ikke bare i `level1.lua`.

**Ikke testet i faktisk nettleser ennå.**

## 2026-09-10, opprydding av utilsiktede globale variabler

Mathias ba om en full, grundig opprydding "i henhold til
dokumentasjonen", uavhengig av bugs (de tar vi senere). Fant noe
konkret i Solar2D sin egen dokumentasjon om nettopp det jeg mistenkte
i går: Runtime-lyttere som ikke fjernes lekker minne, siden
Runtime-eventet er globalt og lyttere overlever selv om
display-objektet de hørte til er borte.

Gikk gjennom `scenes/`-filene for utilsiktede globale funksjoner
(skrevet uten `local`). Fant `trykk_knapp` i alle ni banefiler, `kill`
i bane 2-9 (aldri kalt noe sted), og `lock`/`goto` i `menu.lua`.

**Viktig lærdom underveis:** dette er IKKE en mekanisk "legg til
local overalt"-jobb. `trykk_knapp` viste seg å være avhengig av å
være global, siden `pausemenu1.lua`/`dodmenu1.lua` refererer den ved
navn for å fjerne touch-lytteren når du pauser/dør. Å bare gjøre den
lokal ville brutt den opprydningen. Løsningen: gjorde `trykk_knapp`
fil-scoped i hver banefil (en `local trykk_knapp`-forhåndsdeklarasjon
øverst, synlig for både `scene:create` og `scene:hide`), og fjernet
de nå garantert virkningsløse forsøkene på å fjerne den fra
pausemeny/dødsmeny. Opprydningen skjer riktig i banens egen
`scene:hide` i stedet, som uansett alltid tvinges gjennom nå takket
være `composer.removeScene()`-fiksen fra tidligere i kveld.

**Ekstra funn i samme runde:** `onCollision`/`onCollision1`/`knekk`
var faktisk ALLEREDE riktig lokale i banefilene, men
`pausemenu1.lua`/`dodmenu1.lua` prøvde likevel å fjerne dem ved navn
på tvers av filer. Det har aldri fungert (refererte en udefinert
global), sannsynligvis siden spillet ble skrevet. Fjernet de
virkningsløse linjene. Dette er trolig en medvirkende årsak til
slow-motion-bugen fra i sted: lyttere som aldri faktisk fjernes hoper
seg opp for hver runde i pause/død, nøyaktig det Solar2D sin egen
dokumentasjon advarer mot.

**Om omfanget videre:** "all kode i henhold til dokumentasjonen" er et
mye større løft enn det som er gjort her. `camera` og `grp` er også
utilsiktet globale i alle banefiler (brukt på samme måte som
`trykk_knapp` var, mellom `scene:create` og `scene:hide`), og hver av
de ni banefilene har flere store, utkommenterte kodeblokker (gamle,
forlatte forsøk) som strengt tatt burde fjernes for et virkelig rent
resultat. Det er en betydelig jobb til, per fil, med samme grundighet
som i kveld. Gjorde det viktigste og best dokumenterte først
(Runtime-lyttere, siden det direkte henger sammen med
slow-motion-bugen), og stopper her for å spørre om dere vil at jeg
fortsetter resten nå eller en annen gang, fremfor å gjette meg videre
inn i natten på egen hånd.

**Ikke testet i faktisk nettleser ennå.**

## 2026-09-10, fjernet dødkode og merket bevisste globaler

Mathias ba meg fortsette. Gikk videre med de to gjenstående punktene
fra forrige oppføring.

**Nesten en alvorlig glipp:** Første forsøk på å finne utkommenterte
kodeblokker brukte et regex-mønster som feiltolket Lua sin
kommentar-syntaks. Det ga et fullstendig feil svar: "979
sammenhengende linjer kommentert ut" i `level1.lua`, som i
virkeligheten var en blokk på bare 11 linjer etterfulgt av ekte,
kjørende kode og så flere separate kommentarer. Lua avslutter en
`--[[`-blokk ved den ALLERFØRSTE `]]` den finner, uansett hva som står
før eller etter, og mønsteret mitt tok ikke høyde for det. Hadde jeg
slettet basert på det første svaret, ville jeg slettet fungerende
spillkode. Skrev om til et skript som følger den faktiske regelen,
sjekket resultatet manuelt mot hver eneste blokk før noe ble fjernet,
og verifiserte etterpå med diff at bare linjer ble borte, aldri endret
eller lagt til, pluss `luac`-syntaks-sjekk av alle filene.

**Fjernet ca 1170 linjer bekreftet dødkode**: gamle, forlatte forsøk
(dupliserte funksjoner, tidligere varianter av samme kode, ting som
refererer bilder som aldri fantes) fra `level1.lua`-`level9.lua`,
`menu.lua`, `liv.lua` og `mark.lua`. Lot lisens- og
changelog-kommentarene i tredjepartsfilene (`ogt_levelmanager.lua`,
`ogt_lmdata.lua`, `perspective.lua`) stå urørt, det er ekte
dokumentasjon, ikke dødkode, selv om de også bruker `--[[ ]]`-syntaks.

**Merket `camera`/`grp` som bevisste globaler** med `_G.`-prefiks på
definisjonsstedet, slik Solar2D sin dokumentasjon anbefaler for
globaler som faktisk er meningen skal deles. Disse to kunne IKKE
gjøres til vanlige lokale variabler slik `trykk_knapp` ble i går:
`liv.lua` sin `liv.hent()`-funksjon (viser livstall og -ikon, kalt fra
alle ni baner) skriver rett til `grp` og har ingen annen måte å nå
banens visningsgruppe på. Sjekket dette grundig før jeg rørte noe,
etter læringen fra `trykk_knapp`-fiksen.

**Ikke rørt ennå**: `pausemenu1.lua`/`dodmenu1.lua`/`gotoX`-filene sin
egen, separate `camera`/`grp` (ikke bekreftet delt med noe annet, lavere
prioritet). Ikke testet i faktisk nettleser.

## 2026-09-10, opprinnelige Dropbox-filer og bygg-ekskludering

Mathias lastet opp den originale zip-fila fra Dropbox-mappa
("NewNewNew Roller (1)") og ba om en mappe Ørjan kan bla i direkte på
GitHub, uten å måtte grave i git-historikk. La de 306 filene urørt inn
i `opprinnelig-fra-dropbox/`, med en README som forklarer at samme
innhold også er den aller første committen i repoet, så mappen er
bare for bla-bekvemmelighet.

Sjekket etterpå om dette ville blåse opp HTML5-spillet: `dstPath` i
`Util/recipe-html5.lua` peker på hele repo-roten som `projectPath`, og
den filas egen kommentar sier rett ut at alt der blir "kopiert rått
inn i spillbunten som assets". Uten tiltak ville de ~28 MB fra Dropbox
blitt lastet ned til hver spiller sin telefon for ingenting.

Løsningen er dokumentert av Solar2D selv: `excludeFiles` i
`build.settings`, med et stjernetegn etter mappenavnet for å
ekskludere hele mappen (uten stjernen blir bare selve mappen tom, ikke
utelatt). Lagt til under `all` slik at det gjelder alle
byggeplattformer, ikke bare HTML5, siden mappen uansett aldri trengs i
noe bygg. Trigger HTML5-bygget på nytt for å bekrefte at det fortsatt
fungerer og at bunten ikke har blitt større.
