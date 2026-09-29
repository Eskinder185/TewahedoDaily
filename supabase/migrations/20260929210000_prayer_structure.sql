begin;

create extension if not exists pg_trgm with schema extensions;

create table if not exists public.prayer_collections (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique check (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  title text not null check (length(trim(title)) > 0),
  title_amharic text,
  description text,
  sort_order integer not null default 0,
  status public.content_status not null default 'draft',
  published_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.prayer_sections (
  id uuid primary key default gen_random_uuid(),
  collection_id uuid not null references public.prayer_collections(id) on delete cascade,
  slug text not null check (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  title text not null check (length(trim(title)) > 0),
  title_amharic text,
  description text,
  sort_order integer not null default 0,
  status public.content_status not null default 'draft',
  published_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (collection_id, slug)
);

alter table public.prayers
  add column if not exists collection_id uuid references public.prayer_collections(id) on delete set null,
  add column if not exists section_id uuid references public.prayer_sections(id) on delete set null,
  add column if not exists sort_order integer not null default 0,
  add column if not exists published_at timestamptz,
  add column if not exists text_amharic text,
  add column if not exists text_english text,
  add column if not exists text_oromo text;

create index if not exists prayer_collections_published_sort_idx
  on public.prayer_collections (sort_order, slug)
  where status = 'published';

create index if not exists prayer_sections_collection_sort_idx
  on public.prayer_sections (collection_id, sort_order, slug)
  where status = 'published';

create index if not exists prayers_collection_sort_idx
  on public.prayers (collection_id, sort_order, slug)
  where status = 'published';

create index if not exists prayers_section_sort_idx
  on public.prayers (section_id, sort_order, slug)
  where status = 'published';

create index if not exists prayers_title_trgm_idx
  on public.prayers using gin (title extensions.gin_trgm_ops);

create index if not exists prayers_title_amharic_trgm_idx
  on public.prayers using gin (title_amharic extensions.gin_trgm_ops);

create index if not exists prayers_text_english_trgm_idx
  on public.prayers using gin (text_english extensions.gin_trgm_ops);

create index if not exists prayers_text_amharic_trgm_idx
  on public.prayers using gin (text_amharic extensions.gin_trgm_ops);

alter table public.prayer_collections enable row level security;
alter table public.prayer_sections enable row level security;

grant select on public.prayer_collections, public.prayer_sections to anon, authenticated;
grant all on public.prayer_collections, public.prayer_sections to service_role;

do $$
begin
  if not exists (
    select 1 from pg_policies
    where schemaname = 'public'
      and tablename = 'prayer_collections'
      and policyname = 'prayer_collections_public_read'
  ) then
    create policy prayer_collections_public_read
      on public.prayer_collections
      for select
      to anon, authenticated
      using (status = 'published');
  end if;

  if not exists (
    select 1 from pg_policies
    where schemaname = 'public'
      and tablename = 'prayer_sections'
      and policyname = 'prayer_sections_public_read'
  ) then
    create policy prayer_sections_public_read
      on public.prayer_sections
      for select
      to anon, authenticated
      using (status = 'published');
  end if;
end
$$;

commit;
