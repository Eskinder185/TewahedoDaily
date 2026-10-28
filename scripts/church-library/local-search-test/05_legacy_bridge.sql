-- Test-only bridge that reproduces the legacy production shape the reconcile migration expects.
alter table public.church_library_versions rename to church_library_book_versions;
alter table public.church_library_books add column if not exists ingestion_status text, add column if not exists search_enabled boolean default false, add column if not exists storage_path text;
