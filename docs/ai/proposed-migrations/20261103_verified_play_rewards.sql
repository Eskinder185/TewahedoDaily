-- UNAPPLIED. Sprint 3 implements one verifier: authenticated Game Night players
-- with complete server-held submissions. Solo/Adventure remain LOCAL ONLY.
-- Requires the reviewed Game Night security proposal FIRST. No client snapshots.
-- Preserve historical XP/results: no backfill, reset, or client-snapshot import.
-- activity_id must be derived by the verifier from a stable server catalog
-- (e.g. adventure:<story-id>:v1), NEVER an arbitrary client UUID/replay token.
begin;
create schema if not exists play_private;
revoke all on schema play_private from public,anon,authenticated;
create table if not exists play_private.verified_play_completions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id),
  game_type text not null, activity_id text not null check(length(activity_id) between 1 and 200),
  score integer not null, max_score integer not null check(max_score between 1 and 1000),
  evidence_hash text not null check(evidence_hash ~ '^[a-f0-9]{64}$'),
  verified_at timestamptz not null default now(),
  check(score between 0 and max_score)
);
create table if not exists play_private.play_reward_ledger (
  id uuid primary key default gen_random_uuid(),
  evidence_id uuid not null references play_private.verified_play_completions(id),
  user_id uuid not null references auth.users(id), game_type text not null, activity_id text not null,
  xp_earned integer not null check(xp_earned between 20 and 100),
  created_at timestamptz not null default now(),
  unique(user_id,game_type,activity_id), unique(evidence_id)
);
alter table play_private.verified_play_completions enable row level security;
alter table play_private.play_reward_ledger enable row level security;
revoke all on play_private.verified_play_completions,play_private.play_reward_ledger from public,anon,authenticated;
grant usage on schema play_private to service_role;
grant select,insert on play_private.verified_play_completions to service_role;

create or replace function public.award_verified_play_activity(p_evidence_id uuid)
returns jsonb language plpgsql security definer set search_path='' as $$
declare evidence play_private.verified_play_completions; earned integer; ledger_id uuid;
begin
  select * into evidence from play_private.verified_play_completions where id=p_evidence_id for update;
  if evidence.id is null then raise exception 'Verified completion required' using errcode='42501'; end if;
  if evidence.game_type not in ('trivia','emoji','finish-the-verse','finish-the-mezmur','history',
      'who-am-i','match','adventure','bible-timeline','feasts','saints','icon-memory','game-night') then
    raise exception 'Unsupported game'; end if;
  earned:=20+round(evidence.score::numeric/evidence.max_score*80)::integer;
  insert into play_private.play_reward_ledger(evidence_id,user_id,game_type,activity_id,xp_earned)
    values(evidence.id,evidence.user_id,evidence.game_type,evidence.activity_id,earned)
    on conflict do nothing returning id into ledger_id;
  if ledger_id is null then return jsonb_build_object('awarded',false,'xp_earned',0); end if;
  -- Unique ledger INSERT and all mutations are ONE transaction. Concurrent,
  -- cross-device and retried awards cannot both increment the total.
  insert into public.play_game_results(user_id,game_type,score,max_score,xp_earned,category)
    values(evidence.user_id,evidence.game_type,evidence.score,evidence.max_score,earned,evidence.activity_id);
  insert into public.play_user_progress(user_id,xp,streak,last_played_date,snapshot)
    values(evidence.user_id,earned,1,current_date,'{}'::jsonb)
  on conflict(user_id) do update set xp=public.play_user_progress.xp+earned,
    streak=case when public.play_user_progress.last_played_date=current_date then public.play_user_progress.streak
      when public.play_user_progress.last_played_date=current_date-1 then public.play_user_progress.streak+1 else 1 end,
    last_played_date=current_date,updated_at=now();
  insert into public.play_user_achievements(user_id,achievement_key)
    values(evidence.user_id,'first-steps') on conflict do nothing;
  if evidence.score=evidence.max_score then
    insert into public.play_user_achievements(user_id,achievement_key)
      values(evidence.user_id,'perfect-round') on conflict do nothing;
  end if;
  return jsonb_build_object('awarded',true,'xp_earned',earned);
end $$;
revoke all on function public.award_verified_play_activity(uuid) from public,anon,authenticated;
grant execute on function public.award_verified_play_activity(uuid) to service_role;

-- Browser-facing claim accepts references, NEVER user/score/XP/activity inputs.
-- A guest cannot retroactively claim a reward by logging in; membership must
-- have been bound to auth.uid() at join time. A host has no special reward right.
create or replace function public.claim_verified_play_room_reward(p_room_id uuid,p_participant_id uuid)
returns jsonb language plpgsql security definer set search_path=pg_catalog,public,extensions,pg_temp as $$
declare uid uuid:=auth.uid(); room public.play_rooms; activity text;
  rounds integer; submitted integer; correct integer; evidence_id uuid;
  reward jsonb; total integer; existing_award uuid;
begin
  if uid is null then raise exception 'Authentication required' using errcode='42501'; end if;
  -- Serializes same-room claims, including two different participant IDs bound
  -- to one account. The ledger is the independent cross-device unique boundary.
  select * into room from public.play_rooms where id=p_room_id and state='finished' for update;
  if room.id is null or not exists(select 1 from public.play_room_participants
      where id=p_participant_id and room_id=p_room_id and user_id=uid) then
    raise exception 'Completed authenticated membership required' using errcode='42501';
  end if;
  activity:='game-night:'||room.id::text;
  select id into existing_award from play_private.play_reward_ledger
    where user_id=uid and game_type='game-night' and activity_id=activity;
  if existing_award is not null then
    select xp into total from public.play_user_progress where user_id=uid;
    return jsonb_build_object('activity_id',activity,'awarded',false,'xp_earned',0,'xp_total',total);
  end if;
  select count(*) into rounds from public.play_room_rounds
    where room_id=p_room_id and status='revealed' and secure_question_id is not null;
  if rounds is distinct from (room.settings->>'question_count')::integer or rounds not in (5,10,20) then
    raise exception 'A complete verified room is required' using errcode='22023'; end if;
  select count(*),coalesce(sum(s.points),0) into submitted,correct
    from public.play_room_submissions s join public.play_room_rounds r on r.id=s.round_id
    where r.room_id=p_room_id and r.status='revealed' and r.secure_question_id is not null
      and s.participant_id=p_participant_id;
  if submitted<>rounds then raise exception 'Every round must be answered' using errcode='22023'; end if;
  insert into play_private.verified_play_completions(user_id,game_type,activity_id,score,max_score,evidence_hash)
    values(uid,'game-night',activity,correct,rounds,encode(digest(uid::text||':'||activity||':'||correct||':'||rounds,'sha256'),'hex'))
    returning id into evidence_id;
  reward:=public.award_verified_play_activity(evidence_id);
  select xp into total from public.play_user_progress where user_id=uid;
  return reward||jsonb_build_object('activity_id',activity,'xp_total',total);
end $$;
revoke all on function public.claim_verified_play_room_reward(uuid,uuid) from public,anon;
grant execute on function public.claim_verified_play_room_reward(uuid,uuid) to authenticated;

-- Still requires actual effective-permission and concurrency verification.
-- Legacy browser self-scoring is deliberately not a fallback for solo games.
revoke all on function public.record_play_completion(text,integer,integer,text,jsonb) from public,anon,authenticated;
commit;
