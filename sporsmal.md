# Spørsmål til Ørjan

Ting fra kodegjennomgangen som ikke er kodefeil i seg selv, men valg bare du
kan ta. Detaljene og konteksten står i `TIL-ORJAN.md` og `KODEBASE.md`, dette
er de konkrete spørsmålene destillert ut derfra.

**Alle åtte er besvart av Ørjan (2026-09-10).** Svar og hva som ble gjort
med hvert er lagt inn under spørsmålet. Full logg i `TIL-ORJAN.md`.

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

**Svar:** Liv skal ha en betydning, men er ikke kodet ferdig. Skal starte
med et visst antall liv. Ved null liv skal man kunne se en reklame for å få
liv tilbake, 1 min reklame gir 1 liv, en lang reklame gir f.eks 3 liv.

**Gjort:** Fikset bugen som hindret telleren fra å nå null. Lagt til
`liv.erTom()` som helper. Reklame-integrasjonen selv er IKKE bygget (krever
valg av annonse-SDK, ikke min avgjørelse), og ingenting kaller `liv.erTom()`
ennå.

## 2. Skal mark.lua faktisk brukes?

`mark.lua` sin `mark.hent()` bygger spillerkroppen (hale/hode, 9 ledd), og
både `menu.lua` og `level1.lua` `require`r den, men ingen av dem kaller den
faktisk. I stedet er det samme kroppen kopiert inn med ~90-100 linjer rett i
`level1.lua` (og sikkert i de andre banefilene også).

Var planen å bygge kroppen ett sted (`mark.lua`) og gjenbruke den overalt, og
er det verdt å faktisk rydde opp til det? Eller er `mark.lua` forlatt til
fordel for kopiering, og trygg å slette?

**Svar:** Marken skal kunne knekke. Den er bygd opp av 3 biter, leddene er
motorisert for å kunne strekke seg ut og til slutt knekke om den lander rett.
Ørjan skal sjekke om han har en nyere versjon der det faktisk er kodet
ferdig. Spurte samtidig om jeg kunne legge inn kollisjonsboksene på marken.

**Gjort:** Denne vurderingen var feil, rettet 2026-09-10. Mathias forklarte
mer detaljert hvordan mekanikken faktisk skal virke (hver kroppsdel har et
eget "knott"-kollisjonsobjekt weldet oppå, og når to nabo-knotter kolliderer
skal motor-jointene mellom delene fjernes, blod vises, og dødsmenyen
aktiveres), og det viste seg å stemme nøyaktig med noe som allerede lå
ferdig kodet i alle ni banefiler (`knekk(event)`, knott1/knott2 opp til
knott8/knott9), bare at selve `Runtime:addEventListener("collision", knekk)`
var kommentert bort i alle ni, så mekanikken kjørte aldri. Skrudd på, se
`KODEBASE.md` "Kjente feil" punkt 5. Så det er uklart om dette faktisk er en
annen/eldre versjon enn den Ørjan husker (9 ledd her, han beskrev 3 biter),
men selve knekk-logikken var altså der hele tiden, bare avslått. Sjekket
samtidig kollisjonsboks-spørsmålet: `shapedefs.lua` har faktisk ferdige
`"hale"`/`"hode"`-former, men de er ikke koblet til `level1.lua` sin
ormekropp, som bruker egne hånd-skrevne former i stedet. Fant hvorfor: halen
krympes fra 55×35 til 27×17 før kollisjonsformen legges på, og de
hånd-skrevne formene stemmer med den krympede størrelsen, mens
`shapedefs.lua` sine er sporet fra bildet i original størrelse. Å bytte dem
inn direkte ville gitt en dobbelt så stor usynlig kollisjonsboks, så det er
bevisst ikke gjort før den nyere versjonen er på plass.

## 3. Kollisjonsformer for bane 2-4

`shapedefs.lua` har bare ett sett usynlige kollisjonsformer, sporet fra
bane 1 sine bilder i PhysicsEditor. Bane 2, 3 og 4 bruker de samme formene,
selv om de har egne bakkebilder. Det er derfor Mathias sin observasjon om at
bane 2 sin bakke ikke stemmer med hvor ballen faktisk kolliderer.

To muligheter: enten spores formene på nytt i PhysicsEditor for hvert
banebilde, eller så skal bane 2-4 sine bilder egentlig ha samme grunnform som
bane 1 og noe annet er galt. Hva stemmer?

**Svar:** Det skal finnes flere ting inne i shapedefs. `shapedefs.lua` har
for marken, level 1 står helt i slutten av koden, men alle levelsene skal
ligge der.

**Gjort:** Bekreftet, ingen kode endret. Krever at formene spores i
PhysicsEditor fra hver banes bilder, noe som må gjøres med kildebildene i
riktig verktøy, ikke noe jeg kan gjette meg fram til.

## 4. og 5. "Neste bane"-knappen og "Retry"

I dag går "neste bane" fra bane 2 til 9 alltid til en splash-skjerm
(`gotolevel2`) som uansett bare fortsetter til bane 1, uansett hvilken bane
du faktisk fullførte. Fra pausemenyen går "retry" alltid til bane 1, uansett
hvilken bane du faktisk var i.

**Svar:** Retry skal starte aktiv bane på nytt. Om man er på bane 2 og
trykker retry skal bane 2 starte på nytt.

**Gjort (retry):** `pausemenu1.lua` og `dodmenu1.lua` sin "retry"-knapp
bruker nå `composer.getSceneName("current")` for å finne riktig bane, i
stedet for hardkodet `"gotolevel1"`. Ikke testet i faktisk nettleser ennå.
**"Neste bane"-knappen** er fortsatt åpen, ikke adressert spesifikt i svaret.

## 6. Opprydding av død kode

23 filer er nå bekreftet 100 % ubrukte (ingen referanser noe sted, se listen
i `KODEBASE.md`): `pausemenu2-9.lua`, `dodmenu2-9.lua`, `gotolevel3-9.lua`,
`menu1.lua`, `menu backup.lua`, `options.lua`, `brett.lua`, `play.lua`,
`hoydehopp.lua`, `game.lua`, `livddadas.lua`.

Greit at jeg sletter alt dette, eller er det noe der du vil beholde som
referanse/gjenbruk? (`hoydehopp.lua` har for eksempel en fungerende
fysikk-lekeplass med to komplette ormekropper, og `brett.lua` har en idé om
et alternativt banevalg-brett med steiner.)

**Svar:** Ta vare på død kode på den måten det er gjort til nå.

**Gjort:** Bekrefter at `dod-kode/`-mappen (filene flyttet dit, ikke
slettet) var riktig fremgangsmåte. Ingen endring nødvendig.

## 7. Låsing av baner

`k.numUnlocked` i `ogt_lmdata.lua` er satt til 9 (alt låst opp) midlertidig
for at Mathias skal kunne teste alle baner direkte. Skal denne tilbake til 1
(progressiv opplåsing, én bane om gangen) før neste ordentlige test, eller
har du andre tanker om hvordan baner skal låses opp (stjerner, poengsum)?

**Svar:** Hold banene åpen enda for testing.

**Gjort:** Bekreftet, ingen endring. `k.numUnlocked` og opplåsings-overriden
i `ogt_levelmanager.lua` er bevisst latt urørt.

## 8. Plassholder-grafikk for bane 5-9

Bane 5-9 er 100 % identiske filer med knuste bildestier (mangler mappe-
prefiks i tillegg til å dele plassholderbilder med bane 2-4). Jobber du med
ny grafikk til disse, eller er det greit at jeg i mellomtiden retter stiene
så de i det minste laster plassholderbildene uten feil, mens dere venter på
ekte innhold?

**Svar:** Rett stiene da det ikke aktivt jobbes med spillet.

**Gjort:** `level5.lua`-`level9.lua` har nå hver sin riktige `levelN/`-sti
(ikke lenger byte-identiske filer), og bakgrunnsbildene har fått
`background/`-prefiks. Deler fortsatt plassholderbilder og feil
kollisjonsformer med level1 (se spørsmål 3), det kan ikke stien alene fikse.

## Ny feil meldt utenfor spørsmålslista

Ørjan meldte samtidig: dobbeltklikk på skjermen skal gjøre marken helt
slapp, men det fungerer ikke.

**Gjort:** Fant koden (`trykk_knapp` i `level1.lua`). Den brukte Runtime
"tap"-eventets `event.numTaps == 2`, som ikke ser ut til å synkroniseres
pålitelig med museklikk i HTML5-eksporten. I tillegg satte "touch
ended"-fasen alltid motorene på igjen uansett, så selv om dobbeltklikket
hadde blitt oppdaget ville neste berøring momentant slått dem på igjen.
Fikset ved å oppdage dobbeltklikk selv (måler tid mellom to "began"-faser,
300 ms vindu) og la "ended" respektere at marken er slapp. **Ikke testet i
faktisk nettleser ennå**, usikker på om 300 ms-vinduet føles riktig.
