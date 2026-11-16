# Faith Challenges: consolidating bundled content into Supabase

Date: 2026-11-16. Branch `feat/faith-challenges-consolidation`, stacked on PR #14 (`release/consolidation-2026-11-16`).
**No production write was made.** No service-role or staff credential exists in this checkout (`SUPABASE_SERVICE_ROLE_KEY` is empty in `.env.import`), so the import below is built, dry-run and tested, but **not applied**. `VITE_PLAY_DATABASE_ONLY` was not changed anywhere.

## What was verified against production (anonymous, read-only)

Target project `tgvhpibzzkqxkcumrivh` (same in `.env`, `.env.local`, `.env.import`).

- `play_content_items` is reachable and has `question_id`, but holds **0 published rows** for a public visitor. Production therefore runs on the bundled banks (flag unset). Turning database-only mode on before an import would empty every game.
- 2,486 published hymns with lyrics are visible in `mezmur_public` (reader limits a selection to 100 slugs).
- Published Church Library books visible to visitors: `five-pillars-of-mystery-am/en`, `seven-sacraments-baptism-am/en` only.
- The repo's migrations only define 7 `game_type` values and no `question_id` column, although the live table has `question_id`. The live check constraint for the five newer game types (`bible-timeline`, `adventures`, `feasts`, `saints`, `icon-memory`) could not be read anonymously. **Verify it before `--apply`** (a failed insert is safe: batches are idempotent and nothing is updated).

## Inventory (units are what each game plays; counts regenerated, not copied from earlier reports)

| Game | Unit | Bundled approved | Consolidated rows | Published in DB today | Hidden in production (unpublished source book) | Playable in production today | Journey result (fixture of consolidated rows, anonymous, database-only) |
|---|---|---|---|---|---|---|---|
| Trivia | questions | 226 (20 + 206) | 226 | 0 | 10 (`seven-sacraments`) | 216 | full 5-question round + replay completed |
| Emoji | clues | 166 | 166 | 0 | 0 | 166 | full round + replay completed |
| Finish the Verse | excerpts | 119 | 119 | 0 | 0 | 119 | full round + replay completed |
| History Quest | questions + chronology events | 6 + 3 | 7 rows | 0 | **all 9** (`church-history-worldwide/ethiopia`) | **0** | start reached with all books published; honest empty state with production books |
| Who Am I? | cards | 132 | 132 (6 downgraded) | 0 | 0 | 132 | start reached |
| Match | pairs | 135 | 135 | 0 | 4 (`seven-sacraments`) | 131 | start reached |
| Bible Timeline | timelines (events) | 38 (240) | 38 | 0 | 0 | 38 | start reached |
| Bible Adventure | stories (scenes) | 6 (18) | 6 | 0 | 0 | 6 | start reached |
| Church Feast Challenge | pictures | 12 | 1 deck | 0 | 0 | 12 | start reached |
| Guess the Saint | pictures | 10 | 1 deck | 0 | 0 | 10 | start reached |
| Icon Memory | pictures (sets of 4-8 pairs) | 22 | 3 sets | 0 | 0 | 22 | start reached |
| Finish the Mezmur | published hymns | reads `mezmur_public` | 100 source-only selections (`--include-mezmur`) | 0 | n/a | all published hymns with ≥5 usable lines (random sample) | start reached (synthetic hymns) |

"Start reached" means the real game component loaded the consolidated database content and offered its start control with no error or empty state; answering/scoring was automated only for the three quiz games here. Completion of the other nine games in database-only mode is **not** automated yet.

Excluded / adjusted (reported by the tool, never silent):

- 6 built-in Who Am I? cards (Moses, David, Daniel, Thomas, Noah, Cana) claimed reviewed Amharic but have no Amharic explanation. Imported with `verifiedLocales: ['en']`; no translation was invented.
- Generated rows keep `verifiedLocales: ['en']` (Amharic unreviewed), exactly as served today.
- Not imported by design: Game Night private bank (redacted RPC flow), and lyrics (Mezmur rows store only a slug selection).
- Still drafts in git-ignored `artifacts/faith-challenges/` (not approved, not used here): 220 pending trivia/verse drafts (80 already in the bundled bank), and the Phase 2/3 history, who-am-i, match, timeline, image and mezmur drafts. The 120 unresolved History items, 43 + 43 unresolved cards/pairs and 1 timeline need source/doctrinal review (`docs/ai/faith-challenges-publication-ledger.json`). Phase artifacts include copied lyrics and must stay out of git.

## What changed

- `scripts/play/consolidate-content.ts` (`npm run play:consolidate`): builds 834 rows from the committed bundled banks (`approvedContent`, `bibleTimeline`, `bibleAdventureStories`, `imageCatalog`, `generated/*.json`; no dependency on git-ignored files). Validates with the real validators, checks image relationships, dedupes by stable ID.
  - Stable IDs: quiz rows keep their question ID; activity rows are `legacy-<game>-<id>`.
  - `--compare` reads existing rows and the published library books; reports conflicts and hidden counts.
  - `--apply --project-ref <ref> --backup <new file> [--status published]` needs server-side `SUPABASE_URL` + `SUPABASE_SERVICE_ROLE_KEY`, exports affected existing rows first, is **insert-only** (an existing stable ID is never updated or deleted; a differing payload is a reported conflict), and forces image URLs to the target project origin.
- `src/lib/play/publishedContent.ts`: hub summary uses a 5,000-row scan limit (the loader throws, never truncates, past it); hub units now match the bundled units (emoji = clues, who-am-i = cards, feasts/saints/icon-memory = images, history = questions).
- `DatabaseContentStatus` / `DatabasePlayGame`: distinct "insufficient published content" message for Match and Mezmur.
- Tests: `test:consolidation` (16 checks through the real published-only loaders), `test:consolidation:browser` (18 browser checks; `LIBRARY_BOOKS=production` simulates only the 4 books published today).

## Reviewed apply runbook (not executed)

1. Confirm the live `game_type` check allows all 12 games and the `question_id`/`archived`/`review` columns the app expects; add a reviewed migration if not.
2. Decide the Church Library blocker: publish `seven-sacraments`, `church-history-worldwide`, `church-history-ethiopia`, or accept that History stays empty and trivia/match lose 14 items.
3. `npm run play:consolidate -- --include-mezmur --compare` with server env: confirm 0 conflicts and the expected insert count.
4. `npm run play:consolidate -- --include-mezmur --apply --project-ref tgvhpibzzkqxkcumrivh --backup <new file>` (draft by default). Review in `/admin/play`, or add `--status published` once the batch is signed off.
5. Check as an anonymous visitor: `npm run test:consolidation:browser` against a staging endpoint, and `/play` counts equal the table above.
6. Only then set `VITE_PLAY_DATABASE_ONLY=true` for the deployed build. Rollback: set the flag back to unset/false (instant), and move the inserted stable IDs to draft/archived through `review_play_content`; nothing is deleted.
