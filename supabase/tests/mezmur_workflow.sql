\set ON_ERROR_STOP on
begin;
create function pg_temp.assert_true(value boolean,label text) returns void language plpgsql as $$
begin if value is distinct from true then raise exception 'FAIL: %',label; end if; end $$;
create function pg_temp.denied(statement text) returns void language plpgsql as $$
begin
 begin execute statement; exception when insufficient_privilege then return; end;
 raise exception 'Expected permission denial: %',statement;
end $$;
insert into auth.users(id,email) values
 ('11111111-1111-1111-1111-111111111111','writer@example.invalid'),
 ('22222222-2222-2222-2222-222222222222','other@example.invalid'),
 ('33333333-3333-3333-3333-333333333333','editor@example.invalid'),
 ('44444444-4444-4444-4444-444444444444','admin@example.invalid');
insert into public.profiles(id,role) values
 ('11111111-1111-1111-1111-111111111111','contributor'),
 ('22222222-2222-2222-2222-222222222222','contributor'),
 ('33333333-3333-3333-3333-333333333333','editor'),
 ('44444444-4444-4444-4444-444444444444','admin');
insert into public.tags(id,name,slug) values ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb','Test','test');
set local role authenticated;
select set_config('request.jwt.claim.sub','11111111-1111-1111-1111-111111111111',true);
select public.save_mezmur('{"id":"aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa","title":"Original","slug":"original","status":"draft"}',array['bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb']::uuid[],null);
select pg_temp.assert_true((select count(*)=1 from public.mezmur_tags),'tags saved atomically');
select public.save_mezmur(to_jsonb(m) || '{"title":"Edited"}',array[]::uuid[],m.updated_at) from public.mezmur m where id='aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa';
select pg_temp.assert_true((select title='Edited' from public.mezmur where id='aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'),'edit persisted');
-- Bad tags roll back field changes and revision insertion together.
do $$ declare item public.mezmur; begin
 select * into item from public.mezmur where id='aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa';
 begin perform public.save_mezmur(to_jsonb(item) || '{"title":"Should roll back"}',array['cccccccc-cccc-cccc-cccc-cccccccccccc']::uuid[],item.updated_at);
 exception when foreign_key_violation then
  perform pg_temp.assert_true((select title='Edited' from public.mezmur where id=item.id),'failed tag assignment rolled back title'); return;
 end;
 raise exception 'Missing tag should fail';
end $$;
do $$ declare item public.mezmur; begin
 select * into item from public.mezmur where id='aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa';
 begin perform public.save_mezmur(to_jsonb(item),array[]::uuid[],'2000-01-01'::timestamptz);
 exception when serialization_failure then return; end;
 raise exception 'Stale edit should fail';
end $$;
insert into storage.objects(bucket_id,name) values
 ('mezmur-images','mezmur/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa/cover.png'),
 ('mezmur-audio','mezmur/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa/audio.mp3');
select pg_temp.assert_true((select count(*)=2 from storage.objects),'contributor can preview own uploaded draft media');
select set_config('request.jwt.claim.sub','22222222-2222-2222-2222-222222222222',true);
select pg_temp.denied('insert into storage.objects(bucket_id,name) values (''mezmur-images'',''mezmur/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa/attack.png'')');
select pg_temp.assert_true((select count(*)=0 from storage.objects),'other contributor cannot read private media');
select pg_temp.denied('select public.save_mezmur(''{"id":"aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa","title":"Attack","slug":"attack"}'',array[]::uuid[],null)');
select set_config('request.jwt.claim.sub','11111111-1111-1111-1111-111111111111',true);
select public.save_mezmur(to_jsonb(m) || '{"status":"pending_review","thumbnail_url":"storage://mezmur-images/mezmur/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa/cover.png"}',array['bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb']::uuid[],m.updated_at) from public.mezmur m where id='aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa';
select pg_temp.assert_true((select count(*)=1 from public.mezmur_tags),'submission retains assigned tags');
select pg_temp.denied('insert into storage.objects(bucket_id,name) values (''mezmur-images'',''mezmur/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa/late.png'')');
select pg_temp.denied('select public.save_mezmur(to_jsonb(m) || ''{"status":"published"}'',array[]::uuid[],m.updated_at) from public.mezmur m where id=''aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa''');
select set_config('request.jwt.claim.sub','33333333-3333-3333-3333-333333333333',true);
select pg_temp.assert_true(exists(select 1 from public.content_versions where snapshot->'record'->>'title'='Original' and snapshot->'tag_ids' @> '["bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb"]'),'previous content and tags preserved');
select public.save_mezmur(to_jsonb(m) || '{"status":"published"}',array['bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb']::uuid[],m.updated_at) from public.mezmur m where id='aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa';
insert into storage.objects(bucket_id,name) values ('mezmur-images','mezmur/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa/unsaved.png');
set local role anon;
select set_config('request.jwt.claim.sub','',true);
select pg_temp.assert_true((select count(*)=1 from storage.objects),'only attached published media is public, unsaved uploads hidden');
select pg_temp.denied('select public.save_mezmur(''{"title":"Anonymous","slug":"anonymous"}'',array[]::uuid[],null)');
set local role authenticated;
select set_config('request.jwt.claim.sub','44444444-4444-4444-4444-444444444444',true);
-- Restore previous state as draft, leaving a history of the published state.
select public.save_mezmur(to_jsonb(m) || '{"title":"Original","status":"draft"}',array['bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb']::uuid[],m.updated_at) from public.mezmur m where id='aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa';
do $$ begin
 begin delete from public.tags where id='bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb';
 exception when foreign_key_violation then return; end;
 raise exception 'Used tags must be protected';
end $$;
delete from public.mezmur where id='aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa';
select pg_temp.assert_true(exists(select 1 from public.content_versions where snapshot->>'operation'='DELETE' and snapshot->'tag_ids' @> '["bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb"]'),'deletion preserves tags in history');
rollback;
\echo Mezmur workflow assertions passed
