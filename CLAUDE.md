# Regler for dette repoet

- **Aldri legg hemmeligheter i repoet.** Ingen API-nøkler, tokens, passord,
  sertifikater eller private nøkler i kode, konfigurasjon, commits eller
  dokumentasjon. Repoet og GitHub Pages-siden er offentlige. Trengs en
  hemmelighet i bygget, legges den i GitHub secrets (Settings -> Secrets and
  variables -> Actions) og leses i workflowen med `${{ secrets.NAVN }}`, slik
  byggeworkflowen allerede gjør med `secrets.GITHUB_TOKEN`.
- Spillet kjører i nettleseren, så alt som bygges inn i HTML5-versjonen kan
  leses av hvem som helst. En hemmelighet som spillet selv trenger mens det
  kjører, kan derfor ikke skjules der, heller ikke via GitHub secrets. Den må
  i så fall ligge bak en egen server.

- **Gi alltid lenken til spillet etter endringer som kan prøves:**
  https://thurbohnek.github.io/Roller/ . Siden bygges og publiseres
  automatisk ved hver push til `main` (tar et par minutter). Vent til
  byggingen er publisert før lenken gis, og si fra at en privat fane eller
  omlasting kan trengs for å få nyeste versjon.

Se `KODEBASE.md` for hvordan koden henger sammen og `SPILLIDE.md` for
spillideen.
