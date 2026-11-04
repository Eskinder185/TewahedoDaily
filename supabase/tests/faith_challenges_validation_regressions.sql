-- Disposable PostgreSQL-only regression suite; real JWT/PostgREST remains untested.
\set ON_ERROR_STOP on
begin;
select set_config('local_test.expect_fixed', :'expect_fixed', true);
create function pg_temp.check_ok(ok boolean,label text) returns void language plpgsql as $$
begin if ok is distinct from true then raise exception 'FAIL: %',label; end if; end $$;

-- This query executes the ACTUAL SQL transition helper for all 180 cases.
do $$ declare actor text; old_state text; new_state text; expected boolean; cases integer:=0; begin
 foreach actor in array array['anon','user','editor','admin','super_admin'] loop
  foreach old_state in array array['draft','review','approved','rejected','published','archived'] loop
   foreach new_state in array array['draft','review','approved','rejected','published','archived'] loop
    expected:=(actor in ('editor','admin','super_admin') and old_state='draft' and new_state='review') or
     (actor in ('admin','super_admin') and (old_state||':'||new_state) in
      ('review:approved','review:rejected','review:draft','review:archived','approved:published',
       'approved:draft','approved:archived','rejected:draft','rejected:archived','published:draft',
       'published:archived','draft:archived','archived:draft'));
    perform pg_temp.check_ok(public.play_content_transition_allowed(old_state,new_state,actor) is not distinct from expected,'transition matrix');
    cases:=cases+1;
   end loop;
  end loop;
 end loop;
 raise notice 'PASS: % SQL transition-helper cases',cases;
end $$;

-- Missing mode, JSON null, blank and unknown strings; preserve all four valid modes.
do $$ declare value jsonb; payload jsonb; expected boolean; fixed boolean:=current_setting('local_test.expect_fixed')::boolean;
 cases integer:=0; begin
 foreach value in array array[null::jsonb,'null'::jsonb,'""'::jsonb,'"invalid"'::jsonb,
  '"finish-lyrics"'::jsonb,'"missing-word"'::jsonb,'"guess-mezmur"'::jsonb,'"guess-occasion"'::jsonb] loop
  payload:=public.local_test_payload('mode-test',value);
  if value is null then payload:=payload-'mode'; end if;
  expected:=coalesce(value#>>'{}','') in ('finish-lyrics','missing-word','guess-mezmur','guess-occasion')
    or (not fixed and (value is null or value='null'::jsonb));
  perform pg_temp.check_ok(public.play_content_payload_valid('finish-the-mezmur','mode-test','Bible','beginner',payload,
    '[{"route":"/bible","kind":"bible"}]') is not distinct from expected,'mode validator');
  cases:=cases+1;
 end loop;
 raise notice 'PASS: % SQL mode validator cases',cases;
end $$;

set local role authenticated;
-- Editor and admin may edit drafts but must never change the physical UUID.
do $$ declare actor text; blocked boolean; row_id uuid:='fcb00000-0000-0000-0000-000000000001';
 replacement uuid:='fcb00000-0000-0000-0000-999999999999';
 fixed boolean:=current_setting('local_test.expect_fixed')::boolean; begin
 foreach actor in array array['fca00000-0000-0000-0000-000000000002','fca00000-0000-0000-0000-000000000003'] loop
  perform set_config('request.jwt.claim.sub',actor,true);
  blocked:=false;
  begin update public.play_content_items set id=replacement where id=row_id;
  exception when check_violation then blocked:=true; end;
  perform pg_temp.check_ok(blocked=fixed,'existing UUID immutability');
  if not fixed then update public.play_content_items set id=row_id where id=replacement; end if;
  update public.play_content_items set payload=jsonb_set(payload,'{explanation,en}','"Edited synthetic explanation"') where id=row_id;
  perform pg_temp.check_ok(found,'legitimate draft editing preserved');
 end loop;
 raise notice 'PASS: 2 UUID attempts and 2 legitimate draft edits';
end $$;

-- Admin RPC and direct PATCH equivalents must reject malformed legacy approved rows.
select set_config('request.jwt.claim.sub','fca00000-0000-0000-0000-000000000003',true);
do $$ declare row_id uuid; blocked boolean; fixed boolean:=current_setting('local_test.expect_fixed')::boolean; begin
 foreach row_id in array array['fcb00000-0000-0000-0000-000000000007'::uuid,'fcb00000-0000-0000-0000-000000000008'::uuid] loop
  blocked:=false;
  -- Roll back EACH attempt even when the old vulnerable code accepts it.
  begin
   perform public.review_play_content(row_id,'published',null);
   raise exception using errcode='P9001',message='test subtransaction rollback';
  exception when check_violation then blocked:=true; when sqlstate 'P9001' then null; end;
  perform pg_temp.check_ok(blocked=fixed,'RPC publication with missing/null mode');
  blocked:=false;
  begin
   update public.play_content_items set status='published' where id=row_id;
   raise exception using errcode='P9001',message='test subtransaction rollback';
  exception when check_violation then blocked:=true; when sqlstate 'P9001' then null; end;
  perform pg_temp.check_ok(blocked=fixed,'direct publication with missing/null mode');
 end loop;
 raise notice 'PASS: 4 RPC/direct invalid-mode publication attempts';
end $$;
reset role;
select pg_temp.check_ok((select count(*)=8 from public.play_content_items),'all fixture rows preserved');
select pg_temp.check_ok((select count(*)=5 from pg_policies where tablename='play_content_items' and schemaname='public'),'five policies');
select pg_temp.check_ok((select count(*)=1 from pg_constraint where conrelid='public.play_content_items'::regclass
 and contype='c' and pg_get_constraintdef(oid) like '%draft%'),'one six-state constraint');
rollback;
\echo PASS: PostgreSQL simulation: 180 matrix cases, 16 targeted checks, 3 preservation checks. No real Supabase/JWT testing.
