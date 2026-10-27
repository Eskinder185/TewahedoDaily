-- Forward-only repair for publication result reporting.
--
-- The deployed mezmur_public projection predates import_id and cannot expose
-- that column without changing its consumer contract.  Visibility is therefore
-- verified against the exact source row's published view predicates, using a
-- unique mezmur_id when present and a uniqueness-checked slug fallback when
-- legacy mezmur_id is NULL.  Duplicate slugs are never treated as visible.
begin;

do $$
begin
  if to_regclass('public.mezmur_data_import') is null
     or to_regclass('public.mezmur_public') is null then
    raise exception 'Publication visibility repair requires public.mezmur_data_import and public.mezmur_public' using errcode = '42P01';
  end if;
end;
$$;

drop function if exists public.mezmur_import_public_visibility(uuid);
create function public.mezmur_import_public_visibility(p_import_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_row public.mezmur_data_import%rowtype;
  v_slug text;
  v_source_slug_count integer := 0;
  v_public_slug_count integer := 0;
  v_public_id_count integer := 0;
  v_visible boolean := false;
  v_reason text;
begin
  -- This helper is intentionally internal.  It has no EXECUTE grant for
  -- PUBLIC, anon, or authenticated; only the owner and the two protected
  -- publication RPCs can call it.  Do not grant it to the browser role.
  select * into strict v_row
    from public.mezmur_data_import
   where import_id = p_import_id;

  if lower(trim(coalesce(v_row.status, ''))) <> 'published'
     or v_row.deleted_at is not null then
    return jsonb_build_object(
      'import_id', p_import_id,
      'public_visible', false,
      'public_row_count', 0,
      'visibility_reason', 'source row is not an active published record'
    );
  end if;

  v_slug := lower(trim(coalesce(v_row.slug, '')));
  if nullif(trim(coalesce(v_row.title, '')), '') is null or v_slug = '' then
    return jsonb_build_object(
      'import_id', p_import_id,
      'public_visible', false,
      'public_row_count', 0,
      'visibility_reason', 'public projection requires a nonempty title and slug'
    );
  end if;

  if v_row.mezmur_id is not null then
    select count(*) into v_public_id_count
      from public.mezmur_public p
     where p.status = 'published'
       and p.mezmur_id = v_row.mezmur_id;
    if v_public_id_count = 1 then
      v_visible := true;
    elsif v_public_id_count > 1 then
      v_reason := 'multiple public rows share the same mezmur_id';
    end if;
  end if;

  -- Legacy rows with NULL mezmur_id can still be verified safely when the
  -- normalized slug is unique on both sides of the projection. A non-null
  -- identity that is absent from the view remains a genuine visibility miss;
  -- it must never fall back to another record's slug.
  if not v_visible and v_row.mezmur_id is null then
    select count(*) into v_source_slug_count
      from public.mezmur_data_import m
     where m.deleted_at is null
       and lower(trim(coalesce(m.status, ''))) = 'published'
       and lower(trim(coalesce(m.slug, ''))) = v_slug;
    select count(*) into v_public_slug_count
      from public.mezmur_public p
     where p.status = 'published'
       and lower(trim(coalesce(p.slug, ''))) = v_slug;
    if v_source_slug_count = 1 and v_public_slug_count = 1 then
      v_visible := true;
      v_reason := null;
    elsif v_source_slug_count > 1 or v_public_slug_count > 1 then
      v_reason := 'duplicate normalized slug makes public identity ambiguous';
    else
      v_reason := 'published row is absent from mezmur_public';
    end if;
  end if;

  return jsonb_build_object(
    'import_id', p_import_id,
    'public_visible', v_visible,
    'public_row_count', case when v_visible then 1 else greatest(v_public_id_count, v_public_slug_count) end,
    'visibility_reason', case when v_visible then null else coalesce(v_reason, 'published row is absent from mezmur_public') end
  );
end;
$$;

revoke all on function public.mezmur_import_public_visibility(uuid) from public, anon, authenticated;

-- Keep publication validation language-agnostic.  A Mezmur may have lyrics in
-- Amharic, Ge'ez, English, Oromo, or transliteration (or be a media-only
-- record with a YouTube URL).  Historical audit fields remain untouched.
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
  v_content_changed boolean;
  v_has_hymn_content boolean;
begin
  if tg_op = 'INSERT' then
    v_content_changed := true;
  else
    v_content_changed := old.status is distinct from new.status
      or old.title is distinct from new.title
      or old.slug is distinct from new.slug
      or old.lyrics_amharic is distinct from new.lyrics_amharic
      or old.lyrics_transliteration is distinct from new.lyrics_transliteration
      or old.lyrics_english is distinct from new.lyrics_english
      or old.lyrics_geez is distinct from new.lyrics_geez
      or old.lyrics_oromo is distinct from new.lyrics_oromo
      or old.youtube_url is distinct from new.youtube_url;
  end if;
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
  if new.status = 'published' and v_content_changed then
    v_has_hymn_content :=
      nullif(trim(coalesce(new.lyrics_amharic, '')), '') is not null
      or nullif(trim(coalesce(new.lyrics_transliteration, '')), '') is not null
      or nullif(trim(coalesce(new.lyrics_english, '')), '') is not null
      or nullif(trim(coalesce(new.lyrics_geez, '')), '') is not null
      or nullif(trim(coalesce(new.lyrics_oromo, '')), '') is not null
      or nullif(trim(coalesce(new.youtube_url, '')), '') is not null;
    if nullif(trim(coalesce(new.title, '')), '') is null
       or nullif(trim(coalesce(new.slug, '')), '') is null
       or not v_has_hymn_content then
      raise exception 'Title, slug, and at least one supported lyrics field or YouTube URL are required to publish' using errcode = '23514';
    end if;
  end if;
  return new;
end;
$$;

revoke all on function public.guard_mezmur_import_publication() from public, anon, authenticated;
drop trigger if exists mezmur_data_import_publication_guard on public.mezmur_data_import;
create trigger mezmur_data_import_publication_guard
before insert or update on public.mezmur_data_import
for each row execute function public.guard_mezmur_import_publication();

create or replace function public.publish_mezmur_import(
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
  v_visibility jsonb;
begin
  select role::text into v_role from public.profiles where id = v_actor;
  if v_actor is null or v_role not in ('editor', 'admin', 'super_admin') then
    raise exception 'An editor, admin, or super admin role is required to publish' using errcode = '42501';
  end if;
  if p_import_id is null then
    raise exception 'Stable Mezmur import_id is required' using errcode = '22023';
  end if;

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
     or (
       nullif(trim(coalesce(v_row.lyrics_amharic, '')), '') is null
       and nullif(trim(coalesce(v_row.lyrics_transliteration, '')), '') is null
       and nullif(trim(coalesce(v_row.lyrics_english, '')), '') is null
       and nullif(trim(coalesce(v_row.lyrics_geez, '')), '') is null
       and nullif(trim(coalesce(v_row.lyrics_oromo, '')), '') is null
       and nullif(trim(coalesce(v_row.youtube_url, '')), '') is null
     ) then
    raise exception 'Title, slug, and at least one supported lyrics field or YouTube URL are required to publish' using errcode = '23514';
  end if;

  perform set_config('tewahedo.publication_via_rpc', 'on', true);
  update public.mezmur_data_import
     set status = 'published', updated_at = clock_timestamp()::text
   where import_id = p_import_id;
  perform set_config('tewahedo.publication_via_rpc', 'off', true);

  v_visibility := public.mezmur_import_public_visibility(p_import_id);

  insert into public.mezmur_publication_events
    (mezmur_slug, event_type, previous_status, next_status, review_status, rights_status, actor_id, actor_role)
  values
    (v_row.slug, 'published', v_row.status, 'published', v_row.review_status, v_row.rights_status, v_actor, v_role);

  return jsonb_build_object(
    'import_id', p_import_id,
    'slug', v_row.slug,
    'status', 'published',
    'public_visible', coalesce((v_visibility->>'public_visible')::boolean, false),
    'public_row_count', coalesce((v_visibility->>'public_row_count')::integer, 0),
    'visibility_reason', v_visibility->>'visibility_reason'
  );
end;
$$;

revoke all on function public.publish_mezmur_import(uuid, text) from public, anon;
grant execute on function public.publish_mezmur_import(uuid, text) to authenticated;

create or replace function public.bulk_publish_mezmur_imports(p_import_ids uuid[])
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
  v_visibility jsonb;
  v_published integer := 0;
  v_skipped integer := 0;
  v_failed integer := 0;
  v_published_missing_public integer := 0;
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
        v_visibility := public.mezmur_import_public_visibility(v_id);
        if coalesce((v_visibility->>'public_visible')::boolean, false) then
          v_skipped := v_skipped + 1;
          v_results := v_results || jsonb_build_object('import_id', v_id, 'outcome', 'already_published_public', 'public_visible', true, 'public_row_count', (v_visibility->>'public_row_count')::integer);
        else
          v_published_missing_public := v_published_missing_public + 1;
          v_results := v_results || jsonb_build_object('import_id', v_id, 'outcome', 'published_missing_public', 'public_visible', false, 'public_row_count', (v_visibility->>'public_row_count')::integer, 'reason', v_visibility->>'visibility_reason');
        end if;
      else
        v_result := public.publish_mezmur_import(v_id, v_m.updated_at);
        if coalesce((v_result->>'public_visible')::boolean, false) then
          v_published := v_published + 1;
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
