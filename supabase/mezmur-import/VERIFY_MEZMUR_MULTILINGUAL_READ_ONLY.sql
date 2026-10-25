-- Read-only verification after manually applying 20261024280000.
select
  to_regprocedure('public.bulk_assign_mezmur_language(uuid[],text,boolean)') is not null as rpc_installed,
  has_function_privilege('authenticated', 'public.bulk_assign_mezmur_language(uuid[],text,boolean)', 'EXECUTE') as authenticated_can_execute,
  not has_function_privilege('anon', 'public.bulk_assign_mezmur_language(uuid[],text,boolean)', 'EXECUTE') as anon_cannot_execute;

select
  case
    when lower(trim(coalesce(primary_language, ''))) in ('am','amh','amharic') then 'am'
    when lower(trim(coalesce(primary_language, ''))) in ('ti','tir','tigrinya') then 'ti'
    when lower(trim(coalesce(primary_language, ''))) in ('om','orm','oromo','afaan oromoo') then 'om'
    when lower(trim(coalesce(primary_language, ''))) in ('gez','geez','ge''ez','gəʿəz') then 'gez'
    when lower(trim(coalesce(primary_language, ''))) in ('en','eng','english') then 'en'
    else 'unknown'
  end as normalized_language,
  status,
  count(*) as record_count
from public.mezmur_data_import
where deleted_at is null
group by 1, 2
order by 1, 2;

select primary_language, count(*) as record_count
from public.mezmur_data_import
where deleted_at is null
  and nullif(trim(coalesce(primary_language, '')), '') is not null
group by primary_language
order by record_count desc, primary_language;
