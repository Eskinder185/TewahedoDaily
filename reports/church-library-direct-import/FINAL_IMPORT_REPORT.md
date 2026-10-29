# Bilingual Church Library production import report

Date: 2026-10-28  
Supabase project: `tgvhpibzzkqxkcumrivh`

## Outcome

The structured Church Library migration was validated twice in rollback-only
transactions, backed up, and then applied through the existing PostgreSQL
administrator connection. Four editions were imported in one transaction.
Every imported record remains **Draft**, **private**, not approved for ingestion,
not public-retrieval enabled, and not search-quote enabled.

The project does not expose a `supabase_migrations.schema_migrations` ledger.
Only the internal Auth, Realtime, and Storage migration tables exist. Migration
status was therefore confirmed from the actual columns, tables, policies,
indexes, and RPC signatures rather than fabricating a migration-history row.

## Imported editions

| Book ID | Slug | Language | Chapters | Sections (chapters included) | Passages |
|---|---|---:|---:|---:|---:|
| `765d4d18-0e50-4e72-a8ca-1ac65061c52b` | `five-pillars-of-mystery-am` | Amharic | 6 | 34 | 184 |
| `4daffc5b-b1b3-4624-83d5-86c937c7aa60` | `five-pillars-of-mystery-en` | English | 6 | 34 | 184 |
| `9f795e6d-2986-47fe-a821-f1868dc52c6b` | `seven-sacraments-baptism-am` | Amharic | 1 | 12 | 101 |
| `b082b735-5f41-4d08-8e6d-3b5a9f4a4c1d` | `seven-sacraments-baptism-en` | English | 1 | 12 | 101 |

Totals: **4 books**, **14 chapter editions**, **92 stored sections**, and
**570 passages**. The Baptism editions use collection key
`seven-sacraments-baptism` and are explicitly described as the Baptism chapter
only, not the complete Seven Sacraments book.

## Source integrity and duplicate validation

- The pre-import database contained zero Church Library books and zero passages.
- Duplicate checks by slug, collection/language, and source SHA-256 returned no
  conflict.
- Five Pillars source SHA-256:
  `272F7EB56E4465960D158045521C7D9A9980AA3C664DDF2555D72435F1BD5524`.
- Baptism Amharic source SHA-256:
  `6D942F44473504957D3E7BC26F12011C3F7B0E61512024AB14C26B6D11102823`.
- Baptism English source SHA-256:
  `E1E25CDF45E970B27EF012EA875290C38651C0A72E35DF91A02EA9983B292BF3`.
- All `FP-*` and `SS-*` identifiers were retained. The retired accidental ID
  `FP-004-S005-P004` was not present.
- Amharic and English stable section/passage key sets match exactly within each
  collection.
- Independent database read-back found **0 missing passages**, **0 content
  mismatches**, **0 hash mismatches**, **0 ordering mismatches**, **0 locator
  mismatches**, and **0 section hierarchy/title mismatches**.
- All 570 passages have populated full-text and Amharic-folded search fields.

## Security and access verification

- `public.church_library_import_structured(jsonb)` remains `SECURITY INVOKER`
  and executable only by `authenticated` (plus its owner).
- `public.is_staff()` returned true for the existing super-admin session.
- Testing as the actual `authenticated` PostgreSQL role returned all 4 books,
  92 sections, and 570 passages.
- Anonymous API checks returned HTTP 200 with **0 books, 0 sections, and 0
  passages**. The future public-read grants are RLS-gated, so no Draft content
  was returned publicly.
- No service-role credential was written to source control; the repository's
  service-role value remains blank. The established local PostgreSQL password
  file supplied authentication without printing the password.

## Reader routes (staff authentication required while Draft)

- `/library/read/five-pillars-of-mystery-am`
- `/library/read/five-pillars-of-mystery-en`
- `/library/read/seven-sacraments-baptism-am`
- `/library/read/seven-sacraments-baptism-en`

## Tests

- Structured parser regressions: **14 passed, 0 failed**.
- Production-shaped migration + four-book import dry run: **passed and rolled back**.
- Migration second execution/idempotence test: **passed and rolled back**.
- Church Library security/workflow checks: **passed**.
- Church Library upload/undefined-response regressions: **passed**.
- Church Library search RPC contract/gate/citation checks: **passed**.
- TypeScript + Vite production build: **passed**.

## Backup and recovery

The pre-import custom-format PostgreSQL backup is stored at
`reports/church-library-direct-import/pre_import_church_library_backup.dump`.
It contains the affected pre-import books/passages table definitions and data.

Failed or skipped records: **0**. No website deployment and no publication
transition were performed.
