-- Run only against the disposable pre-import staging scaffold after its 834-row draft import.
\set ON_ERROR_STOP on
begin;

create function pg_temp.check_ok(ok boolean,label text) returns void language plpgsql as $$
begin if ok is distinct from true then raise exception 'FAIL: %',label; end if; end $$;
grant execute on function pg_temp.check_ok(boolean,text) to anon,authenticated,service_role;

select id as bible_id from public.play_content_items
 where source_references->0->>'kind'='bible' order by stable_id limit 1 \gset
select id as absent_id from public.play_content_items
 where source_references->0->>'route' in ('/library/read/church-history-ethiopia','/library/read/church-history-worldwide','/library/read/seven-sacraments')
 order by stable_id limit 1 \gset
select id as adventure_id from public.play_content_items where game_type='adventures' order by stable_id limit 1 \gset

select pg_temp.check_ok((select count(*)=834 and count(*) filter(where status='draft')=834 from public.play_content_items),'834 imported drafts');
select pg_temp.check_ok((select count(*)=1 from pg_constraint where conrelid='public.play_content_items'::regclass
 and contype='c' and pg_get_constraintdef(oid) like '%approved%' and pg_get_constraintdef(oid) like '%rejected%'),'six-state constraint');
select pg_temp.check_ok((select count(*)=1 from pg_constraint where conrelid='public.play_content_items'::regclass
 and contype='c' and pg_get_constraintdef(oid) like '%adventure%' and pg_get_constraintdef(oid) like '%adventures%'),'legacy and canonical adventure constraint');

set local role anon;
select pg_temp.check_ok((select count(*)=0 from public.play_content_items),'anonymous sees no drafts');
reset role;

set local role authenticated;
select set_config('request.jwt.claim.sub','00000000-0000-4000-8000-000000000001',true);
select pg_temp.check_ok((select count(*)=0 from public.play_content_items),'ordinary authenticated user sees no drafts');
select pg_temp.check_ok((select count(*)=0 from public.play_content_import_batches),'ordinary user sees no import audit');
reset role;

set local role authenticated;
select set_config('request.jwt.claim.sub','00000000-0000-4000-8000-000000000002',true);
select pg_temp.check_ok((select count(*)=834 from public.play_content_items),'editor sees all drafts');
select pg_temp.check_ok((select count(*)=0 from public.play_content_import_batches),'editor cannot read import audit');
select public.review_play_content(:'bible_id'::uuid,'review','editor submitted');
select public.review_play_content(:'absent_id'::uuid,'review','editor submitted absent source');
reset role;

set local role authenticated;
select set_config('request.jwt.claim.sub','00000000-0000-4000-8000-000000000003',true);
select pg_temp.check_ok((select count(*)>0 from public.play_content_import_batches),'administrator can read import audit');
select public.review_play_content(:'bible_id'::uuid,'approved','admin approved');
select public.review_play_content(:'bible_id'::uuid,'published','admin published');
select public.review_play_content(:'absent_id'::uuid,'approved','admin approved but source absent');
do $$ declare blocked boolean:=false; target_id uuid; begin
  select id into target_id from public.play_content_items
    where source_references->0->>'route' in ('/library/read/church-history-ethiopia','/library/read/church-history-worldwide','/library/read/seven-sacraments')
      and status='approved' order by stable_id limit 1;
  begin perform public.review_play_content(target_id,'published','must remain hidden');
  exception when check_violation then blocked:=true; end;
  perform pg_temp.check_ok(blocked,'missing Church Library source blocks publication');
end $$;
reset role;

set local role anon;
select pg_temp.check_ok((select count(*)=1 from public.play_content_items),'anonymous sees only the published item');
reset role;

set local role authenticated;
select set_config('request.jwt.claim.sub','00000000-0000-4000-8000-000000000003',true);
select public.review_play_content(:'bible_id'::uuid,'archived','admin archived');
reset role;
set local role anon;
select pg_temp.check_ok((select count(*)=0 from public.play_content_items),'archive immediately hides content');
reset role;

-- Service role may create drafts, but cannot publish or update rows directly.
set local role service_role;
do $$ declare blocked boolean:=false; begin
  begin
    insert into public.play_content_items(id,question_id,stable_id,game_type,category,difficulty,payload,source_references,status)
      select '10000000-0000-4000-8000-000000000001','service-direct-publish','service-direct-publish',game_type,category,difficulty,
        jsonb_set(payload,'{id}','"service-direct-publish"'),source_references,'published'
      from public.play_content_items where game_type='adventures' order by stable_id limit 1;
  exception when check_violation then blocked:=true; end;
  perform pg_temp.check_ok(blocked,'service direct publication blocked');
end $$;
insert into public.play_content_items(id,question_id,stable_id,game_type,category,difficulty,payload,source_references,status)
  select '10000000-0000-4000-8000-000000000002','legacy-adventure-alias-test','legacy-adventure-alias-test','adventure',category,difficulty,
    jsonb_set(payload,'{id}','"legacy-adventure-alias-test"'),source_references,'draft'
  from public.play_content_items where id=:'adventure_id'::uuid;
select pg_temp.check_ok((select game_type='adventures' from public.play_content_items where stable_id='legacy-adventure-alias-test'),'new adventure alias canonicalized');
do $$ declare blocked boolean:=false; begin
  begin update public.play_content_items set status='published' where stable_id='legacy-adventure-alias-test';
  exception when insufficient_privilege then blocked:=true; end;
  perform pg_temp.check_ok(blocked,'service direct update has no grant');
end $$;
reset role;

-- One call records duplicate, conflict, and invalid-row failure without overwriting.
set local role service_role;
select public.import_play_content_drafts(jsonb_build_array(
  (select jsonb_build_object('stable_id',stable_id,'game_type',game_type,'category',category,'difficulty',difficulty,
    'payload',payload,'source_references',source_references,'hash','duplicate') from public.play_content_items where id=:'adventure_id'::uuid),
  (select jsonb_build_object('stable_id',stable_id,'game_type',game_type,'category',category,'difficulty',difficulty,
    'payload',payload,'source_references',source_references||jsonb_build_array(jsonb_build_object('kind','bible','route','/bible/genesis/1','label','Concurrency-safe conflict probe')),
    'hash','conflict') from public.play_content_items where id=:'adventure_id'::uuid),
  (select jsonb_build_object('stable_id','INVALID ID','game_type',game_type,'category',category,'difficulty',difficulty,
    'payload',payload,'source_references',source_references,'hash','invalid') from public.play_content_items where id=:'adventure_id'::uuid)
),'deadbee',repeat('a',64));
reset role;
select pg_temp.check_ok((select duplicate_count=1 and conflict_count=1 and failed_count=1 and inserted_count=0 and status='failed'
  from public.play_content_import_batches where source_commit='deadbee'),'complete duplicate/conflict/failure audit');
select pg_temp.check_ok((select count(*)=3 and count(*) filter(where error is not null)=2
  from public.play_content_import_items where batch_id=(select id from public.play_content_import_batches where source_commit='deadbee')),'three per-row audit entries');

-- Rollback scope contains only unchanged drafts inserted by the selected batch.
set local role service_role;
select (public.import_play_content_drafts(jsonb_build_array(
  (select jsonb_build_object('stable_id','rollback-unchanged','game_type',game_type,'category',category,'difficulty',difficulty,
    'payload',jsonb_set(payload,'{id}','"rollback-unchanged"'),'source_references',source_references,'hash','rollback-a') from public.play_content_items where id=:'adventure_id'::uuid),
  (select jsonb_build_object('stable_id','rollback-edited','game_type',game_type,'category',category,'difficulty',difficulty,
    'payload',jsonb_set(payload,'{id}','"rollback-edited"'),'source_references',source_references,'hash','rollback-b') from public.play_content_items where id=:'adventure_id'::uuid)
),'feedbee',repeat('b',64))->>'id') as rollback_batch \gset
reset role;
set local role authenticated;
select set_config('request.jwt.claim.sub','00000000-0000-4000-8000-000000000002',true);
update public.play_content_items set payload=jsonb_set(payload,'{name}',to_jsonb((payload->>'name')||' edited')) where stable_id='rollback-edited';
reset role;
set local role service_role;
select public.rollback_play_content_import(:'rollback_batch'::uuid);
reset role;
select pg_temp.check_ok(not exists(select 1 from public.play_content_items where stable_id='rollback-unchanged'),'unchanged imported draft rolled back');
select pg_temp.check_ok(exists(select 1 from public.play_content_items where stable_id='rollback-edited'),'edited draft preserved during rollback');
select pg_temp.check_ok((select status='partial_rollback' from public.play_content_import_batches where id=:'rollback_batch'::uuid),'partial rollback audited');

rollback;
\echo PASS: real database roles, RLS, six-state workflow, aliasing, source gate, audited import, and bounded rollback.
