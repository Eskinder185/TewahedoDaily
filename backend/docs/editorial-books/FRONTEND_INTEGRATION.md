# Frontend integration plan (public library)

## Already done (private)

In `TewahedoDaily`:

- Admin route `/admin/editorial-books` (CMS role + session token)
- Client `src/lib/editorial/editorialBooksApi.ts` aligned to TOC + paginated `/paragraphs` + filtered `/search`
- Mobile-first reader UI with attribution / supplements / Ethiopic source blocks
- Access + mobile fixture tests (`npm run test:editorial-books-access`, `test:editorial-books-mobile`)
- Does **not** add books to public navigation or static assets

See also: `FRONTEND_AND_RETRIEVAL_REPORT.md`.

## Required later for public users

1. **Do not** mount `content-review/` under Vite `public/`.
2. After approved export + staging ingest, add public API (separate from `/api/editorial`) that returns only records with `approved_for_ingestion=true`.
3. New public pages, e.g. `/library/books` and `/library/books/:documentId/:sectionId`, following existing `PublicContentLibrary` / CMS patterns — not prayer `LibraryCollectionRoute`.
4. Display rules:
   - Show English reading text from approved paragraphs.
   - Show Ethiopic **source** text only when present; label as source, not as “Amharic translation of this English.”
   - Label `reference_supplement` / `new_F01_reference_explanation` as added explanations.
5. Search Buddy: call `retrieve_for_search_buddy` (or Qdrant equivalent) only after approved points exist; keep Bible retrieval primary.
6. i18n: Amharic UI chrome ≠ Amharic book body availability.
