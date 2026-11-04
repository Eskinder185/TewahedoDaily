# Disposable staging security validation runbook

Prepared 2026-11-03 from Sprint 3; updated with the mandatory staging SQL wrapper. **Execution BLOCKED pending independent approval/trust enrollment and the evidence below.** This runbook is executable in phases; it is not authorization to execute them. No database connection, SQL/migration execution, deployment or package installation occurred during this wrapper task. No application or migration proposal was changed.

## 1. Readiness and isolation gates

| Gate | Current evidence | Decision |
|---|---|---|
| Node / SQL client | Node22.18.0, psql17.9 found locally | PASS: tools only |
| Existing HTTP harness | Fake-transport test passes its60-assertion success fixture; rejects expired JWT, answer leak, rollback-prone counters, duplicate award and unsafe manifests. Syntax check passes. | PASS: harness behavior, not database security |
| Staging project, owner connection, public key, five role JWTs, player token | No SECURITY_STAGING_* inputs required by the harness are set in this session | UNKNOWN / execution blocked |
| Endpoint separation | Application endpoints exist locally; no staging target is supplied to compare | UNKNOWN; no claim staging is isolated |
| Actual schema, grants, RLS and proposal SQL execution | No database access authorized | UNKNOWN |
| Persistent API fixtures | Guarded setup/verify/test/cleanup scripts now prepared; existing SQL test still rolls back | Local mocks PASS; actual provisioning BLOCKED pending approval |
| Migration approval authority | Production wrapper has no enrolled approver public key; no real signed evidence | BLOCKED; fake test keys are not runtime authority |

Before any connection, have the operator independently identify the PRODUCTION project reference and the new DISPOSABLE project reference in Supabase. They must differ. Confirm separate API hostname, PostgreSQL database/username/project identity, Auth issuer/signing keys, publishable key and owner/bootstrap credentials. A shared pooler hostname alone does not identify a project: verify its project-qualified user/database. A different application URL or project name is insufficient. The new guard cross-checks named refs and application URLs; it still cannot independently attest project ownership or opaque credential origin.

Use a new empty project or independently approved schema-only staging copy. Do not copy production Auth users/password hashes/tokens, content, media, secrets, service keys, webhooks or application data. Disable outbound mail/SMS/providers, hooks, scheduled jobs and integrations in the DISPOSABLE project as part of its approved setup; never change production settings. No OAuth login is needed for test accounts. Do not connect this project to production deployments or CI secrets. Keep play_private outside exposed PostgREST schemas.

Use a dedicated PowerShell process with staging-only environment variables, an external access-controlled evidence directory and no production .env loading. Prefer PGHOST/PGPORT/PGDATABASE/PGUSER/PGPASSWORD/PGSSLMODE=verify-full supplied securely; avoid a password-bearing database URL in process arguments/transcripts. Confirm server certificate trust using the approved connection instructions. Do not weaken TLS to get a connection. Do not print environment values, JWTs, passwords, join tokens or full API responses. Never use the owner/service-role credential as a player token or public test key.

**Approval gate A:** authorize provision/bootstrap of the named disposable project and read-only catalog checks. Until then, all commands below are examples only.

## 2. Existing proposal inventory and order

Baseline dependencies are the deployed equivalents of the CMS foundation, regular-user accounts, Play milestones and Game Night migrations. Relevant history: `supabase/migrations/20260928000000_cms_foundation.sql`, `20261004120000_regular_user_accounts.sql`, `20261031120000_tewahedo_play_milestones_2_4.sql`, `20261101120000_tewahedo_play_game_night.sql`. This is a dependency inventory, NOT an instruction to replay these four files against an unknown database or apply the entire migration directory. Foundation also relies on earlier shared functions. Use a reviewed baseline schema, retaining real policies/grants to make tests meaningful.

| Apply order | Existing proposal | Required objects / effects |
|---|---|---|
| 1 | `20261103_profiles_role_guard_security.sql` | profiles, matching role enum/RPC, current_user_role, auth.uid; restricts table/column grants and installs role trigger. Independent of Game Night. |
| 2 | `20261103_game_night_security.sql` | pgcrypto, Play/Game Night tables, existing create/reveal/finish/host RPCs. Requires zero active rooms. Adds private bank, private round FK, scalar projection and revised join/state/start/submit RPCs. |
| 3 | `20261103_verified_play_rewards.sql` | #2 secure_question_id, all progress/result/achievement tables and first-steps/perfect-round achievement seeds. Adds evidence/ledger/claim; revokes legacy browser-score RPC. |

These files are under `docs/ai/proposed-migrations/`. Each contains its OWN BEGIN/COMMIT: a failure in file3 does not undo committed files1/2. Do not wrap them with psql --single-transaction and assume the nested COMMIT statements become one atomic bundle.

Other proposals are NOT dependencies of this validation: `20261102_faith_challenges_compatibility.sql` and `20261102_faith_challenges_soft_archive.sql` are explicitly superseded; `20261102_faith_challenges_authorization_reconciliation.sql` describes an alternative older workflow; `20261102_faith_challenges_live_reconciliation.sql` is a separate CMS proposal; `20261102_faith_challenges_live_verification.sql` is read-only. Do not apply them as a batch or mix editorial reconciliation into this sprint.

### Mandatory staging SQL wrapper

All normal staging SQL commands in this runbook now use `scripts/security-staging-migrate.mjs`. No raw psql migration loop, catalog invocation or transactional-test invocation is provided. The wrapper does not create infrastructure, users or fixtures, issue credentials, enroll trust, or generate approvals.

Command inventory closed by this change: the former section2 direct migration foreach loop (three files), its before/after catalog calls, and section3's direct rollback-only SQL test. The schema-dump paragraph was guidance rather than an executable backup script; backups still need a separate approved, target-verified process. The fixture CLI uses internal psql for synthetic setup/verification/cleanup, not migration application, and remains separately scoped below. Historical examples in other reports and the local scratch-PostgreSQL runner are NOT authorized hosted migration workflows.

| sql-id | Exact allowlisted file | Required approval phase |
|---|---|---|
| catalog | docs/ai/SECURITY-LIVE-VERIFICATION-2026-11-03.sql | catalog-read |
| profiles | docs/ai/proposed-migrations/20261103_profiles_role_guard_security.sql | migration-application |
| game-night | docs/ai/proposed-migrations/20261103_game_night_security.sql | migration-application |
| verified-rewards | docs/ai/proposed-migrations/20261103_verified_play_rewards.sql | migration-application |
| authorization-test | supabase/tests/security_sprint3.sql | test-execution |

The Faith Challenges six-state proposal is a SEPARATE workstream and is not silently added to this allowlist. No --file, raw SQL, wildcard, include path, connection string, public-key override or arbitrary SQL command is accepted.

**Approval/trust prerequisite:** the production CLI trust store is intentionally EMPTY. Live execution and even a successful static approval plan remain BLOCKED until a separately reviewed staging-script change enrolls an independently authenticated Ed25519 approver public key. Neither CLI arguments nor environment variables can enroll a signer. Private signing keys never enter the repository or this wrapper. Do not copy the fake test key or add a self-generated key merely to obtain PASS.

The enrolled verifier must independently authenticate to the approved Supabase management console/API, confirm the exact disposable project, organization and responsible owner, distinguish the real production reference, and retrieve the intended database credential version from the approved secret store. They must review separate provisioning and operation approvals, the schema/catalog evidence and a restorable baseline. No database password/API-key prefix/decoded JWT or arbitrary environment declaration constitutes that evidence.

**Approval gate B:** a separate user approval for the exact migration file/hash and named disposable target. Provisioning approval alone is insufficient; the wrapper rejects reuse of its approval reference as the operation's approval reference. Preflight catalog reads have a catalog-read scope, and the SQL test requires a separate test-execution scope.

They then supply an EXTERNAL signed approval envelope `{keyId,payload,signature}`. signature is Ed25519 over UTF8 canonical(payload) (recursively sorted object keys; canonical() is exported by the wrapper). The strict version1 payload contains:

- version, approvalId (UUID), disposable=true; stagingProjectRef, productionProjectRef, organizationId, ownerId, databaseHost.
- sqlId, sqlPath and sqlSha256 for ONE exact reviewed file; phase as above. Each different file/apply requires its own envelope/UUID. No batch or auto-follow-on migration occurs.
- verificationMethod = authenticated-management-api-and-secret-store OR authenticated-console-and-secret-store; verificationEvidenceId, verifiedBy (the enrolled signer ID), verifiedAt.
- credentialId, credentialVersion, credentialSalt (32 random bytes in hex), credentialHmac. The independent verifier computes exported credentialBinding(payload,password) using the actual verified secret version. This binds the used secret to the signed target/owner/credential metadata; it is not a replacement for authenticated provenance verification. Keep the receipt protected: its keyed digest is sensitive and weak passwords remain vulnerable to offline guessing.
- userApprovalId for THIS phase and a distinct provisioningApprovalId; issuedAt/expiresAt (at most1 hour validity, verification at most1 hour before issue). Reference IDs are opaque safe identifiers, not pasted connection strings, URLs, passwords or tokens.
- psqlSha256 (reviewed absolute psql.exe binary), tlsRootCertSha256 (reviewed CA bundle), and receiptDirectory (exact canonical external directory for consumed approvals).

All digests/salt/HMAC fields are lowercase64-character hex; dates are ISO8601 timestamps. The approval file and consumed-receipt directory must be outside the repository, non-linked, and protected by OS access controls. Changing the receipt directory requires a new signed approval. The wrapper has no signing/enrollment command.

No real signed envelope or authenticated project-identity evidence was created by this task. Signature validation establishes a trusted attestation, not live authenticated project verification by the wrapper. The default trust store contains no authority; real project ownership, credential origin and live TLS/database behavior remain UNKNOWN.

Use a dedicated terminal with NO ambient PG* variables, including PGHOST, PGHOSTADDR, PGPORT, PGUSER, PGPASSWORD, PGDATABASE, PGSERVICE/PGSERVICEFILE, PGPASSFILE, PGOPTIONS or PGSSLMODE. The wrapper rejects them rather than silently overriding them. Supply ONLY SECURITY_STAGING_DB_PASSWORD and SECURITY_STAGING_TLS_ROOT_CERT through the approved secret mechanism, plus matching SECURITY_STAGING_PROJECT_REF / SECURITY_PRODUCTION_PROJECT_REF. No API/service key or hosted database URL is needed by this migration wrapper. Never echo those values or use transcripts/environment dumps.

The child connection is constructed only after validation: db.<stage-ref>.supabase.co, port5432, database/user postgres, verify-full TLS and the approved CA. Poolers, aliases, loopback and host-address overrides are unsupported here. The SQL snapshot must match the signed SHA256; every path component must be non-linked and the SQL/client/CA files must be regular single-link files. psql receives approved bytes through stdin, not a re-opened -f path. Shell interpolation/rc files are disabled. Executable/CA hashes are checked; credential-bearing arguments are never passed. Catalog SQL is wrapped in a READ ONLY transaction; only the existing harmless SQL-test meta commands are allowed, not includes/shell escapes.

```powershell
# FUTURE only after independent verification, public-key enrollment and approval.
# All placeholders must be replaced from the approved record; no secret values here.
$migrationCli = 'scripts/security-staging-migrate.mjs'
$migrationScope = @(
  '--staging-project-id','REPLACE_STAGING_REF',
  '--production-project-id','REPLACE_PRODUCTION_REF',
  '--organization-id','REPLACE_ORG_ID',
  '--owner-id','REPLACE_OWNER_ID',
  '--expected-db-host','REPLACE_APPROVED_DATABASE_HOST',
  '--receipt-dir','C:\REPLACE_EXTERNAL_APPROVAL_RECEIPTS',
  '--psql-path','C:\Program Files\PostgreSQL\17\bin\psql.exe'
)
# Plan performs static validation only. No process, SQL or network is invoked.
node $migrationCli plan @migrationScope --sql-id profiles --approval-file 'C:\REPLACE_EXTERNAL_EVIDENCE\profiles-approval.json'
if ($LASTEXITCODE -ne 0) { throw 'Static validation blocked; do not execute.' }
# Separate user approval and flags are BOTH required in addition to the signature.
node $migrationCli execute @migrationScope --sql-id profiles --approval-file 'C:\REPLACE_EXTERNAL_EVIDENCE\profiles-approval.json' --execute --disposable-staging
if ($LASTEXITCODE -ne 0) { throw 'SQL failed/uncertain; preserve evidence and stop.' }
```

Expected plan output STATIC_VALIDATION_PASS explicitly includes liveIdentity=NOT_VERIFIED_BY_WRAPPER. This is not a database preflight PASS. Successful process completion returns SQL_PROCESS_COMPLETED, not security sign-off. Output rows, notices and raw errors are discarded to prevent secrets/function definitions appearing in logs; errors retain sanitized failure codes. Collect/review redacted catalog details through the separately approved authenticated read-only evidence process before signing a migration approval. The wrapper's catalog operation checks query execution, but deliberately does NOT export the raw catalog or certify its compatibility.

Select catalog with its OWN catalog-read receipt before/after the migrations. Execute profiles, then game-night, then verified-rewards with distinct signed envelopes and fresh, separately approved scopes. Existing constraints/foreign keys, inherited/column grants, RLS, function owners/search_path, pgcrypto resolution and data compatibility still need real catalog review. Same-named existing tables/indexes are not repaired by CREATE IF NOT EXISTS. Each migration commits independently; the wrapper does not provide cross-file atomicity or an automatic rollback/retry.

Before launching, the wrapper creates and fsyncs an exclusive approvalId.used marker in the signed external directory. Concurrent reuse, errors and interruptions consume that approval. Do not delete markers or change directories to force a retry; obtain new review/approval after resolving uncertainty. Unused plan calls do not consume approval. The marker is not a full audit database and power-loss/hostile-local-user tampering is not certified.

**Residual bypass risk:** a person with the credentials and OS access can still run psql, edit code/trust pins, or use another SQL client outside this wrapper. It is not an OS/database permission boundary. This closes the documented normal-workflow bypass and prevents accidental target/path/approval substitution through this entry point; it does not stop a malicious credential holder. Apply least privilege, protect approval keys/receipts and restrict credential distribution independently.

## 3. Guarded transactional authorization test

Run BEFORE committed HTTP fixtures. Existing test requirements remain: an empty dd31000* Auth namespace and empty play_room_join_attempts table. It creates its own synthetic rows then ROLLBACK; this is a mutating test even though its changes are rolled back, and cannot prove committed HTTP accounting.

```powershell
# FUTURE after a distinct test-execution approval; uses the same guarded entry.
node $migrationCli plan @migrationScope --sql-id authorization-test --approval-file 'C:\REPLACE_EXTERNAL_EVIDENCE\sql-test-approval.json'
if ($LASTEXITCODE -ne 0) { throw 'SQL-test static validation failed.' }
node $migrationCli execute @migrationScope --sql-id authorization-test --approval-file 'C:\REPLACE_EXTERNAL_EVIDENCE\sql-test-approval.json' --execute --disposable-staging
if ($LASTEXITCODE -ne 0) { throw 'SQL test failed/uncertain; preserve evidence and stop.' }
```

Only exit status is returned; detailed redacted evidence needs the independently approved evidence process. No SQL was executed by the wrapper's mock tests. Do not call this transactional result proof of durable failed joins, real JWT authentication or overlapping reward transactions.

## 4. Guarded persistent fixture workflow (final local preparation)

The fixture scripts are now prepared and mock-tested; NO accounts, questions or rooms exist as a result of local preparation. They never apply migrations or provision infrastructure. The existing three proposals and rollback-only test in sections2/3 still require their own prior approval.

Entry point: `scripts/security-staging-fixtures-cli.mjs`. Commands: `plan`, `setup`, `verify`, `test`, `cleanup`. The existing HTTP harness is reused. `plan` does not connect, generate secrets or create state. Every other command requires BOTH `--execute --disposable-staging`, explicit staging AND production IDs, matching environment, verified external state directory and an exclusive task lock. No automatic stale-lock stealing is implemented.

**Approval gate C:** separately authorize synthetic Auth user creation, privileged fixture-role bootstrap and private fixture rows on the independently verified disposable project. This does not authorize tests or cleanup. No production authorization is implied.

### Guard configuration

Set the following nonsecret values from independently verified project records. Placeholders below must be replaced; unchanged placeholders fail closed. A hostname comparison cannot attest ownership or prove a project is empty. Actual remote TLS/Auth/schema behavior remains UNKNOWN until approved execution.

```powershell
$stage = 'REPLACE_WITH_VERIFIED_STAGING_REF'
$production = 'REPLACE_WITH_VERIFIED_PRODUCTION_REF'
$env:SECURITY_STAGING_PROJECT_REF = $stage
$env:SECURITY_PRODUCTION_PROJECT_REF = $production
$env:PGHOST = "db.$stage.supabase.co"
$env:PGPORT = '5432'
$env:PGDATABASE = 'postgres'
$env:PGUSER = 'postgres'
$env:PGSSLMODE = 'verify-full'
$stateDir = Join-Path $env:LOCALAPPDATA ('TewahedoDaily-security-fixtures\' + [guid]::NewGuid().ToString('N'))
$scope = @('--staging-project-id',$stage,'--production-project-id',$production,'--state-dir',$stateDir)
$fixtureCli = 'scripts/security-staging-fixtures-cli.mjs'
node $fixtureCli plan @scope
if ($LASTEXITCODE -ne 0) { throw 'Target/state guard rejected the plan.' }
```

The fixture guard rejects equal project IDs, a mismatched staging environment, an application endpoint matching staging, and a production declaration inconsistent with the repository's configured application refs. It reads only VITE_SUPABASE_URL from .env/.env.local and the current process; it does NOT load file credentials into the process. Custom URLs/unrecognized application hosts are rejected. Only exact20-lowercase-letter project refs and the direct PostgreSQL host above are supported. Poolers, aliases and local/custom-domain Supabase endpoints are blocked in this version. Do not bypass this restriction by changing DNS or weakening TLS. Use a DIFFERENT dedicated terminal for fixtures: these PG* variables are intentionally rejected by the migration wrapper. Fixture commands retain their existing guards, not the new signed-migration-approval mechanism; their separate human approval remains mandatory.

Supply credentials using the approved staging-only secret mechanism, without echo/transcripts:

- SECURITY_STAGING_PUBLISHABLE_KEY: staging publishable key or project-bound legacy anon JWT.
- SECURITY_STAGING_SERVICE_KEY: staging secret key or project-bound legacy service-role JWT; used ONLY for Auth admin setup/cleanup, never as a player token.
- PGPASSWORD and, where required, PGSSLROOTCERT: direct staging owner connection with verify-full TLS. No database URL is accepted or printed by the fixture commands.
- SECURITY_STAGING_STATE_KEY: exactly32 random bytes encoded as64 hex characters. Generate ONCE and retain securely for resume/cleanup. Do not regenerate for an existing state directory.

A one-time key can be assigned without printing it:

```powershell
# Only for a NEW task; retain this value in the approved secret store.
$env:SECURITY_STAGING_STATE_KEY = [Convert]::ToHexString([Security.Cryptography.RandomNumberGenerator]::GetBytes(32)).ToLowerInvariant()
```

Opaque sb_publishable/sb_secret keys cannot be bound to a project offline. Targeted API authentication will still have to succeed; the guard does not claim otherwise. The database host/user/database/TLS checks happen BEFORE live IO. PGSERVICE/PGOPTIONS and unrelated inherited credentials are excluded from psql's child environment. SQL goes through stdin with a fixed argument array and shell:false; stderr/raw responses are never logged. Room codes and join tokens are hashed locally so raw generated secrets are absent even from SQL statement text. HTTP redirects are refused; errors are sanitized and responses bounded. Independently confirm provider/proxy debug logging does not record Auth passwords/request bodies before approved execution; local tests cannot certify third-party logging settings.

### Setup and verify

```powershell
# FUTURE after approval and proposal application. No SQL ran during preparation.
node $fixtureCli setup @scope --execute --disposable-staging
if ($LASTEXITCODE -ne 0) { throw 'Fixture setup stopped; retain state and inspect sanitized code.' }
node $fixtureCli verify @scope --execute --disposable-staging
if ($LASTEXITCODE -ne 0) { throw 'Fixture verification failed; do not test.' }
```

Setup prepares exactly FIVE distinct authenticated Auth accounts: player and host with profile role=user, plus editor/admin/super_admin. Auth JWT role remains authenticated. Admin API creation uses fixed, pre-recorded UUIDs, confirmed synthetic @example.invalid emails, random passwords and an application-metadata run marker. No emails/login flows/providers are configured by these scripts. The installed auth-js AdminUserAttributes contract includes id/email/password/email_confirm/app_metadata; actual deployed GoTrue compatibility remains unverified.

A read-only schema preflight runs before creating accounts. After Auth creation, the owner SQL bootstrap changes ONLY the marked fixture profiles: it preserves the correct existing role, or replaces the fresh default-user profile with the intended fixture role through owner INSERT. It never disables the role guard/RLS, changes grants, or creates a role-management RPC. This privileged synthetic bootstrap needs explicit approval and is not an ordinary-user authorization path.

Exactly five private reviewed synthetic questions are inserted in a run-unique category, including nested/explanation LEAK sentinels. One playing/open room with one round, and one finished/unclaimed room with all five correct submissions are created with deterministic IDs and player membership tokens. Both are hosted by the ordinary host. Existing schema defaults supply expiry; expired fixtures are rejected, not silently extended. The host never joins, keeping its failed-join counter fresh.

These are OWNER-SEEDED ground-truth fixtures, not a claim that RPC gameplay or review permissions have passed. The existing rollback-only SQL test exercises actual create/join/start/submit/reveal/finish paths separately. The HTTP harness exercises authorization/secrecy/durability/claim behavior against persistent fixtures. Five questions suffice because no-repeat is per room; these intentionally predictable test questions must never be used as production content.

The setup transaction checks exact question payloads, role/room/participant ownership, token hashes and six round/five submission shapes. ON CONFLICT never overwrites unrelated rows; ownership mismatch fails closed. Fixed IDs and Auth GET-before-create make interrupted creation or a committed-but-unacknowledged SQL seed resumable. Repeating setup with the SAME directory/key reuses its users/questions/rooms. It does not reset rate counters or rewards. A stale process lock requires manual investigation; no automatic repair is attempted. Unconfirmed SQL-process termination retains the lock and blocks automatic resume.

Local state is AES-256-GCM encrypted in fixture.enc outside the repository, with atomic replacement and authenticated reads. Passwords and join tokens never appear in the six-key nonsensitive fixture.json manifest or stdout. Authentication tokens are transient in memory. Service credentials/database passwords are not stored in task state. Protect the state key and external directory; local checks/encryption are not OS sandboxing or proof of remote isolation.

## 5. Verification, test, recovery and cleanup commands

**Approval gate D:** separate user approval for actual SQL/HTTP tests and their counter/reward/session mutations. Setup approval is not test approval.

```powershell
# FUTURE approved live tests. The command obtains each fixture user's JWT,
# verifies issuer/subject/role and reuses the existing 60-assertion HTTP harness.
node $fixtureCli test @scope --execute --disposable-staging
if ($LASTEXITCODE -ne 0) { throw 'Tests failed or were interrupted; fixture is consumed/uncertain.' }
node $fixtureCli verify @scope --execute --disposable-staging
if ($LASTEXITCODE -ne 0) { throw 'Post-test owner verification failed.' }
```

Expected setup/verify output: READY and numeric counts users5/questions5/rooms2/participants2/rounds6/submissions5; no credentials. Test output: PASS, assertions60, and numeric owner evidence showing one ledger row,100 awarded XP, result delta1 and XP delta100. Before/after totals preserve any existing fixture-user XP. Client receipts alone cannot pass if the owner deltas disagree. The public manifest uses the exact existing six-key schema, without secrets.

The old direct harness remains available but live execution NOW also requires both named project flags:

```powershell
$fixturePath = Join-Path $stateDir 'fixture.json'
# Plan-only, no network or credentials:
node scripts/security-staging-checks.mjs --fixture $fixturePath
# Prefer fixtureCli test above: it supplies fresh user tokens internally and
# checks owner XP/ledger/result evidence. A direct live harness additionally
# needs its previously documented SECURITY_STAGING_*_JWT and player-token envs.
# Future manual invocation, ONLY if those secrets are supplied securely:
# node scripts/security-staging-checks.mjs --fixture $fixturePath --staging-project-id $stage --production-project-id $production --execute --disposable-staging
```

A live test is one-shot per fixture: testing is durably recorded BEFORE HTTP test traffic. Completed, failed or interrupted attempts cannot be silently repeated against an awarded room or consumed rate window. A failed login before any test traffic can be retried. Successful setup resumes reuse IDs; successful tests are never replayed. A process crash during test leaves testing, which is deliberately uncertain. Cleanup the owned run and create a NEW state directory/IDs for a fresh attempt; do not delete the state/key and recreate users blindly.

```powershell
# FUTURE approved cleanup, including partially created fixtures.
node $fixtureCli cleanup @scope --execute --disposable-staging
if ($LASTEXITCODE -ne 0) { throw 'Cleanup blocked/partial; retain encrypted state and investigate.' }
# Repeating this same cleanup is safe; CLEANED does not delete again.
node $fixtureCli cleanup @scope --execute --disposable-staging
if ($LASTEXITCODE -ne 0) { throw 'Cleanup verification failed.' }
```

Run cleanup only after separate gate E approval below. Cleanup verifies Auth metadata and SQL ownership before removing exact run rooms/questions and fixture-user Play ledger/evidence/results/achievements/progress/counters/profiles. It refuses rooms owned by another user, questions referenced outside the run, and extra rooms hosted by these users. It then deletes ONLY the five recorded, marked Auth IDs. No global/anonymous join counters, unrelated accounts/questions, schemas, historical task directories or infrastructure are removed. Tests must never reuse these accounts for unrelated content. Auth/SQL failures remain blocked for investigation; no broad cascade/drop workaround exists. Encrypted state/evidence are retained for review, including cleanup progress, and are not recursively deleted.

Remaining staging coverage prerequisites are unchanged: real JWT/RLS/catalog execution, guest HTTP gameplay, valid-but-unknown code and duplicate-name counter deltas, forced overlapping SQL lock evidence, independent evidence rows for one activity, last-super-admin races, rollback/retry, and commit-before-response recovery. The fixture CLI does not claim the existing harness covers all of these. Promise.all is concurrent request evidence, not proof of overlapping PostgreSQL transactions. Run separately approved supplemental tests from Sprint3 using fresh fixtures, preserving the15-second HTTP limit. Do not label omitted checks PASS.

Local-only verification (safe now; no SQL/network):

```powershell
node scripts/test-security-staging-fixtures.mjs
if ($LASTEXITCODE -ne 0) { throw 'Fixture/guard mocks failed.' }
node scripts/test-security-staging-harness.mjs
if ($LASTEXITCODE -ne 0) { throw 'Existing HTTP harness mocks failed.' }
```

## 6. Result criteria, rollback and cleanup

| Area | PASS requires | FAIL / UNKNOWN |
|---|---|---|
| Isolation | Independently confirmed separate project/API/database/Auth identities, synthetic-only data, scoped credentials | Same/shared production target: FAIL; missing evidence: UNKNOWN and stop |
| Profile | Actual SQL matrix denies role/ID self-write and unauthorized RPCs, preserves own-name edits and approved admin assignments | Any escalation: FAIL; only mocked/source checks: UNKNOWN |
| Secrecy | Public/direct reads denied, pre-reveal nested/explanation/source/answer fields absent, score correctness hidden; reveal legitimate | Any answer/correctness oracle before reveal: FAIL; untested channels/semantics: UNKNOWN |
| Failed joins | Independent rejected HTTP requests commit counts; 11th request limited; valid guests continue as designed | Rollback erases count or expected error grants access: FAIL; transactional-only evidence: UNKNOWN |
| XP | Owner row/XP deltas + concurrent receipts prove one award; identity/legacy paths deny; retries preserve totals | Duplicate increment or client-selected score authority: FAIL; SQL never executed/overlap unobserved: UNKNOWN for those claims |

On any failure, stop, preserve redacted evidence and inspect the failed gate. Do not change grants, disable RLS/triggers, reset ledgers or modify security assertions to obtain PASS. A JWT expiry, schema-cache issue, expired room or dirty rate window is an environmental failure, not a security PASS.

The existing transactional test's final ROLLBACK removes its fixtures. A statement error with ON_ERROR_STOP closes psql and rolls back the still-open transaction. Proposal files commit independently: after successful application there is no generic ROLLBACK undoing them. Prefer discarding/resetting ONLY the independently verified disposable project from its captured baseline, under explicit authorization. Do not invent DROP/DELETE rollback SQL or re-enable the vulnerable legacy reward grant. Production rollback is outside this runbook.

**Approval gate E:** separately authorize removing exactly the recorded synthetic accounts/data. Destroying/resetting the disposable infrastructure requires an additional explicitly scoped authorization; fixture cleanup does not imply it. Revoke only staging test sessions/credentials, clear SECURITY_STAGING_* and PG* from the dedicated process (or close it), and close browser contexts/owner sessions. Retain protected redacted evidence; exclude passwords/JWTs/join tokens from reports, screenshots and Git. Never delete production data or unrelated temporary workspaces. No automatic teardown runs here.

Required separate approval boundaries: (A) named isolated project/bootstrap and scoped identity/catalog access; (B) each exact migration scope against that project; (C) fixture creation; (D) test execution; (E) fixture cleanup, with infrastructure destruction separately scoped. Never infer later-phase consent from an earlier phase or an umbrella staging statement. No production deployment or production database change is covered.

## 7. Final local preparation evidence

| Command/check executed locally | Result |
|---|---|
| `node scripts/test-security-staging-fixtures.mjs` | Exit0:38/38 offline cases, injected fake Auth/SQL/test IO. Includes tied-score order, five-user/question repeatability, interrupted writes, unsafe targets/paths, encrypted state, scoped cleanup, consumed rewards, owner XP deltas and secret redaction. No SQL or Supabase requests. |
| `node scripts/test-security-staging-harness.mjs` | Exit0: existing60-assertion success fixture, four injected security failures and unsafe manifests. Fake transport only. |
| `node node_modules/tsx/dist/cli.mjs scripts/test-security-sprint3.ts` | Exit0:15/15 receipt/client/source-contract tests using installed tooling. No package fetch/install. |
| `node --check` on security-staging-environment.mjs, security-staging-fixtures.mjs, security-staging-fixtures-cli.mjs, test-security-staging-fixtures.mjs and security-staging-checks.mjs | Exit0:5 modules. |
| PowerShell scriptblock parsing of runbook examples |10 blocks parse; none executed. |
| Explicit whitespace checks of all7 changed/new files | PASS. |

Files: added scripts/security-staging-environment.mjs, scripts/security-staging-fixtures.mjs, scripts/security-staging-fixtures-cli.mjs, scripts/test-security-staging-fixtures.mjs; modified scripts/security-staging-checks.mjs, supabase/tests/security_sprint3.sql and this runbook only. No application, dependency, V4/V5 or migration-proposal changes. Existing unrelated dirty work/index preserved.

**PASS: local preparation. BLOCKED: live setup/validation and production deployment.** PostgreSQL syntax/runtime, effective grants/RLS, real Auth/SSL behavior, provider logging and actual staging separation remain UNKNOWN until separately authorized verification.

## 8. Direct-psql bypass closure — current local evidence

| Requirement | Result |
|---|---|
| Guarded normal migration/catalog/SQL-test workflow | PASS: former direct psql examples/loop replaced by the one allowlisted wrapper. A regression checks the runbook does not restore those commands. |
| Target/org/owner/host and independently signed credential-provenance validation | PASS under mock authority: missing/mismatched values, wrong credential version/value, unsigned/tampered/expired evidence, missing approval and ambient PG* overrides reject before launch. |
| Real authenticated project identity / credential provenance | UNKNOWN: no network/database call performed and no real approver enrolled. Receipt validation is static trusted-attestation checking, not live identity proof. |
| SQL/path/process protection | PASS in mocks: explicit aliases, exact signed file hashes, non-linked single-link files, bounded meta commands, pinned client/CA, captured SQL bytes and controlled process environment. No actual psql process launched by these tests. |
| Secrets and replay | PASS in mocks: raw output/errors are suppressed, no credentials/URLs in CLI output, exclusive fsynced markers consume approvals before launch and block concurrent/uncertain repeats. OS/power-loss/hostile credential-holder protection is not certified. |
| Real SQL/migration execution | BLOCKED: trust store empty; no signed real approval/provenance receipt, execution consent or live evidence was created in this task. |

Exact verification commands/results:

- `node scripts/test-security-staging-migrate.mjs`: final exit0,35/35 mock checks. Initial fixture-only runs exited1 due a fixture variable/path error and Windows file-symlink privilege restriction; fixtures were corrected and the linked-path test uses a Windows junction without relaxing rejection.
- `node scripts/test-security-staging-fixtures.mjs`: exit0,38/38; existing fixture behavior preserved after adding the process adapter's optional output-discard mode.
- `node scripts/test-security-staging-harness.mjs`: exit0; existing60-assertion fake transport success and injected security failures pass. Not live authorization evidence.
- `node --check` on scripts/security-staging-migrate.mjs, scripts/test-security-staging-migrate.mjs and scripts/security-staging-fixtures-cli.mjs: exit0.
- PowerShell parsing:9 runbook examples parse, none executed. Explicit whitespace check of all4 changed/new files: PASS.
- Original allowlisted SQL file SHA256 values were compared before/after the mock suite: unchanged. No migration definitions, app source, Supabase settings, credentials, package manifests or Git index were modified.

Files changed: added scripts/security-staging-migrate.mjs and scripts/test-security-staging-migrate.mjs; modified scripts/security-staging-fixtures-cli.mjs (optional discardOutput process mode only) and this runbook. Existing target/state/fixture systems are reused.

Next boundary: independently authenticate and confirm the named project/org/owner and secret-store version, separately approve and review signer-public-key enrollment, then issue scoped signed approvals. Provisioning, migration application, fixture setup, test and cleanup remain separate user decisions. A credential holder can still manually invoke SQL tooling outside this wrapper; this task does not claim otherwise.
