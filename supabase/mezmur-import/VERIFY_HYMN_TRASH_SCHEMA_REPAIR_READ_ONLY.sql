-- Read-only post-activation verification for
-- 20261024200000_hymn_content_trash_schema_repair.sql.
begin read only;

-- Expected: 12 rows, three columns for each of four content tables.
select table_name, column_name, data_type
from information_schema.columns
where table_schema = 'public'
  and table_name in (
    'mezmur_data_import', 'zemaris',
    'mezmur_collections_import', 'mezmur_sections_import'
  )
  and column_name in ('deleted_at', 'deleted_by', 'deleted_from_status')
order by table_name, column_name;

-- Expected: all eight indexes present.
select indexname, indexdef
from pg_indexes
where schemaname = 'public'
  and indexname in (
    'mezmur_data_import_deleted_at_idx', 'zemaris_deleted_at_idx',
    'mezmur_collections_import_deleted_at_idx', 'mezmur_sections_import_deleted_at_idx',
    'mezmur_section_links_import_mezmur_slug_idx',
    'mezmur_section_links_import_section_slug_idx',
    'mezmur_category_links_import_mezmur_slug_idx',
    'mezmur_occasion_links_import_mezmur_slug_idx'
  )
order by indexname;

-- Expected: all four metadata guards enabled.
select event_object_table, trigger_name, action_timing, event_manipulation
from information_schema.triggers
where trigger_schema = 'public'
  and trigger_name like 'guard_%_trash_metadata'
order by event_object_table;

-- Expected: security_definer=true; anon=false; authenticated=true for the four
-- action RPCs. The trigger helper is not executable by clients.
select p.proname, pg_get_function_identity_arguments(p.oid) as arguments,
       p.prosecdef as security_definer,
       has_function_privilege('anon', p.oid, 'EXECUTE') as anon_can_execute,
       has_function_privilege('authenticated', p.oid, 'EXECUTE') as authenticated_can_execute
from pg_proc p
join pg_namespace n on n.oid = p.pronamespace
where n.nspname = 'public'
  and p.proname in (
    'trash_hymn_content', 'restore_hymn_content',
    'permanently_delete_hymn_content', 'reassign_and_delete_zemari',
    'guard_hymn_trash_metadata'
  )
order by p.proname;

-- Expected: RLS enabled on every content, relationship, and audit table.
select c.relname as table_name, c.relrowsecurity as rls_enabled,
       has_table_privilege('authenticated', c.oid, 'DELETE') as authenticated_direct_delete
from pg_class c
join pg_namespace n on n.oid = c.relnamespace
where n.nspname = 'public'
  and c.relname in (
    'mezmur_data_import', 'zemaris', 'mezmur_collections_import',
    'mezmur_sections_import', 'mezmur_section_links_import',
    'mezmur_category_links_import', 'mezmur_occasion_links_import',
    'content_deletion_events'
  )
order by c.relname;

select tablename, policyname, roles, cmd, qual, with_check
from pg_policies
where schemaname = 'public'
  and tablename in (
    'zemaris', 'mezmur_collections_import', 'mezmur_sections_import',
    'mezmur_section_links_import', 'mezmur_category_links_import',
    'mezmur_occasion_links_import', 'content_deletion_events'
  )
order by tablename, policyname;

-- Expected: zero. These are unsafe public-state combinations.
select mezmur_id, slug, status, deleted_at
from public.mezmur_data_import
where deleted_at is not null and lower(trim(coalesce(status, ''))) = 'published';

select id, slug, status, deleted_at
from public.zemaris
where deleted_at is not null and status = 'published';

select collection_id, collection_slug, status, deleted_at
from public.mezmur_collections_import
where deleted_at is not null and lower(trim(coalesce(status, ''))) = 'published';

select section_id, section_slug, status, deleted_at
from public.mezmur_sections_import
where deleted_at is not null and lower(trim(coalesce(status, ''))) = 'published';

-- Inventory only; no rows are changed.
select content_type, action, count(*) as event_count, max(created_at) as latest_event
from public.content_deletion_events
group by content_type, action
order by content_type, action;

rollback;
