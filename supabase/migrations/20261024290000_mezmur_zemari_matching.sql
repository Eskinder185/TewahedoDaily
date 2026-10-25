-- Forward-only protected Zemari aliases and stable-ID Mezmur linking.
-- Existing singer_* text is intentionally preserved.
begin;

create table if not exists public.zemari_aliases (
  id uuid primary key default gen_random_uuid(),
  zemari_id uuid not null references public.zemaris(id) on delete cascade,
  alias text not null,
  is_verified boolean not null default false,
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  constraint zemari_aliases_nonempty check (nullif(trim(alias), '') is not null),
  constraint zemari_aliases_unique unique (zemari_id, alias)
);

create index if not exists zemari_aliases_lookup_idx on public.zemari_aliases (lower(trim(alias)));
alter table public.zemari_aliases enable row level security;
drop policy if exists zemari_aliases_staff_read on public.zemari_aliases;
create policy zemari_aliases_staff_read on public.zemari_aliases for select to authenticated
using (public.is_staff());
drop policy if exists zemari_aliases_admin_write on public.zemari_aliases;
create policy zemari_aliases_admin_write on public.zemari_aliases for all to authenticated
using (exists (select 1 from public.profiles where id = auth.uid() and role::text in ('admin', 'super_admin')))
with check (exists (select 1 from public.profiles where id = auth.uid() and role::text in ('admin', 'super_admin')));
revoke all on public.zemari_aliases from public, anon;
grant select, insert, update, delete on public.zemari_aliases to authenticated;

create or replace function public.bulk_link_mezmur_zemaris(
  p_links jsonb,
  p_overwrite boolean default false
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_actor uuid := auth.uid();
  v_role text;
  v_link record;
  v_existing uuid;
  v_count integer := 0;
  v_linked integer := 0;
  v_skipped integer := 0;
  v_failed integer := 0;
  v_results jsonb := '[]'::jsonb;
begin
  select role::text into v_role from public.profiles where id = v_actor;
  if v_actor is null or v_role not in ('admin', 'super_admin') then
    raise exception 'Admin or Super Admin is required to link Zemaris' using errcode = '42501';
  end if;
  if jsonb_typeof(coalesce(p_links, 'null'::jsonb)) <> 'array' then
    raise exception 'p_links must be a JSON array' using errcode = '22023';
  end if;
  if jsonb_array_length(p_links) > 100 then
    raise exception 'Zemari linking is limited to 100 records per call' using errcode = '22023';
  end if;

  for v_link in
    select distinct x.import_id, x.zemari_id
    from jsonb_to_recordset(p_links) as x(import_id uuid, zemari_id uuid)
  loop
    v_count := v_count + 1;
    begin
      if v_link.import_id is null or v_link.zemari_id is null then
        raise exception 'Both import_id and zemari_id are required' using errcode = '22023';
      end if;
      if not exists (
        select 1 from public.zemaris
        where id = v_link.zemari_id and deleted_at is null and status <> 'archived'
      ) then
        raise exception 'Active Zemari % does not exist', v_link.zemari_id using errcode = '23503';
      end if;

      select zemari_id into strict v_existing
      from public.mezmur_data_import
      where import_id = v_link.import_id and deleted_at is null and status = 'draft'
      for update;

      if v_existing is not null and v_existing <> v_link.zemari_id and not p_overwrite then
        v_skipped := v_skipped + 1;
        v_results := v_results || jsonb_build_object('import_id', v_link.import_id, 'outcome', 'skipped', 'reason', 'A verified Zemari relationship already exists');
      else
        update public.mezmur_data_import
        set zemari_id = v_link.zemari_id, updated_at = now()
        where import_id = v_link.import_id;
        v_linked := v_linked + 1;
        v_results := v_results || jsonb_build_object('import_id', v_link.import_id, 'outcome', 'linked', 'zemari_id', v_link.zemari_id);
      end if;
    exception when no_data_found then
      v_failed := v_failed + 1;
      v_results := v_results || jsonb_build_object('import_id', v_link.import_id, 'outcome', 'failed', 'reason', 'Active Draft Mezmur not found');
    when others then
      v_failed := v_failed + 1;
      v_results := v_results || jsonb_build_object('import_id', v_link.import_id, 'outcome', 'failed', 'sqlstate', sqlstate, 'reason', sqlerrm);
    end;
  end loop;
  return jsonb_build_object('requested', v_count, 'linked', v_linked, 'skipped', v_skipped, 'failed', v_failed, 'results', v_results);
end;
$$;

revoke all on function public.bulk_link_mezmur_zemaris(jsonb, boolean) from public, anon;
grant execute on function public.bulk_link_mezmur_zemaris(jsonb, boolean) to authenticated;
notify pgrst, 'reload schema';
commit;
