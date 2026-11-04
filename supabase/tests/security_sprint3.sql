-- PREPARED ONLY. NEVER run against production. No SQL was executed in Sprint 3.
-- After separate authorization: disposable Supabase database, owner connection,
-- baseline schema plus reviewed profile, Game Night and reward proposals.
-- Real grants/RLS are used (SET ROLE), not a mocked authorization implementation.
-- This transaction rolls back fixtures; it CANNOT prove durable HTTP accounting
-- or independent-connection races. See SECURITY-SPRINT-3 for those API tests.
\set ON_ERROR_STOP on
begin;
create function pg_temp.check_ok(ok boolean,label text) returns void language plpgsql as $$
begin if ok is distinct from true then raise exception 'FAIL: %',label; end if; end $$;
create function pg_temp.denied(statement text) returns void language plpgsql as $$
begin
  begin execute statement;
  exception when insufficient_privilege then return; end;
  raise exception 'Expected 42501 denial: %',statement;
end $$;
create function pg_temp.identity(uid text) returns void language plpgsql as $$
begin perform set_config('request.jwt.claim.sub',uid,true); end;
$$;
-- Refuse fixture collisions; never overwrite real accounts.
select pg_temp.check_ok(not exists(select 1 from auth.users where id::text like 'dd31000%'), 'empty fixture ID namespace');
select pg_temp.check_ok(not exists(select 1 from public.play_room_join_attempts), 'disposable database has no prior join counters');
insert into auth.users(id,email) values
 ('dd310001-0000-0000-0000-000000000001','s3-player@example.invalid'),
 ('dd310002-0000-0000-0000-000000000002','s3-host@example.invalid'),
 ('dd310003-0000-0000-0000-000000000003','s3-editor@example.invalid'),
 ('dd310004-0000-0000-0000-000000000004','s3-admin@example.invalid'),
 ('dd310005-0000-0000-0000-000000000005','s3-super@example.invalid');
-- Owner-only fixture provisioning. Do not disable the role guard or RLS.
delete from public.profiles where id::text like 'dd31000%';
insert into public.profiles(id,email,role)
select u.id,u.email,(jsonb_populate_record(null::public.profiles,
  jsonb_build_object('role',case u.id::text
    when 'dd310003-0000-0000-0000-000000000003' then 'editor'
    when 'dd310004-0000-0000-0000-000000000004' then 'admin'
    when 'dd310005-0000-0000-0000-000000000005' then 'super_admin' else 'user' end))).role
from auth.users u where u.id::text like 'dd31000%';

create temporary table fixture_room(data jsonb);
create temporary table fixture_members(kind text primary key,data jsonb);
grant select,insert on fixture_room,fixture_members to anon,authenticated;
-- Owner-only synthetic private questions. Never reuse public content as secrets.
insert into play_private.game_night_questions(category,difficulty,status,reviewed_at,payload)
select 'sprint3-private','beginner','published',now(),jsonb_build_object(
 'prompt',jsonb_build_object('en','Staging fixture '||n,'am','ሙከራ'),
 'options','[{"key":"A","text":{"en":"One","am":"አንድ"},"hidden":{"correctKey":"LEAK"}},
             {"key":"B","text":{"en":"Two"}},{"key":"C","text":{"en":"Three"}},{"key":"D","text":{"en":"Four"}}]'::jsonb,
 'correctKey','A','explanation',jsonb_build_object('en','LEAK explanation'), 'metadata',jsonb_build_object('secret','LEAK'))
from generate_series(1,5) n;
select pg_temp.check_ok(public.play_room_question_view(
 '{"prompt":{"en":{"correctKey":"LEAK"}},"options":[{"key":{"answer":"LEAK"},"text":{"en":{"answer":"LEAK"}}}]}'::jsonb,false)::text not like '%LEAK%',
 'object-valued text is not stringified');

set local role anon;
select pg_temp.identity('');
select pg_temp.denied('select * from play_private.game_night_questions');
select pg_temp.denied('select * from public.play_room_submissions');
select pg_temp.denied('select public.create_play_room(''sprint3-private'',''beginner'',5)');
select pg_temp.denied('select public.award_verified_play_activity(gen_random_uuid())');
select pg_temp.denied('select public.claim_verified_play_room_reward(gen_random_uuid(),gen_random_uuid())');
select pg_temp.denied('update public.profiles set role=''super_admin''');

set local role authenticated;
select pg_temp.identity('dd310001-0000-0000-0000-000000000001');
select pg_temp.denied('update public.profiles set role=''super_admin'' where id=auth.uid()');
select pg_temp.denied('select public.set_cms_member(auth.uid(),''super_admin'')');
select pg_temp.denied('select public.record_play_completion(''trivia'',1,1,''forged'',''{}'')');
select pg_temp.denied('insert into play_private.verified_play_completions default values');
select pg_temp.denied('select public.award_verified_play_activity(gen_random_uuid())');
select pg_temp.denied('select * from public.play_room_rounds');
update public.profiles set display_name='Safe self edit' where id=auth.uid();
select pg_temp.check_ok((select display_name='Safe self edit' from public.profiles where id=auth.uid()),'self profile edit preserved');
select pg_temp.identity('dd310003-0000-0000-0000-000000000003');
select pg_temp.denied('update public.profiles set role=''admin'' where id=auth.uid()');
select pg_temp.denied('select public.set_cms_member(auth.uid(),''admin'')');
select pg_temp.identity('dd310004-0000-0000-0000-000000000004');
select pg_temp.denied('update public.profiles set role=''super_admin'' where id=auth.uid()');
select pg_temp.denied('select public.set_cms_member(auth.uid(),''super_admin'')');
select public.set_cms_member('dd310003-0000-0000-0000-000000000003','editor');
select pg_temp.identity('dd310005-0000-0000-0000-000000000005');
select pg_temp.denied('update public.profiles set role=''user'' where id=auth.uid()');
select public.set_cms_member('dd310003-0000-0000-0000-000000000003','admin');
select public.set_cms_member('dd310003-0000-0000-0000-000000000003','editor');

select pg_temp.identity('dd310002-0000-0000-0000-000000000002');
insert into fixture_room select public.create_play_room('sprint3-private','beginner',5);
select pg_temp.identity('dd310001-0000-0000-0000-000000000001');
insert into fixture_members select 'player',public.join_play_room((select data->>'code' from fixture_room),'Signed player');
set local role anon;
select pg_temp.identity('');
insert into fixture_members select 'guest',public.join_play_room((select data->>'code' from fixture_room),'Guest');
select pg_temp.check_ok((select data ? 'join_token' from fixture_members where kind='guest'),'legitimate guest join');
select pg_temp.denied('select public.get_play_room_state((select (data->>''room_id'')::uuid from fixture_room))');

set local role authenticated;
-- Staff are not automatically hosts or room members.
do $$ declare uid text; rid uuid:=(select (data->>'room_id')::uuid from fixture_room); begin
  foreach uid in array array['dd310001-0000-0000-0000-000000000001',
    'dd310003-0000-0000-0000-000000000003','dd310004-0000-0000-0000-000000000004',
    'dd310005-0000-0000-0000-000000000005'] loop
    perform pg_temp.identity(uid);
    perform pg_temp.denied(format('select public.start_play_room_round(%L)',rid));
    perform pg_temp.denied(format('select public.reveal_play_room_round(%L)',rid));
    perform pg_temp.denied(format('select public.finish_play_room(%L)',rid));
    perform pg_temp.denied(format('select public.get_play_room_state(%L)',rid));
    perform pg_temp.denied('select * from play_private.game_night_questions');
    perform pg_temp.denied('select * from public.play_room_submissions');
    perform pg_temp.denied('select public.award_verified_play_activity(gen_random_uuid())');
  end loop;
end $$;

do $$ declare rid uuid:=(select (data->>'room_id')::uuid from fixture_room);
  member jsonb:=(select data from fixture_members where kind='player'); round_id uuid; state jsonb; n integer;
begin
  for n in 1..5 loop
    perform pg_temp.identity('dd310002-0000-0000-0000-000000000002');
    round_id:=public.start_play_room_round(rid);
    perform pg_temp.identity('dd310001-0000-0000-0000-000000000001');
    state:=public.get_play_room_state(rid,(member->>'participant_id')::uuid,member->>'join_token');
    perform pg_temp.check_ok(state::text not like '%LEAK%' and not (state#>'{round,question}' ? 'correctKey'), 'no nested/explanation answer leak');
    perform pg_temp.denied(format('select public.submit_play_room_answer(%L,%L,''wrong-token'',''A'')',round_id,member->>'participant_id'));
    perform public.submit_play_room_answer(round_id,(member->>'participant_id')::uuid,member->>'join_token','A');
    begin
      perform public.submit_play_room_answer(round_id,(member->>'participant_id')::uuid,member->>'join_token','A');
      raise exception 'Duplicate answer accepted';
    exception when unique_violation then null; end;
    state:=public.get_play_room_state(rid,(member->>'participant_id')::uuid,member->>'join_token');
    perform pg_temp.check_ok((select (p->>'score')::integer=n-1
      from jsonb_array_elements(state->'participants') p
      where p->>'id'=member->>'participant_id'),'open-round points hidden for signed player');
    perform pg_temp.identity('dd310002-0000-0000-0000-000000000002');
    perform public.reveal_play_room_round(rid);
    state:=public.get_play_room_state(rid);
    perform pg_temp.check_ok(state#>>'{round,question,correctKey}'='A','reveal permits answer');
  end loop;
  perform public.finish_play_room(rid);
end $$;
-- Actual DB deduplication, sequential replay. Independent races still required.
select pg_temp.identity('dd310001-0000-0000-0000-000000000001');
do $$ declare rid uuid:=(select (data->>'room_id')::uuid from fixture_room);
  pid uuid:=(select (data->>'participant_id')::uuid from fixture_members where kind='player');
  first_receipt jsonb; retry jsonb;
begin
  first_receipt:=public.claim_verified_play_room_reward(rid,pid);
  retry:=public.claim_verified_play_room_reward(rid,pid);
  perform pg_temp.check_ok((first_receipt->>'xp_earned')::integer=100,'server-derived full score');
  perform pg_temp.check_ok(retry->>'awarded'='false' and retry->>'xp_earned'='0'
    and retry->>'xp_total'=first_receipt->>'xp_total','repeat claim leaves total unchanged');
  perform pg_temp.identity('dd310002-0000-0000-0000-000000000002');
  perform pg_temp.denied(format('select public.claim_verified_play_room_reward(%L,%L)',rid,pid));
end $$;
select pg_temp.identity('dd310001-0000-0000-0000-000000000001');
do $$ declare n integer; result jsonb; begin
  for n in 1..9 loop
    result:=public.join_play_room('!','Rejected');
    perform pg_temp.check_ok(result->>'error'='invalid_join','rejected joins return data');
  end loop;
  result:=public.join_play_room('!','Rejected');
  perform pg_temp.check_ok(result->>'error'='rate_limited','eleventh user attempt limited');
end $$;
reset role;
select pg_temp.check_ok((select count(*)=10 from public.play_room_join_attempts
  where client_key='dd310001-0000-0000-0000-000000000001'),'rejected attempts survive function return');
select pg_temp.check_ok((select count(*)=1 from play_private.play_reward_ledger
  where user_id='dd310001-0000-0000-0000-000000000001'),'one ledger award');
rollback;
\echo Sprint 3 transactional assertions passed; HTTP durability/concurrency NOT covered.
