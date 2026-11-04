-- READ ONLY. Execute in the Supabase SQL Editor and retain redacted results.
-- Catalog evidence does not replace effective anon/user/editor/admin JWT tests.
select n.nspname, c.relname, c.relrowsecurity, c.relforcerowsecurity
from pg_class c join pg_namespace n on n.oid=c.relnamespace
where n.nspname in ('public','storage') and c.relkind in ('r','p') order by 1,2;
select schemaname,tablename,policyname,permissive,roles,cmd,qual,with_check
from pg_policies where schemaname in ('public','storage') order by 1,2,3;
select table_schema,table_name,grantee,privilege_type
from information_schema.role_table_grants where table_schema in ('public','storage') order by 1,2,3;
select n.nspname,p.proname,pg_get_function_identity_arguments(p.oid) as arguments,
  p.prosecdef,p.proconfig,p.proacl,pg_get_functiondef(p.oid) as definition
from pg_proc p join pg_namespace n on n.oid=p.pronamespace
where n.nspname in ('public','cms_private') and p.prokind='f' order by 1,2;
select conrelid::regclass,conname,pg_get_constraintdef(oid),convalidated
from pg_constraint where connamespace='public'::regnamespace order by 1,2;
select schemaname,tablename,indexname,indexdef from pg_indexes where schemaname='public';
select id,public,file_size_limit,allowed_mime_types from storage.buckets;
select tgrelid::regclass,tgname,pg_get_triggerdef(oid) from pg_trigger
where not tgisinternal and tgrelid in ('public.profiles'::regclass,'public.play_content_items'::regclass);
-- No user/token/secret rows are requested. Verify PUBLIC cannot CREATE in public.
select has_schema_privilege('anon','public','CREATE') as anon_can_create,
       has_schema_privilege('authenticated','public','CREATE') as authenticated_can_create;

-- Sprint 2: table grants alone miss column grants (the original audit did).
select grantee,table_name,column_name,privilege_type
from information_schema.column_privileges
where table_schema='public' and table_name='profiles' order by grantee,column_name;
select r.role_name,
  has_table_privilege(r.role_name,'public.profiles','INSERT') as can_insert_profile,
  has_column_privilege(r.role_name,'public.profiles','role','UPDATE') as can_change_role_directly,
  has_column_privilege(r.role_name,'public.profiles','id','UPDATE') as can_change_id_directly,
  has_column_privilege(r.role_name,'public.profiles','display_name','UPDATE') as can_edit_name
from (values ('anon'),('authenticated')) r(role_name);
select n.nspname,p.proname,pg_get_function_identity_arguments(p.oid),p.prosecdef,p.proconfig,p.proacl,
  pg_get_functiondef(p.oid)
from pg_proc p join pg_namespace n on n.oid=p.pronamespace
where n.nspname='public' and p.proname in ('handle_new_user','ensure_user_profile',
  'set_cms_member','profiles_guard_role_change','join_play_room','get_play_room_state',
  'start_play_room_round','submit_play_room_answer','record_play_completion','award_verified_play_activity');
select n.nspname,c.relname,c.relrowsecurity,c.relacl
from pg_class c join pg_namespace n on n.oid=c.relnamespace
where n.nspname='play_private' and c.relkind='r';
-- Confirm play_private is NOT an exposed PostgREST schema in API settings.
-- Actual JWT mutation/concurrency tests require approved staging execution;
-- this read-only query set does not establish those results.

-- Sprint 3 additions: READ ONLY; these queries were prepared, not executed.
select n.nspname,p.proname,pg_get_function_identity_arguments(p.oid),p.prosecdef,p.proconfig,p.proacl,
  pg_get_functiondef(p.oid)
from pg_proc p join pg_namespace n on n.oid=p.pronamespace
where n.nspname='public' and p.proname in ('claim_verified_play_room_reward','play_room_text',
  'play_room_question_view','reveal_play_room_round','finish_play_room');
select n.nspname,p.proname,r.role_name,has_function_privilege(r.role_name,p.oid,'EXECUTE') as executable
from pg_proc p join pg_namespace n on n.oid=p.pronamespace
cross join (values ('anon'),('authenticated'),('service_role')) r(role_name)
where n.nspname='public' and p.proname in ('record_play_completion','award_verified_play_activity',
  'claim_verified_play_room_reward','play_room_text','play_room_question_view');
select n.nspname,c.relname,a.attname,format_type(a.atttypid,a.atttypmod) as column_type,a.attacl
from pg_attribute a join pg_class c on c.oid=a.attrelid join pg_namespace n on n.oid=c.relnamespace
where a.attnum>0 and not a.attisdropped and ((n.nspname='public' and c.relname in
 ('profiles','play_user_progress','play_game_results','play_room_rounds','play_room_submissions'))
 or n.nspname='play_private') order by 1,2,3;
select conrelid::regclass,conname,pg_get_constraintdef(oid),convalidated
from pg_constraint where connamespace=to_regnamespace('play_private')
 or conrelid in ('public.play_game_results'::regclass,'public.play_room_rounds'::regclass,
   'public.play_room_submissions'::regclass);
-- Read-only counts, not token/user/answer rows. Active rooms block cutover.
select count(*) as active_rooms from public.play_rooms where state<>'finished' and expires_at>now();
