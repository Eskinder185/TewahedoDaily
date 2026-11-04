# Game Night hosting fix (review only; nothing applied)

No SQL was run against any live, staging or production database. All SQL below was exercised only on a throwaway local PostgreSQL 17 with stubbed Supabase pieces.

## 1. What Game Night needs

| Layer | Objects |
|---|---|
| Tables | `play_rooms`, `play_room_participants`, `play_room_rounds`, `play_room_submissions`, `play_room_join_attempts` (all with RLS on and no browser grants); `play_content_items` (FK from rounds); after the security proposal also `play_private.game_night_questions` |
| RPCs the page calls | `create_play_room` (signed-in only), `join_play_room` (anon + signed-in), `get_play_room_state` (anon + signed-in, token-checked), `start_play_room_round` / `reveal_play_room_round` / `finish_play_room` (host only), `submit_play_room_answer` (anon + signed-in, token-checked); after finish, `claim_verified_play_room_reward` (signed-in) from the rewards proposal |
| Extension | `pgcrypto` (`gen_random_bytes`, `digest`) reachable from every room function |
| Migrations | base `supabase/migrations/20261101120000_tewahedo_play_game_night.sql` (also needs the Play milestones migration for `play_content_items`), then the proposals below |

## 2. Diagnosis

`GameNightPage.tsx` mapped any RPC error whose text matched `schema cache | not find | does not exist` to "needs the checked-in multiplayer migration". Two very different failures hit that regex:

1. **Function really missing.** PostgREST returns `PGRST202 ... in the schema cache`. This is the only real "migration not applied" signal.
2. **Function installed but pgcrypto not reachable (reproduced locally).** The checked-in `create_play_room` pins `set search_path=public`. When pgcrypto is installed in the `extensions` schema (the Supabase default), the call fails with `42883 function gen_random_bytes(integer) does not exist`, which the old regex reported as "needs the migration" even though the migration was installed. Hosting is impossible in that state, and the Sprint 2 security proposal does not replace `create_play_room`, so applying it alone would not fix hosting.

Which of the two is live is UNKNOWN until verification SQL block 1/4/6 is run; the fixed page will now say which one it is.

Other finding: the Sprint 2 `start_play_room_round` reads only `play_private.game_night_questions`. With an empty bank every host's "Start next question" fails. Private questions must be provisioned before cutover (no provisioning tool exists; Sprint 2/3 documents record this).

## 3. Changes (local only)

- `src/lib/play/gameNightProtocol.ts`: `describeGameNightRpcError` returns specific messages: missing function (PGRST202/205), pgcrypto unreachable, missing dependency object, sign-in required, no reviewed questions, host-only, duplicate answer, permission, otherwise the database message.
- `src/pages/play/GameNightPage.tsx`: uses it and carries `code`/`details`; behaviour otherwise unchanged (secure codes, server scoring, token flow, session storage).
- `docs/ai/proposed-migrations/20261103_game_night_hosting_compat.sql` (new, review only): replaces only `create_play_room` with `search_path=pg_catalog,public,extensions,pg_temp`; identical behaviour (authenticated only, 6-hex CSPRNG code, SHA-256 hash stored, same validation). It does not replace the security proposal.
- `docs/ai/proposed-migrations/20261103_game_night_live_verification.sql` (new): read-only installation and permission checks.
- `scripts/test-game-night-hosting.mjs` (new): error-mapping unit checks plus a mocked browser host flow.

## 4. Migration order

Use the corrected proposals; do not run the base migration's vulnerable RPC bodies on their own.

| Step | File | Notes |
|---|---|---|
| 0 | `20261103_game_night_live_verification.sql` | Save the full output (rollback material, stage detector). Run each numbered block separately in the SQL Editor. |
| 1 | base `20261101120000_tewahedo_play_game_night.sql` | ONLY if step 0 shows the tables/RPCs missing. Its vulnerable join/state/submit/start bodies must not stay live: run steps 1-3 together. |
| 2 | `20261103_game_night_hosting_compat.sql` | Fixes `create_play_room` search_path. Skip only if block 6 already shows `search_path_reaches_extensions = t`. |
| 3 | `20261103_game_night_security.sql` | Requires zero active rooms (block 7). Replaces join/state/start/submit, adds private bank. |
| 4 | Provision reviewed private questions | Required before any room can start. Category strings must equal the UI's ("All categories", "Seven Sacraments", "Church history") and difficulty must match exactly. Do NOT copy public Play answers into the bank (they are already public). Service-role insert only; `status='published'` rows need `reviewed_at`. |
| 5 | (optional, rewards) `20261103_verified_play_rewards.sql` | Needed only for the post-game XP claim button; not for hosting. |

Local proof: steps 1-3 concatenated (with the inner `begin`/`commit` removed and one outer transaction) applied cleanly from scratch, and `rollback` left nothing behind:

```
{ echo "begin;"; for f in supabase/migrations/20261101120000_tewahedo_play_game_night.sql \
    docs/ai/proposed-migrations/20261103_game_night_hosting_compat.sql \
    docs/ai/proposed-migrations/20261103_game_night_security.sql; do grep -v -E '^(begin|commit);$' "$f"; done; echo "commit;"; } > game-night-all.sql
psql -v ON_ERROR_STOP=1 -f game-night-all.sql     # for a dry run, replace the final commit with rollback
```

## 5. Local runtime evidence (PostgreSQL 17 simulation; pgcrypto in `extensions`)

- Checked-in base: host `create_play_room` fails with `42883 gen_random_bytes(integer)`. With compat: succeeds.
- With compat + security + 5 private questions: anon cannot create; host creates (code is 6 hex, plaintext never stored); invalid settings rejected; empty bank gives "No reviewed private questions available"; guest (anon) and signed-in player join; wrong code and duplicate name return data (no exception) and the attempts are counted; non-host start/reveal denied; open-round state has no `correctKey`/`explanation`; wrong token rejected; correct answer scored server-side; duplicate answer rejected; scores appear only after reveal; reveal exposes key, explanation and source; direct table writes and the private schema are denied to anon and authenticated; finished room rejects new joins; 105 attempts in a minute reach `rate_limited`.
- Not proven locally: real PostgREST/JWT behaviour, real Supabase default grants, concurrency under load.

Compatibility with published Play questions: the secure start no longer reads `play_content_items`; legacy finished rooms keep showing their original public-question rounds (FK `ON DELETE RESTRICT`). A published question's payload shape (`prompt.en`, four keyed options, `correctKey`, `explanation`, `source`) matches what `play_room_question_view` projects, so reviewed questions can be authored in the same shape. The view does not project `emoji`, so emoji-style questions would lose their emoji prompt; keep private bank questions text-based until that is extended. The Faith Challenges six-state guard trigger only touches `play_content_items` writes and does not affect Game Night RPCs.

## 6. Application checklist (isolated staging first)

1. Provision a disposable database restored from a production-safe copy; confirm the target project reference.
2. Run verification block 1/3/4/6/7; record where pgcrypto lives and which stage is live.
3. Apply steps 1-3 in one transaction (or 2-3 if base is live) with `ON_ERROR_STOP=1`; re-run verification: every `installed=t`, grants match `*_expected`, block 5 all `t`, block 6 `t`, block 2 shows no browser table privileges, block 10 does not list `play_private` as exposed.
4. Provision private questions (step 4); block 8 shows `eligible >= question_count` for the settings you will test.
5. Deploy the matching client build; confirm the error banner now names the real failure if anything is off.
6. With real JWTs: signed-in host creates a room; a guest joins by code on a second device without signing in; host starts, both answer, reveal, finish; repeat host-only, token and rate-limit negatives.
7. Back/forward navigation and refresh keep the room session (sessionStorage) as before.

## 7. Rollback

Before commit: `ROLLBACK`. After commit: restore from the function definitions saved in verification block 3 (`create or replace` of the previous bodies and grants); `play_private.game_night_questions` and `secure_question_id` can stay (inert) or be dropped only if empty. Prefer a snapshot of the disposable database.

## 8. Decision

- Applying the corrected Game Night migrations to **isolated staging: GO** (steps 0-4, then the checklist).
- Applying to **live/production: BLOCKED** until (a) step 0 shows what is actually live, (b) reviewed private questions exist for the offered category/difficulty settings, (c) the staging JWT checklist passes, (d) there are zero active rooms at cutover, and (e) a human approves the SQL. Without (b), applying the security proposal would make every host's "Start next question" fail.
