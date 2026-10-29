\set ON_ERROR_STOP on
begin;
set transaction read only;

\echo 'BOOK_AND_INDEX_STATUS'
select
  b.id,
  b.slug,
  b.title,
  b.language,
  b.storage_path,
  b.download_storage_path,
  b.publication_status,
  b.access_level,
  b.processing_status,
  b.ingestion_status,
  b.search_enabled,
  b.public_retrieval_enabled,
  b.approved_for_ingestion,
  b.allow_search_quotes,
  count(p.id) as passage_count,
  count(p.search_document) as indexed_passage_count,
  count(p.embedding) as embedded_passage_count,
  count(distinct p.language) as passage_language_count,
  count(distinct p.chapter_reference) filter (where p.chapter_reference is not null) as chapter_reference_count,
  count(p.stable_key) as stable_passage_id_count
from public.church_library_books b
left join public.church_library_passages p on p.book_id = b.id
where b.slug in (
  'five-pillars-of-mystery-am', 'five-pillars-of-mystery-en',
  'seven-sacraments-baptism-am', 'seven-sacraments-baptism-en'
)
group by b.id, b.slug, b.title, b.language, b.storage_path, b.download_storage_path,
  b.publication_status, b.access_level, b.processing_status, b.ingestion_status,
  b.search_enabled, b.public_retrieval_enabled, b.approved_for_ingestion,
  b.allow_search_quotes
order by b.slug;

\echo 'PASSAGE_LANGUAGES_AND_LOCATORS'
select b.slug, p.language, count(*) as passages,
       min(p.stable_key) as first_stable_key,
       max(p.stable_key) as last_stable_key
from public.church_library_books b
join public.church_library_passages p on p.book_id = b.id
where b.slug in (
  'five-pillars-of-mystery-am', 'five-pillars-of-mystery-en',
  'seven-sacraments-baptism-am', 'seven-sacraments-baptism-en'
)
group by b.slug, p.language
order by b.slug, p.language;

\echo 'SEARCH_RPC_SIGNATURES'
select p.proname, pg_get_function_identity_arguments(p.oid) as arguments,
       p.prosecdef as security_definer,
       pg_get_userbyid(p.proowner) as owner
from pg_proc p
join pg_namespace n on n.oid = p.pronamespace
where n.nspname = 'public'
  and p.proname in (
    'search_church_library', 'search_church_library_sections',
    'church_library_public_search_status', 'church_library_search_status'
  )
order by p.proname, arguments;

\echo 'ANONYMOUS_VISIBILITY'
select set_config('request.jwt.claims', '{"role":"anon"}', true);
set local role anon;
select count(*) as direct_book_rows from public.church_library_books
where slug in (
  'five-pillars-of-mystery-am', 'five-pillars-of-mystery-en',
  'seven-sacraments-baptism-am', 'seven-sacraments-baptism-en'
);
select count(*) as anonymous_search_hits
from public.search_church_library_sections('How many sacraments are there?', 8, 'en');
reset role;

\echo 'AUTHENTICATED_STAFF_VISIBILITY'
select p.id::text as staff_uid
from public.profiles p
where p.role in ('editor', 'admin', 'super_admin')
order by case p.role when 'super_admin' then 0 when 'admin' then 1 else 2 end
limit 1
\gset
select set_config(
  'request.jwt.claims',
  json_build_object('sub', :'staff_uid', 'role', 'authenticated')::text,
  true
);
set local role authenticated;
select public.is_staff() as is_staff;
select count(*) as direct_staff_passage_rows
from public.church_library_passages p
join public.church_library_books b on b.id = p.book_id
where b.slug in (
  'five-pillars-of-mystery-am', 'five-pillars-of-mystery-en',
  'seven-sacraments-baptism-am', 'seven-sacraments-baptism-en'
);
select count(*) as current_staff_search_hits_en
from public.search_church_library_sections('How many sacraments are there?', 8, 'en');
select count(*) as current_staff_search_hits_am
from public.search_church_library_sections('ሰባቱ ምሥጢራት', 8, 'am');
reset role;

rollback;
