-- Church Library: private originals, durable metadata, versioned extraction and
-- retrieval-safe passages. This extends the existing editorial-book work; it
-- deliberately keeps processing approval separate from public retrieval.

begin;

create extension if not exists vector with schema extensions;

create table if not exists public.church_library_books (
  id uuid primary key default gen_random_uuid(),
  title text not null check (nullif(btrim(title), '') is not null),
  author text,
  language text not null default 'en'
    check (language in ('en', 'am', 'gez', 'mixed', 'other')),
  category text,
  description text,
  cover_storage_path text,
  original_publication_info text,
  source_url text,
  access_level text not null default 'private'
    check (access_level in ('private', 'staff', 'public_search')),
  rights_status text not null default 'unknown'
    check (rights_status in ('unknown', 'owned', 'licensed', 'public_domain', 'permission_granted', 'restricted')),
  rights_notes text,
  allow_search_quotes boolean not null default false,
  allow_source_link boolean not null default false,
  approved_for_ingestion boolean not null default false,
  public_retrieval_enabled boolean not null default false,
  processing_status text not null default 'not_uploaded'
    check (processing_status in ('not_uploaded', 'pending', 'processing', 'ready', 'needs_ocr', 'failed')),
  extraction_quality text not null default 'not_checked'
    check (extraction_quality in ('not_checked', 'good', 'partial', 'uncertain', 'unreadable')),
  extraction_notes text,
  current_version_id uuid,
  created_by uuid references auth.users(id) on delete set null,
  updated_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint church_library_public_gate check (
    public_retrieval_enabled = false or (
      access_level = 'public_search'
      and approved_for_ingestion = true
      and allow_search_quotes = true
      and rights_status in ('owned', 'licensed', 'public_domain', 'permission_granted')
    )
  )
);

create table if not exists public.church_library_versions (
  id uuid primary key default gen_random_uuid(),
  book_id uuid not null references public.church_library_books(id) on delete cascade,
  version_number integer not null check (version_number > 0),
  original_file_name text not null,
  source_storage_path text not null,
  mime_type text not null,
  byte_size bigint not null check (byte_size > 0 and byte_size <= 52428800),
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
  unique (book_id, version_number),
  unique (source_storage_path)
);

alter table public.church_library_books
  add constraint church_library_current_version_fk
  foreign key (current_version_id) references public.church_library_versions(id)
  on delete set null;

create table if not exists public.church_library_sections (
  id uuid primary key default gen_random_uuid(),
  book_id uuid not null references public.church_library_books(id) on delete cascade,
  version_id uuid not null references public.church_library_versions(id) on delete cascade,
  section_order integer not null check (section_order >= 0),
  title text,
  chapter_reference text,
  page_start integer check (page_start is null or page_start > 0),
  page_end integer check (page_end is null or page_end >= page_start),
  created_at timestamptz not null default now(),
  unique (version_id, section_order)
);

create table if not exists public.church_library_passages (
  id uuid primary key default gen_random_uuid(),
  book_id uuid not null references public.church_library_books(id) on delete cascade,
  version_id uuid not null references public.church_library_versions(id) on delete cascade,
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
  created_at timestamptz not null default now(),
  unique (version_id, passage_order)
);

create index if not exists church_library_books_updated_idx
  on public.church_library_books (updated_at desc);
create index if not exists church_library_versions_book_idx
  on public.church_library_versions (book_id, version_number desc);
create index if not exists church_library_sections_version_idx
  on public.church_library_sections (version_id, section_order);
create index if not exists church_library_passages_version_idx
  on public.church_library_passages (version_id, passage_order);
create index if not exists church_library_passages_search_idx
  on public.church_library_passages using gin (search_document);
create index if not exists church_library_passages_embedding_idx
  on public.church_library_passages using hnsw (embedding extensions.vector_cosine_ops)
  where embedding is not null;

create or replace function public.church_library_touch_book()
returns trigger language plpgsql security invoker set search_path = public as $$
begin
  new.updated_at := now();
  new.updated_by := auth.uid();
  return new;
end $$;

drop trigger if exists church_library_books_touch on public.church_library_books;
create trigger church_library_books_touch before update on public.church_library_books
for each row execute function public.church_library_touch_book();

create or replace function public.church_library_passage_search_document()
returns trigger language plpgsql security invoker set search_path = public as $$
begin
  new.search_document := to_tsvector('simple', coalesce(new.content, '') || ' ' || coalesce(new.chapter_reference, ''));
  return new;
end $$;

drop trigger if exists church_library_passages_search_document on public.church_library_passages;
create trigger church_library_passages_search_document
before insert or update of content, chapter_reference on public.church_library_passages
for each row execute function public.church_library_passage_search_document();

create or replace function public.activate_church_library_version(target_book_id uuid, target_version_id uuid)
returns public.church_library_books
language plpgsql security invoker set search_path = public as $$
declare result public.church_library_books;
begin
  if not public.is_staff() then raise exception 'Church Library staff role required' using errcode = '42501'; end if;
  if not exists (select 1 from public.church_library_versions where id = target_version_id and book_id = target_book_id) then
    raise exception 'The selected file version does not belong to this book' using errcode = '23503';
  end if;
  update public.church_library_books
     set current_version_id = target_version_id,
         processing_status = 'pending', extraction_quality = 'not_checked', extraction_notes = null,
         public_retrieval_enabled = false
   where id = target_book_id returning * into result;
  return result;
end $$;

-- Safe excerpt retrieval. Callers never receive storage paths or complete books.
create or replace function public.search_church_library(
  search_query text,
  result_limit integer default 8,
  search_language text default null,
  query_embedding extensions.vector(384) default null
)
returns table (
  passage_id uuid, book_id uuid, title text, author text, language text,
  excerpt text, page_start integer, page_end integer, chapter_reference text,
  locator_label text, source_url text, keyword_rank real, semantic_rank real
)
language sql stable security definer set search_path = public, extensions as $$
  with eligible as (
    select p.*, b.title, b.author, b.source_url, b.allow_source_link,
           ts_rank_cd(p.search_document, websearch_to_tsquery('simple', left(search_query, 500))) as kr,
           case when query_embedding is null or p.embedding is null then 0::real
                else (1 - (p.embedding <=> query_embedding))::real end as sr
      from public.church_library_passages p
      join public.church_library_books b on b.id = p.book_id
      join public.church_library_versions v on v.id = p.version_id
     where p.version_id = b.current_version_id
       and b.public_retrieval_enabled = true
       and b.access_level = 'public_search'
       and b.approved_for_ingestion = true
       and b.allow_search_quotes = true
       and b.rights_status in ('owned', 'licensed', 'public_domain', 'permission_granted')
       and b.processing_status = 'ready' and v.processing_status = 'ready'
       and (search_language is null or p.language = search_language or p.language = 'mixed')
       and (
         p.search_document @@ websearch_to_tsquery('simple', left(search_query, 500))
         or (query_embedding is not null and p.embedding is not null)
       )
  )
  select id, book_id, title, author, language,
         left(content, 900), page_start, page_end, chapter_reference, locator_label,
         case when allow_source_link and source_url ~* '^https?://' then source_url else null end,
         kr, sr
    from eligible
   order by (kr + sr) desc, title, passage_order
   limit greatest(1, least(coalesce(result_limit, 8), 20));
$$;

alter table public.church_library_books enable row level security;
alter table public.church_library_versions enable row level security;
alter table public.church_library_sections enable row level security;
alter table public.church_library_passages enable row level security;

revoke all on public.church_library_books, public.church_library_versions,
  public.church_library_sections, public.church_library_passages from public, anon, authenticated;
grant select, insert, update, delete on public.church_library_books,
  public.church_library_versions, public.church_library_sections,
  public.church_library_passages to authenticated;
grant all on public.church_library_books, public.church_library_versions,
  public.church_library_sections, public.church_library_passages to service_role;

do $$ declare table_name text;
begin
  foreach table_name in array array['church_library_books','church_library_versions','church_library_sections','church_library_passages'] loop
    execute format('drop policy if exists %I on public.%I', table_name || '_staff_read', table_name);
    execute format('drop policy if exists %I on public.%I', table_name || '_staff_write', table_name);
    execute format('create policy %I on public.%I for select to authenticated using (public.is_staff())', table_name || '_staff_read', table_name);
    execute format('create policy %I on public.%I for all to authenticated using (public.is_staff()) with check (public.is_staff())', table_name || '_staff_write', table_name);
  end loop;
end $$;

revoke all on function public.activate_church_library_version(uuid, uuid) from public;
grant execute on function public.activate_church_library_version(uuid, uuid) to authenticated;
revoke all on function public.search_church_library(text, integer, text, extensions.vector) from public;
grant execute on function public.search_church_library(text, integer, text, extensions.vector) to anon, authenticated, service_role;

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values (
  'church-library', 'church-library', false, 52428800,
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

drop policy if exists church_library_storage_staff_select on storage.objects;
create policy church_library_storage_staff_select on storage.objects for select to authenticated
using (bucket_id = 'church-library' and public.is_staff());
drop policy if exists church_library_storage_staff_insert on storage.objects;
create policy church_library_storage_staff_insert on storage.objects for insert to authenticated
with check (bucket_id = 'church-library' and public.is_staff());
drop policy if exists church_library_storage_staff_update on storage.objects;
create policy church_library_storage_staff_update on storage.objects for update to authenticated
using (bucket_id = 'church-library' and public.is_staff())
with check (bucket_id = 'church-library' and public.is_staff());
drop policy if exists church_library_storage_staff_delete on storage.objects;
create policy church_library_storage_staff_delete on storage.objects for delete to authenticated
using (bucket_id = 'church-library' and public.is_staff());

notify pgrst, 'reload schema';
commit;
