-- READ-ONLY Game Night installation and permission check. Safe to run in the Supabase SQL Editor:
-- the READ ONLY transaction cannot write, and nothing here calls a Game Night function.
-- Run it BEFORE any change (to learn which stage is live) and AFTER each applied step.
-- The Supabase SQL Editor shows only the LAST result set of a script: run each numbered block on its own.
-- Blocks 5-9 reference objects from later stages; "does not exist" there simply means that stage is not installed yet.
-- The SQL Editor is a superuser session: has_*_privilege() below reports the real grants, but only
-- real anon / authenticated JWT requests prove behaviour (see the checklist).
begin read only;

-- 1. Where is pgcrypto? Room functions pinned to search_path=public cannot see the `extensions` schema.
select e.extname, n.nspname as installed_in_schema, e.extversion
from pg_extension e join pg_namespace n on n.oid=e.extnamespace where e.extname='pgcrypto';
select p.oid::regprocedure as function, n.nspname as schema
from pg_proc p join pg_namespace n on n.oid=p.pronamespace where p.proname in ('gen_random_bytes','digest') order by p.oid::regprocedure::text;

-- 2. Tables, RLS, and that browser roles hold NO table privileges.
select c.relname, c.relrowsecurity as rls_on, pg_get_userbyid(c.relowner) as owner,
  has_table_privilege('anon',c.oid,'select,insert,update,delete') as anon_any,
  has_table_privilege('authenticated',c.oid,'select,insert,update,delete') as authenticated_any
from pg_class c join pg_namespace n on n.oid=c.relnamespace
where (n.nspname='public' and c.relname in ('play_rooms','play_room_participants','play_room_rounds','play_room_submissions','play_room_join_attempts'))
   or (n.nspname='play_private' and c.relkind='r') order by n.nspname, c.relname;  -- expect anon_any=f, authenticated_any=f everywhere

-- 3. Function inventory. SAVE definitions before changing anything (rollback material).
select p.oid::regprocedure as signature, p.prosecdef as security_definer, p.proconfig as function_config,
  has_function_privilege('anon',p.oid,'execute') as anon_exec, has_function_privilege('authenticated',p.oid,'execute') as authenticated_exec,
  pg_get_userbyid(p.proowner) as owner, pg_get_functiondef(p.oid) as definition
from pg_proc p join pg_namespace n on n.oid=p.pronamespace
where n.nspname='public' and p.proname in ('create_play_room','join_play_room','get_play_room_state','start_play_room_round',
  'submit_play_room_answer','reveal_play_room_round','finish_play_room','play_room_host','play_room_text','play_room_question_view',
  'claim_verified_play_room_reward','award_verified_play_activity','record_play_completion') order by p.proname;

-- 4. Stage detector: which RPCs are installed, with the expected browser access.
with expected(name, args, anon_ok, auth_ok, stage) as (values
  ('create_play_room','text,text,integer',false,true,'base'),
  ('join_play_room','text,text',true,true,'base'),
  ('get_play_room_state','uuid,uuid,text',true,true,'base'),
  ('start_play_room_round','uuid',false,true,'base'),
  ('submit_play_room_answer','uuid,uuid,text,text',true,true,'base'),
  ('reveal_play_room_round','uuid',false,true,'base'),
  ('finish_play_room','uuid',false,true,'base'),
  ('claim_verified_play_room_reward','uuid,uuid',false,true,'rewards'))
select e.stage, e.name, to_regprocedure('public.'||e.name||'('||e.args||')') is not null as installed,
  coalesce(has_function_privilege('anon',to_regprocedure('public.'||e.name||'('||e.args||')'),'execute'),false) as anon_exec,
  e.anon_ok as anon_expected,
  coalesce(has_function_privilege('authenticated',to_regprocedure('public.'||e.name||'('||e.args||')'),'execute'),false) as authenticated_exec,
  e.auth_ok as authenticated_expected
from expected e order by e.stage, e.name;

-- 5. Security-proposal stage markers (all must be true after 20261103_game_night_security.sql).
select to_regnamespace('play_private') is not null as private_schema,
  to_regclass('play_private.game_night_questions') is not null as private_bank_table,
  to_regprocedure('public.play_room_question_view(jsonb,boolean)') is not null as question_view_fn,
  exists (select 1 from information_schema.columns where table_schema='public' and table_name='play_room_rounds' and column_name='secure_question_id') as round_secure_column,
  (select pg_get_functiondef('public.join_play_room(text,text)'::regprocedure) like '%rate_limited%') as join_is_hardened,
  (select pg_get_functiondef('public.get_play_room_state(uuid,uuid,text)'::regprocedure) like '%play_room_question_view%') as state_is_hardened;

-- 6. Hosting compat marker: create_play_room must be able to see pgcrypto.
select p.proname, p.proconfig,
  coalesce(p.proconfig::text ilike '%extensions%', false) as search_path_reaches_extensions
from pg_proc p where p.oid='public.create_play_room(text,text,integer)'::regprocedure;

-- 7. Active rooms (the security cutover requires zero) and join-attempt table size.
select count(*) filter (where state<>'finished' and expires_at>now()) as active_rooms, count(*) as total_rooms from public.play_rooms;
select count(*) as join_attempt_rows from public.play_room_join_attempts;

-- 8. Private question bank: rooms cannot start without reviewed rows matching category AND difficulty exactly.
select category, difficulty, status, count(*) as questions, count(*) filter (where reviewed_at is not null) as reviewed
from play_private.game_night_questions group by 1,2,3 order by 1,2,3;
-- Eligible per host setting offered by the UI (category strings must match exactly; 5/10/20 rounds need that many):
select c.category, d.difficulty,
  (select count(*) from play_private.game_night_questions q where q.status='published' and q.reviewed_at is not null
     and (c.category='All categories' or q.category=c.category) and q.difficulty=d.difficulty
     and jsonb_typeof(q.payload->'options')='array' and jsonb_array_length(q.payload->'options')=4) as eligible
from (values ('All categories'),('Seven Sacraments'),('Church history')) c(category)
cross join (values ('beginner'),('growing'),('challenge')) d(difficulty) order by 1,2;

-- 9. Published Play questions vs Game Night: informational (the secure start RPC does not read them).
select game_type, count(*) as published,
  count(*) filter (where jsonb_typeof(payload->'options')='array' and jsonb_array_length(payload->'options')=4
                     and jsonb_typeof(payload#>'{prompt,en}')='string' and payload ? 'correctKey') as room_shaped
from public.play_content_items where status='published' and published_at is not null group by 1 order by 1;
-- Legacy rooms keep their public-question rounds (FK is ON DELETE RESTRICT):
select count(*) as rounds_using_public_questions from public.play_room_rounds where content_id is not null;

-- 10. API exposure: play_private must NOT be an exposed PostgREST schema.
select rolname, rolconfig from pg_roles where rolname='authenticator';

rollback;
