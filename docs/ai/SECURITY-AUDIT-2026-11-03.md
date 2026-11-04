# TewahedoDaily security audit and remediation — 2026-11-03

Sprint 3 follow-up: see SECURITY-SPRINT-3-2026-11-03.md. CMS auth smoke is repaired; shared browser-score XP submission is disabled locally; a server-evidence Game Night claim and matching receipt client are prepared. Existing Game Night/reward proposals were refined, not recreated. No SQL or live authorization testing occurred; production remains BLOCKED. Earlier findings/results below retain their original audit scope.

Assessment: **BLOCKED for security sign-off**. This is a prioritized source review and local remediation pass, not a certification or an exhaustive review of every migration/function. Two document-processing weaknesses are repaired locally. Database findings describe the checked-in definitions; their deployment and effective production permissions remain UNKNOWN. No production attacks, SQL execution, deployments, paid AI calls, installs, or credential changes occurred.

## Worktree and boundaries

Before edits, `git status --short` showed 27 modified tracked paths and untracked work in CMS, Play, Bible generation, V5, taxonomy and prayer presentation. No staged or deleted paths were reported. All existing changes were preserved. Application files changed by this audit were clean at the initial snapshot: documentReader.ts and BuiltInDocumentReader.tsx. The package manifest was already modified, so dependency changes were not mixed into its unknown-owner edits.

Read PROJECT_STATUS, TASK_BOARD, DECISIONS and HANDOFF first. Reviewed route boundaries in src/App.tsx; AuthProvider, RequireCmsRole, authErrors and CMS JWT verification; Cloudflare submissions; backend security middleware and editorial routers; document rendering/upload handling; Play completion and Game Night SQL; profiles policies/trigger; Faith Challenges service/proposals; AI generator validation; deployment/PWA configuration and dependency advisories. The 243 definer/search_path mentions in migration history have NOT all received individual effective-permission tests.

Data map: React public readers and CMS use the publishable Supabase client under RLS. CMS routes provide UI gating; PostgreSQL must independently authorize writes. Cloudflare community submissions use a server-only service credential after origin/Turnstile checks. FastAPI exposes public retrieval/chat/transcription and CMS-JWT-protected editorial/processing routes. Supabase holds publication data, private storage originals and game state. Local AI tooling uses checkpoints/budgets; Bible generation validates source hashes and emits unreviewed drafts. Existing CI targets GitHub Pages, while configured API/CORS references Cloudflare; actual deployment/header settings are UNKNOWN.

## Findings

Sprint 2 correction: the original five-High count included SEC-003 without tracing column grants and set_cms_member. The checked-in grants block direct role UPDATE and the RPC already rejects admin promotion. Treat SEC-003 as a conditional defense gap pending live effective-grant verification, not a verified exploitable path. See SECURITY-SPRINT-2-2026-11-03.md for current remediation and dependency results. Remaining source-confirmed counts from this audit are Critical 0 / High 4 / Medium 3 / Low 1, plus conditional findings. Dependency counts overlap through transitive chains.

| ID | Severity | Evidence and realistic scenario | Verification | Remediation / regression |
|---|---|---|---|---|
| SEC-001 | High | src/lib/cms/documentReader.ts formerly used a regex that retained unquoted event handlers. src/components/library/BuiltInDocumentReader.tsx:182 formerly inserted Mammoth HTML directly. A crafted EPUB/DOCX opened by a staff member could execute same-origin script and access their session. | Original unquoted onerror weakness reproduced in Chromium. DOCX integration path confirmed by source; no crafted DOCX end-to-end fixture executed. | **FIXED LOCALLY**: shared inert-template allowlist sanitizer for both paths. Event handlers, executable/foreign markup, unsafe URLs, forms and external resources removed. Embedded raster data images and safe text formatting/links retained. Six hostile browser fixtures and normal formatting/image fixtures pass. No deployment verification. |
| SEC-002 | Medium | src/lib/cms/documentReader.ts:49 previously buffered unrestricted decompression with Response.arrayBuffer(). A small malicious archive could exhaust the browser's memory. | Compressed 65 MiB expansion with a false small size now rejected; normal archive accepted. Original unrestricted buffering verified by source. | **FIXED LOCALLY**: 128 MiB input/total expansion cap, 64 MiB entry cap, 4,096-entry cap, and actual streaming expansion checks. Parse errors now fail rather than returning partial documents. |
| SEC-003 | Conditional High | The role trigger permits any admin role change, but the checked-in column grants allow only display_name/avatar_url updates and set_cms_member independently rejects admin promotion. Exploitation requires additional deployed role-column privileges or another privileged write path. | Sprint 2 corrected the incomplete original trace. Live effective grants UNKNOWN. | **HARDENING PROPOSED**: existing proposal now explicitly revokes sensitive column writes, preserves the administrative RPC, enforces immutable profile IDs and protects the last super-admin. Unapplied. |
| SEC-004 | High | supabase/migrations/20261031120000_tewahedo_play_milestones_2_4.sql:102–126 accepts caller-provided scores and increments XP on every RPC invocation; no attempt/story idempotency key. Caller-supplied progress snapshot is also stored. A signed-in player can repeatedly claim perfect completion without playing. | Confirmed from SQL + src/lib/play/progressSync.ts; no production call performed. | **PENDING DATABASE/PROTOCOL DESIGN**: server-issued attempt IDs, atomic unique user+attempt/story rewards, validated answer events, bounded snapshots and reconciliation. Local replay guards cannot secure direct RPC calls. Regression must run against transactional PostgreSQL fixtures including concurrent requests, retries, sync failure and cross-device replay. |
| SEC-005 | High | supabase/migrations/20261031120000_tewahedo_play_milestones_2_4.sql:34 publicly exposes published payloads containing correctKey. Game Night uses these same rows. 20261101120000_tewahedo_play_game_night.sql:98 removes only two keys, leaving answer-bearing explanations; participant scores also change before reveal. Players can obtain answers outside the room DTO. | Source-level exposure confirmed; actual deployed grants/data UNKNOWN. | **PENDING DATABASE/API CHANGES**: protected Game Night answer bank, allowlisted prompt/options-only DTO before reveal, and delayed per-round score disclosure. Preserve offline solo-game behavior explicitly. Membership/host checks and unique answer submissions exist but do not close answer disclosure. |
| SEC-006 | Medium | Game Night migration:74 logs a join attempt, then line 77 raises on an invalid code. PostgreSQL rolls back that attempt along with the failed statement. Repeated failed guesses therefore evade the intended persisted counter. inet_client_addr() may also identify a shared database/API connection. | PostgreSQL transaction semantics + source confirmed; no live brute-force test. | **PENDING SERVER/DATABASE CHANGE**: gateway abuse controls and a non-throwing failure result that commits attempts; avoid caller-supplied IP identities. Six hex digits provide 24 bits and need effective rate limiting. Test wrong codes and concurrency against a disposable database. |
| SEC-007 | High | npm advisory query reports installed vulnerable packages including production dependency paths through react-router, image-size, playwright and sharp/transformers. | Registry audit completed; reachability/exploitability of each advisory NOT established. | **OPEN**: isolated dependency update/compatibility pass required. Avoid npm audit fix --force (major/downgrade suggestions). Existing package.json edits preserved. |
| SEC-008 | Medium | src/lib/play/questionLibrary.ts:6 and questionLibraryService.ts:74 use draft/approved/rejected/published. User-supplied live inventory permits draft/review/published/archived, while RPC requires approved before publish. Older compatibility proposal adds rather than reliably replacing conflicting constraints. | Source + supplied live findings; full current catalog UNKNOWN. | **BLOCKED DATABASE RECONCILIATION**: choose one state/role contract, inspect actual checks/policies/grants, validate identifiers, then stage one migration and matching CMS tests. Existing six-state and four-state proposal/test files conflict; neither test suite passing establishes deployment readiness. |
| SEC-009 | Medium (hypothesis, excluded from confirmed counts) | backend/app/main.py:327 and :356 filter Bible edition/source by is_public without publication_status/review_status. supabase_get uses SUPABASE_KEY, whose deployment privilege is UNKNOWN. A service-role configuration could bypass RLS and expose public-flagged but withdrawn/unreviewed sources. | Conditional; key privilege and actual data UNKNOWN. | Verify deployed credential scope and parent publication filters in every Bible retrieval path before source changes. Do not infer service role merely from variable name. |
| SEC-010 | Low | .github/workflows/deploy.yml references mutable action major tags. A compromised/moved tag would affect a deployment job with Pages/id-token write. | Workflow verified; no compromise alleged. | **OPEN**: separately pin reviewed action commit SHAs, use dependency update automation and protected deployment environment. Live protection rules UNKNOWN. |

## Implemented files and compatibility

- src/lib/cms/documentHtml.ts (new): shared sanitizer, no new dependency.
- src/lib/cms/documentReader.ts: sanitizer integration and bounded archive expansion.
- src/components/library/BuiltInDocumentReader.tsx: sanitize DOCX conversion output.
- scripts/test-document-html-security.mjs (new): real-browser exploit reproduction, hostile markup and archive tests.
- docs/ai/SECURITY-LIVE-VERIFICATION-2026-11-03.sql (new): read-only catalog verification.
- docs/ai/proposed-migrations/20261103_profiles_role_guard_security.sql (new): UNAPPLIED trigger proposal; not a claim of database remediation.
- This report.

Document presentation intentionally strips active content, remote images, arbitrary attributes and inline styles. Embedded raster images, headings, paragraphs, lists, tables, Unicode and safe links remain. Very large archives now return a clear error. Full representative EPUB/DOCX visual regression remains pending.

## Verification executed

| Command / check | Result and limits |
|---|---|
| node scripts/test-document-html-security.mjs | PASS: original XSS reproduced; six hostile fixtures blocked; formatting/link/embedded-image checks; normal ZIP accepted; oversized declaration and dishonest expansion rejected. |
| python -m pytest backend/tests/test_security_unit.py backend/tests/test_api_security.py backend/tests/test_cms_auth.py -q | PASS: 42 tests. |
| python -m pytest backend/tests/test_church_library.py backend/tests/test_mezmur_bulk.py backend/tests/test_editorial_books.py -q | PASS: 45 tests. |
| node scripts/community-api-test.mjs | PASS: origin, Turnstile, validation, correction/privacy and rate-limit responses with mocks. |
| npx.cmd tsx scripts/test-bible-cms.ts | PASS: local parser, rights, role and SQL contract tests. |
| node scripts/test-faith-challenges-editor.mjs | PASS: mocked browser create/save/reopen/review/publish/unpublish/access. |
| node scripts/test-faith-challenges-live-reconciliation.mjs | PASS: 180 structural role/transition cases; not actual RLS execution. |
| npm.cmd run test:play-milestones; node scripts/test-play-complete.mjs | PASS: existing local checks. |
| npx.cmd tsx scripts/bible/test-amharic-question-generator.ts | PASS: offline draft/source/output validation. |
| npx.cmd tsc -b --pretty false; npm.cmd run build | PASS, including final post-fix production build. |
| focused ESLint on sanitizer/parser/security test | PASS. Existing BuiltInDocumentReader contains unrelated any/hook lint debt; audit edits add none. |
| npm.cmd run lint | FAIL: 348 errors / 30 warnings, including scratch copy and existing app debt. Not repaired by suppressing rules. |
| npm.cmd run test:cms:auth | FAIL at scripts/cms-auth-smoke.mjs:53 waiting for “Unable to verify CMS access”. Same failure was recorded before this audit; invalid-login and successful-login checks preceding it passed. No auth test was weakened. |
| npm.cmd audit --json | FAIL/security findings: 38 package entries (0 critical, 13 high, 21 moderate, 4 low). Initial network-restricted attempt failed; approved read-only registry retry succeeded. |
| npm.cmd audit --omit=dev --json | 6 High entries: transformers, image-size, playwright, react-router, react-router-dom, sharp. Not six independent production exploits. |
| secret-pattern / tracked-env / dist inspection | No private-key block or sb_secret value matched in reviewed source/build scopes; only example env files tracked. Not a complete entropy/history/credential audit. Publishable Supabase keys are public identifiers. |
| scoped diff / whitespace | PASS for changed tracked files and explicit whitespace scan of new files. Existing work preserved; no index mutations. |

## Live verification and next authorized work

No privileged live catalog session is available in this audit. Existing public REST evidence showed zero RLS-visible Play rows, which cannot prove private data integrity or effective staff grants. Run SECURITY-LIVE-VERIFICATION-2026-11-03.sql read-only in Supabase SQL Editor. Then test staging with actual anon, visitor, contributor, editor, admin and super-admin JWTs; SQL Editor/table-owner success does not test RLS. Include direct table writes, RPC writes, IDOR, unpublished SELECT, storage signing, immutable role/ID fields and concurrent game submissions. BYPASSRLS/service-role access must never reach browser bundles.

Prioritized remaining checklist:

- [x] Reproduce and remediate document HTML execution locally.
- [x] Bound archive expansion and add dishonest-metadata tests.
- [ ] P0: verify live profile role guard and approve a tested role-escalation migration if affected.
- [ ] P0: inventory all exposed tables/functions, effective policies/grants and storage buckets using supplied read-only SQL; review every definer routine and schema CREATE privileges.
- [ ] P0: replace client-authoritative XP rewards with server-enforced idempotent attempts/stories.
- [ ] P0: protect Game Night answers, implement effective failed-join rate limiting, and test reveal/submit locking races in PostgreSQL fixtures.
- [ ] P1: reconcile Faith Challenges live statuses/identifiers/role policy and conflicting local proposals without applying broad REVOKE blindly.
- [ ] P1: update vulnerable dependencies in an isolated reviewable change; verify advisory applicability and browser/backend compatibility. Python dependency advisories have not been queried.
- [ ] P1: verify backend public Bible query publication gates under actual credential privileges.
- [ ] P1: complete CMS import/upload/RPC input reviews across prayer/calendar/Mezmur/Library and run real effective RLS tests. Auth smoke profile-failure assertion needs a separate scoped correction after verifying current accessible behavior.
- [ ] P1: verify production CSP/frame-ancestors/nosniff/referrer/permissions/HSTS, Cloudflare rate limits, origin/CORS and backend exposure. No checked-in _headers was found; absence is not proof of missing live headers. CSP needs tested PDF/worker/embed allowances.
- [ ] P2: pin CI actions and confirm environment approval, token permissions and artifact content.
- [ ] P2: expand document visual tests, URL/redirect fuzzing, secrets history/entropy review, server-side file signature/size checks, provider spending limits and AI editorial audit identity review.

AI checks: source/model/hash validation and draft-only output exist and offline generator tests pass. These do not prove theological accuracy or eliminate prompt injection. No external AI execution took place. V4/V5 files were only read; no orchestration edits were made.

## Rollback and approval boundaries

No production rollback is required because nothing was deployed. To reverse these local changes, manually reverse ONLY the sanitizer import/call and archive-limit hunks in the two originally clean files, then remove only the newly created audit files after review. Do not reset/stash/clean the shared worktree. Reversing the sanitizer restores a verified vulnerability and is not recommended.

Database proposals remain unapplied. Capture original function/policy/constraint DDL, test a disposable schema, obtain approval, then use transaction rollback on pre-commit failure. After commit, restoring an older state constraint may fail once new statuses exist; never rewrite editorial data automatically to force rollback. Dependency and production-header changes need their own verified rollback artifacts.
