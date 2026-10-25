# Church Library upload and processing repair

Date: 2026-10-24

## Live 404 root cause

The frontend is configured with `VITE_TEWAHEDO_AI_API_URL=https://ai.eskinder.dev`
and requests:

- `GET https://ai.eskinder.dev/api/church-library/status`

Expected: HTTP 200 with `configured`, authenticated `cms_role`, supported file
types, bucket, and upload limit.

Observed read-only on 2026-10-24:

- `GET /health` -> HTTP 200
- `GET /api/church-library/status` -> HTTP 404 `{"detail":"Not Found"}`
- deployed `/openapi.json` -> 21 routes and no `/api/church-library/*` route

The URL and method are correct. The maintained local FastAPI source registers
the router, but that source has not been deployed to `ai.eskinder.dev`. This is
backend deployment drift, not an authentication, CORS, proxy-prefix, or frontend
error. Authentication would return 401/403, not this OpenAPI-level 404.

## Implemented local workflow

The CMS now presents the primary path:

1. Enter title, author, language, category, and description.
2. Select EPUB, PDF, DOCX, or UTF-8 TXT in the same Add Book form.
3. Validate extension, browser MIME, size, emptiness, and practical file magic.
4. Create recoverable metadata, reserve a UUID version, upload to private
   `church-library` Storage, and activate the version.
5. Automatically request extraction when the processing API is connected.
6. Preserve the upload and show a precise retry message if processing is down.
7. Preview extracted passages, then independently enable eligible short-excerpt
   retrieval for Search Buddy.

Progress reports each durable stage. Supabase JS does not expose byte-level
upload progress, so the percentage represents validated workflow milestones and
does not claim to measure transferred bytes.

## Data and security boundaries

- Metadata: `church_library_books`
- Immutable uploads/processing log: `church_library_versions`
- Chapter/section locators: `church_library_sections`
- Searchable text and optional vectors: `church_library_passages`
- Private Storage bucket: `church-library`
- Browser uses only the publishable key and authenticated staff session.
- Backend uses server-only Supabase credentials.
- Public Search Buddy calls only `search_church_library`, which gates results on
  current ready version, public retrieval opt-in, indexing approval, quotation
  permission, and verified rights basis.
- The legacy five-book preview remains separate and linked; it is not copied,
  overwritten, or automatically approved.

Reprocessing disables public retrieval before replacing current-version
passages. Scanned/blank PDFs become `needs_ocr`; EPUB locators never invent page
numbers. Archive expansion and encryption limits guard DOCX/EPUB processing.

## Deployment checklist (not performed)

1. Run `supabase/church-library/VERIFY_CHURCH_LIBRARY_READ_ONLY.sql` in SQL
   Editor. Confirm the four tables, RPCs, private `church-library` bucket, and
   staff-only Storage policies. Do not run `supabase db push`.
2. If any database object is absent, review
   `supabase/migrations/20261024190000_church_library.sql` against the linked
   schema and apply only the approved statements through SQL Editor.
3. Configure the backend host with `SUPABASE_URL`, server-only `SUPABASE_KEY`,
   `SUPABASE_JWT_SECRET`, and `CHURCH_LIBRARY_BUCKET=church-library`.
4. Deploy/restart the maintained `backend/app` image. Confirm `/openapi.json`
   lists:
   - `GET /api/church-library/status`
   - `POST /api/church-library/books/{book_id}/process`
   - `POST /api/church-library/search`
5. Confirm anonymous status returns 401, a staff JWT returns 200, and a nonstaff
   JWT returns 403.
6. Configure the frontend with the same public API URL and
   `VITE_CHURCH_LIBRARY_BUCKET=church-library`, then rebuild/deploy the frontend.
7. Upload one rights-cleared test EPUB. Verify private Storage object, version,
   ready sections/passages, preview citations, and public retrieval only after
   explicit eligibility settings are saved.

No production database, storage object, backend, or frontend deployment was
modified during this work.
