# Five-book editorial integration — final report

**Date:** 2026-10-19  
**Backend repo:** `C:\Users\eskew\github\tewahedo-ai`  
**Frontend repo:** `C:\Users\eskew\github\TewahedoDaily`  
**Deployed / pushed:** No

## Package inspection

Source package placed at `content-review/` (copied from Codex outputs  
`TewahedoDaily_Editorially_Complete_Drafts`). Companion ZIP at `content-review.zip`.

| Book | ID | Title | Reading records | Package ingest |
|------|----|-------|-----------------|----------------|
| F01 | Faith and Order | 482 | false |
| S01 | Seven Sacraments | 589 | false |
| E01 | Church History in Ethiopia | 669 | false |
| M01 | Matthew Andemta | 740 | false |
| W01 | Church History World Stage | 523 | false |

Catalog, QA_Report, provenance, review queues, bilingual JSONL, and SHA256SUMS verified.

### Integrity results

- **SHA256SUMS:** 70/70 files match.
- **All 3003 reading paragraphs:** `approved_for_ingestion=false`.
- **Catalog:** `approved_for_ingestion=false`.
- **Bundled `validation/validate_library.py`:** 12/13 checks pass; ZIP member check fails only because ZIP root folder is `TewahedoDaily_Editorially_Complete_Drafts/` while the working directory is `content-review/`. CRC and per-file bytes match when compared with a flexible root (see `editorial.integrity`).
- **Languages:** S01/E01/M01/W01 include Ethiopic in bilingual `source_records`. F01 is English reference with no Ethiopic source rows. Preview UI labels Amharic as **source attribution**, not a completed translation of the English reading.

## Architecture

```
content-review/          read-only editorial package (gitignored)
data/editorial_approvals.json   human overlay decisions (gitignored)
app/editorial/           catalog, search, approval, gated ingest, private router
/api/editorial/*         only if ENABLE_EDITORIAL_PREVIEW=1 + token
Search Buddy /api/chat   unchanged; book retrieval helper returns [] until flags true
TewahedoDaily admin      /admin/editorial-books private preview (CMS auth + token)
```

Public book library routes (`LibraryCollectionRoute`, etc.) are **not** wired to this package.

## Files created / updated

### Backend (`tewahedo-ai`)

- `app/editorial/` — `__init__.py`, `paths.py`, `models.py`, `integrity.py`, `catalog.py`, `search_index.py`, `approval_store.py`, `ingestion.py`, `retrieval.py`, `router.py`
- `app/main.py` — conditional include of editorial router
- `tests/test_editorial_books.py`
- `data/.gitkeep`
- `.gitignore` — ignore `content-review/`, `content-review.zip`, approval overlay
- `docs/editorial-books/*` (this report + related)

### Frontend (`TewahedoDaily`)

- `src/lib/editorial/editorialBooksApi.ts`
- `src/pages/admin/EditorialBooksPreview.tsx`
- `src/App.tsx` — admin route
- `src/pages/admin/AdminLayout.tsx` — nav item

## Tests run

```text
python -m pytest tests -q
56 passed
```

Includes 11 editorial tests proving:

1. Package integrity / all ingest flags false  
2. Catalog order, IDs, language honesty  
3. Supplement vs source distinction (33 supplements)  
4. Local EN + Ethiopic source search  
5. Overlay approval does **not** mutate package JSON  
6. Overlay cannot open Qdrant while package flag is false  
7. Dry-run plan upserts nothing; fake client never called  
8. Synthetic package-true records can ingest; overlay denial blocks  
9. Unresolved issues block ingest  
10. `retrieve_for_search_buddy` returns `[]` for real package  
11. Editorial routes disabled by default; token required when enabled  

Existing security + Search Buddy intelligence tests still pass.

## Approval requirements

1. Qualified human review of unresolved queue items (`review/Human_Approval_Queue.json`, ~828 unresolved issues).  
2. Record overlay decisions via `/api/editorial/approvals` or the admin UI (**does not** flip package flags).  
3. Produce a **new approved export** where selected records set `approved_for_ingestion=true` (authorized editorial step — not automated here).  
4. Only then run a Qdrant upsert against a **non-production** collection, verify retrieval, then schedule production ingest with explicit approval.  
5. Public library + Search Buddy wiring only after (3)–(4).

## Remaining steps before public availability

1. Theological / language sign-off on awaiting-review flags.  
2. Authorized package re-export with selective `approved_for_ingestion=true`.  
3. Configure staging Qdrant collection + embedding model; run `QdrantIngestionPipeline` against staging only.  
4. Wire public frontend book reader to **approved** CMS/API content (new public endpoints — not the private `/api/editorial` router).  
5. Optionally connect Search Buddy to `retrieve_for_search_buddy` after approved ingest exists.  
6. Operator deploy of backend + frontend; never expose `content-review/` as static assets.  
7. Keep `ENABLE_EDITORIAL_PREVIEW` off in production unless needed behind Access + token.

## Critical guarantees held

- No automatic approval flag changes in package files.  
- No publish.  
- No production Qdrant writes.  
- No VM401 changes.  
- No git push.  
- Search Buddy prompts, Bible retrieval, and security controls preserved.
