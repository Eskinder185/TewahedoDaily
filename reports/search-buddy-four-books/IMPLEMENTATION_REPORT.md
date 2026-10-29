# Church Library four-book Search Buddy integration

Date: 2026-10-29  
Supabase project: `tgvhpibzzkqxkcumrivh`

## Root cause

The four editions were genuinely processed and indexed, but both deployed
Search Buddy RPCs were restricted to books passing the public publication and
rights gates. Authenticated staff could read all 570 private passage rows under
RLS, yet `search_church_library_sections()` returned zero results because its
`SECURITY DEFINER` body applied the public-only gate unconditionally.

“Ready” therefore meant processing and lexical indexing had completed. It did
not mean the books were eligible for either public or staff Search Buddy
retrieval.

## Production inventory verified read-only

| Book ID | Slug | Language | State | Passages | Lexically indexed | Embeddings |
|---|---|---|---|---:|---:|---:|
| `765d4d18-0e50-4e72-a8ca-1ac65061c52b` | `five-pillars-of-mystery-am` | Amharic | Draft / Private / Ready | 184 | 184 | 0 |
| `4daffc5b-b1b3-4624-83d5-86c937c7aa60` | `five-pillars-of-mystery-en` | English | Draft / Private / Ready | 184 | 184 | 0 |
| `9f795e6d-2986-47fe-a821-f1868dc52c6b` | `seven-sacraments-baptism-am` | Amharic | Draft / Private / Ready | 101 | 101 | 0 |
| `b082b735-5f41-4d08-8e6d-3b5a9f4a4c1d` | `seven-sacraments-baptism-en` | English | Draft / Private / Ready | 101 | 101 | 0 |

Totals: 4 existing books, 570 passages, 570 populated full-text/folded search
documents, 570 stable `FP-*`/`SS-*` passage keys, and zero vector embeddings.
The structured editions have no Storage path because their source text is
stored directly in the existing structured book/section/passage tables.

## Applied repair

`20261030130000_church_library_staff_private_search.sql` was validated in a
rollback-only transaction and then applied through the established PostgreSQL
administrator connection.

The migration:

- preserves the existing `search_church_library` and
  `search_church_library_sections` PostgREST signatures;
- allows private Ready books only when the JWT has a real `auth.uid()` and
  `public.is_staff()` is true;
- does not treat a service-role backend request as staff, preventing the
  unauthenticated FastAPI endpoint from exposing private passages;
- keeps anonymous callers restricted to `church_library_book_is_public()`;
- adds English/Amharic and common theological query expansion without changing
  source text;
- retains exact book, section and passage identifiers for reader links;
- adds a caller-aware status RPC so staff do not receive the false
  `no_public_books` message;
- makes FAQ suggestions access-aware, so a question tied only to a private book
  cannot appear to anonymous visitors.

It did not update any book, passage, status, rights flag, source text, or RLS
policy. `NOTIFY pgrst, 'reload schema'` was issued by the migration.

## Post-deployment verification

- Anonymous direct visibility for the four books: **0 rows**.
- Anonymous Search Buddy results for the private editions: **0**.
- Authenticated staff direct passage visibility: **570 rows**.
- Authenticated staff English query results: **8**.
- Authenticated staff Amharic query results: **8**.
- English results resolved to `seven-sacraments-baptism-en` with stable
  `SS-*` section and passage keys.
- Amharic results resolved to `seven-sacraments-baptism-am` with stable
  `SS-*` section and passage keys.
- All four books remain Draft, Private, `search_enabled = false`, and
  `public_retrieval_enabled = false`.

## Public availability

These books are intentionally unavailable to anonymous Search Buddy users.
Making them public requires a separate staff decision using the existing review,
rights, quotation, access-level, and publication workflow. No such transition
was made by this implementation.

Because no embedding vectors currently exist, retrieval for these four books is
exact phrase, Unicode-safe folded Amharic, full-text, trigram and alias-based.
Semantic vector ranking remains inactive until an approved multilingual
embedding process populates compatible 384-dimensional vectors.
