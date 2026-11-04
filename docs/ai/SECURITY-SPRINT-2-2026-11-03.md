# Security remediation Sprint 2 — 2026-11-03

Release assessment: **BLOCKED for live security sign-off**. Compatible dependency fixes are installed and tested locally. Profile, Game Night and XP database changes are reviewable, unapplied proposals. No SQL (including local fixture SQL), live writes, migrations, production configuration changes, credential rotations, staging, commits or deployments were performed. Existing staged/unstaged/untracked work was inspected and preserved. No staged or deleted paths were reported at the start.

## Priority 1: corrected profile finding and hardened existing proposal

The first audit missed a decisive part of the permission chain. `20260928000000_cms_foundation.sql:29` grants authenticated clients UPDATE only on display_name and avatar_url. `set_cms_member` uses a definer boundary, verifies administrator role, rejects an admin targeting/assigning admin or super_admin, and serializes last-super-admin protection. The later role trigger is permissive, but that alone does NOT establish direct role-update exploitability. The original SEC-003 has been corrected to a conditional defense gap; live effective privileges remain UNKNOWN.

Signup `handle_new_user` and `ensure_user_profile` hardcode role=user, ignoring role metadata. AuthProvider sends display_name, not a role. No public INSERT grant was found. Ordinary self profile edits remain governed by self-row RLS; role changes go through set_cms_member.

Updated **the existing** `20261103_profiles_role_guard_security.sql` in place: revoke broad INSERT/UPDATE/DELETE and sensitive column grants; restore ordinary column editing; reject profile ID mutation; prohibit admin self-role changes and high-role assignments; retain super-admin management while protecting the last super-admin with the same advisory lock as the existing RPC. Install the actual trigger instead of assuming its presence. No duplicate role RPC or profile creation system was introduced.

Expected effective staging matrix (ALL UNVERIFIED, not mocked-test results):

| Caller | Own name/avatar | Direct role/ID write | Role-management RPC |
|---|---|---|---|
| anonymous | deny | deny | deny |
| ordinary/contributor | self only | deny | deny |
| editor | self only | deny | deny |
| admin | as permitted by existing RLS | deny | other user/contributor/editor assignments; no self/equal/higher role escalation |
| super_admin | as permitted by existing RLS | deny | permitted assignments; never remove last super-admin |

Test actual direct PATCH, INSERT, metadata signup, RPC, cross-user IDOR and concurrent demotions in staging before approval. A direct database owner/service-role may bypass grants and is outside the browser authorization model. Capture live enum/RPC/policy/trigger definitions first; do not assume local history is deployed.

## Priority 2: Game Night server boundary

`20261103_game_night_security.sql` proposes:

- A private, RLS-enabled, client-inaccessible question bank. New rounds and scoring do not use public Play payloads. Public solo Play is preserved. **Do not import the existing public question bank as secret content**: clients can already retrieve those answers.
- A whitelist at prompt, option and localization levels; correctKey, explanation, source and arbitrary nested metadata are omitted before reveal. Historical finished/revealed public rounds retain a restricted compatibility read.
- Scoreboards sum only revealed submissions, closing the pre-reveal correctness oracle. Answer results contain only accepted=true.
- Membership/guest-token and host checks, duplicate-submission uniqueness, and a round-row lock shared with reveal/finish UPDATE operations.
- Rejected joins return bounded error codes rather than throwing, so attempts commit under PostgREST. Expected duplicate-name failure is caught inside a subtransaction after the attempt insert. An advisory lock serializes rate counting. Cap: 100 total joins/minute, plus 10/minute per authenticated user. Guests remain supported without trusting caller-supplied IP identities.

The global cap can cause legitimate crowd throttling; trusted gateway per-client/Turnstile protection is still needed for production-scale abuse control. This proposal intentionally does not pretend inet_client_addr() identifies an end-user behind pooled PostgREST connections. Direct SQL clients could roll back their transaction; the intended anonymous API exposure is PostgREST's committed request boundary.

Local application change: `gameNightProtocol.ts` handles the new error envelopes without exposing backend messages. `GameNightPage.tsx` checks the envelope before treating it as room/participant credentials. The existing success shape is preserved. This does NOT remove answers already arriving from an old deployed RPC; server cutover is required.

Activation prerequisites: finish active rooms, independently review/provision private questions, verify pgcrypto/schema resolution and all existing table constraints, deploy matching client, and run effective JWT/locking tests. Private question CMS/import plumbing is not implemented in this sprint. Do not activate an empty bank and break rooms.

## Priority 3: XP authority

`20261103_verified_play_rewards.sql` provides a server-only verified-completion store and `award_verified_play_activity(uuid)`. The public signature accepts no score, snapshot, user or activity string. Only service_role can insert verified evidence or execute the award. A unique user+game+stable-activity ledger INSERT precedes all XP/result mutations in the same transaction; repeated evidence or independent evidence for the same activity cannot award twice. Existing XP/history are retained; no reset/backfill and no import of caller-supplied XP occurs.

The trusted verifier must derive stable activity IDs from its catalog, validate game events/answers and bind the user from verified authentication. A client-selected UUID would only deduplicate a request, not an activity. The proposal revokes the legacy client-score RPC grant at cutover. **BLOCKED:** verifier, authenticated receipt reconciliation and legacy frontend migration are not implemented; applying this SQL now would break cloud completion sync. The old client invocation is therefore preserved locally until the replacement can be activated atomically. Guest/local gameplay remains a convenience state, not an authoritative server reward.

Verify existing game_type constraints cover all proposed game IDs, progress snapshot reconstruction/achievements and retention policy before approval. Live grants, uniqueness behavior and concurrency are UNVERIFIED. Do not call this a deployed XP fix.

## Dependency risk and local remediation

Registry metadata and advisory queries were performed read-only. The manifest's pre-existing authorization test script was preserved; npm's incidental script formatting was reversed. Only two direct version ranges and their matching lock entries changed. Install scripts were disabled. Playwright's matching Chromium headless runtime was then downloaded explicitly for regression tests.

| Package/path | Before → after | Applicability / action |
|---|---|---|
| react-router-dom / react-router | 7.14.0 → 7.18.2 | Compatible v7 upgrade installed. Several High advisories concern SSR/RSC/manifest server modes absent from this BrowserRouter/Vite SPA; browser redirect/route behavior still benefits from patching. TypeScript/build/browser checks pass; post-audit no longer reports this path. |
| playwright / playwright-core | 1.49.1 → 1.55.1 | Browser installer certificate-verification issue, not a visitor application endpoint. Compatible v1 security patch installed; matching headless shell installed; actual browser checks pass. |
| image-size via pptxgenjs 3.12 | 1.2.1, unchanged | Malformed JXL/HEIF/ICNS parsing can loop in Node. PptxGenJS browser mapping disables image-size; Node consumers remain at risk. Patched line starts at 2.0.3; parent requires ^1.0.0. No forced major override. Requires PptxGenJS/Node export migration tests. |
| sharp nested under Transformers | 0.34.5, unchanged | Native libvips/libheif/librsvg advisories. The direct dev Sharp is already 0.35.5; vulnerable nested copy remains. Browser Transformers maps sharp=false, so native decoder is not shipped as a browser implementation. Node tools importing Transformers need separate review. |
| @huggingface/transformers | 3.5.1, unchanged | Advisory inherited through Sharp. All inspected v3 releases require ^0.34.1. Registry recommends 4.3.2, a major upgrade. Do not override native Sharp across a 0.x minor boundary without compatibility tests. Whisper worker migration remains required. |

Production audit: **6 High package entries before → 3 after** (Transformers, nested Sharp, image-size); zero Critical. These are overlapping dependency paths, not independent verified exploits. Full dev dependency debt from Sprint 1 is not resolved. No npm audit fix --force was run.

Advisory references: https://github.com/advisories/GHSA-7mvr-c777-76hp ; https://github.com/advisories/GHSA-qwww-vcr4-c8h2 ; https://github.com/advisories/GHSA-5p2g-fcmc-qvqq ; https://github.com/advisories/GHSA-w3rx-r6r6-pgpr ; https://github.com/advisories/GHSA-f88m-g3jw-g9cj .

## Exact execution and results

| Command | Result |
|---|---|
| `git status --short`; scoped `git diff -- package.json` | Read-only worktree/ownership review. Existing script edit retained. |
| `npm.cmd audit --omit=dev --json` (PowerShell ConvertFrom-Json projection for advisory details/counts) | Exit 1 before and after due findings; 6 → 3 High entries. |
| `npm.cmd view react-router-dom@7.18.2 version engines --json` | Exit 0, Node >=20. |
| `npm.cmd view playwright@1.55.1 version engines --json` | Exit 0, Node >=18. |
| `npm.cmd view image-size versions --json` | Exit 0; no patched v1 release. |
| `npm.cmd view pptxgenjs@3.12.0 dependencies --json` | Exit 0, image-size ^1.0.0. |
| `npm.cmd view @huggingface/transformers@3 version dependencies.sharp --json` | Exit 0, inspected v3 lines retain vulnerable Sharp range. |
| `npm.cmd install --ignore-scripts --no-fund --no-audit react-router-dom@7.18.2 playwright@1.55.1` | Exit 0, compatible local update. No production operations. |
| `npx.cmd playwright install chromium --only-shell` | Exit 0; test runtime installed locally. |
| `npx.cmd tsx scripts/test-security-sprint2.ts` | Exit 0: 6 actual client-result cases + SQL source-contract assertions. NOT database permissions/concurrency execution. Initial contract regex mistakenly matched JSON extraction syntax; corrected its precision, preserving the no-raw-payload expectation. |
| `node scripts/test-document-html-security.mjs` | Exit 0 after matching browser installed: original XSS reproduced, 6 hostile fixtures blocked, normal formatting/images and archive caps preserved. Initial post-upgrade attempt reported missing browser; environmental prerequisite resolved. |
| `node scripts/test-faith-challenges-editor.mjs` | Exit 0, actual mocked-browser create/persistence/review/publish/access flow. |
| `node scripts/test-play-complete.mjs` | Exit 0. |
| `npm.cmd run test:play-milestones` | Exit 0. |
| `npx.cmd tsc -b --pretty false` | Exit 0. |
| `npx.cmd eslint src/lib/play/gameNightProtocol.ts src/pages/play/GameNightPage.tsx scripts/test-security-sprint2.ts` | Exit 0. |
| `npm.cmd run build` | Exit 0, post-upgrade production build. |
| `npm.cmd run test:cms:auth` | Exit 1, same previously documented line 53 profile-error assertion timeout. Preceding login failure/success checks passed. Test not weakened. |
| Scoped `git diff --check` and explicit new-file whitespace checks | PASS. No full-site rescan/full lint rerun; Sprint 1 unrelated lint debt remains. |

## Approval and effective verification procedure

1. Run ONLY the read-only SECURITY-LIVE-VERIFICATION-2026-11-03.sql queries first. New Sprint 2 queries include column-level grants, profile creation/RPC definitions and private-bank/award ACLs. Capture pre-migration definitions and check the actual enum type (live evidence previously named user_role, local history cms_role).
2. Review proposals individually. They are not an approved bundle and must not be applied blindly. No claims of idempotent compatibility with an unknown pre-existing same-named private table are made; validate its exact constraints if it exists.
3. After separate authorization, use a disposable database/staging copy and actual anon/user/editor/admin/super-admin JWT sessions. Reuse supabase/tests/cms_security.sql as a starting fixture; it was NOT executed here. Test profile INSERT/PATCH/signup metadata and legitimate RPC assignments/last-super-admin concurrent demotion.
4. Verify Game Night API cannot read play_private tables directly; open state contains only localized prompt/options even with malicious nested correctKey/explanation metadata. Unauthorized host/member calls fail. Wrong-code/duplicate-name calls increment committed counters; call 101 in a minute is limited. Valid guests still join. Duplicate/concurrent answers produce one score increment; reveal/submit race serializes. Open scoreboard must not change with correctness; revealed scoreboard must reflect earned points. Host finish/start controls remain valid.
5. For XP, anon/authenticated cannot insert evidence or call the award, including with another user's evidence UUID. Run two independent service requests using different evidence rows for the same user/game/activity: total XP delta equals one award. Test transaction rollback then retry, historical XP preservation, cross-device replay and story ID stability. Run legitimate frontend sync/receipt flows only after verifier implementation.
6. Roll back any uncommitted migration failure. Post-commit rollback requires captured original DDL and a separate data-compatibility review; do not delete ledger/history or reset XP to make rollback pass. Deploy no partial frontend/database cutover.

## Files / remaining blockers

Modified: package.json, package-lock.json, GameNightPage.tsx, existing profile proposal, read-only verification SQL, original audit (finding correction), HANDOFF.md. Added: gameNightProtocol.ts, test-security-sprint2.ts, Game Night proposal, verified-rewards proposal, this report. Sprint 1 document processing code/tests remain intact. No V4/V5 edits.

BLOCKED/UNKNOWN: live effective authorization; SQL runtime/syntax/locking verification (no SQL execution authorized); private question provisioning/secure import; trusted XP verifier and frontend cutover; three remaining production advisory entries requiring breaking-path migration; pre-existing CMS auth assertion and lint debt. This sprint makes the database remedies concrete and reviewable but does not claim those vulnerabilities fixed in production.
