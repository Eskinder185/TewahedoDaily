-- Staff UPDATE on Mezmur import tables for Hymns Practice CMS image edits.
-- Uses existing public.is_staff() (profiles.role in editor/admin/super_admin).
-- Keeps anon READ ONLY. Additive.

begin;

-- Ensure is_staff() exists (same bootstrap as prayer_guides / hymn_collections).
do $$
begin
  if to_regprocedure('public.is_staff()') is null then
    execute $fn$
      create function public.is_staff()
      returns boolean
      language sql
      stable
      security definer
      set search_path = public
      as $body$
        select coalesce(
          (select role in ('editor', 'admin', 'super_admin')
           from public.profiles
           where id = auth.uid()),
          false
        );
      $body$;
    $fn$;
    revoke all on function public.is_staff() from public, anon;
    grant execute on function public.is_staff() to authenticated, anon;
  end if;
end $$;

-- Collections import
alter table if exists public.mezmur_collections_import enable row level security;

grant select on table public.mezmur_collections_import to anon, authenticated;
grant insert, update on table public.mezmur_collections_import to authenticated;
revoke insert, update, delete on table public.mezmur_collections_import from anon;

drop policy if exists mezmur_collections_import_public_read on public.mezmur_collections_import;
create policy mezmur_collections_import_public_read
  on public.mezmur_collections_import
  for select
  to anon, authenticated
  using (true);

drop policy if exists mezmur_collections_import_staff_update on public.mezmur_collections_import;
create policy mezmur_collections_import_staff_update
  on public.mezmur_collections_import
  for update
  to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

drop policy if exists mezmur_collections_import_staff_insert on public.mezmur_collections_import;
create policy mezmur_collections_import_staff_insert
  on public.mezmur_collections_import
  for insert
  to authenticated
  with check (coalesce(public.is_staff(), false));

-- Sections import
alter table if exists public.mezmur_sections_import enable row level security;

grant select on table public.mezmur_sections_import to anon, authenticated;
grant insert, update on table public.mezmur_sections_import to authenticated;
revoke insert, update, delete on table public.mezmur_sections_import from anon;

drop policy if exists mezmur_sections_import_public_read on public.mezmur_sections_import;
create policy mezmur_sections_import_public_read
  on public.mezmur_sections_import
  for select
  to anon, authenticated
  using (true);

drop policy if exists mezmur_sections_import_staff_update on public.mezmur_sections_import;
create policy mezmur_sections_import_staff_update
  on public.mezmur_sections_import
  for update
  to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

drop policy if exists mezmur_sections_import_staff_insert on public.mezmur_sections_import;
create policy mezmur_sections_import_staff_insert
  on public.mezmur_sections_import
  for insert
  to authenticated
  with check (coalesce(public.is_staff(), false));

notify pgrst, 'reload schema';

commit;
