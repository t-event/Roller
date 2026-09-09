# Til Ørjan

Hei Ørjan! Mathias delte Dropbox-mappen din (NewNewNew Roller) og ba AI se
hva som kunne gjøres med spillet. Denne fila er en logg over alt som er
gjort med koden din, i vanlig språk, oppdatert etter hvert.

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
  `https://t-event.github.io/roller/` i en vanlig nettleser på telefon
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
  `https://t-event.github.io/roller/` (kan ta et par minutter etter at
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

## Hvor ting ligger

- Selve spillkoden: repo-roten (`main.lua`, `level1.lua` osv, akkurat som
  i Dropbox-mappen din).
- Byggeoppskrift for nettleser-versjonen: `Util/recipe-html5.lua` og
  `Util/build-html5.sh`.
- README.md har en kort oversikt og instruksjoner for å kjøre spillet i
  Solar2D Simulator som før.

Denne fila fylles på etter hvert som mer skjer.
