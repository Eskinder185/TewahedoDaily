-- Synthetic stand-in for the live taxonomy tables; no real content. Mirrors the columns the proposal writes.
create type public.cms_content_type as enum ('mezmur', 'prayer');
create table public.categories (id uuid primary key default gen_random_uuid(), name text not null, name_amharic text, slug text unique not null, type public.cms_content_type, is_archived boolean default false);
create table public.mezmur_occasions (id uuid primary key default gen_random_uuid(), slug text unique not null, name text not null, name_amharic text, sort_order int, is_featured boolean default false, search_keywords text[], status text default 'published');
insert into public.categories (name, name_amharic, slug, type) values ('Kidist Arsema', 'ቅድስት አርሴማ', 'kidist-arsema', 'mezmur'), ('Abune Tekle Haymanot', 'አቡነ ተክለ ሃይማኖት', 'abune-tekle-haymanot', 'mezmur');
insert into public.mezmur_occasions (slug, name, sort_order) values ('gena', 'Christmas / Gena', 10);
