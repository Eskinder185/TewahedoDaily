# Tewahedo Play — inspected schema and migration proposal

Status: inspected design record. The additive migrations `20261031120000_tewahedo_play_milestones_2_4.sql` and `20261101120000_tewahedo_play_game_night.sql` are checked in but have not been applied to a Supabase environment.

## Existing source model inspected

The proposal is based on the checked-in Supabase migrations and generated TypeScript types, not assumed table names.

- Bible: `bible_editions` → `bible_source_books` → `bible_chapters` → `bible_verses`, with `bible_canonical_books` providing the stable book identity. Public eligibility already depends on reviewed, public, published editions and source books.
- Mezmur: `mezmur` is the stable record. It has language-specific lyric fields, publication status, source metadata, Zemari/category relationships, and public views/RPCs that hide non-public material.
- Church Library: `church_library_books` → `church_library_book_versions` → `church_library_sections` → `church_library_passages`. Public policies require approved, ready, publicly retrievable books; passages include language and review status.
- Accounts: `profiles` follows `auth.users` through `profiles.id = auth.users.id`. Existing user-owned tables use `user_id = auth.uid()` RLS.
- Editorial roles: `public.is_staff()` and CMS roles already distinguish regular users from editors/admins.

No game table currently exists in the checked-in schema.

## Implemented Milestones 2–4 migration

The first migration deliberately uses a smaller content envelope while the editorial team validates the workflow:

- `play_content_items` stores a stable ID, game/category/difficulty, localized payload, typed source-reference array, and draft/approved/rejected/published state. Public RLS returns only published rows; staff can review all rows.
- `review_play_content` requires a staff identity and refuses publication unless the row is already approved. A published row must have a source reference.
- `play_user_progress` stores the authenticated user’s XP/streak snapshot, `play_game_results` stores completion history, and the achievement tables store definitions and awards.
- `record_play_completion` validates the authenticated user, supported game type, JSON shape, and score range before updating progression. Guests stay in local browser storage.

The normalized game/session model below remains the recommended hardening path before Game Night. Single-player completion scores in the first migration are client-reported and must not be reused as authoritative multiplayer scoring.

## Implemented Game Night migration

The second migration implements the authoritative room model: hashed six-character room codes, hashed participant reconnect tokens, expiring rooms, host ownership checks, rate-limited joins, unique per-round submissions, published-content selection, answer hiding before reveal, and SQL-side scoring. Browser clients cannot write room tables directly; all access is through narrow RPCs. The UI polls the membership-validated state RPC, which avoids exposing room rows through broad Realtime policies. A future scale pass may replace polling with equally restricted Realtime broadcasts.

The migration depends on published `play_content_items`; it does not auto-publish local or generated questions. This keeps Game Night unavailable rather than unsafe when the editorial bank is empty.

## Adventure architecture

The first adventure is an isolated, lazy-loaded 2D chapter at `/play/adventures`. Scenes, checkpoints, source links, and completion logic are kept outside the quiz engine, while shared language, authentication, and progression services are reused. This boundary allows a future React Three Fiber renderer to implement the same scene/checkpoint contract without rewriting the Play hub or progression layer.

## Future migration boundaries

Use a dedicated `play_` prefix so the feature cannot collide with educational source tables. Source rows are referenced; never copied back into or used to update the Bible, Mezmur, or Church Library tables.

### Normalization A — reviewed game content

- `play_games`: stable game keys, route, availability, settings.
- `play_categories`: stable category keys and ordering.
- `play_game_categories`: many-to-many relationship.
- `play_content_items`: stable content identity, game kind, difficulty, editorial state (`draft`, `approved`, `rejected`, `published`), reviewer data, and version.
- `play_content_localizations`: `(content_item_id, locale)` question/prompt, explanation, hints, and verified-translation flag. Supported locale check: `en`, `am`.
- `play_answer_options`: stable option key, localized text, display order, and correctness flag.
- `play_source_references`: typed nullable references to the inspected source IDs (`bible_verse_id`, `mezmur_id`, `church_library_passage_id`, `saint_id`, `feast_id`) plus a public route and locator label. A check constraint must require at least one source ID.

Public access should be through a security-barrier view or RPC that returns only `published` items and does not expose answer correctness until an answer is submitted. Direct public `SELECT` on `play_answer_options.is_correct` should not be granted.

Editorial writes should require `public.is_staff()`. Publishing should require an approved item, at least one verified localization, a source reference, and the required number of valid answer options.

### Normalization B — authoritative game sessions

- `play_sessions`: anonymous session token hash or authenticated owner, game key, settings, lifecycle, server seed, and expiry.
- `play_session_items`: ordered content IDs and reveal state. This freezes a reviewed question set for a round.
- `play_player_answers`: session, item, participant/user, selected option or normalized typed answer, received timestamp, awarded score, and unique submission constraint.

Scoring and answer validation should be implemented in a `SECURITY DEFINER` RPC with a narrow `search_path`, not in browser code. The RPC should validate session membership, item reveal state, one-answer-per-player, and time windows.

### Expansion C — progression

- `play_user_progress`: one row per authenticated user with XP and current streak metadata.
- `play_game_results`: immutable completion summary for authenticated users; guests remain local unless they later opt in to attach an eligible session.
- `play_category_mastery`: user/category aggregate.
- `play_achievements` and `play_user_achievements`.
- `play_daily_challenges` and `play_daily_completions`.

All user-owned rows use `user_id = auth.uid()` RLS. XP and achievements must be written only by trusted completion RPCs; clients receive read access only.

### Expansion D — Game Night

- `play_rooms`: short-code hash, host user/session identity, state, settings, last activity, and expiry.
- `play_room_participants`: room membership, normalized display name, role, reconnect token hash, presence, and score.
- `play_room_rounds`: server-selected session item, lifecycle, timestamps, and reveal state.

Room codes must be generated server-side with collision handling. Join and submit RPCs require rate limiting, expiry checks, membership checks, and duplicate-submission constraints. Realtime publication should include room/participant/round state but never correctness before reveal. Host transitions must verify the caller is the room host.

## Draft-generation pipeline

1. Read only eligible source rows through existing public/staff-safe APIs.
2. Create a candidate with stable source IDs and locators.
3. Validate required localizations and game-specific shape.
4. Run normalized-text/source duplicate checks.
5. Insert as `draft`; never publish automatically.
6. Require an editor to approve or reject in the Play admin queue at `/admin/play`.
7. Publish only through a validation RPC that records reviewer and version.

No paid AI API is part of this proposal. Any future generation adapter must be opt-in, configured server-side, and treated only as a draft authoring aid.

## Migration sequencing

Apply the checked-in Milestones 2–4 migration after review, then add the normalized session model before Milestone 5. Game Night must use authoritative answer submission and scoring; the lightweight single-player completion RPC is not sufficient. Each later migration should include pgTAP/SQL checks for grants, RLS, hidden answers, editorial transitions, duplicate submissions, and source-reference integrity.
