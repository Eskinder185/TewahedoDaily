-- Behavioural security tests for public.rollback_play_content_import (the only SECURITY DEFINER function in the PR #15 proposal).
-- Run ONLY against the disposable pre-import staging scaffold, after the proposal is committed and the 834-row draft import has run
-- (scripts/test-consolidation-staging-import.ts). Everything happens in one transaction that is rolled back at the end.
-- Not evidence for hosted Supabase: owners, default privileges and JWT/PostgREST role switching must be re-checked on staging.
\set ON_ERROR_STOP on
begin;

create function pg_temp.check_ok(ok boolean,label text) returns void language plpgsql as $$
begin if ok is distinct from true then raise exception 'FAIL: %',label; end if; end $$;
-- Run a statement as the CURRENT role and require a specific SQLSTATE. The inner block is a subtransaction, so a failing
-- statement leaves no partial effect behind.
create function pg_temp.expect_error(stmt text,expected_state text,label text) returns void language plpgsql as $$
begin
  begin
    execute stmt;
  exception when others then
    if sqlstate = expected_state then return; end if;
    raise exception 'FAIL: % (expected % but got %: %)',label,expected_state,sqlstate,sqlerrm;
  end;
  raise exception 'FAIL: % (statement succeeded)',label;
end $$;
-- Clone a known-valid imported row under new stable IDs, so the server validator accepts the synthetic manifest rows.
create function pg_temp.manifest(ids text[]) returns jsonb language sql stable as $$
  select jsonb_agg(jsonb_build_object('stable_id',s,'game_type',b.game_type,'category',b.category,'difficulty',b.difficulty,
    'payload',jsonb_set(b.payload,'{id}',to_jsonb(s)),'source_references',b.source_references,'hash','rbs-'||s) order by s)
  from unnest(ids) s,
    (select * from public.play_content_items where source_references->0->>'kind'='bible' and status='draft' order by stable_id limit 1) b
$$;
grant execute on function pg_temp.check_ok(boolean,text), pg_temp.expect_error(text,text,text), pg_temp.manifest(text[])
  to anon,authenticated,service_role;

-- ---------- catalog: function shape, owner, privileges ----------
select pg_temp.check_ok((select array_agg(p.oid::regprocedure::text order by p.oid::regprocedure::text)
    from pg_proc p join pg_namespace n on n.oid=p.pronamespace
    where n.nspname='public' and p.prosecdef and p.proname like '%play_content%')
  = array['rollback_play_content_import(uuid)'],'rollback is the only SECURITY DEFINER play-content function');
select pg_temp.check_ok((select not p.prosecdef from pg_proc p where p.oid='public.import_play_content_drafts(jsonb,text,text)'::regprocedure),'import RPC is SECURITY INVOKER');
select pg_temp.check_ok((select not p.prosecdef from pg_proc p where p.oid='public.review_play_content(uuid,text,text)'::regprocedure),'review RPC is SECURITY INVOKER');
select pg_temp.check_ok((select p.proconfig @> array['search_path=""']
    from pg_proc p where p.oid='public.rollback_play_content_import(uuid)'::regprocedure),'rollback has an empty search_path');
select pg_temp.check_ok((select pg_get_userbyid(p.proowner) not in ('anon','authenticated','service_role','public')
    and p.proowner=(select c.relowner from pg_class c where c.oid='public.play_content_items'::regclass)
    from pg_proc p where p.oid='public.rollback_play_content_import(uuid)'::regprocedure),'function owner is the table owner, not an API role');
select pg_temp.check_ok(not has_function_privilege('anon','public.rollback_play_content_import(uuid)','execute'),'anon cannot execute rollback');
select pg_temp.check_ok(not has_function_privilege('authenticated','public.rollback_play_content_import(uuid)','execute'),'authenticated cannot execute rollback');
select pg_temp.check_ok(has_function_privilege('service_role','public.rollback_play_content_import(uuid)','execute'),'service_role can execute rollback');
select pg_temp.check_ok(not exists(select 1 from pg_proc p, aclexplode(p.proacl) a
    where p.oid='public.rollback_play_content_import(uuid)'::regprocedure and a.grantee=0),'rollback has no PUBLIC grant');
select pg_temp.check_ok(not exists(select 1 from pg_proc p, aclexplode(p.proacl) a join pg_roles r on r.oid=a.grantee
    where p.oid='public.rollback_play_content_import(uuid)'::regprocedure and r.rolname not in ('service_role') and r.rolname<>pg_get_userbyid(p.proowner)),
  'only the owner and service_role hold EXECUTE');
select pg_temp.check_ok(not has_table_privilege('service_role','public.play_content_items','delete')
  and not has_table_privilege('service_role','public.play_content_items','update'),'service_role has no direct table delete/update');
select pg_temp.check_ok((select count(*)=834 from public.play_content_items where stable_id not like 'rbs-%'),'baseline: 834 imported rows present');

-- ---------- ordinary users cannot invoke rollback (anon, user, editor, admin) ----------
select inserted_id is not null as has_batch, batch_id as base_batch from public.play_content_import_items order by created_at limit 1 \gset
set local role anon;
select pg_temp.expect_error($$select public.rollback_play_content_import('00000000-0000-4000-8000-0000000000aa')$$,'42501','anon denied');
reset role;
set local role authenticated;
select set_config('request.jwt.claim.sub','00000000-0000-4000-8000-000000000001',true);
select pg_temp.expect_error(format('select public.rollback_play_content_import(%L)',:'base_batch'),'42501','ordinary user denied');
reset role;
set local role authenticated;
select set_config('request.jwt.claim.sub','00000000-0000-4000-8000-000000000002',true);
select pg_temp.expect_error(format('select public.rollback_play_content_import(%L)',:'base_batch'),'42501','editor denied');
reset role;
set local role authenticated;
select set_config('request.jwt.claim.sub','00000000-0000-4000-8000-000000000003',true);
select pg_temp.expect_error(format('select public.rollback_play_content_import(%L)',:'base_batch'),'42501','admin denied');
reset role;
select pg_temp.check_ok((select count(*)=834 from public.play_content_items where stable_id not like 'rbs-%'),'denied callers deleted nothing');

-- service_role has no direct destructive access either; only the bounded function can remove rows.
set local role service_role;
select pg_temp.expect_error($$delete from public.play_content_items where stable_id like 'rbs-%'$$,'42501','service_role direct delete denied');
select pg_temp.expect_error($$update public.play_content_items set status='published' where stable_id not like 'rbs-%'$$,'42501','service_role direct update denied');
reset role;

-- ---------- batch A: five synthetic drafts ----------
set local role service_role;
select (public.import_play_content_drafts(pg_temp.manifest(array['rbs-unchanged','rbs-edited','rbs-reviewed','rbs-published','rbs-returned']),'feedbee',repeat('a',64))->>'id') as batch_a \gset
reset role;
select pg_temp.check_ok((select inserted_count=5 and status='completed' from public.play_content_import_batches where id=:'batch_a'::uuid),'batch A inserted five drafts');

-- edit one (editor), submit one (editor), publish one (editor -> admin), and send one back to draft (admin)
set local role authenticated;
select set_config('request.jwt.claim.sub','00000000-0000-4000-8000-000000000002',true);
update public.play_content_items set payload=jsonb_set(payload,'{rollbackProbe}','"edited"') where stable_id='rbs-edited';
select public.review_play_content(id,'review','submit') from public.play_content_items where stable_id in ('rbs-reviewed','rbs-published','rbs-returned');
reset role;
set local role authenticated;
select set_config('request.jwt.claim.sub','00000000-0000-4000-8000-000000000003',true);
select public.review_play_content(id,'approved','ok') from public.play_content_items where stable_id='rbs-published';
select public.review_play_content(id,'published','ok') from public.play_content_items where stable_id='rbs-published';
select public.review_play_content(id,'draft','back') from public.play_content_items where stable_id='rbs-returned';
reset role;
select pg_temp.check_ok((select status='published' from public.play_content_items where stable_id='rbs-published'),'fixture: one row is published');

-- ---------- cross-import: batch B repeats one A row (duplicate) and adds one new row ----------
set local role service_role;
select (public.import_play_content_drafts(pg_temp.manifest(array['rbs-unchanged','rbs-b-only']),'feedbee',repeat('b',64))->>'id') as batch_b \gset
reset role;
select pg_temp.check_ok((select inserted_count=1 and duplicate_count=1 from public.play_content_import_batches where id=:'batch_b'::uuid),'batch B: one insert, one duplicate');

-- Unknown / null batch fails closed and deletes nothing.
set local role service_role;
select pg_temp.expect_error($$select public.rollback_play_content_import('11111111-1111-4111-8111-111111111111')$$,'P0002','unknown batch fails closed');
select pg_temp.expect_error($$select public.rollback_play_content_import(null)$$,'P0002','null batch fails closed');
-- Rolling back B may remove only B's own insert. A's row that B merely duplicated must survive.
select public.rollback_play_content_import(:'batch_b'::uuid) as rb_b \gset
reset role;
select pg_temp.check_ok((:'rb_b'::jsonb->>'removed')::int=1 and (:'rb_b'::jsonb->>'blocked')::int=0,'rollback of B removed exactly its own row');
select pg_temp.check_ok(exists(select 1 from public.play_content_items where stable_id='rbs-unchanged'),'cross-import: A row duplicated by B is NOT deleted by B rollback');
select pg_temp.check_ok(not exists(select 1 from public.play_content_items where stable_id='rbs-b-only'),'B own insert was removed');
select pg_temp.check_ok((select status='rolled_back' from public.play_content_import_batches where id=:'batch_b'::uuid),'B audited as rolled_back');

-- ---------- failing mid-rollback leaves everything untouched ----------
set local role service_role;
select (public.import_play_content_drafts(pg_temp.manifest(array['rbs-d1','rbs-d2','rbs-d3']),'feedbee',repeat('d',64))->>'id') as batch_d \gset
reset role;
create function public.zz_rollback_boom() returns trigger language plpgsql as $$ begin raise exception 'injected audit failure' using errcode='P9002'; end $$;
create trigger zz_rollback_boom before update on public.play_content_import_items
  for each row when (new.result='rolled_back' and new.ordinal=3) execute function public.zz_rollback_boom();
set local role service_role;
select pg_temp.expect_error(format('select public.rollback_play_content_import(%L)',:'batch_d'),'P9002','audit failure aborts rollback');
reset role;
select pg_temp.check_ok((select count(*)=3 from public.play_content_items where stable_id in ('rbs-d1','rbs-d2','rbs-d3')),'failed rollback deleted no content row');
select pg_temp.check_ok((select count(*)=3 from public.play_content_import_items where batch_id=:'batch_d'::uuid and result='inserted'),'failed rollback changed no audit row');
drop trigger zz_rollback_boom on public.play_content_import_items;
drop function public.zz_rollback_boom();

-- ---------- batch A rollback: only the untouched draft can go ----------
set local role service_role;
select public.rollback_play_content_import(:'batch_a'::uuid) as rb_a \gset
reset role;
select pg_temp.check_ok((:'rb_a'::jsonb->>'removed')::int=1 and (:'rb_a'::jsonb->>'blocked')::int=4,'A: one removed, four blocked');
select pg_temp.check_ok(not exists(select 1 from public.play_content_items where stable_id='rbs-unchanged'),'unchanged draft removed');
select pg_temp.check_ok((select count(*)=1 from public.play_content_items where stable_id='rbs-edited' and status='draft'),'edited draft preserved');
select pg_temp.check_ok((select count(*)=1 from public.play_content_items where stable_id='rbs-reviewed' and status='review'),'draft submitted for review preserved');
select pg_temp.check_ok((select count(*)=1 from public.play_content_items where stable_id='rbs-published' and status='published' and published_at is not null),'published row preserved');
select pg_temp.check_ok((select count(*)=1 from public.play_content_items where stable_id='rbs-returned' and status='draft'),'row returned to draft after review preserved');
select pg_temp.check_ok((select count(*)=834 from public.play_content_items where stable_id not like 'rbs-%'),'unrelated imported rows untouched');
select pg_temp.check_ok((select status='partial_rollback' from public.play_content_import_batches where id=:'batch_a'::uuid),'A audited as partial_rollback');
select pg_temp.check_ok((select count(*)=4 from public.play_content_import_items where batch_id=:'batch_a'::uuid and result='rollback_blocked'),'four blocked audit rows');

-- Repeating the rollback must not delete anything more nor downgrade a partial rollback to "rolled_back".
set local role service_role;
select public.rollback_play_content_import(:'batch_a'::uuid) as rb_a2 \gset
reset role;
select pg_temp.check_ok((:'rb_a2'::jsonb->>'removed')::int=0 and (:'rb_a2'::jsonb->>'blocked')::int=0,'repeat rollback is a no-op');
select pg_temp.check_ok((select status='partial_rollback' from public.play_content_import_batches where id=:'batch_a'::uuid),'repeat rollback keeps partial_rollback');
select pg_temp.check_ok((select count(*)=834+4+3 from public.play_content_items),'row count: 834 baseline + 4 preserved A rows + 3 untouched D rows');

rollback;
\echo PASS: rollback_play_content_import is owner-bounded, role-restricted, atomic, and deletes only unchanged drafts of its own batch.
