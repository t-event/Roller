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
  eller PC, ingen installasjon. Bygget kjører fortsatt/venter på
  verifisering i skrivende stund.

## Hvor ting ligger

- Selve spillkoden: repo-roten (`main.lua`, `level1.lua` osv, akkurat som
  i Dropbox-mappen din).
- Byggeoppskrift for nettleser-versjonen: `Util/recipe-html5.lua` og
  `Util/build-html5.sh`.
- README.md har en kort oversikt og instruksjoner for å kjøre spillet i
  Solar2D Simulator som før.

Denne fila fylles på etter hvert som mer skjer.
