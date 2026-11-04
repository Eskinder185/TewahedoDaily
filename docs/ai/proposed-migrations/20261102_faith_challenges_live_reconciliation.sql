-- PROPOSAL ONLY. DO NOT APPLY before reviewing the companion catalog queries and
-- confirming the live CHECK names, profile visibility, grants, policies, and RPC body.
-- This replaces all policies ON play_content_items because permissive policies OR.
-- Run first in a disposable database restored from a production-safe schema copy.
begin;

select pg_advisory_xact_lock(hashtext('faith-challenges-editorial-v2'));

do $$
begin
  if to_regclass('public.play_content_items') is null or
     to_regclass('public.profiles') is null or
     to_regprocedure('public.is_staff()') is null or
     to_regprocedure('public.current_user_role()') is null or
     to_regprocedure('public.review_play_content(uuid,text,text)') is null then
    raise exception 'Required Faith Challenges table or function is missing';
  end if;
  if exists (select 1 from (values ('question_id'),('stable_id'),('status'),('payload'),
      ('source_references'),('game_type'),('category'),('difficulty'),('review_notes'),
      ('created_by'),('reviewed_by'),('reviewed_at'),('published_by'),('published_at'),('updated_at')) v(name)
      where not exists (select 1 from pg_attribute a
        where a.attrelid='public.play_content_items'::regclass and a.attname=v.name and not a.attisdropped)) then
    raise exception 'Required play_content_items column is missing';
  end if;
  if exists (select 1 from public.play_content_items
      where question_id is null or question_id !~ '^[a-z0-9]+(-[a-z0-9]+)*$' or
        (stable_id is not null and (stable_id is distinct from question_id or payload->>'id' is distinct from stable_id)) or
        (stable_id is null and payload->>'id' is distinct from question_id)) then
    raise exception 'Existing question IDs need individual reconciliation before migration';
  end if;
  if exists (select 1 from public.play_content_items where status='published' and published_at is null) then
    raise exception 'Published rows without published_at need review before migration';
  end if;
end $$;

-- Schema changes are conditional: nothing is altered when the verified live state
-- already satisfies the requirement. No constraint is dropped by guessed name.
do $$
declare idx_ok boolean; check_row record; literals text[]; six text[] :=
  array['approved','archived','draft','published','rejected','review']; equivalent integer:=0;
begin
  if exists (select 1 from public.play_content_items where stable_id is null) then
    update public.play_content_items set stable_id=question_id where stable_id is null;
  end if;
  if not (select a.attnotnull from pg_attribute a
      where a.attrelid='public.play_content_items'::regclass and a.attname='stable_id') then
    alter table public.play_content_items alter column stable_id set not null;
  end if;
  select exists (select 1 from pg_index i
    where i.indrelid='public.play_content_items'::regclass and i.indisunique and i.indisvalid
      and i.indnatts=1 and i.indpred is null and i.indexprs is null
      and i.indkey[0]=(select attnum from pg_attribute
        where attrelid='public.play_content_items'::regclass and attname='stable_id')) into idx_ok;
  if not idx_ok then
    create unique index play_content_stable_id_v2_idx on public.play_content_items(stable_id);
  end if;

  -- Status domain: accept exactly one existing CHECK that allows precisely the six
  -- statuses; otherwise add one. Any other status CHECK stops the transaction for review.
  for check_row in select c.conname, c.convalidated, pg_get_constraintdef(c.oid) as def
      from pg_constraint c where c.conrelid='public.play_content_items'::regclass and c.contype='c'
        and pg_get_constraintdef(c.oid) ~* '\mstatus\M' and pg_get_constraintdef(c.oid) ~* '''draft''' loop
    select coalesce(array_agg(distinct m[1] order by m[1]),'{}') into literals
      from regexp_matches(check_row.def, '''([a-z_]+)''', 'g') m;
    if literals=six and check_row.convalidated then equivalent:=equivalent+1;
    else raise exception 'Status CHECK % is not the validated six-state domain: %; inspect it manually',
      check_row.conname, check_row.def; end if;
  end loop;
  if equivalent=0 then
    alter table public.play_content_items add constraint play_content_status_v2
      check (status in ('draft','review','approved','rejected','published','archived')) not valid;
    alter table public.play_content_items validate constraint play_content_status_v2;
  end if;
  if exists (select 1 from public.play_content_items
      where status is null or status not in ('draft','review','approved','rejected','published','archived')) then
    raise exception 'Rows with an unknown status exist; reconcile them individually';
  end if;
end $$;

-- Reuse the verified current_user_role() helper. Its existing SECURITY DEFINER
-- profile lookup is not changed; this helper and the review RPC remain INVOKER.
create or replace function public.play_content_editorial_role()
returns text language sql stable security invoker set search_path='' as $$
  select public.current_user_role()::text
$$;
revoke all on function public.play_content_editorial_role() from public, anon;
grant execute on function public.play_content_editorial_role() to authenticated;

create or replace function public.play_content_transition_allowed(p_from text,p_to text,p_role text)
returns boolean language sql immutable set search_path='' as $$
  select (p_from='draft' and p_to='review' and p_role in ('editor','admin','super_admin')) or
    (p_role in ('admin','super_admin') and (
      (p_from='review' and p_to in ('approved','rejected','draft','archived')) or
      (p_from='approved' and p_to in ('published','draft','archived')) or
      (p_from='rejected' and p_to in ('draft','archived')) or
      (p_from='published' and p_to in ('draft','archived')) or
      (p_from='draft' and p_to='archived') or
      (p_from='archived' and p_to='draft')))
$$;
revoke all on function public.play_content_transition_allowed(text,text,text) from public, anon;
grant execute on function public.play_content_transition_allowed(text,text,text) to authenticated;

create or replace function public.play_content_payload_valid(
  p_game text,p_id text,p_category text,p_difficulty text,p_payload jsonb,p_sources jsonb)
returns boolean language plpgsql immutable set search_path='' as $$
declare option_count integer; key_count integer; english_count integer; amharic_count integer;
begin
  if p_difficulty not in ('beginner','growing','challenge') or
     jsonb_typeof(p_payload) is distinct from 'object' or
     jsonb_typeof(p_sources) is distinct from 'array' or
     p_payload->>'id' is distinct from p_id or
     p_payload->>'category' is distinct from p_category or
     nullif(trim(coalesce(p_category,'')),'') is null or
     nullif(trim(coalesce(p_payload#>>'{explanation,en}','')),'') is null or
     nullif(trim(coalesce(p_payload#>>'{source,label}','')),'') is null or
     left(coalesce(p_payload#>>'{source,route}',''),1)<>'/' or
     left(coalesce(p_payload#>>'{source,route}',''),2)='//' or
     p_payload#>>'{source,kind}' not in ('bible','church-library','mezmur','calendar') or
     jsonb_typeof(p_payload->'verifiedLocales') is distinct from 'array' then return false;
  end if;
  if not exists (select 1 from jsonb_array_elements_text(p_payload->'verifiedLocales') l where l.value='en') or
     exists (select 1 from jsonb_array_elements_text(p_payload->'verifiedLocales') l where l.value not in ('en','am')) or
     not exists (select 1 from jsonb_array_elements(p_sources) item
       where item->>'route'=p_payload#>>'{source,route}' and item->>'kind'=p_payload#>>'{source,kind}') then return false;
  end if;
  if p_game='who-am-i' then
    if p_category not in ('biblical-people','biblical-locations','saints','holy-objects') or
       nullif(trim(coalesce(p_payload#>>'{answer,en}','')),'') is null then return false; end if;
  elsif p_game='match' then
    if nullif(trim(coalesce(p_payload#>>'{left,en}','')),'') is null or
       nullif(trim(coalesce(p_payload#>>'{right,en}','')),'') is null then return false; end if;
  elsif p_game in ('trivia','emoji','finish-the-verse','finish-the-mezmur','history') then
    if p_payload->>'game' is distinct from p_game or
       p_payload->>'difficulty' is distinct from p_difficulty or
       nullif(trim(coalesce(p_payload#>>'{prompt,en}','')),'') is null or
       jsonb_typeof(p_payload->'options') is distinct from 'array' then return false; end if;
  else return false;
  end if;
  if p_game not in ('who-am-i','match') then
    if jsonb_array_length(p_payload->'options')<>4 then return false; end if;
  select count(*),count(distinct item->>'key'),
    count(distinct lower(trim(item#>>'{text,en}'))),count(distinct trim(item#>>'{text,am}'))
    into option_count,key_count,english_count,amharic_count
    from jsonb_array_elements(p_payload->'options') item
    where nullif(trim(coalesce(item->>'key','')),'') is not null and
      nullif(trim(coalesce(item#>>'{text,en}','')),'') is not null;
  if option_count<>4 or key_count<>4 or english_count<>4 or
     not exists (select 1 from jsonb_array_elements(p_payload->'options') item
       where item->>'key'=p_payload->>'correctKey') then return false;
  end if;
  end if;
  if exists (select 1 from jsonb_array_elements_text(p_payload->'verifiedLocales') l where l.value='am') then
    if nullif(trim(coalesce(p_payload#>>'{explanation,am}','')),'') is null then return false; end if;
    if p_game='who-am-i' and nullif(trim(coalesce(p_payload#>>'{answer,am}','')),'') is null then return false; end if;
    if p_game='match' and (nullif(trim(coalesce(p_payload#>>'{left,am}','')),'') is null or
      nullif(trim(coalesce(p_payload#>>'{right,am}','')),'') is null) then return false; end if;
    if p_game not in ('who-am-i','match') and
      (nullif(trim(coalesce(p_payload#>>'{prompt,am}','')),'') is null or amharic_count<>4) then return false; end if;
  end if;
  if p_game='emoji' and nullif(trim(coalesce(p_payload->>'emoji','')),'') is null then return false; end if;
  if p_game='finish-the-verse' and (nullif(trim(coalesce(p_payload#>>'{excerpt,en}','')),'') is null or
     (exists (select 1 from jsonb_array_elements_text(p_payload->'verifiedLocales') l where l.value='am') and
      nullif(trim(coalesce(p_payload#>>'{excerpt,am}','')),'') is null)) then return false; end if;
  if p_game='finish-the-mezmur' and coalesce(p_payload->>'mode','') not in
      ('finish-lyrics','missing-word','guess-mezmur','guess-occasion') then return false; end if;
  return true;
end $$;
revoke all on function public.play_content_payload_valid(text,text,text,text,jsonb,jsonb) from public, anon;
grant execute on function public.play_content_payload_valid(text,text,text,text,jsonb,jsonb) to authenticated;

create or replace function public.guard_play_content_editorial()
returns trigger language plpgsql set search_path='' as $$
declare role_name text;
begin
  -- The server-side draft importer (current_user = service_role, set by the API gateway
  -- from a verified key; not spoofable through a JWT claim) may INSERT drafts only. It can
  -- never transition, edit, or publish. Everyone else must be staff with an editorial role.
  if not (tg_op='INSERT' and current_user='service_role') then
    role_name:=public.play_content_editorial_role();
    if not coalesce(public.is_staff(),false) or role_name not in ('editor','admin','super_admin') then
      raise exception 'Staff role required' using errcode='42501';
    end if;
  end if;
  if tg_op='INSERT' then
    if new.status is distinct from 'draft' or new.question_id is distinct from new.stable_id or
       new.payload->>'id' is distinct from new.stable_id then
      raise exception 'New questions must be drafts with matching IDs' using errcode='23514';
    end if;
    new.created_by:=auth.uid();
    new.reviewed_by:=null;
    new.reviewed_at:=null;
    new.published_by:=null;
    new.published_at:=null;
    new.updated_at:=now();
    return new;
  end if;
  if old.id is distinct from new.id or
     old.question_id is distinct from new.question_id or old.stable_id is distinct from new.stable_id or
     new.payload->>'id' is distinct from new.stable_id then
    raise exception 'Question identifiers are immutable' using errcode='23514';
  end if;
  if (old.status<>'draft' or old.status is distinct from new.status) and
     (old.payload is distinct from new.payload or
      old.game_type is distinct from new.game_type or old.category is distinct from new.category or
      old.difficulty is distinct from new.difficulty or old.source_references is distinct from new.source_references) then
    raise exception 'Return to draft before editing content' using errcode='23514';
  end if;
  if old.created_by is distinct from new.created_by then
    raise exception 'Creation audit is immutable' using errcode='42501';
  end if;
  if old.status is distinct from new.status then
    if not public.play_content_transition_allowed(old.status,new.status,role_name) then
      raise exception 'Invalid editorial transition' using errcode='22023';
    end if;
    if new.status in ('review','approved','published') then
      if not public.play_content_payload_valid(old.game_type,old.stable_id,old.category,
          old.difficulty,old.payload,old.source_references) then
        raise exception 'A valid sourced question is required for review' using errcode='23514';
      end if;
      if new.status='published' and old.game_type in ('who-am-i','match') then
        raise exception 'This game does not yet read published CMS cards' using errcode='23514';
      end if;
    end if;
    new.reviewed_by:=case when new.status in ('review','approved','rejected') then auth.uid() else old.reviewed_by end;
    new.reviewed_at:=case when new.status in ('review','approved','rejected') then now() else old.reviewed_at end;
    new.published_by:=case when new.status='published' then auth.uid() else old.published_by end;
    new.published_at:=case when new.status='published' then now() else null end;
  else
    if old.review_notes is distinct from new.review_notes or old.reviewed_by is distinct from new.reviewed_by or
       old.reviewed_at is distinct from new.reviewed_at or old.published_by is distinct from new.published_by or
       old.published_at is distinct from new.published_at then
      raise exception 'Editorial fields require a status transition' using errcode='42501';
    end if;
  end if;
  new.updated_at:=now();
  return new;
end $$;
revoke all on function public.guard_play_content_editorial() from public, anon, authenticated;
drop trigger if exists play_content_editorial_guard on public.play_content_items;
create trigger play_content_editorial_guard before insert or update on public.play_content_items
  for each row execute function public.guard_play_content_editorial();

-- Keep SECURITY INVOKER: table grants and RLS are evaluated for the caller.
create or replace function public.review_play_content(p_id uuid,p_status text,p_notes text default null)
returns public.play_content_items language plpgsql security invoker set search_path='' as $$
declare current_row public.play_content_items; saved public.play_content_items; role_name text;
begin
  role_name:=public.play_content_editorial_role();
  if not coalesce(public.is_staff(),false) or role_name not in ('editor','admin','super_admin') then
    raise exception 'Staff role required' using errcode='42501';
  end if;
  select * into current_row from public.play_content_items where id=p_id for update;
  if current_row.id is null then raise exception 'Question not found' using errcode='P0002'; end if;
  if not public.play_content_transition_allowed(current_row.status,p_status,role_name) then
    raise exception 'Invalid editorial transition' using errcode='22023';
  end if;
  update public.play_content_items set status=p_status,review_notes=p_notes
    where id=p_id returning * into saved;
  return saved;
end $$;
revoke all on function public.review_play_content(uuid,text,text) from public, anon;
grant execute on function public.review_play_content(uuid,text,text) to authenticated;

alter table public.play_content_items enable row level security;
revoke all on public.play_content_items from public, anon, authenticated;
grant select on public.play_content_items to anon, authenticated;
grant insert, update on public.play_content_items to authenticated;
-- All previous permissive policies, including admin ALL, are replaced atomically.
do $$ declare policy_row record; begin
  for policy_row in select policyname from pg_policies
    where schemaname='public' and tablename='play_content_items' loop
    execute format('drop policy %I on public.play_content_items', policy_row.policyname);
  end loop;
end $$;
create policy play_content_public_select on public.play_content_items for select to anon,authenticated
  using (status='published' and published_at is not null);
create policy play_content_staff_select on public.play_content_items for select to authenticated
  using (coalesce(public.is_staff(),false) and public.play_content_editorial_role() in ('editor','admin','super_admin'));
create policy play_content_staff_insert on public.play_content_items for insert to authenticated
  with check (coalesce(public.is_staff(),false) and public.play_content_editorial_role() in ('editor','admin','super_admin')
    and status='draft' and question_id=stable_id);
create policy play_content_editor_update on public.play_content_items for update to authenticated
  using (coalesce(public.is_staff(),false) and public.play_content_editorial_role()='editor' and status='draft')
  with check (coalesce(public.is_staff(),false) and public.play_content_editorial_role()='editor' and status in ('draft','review'));
create policy play_content_admin_update on public.play_content_items for update to authenticated
  using (coalesce(public.is_staff(),false) and public.play_content_editorial_role() in ('admin','super_admin'))
  with check (coalesce(public.is_staff(),false) and public.play_content_editorial_role() in ('admin','super_admin'));

notify pgrst,'reload schema';
-- In the SAME session, run catalog checks, then COMMIT on approved staging.
-- ROLLBACK cancels the uncommitted proposal. JWT/RLS probes need a committed
-- staging migration because other sessions cannot see this transaction.
