\set ON_ERROR_STOP on

-- Unique legacy rows backfill; duplicate-slug legacy rows remain unresolved.
do $$ begin
 if (select count(*) from public.mezmur_category_links_import where mezmur_slug='unique-slug' and mezmur_import_id='20000000-0000-4000-8000-000000000003')<>1 then
  raise exception 'Unique category legacy link was not UUID-backfilled';
 end if;
 if (select count(*) from public.mezmur_category_links_import where mezmur_slug='duplicate-slug' and mezmur_import_id is null)<>1 then
  raise exception 'Ambiguous category legacy link was assigned unsafely';
 end if;
 if (select count(*) from public.mezmur_occasion_links_import where mezmur_slug='duplicate-slug' and mezmur_import_id is null)<>1 then
  raise exception 'Ambiguous occasion legacy link was assigned unsafely';
 end if;
end $$;

-- Two duplicate-slug records receive different relationships by UUID.
do $$ declare result jsonb; begin
 select public.bulk_assign_mezmur_classifications(jsonb_build_array(
  jsonb_build_object('import_id','20000000-0000-4000-8000-000000000001','slug','duplicate-slug','category_slugs',jsonb_build_array('jesus-christ'),'occasion_slugs',jsonb_build_array('tinsae')),
  jsonb_build_object('import_id','20000000-0000-4000-8000-000000000002','slug','duplicate-slug','category_slugs',jsonb_build_array('virgin-mary'),'occasion_slugs',jsonb_build_array('kidane-mihret'))
 ),false) into result;
 if (result->>'applied')::integer<>2 or (result->>'failed')::integer<>0 then
  raise exception 'Expected two applied UUID classifications, got %',result;
 end if;
 if exists(select 1 from public.mezmur_category_links_import where mezmur_import_id='20000000-0000-4000-8000-000000000001' and category_slug='virgin-mary')
    or exists(select 1 from public.mezmur_category_links_import where mezmur_import_id='20000000-0000-4000-8000-000000000002' and category_slug='jesus-christ') then
  raise exception 'Duplicate-slug relationships crossed UUID owners';
 end if;
end $$;

-- Invalid taxonomy is a per-record failure and leaves no partial occasion row.
do $$ declare result jsonb; begin
 select public.bulk_assign_mezmur_classifications(jsonb_build_array(
  jsonb_build_object('import_id','20000000-0000-4000-8000-000000000003','slug','unique-slug','category_slugs',jsonb_build_array('not-a-category'),'occasion_slugs',jsonb_build_array('praise'))
 ),false) into result;
 if (result->>'applied')::integer<>0 or (result->>'failed')::integer<>1
    or result#>>'{results,0,sqlstate}'<>'23503' then
  raise exception 'Invalid taxonomy did not return a 23503 record failure: %',result;
 end if;
 if exists(select 1 from public.mezmur_occasion_links_import where mezmur_import_id='20000000-0000-4000-8000-000000000003' and occasion_slug='praise') then
  raise exception 'Failed record retained a partial occasion relationship';
 end if;
end $$;

-- Repeating the same request is idempotent and accurately reports existing.
do $$ declare result jsonb; begin
 select public.bulk_assign_mezmur_classifications(jsonb_build_array(
  jsonb_build_object('import_id','20000000-0000-4000-8000-000000000001','slug','duplicate-slug','category_slugs',jsonb_build_array('jesus-christ'),'occasion_slugs',jsonb_build_array('tinsae'))
 ),false) into result;
 if (result->>'categories_inserted')::integer<>0
    or (result->>'categories_already_present')::integer<>1
    or (result->>'occasions_inserted')::integer<>0
    or (result->>'occasions_already_present')::integer<>1 then
  raise exception 'Idempotent counts are incorrect: %',result;
 end if;
end $$;

-- Public views expose the published UUID and not the draft UUID.
do $$ begin
 if not exists(select 1 from public.mezmur_category_links_public where mezmur_import_id='20000000-0000-4000-8000-000000000001') then
  raise exception 'Published relationship is missing from public view';
 end if;
 if exists(select 1 from public.mezmur_category_links_public where mezmur_import_id='20000000-0000-4000-8000-000000000002') then
  raise exception 'Draft relationship leaked through public view';
 end if;
 if has_table_privilege('anon','public.mezmur_category_links_import','select')
    or has_table_privilege('anon','public.mezmur_occasion_links_import','select') then
  raise exception 'Anon retained direct relationship-table SELECT';
 end if;
 if not has_table_privilege('anon','public.mezmur_category_links_public','select')
    or not has_table_privilege('anon','public.mezmur_occasion_links_public','select') then
  raise exception 'Anon cannot read filtered public relationship views';
 end if;
end $$;

-- A signed-in regular profile is rejected by the bulk RPC.
set request.jwt.claim.sub='10000000-0000-4000-8000-000000000002';
do $$ begin
 begin
  perform public.bulk_assign_mezmur_classifications('[]'::jsonb,false);
  raise exception 'Unauthorized profile unexpectedly classified Mezmurs';
 exception when insufficient_privilege then null;
 end;
end $$;
reset request.jwt.claim.sub;

select 'PASS: UUID isolation, privacy, taxonomy validation, atomicity, idempotency, and authorization' result;
