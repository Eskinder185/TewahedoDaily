# Church Library — structured books (chapter → section → paragraph)

Status: implemented and tested locally. **Not applied to Supabase, not deployed.**

## What it adds

| Area | What |
|---|---|
| Content | `content/church-library/seven-sacraments/` — Amharic (9 chapter files) and English (8) editions with stable IDs (`SS-001`, `SS-001-S001`, `SS-001-S001-P001`), manifest, alignment and completeness reports, verbatim sources, non-publishable review material. |
| Database | `supabase/migrations/20261029120000_church_library_structured_collections.sql` — additive and idempotent (see below). |
| Import | `/admin/church-library/import` — bulk Markdown/JSON, validation, duplicate detection, preview tree; everything imports as **draft**. |
| Review | Same page — Draft → Reviewed → Published, enforced in the database. |
| Reader | `/library/read/<book-slug>/<section-key>#<paragraph-key>` — table of contents, font size, light/sepia/dark, bookmarks, reading progress, Amharic⇄English edition switch, copyable paragraph links, `?q=` highlighting, original download when allowed. |
| Search | `search_church_library_sections` (Amharic letter-variant folding); Search Buddy cites the exact section and links to the reader. |

## Migration (20261029120000) — safety notes

* Only `add column if not exists`, `create table if not exists`, `create or replace function`, `create index if not exists`, guarded `drop not null` on two legacy columns (`books.storage_path`, `sections.version_id`), and policy re-creation by name. No table is dropped or rewritten and no existing rows are deleted or changed — except that the new `search_folded` column is backfilled.
* `publication_status` is **NULL for every existing book**, which the visibility gate treats as "legacy, unchanged". Only books created by the structured import start as `draft`.
* Publication gate (restrictive RLS on books/sections/passages): a structured book is visible to the public only when `publication_status = 'published'` **and** the existing gates pass (approved for ingestion, search quotes allowed, public access level, cleared rights status). Staff (`is_staff()`) see everything.
* `search_church_library` and `church_library_public_search_status` are re-created with the same signatures, plus the publication condition, so drafts can never surface in Search Buddy.
* `church_library_import_structured(payload)` is staff-only and refuses (SQLSTATE 23505) a duplicate slug, collection+language, or source checksum+language. It never overwrites.
* `church_library_set_publication_status` refuses: reviewing a book that still has paragraphs flagged `needs_attention`; publishing a book that has not been reviewed or that fails the rights/approval gates.
* Bookmarks and reading progress are own-row tables (authenticated users only). Signed-out readers keep them in the browser.
* Original downloads: a storage policy exposes an object only when its published book has `allow_original_download = true` and a matching `download_storage_path`. Both default to off.

## Tests

| Command | Result |
|---|---|
| `npm run test:church-library-structured` | 14/14 — counts versus the manifest, verbatim round trip of every Amharic source line, review markers, IDs, duplicate rules, folding, highlighting |
| `PSQL="psql …" npm run test:church-library-db` | 46 checks on PostgreSQL 16 against a stub of the legacy schema: migration applies twice, legacy books unaffected, draft invisible to anon, import duplicates refused, review/publish gates, RLS for bookmarks/progress, search folding, download policy |
| `python3 scripts/church-library/seven-sacraments/build_seven_sacraments.py` | 15/15 validations |
| `tsc -p tsconfig.app.json`, `eslint` (changed files), `npm run build` | clean |
| Browser smoke test (mocked Supabase) | listing → reader, section deep link, bookmark, font size, progress, next chapter, English edition, `?q=` folded highlight, mobile 390 px without horizontal overflow, missing-book message |

## Applying (when authorized)

1. Review and run the migration in the Supabase SQL editor (it ends with `notify pgrst, 'reload schema'`).
2. Sign in as staff → **Admin → Church Library → Structured import & review** → choose the `content/church-library/seven-sacraments` folder → check the preview → **Import as draft**.
3. In the Church Library CMS set rights, access level, ingestion approval and search quotes for each edition.
4. Back on the import page: **Mark reviewed** → **Publish**.

## Known limitations

* Amharic and English are separate texts; alignment is chapter-level only (see `alignment-report.md`).
* The source has no page numbers, so page fields stay empty rather than guessed.
* Five fragments of the Amharic source were unreadable (`review/am-unreadable-source-annex.md`); they are not published or filled in.
* The 153 `〔ለግምገማ …〕` markers point to an editorial report that was not supplied; they are kept as reviewer notes on each paragraph.
