-- Read-only verification after manually applying the 230000 base migration
-- and the 250000 idempotent job-creation migration.
with expected(name) as (values
  ('mezmur_enrichment_jobs'), ('mezmur_enrichment_suggestions'), ('mezmur_enrichment_events')
)
select e.name, case when c.oid is null then 'MISSING' else 'PASS' end as result
from expected e left join pg_class c on c.relnamespace='public'::regnamespace and c.relname=e.name and c.relkind='r'
order by e.name;

with expected(signature) as (values
  ('public.create_mezmur_enrichment_job(text,uuid[])'),
  ('public.apply_mezmur_enrichment_suggestion(uuid)'),
  ('public.bulk_publish_mezmur_imports(uuid[])'),
  ('public.bulk_add_mezmur_category(uuid[],text)')
)
select signature,
  case
    when to_regprocedure(signature) is null then 'MISSING'
    when has_function_privilege('anon',to_regprocedure(signature),'EXECUTE') then 'FAIL: anon execute'
    when not has_function_privilege('authenticated',to_regprocedure(signature),'EXECUTE') then 'FAIL: authenticated cannot execute'
    else 'PASS'
  end as result
from expected order by signature;

select relname, relrowsecurity as rls_enabled
from pg_class where relnamespace='public'::regnamespace
  and relname in ('mezmur_enrichment_jobs','mezmur_enrichment_suggestions','mezmur_enrichment_events')
order by relname;

-- Informational only: a published record may legitimately retain its earlier
-- suggestion history. This does not imply that analysis published it.
select count(*) as published_mezmurs_with_suggestion_history
from public.mezmur_enrichment_suggestions s
join public.mezmur_data_import m on m.import_id=s.mezmur_import_id
where s.status in ('suggested','approved') and lower(trim(coalesce(m.status,'')))='published';

select count(*) as draft_count, count(*) filter (where deleted_at is null) as active_draft_count
from public.mezmur_data_import where lower(trim(coalesce(status,'')))='draft';
