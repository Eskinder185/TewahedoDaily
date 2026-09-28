-- Disposable Supabase/local database only. Fixtures roll back; sequence gaps are expected.
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
 ('11111111-1111-1111-1111-111111111111','community-writer@example.invalid'),
 ('33333333-3333-3333-3333-333333333333','community-editor@example.invalid'),
 ('44444444-4444-4444-4444-444444444444','community-admin@example.invalid');
insert into public.profiles(id,role) values
 ('11111111-1111-1111-1111-111111111111','contributor'),
 ('33333333-3333-3333-3333-333333333333','editor'),
 ('44444444-4444-4444-4444-444444444444','admin');
set local role service_role;
select public.receive_community_submission('{"submission_type":"mezmur","title":"Community Test Song","lyrics_english":"A sufficiently long test lyric","contributor_name":"Test Writer","contributor_email":"private@example.invalid","credit_requested":true,"status":"approved","admin_notes":"forged"}',repeat('a',64))->>'reference' as reference \gset
select pg_temp.assert_true(:'reference' ~ '^TD-[0-9]{4}-[0-9]{5,}$','readable receipt');
select pg_temp.assert_true((public.receive_community_submission('{"submission_type":"mezmur","title":"Community Test Song","lyrics_english":"A sufficiently long test lyric","contributor_name":"Test Writer","contributor_email":"private@example.invalid","credit_requested":true,"status":"approved","admin_notes":"forged"}',repeat('a',64))->>'reference')=:'reference','retry is idempotent');
select id as submission_id from public.community_submissions where public_reference=:'reference' \gset
select pg_temp.assert_true((select status='submitted' and admin_notes='' and reviewed_by is null from public.community_submissions where id=:'submission_id'),'incoming privilege fields ignored');
do $$ begin
 for i in 1..5 loop
  perform public.receive_community_submission(jsonb_build_object('submission_type','mezmur','title','Rate test '||i,'lyrics_english','Enough lyrics to submit','contributor_name','Test'),repeat('b',64));
 end loop;
 perform pg_temp.assert_true(public.receive_community_submission('{"submission_type":"mezmur","title":"Sixth song","lyrics_english":"Enough lyrics to submit","contributor_name":"Test"}',repeat('b',64))->>'error'='rate_limited','five per hour');
end $$;
reset role;
set local role anon;
select pg_temp.denied('select contributor_email from public.community_submissions');
select pg_temp.denied('insert into public.community_submissions(submission_type,title,contributor_name) values (''other'',''Bypass'',''Visitor'')');
select pg_temp.denied('select public.receive_community_submission(''{}'',repeat(''c'',64))');
select pg_temp.denied('select public.convert_submission('''||:'submission_id'||''',now(),false)');
select pg_temp.denied('select public.submission_duplicates('''||:'submission_id'||''')');
reset role;
set local role authenticated;
set local request.jwt.claim.sub='11111111-1111-1111-1111-111111111111';
select pg_temp.assert_true((select count(*)=0 from public.community_submissions),'contributor cannot read queue or emails');
select pg_temp.denied('select public.convert_submission('''||:'submission_id'||''',now(),false)');
select pg_temp.denied('select public.review_submission('''||:'submission_id'||''',''approved'','''',now())');
select pg_temp.denied('update public.community_submissions set status=''approved''');
set local request.jwt.claim.sub='33333333-3333-3333-3333-333333333333';
select pg_temp.assert_true((select contributor_email='private@example.invalid' from public.community_submissions where id=:'submission_id'),'editor sees private contact');
do $$ declare item public.community_submissions; begin
 select * into item from public.community_submissions limit 1;
 begin
  perform public.review_submission(item.id,'under_review','Stale review',item.updated_at-interval '1 second');
  raise exception 'Stale review was accepted';
 exception when serialization_failure then null; end;
end $$;
select public.review_submission(id,'under_review','Checking source',updated_at) from public.community_submissions where id=:'submission_id';
select public.review_submission(id,'approved','Source verified',updated_at) from public.community_submissions where id=:'submission_id';
select public.convert_submission(id,updated_at,true) as content_id from public.community_submissions where id=:'submission_id' \gset
select pg_temp.assert_true((select status='draft' and contributor_credit='Test Writer' and created_by=auth.uid() and source_submission_id=:'submission_id' from public.mezmur where id=:'content_id'),'conversion creates attributed draft only');
select pg_temp.assert_true((select status='converted_to_content' and related_content_id=:'content_id' from public.community_submissions where id=:'submission_id'),'atomic relationship');
select pg_temp.assert_true(public.convert_submission(:'submission_id',now(),false)=:'content_id','conversion cannot create twice');
select pg_temp.assert_true((select count(*)>0 from public.submission_duplicates(:'submission_id') where content_id=:'content_id'),'similar title warning');
set local request.jwt.claim.sub='44444444-4444-4444-4444-444444444444';
select pg_temp.denied('update public.mezmur set status=''published'' where id='''||:'content_id'||'''');
update public.mezmur set source_submission_id=null where id=:'content_id';
select pg_temp.assert_true((select source_submission_id=:'submission_id' from public.mezmur where id=:'content_id'),'origin cannot be erased');
update public.mezmur set status='pending_review' where id=:'content_id';
update public.mezmur set status='published' where id=:'content_id';
reset role;
set local role anon;
select pg_temp.assert_true((select count(*)=1 from public.mezmur where id=:'content_id'),'only reviewed publication visible');
select pg_temp.denied('select contributor_email from public.community_submissions');
reset role;
set local role service_role;
select public.receive_community_submission(jsonb_build_object('submission_type','correction','title','Community Test Song','contributor_name','Visitor','correction_type','spelling_issue','suggested_correction','Correct the spelling here','related_content_id',:'content_id','related_content_title','Community Test Song','current_page_url','https://example.invalid/practice/mezmur/song'),repeat('d',64));
select public.receive_community_submission('{"submission_type":"mezmur","title":"Unrelated video title","youtube_url":"https://www.youtube.com/watch?v=abcdefghijk","title_amharic":"ቅዱስ ገብርኤል","singer_name":"Test Choir","contributor_name":"No Credit","credit_requested":false}',repeat('e',64))->>'reference' as video_reference \gset
select id as video_submission from public.community_submissions where public_reference=:'video_reference' \gset
reset role;
set local role authenticated;
set local request.jwt.claim.sub='33333333-3333-3333-3333-333333333333';
insert into public.mezmur(slug,title,youtube_url) values ('matching-video','Entirely different hymn','https://youtu.be/abcdefghijk');
insert into public.mezmur(slug,title,title_amharic) values ('matching-amharic','Different English title','ቅዱስ ገብርኤል');
select pg_temp.assert_true(exists(select 1 from public.submission_duplicates(:'video_submission') where reason='Same YouTube video'),'canonical video match');
select pg_temp.assert_true(exists(select 1 from public.submission_duplicates(:'video_submission') where reason='Similar Amharic title'),'Amharic match');
select public.review_submission(id,'under_review','Checking',updated_at) from public.community_submissions where id=:'video_submission';
select public.review_submission(id,'needs_changes','Please clarify source',updated_at) from public.community_submissions where id=:'video_submission';
select public.review_submission(id,'under_review','Clarified source',updated_at) from public.community_submissions where id=:'video_submission';
select public.review_submission(id,'approved','Verified source',updated_at) from public.community_submissions where id=:'video_submission';
select public.convert_submission(id,updated_at,true) as no_credit_content from public.community_submissions where id=:'video_submission' \gset
select pg_temp.assert_true((select contributor_credit is null from public.mezmur where id=:'no_credit_content'),'credit cannot be copied without consent');
reset role;
rollback;
\echo Community permissions and workflow passed.
