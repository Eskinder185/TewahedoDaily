-- Forward-only multilingual Mezmur management. Existing language values remain
-- intact; reads use compatibility aliases and new staff writes use standard codes.
begin;

create or replace function public.bulk_assign_mezmur_language(
  p_import_ids uuid[],
  p_language text,
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
  v_language text := lower(trim(coalesce(p_language, '')));
  v_ids uuid[];
  v_id uuid;
  v_existing text;
  v_applied integer := 0;
  v_skipped integer := 0;
  v_failed integer := 0;
  v_results jsonb := '[]'::jsonb;
begin
  select role::text into v_role from public.profiles where id = v_actor;
  if v_actor is null or v_role not in ('admin', 'super_admin') then
    raise exception 'Admin or Super Admin is required for bulk language assignment' using errcode = '42501';
  end if;
  if v_language not in ('am', 'ti', 'om', 'gez', 'en') then
    raise exception 'Language must be one of am, ti, om, gez, or en' using errcode = '22023';
  end if;
  select coalesce(array_agg(distinct value order by value), '{}') into v_ids
  from unnest(coalesce(p_import_ids, '{}')) value;
  if cardinality(v_ids) > 100 then
    raise exception 'Bulk language assignment is limited to 100 records' using errcode = '22023';
  end if;

  foreach v_id in array v_ids loop
    begin
      select primary_language into strict v_existing
      from public.mezmur_data_import
      where import_id = v_id and deleted_at is null and status = 'draft'
      for update;
      if nullif(trim(coalesce(v_existing, '')), '') is not null and not p_overwrite then
        v_skipped := v_skipped + 1;
        v_results := v_results || jsonb_build_object('import_id', v_id, 'outcome', 'skipped', 'reason', 'Language already recorded');
      else
        update public.mezmur_data_import
        set primary_language = v_language, updated_at = now()
        where import_id = v_id;
        v_applied := v_applied + 1;
        v_results := v_results || jsonb_build_object('import_id', v_id, 'outcome', 'applied');
      end if;
    exception when no_data_found then
      v_failed := v_failed + 1;
      v_results := v_results || jsonb_build_object('import_id', v_id, 'outcome', 'failed', 'reason', 'Active Draft Mezmur not found');
    when others then
      v_failed := v_failed + 1;
      v_results := v_results || jsonb_build_object('import_id', v_id, 'outcome', 'failed', 'sqlstate', sqlstate, 'reason', sqlerrm);
    end;
  end loop;
  return jsonb_build_object('applied', v_applied, 'skipped', v_skipped, 'failed', v_failed, 'results', v_results);
end;
$$;

revoke all on function public.bulk_assign_mezmur_language(uuid[], text, boolean) from public, anon;
grant execute on function public.bulk_assign_mezmur_language(uuid[], text, boolean) to authenticated;
notify pgrst, 'reload schema';
commit;
