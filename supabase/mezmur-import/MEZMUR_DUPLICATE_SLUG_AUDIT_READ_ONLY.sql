-- Read-only production audit. Do not run through a write migration.
select lower(trim(slug)) as normalized_slug, count(*)::bigint as active_rows,
       array_agg(import_id order by created_at nulls first) as import_ids
from public.mezmur_data_import
where deleted_at is null
group by lower(trim(slug))
having count(*) > 1
order by active_rows desc, normalized_slug;

-- Proposed mappings only; this query writes nothing. Review each collision and
-- approve an editorially correct slug before any future targeted rename.
with ranked as (
  select import_id, slug, lower(trim(slug)) as normalized_slug,
         row_number() over (partition by lower(trim(slug)) order by created_at nulls first, import_id) as collision_rank,
         count(*) over (partition by lower(trim(slug))) as collision_count
  from public.mezmur_data_import
  where deleted_at is null
)
select import_id, slug, normalized_slug, collision_rank, collision_count,
       case when collision_count > 1
            then normalized_slug || '-' || collision_rank::text
            else normalized_slug end as proposed_unique_slug
from ranked
where collision_count > 1
order by normalized_slug, collision_rank;

select import_id, slug, status, title, title_amharic,
       lyrics_amharic, lyrics_transliteration, youtube_url, source_url,
       rights_status, review_status, updated_at, deleted_at
from public.mezmur_data_import
where lower(trim(slug)) = 'bietekrstiyan-ba-re-xbebat-2'
order by created_at nulls first, import_id;

select count(*)::bigint as total_imported from public.mezmur_data_import;
select count(*)::bigint as imported_published
from public.mezmur_data_import where lower(trim(status)) = 'published' and deleted_at is null;
select count(*)::bigint as public_projection_rows from public.mezmur_public;
select count(*)::bigint as published_missing_from_public
from public.mezmur_data_import m
where lower(trim(m.status)) = 'published' and m.deleted_at is null
  and not exists (select 1 from public.mezmur_public p where p.mezmur_id = m.mezmur_id);
select count(*)::bigint as duplicate_mezmur_ids
from (select mezmur_id from public.mezmur_data_import where mezmur_id is not null group by mezmur_id having count(*) > 1) d;

select mezmur_id, count(*)::bigint as public_rows
from public.mezmur_public
where mezmur_id is not null
group by mezmur_id
having count(*) > 1
order by public_rows desc, mezmur_id;

select m.import_id, m.mezmur_id, m.slug, m.title, m.status,
       case when m.mezmur_id is null then 'mezmur_id is null'
            when count(p.mezmur_id) = 0 then 'published row absent from mezmur_public'
            else 'multiple public rows for mezmur_id' end as visibility_reason
from public.mezmur_data_import m
left join public.mezmur_public p on p.mezmur_id = m.mezmur_id
where lower(trim(m.status)) = 'published' and m.deleted_at is null
group by m.import_id, m.mezmur_id, m.slug, m.title, m.status
having count(p.mezmur_id) <> 1
order by m.import_id;

select proname, pg_get_function_identity_arguments(p.oid) as arguments,
       pg_get_functiondef(p.oid) as definition
from pg_proc p join pg_namespace n on n.oid = p.pronamespace
where n.nspname = 'public'
  and proname in ('publish_mezmur_import','bulk_publish_mezmur_imports');

select pg_get_viewdef('public.mezmur_public'::regclass, true) as mezmur_public_definition;
