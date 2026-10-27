-- Read-only completion query for an authenticated staff / SQL Editor session.
-- It makes no writes, does not change RLS, and uses import_id only as identity.

select column_name, data_type, is_nullable
from information_schema.columns
where table_schema = 'public' and table_name = 'mezmur_data_import'
order by ordinal_position;

select
  count(*) filter (where deleted_at is null) as active_imports,
  count(*) filter (where deleted_at is null and lower(trim(coalesce(status, ''))) = 'published') as active_published,
  count(*) filter (where deleted_at is null and lower(trim(coalesce(status, ''))) = 'draft') as active_drafts,
  count(*) filter (where deleted_at is null and import_id is null) as active_missing_import_id,
  count(*) filter (where deleted_at is null and mezmur_id is null) as active_missing_mezmur_id
from public.mezmur_data_import;

select lower(trim(slug)) as normalized_slug, count(*) as record_count,
       array_agg(import_id order by import_id) as import_ids
from public.mezmur_data_import
where deleted_at is null and nullif(trim(coalesce(slug, '')), '') is not null
group by lower(trim(slug))
having count(*) > 1
order by record_count desc, normalized_slug;

select youtube_url, count(*) as record_count,
       array_agg(import_id order by import_id) as import_ids
from public.mezmur_data_import
where deleted_at is null and nullif(trim(coalesce(youtube_url, '')), '') is not null
group by youtube_url
having count(*) > 1
order by record_count desc, youtube_url;

-- Exact identity-aware visibility reconciliation. Slug is used only for
-- legacy rows without mezmur_id and only when it is unique on both sides.
with source_rows as (
  select import_id, mezmur_id, slug, title, status, deleted_at,
         count(*) filter (where deleted_at is null and lower(trim(coalesce(status, ''))) = 'published')
           over (partition by lower(trim(slug))) as source_slug_count
  from public.mezmur_data_import
), public_rows as (
  select mezmur_id, slug, title, status,
         count(*) over (partition by lower(trim(slug))) as public_slug_count
  from public.mezmur_public
)
select
  s.import_id, s.mezmur_id, s.slug, s.title,
  case
    when s.deleted_at is not null or lower(trim(coalesce(s.status, ''))) <> 'published' then 'not_applicable'
    when nullif(trim(coalesce(s.title, '')), '') is null or nullif(trim(coalesce(s.slug, '')), '') is null then 'excluded_by_public_view_predicate'
    when s.mezmur_id is not null and exists (select 1 from public_rows p where p.mezmur_id = s.mezmur_id) then 'visible_by_mezmur_id'
    when s.mezmur_id is not null then 'missing_public_row_for_mezmur_id'
    when s.source_slug_count = 1 and exists (select 1 from public_rows p where lower(trim(p.slug)) = lower(trim(s.slug)) and p.public_slug_count = 1) then 'visible_by_unique_legacy_slug'
    when s.source_slug_count > 1 then 'ambiguous_duplicate_source_slug'
    else 'missing_public_row_for_unique_legacy_slug'
  end as visibility_result
from source_rows s
where s.deleted_at is null and lower(trim(coalesce(s.status, ''))) = 'published'
order by visibility_result, s.slug;

-- Taxonomy and occasion coverage must be reviewed from the canonical link
-- tables, not inferred from titles. Run only if these tables exist.
select 'mezmur_category_links_import' as relation, count(*) as link_count
from public.mezmur_category_links_import
union all
select 'mezmur_occasion_links_import', count(*) from public.mezmur_occasion_links_import;
