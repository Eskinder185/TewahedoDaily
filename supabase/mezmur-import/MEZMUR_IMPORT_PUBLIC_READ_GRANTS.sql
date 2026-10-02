-- Grant public (anon) SELECT on Mezmur import staging tables + disable RLS.
-- Prefer FIX_MEZMUR_IMPORT_ANON_READ.sql (same effect, includes policy cleanup).

begin;

alter table if exists public.mezmur_collections_import disable row level security;
alter table if exists public.mezmur_sections_import disable row level security;
alter table if exists public.mezmur_section_links_import disable row level security;
alter table if exists public.mezmur_data_import disable row level security;
alter table if exists public.mezmur_occasion_links_import disable row level security;
alter table if exists public.mezmur_category_links_import disable row level security;

grant select on table public.mezmur_collections_import to anon, authenticated;
grant select on table public.mezmur_sections_import to anon, authenticated;
grant select on table public.mezmur_section_links_import to anon, authenticated;
grant select on table public.mezmur_data_import to anon, authenticated;
grant select on table public.mezmur_occasion_links_import to anon, authenticated;
grant select on table public.mezmur_category_links_import to anon, authenticated;

notify pgrst, 'reload schema';

commit;
