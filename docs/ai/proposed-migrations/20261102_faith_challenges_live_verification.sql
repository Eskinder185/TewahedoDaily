-- READ-ONLY preflight and post-check for 20261102_faith_challenges_live_reconciliation.sql.
-- The READ ONLY transaction makes every statement below incapable of writing. Run each
-- numbered block, SAVE the complete output next to the migration ticket, then ROLLBACK.
-- The SQL Editor runs with elevated privileges: it cannot prove RLS (see the runbook).
begin read only;

-- 1. Table shape, RLS flags, owner.
select a.attnum, a.attname, format_type(a.atttypid,a.atttypmod) as type, a.attnotnull, pg_get_expr(d.adbin,d.adrelid) as default_expr
from pg_attribute a left join pg_attrdef d on d.adrelid=a.attrelid and d.adnum=a.attnum
where a.attrelid='public.play_content_items'::regclass and a.attnum>0 and not a.attisdropped order by a.attnum;
select relname, relrowsecurity as rls_enabled, relforcerowsecurity as rls_forced, pg_get_userbyid(relowner) as owner
from pg_class where oid='public.play_content_items'::regclass;

-- 2. Constraints (the status CHECK must be exactly the six-state domain and convalidated).
select conname, contype, convalidated, pg_get_constraintdef(oid) as definition
from pg_constraint where conrelid='public.play_content_items'::regclass order by conname;

-- 3. Indexes (a valid UNIQUE index on stable_id alone makes the migration skip index creation).
select i.indexrelid::regclass as index_name, i.indisunique, i.indisvalid, pg_get_indexdef(i.indexrelid) as definition
from pg_index i where i.indrelid='public.play_content_items'::regclass order by i.indexrelid::regclass::text;

-- 4. Policies (ALL permissive policies are replaced; save every row for rollback).
select policyname, cmd, roles, permissive, qual, with_check
from pg_policies where schemaname='public' and tablename='play_content_items' order by policyname;

-- 5. Grants: table-level, column-level, and via PUBLIC.
select grantee, privilege_type, is_grantable from information_schema.role_table_grants
where table_schema='public' and table_name='play_content_items' order by grantee, privilege_type;
select grantee, column_name, privilege_type from information_schema.column_privileges
where table_schema='public' and table_name='play_content_items'
  and grantee not in ('postgres','supabase_admin') order by grantee, column_name, privilege_type;

-- 6. Triggers and every function the proposal touches or depends on.
select tgname, tgenabled, pg_get_triggerdef(oid) as definition
from pg_trigger where tgrelid='public.play_content_items'::regclass and not tgisinternal order by tgname;
select p.oid::regprocedure as signature, p.prosecdef as security_definer, pg_get_userbyid(p.proowner) as owner,
  p.proconfig, p.proacl, pg_get_functiondef(p.oid) as definition
from pg_proc p join pg_namespace n on n.oid=p.pronamespace
where n.nspname='public' and p.proname in ('review_play_content','is_staff','current_user_role',
  'play_content_editorial_role','play_content_transition_allowed','play_content_payload_valid','guard_play_content_editorial')
order by p.proname;

-- 7. Role model: current_user_role() return type and the roles that really exist.
select p.oid::regprocedure, format_type(p.prorettype,null) as returns from pg_proc p
where p.pronamespace='public'::regnamespace and p.proname in ('current_user_role','is_staff');
select role::text, count(*) from public.profiles group by 1 order by 1;

-- 8. Existing data must remain valid: status mix (review/archived rows must be preserved).
select status, count(*), count(published_at) as with_published_at from public.play_content_items group by status order by status;
select count(*) filter (where stable_id is null) as missing_stable_id,
  count(*) filter (where question_id is null or question_id !~ '^[a-z0-9]+(-[a-z0-9]+)*$' or
    (stable_id is not null and (stable_id is distinct from question_id or payload->>'id' is distinct from stable_id)) or
    (stable_id is null and payload->>'id' is distinct from question_id)) as conflicting_identifiers,
  count(*) filter (where status='published' and published_at is null) as untimestamped_published,
  count(*) filter (where status is null or status not in ('draft','review','approved','rejected','published','archived')) as unknown_status
from public.play_content_items;
select stable_id, count(*) from public.play_content_items where stable_id is not null group by stable_id having count(*)>1;
-- 9. Dependents: foreign keys into the table (rows must not be deleted; the migration never deletes).
select conrelid::regclass as referencing_table, conname, pg_get_constraintdef(oid) as definition
from pg_constraint where confrelid='public.play_content_items'::regclass;

-- 10. POST-MIGRATION ASSERTIONS (run after the migration, same expectations every time).
select count(*) as policy_count_expect_5 from pg_policies where schemaname='public' and tablename='play_content_items';
select count(*) as status_checks_expect_1 from pg_constraint
where conrelid='public.play_content_items'::regclass and contype='c' and pg_get_constraintdef(oid) ~* '''draft''';
select count(*) as guard_trigger_expect_1 from pg_trigger
where tgrelid='public.play_content_items'::regclass and tgname='play_content_editorial_guard' and tgenabled='O';
select has_table_privilege('anon','public.play_content_items','select') as anon_select_expect_t,
  has_table_privilege('anon','public.play_content_items','insert') as anon_insert_expect_f,
  has_table_privilege('authenticated','public.play_content_items','delete') as auth_delete_expect_f;

-- Rows that WOULD fail the payload check when next moved to review/approved (informational; run ONLY post-migration; no row is changed).
select count(*) as publishable_rows_failing_payload_check from public.play_content_items
where status in ('review','approved','published') and not public.play_content_payload_valid(game_type,stable_id,category,difficulty,payload,source_references);

rollback;

-- Effective authorization MUST be proven through real anon, editor, admin and ordinary-user
-- JWT sessions in staging (docs/ai/FAITH-CHALLENGES-SIX-STATE-RECONCILIATION-2026-11-03.md).
