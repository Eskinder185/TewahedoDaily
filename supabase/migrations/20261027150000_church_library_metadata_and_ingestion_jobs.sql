-- Church Library: additive metadata and worker-job support.
--
-- This migration intentionally extends the existing church_library_* schema.
-- It does not create a competing document library, make originals public, or
-- change the retrieval gates already enforced by search_church_library.

begin;

alter table public.church_library_books
  add column if not exists title_amharic text,
  add column if not exists document_type text not null default 'book',
  add column if not exists publication_date date;

alter table public.church_library_books
  drop constraint if exists church_library_books_document_type_check;

alter table public.church_library_books
  add constraint church_library_books_document_type_check
  check (document_type in ('book', 'article', 'teaching', 'liturgy', 'reference', 'other'));

comment on column public.church_library_books.title_amharic is
  'Optional catalog title in Amharic. It is metadata, not extracted content.';
comment on column public.church_library_books.document_type is
  'Catalog classification only; it does not control public retrieval.';

create table if not exists public.church_library_ingestion_jobs (
  id uuid primary key default gen_random_uuid(),
  book_id uuid not null references public.church_library_books(id) on delete cascade,
  version_id uuid not null references public.church_library_book_versions(id) on delete cascade,
  status text not null default 'pending'
    check (status in ('pending', 'processing', 'ready', 'needs_ocr', 'failed', 'cancelled')),
  stage text not null default 'queued'
    check (stage in ('queued', 'download', 'extract', 'segment', 'embed', 'index', 'complete', 'failed')),
  error_code text,
  error_message text,
  passage_count integer not null default 0 check (passage_count >= 0),
  requested_by uuid references auth.users(id) on delete set null,
  started_at timestamptz,
  completed_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists church_library_ingestion_jobs_book_created_idx
  on public.church_library_ingestion_jobs (book_id, created_at desc);
create index if not exists church_library_ingestion_jobs_version_created_idx
  on public.church_library_ingestion_jobs (version_id, created_at desc);
create unique index if not exists church_library_one_active_ingestion_per_version
  on public.church_library_ingestion_jobs (version_id)
  where status in ('pending', 'processing');

alter table public.church_library_ingestion_jobs enable row level security;

do $$
begin
  if not exists (
    select 1 from pg_policies
    where schemaname = 'public'
      and tablename = 'church_library_ingestion_jobs'
      and policyname = 'church_library_ingestion_jobs_staff_only'
  ) then
    create policy church_library_ingestion_jobs_staff_only
      on public.church_library_ingestion_jobs
      for all to authenticated
      using (public.is_staff())
      with check (public.is_staff());
  end if;
end $$;

-- The originals bucket stays private. Add Markdown without replacing its
-- existing type list or changing any object policy.
update storage.buckets
set allowed_mime_types = case
  when allowed_mime_types is null then array['text/markdown']::text[]
  when 'text/markdown' = any(allowed_mime_types) then allowed_mime_types
  else array_append(allowed_mime_types, 'text/markdown')
end
where id = 'church-library-originals';

notify pgrst, 'reload schema';

commit;
