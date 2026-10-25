-- Forward-only Supabase operation used by the FastAPI-independent Bulk CMS.
-- It only adds missing category links; it never changes content or publication.
begin;

create or replace function public.bulk_add_mezmur_category(
  p_import_ids uuid[],
  p_category_slug text
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_actor uuid := auth.uid();
  v_role text;
  v_category text := lower(trim(coalesce(p_category_slug, '')));
  v_ids uuid[];
  v_id uuid;
  v_slug text;
  v_applied integer := 0;
  v_failed integer := 0;
  v_results jsonb := '[]'::jsonb;
begin
  select role::text into v_role from public.profiles where id = v_actor;
  if v_actor is null or v_role not in ('admin', 'super_admin') then
    raise exception 'Admin or Super Admin is required for bulk category assignment' using errcode = '42501';
  end if;
  if v_category = '' then
    raise exception 'An existing category slug is required' using errcode = '22023';
  end if;
  select coalesce(array_agg(distinct value order by value), '{}') into v_ids
  from unnest(coalesce(p_import_ids, '{}')) value;
  if cardinality(v_ids) > 100 then
    raise exception 'Bulk category assignment is limited to 100 records' using errcode = '22023';
  end if;
  if not exists (
    select 1 from public.categories
    where slug = v_category
  ) then
    raise exception 'Unknown category: %', v_category using errcode = '23514';
  end if;

  foreach v_id in array v_ids loop
    begin
      select slug into strict v_slug
      from public.mezmur_data_import
      where import_id = v_id and deleted_at is null
      for update;
      insert into public.mezmur_category_links_import
        (mezmur_slug, category_slug, source_category, confidence)
      select v_slug, v_category, 'admin-bulk', 'verified'
      where not exists (
        select 1 from public.mezmur_category_links_import
        where mezmur_slug = v_slug and category_slug = v_category
      );
      v_applied := v_applied + 1;
      v_results := v_results || jsonb_build_object('import_id', v_id, 'outcome', 'applied');
    exception when others then
      v_failed := v_failed + 1;
      v_results := v_results || jsonb_build_object(
        'import_id', v_id, 'outcome', 'failed', 'sqlstate', sqlstate, 'reason', sqlerrm
      );
    end;
  end loop;
  return jsonb_build_object('applied', v_applied, 'failed', v_failed, 'results', v_results);
end;
$$;

revoke all on function public.bulk_add_mezmur_category(uuid[], text) from public, anon;
grant execute on function public.bulk_add_mezmur_category(uuid[], text) to authenticated;
notify pgrst, 'reload schema';
commit;
