# Church Library implementation report

## Root cause of the 404

The previous private library lived under `/api/editorial/*`. `backend/app/main.py`
only mounted that router when `ENABLE_EDITORIAL_PREVIEW=1` at process startup.
When the variable was absent in the deployed backend, FastAPI had no matching
route and returned its generic `404 {"detail":"Not Found"}`. The router is now
always mounted. Its legacy preview handlers still call `_require_enabled()` and
fail closed; the new `/api/church-library/status` endpoint gives authenticated
staff a precise deployment/configuration result.

## Existing infrastructure audit

- The five-book preview is an external, private filesystem package loaded into
  an in-memory catalog and lexical index. It has no Supabase metadata tables.
- Its approval overlays intentionally do not change package
  `approved_for_ingestion` values, and its retrieval helper was explicitly not
  connected to `/api/chat`.
- `search_documents` indexes public site navigation/content summaries, not book
  pages or private originals.
- The Church Library reuses the existing CMS JWT/profile-role verifier,
  FastAPI service, Supabase project, private storage model, Search Buddy panel,
  and the legacy preview. No parallel public book API or public bucket was added.

## New durable model

Migration `20261024190000_church_library.sql` creates one catalog:

- `church_library_books`: metadata, access/rights decisions, current version.
- `church_library_versions`: immutable original-file versions and ingestion log.
- `church_library_sections`: real page/chapter locators from extraction.
- `church_library_passages`: bounded search passages, FTS, optional 384-d vector.
- private bucket `church-library` (50 MiB; PDF/DOCX/TXT/EPUB and cover
  images). There is no anonymous object policy.

`approved_for_ingestion` means processing/index readiness only.
`public_retrieval_enabled` is separate and is constrained by access level,
verified rights status, and permission to quote short excerpts. Unknown or
restricted rights cannot pass the database constraint. Search results return at
most 900 characters and never expose a storage path or signed original URL.

Replacing a file creates a new version and calls
`activate_church_library_version`. That switches the current version, marks the
book pending, and disables public retrieval. Search joins only the current,
ready version, so stale passages cannot leak during or after reprocessing.

## Extraction and retrieval behavior

- PDF uses `pypdf` and preserves page numbers. Empty/scanned PDFs become
  `needs_ocr`; the service does not invent OCR text.
- DOCX preserves actual Word heading styles as chapter references.
- UTF-8 TXT preserves form-feed page boundaries and rejects ambiguous encodings.
- EPUB preserves HTML title/heading references and Ethiopic Unicode text.
- Suspicious replacement characters or sparse page extraction are flagged for
  staff verification.
- PostgreSQL `simple` FTS is the safe baseline for English and Ethiopic text.
- pgvector hybrid ranking is implemented but opt-in. Set
  `CHURCH_LIBRARY_EMBEDDING_MODEL` to a reviewed 384-dimensional model. Ethiopic
  embeddings remain off unless
  `CHURCH_LIBRARY_EMBEDDING_MULTILINGUAL_APPROVED=1` is set after evaluation.
  This avoids treating an English-only embedding model as adequate for Amharic
  or Geʽez.

Run the reviewed-query evaluator with:

```powershell
cd backend
python scripts/evaluate_church_library_retrieval.py path\to\reviewed-gold.json --output retrieval-report.json
```

Compare English and Amharic recall@10 and MRR separately. Do not enable the
multilingual approval flag unless qualified reviewers accept the Amharic/Geʽez
results and passage integrity.

## Local validation

```powershell
python -m pytest backend/tests/test_church_library.py backend/tests/test_cms_auth.py -q
npm run test:church-library
npm run test:church-library:e2e
npx eslint src/pages/admin/ChurchLibrary.tsx src/lib/cms/churchLibraryService.ts src/components/search/ChurchLibrarySources.tsx src/components/search/SearchBuddy.tsx src/lib/searchBuddy/churchLibrarySearch.ts src/App.tsx src/pages/admin/AdminLayout.tsx
npm run build
```

Latest local result: production build passed, scoped ESLint passed, both Church
Library workflow suites passed, and the complete backend suite reported
`187 passed, 7 skipped`. The skipped tests require optional local services or
fixtures and did not represent failures.

The repository-wide ESLint command currently reports pre-existing React Hook
compiler violations outside this feature. The scoped Church Library/Search
Buddy lint command is the relevant clean gate.

## Production deployment checklist (manual approval required)

1. Back up the database and confirm `public.is_staff()` is correct.
2. Review only `supabase/migrations/20261024190000_church_library.sql`.
3. Because remote migration history is divergent, **do not run unrestricted
   `supabase db push`**. Apply this single SQL file in a controlled Supabase SQL
   session or with your approved migration runner.
4. Verify the bucket is private and table RLS is enabled.
   Run `supabase/church-library/VERIFY_CHURCH_LIBRARY_READ_ONLY.sql`; every
   `rls_enabled` must be true, every `anon_can_select` false, the bucket's
   `public` value false, and the final unsafe-enabled-books query empty.
5. Add `pypdf==6.1.1` to the backend image (already in local Dockerfile).
6. Configure backend `SUPABASE_URL`, service-role `SUPABASE_KEY`, and
   `SUPABASE_JWT_SECRET`. Never expose the service key to Vite.
7. Deploy the backend and verify authenticated `GET /api/church-library/status`.
8. Deploy the frontend only after the database/backend are ready.
9. Upload one non-sensitive test document, process it, and keep retrieval off.
10. Verify anonymous direct selects on all four tables and private storage reads
    are denied.
11. Record a truthful rights basis, permit short excerpts, mark indexing ready,
    then enable Search Buddy for that test book only.
12. Verify English and Amharic citations/page labels, disable access, and confirm
    the book disappears immediately.
13. Import the legacy five-book package only through a reviewed future catalog
    import; its current `approved_for_ingestion=false` records remain private.

Useful verification SQL:

```sql
select relname, relrowsecurity
from pg_class
where relname like 'church_library_%';

select id, title, approved_for_ingestion, public_retrieval_enabled,
       access_level, rights_status, processing_status
from public.church_library_books
order by updated_at desc;

select bucket_id, name
from storage.objects
where bucket_id = 'church-library'
limit 5;
```
