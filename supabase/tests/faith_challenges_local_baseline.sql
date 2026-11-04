-- Synthetic PostgreSQL baseline ONLY. No real Supabase Auth/JWT/PostgREST.
-- Used only by the disposable loopback-cluster runner; never install as a migration.
do $$ begin
 if not exists(select 1 from pg_roles where rolname='anon') then create role anon nologin; end if;
 if not exists(select 1 from pg_roles where rolname='authenticated') then create role authenticated nologin; end if;
 if not exists(select 1 from pg_roles where rolname='service_role') then create role service_role nologin bypassrls; end if;
end $$;
create schema auth;
create table auth.users(id uuid primary key,email text not null);
create function auth.uid() returns uuid language sql stable as $$
 select nullif(current_setting('request.jwt.claim.sub',true),'')::uuid
$$;
grant usage on schema auth to anon,authenticated,service_role;
grant execute on function auth.uid() to anon,authenticated,service_role;
create table public.profiles(id uuid primary key references auth.users(id),role text not null);
create function public.current_user_role() returns text language sql stable security definer set search_path='' as $$
 select role from public.profiles where id=auth.uid()
$$;
create function public.is_staff() returns boolean language sql stable security definer set search_path='' as $$
 select coalesce(public.current_user_role() in ('editor','admin','super_admin'),false)
$$;
insert into auth.users values
 ('fca00000-0000-0000-0000-000000000001','local-user@example.invalid'),
 ('fca00000-0000-0000-0000-000000000002','local-editor@example.invalid'),
 ('fca00000-0000-0000-0000-000000000003','local-admin@example.invalid'),
 ('fca00000-0000-0000-0000-000000000004','local-super@example.invalid');
insert into public.profiles select id,case right(id::text,1) when '1' then 'user' when '2' then 'editor'
 when '3' then 'admin' else 'super_admin' end from auth.users;
create table public.play_content_items(
 id uuid primary key default gen_random_uuid(), question_id text not null unique, stable_id text,
 game_type text not null,category text not null,difficulty text not null,payload jsonb not null,
 source_references jsonb not null default '[]',status text not null default 'draft',review_notes text,
 created_by uuid references auth.users(id),reviewed_by uuid references auth.users(id),
 reviewed_at timestamptz,published_by uuid references auth.users(id),published_at timestamptz,
 created_at timestamptz not null default now(),updated_at timestamptz not null default now(),
 constraint local_six_states check(status in ('draft','review','approved','rejected','published','archived'))
);
create table public.test_play_dependencies(content_id uuid references public.play_content_items(id) on delete restrict);
alter table public.play_content_items enable row level security;
grant select,insert,update,delete on public.play_content_items to anon,authenticated,service_role;
create policy legacy_staff_all on public.play_content_items for all to authenticated
 using(public.is_staff()) with check(public.is_staff());
create policy legacy_public_read on public.play_content_items for select to anon using(status='published');
create function public.review_play_content(p_id uuid,p_status text,p_notes text default null)
returns public.play_content_items language plpgsql security definer as $$
declare saved public.play_content_items; begin
 update public.play_content_items set status=p_status,review_notes=p_notes where id=p_id returning * into saved;
 return saved;
end $$;
-- Keep function defaults realistic for the server importer in this simulation.
alter default privileges in schema public grant execute on functions to service_role;

create function public.local_test_payload(p_id text,p_mode jsonb default '"finish-lyrics"') returns jsonb
language sql immutable as $$
 select jsonb_build_object('id',p_id,'game','finish-the-mezmur','category','Bible','difficulty','beginner',
 'prompt',jsonb_build_object('en','Synthetic local question'),
 'options','[{"key":"a","text":{"en":"One"}},{"key":"b","text":{"en":"Two"}},
             {"key":"c","text":{"en":"Three"}},{"key":"d","text":{"en":"Four"}}]'::jsonb,
 'correctKey','a','explanation',jsonb_build_object('en','Synthetic explanation'),
 'source','{"label":"Synthetic source","route":"/bible","kind":"bible"}'::jsonb,
 'verifiedLocales','["en"]'::jsonb,'mode',p_mode)
$$;
insert into public.play_content_items(id,question_id,stable_id,game_type,category,difficulty,payload,source_references,status)
select ('fcb00000-0000-0000-0000-'||lpad(n::text,12,'0'))::uuid,'local-'||n,null,'finish-the-mezmur','Bible','beginner',
 public.local_test_payload('local-'||n), '[{"label":"Synthetic source","route":"/bible","kind":"bible"}]',state
from (values(1,'draft'),(2,'review'),(3,'approved'),(4,'rejected'),(5,'published'),(6,'archived')) v(n,state);
update public.play_content_items set published_at=now() where status='published';
-- Legacy approved rows whose missing/JSON-null modes must block next publication.
insert into public.play_content_items(id,question_id,stable_id,game_type,category,difficulty,payload,source_references,status)
select ('fcb00000-0000-0000-0000-'||lpad(n::text,12,'0'))::uuid,'local-'||n,null,'finish-the-mezmur','Bible','beginner',
 case when n=7 then public.local_test_payload('local-'||n)-'mode' else public.local_test_payload('local-'||n,'null'::jsonb) end,
 '[{"label":"Synthetic source","route":"/bible","kind":"bible"}]','approved'
from generate_series(7,8) n;
