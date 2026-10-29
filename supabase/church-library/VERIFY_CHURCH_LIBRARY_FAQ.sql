-- Read-only post-install verification for the approved FAQ layer.
select to_regclass('public.church_library_faqs') as faq_table;

select p.proname, pg_get_function_identity_arguments(p.oid) as arguments,
       p.prosecdef as security_definer
from pg_proc p join pg_namespace n on n.oid = p.pronamespace
where n.nspname = 'public' and p.proname = 'search_church_library_faq';

select review_status, publication_status, count(*)
from public.church_library_faqs
group by review_status, publication_status
order by review_status, publication_status;

select stable_id, publication_status, review_status,
       jsonb_array_length(source_references) as source_count
from public.church_library_faqs
order by stable_id;

-- Must return zero: public answers lacking citations.
select stable_id
from public.church_library_faqs
where publication_status = 'published'
  and (review_status <> 'approved' or jsonb_array_length(source_references) = 0);

-- Run as anon and authenticated separately after publishing one reviewed FAQ.
select * from public.search_church_library_faq('How many sacraments are there?', 'en', 3, null);
select * from public.search_church_library_faq('ሰባቱ ምሥጢራት ምንድን ናቸው?', 'am', 3, null);
