-- READ ONLY. No connection or SQL was executed by the implementation task.
-- Use only against an independently verified, explicitly approved target.
select column_name,data_type,is_nullable,column_default
from information_schema.columns where table_schema='public' and table_name='play_content_items'
order by ordinal_position;

select conname,contype,convalidated,pg_get_constraintdef(oid) as definition
from pg_constraint where conrelid='public.play_content_items'::regclass order by conname;
select indexname,indexdef from pg_indexes where schemaname='public' and tablename='play_content_items';
select tgname,tgenabled,pg_get_triggerdef(oid) as definition from pg_trigger
where tgrelid='public.play_content_items'::regclass and not tgisinternal;
select policyname,permissive,roles,cmd,qual,with_check from pg_policies
where schemaname='public' and tablename='play_content_items';
select grantee,privilege_type from information_schema.role_table_grants
where table_schema='public' and table_name='play_content_items' order by grantee,privilege_type;
select p.proname,pg_get_function_identity_arguments(p.oid) as arguments,p.prosecdef,p.proconfig,
  has_function_privilege('anon',p.oid,'EXECUTE') as anon_execute,
  has_function_privilege('authenticated',p.oid,'EXECUTE') as authenticated_execute
from pg_proc p join pg_namespace n on n.oid=p.pronamespace
where n.nspname='public' and p.proname in ('review_play_content','guard_play_content_editorial','play_content_payload_valid','play_content_transition_allowed','play_content_editorial_role');
select game_type,status,count(*) as records,
  count(*) filter (where published_at is null) as missing_publication_timestamp
from public.play_content_items group by game_type,status order by game_type,status;
select count(*) filter (where question_id is null or btrim(question_id)='') as invalid_question_ids,
  count(*) filter (where stable_id is null or btrim(stable_id)='') as invalid_stable_ids,
  count(*) filter (where question_id is distinct from stable_id) as mismatched_identifiers
from public.play_content_items;
select 'question_id' as identifier,count(*) as duplicate_groups from
  (select question_id from public.play_content_items group by question_id having count(*)>1) q
union all select 'stable_id',count(*) from
  (select stable_id from public.play_content_items where stable_id is not null group by stable_id having count(*)>1) s;
-- These are catalog/data-compatibility observations, not effective JWT/RLS proof.
