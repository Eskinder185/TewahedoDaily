-- LOCAL TEST ONLY: run after legacy-stub.sql + 20261028160000 + 20261029120000.
\set ON_ERROR_STOP on
\set payload_am `cat tmp/church-library-db-test/payload-am.json`
\set payload_en `cat tmp/church-library-db-test/payload-en.json`
create or replace function pg_temp.ok(cond boolean, label text) returns void language plpgsql as $$
begin
  if cond is not true then raise exception 'FAILED: %', label; end if;
  raise notice 'PASS %', label;
end $$;
create or replace function pg_temp.expect_error(stmt text, code text, label text) returns void language plpgsql as $$
begin
  begin
    execute stmt;
  exception when others then
    if sqlstate = code then raise notice 'PASS %', label; return; end if;
    raise exception 'FAILED: % (got % %)', label, sqlstate, sqlerrm;
  end;
  raise exception 'FAILED: % (no error)', label;
end $$;
grant execute on function pg_temp.ok(boolean, text), pg_temp.expect_error(text, text, text) to anon, authenticated;

-- 1. Legacy books keep their visibility -------------------------------------
select set_config('request.jwt.claim.sub', '', false);  -- anonymous visitor: no user id
set role anon;
select pg_temp.ok((select count(*) from church_library_books) = 1, 'anon still sees exactly the legacy public book');
select pg_temp.ok((select count(*) from church_library_passages) = 1, 'anon still sees only the legacy public passage');
select pg_temp.ok((select count(*) from search_church_library_sections('ሀጢአት', 5)) = 1, 'section search finds legacy passage with folded spelling (ኃ ⇄ ሀ)');
select pg_temp.ok((select count(*) from search_church_library('ኃጢአት', 5)) = 1, 'existing search function still works');
reset role;

-- 2. Import is staff-only, always draft --------------------------------------
select set_config('request.jwt.claim.sub', '00000000-0000-0000-0000-00000000000b', false);
set role authenticated;
select pg_temp.expect_error(format('select church_library_import_structured(%L::jsonb)', :'payload_am'), '42501', 'non-staff cannot import');
reset role;

select set_config('request.jwt.claim.sub', '00000000-0000-0000-0000-00000000000a', false);
set role authenticated;
create temp table imp as select church_library_import_structured(:'payload_am'::jsonb) as r;
select pg_temp.ok((select (r ->> 'passages')::int from imp) = 556, 'Amharic edition imported: 556 paragraphs');
select pg_temp.ok((select (r ->> 'sections')::int from imp) = (select jsonb_array_length((:'payload_am'::jsonb) -> 'sections')), 'all sections imported');
select pg_temp.ok((select publication_status from church_library_books where slug = 'seven-sacraments-am') = 'draft', 'new book starts as draft');
select pg_temp.ok((select access_level from church_library_books where slug = 'seven-sacraments-am') = 'private', 'new book is private');
select church_library_import_structured(:'payload_en'::jsonb);
select pg_temp.expect_error(format('select church_library_import_structured(%L::jsonb)', :'payload_am'), '23505', 'same slug cannot be imported twice (no overwrite)');
select pg_temp.expect_error(format('select church_library_import_structured(%L::jsonb)', jsonb_set(:'payload_am'::jsonb, '{book,slug}', '"another-slug"')), '23505', 'same collection + language is detected as a duplicate');
select pg_temp.ok((select count(*) from church_library_passages p join church_library_books b on b.id = p.book_id
                   where b.slug = 'seven-sacraments-am' and p.content like '%〔%') = 0, 'no review markers in imported text');
select pg_temp.ok((select count(*) from church_library_passages p join church_library_books b on b.id = p.book_id
                   where b.slug = 'seven-sacraments-am' and cardinality(p.source_review_notes) > 0) > 100, 'review notes kept on paragraphs');
select pg_temp.ok((select count(*) from church_library_sections s join church_library_books b on b.id = s.book_id
                   where b.slug = 'seven-sacraments-am' and s.parent_section_id is not null) > 70, 'chapter → section hierarchy stored');
select pg_temp.ok((select count(*) from church_library_books where id in ('10000000-0000-0000-0000-000000000001','10000000-0000-0000-0000-000000000002')) = 2, 'existing books untouched');
reset role;

-- 3. Drafts are invisible to the public, even if someone ticks the old gates --
update church_library_books set access_level = 'public_search', approved_for_ingestion = true, allow_search_quotes = true,
       rights_status = 'owned', public_retrieval_enabled = true, processing_status = 'ready' where slug = 'seven-sacraments-en';
select set_config('request.jwt.claim.sub', '', false);  -- anonymous visitor: no user id
set role anon;
select pg_temp.ok((select count(*) from church_library_books where slug like 'seven-sacraments%') = 0, 'draft books hidden from anon (even with old gates on)');
select pg_temp.ok((select count(*) from church_library_sections) = 0, 'draft sections hidden from anon');
select pg_temp.ok((select count(*) from church_library_passages where content like '%Baptism%') = 0, 'draft passages hidden from anon');
select pg_temp.ok((select count(*) from search_church_library_sections('Baptism', 10)) = 0, 'draft content never in section search');
select pg_temp.ok((select count(*) from search_church_library('Baptism', 10)) = 0, 'draft content never in the existing search');
reset role;

-- 4. Workflow: draft → reviewed → published ----------------------------------
select set_config('request.jwt.claim.sub', '00000000-0000-0000-0000-00000000000a', false);  -- staff
set role authenticated;
select pg_temp.expect_error(format('select church_library_set_publication_status(%L, ''published'')', (select id from church_library_books where slug = 'seven-sacraments-am')), '55000', 'cannot publish a draft directly');
select church_library_set_publication_status((select id from church_library_books where slug = 'seven-sacraments-am'), 'reviewed', 'Checked against source');
select pg_temp.ok((select publication_status from church_library_books where slug = 'seven-sacraments-am') = 'reviewed', 'draft → reviewed');
select pg_temp.expect_error(format('select church_library_set_publication_status(%L, ''published'')', (select id from church_library_books where slug = 'seven-sacraments-am')), '55000', 'publishing needs the existing rights/approval gates');
update church_library_books set access_level = 'public_search', approved_for_ingestion = true, allow_search_quotes = true, rights_status = 'owned'
 where slug = 'seven-sacraments-am';
select church_library_set_publication_status((select id from church_library_books where slug = 'seven-sacraments-am'), 'published');
select pg_temp.ok((select publication_status from church_library_books where slug = 'seven-sacraments-am') = 'published', 'reviewed → published');
reset role;

select set_config('request.jwt.claim.sub', '', false);  -- anonymous visitor: no user id
set role anon;
select pg_temp.ok((select count(*) from church_library_books where slug = 'seven-sacraments-am') = 1, 'published book visible to anon');
select pg_temp.ok((select count(*) from church_library_books where slug = 'seven-sacraments-en') = 0, 'unpublished English edition still hidden');
select pg_temp.ok((select count(*) from church_library_passages p where p.book_id = (select id from church_library_books where slug = 'seven-sacraments-am')) = 556, 'all 556 paragraphs readable');
select pg_temp.ok((select count(*) from church_library_sections s where s.book_id = (select id from church_library_books where slug = 'seven-sacraments-am') and s.stable_key = 'SS-001-S003') = 1, 'stable section key resolvable');
select pg_temp.ok((select count(*) from search_church_library_sections('ምሥጢረ ጥምቀት', 10)) > 0, 'Amharic phrase search');
select pg_temp.ok((select count(*) from search_church_library_sections('ምስጢረ ጥምቀት', 10)) > 0, 'ሥ and ስ spellings both match (ሠ family folds to ሰ)') ;
select pg_temp.ok((select count(*) from search_church_library_sections('ሐዋርያት', 10)) = (select count(*) from search_church_library_sections('ሀዋርያት', 10)), 'ሐ and ሀ spellings give the same results');
select pg_temp.ok((select count(*) from search_church_library_sections('ዮሐ 3:5', 10)) > 0, 'reference typed with ":" finds "፥"');
select pg_temp.ok((select section_key from search_church_library_sections('የማዕተቡ ቀለሞች', 3) limit 1) = 'SS-001-S010', 'citation carries the stable section key');
select pg_temp.ok((select book_slug from search_church_library_sections('ምሥጢረ ጥምቀት', 3) limit 1) = 'seven-sacraments-am', 'citation carries the book slug');
reset role;

-- 5. Unpublish ---------------------------------------------------------------
select set_config('request.jwt.claim.sub', '00000000-0000-0000-0000-00000000000a', false);  -- staff
set role authenticated;
select church_library_set_publication_status((select id from church_library_books where slug = 'seven-sacraments-am'), 'draft', 'pulled for corrections');
reset role;
select set_config('request.jwt.claim.sub', '', false);  -- anonymous visitor: no user id
set role anon;
select pg_temp.ok((select count(*) from church_library_books where slug = 'seven-sacraments-am') = 0, 'unpublished book hidden again');
select pg_temp.ok((select count(*) from search_church_library_sections('ምሥጢረ ጥምቀት', 10)) = 0, 'unpublished book leaves search');
reset role;

-- 6. Bookmarks & reading progress are private per person ---------------------
select set_config('request.jwt.claim.sub', '00000000-0000-0000-0000-00000000000a', false);  -- staff
set role authenticated;
insert into church_library_bookmarks (book_id, section_key, passage_key, label)
  select id, 'SS-001-S001', 'SS-001-S001-P001', 'Old Testament baptism' from church_library_books where slug = 'seven-sacraments-am';
insert into church_library_reading_progress (book_id, section_key, percent)
  select id, 'SS-001-S001', 12.5 from church_library_books where slug = 'seven-sacraments-am';
select pg_temp.ok((select count(*) from church_library_bookmarks) = 1, 'owner sees bookmark');
reset role;
select set_config('request.jwt.claim.sub', '00000000-0000-0000-0000-00000000000c', false);
set role authenticated;
select pg_temp.ok((select count(*) from church_library_bookmarks) = 0, 'other users cannot see it');
select pg_temp.ok((select count(*) from church_library_reading_progress) = 0, 'other users cannot see progress');
select pg_temp.expect_error($$insert into church_library_bookmarks (user_id, book_id) values ('00000000-0000-0000-0000-00000000000a', (select id from church_library_books limit 1))$$, '42501', 'cannot write a bookmark for someone else');
reset role;
select set_config('request.jwt.claim.sub', '', false);  -- anonymous visitor: no user id
set role anon;
select pg_temp.expect_error('select count(*) from church_library_bookmarks', '42501', 'anon has no bookmark access');
reset role;

-- 7. Original download only where allowed ------------------------------------
insert into storage.objects (bucket_id, name) values ('church-library-originals', 'originals/seven-sacraments-am.txt'), ('church-library-originals', 'legacy/private.pdf');
update church_library_books set download_storage_path = 'originals/seven-sacraments-am.txt', allow_original_download = true,
       publication_status = 'published', public_retrieval_enabled = true where slug = 'seven-sacraments-am';
select set_config('request.jwt.claim.sub', '', false);  -- anonymous visitor: no user id
set role anon;
select pg_temp.ok((select count(*) from storage.objects where name = 'originals/seven-sacraments-am.txt') = 1, 'permitted original is downloadable');
select pg_temp.ok((select count(*) from storage.objects where name = 'legacy/private.pdf') = 0, 'other originals stay private');
reset role;
update church_library_books set allow_original_download = false where slug = 'seven-sacraments-am';
select set_config('request.jwt.claim.sub', '', false);  -- anonymous visitor: no user id
set role anon;
select pg_temp.ok((select count(*) from storage.objects) = 0, 'download switched off → object private again');
reset role;

-- 8. Re-applying the migration is safe ----------------------------------------
\echo 'ALL CHURCH LIBRARY DATABASE CHECKS PASSED'
