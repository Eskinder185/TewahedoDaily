-- Minimal production-shaped baseline for isolated migration integration tests.
create extension if not exists pgcrypto;
do $$ begin
 create role anon nologin;
exception when duplicate_object then null; end $$;
do $$ begin
 create role authenticated nologin;
exception when duplicate_object then null; end $$;
do $$ begin
 create role service_role nologin;
exception when duplicate_object then null; end $$;
do $$ begin
 create role supabase_admin nologin;
exception when duplicate_object then null; end $$;

create schema if not exists auth;
create or replace function auth.uid() returns uuid language sql stable as $$
 select nullif(current_setting('request.jwt.claim.sub',true),'')::uuid
$$;

create table public.profiles(id uuid primary key,role text not null);
create or replace function public.is_staff() returns boolean language sql stable security definer as $$
 select exists(select 1 from public.profiles where id=auth.uid() and role in ('editor','admin','super_admin'))
$$;

create type public.cms_content_type as enum('mezmur','saint','feast','prayer','article');
create table public.categories(
 id uuid primary key default gen_random_uuid(),name text not null,name_amharic text,
 slug text not null unique,type public.cms_content_type not null default 'mezmur',
 is_archived boolean not null default false
);

create table public.mezmur_data_import(
 import_id uuid primary key,mezmur_id text not null unique,slug text,title text,
 lyrics_amharic text,lyrics_geez text,lyrics_transliteration text,status text,
 deleted_at timestamptz,rights_status text,publication_approved_at timestamptz,
 publication_approved_by uuid,youtube_url text,source_url text
);

create table public.mezmur_category_links_import(
 mezmur_slug text not null,category_slug text not null,
 source_category text default 'manual',confidence text default 'verified'
);
create table public.mezmur_occasion_links_import(
 mezmur_slug text not null,occasion_slug text not null
);

create view public.mezmur_public as
select mezmur_id,slug from public.mezmur_data_import
where deleted_at is null and lower(trim(coalesce(status,'')))='published';

insert into public.profiles(id,role) values
 ('10000000-0000-4000-8000-000000000001','super_admin'),
 ('10000000-0000-4000-8000-000000000002','user');
insert into public.mezmur_data_import(import_id,mezmur_id,slug,title,lyrics_amharic,status) values
 ('20000000-0000-4000-8000-000000000001','published-a','duplicate-slug','Published duplicate','መዝሙር','published'),
 ('20000000-0000-4000-8000-000000000002','draft-b','duplicate-slug','Draft duplicate','መዝሙር','draft'),
 ('20000000-0000-4000-8000-000000000003','unique-c','unique-slug','Unique draft','መዝሙር','draft'),
 ('20000000-0000-4000-8000-000000000004','deleted-d','deleted-slug','Deleted','መዝሙር','published');
update public.mezmur_data_import set deleted_at=now() where import_id='20000000-0000-4000-8000-000000000004';
insert into public.mezmur_category_links_import values
 ('duplicate-slug','general','manual','verified'),
 ('unique-slug','general','manual','verified');
insert into public.mezmur_occasion_links_import values
 ('duplicate-slug','general'),('unique-slug','general');
