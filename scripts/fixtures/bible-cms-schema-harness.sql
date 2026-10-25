\set ON_ERROR_STOP on
create role anon nologin;
create role authenticated nologin;
create role service_role nologin bypassrls;
create schema auth;
create table auth.users(id uuid primary key);
create or replace function auth.uid() returns uuid language sql stable as $$
  select nullif(current_setting('request.jwt.claim.sub', true), '')::uuid
$$;
create table public.profiles(id uuid primary key references auth.users(id), role text);
create or replace function public.is_staff() returns boolean language sql stable security definer set search_path = public, pg_temp as $$
  select exists(select 1 from public.profiles where id = auth.uid() and role in ('editor','admin','super_admin'))
$$;
grant execute on function public.is_staff() to anon, authenticated;
create or replace function public.set_updated_at() returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end $$;

\ir ../../supabase/migrations/20261004140000_bible_canonical_sources.sql
\ir ../../supabase/migrations/20261004141000_bible_direct_chapter_verses.sql
\ir ../../supabase/migrations/20261024210000_bible_cms_management.sql

insert into auth.users(id) values
  ('00000000-0000-0000-0000-000000000001'),
  ('00000000-0000-0000-0000-000000000002');
insert into public.profiles(id, role) values
  ('00000000-0000-0000-0000-000000000001', 'editor'),
  ('00000000-0000-0000-0000-000000000002', 'user');
insert into public.bible_editions(id, code, name, language_code, attribution, rights_status)
values ('10000000-0000-0000-0000-000000000001', 'test-en', 'Test English', 'en', 'Test attribution', 'unknown');
insert into public.bible_canonical_books(id, canonical_number, collection, slug, name_en, sort_order)
values ('20000000-0000-0000-0000-000000000001', 1, 'old', 'test-book', 'Test Book', 1);
insert into public.bible_source_books(id, edition_id, canonical_book_id, source_book_number, source_file, source_name_en, source_order)
values ('30000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000001', 1, 'test.usfm', 'Test Book', 1);
insert into public.bible_chapters(id, source_book_id, chapter_number, source_order)
values ('40000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000001', 1, 1);

set role authenticated;
select set_config('request.jwt.claim.sub', '00000000-0000-0000-0000-000000000001', false);
select (public.save_bible_chapter_draft(
  '40000000-0000-0000-0000-000000000001',
  '[{"section_id":null,"source_order":1,"verse_number":1,"text":"Draft verse"}]'::jsonb,
  null
)).chapter_id;

do $$ begin
  perform public.publish_bible_chapter_draft('40000000-0000-0000-0000-000000000001', 'must fail rights gate');
  raise exception 'unknown rights unexpectedly published';
exception when check_violation then null; end $$;

select public.update_bible_edition_metadata(
  '10000000-0000-0000-0000-000000000001', 'Test English', 'en', 'Test source',
  'Test attribution', 'permission_granted', 'eotc-81', 'source'
);
select (public.publish_bible_chapter_draft('40000000-0000-0000-0000-000000000001', 'first publication')).revision_number;

reset role;
set role authenticated;
select set_config('request.jwt.claim.sub', '00000000-0000-0000-0000-000000000002', false);
do $$ begin
  perform public.save_bible_chapter_draft(
    '40000000-0000-0000-0000-000000000001',
    '[{"section_id":null,"source_order":1,"verse_number":1,"text":"Unauthorized"}]'::jsonb,
    null
  );
  raise exception 'regular user unexpectedly saved';
exception when insufficient_privilege then null; end $$;

reset role;
set role anon;
select count(*)::int as public_count from public.bible_verses
where chapter_id = '40000000-0000-0000-0000-000000000001' \gset
\if :public_count
  \echo 'public verse visible'
\else
  \quit 1
\endif
reset role;
