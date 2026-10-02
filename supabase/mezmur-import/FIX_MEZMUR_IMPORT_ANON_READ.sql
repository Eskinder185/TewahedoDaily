-- Fix: Hymns Practice anon reads see 0 rows while Table Editor shows data.
-- Cause: RLS enabled (or missing GRANT SELECT) on mezmur_*_import tables.
-- PostgREST returns HTTP 200 + [] with content-range */0 — looks like "empty", not 403.
--
-- Run in Supabase SQL Editor as postgres / service role.
-- Additive. Does not drop data.

begin;

-- Collections
alter table if exists public.mezmur_collections_import disable row level security;
grant select on table public.mezmur_collections_import to anon, authenticated;

-- Sections
alter table if exists public.mezmur_sections_import disable row level security;
grant select on table public.mezmur_sections_import to anon, authenticated;

-- Section links
alter table if exists public.mezmur_section_links_import disable row level security;
grant select on table public.mezmur_section_links_import to anon, authenticated;

-- Mezmur data
alter table if exists public.mezmur_data_import disable row level security;
grant select on table public.mezmur_data_import to anon, authenticated;

-- Occasion links
alter table if exists public.mezmur_occasion_links_import disable row level security;
grant select on table public.mezmur_occasion_links_import to anon, authenticated;

-- Category links
alter table if exists public.mezmur_category_links_import disable row level security;
grant select on table public.mezmur_category_links_import to anon, authenticated;

-- Drop leftover policies (safe if none exist)
do $$
declare
  r record;
begin
  for r in
    select schemaname, tablename, policyname
    from pg_policies
    where schemaname = 'public'
      and tablename in (
        'mezmur_collections_import',
        'mezmur_sections_import',
        'mezmur_section_links_import',
        'mezmur_data_import',
        'mezmur_occasion_links_import',
        'mezmur_category_links_import'
      )
  loop
    execute format('drop policy if exists %I on %I.%I', r.policyname, r.schemaname, r.tablename);
  end loop;
end $$;

notify pgrst, 'reload schema';

select 'mezmur_collections_import' as table_name, count(*)::int as rows from public.mezmur_collections_import
union all
select 'mezmur_sections_import', count(*)::int from public.mezmur_sections_import
union all
select 'mezmur_data_import', count(*)::int from public.mezmur_data_import
union all
select 'mezmur_section_links_import', count(*)::int from public.mezmur_section_links_import
union all
select 'mezmur_occasion_links_import', count(*)::int from public.mezmur_occasion_links_import
union all
select 'mezmur_category_links_import', count(*)::int from public.mezmur_category_links_import;

commit;
