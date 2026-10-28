-- Read-only verification after applying
-- 20261028160000_install_church_library_search_rpc.sql.

-- 1. Exact function identities exposed to PostgREST.
select
  n.nspname as schema_name,
  p.proname as function_name,
  pg_get_function_identity_arguments(p.oid) as arguments,
  p.prosecdef as security_definer,
  pg_get_userbyid(p.proowner) as owner,
  has_function_privilege('anon', p.oid, 'EXECUTE') as anon_can_execute,
  has_function_privilege('authenticated', p.oid, 'EXECUTE') as authenticated_can_execute
from pg_proc p
join pg_namespace n on n.oid = p.pronamespace
where n.nspname = 'public'
  and p.proname in ('search_church_library', 'church_library_public_search_status')
order by p.proname;

-- 2. Counts after all public-retrieval gates are applied.
select * from public.church_library_public_search_status();

-- 3. Faith and Order smoke searches. These are reads only.
select
  passage_id,
  book_id,
  title,
  chapter_reference,
  locator_label,
  page_start,
  page_end,
  left(excerpt, 180) as excerpt_preview
from public.search_church_library('Holy Trinity', 8, 'en')
where title ilike '%Faith%Order%';

select
  passage_id,
  book_id,
  title,
  chapter_reference,
  locator_label,
  left(excerpt, 180) as excerpt_preview
from public.search_church_library('Holy Communion', 8, 'en')
where title ilike '%Faith%Order%';

-- 4. Every returned citation identity must resolve to the exact active passage
-- under the same public gates used by the RPC.
with hits as (
  select * from public.search_church_library('Holy Trinity', 8, 'en')
)
select
  h.passage_id,
  h.book_id,
  count(p.id) = 1 as exact_passage_resolves,
  bool_and(p.book_id = h.book_id) as correct_parent_book
from hits h
left join public.church_library_passages p on p.id = h.passage_id
group by h.passage_id, h.book_id
order by h.passage_id;

