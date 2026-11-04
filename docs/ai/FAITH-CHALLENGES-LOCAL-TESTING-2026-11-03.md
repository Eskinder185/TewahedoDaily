# Faith Challenges local testing — 2026-11-03

**Local fixes PASS; production BLOCKED.** No hosted Supabase SQL/API requests were made. No packages/images were installed, Docker services started, application code changed, or Git staging/commit/push/deployment performed.

## Fixes and regression evidence

The existing `20261102_faith_challenges_live_reconciliation.sql` was corrected in place:

- The editorial UPDATE guard now compares `old.id IS DISTINCT FROM new.id` alongside logical identifiers. Existing physical UUIDs cannot be changed through either ordinary draft edits or a status transition.
- Finish Mezmur mode uses `coalesce(p_payload->>'mode','') NOT IN (...)`. Absent keys and JSON null no longer bypass rejection through SQL NULL semantics. The four established modes remain valid.

No new migration proposal was created. New tests are fixtures/tests, never production migrations.

Run the isolated PostgreSQL regression with installed PowerShell7/PostgreSQL17:

```powershell
& scripts/run-faith-challenges-sql-test.ps1
if ($LASTEXITCODE -ne 0) { throw 'Local PostgreSQL test failed.' }
```

The runner creates a fresh cluster outside the repository, clears inherited PG* overrides, binds ONLY127.0.0.1 on a random port, uses an ephemeral SCRAM password, verifies process/data-directory identity, and invokes psql with explicit local connection arguments. No .env, Supabase link or hosted URL is used. It stops its own server and deletes only its validated temporary directory on success; failures preserve diagnostics. It does not use Docker.

Actual result: **180 SQL transition-helper cases +16 targeted cases +3 preservation checks passed** on the corrected proposal, applied twice. A separate scratch database reconstructed only the previous two guard defects and demonstrated their acceptance before testing the corrected rejection behavior. Targeted cases include editor/admin UUID changes, legitimate draft edits, missing/JSON-null/blank/invalid/four supported modes, and invalid-mode publication through RPC/direct UPDATE. Test transactions roll back; synthetic baseline rows remain intact. The two runs are before/after evidence, not398 unique fixed-version tests.

**Limit:** `faith_challenges_local_baseline.sql` stubs auth.uid(), profile-role lookup and platform roles. SET ROLE runs PostgreSQL RLS/trigger behavior but does not verify JWT signatures, GoTrue, PostgREST or a deployed Supabase catalog. Do not apply this bare-PostgreSQL baseline to a real Supabase instance.

## Installed runtime inventory

| Component | Current evidence |
|---|---|
| PostgreSQL |17.9; initdb/psql/pg_ctl found; disposable runtime regression PASS. First sandbox attempt failed Windows restricted-token startup; the same local-only test passed with reviewed execution permissions. |
| Docker client |28.3.2 installed. |
| Docker daemon |Unreachable on default/explicit Docker Desktop Linux pipe, including read-only check outside the sandbox; no daemon was started. |
| Supabase CLI |Not found on PATH or node_modules/.bin. No global search/install performed. |
| Real local Supabase/Auth/PostgREST |NOT RUN; CLI/daemon and a platform-compatible public schema fixture are prerequisites. |

## Minimal disposable local Supabase workflow (prepared, not executed)

This is the next tier, not a claim the current PostgreSQL simulation is full Supabase. After separately arranging the missing CLI, running Docker and any required image downloads, use a new external workdir. No Supabase login/link/cloud command is needed. Init/start/status/stop and global --workdir/--output syntax are documented in the [official CLI reference](https://supabase.com/docs/reference/cli/supabase-init).

1. Use a dedicated terminal without hosted SUPABASE_ACCESS_TOKEN, SUPABASE_DB_PASSWORD, DATABASE_URL or PG* overrides. Never copy repository `supabase/.temp` (it contains link metadata), .env files, production users, secrets, media, seed dumps or the full historical migration directory. Do not use link, db push, --linked or a remote --db-url.
2. Create the empty local project outside the repository. Review generated config: local test project ID/ports only, no external Auth providers, SMTP/webhooks or production functions. Keep private schemas unexposed. For shared machines, restrict host access to the local ports using the approved OS/firewall configuration; local containers are not automatically a localhost-only guarantee.

```powershell
# FUTURE only once CLI, Docker and any downloads are explicitly arranged.
$localRoot = Join-Path $env:TEMP ('faith-challenges-supabase-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $localRoot | Out-Null
supabase init --workdir $localRoot
if ($LASTEXITCODE -ne 0) { throw 'Local initialization failed.' }
# Capture output: start/status can print local keys and credential-bearing URLs.
$startOutput = supabase start --workdir $localRoot 2>&1
if ($LASTEXITCODE -ne 0) { throw 'Local startup failed; do not print raw captured output.' }
$statusOutput = supabase status --workdir $localRoot --output json 2>$null
if ($LASTEXITCODE -ne 0) { throw 'Local status failed.' }
$localStatus = $statusOutput | ConvertFrom-Json
```

3. **Schema prerequisite:** load an independently reviewed, synthetic PUBLIC-schema baseline compatible with native local Supabase Auth, using only loopback psql. That fixture is not supplied by the bare-PostgreSQL stub file. It must include the canonical profiles/helpers, full Play table constraints/grants and original review RPC. Do not import production data or overwrite platform auth.users/auth.uid()/roles with simulation stubs. Lack of that reviewed baseline is an explicit remaining blocker for an executable full Supabase test.
4. With that baseline in place, run companion verification blocks1–9 in a read-only transaction against local PostgreSQL (default127.0.0.1:54322). Do not call block10's helper check before the helper exists. Apply the corrected proposal in its own session, inspect intended changes, COMMIT explicitly, then run the full companion verification separately. Its BEGIN READ ONLY/ROLLBACK must not be nested inside the migration transaction. Apply a second time and compare rows/statuses/policies/indexes.
5. Provision only synthetic local Auth accounts through native Auth admin APIs: ordinary user, editor, admin and optionally super_admin. Use @example.invalid identities, random test-only passwords and email-confirmed creation. Set profile roles through a separately reviewed local owner bootstrap; do not accept browser metadata role assignments. Never put service credentials in VITE_ variables or browser code.
6. Obtain genuine JWTs through local password sign-in. Use a separate public client for each role, persistSession:false, autoRefreshToken:false; keep tokens/passwords in memory or approved encrypted external state. Auth user/profile identity must match. Do not forge tokens or substitute the GUC-based simulation for Auth verification. Test anon with the local public key, not a service key.

Loopback-only JWT/request shape (after the local schema/users exist; illustrative local test client, not executed here):

```javascript
import { createClient } from '@supabase/supabase-js'
const api = 'http://127.0.0.1:54321'
const key = process.env.LOCAL_ONLY_ANON_KEY
if (!key) throw new Error('Local public key required')
const client = createClient(api, key, { auth: { persistSession: false, autoRefreshToken: false } })
const { data, error } = await client.auth.signInWithPassword({
  email: process.env.LOCAL_TEST_EDITOR_EMAIL,
  password: process.env.LOCAL_TEST_EDITOR_PASSWORD,
})
if (error || !data.session) throw new Error('Local authentication failed')
const response = await fetch(`${api}/rest/v1/play_content_items?select=id,status`, {
  redirect: 'error',
  headers: { apikey: key, Authorization: `Bearer ${data.session.access_token}` },
})
console.log(JSON.stringify({ status: response.status })) // Never print token/body/key.
```

Run that client from the repository with existing dependencies, WITHOUT --env-file. API origin is a fixed loopback literal, never SUPABASE_URL or a database URL. LOCAL_ONLY_* values must come from this local runtime, not copied hosted credentials. If default ports differ, review the generated config and explicitly keep both hosts loopback before changing literals. The existing hosted security fixture CLI intentionally rejects localhost; do not weaken its project guards to reuse it here. A loopback-only real HTTP matrix runner remains follow-up work.

7. Through actual HTTP requests test all six states/RPC/direct-write edges, unauthorized publishing, service-role draft insert versus status changes, UUID reassignment, absent/null modes, public visibility and archived disappearance. Test the editor/admin UI against this local API by overriding VITE_SUPABASE_URL/key ONLY in a dedicated Vite process; do not edit repository .env or production configuration. Keep the service key out of this process. Review redacted status codes/counts, not raw tokens/question payloads.
8. Stop only this local workdir; default stop preserves its data for diagnosis. After review, explicitly approve deleting only this disposable project's volumes. Never use --all.

```powershell
# FUTURE cleanup; no containers were started by this task.
$stopOutput = supabase stop --workdir $localRoot 2>&1
if ($LASTEXITCODE -ne 0) { throw 'Local stop failed.' }
# Optional, destructive cleanup ONLY after confirming this disposable identity:
# $cleanupOutput = supabase stop --workdir $localRoot --no-backup 2>&1
```

Protect captured CLI output/environment, exclude it from transcripts/CI artifacts/Git, and close the dedicated terminal after preserving sanitized evidence. Clearing tokens does not revoke sessions; remove/revoke only local fixture users as part of the approved teardown. Hosted credentials and production records are never needed for this workflow.

## Validation performed

| Command | Result |
|---|---|
| `& scripts/run-faith-challenges-sql-test.ps1` | Final exit0; actual scratch PostgreSQL before/after tests and corrected migration twice. Initial sandbox-only failure was environmental. |
| `node scripts/test-faith-challenges-live-reconciliation.mjs` | Exit0;180 source matrix cases plus new UUID/null-safe mode assertions. |
| `node node_modules/tsx/dist/cli.mjs scripts/test-faith-challenges-authorization.mjs` | Exit0;180 SQL/TypeScript authorization cases. |
| `node node_modules/tsx/dist/cli.mjs scripts/test-faith-challenges-library.ts` | Exit0; includes4 rejected and4 supported Mezmur-mode cases. |
| `node scripts/test-faith-challenges-editor.mjs` | Exit0; mocked-browser editor/admin workflow. |
| `node scripts/cms-auth-smoke.mjs` | Exit0; invalid login, restoration, permission denial/outage recovery, logout and unassigned-account denial. Mocked API only. |
| `node scripts/test-play-foundation.mjs`; `node scripts/test-play-complete.mjs`; `node node_modules/tsx/dist/cli.mjs scripts/test-play-milestones-2-4.ts` | All exit0. |
| `node node_modules/typescript/bin/tsc -b --pretty false` | Exit0. |
| `node node_modules/eslint/bin/eslint.js scripts/test-faith-challenges-library.ts src/lib/play/questionLibrary.ts src/lib/play/questionLibraryService.ts src/pages/admin/PlayContentReview.tsx` | Exit0. |
| `npm.cmd run build` | Exit0;900 modules/PWA build. |
| `node node_modules/tsx/dist/cli.mjs scripts/import-play-content-drafts.ts` | Exit0;37 draft candidates, dry run only. |
| Changed .mjs / PowerShell syntax, scoped whitespace | PASS; SQL runtime tested by scratch runner, not hosted. |

## Production decision and files

Production remains **BLOCKED**: both identified gaps are corrected and executed locally, but actual Supabase Auth/JWT/PostgREST, deployed schema/grants/column ACLs/trigger composition, full HTTP transition matrix, importer authority, local UI integration, maintenance recovery and production-safe rollback evidence remain outstanding. Scratch helpers/role model are not live authorization proof. Earlier Game Night/XP/dependency blockers remain unchanged.

Modified: existing reconciliation proposal, scripts/test-faith-challenges-live-reconciliation.mjs, scripts/test-faith-challenges-library.ts; added scripts/run-faith-challenges-sql-test.ps1, supabase/tests/faith_challenges_local_baseline.sql, supabase/tests/faith_challenges_validation_regressions.sql, this guide. Prior QA/reconciliation reports get follow-up pointers; their historical hashes/findings describe the old revision. Application files, package manifests, V4/V5, Game Night/XP code and unrelated changes were not edited.
