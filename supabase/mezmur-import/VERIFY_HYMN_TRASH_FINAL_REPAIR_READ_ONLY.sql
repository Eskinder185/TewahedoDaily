-- Read-only verification for 20261024220000_hymn_trash_final_repair.sql.
-- Every result row should report PASS.
begin read only;

with checks(name, passed, detail) as (
  values
  (
    '12 Trash metadata columns',
    (select count(*) = 12 from information_schema.columns
      where table_schema = 'public'
        and table_name in ('mezmur_data_import','zemaris','mezmur_collections_import','mezmur_sections_import')
        and column_name in ('deleted_at','deleted_by','deleted_from_status')),
    (select count(*)::text || '/12 present' from information_schema.columns
      where table_schema = 'public'
        and table_name in ('mezmur_data_import','zemaris','mezmur_collections_import','mezmur_sections_import')
        and column_name in ('deleted_at','deleted_by','deleted_from_status'))
  ),
  ('audit table', to_regclass('public.content_deletion_events') is not null,
    coalesce(to_regclass('public.content_deletion_events')::text, 'missing')),
  ('trash_hymn_content(text,text)', to_regprocedure('public.trash_hymn_content(text,text)') is not null,
    coalesce(to_regprocedure('public.trash_hymn_content(text,text)')::text, 'missing')),
  ('restore_hymn_content(text,text)', to_regprocedure('public.restore_hymn_content(text,text)') is not null,
    coalesce(to_regprocedure('public.restore_hymn_content(text,text)')::text, 'missing')),
  ('permanently_delete_hymn_content(text,text)', to_regprocedure('public.permanently_delete_hymn_content(text,text)') is not null,
    coalesce(to_regprocedure('public.permanently_delete_hymn_content(text,text)')::text, 'missing')),
  ('reassign_and_delete_zemari(uuid,uuid)', to_regprocedure('public.reassign_and_delete_zemari(uuid,uuid)') is not null,
    coalesce(to_regprocedure('public.reassign_and_delete_zemari(uuid,uuid)')::text, 'missing')),
  (
    'four metadata guard triggers',
    (select count(*) = 4 from pg_trigger
      where not tgisinternal and tgname in (
        'guard_mezmur_data_import_trash_metadata','guard_zemaris_trash_metadata',
        'guard_mezmur_collections_import_trash_metadata','guard_mezmur_sections_import_trash_metadata')),
    (select count(*)::text || '/4 enabled' from pg_trigger
      where not tgisinternal and tgenabled <> 'D' and tgname in (
        'guard_mezmur_data_import_trash_metadata','guard_zemaris_trash_metadata',
        'guard_mezmur_collections_import_trash_metadata','guard_mezmur_sections_import_trash_metadata'))
  ),
  (
    'required indexes',
    (select count(*) = 12 from pg_indexes where schemaname = 'public' and indexname in (
      'mezmur_data_import_deleted_at_idx','zemaris_deleted_at_idx',
      'mezmur_collections_import_deleted_at_idx','mezmur_sections_import_deleted_at_idx',
      'mezmur_data_import_import_id_uidx','mezmur_collections_import_import_id_uidx',
      'mezmur_sections_import_import_id_uidx','mezmur_section_links_import_mezmur_slug_idx',
      'mezmur_section_links_import_section_slug_idx','mezmur_category_links_import_mezmur_slug_idx',
      'mezmur_occasion_links_import_mezmur_slug_idx','content_deletion_events_content_created_idx')),
    (select count(*)::text || '/12 present' from pg_indexes where schemaname = 'public' and indexname in (
      'mezmur_data_import_deleted_at_idx','zemaris_deleted_at_idx',
      'mezmur_collections_import_deleted_at_idx','mezmur_sections_import_deleted_at_idx',
      'mezmur_data_import_import_id_uidx','mezmur_collections_import_import_id_uidx',
      'mezmur_sections_import_import_id_uidx','mezmur_section_links_import_mezmur_slug_idx',
      'mezmur_section_links_import_section_slug_idx','mezmur_category_links_import_mezmur_slug_idx',
      'mezmur_occasion_links_import_mezmur_slug_idx','content_deletion_events_content_created_idx'))
  ),
  (
    'RLS enabled on eight tables',
    (select count(*) = 8 from pg_class c join pg_namespace n on n.oid = c.relnamespace
      where n.nspname = 'public' and c.relrowsecurity and c.relname in (
        'mezmur_data_import','zemaris','mezmur_collections_import','mezmur_sections_import',
        'mezmur_section_links_import','mezmur_category_links_import','mezmur_occasion_links_import',
        'content_deletion_events')),
    (select count(*)::text || '/8 enabled' from pg_class c join pg_namespace n on n.oid = c.relnamespace
      where n.nspname = 'public' and c.relrowsecurity and c.relname in (
        'mezmur_data_import','zemaris','mezmur_collections_import','mezmur_sections_import',
        'mezmur_section_links_import','mezmur_category_links_import','mezmur_occasion_links_import',
        'content_deletion_events'))
  ),
  (
    'no authenticated direct content delete',
    not has_table_privilege('authenticated','public.mezmur_data_import','DELETE')
      and not has_table_privilege('authenticated','public.zemaris','DELETE')
      and not has_table_privilege('authenticated','public.mezmur_collections_import','DELETE')
      and not has_table_privilege('authenticated','public.mezmur_sections_import','DELETE'),
    'authenticated DELETE must be false for all four content tables'
  ),
  (
    'RPC execute privileges',
    has_function_privilege('authenticated','public.trash_hymn_content(text,text)','EXECUTE')
      and has_function_privilege('authenticated','public.restore_hymn_content(text,text)','EXECUTE')
      and has_function_privilege('authenticated','public.permanently_delete_hymn_content(text,text)','EXECUTE')
      and has_function_privilege('authenticated','public.reassign_and_delete_zemari(uuid,uuid)','EXECUTE')
      and not has_function_privilege('anon','public.trash_hymn_content(text,text)','EXECUTE')
      and not has_function_privilege('anon','public.restore_hymn_content(text,text)','EXECUTE')
      and not has_function_privilege('anon','public.permanently_delete_hymn_content(text,text)','EXECUTE')
      and not has_function_privilege('anon','public.reassign_and_delete_zemari(uuid,uuid)','EXECUTE'),
    'authenticated=true and anon=false for all four action RPCs'
  ),
  (
    'security-definer action RPCs',
    (select count(*) = 4 from pg_proc p join pg_namespace n on n.oid = p.pronamespace
      where n.nspname = 'public' and p.prosecdef and p.proname in (
        'trash_hymn_content','restore_hymn_content',
        'permanently_delete_hymn_content','reassign_and_delete_zemari')),
    'four action RPCs must be SECURITY DEFINER'
  ),
  (
    'publication guard ignores unrelated metadata updates',
    position('v_validate_publication' in pg_get_functiondef(
      'public.guard_mezmur_import_publication()'::regprocedure)) > 0
      and position('new.title is distinct from old.title' in pg_get_functiondef(
        'public.guard_mezmur_import_publication()'::regprocedure)) > 0
      and position('new.lyrics_amharic is distinct from old.lyrics_amharic' in pg_get_functiondef(
        'public.guard_mezmur_import_publication()'::regprocedure)) > 0,
    'guard must validate publication transitions/relevant edits, not import_id-only updates'
  ),
  (
    'public view excludes deleted rows',
    position('deleted_at is null' in lower(pg_get_viewdef('public.mezmur_public'::regclass, true))) > 0,
    pg_get_viewdef('public.mezmur_public'::regclass, true)
  ),
  (
    'zemaris_with_counts preserves and appends its contract',
    (select count(*) = 5
       from information_schema.columns c
       join (values
         (16, 'mezmur_count', 'bigint'),
         (17, 'published_mezmur_count', 'bigint'),
         (18, 'deleted_at', 'timestamp with time zone'),
         (19, 'deleted_by', 'uuid'),
         (20, 'deleted_from_status', 'text')
       ) expected(ordinal_position, column_name, data_type)
         using (ordinal_position, column_name, data_type)
      where c.table_schema = 'public' and c.table_name = 'zemaris_with_counts'),
    'positions 16-20 must be mezmur_count bigint, published_mezmur_count bigint, then Trash metadata'
  ),
  (
    'six removed Mezmur fields remain absent',
    (select count(*) = 0 from information_schema.columns
      where table_schema = 'public' and table_name = 'mezmur_data_import'
        and column_name in (
          'structured_lyrics','lyrics_language','source_info','external_lyrics_url',
          'last_verified_at','related_content')),
    (select count(*)::text || ' forbidden columns present' from information_schema.columns
      where table_schema = 'public' and table_name = 'mezmur_data_import'
        and column_name in (
          'structured_lyrics','lyrics_language','source_info','external_lyrics_url',
          'last_verified_at','related_content'))
  ),
  (
    'stable UUID columns installed',
    (select count(*) = 3 from information_schema.columns
      where table_schema = 'public'
        and table_name in ('mezmur_data_import','mezmur_collections_import','mezmur_sections_import')
        and column_name = 'import_id' and data_type = 'uuid'
        and is_nullable = 'NO' and column_default ilike '%gen_random_uuid%'),
    (select count(*)::text || '/3 UUID NOT NULL DEFAULT columns present'
      from information_schema.columns
      where table_schema = 'public'
        and table_name in ('mezmur_data_import','mezmur_collections_import','mezmur_sections_import')
        and column_name = 'import_id' and data_type = 'uuid'
        and is_nullable = 'NO' and column_default ilike '%gen_random_uuid%')
  ),
  (
    'stable import identifiers are unique and non-null',
    not exists (
      select import_id from public.mezmur_data_import group by import_id having import_id is null or count(*) > 1
    ) and not exists (
      select import_id from public.mezmur_collections_import group by import_id having import_id is null or count(*) > 1
    ) and not exists (
      select import_id from public.mezmur_sections_import group by import_id having import_id is null or count(*) > 1
    ),
    'no null or duplicate import_id values in the three import tables'
  ),
  (
    'no deleted published content',
    not exists (select 1 from public.mezmur_data_import
      where deleted_at is not null and lower(trim(coalesce(status,''))) = 'published')
      and not exists (select 1 from public.zemaris
        where deleted_at is not null and status = 'published')
      and not exists (select 1 from public.mezmur_collections_import
        where deleted_at is not null and lower(trim(coalesce(status,''))) = 'published')
      and not exists (select 1 from public.mezmur_sections_import
        where deleted_at is not null and lower(trim(coalesce(status,''))) = 'published'),
    'all soft-deleted rows must be non-published'
  )
)
select case when passed then 'PASS' else 'FAIL' end as result, name, detail
from checks
order by name;

-- Human-review details: exact overloads, policies, and action-function bodies.
select p.proname, pg_get_function_identity_arguments(p.oid) as arguments,
       p.prosecdef as security_definer,
       has_function_privilege('anon', p.oid, 'EXECUTE') as anon_execute,
       has_function_privilege('authenticated', p.oid, 'EXECUTE') as authenticated_execute
from pg_proc p join pg_namespace n on n.oid = p.pronamespace
where n.nspname = 'public' and p.proname in (
  'trash_hymn_content','restore_hymn_content',
  'permanently_delete_hymn_content','reassign_and_delete_zemari')
order by p.proname, arguments;

select tablename, policyname, roles, cmd, qual, with_check
from pg_policies
where schemaname = 'public' and tablename in (
  'mezmur_data_import','zemaris','mezmur_collections_import','mezmur_sections_import',
  'mezmur_section_links_import','mezmur_category_links_import','mezmur_occasion_links_import',
  'content_deletion_events')
order by tablename, policyname;

rollback;
