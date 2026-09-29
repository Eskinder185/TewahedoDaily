-- Additive classification fields for public hymn discovery / practice filters.
-- Safe to re-run. Does not remove category_id / mezmur_tags.

begin;

alter table public.mezmur
  add column if not exists language text,
  add column if not exists form text,
  add column if not exists category text,
  add column if not exists occasion text,
  add column if not exists occasion_tags text[] not null default '{}',
  add column if not exists saint_or_angel text,
  add column if not exists saint_tags text[] not null default '{}',
  add column if not exists themes text[] not null default '{}',
  add column if not exists search_keywords text[] not null default '{}',
  add column if not exists source text;

alter table public.mezmur drop constraint if exists mezmur_language_check;
alter table public.mezmur add constraint mezmur_language_check
  check (language is null or language in ('amharic', 'english', 'oromo', 'geez', 'am', 'en', 'om', 'gez'));

alter table public.mezmur drop constraint if exists mezmur_form_check;
alter table public.mezmur add constraint mezmur_form_check
  check (form is null or form in ('mezmur', 'werb'));

create index if not exists mezmur_public_language_idx
  on public.mezmur (language) where status = 'published';
create index if not exists mezmur_public_form_idx
  on public.mezmur (form) where status = 'published';
create index if not exists mezmur_public_occasion_idx
  on public.mezmur (occasion) where status = 'published';
create index if not exists mezmur_public_saint_idx
  on public.mezmur (saint_or_angel) where status = 'published';
create index if not exists mezmur_public_category_text_idx
  on public.mezmur (category) where status = 'published';
create index if not exists mezmur_public_themes_gin
  on public.mezmur using gin (themes) where status = 'published';
create index if not exists mezmur_public_keywords_gin
  on public.mezmur using gin (search_keywords) where status = 'published';
create index if not exists mezmur_public_occasion_tags_gin
  on public.mezmur using gin (occasion_tags) where status = 'published';
create index if not exists mezmur_public_saint_tags_gin
  on public.mezmur using gin (saint_tags) where status = 'published';

commit;
