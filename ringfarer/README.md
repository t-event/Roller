# Ringfarer

Et 2D romskipspill (sett ovenfra) med ekte fysikk, inspirert av Stargate.
Du starter med **Hoppeskip MK-I**, et lite enmannsskip, og tjener penger på
utvinning, frakt og handel mellom tre stjernesystemer som er knyttet sammen
av en eldgammel ringport.

Spillet er ren HTML5 + JavaScript uten byggesteg og uten avhengigheter. Det
kjører i nettleseren på PC og mobil.

## Starte spillet

- **Lokalt:** åpne `ringfarer/index.html` i en nettleser. Ingen server trengs.
- **På nett:** når dette er slått sammen til `main`, publiserer GitHub
  Actions-jobben spillet sammen med Roller, på
  `https://thurbohnek.github.io/Roller/ringfarer/`.

## Kontroller

| Tast | Handling |
| --- | --- |
| W / S (piltaster) | Hovedmotor / bremsemotor |
| A / D | Drei skipet |
| Q / E | Sidestyring |
| Mellomrom | Borelaser (hold inne) |
| F | Traktorstråle av/på |
| Z | Flygeassistent: av, demper rotasjon, full (bremser også fart) |
| T | Dokk ved stasjonen |
| G | Ring porten |
| + / − eller musehjul | Zoom |
| M | Lyd av/på |
| Esc / P | Pause |
| H | Hjelp |

På mobil/nettbrett vises egne berøringsknapper automatisk.

## Slik spilles det

1. **Utvinning.** Hold laseren på en asteroide. Den varmes opp, skjærer av
   tynne skiver som blir til malmbiter, og sprekker til slutt i to. Slå på
   traktorstrålen og fly rolig mot bitene. De trekkes inn i nesen og
   prosesseres om bord til ferdig vare (jern, nikkel-jern, vannis, naquadah).
2. **Salg og handel.** Dokk ved en stasjon (fly inn i den stiplede ringen ved
   enden av dokkingsarmen under 3,5 m/s og trykk T). Prisene er ulike i hvert
   system. Is er for eksempel billig i Vanaheim og dyr i Muspelheim.
3. **Oppdrag.** Oppslagstavla på stasjonene har frakt- og leveringsoppdrag.
   Skjør last ødelegges av ett støt over grensen (3–5 m/s).
4. **Porten.** Ring porten med G og velg et system. Sju chevroner låses, så
   skyter en virvel (kawoosh) ut foran porten. Den fordamper alt den treffer,
   også deg. Når horisonten er stabil, flyr du inn forfra.
5. **Oppgradering.** Motor, skjold, skrogplating, laser, lasterom og
   traktorstråle kan oppgraderes på stasjonene.

## Systemene

| System | Stasjon | Kjennetegn |
| --- | --- | --- |
| Midgard | Midgard Verft | Startsystemet. Rolig belte med jern og nikkel. |
| Vanaheim | Vanaheim Handelspost | Raske kometer av rent is. |
| Muspelheim | Surtr Borestasjon | Tett felt i rask drift. Farlig, men rikt på naquadah. |

## Fysikken

Alt er i SI-enheter: meter, sekunder, kilo og newton.

- **Stive legemer.** Skip, asteroider og malmbiter er konvekse polygoner med
  masse og treghetsmoment regnet ut fra formen og materialets tetthet.
  Kollisjoner finnes med SAT (separating axis theorem) og løses med
  impulser, sprett (restitusjon) og friksjon (`js/physics.js`).
- **Newton.** Det er ingen luftmotstand. Skipet beholder farten til du
  bremser. Flygeassistenten bruker de samme dysene, med samme kraft og
  drivstofforbruk, som når du styrer selv.
- **Masse som endrer seg.** Drivstoff, last og malm som prosesseres gjør
  skipet tyngre. Tyngre skip akselererer tregere og treffer hardere.
- **Traktorstrålen** drar i skipet like mye som i biten (Newtons tredje lov).
  Tunge biter drar deg mot seg.
- **Skade** regnes fra fartsendringen skipet får i støtet (Δv = impuls / masse).
  Under ca. 1,6 m/s skjer ingenting. Skjoldet tar støtet først. Stedet på
  skroget som blir truffet avgjør hvilket system som tar skade: nesen
  (laser, traktor), sidene (styredyser) eller akterenden (motorer).
- **Gruvedrift** kutter polygonene langs rette linjer, så massen er bevart
  nøyaktig når steiner skjæres opp eller sprekker. Bitene får også bevart
  bevegelsesmengde.

## Kodestruktur

| Fil | Innhold |
| --- | --- |
| `index.html` | Side, stil og berøringsknapper |
| `js/geom.js` | Polygonmatematikk: areal, tyngdepunkt, treghet, klipping, oppdeling |
| `js/physics.js` | Fysikkmotoren (legemer, kollisjon, impulsløser, stråle-test) |
| `js/world.js` | Materialer, varer, systemer, stasjoner, port, asteroidefelt |
| `js/ship.js` | Skipet: motorer, flygeassistent, laser, traktor, prosessering, skade |
| `js/missions.js` | Oppdragsgenerator |
| `js/game.js` | Spill-løkke, kamera, gruvedrift, port, dokking, død og lagring |
| `js/render.js` | Tegning av bakgrunn, skip, asteroider, stasjon, port, partikler |
| `js/hud.js` | Instrumentpanel, radar og markører |
| `js/ui.js` | Menyer: tittel, stasjon, porten, pause, hjelp |
| `js/input.js` | Tastatur og berøring |
| `js/audio.js` | Syntetisert lyd (Web Audio, ingen lydfiler) |

Fremgangen lagres i nettleseren (`localStorage`) hver gang du dokker eller
handler.

## Ideer til neste steg

- Større skip å kjøpe (to-seters frakteskip, tungt gruveskip) med egne skrog
  og egenskaper.
- Gravitasjon rundt planeter og månebaner.
- Pirater eller droner som angriper fraktskip.
- Flere porter og systemer, og en adressebok der man låser opp nye adresser.
- Egne tegnede skip og stasjoner i stedet for vektorgrafikk.
