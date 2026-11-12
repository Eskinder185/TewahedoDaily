# Faith Challenge experience: what shipped, what did not (2026-11-11)

Branch: `feat/faith-challenge-experience`. Screenshots are in `docs/ai/screenshots/`.

## What players can do now

- **Hub:** a start strip with **Play now**, **Surprise me** (random game), **Play solo**, **Host a game**, **Join a game**, and a **Continue** shortcut when a quiz session was left unfinished. Cards for the four hostable games carry a "Solo + Live room" badge; no other card claims live play.
- **Solo quiz games (Trivia, Finish the Verse, Holy Emoji):** pick category, level, 5/10/20 questions and an optional timer; get answer feedback with explanations and sources; see score, XP and a full review; **Play Again** draws a different set. New: answer positions are shuffled each session (answers are tracked by stable key, never position); a round is topped up from the nearest level instead of silently ending short (Emoji used to stop at 3 questions at the default level); an unfinished round **resumes after a refresh** (6-hour expiry, local to the device).
- **Live rooms (`/play/live`):** a host creates a private room for Trivia, Finish the Verse, Holy Emoji or Who Am I? and gets a 5-character code and a share link. Players join with a display name from their own phone. Lobby roster with connection status, up to 12 players, synchronized rounds, answers hidden until the host reveals, speed-weighted scoring, leaderboard, rematch with fresh questions, reconnect after refresh, host-disconnected notice, 4-hour expiry.
- All twelve game routes load without horizontal overflow at 375, 390, 430 and 1280 px.

## Published content: verified before and after

"Before" is the built-in bank the public games shipped with; "after" adds the validated generated bank (`src/lib/play/generated/`, built by `npm run build:play-bank`). IDs of built-in items are preserved (built-in wins on any collision).

| Game | Before | Published now | Added | Held back |
|---|---|---|---|---|
| Bible & Tewahedo Trivia | 20 | 226 | 206 | 0 |
| Finish the Verse | 5 | 119 | 114 | 0 |
| Holy Emoji Challenge | 6 | 166 | 160 | 10 duplicates |
| Who Am I? | 6 | 132 | 126 | 1 duplicate, 43 unresolved |
| Match & Discover | 8 | 135 | 127 | 43 unresolved |
| History Quest | 6 questions + 3 events | unchanged | 0 | 120 unresolved |
| Bible Timeline (5), Bible Adventure (6), Feasts (12 images), Saints (10), Icon Memory (22), Finish the Mezmur (published records) | unchanged | unchanged | 0 | not wired (see below) |

**Ledger of the 950 reviewed drafts** (`docs/ai/faith-challenges-publication-ledger.json`, one record per item): **733 published, 11 duplicate, 0 rejected, 206 unresolved**.

Unresolved (206), by reason: 159 cite Church Library routes that are not published library documents, so their links would not resolve (100 of them are History items); 25 Who Am I / Match items whose names do not appear in the cited Bible chapter; 20 History items that need doctrinal review; 2 cite calendar routes that cannot be verified. Together that is all 120 History drafts.

**How an item qualified** (all automated and re-runnable): passes the app's own validators; correct key present and options distinct; source is a Bible chapter that exists in the repository's Bible text; for generated trivia/verse items the provenance verse IDs exist and, for Finish the Verse, the excerpt appears in the cited verse; for people/places the name appears in the cited chapter; no exact or near-duplicate (≥0.9 token overlap) of another published or built-in item. **This is not a theological review.** Nobody has read these 733 items for Ethiopian Orthodox teaching; automated grounding cannot catch a true-but-misleading question or a weak distractor (some answers are noticeably longer than their distractors). Amharic text is present but unreviewed (`verifiedLocales: ['en']`), so Amharic players see English with the existing fallback notice.

**Route repair:** the drafts cited volume-style routes such as `/bible/1-kings/18` and `/bible/1-samuel/1`; the reader serves combined books (`/bible/kings/18`, `/bible/samuel/1`; 2 Samuel 1 is `/bible/samuel/32`). The pipeline remaps these; 51 of the published items would otherwise have linked to missing pages.

**Trivia/verse discrepancy resolved from source records:** the 16 batch files contain 206 trivia and 114 Finish-the-Verse questions (320). The compiled library listed 207/113 because one verse question was filed as trivia.

**Campaign accounting from actual records:** 144 batch folders exist; 16 contain `drafts.json` (320 accepted drafts, matching the manifest's 320); 128 have no generated drafts yet; the manifest also lists `batch-145` as failed. The 1,000 target is 32% complete.

## Not done

- **Six new illustrated Bible Adventures: not started.** The current engine is fixed at three scenes bound to six existing artwork templates, and the Studio rejects branches and unknown art. Six genuinely new adventures of 5–8 scenes each need a new scene engine, six sets of original illustrations and a scriptural review. Doing this half-way would have meant presenting thin content as finished.
- **History Quest content** is held back (see above); its 120 drafts need sourcing to real library documents.
- **Generated Timeline chains (34), Feast/Saint decks (11 each), Icon Memory sets (23), Mezmur sample sets** were not wired in: those games load fixed built-in banks with no reader for extra content, and the decks reuse the same existing images.
- **Personal bests and recent-history panels** already existed; I did not extend them.
- **Server-validated multiplayer (Game Night)** remains uninstalled on the live database (its tables and functions do not exist there). Live rooms are a separate, deployable system.

## Live rooms: trust model

The host's browser is the referee. Players never receive a question's correct key or explanation until the host reveals it; the host validates every answer (round open, known player, one answer per round, valid option) and computes all scores. Messages travel over Supabase Realtime broadcast with the public key; no tables, no SQL and no service-role key are involved. Limits: a player who opens developer tools can see the channel's host messages only as they are sent (answers are revealed only at reveal); a **malicious host or someone spoofing broadcast messages can mislead other players' screens**; the room ends if the host closes the page (it restores on refresh). For tamper-proof, server-scored rooms, install the Game Night SQL and use that path.

## Verification

| Check | Result |
|---|---|
| `npm run test:live-room` (engine: permissions, answer validation, score integrity, secrecy, reconnect, expiry, rematch, two-client hub) | 12 pass |
| `npm run test:live-room:browser` (host + two players in independent browsers at 1280/390/430 px over real Supabase Realtime: create, join, duplicate-name refusal, same question on both devices, refresh-reconnect, 5 rounds, leaderboard, rematch) | 9 pass |
| `npm run test:solo-journeys` (three quiz games to results, Play Again differs, refresh-resume, keyboard-only play, hub + 12 routes at 375/390/430/1280, Amharic) | 11 pass |
| `npm run test:play-bank` (ledger accounting, validators, unique IDs, no collisions, real routes, answer integrity, unbiased shuffle, idempotent build) | 6 pass |
| Existing: `test-content-studio` 40, `test-play-complete`, `test-play-foundation` | pass |
| Existing: `test-play-published-content` | **fails, and failed before this branch**: it asserts an old query-ordering string unrelated to these changes |

## Rollback

Everything is additive and in git. To remove the generated content: revert the commit that adds `src/lib/play/generated/` and `generatedBank.ts` (the game page falls back to built-in banks). To remove live rooms: revert the `/play/live` routes and `LiveRoomPage`. To restore the old hub: revert `PlayHubPage.tsx`. No database change was made, so no database rollback exists or is needed.

## Local development note

`.env.development.local` sets `VITE_PLAY_DATABASE_ONLY=true`. The live database has zero published play rows, so in local `npm run dev` every game shows an empty bank. The browser tests override it. Remove that file (or set it to `false`) to play locally.
