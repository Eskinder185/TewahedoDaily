-- Tewahedo Play: reviewed content and lightweight progression (Milestones 2-4).
-- Additive only: does not modify Bible, Mezmur, or Church Library source rows.
begin;

create extension if not exists pgcrypto;

create table if not exists public.play_content_items (
  id uuid primary key default gen_random_uuid(),
  stable_id text not null unique check (stable_id ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  game_type text not null check (game_type in ('trivia','emoji','finish-the-verse','finish-the-mezmur','history','who-am-i','match')),
  category text not null,
  difficulty text not null check (difficulty in ('beginner','growing','challenge')),
  payload jsonb not null check (jsonb_typeof(payload) = 'object'),
  source_references jsonb not null default '[]'::jsonb check (jsonb_typeof(source_references) = 'array'),
  status text not null default 'draft' check (status in ('draft','approved','rejected','published')),
  review_notes text,
  created_by uuid references auth.users(id) on delete set null,
  reviewed_by uuid references auth.users(id) on delete set null,
  published_by uuid references auth.users(id) on delete set null,
  reviewed_at timestamptz,
  published_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  check (status <> 'published' or (published_at is not null and jsonb_array_length(source_references) > 0))
);

create index if not exists play_content_public_idx on public.play_content_items(game_type, category, difficulty, published_at) where status = 'published';
alter table public.play_content_items enable row level security;
revoke all on public.play_content_items from public, anon, authenticated;
grant select on public.play_content_items to anon, authenticated;
grant insert, update, delete on public.play_content_items to authenticated;

drop policy if exists play_content_public_read on public.play_content_items;
create policy play_content_public_read on public.play_content_items for select to anon, authenticated
  using (status = 'published' or coalesce(public.is_staff(), false));
drop policy if exists play_content_staff_insert on public.play_content_items;
create policy play_content_staff_insert on public.play_content_items for insert to authenticated
  with check (coalesce(public.is_staff(), false));
drop policy if exists play_content_staff_update on public.play_content_items;
create policy play_content_staff_update on public.play_content_items for update to authenticated
  using (coalesce(public.is_staff(), false)) with check (coalesce(public.is_staff(), false));
drop policy if exists play_content_staff_delete on public.play_content_items;
create policy play_content_staff_delete on public.play_content_items for delete to authenticated
  using (coalesce(public.is_staff(), false));

create table if not exists public.play_user_progress (
  user_id uuid primary key references auth.users(id) on delete cascade,
  xp integer not null default 0 check (xp >= 0),
  streak integer not null default 0 check (streak >= 0),
  last_played_date date,
  snapshot jsonb not null default '{}'::jsonb check (jsonb_typeof(snapshot) = 'object'),
  updated_at timestamptz not null default now()
);

create table if not exists public.play_game_results (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  game_type text not null,
  score integer not null check (score >= 0),
  max_score integer not null check (max_score > 0 and score <= max_score),
  xp_earned integer not null check (xp_earned between 0 and 100),
  category text not null,
  completed_at timestamptz not null default now()
);
create index if not exists play_results_user_completed_idx on public.play_game_results(user_id, completed_at desc);

create table if not exists public.play_achievements (
  key text primary key,
  title_en text not null,
  title_am text,
  description_en text not null,
  description_am text,
  xp_reward integer not null default 0 check (xp_reward between 0 and 1000)
);
create table if not exists public.play_user_achievements (
  user_id uuid not null references auth.users(id) on delete cascade,
  achievement_key text not null references public.play_achievements(key) on delete restrict,
  earned_at timestamptz not null default now(),
  primary key (user_id, achievement_key)
);

insert into public.play_achievements(key,title_en,title_am,description_en,description_am,xp_reward) values
('first-steps','First Steps','የመጀመሪያ እርምጃ','Complete your first game.','የመጀመሪያ ጨዋታዎን ያጠናቅቁ።',0),
('perfect-round','Perfect Round','ፍጹም ዙር','Finish a round without a wrong answer.','ያለ ስህተት ዙር ያጠናቅቁ።',0),
('curious-explorer','Curious Explorer','ጉጉ አሳሽ','Complete three different game types.','ሦስት የተለያዩ ጨዋታዎችን ያጠናቅቁ።',0),
('three-day-streak','Three-Day Rhythm','የሦስት ቀን ተከታታይ','Learn on three consecutive days.','ለሦስት ተከታታይ ቀናት ይማሩ።',0)
on conflict (key) do update set title_en=excluded.title_en,title_am=excluded.title_am,description_en=excluded.description_en,description_am=excluded.description_am;

alter table public.play_user_progress enable row level security;
alter table public.play_game_results enable row level security;
alter table public.play_achievements enable row level security;
alter table public.play_user_achievements enable row level security;
revoke all on public.play_user_progress, public.play_game_results, public.play_user_achievements from public, anon, authenticated;
grant select on public.play_user_progress, public.play_game_results, public.play_user_achievements to authenticated;
grant select on public.play_achievements to anon, authenticated;

create policy play_progress_owner_read on public.play_user_progress for select to authenticated using (user_id = auth.uid());
create policy play_results_owner_read on public.play_game_results for select to authenticated using (user_id = auth.uid());
create policy play_achievements_public_read on public.play_achievements for select to anon, authenticated using (true);
create policy play_user_achievements_owner_read on public.play_user_achievements for select to authenticated using (user_id = auth.uid());

create or replace function public.record_play_completion(
  p_game_type text,
  p_score integer,
  p_max_score integer,
  p_category text,
  p_snapshot jsonb default '{}'::jsonb
) returns jsonb
language plpgsql security definer set search_path = public
as $$
declare
  uid uuid := auth.uid();
  earned integer;
  result_id uuid;
begin
  if uid is null then raise exception 'Authentication required' using errcode='42501'; end if;
  if p_max_score < 1 or p_score < 0 or p_score > p_max_score then raise exception 'Invalid score' using errcode='22023'; end if;
  if p_game_type not in ('trivia','emoji','finish-the-verse','finish-the-mezmur','history','who-am-i','match','adventure') then raise exception 'Invalid game type' using errcode='22023'; end if;
  if jsonb_typeof(p_snapshot) <> 'object' then raise exception 'Invalid snapshot' using errcode='22023'; end if;
  earned := 20 + round((p_score::numeric / p_max_score::numeric) * 80)::integer;
  insert into public.play_game_results(user_id,game_type,score,max_score,xp_earned,category)
    values(uid,p_game_type,p_score,p_max_score,earned,left(coalesce(nullif(trim(p_category),''),'general'),120)) returning id into result_id;
  insert into public.play_user_progress(user_id,xp,streak,last_played_date,snapshot)
    values(uid,earned,1,current_date,p_snapshot)
  on conflict(user_id) do update set
    xp=public.play_user_progress.xp+earned,
    streak=case when public.play_user_progress.last_played_date=current_date then public.play_user_progress.streak when public.play_user_progress.last_played_date=current_date-1 then public.play_user_progress.streak+1 else 1 end,
    last_played_date=current_date,
    snapshot=p_snapshot,
    updated_at=now();
  insert into public.play_user_achievements(user_id,achievement_key) values(uid,'first-steps') on conflict do nothing;
  if p_score=p_max_score then insert into public.play_user_achievements(user_id,achievement_key) values(uid,'perfect-round') on conflict do nothing; end if;
  return jsonb_build_object('result_id',result_id,'xp_earned',earned);
end $$;
revoke all on function public.record_play_completion(text,integer,integer,text,jsonb) from public, anon;
grant execute on function public.record_play_completion(text,integer,integer,text,jsonb) to authenticated;

create or replace function public.review_play_content(p_id uuid,p_status text,p_notes text default null)
returns public.play_content_items language plpgsql security invoker set search_path=public as $$
declare row public.play_content_items;
begin
  if not coalesce(public.is_staff(),false) then raise exception 'Staff role required' using errcode='42501'; end if;
  if p_status not in ('draft','approved','rejected','published') then raise exception 'Invalid status' using errcode='22023'; end if;
  if p_status='published' and not exists(select 1 from public.play_content_items where id=p_id and status='approved') then
    raise exception 'Content must be approved before publication' using errcode='22023';
  end if;
  update public.play_content_items set status=p_status,review_notes=p_notes,
    reviewed_by=case when p_status in ('approved','rejected','published') then auth.uid() else reviewed_by end,
    reviewed_at=case when p_status in ('approved','rejected','published') then now() else reviewed_at end,
    published_by=case when p_status='published' then auth.uid() else published_by end,
    published_at=case when p_status='published' then now() else published_at end,
    updated_at=now()
  where id=p_id returning * into row;
  if row.id is null then raise exception 'Play content not found' using errcode='P0002'; end if;
  return row;
end $$;
revoke all on function public.review_play_content(uuid,text,text) from public, anon;
grant execute on function public.review_play_content(uuid,text,text) to authenticated;

notify pgrst, 'reload schema';
commit;
