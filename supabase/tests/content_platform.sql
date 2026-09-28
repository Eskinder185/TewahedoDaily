\set ON_ERROR_STOP on
begin;
create function pg_temp.assert_true(value boolean,label text) returns void language plpgsql as $$begin if value is distinct from true then raise exception 'FAIL: %',label;end if;end$$;
create function pg_temp.denied(statement text) returns void language plpgsql as $$begin begin execute statement;exception when insufficient_privilege then return;end;raise exception 'Expected denial: %',statement;end$$;
insert into auth.users(id,email) values('11111111-1111-1111-1111-111111111111','writer@example.invalid'),('22222222-2222-2222-2222-222222222222','editor@example.invalid'),('33333333-3333-3333-3333-333333333333','admin@example.invalid');
insert into public.profiles(id,role) values('11111111-1111-1111-1111-111111111111','contributor'),('22222222-2222-2222-2222-222222222222','editor'),('33333333-3333-3333-3333-333333333333','admin');
set local role authenticated;
set local request.jwt.claim.sub='11111111-1111-1111-1111-111111111111';
do $$declare kind text; row jsonb;begin
 foreach kind in array array['saints','feasts','prayers','articles'] loop
  row:=public.save_cms_content(kind,jsonb_build_object('title','Platform test','slug','platform-test','body','Original biography','body_amharic','የቅዱስ ታሪክ','body_oromo','Galata','related_content','[]'::jsonb,'is_movable',false));
  perform pg_temp.assert_true(row->>'status'='draft','contributor creates draft');
  perform pg_temp.denied(format('select public.save_cms_content(%L,%L::jsonb,%L)',kind,(row||'{"status":"published"}'::jsonb)::text,row->>'updated_at'));
  row:=public.save_cms_content(kind,row||'{"status":"pending_review","body":"Revised biography"}',(row->>'updated_at')::timestamptz);
  perform pg_temp.assert_true(row->>'status'='pending_review','contributor submits');
 end loop;
end$$;
select pg_temp.denied('insert into public.daily_content(day) values(current_date)');
select pg_temp.denied('select public.cms_media_inventory()');
set local request.jwt.claim.sub='22222222-2222-2222-2222-222222222222';
do $$declare kind text;row jsonb;begin
 foreach kind in array array['saints','feasts','prayers','articles'] loop
  execute format('select to_jsonb(t) from public.%I t where slug=''platform-test''',kind) into row;
  row:=public.save_cms_content(kind,row||'{"status":"published"}',(row->>'updated_at')::timestamptz);
  perform pg_temp.assert_true(row->>'status'='published','editor publishes reviewed content');
  perform pg_temp.assert_true(exists(select 1 from public.content_versions where content_id=(row->>'id')::uuid and snapshot->'record'->>'body'='Original biography'),'before state saved');
 end loop;
end$$;
select pg_temp.denied('insert into public.daily_content(day) values(current_date)');
select id as saint_id from public.saints where slug='platform-test' \gset
select id as feast_id from public.feasts where slug='platform-test' \gset
insert into storage.objects(bucket_id,name,metadata) values('saints','saints/'||:'saint_id'||'/attached.png','{"mimetype":"image/png","size":100}'),('saints','saints/'||:'saint_id'||'/orphan.png','{"mimetype":"image/png","size":100}');
update public.saints set thumbnail_url='storage://saints/saints/'||:'saint_id'||'/attached.png' where id=:'saint_id';
set local request.jwt.claim.sub='33333333-3333-3333-3333-333333333333';
insert into public.daily_content(day,saint_id,feast_id,bible_references,fasting_indicator,published) values(current_date,:'saint_id',:'feast_id','John 1:1–14','Fasting day',true);
insert into public.daily_content(day,announcement,published) values(current_date+1,'Private draft announcement',false);
select pg_temp.assert_true((public.cms_media_inventory()->>'total')::int=2,'admin inventory');
delete from storage.objects where name='saints/'||:'saint_id'||'/attached.png';
select pg_temp.assert_true(exists(select 1 from storage.objects where name='saints/'||:'saint_id'||'/attached.png'),'attached file deletion denied');
delete from storage.objects where name='saints/'||:'saint_id'||'/orphan.png';
select pg_temp.assert_true(not exists(select 1 from storage.objects where name='saints/'||:'saint_id'||'/orphan.png'),'orphan deletion allowed');
reset role;
set local role anon;
set local request.jwt.claim.sub='';
select pg_temp.assert_true(public.public_daily_content(current_date)->'saint'->>'title'='Platform test','published daily selection');
select pg_temp.assert_true(public.public_daily_content(current_date+1) is null,'draft schedule hidden');
select pg_temp.assert_true((select count(*)=1 from storage.objects),'only attached published media readable');
select pg_temp.denied('select public.cms_media_inventory()');
select pg_temp.denied('select public.save_cms_content(''saints'',''{}'')');
reset role;
set local role authenticated;
set local request.jwt.claim.sub='33333333-3333-3333-3333-333333333333';
update public.saints set status='archived',thumbnail_url=null where id=:'saint_id';
select pg_temp.assert_true(public.public_daily_content(current_date)->'saint'='null'::jsonb,'staff public daily RPC hides archived target');
delete from storage.objects where name='saints/'||:'saint_id'||'/attached.png';
select pg_temp.assert_true(exists(select 1 from storage.objects where name='saints/'||:'saint_id'||'/attached.png'),'revision reference protects file');
reset role;
set local role anon;
set local request.jwt.claim.sub='';
select pg_temp.assert_true((select count(*)=0 from public.saints),'archived saint inaccessible');
select pg_temp.assert_true((select count(*)=0 from storage.objects),'unattached archived media hidden');
reset role;
rollback;
\echo Content editors, daily schedules, media privacy, and safe deletion passed.
