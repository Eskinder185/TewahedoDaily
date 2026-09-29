# Import chants → Supabase (`public.mezmur`)

Migrates production chant/mezmur data from `src/data/chants` into CMS tables:

- `public.mezmur`
- `public.singers`
- `public.categories`
- `public.tags`
- `public.mezmur_tags`

**Additive only.** Source JSON under `src/data/chants` is never modified or deleted. The public site is not switched to Supabase by this import.

## Source files

| File | Role |
|------|------|
| `amharic-chants.json` | Production Amharic mezmur + werb |
| `english-mezmur-chants.json` | Production English mezmur |
| `werb.json` | Production werb pack |
| `classified/*.classified.json` | Classification metadata (merged onto base by `id`) |
| `categories.json` | Category catalog (metadata; used for names/slugs, not chant rows) |

Ignored for chant rows: `categories.json` (catalog only).

Other data folders (`calendar`, `eotc_calendar_json`, `liturgy`, `mocks`, `tselot`) are **out of scope**.

## Field mappings

| Supabase (`mezmur`) | Source |
|---------------------|--------|
| `slug` | Prefer existing `id` / `slug`; else slugify title |
| `title` | EN: `title`; AM: `transliterationTitle` \|\| `title` |
| `title_amharic` | AM pack: `title` |
| `title_oromo` | _(none in source)_ |
| `description` | `meaning` |
| `lyrics_amharic` | `lyrics` when pack language = am |
| `lyrics_english` | `lyrics` when pack language = en |
| `lyrics_oromo` | _(none)_ |
| `transliteration` | `transliterationLyrics` |
| `youtube_url` | `youtubeUrl` normalized to `https://www.youtube.com/watch?v=…`, or `null` if missing |
| `audio_url` | `audioUrl` |
| `thumbnail_url` | `thumbnail` |
| `singer_id` | `singer` \| `artist` \| `choir` → upsert `public.singers` (case/whitespace-insensitive) |
| `category_id` | `classification.primaryCategorySlug` or `category.primary` → `public.categories` |
| `status` | `'published'` |
| `featured` | `false` |
| `published_at` | import time (no reliable publish date in JSON) |

### Categories

Legacy `category.primary` → CMS slugs: `general`, `marian`, `saints`, `liturgical`, `feast-days`, `cross`, `christ`, `other`. New categories use `type = 'mezmur'`.

### Tags

Secondary fields only: form (`mezmur`/`werb`), language (`amharic`/`english`), themes, saints, secondary category slugs, occasions (`majorHoliday`, `usage`, `season`). Linked via `mezmur_tags`.

### YouTube

Missing or empty `youtubeUrl` → `youtube_url = null`. Records are **not** skipped for missing YouTube if lyrics exist.

## Environment (server-only)

Copy `.env.import.example` → `.env.import` (gitignored):

```bash
SUPABASE_URL=https://tgvhpibzzkqxkcumrivh.supabase.co
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
```

- Use the **service role** (or secret) key — never the browser publishable/anon key.
- Do **not** put these in `VITE_*` vars or under `src/`.
- `.env.import` is listed in `.gitignore`.

Dry-run can also read `SUPABASE_URL` / service key from `.env.local` if present, to compare against existing rows.

## Commands

```bash
# Dry run (default) — no writes
npm run import:chants -- --dry-run

# Dry run first 5 planned rows
npm run import:chants -- --dry-run --limit=5

# Small test write (after reviewing dry-run)
npm run import:chants -- --apply --limit=5

# Full import
npm run import:chants -- --apply
```

Import order: categories → singers → tags → mezmur → mezmur_tags.

## Duplicate handling

Before insert, match existing `mezmur` by:

1. exact `slug`
2. exact normalized `youtube_url`

On match: **skip** (do not overwrite CMS-edited rows). Conflicts (slug and YouTube pointing at different rows) are reported and skipped.

Singers / categories / tags: create only if missing (name/slug normalized). Existing singer descriptions/images are not overwritten.

Safe to re-run; second run should report mostly `skipped_existing`.

## Recommended rollout

1. Fill `.env.import` with service role key.
2. `npm run import:chants -- --dry-run` — review counts, missing YouTube, new singers/categories/tags, conflicts.
3. `npm run import:chants -- --apply --limit=5` — verify in Supabase Table Editor and `/admin/mezmur`.
4. `npm run import:chants -- --apply` — full import.

## Rollback / cleanup

There is no automatic rollback. To remove an import batch:

- Delete `mezmur` rows you just inserted (filter by `created_at` around import time, or by known slugs).
- Orphan `mezmur_tags` for those ids.
- Leave shared `singers` / `categories` / `tags` unless you are sure they were created only for this import.

Do not wipe CMS-edited content. Prefer deleting by slug list from the apply JSON output.

## Script location

- `scripts/import-chants-to-supabase/plan.mjs` — inspect + plan
- `scripts/import-chants-to-supabase/index.mjs` — CLI (dry-run / apply)

Legacy script `scripts/import-chants-to-supabase.mjs` (older `chants` tables) is separate; use `npm run import:chants` for CMS tables.
