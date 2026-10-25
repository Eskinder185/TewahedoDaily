-- Forward-only repair for a production database that has the legacy
-- church_library_books table but not the versioned private-upload schema.
-- Additive and idempotent: existing books and metadata are preserved.

begin;

create extension if not exists vector with schema extensions;

do $$
declare id_type text;
begin
  select data_type into id_type
  from information_schema.columns
  where table_schema = 'public' and table_name = 'church_library_books' and column_name = 'id';
  if id_type is null then
    raise exception 'public.church_library_books.id is required; refusing to guess the legacy schema' using errcode = '42703';
  end if;
  if id_type <> 'uuid' then
    raise exception 'public.church_library_books.id must be uuid, found %', id_type using errcode = '42804';
  end if;
end $$;

alter table public.church_library_books
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
  add column if not exists extraction_notes text,
  add column if not exists current_version_id uuid;

do $$
begin
  if not exists (select 1 from pg_constraint where conrelid = 'public.church_library_books'::regclass and conname = 'church_library_access_level_check') then
    alter table public.church_library_books add constraint church_library_access_level_check
      check (access_level in ('private', 'staff', 'public_search'));
  end if;
  if not exists (select 1 from pg_constraint where conrelid = 'public.church_library_books'::regclass and conname = 'church_library_rights_status_check') then
    alter table public.church_library_books add constraint church_library_rights_status_check
      check (rights_status in ('unknown', 'owned', 'licensed', 'public_domain', 'permission_granted', 'restricted'));
  end if;
  if not exists (select 1 from pg_constraint where conrelid = 'public.church_library_books'::regclass and conname = 'church_library_processing_status_check') then
    alter table public.church_library_books add constraint church_library_processing_status_check
      check (processing_status in ('not_uploaded', 'pending', 'processing', 'ready', 'needs_ocr', 'failed'));
  end if;
  if not exists (select 1 from pg_constraint where conrelid = 'public.church_library_books'::regclass and conname = 'church_library_extraction_quality_check') then
    alter table public.church_library_books add constraint church_library_extraction_quality_check
      check (extraction_quality in ('not_checked', 'good', 'partial', 'uncertain', 'unreadable'));
  end if;
  if not exists (select 1 from pg_constraint where conrelid = 'public.church_library_books'::regclass and conname = 'church_library_public_gate') then
    alter table public.church_library_books add constraint church_library_public_gate check (
      public_retrieval_enabled = false or (
        access_level = 'public_search' and approved_for_ingestion = true
        and allow_search_quotes = true
        and rights_status in ('owned', 'licensed', 'public_domain', 'permission_granted')
      )
    );
  end if;
end $$;

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

do $$
begin
  if not exists (select 1 from pg_constraint where conrelid = 'public.church_library_books'::regclass and conname = 'church_library_current_version_fk') then
    alter table public.church_library_books add constraint church_library_current_version_fk
      foreign key (current_version_id) references public.church_library_versions(id) on delete set null;
  end if;
end $$;

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
  version_id uuid references public.church_library_versions(id) on delete cascade,
  section_id uuid references public.church_library_sections(id) on delete set null,
  passage_order integer not null check (passage_order >= 0),
  language text not null default 'en' check (language in ('en', 'am', 'gez', 'mixed', 'other')),
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

-- When church_library_passages pre-existed in legacy schema, ensure all newer columns exist
alter table public.church_library_passages
  add column if not exists version_id uuid references public.church_library_versions(id) on delete cascade,
  add column if not exists section_id uuid references public.church_library_sections(id) on delete set null,
  add column if not exists page_start integer,
  add column if not exists page_end integer,
  add column if not exists chapter_reference text,
  add column if not exists locator_label text,
  add column if not exists extraction_confidence real,
  add column if not exists search_document tsvector,
  add column if not exists embedding extensions.vector(384),
  add column if not exists embedding_model text,
  add column if not exists created_at timestamptz not null default now(),
  add column if not exists original_content text,
  add column if not exists review_status text not null default 'pending',
  add column if not exists reviewer_notes text,
  add column if not exists reviewed_by uuid references auth.users(id) on delete set null,
  add column if not exists reviewed_at timestamptz,
  add column if not exists revision_count integer not null default 0,
  add column if not exists updated_by uuid references auth.users(id) on delete set null,
  add column if not exists updated_at timestamptz not null default now();

do $$
begin
  if not exists (select 1 from pg_constraint where conrelid = 'public.church_library_passages'::regclass and conname = 'church_library_passages_review_status_check') then
    alter table public.church_library_passages add constraint church_library_passages_review_status_check
      check (review_status in ('pending', 'reviewed', 'needs_attention'));
  end if;
  if not exists (select 1 from pg_constraint where conrelid = 'public.church_library_passages'::regclass and conname = 'church_library_passages_revision_count_check') then
    alter table public.church_library_passages add constraint church_library_passages_revision_count_check
      check (revision_count >= 0);
  end if;
end $$;

update public.church_library_passages
set original_content = content
where original_content is null and content is not null;

create table if not exists public.church_library_passage_revisions (
  id uuid primary key default gen_random_uuid(),
  passage_id uuid not null references public.church_library_passages(id) on delete cascade,
  revision_number integer not null check (revision_number > 0),
  previous_content text not null,
  new_content text not null,
  change_summary text,
  review_status text not null default 'pending'
    check (review_status in ('pending', 'reviewed', 'needs_attention')),
  reviewer_notes text,
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  unique (passage_id, revision_number)
);

create index if not exists church_library_books_updated_idx on public.church_library_books (updated_at desc);
create index if not exists church_library_versions_book_idx on public.church_library_versions (book_id, version_number desc);
create index if not exists church_library_sections_version_idx on public.church_library_sections (version_id, section_order);
create index if not exists church_library_passages_version_idx on public.church_library_passages (version_id, passage_order);
create index if not exists church_library_passages_search_idx on public.church_library_passages using gin (search_document);
create index if not exists church_library_passages_embedding_idx
  on public.church_library_passages using hnsw (embedding extensions.vector_cosine_ops) where embedding is not null;

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
  if not public.is_staff() then
    raise exception 'Church Library staff role required' using errcode = '42501';
  end if;
  if not exists (
    select 1 from public.church_library_versions
    where id = target_version_id and book_id = target_book_id
  ) then
    raise exception 'The selected file version does not belong to this book' using errcode = '23503';
  end if;
  update public.church_library_books
  set current_version_id = target_version_id,
      processing_status = 'pending', extraction_quality = 'not_checked', extraction_notes = null,
      public_retrieval_enabled = false
  where id = target_book_id
  returning * into result;
  if result.id is null then raise exception 'Church Library book not found' using errcode = 'P0002'; end if;
  return result;
end $$;

-- Excerpt-only retrieval. Original storage paths and complete documents are
-- never returned by this RPC.
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
  select id, book_id, title, author, language, left(content, 900), page_start, page_end,
         chapter_reference, locator_label,
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
alter table public.church_library_passage_revisions enable row level security;

revoke all on public.church_library_books, public.church_library_versions,
  public.church_library_sections, public.church_library_passages,
  public.church_library_passage_revisions from anon;
grant select, insert, update, delete on public.church_library_books,
  public.church_library_versions, public.church_library_sections,
  public.church_library_passages, public.church_library_passage_revisions to authenticated;
grant all on public.church_library_books, public.church_library_versions,
  public.church_library_sections, public.church_library_passages,
  public.church_library_passage_revisions to service_role;

do $$ declare target text;
begin
  foreach target in array array['church_library_books','church_library_versions','church_library_sections','church_library_passages','church_library_passage_revisions'] loop
    execute format('drop policy if exists %I on public.%I', target || '_staff_read_v2', target);
    execute format('drop policy if exists %I on public.%I', target || '_staff_write_v2', target);
    execute format('create policy %I on public.%I for select to authenticated using (public.is_staff())', target || '_staff_read_v2', target);
    execute format('create policy %I on public.%I for all to authenticated using (public.is_staff()) with check (public.is_staff())', target || '_staff_write_v2', target);
  end loop;
end $$;

revoke all on function public.activate_church_library_version(uuid, uuid) from public;
grant execute on function public.activate_church_library_version(uuid, uuid) to authenticated, service_role;
revoke all on function public.search_church_library(text, integer, text, extensions.vector) from public;
grant execute on function public.search_church_library(text, integer, text, extensions.vector) to anon, authenticated, service_role;

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('church-library', 'church-library', false, 52428800,
  array['application/pdf','application/vnd.openxmlformats-officedocument.wordprocessingml.document','text/plain','application/epub+zip','image/jpeg','image/png','image/webp'])
on conflict (id) do update set public = false, file_size_limit = excluded.file_size_limit,
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
