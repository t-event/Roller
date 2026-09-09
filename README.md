# Roller

Et Corona/Solar2D Lua-spill laget av Ørjan for noen år siden, hans første
prosjekt med koding. Ni baner med en rullende ball, pausemeny og
dødsmeny. Bygget med [SSK2](https://github.com/roaminggamer/SSK2)
(ligger i `ssk2/`).

Importert rått fra en delt Dropbox-mappe, ingen filer er endret eller
ryddet opp i. Tenkt som utgangspunkt for å se hva AI kan gjøre videre med
det.

## Kjøre spillet

Trenger [Solar2D](https://solar2d.com/) (etterfølgeren til Corona SDK).
Åpne mappen som prosjekt i Solar2D Simulator og kjør `main.lua`.

## Spille i nettleseren (iPhone/Android)

Repoet har en GitHub Actions-jobb som bygger spillet til HTML5 og publiserer
det til `gh-pages`-grenen, slik at det kan spilles direkte i telefonens
nettleser uten installasjon.

1. Gå til **Actions**-fanen på GitHub, velg **Bygg HTML5 og publiser til
   GitHub Pages**, trykk **Run workflow**.
2. Første gang: slå på GitHub Pages i **Settings → Pages**, sett kilde til
   grenen `gh-pages`.
3. Etter noen minutter ligger spillet på
   [https://t-event.github.io/Roller/](https://t-event.github.io/Roller/).

Bygget kjører på en macOS-runner siden Solar2Ds byggeverktøy krever det,
selv for HTML5. Se `Util/build-html5.sh` og `Util/recipe-html5.lua`.
