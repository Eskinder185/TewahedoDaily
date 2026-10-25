-- READ ONLY: run before 20261025020000_mezmur_bulk_classification.sql.
-- Every statement is SELECT-only. Save the results with the installation record.

-- 1. Required stable identifier and relationship-table column contracts.
select table_name, column_name, data_type, is_nullable, column_default
from information_schema.columns
where table_schema = 'public'
  and table_name in ('mezmur_data_import','mezmur_category_links_import','mezmur_occasion_links_import')
  and column_name in ('import_id','mezmur_import_id','mezmur_slug','category_slug','occasion_slug','source_category','source_occasion')
order by table_name, ordinal_position;

select i.relname as index_name, t.relname as table_name, x.indisunique,
       pg_get_indexdef(x.indexrelid) as definition
from pg_index x
join pg_class i on i.oid=x.indexrelid
join pg_class t on t.oid=x.indrelid
join pg_namespace n on n.oid=t.relnamespace
where n.nspname='public'
  and t.relname in ('mezmur_data_import','mezmur_category_links_import','mezmur_occasion_links_import')
order by t.relname,i.relname;

-- 2. UUID health. Both counts must be zero.
select count(*) filter(where import_id is null) as null_import_ids,
       count(*)-count(distinct import_id) as duplicate_import_ids
from public.mezmur_data_import;

-- 3. Duplicate active slugs. These records are safe only through import_id.
select lower(trim(slug)) as normalized_slug, count(*) as record_count,
       array_agg(import_id order by import_id) as import_ids,
       array_agg(status order by import_id) as statuses
from public.mezmur_data_import
where deleted_at is null and nullif(trim(slug),'') is not null
group by lower(trim(slug)) having count(*) > 1
order by record_count desc, normalized_slug;

-- 4. Legacy slug links whose owner is ambiguous or missing. The migration
-- deliberately leaves these unowned and does not expose them publicly.
with active_slug_counts as (
  select lower(trim(slug)) normalized_slug,count(*) record_count
  from public.mezmur_data_import
  where deleted_at is null and nullif(trim(slug),'') is not null
  group by lower(trim(slug))
), legacy_links as (
  select 'category'::text relationship_kind,lower(trim(mezmur_slug)) normalized_slug,count(*) link_count
  from public.mezmur_category_links_import group by lower(trim(mezmur_slug))
  union all
  select 'occasion',lower(trim(mezmur_slug)),count(*)
  from public.mezmur_occasion_links_import group by lower(trim(mezmur_slug))
)
select l.relationship_kind,l.normalized_slug,l.link_count,coalesce(s.record_count,0) matching_mezmurs
from legacy_links l left join active_slug_counts s using(normalized_slug)
where coalesce(s.record_count,0) <> 1
order by l.relationship_kind,l.normalized_slug;

-- 5. Existing taxonomy. Review spelling and hierarchy before installation.
select id,slug,name,type from public.categories order by slug;
select to_regclass('public.mezmur_occasions') as mezmur_occasions_table;

-- 6. Existing grants and RLS policies. Differently named public policies must
-- be reviewed; the migration also revokes anonymous base-table privileges.
select table_name,grantee,privilege_type
from information_schema.role_table_grants
where table_schema='public'
 and table_name in ('mezmur_category_links_import','mezmur_occasion_links_import')
order by table_name,grantee,privilege_type;

select schemaname,tablename,policyname,roles,cmd,qual,with_check
from pg_policies
where schemaname='public'
 and tablename in ('mezmur_category_links_import','mezmur_occasion_links_import')
order by tablename,policyname;

-- 7. RPC should be absent before installation (or show the exact prior body).
select p.oid::regprocedure as signature,p.prosecdef,pg_get_userbyid(p.proowner) owner,
       pg_get_functiondef(p.oid) definition
from pg_proc p join pg_namespace n on n.oid=p.pronamespace
where n.nspname='public' and p.proname='bulk_assign_mezmur_classifications';
