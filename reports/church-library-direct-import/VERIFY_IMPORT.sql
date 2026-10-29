-- Read-back verification after import (database administrator session)
with expected(slug, expected_sections, expected_passages) as (
  values
    ('five-pillars-of-mystery-am', 34, 184),
    ('five-pillars-of-mystery-en', 34, 184),
    ('seven-sacraments-baptism-am', 12, 101),
    ('seven-sacraments-baptism-en', 12, 101)
), actual as (
  select b.id, b.slug, b.language, b.collection_key, b.publication_status, b.access_level,
         b.source_document_sha256,
         (select count(*) from public.church_library_sections s where s.book_id = b.id) as section_count,
         (select count(*) from public.church_library_passages p where p.book_id = b.id) as passage_count
    from public.church_library_books b
   where b.slug in ('five-pillars-of-mystery-am', 'five-pillars-of-mystery-en', 'seven-sacraments-baptism-am', 'seven-sacraments-baptism-en')
)
select e.*, a.*,
       a.section_count = e.expected_sections as sections_match,
       a.passage_count = e.expected_passages as passages_match
  from expected e left join actual a using (slug)
 order by e.slug;

-- Public/anonymous clients must see zero rows while these editions are Draft.
-- Run this second query through the application's anonymous Supabase client:
-- select=slug&slug=in.(five-pillars-of-mystery-am,five-pillars-of-mystery-en,seven-sacraments-baptism-am,seven-sacraments-baptism-en)
