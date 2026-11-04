-- SUPERSEDED by 20261102_faith_challenges_live_reconciliation.sql. Do not apply:
-- its four-status CHECK and policy allowlist conflict with the verified live schema.
-- REVIEW ONLY. Do not apply without schema inspection and explicit approval.
-- Repairs an older play_content_items table that CREATE TABLE IF NOT EXISTS left incomplete.
-- Additive and transaction-bound; existing rows and published states are retained.
begin;

create extension if not exists pgcrypto;
create table if not exists public.play_content_items (id uuid primary key default gen_random_uuid());

alter table public.play_content_items
  add column if not exists question_id text,
  add column if not exists stable_id text,
  add column if not exists game_type text,
  add column if not exists category text,
  add column if not exists difficulty text,
  add column if not exists payload jsonb,
  add column if not exists source_references jsonb default '[]'::jsonb,
  add column if not exists status text default 'draft',
  add column if not exists review_notes text,
  add column if not exists created_by uuid,
  add column if not exists reviewed_by uuid,
  add column if not exists published_by uuid,
  add column if not exists reviewed_at timestamptz,
  add column if not exists published_at timestamptz,
  add column if not exists created_at timestamptz default now(),
  add column if not exists updated_at timestamptz default now();

-- Fail atomically if an existing same-named column has an incompatible type.
do $$
declare name text; expected regtype; actual regtype;
begin
  for name, expected in
    select * from (values
      ('id','uuid'::regtype), ('question_id','text'::regtype), ('stable_id','text'::regtype), ('game_type','text'::regtype),
      ('category','text'::regtype), ('difficulty','text'::regtype), ('payload','jsonb'::regtype),
      ('source_references','jsonb'::regtype), ('status','text'::regtype),
      ('review_notes','text'::regtype), ('created_by','uuid'::regtype),
      ('reviewed_by','uuid'::regtype), ('published_by','uuid'::regtype),
      ('reviewed_at','timestamp with time zone'::regtype),
      ('published_at','timestamp with time zone'::regtype),
      ('created_at','timestamp with time zone'::regtype), ('updated_at','timestamp with time zone'::regtype)
    ) as types(column_name, expected_type)
  loop
    select a.atttypid::regtype into actual from pg_attribute a
      where a.attrelid='public.play_content_items'::regclass and a.attname=name and not a.attisdropped;
    if actual is distinct from expected then
      raise exception 'play_content_items.% type mismatch: expected %, found %', name, expected, actual;
    end if;
  end loop;
  if to_regprocedure('public.is_staff()') is null then
    raise exception 'public.is_staff() is required before Faith Challenges migration';
  end if;
end $$;

update public.play_content_items set id=gen_random_uuid() where id is null;
alter table public.play_content_items alter column id set default gen_random_uuid();
create unique index if not exists play_content_items_id_compat_idx on public.play_content_items(id);
update public.play_content_items set stable_id='legacy-'||replace(id::text,'-','')
  where stable_id is null or trim(stable_id)='';
update public.play_content_items set question_id=stable_id
  where question_id is null or trim(question_id)='';
create unique index if not exists play_content_items_question_id_compat_idx on public.play_content_items(question_id);
create unique index if not exists play_content_items_stable_id_compat_idx on public.play_content_items(stable_id);
alter table public.play_content_items alter column source_references set default '[]'::jsonb;
alter table public.play_content_items alter column status set default 'draft';
alter table public.play_content_items alter column created_at set default now();
alter table public.play_content_items alter column updated_at set default now();
update public.play_content_items set published_at=coalesce(updated_at,created_at,now())
  where status='published' and published_at is null;

do $$
begin
  if not exists (select 1 from pg_constraint where conrelid='public.play_content_items'::regclass and conname='play_content_stable_id_compat') then
    alter table public.play_content_items add constraint play_content_stable_id_compat
      check (stable_id ~ '^[a-z0-9]+(-[a-z0-9]+)*$') not valid;
  end if;
  if not exists (select 1 from pg_constraint where conrelid='public.play_content_items'::regclass and conname='play_content_status_compat') then
    alter table public.play_content_items add constraint play_content_status_compat
      check (status in ('draft','approved','rejected','published')) not valid;
  end if;
  if not exists (select 1 from pg_constraint where conrelid='public.play_content_items'::regclass and conname='play_content_game_compat') then
    alter table public.play_content_items add constraint play_content_game_compat
      check (game_type in ('trivia','emoji','finish-the-verse','finish-the-mezmur','history','who-am-i','match')) not valid;
  end if;
  if not exists (select 1 from pg_constraint where conrelid='public.play_content_items'::regclass and conname='play_content_difficulty_compat') then
    alter table public.play_content_items add constraint play_content_difficulty_compat
      check (difficulty in ('beginner','growing','challenge')) not valid;
  end if;
  if not exists (select 1 from pg_constraint where conrelid='public.play_content_items'::regclass and conname='play_content_payload_compat') then
    alter table public.play_content_items add constraint play_content_payload_compat
      check (jsonb_typeof(payload)='object') not valid;
  end if;
  if not exists (select 1 from pg_constraint where conrelid='public.play_content_items'::regclass and conname='play_content_sources_compat') then
    alter table public.play_content_items add constraint play_content_sources_compat
      check (jsonb_typeof(source_references)='array') not valid;
  end if;
end $$;

create index if not exists play_content_public_idx on public.play_content_items(game_type,category,difficulty,published_at)
  where status='published';
create index if not exists play_content_library_idx on public.play_content_items(status,updated_at desc);

alter table public.play_content_items enable row level security;
revoke all on public.play_content_items from public,anon,authenticated;
grant select on public.play_content_items to anon,authenticated;
grant insert,update on public.play_content_items to authenticated;
-- Existing unknown permissive policies must be reviewed, not silently retained.
do $$
begin
  if exists (select 1 from pg_policies where schemaname='public' and tablename='play_content_items'
    and policyname not in ('play_content_public_read','play_content_staff_insert','play_content_staff_update','play_content_staff_delete')) then
    raise exception 'Unexpected play_content_items RLS policy; review before applying';
  end if;
end $$;
drop policy if exists play_content_public_read on public.play_content_items;
create policy play_content_public_read on public.play_content_items for select to anon,authenticated
  using (status='published' or coalesce(public.is_staff(),false));
drop policy if exists play_content_staff_insert on public.play_content_items;
create policy play_content_staff_insert on public.play_content_items for insert to authenticated
  with check (coalesce(public.is_staff(),false));
drop policy if exists play_content_staff_update on public.play_content_items;
create policy play_content_staff_update on public.play_content_items for update to authenticated
  using (coalesce(public.is_staff(),false)) with check (coalesce(public.is_staff(),false));
drop policy if exists play_content_staff_delete on public.play_content_items;

create or replace function public.play_content_payload_valid(
  p_game_type text, p_stable_id text, p_category text, p_difficulty text,
  p_payload jsonb, p_sources jsonb
) returns boolean language plpgsql immutable set search_path='' as $$
declare option_count integer; distinct_keys integer; matching_answer boolean;
begin
  if jsonb_typeof(p_payload) is distinct from 'object' or
     jsonb_typeof(p_sources) is distinct from 'array' or
     p_payload->>'id' is distinct from p_stable_id or
     nullif(trim(coalesce(p_category,'')),'') is null or
     p_difficulty not in ('beginner','growing','challenge') or
     jsonb_typeof(p_payload->'verifiedLocales') is distinct from 'array' or
     not coalesce((p_payload->'verifiedLocales' ? 'en'),false) or
     nullif(trim(coalesce(p_payload#>>'{explanation,en}','')),'') is null or
     nullif(trim(coalesce(p_payload#>>'{source,label}','')),'') is null or
     left(coalesce(p_payload#>>'{source,route}',''),1)<>'/' or
     left(coalesce(p_payload#>>'{source,route}',''),2)='//' or
     p_payload#>>'{source,kind}' not in ('bible','church-library','mezmur','calendar') or
     not exists (select 1 from jsonb_array_elements(p_sources) item
      where item->>'route'=p_payload#>>'{source,route}' and
        item->>'kind'=p_payload#>>'{source,kind}') then return false;
  end if;
  if p_game_type in ('trivia','emoji','finish-the-verse','finish-the-mezmur','history') then
    if p_payload->>'game' is distinct from p_game_type or
       p_payload->>'category' is distinct from p_category or
       p_payload->>'difficulty' is distinct from p_difficulty or
       nullif(trim(coalesce(p_payload#>>'{prompt,en}','')),'') is null or
       jsonb_typeof(p_payload->'options') is distinct from 'array' or
       jsonb_array_length(p_payload->'options')<>4 then return false;
    end if;
    select count(*), count(distinct item->>'key'),
      coalesce(bool_or(item->>'key'=p_payload->>'correctKey'),false)
      into option_count,distinct_keys,matching_answer
      from jsonb_array_elements(p_payload->'options') item
      where nullif(trim(coalesce(item->>'key','')),'') is not null and
        nullif(trim(coalesce(item#>>'{text,en}','')),'') is not null;
    if option_count<>4 or distinct_keys<>4 or not matching_answer then return false; end if;
    if p_game_type='emoji' and nullif(trim(coalesce(p_payload->>'emoji','')),'') is null then return false; end if;
    if p_game_type='finish-the-verse' and nullif(trim(coalesce(p_payload#>>'{excerpt,en}','')),'') is null then return false; end if;
    if p_game_type='finish-the-mezmur' and p_payload->>'mode' not in
      ('finish-lyrics','missing-word','guess-mezmur','guess-occasion') then return false; end if;
  elsif p_game_type='who-am-i' then
    if p_payload->>'category' is distinct from p_category or
       p_category not in ('biblical-people','biblical-locations','saints','holy-objects') or
       nullif(trim(coalesce(p_payload#>>'{answer,en}','')),'') is null then return false; end if;
  elsif p_game_type='match' then
    if p_payload->>'category' is distinct from p_category or
       nullif(trim(coalesce(p_payload#>>'{left,en}','')),'') is null or
       nullif(trim(coalesce(p_payload#>>'{right,en}','')),'') is null then return false; end if;
  else return false;
  end if;
  if p_payload->'verifiedLocales' ? 'am' then
    if nullif(trim(coalesce(p_payload#>>'{explanation,am}','')),'') is null then return false; end if;
    if p_game_type in ('trivia','emoji','finish-the-verse','finish-the-mezmur','history') then
      if nullif(trim(coalesce(p_payload#>>'{prompt,am}','')),'') is null or
         exists (select 1 from jsonb_array_elements(p_payload->'options') item
           where nullif(trim(coalesce(item#>>'{text,am}','')),'') is null) then return false; end if;
    elsif p_game_type='who-am-i' then
      if nullif(trim(coalesce(p_payload#>>'{answer,am}','')),'') is null then return false; end if;
    else
      if nullif(trim(coalesce(p_payload#>>'{left,am}','')),'') is null or
         nullif(trim(coalesce(p_payload#>>'{right,am}','')),'') is null then return false; end if;
    end if;
  end if;
  return true;
end $$;
revoke all on function public.play_content_payload_valid(text,text,text,text,jsonb,jsonb) from public,anon;
grant execute on function public.play_content_payload_valid(text,text,text,text,jsonb,jsonb) to authenticated;

create or replace function public.guard_play_content_editorial()
returns trigger language plpgsql set search_path='' as $$
begin
  if tg_op='INSERT' then
    if new.status is distinct from 'draft' then raise exception 'New questions must be drafts' using errcode='23514'; end if;
    if new.question_id is distinct from new.stable_id then
      raise exception 'Question ID must match stable ID at creation' using errcode='23514'; end if;
    new.created_by:=auth.uid();
  elsif old.status is distinct from new.status and
      coalesce(current_setting('tewahedo.play_review_rpc',true),'')<>'on' then
    raise exception 'Use review_play_content for editorial transitions' using errcode='42501';
  elsif old.status in ('approved','published') and
      (old.payload is distinct from new.payload or old.stable_id is distinct from new.stable_id or
       old.game_type is distinct from new.game_type or old.category is distinct from new.category or
       old.difficulty is distinct from new.difficulty or old.source_references is distinct from new.source_references) then
    raise exception 'Return to draft before editing reviewed content' using errcode='23514';
  end if;
  if tg_op='UPDATE' then
    if old.question_id is distinct from new.question_id or old.stable_id is distinct from new.stable_id then
      raise exception 'Question identifiers are immutable' using errcode='23514';
    end if;
    if coalesce(current_setting('tewahedo.play_review_rpc',true),'')<>'on' and
        (old.created_by is distinct from new.created_by or old.reviewed_by is distinct from new.reviewed_by or
         old.published_by is distinct from new.published_by or old.reviewed_at is distinct from new.reviewed_at or
         old.published_at is distinct from new.published_at) then
      raise exception 'Editorial audit fields are managed by review_play_content' using errcode='42501';
    end if;
  end if;
  if new.status='draft' and (new.stable_id is null or new.game_type is null or
    new.category is null or new.difficulty is null or jsonb_typeof(new.payload) is distinct from 'object' or
    jsonb_typeof(new.source_references) is distinct from 'array') then
    raise exception 'Question fields are incomplete' using errcode='23514';
  end if;
  new.updated_at:=now();
  return new;
end $$;
revoke all on function public.guard_play_content_editorial() from public,anon,authenticated;
drop trigger if exists play_content_editorial_guard on public.play_content_items;
create trigger play_content_editorial_guard before insert or update on public.play_content_items
  for each row execute function public.guard_play_content_editorial();

create or replace function public.review_play_content(p_id uuid,p_status text,p_notes text default null)
returns public.play_content_items language plpgsql security invoker set search_path='' as $$
declare current_row public.play_content_items; saved public.play_content_items;
begin
  if not coalesce(public.is_staff(),false) then raise exception 'Staff role required' using errcode='42501'; end if;
  select * into current_row from public.play_content_items where id=p_id for update;
  if current_row.id is null then raise exception 'Question not found' using errcode='P0002'; end if;
  if not ((current_row.status='draft' and p_status in ('approved','rejected')) or
          (current_row.status='approved' and p_status in ('published','draft','rejected')) or
          (current_row.status='rejected' and p_status='draft') or
          (current_row.status='published' and p_status='draft')) then
    raise exception 'Invalid editorial transition' using errcode='22023';
  end if;
  if p_status='published' and current_row.game_type in ('who-am-i','match') then
    raise exception 'Connect the public card reader before publishing this game type' using errcode='23514';
  end if;
  if p_status='published' and not public.play_content_payload_valid(
      current_row.game_type,current_row.stable_id,current_row.category,current_row.difficulty,
      current_row.payload,current_row.source_references) then
    raise exception 'A valid sourced game question is required to publish' using errcode='23514';
  end if;
  perform set_config('tewahedo.play_review_rpc','on',true);
  update public.play_content_items set status=p_status, review_notes=p_notes,
    reviewed_by=case when p_status in ('approved','rejected','published') then auth.uid() else reviewed_by end,
    reviewed_at=case when p_status in ('approved','rejected','published') then now() else reviewed_at end,
    published_by=case when p_status='published' then auth.uid() else published_by end,
    published_at=case when p_status='published' then now() else null end
    where id=p_id returning * into saved;
  perform set_config('tewahedo.play_review_rpc','off',true);
  return saved;
end $$;
revoke all on function public.review_play_content(uuid,text,text) from public,anon;
grant execute on function public.review_play_content(uuid,text,text) to authenticated;

notify pgrst,'reload schema';
commit;
