# Church Library upload repair

Date: 2026-10-24

## Root cause

The upload crash was reproduced with a database response that omitted
`processing_status`. `ChurchLibrary.tsx` called `replaceAll` directly on that
value in both the catalog card and selected-book header. The resulting runtime
error was `Cannot read properties of undefined (reading 'replaceAll')`.

The configured production project's read-only PostgREST probe found that this
was not merely malformed frontend state:

- The legacy `church_library_books` table has `id`, title/author/language/
  category/description, `created_by`, `updated_by`, `created_at`, and
  `updated_at`.
- The newer upload, processing, access, rights, cover, and extraction columns
  are missing from the deployed PostgREST schema (`42703`).
- `church_library_versions` is absent from the deployed schema cache
  (`PGRST205`).
- Anonymous reads of present columns return `42501`, which is the correct
  private-library behavior.
- The configured backend still returns `404 {"detail":"Not Found"}` for
  `GET /api/church-library/status`; the local router exists and its backend
  tests pass, but it is not deployed.

This explains the complete failure chain: a legacy book can load, the missing
status crashes rendering, and even after the render fix a file cannot reserve a
version because the version table is missing.

## Local repair

- All book rows are validated and normalized at the database-response boundary.
  Missing legacy status becomes `Not Uploaded`, or `Pending` when a current
  version exists. Required IDs and titles still fail with meaningful errors.
- Removed direct status `replaceAll` calls from the page.
- Validated title, optional author/metadata, filename, file size, extension,
  browser MIME type, UUID book/user IDs, private path, signatures, and backend
  processing responses.
- The create payload now sends confirmed `created_by` but does not send
  `updated_by`; the database touch trigger owns `updated_by` on updates.
- Processing route failures preserve the metadata and private file and leave
  processing pending with a retry message.
- No `getPublicUrl` call exists; originals stay in the private
  `church-library` bucket.
- Added a forward-only, additive migration for the missing upload schema. It
  preserves the existing books table and rows, installs missing version/index
  tables and functions, keeps staff-only writes, preserves anonymous table
  denial, and reloads the PostgREST cache at commit.

## Production activation (not performed)

1. In Supabase SQL Editor, first run
   `supabase/church-library/VERIFY_CHURCH_LIBRARY_READ_ONLY.sql`. Save the
   results. The migration preflight intentionally stops if the legacy book ID
   is not UUID.
2. Review and run only
   `supabase/migrations/20261024240000_church_library_upload_schema_repair.sql`
   in SQL Editor. Do not use unrestricted `supabase db push`.
3. Run the read-only verifier again. Confirm all expected columns/tables,
   `activate_church_library_version`, staff RLS policies, and `public=false` for
   the bucket.
4. Run `npm run probe:church-library-schema`. Every result should pass; a
   `42501` on anonymous table reads is reported as a security pass.
5. Deploy/restart the maintained FastAPI backend, then run
   `npm run probe:church-library-api`. Expected unauthenticated result: 401 or
   403, not 404 and not 200.
6. With a staff account, upload one small rights-cleared test document. Confirm
   a book row, private Storage object, version row, and Pending status. Process
   it and verify CMS visibility. Do not enable Search Buddy retrieval without
   the separate rights/access checks.

No production database, Storage object, frontend, or backend was modified.
