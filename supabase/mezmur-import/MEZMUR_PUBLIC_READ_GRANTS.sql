-- Grant public read on the NEW normalized Hymns Practice tables.
-- Safe, additive. Does not recreate old browse views.
-- Fixes: permission denied for table hymn_collections (anon).

begin;

grant select on public.hymn_collections to anon, authenticated;
grant select on public.hymn_sections to anon, authenticated;
grant select on public.mezmur_section_links to anon, authenticated;

do $$
begin
  if to_regclass('public.hymn_collections_with_counts') is not null then
    execute 'grant select on public.hymn_collections_with_counts to anon, authenticated';
  end if;
  if to_regclass('public.hymn_sections_with_counts') is not null then
    execute 'grant select on public.hymn_sections_with_counts to anon, authenticated';
  end if;
end $$;

-- Ensure published-or-staff RLS policies exist (idempotent).
alter table public.hymn_collections enable row level security;
alter table public.hymn_sections enable row level security;
alter table public.mezmur_section_links enable row level security;

drop policy if exists hymn_collections_public_read on public.hymn_collections;
create policy hymn_collections_public_read
  on public.hymn_collections for select to anon, authenticated
  using (status = 'published' or coalesce(public.is_staff(), false));

drop policy if exists hymn_sections_public_read on public.hymn_sections;
create policy hymn_sections_public_read
  on public.hymn_sections for select to anon, authenticated
  using (status = 'published' or coalesce(public.is_staff(), false));

drop policy if exists mezmur_section_links_public_read on public.mezmur_section_links;
create policy mezmur_section_links_public_read
  on public.mezmur_section_links for select to anon, authenticated
  using (
    coalesce(public.is_staff(), false)
    or (
      exists (
        select 1 from public.hymn_sections s
        where s.id = section_id and s.status = 'published'
      )
      and exists (
        select 1 from public.mezmur m
        where m.id = mezmur_id and m.status = 'published'
      )
    )
  );

commit;
