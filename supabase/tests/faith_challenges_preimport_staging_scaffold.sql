\set ON_ERROR_STOP on
create extension if not exists pgcrypto;
do $$ begin
  if not exists(select 1 from pg_roles where rolname='anon') then create role anon nologin; end if;
  if not exists(select 1 from pg_roles where rolname='authenticated') then create role authenticated nologin; end if;
  if not exists(select 1 from pg_roles where rolname='service_role') then create role service_role nologin bypassrls; end if;
end $$;
create schema if not exists auth;
create table if not exists auth.users(id uuid primary key);
create or replace function auth.uid() returns uuid language sql stable as $$
  select nullif(current_setting('request.jwt.claim.sub',true),'')::uuid
$$;
grant usage on schema auth to anon,authenticated,service_role;
grant execute on function auth.uid() to anon,authenticated,service_role;
create table public.profiles(id uuid primary key,role text not null);
create or replace function public.current_user_role() returns text language sql stable security definer set search_path='' as $$
  select role from public.profiles where id=auth.uid()
$$;
create or replace function public.is_staff() returns boolean language sql stable security definer set search_path='' as $$
  select coalesce((select role in ('editor','admin','super_admin') from public.profiles where id=auth.uid()),false)
$$;
create table public.church_library_books(slug text primary key,publication_status text not null);
insert into public.church_library_books values
  ('ethiopian-orthodox-church','published'),('orthodox-tewahedo-faith','published'),
  ('liturgy-of-the-church','published'),('synaxarium','published');
grant select on public.church_library_books to anon,authenticated;

create table public.play_content_items(
  id uuid primary key default gen_random_uuid(), question_id text not null unique, stable_id text not null unique,
  game_type text not null constraint live_game_domain check(game_type in
    ('trivia','emoji','finish-the-verse','finish-the-mezmur','history','adventure')),
  category text not null,difficulty text not null check(difficulty in ('beginner','growing','challenge')),
  payload jsonb not null,source_references jsonb not null default '[]',
  status text not null default 'draft' constraint live_status_domain check(status in ('draft','review','published','archived')),
  review_notes text,created_by uuid,reviewed_by uuid,published_by uuid,reviewed_at timestamptz,published_at timestamptz,
  created_at timestamptz not null default now(),updated_at timestamptz not null default now()
);
alter table public.play_content_items enable row level security;
grant select,insert,update,delete on public.play_content_items to authenticated,service_role;
create policy live_public on public.play_content_items for select to anon,authenticated using(status='published');
create policy live_staff_all on public.play_content_items for all to authenticated using(public.is_staff()) with check(public.is_staff());
create or replace function public.review_play_content(p_id uuid,p_status text,p_notes text default null)
returns public.play_content_items language plpgsql security invoker set search_path='' as $$
declare saved public.play_content_items;
begin
  if p_status not in ('approved','rejected') then raise exception 'old RPC accepted only approved/rejected'; end if;
  update public.play_content_items set status=p_status,review_notes=p_notes where id=p_id returning * into saved;
  return saved;
end $$;
grant execute on function public.review_play_content(uuid,text,text) to authenticated;

insert into auth.users(id) values
  ('00000000-0000-4000-8000-000000000001'),('00000000-0000-4000-8000-000000000002'),
  ('00000000-0000-4000-8000-000000000003');
insert into public.profiles values
  ('00000000-0000-4000-8000-000000000001','user'),
  ('00000000-0000-4000-8000-000000000002','editor'),
  ('00000000-0000-4000-8000-000000000003','admin');
