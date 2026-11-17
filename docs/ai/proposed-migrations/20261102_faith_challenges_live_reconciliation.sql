-- PROPOSAL ONLY, revised 2026-11-16 from independently verified live catalog facts.
-- DO NOT APPLY TO PRODUCTION. Apply first to an isolated staging clone and run
-- supabase/tests/faith_challenges_validation_regressions.sql plus the real-role probes.
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
  if not exists(select 1 from pg_extension where extname='pgcrypto') then
    raise exception 'pgcrypto is required for import audit hashes';
  end if;
  if exists (select 1 from (values ('question_id'),('stable_id'),('status'),('payload'),
      ('source_references'),('game_type'),('category'),('difficulty'),('review_notes'),
      ('created_by'),('reviewed_by'),('reviewed_at'),('published_by'),('published_at'),('updated_at')) v(name)
      where not exists (select 1 from pg_attribute a
        where a.attrelid='public.play_content_items'::regclass and a.attname=v.name and not a.attisdropped)) then
    raise exception 'Required play_content_items column is missing';
  end if;
  -- The publication gate reads public.church_library_books at publish time. Verify the hosted catalog really has the
  -- columns it needs now, instead of discovering a mismatch (or silently blocking every library-backed item) later.
  if to_regclass('public.church_library_books') is null then
    raise exception 'public.church_library_books is missing; the Church Library source gate cannot run';
  end if;
  if (select count(*) from pg_attribute a
        where a.attrelid='public.church_library_books'::regclass and not a.attisdropped
          and a.attname in ('slug','publication_status')
          and format_type(a.atttypid,a.atttypmod) in ('text','character varying','citext'))<>2 then
    raise exception 'public.church_library_books must have text columns slug and publication_status';
  end if;
  if not exists(select 1 from pg_roles where rolname='anon') or not exists(select 1 from pg_roles where rolname='authenticated')
     or not exists(select 1 from pg_roles where rolname='service_role') then
    raise exception 'Supabase roles anon, authenticated and service_role must exist';
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
declare idx_ok boolean; check_row record; literals text[];
  six text[] := array['approved','archived','draft','published','rejected','review'];
  live_four text[] := array['archived','draft','published','review'];
  all_games text[] := array['adventure','adventures','bible-timeline','emoji','feasts','finish-the-mezmur',
    'finish-the-verse','history','icon-memory','match','saints','trivia','who-am-i'];
  live_games text[] := array['adventure','emoji','finish-the-mezmur','finish-the-verse','history','trivia'];
  equivalent integer:=0; old_status_name text; game_equivalent integer:=0; old_game_name text;
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

  -- Replace only the independently verified four-state domain. Unknown or multiple
  -- status-domain checks abort; constraints are never dropped by a guessed name.
  for check_row in select c.conname, c.convalidated, pg_get_constraintdef(c.oid) as def
      from pg_constraint c where c.conrelid='public.play_content_items'::regclass and c.contype='c'
        and pg_get_constraintdef(c.oid) ~* '\mstatus\M' and pg_get_constraintdef(c.oid) ~* '''draft''' loop
    select coalesce(array_agg(distinct m[1] order by m[1]),'{}') into literals
      from regexp_matches(check_row.def, '''([a-z_]+)''', 'g') m;
    if literals=six and check_row.convalidated then equivalent:=equivalent+1;
    elsif literals=live_four and check_row.convalidated then
      if old_status_name is not null then raise exception 'Multiple live four-state CHECKs found'; end if;
      old_status_name:=check_row.conname;
    else raise exception 'Unrecognized status CHECK %: %', check_row.conname, check_row.def; end if;
  end loop;
  if equivalent>0 and old_status_name is not null then raise exception 'Both four-state and six-state status CHECKs exist'; end if;
  if old_status_name is not null then execute format('alter table public.play_content_items drop constraint %I',old_status_name); end if;
  if equivalent=0 then
    alter table public.play_content_items add constraint play_content_status_v2
      check (status in ('draft','review','approved','rejected','published','archived')) not valid;
    alter table public.play_content_items validate constraint play_content_status_v2;
  end if;
  if exists (select 1 from public.play_content_items
      where status is null or status not in ('draft','review','approved','rejected','published','archived')) then
    raise exception 'Rows with an unknown status exist; reconcile them individually';
  end if;

  -- `adventure` remains valid for legacy rows. New inserts are canonicalized by the
  -- guard to `adventures`, matching every current Studio/runtime identifier.
  for check_row in select c.conname,c.convalidated,pg_get_constraintdef(c.oid) as def
      from pg_constraint c where c.conrelid='public.play_content_items'::regclass and c.contype='c'
        and pg_get_constraintdef(c.oid) ~* '\mgame_type\M' loop
    select coalesce(array_agg(distinct m[1] order by m[1]),'{}') into literals
      from regexp_matches(check_row.def, '''([a-z-]+)''', 'g') m;
    if literals=all_games and check_row.convalidated then game_equivalent:=game_equivalent+1;
    elsif literals=live_games and check_row.convalidated then
      if old_game_name is not null then raise exception 'Multiple live game-type CHECKs found'; end if;
      old_game_name:=check_row.conname;
    else raise exception 'Unrecognized game_type CHECK %: %',check_row.conname,check_row.def; end if;
  end loop;
  if game_equivalent>0 and old_game_name is not null then raise exception 'Both old and expanded game CHECKs exist'; end if;
  if old_game_name is not null then execute format('alter table public.play_content_items drop constraint %I',old_game_name); end if;
  if game_equivalent=0 then
    alter table public.play_content_items add constraint play_content_game_type_v2 check (game_type in
      ('trivia','emoji','finish-the-verse','finish-the-mezmur','history','who-am-i','match',
       'bible-timeline','adventures','adventure','feasts','saints','icon-memory')) not valid;
    alter table public.play_content_items validate constraint play_content_game_type_v2;
  end if;
  if exists (select 1 from public.play_content_items where game_type not in
      ('trivia','emoji','finish-the-verse','finish-the-mezmur','history','who-am-i','match',
       'bible-timeline','adventures','adventure','feasts','saints','icon-memory')) then
    raise exception 'Rows with an unknown game type exist';
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

create or replace function public.play_content_activity_valid(
  p_game text,p_id text,p_category text,p_difficulty text,p_payload jsonb,p_sources jsonb)
returns boolean language plpgsql immutable set search_path='' as $$
declare content jsonb; draft jsonb; n integer; distinct_n integer; nested_game text;
begin
  if jsonb_typeof(p_payload) is distinct from 'object' or p_payload->>'format' is distinct from 'studio-activity-v1'
     or p_payload->>'id' is distinct from p_id or octet_length(p_payload::text)>128000
     or nullif(trim(coalesce(p_payload->>'name','')),'') is null or length(p_payload->>'name')>500
     or jsonb_typeof(p_payload->'verifiedLocales') is distinct from 'array'
     or not exists(select 1 from jsonb_array_elements_text(p_payload->'verifiedLocales') x where x.value='en')
     or exists(select 1 from jsonb_array_elements_text(p_payload->'verifiedLocales') x where x.value not in ('en','am'))
     or jsonb_typeof(p_payload->'draft') is distinct from 'object'
     or jsonb_typeof(p_sources) is distinct from 'array' or jsonb_array_length(p_sources)=0
     or exists(select 1 from jsonb_array_elements(p_sources) s where jsonb_typeof(s)<>'object'
       or coalesce(s->>'kind','') not in ('bible','church-library','mezmur','calendar')
       or left(coalesce(s->>'route',''),1)<>'/' or left(coalesce(s->>'route',''),2)='//'
       or nullif(trim(coalesce(s->>'label','')),'') is null)
     or p_difficulty not in ('beginner','growing','challenge')
     or nullif(trim(coalesce(p_category,'')),'') is null then return false;
  end if;
  if p_payload ? 'sortOrder' and (jsonb_typeof(p_payload->'sortOrder')<>'number'
      or (p_payload->>'sortOrder')::numeric<>trunc((p_payload->>'sortOrder')::numeric)
      or (p_payload->>'sortOrder')::numeric not between 0 and 100000) then return false; end if;
  draft:=p_payload->'draft'; content:=draft->'content'; nested_game:=draft->>'game';
  if not (nested_game=p_game or (p_game='adventures' and nested_game='adventure')
      or (p_game='adventure' and nested_game='adventures')) then return false; end if;

  if p_game in ('trivia','emoji','finish-the-verse') then
    if jsonb_typeof(content)<>'object' or content->>'id' is null
       or nullif(trim(coalesce(content#>>'{prompt,en}','')),'') is null
       or nullif(trim(coalesce(content#>>'{explanation,en}','')),'') is null
       or jsonb_typeof(content->'options')<>'array' or jsonb_array_length(content->'options')<>4
       or not exists(select 1 from jsonb_array_elements(content->'options') o where o->>'key'=content->>'correctKey') then return false; end if;
    select count(*),count(distinct o->>'key') into n,distinct_n from jsonb_array_elements(content->'options') o
      where nullif(trim(coalesce(o->>'key','')),'') is not null and nullif(trim(coalesce(o#>>'{text,en}','')),'') is not null;
    if n<>4 or distinct_n<>4 then return false; end if;
    if p_game='emoji' and nullif(trim(coalesce(content->>'emoji','')),'') is null then return false; end if;
    if p_game='finish-the-verse' and nullif(trim(coalesce(content#>>'{excerpt,en}','')),'') is null then return false; end if;
  elsif p_game='who-am-i' then
    if jsonb_typeof(content)<>'object' or nullif(trim(coalesce(content->>'id','')),'') is null
       or nullif(trim(coalesce(content#>>'{answer,en}','')),'') is null
       or nullif(trim(coalesce(content#>>'{explanation,en}','')),'') is null then return false; end if;
  elsif p_game='match' then
    if jsonb_typeof(content)<>'array' or jsonb_array_length(content) not between 1 and 20 then return false; end if;
    select count(*),count(distinct x->>'id') into n,distinct_n from jsonb_array_elements(content) x
      where nullif(trim(coalesce(x->>'id','')),'') is not null
        and nullif(trim(coalesce(x#>>'{left,en}','')),'') is not null
        and nullif(trim(coalesce(x#>>'{right,en}','')),'') is not null
        and nullif(trim(coalesce(x#>>'{explanation,en}','')),'') is not null;
    if n<>jsonb_array_length(content) or distinct_n<>n then return false; end if;
  elsif p_game='bible-timeline' then
    if jsonb_typeof(content)<>'object' or jsonb_typeof(content->'events')<>'array'
       or jsonb_array_length(content->'events') not between 3 and 50 then return false; end if;
    select count(*),count(distinct x->>'id') into n,distinct_n from jsonb_array_elements(content->'events') x
      where nullif(trim(coalesce(x->>'id','')),'') is not null and nullif(trim(coalesce(x->>'ref','')),'') is not null
        and coalesce(x->>'route','') like '/bible/%' and nullif(trim(coalesce(x#>>'{title,en}','')),'') is not null;
    if n<>jsonb_array_length(content->'events') or distinct_n<>n then return false; end if;
  elsif p_game='history' then
    if jsonb_typeof(content)<>'array' or jsonb_array_length(content) not between 3 and 30 then return false; end if;
    select count(*),count(distinct (x->>'year')::integer) into n,distinct_n from jsonb_array_elements(content) x
      where (x->>'year')~'^[0-9]{1,4}$' and (x->>'year')::integer between 1 and 3000
        and nullif(trim(coalesce(x->>'id','')),'') is not null and nullif(trim(coalesce(x#>>'{label,en}','')),'') is not null;
    if n<>jsonb_array_length(content) or distinct_n<>n then return false; end if;
  elsif p_game in ('adventures','adventure') then
    if jsonb_typeof(content)<>'object' or jsonb_typeof(content->'scenes')<>'array'
       or jsonb_array_length(content->'scenes')<>3 or nullif(trim(coalesce(content->>'id','')),'') is null then return false; end if;
    if exists(select 1 from jsonb_array_elements(content->'scenes') s where
      nullif(trim(coalesce(s#>>'{title,en}','')),'') is null
      or nullif(trim(coalesce(s#>>'{narrative,en}','')),'') is null
      or coalesce(s#>>'{interaction,kind}','') not in ('discover','question')
      or s ? 'branches' or (s->'interaction') ? 'nextSceneId' or (s->'interaction') ? 'outcomes') then return false; end if;
    if exists(select 1 from jsonb_array_elements(content->'scenes') s where
      (s#>>'{interaction,kind}'='discover' and (
        jsonb_typeof(s#>'{interaction,details}')<>'array' or jsonb_array_length(s#>'{interaction,details}') not between 1 and 10
        or exists(select 1 from jsonb_array_elements(s#>'{interaction,details}') d where
          nullif(trim(coalesce(d->>'id','')),'') is null or nullif(trim(coalesce(d#>>'{label,en}','')),'') is null
          or nullif(trim(coalesce(d#>>'{finding,en}','')),'') is null)))
      or (s#>>'{interaction,kind}'='question' and (
        nullif(trim(coalesce(s#>>'{interaction,prompt,en}','')),'') is null
        or jsonb_typeof(s#>'{interaction,choices}')<>'array' or jsonb_array_length(s#>'{interaction,choices}') not between 2 and 6
        or not exists(select 1 from jsonb_array_elements(s#>'{interaction,choices}') c
          where c->>'id'=s#>>'{interaction,correctId}')
        or exists(select 1 from jsonb_array_elements(s#>'{interaction,choices}') c where
          nullif(trim(coalesce(c->>'id','')),'') is null or nullif(trim(coalesce(c#>>'{label,en}','')),'') is null)
        or nullif(trim(coalesce(s#>>'{interaction,explanation,en}','')),'') is null))) then return false; end if;
  elsif p_game in ('feasts','saints','icon-memory') then
    if jsonb_typeof(content)<>'array' then return false; end if;
    n:=jsonb_array_length(content);
    if (p_game='icon-memory' and n not in (4,6,8)) or (p_game<>'icon-memory' and n not between 4 and 12) then return false; end if;
    select count(distinct x->>'id') into distinct_n from jsonb_array_elements(content) x
      where nullif(trim(coalesce(x->>'id','')),'') is not null and nullif(trim(coalesce(x->>'src','')),'') is not null
        and nullif(trim(coalesce(x#>>'{answer,en}','')),'') is not null;
    if distinct_n<>n then return false; end if;
  elsif p_game='finish-the-mezmur' then
    if p_payload->'sourceOnly' is distinct from 'true'::jsonb or jsonb_typeof(content)<>'object'
       or nullif(trim(coalesce(content->>'slug','')),'') is null or nullif(trim(coalesce(content->>'title','')),'') is null
       or coalesce(content->>'lyrics_amharic','')<>'' or coalesce(content->>'lyrics_english','')<>''
       or coalesce(content->>'lyrics_transliteration','')<>'' or coalesce(content->>'youtube_url','')<>''
       or exists(select 1 from jsonb_object_keys(content) k where k not in
         ('slug','title','title_amharic','title_english','primary_language','lyrics_amharic','lyrics_english','lyrics_transliteration','youtube_url')) then return false; end if;
  else return false;
  end if;
  return true;
exception when others then return false;
end $$;
revoke all on function public.play_content_activity_valid(text,text,text,text,jsonb,jsonb) from public,anon;
grant execute on function public.play_content_activity_valid(text,text,text,text,jsonb,jsonb) to authenticated;

-- Supabase normally installs pgcrypto in `extensions`, while older/local databases
-- may have it in `public`. Resolve the catalog-owned extension schema explicitly.
create or replace function public.play_content_payload_sha256(p_payload jsonb)
returns text language plpgsql stable set search_path='' as $$
declare extension_schema name; result text;
begin
  select n.nspname into extension_schema from pg_extension e join pg_namespace n on n.oid=e.extnamespace
    where e.extname='pgcrypto';
  if extension_schema is null then raise exception 'pgcrypto is required'; end if;
  execute format('select pg_catalog.encode(%I.digest($1::text,''sha256''),''hex'')',extension_schema)
    into result using p_payload;
  return result;
end $$;
revoke all on function public.play_content_payload_sha256(jsonb) from public,anon;
grant execute on function public.play_content_payload_sha256(jsonb) to authenticated,service_role;

create or replace function public.play_content_payload_valid(
  p_game text,p_id text,p_category text,p_difficulty text,p_payload jsonb,p_sources jsonb)
returns boolean language plpgsql immutable set search_path='' as $$
declare option_count integer; key_count integer; english_count integer; amharic_count integer;
begin
  if p_payload->>'format'='studio-activity-v1' then
    return public.play_content_activity_valid(p_game,p_id,p_category,p_difficulty,p_payload,p_sources);
  end if;
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

create or replace function public.play_content_sources_publishable(p_sources jsonb)
returns boolean language plpgsql stable security invoker set search_path='' as $$
declare source_row jsonb; source_slug text;
begin
  if jsonb_typeof(p_sources) is distinct from 'array' then return false; end if;
  for source_row in select value from jsonb_array_elements(p_sources) loop
    if source_row->>'kind'='church-library' then
      source_slug:=substring(source_row->>'route' from '^/library/read/([^/?#]+)');
      if source_slug is null or not exists(select 1 from public.church_library_books b
          where b.slug=source_slug and b.publication_status='published') then return false; end if;
    end if;
  end loop;
  return true;
end $$;
revoke all on function public.play_content_sources_publishable(jsonb) from public,anon;
grant execute on function public.play_content_sources_publishable(jsonb) to authenticated;

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
    if new.game_type='adventure' then new.game_type:='adventures'; end if;
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
      if new.status='published' and not public.play_content_sources_publishable(old.source_references) then
        raise exception 'Every Church Library source must exist and be published before this item can publish' using errcode='23514';
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
revoke update,delete on public.play_content_items from service_role;
grant select,insert on public.play_content_items to service_role;
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

-- Import audit is append-oriented and not anonymous. One RPC call records every
-- attempted manifest row, inserted UUID, failure/conflict, and exact rollback scope.
create table if not exists public.play_content_import_batches (
  id uuid primary key default gen_random_uuid(),
  source_commit text not null check (source_commit ~ '^[0-9a-f]{7,40}$'),
  manifest_sha256 text not null check (manifest_sha256 ~ '^[0-9a-f]{64}$'),
  requested_count integer not null check (requested_count between 1 and 1000),
  inserted_count integer not null default 0 check (inserted_count>=0),
  duplicate_count integer not null default 0 check (duplicate_count>=0),
  conflict_count integer not null default 0 check (conflict_count>=0),
  failed_count integer not null default 0 check (failed_count>=0),
  status text not null default 'running' check (status in ('running','completed','partial','failed','rolled_back','partial_rollback')),
  created_at timestamptz not null default now(), completed_at timestamptz
);
create table if not exists public.play_content_import_items (
  batch_id uuid not null references public.play_content_import_batches(id) on delete restrict,
  ordinal integer not null check (ordinal>0), stable_id text, manifest_hash text,
  result text not null check (result in ('inserted','duplicate','conflict','failed','rolled_back','rollback_blocked')),
  inserted_id uuid, inserted_updated_at timestamptz, payload_sha256 text, error text,
  rollback_eligible boolean not null default false, rollback_reason text,
  created_at timestamptz not null default now(), primary key(batch_id,ordinal)
);
create index if not exists play_content_import_items_stable_idx on public.play_content_import_items(stable_id);
alter table public.play_content_import_batches enable row level security;
alter table public.play_content_import_items enable row level security;
revoke all on public.play_content_import_batches,public.play_content_import_items from public,anon,authenticated;
grant select on public.play_content_import_batches,public.play_content_import_items to authenticated;
grant select,insert,update on public.play_content_import_batches,public.play_content_import_items to service_role;
drop policy if exists play_content_import_admin_batches on public.play_content_import_batches;
create policy play_content_import_admin_batches on public.play_content_import_batches for select to authenticated
  using (coalesce(public.is_staff(),false) and public.play_content_editorial_role() in ('admin','super_admin'));
drop policy if exists play_content_import_admin_items on public.play_content_import_items;
create policy play_content_import_admin_items on public.play_content_import_items for select to authenticated
  using (coalesce(public.is_staff(),false) and public.play_content_editorial_role() in ('admin','super_admin'));

grant execute on function public.play_content_payload_valid(text,text,text,text,jsonb,jsonb) to service_role;
grant execute on function public.play_content_activity_valid(text,text,text,text,jsonb,jsonb) to service_role;

create or replace function public.import_play_content_drafts(
  p_manifest jsonb,p_source_commit text,p_manifest_sha256 text)
returns jsonb language plpgsql security invoker set search_path='' as $$
declare batch_id uuid; item jsonb; ordinal integer; stable text; canonical_game text;
  existing public.play_content_items; saved public.play_content_items; result_name text; failure text;
begin
  if current_user<>'service_role' then raise exception 'Service role required' using errcode='42501'; end if;
  if jsonb_typeof(p_manifest) is distinct from 'array' or jsonb_array_length(p_manifest) not between 1 and 1000
     or p_source_commit !~ '^[0-9a-f]{7,40}$' or p_manifest_sha256 !~ '^[0-9a-f]{64}$' then
    raise exception 'Invalid import manifest metadata' using errcode='22023';
  end if;
  insert into public.play_content_import_batches(source_commit,manifest_sha256,requested_count)
    values(p_source_commit,p_manifest_sha256,jsonb_array_length(p_manifest)) returning id into batch_id;
  for item,ordinal in select value,ordinality::integer from jsonb_array_elements(p_manifest) with ordinality loop
    stable:=item->>'stable_id'; canonical_game:=case when item->>'game_type'='adventure' then 'adventures' else item->>'game_type' end;
    failure:=null; existing:=null; saved:=null;
    begin
      if stable is null or stable !~ '^[a-z0-9]+(-[a-z0-9]+)*$' or length(stable)>160 then
        raise exception 'Invalid stable ID' using errcode='22023';
      end if;
      if not public.play_content_payload_valid(canonical_game,stable,item->>'category',item->>'difficulty',item->'payload',item->'source_references') then
        raise exception 'Server validation rejected this game payload or source mapping' using errcode='23514';
      end if;
      -- Serialize concurrent importer calls for the same stable ID without granting
      -- service_role UPDATE solely to satisfy SELECT ... FOR UPDATE.
      perform pg_advisory_xact_lock(hashtextextended(stable,0));
      select * into existing from public.play_content_items where stable_id=stable;
      if existing.id is not null then
        if existing.game_type=canonical_game and existing.category=item->>'category' and existing.difficulty=item->>'difficulty'
           and existing.payload=item->'payload' and existing.source_references=item->'source_references' then result_name:='duplicate';
        else result_name:='conflict'; failure:='Stable ID already exists with different content; existing row left untouched'; end if;
        insert into public.play_content_import_items(batch_id,ordinal,stable_id,manifest_hash,result,inserted_id,payload_sha256,error,rollback_reason)
          values(batch_id,ordinal,stable,item->>'hash',result_name,existing.id,
            public.play_content_payload_sha256(coalesce(item->'payload','null'::jsonb)),failure,'Existing rows are never part of rollback scope');
      else
        insert into public.play_content_items(question_id,stable_id,game_type,category,difficulty,payload,source_references,status,review_notes)
          values(stable,stable,canonical_game,item->>'category',item->>'difficulty',item->'payload',item->'source_references','draft',
            format('Draft import %s; source commit %s; manifest row %s',batch_id,p_source_commit,ordinal)) returning * into saved;
        insert into public.play_content_import_items(batch_id,ordinal,stable_id,manifest_hash,result,inserted_id,inserted_updated_at,payload_sha256,rollback_eligible,rollback_reason)
          values(batch_id,ordinal,stable,item->>'hash','inserted',saved.id,saved.updated_at,
            public.play_content_payload_sha256(saved.payload),true,'Eligible only while the row remains an unchanged draft');
      end if;
    exception when others then
      get stacked diagnostics failure=message_text;
      insert into public.play_content_import_items(batch_id,ordinal,stable_id,manifest_hash,result,error,rollback_reason)
        values(batch_id,ordinal,stable,item->>'hash','failed',failure,'No row was inserted');
    end;
  end loop;
  update public.play_content_import_batches b set
    inserted_count=(select count(*) from public.play_content_import_items i where i.batch_id=b.id and i.result='inserted'),
    duplicate_count=(select count(*) from public.play_content_import_items i where i.batch_id=b.id and i.result='duplicate'),
    conflict_count=(select count(*) from public.play_content_import_items i where i.batch_id=b.id and i.result='conflict'),
    failed_count=(select count(*) from public.play_content_import_items i where i.batch_id=b.id and i.result='failed'),
    status=case
      when exists(select 1 from public.play_content_import_items i where i.batch_id=b.id and i.result in ('failed','conflict'))
        then case when exists(select 1 from public.play_content_import_items i where i.batch_id=b.id and i.result='inserted') then 'partial' else 'failed' end
      else 'completed' end,
    completed_at=now() where b.id=batch_id;
  return (select to_jsonb(b) || jsonb_build_object('items',(select coalesce(jsonb_agg(to_jsonb(i) order by i.ordinal),'[]'::jsonb)
    from public.play_content_import_items i where i.batch_id=b.id)) from public.play_content_import_batches b where b.id=batch_id);
end $$;
revoke all on function public.import_play_content_drafts(jsonb,text,text) from public,anon,authenticated;
grant execute on function public.import_play_content_drafts(jsonb,text,text) to service_role;

-- The ONLY SECURITY DEFINER function in this proposal, and it must stay that way (scripts/test-faith-challenges-authorization.mjs
-- allowlists exactly this signature). Why it is definer: service_role has no DELETE grant on play_content_items and BYPASSRLS, so
-- SECURITY INVOKER fails with "permission denied" unless service_role were granted DELETE on EVERY row, published ones included.
-- A definer function limited to "unchanged drafts this batch inserted" is strictly narrower than that grant.
-- Assumptions to verify on staging: the owner is the migration role (postgres on Supabase); EXECUTE is revoked from PUBLIC, anon
-- and authenticated below and granted only to service_role; search_path is empty and every reference is schema-qualified; there is
-- no dynamic SQL. Deletion is ONE atomic statement whose WHERE clause carries every precondition, so a concurrent edit or status
-- change committed after the audit row was read makes the DELETE match nothing instead of removing a changed row.
create or replace function public.rollback_play_content_import(p_batch_id uuid)
returns jsonb language plpgsql security definer set search_path='' as $$
declare audit_row public.play_content_import_items; removed integer:=0; blocked integer:=0; deleted_id uuid;
  new_status text;
begin
  if p_batch_id is null or not exists(select 1 from public.play_content_import_batches b where b.id=p_batch_id) then
    raise exception 'Unknown import batch' using errcode='P0002';
  end if;
  for audit_row in select * from public.play_content_import_items where batch_id=p_batch_id and result='inserted' order by ordinal for update loop
    deleted_id:=null;
    delete from public.play_content_items p
      where p.id=audit_row.inserted_id and p.stable_id=audit_row.stable_id and p.status='draft'
        and p.published_at is null and p.published_by is null and p.reviewed_by is null and p.reviewed_at is null
        and p.updated_at=audit_row.inserted_updated_at
        and public.play_content_payload_sha256(p.payload)=audit_row.payload_sha256
      returning p.id into deleted_id;
    if deleted_id is not null then
      update public.play_content_import_items set result='rolled_back',rollback_eligible=false,rollback_reason='Deleted unchanged draft created by this batch'
        where batch_id=p_batch_id and ordinal=audit_row.ordinal; removed:=removed+1;
    else
      update public.play_content_import_items set result='rollback_blocked',rollback_eligible=false,
        rollback_reason='Row is missing, edited, or no longer draft; manual editorial resolution required'
        where batch_id=p_batch_id and ordinal=audit_row.ordinal; blocked:=blocked+1;
    end if;
  end loop;
  -- Derive the batch status from the audit rows so a repeat call can never turn a partial rollback into "rolled_back".
  new_status:=case
    when exists(select 1 from public.play_content_import_items i where i.batch_id=p_batch_id and i.result='rollback_blocked') then 'partial_rollback'
    when exists(select 1 from public.play_content_import_items i where i.batch_id=p_batch_id and i.result='rolled_back') then 'rolled_back'
    else null end;
  if new_status is not null then
    update public.play_content_import_batches set status=new_status,completed_at=now() where id=p_batch_id;
  end if;
  return jsonb_build_object('batch_id',p_batch_id,'removed',removed,'blocked',blocked);
end $$;
revoke all on function public.rollback_play_content_import(uuid) from public,anon,authenticated;
grant execute on function public.rollback_play_content_import(uuid) to service_role;

notify pgrst,'reload schema';
-- In the SAME session, run catalog checks, then COMMIT on approved staging.
-- ROLLBACK cancels the uncommitted proposal. JWT/RLS probes need a committed
-- staging migration because other sessions cannot see this transaction.
