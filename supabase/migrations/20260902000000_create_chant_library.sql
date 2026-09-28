-- Public, read-only chant catalog used by the Vite application.
-- Content changes should be made with a trusted server/CLI key, never in the browser.

do $$
begin
  create type public.chant_form as enum ('mezmur', 'werb');
exception
  when duplicate_object then null;
end
$$;

create table if not exists public.chant_categories (
  slug text primary key,
  name_am text not null default '',
  name_en text not null default '',
  description text not null default '',
  display_order integer not null default 0,
  image_url text,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.chants (
  key text primary key,
  id text not null,
  form public.chant_form not null,
  slug text not null unique,
  title text not null,
  transliteration_title text not null default '',
  lyrics text not null default '',
  transliteration_lyrics text not null default '',
  meaning text,
  youtube_url text,
  audio_url text,
  thumbnail_url text,
  language text,
  category_primary text not null default 'other',
  category_major_holidays text[] not null default '{}',
  category_saints text[] not null default '{}',
  category_themes text[] not null default '{}',
  category_usage text[] not null default '{}',
  category_seasons text[] not null default '{}',
  category_confidence text,
  primary_category_slug text references public.chant_categories(slug),
  classification_confidence numeric(4, 3),
  classification_reason text,
  classification_signals text[] not null default '{}',
  needs_review boolean not null default false,
  metadata jsonb not null default '{}'::jsonb,
  source_pack text,
  published boolean not null default true,
  search_document tsvector,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint chants_key_matches_form_and_id
    check (key = form::text || ':' || id),
  constraint chants_form_and_id_unique unique (form, id),
  constraint chants_classification_confidence_range
    check (
      classification_confidence is null or
      classification_confidence between 0 and 1
    )
);

create table if not exists public.chant_secondary_categories (
  chant_key text not null references public.chants(key) on delete cascade,
  category_slug text not null references public.chant_categories(slug) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (chant_key, category_slug)
);

create or replace function public.set_updated_at()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create or replace function public.set_chant_search_document()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  new.search_document = to_tsvector(
    'simple',
    concat_ws(
      ' ',
      new.title,
      new.transliteration_title,
      new.lyrics,
      new.transliteration_lyrics,
      new.meaning,
      new.category_primary,
      array_to_string(new.category_themes, ' '),
      array_to_string(new.category_saints, ' '),
      array_to_string(new.category_major_holidays, ' '),
      array_to_string(new.category_seasons, ' ')
    )
  );
  return new;
end;
$$;

drop trigger if exists set_chant_categories_updated_at on public.chant_categories;
create trigger set_chant_categories_updated_at
before update on public.chant_categories
for each row execute function public.set_updated_at();

drop trigger if exists set_chants_updated_at on public.chants;
create trigger set_chants_updated_at
before update on public.chants
for each row execute function public.set_updated_at();

drop trigger if exists set_chants_search_document on public.chants;
create trigger set_chants_search_document
before insert or update of title, transliteration_title, lyrics,
  transliteration_lyrics, meaning, category_primary, category_themes,
  category_saints, category_major_holidays, category_seasons
on public.chants
for each row execute function public.set_chant_search_document();

create index if not exists chants_published_form_title_idx
  on public.chants (published, form, title);
create index if not exists chants_language_idx
  on public.chants (language) where published;
create index if not exists chants_primary_category_idx
  on public.chants (primary_category_slug) where published;
create index if not exists chants_needs_review_idx
  on public.chants (needs_review) where needs_review;
create index if not exists chants_search_document_idx
  on public.chants using gin (search_document);
create index if not exists chants_themes_idx
  on public.chants using gin (category_themes);
create index if not exists chants_saints_idx
  on public.chants using gin (category_saints);

alter table public.chant_categories enable row level security;
alter table public.chants enable row level security;
alter table public.chant_secondary_categories enable row level security;

revoke all on table public.chant_categories from anon, authenticated;
revoke all on table public.chants from anon, authenticated;
revoke all on table public.chant_secondary_categories from anon, authenticated;

grant select on table public.chant_categories to anon, authenticated;
grant select on table public.chants to anon, authenticated;
grant select on table public.chant_secondary_categories to anon, authenticated;
grant all on table public.chant_categories to service_role;
grant all on table public.chants to service_role;
grant all on table public.chant_secondary_categories to service_role;

drop policy if exists "Public can read active chant categories" on public.chant_categories;
create policy "Public can read active chant categories"
on public.chant_categories
for select
to anon, authenticated
using (is_active);

drop policy if exists "Public can read published chants" on public.chants;
create policy "Public can read published chants"
on public.chants
for select
to anon, authenticated
using (published);

drop policy if exists "Public can read published chant category links"
  on public.chant_secondary_categories;
create policy "Public can read published chant category links"
on public.chant_secondary_categories
for select
to anon, authenticated
using (
  exists (
    select 1
    from public.chants
    where chants.key = chant_secondary_categories.chant_key
      and chants.published
  )
);

