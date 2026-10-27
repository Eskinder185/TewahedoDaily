-- ============================================================================
-- TEWAHEDODAILY: CHURCH LIBRARY FULL SUPABASE SCHEMA, SEARCH & PUBLIC READER
-- Migration: 20261026140000_church_library_public_reader_and_search.sql
--
-- Forward-only, additive, and idempotent.
-- Connects Church Library storage, extraction, passages, search, and public reading
-- entirely through Supabase PostgreSQL, Storage, and Row Level Security.
-- Zero remote AI backend dependencies.
-- ============================================================================

begin;

create extension if not exists vector with schema extensions;

-- 1. Ensure church_library_books columns exist
alter table public.church_library_books
  add column if not exists current_version_id uuid,
  add column if not exists cover_storage_path text,
  add column if not exists original_publication_info text,
  add column if not exists source_url text,
  add column if not exists access_level text not null default 'private',
  add column if not exists rights_status text not null default 'unknown',
  add column if not exists rights_notes text,
  add column if not exists allow_search_quotes boolean not null default false,
  add column if not exists allow_source_link boolean not null default false,
  add column if not exists approved_for_ingestion boolean not null default false,
  add column if not exists public_retrieval_enabled boolean not null default false,
  add column if not exists processing_status text not null default 'not_uploaded',
  add column if not exists extraction_quality text not null default 'not_checked',
  add column if not exists extraction_notes text;

-- 2. Ensure church_library_book_versions table exists
create table if not exists public.church_library_book_versions (
  id uuid primary key default gen_random_uuid(),
  book_id uuid not null references public.church_library_books(id) on delete cascade,
  version_number integer not null check (version_number > 0),
  original_file_name text not null,
  source_storage_path text not null,
  mime_type text not null,
  byte_size bigint not null check (byte_size > 0 and byte_size <= 104857600),
  sha256 text,
  processing_status text not null default 'pending'
    check (processing_status in ('pending', 'processing', 'ready', 'needs_ocr', 'failed')),
  extraction_quality text not null default 'not_checked'
    check (extraction_quality in ('not_checked', 'good', 'partial', 'uncertain', 'unreadable')),
  extraction_notes text,
  error_code text,
  error_message text,
  page_count integer check (page_count is null or page_count >= 0),
  section_count integer not null default 0 check (section_count >= 0),
  passage_count integer not null default 0 check (passage_count >= 0),
  processed_at timestamptz,
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  constraint church_library_book_versions_unique_book_version unique (book_id, version_number),
  constraint church_library_book_versions_unique_storage_path unique (source_storage_path)
);

create index if not exists idx_church_library_book_versions_book_id
  on public.church_library_book_versions(book_id, version_number desc);

-- Foreign key constraint
do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conrelid = 'public.church_library_books'::regclass
      and conname = 'church_library_current_version_fk'
  ) then
    alter table public.church_library_books
      add constraint church_library_current_version_fk
      foreign key (current_version_id)
      references public.church_library_book_versions(id)
      on delete set null;
  end if;
end $$;

-- Compatibility View
create or replace view public.church_library_versions
with (security_invoker = true)
as select * from public.church_library_book_versions;

-- 3. Ensure church_library_sections exists
create table if not exists public.church_library_sections (
  id uuid primary key default gen_random_uuid(),
  book_id uuid not null references public.church_library_books(id) on delete cascade,
  version_id uuid not null references public.church_library_book_versions(id) on delete cascade,
  section_order integer not null check (section_order >= 0),
  title text,
  chapter_reference text,
  page_start integer check (page_start is null or page_start > 0),
  page_end integer check (page_end is null or page_end >= page_start),
  created_at timestamptz not null default now(),
  unique (version_id, section_order)
);

-- 4. Ensure church_library_passages columns and table exist
create table if not exists public.church_library_passages (
  id uuid primary key default gen_random_uuid(),
  book_id uuid not null references public.church_library_books(id) on delete cascade,
  version_id uuid not null references public.church_library_book_versions(id) on delete cascade,
  section_id uuid references public.church_library_sections(id) on delete set null,
  passage_order integer not null check (passage_order >= 0),
  language text not null default 'en'
    check (language in ('en', 'am', 'gez', 'mixed', 'other')),
  content text not null check (nullif(btrim(content), '') is not null),
  page_start integer check (page_start is null or page_start > 0),
  page_end integer check (page_end is null or page_end >= page_start),
  chapter_reference text,
  locator_label text,
  extraction_confidence real check (extraction_confidence is null or extraction_confidence between 0 and 1),
  search_document tsvector,
  embedding extensions.vector(384),
  embedding_model text,
  review_status text not null default 'pending',
  reviewer_notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (version_id, passage_order)
);

-- Safe column additions if church_library_passages already existed
alter table public.church_library_passages
  add column if not exists version_id uuid,
  add column if not exists section_id uuid,
  add column if not exists page_start integer,
  add column if not exists page_end integer,
  add column if not exists chapter_reference text,
  add column if not exists locator_label text,
  add column if not exists search_document tsvector,
  add column if not exists embedding extensions.vector(384),
  add column if not exists review_status text not null default 'pending',
  add column if not exists reviewer_notes text;

-- Triggers for tsvector full-text search index
create or replace function public.church_library_passage_search_document()
returns trigger language plpgsql security invoker set search_path = public as $$
begin
  new.search_document := to_tsvector('simple', coalesce(new.content, '') || ' ' || coalesce(new.chapter_reference, '') || ' ' || coalesce(new.locator_label, ''));
  return new;
end $$;

drop trigger if exists church_library_passages_search_document on public.church_library_passages;
create trigger church_library_passages_search_document
before insert or update of content, chapter_reference, locator_label on public.church_library_passages
for each row execute function public.church_library_passage_search_document();

-- 5. Storage Buckets: private originals
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values (
  'church-library-originals', 'church-library-originals', false, 104857600,
  array[
    'application/pdf',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'text/plain', 'application/epub+zip',
    'image/jpeg', 'image/png', 'image/webp'
  ]
)
on conflict (id) do update set public = false,
  file_size_limit = excluded.file_size_limit,
  allowed_mime_types = excluded.allowed_mime_types;

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values (
  'church-library', 'church-library', false, 104857600,
  array[
    'application/pdf',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'text/plain', 'application/epub+zip',
    'image/jpeg', 'image/png', 'image/webp'
  ]
)
on conflict (id) do update set public = false,
  file_size_limit = excluded.file_size_limit,
  allowed_mime_types = excluded.allowed_mime_types;

-- Storage RLS: private to staff only
do $$ declare b_id text;
begin
  foreach b_id in array array['church-library-originals', 'church-library'] loop
    execute format('drop policy if exists %I on storage.objects', b_id || '_staff_select');
    execute format('create policy %I on storage.objects for select to authenticated using (bucket_id = %L and coalesce(public.is_staff(), false))', b_id || '_staff_select', b_id);

    execute format('drop policy if exists %I on storage.objects', b_id || '_staff_insert');
    execute format('create policy %I on storage.objects for insert to authenticated with check (bucket_id = %L and coalesce(public.is_staff(), false))', b_id || '_staff_insert', b_id);

    execute format('drop policy if exists %I on storage.objects', b_id || '_staff_update');
    execute format('create policy %I on storage.objects for update to authenticated using (bucket_id = %L and coalesce(public.is_staff(), false)) with check (bucket_id = %L and coalesce(public.is_staff(), false))', b_id || '_staff_update', b_id, b_id);

    execute format('drop policy if exists %I on storage.objects', b_id || '_staff_delete');
    execute format('create policy %I on storage.objects for delete to authenticated using (bucket_id = %L and coalesce(public.is_staff(), false))', b_id || '_staff_delete', b_id);
  end loop;
end $$;

-- 6. Table Row Level Security & Grants
alter table public.church_library_books enable row level security;
alter table public.church_library_book_versions enable row level security;
alter table public.church_library_sections enable row level security;
alter table public.church_library_passages enable row level security;

-- Grants
grant select, insert, update, delete on public.church_library_books to authenticated;
grant select, insert, update, delete on public.church_library_book_versions to authenticated;
grant select, insert, update, delete on public.church_library_sections to authenticated;
grant select, insert, update, delete on public.church_library_passages to authenticated;

grant select on public.church_library_books to anon;
grant select on public.church_library_sections to anon;
grant select on public.church_library_passages to anon;

grant all on public.church_library_books to service_role;
grant all on public.church_library_book_versions to service_role;
grant all on public.church_library_sections to service_role;
grant all on public.church_library_passages to service_role;

-- Staff RLS Policies
drop policy if exists church_library_books_staff_all on public.church_library_books;
create policy church_library_books_staff_all on public.church_library_books
  for all to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

drop policy if exists church_library_book_versions_staff_all on public.church_library_book_versions;
create policy church_library_book_versions_staff_all on public.church_library_book_versions
  for all to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

drop policy if exists church_library_sections_staff_all on public.church_library_sections;
create policy church_library_sections_staff_all on public.church_library_sections
  for all to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

drop policy if exists church_library_passages_staff_all on public.church_library_passages;
create policy church_library_passages_staff_all on public.church_library_passages
  for all to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

-- Public RLS Policies for Anonymous & Authenticated Visitors
drop policy if exists church_library_books_public_read on public.church_library_books;
create policy church_library_books_public_read on public.church_library_books
  for select to anon, authenticated
  using (
    public_retrieval_enabled = true
    and access_level in ('public_search', 'public')
    and approved_for_ingestion = true
    and processing_status = 'ready'
  );

drop policy if exists church_library_sections_public_read on public.church_library_sections;
create policy church_library_sections_public_read on public.church_library_sections
  for select to anon, authenticated
  using (
    exists (
      select 1 from public.church_library_books b
      where b.id = church_library_sections.book_id
        and b.public_retrieval_enabled = true
        and b.access_level in ('public_search', 'public')
        and b.approved_for_ingestion = true
        and b.processing_status = 'ready'
    )
  );

drop policy if exists church_library_passages_public_read on public.church_library_passages;
create policy church_library_passages_public_read on public.church_library_passages
  for select to anon, authenticated
  using (
    exists (
      select 1 from public.church_library_books b
      where b.id = church_library_passages.book_id
        and b.public_retrieval_enabled = true
        and b.access_level in ('public_search', 'public')
        and b.approved_for_ingestion = true
        and b.processing_status = 'ready'
    )
  );

-- 7. RPC: activate_church_library_version
create or replace function public.activate_church_library_version(
  target_book_id uuid,
  target_version_id uuid
)
returns public.church_library_books
language plpgsql security invoker set search_path = public as $$
declare result public.church_library_books;
begin
  if not coalesce(public.is_staff(), false) then
    raise exception 'Church Library staff role required' using errcode = '42501';
  end if;

  if not exists (
    select 1 from public.church_library_book_versions
    where id = target_version_id and book_id = target_book_id
  ) then
    raise exception 'The selected file version does not belong to this book' using errcode = '23503';
  end if;

  update public.church_library_books
  set current_version_id = target_version_id,
      processing_status = 'pending',
      extraction_quality = 'not_checked',
      extraction_notes = null,
      public_retrieval_enabled = false,
      updated_at = now()
  where id = target_book_id
  returning * into result;

  if result.id is null then
    raise exception 'Church Library book not found' using errcode = 'P0002';
  end if;

  return result;
end;
$$;

revoke all on function public.activate_church_library_version(uuid, uuid) from anon, public;
grant execute on function public.activate_church_library_version(uuid, uuid) to authenticated, service_role;

-- 8. Stored Procedure: search_church_library
create or replace function public.search_church_library(
  search_query text,
  result_limit integer default 8,
  search_language text default null,
  query_embedding extensions.vector(384) default null
)
returns table (
  passage_id uuid,
  book_id uuid,
  title text,
  author text,
  language text,
  excerpt text,
  page_start integer,
  page_end integer,
  chapter_reference text,
  locator_label text,
  source_url text,
  keyword_rank real,
  semantic_rank real
)
language sql stable security definer set search_path = public, extensions as $$
  with eligible as (
    select p.*, b.title, b.author, b.source_url, b.allow_source_link,
           (
             ts_rank_cd(p.search_document, websearch_to_tsquery('simple', left(search_query, 500)))
             + case when p.content ilike '%' || btrim(left(search_query, 100)) || '%' then 0.5::real else 0::real end
             + case when b.title ilike '%' || btrim(left(search_query, 100)) || '%' then 0.8::real else 0::real end
           ) as kr,
           case when query_embedding is null or p.embedding is null then 0::real
                else (1 - (p.embedding <=> query_embedding))::real end as sr
    from public.church_library_passages p
    join public.church_library_books b on b.id = p.book_id
    join public.church_library_book_versions v on v.id = p.version_id
    where p.version_id = b.current_version_id
      and b.public_retrieval_enabled = true
      and b.access_level in ('public_search', 'public')
      and b.approved_for_ingestion = true
      and b.allow_search_quotes = true
      and b.rights_status in ('owned', 'licensed', 'public_domain', 'permission_granted')
      and b.processing_status = 'ready' and v.processing_status = 'ready'
      and (search_language is null or p.language = search_language or p.language = 'mixed')
      and (
        p.search_document @@ websearch_to_tsquery('simple', left(search_query, 500))
        or p.content ilike '%' || btrim(left(search_query, 100)) || '%'
        or b.title ilike '%' || btrim(left(search_query, 100)) || '%'
      )
  )
  select id, book_id, title, author, language, left(content, 900), page_start, page_end,
         chapter_reference, locator_label,
         case when allow_source_link and source_url ~* '^https?://' then source_url else null end,
         kr, sr
  from eligible
  order by (kr + sr) desc, title, passage_order
  limit greatest(1, least(coalesce(result_limit, 8), 30));
$$;

revoke all on function public.search_church_library(text, integer, text, extensions.vector) from public;
grant execute on function public.search_church_library(text, integer, text, extensions.vector) to anon, authenticated, service_role;

-- 9. GIN Indexes
create index if not exists church_library_passages_search_document_gin
  on public.church_library_passages using gin (search_document);

create index if not exists church_library_books_title_idx
  on public.church_library_books (title);

notify pgrst, 'reload schema';
commit;
