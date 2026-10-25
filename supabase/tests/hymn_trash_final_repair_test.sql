\set ON_ERROR_STOP on

-- The migration ran against a schema where import_id was initially absent.
-- Every pre-existing row must survive and receive one unique immutable key.
do $$ begin
  if (select count(*) from public.mezmur_data_import where mezmur_id = 'legacy-duplicate') <> 2
    or (select count(distinct import_id) from public.mezmur_data_import where mezmur_id = 'legacy-duplicate') <> 2
    or exists (select 1 from public.mezmur_data_import where import_id is null) then
    raise exception 'legacy Mezmur UUID backfill lost rows or produced invalid identifiers';
  end if;
  if (select count(*) from public.mezmur_collections_import where collection_id = 'legacy-duplicate') <> 2
    or (select count(distinct import_id) from public.mezmur_collections_import where collection_id = 'legacy-duplicate') <> 2
    or exists (select 1 from public.mezmur_collections_import where import_id is null) then
    raise exception 'legacy collection UUID backfill lost rows or produced invalid identifiers';
  end if;
  if (select count(*) from public.mezmur_sections_import where section_id = 'legacy-duplicate') <> 2
    or (select count(distinct import_id) from public.mezmur_sections_import where section_id = 'legacy-duplicate') <> 2
    or exists (select 1 from public.mezmur_sections_import where import_id is null) then
    raise exception 'legacy section UUID backfill lost rows or produced invalid identifiers';
  end if;
  if not exists (
    select 1 from public.mezmur_data_import
    where mezmur_id = 'historical-published'
      and status = 'published'
      and lyrics_amharic is null
      and import_id is not null
  ) then
    raise exception 'historical published Mezmur was changed or its partial UUID was not repaired';
  end if;
end $$;

-- The existing 17-column view contract must remain byte-for-byte compatible
-- at the column boundary, with Trash metadata appended at positions 18-20.
do $$
declare
  v_names text[];
  v_types text[];
begin
  select array_agg(a.attname order by a.attnum),
         array_agg(format_type(a.atttypid, a.atttypmod) order by a.attnum)
    into v_names, v_types
  from pg_attribute a
  where a.attrelid = 'public.zemaris_with_counts'::regclass
    and a.attnum > 0 and not a.attisdropped;
  if cardinality(v_names) <> 20
     or v_names[16:20] is distinct from array[
       'mezmur_count','published_mezmur_count','deleted_at','deleted_by','deleted_from_status'
     ]::text[]
     or v_types[16:20] is distinct from array[
       'bigint','bigint','timestamp with time zone','uuid','text'
     ]::text[] then
    raise exception 'zemaris_with_counts contract changed unexpectedly: % (%)', v_names, v_types;
  end if;
end $$;

-- Publication-relevant edits to an invalid historical published row remain
-- protected even though import_id-only maintenance is allowed.
do $$ begin
  begin
    update public.mezmur_data_import
    set title = 'Changed historical title'
    where mezmur_id = 'historical-published';
    raise exception 'publication-relevant historical edit unexpectedly bypassed validation';
  exception when check_violation then null;
  end;
end $$;

insert into auth.users(id) values
  ('10000000-0000-0000-0000-000000000001'),
  ('10000000-0000-0000-0000-000000000002'),
  ('10000000-0000-0000-0000-000000000003'),
  ('10000000-0000-0000-0000-000000000004');
insert into public.profiles(id, role) values
  ('10000000-0000-0000-0000-000000000001', 'admin'),
  ('10000000-0000-0000-0000-000000000002', 'super_admin'),
  ('10000000-0000-0000-0000-000000000003', 'editor'),
  ('10000000-0000-0000-0000-000000000004', 'user');

insert into public.zemaris(id, slug, name, status) values
  ('20000000-0000-0000-0000-000000000001', 'source-zemari', 'Source Zemari', 'published'),
  ('20000000-0000-0000-0000-000000000002', 'target-zemari', 'Target Zemari', 'published');
insert into public.mezmur_collections_import(import_id, collection_id, collection_slug, title, status)
values ('40000000-0000-0000-0000-000000000001', 'collection-1', 'collection-1', 'Collection One', 'published');
insert into public.mezmur_sections_import(import_id, section_id, section_slug, collection_slug, title, status)
values ('50000000-0000-0000-0000-000000000001', 'section-1', 'section-1', 'collection-1', 'Section One', 'published');
select set_config('tewahedo.publication_via_rpc', 'on', false);
select set_config('tewahedo.approval_via_rpc', 'on', false);
insert into public.mezmur_data_import(
  import_id, mezmur_id, slug, title, lyrics_amharic, status, zemari_id,
  singer_id, singer_slug, singer_name, rights_status,
  publication_approved_at, publication_approved_by, updated_at
) values (
  '30000000-0000-0000-0000-000000000001', 'mezmur-1', 'mezmur-1',
  'Mezmur One', 'የሙከራ ግጥም', 'published',
  '20000000-0000-0000-0000-000000000001', 'source-zemari',
  'source-zemari', 'Source Zemari', 'owned', now(),
  '10000000-0000-0000-0000-000000000002', now()::text
);
select set_config('tewahedo.publication_via_rpc', 'off', false);
select set_config('tewahedo.approval_via_rpc', 'off', false);
insert into public.mezmur_section_links_import(mezmur_slug, section_slug) values ('mezmur-1', 'section-1');
insert into public.mezmur_category_links_import(mezmur_slug, category_slug) values ('mezmur-1', 'category-1');
insert into public.mezmur_occasion_links_import(mezmur_slug, occasion_slug) values ('mezmur-1', 'occasion-1');

-- Anonymous users see only the live projection and cannot execute actions.
set role anon;
select set_config('request.jwt.claim.sub', '', false);
select set_config('request.jwt.claim.role', 'anon', false);
do $$ begin
  if (select count(*) from public.mezmur_public where slug = 'mezmur-1') <> 1 then
    raise exception 'published Mezmur missing from public projection';
  end if;
  begin
    perform public.trash_hymn_content('mezmur', '30000000-0000-0000-0000-000000000001');
    raise exception 'anonymous Trash unexpectedly succeeded';
  exception when insufficient_privilege then null;
  end;
end $$;
reset role;

-- Regular users and editors cannot Trash.
set role authenticated;
select set_config('request.jwt.claim.role', 'authenticated', false);
select set_config('request.jwt.claim.sub', '10000000-0000-0000-0000-000000000004', false);
do $$ begin
  begin
    perform public.trash_hymn_content('mezmur', '30000000-0000-0000-0000-000000000001');
    raise exception 'regular-user Trash unexpectedly succeeded';
  exception when insufficient_privilege then null;
  end;
end $$;
select set_config('request.jwt.claim.sub', '10000000-0000-0000-0000-000000000003', false);
do $$ begin
  begin
    perform public.trash_hymn_content('mezmur', '30000000-0000-0000-0000-000000000001');
    raise exception 'editor Trash unexpectedly succeeded';
  exception when insufficient_privilege then null;
  end;
end $$;

-- Slugs and legacy IDs are deliberately rejected for destructive actions.
select set_config('request.jwt.claim.sub', '10000000-0000-0000-0000-000000000001', false);
do $$ begin
  begin
    perform public.trash_hymn_content('mezmur', 'mezmur-1');
    raise exception 'non-UUID destructive identifier unexpectedly succeeded';
  exception when invalid_parameter_value then null;
  end;
end $$;

-- Admin Trash preserves all associations, stores the former status, and hides
-- the row from the public view immediately.
select public.trash_hymn_content('mezmur', '30000000-0000-0000-0000-000000000001');
do $$ begin
  if not exists (select 1 from public.mezmur_data_import
    where import_id = '30000000-0000-0000-0000-000000000001'
      and deleted_at is not null and deleted_from_status = 'published' and status = 'draft') then
    raise exception 'Trash metadata/status is incorrect';
  end if;
  if exists (select 1 from public.mezmur_public where slug = 'mezmur-1') then
    raise exception 'trashed Mezmur remained public';
  end if;
  if (select count(*) from public.mezmur_section_links_import where mezmur_slug = 'mezmur-1') <> 1
    or (select count(*) from public.mezmur_category_links_import where mezmur_slug = 'mezmur-1') <> 1
    or (select count(*) from public.mezmur_occasion_links_import where mezmur_slug = 'mezmur-1') <> 1 then
    raise exception 'Trash removed associations required for restoration';
  end if;
  begin
    update public.mezmur_data_import set deleted_at = null
      where import_id = '30000000-0000-0000-0000-000000000001';
    raise exception 'direct Trash metadata update unexpectedly succeeded';
  exception when insufficient_privilege then null;
  end;
end $$;

-- Restore always returns a Draft, never the previous Published state.
select public.restore_hymn_content('mezmur', '30000000-0000-0000-0000-000000000001');
do $$ begin
  if not exists (select 1 from public.mezmur_data_import
    where import_id = '30000000-0000-0000-0000-000000000001'
      and deleted_at is null and status = 'draft') then
    raise exception 'restore did not return Draft';
  end if;
  if not exists (select 1 from public.content_deletion_events
    where content_key = '30000000-0000-0000-0000-000000000001'
      and action = 'restored' and previous_status = 'published') then
    raise exception 'restore audit lost the former publication status';
  end if;
end $$;

-- Publication remains the existing guarded two-state workflow.
select set_config('request.jwt.claim.sub', '10000000-0000-0000-0000-000000000002', false);
select public.publish_mezmur_import('mezmur-1',
  (select updated_at from public.mezmur_data_import
   where import_id = '30000000-0000-0000-0000-000000000001'));
select set_config('request.jwt.claim.sub', '10000000-0000-0000-0000-000000000001', false);
select public.trash_hymn_content('mezmur', '30000000-0000-0000-0000-000000000001');

-- Admin and editor cannot permanently delete; Super Admin can.
do $$ begin
  begin
    perform public.permanently_delete_hymn_content('mezmur', '30000000-0000-0000-0000-000000000001');
    raise exception 'admin permanent delete unexpectedly succeeded';
  exception when insufficient_privilege then null;
  end;
end $$;
select set_config('request.jwt.claim.sub', '10000000-0000-0000-0000-000000000003', false);
do $$ begin
  begin
    perform public.permanently_delete_hymn_content('mezmur', '30000000-0000-0000-0000-000000000001');
    raise exception 'editor permanent delete unexpectedly succeeded';
  exception when insufficient_privilege then null;
  end;
end $$;
select set_config('request.jwt.claim.sub', '10000000-0000-0000-0000-000000000002', false);
select public.permanently_delete_hymn_content('mezmur', '30000000-0000-0000-0000-000000000001');
do $$ begin
  if exists (select 1 from public.mezmur_data_import where import_id = '30000000-0000-0000-0000-000000000001') then
    raise exception 'permanent delete failed';
  end if;
  if not exists (select 1 from public.zemaris where id = '20000000-0000-0000-0000-000000000001') then
    raise exception 'Mezmur deletion removed its shared Zemari';
  end if;
  if exists (select 1 from public.mezmur_section_links_import where mezmur_slug = 'mezmur-1')
    or exists (select 1 from public.mezmur_category_links_import where mezmur_slug = 'mezmur-1')
    or exists (select 1 from public.mezmur_occasion_links_import where mezmur_slug = 'mezmur-1') then
    raise exception 'owned association rows remain after permanent deletion';
  end if;
end $$;

-- Zemari reassignment preserves every Mezmur.
insert into public.mezmur_data_import(import_id, mezmur_id, slug, title, status, zemari_id, updated_at)
values ('30000000-0000-0000-0000-000000000002', 'mezmur-2', 'mezmur-2', 'Mezmur Two',
  'draft', '20000000-0000-0000-0000-000000000001', now()::text);
select public.trash_hymn_content('zemari', '20000000-0000-0000-0000-000000000001');
do $$ begin
  begin
    perform public.permanently_delete_hymn_content('zemari', '20000000-0000-0000-0000-000000000001');
    raise exception 'referenced Zemari deletion unexpectedly succeeded';
  exception when foreign_key_violation then null;
  end;
end $$;
select public.reassign_and_delete_zemari(
  '20000000-0000-0000-0000-000000000001',
  '20000000-0000-0000-0000-000000000002');
do $$ begin
  if not exists (select 1 from public.mezmur_data_import
    where import_id = '30000000-0000-0000-0000-000000000002'
      and zemari_id = '20000000-0000-0000-0000-000000000002') then
    raise exception 'Zemari reassignment lost or failed to move a Mezmur';
  end if;
end $$;

-- Collections cannot cascade into sections. Section deletion removes only its
-- own links and preserves unrelated Mezmurs and shared taxonomy.
select public.trash_hymn_content('collection', '40000000-0000-0000-0000-000000000001');
do $$ begin
  begin
    perform public.permanently_delete_hymn_content('collection', '40000000-0000-0000-0000-000000000001');
    raise exception 'collection cascade unexpectedly succeeded';
  exception when foreign_key_violation then null;
  end;
end $$;
select public.restore_hymn_content('collection', '40000000-0000-0000-0000-000000000001');
select public.trash_hymn_content('section', '50000000-0000-0000-0000-000000000001');
select public.permanently_delete_hymn_content('section', '50000000-0000-0000-0000-000000000001');
do $$ begin
  if not exists (select 1 from public.mezmur_data_import where import_id = '30000000-0000-0000-0000-000000000002') then
    raise exception 'section deletion removed an unrelated Mezmur';
  end if;
  if exists (select 1 from information_schema.columns where table_schema = 'public'
    and table_name = 'mezmur_data_import' and column_name in (
      'structured_lyrics','lyrics_language','source_info','external_lyrics_url','last_verified_at','related_content')) then
    raise exception 'a permanently removed Mezmur field was recreated';
  end if;
end $$;

reset role;
select 'hymn trash final repair integration test passed' as result;
