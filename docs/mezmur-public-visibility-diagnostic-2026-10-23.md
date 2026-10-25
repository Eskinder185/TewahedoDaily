# Mezmur public visibility diagnostic

Date: 2026-10-23 (America/New_York)

Scope: read-only inspection of the deployed Cloudflare Pages application, its public JavaScript bundles, the production Supabase REST API using the same publishable browser key, and the public Hymn search API. No production data, policy, deployment, or cache was changed.

## Finding

The imported batch is not visible because it is not published in the production Supabase project used by the website.

- Production contains 1,153 rows in `public.mezmur_data_import` (1,125 distinct slugs).
- 888 rows are still `status = 'draft'`; 265 are `status = 'published'`.
- The number 888 matches the reported imported batch closely. The status change either did not reach this Supabase project or did not persist.
- The live FastAPI search endpoint queries `mezmur_data_import` with `status=eq.published`. Exact probes returned published rows and did not return the probed draft rows.
- The deployed detail page also rejects draft rows. A local browser smoke test backed by production public data loaded a published hymn and showed “This hymn is not currently published” for a draft hymn.

This is not primarily a Cloudflare cache problem and is not caused by a transfer delay into `public.mezmur`.

## Actual public data path

`/hymns` redirects to `/practice`.

| Public feature | Production source | Filter / behavior |
| --- | --- | --- |
| Landing collections | `mezmur_collections_import` | client-side published status; five-minute in-memory collection cache |
| Collection sections | `mezmur_sections_import` | client-side published status |
| Section hymn cards | `mezmur_section_links_import` + `mezmur_data_import` | linked slug plus published status |
| Occasion cards | `mezmur_occasion_links_import` + `mezmur_data_import` | linked slug plus published status |
| Category cards | `mezmur_category_links_import` + `mezmur_data_import` | linked slug plus published status |
| Zemari pages | `zemaris` / `zemaris_with_counts` + `mezmur_data_import.zemari_id` | published Zemari and published hymn status |
| Hymn detail | `mezmur_data_import` | slug plus published status |
| Typed / voice search | `https://ai.eskinder.dev/api/hymns/search` | backend queries `mezmur_data_import` with `status=eq.published`; maximum 50 results |
| Offline/local catalog search | `mezmur_data_import` | client-side catalog, five-minute in-memory cache |

The service worker caches hashed frontend assets and images. It does not runtime-cache Supabase REST or `/api/hymns/search`, so it cannot explain 888 records consistently missing from queries.

## Production counts

| Check | Count |
| --- | ---: |
| Import-table rows readable by anon | 1,153 |
| Distinct import slugs | 1,125 |
| Published rows / distinct published slugs | 265 / 265 |
| Draft rows | 888 |
| Published rows linked to a section | 238 |
| Published rows not linked to a section | 27 |
| Distinct import slugs with any section link | 238 |
| Distinct import slugs without a section link | 887 |
| Occasion link rows / linked slugs | 67 / 67 |
| Category link rows / linked slugs | 210 / 210 |
| Imported rows missing every lyrics field | 5 |
| Imported rows missing all Zemari/singer references | 353 |
| Imported rows missing `mezmur_id` | 1,149 |
| Duplicate slug groups | 28 (each appears twice) |
| Published + `review_status = approved` | 0 |

Status distribution: `draft` 888; `published` 265.

Review distribution: `needs_review` 954; `ready` 199. Production has no `approved` value in these rows.

Language distribution: Amharic 977; English 151; Ge'ez 23; Oromo 2.

Form distribution: Mezmur 1,128; Werb 8; `wereb` spelling variant 17.

## Schema and transfer result

The production REST schema does not contain `public.mezmur` (`PGRST205`, table absent from the schema cache). It does contain and publicly expose the import tables. The current frontend and backend therefore treat `mezmur_data_import` as the effective source of truth.

The repository's `MEZMUR_APPLY_IMPORT.sql` cannot transfer new hymns into a canonical table: it explicitly says “do NOT insert new mezmur rows,” and its function only updates canonical rows whose slugs already exist. It would also abort today because production lacks `public.mezmur` and the import table has 28 duplicate slug groups.

Conclusion: the imported records were not transferred into a canonical public Mezmur table; that table is not present in this production schema. The live site intentionally reads the import table instead.

## RLS and rights risk

Anonymous reads are not blocked. They are too broad: all 1,153 import rows, including all 888 drafts, are readable through the public REST API because the deployed `mezmur_data_import_public_read` policy uses `USING (true)`. The UI hides drafts, but RLS does not.

The production import table also lacks the `rights_status` column (`42703`). Of the five lyrics-bearing rights states planned in the repository, none can currently be verified in production. No row has `review_status = approved`; values are only `ready` or `needs_review`.

Accordingly, this audit did not publish the 888 drafts or loosen any read policy. Bulk-changing them to `published` would violate the requested editorial and rights constraints.

## Relationship and field impact

Even after approval, unlinked hymns do not automatically appear inside a section/category/occasion route.

- 887 distinct slugs have no section link. This includes most of the draft batch.
- 27 currently published rows have no section link and can be reached by search/direct URL but not a section browse page.
- Only 67 slugs have occasion links and 210 have category links.
- 353 rows have no Zemari or legacy singer reference, so Zemari browsing cannot surface them.
- 5 rows have no lyrics in any supported lyrics field.
- 28 duplicate slug groups make detail routing ambiguous and prevent a safe unique-slug migration.
- 1,149 blank `mezmur_id` values mean slug is currently the practical identifier. Duplicate slugs must be resolved before assigning deterministic IDs or enforcing uniqueness.

## Local fixes implemented

1. Public status handling is now exact: only `published` is visible. Blank, `active`, `true`, `ready`, and unknown values are no longer treated as public.
2. Supabase catalog loading now walks explicit 500-row ranges instead of silently truncating at 500, 800, or 1,000 rows.
3. The full catalog is used by public category/occasion pages and the local search catalog, while explicit caller caps still work.
4. A repeatable SELECT-only production diagnostic was added.
5. Tests cover strict visibility and a 1,153-row, three-page fetch with no gaps or duplicates.
6. A guarded publication/RLS SQL script was prepared. It never approves or publishes data and aborts unless duplicates, stable IDs, editorial approval, approval attribution, and rights metadata are complete.

## Required production actions (not performed)

1. Confirm that `.env` for both Cloudflare Pages and `ai.eskinder.dev` points to the intended Supabase project. The deployed frontend currently points to project `tgvhpibzzkqxkcumrivh`.
2. Resolve the 28 duplicate slug groups editorially. Do not auto-merge lyrics, credits, review notes, or Zemari relationships.
3. Assign stable `mezmur_id` values after duplicate resolution. `MEZMUR_STABLE_ID_DRY_RUN.sql` provides a deterministic, namespaced slug plan, preserves existing IDs, blocks duplicates, and rolls back by default.
4. Add and populate rights/approval metadata. Each intended public row needs explicit `review_status = 'approved'`, an allowed rights state, approver identity, and approval timestamp.
5. Verify the five rows without lyrics and the 353 rows without singer/Zemari linkage; these are not necessarily blockers for every public route, but must be intentional.
6. Add the required section/category/occasion links for each approved row that should appear in browse pages. Preserve all existing links; insert missing links idempotently.
7. Run the diagnostic again and require zero blockers.
8. In a transaction, apply `supabase/mezmur-import/MEZMUR_PUBLICATION_GUARD.sql`. It will abort safely if any published row lacks approval/rights or if identifiers are unsafe.
9. Deploy the tested frontend and backend only after the database preflight passes. Then verify a known approved slug in search, a browse section, and its detail route.

Do not run `FIX_MEZMUR_IMPORT_ANON_READ.sql`; it disables RLS and is incompatible with the requested publication controls.

## Verification performed

- SELECT-only public production audit: passed; counts above captured at 2026-10-24 02:51 UTC.
- Six live search API probes: three published sample slugs returned; three draft sample slugs did not return as exact matches.
- `npm run test:mezmur-visibility`: passed.
- `npm run test:hymn-browse`: passed.
- `npm run build`: passed.
- Headless browser smoke: `/practice` loaded 9 collection links; published detail rendered; draft detail returned the unpublished/not-found state; no browser errors in the successful run.
- `npm run lint:public`: existing unrelated React effect errors remain in `PublicHymnSectionPage.tsx`, `PublicMezmurDetail.tsx`, and `PublicMezmurLibrary.tsx`; this change introduced no lint finding in the modified data modules.
