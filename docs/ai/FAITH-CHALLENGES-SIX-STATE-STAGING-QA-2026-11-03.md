# Faith Challenges six-state staging QA — 2026-11-03

Follow-up: the two identified validation gaps are now fixed in the existing proposal and verified with disposable PostgreSQL before/after regressions; see FAITH-CHALLENGES-LOCAL-TESTING-2026-11-03.md. Source hashes/line references below describe the earlier reviewed revision. Real Supabase/PostgREST and production remain BLOCKED; the local simulation is not deployed authorization evidence.

**Execution BLOCKED: authorized staging target/configuration unavailable. Production remains BLOCKED.** Isolated staging approval is acknowledged; no repeat approval for the already authorized action is requested. The missing inputs are the exact disposable project reference and its local staging-only connection/credentials configuration. They were requested during this run; no answer was available when this report was prepared.

No SQL, Supabase request, migration application, credential change, infrastructure provisioning, production access, staging/commit/push or deployment occurred. Existing Game Night, XP, application changes and unrelated work were preserved. Only this report was added. Local build/test output is not staging authorization evidence.

## Evidence and task outcomes

| Requested check | Result | Evidence / limit |
|---|---|---|
| Read project/reconciliation documents and entire migration | PASS | Read all four coordination documents, six-state reconciliation report, both SQL files, service/UI validators, importer and focused tests. |
| Identify isolated staging target | UNKNOWN / BLOCKED | No SECURITY_STAGING_PROJECT_REF, SECURITY_PRODUCTION_PROJECT_REF, PGHOST, PGUSER, PGPASSWORD, PGSSLMODE, staging database URL, public/service key or ordinary/editor/admin JWT variables in this process. No staging configuration in the targeted .env.staging/.env.staging.local paths; .env/.env.local contain no explicitly named staging/connection configuration. Values were not printed. Existing application endpoints were NOT queried or treated as staging. |
| Read-only staging catalog preflight | UNKNOWN | No connection attempted. Constraints/indexes/triggers/owners/grants/column ACLs/FKs and data compatibility cannot be confirmed from migration files. |
| Source review: destructive operations/privileges | PASS with concerns below | No DELETE/TRUNCATE/DROP TABLE/DROP COLUMN found. Conditional stable_id backfill is a data write. All table policies are replaced, a known trigger is replaced, grants are narrowed, stable_id is constrained/indexed conditionally. Actual effective permissions remain UNKNOWN. |
| Apply migration to authorized staging | NOT RUN / BLOCKED | No specific target could be verified; application repository credentials were not reused. |
| Real anon/ordinary/editor/admin JWT requests | UNKNOWN | No JWTs/endpoint available. Anonymous means public API credentials, not a forged user token. |
| Service-role import and unauthorized publication denial | UNKNOWN live; PASS local dry run | Importer validates37 local source-linked candidates without --apply; no service request occurred. Existing service-role draft-only trigger branch is source evidence only. |
| All six states / every allowed and denied transition | PASS offline; UNKNOWN live | Two separate source/TypeScript suites each cover180 role/state pairs (5 roles x6 x6). They overlap and are NOT360 independent database cases. |
| Published-only anonymous visibility | PASS model/source; UNKNOWN live | Public policy requires status=published and published_at IS NOT NULL; local filtering model passes. Actual RLS composition is untested. |
| Editor/admin end-to-end | PASS mocked browser; UNKNOWN staging | Browser creates/reopens/previews, editor submits review, admin approves/publishes/unpublishes, and ordinary access is denied in a mocked API. Rejected/archived UI paths are not claimed as browser-tested here. |
| Migration idempotency and maintenance/recovery | UNKNOWN runtime | Prior reconciliation document reports scratch-PostgreSQL simulation, not fresh Supabase staging evidence. No apply/reapply or trigger maintenance was executed here. |
| Focused Play checks, TypeScript, ESLint, build | PASS | Commands/results below. |

## Full migration review

Reviewed proposal: `docs/ai/proposed-migrations/20261102_faith_challenges_live_reconciliation.sql`.

- Lines5–7 begin a transaction and serialize this migration with an advisory lock. **The file has no COMMIT** (lines289–291). `psql -f` alone closes an uncommitted session and will not apply it durably.
- Lines10–34 check required tables/functions/columns, identifier correspondence and published timestamps. Lines42–56 may backfill only null stable IDs and add NOT NULL/uniqueness. Unexpected constraints/index name collisions or other pre-existing trigger behavior can abort; inspect actual staging definitions before proceeding.
- Lines59–77 inspect status checks, preserve a recognized validated six-state check or add one. This is a textual constraint heuristic, not proof of equivalent domains. Inspect EVERY actual status constraint, including extra checks without a draft literal. Multiple equivalent constraints are not rejected by equivalent>1 even though the postcheck expects exactly one.
- Lines82–169 add INVOKER validation helpers; lines243–261 replace review_play_content with SECURITY INVOKER, authenticated EXECUTE. Existing is_staff/current_user_role privileged lookup behavior is not changed or freshly verified.
- Lines178–195 allow current_user=service_role INSERT of identifier-consistent drafts only and reset audit/publication fields. UPDATE takes the staff path. The proposal does not grant service-role table INSERT explicitly; verify its actual table/column/default grants and helpers before asserting importer compatibility. A service key remains a privileged server credential, not an untrusted browser role.
- Lines263–286 enable RLS, revoke table privileges from PUBLIC/anon/authenticated, grant SELECT to anon/authenticated and INSERT/UPDATE to authenticated. Every existing policy is dropped and replaced with five explicit policies. This intentionally removes broad legacy ALL policies, but may remove intended restrictive policies too: save/review every effective policy and role membership. Table REVOKE does not by itself prove column-level privileges were removed. No DELETE is granted to client roles.
- The file does not touch Game Night or XP tables/functions. Changing play_content_items constraints/identifiers still requires FK/dependent-client review. Stable IDs are not renamed and rows/statuses are not deleted or rewritten except the conditional null stable-ID backfill.

### Review concerns requiring targeted staging negatives

1. **Primary-key immutability gap:** the trigger's immutable checks at lines197–199 compare question_id, stable_id and payload.id, but never old.id/new.id. Table UPDATE is granted at line266. The proposal alone therefore does not prohibit a staff PATCH changing the row UUID when no other constraint/trigger blocks it. Another deployed trigger or FK might reject it; effective staging behavior is UNKNOWN. Test UUID changes on an unreferenced draft as editor/admin. Do not mark the general claim “IDs are immutable” PASS based on the stable-ID test alone.
2. **Missing Finish Mezmur mode / SQL NULL:** lines164–165 use `p_payload->>'mode' NOT IN (...)` without an explicit null rejection. Missing/JSON-null mode produces SQL NULL; PL/pgSQL IF does not treat NULL as true, so this branch does not reject it. The TypeScript validator explicitly rejects missing/unsupported modes at `src/lib/play/questionLibrary.ts:105`. Test an otherwise valid payload with mode absent, JSON null, invalid and each valid mode through validator/RPC/direct PATCH. This is a source-level validation discrepancy, not a claimed executed database exploit. Do not commit to production with this discrepancy unresolved.
3. **Preflight phase separation:** companion verification SQL lines72–74 call play_content_payload_valid and are labeled post-migration-only. The helper may not exist before the first apply. Running the whole file as the initial preflight may abort, preventing clean evidence. Run numbered blocks1–9 inside the existing read-only transaction and finish with ROLLBACK; run block10/helper checks only after installation. This split can be prepared without changing the proposal.
4. **Transaction/recovery sequencing:** the companion file itself starts BEGIN READ ONLY and ends ROLLBACK. Do NOT include the full file inside the proposal's open transaction: its ROLLBACK would discard the migration. Inspect post-install catalog checks without transaction wrappers in that same session, COMMIT only after approved staging assertions pass, then run the full read-only companion separately. No auto-commit or rollback procedure was exercised here.

These concerns were reported without silently rewriting the reviewed migration or manufacturing a passing database result. No new migration proposal was created.

## Exact local verification

| Command | Exit / result |
|---|---|
| `node scripts/test-faith-challenges-live-reconciliation.mjs` |0; structural checks and180 role/transition cases. |
| `node node_modules/tsx/dist/cli.mjs scripts/test-faith-challenges-authorization.mjs` |0;180 SQL/TypeScript matrix cases, obsolete proposal guard and policy-source checks. |
| `node scripts/test-faith-challenges-editor.mjs` |0; mocked-browser editor/admin workflow/access gate. |
| `node node_modules/tsx/dist/cli.mjs scripts/test-faith-challenges-library.ts` |0; existing game formats, draft persistence/edit/duplicate/import/error/workflow/filter models. Missing Supabase-env warning expected for this offline invocation. |
| `node scripts/test-play-foundation.mjs` |0. |
| `node scripts/test-play-complete.mjs` |0. |
| `node node_modules/tsx/dist/cli.mjs scripts/test-play-milestones-2-4.ts` |0. |
| `node node_modules/tsx/dist/cli.mjs scripts/import-play-content-drafts.ts` |0;37 candidates validated, dry run only; no --apply. |
| `node node_modules/typescript/bin/tsc -b --pretty false` |0. |
| `node node_modules/eslint/bin/eslint.js src/pages/admin/PlayContentReview.tsx src/pages/admin/FaithChallengePreview.tsx src/lib/play/questionLibrary.ts src/lib/play/questionLibraryService.ts src/lib/play/contentService.ts scripts/import-play-content-drafts.ts` |0. No full-site lint rerun or claim that broader pre-existing lint debt is resolved. |
| `npm.cmd run build` |0;900 modules, production bundle/PWA artifacts generated locally; no deployment. |
| Read-only Git status, coordination/source review, secret-preserving configuration presence check |No staged/deleted files reported at start. No credentials/DB URLs/JWTs printed. No package installation. |

Reviewed SQL SHA256 (files unchanged):

- Migration: `9BE9B9B3398798C270DCB926B32C0C6B09547C184836C1B58226CC5ACBDE4F48`
- Verification: `220645C0DE0E320633B3C7F23C910C562F6B15597DB3C9978A2AE34AD62158BD`

## Required next evidence / production blockers

1. Supply the authorized disposable project reference plus the local staging-only credential configuration path/environment. Do not paste secrets in chat. Independently confirm separate project/API/PostgreSQL/Auth identities and synthetic-only data. Existing staging approval is sufficient for the described work once the exact target is established.
2. Obtain the actual preflight catalog/data evidence and a protected baseline snapshot. Resolve the source concerns above in the existing proposal after review; do not install competing four-state/soft-archive proposals. Do not modify production to create a convenient baseline.
3. Apply/reapply in that staging project with explicit transaction handling. Confirm policy count, check/index validity, IDs/status/row preservation, enabled triggers, function owners/security mode, column grants, dependency/FK compatibility and public-only publication filtering.
4. Execute all matrix edges with real anon/user/editor/admin (and preferably super_admin) sessions using BOTH RPC and direct table requests. Include no-op status requests, forged audit fields/IDs, invalid payloads, service-role draft import versus update/publication attempts, review rejection/archive/restore, and who-am-i/match publication restrictions. Return-to-draft content editing remains distinct from a permitted status transition.
5. Test the approved owner-only maintenance transaction, re-enable/check the guard before commit, test rollback on a forced failure, and preserve pre-change definitions. Recheck the deployed frontend against actual staging, not route mocks.

**Decision:** staging QA is authorized but cannot execute yet; no staging PASS is issued. Production migration/deployment remains BLOCKED by missing real evidence and the identified review concerns. Previous Game Night/XP, dependency and other security release blockers remain separate and unchanged.
