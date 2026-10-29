# Search Buddy Church Knowledge FAQ — Local Implementation

## Architecture

The FAQ path augments the existing Search Buddy and Church Library retrieval. It does not replace either system.

1. Search Buddy submits the visitor's question to `search_church_library_faq` and the existing Church Library search in parallel.
2. The FAQ RPC normalizes English/Amharic text, scores canonical questions and alternative phrasings with trigram similarity, and optionally boosts the previous FAQ topic for follow-ups.
3. A direct answer renders only when the row is both `approved` and `published` and contains at least one source reference.
4. Every citation links to an existing structured Church Library reader route.
5. Detailed or unmatched questions continue through the existing structured/legacy Church Library retrieval path.

## Security

- RLS remains enabled.
- Anonymous users can select only approved, published FAQs.
- Staff can create and edit drafts.
- Only Admin/Super Admin roles may approve or publish.
- A publication trigger rejects missing or unresolved source references.
- The public search RPC is `SECURITY INVOKER`; it does not bypass RLS.
- Seeded questions are draft/pending and therefore remain private.

## Activation

1. Review `supabase/migrations/20261030120000_church_library_approved_faq.sql`.
2. Apply only that migration using the established reviewed migration workflow or Supabase SQL Editor.
3. Open `/admin/church-library/faqs` as staff.
4. Replace each placeholder with wording verified against the imported bilingual source, attach real `book_slug`, `section_key`, and `passage_key` references, then approve and publish as Admin/Super Admin.
5. Run `supabase/church-library/VERIFY_CHURCH_LIBRARY_FAQ.sql` as database administrator and repeat the two RPC calls as anon.
6. Deploy the frontend only after the database verification passes.

No database or deployment action was performed during local implementation.
