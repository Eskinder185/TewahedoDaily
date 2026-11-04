# Proposal: play game settings (NOT EXECUTED)

Status: review only. Nothing here was run against any database. Do not apply to production first.

## Why

The public hub reads `src/lib/play/gameCatalog.ts`. To let staff manage title, description, short facts, instructions, thumbnail, order, featured, enabled and difficulty availability without a code release, the hub needs a reviewed, published-only reader. The Studio's Game settings view currently stores only local proposals.

## Sketch (to be reviewed against the live catalog first)

- Table `public.play_game_settings(game_id text primary key, title jsonb, description jsonb, meta jsonb, instructions jsonb, thumbnail_key text, sort_order int, featured boolean, enabled boolean, levels text[], status text, published_at timestamptz, updated_by uuid, updated_at timestamptz)`.
- `game_id` must be one of the twelve canonical IDs; `title` and `description` require English; Amharic is used only when a human marks the locale verified; `thumbnail_key` must exist in the media catalog.
- RLS: anonymous and authenticated SELECT only where `status = 'published' and published_at is not null`; INSERT/UPDATE only for editor, admin and super_admin; editors may only submit for review and admins publish (the same six-state transition rules as `play_content_items`); no DELETE grant.
- Public adapter: `PlayHubPage` merges published rows over `HUB_GAMES` by `game_id`, validates every field and falls back to the built-in catalog on any error. Disabled games stay reachable by URL unless a separate decision hides them.

## Required before any application

1. Read-only catalog inspection of roles, grants and the existing editorial trigger functions on staging.
2. A reviewed migration file, rollback notes and a staging JWT test matrix (anon, editor, admin).
3. Frontend reader tests proving drafts and unpublished rows never reach the hub.
