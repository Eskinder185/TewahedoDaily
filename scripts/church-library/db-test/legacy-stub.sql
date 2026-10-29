-- LOCAL TEST ONLY. Recreates the deployed legacy Church Library shape recorded
-- in 20261028160000 (books: id/title/author/language/category/description/
-- storage_path/ingestion_status/search_enabled; passages: id/book_id/
-- passage_order/language/content) plus the Supabase pieces the migrations use.
do $$ begin
  if not exists (select 1 from pg_roles where rolname = 'anon') then create role anon; end if;
  if not exists (select 1 from pg_roles where rolname = 'authenticated') then create role authenticated; end if;
  if not exists (select 1 from pg_roles where rolname = 'service_role') then create role service_role; end if;
end $$;
create schema if not exists auth;
create schema if not exists extensions;
create schema if not exists storage;
create table auth.users (id uuid primary key);
create function auth.uid() returns uuid language sql stable
  as $$ select nullif(current_setting('request.jwt.claim.sub', true), '')::uuid $$;
grant usage on schema public, auth, extensions, storage to anon, authenticated, service_role;
grant execute on function auth.uid() to anon, authenticated;

create table public.profiles (id uuid primary key, role text);
grant select on public.profiles to authenticated;
create function public.is_staff() returns boolean language sql stable security definer set search_path = public
  as $$ select coalesce((select role in ('editor','admin','super_admin') from public.profiles where id = auth.uid()), false) $$;
grant execute on function public.is_staff() to anon, authenticated;

create table storage.objects (id uuid primary key default gen_random_uuid(), bucket_id text, name text);
alter table storage.objects enable row level security;
grant select on storage.objects to anon, authenticated;

create table public.church_library_books (
  id uuid primary key default gen_random_uuid(),
  title text not null, author text, language text not null default 'en', category text, description text,
  storage_path text not null, ingestion_status text, search_enabled boolean,
  created_at timestamptz default now(), updated_at timestamptz default now(), created_by uuid, updated_by uuid);
create table public.church_library_passages (
  id uuid primary key default gen_random_uuid(),
  book_id uuid not null references public.church_library_books(id) on delete cascade,
  passage_order integer not null, language text not null default 'en', content text not null);
alter table public.church_library_books enable row level security;
alter table public.church_library_passages enable row level security;
grant select, insert, update, delete on public.church_library_books, public.church_library_passages to authenticated;
grant select on public.church_library_books, public.church_library_passages to anon;
create policy church_library_books_staff_all on public.church_library_books for all to authenticated
  using (public.is_staff()) with check (public.is_staff());
create policy church_library_passages_staff_all on public.church_library_passages for all to authenticated
  using (public.is_staff()) with check (public.is_staff());

-- seed: one legacy public book, one legacy private book
insert into auth.users values ('00000000-0000-0000-0000-00000000000a'), ('00000000-0000-0000-0000-00000000000b'), ('00000000-0000-0000-0000-00000000000c');
insert into public.profiles values ('00000000-0000-0000-0000-00000000000a', 'admin'), ('00000000-0000-0000-0000-00000000000b', 'member');
insert into public.church_library_books (id, title, language, storage_path, ingestion_status, search_enabled) values
  ('10000000-0000-0000-0000-000000000001', 'Legacy Public Book', 'am', 'legacy/public.pdf', 'ready', true),
  ('10000000-0000-0000-0000-000000000002', 'Legacy Private Book', 'en', 'legacy/private.pdf', 'pending', false);
insert into public.church_library_passages (book_id, passage_order, language, content) values
  ('10000000-0000-0000-0000-000000000001', 0, 'am', 'የቀድሞ መጽሐፍ ምንባብ ኃጢአት'),
  ('10000000-0000-0000-0000-000000000002', 0, 'en', 'Private legacy passage');
