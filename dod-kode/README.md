# Død kode

Disse filene er flyttet hit, ikke slettet. Alle er bekreftet 100 % ubrukte:
ingen fil noe sted i prosjektet navigerer til dem med
`composer.gotoScene`/`showOverlay`, og ingen `require`r dem. Bekreftet med
grep/diff over hele kodebasen (se `../TIL-ORJAN.md` og `../KODEBASE.md` for
detaljene rundt hver enkelt).

31 av dem havnet her 2026-09-10 fra prosjektroten, den gangen alt lå flatt.
Én til, `gotolevel2.lua`, havnet her senere samme dag fra `../scenes/`, se
egen forklaring nederst.

Ligger her i stedet for å bli slettet, slik at ingenting går tapt hvis noe
av det viser seg å være verdt å hente ut igjen. Spillet fungerer akkurat
likt med filene her som i roten, siden ingenting pekte på dem uansett.

## Hvor de kom fra

### Pause-/dødsmeny-varianter (16 filer)
`pausemenu2.lua`-`pausemenu9.lua`, `dodmenu2.lua`-`dodmenu9.lua`

Ser ut som et tidligere forsøk på én egen pause-/dødsmeny per bane. Innholdet
er nesten identisk til `pausemenu1.lua`/`dodmenu1.lua` slik de var *før*
pcall-sikkerhetsnettet ble lagt til under feilsøkingen i går, det vil si
eldre kopier. Spillet bruker i praksis bare `pausemenu1.lua` og
`dodmenu1.lua` for alle ni baner.

### Splash-skjermer for bane 2-9 (8 filer)
`gotolevel2.lua`-`gotolevel9.lua`

Splash-skjermen med `last.png`-animasjonen. `gotolevel1.lua` (i
`../scenes/`) er fortsatt i bruk, appens faktiske startskjerm.
`gotolevel3.lua`-`gotolevel9.lua` ble aldri koblet til noe i det hele
tatt, og var dessuten kopiert rett fra `gotolevel1.lua` uten å bli
tilpasset (gikk fortsatt til bane 1, ikke egen bane).

`gotolevel2.lua` var frem til 2026-09-10 den eneste av de åtte som faktisk
ble vist, fra "neste bane"-knappen i alle baner (bugget: alltid til
`gotolevel2` uansett hvilken bane som ble fullført, og selv den gikk
videre til bane 1, ikke bane 2). Den bugen er fikset, "neste bane" viser
nå banevalget i stedet, slik `level1.lua` alltid gjorde riktig. Dermed
mistet `gotolevel2.lua` sin eneste referanse og havnet her.

### Hovedmeny-varianter (3 filer)
`menu1.lua`, `menu backup.lua`

To eldre versjoner av `menu.lua`. `menu backup.lua` er en ikke-instrumentert
kopi (ingen sjekkpunkt-kall) som ellers ligner sterkt på dagens `menu.lua`.
`menu1.lua` er en annen, eldre variant med litt andre knapper.

`options.lua`, `hoydehopp.lua`

Peker til fra de døde menyvariantene over (`options`-/`hoydehopp`-knapper
finnes også i dagens `menu.lua`, men utkommentert der). `options.lua` er en
enkel "innstillinger"-skjerm som refererer et bilde som ikke finnes
(`backgroun1d.jpg`). `hoydehopp.lua` er en fysikk-lekeplass med to komplette
9-ledds ormekropper, ikke koblet til noe meny.

### Alternativt banevalg (2 filer)
`brett.lua`, `play.lua`

Et alternativt banevalg-brett med steiner (`stein1.png` til `stein10.png`),
med en "start"-knapp som går videre til `play.lua`. Bare én av fire
baneknapper i `brett.lua` peker til en fil som faktisk finnes (`play.lua`),
de tre andre peker til scener (`play2`, `play3`, `play4`) som aldri har
eksistert i prosjektet. Ingenting navigerer til `brett.lua`, så heller ikke
`play.lua` nås i praksis.

### Gamle score-/liv-varianter (2 filer)
`game.lua`, `livddadas.lua`

Eldre varianter av dagens `liv.lua` (som lagrer spillerens liv/poengsum).
Snodig detalj: filnavn og innhold er byttet om. `game.lua` inneholder (til
tross for navnet) en gammel `liv`-modul, mens `livddadas.lua` inneholder en
gammel `game`-modul. Ingen av dem er koblet til noe sted, `liv.lua` er den
som faktisk brukes.
