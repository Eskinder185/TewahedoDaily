-- Tewahedo Play Game Night. All room access is through validated RPCs.
begin;

create table if not exists public.play_rooms (
  id uuid primary key default gen_random_uuid(),
  code_hash bytea not null unique,
  host_user_id uuid not null references auth.users(id) on delete cascade,
  state text not null default 'lobby' check (state in ('lobby','playing','finished')),
  settings jsonb not null check (jsonb_typeof(settings)='object'),
  last_activity_at timestamptz not null default now(),
  expires_at timestamptz not null default (now()+interval '4 hours'),
  created_at timestamptz not null default now()
);
create table if not exists public.play_room_participants (
  id uuid primary key default gen_random_uuid(), room_id uuid not null references public.play_rooms(id) on delete cascade,
  user_id uuid references auth.users(id) on delete set null, display_name text not null,
  join_token_hash bytea not null, score integer not null default 0 check(score>=0), joined_at timestamptz not null default now(),
  unique(room_id,display_name)
);
create table if not exists public.play_room_rounds (
  id uuid primary key default gen_random_uuid(), room_id uuid not null references public.play_rooms(id) on delete cascade,
  content_id uuid not null references public.play_content_items(id) on delete restrict,
  position integer not null check(position>0), status text not null default 'open' check(status in ('open','revealed')),
  started_at timestamptz not null default now(), revealed_at timestamptz, unique(room_id,position), unique(room_id,content_id)
);
create table if not exists public.play_room_submissions (
  id uuid primary key default gen_random_uuid(), round_id uuid not null references public.play_room_rounds(id) on delete cascade,
  participant_id uuid not null references public.play_room_participants(id) on delete cascade,
  answer_key text not null, is_correct boolean not null, points integer not null check(points in (0,1)), submitted_at timestamptz not null default now(),
  unique(round_id,participant_id)
);
create table if not exists public.play_room_join_attempts (
  id bigint generated always as identity primary key, client_key text not null, attempted_at timestamptz not null default now()
);
create index if not exists play_room_join_attempts_rate_idx on public.play_room_join_attempts(client_key,attempted_at desc);

alter table public.play_rooms enable row level security;
alter table public.play_room_participants enable row level security;
alter table public.play_room_rounds enable row level security;
alter table public.play_room_submissions enable row level security;
alter table public.play_room_join_attempts enable row level security;
revoke all on public.play_rooms,public.play_room_participants,public.play_room_rounds,public.play_room_submissions,public.play_room_join_attempts from public,anon,authenticated;

create or replace function public.play_room_host(p_room_id uuid) returns boolean language sql stable security definer set search_path=public as $$
  select exists(select 1 from public.play_rooms where id=p_room_id and host_user_id=auth.uid() and expires_at>now())
$$;
revoke all on function public.play_room_host(uuid) from public,anon;
grant execute on function public.play_room_host(uuid) to authenticated;

create or replace function public.create_play_room(p_category text,p_difficulty text,p_question_count integer)
returns jsonb language plpgsql security definer set search_path=public as $$
declare uid uuid:=auth.uid(); code text; rid uuid; tries integer:=0;
begin
  if uid is null then raise exception 'Authentication required' using errcode='42501'; end if;
  if p_difficulty not in ('beginner','growing','challenge') or p_question_count not in (5,10,20) then raise exception 'Invalid room settings' using errcode='22023'; end if;
  loop
    tries:=tries+1; code:=upper(substr(encode(gen_random_bytes(4),'hex'),1,6));
    begin
      insert into public.play_rooms(code_hash,host_user_id,settings) values(digest(code,'sha256'),uid,jsonb_build_object('category',left(coalesce(nullif(trim(p_category),''),'All categories'),80),'difficulty',p_difficulty,'question_count',p_question_count)) returning id into rid;
      exit;
    exception when unique_violation then if tries>=5 then raise exception 'Unable to allocate room code'; end if; end;
  end loop;
  return jsonb_build_object('room_id',rid,'code',code);
end $$;
revoke all on function public.create_play_room(text,text,integer) from public,anon;
grant execute on function public.create_play_room(text,text,integer) to authenticated;

create or replace function public.join_play_room(p_code text,p_display_name text)
returns jsonb language plpgsql security definer set search_path=public as $$
declare rid uuid; pid uuid; token text:=encode(gen_random_bytes(24),'hex'); client text:=coalesce(inet_client_addr()::text,'unknown'); cleaned text:=left(regexp_replace(trim(p_display_name),'\s+',' ','g'),30);
begin
  delete from public.play_room_join_attempts where attempted_at<now()-interval '1 hour';
  if (select count(*) from public.play_room_join_attempts where client_key=client and attempted_at>now()-interval '1 minute')>=10 then raise exception 'Too many join attempts' using errcode='P0001'; end if;
  insert into public.play_room_join_attempts(client_key) values(client);
  if length(cleaned)<2 then raise exception 'Display name must contain at least two characters' using errcode='22023'; end if;
  select id into rid from public.play_rooms where code_hash=digest(upper(trim(p_code)),'sha256') and state<>'finished' and expires_at>now();
  if rid is null then raise exception 'Room not found or expired' using errcode='P0002'; end if;
  insert into public.play_room_participants(room_id,user_id,display_name,join_token_hash) values(rid,auth.uid(),cleaned,digest(token,'sha256')) returning id into pid;
  update public.play_rooms set last_activity_at=now() where id=rid;
  return jsonb_build_object('room_id',rid,'participant_id',pid,'join_token',token);
exception when unique_violation then raise exception 'That display name is already in the room' using errcode='23505';
end $$;
revoke all on function public.join_play_room(text,text) from public;
grant execute on function public.join_play_room(text,text) to anon,authenticated;

create or replace function public.get_play_room_state(p_room_id uuid,p_participant_id uuid default null,p_join_token text default null)
returns jsonb language plpgsql security definer set search_path=public as $$
declare room public.play_rooms; current_round public.play_room_rounds; item public.play_content_items; role text; question jsonb;
begin
  select * into room from public.play_rooms where id=p_room_id and expires_at>now();
  if room.id is null then raise exception 'Room not found or expired' using errcode='P0002'; end if;
  if room.host_user_id=auth.uid() then role:='host';
  elsif p_participant_id is not null and exists(select 1 from public.play_room_participants where id=p_participant_id and room_id=p_room_id and join_token_hash=digest(coalesce(p_join_token,''),'sha256')) then role:='player';
  else raise exception 'Room membership required' using errcode='42501'; end if;
  select * into current_round from public.play_room_rounds where room_id=p_room_id order by position desc limit 1;
  if current_round.id is not null then
    select * into item from public.play_content_items where id=current_round.content_id;
    question:=case when current_round.status='revealed' then item.payload else item.payload-'correctKey'-'correct_key' end;
  end if;
  return jsonb_build_object('room_id',room.id,'state',room.state,'role',role,'settings',room.settings,'round',case when current_round.id is null then null else jsonb_build_object('id',current_round.id,'status',current_round.status,'position',current_round.position,'question',question) end,'participants',(select coalesce(jsonb_agg(jsonb_build_object('id',p.id,'display_name',p.display_name,'score',p.score) order by p.score desc,p.joined_at),'[]'::jsonb) from public.play_room_participants p where p.room_id=room.id));
end $$;
revoke all on function public.get_play_room_state(uuid,uuid,text) from public;
grant execute on function public.get_play_room_state(uuid,uuid,text) to anon,authenticated;

create or replace function public.start_play_room_round(p_room_id uuid) returns uuid language plpgsql security definer set search_path=public as $$
declare room public.play_rooms; content uuid; next_position integer; round_id uuid;
begin
  select * into room from public.play_rooms where id=p_room_id and host_user_id=auth.uid() and expires_at>now() for update;
  if room.id is null then raise exception 'Host permission required' using errcode='42501'; end if;
  if exists(select 1 from public.play_room_rounds where room_id=p_room_id and status='open') then raise exception 'Reveal the current round first' using errcode='22023'; end if;
  select coalesce(max(position),0)+1 into next_position from public.play_room_rounds where room_id=p_room_id;
  if next_position>(room.settings->>'question_count')::integer then raise exception 'Configured question count reached' using errcode='22023'; end if;
  select c.id into content from public.play_content_items c where c.status='published' and c.game_type in ('trivia','emoji','history') and (room.settings->>'category'='All categories' or c.category ilike '%'||(room.settings->>'category')||'%') and (c.difficulty=room.settings->>'difficulty' or c.difficulty='beginner') and not exists(select 1 from public.play_room_rounds r where r.room_id=p_room_id and r.content_id=c.id) order by random() limit 1;
  if content is null then raise exception 'No eligible published questions remain for these settings' using errcode='P0002'; end if;
  insert into public.play_room_rounds(room_id,content_id,position) values(p_room_id,content,next_position) returning id into round_id;
  update public.play_rooms set state='playing',last_activity_at=now(),expires_at=greatest(expires_at,now()+interval '1 hour') where id=p_room_id;
  return round_id;
end $$;
revoke all on function public.start_play_room_round(uuid) from public,anon;
grant execute on function public.start_play_room_round(uuid) to authenticated;

create or replace function public.submit_play_room_answer(p_round_id uuid,p_participant_id uuid,p_join_token text,p_answer_key text)
returns jsonb language plpgsql security definer set search_path=public as $$
declare round public.play_room_rounds; correct text; awarded integer;
begin
  select r.* into round from public.play_room_rounds r join public.play_rooms room on room.id=r.room_id where r.id=p_round_id and r.status='open' and room.state='playing' and room.expires_at>now();
  if round.id is null then raise exception 'Round is not accepting answers' using errcode='22023'; end if;
  if not exists(select 1 from public.play_room_participants where id=p_participant_id and room_id=round.room_id and join_token_hash=digest(coalesce(p_join_token,''),'sha256')) then raise exception 'Participant token is invalid' using errcode='42501'; end if;
  select payload->>'correctKey' into correct from public.play_content_items where id=round.content_id and status='published';
  awarded:=case when p_answer_key=correct then 1 else 0 end;
  insert into public.play_room_submissions(round_id,participant_id,answer_key,is_correct,points) values(round.id,p_participant_id,left(p_answer_key,40),awarded=1,awarded);
  update public.play_room_participants set score=score+awarded where id=p_participant_id;
  return jsonb_build_object('accepted',true);
exception when unique_violation then raise exception 'Answer already submitted' using errcode='23505';
end $$;
revoke all on function public.submit_play_room_answer(uuid,uuid,text,text) from public;
grant execute on function public.submit_play_room_answer(uuid,uuid,text,text) to anon,authenticated;

create or replace function public.reveal_play_room_round(p_room_id uuid) returns void language plpgsql security definer set search_path=public as $$
begin
  if not public.play_room_host(p_room_id) then raise exception 'Host permission required' using errcode='42501'; end if;
  update public.play_room_rounds set status='revealed',revealed_at=now() where room_id=p_room_id and status='open';
  if not found then raise exception 'No open round' using errcode='P0002'; end if;
  update public.play_rooms set last_activity_at=now() where id=p_room_id;
end $$;
revoke all on function public.reveal_play_room_round(uuid) from public,anon;
grant execute on function public.reveal_play_room_round(uuid) to authenticated;

create or replace function public.finish_play_room(p_room_id uuid) returns void language plpgsql security definer set search_path=public as $$
begin
  if not public.play_room_host(p_room_id) then raise exception 'Host permission required' using errcode='42501'; end if;
  update public.play_room_rounds set status='revealed',revealed_at=coalesce(revealed_at,now()) where room_id=p_room_id and status='open';
  update public.play_rooms set state='finished',last_activity_at=now(),expires_at=least(expires_at,now()+interval '30 minutes') where id=p_room_id;
end $$;
revoke all on function public.finish_play_room(uuid) from public,anon;
grant execute on function public.finish_play_room(uuid) to authenticated;

notify pgrst,'reload schema';
commit;
