# Search Assistant Architecture

Tewahedo Daily’s **Search Buddy** is a navigation and content finder — not a generic chatbot.

## Principles

1. **Retrieval first** — answers and cards come from real indexed / catalogued content.
2. **No invented routes** — every result has a validated public route from App routing or catalogs.
3. **No unrestricted repo access** — production never reads arbitrary filesystem paths.
4. **Search works without AI** — if a model is unavailable, search results still appear.
5. **Guest-first** — login is optional; personal commands only use the current user’s data.

## Architecture

```
User query
   → searchSite()
        → route catalog (pages / intents)
        → mezmurSearch catalog (mezmur_data_import)
        → prayerSearch catalog (prayers / liturgy / guides)
        → zemaris + hymn collections
   → ranked SiteSearchResult[]
   → Search Buddy UI (cards + Open →)
   → optional future AI layer (server-only, grounded snippets only)
```

## Content sources

| Source | Origin | Routes |
|--------|--------|--------|
| Pages | `src/lib/search/routeCatalog.ts` | `/practice`, `/pray`, `/calendar`, … |
| Mezmurs | `mezmurSearch` ← `mezmur_data_import` | `/practice/mezmur/:slug` |
| Zemaris | `public.zemaris` | `/practice/zemari/:slug` |
| Collections | `mezmur_collections_import` | `/practice/browse/:slug` |
| Prayers / guides | `prayerSearch` | `/pray/...`, learn-how-to-pray |
| Synaxarium | `synaxariumSearch` ← published `synaxarium_days` + `synaxarium_commemorations` | `/pray/synaxarium/:slug` |
| Durable index (optional) | `public.search_documents` | synced via script |

**Not indexed:** favorites, profiles, drafts, CMS notes, env/secrets, admin-only code.

Synaxarium hits only include `status=published` days and commemorations that resolve to a published day slug. In-assistant preview supports **Back to results** (same scroll); **Open full page** navigates once with `fromSearchBuddy` state; **Back to Search Buddy** reopens the session from `sessionStorage` without inventing history loops.

## Indexing strategy

### Runtime (Phase 1 — primary)

`searchSite()` loads existing Fuse catalogs + route catalog. No DB table required for the assistant to work.

### Durable index (optional)

1. Apply `supabase/FIX_SEARCH_DOCUMENTS.sql` (or migration `20261004130000_search_documents.sql`).
2. Run `node scripts/sync-search-index.mjs` with service role for upserts (publishable key still builds a local snapshot).
3. Snapshot written to `src/content/search/search-index-snapshot.json` (allowlisted build artifact).

### Static allowlist for indexing scripts

Allowed:

- `src/lib/search/routeCatalog.ts`
- Public content fetched from Supabase public tables listed above
- `src/content/search/*` snapshots

Never indexed:

- `.env*`, keys, `node_modules`, `.git`, `dist`, admin-only secrets, source maps

## Ranking

1. Navigation intents (`go to calendar`, `open hymns`)
2. Exact / alias page matches
3. Exact mezmur / prayer titles (incl. Amharic)
4. Prefix / keyword / fuzzy (Fuse)
5. Collections / Zemaris / related pages

Typo / alias expansions live in `QUERY_ALIASES` (e.g. Timket→Timkat, Meskal→Meskel).

## Amharic + English

Uses shared normalizers from `mezmurSearch`:

- Latin NFKD fold for English/transliteration
- Whitespace-normalized Ethiopic for Amharic
- Catalogs already include `title_amharic` / Amharic pray fields

## Assistant UI

- Lazy-loaded floating **Find Something** button (`SearchBuddy`)
- Search-first cards via `SearchResultCard`
- Escape to close, dialog semantics, 44px+ targets
- Personal: “show my favorites” → `/saved` (no model call)

## AI backend (Phase 2+)

If added:

- Cloudflare Pages Function (like `functions/api/submissions.ts`)
- **Never** `VITE_*` model keys
- Retrieve top 5–10 docs → send snippets only → grounded reply
- If AI fails, still return `searchSite()` results

## Privacy / RLS

- `search_documents`: public read where `is_public`
- `search_query_stats`: insert-only anonymous aggregates (optional); no chat logs by default
- Admin drafts / other users’ data never enter the index

## Adding searchable content

1. Prefer fixing the **canonical** table (mezmur import, prayers, zemaris, route catalog).
2. Ensure a real public route exists in `App.tsx`.
3. Re-run sync script if using `search_documents`.
4. Add aliases in `routeCatalog.ts` / `QUERY_ALIASES` for common names.

## Phases

| Phase | Status |
|-------|--------|
| 1 Unified search + route catalog + cards | Implemented |
| 2 Assistant UI + NL navigation | Implemented (search-grounded) |
| 3 Embeddings / pgvector | Deferred until keyword quality plateaus |
| 4 Deeper personalization | Favorites shortcut only for now |
