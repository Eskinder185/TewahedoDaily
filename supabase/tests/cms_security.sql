-- Run against a disposable Supabase project or a local instance AFTER migrations.
-- All fixtures and assertions roll back. Stops on the first failed assertion.
\set ON_ERROR_STOP on
begin;
-- Even a broad legacy storage policy must not bypass the CMS boundaries.
create policy cms_test_legacy_allow on storage.objects for all to anon,authenticated using (true) with check (true);
create function pg_temp.assert_true(value boolean, label text) returns void language plpgsql as $$
begin if value is distinct from true then raise exception 'FAIL: %',label; end if; end $$;
create function pg_temp.denied(statement text) returns void language plpgsql as $$
begin
 begin execute statement; exception when insufficient_privilege then return; end;
 raise exception 'Expected permission denial: %',statement;
end $$;
insert into auth.users(id,email) values
 ('11111111-1111-1111-1111-111111111111','cms-test-contributor@example.invalid'),
 ('22222222-2222-2222-2222-222222222222','cms-test-other@example.invalid'),
 ('33333333-3333-3333-3333-333333333333','cms-test-editor@example.invalid'),
 ('44444444-4444-4444-4444-444444444444','cms-test-admin@example.invalid'),
 ('55555555-5555-5555-5555-555555555555','cms-test-super@example.invalid'),
 ('66666666-6666-6666-6666-666666666666','cms-test-unassigned@example.invalid');
insert into public.profiles(id,email,role) select id,email,case id::text
 when '11111111-1111-1111-1111-111111111111' then 'contributor'
 when '22222222-2222-2222-2222-222222222222' then 'contributor'
 when '33333333-3333-3333-3333-333333333333' then 'editor'
 when '44444444-4444-4444-4444-444444444444' then 'admin'
 when '55555555-5555-5555-5555-555555555555' then 'super_admin'
 end::public.cms_role from auth.users where email like 'cms-test-%@example.invalid' and id::text <> '66666666-6666-6666-6666-666666666666';
set local role authenticated;
select set_config('request.jwt.claim.sub','11111111-1111-1111-1111-111111111111',true);
do $$ declare t text; begin
 foreach t in array array['mezmur','saints','feasts','prayers','articles'] loop
  execute format('insert into public.%I (id,slug,title,created_by) values (''aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'',''cms-security-test'',''Draft'',''22222222-2222-2222-2222-222222222222'')',t);
  execute format('select pg_temp.assert_true((select created_by = auth.uid() from public.%I where slug = ''cms-security-test''),''creator cannot be spoofed'')',t);
  perform pg_temp.denied(format('update public.%I set status = ''published'' where slug = ''cms-security-test''',t));
  perform pg_temp.denied(format('insert into public.%I(slug,title,status) values (''invalid'',''Invalid'',''pending_review'')',t));
 end loop;
end $$;
select pg_temp.denied('update public.profiles set role = ''super_admin'' where id = auth.uid()');
select pg_temp.denied('select public.set_cms_member(auth.uid(),''super_admin'')');
select pg_temp.denied('insert into public.content_versions(content_type,content_id,snapshot) values (''mezmur'',''aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'',''{}'')');
select pg_temp.denied('insert into public.categories(name,slug) values (''Bad'',''bad'')');
select pg_temp.denied('insert into storage.objects(bucket_id,name) values (''mezmur-images'',''bad'')');
select set_config('request.jwt.claim.sub','22222222-2222-2222-2222-222222222222',true);
select pg_temp.assert_true((select count(*) = 0 from public.mezmur where slug = 'cms-security-test'),'other contributor cannot read drafts');
with changed as (update public.mezmur set title = 'Bad' where slug = 'cms-security-test' returning id)
select pg_temp.assert_true((select count(*) = 0 from changed),'other contributor cannot edit');
select set_config('request.jwt.claim.sub','11111111-1111-1111-1111-111111111111',true);
update public.mezmur set title = 'Edited', status = 'pending_review' where slug = 'cms-security-test';
with changed as (update public.mezmur set status = 'draft' where slug = 'cms-security-test' returning id)
select pg_temp.assert_true((select count(*) = 0 from changed),'contributor cannot reclaim submission');
select set_config('request.jwt.claim.sub','33333333-3333-3333-3333-333333333333',true);
select pg_temp.denied('update public.saints set status = ''published'' where slug = ''cms-security-test''');
update public.mezmur set status = 'published' where slug = 'cms-security-test';
select pg_temp.assert_true((select published_at is not null from public.mezmur where slug = 'cms-security-test'),'editor publishes reviewed content');
select pg_temp.assert_true((select count(*) >= 3 from public.content_versions where content_id = 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'),'automatic history');
select pg_temp.denied('select public.set_cms_member(auth.uid(),''admin'')');
select set_config('request.jwt.claim.sub','44444444-4444-4444-4444-444444444444',true);
select public.set_cms_member('22222222-2222-2222-2222-222222222222','editor');
select pg_temp.denied('select public.set_cms_member(auth.uid(),''super_admin'')');
select pg_temp.denied('select public.set_cms_member(''55555555-5555-5555-5555-555555555555'',''contributor'')');
insert into storage.objects(bucket_id,name) values
 ('mezmur-images','mezmur/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa/published.jpg'),
 ('saints','saints/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa/draft.jpg');
update public.mezmur set thumbnail_url = 'storage://mezmur-images/mezmur/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa/published.jpg' where slug = 'cms-security-test';
select set_config('request.jwt.claim.sub','66666666-6666-6666-6666-666666666666',true);
select pg_temp.denied('insert into public.articles(slug,title) values (''bad'',''Bad'')');
select set_config('request.jwt.claim.sub','',true);
set local role anon;
select pg_temp.assert_true((select count(*) = 1 from public.mezmur where slug = 'cms-security-test'),'public published read');
select pg_temp.assert_true((select count(*) = 0 from public.saints where slug = 'cms-security-test'),'public draft hidden');
select pg_temp.assert_true((select count(*) = 1 from storage.objects where name like '%aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa%'),'only published media visible');
select pg_temp.denied('insert into public.mezmur(slug,title) values (''bad'',''Bad'')');
select pg_temp.denied('select * from public.profiles');
select pg_temp.denied('insert into storage.objects(bucket_id,name) values (''mezmur-images'',''anonymous-upload'')');
select pg_temp.denied('select * from public.content_reports');
select pg_temp.denied('select * from public.content_versions');
select pg_temp.denied('insert into public.content_reports(content_type,content_id,message) values (''mezmur'',''aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'',''Anonymous spam'')');
set local role authenticated;
select set_config('request.jwt.claim.sub','55555555-5555-5555-5555-555555555555',true);
select public.set_cms_member('22222222-2222-2222-2222-222222222222','admin');
select pg_temp.assert_true((select role = 'admin' from public.profiles where id = '22222222-2222-2222-2222-222222222222'),'super admin can assign admin');
do $$ begin
 begin perform public.set_cms_member(auth.uid(),null);
 exception when raise_exception then
  if sqlerrm = 'Cannot remove the last super admin' then return; end if;
  raise;
 end;
 raise exception 'last super admin should be protected';
end $$;
update public.mezmur set status = 'archived' where slug = 'cms-security-test';
select set_config('request.jwt.claim.sub','',true);
set local role anon;
select pg_temp.assert_true((select count(*) = 0 from storage.objects where name like '%aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa%'),'unpublishing revokes new media reads');
rollback;
\echo CMS security assertions passed
