# Frontend integration & retrieval evaluation report

**Date:** 2026-10-19  
**Backend:** `C:\Users\eskew\github\tewahedo-ai`  
**Frontend:** `C:\Users\eskew\github\TewahedoDaily`  
**Deploy / push / VM401:** not performed

## 1. Backend API contracts used

Private router prefix: `/api/editorial` (mounted only when `ENABLE_EDITORIAL_PREVIEW=1`).

| Method | Path | Purpose |
|--------|------|---------|
| GET | `/status` | Integrity / published=false |
| GET | `/books` | Catalog summaries |
| GET | `/books/{document_id}` | Table of contents (chapters/sections) |
| GET | `/books/{document_id}/paragraphs` | Paginated reading (`section_id`, `after`, `limit`) |
| GET | `/paragraphs/{paragraph_id}` | Single paragraph + attribution |
| GET | `/search` | Lexical search + filters `document_id`, `content_kind`, `has_amharic_source` |
| GET | `/ingestion/plan` | Dry-run Qdrant plan (approved_count=0 for drafts) |
| POST | `/approvals` | Overlay decisions (does not flip package flags) |

All routes require header `X-Editorial-Token` matching `EDITORIAL_PREVIEW_TOKEN`.  
Responses set `Cache-Control: no-store` and `X-Robots-Tag: noindex`.  
When preview is disabled, routes are **not mounted** → public clients see 404.

`ApprovedBookLibrary` / `retrieve_for_search_buddy` remain **unmounted** for public Search Buddy and return empty on current drafts.

## 2. Frontend changes

| File | Change |
|------|--------|
| `src/lib/editorial/editorialBooksApi.ts` | Full contract client (TOC, pagination, search filters, status) |
| `src/pages/admin/EditorialBooksPreview.tsx` | Mobile-first private reader UI |
| `src/pages/admin/EditorialBooksPreview.module.css` | Overflow-safe reading layout |
| `src/App.tsx` | `/admin/editorial-books` behind `RequireCmsRole` |
| `src/pages/admin/AdminLayout.tsx` | Nav: Editorial Books |
| `scripts/test-editorial-books-access.mjs` | Static public-route / token safety checks |
| `scripts/test-editorial-books-mobile.mjs` | Playwright overflow at 375/390/393/430 |
| `scripts/fixtures/editorial-reader-mobile.html` | Fixture for mobile checks |
| `package.json` | npm scripts for the above |

**Reader features:** book picker, chapter TOC, paginated paragraphs, paragraph IDs, English body, Ethiopic source attribution block, content-kind badges (supplement vs reading), search with kind + Amharic-source filters, loading/error states, overlay-approve section, ingestion dry-run display.

**Access model (not frontend-hiding alone):**

1. Backend disabled by default → 404  
2. Shared secret token (sessionStorage only; never `VITE_*`)  
3. CMS admin auth for the UI route  
4. No public `/books` or `/library/books` routes  

### Access-control connection note

Safe connection is: **CMS session + operator-pasted `EDITORIAL_PREVIEW_TOKEN`**.  
There is no bridge from Supabase CMS JWT to the FastAPI editorial token. That is intentional: putting the editorial secret in `VITE_*` would expose it. Blocker for “single sign-on preview” is documented; unsecured preview was not shipped.

## 3. Retrieval / embedding evaluation

Script: `tewahedo-ai/scripts/eval_bilingual_retrieval_local.py`

- Synthetic EN/AM corpus only (permitted test data)  
- Token + character n-gram cosine ranking  
- Distinguishes supplements  
- Confirms `retrieve_for_search_buddy` is empty on the real package  
- Does **not** upsert to any Qdrant (local or production)

## 4. Tests run

### Backend

```text
python -m pytest tests -q
→ 117 passed (includes new search-filter test; suite was 116 before this change)
```

```text
python scripts/eval_bilingual_retrieval_local.py
→ PASSED (synthetic ranking + empty Search Buddy retrieval)
```

### Frontend

```text
npm run test:editorial-books-access
npm run test:editorial-books-mobile
```

(Mobile fixture widths: **375, 390, 393, 430** px — no horizontal overflow.)

Also recommended (optional, needs preview server): existing `npm run smoke:mobile` for public routes.

## 5. Remaining approval & deployment steps

1. Resolve human approval queue items; keep package flags false until authorized export.  
2. Re-export with selective `approved_for_ingestion=true`.  
3. Staging-only Qdrant collection via `LocalQdrantSink` / dedicated local name — never production.  
4. Add **public** book API + reader only after approved content exists (separate from `/api/editorial`).  
5. Optionally wire Search Buddy to `retrieve_for_search_buddy` after release.  
6. Deploy backend/frontend with `ENABLE_EDITORIAL_PREVIEW=0` in public production (or Access-locked + token for editors only).

## 6. Explicit non-actions

- No push / publish / VM401 changes  
- No `approved_for_ingestion` flag flips  
- No production Qdrant ingest  
- No public Search Buddy book retrieval  
- Authentication not weakened  
