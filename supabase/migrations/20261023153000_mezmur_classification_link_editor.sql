-- Transactional, idempotent write path for the Mezmur admin multi-select editor.
-- This migration is local/source-only until deliberately applied by an operator.

grant select on table public.mezmur_category_links_import, public.mezmur_occasion_links_import to anon, authenticated;
grant insert, delete on table public.mezmur_category_links_import, public.mezmur_occasion_links_import to authenticated;
revoke insert, update, delete on table public.mezmur_category_links_import, public.mezmur_occasion_links_import from anon;

alter table public.mezmur_category_links_import enable row level security;
alter table public.mezmur_occasion_links_import enable row level security;

drop policy if exists mezmur_category_links_import_public_read on public.mezmur_category_links_import;
create policy mezmur_category_links_import_public_read
  on public.mezmur_category_links_import for select to anon, authenticated using (true);
drop policy if exists mezmur_category_links_import_staff_write on public.mezmur_category_links_import;
create policy mezmur_category_links_import_staff_write
  on public.mezmur_category_links_import for all to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

drop policy if exists mezmur_occasion_links_import_public_read on public.mezmur_occasion_links_import;
create policy mezmur_occasion_links_import_public_read
  on public.mezmur_occasion_links_import for select to anon, authenticated using (true);
drop policy if exists mezmur_occasion_links_import_staff_write on public.mezmur_occasion_links_import;
create policy mezmur_occasion_links_import_staff_write
  on public.mezmur_occasion_links_import for all to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

create or replace function public.set_mezmur_classification_import(
  p_mezmur_slug text,
  p_category_slugs text[] default '{}',
  p_occasion_slugs text[] default '{}'
)
returns void
language plpgsql
security invoker
set search_path = public
as $$
declare
  v_slug text := trim(coalesce(p_mezmur_slug, ''));
begin
  if v_slug = '' then
    raise exception 'mezmur slug is required';
  end if;

  if not coalesce(public.is_staff(), false) then
    raise exception 'staff access required' using errcode = '42501';
  end if;

  delete from public.mezmur_category_links_import where trim(mezmur_slug) = v_slug;
  insert into public.mezmur_category_links_import (mezmur_slug, category_slug, source_category, confidence)
  select v_slug, value, 'admin-editor', 'verified'
  from (
    select distinct lower(trim(value)) as value
    from unnest(coalesce(p_category_slugs, '{}')) as value
  ) clean
  where value <> '';

  delete from public.mezmur_occasion_links_import where trim(mezmur_slug) = v_slug;
  insert into public.mezmur_occasion_links_import (mezmur_slug, occasion_slug)
  select v_slug, value
  from (
    select distinct lower(trim(value)) as value
    from unnest(coalesce(p_occasion_slugs, '{}')) as value
  ) clean
  where value <> '';
end;
$$;

revoke all on function public.set_mezmur_classification_import(text, text[], text[]) from public, anon;
grant execute on function public.set_mezmur_classification_import(text, text[], text[]) to authenticated, service_role;

comment on function public.set_mezmur_classification_import(text, text[], text[]) is
  'Atomically replaces normalized category and occasion links for one Mezmur. Existing source rows are preserved until this function is explicitly called.';

notify pgrst, 'reload schema';
