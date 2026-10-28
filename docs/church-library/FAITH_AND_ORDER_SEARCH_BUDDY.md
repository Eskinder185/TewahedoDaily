# The Faith And Order Of The Church → Search Buddy

Status: **converted and validated; not imported, not published.** Nothing in production was changed.

## What is in the repository

| Path | Purpose |
|---|---|
| `data/church-library/faith-and-order/church_faith_and_order_search.jsonl` | 47 passages (one JSON object per line) with chapter, section, pages, Scripture references, keywords, aliases, quality flags |
| `data/church-library/faith-and-order/church_faith_and_order_supabase_import.csv` | The same passages in live `church_library_passages` columns; `book_id`/`version_id` are left blank and resolved by the import tool |
| `data/church-library/faith-and-order/church_faith_and_order_sections.json` | 65 rows for `church_library_sections` |
| `data/church-library/faith-and-order/church_faith_and_order_aliases.json` | 110 Amharic / transliterated aliases (search metadata only) |
| `data/church-library/faith-and-order/church_faith_and_order_manifest.json` | Source hash, page mapping, processing summary, column mapping |
| `data/church-library/faith-and-order/church_faith_and_order_validation.md` | 21 automated checks, repairs, flagged source typos, alias review |
| `data/church-library/faith-and-order/church_faith_and_order_search_tests.md` | Retrieval tests (current RPC vs proposed RPC) |
| `scripts/church-library/faith-and-order-conversion/` | Reproducible conversion: `build_kb.py` → `make_manifest.py` → `make_alias_seed.py` → `validate.py` |
| `scripts/import-church-library-passages.mjs` | Administrator import tool (dry run by default) |
| `scripts/church-library/local-search-test/` | Local Postgres + PostgREST end-to-end harness |
| `supabase/church-library/PROPOSED_20261028_church_library_multilingual_search.sql` | Proposed migration: alias table + improved `search_church_library` (same signature) |
| `supabase/church-library/PROPOSED_20261028_church_library_search_aliases_seed.sql` | Alias seed, inserted as `pending` |
| `backend/app/editorial/church_library_grounding.py` | Feeds approved passages to the `/api/chat` model with citation rules (opt-in) |

## Schema notes

The live schema (from the migrations and `src/lib/supabase/cms.types.ts`) differs from the column names in the original brief:

| Brief | Live column |
|---|---|
| `chapter_title` | `chapter_reference` |
| `section_title` | `locator_label` (+ `section_id` → `church_library_sections`) |
| `page_number` | `page_start`, `page_end` |
| `search_vector` | `search_document` (tsvector, maintained by trigger) |

Passages also need `version_id` (the book's active uploaded file version). There are no per-passage keyword/alias columns. The proposed migration adds a separate, staff-only alias table instead of new passage columns.

## Steps to go live (administrator)

1. **Upload the original** in Admin → Church Library: create the book, then upload `The Faith And Order Of The Church (2)(4).docx` as its file version. Use the same file (sha256 `2e3bdda2…b37e`), or the import refuses unless you pass `--allow-sha-mismatch`.
2. **Dry run:** `node scripts/import-church-library-passages.mjs`
3. **Import** (service-role key from `.env.import`, never a `VITE_` key):
   `node --env-file=.env.import scripts/import-church-library-passages.mjs --book-id <uuid> --apply`
   This replaces the version's passages and sections, sets processing to `ready`, and leaves **public retrieval OFF**. 34 passages arrive as `needs_attention` because the conversion flagged likely typos in them (see the validation report).
4. **Review** the passages in the admin passage editor. Set rights (`rights_status`), `access_level = public_search`, `allow_search_quotes`, and approval, then enable public retrieval. The existing check constraint will not let retrieval be enabled without these.
5. **Search upgrade:** review the proposed migration, then copy it into `supabase/migrations/` with a new timestamp and deploy it. Then run the alias seed. After the aliases are reviewed, approve them:
   `UPDATE public.church_library_search_aliases SET review_status='approved', reviewed_at=now(), updated_at=now() WHERE review_status='pending';`
6. **AI grounding (optional):** set `CHURCH_LIBRARY_GROUNDING=1` on the backend once at least one book is public. `/api/chat` then adds the top approved passages (with citations) to the model context and returns them as `library_sources`. When nothing is found, the model is told to say that the library lacks source evidence.

## Rollback

- Retrieval: switch the book's public retrieval off (it takes effect immediately).
- Search RPC: re-apply section 12 of `20261026160000_reconcile_church_library_schema.sql`. The alias table is independent and can stay or be dropped.
- AI grounding: unset `CHURCH_LIBRARY_GROUNDING`.
