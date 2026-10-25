# Zemari bulk import validation and permission report

Date: 2026-10-24  
Scope: local source, migrations, and mocked browser/database tests only. No production data, policy, permission, or deployment was changed.

## Executive result

The previous bulk flow treated a source-derived list as verified identities, defaulted new profiles to `published`, and started writes without a distinct no-write validation step. It also had no capability probe, resumable row state, bounded retry behavior, or conservative protection against replacing an existing Mezmur-to-Zemari relationship.

The local implementation now separates validation from import, defaults to `draft`, requires a verified staff session, reports the exact failing operation, prevents duplicate slugs, flags possible identity duplicates for manual review, supports safe stop/retry, and will not silently overwrite a different `mezmur_data_import.zemari_id`.

The public Hymns frontend now targets `public.mezmur_public`, a proposed narrow view of only editorially approved, rights-cleared, explicitly publication-approved records. The base import table remains staff-only. This preserves RLS and prevents `status = 'published'` alone from making an imported Mezmur public.

## Source audit

Canonical reviewed input for this feature: `mezmur-research/exports/zemaris_with_lyrics.csv` and the embedded preset generated from it.

| Check | Result |
| --- | ---: |
| Source rows | 185 |
| Unique slugs | 185 |
| Unique transliterated names | 185 |
| Unique nonblank Amharic names | 170 |
| Missing Amharic names | 15 |
| Invalid slug formats | 0 |
| Immediately ready after local validation | 167 |
| Requiring manual review | 18 |
| Structurally invalid | 0 |

These rows prove only that a name occurs in the imported catalog. They are not independent biographical verification. The list also contains `Mahibere Kidusan`, an organization, so it must not be described as “185 verified individuals.”

Three conservative fuzzy pairs are held for review rather than auto-merged:

1. `zemari-diyakon-zelalem-takele` / `zemari-diyakon-zelealem-takele`
2. `zemari-diyakon-mahidereliul-fisiha` / `zemari-diyakon-mahidereliul-fiseha`
3. `zemari-kesis-wenidiwesen-bekele` / `zemari-kesis-wenidiwesen-belay`

The third pair may be two different people; that is exactly why fuzzy matching is advisory and never destructive.

## 42501 analysis

The client previously collapsed multiple failures into a generic permission message. A `42501` can originate from RLS, a missing table/sequence privilege, a staff-session mismatch, or the guarded Mezmur publication trigger. Local code cannot truthfully identify which production object raised a historical error without the original database error or an authenticated production diagnostic session.

The new path makes that distinction observable:

- `requireCmsStaffSession` verifies the JWT subject, matching `profiles.id`, staff role, and `is_staff()` result for the same session.
- `validate_zemari_import_access()` is a read-only, security-invoker capability report for `public.zemaris` and Mezmur linking.
- Every write error includes the operation and object, for example `POST public.zemaris`, `PATCH public.zemaris by id`, or `PATCH public.mezmur_data_import Zemari link by slug`.
- Publication-guard errors identify direct protected-field changes and direct callers to `approve_mezmur_import` or `publish_mezmur_import`.
- Ordinary content saves exclude protected approval/publication fields, so they cannot trip the guard merely by resubmitting stale form state.

The production session mapping remains an operator verification step because no production credentials were used. Run `supabase/mezmur-import/DIAGNOSE_MEZMUR_42501_READ_ONLY.sql` in an authenticated diagnostic context and compare `auth.uid()`, `profiles.id`, `profiles.role`, and `is_staff()` before applying any change.

## Data model and public visibility

- Zemari profiles are canonical in `public.zemaris`; `slug` is the stable duplicate-prevention key and database unique constraint.
- Imported Mezmurs remain canonical in `public.mezmur_data_import` and link through `zemari_id`.
- Category, occasion, section, lyrics, review, and rights data remain in their existing records and relationship tables. The importer does not duplicate Mezmurs or rewrite those relationships.
- A different existing `zemari_id` cannot be overwritten by the assignment helper. An editor must explicitly unlink after review, then relink.
- `public.mezmur_public` exposes no review notes, source notes, or approver identity. A row is included only when status is published, review is approved, rights are allowed, and publication approval metadata exists.
- Pagination uses range-based collection rather than a single default Supabase page, so catalogs over 1,000 records are not silently truncated.

## Local implementation

- `src/lib/cms/zemariCsvImport.ts`: validation, exact/fuzzy duplicate analysis, Unicode/status checks, dry-run summary, bounded sequential import, retry, cancellation, and per-row outcomes.
- `src/pages/admin/ZemarisAdmin.tsx`: no-write Validate Import action, draft default, capability status, review buckets, progress, stop, activity log, and failed-row retry.
- `src/lib/cms/zemariAdminService.ts`: authenticated staff/capability validation and safe association checks.
- `supabase/migrations/20261024130000_zemari_import_validation_and_safe_public_mezmur.sql`: proposed read-only capability RPC, staff-only base reads, and safe public projection.
- `src/lib/publicContent/hymnBrowse.ts`: public reads moved to the safe projection.

## Tests and evidence

Passing locally:

- `npm run test:zemari-import`
- `npm run test:zemari-import:e2e`
- `npm run test:mezmur-publication`
- `npm run test:mezmur-visibility`
- `npm run test:hymn-browse`
- `npm run test:mezmur-admin-redesign`
- targeted ESLint and production build

Coverage includes the 185-row source audit, isolated one-record draft import/read-back, repeated import prevention, exact and fuzzy duplicates, transient retry, permanent `42501`, cancellation before write, association overwrite rejection, authorized capability success, denied capability behavior, public pagination, and guarded publication safety.

Browser evidence: `artifacts/zemari-import-validation.png`.

## Required production actions (not performed)

1. Back up and test in a disposable/staging Supabase project.
2. Apply `20261024120000_mezmur_import_publication_workflow.sql` first if it is not already present.
3. Review and apply `20261024130000_zemari_import_validation_and_safe_public_mezmur.sql`.
4. Deploy the frontend change in the same release as the `mezmur_public` view; otherwise public Mezmur queries will fail until the view exists.
5. Sign in as the intended staff user and run Validate Import. Confirm the reported JWT/profile identity and all capabilities.
6. Import one reviewed row as `draft`, read it back, and repeat the same row to prove it skips rather than duplicates.
7. Review the 18 held rows, especially the three fuzzy pairs and 15 missing Amharic names, before selecting them.
8. Import in small batches and retain the activity log. Approval and publication remain separate RPC-controlled actions.
9. Confirm existing public routes, filters, Zemari pages, lyrics, and pagination before expanding the batch.

Do not run the older broad repair script as a substitute for this workflow, disable RLS, grant public writes, or mark source rows approved merely because their import status says `published`.
