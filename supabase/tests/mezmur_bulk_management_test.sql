insert into auth.users(id) values
  ('10000000-0000-0000-0000-000000000001'),
  ('10000000-0000-0000-0000-000000000002'),
  ('10000000-0000-0000-0000-000000000003');
insert into public.profiles(id,role) values
  ('10000000-0000-0000-0000-000000000001','admin'),
  ('10000000-0000-0000-0000-000000000002','super_admin'),
  ('10000000-0000-0000-0000-000000000003','user');
insert into public.zemaris(id,slug,name,status) values
  ('20000000-0000-0000-0000-000000000001','zemari-one','Zemari One','published');
insert into public.mezmur_sections_import(import_id,section_id,section_slug,title,status)
values ('50000000-0000-0000-0000-000000000001','section-one','section-one','Section One','published');

insert into public.mezmur_data_import(
  import_id,mezmur_id,slug,title,lyrics_amharic,status,youtube_url,rights_status,updated_at
) values
  ('30000000-0000-0000-0000-000000000001','eligible','eligible','Eligible','ግጥም','draft','https://youtu.be/example','unknown','v1'),
  ('30000000-0000-0000-0000-000000000002','blocked','blocked','Blocked','ግጥም','draft',null,'unknown','v1');

insert into public.mezmur_enrichment_jobs(id,mode,status,created_by)
values ('60000000-0000-0000-0000-000000000001','all','completed','10000000-0000-0000-0000-000000000001');
insert into public.mezmur_enrichment_suggestions(
  id,job_id,mezmur_import_id,source_updated_at,prompt_version,zemari_id,category_slugs,
  occasion_slugs,section_import_ids,requires_review,publication_eligible,status
) values (
  '70000000-0000-0000-0000-000000000001','60000000-0000-0000-0000-000000000001',
  '30000000-0000-0000-0000-000000000001','v1','test-v1',
  '20000000-0000-0000-0000-000000000001',array['christ'],array['general'],
  array['50000000-0000-0000-0000-000000000001']::uuid[],false,true,'suggested'
);

set role authenticated;
select set_config('request.jwt.claim.role','authenticated',false);
select set_config('request.jwt.claim.sub','10000000-0000-0000-0000-000000000003',false);
do $$ begin
  begin perform public.apply_mezmur_enrichment_suggestion('70000000-0000-0000-0000-000000000001');
    raise exception 'regular user unexpectedly applied a suggestion';
  exception when insufficient_privilege then null; end;
  begin perform public.bulk_publish_mezmur_imports(array['30000000-0000-0000-0000-000000000001']::uuid[]);
    raise exception 'regular user unexpectedly bulk published';
  exception when insufficient_privilege then null; end;
  begin perform public.bulk_add_mezmur_category(array['30000000-0000-0000-0000-000000000001']::uuid[],'christ');
    raise exception 'regular user unexpectedly assigned a category';
  exception when insufficient_privilege then null; end;
end $$;

select set_config('request.jwt.claim.sub','10000000-0000-0000-0000-000000000001',false);
do $$ declare first_result jsonb; second_result jsonb; begin
  first_result := public.create_mezmur_enrichment_job('selected', array['30000000-0000-0000-0000-000000000001']::uuid[]);
  second_result := public.create_mezmur_enrichment_job('selected', array['30000000-0000-0000-0000-000000000001']::uuid[]);
  if (first_result->>'created')::boolean is not true
    or (second_result->>'created')::boolean is not false
    or first_result->'job'->>'id' <> second_result->'job'->>'id' then
    raise exception 'idempotent job creation failed: %, %', first_result, second_result;
  end if;
end $$;
do $$ declare result jsonb; begin
  result := public.bulk_add_mezmur_category(
    array['30000000-0000-0000-0000-000000000001']::uuid[], 'christ'
  );
  if (result->>'applied')::integer <> 1
     or not exists (
       select 1 from public.mezmur_category_links_import
       where mezmur_slug = 'eligible' and category_slug = 'christ'
     ) then
    raise exception 'stable-ID category assignment failed: %', result;
  end if;
end $$;
select public.apply_mezmur_enrichment_suggestion('70000000-0000-0000-0000-000000000001');
do $$ begin
  if not exists(select 1 from public.mezmur_data_import where import_id='30000000-0000-0000-0000-000000000001' and zemari_id='20000000-0000-0000-0000-000000000001')
    or not exists(select 1 from public.mezmur_category_links_import where mezmur_slug='eligible' and category_slug='christ')
    or not exists(select 1 from public.mezmur_occasion_links_import where mezmur_slug='eligible' and occasion_slug='general')
    or not exists(select 1 from public.mezmur_section_links_import where mezmur_slug='eligible' and section_slug='section-one') then
    raise exception 'reviewed enrichment was not applied';
  end if;
  if exists(select 1 from public.mezmur_data_import where import_id='30000000-0000-0000-0000-000000000001' and status <> 'draft') then
    raise exception 'analysis/apply operation published a draft';
  end if;
  begin perform public.bulk_publish_mezmur_imports(array['30000000-0000-0000-0000-000000000001']::uuid[]);
    raise exception 'admin unexpectedly bulk published';
  exception when insufficient_privilege then null; end;
end $$;

select set_config('request.jwt.claim.sub','10000000-0000-0000-0000-000000000002',false);
do $$ declare result jsonb; begin
  result := public.bulk_publish_mezmur_imports(array[
    '30000000-0000-0000-0000-000000000001','30000000-0000-0000-0000-000000000002',
    '90000000-0000-0000-0000-000000000099']::uuid[]);
  if (result->>'published')::int <> 1 or (result->>'failed')::int <> 2 then
    raise exception 'partial bulk outcome is not truthful: %', result;
  end if;
  if not exists(select 1 from public.mezmur_data_import where import_id='30000000-0000-0000-0000-000000000001' and status='published')
    or not exists(select 1 from public.mezmur_data_import where import_id='30000000-0000-0000-0000-000000000002' and status='draft') then
    raise exception 'bulk publication changed the wrong records';
  end if;
end $$;
reset role;

do $$ begin
  if has_function_privilege('anon','public.bulk_publish_mezmur_imports(uuid[])','execute') then
    raise exception 'anon can execute bulk publication';
  end if;
  if has_function_privilege('anon','public.create_mezmur_enrichment_job(text,uuid[])','execute') then
    raise exception 'anon can create an enrichment job';
  end if;
  if has_function_privilege('anon','public.bulk_add_mezmur_category(uuid[],text)','execute') then
    raise exception 'anon can assign a bulk category';
  end if;
  if not (select relrowsecurity from pg_class where oid='public.mezmur_enrichment_suggestions'::regclass) then
    raise exception 'suggestions RLS is disabled';
  end if;
end $$;

select 'PASS: Mezmur bulk management migration and security workflow' as result;
