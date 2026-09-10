# Spørsmål til Ørjan

Ting fra kodegjennomgangen som ikke er kodefeil i seg selv, men valg bare du
kan ta. Detaljene og konteksten står i `TIL-ORJAN.md` og `KODEBASE.md`, dette
er de konkrete spørsmålene destillert ut derfra.

## 1. Skal "liv" faktisk bety noe?

Fant under gjennomgangen at spillet aldri kan tape på liv slik koden er nå:
`liv.endreliv()` legger til 2 liv i stedet for å trekke fra når telleren når
1, så den svinger 3-2-1-3-2-1 i det uendelige. Og selve dødsskjermen
(`showOverlay("dodmenu1")`) trigges uansett av noe helt annet, en kollisjon
mellom et farlig objekt og hodet på ormekroppen, ikke av liv-telleren.

Er "liv" ment å bli en ekte game over-mekanikk etter hvert (og da bør
`endreliv()`-bugen fikses og noe sted sjekke telleren mot null), eller er
tallet bevisst pyntet vekk mens resten bygges ferdig, og skal bare vise
poeng/forsøk uten konsekvens?

## 2. Skal mark.lua faktisk brukes?

`mark.lua` sin `mark.hent()` bygger spillerkroppen (hale/hode, 9 ledd), og
både `menu.lua` og `level1.lua` `require`r den, men ingen av dem kaller den
faktisk. I stedet er det samme kroppen kopiert inn med ~90-100 linjer rett i
`level1.lua` (og sikkert i de andre banefilene også).

Var planen å bygge kroppen ett sted (`mark.lua`) og gjenbruke den overalt, og
er det verdt å faktisk rydde opp til det? Eller er `mark.lua` forlatt til
fordel for kopiering, og trygg å slette?

## 3. Kollisjonsformer for bane 2-4

`shapedefs.lua` har bare ett sett usynlige kollisjonsformer, sporet fra
bane 1 sine bilder i PhysicsEditor. Bane 2, 3 og 4 bruker de samme formene,
selv om de har egne bakkebilder. Det er derfor Mathias sin observasjon om at
bane 2 sin bakke ikke stemmer med hvor ballen faktisk kolliderer.

To muligheter: enten spores formene på nytt i PhysicsEditor for hvert
banebilde, eller så skal bane 2-4 sine bilder egentlig ha samme grunnform som
bane 1 og noe annet er galt. Hva stemmer?

## 4. "Neste bane"-knappen

I dag går "neste bane" fra bane 2 til 9 alltid til en splash-skjerm
(`gotolevel2`) som uansett bare fortsetter til bane 1, uansett hvilken bane
du faktisk fullførte. Bane 1 gjør det riktig og går til banevalg-skjermen
etter fullføring.

Skal alle baner gjøre som bane 1 (tilbake til banevalg etter fullført bane)?
Eller var tanken egentlig å ha en egen splash-skjerm per bane
(`gotolevel3.lua` til `gotolevel9.lua` finnes som filer, men er helt ubrukte
i dag) som så går videre til riktig neste bane?

## 5. "Retry" går alltid til bane 1

Fra pausemenyen (uansett hvilken bane du er i) går "retry" alltid til bane 1,
ikke til banen du faktisk spilte. Skal den heller starte banen du var i på
nytt?

## 6. Opprydding av død kode

23 filer er nå bekreftet 100 % ubrukte (ingen referanser noe sted, se listen
i `KODEBASE.md`): `pausemenu2-9.lua`, `dodmenu2-9.lua`, `gotolevel3-9.lua`,
`menu1.lua`, `menu backup.lua`, `options.lua`, `brett.lua`, `play.lua`,
`hoydehopp.lua`, `game.lua`, `livddadas.lua`.

Greit at jeg sletter alt dette, eller er det noe der du vil beholde som
referanse/gjenbruk? (`hoydehopp.lua` har for eksempel en fungerende
fysikk-lekeplass med to komplette ormekropper, og `brett.lua` har en idé om
et alternativt banevalg-brett med steiner.)

## 7. Låsing av baner

`k.numUnlocked` i `ogt_lmdata.lua` er satt til 9 (alt låst opp) midlertidig
for at Mathias skal kunne teste alle baner direkte. Skal denne tilbake til 1
(progressiv opplåsing, én bane om gangen) før neste ordentlige test, eller
har du andre tanker om hvordan baner skal låses opp (stjerner, poengsum)?

## 8. Plassholder-grafikk for bane 5-9

Bane 5-9 er 100 % identiske filer med knuste bildestier (mangler mappe-
prefiks i tillegg til å dele plassholderbilder med bane 2-4). Jobber du med
ny grafikk til disse, eller er det greit at jeg i mellomtiden retter stiene
så de i det minste laster plassholderbildene uten feil, mens dere venter på
ekte innhold?
