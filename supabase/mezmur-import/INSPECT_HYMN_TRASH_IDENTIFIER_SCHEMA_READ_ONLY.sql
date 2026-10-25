-- Production-safe identifier and dependency audit. This script changes nothing.
begin read only;

-- Exact columns, types, nullability, and defaults for all four content tables.
select table_name, ordinal_position, column_name, data_type, udt_name,
       is_nullable, column_default
from information_schema.columns
where table_schema = 'public'
  and table_name in (
    'mezmur_data_import','mezmur_collections_import',
    'mezmur_sections_import','zemaris'
  )
order by table_name, ordinal_position;

-- Primary keys, unique constraints, and their ordered columns.
select c.relname as table_name, con.conname, con.contype,
       pg_get_constraintdef(con.oid, true) as definition
from pg_constraint con
join pg_class c on c.oid = con.conrelid
join pg_namespace n on n.oid = c.relnamespace
where n.nspname = 'public'
  and c.relname in (
    'mezmur_data_import','mezmur_collections_import',
    'mezmur_sections_import','zemaris'
  )
  and con.contype in ('p','u','f')
order by c.relname, con.contype, con.conname;

select tablename, indexname, indexdef
from pg_indexes
where schemaname = 'public'
  and tablename in (
    'mezmur_data_import','mezmur_collections_import',
    'mezmur_sections_import','zemaris'
  )
order by tablename, indexname;

-- Legacy identifiers are diagnostic only. Any returned row is ambiguous and
-- must never be used as the target of a destructive RPC.
select 'mezmur_id' as identifier, mezmur_id as value, count(*) as occurrences
from public.mezmur_data_import
where nullif(trim(mezmur_id), '') is not null
group by mezmur_id having count(*) > 1
union all
select 'mezmur_slug', slug, count(*) from public.mezmur_data_import
where nullif(trim(slug), '') is not null
group by slug having count(*) > 1
union all
select 'collection_id', collection_id, count(*) from public.mezmur_collections_import
where nullif(trim(collection_id), '') is not null
group by collection_id having count(*) > 1
union all
select 'collection_slug', collection_slug, count(*) from public.mezmur_collections_import
where nullif(trim(collection_slug), '') is not null
group by collection_slug having count(*) > 1
union all
select 'section_id', section_id, count(*) from public.mezmur_sections_import
where nullif(trim(section_id), '') is not null
group by section_id having count(*) > 1
union all
select 'section_slug', section_slug, count(*) from public.mezmur_sections_import
where nullif(trim(section_slug), '') is not null
group by section_slug having count(*) > 1
order by identifier, value;

select 'mezmur_data_import' as table_name, count(*) as rows,
       count(*) filter (where nullif(trim(mezmur_id), '') is null) as blank_legacy_ids,
       count(*) filter (where nullif(trim(slug), '') is null) as blank_slugs
from public.mezmur_data_import
union all
select 'mezmur_collections_import', count(*),
       count(*) filter (where nullif(trim(collection_id), '') is null),
       count(*) filter (where nullif(trim(collection_slug), '') is null)
from public.mezmur_collections_import
union all
select 'mezmur_sections_import', count(*),
       count(*) filter (where nullif(trim(section_id), '') is null),
       count(*) filter (where nullif(trim(section_slug), '') is null)
from public.mezmur_sections_import;

-- Find views and functions that currently depend on or mention import_id or
-- Trash metadata. Function bodies are shown for human review only.
select schemaname, viewname, definition
from pg_views
where schemaname = 'public'
  and definition ~* '(import_id|deleted_at|deleted_by|deleted_from_status)'
order by viewname;

select n.nspname as schema_name, p.proname,
       pg_get_function_identity_arguments(p.oid) as arguments,
       pg_get_functiondef(p.oid) as definition
from pg_proc p
join pg_namespace n on n.oid = p.pronamespace
where n.nspname = 'public'
  and p.prokind in ('f', 'p')
  and pg_get_functiondef(p.oid) ~* '(import_id|deleted_at|deleted_by|deleted_from_status)'
order by p.proname, arguments;

rollback;
