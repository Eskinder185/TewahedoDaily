# Mezmur frontend visibility fix report

Date: 2026-10-27

## Changes

- Kept the public catalog on `mezmur_public` with range pagination and no artificial catalog cap.
- Added explicit cache invalidation for the public collection metadata and local published search catalog.
- Publish and bulk-publish now invalidate those caches after a successful database-confirmed publication.
- Returning a published Mezmur to draft also invalidates the public caches.
- Unified search now falls back to the same public Supabase projection when the Search Buddy API is unavailable. It never falls back to private tables or draft rows, and reports `source: 'local-fallback'` to the caller.
- Existing UUID publication calls remain strict: when an import UUID is present, the frontend calls the UUID overload and does not silently retry by slug.

## Files changed

- `src/lib/publicContent/hymnBrowse.ts`
- `src/lib/publicContent/mezmurSearch.ts`
- `src/lib/search/unifiedHymnSearch.ts`
- `src/lib/cms/mezmurService.ts`
- `src/lib/cms/mezmurBulkService.ts`

No Supabase migration was applied and no production data was changed.

## Validation

The production public projection was audited read-only: 1,514 public rows, 0 duplicate normalized slugs, 1,504 YouTube URLs, 1,458 rows with Amharic lyrics, and 1,354 with transliteration. The private comparison remains blocked by the expected `42501` permission response under the publishable-key session; exact imported/published/missing counts must be obtained from an authorized SQL Editor session.

Run locally:

```text
npm run build
npm run test:hymn-browse
npm run test:mezmur-visibility
npm run test:mezmur-publication
npm run test:mezmur-publication-duplicate-safety
npm run test:mezmur-bulk
```

The existing Playwright journeys can be run with `npm run test:journeys` after starting the Vite preview/dev server. Production manual publishing and bulk publishing were not executed because the request prohibits production writes and the UUID migration is not yet authorized/applied.

## Required production action

Before applying the UUID publication migration, run the read-only SQL in `MEZMUR_FRONTEND_VISIBILITY_AUDIT.md` as an authorized database administrator. Confirm the duplicate and missing-public sets, then obtain explicit approval for the reviewed migration. Do not use unrestricted `supabase db push`.
