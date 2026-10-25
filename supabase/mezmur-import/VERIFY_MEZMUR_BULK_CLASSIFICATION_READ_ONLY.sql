-- READ ONLY: run after 20261025020000_mezmur_bulk_classification.sql.

-- 1. Stable relationship columns and foreign keys.
select table_name,column_name,data_type,is_nullable,column_default
from information_schema.columns
where table_schema='public'
 and table_name in ('mezmur_category_links_import','mezmur_occasion_links_import')
 and column_name in ('mezmur_import_id','mezmur_slug','category_slug','occasion_slug','source_category','source_occasion')
order by table_name,ordinal_position;

select conrelid::regclass relationship_table,conname,contype,convalidated,
       pg_get_constraintdef(oid) definition
from pg_constraint
where conname in ('mezmur_category_links_import_mezmur_fk','mezmur_occasion_links_import_mezmur_fk');

-- 2. RPC signature and authorization surface.
select p.oid::regprocedure signature,p.prosecdef,pg_get_userbyid(p.proowner) owner,p.proacl
from pg_proc p join pg_namespace n on n.oid=p.pronamespace
where n.nspname='public' and p.proname='bulk_assign_mezmur_classifications';

-- 3. Direct tables must not grant anonymous reads. Public filtered views must.
select table_name,grantee,privilege_type
from information_schema.role_table_grants
where table_schema='public'
 and table_name in ('mezmur_category_links_import','mezmur_occasion_links_import',
                    'mezmur_category_links_public','mezmur_occasion_links_public')
order by table_name,grantee,privilege_type;

select schemaname,tablename,policyname,roles,cmd,qual,with_check
from pg_policies
where schemaname='public'
 and tablename in ('mezmur_category_links_import','mezmur_occasion_links_import')
order by tablename,policyname;

-- 4. Backfill results. NULL UUID links are unresolved legacy links, never public.
select 'category' relationship_kind,count(*) total,
       count(*) filter(where mezmur_import_id is not null) uuid_owned,
       count(*) filter(where mezmur_import_id is null) unresolved_legacy
from public.mezmur_category_links_import
union all
select 'occasion',count(*),count(*) filter(where mezmur_import_id is not null),
       count(*) filter(where mezmur_import_id is null)
from public.mezmur_occasion_links_import;

-- 5. Privacy invariants. All four results must be zero.
select
 (select count(*) from public.mezmur_category_links_public l
   join public.mezmur_data_import m on m.import_id=l.mezmur_import_id
   where lower(trim(coalesce(m.status,'')))<>'published') as draft_category_leaks,
 (select count(*) from public.mezmur_occasion_links_public l
   join public.mezmur_data_import m on m.import_id=l.mezmur_import_id
   where lower(trim(coalesce(m.status,'')))<>'published') as draft_occasion_leaks,
 (select count(*) from public.mezmur_category_links_public l
   join public.mezmur_data_import m on m.import_id=l.mezmur_import_id
   where m.deleted_at is not null) as deleted_category_leaks,
 (select count(*) from public.mezmur_occasion_links_public l
   join public.mezmur_data_import m on m.import_id=l.mezmur_import_id
   where m.deleted_at is not null) as deleted_occasion_leaks;

-- 6. UUID uniqueness. Both counts must be zero.
select
 (select count(*) from (select mezmur_import_id,category_slug
   from public.mezmur_category_links_import where mezmur_import_id is not null
   group by 1,2 having count(*)>1) d) category_duplicates,
 (select count(*) from (select mezmur_import_id,occasion_slug
   from public.mezmur_occasion_links_import where mezmur_import_id is not null
   group by 1,2 having count(*)>1) d) occasion_duplicates;

-- 7. Coverage by actual record UUID, not slug.
select m.status,count(*) total_mezmurs,
       count(*) filter(where exists(select 1 from public.mezmur_category_links_import l where l.mezmur_import_id=m.import_id)) with_categories,
       count(*) filter(where exists(select 1 from public.mezmur_occasion_links_import l where l.mezmur_import_id=m.import_id)) with_occasions
from public.mezmur_data_import m where m.deleted_at is null
group by m.status order by m.status;
