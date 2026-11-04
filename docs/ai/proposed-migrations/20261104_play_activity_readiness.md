# Play activity database extension — approval prerequisite, not an applied migration

Date: 2026-11-04. No SQL has been executed. Do not enable production database-only mode from mocked test results.

The existing six-state reconciliation remains the authority:
`20261102_faith_challenges_live_reconciliation.sql`, its verification SQL, and the guarded staging runbook.
Do not add competing policies, change SECURITY INVOKER, or drop constraints by guessed names.

## Required amendment after actual catalog review

1. Inspect existing columns/defaults, game/status CHECK constraints, identifiers, unique indexes, FKs, triggers, effective grants/RLS and review RPCs using `20261104_play_activity_preflight.sql` and the existing six-state verification. This task did not obtain live evidence, so executable ALTER/DROP statements are intentionally not guessed.
2. Reuse `public.play_content_items`, `question_id`, `stable_id`, category, difficulty, timestamps and the six editorial states. Legacy question/card payloads stay unchanged. Add game CHECK support for `bible-timeline`, `adventures`, `feasts`, `saints`, `icon-memory` only if absent. `history`, `match`, `who-am-i` and `finish-the-mezmur` also need the versioned activity payload branch; allowing a game name alone is insufficient.
3. Extend the existing server validator/editorial trigger with a **strict** `payload.format='studio-activity-v1'` discriminator. Match the application contract in `studioActivity.ts`: wrapper ID equals both row identifiers; bounded name/category/order; difficulty and verified locales; game equals nested draft game; exact derived source references; 128 KB bound. Reject unexpected fields, malformed collections, duplicates, unapproved media, unsupported Adventure object/branch bindings, invalid timeline ordering references and false Amharic-review claims. Validate all nested fields at the database boundary, not merely in React.
4. Dispatch each payload to its own validator: Who identity, Match pair collection, Bible timeline chain, History event/year chronology, three-scene Adventure, or approved picture deck. Match needs unique sides and public boards of 4/6/8; Icon Memory decks require 4/6/8; picture decks 4–12; timeline events 3–50; chronology 3–30 distinct AD years. Adventure still supports only the six existing artwork/hotspot bindings and discover/question interactions. New branches require an engine/schema change and remain blocked.
5. Finish Mezmur activities **must** set `sourceOnly=true` and store only the selected hymn's public metadata/slug, with all lyric and media-copy fields empty/null. Reject missing source-only flags and any copied lyrics/media. Public playback re-reads those slugs from `mezmur_public`; source publication and lyric-rights redaction must be verified. No hymn/Bible/Library source records are changed.
6. Preserve immutable row UUID and stable identifiers; reconcile null/mismatched/duplicate identifiers only through the separately reviewed existing proposal. Do not delete existing rows. Keep Draft → Review → Approved/Rejected → Published transitions, admin-only review/publication, editor submit-only, archive/unpublish, timestamp rules, locks and concurrency checks. No DELETE grant is needed.
7. Preserve/reverify published-only anonymous SELECT; overlapping permissive policies and broad grants require effective JWT tests. Do not grant browser access to `play_private.game_night_questions`. Game Night continues its private bank/redacted RPCs; secure staff authoring for that bank requires an independently reviewed server-side path, not public activity rows.
8. Review the existing game/status/publication index before adding a bounded published scan index `(game_type, status, published_at, question_id)`. The public reader orders deterministically, pages by game, rejects more than 1,000 rows, and caches only in-flight requests. Do not add a new publication table/framework.

## Required staging evidence before lifting the app publication gate

- Inventory/approve staging identity independently of production using the existing guards and separate credentials.
- Separately authorize migration application, disposable fixtures, JWT tests and cleanup. Test anon, ordinary user, editor, admin, super-admin and service-role import; include direct table writes as well as RPCs.
- Positive/negative SQL and real PostgREST tests must cover every format, nested malformed JSON, source rights, NULL fields, identifier mutation, all transitions, concurrent editing, unauthorized publishing, unpublished SELECT and revoked source availability.
- Publish **synthetic** fixtures in staging through the actual editorial workflow. Then exercise the database-only browser suite against staging. The current fixture suite bypasses actual publication solely in an in-memory fake; it proves no deployed permissions.
- Reconcile the 68-candidate offline review manifest with existing database IDs. Six current candidates have validation errors. All rights/licensing and native-language/source claims still need editorial verification. Only explicitly authorized imports may create drafts; never automatically approve/publish.
- Prove unpublish/archive prevents fresh-session reads, including service errors/retry, with zero static fallback. Then separately approve removing the legacy runtime branch and enabling `VITE_PLAY_DATABASE_ONLY=true` in production. The flag is not a security or staging-identity boundary.

## Rollback

Keep original static files and existing published rows. Before staging DDL, take the existing runbook's catalog/data backups and record applied definitions. Roll back an uncommitted migration transaction on failure; use the reviewed catalog backup for a committed staging rollback. Do not guess a reverse migration or delete published rows. App rollback is a rebuild with the opt-in flag unset and restoration of only this increment's files from its scoped snapshot; preserve all unrelated work and the Git index. No automatic rollback command or production operation is provided.
