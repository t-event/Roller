# Til Ørjan

Hei Ørjan! Mathias delte Dropbox-mappen din (NewNewNew Roller) og ba AI se
hva som kunne gjøres med spillet. Denne fila er en logg over alt som er
gjort med koden din, i vanlig språk, oppdatert etter hvert.

## Husk før dette regnes som ferdig

- **Lås banene igjen.** `ogt_lmdata.lua` har `k.numUnlocked` satt til
  9, og `ogt_levelmanager.lua` har en direkte override (`for x = 1,
  k.totalLevels do k.levelLocked[x] = false end`, rett før
  `levelInfo.locked = k.levelLocked`) som tvinger alt ulåst uansett
  lagret fremgang. Begge er merket "TEMP for debugging", fjern dem når
  feilsøkingen er ferdig, ellers er hele bane-progresjonen i spillet
  meningsløs.
- **Fjern feilsøkings-sjekkpunktene.** `checkpoint(...)`-kallene i
  `main.lua`, `level1.lua`, `menu.lua`, og pcall-innpakningene i
  `gotolevel1.lua`/`gotomenu.lua`/`pausemenu1.lua` var midlertidige
  for å finne krasjer. Trygge å la stå (de gjør ingenting skadelig),
  men ryddigst å fjerne når alt fungerer.

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

## Død kode (finnes i repoet, men brukes aldri)

Disse filene har egne bugs (knuste bilde-stier), men er ikke fikset
fordi ingenting i spillet faktisk navigerer dit, verken via `require`
eller `composer.gotoScene`/`showOverlay`. Trygge å ignorere, eller
slette hvis du en dag vil rydde:

- `brett.lua` — refererer `"backgroun1d.jpg"` (finnes ikke, sannsynlig
  skrivefeil for et bakgrunnsbilde). Selv uten den bugen navigeres det
  aldri hit.
- `menu1.lua` — refererer `"background.jpg"` (finnes ikke). En
  alternativ/tidligere versjon av `menu.lua`, gjettevis.
- `options.lua` — samme `"backgroun1d.jpg"`-referanse som `brett.lua`.
- `play.lua` — refererer `"images/eforest02.jpg"` (finnes ikke). Ser ut
  som en stjerne-/resultatskjerm som aldri ble koblet til noe.

## Hvor ting ligger

- Selve spillkoden: repo-roten (`main.lua`, `level1.lua` osv, akkurat som
  i Dropbox-mappen din).
- Byggeoppskrift for nettleser-versjonen: `Util/recipe-html5.lua` og
  `Util/build-html5.sh`.
- README.md har en kort oversikt og instruksjoner for å kjøre spillet i
  Solar2D Simulator som før.

Denne fila fylles på etter hvert som mer skjer.
