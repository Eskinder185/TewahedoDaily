-- Optional durable public search index for Search Buddy.
-- Canonical content remains in import/prayer/calendar tables.
-- Safe to re-run.

begin;

create table if not exists public.search_documents (
  id uuid primary key default gen_random_uuid(),
  source_type text not null,
  source_id text,
  slug text,
  title text not null,
  title_amharic text,
  summary text,
  content text,
  search_keywords text,
  route text not null,
  image_path text,
  language text,
  metadata jsonb not null default '{}'::jsonb,
  is_public boolean not null default true,
  search_priority integer not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint search_documents_route_nonempty check (nullif(trim(route), '') is not null),
  constraint search_documents_title_nonempty check (nullif(trim(title), '') is not null)
);

create unique index if not exists search_documents_source_unique
  on public.search_documents (source_type, coalesce(source_id, ''), coalesce(slug, ''), route);

create index if not exists search_documents_public_title_idx
  on public.search_documents (is_public, search_priority desc, title);

create index if not exists search_documents_route_idx
  on public.search_documents (route);

alter table public.search_documents enable row level security;
revoke all on public.search_documents from public, anon, authenticated;
grant select on public.search_documents to anon, authenticated;
grant all on public.search_documents to service_role;

drop policy if exists search_documents_public_read on public.search_documents;
create policy search_documents_public_read
  on public.search_documents
  for select
  to anon, authenticated
  using (is_public = true);

-- Minimal anonymous aggregate queries (no chat text retention by default)
create table if not exists public.search_query_stats (
  id uuid primary key default gen_random_uuid(),
  query_norm text not null,
  result_count integer not null default 0,
  created_at timestamptz not null default now()
);

create index if not exists search_query_stats_zero_idx
  on public.search_query_stats (created_at desc)
  where result_count = 0;

alter table public.search_query_stats enable row level security;
revoke all on public.search_query_stats from public, anon, authenticated;
grant insert on public.search_query_stats to anon, authenticated;
grant select, delete on public.search_query_stats to service_role;

drop policy if exists search_query_stats_insert on public.search_query_stats;
create policy search_query_stats_insert
  on public.search_query_stats
  for insert
  to anon, authenticated
  with check (char_length(query_norm) <= 120);

notify pgrst, 'reload schema';

commit;
