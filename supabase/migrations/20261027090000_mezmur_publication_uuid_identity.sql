-- Forward-only repair: make publication identity-safe when legacy slugs collide.
-- Apply manually after reviewing the read-only audit in
-- supabase/mezmur-import/MEZMUR_DUPLICATE_SLUG_AUDIT_READ_ONLY.sql.
begin;

do $$
begin
  if to_regclass('public.mezmur_data_import') is null
     or not exists (select 1 from information_schema.columns where table_schema = 'public' and table_name = 'mezmur_data_import' and column_name = 'import_id')
     or not exists (select 1 from information_schema.columns where table_schema = 'public' and table_name = 'mezmur_data_import' and column_name = 'deleted_at')
     or not exists (select 1 from information_schema.columns where table_schema = 'public' and table_name = 'mezmur_data_import' and column_name = 'mezmur_id') then
    raise exception 'Publication UUID migration requires public.mezmur_data_import import_id, mezmur_id, and deleted_at columns; run the reviewed identity migration first' using errcode = '42703';
  end if;
end;
$$;

-- Replace the older approval/media-only guard. Historical review and rights
-- columns remain immutable audit data, but they are not prerequisites for an
-- owner-authorized publication transition. Required content validation and
-- the protected RPC transition remain enforced.
create or replace function public.guard_mezmur_import_publication()
returns trigger
language plpgsql
set search_path = ''
as $$
declare
  v_publication_rpc boolean :=
    coalesce(current_setting('tewahedo.publication_via_rpc', true), '') = 'on';
  v_rights_rpc boolean :=
    coalesce(current_setting('tewahedo.rights_via_rpc', true), '') = 'on'
    or coalesce(current_setting('tewahedo.approval_via_rpc', true), '') = 'on'
    or v_publication_rpc;
begin
  new.status := lower(trim(coalesce(new.status, case when tg_op = 'UPDATE' then old.status else 'draft' end)));
  if new.status not in ('draft', 'published') then
    raise exception 'Mezmur status must be draft or published' using errcode = '23514';
  end if;
  if new.status = 'published'
     and (tg_op = 'INSERT' or old.status is distinct from 'published')
     and not v_publication_rpc then
    raise exception 'Use publish_mezmur_import for publication transitions' using errcode = '42501';
  end if;
  if tg_op = 'INSERT' then
    new.rights_status := lower(trim(coalesce(nullif(new.rights_status, ''), 'unknown')));
    if new.publication_approved_at is not null or new.publication_approved_by is not null then
      raise exception 'Publication approval metadata is retained for history and cannot be set by ordinary Save' using errcode = '42501';
    end if;
  elsif not v_rights_rpc and (
    new.review_status is distinct from old.review_status
    or new.review_notes is distinct from old.review_notes
    or new.rights_status is distinct from old.rights_status
    or new.publication_approved_at is distinct from old.publication_approved_at
    or new.publication_approved_by is distinct from old.publication_approved_by
  ) then
    raise exception 'Review and rights history are not editable through ordinary Save' using errcode = '42501';
  end if;
  if new.status = 'published'
     and (nullif(trim(coalesce(new.title, '')), '') is null
       or nullif(trim(coalesce(new.slug, '')), '') is null
       or nullif(trim(coalesce(new.lyrics_amharic, '')), '') is null) then
    raise exception 'Title, slug, and Amharic lyrics are required to publish' using errcode = '23514';
  end if;
  return new;
end;
$$;

revoke all on function public.guard_mezmur_import_publication() from public, anon, authenticated;
drop trigger if exists mezmur_data_import_publication_guard on public.mezmur_data_import;
create trigger mezmur_data_import_publication_guard
before insert or update on public.mezmur_data_import
for each row execute function public.guard_mezmur_import_publication();

-- Preserve the legacy text API, but fail closed when a slug is ambiguous.
drop function if exists public.publish_mezmur_import(text, text);
create function public.publish_mezmur_import(
  p_slug text,
  p_expected_updated_at text default null
)
returns jsonb language plpgsql security definer set search_path = ''
as $$
declare
  v_import_id uuid;
  v_count integer;
begin
  if nullif(trim(coalesce(p_slug, '')), '') is null then
    raise exception 'Slug required' using errcode = '23514';
  end if;
  select count(*), min(import_id) into v_count, v_import_id
  from public.mezmur_data_import
  where lower(trim(slug)) = lower(trim(p_slug)) and deleted_at is null;
  if v_count <> 1 then
    raise exception 'Expected one Mezmur for slug %, found %; publish by import_id instead', p_slug, v_count using errcode = 'P0002';
  end if;
  return public.publish_mezmur_import(v_import_id, p_expected_updated_at);
end;
$$;

drop function if exists public.publish_mezmur_import(uuid, text);
create function public.publish_mezmur_import(
  p_import_id uuid,
  p_expected_updated_at text default null
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_actor uuid := auth.uid();
  v_role text;
  v_row public.mezmur_data_import%rowtype;
  v_public_count integer := 0;
  v_public_visible boolean := false;
  v_visibility_reason text;
begin
  select role::text into v_role from public.profiles where id = v_actor;
  if v_actor is null or v_role not in ('editor', 'admin', 'super_admin') then
    raise exception 'An editor, admin, or super admin role is required to publish' using errcode = '42501';
  end if;
  if p_import_id is null then
    raise exception 'Stable Mezmur import_id is required' using errcode = '22023';
  end if;

  -- The UUID is the only publication selector. Never resolve this operation
  -- through slug: legacy slugs are not guaranteed to be unique.
  select * into strict v_row
  from public.mezmur_data_import
  where import_id = p_import_id and deleted_at is null
  for update;

  if p_expected_updated_at is not null
     and nullif(trim(v_row.updated_at), '') is not null
     and v_row.updated_at is distinct from p_expected_updated_at then
    raise exception 'Conflict: this mezmur was modified by another editor' using errcode = '40001';
  end if;
  if nullif(trim(coalesce(v_row.title, '')), '') is null
     or nullif(trim(coalesce(v_row.slug, '')), '') is null
     or nullif(trim(coalesce(v_row.lyrics_amharic, '')), '') is null then
    raise exception 'Title, slug, and Amharic lyrics are required to publish' using errcode = '23514';
  end if;

  -- Rights/review columns remain historical audit data. They are deliberately
  -- not fabricated, changed, or used as a publication blocker in the owner-
  -- authorized Draft/Published workflow.
  perform set_config('tewahedo.publication_via_rpc', 'on', true);
  update public.mezmur_data_import
  set status = 'published', updated_at = clock_timestamp()::text
  where import_id = p_import_id;
  perform set_config('tewahedo.publication_via_rpc', 'off', true);

  select count(*) into v_public_count
  from public.mezmur_public p
  where v_row.mezmur_id is not null and p.mezmur_id = v_row.mezmur_id;
  v_public_visible := v_public_count = 1;
  v_visibility_reason := case
    when v_public_visible then null
    when v_row.mezmur_id is null then 'mezmur_id is null; the public projection cannot identify this record'
    when v_public_count = 0 then 'published row is not present in mezmur_public (check view predicates, deleted_at, and public RLS)'
    else format('mezmur_public returned %s rows for mezmur_id; public identity is ambiguous', v_public_count)
  end;

  insert into public.mezmur_publication_events
    (mezmur_slug, event_type, previous_status, next_status, review_status, rights_status, actor_id, actor_role)
  values
    (v_row.slug, 'published', v_row.status, 'published', v_row.review_status, v_row.rights_status, v_actor, v_role);

  return jsonb_build_object(
    'import_id', p_import_id,
    'slug', v_row.slug,
    'status', 'published',
    'public_visible', v_public_visible,
    'public_row_count', v_public_count,
    'visibility_reason', v_visibility_reason
  );
end;
$$;

revoke all on function public.publish_mezmur_import(uuid, text) from public, anon;
grant execute on function public.publish_mezmur_import(uuid, text) to authenticated;

drop function if exists public.bulk_publish_mezmur_imports(uuid[]);
create function public.bulk_publish_mezmur_imports(p_import_ids uuid[])
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_actor uuid := auth.uid();
  v_role text;
  v_id uuid;
  v_m public.mezmur_data_import%rowtype;
  v_result jsonb;
  v_published integer := 0;
  v_skipped integer := 0;
  v_failed integer := 0;
  v_published_missing_public integer := 0;
  v_public_count integer := 0;
  v_results jsonb := '[]'::jsonb;
begin
  select role into v_role from public.profiles where id = v_actor;
  if v_actor is null or v_role <> 'super_admin' then
    raise exception 'Super Admin is required for bulk publication' using errcode = '42501';
  end if;
  if cardinality(coalesce(p_import_ids, '{}'::uuid[])) > 100 then
    raise exception 'Bulk publication is limited to 100 records per batch' using errcode = '22023';
  end if;

  foreach v_id in array coalesce(p_import_ids, '{}'::uuid[]) loop
    begin
      perform pg_advisory_xact_lock(hashtextextended('mezmur-bulk-publish:' || v_id::text, 0));
      select * into strict v_m
      from public.mezmur_data_import
      where import_id = v_id and deleted_at is null
      for update;

      if lower(trim(coalesce(v_m.status, ''))) = 'published' then
        select count(*) into v_public_count
        from public.mezmur_public p
        where v_m.mezmur_id is not null and p.mezmur_id = v_m.mezmur_id;
        if v_public_count = 1 then
          v_skipped := v_skipped + 1;
          v_results := v_results || jsonb_build_object('import_id', v_id, 'outcome', 'already_published_public', 'public_visible', true, 'public_row_count', v_public_count);
        else
          v_published_missing_public := v_published_missing_public + 1;
          v_results := v_results || jsonb_build_object('import_id', v_id, 'outcome', 'published_missing_public', 'public_visible', false, 'public_row_count', v_public_count, 'reason', case when v_m.mezmur_id is null then 'mezmur_id is null' when v_public_count = 0 then 'status is published but the row is absent from mezmur_public' else format('mezmur_public returned %s rows for mezmur_id', v_public_count) end);
        end if;
      else
        v_result := public.publish_mezmur_import(v_id, v_m.updated_at);
        v_published := v_published + 1;
        if coalesce((v_result->>'public_visible')::boolean, false) then
          v_results := v_results || jsonb_build_object('import_id', v_id, 'outcome', 'published', 'public_visible', true, 'result', v_result);
        else
          v_published_missing_public := v_published_missing_public + 1;
          v_results := v_results || jsonb_build_object('import_id', v_id, 'outcome', 'published_missing_public', 'public_visible', false, 'reason', coalesce(v_result->>'visibility_reason', 'published but not visible in mezmur_public'), 'result', v_result);
        end if;
      end if;
    exception when others then
      v_failed := v_failed + 1;
      v_results := v_results || jsonb_build_object('import_id', v_id, 'outcome', 'failed', 'sqlstate', sqlstate, 'reason', sqlerrm);
    end;
  end loop;

  return jsonb_build_object('published', v_published, 'published_missing_public', v_published_missing_public, 'skipped', v_skipped, 'failed', v_failed, 'results', v_results);
end;
$$;

revoke all on function public.bulk_publish_mezmur_imports(uuid[]) from public, anon;
grant execute on function public.bulk_publish_mezmur_imports(uuid[]) to authenticated;
notify pgrst, 'reload schema';
commit;
