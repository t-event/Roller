-- Hvilken versjon av spillet dette er. Byggingen på GitHub
-- (.github/workflows/build-html5.yml) skriver over denne med commit-ID-en
-- før spillet bygges, og legger samme ID i versjon.txt på nettsiden, så
-- lib/oppdatering.lua kan se når en nyere versjon er publisert.
-- "lokal" betyr at spillet ikke er bygget av GitHub, og da sjekkes det ikke.
return "lokal"
