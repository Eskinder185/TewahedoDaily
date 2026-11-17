# PR #15 pre-import remediation — 2026-11-16

## Decision

PR #15 is **not ready for a production import or merge**. The proposed database and importer remediation is implemented in this isolated worktree and passes a disposable PostgreSQL draft import, but hosted-staging JWT/PostgREST verification and complete end-to-end play/edit/save coverage still remain. No hosted SQL, import, flag change, merge, push, or deployment was performed.

The exact review-only SQL is [`docs/ai/proposed-migrations/20261102_faith_challenges_live_reconciliation.sql`](proposed-migrations/20261102_faith_challenges_live_reconciliation.sql). It deliberately ends without `COMMIT`; the operator must run the catalog checks in the same staging session, then explicitly commit or roll back.

## Exact additive/reversible schema proposal

The proposal takes an advisory transaction lock and aborts unless the expected table, columns, helpers, pgcrypto extension, identifiers, and publication audit fields are present. It discovers constraints by their semantics, not guessed names.

- Replace only the independently verified four-state `status` check with `draft`, `review`, `approved`, `rejected`, `published`, and `archived`. An already-valid six-state check is retained. Any unknown or competing constraint aborts the transaction.
- Replace only the verified six-literal game check with all canonical Studio formats: `trivia`, `emoji`, `finish-the-verse`, `finish-the-mezmur`, `history`, `who-am-i`, `match`, `bible-timeline`, `adventures`, `feasts`, `saints`, and `icon-memory`. Legacy singular `adventure` also remains valid for existing records. New singular inserts are normalized to canonical `adventures` by the guard trigger.
- Preserve a game-specific, server-side payload validator for legacy quiz/card rows and versioned Studio activities. The validator checks stable IDs, localized English source content, option/card/event identity and bounds, image/activity structure, permitted source kinds/routes, difficulty, modes, and source-only Mezmur records. It does not create or copy hymn lyrics or media.
- Enforce the transition matrix in one immutable helper and a `BEFORE INSERT OR UPDATE` guard. Editors can submit `draft -> review`; administrators and super-administrators perform review decisions, publication, archival, or return-to-draft transitions. Content can be changed only while draft.
- Keep `review_play_content` as `SECURITY INVOKER`, so grants and RLS apply to its caller.
- Replace every permissive policy on `play_content_items` atomically. Anonymous and ordinary authenticated users select only published rows with a publication timestamp. Editorial staff can select; editors update drafts; administrators update all editorial states. There is no client delete grant or policy.
- Give `service_role` only `SELECT` and `INSERT` on content. The trigger accepts only service-role draft inserts; direct update, delete, approval, or publication is impossible. The importer takes a per-stable-ID advisory lock without requiring an update grant.
- Block publication when a `church-library` source route does not resolve to a published `church_library_books.slug`. In the consolidated set, this protects 21 records: 14 Seven Sacraments and 7 History questions.
- Add append-oriented `play_content_import_batches` and `play_content_import_items` audit tables plus two narrowly granted RPCs. Reapplying the proposal is idempotent against the supported reconciled state.

Rollback is bounded rather than destructive: `rollback_play_content_import(batch_id)` can remove only rows recorded as inserted by that batch that are still unchanged drafts with the same timestamp and SHA-256 payload. Edited, missing, or transitioned rows are retained and marked `rollback_blocked`. Schema rollback after a committed migration must restore the preflight-captured constraints, RPC definitions, grants, and policies; the proposal itself remains transaction-reversible until the explicit staging commit.

## Import contract and audit manifest

`scripts/play/consolidate-content.ts --apply` no longer accepts a status and no longer inserts into the table directly. It requires `--project-ref`, `--source-commit`, a new backup path, and a new audit path, then calls `import_play_content_drafts` once. It remains insert-only and draft-only.

The RPC accepts a JSON array of at most 1,000 canonical records. Each record supplies:

- `stable_id`, `game_type`, `category`, `difficulty`;
- the real CMS `payload` and `source_references` shapes;
- `origin` and the importer’s content `hash` for provenance.

It also requires a 7–40 character source commit and a 64-character manifest SHA-256. Every attempted ordinal receives one result: `inserted`, `duplicate`, `conflict`, or `failed`. Exact duplicates are left untouched; a matching stable ID with different content is a conflict and is left untouched; invalid rows receive an actionable database error. The batch records requested/inserted/duplicate/conflict/failed totals and `completed`, `partial`, or `failed` status. Inserted UUIDs, stable IDs, hashes, timestamps, errors, and rollback eligibility are retained. The local JSON audit additionally records excluded sources, downgraded locale claims, preflight conflicts, the target project reference, and the exact rollback rule.

Approved inputs remain the checked-in bundled banks and ledger-published generated bank already used by PR #15. Generated unreviewed batches remain outside the manifest. Finish the Mezmur is source-only: PR #15 contains no such record, and the importer will create one only from a caller-supplied published hymn selection without copying lyrics. No translation, lyric, citation, or metadata is fabricated.

## Test evidence

### Disposable database staging — real PostgreSQL roles, not hosted Supabase

PostgreSQL 17 was initialized as a separate loopback-only scratch cluster. The staging scaffold reproduced the supplied live four-state/six-game constraints, inconsistent review RPC, permissive policies, zero content rows, and exactly four published Church Library books.

- Proposal applied successfully and reapplied against the reconciled schema.
- Existing SQL regression: all 180 role/from/to transition cases, 8 mode cases, UUID immutability, legitimate draft editing, and malformed-publication rejection passed.
- Full import batch `d50f0369-fd4f-4fa9-aa64-3405f3a63625`: requested 834; inserted 834; duplicates 0; conflicts 0; failures 0; status `completed`; all 834 remained draft; 11 imported formats represented.
- Real database-role/RLS probe passed for `anon`, ordinary `authenticated`, editor, administrator, and `service_role`: visibility, draft submission, approval, publication, archive hiding, audit visibility, direct service publication/update denial, legacy alias normalization, missing-source publication denial, duplicate/conflict/invalid audit entries, and one-removed/one-blocked rollback.
- All 21 records referencing the absent History or Seven Sacraments books remained non-publicatable.

This is stronger than an application-layer role mock, but it is not evidence for hosted Supabase JWT claims, PostgREST role switching, project grants, or a production clone.

### CMS, loaders, gameplay, and build

- `test-consolidation.ts`: 16/16 checks passed; 834 candidates validate, hashes are reproducible, every included engine meets its minimum, and exclusions are reported.
- New CMS round-trip: all 834 drafts opened through the real row adapter and validator, were edited/saved through the real library API over an in-memory query client, and reopened across the 11 formats actually present. This is mocked persistence, not a live CMS browser session.
- Mocked browser database suite: 18/18 passed; published payloads reached all 12 engines, adventure deep links/history survived, unpublished/archived empty states were enforced, network Retry recovered, database counts rendered, and mobile bilingual states had no browser errors.
- Consolidation browser suite: 18/18 passed; all 12 formats loaded from mocked database rows; trivia, emoji, and finish-the-verse completed five-question scoring rounds and replayed.
- Finish the Mezmur engine: 14/14 unit checks passed; its browser mix exercised choose, arrange, and type formats.
- Picture quiz feedback: 1,113/1,113 assertions printed for feasts and saints across languages, widths, answer modes, scoring/review, and replay; its runner did not exit after completion and was interrupted.
- Bible Timeline unit test passed. Its feedback browser suite timed out before interaction and is not counted as passing.
- The general hub suite passed navigation/responsive checks but retained one stale Who Am I category-count assertion. The general solo suite completed/replayed trivia and emoji, then failed a randomization assertion when the second finish-the-verse round selected the same five items.
- Targeted ESLint for every changed TypeScript/TSX file passed. `PrayerListPage.tsx`'s known synchronous-effect lint error was independently removed and its focused lint passed.
- Production TypeScript/Vite build passed. It retained the existing CSS `::highlight` minifier warning.
- Full-repository ESLint remains red with 211 errors and 13 warnings outside this remediation (plus generated/temp baseline files); changed-file lint is green.

The evidence does **not** establish complete scoring and replay through live database records for all 12 games. Only three consolidated database-backed formats have complete mocked-browser rounds; other formats have combinations of loader/start tests and specialized engine/browser tests. This must remain a rollout blocker.

## Unresolved issues

1. Run the exact proposal on an isolated hosted Supabase staging clone and verify catalog diffs before committing it. Then repeat with real anonymous, user, editor, administrator, and service-role tokens through PostgREST.
2. Exercise all 834 records in the actual CMS UI—open, edit a reversible field, save, reopen—and capture per-ID results. The in-memory API round-trip is not a substitute.
3. Complete scoring and replay for all 12 database-backed games. Fix or replace the stale Who Am I count assertion, deterministic replay assertion, and Bible Timeline browser timeout.
4. Validate the four existing Church Library slugs and publication-status column names against the hosted staging catalog. The proposal intentionally fails closed for missing History/Seven Sacraments slugs.
5. Confirm the live `pgcrypto` extension and production constraint definitions match preflight expectations. Unknown semantics must abort, not be coerced.
6. Resolve the repository-wide lint baseline separately; do not fold 200+ unrelated fixes into PR #15.
7. PR #15 is stacked on PR #14, and merging PR #14 can deploy production. Rebase or retarget only after the deployment coupling is explicitly reviewed.

## Revised rollout checklist

- [ ] Approve this exact proposal for **hosted isolated staging only**; capture preflight catalog, RPC, grants, and policy definitions.
- [ ] Apply without commit, run catalog assertions, then explicitly commit staging or roll back.
- [ ] Run the 834-row draft import with a reviewed source commit, project-ref match, immutable backup, and local/database audit manifests.
- [ ] Confirm 834 inserted drafts, zero failures/conflicts, and zero published rows; reconcile any deviation before continuing.
- [ ] Test real JWT/PostgREST boundaries for anonymous, ordinary authenticated, editor, administrator, super-administrator, and service role.
- [ ] Run the actual CMS open/edit/save/reopen matrix for all 834 IDs.
- [ ] Run full gameplay, scoring, completion recording, and replay for all 12 formats at mobile and desktop widths.
- [ ] Confirm all 21 absent-source records cannot publish and that generated/unreviewed batches are absent.
- [ ] Have editorial/content-rights owners add and approve History and Seven Sacraments books before allowing their linked questions to publish.
- [ ] Dry-run exact duplicate, conflict, invalid-row, interrupted-import, unchanged rollback, and edited-row rollback-blocked scenarios.
- [ ] Review PR #15 independently of PR #14 deployment behavior; do not let a base-branch merge deploy these changes implicitly.
- [ ] Obtain separate authorization before production SQL, production import, flags, merge, push, or deploy.

## Addendum — rollback security review (local, disposable PostgreSQL only)

- `rollback_play_content_import` must stay `SECURITY DEFINER`: `service_role` has no DELETE grant and bypasses RLS, so as `SECURITY INVOKER` it fails with `permission denied for table play_content_items` (reproduced). Making it work would need a DELETE grant on every row, including published ones, which is strictly broader than the bounded function.
- The authorization suite now allowlists exactly `public.rollback_play_content_import(uuid)` (`scripts/migration-security-audit.mjs`) and fails on any other definer function, a changed signature, a missing/partial REVOKE, a grant to anyone but `service_role`, a missing empty `search_path`, dynamic SQL, or an unqualified relation. 14 negative mutations prove it. The "no DELETE/TRUNCATE/DROP" rule still applies everywhere except the single conditioned DELETE in that function.
- The rollback now deletes with one atomic, fully-conditioned statement (stable ID, draft, never reviewed/published, unchanged `updated_at` and payload hash), fails closed on an unknown or null batch, and derives batch status from the audit rows so a repeat call cannot hide a partial rollback.
- The preflight now verifies `church_library_books.slug` and `publication_status` (text) and the three Supabase roles before any change. Four broken-catalog variants abort with the catalog unchanged.
- `supabase/tests/faith_challenges_rollback_security.sql` covers catalog shape/ownership/ACL, denial for anon/user/editor/admin, no direct service-role delete/update, cross-import, edited/reviewed/published/returned rows, repeat calls, and a failure injected mid-rollback. A two-session concurrency probe showed a concurrently edited draft is preserved.
- Still unverified: hosted owner/default privileges, PostgREST/JWT role switching, and any Supabase-managed role behaviour.
