-- READ ONLY: verify the Hymns Trash migration after applying it.
-- This script does not insert, update, delete, grant, or alter anything.

select table_name, column_name, data_type
from information_schema.columns
where table_schema = 'public'
  and table_name in ('mezmur_data_import', 'zemaris', 'mezmur_collections_import', 'mezmur_sections_import')
  and column_name in ('deleted_at', 'deleted_by', 'deleted_from_status')
order by table_name, column_name;

select p.proname,
       pg_get_function_identity_arguments(p.oid) as arguments,
       p.prosecdef as security_definer,
       has_function_privilege('anon', p.oid, 'EXECUTE') as anon_can_execute,
       has_function_privilege('authenticated', p.oid, 'EXECUTE') as authenticated_can_execute
from pg_proc p
join pg_namespace n on n.oid = p.pronamespace
where n.nspname = 'public'
  and p.proname in (
    'trash_hymn_content',
    'restore_hymn_content',
    'permanently_delete_hymn_content',
    'reassign_and_delete_zemari'
  )
order by p.proname;

select c.relname as table_name,
       c.relrowsecurity as rls_enabled,
       has_table_privilege('authenticated', c.oid, 'DELETE') as authenticated_direct_delete
from pg_class c
join pg_namespace n on n.oid = c.relnamespace
where n.nspname = 'public'
  and c.relname in (
    'mezmur_data_import', 'zemaris', 'mezmur_collections_import',
    'mezmur_sections_import', 'content_deletion_events'
  )
order by c.relname;

select content_type, action, count(*) as event_count, max(created_at) as latest_event
from public.content_deletion_events
group by content_type, action
order by content_type, action;

select 'mezmur' as content_type, count(*) as trashed_count from public.mezmur_data_import where deleted_at is not null
union all
select 'zemari', count(*) from public.zemaris where deleted_at is not null
union all
select 'collection', count(*) from public.mezmur_collections_import where deleted_at is not null
union all
select 'section', count(*) from public.mezmur_sections_import where deleted_at is not null;

select tc.constraint_name, kcu.column_name, ccu.table_name as referenced_table,
       rc.delete_rule
from information_schema.table_constraints tc
join information_schema.key_column_usage kcu
  on tc.constraint_name = kcu.constraint_name and tc.constraint_schema = kcu.constraint_schema
join information_schema.constraint_column_usage ccu
  on ccu.constraint_name = tc.constraint_name and ccu.constraint_schema = tc.constraint_schema
join information_schema.referential_constraints rc
  on rc.constraint_name = tc.constraint_name and rc.constraint_schema = tc.constraint_schema
where tc.table_schema = 'public'
  and tc.table_name = 'mezmur_data_import'
  and tc.constraint_type = 'FOREIGN KEY'
  and kcu.column_name = 'zemari_id';
