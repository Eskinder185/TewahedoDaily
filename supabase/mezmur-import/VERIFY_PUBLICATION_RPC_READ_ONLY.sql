-- Read-only production verification. Run in Supabase SQL Editor as an
-- authorized database administrator or staff session. Do not run via anon.

select
  n.nspname as schema_name,
  p.proname as function_name,
  pg_get_function_identity_arguments(p.oid) as identity_arguments,
  pg_get_function_arguments(p.oid) as arguments,
  has_function_privilege('authenticated', p.oid, 'EXECUTE') as authenticated_can_execute,
  has_function_privilege('anon', p.oid, 'EXECUTE') as anon_can_execute
from pg_proc p
join pg_namespace n on n.oid = p.pronamespace
where n.nspname = 'public'
  and p.proname in ('publish_mezmur_import', 'bulk_publish_mezmur_imports')
order by p.proname, identity_arguments;

-- Expected signatures:
-- publish_mezmur_import(uuid, text)
-- bulk_publish_mezmur_imports(uuid[])
-- authenticated_can_execute = true; anon_can_execute = false.

select has_column_privilege('authenticated', 'public.mezmur_data_import', 'import_id', 'SELECT')
  as authenticated_can_read_import_id;

-- After an authorized administrator applies the reviewed migration:
-- notify pgrst, 'reload schema';
