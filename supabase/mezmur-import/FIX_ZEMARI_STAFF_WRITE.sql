-- Staff write access for Zemari CMS + mezmur_data_import.zemari_id
-- Run in Supabase SQL Editor as postgres / service role.
-- Fixes 42501 / 403 when authenticated staff try to update hymns or zemaris.

begin;

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
  end if;
end $$;

revoke all on function public.is_staff() from public, anon;
grant execute on function public.is_staff() to authenticated, anon;

-- ---------------------------------------------------------------------------
-- zemaris
-- ---------------------------------------------------------------------------
alter table if exists public.zemaris enable row level security;

grant select on table public.zemaris to anon, authenticated;
grant insert, update, delete on table public.zemaris to authenticated;
revoke insert, update, delete on table public.zemaris from anon;

drop policy if exists zemaris_public_read on public.zemaris;
create policy zemaris_public_read
  on public.zemaris
  for select
  to anon, authenticated
  using (status = 'published' or coalesce(public.is_staff(), false));

drop policy if exists zemaris_staff_insert on public.zemaris;
create policy zemaris_staff_insert
  on public.zemaris
  for insert
  to authenticated
  with check (coalesce(public.is_staff(), false));

drop policy if exists zemaris_staff_update on public.zemaris;
create policy zemaris_staff_update
  on public.zemaris
  for update
  to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

drop policy if exists zemaris_staff_delete on public.zemaris;
create policy zemaris_staff_delete
  on public.zemaris
  for delete
  to authenticated
  using (coalesce(public.is_staff(), false));

-- ---------------------------------------------------------------------------
-- mezmur_data_import (zemari_id assignment)
-- ---------------------------------------------------------------------------
alter table if exists public.mezmur_data_import enable row level security;

grant select on table public.mezmur_data_import to anon, authenticated;
grant insert, update on table public.mezmur_data_import to authenticated;
revoke insert, update, delete on table public.mezmur_data_import from anon;

drop policy if exists mezmur_data_import_public_read on public.mezmur_data_import;
create policy mezmur_data_import_public_read
  on public.mezmur_data_import
  for select
  to anon, authenticated
  using (true);

drop policy if exists mezmur_data_import_staff_update on public.mezmur_data_import;
create policy mezmur_data_import_staff_update
  on public.mezmur_data_import
  for update
  to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

drop policy if exists mezmur_data_import_staff_insert on public.mezmur_data_import;
create policy mezmur_data_import_staff_insert
  on public.mezmur_data_import
  for insert
  to authenticated
  with check (coalesce(public.is_staff(), false));

-- View (counts)
grant select on table public.zemaris_with_counts to anon, authenticated;

-- Occasion / category import links (taxonomy reads + occasional staff writes)
grant select on table public.mezmur_occasion_links_import to anon, authenticated;
grant select on table public.mezmur_category_links_import to anon, authenticated;
grant insert, update, delete on table public.mezmur_occasion_links_import to authenticated;
revoke insert, update, delete on table public.mezmur_occasion_links_import from anon;

alter table if exists public.mezmur_occasion_links_import enable row level security;
drop policy if exists mezmur_occasion_links_import_public_read on public.mezmur_occasion_links_import;
create policy mezmur_occasion_links_import_public_read
  on public.mezmur_occasion_links_import
  for select to anon, authenticated
  using (true);
drop policy if exists mezmur_occasion_links_import_staff_write on public.mezmur_occasion_links_import;
create policy mezmur_occasion_links_import_staff_write
  on public.mezmur_occasion_links_import
  for all to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

notify pgrst, 'reload schema';

-- Quick diagnostics (run as the logged-in staff role in SQL Editor if needed):
--   select auth.uid(), public.is_staff();
--   select has_table_privilege('authenticated', 'public.mezmur_data_import', 'update');
--   select has_table_privilege('authenticated', 'public.zemaris', 'insert');

commit;
