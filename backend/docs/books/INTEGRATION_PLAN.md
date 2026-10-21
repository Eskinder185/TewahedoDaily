# Five-book integration plan

Date: 2026-10-18 (America/New_York). Scope: local backend preparation only.

The five drafts can be parsed, navigated and searched privately. An approved-only
library service and approval-gated Qdrant pipeline are implemented. All current
books remain held: no publication, deployment, production ingestion, approval
change, VM401 modification or GitHub push was performed.

## Implemented

| Component | Responsibility |
| --- | --- |
| `app/editorial/validation.py` | Exact five-book identities, strict boolean approval flags, unique IDs, paragraph/section order, source coverage, JSON/JSONL consistency, bilingual originals and reference evidence. Rejects escaping catalog paths. |
| `catalog.py`, `models.py` | Book metadata, ordered sections and paragraphs, original source records, source languages, English readings, reference evidence and revision lineage. No approval cache. |
| `reader.py` | Table of contents, original heading levels, paragraph details, bounded pages and navigation. Preserves the package's editorial sections and chapter headings without inventing missing chapters. |
| `search_index.py`, `router.py` | Private lexical search across all five books, including Ethiopic sources. Private reading routes require the preview feature flag and token. |
| `library.py`, `retrieval.py` | Approved-only catalog, reading pages, English/Amharic lexical retrieval and validation/hydration of future vector hits. No public HTTP route is mounted. |
| `release.py`, `ingestion.py`, `qdrant_local.py` | Content-bound variant grants, strict approval hierarchy, deterministic UUIDs, durable journal, local-only Qdrant adapter, retry and rollback. |
| `audit.py` | Read-only package audit including ZIP bytes, all package files, original DOCX hashes/XML, source alignment, table coordinates, queues and revision evidence. |

The existing Search Buddy request path in `app/main.py` remains unchanged by this
integration. It does not load book material into its prompt or contact Qdrant.
Existing local Search Buddy/security work was preserved.

## Private review interface

The existing optional `/api/editorial` router is disabled by default. To use it
locally, set `ENABLE_EDITORIAL_PREVIEW=1` and configure `EDITORIAL_PREVIEW_TOKEN`.
Every request requires `X-Editorial-Token`. Missing credentials fail closed.
Serve this interface through an authenticated backend, never a public static
frontend with an embedded token. Successful responses carry `Cache-Control:
no-store` and `X-Robots-Tag: noindex, nofollow`.

| Route | Response |
| --- | --- |
| `GET /api/editorial/books` | Five private draft metadata entries |
| `GET /api/editorial/books/{document_id}` | Metadata, sections and original heading hierarchy; no full book body |
| `GET /api/editorial/books/{document_id}/paragraphs` | Reading page; optional `section_id`, `after` paragraph ID and `limit` (1–100, default 20) |
| `GET /api/editorial/paragraphs/{paragraph_id}` | English reading, exact source records, source locators, reference excerpts and labeled segments |
| `GET /api/editorial/search?q=...` | Private draft search; bounded query and result count |
| `GET /api/editorial/ingestion/plan` | Dry run with zero allowed current variants |
| `GET /api/editorial/status`, `/integrity` | Package state and integrity evidence |

Existing approval overlay routes record review workflow intent only. They cannot
grant release, override a false package flag or index content. No real approval
overlay was written during this task. Target identities and boolean inputs are
validated. Reloading content does not change approvals.

## Frontend consumption after human approval

The frontend repository should call a backend facade around
`ApprovedBookLibrary`, not read `content-review/` directly. Keep the draft package
outside frontend assets, static hosting and browser bundles. Keep the release
manifest, journal and review token server-side.

```python
from pathlib import Path
from editorial import ApprovedBookLibrary, ReleaseManifest, load_catalog

catalog = load_catalog()  # validates the current package on each load
library = ApprovedBookLibrary(
    catalog, release=ReleaseManifest(Path("data/book_release.json"))
)
metadata = library.catalog_payload()
page = library.reading_page("S01", language="en", content_kind="translation", limit=20)
hits = library.search("ጥምቀት", language="am", limit=5)
```

These calls currently return empty approved collections. The future facade must
recreate/reload the catalog for each request or use an independently reviewed
version/invalidation mechanism. A long-lived in-memory catalog is a snapshot and
must not survive package revisions without reload. Release grants and overlay
denials are re-read on each operation.

Render `text` as escaped text. Preserve `paragraph_id`, `source_unit_ids`, section
and book titles in citations. Present content kinds separately: `original_source`,
`translation`, `english_reading` (F01 edited English reference) and
`supplemental_explanation`. Original Amharic/Geʽez passages are source witnesses,
not an independently certified modern Amharic translation. F01 has no Amharic edition.

Private pages use `next_after`/`previous_after` paragraph cursors; approved pages
use variant UUID cursors. A null previous cursor with `has_previous=true` means
request the first page. Keep the same book, section, language, kind and page size
when following cursors. Source page mapping remains null: application page sizes
do not imply original printed/PDF pagination. Do not renumber the received W01
chapters or invent Matthew chapters 6–28.

## Remaining work

1. Qualified reviewers must resolve or formally disposition the 828 held issues,
   complete the five whole-book sign-offs, and approve the actual language and
   content variants. This task supplies no theological certification.
2. A separate, authorized release process must produce an approved package
   revision and a protected content-bound release manifest. No automatic
   approval writer is provided by this integration.
3. Select and evaluate a multilingual embedding model on a human-labeled
   English/Amharic set, including long paragraphs and Geʽez terminology. Record
   model revision/dimension and truncation behavior. No model was downloaded or
   embedding quality evaluated here.
4. Provision a disposable local Qdrant collection with that vector dimension;
   test the adapter against an actual local server. Current network tests use
   an HTTP mock. The pipeline never creates collections automatically.
5. Add a separately reviewed public backend facade and frontend reading UI once
   release is authorized. Add server-side identity/rate controls for any new
   public routes; preserve current Search Buddy controls.
6. Wire Search Buddy to approved retrieval as quoted, non-instructional source
   data. Keep book citations separate from verified Scripture citations. Apply
   current release checks to every vector hit using `verify_vector_hits`.
7. Any staging/production migration, frontend publication or VM401 change needs
   its own authorized work. This implementation cannot target a production URL.

See `BOOK_CATALOG.md`, `INGESTION_SAFETY.md`, `TEST_RESULTS.md` and the reproducible
machine-readable `VALIDATION_REPORT.json` in this directory.
