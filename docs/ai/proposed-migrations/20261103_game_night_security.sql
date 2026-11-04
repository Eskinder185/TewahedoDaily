-- UNAPPLIED Sprint 2 proposal. Requires verified pgcrypto schema, existing Game
-- Night tables/RPC signatures, and a separately reviewed secure question import.
-- Do not copy public Play answers into this bank: those answers are already public.
-- Cut over only with no active rooms and with enough reviewed private questions.
begin;
do $$ begin
  if exists(select 1 from public.play_rooms where state<>'finished' and expires_at>now()) then
    raise exception 'Finish active rooms before security cutover';
  end if;
end $$;
create schema if not exists play_private;
revoke all on schema play_private from public,anon,authenticated;
create table if not exists play_private.game_night_questions (
  id uuid primary key default gen_random_uuid(),
  category text not null, difficulty text not null check(difficulty in ('beginner','growing','challenge')),
  payload jsonb not null check(jsonb_typeof(payload)='object'),
  status text not null default 'draft' check(status in ('draft','published')),
  reviewed_at timestamptz,
  check(status<>'published' or reviewed_at is not null)
);
alter table play_private.game_night_questions enable row level security;
revoke all on play_private.game_night_questions from public,anon,authenticated;
grant usage on schema play_private to service_role;
grant select,insert,update on play_private.game_night_questions to service_role;
alter table public.play_room_rounds alter column content_id drop not null;
alter table public.play_room_rounds add column if not exists secure_question_id uuid
  references play_private.game_night_questions(id) on delete restrict;

-- A whitelist at EVERY nested layer; arbitrary payload metadata never reaches
-- a room response. Reject object/array values instead of converting nested
-- answer metadata into text via ->>. Editorial review must also check semantics.
create or replace function public.play_room_text(p_value jsonb)
returns text language sql immutable set search_path='' as $$
  select case when jsonb_typeof(p_value)='string' then p_value#>>'{}' else null end
$$;
revoke all on function public.play_room_text(jsonb) from public,anon,authenticated;

-- Only explicitly revealed fields contain answers.
create or replace function public.play_room_question_view(p_payload jsonb,p_revealed boolean)
returns jsonb language sql immutable set search_path='' as $$
  select jsonb_build_object(
    'prompt',jsonb_build_object('en',public.play_room_text(p_payload#>'{prompt,en}'),'am',public.play_room_text(p_payload#>'{prompt,am}')),
    'options',(select jsonb_agg(jsonb_build_object('key',public.play_room_text(o->'key'),'text',
      jsonb_build_object('en',public.play_room_text(o#>'{text,en}'),'am',public.play_room_text(o#>'{text,am}'))) order by position)
      from jsonb_array_elements(p_payload->'options') with ordinality q(o,position)))
    || case when p_revealed then jsonb_build_object('correctKey',public.play_room_text(p_payload->'correctKey'),
      'explanation',jsonb_build_object('en',public.play_room_text(p_payload#>'{explanation,en}'),'am',public.play_room_text(p_payload#>'{explanation,am}')),
      'source',jsonb_build_object('label',public.play_room_text(p_payload#>'{source,label}'),'route',public.play_room_text(p_payload#>'{source,route}')))
      else '{}'::jsonb end
$$;
revoke all on function public.play_room_question_view(jsonb,boolean) from public,anon,authenticated;

create or replace function public.join_play_room(p_code text,p_display_name text)
returns jsonb language plpgsql security definer set search_path=pg_catalog,public,extensions,pg_temp as $$
declare rid uuid; pid uuid; token text; client_key_value text;
  cleaned text:=left(regexp_replace(trim(coalesce(p_display_name,'')),'\s+',' ','g'),30);
begin
  -- A global DB cap cannot be evaded by changing a caller-supplied identifier.
  -- Real per-IP/Turnstile controls still belong at the trusted HTTP gateway.
  perform pg_advisory_xact_lock(724602);
  delete from public.play_room_join_attempts where attempted_at<now()-interval '1 hour';
  if (select count(*) from public.play_room_join_attempts where attempted_at>now()-interval '1 minute')>=100 then
    return jsonb_build_object('error','rate_limited');
  end if;
  client_key_value:=coalesce(auth.uid()::text,'anonymous-global');
  if auth.uid() is not null and (select count(*) from public.play_room_join_attempts
      where client_key=client_key_value and attempted_at>now()-interval '1 minute')>=10 then
    return jsonb_build_object('error','rate_limited');
  end if;
  insert into public.play_room_join_attempts(client_key) values(client_key_value);
  -- Normal rejected joins return data, so the counter commits under PostgREST.
  if length(cleaned)<2 or coalesce(p_code,'') !~ '^[A-Fa-f0-9]{6}$' then
    return jsonb_build_object('error','invalid_join');
  end if;
  select id into rid from public.play_rooms where code_hash=digest(upper(p_code),'sha256')
    and state<>'finished' and expires_at>now() for update;
  if rid is null then return jsonb_build_object('error','room_unavailable'); end if;
  token:=encode(gen_random_bytes(24),'hex');
  -- Handle expected uniqueness failure inside a subtransaction. The attempt
  -- INSERT above remains outside it and survives the rejection.
  begin
    insert into public.play_room_participants(room_id,user_id,display_name,join_token_hash)
      values(rid,auth.uid(),cleaned,digest(token,'sha256')) returning id into pid;
  exception when unique_violation then return jsonb_build_object('error','name_unavailable');
  end;
  update public.play_rooms set last_activity_at=now() where id=rid;
  return jsonb_build_object('room_id',rid,'participant_id',pid,'join_token',token);
end $$;

create or replace function public.start_play_room_round(p_room_id uuid)
returns uuid language plpgsql security definer set search_path=pg_catalog,public,extensions,pg_temp as $$
declare room public.play_rooms; question_id uuid; next_position integer; round_id uuid;
begin
  select * into room from public.play_rooms where id=p_room_id and host_user_id=auth.uid()
    and state<>'finished' and expires_at>now() for update;
  if room.id is null then raise exception 'Host permission required' using errcode='42501'; end if;
  if exists(select 1 from public.play_room_rounds where room_id=p_room_id and status='open') then
    raise exception 'Reveal the current round first' using errcode='22023'; end if;
  select coalesce(max(position),0)+1 into next_position from public.play_room_rounds where room_id=p_room_id;
  if next_position>(room.settings->>'question_count')::integer then raise exception 'Question count reached'; end if;
  select q.id into question_id from play_private.game_night_questions q
    where q.status='published' and q.reviewed_at is not null
      and (room.settings->>'category'='All categories' or q.category=room.settings->>'category')
      and q.difficulty=room.settings->>'difficulty'
      and jsonb_typeof(q.payload->'options')='array' and jsonb_array_length(q.payload->'options')=4
      and jsonb_typeof(q.payload#>'{prompt,en}')='string'
      and jsonb_typeof(q.payload->'correctKey')='string'
      and (select count(distinct o->>'key') from jsonb_array_elements(q.payload->'options') o)=4
      and not exists(select 1 from jsonb_array_elements(q.payload->'options') o
        where jsonb_typeof(o->'key') is distinct from 'string'
           or jsonb_typeof(o#>'{text,en}') is distinct from 'string'
           or (o#>'{text,am}' is not null and jsonb_typeof(o#>'{text,am}') not in ('string','null')))
      and (q.payload#>'{prompt,am}' is null or jsonb_typeof(q.payload#>'{prompt,am}') in ('string','null'))
      and exists(select 1 from jsonb_array_elements(q.payload->'options') o where o->>'key'=q.payload->>'correctKey')
      and not exists(select 1 from public.play_room_rounds r where r.room_id=p_room_id and r.secure_question_id=q.id)
    order by random() limit 1;
  if question_id is null then raise exception 'No reviewed private questions available'; end if;
  insert into public.play_room_rounds(room_id,secure_question_id,position)
    values(p_room_id,question_id,next_position) returning id into round_id;
  update public.play_rooms set state='playing',last_activity_at=now() where id=p_room_id;
  return round_id;
end $$;

create or replace function public.get_play_room_state(p_room_id uuid,p_participant_id uuid default null,p_join_token text default null)
returns jsonb language plpgsql security definer set search_path=pg_catalog,public,extensions,pg_temp as $$
declare room public.play_rooms; round_row public.play_room_rounds; question jsonb; member_role text;
begin
  select * into room from public.play_rooms where id=p_room_id and expires_at>now();
  if room.id is null then raise exception 'Room unavailable' using errcode='42501'; end if;
  if room.host_user_id=auth.uid() then member_role:='host';
  elsif exists(select 1 from public.play_room_participants where id=p_participant_id and room_id=p_room_id
      and join_token_hash=digest(coalesce(p_join_token,''),'sha256')) then member_role:='player';
  else raise exception 'Room membership required' using errcode='42501'; end if;
  select * into round_row from public.play_room_rounds where room_id=p_room_id order by position desc limit 1;
  if round_row.id is not null then
    select public.play_room_question_view(payload,round_row.status='revealed') into question
      from play_private.game_night_questions where id=round_row.secure_question_id;
    -- Preserve historical finished rooms without selecting public questions for
    -- any new/open round. Those old answers were already revealed and public.
    if question is null and room.state='finished' and round_row.status='revealed' then
      select public.play_room_question_view(payload,true) into question
        from public.play_content_items where id=round_row.content_id;
    end if;
    if question is null then raise exception 'Legacy round is unavailable'; end if;
  end if;
  return jsonb_build_object('room_id',room.id,'state',room.state,'role',member_role,'settings',room.settings,
    'round',case when round_row.id is null then null else jsonb_build_object('id',round_row.id,
      'status',round_row.status,'position',round_row.position,'question',question) end,
    'participants',(select coalesce(jsonb_agg(jsonb_build_object('id',p.id,'display_name',p.display_name,
      'score',coalesce((select sum(s.points) from public.play_room_submissions s
        join public.play_room_rounds r on r.id=s.round_id where s.participant_id=p.id and r.status='revealed'),0))
      order by p.joined_at),'[]'::jsonb) from public.play_room_participants p where p.room_id=room.id));
end $$;

create or replace function public.submit_play_room_answer(p_round_id uuid,p_participant_id uuid,p_join_token text,p_answer_key text)
returns jsonb language plpgsql security definer set search_path=pg_catalog,public,extensions,pg_temp as $$
declare round_row public.play_room_rounds; question jsonb; awarded integer;
begin
  -- Serializes competing submissions/reveal on the same round.
  select r.* into round_row from public.play_room_rounds r join public.play_rooms room on room.id=r.room_id
    where r.id=p_round_id and r.status='open' and room.state='playing' and room.expires_at>now() for update of r;
  if round_row.id is null then raise exception 'Round is not accepting answers'; end if;
  if not exists(select 1 from public.play_room_participants where id=p_participant_id and room_id=round_row.room_id
      and join_token_hash=digest(coalesce(p_join_token,''),'sha256')) then
    raise exception 'Participant token is invalid' using errcode='42501'; end if;
  select payload into question from play_private.game_night_questions where id=round_row.secure_question_id;
  if question is null or not exists(select 1 from jsonb_array_elements(question->'options') o where o->>'key'=p_answer_key) then
    raise exception 'Invalid answer'; end if;
  awarded:=case when p_answer_key=question->>'correctKey' then 1 else 0 end;
  insert into public.play_room_submissions(round_id,participant_id,answer_key,is_correct,points)
    values(round_row.id,p_participant_id,p_answer_key,awarded=1,awarded);
  update public.play_room_participants set score=score+awarded where id=p_participant_id;
  return jsonb_build_object('accepted',true);
end $$;
-- Existing reveal/finish RPCs UPDATE these same round rows and obtain row locks.
-- Unique(round_id,participant_id) remains the duplicate-score boundary.
revoke all on function public.join_play_room(text,text) from public;
grant execute on function public.join_play_room(text,text) to anon,authenticated;
revoke all on function public.get_play_room_state(uuid,uuid,text) from public;
grant execute on function public.get_play_room_state(uuid,uuid,text) to anon,authenticated;
revoke all on function public.submit_play_room_answer(uuid,uuid,text,text) from public;
grant execute on function public.submit_play_room_answer(uuid,uuid,text,text) to anon,authenticated;
revoke all on function public.start_play_room_round(uuid) from public,anon;
grant execute on function public.start_play_room_round(uuid) to authenticated;
-- All private bank reads occur in DEFINER RPCs; no client table grant or RLS policy.
notify pgrst,'reload schema';
commit;
