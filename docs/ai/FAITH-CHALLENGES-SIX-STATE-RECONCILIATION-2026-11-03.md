# Faith Challenges six-state reconciliation (review only)

Follow-up local preparation: row UUID immutability and missing/NULL Mezmur-mode rejection were added to this same proposal and passed disposable PostgreSQL regression tests. See FAITH-CHALLENGES-LOCAL-TESTING-2026-11-03.md for current results and local Supabase prerequisites. No hosted migration or real Supabase/PostgREST run has occurred.

Proposal: `docs/ai/proposed-migrations/20261102_faith_challenges_live_reconciliation.sql` (revised in place; no competing migration).
Preflight / post-check (read-only): `docs/ai/proposed-migrations/20261102_faith_challenges_live_verification.sql`.
Nothing here was executed against a live, staging or production database.

## 1. Retired proposals

| File | Status |
| --- | --- |
| `20261102_faith_challenges_compatibility.sql` | Superseded (four-state CHECK). Do not apply. |
| `20261102_faith_challenges_soft_archive.sql` | Superseded (live CHECK already allows `archived`). |
| `20261102_faith_challenges_authorization_reconciliation.sql` | **Obsolete four-state.** Now begins with an `OBSOLETE` banner and a `raise exception` guard before `begin;`, so even an accidental run aborts. |

## 2. Evidence ledger

The raw catalog output was supplied in an earlier session. It is **not stored in the repository**, so it could not be re-read or re-checked this session; the items below are what that evidence is recorded as establishing. Treat "previously verified" as a claim to re-confirm with block 1-10 of the verification SQL, not as fresh proof.

**Previously verified (user-supplied live catalog evidence, not re-checked now)**
- The live `status` CHECK constraints already allow six states: draft, review, approved, rejected, published, archived (so `archived` needs no new column and existing review/archived rows are valid).
- Six permissive RLS policies exist on `play_content_items` (permissive policies OR together, so any broad one defeats a narrow new one).
- Table grants and the live `review_play_content` definition were captured.
- `is_staff()` and `current_user_role()` exist; the proposal reuses them and creates no new SECURITY DEFINER function.

**Still requires a fresh live check (unknown)**
1. Exact status-CHECK names/definitions and that each is `convalidated` (the migration now aborts, rather than drops, any status CHECK that is not exactly the six-state domain).
2. Whether `stable_id` exists, is NOT NULL, and has a valid unique index (each step is now skipped when already satisfied).
3. Count of `published` rows lacking `published_at` (migration aborts if any; they need a human decision).
4. Rows whose `question_id` / `stable_id` / `payload->>'id'` disagree (aborts).
5. `current_user_role()` return type (`cms_role` vs `user_role` enum vs text) and that role values are exactly `editor`, `admin`, `super_admin` for staff.
6. Whether `service_role` / the importer is granted on the table and whether other triggers exist (the migration replaces only `play_content_editorial_guard`).
7. Column-level grants, FKs into the table (`play_room_rounds.content_id` restricts delete), owners and `proconfig` of the touched functions.
8. That existing review/approved/published rows pass `play_content_payload_valid` (affects the *next* transition of those rows, not the migration).
9. Real JWT behaviour through PostgREST (cannot be proven in the SQL Editor).

## 3. Design (what changed this session)

Existing evidence already satisfies the status domain, so schema changes were minimised (requirement 11):
- **No status CHECK drop.** The old script dropped `play_content_items_status_check` / `play_content_status_compat` by guessed name. It now inspects every status CHECK: exactly one validated six-state CHECK → left untouched; none → adds `play_content_status_v2` (NOT VALID, then VALIDATE); anything else → aborts naming the constraint.
- `stable_id` backfill, `SET NOT NULL` and the unique index are each conditional on the live state.
- No data is deleted or status-rewritten. The only possible data write is `stable_id := question_id` for rows where it is null (preflight already proves they match).
- **Importer fix found by local testing:** the guard trigger would have rejected the existing `scripts/import-play-content-drafts.ts --apply` (service key, no JWT user). The guard now lets `current_user = 'service_role'` INSERT drafts only (never update/transition/publish). It keys on `current_user`, not a JWT claim, so it cannot be spoofed by a GUC.

Allowed transitions (database function `play_content_transition_allowed`, mirrored in `src/lib/play/questionLibrary.ts`):
- editor, admin, super_admin: draft → review
- admin, super_admin: review → approved/rejected/draft/archived; approved → published/draft/archived; rejected → draft/archived; published → draft/archived; draft → archived; archived → draft
- Nobody: draft/review/archived → published directly; anon and ordinary `user` roles have no transitions.

Boundary enforcement (direct table writes included): the `BEFORE INSERT OR UPDATE` trigger enforces the matrix, immutable IDs, draft-only inserts, no content edits outside draft, server-set `published_at`/audit fields. RLS: one public SELECT policy `status='published' and published_at is not null`; staff SELECT; staff INSERT (draft, `question_id=stable_id`); editor UPDATE (draft rows only, result draft/review); admin UPDATE. No DELETE grant or policy.

Operational consequence: the trigger also blocks elevated SQL-editor edits (no `auth.uid()`), e.g. fixing a published row missing `published_at`. Do such repairs in a separate, reviewed transaction with `alter table ... disable trigger play_content_editorial_guard` and re-enable in the same transaction.

## 4. Local verification actually performed (throwaway PostgreSQL 17, no Supabase)

A scratch cluster simulated the live shape (six-state CHECK, review and archived rows, old permissive policies incl. `FOR ALL`, definer `review_play_content`). Results:
- Migration applied; all six statuses and all rows preserved; existing six-state CHECK kept (no duplicate); old policies replaced by exactly five; second apply is idempotent.
- Abort paths: stale four-state CHECK → abort, policies unchanged; published without `published_at` → abort; `ROLLBACK` restores the old policies.
- Role probes (anon, ordinary user, editor, admin, service_role) via RPC **and** direct UPDATE/INSERT/DELETE: all matched section 3, e.g. editor cannot approve/publish/archive or forge audit fields; direct admin publish gets a server `published_at`; forged `published_at` rejected; DELETE denied; `archived → published` and `review → published` rejected; legacy review/archived rows transition normally; anon sees only published rows with a timestamp; service_role can insert drafts only.
- The verification SQL ran clean in a `READ ONLY` transaction.

Limits of that evidence: a simulation. `auth.uid()`, `is_staff()`, grants and default privileges were stubbed, so it does not replace the staging test.

## 5. Transaction safety and rollback

- Everything is in one transaction with `pg_advisory_xact_lock`; the file ends without `commit`, so a paste-and-run in the SQL Editor does not commit until you add it. Run with `psql -v ON_ERROR_STOP=1` (without it psql prints a wall of "transaction aborted" noise after the first error, though nothing commits).
- Before commit: `ROLLBACK;` fully cancels.
- After commit there is no automatic rollback. Before committing, save the full output of verification blocks 1-6 (policies with `qual`/`with_check`, grants, trigger list, `review_play_content` definition). To revert: drop trigger `play_content_editorial_guard`; recreate the saved policies and grants after dropping the five new policies; restore the saved `review_play_content` body (security definer as before); drop `play_content_status_v2` and `play_content_stable_id_v2_idx` only if the migration created them. Helper functions are inert if left. Prefer a staging snapshot/PITR as the true rollback.

## 6. Staging verification checklist (isolated staging only)

1. Run the verification SQL; compare section 2 unknowns; stop on any surprise.
2. Apply with `ON_ERROR_STOP`, re-run block 10: expect 5 policies, 1 status CHECK, guard trigger enabled, anon select = t / insert = f, authenticated delete = f.
3. With real JWTs for anon, ordinary user, editor, admin, super_admin (profile roles confirmed; no forged tokens), replay the matrix: RPC and direct PostgREST PATCH/POST/DELETE for every cell in section 3, plus forged `published_at`, `reviewed_by`, `stable_id` and `status` on insert.
4. Anonymous REST read returns only `published` rows with `published_at`; confirm `contentService` and Game Night's published-content reads still work, and that a published → archived row disappears.
5. Run `import-play-content-drafts.ts --apply` against staging with the service key (drafts insert; nothing else).
6. Re-run the admin UI as editor (only "Submit for review") and admin (approve, publish, archive, restore).
7. Confirm existing review/archived rows round-trip without data loss (row counts per status identical before and after).

## 7. CMS profile-error smoke diagnosis (requirement 9)

`scripts/cms-auth-smoke.mjs` passes 3 of 3 runs on the current tree, so the failure could not be reproduced. The expected UI behaviour comes from the app, not from the test: `src/lib/auth/AuthProvider.tsx` and `AdminAuth.tsx` show a permission failure (HTTP 403 / `42501`) as "Signed in, but profile access was denied…" and keep the user out until they press **Check access again**; an outage (5xx) shows "Unable to load your account. Try again." with the same button; bad credentials show "The email or password is incorrect." The older assertions (`Sign-in failed`, `Unable to verify CMS access`, a `Retry` button) matched no string the app renders. The updated assertions use the real strings, split denial from outage, and add `Dashboard` heading count = 0 while blocked. Authentication was not relaxed.

## 8. Decision

- Isolated staging testing: **GO** for review-only staging of this proposal, in a disposable database restored from a production-safe copy, once the section 2 unknowns are collected with the read-only SQL.
- Production deployment: **BLOCKED** until staging passes the section 6 checklist with real JWTs and the section 2 items are confirmed.
