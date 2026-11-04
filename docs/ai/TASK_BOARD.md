# TewahedoDaily Task Board

## Multi-Game Faith Challenges Content Expansion Phase 2 — 2026-11-04

- **Complete locally:** 248 newly generated, source-grounded content units across the 10 games in `artifacts/faith-challenges/phase-2/`:
  - *Who Am I?*: 50 new cards across Old/New Testament, Saints, and Holy Objects (70 merged total cards, 0 ID or answer duplicates).
  - *Match & Discover*: 50 new pairs across 10 collections (Old Testament Mothers, Parables, Seven Deacons, Mountains, Fruit of the Spirit, Armor of God, Ethiopian Fathers, Evangelists, Liturgical Objects, Miracles in John).
  - *Holy Emoji Challenge*: 50 new questions with 3 progressive hints and balanced keys (12 A, 13 B, 13 C, 12 D).
  - *History Quest*: 40 new units (30 questions covering Early Church, Ecumenical Councils, and Ethiopian Church History + 10 chronological events).
  - *Bible Timeline*: 10 new canonical chains (50 events total, generating 51 playable bank rounds across difficulties).
  - *Church Feast Challenge*: 4 thematic curated decks (26 card instances from 12 approved feast images).
  - *Guess the Saint*: 4 thematic curated decks (26 card instances from 10 approved saint/angel images).
  - *Icon Memory*: 10 strictly sized sets (4, 6, 8 pairs conforming to engine constraints).
  - *Finish the Mezmur*: 30 new verified songs from `amharic-chants.json` with >= 5 usable lines (generating 515 Choose, 537 Arrange, 515 Type questions in `buildFinishMezmurBank`).
- **All validators passing:** 0 errors across `validateStudioDraft`, `validateCardContent`, `validateQuestionDraft`, and `previewQuestionImport`. All regression tests (`test:play-complete`, `test:faith-challenges:authorization`, `test:play-foundation`, `test:finish-mezmur`, `test:bible-timeline`) pass.
- **Safeguards preserved:** 0 Gemini API calls/keys, 0 Supabase writes, `verifiedLocales: ['en']` with natural Amharic draft text awaiting human editorial verification.

## Multi-Game Faith Challenges Content Expansion (Pilot) — 2026-11-04

- **Complete locally:** Validated pilot batches generated for all 10 non-trivia Faith Challenges games:
  - *Who Am I?*: 20 cards across biblical people, saints, places, objects (`artifacts/faith-challenges/who-am-i/`).
  - *Match & Discover*: 20 pairs / 4 collections (`artifacts/faith-challenges/match/`).
  - *Holy Emoji Challenge*: 20 questions with 3 progressive hints and balanced keys (`artifacts/faith-challenges/emoji/`).
  - *History Quest*: 20 questions (balanced keys) + 9 chronological events (`artifacts/faith-challenges/history/`).
  - *Bible Timeline*: 4 canonical chains (29 events; 43 bank rounds) (`artifacts/faith-challenges/timeline/`).
  - *Church Feast Challenge*: 2 verified decks (16 card instances from 12 feasts) (`artifacts/faith-challenges/feasts/`).
  - *Guess the Saint*: 2 verified decks (16 card instances from 10 saints & angels) (`artifacts/faith-challenges/saints/`).
  - *Icon Memory*: 3 strictly sized sets (4, 6, 8 pairs) (`artifacts/faith-challenges/icon-memory/`).
  - *Finish the Mezmur*: 10 verified songs (493 playable question pool) (`artifacts/faith-challenges/mezmur/`).
  - *Bible Adventure*: 6 fully enriched bilingual stories with exact artwork bindings (`artifacts/faith-challenges/adventures/`).
- **Safeguards preserved:** Zero Gemini API calls, zero Supabase writes, exact source grounding, 0 validator/CMS import errors. All test suites (`test:play-complete`, `test:faith-challenges:authorization`) pass.

## Database-driven Play — 2026-11-04

- **Local implementation:** opt-in typed published-content path for twelve existing games; shared versioned activity draft adapter; original gameplay/scoring retained; no static fallback within the opt-in path.
- **Review-only conversion:** 68 stable-ID/hash candidates, 62 structurally valid, six validation failures. All require rights/editorial review and explicit draft-import authorization. No imports performed.
- **Blocked:** approved activity database validators and constraints, real multi-role staging verification, populated published banks, production cutover/removal of the default legacy fallback branch, secure private Game Night staff authoring and public hub settings publication. See `DATABASE-DRIVEN-PLAY-2026-11-04.md`.

## Bible Question Campaign (Batches 001–005) — 2026-11-03

- **Complete locally:** Batches 001, 002, 003, 004, 005 generated and validated (100 total accepted questions, 894 prepared passages across 50 batches). All batches verified through generator validator and CMS preview.
- **Preserved:** Zero Gemini API dependency, zero Supabase writes, exact verse IDs/hashes, balanced answer positions (5 each of a,b,c,d), visible blanks for finish-the-verse, all drafts marked editorialReviewRequired: true.
- **Next batches:** Batches 006 through 050 prepared and pending Copilot offline generation.

## Play redesign increment — 2026-11-03

- **Complete locally:** five-mode public/CMS navigation, featured mixed shared-screen guide, Custom/Join Game Night organization, URL/history compatibility, recent replay links, loaded-record status/attention dashboard and pure anti-repetition foundation.
- **Reverified:** existing twelve studio editors/previews, source/publication safeguards and relevant Play/CMS/Game Night regressions. See `PLAY-MODES-REDESIGN-2026-11-03.md`.
- **Blocked on backend/staging:** mixed-mechanic multiplayer, eight local-only public content adapters, chronology publishing and actual effective database authorization. Reuse existing proposals; no competing migrations or unsafe client scoring.
- **Follow-up:** intermittent mobile history-scroll timeout (rerun passes), native Amharic terminology and live media review. Cross-game selector integration awaits verified identity metadata.

Updated: 2026-10-30

Ownership is **unknown** unless explicitly recorded below. No agent assignment is inferred from Git status.

## Completed

- **Play foundation and Bible Timeline UI** — shared progress/hint components, timeline interaction styling, accessibility and responsive refinements. Reported complete; browser and logic checks were reported as passing.
- **Church Library homepage visual pass** — responsive catalog presentation, bilingual labels, signed cover loading, and empty/loading states. Reported complete; focused lint was reported as passing.
- **Structured Church Library design** — documented reader/import/publication architecture. Documentation says local tests passed; migration is not documented as applied.
- **Media resolver TypeScript and focused validation** — local TypeScript check, production build, and all 10 media resolver checks passed; the stale Timket catalog path now references `calendar/christ/timket-436e0376-1792010746233.webp`.

## Active

- **Media resolver integration review** — uncommitted `src/lib/media/mediaResolver.ts` and related calendar/hymn files are present. Local validation passed; ownership and final integration status remain unknown.
- **Play feature consolidation** — uncommitted Play game, content, and test files are present. Owner/status: unknown.
- **Church Library homepage/detail/reader follow-up** — homepage changed; detail and reader redesign remain separate work. Owner/status: unknown.

## Blocked

- **GitHub Actions deployment** — failure reported; diagnosis and remediation are pending.
- **Production Church Library structured content** — documented migration/import/publication steps require explicit authorization and have not been verified as applied.

## Pending

- Review uncommitted changes and establish ownership.
- Diagnose the reported GitHub Actions deployment failure.
- Run focused Play, Library, TypeScript, ESLint, and browser checks as needed.
- Decide whether media resolver changes are ready to integrate or should remain isolated.
