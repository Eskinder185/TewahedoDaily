# Security remediation Sprint 3 — 2026-11-03

**Staging validation: BLOCKED for execution**, pending separately authorized disposable database provisioning, catalog review and proposal application. Local test harness readiness: GO. **Production deployment: BLOCKED.** No SQL, staging/production request, migration, dependency install, credential change, paid agent, staging/commit/push or deployment was executed. The pre-existing dirty worktree was inspected; edits were limited to the files below. Prior document XSS/archive fixes and V4/V5 were preserved.

## Implemented and verified locally

| Finding | Evidence / change | Status |
|---|---|---|
| Game Night nested answer leak in proposed DTO | `play_room_question_view` previously used `#>>`/`->>` on arbitrary localized JSON. An object such as `prompt.en={correctKey:...}` became a string. Existing Game Night proposal now uses `play_room_text`, accepting only JSON strings, at every projected scalar. Start validates unique option keys and localized scalar types. | SQL proposal corrected; structural regression PASS. PostgreSQL runtime UNKNOWN. Editorial review must still reject answers embedded semantically in ordinary prompt/option strings. |
| Browser-authorized cloud XP | `progressSync.ts` previously sent caller score, maxScore and full progress to `record_play_completion`. Shared sync now returns explicit `local-only` without making that call. Guest/local awards, gameplay and existing stored XP/history are unchanged. | PASS source and actual browser invocation. Old deployed RPC remains exploitable by old/direct clients until its grant is revoked after approval. |
| Trusted reward integration | Existing reward proposal now includes `claim_verified_play_room_reward(room,participant)`. It binds auth.uid() to the joined participant, requires a finished room and every configured 5/10/20 private-question round answered, derives score from server submissions, and uses stable `game-night:<room UUID>` activity identity. `game-night` is distinct from solo trivia. | Implemented as UNAPPLIED SQL, not a deployed verifier. Only this game has sufficient server-held evidence today. |
| Duplicate/retried reward UI | New receipt adapter accepts only references, validates activity/amounts/types, sanitizes errors, and never adds a receipt delta to local XP. New Game Night control shows authoritative total separately; retry is safe after an uncertain response. Account identity is part of component reset key. | 15 focused tests and mocked browser flow PASS. Real concurrent database execution UNKNOWN. |
| Player remains disabled in next round | Existing selected-answer state was shared across round IDs; only host start cleared it. Selection is now associated with round ID and committed after a successful submit. | Actual player browser round transition PASS. |
| Persistent CMS auth smoke failure | Synthetic `Test failure` is returned verbatim by existing short-message mapping; test incorrectly expected `Unable to verify CMS access`. Retry label is actually `Check access again`; header/sidebar both contain Sign out. | Test now injects realistic 42501/403 denial AND PGRST000/500 outage, asserts exact accessible error text and absent Dashboard, checks explicit recovery, scopes Sign out to banner. Invalid-password and unassigned-user assertions retained. Final auth smoke PASS. No authentication application code changed. |

XP scope is deliberately explicit: signed-in solo/Adventure completions remain local-only until game-specific trusted sessions/event validation exist. Do not claim once-per-story server rewards are implemented. Existing Adventure categoryMastery deduplication remains a convenience local check, not cross-device authority. No browser snapshot is imported into verified XP. New verified totals are displayed separately from local practice XP; legacy cloud snapshot loading remains unchanged. No historical XP is reset/backfilled.

The ledger unique `(user_id,game_type,activity_id)` and unique evidence ID remain the independent atomic reward boundary. The unique INSERT and XP increment are in one transaction. The new Game Night verifier locks its finished room, returns a zero-delta receipt for prior awards, and creates no extra evidence on ordinary retries. Authenticated users cannot call the internal award or insert private evidence. These are reviewed source properties, NOT proven effective staging grants or concurrency results.

## Game Night proposal review

- New/open rounds use only reviewed private questions. Public solo question payloads remain public intentionally; do not provision a secret bank by copying them. Private content tooling is still a prerequisite for real rooms; synthetic questions suffice only for the disposable security fixture.
- Open RPC state whitelists prompt/options; answers/explanation/source appear only after reveal. Participant score includes revealed rounds only. Direct table grants must deny room/submission/private-bank reads for every client role, including staff. Do not assume service-owned functions plus RLS automatically achieve this in deployed grants.
- Host ownership and participant token/room membership are retained. Staff roles confer no room ownership. Answer uniqueness and round row locking remain the scoring/race boundaries. Client understands bounded JSON join errors, not just thrown PostgREST failures.
- Wrong-code and duplicate-name attempts return data outside the uniqueness subtransaction, retaining the attempt INSERT. Global advisory lock serializes checks. Counters are durable only after a committed HTTP request; a rollback-only SQL test cannot establish that. The prepared HTTP harness explicitly tests ten independent rejected requests and the eleventh throttle.
- Global cap100/minute and per-authenticated-user cap10/minute remain. Anonymous traffic shares the global bucket; crowd denial of service and gateway abuse protection are unresolved production concerns. Host create-room rate limiting and answer-bank reuse/farming policy also require operational review. Correctness must not be inferred from timings or private semantic content; no anti-bot certification is claimed.

## Prepared staging evidence, not executed

`supabase/tests/security_sprint3.sql` uses real SET ROLE and auth.uid() fixture identities for anonymous, player, host, editor, admin, super_admin. Owner-only synthetic setup checks fixture namespace/counter isolation and rolls back. It covers direct role writes, legitimate role RPCs, no automatic staff host rights, private bank/submission denial, guest join, hidden/revealed answers, forged member token, duplicate submission, five-round scoring, authenticated reward/replay/IDOR, and rejection counters within a transaction. It does not disable RLS/triggers. It has NOT been parsed/executed by PostgreSQL; deployed enum/RPC and grant compatibility remain unknown. Last-super-admin concurrent demotion still needs the dedicated two-connection test from Sprint 2.

`scripts/security-staging-checks.mjs` defaults to plan-only and needs an external nonsensitive fixture manifest. Execution requires `--execute --disposable-staging`, an independently supplied matching project ref, publishable key, actual role JWTs and player token in environment. Each authenticated JWT and own profile role is verified before denial checks. The harness makes 60 assertions across private-table/host rights, safe open projection, HTTP rejection durability, concurrent/retried reward receipts and cross-user reward denial. It never reads .env automatically or prints tokens/raw response bodies. The declaration/project-ref check cannot prove that an operator's project is disposable: approval and independently verified project ownership/isolation are mandatory.

The fake transport test exercises the SAME harness and proves it rejects expired JWTs, answer leakage, rolled-back counters and two successful awards. This is test-harness validation only, NOT actual database authorization. A 406 private-schema response is accepted only with PGRST106; unrelated server errors fail.

### Exact future verification procedure (NOT run)

1. Capture read-only catalog evidence using `SECURITY-LIVE-VERIFICATION-2026-11-03.sql`. Check live profile enum/RPC signature, table and column grants, private schema exposure, pgcrypto resolution, trigger definitions, activity/game constraints, ledger uniqueness and all permissive RLS composition. Unknown pre-existing same-name private tables must match proposed constraints; CREATE IF NOT EXISTS does not repair them.
2. Obtain explicit approval; provision an EMPTY disposable Supabase staging database. Review/apply existing proposals in profile → Game Night → verified rewards order. Finish existing active rooms before any eventual real cutover. This sprint did not apply them.
3. Owner-only rollback fixture (after approval): `psql "$env:SECURITY_STAGING_DATABASE_URL" -X -v ON_ERROR_STOP=1 -f supabase/tests/security_sprint3.sql`. This is a future write test, NOT a read-only catalog command. No database URL was read or logged here.
4. Separately provision committed synthetic API fixtures: six identities (anonymous plus ordinary player/host, editor, admin, super_admin), five reviewed private questions, one OPEN room and one FINISHED unclaimed room with all configured answers submitted by the player. Use distinct authenticated players/participants per room as needed; host must have zero join attempts in the preceding minute. No other activity may run against this database during race tests. Do not use public production questions, accounts or credentials.
5. Put only `disposable:true`, a 20-letter `projectRef`, and four UUID fields `openRoomId`, `rewardRoomId`, `playerParticipantId`, `rewardParticipantId` in an external fixture JSON. Put credentials only in environment: `SECURITY_STAGING_PROJECT_REF`, `SECURITY_STAGING_PUBLISHABLE_KEY`, `SECURITY_STAGING_PLAYER_JOIN_TOKEN`, and `SECURITY_STAGING_PLAYER_JWT`, `HOST_JWT`, `EDITOR_JWT`, `ADMIN_JWT`, `SUPER_ADMIN_JWT` (all with the `SECURITY_STAGING_` prefix).
6. Safe plan command: `node scripts/security-staging-checks.mjs --fixture "$env:TEMP\security-staging-fixture.json"`. Separately approved execution command adds `--execute --disposable-staging`. This performs test writes and reward claims in that fixture database; never run against production. Reprovision the disposable fixtures to repeat it; do not reset live counters/rewards.
7. Capture owner-only ledger/result/XP deltas separately: exactly one ledger/result and one XP increment for the two claim requests. Also test independent evidence rows for one stable activity, transaction failure then retry, historical XP preservation, simultaneous submit/reveal, last-super-admin demotions, expired/forged tokens, guest submission/reveal, and crash after commit/before response. HTTP Promise.all is concurrent request evidence, not a guarantee of overlapping PostgreSQL execution; force overlap using two controlled sessions in a dedicated follow-up fixture.

## Remaining dependency risk

Fresh npm advisory query: **3 High entries, 0 Critical**, unchanged. No package/lock edits or installs this sprint. Compatible fixes from Sprint 2 remain installed.

| Path | Current / patched | Exploitability evidence / decision |
|---|---|---|
| pptxgenjs → image-size | 3.12.0 → 1.2.1; parser fixes start2.0.3 | Same-major PptxGenJS metadata still requires ^1.0.0. Existing export creates text slides, no images; browser mapping disables image-size, but Node consumers remain exposed to hostile image buffers. All22 presentation/export tests PASS. Major parser override is not proven compatible, so none applied. [Advisory](https://github.com/advisories/GHSA-5p2g-fcmc-qvqq). |
| Transformers → nested Sharp | 3.5.1 → 0.34.5; latest required patch0.35.5 | Queried all current v3 metadata through3.8.1: ^0.34.1. Direct dev Sharp0.35.5 does not fix nested copy. Native image-decoder vulnerability includes glibc Linux RCE under documented conditions; browser package disables Sharp, current application import is a browser worker. This does not establish Node/CI safety. No cross-0.x-minor override/major Transformers upgrade approved. [Upstream advisory](https://github.com/advisories/GHSA-wq5f-xc86-pv6w). |
| @huggingface/transformers audit entry | Patched parent recommendation4.3.2 | Inherited Sharp path, not a third independent exploit. Requires separately approved major migration and Whisper regression/model tests; no unproven automatic upgrade. |

## Exact commands executed and results

| Command | Exit / evidence |
|---|---|
| `git status --short`; scoped `git diff`; `git diff --cached --stat` | Read-only preservation/ownership review; no staged changes. No repeat full-site audit. |
| `npm.cmd audit --omit=dev --json` via PowerShell projection retaining `$LASTEXITCODE` | Initial restricted-network call unavailable; authorized read-only retry exit1 with3 High. Error handling explicitly distinguishes unavailable audit from clean result. |
| `npm.cmd view pptxgenjs@3 version dependencies.image-size --json` | 0; no compatible patched dependency range. |
| `npm.cmd view @huggingface/transformers@3 version dependencies.sharp --json` | 0; v3.8.1 still ^0.34.1. |
| `npx.cmd tsx scripts/test-security-sprint2.ts` | 0;6 actual client cases plus updated SQL contracts. Scalar whitelist expectation updated to the stricter function. |
| `npx.cmd tsx scripts/test-security-sprint3.ts` | 0;15/15, receipt validation/legacy sync/SQL source contracts. |
| `node scripts/test-security-staging-harness.mjs` | 0;60-assertion success fixture plus4 injected failures and2 unsafe manifests. No HTTP. |
| `node scripts/security-staging-checks.mjs --fixture <new nonsensitive TEMP fixture>` | 0; actual CLI default plan-only exercised. No HTTP requests or database activity. |
| `node scripts/test-game-night-security-browser.mjs` | Final0; mocked actual browser checks. First run exposed a test race awaiting async submit state; now waits for aria-pressed=true rather than arbitrary delay. Also confirms forged legacy completion makes zero reward RPCs. |
| `npm.cmd run test:cms:auth` | Final0; includes both403 denial and500 outage. Intermediate1 exposed ambiguous Sign out locator; fixed by banner scope. No application auth changes. |
| `node scripts/test-faith-challenges-editor.mjs` | 0; mocked-browser create/persistence/approval/publication/unpublish/access. |
| `npm.cmd run test:faith-challenges:authorization` | 0; deterministic authorization model/migration contracts, NOT live RLS. |
| `node scripts/test-play-complete.mjs` | 0. |
| `npm.cmd run test:play-milestones` | 0. |
| `npm.cmd run test:mezmur-presentation` | 0;22/22 including actual PPTX generation. |
| `node scripts/test-document-html-security.mjs` | 0; original exploit/6 hostile fixtures, normal formatting and archive boundaries. |
| `npx.cmd tsc -b --pretty false` | 0. |
| `npx.cmd eslint src/lib/play/progressSync.ts src/lib/play/verifiedRewards.ts src/components/play/VerifiedRoomReward.tsx src/pages/play/GameNightPage.tsx scripts/test-security-sprint2.ts scripts/test-security-sprint3.ts` | 0; no new lint findings. Existing repository-wide lint debt not reclassified or rescanned. |
| `npm.cmd run build` | 0;900 modules; normal build output and PWA artifacts. No deployment. |
| `node --check` on4 new/changed .mjs scripts; scoped `git diff --check`; explicit new-file whitespace checks | PASS (see final verification). |

## Exact files and rollback

Modified: `src/lib/play/progressSync.ts`, `src/pages/play/GameNightPage.tsx`, `scripts/cms-auth-smoke.mjs`, `scripts/test-security-sprint2.ts`, existing `20261103_game_night_security.sql` and `20261103_verified_play_rewards.sql` proposals, read-only verification SQL, original audit cross-reference, HANDOFF.md. Added: `src/lib/play/verifiedRewards.ts`, `src/components/play/VerifiedRoomReward.tsx`, `scripts/test-security-sprint3.ts`, `scripts/test-game-night-security-browser.mjs`, `scripts/security-staging-checks.mjs`, `scripts/test-security-staging-harness.mjs`, `supabase/tests/security_sprint3.sql`, this report. No duplicate migrations, package changes or V4/V5 changes in this sprint.

For local rollback, reverse only these Sprint3 hunks while preserving Sprint1/2 and unrelated dirty work. Do not reset/stash/clean. Re-enabling browser-authorized XP is a security regression, not a recommended rollback. Database rollback requires captured original DDL and approved review; preserve reward ledger/history and existing XP. No database rollback is needed now because no SQL was executed.

Remaining BLOCKED/UNKNOWN: effective live grants/RLS, PostgreSQL proposal syntax/runtime, concurrency/rollback proofs, trusted solo/story verifiers, private question editorial/provisioning path, production gateway abuse controls, three High dependency entries, and broader prior audit findings outside this targeted sprint. This is preparation and local remediation, not a security certification.
