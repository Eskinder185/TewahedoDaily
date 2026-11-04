# Game Content Studio — unapplied database/adapter change request

Review-only proposal. No SQL was executed. This document does not authorize any migration, grants, production writes or deployment. It supplements, rather than recreates, `20261102_faith_challenges_live_reconciliation.sql` and its read-only verification script.

## Phase 2 reader update — 2026-11-03

Who Am I and Match now have strict published-only card readers and actual saved-draft engine tests. Existing server drafts for these types open/edit in the unified Studio. Their existing service/database publication blocks remain intact; this update does **not** authorize removing those guards. New local collections/copies remain local, and Match database rows remain one pair per record. Six other non-quiz formats and History chronology still lack public adapters. The historical “no loader” statements below are superseded for these two readers only.

Before a future approved gate change, verify the deployed six-state guard, both identifiers, payload constraints, effective grants/RLS and eligible-source behavior. Prove real editor→review→admin approval→publish→anonymous play→archive/unpublish in isolated staging. Only then propose a narrowly reviewed amendment to the existing guard/service for these two types; keep the Finish Mezmur block and all authorization/audit/transition protections. Do not apply a generic game-type expansion or publish local array envelopes. Reader tests use synthetic independently published rows and are not proof that this publishing path is deployed.

## Current safe boundary

The new `/admin/play/studio` uses the existing `play_content_items` and `review_play_content` API for **history questions, trivia, emoji and finish-the-verse only**. Existing schemas, identifiers, draft-only edits and role transitions remain authoritative. Eight other formats save versioned local browser drafts; none has a new public loader or publication operation. No new table or database field is required for those local drafts.

The existing question library remains available. Its Who Am I / Match rows are draft/review material, not connected public card banks. Legacy Finish the Mezmur quiz rows also do not drive the current lyric-derived game.

## Minimal near-term delta requiring approval

The checked-in six-state proposal blocks publication for `who-am-i` and `match`. It must also block `finish-the-mezmur` question rows until an intentional, compatible public question reader exists. The public game currently reads `mezmur_public` through `mezmurLyricsSource.ts`, then derives `FmQuestion` values. Publishing unrelated quiz JSON must not be represented as updating that game.

After verifying the actual deployed guard definition and dependencies, amend the existing guard's publication condition (review diff only):

```diff
- if new.status='published' and old.game_type in ('who-am-i','match') then
+ if new.status='published' and old.game_type in ('who-am-i','match','finish-the-mezmur') then
```

Keep the existing error, invoker design, role checks, immutable identifiers, server-owned timestamps and transition matrix. Do not add a second permissive policy or weaken grants. The TypeScript service now applies this extra gate, but that is **not database enforcement** and direct requests remain dependent on actual deployed permissions/guards. Existing legacy published rows require inventory and a separate editorial decision; no automatic status rewrite/backfill is proposed here.

## Future format connection prerequisites

| Format | Required adapter/schema work before any publication migration |
|---|---|
| Who Am I | Phase 2 loader and strict locale/source validation implemented. Still requires approved staging verification and a narrow existing publication-guard amendment. Existing game is a timed hot-seat identity; no invented portrait/clue fields. |
| Match | Phase 2 reader forms a validated bank from individual published `MatchPair` rows, rejects duplicate sides and preserves 4/6/8 public board sizes. Local collections remain arrays; DB rows remain one object. Staging verification and publication-guard approval remain required. |
| Bible Timeline | A typed `TlChain` loader, immutable event identities, canonical order/source validation, independent content-version approval and compatibility with seen-round history. Dates/eras are not existing `TlEvent` fields. |
| Bible Adventure | Exactly-three-scene linear schema plus discover/question validation, source references and artwork binding. Current story IDs also drive hardcoded hotspot/art state; arbitrary new IDs/branches cannot be imported safely. Separate stable content identity from a supported artwork template in a deliberately reviewed engine change first. |
| Finish Mezmur | Prefer the existing hymn editorial pipeline; lyrics/media already live there. Review source rights and published-view eligibility. The current game requires usable Amharic lines; English-only songs and arbitrary author-selected missing segments are not supported by that engine. Do not create a parallel lyric source. |
| Feasts / Saints | Published `PlayImage`-compatible projections, verified media relationships/rights and source/description checks. Current arrays use the local game image catalog; metadata alone does not prove fresh CMS approval. Calendar recurrence and progressive clues need separately designed gameplay support. |
| Icon Memory | Same image projection plus existing 4/6/8 pair limits and a deterministic identity/label relationship. An array is not an existing `play_content_items` object payload. |
| History chronology | A separate adapter for the existing `HISTORY_TIMELINE` event/year/source objects. History question payloads cannot store chronology silently. “Who Was This?” currently filters static IDs (`ezana` / `frumentius`), so arbitrary new questions are not automatically included in that submode. |

Once each reader exists, extend the **existing** game-type constraint and payload-validator dispatch only for its actual schema. Preserve the six-state guard and published-only anonymous policy. No generic `CREATE TABLE IF NOT EXISTS`, guessed constraint drops, blind data rewrite or bulk auto-publication is justified without the live catalog. A new migration must reject incompatible deployed constraints and ambiguous legacy IDs, and be idempotent against a confirmed staging baseline.

## Required verification and rollback boundary

1. Separately approve a named isolated staging target and read-only catalog collection using the guarded staging runbook. Confirm columns/defaults, both identifiers/uniqueness, status/game checks, triggers, foreign keys, function security modes/grants and all overlapping policies using the existing Faith Challenges verification SQL. Do not infer deployed state from repository files.
2. Inventory each legacy format/status and mismatched `question_id` / `stable_id` / `payload.id`; retain counts and source/media rights. No IDs or statuses are automatically repaired by this studio.
3. Approve the exact guard change separately. Apply only to disposable staging, then run invoker/direct PostgREST role matrices for anon, user, editor, admin, super-admin and service-role draft importer.
4. Prove each future reader sees only eligible published revisions, never staff-visible drafts. Test malformed payloads, direct-update bypass attempts, publication timestamp forgery, source/rights rejection and independent changes to Game Night's private/reveal-only data.
5. Require save → reload → approve → publish → public play → archive/unpublish round trips for the real format; local browser previews do not satisfy this gate.
6. Preserve pre-change function definitions, policies, grants and a staging snapshot. Roll back the owner-approved transaction before commit on any failure. After commit, restoring the captured staging baseline needs separate approval; never re-enable vulnerable grants as an automatic rollback or reset production.

Status: **unapplied; hosted schema, effective grants/RLS and production readiness remain UNKNOWN/BLOCKED**. No executable broad schema expansion is supplied because actual live catalog and reader support are prerequisites.
