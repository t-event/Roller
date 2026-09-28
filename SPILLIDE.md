# Spillidé: Roller

Nedskrevet 2026-09-27 fra Mathias sin beskrivelse. Det som er gjort og det
som bare er forslag står hver for seg.

## Historien

Hovedpersonen er en markefar. En fryktelig flom skyller kona og barna
hans ned i hulen. Han hopper etter og starter jakten på dem.

## Hulen endrer seg nedover

- De første banene er jord og stein, og ikke så mørke.
- Jo lenger ned marken kommer, jo mørkere blir det.
- Bakken blir mer berg og farligere nedover, med flere sprekker marken kan
  falle ned i.

### Forslag til hvordan

- **Mørke: gjort 2026-09-28.** Et mørkt lag over banen, 0 i bane 1
  (utendørs) og så 10, 18, 26 ... 66 % i bane 9, med et lyst felt rundt
  marken. Styrken per bane står i `M.STYRKE` i `lib/morke.lua`, og
  størrelsen på lyset er tegnet inn i `morke.png`.
- **Stein i stedet for jord:** verktøyet `Util/baner/lag_bane.py` maler
  massene selv. Det kan få en fargepalett og et kornmønster per bane, fra
  brun jord (bane 1-4) via grå stein til mørkt berg, med skarpere kanter
  nedover.
- **Sprekker:** smale, dype hull i bakken som marken må hoppe over. Kan
  tegnes inn i Ørjans skisser som hull i de blå massene, så lager
  verktøyet dem.

## Samle ting, awards og oppgraderinger

Mathias er usikker på hva og hvordan. Forslag:

- **Hva marken samler:** små ting fra familien som flommen har skylt med
  seg (for eksempel dråper, blader eller spor etter barna), 3 per bane,
  plassert litt utenfor den enkleste veien.
- **Awards:** 1-3 stjerner per bane etter hvor mange som er samlet.
  Banevalget har allerede plass til stjerner (`lib/ogt_levelmanager.lua`
  har `updateStars` og `getLevelStars`, men de brukes ikke ennå).
- **Oppgraderinger:** det samlede kan brukes på noe som hjelper senere i
  hulen, for eksempel et ekstra liv, sterkere hopp eller en lykt som gjør
  mørket mindre tett.

## Startskjermen

Gjort 2026-09-27:

- **Settings-steinen** sitter fast i hulveggen som Story-steinen og faller
  løs når man trykker. Den åpner innstillinger (lyd av/på foreløpig).
- **Games-steinen** gjør det samme og åpner minispill-skjermen. Den viser
  "Coming soon" til det finnes minispill.

## Minispill

Idé: spillet skal ha minispill for marken. Ikke bestemt hva ennå.
