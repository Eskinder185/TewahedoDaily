-- Read-only inventory for persistent Mezmur SQLSTATE 42501 failures.
-- Run in Supabase SQL Editor only for schema inventory. SQL Editor does not use
-- the browser user's JWT, so auth.uid() will normally be null there. The app's
-- save preflight validates the actual browser JWT, matching profiles row, role,
-- and public.is_staff() immediately before each write.

-- 1. Actor visible in this SQL session (not a substitute for browser preflight).
select
  current_user as database_role,
  session_user as session_role,
  auth.uid() as jwt_user_id,
  auth.jwt() ->> 'role' as jwt_database_role,
  p.id as profile_id,
  p.email as profile_email,
  p.role::text as profile_role,
  public.is_staff() as is_staff
from (select 1) seed
left join public.profiles p on p.id = auth.uid();

-- 2. Every non-internal trigger, its timing/event, and exact function definition.
select
  n.nspname as table_schema,
  c.relname as table_name,
  t.tgname as trigger_name,
  pg_get_triggerdef(t.oid, true) as trigger_definition,
  pn.nspname as function_schema,
  p.proname as function_name,
  pg_get_functiondef(p.oid) as function_definition
from pg_trigger t
join pg_class c on c.oid = t.tgrelid
join pg_namespace n on n.oid = c.relnamespace
join pg_proc p on p.oid = t.tgfoid
join pg_namespace pn on pn.oid = p.pronamespace
where not t.tgisinternal
  and n.nspname = 'public'
  and c.relname in (
    'mezmur_data_import', 'zemaris', 'mezmur_section_links_import',
    'mezmur_category_links_import', 'mezmur_occasion_links_import'
  )
order by c.relname, t.tgname;

-- 3. Exact RLS state and policies on every table touched by the save flow.
select
  n.nspname as table_schema,
  c.relname as table_name,
  c.relrowsecurity as rls_enabled,
  c.relforcerowsecurity as rls_forced
from pg_class c
join pg_namespace n on n.oid = c.relnamespace
where n.nspname = 'public'
  and c.relname in (
    'profiles', 'mezmur_data_import', 'zemaris', 'mezmur_section_links_import',
    'mezmur_category_links_import', 'mezmur_occasion_links_import',
    'mezmur_publication_events'
  )
order by c.relname;

select schemaname, tablename, policyname, permissive, roles, cmd, qual, with_check
from pg_policies
where schemaname = 'public'
  and tablename in (
    'profiles', 'mezmur_data_import', 'zemaris', 'mezmur_section_links_import',
    'mezmur_category_links_import', 'mezmur_occasion_links_import',
    'mezmur_publication_events'
  )
order by tablename, cmd, policyname;

-- 4. Authenticated table and payload-column privileges (no GRANT statements).
select
  t.table_name,
  has_table_privilege('authenticated', format('%I.%I', t.table_schema, t.table_name), 'SELECT') as can_select,
  has_table_privilege('authenticated', format('%I.%I', t.table_schema, t.table_name), 'INSERT') as can_insert,
  has_table_privilege('authenticated', format('%I.%I', t.table_schema, t.table_name), 'UPDATE') as can_update
from information_schema.tables t
where t.table_schema = 'public'
  and t.table_name in (
    'profiles', 'mezmur_data_import', 'zemaris', 'mezmur_section_links_import',
    'mezmur_category_links_import', 'mezmur_occasion_links_import',
    'mezmur_publication_events'
  )
order by t.table_name;

select
  c.table_name,
  c.column_name,
  has_column_privilege(
    'authenticated', format('%I.%I', c.table_schema, c.table_name), c.column_name, 'INSERT'
  ) as can_insert,
  has_column_privilege(
    'authenticated', format('%I.%I', c.table_schema, c.table_name), c.column_name, 'UPDATE'
  ) as can_update
from information_schema.columns c
where c.table_schema = 'public'
  and c.table_name = 'mezmur_data_import'
  and c.column_name in (
    'mezmur_id', 'slug', 'title', 'title_amharic', 'description',
    'lyrics_amharic', 'lyrics_transliteration', 'lyrics_english',
    'primary_language', 'form', 'zemari_id', 'singer_id', 'singer_slug',
    'singer_name', 'youtube_url', 'audio_url', 'image_path', 'image_alt',
    'status', 'updated_at', 'created_at', 'review_status', 'rights_status',
    'publication_approved_at', 'publication_approved_by'
  )
order by c.ordinal_position;

-- 5. Foreign keys identify referenced tables that triggers/updates can touch.
select
  con.conname as constraint_name,
  con.conrelid::regclass::text as source_table,
  pg_get_constraintdef(con.oid, true) as definition,
  con.confrelid::regclass::text as referenced_table
from pg_constraint con
where con.contype = 'f'
  and con.conrelid in (
    select table_oid
    from (values
      (to_regclass('public.mezmur_data_import')),
      (to_regclass('public.zemaris')),
      (to_regclass('public.mezmur_section_links_import')),
      (to_regclass('public.mezmur_category_links_import')),
      (to_regclass('public.mezmur_occasion_links_import'))
    ) targets(table_oid)
    where table_oid is not null
  )
order by source_table, constraint_name;

-- 6. Defaults and owned/serial/identity sequences, including authenticated use.
select
  n.nspname as table_schema,
  c.relname as table_name,
  a.attname as column_name,
  pg_get_expr(d.adbin, d.adrelid) as column_default,
  pg_get_serial_sequence(format('%I.%I', n.nspname, c.relname), a.attname) as sequence_name,
  case
    when pg_get_serial_sequence(format('%I.%I', n.nspname, c.relname), a.attname) is null then null
    else has_sequence_privilege(
      'authenticated',
      pg_get_serial_sequence(format('%I.%I', n.nspname, c.relname), a.attname),
      'USAGE'
    )
  end as authenticated_sequence_usage
from pg_class c
join pg_namespace n on n.oid = c.relnamespace
join pg_attribute a on a.attrelid = c.oid and a.attnum > 0 and not a.attisdropped
left join pg_attrdef d on d.adrelid = c.oid and d.adnum = a.attnum
where n.nspname = 'public'
  and c.relname in ('mezmur_data_import', 'zemaris', 'mezmur_publication_events')
  and (d.oid is not null or a.attidentity <> '')
order by c.relname, a.attnum;

-- 7. RPC/trigger functions and EXECUTE privileges for authenticated.
select
  n.nspname as function_schema,
  p.proname as function_name,
  pg_get_function_identity_arguments(p.oid) as arguments,
  p.prosecdef as security_definer,
  pg_get_userbyid(p.proowner) as owner,
  has_function_privilege('authenticated', p.oid, 'EXECUTE') as authenticated_can_execute
from pg_proc p
join pg_namespace n on n.oid = p.pronamespace
where n.nspname = 'public'
  and p.proname in (
    'is_staff', 'approve_mezmur_import', 'publish_mezmur_import',
    'guard_mezmur_import_publication'
  )
order by p.proname, arguments;
