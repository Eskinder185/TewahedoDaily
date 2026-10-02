-- MEZMUR_IMPORT_VALIDATION.sql
-- Run AFTER CSVs are loaded into public.mezmur_*_import tables.
-- Run BEFORE MEZMUR_APPLY_IMPORT.sql.
--
-- Every check prints rows (or a labeled count). Non-zero error groups must be
-- resolved before apply. This script does not mutate data.
--
-- Prerequisites:
--   1) MEZMUR_STAGING_SCHEMA.sql
--   2) CSV uploads into the six staging tables
--   3) Permanent tables from 20261002180000_hymn_collections_sections.sql
--      (hymn_collections / hymn_sections / mezmur_section_links) when validating
--      permanent-target readiness. Staging-only checks still work without them.

-- ============================================================================
-- A. Staging row counts (expected from generated package)
-- ============================================================================
select 'A_counts' as check_group, 'collections' as item, count(*)::text as value
from public.mezmur_collections_import
union all select 'A_counts', 'sections', count(*)::text from public.mezmur_sections_import
union all select 'A_counts', 'mezmur_data', count(*)::text from public.mezmur_data_import
union all select 'A_counts', 'section_links', count(*)::text from public.mezmur_section_links_import
union all select 'A_counts', 'occasion_links', count(*)::text from public.mezmur_occasion_links_import
union all select 'A_counts', 'category_links', count(*)::text from public.mezmur_category_links_import
order by 2;

-- Expected package sizes (informational):
-- collections 9 | sections 56 | mezmur 264 | section_links 466 | occasion_links 67 | category_links 210

-- ============================================================================
-- B. Duplicate slugs inside staging
-- ============================================================================
select 'B_dup_collection_slug' as check_group, trim(collection_slug) as key, count(*)::int as n
from public.mezmur_collections_import
where nullif(trim(collection_slug), '') is not null
group by trim(collection_slug)
having count(*) > 1
order by 2;

select 'B_dup_section_slug' as check_group, trim(section_slug) as key, count(*)::int as n
from public.mezmur_sections_import
where nullif(trim(section_slug), '') is not null
group by trim(section_slug)
having count(*) > 1
order by 2;

select 'B_dup_mezmur_slug' as check_group, trim(slug) as key, count(*)::int as n
from public.mezmur_data_import
where nullif(trim(slug), '') is not null
group by trim(slug)
having count(*) > 1
order by 2;

select
  'B_dup_section_link' as check_group,
  trim(mezmur_slug) as mezmur_slug,
  trim(section_slug) as section_slug,
  count(*)::int as n
from public.mezmur_section_links_import
group by trim(mezmur_slug), trim(section_slug)
having count(*) > 1
order by 2, 3;

select
  'B_dup_occasion_link' as check_group,
  trim(mezmur_slug) as mezmur_slug,
  trim(occasion_slug) as occasion_slug,
  count(*)::int as n
from public.mezmur_occasion_links_import
group by trim(mezmur_slug), trim(occasion_slug)
having count(*) > 1
order by 2, 3;

select
  'B_dup_category_link' as check_group,
  trim(mezmur_slug) as mezmur_slug,
  trim(category_slug) as category_slug,
  count(*)::int as n
from public.mezmur_category_links_import
group by trim(mezmur_slug), trim(category_slug)
having count(*) > 1
order by 2, 3;

-- ============================================================================
-- C. Empty required titles / slugs in staging
-- ============================================================================
select
  'C_empty_collection_required' as check_group,
  collection_slug,
  title,
  'missing collection_slug or title' as reason
from public.mezmur_collections_import
where nullif(trim(collection_slug), '') is null
   or nullif(trim(title), '') is null
order by 2;

select
  'C_empty_section_required' as check_group,
  section_slug,
  collection_slug,
  title,
  'missing section_slug, collection_slug, or title' as reason
from public.mezmur_sections_import
where nullif(trim(section_slug), '') is null
   or nullif(trim(collection_slug), '') is null
   or nullif(trim(title), '') is null
order by 2;

select
  'C_empty_mezmur_required' as check_group,
  slug,
  title,
  title_amharic,
  'missing slug or both titles empty' as reason
from public.mezmur_data_import
where nullif(trim(slug), '') is null
   or (
     nullif(trim(title), '') is null
     and nullif(trim(title_amharic), '') is null
   )
order by 2;

-- ============================================================================
-- D. Broken references inside staging package (CSV↔CSV)
-- ============================================================================
select
  'D_section_missing_collection' as check_group,
  s.section_slug,
  s.collection_slug,
  'collection_slug not present in mezmur_collections_import' as reason
from public.mezmur_sections_import s
left join public.mezmur_collections_import c
  on trim(c.collection_slug) = trim(s.collection_slug)
where c.collection_slug is null
order by 2;

select
  'D_section_missing_parent' as check_group,
  s.section_slug,
  s.parent_section_slug,
  'parent_section_slug not present in mezmur_sections_import' as reason
from public.mezmur_sections_import s
left join public.mezmur_sections_import p
  on trim(p.section_slug) = nullif(trim(s.parent_section_slug), '')
where nullif(trim(s.parent_section_slug), '') is not null
  and p.section_slug is null
order by 2;

select
  'D_section_link_missing_mezmur_in_stage' as check_group,
  l.mezmur_slug,
  l.section_slug,
  'mezmur_slug not present in mezmur_data_import' as reason
from public.mezmur_section_links_import l
left join public.mezmur_data_import d
  on trim(d.slug) = trim(l.mezmur_slug)
where d.slug is null
order by 2, 3;

select
  'D_section_link_missing_section_in_stage' as check_group,
  l.mezmur_slug,
  l.section_slug,
  'section_slug not present in mezmur_sections_import' as reason
from public.mezmur_section_links_import l
left join public.mezmur_sections_import s
  on trim(s.section_slug) = trim(l.section_slug)
where s.section_slug is null
order by 2, 3;

select
  'D_occasion_link_missing_mezmur_in_stage' as check_group,
  l.mezmur_slug,
  l.occasion_slug,
  'mezmur_slug not present in mezmur_data_import' as reason
from public.mezmur_occasion_links_import l
left join public.mezmur_data_import d
  on trim(d.slug) = trim(l.mezmur_slug)
where d.slug is null
order by 2, 3;

select
  'D_category_link_missing_mezmur_in_stage' as check_group,
  l.mezmur_slug,
  l.category_slug,
  'mezmur_slug not present in mezmur_data_import' as reason
from public.mezmur_category_links_import l
left join public.mezmur_data_import d
  on trim(d.slug) = trim(l.mezmur_slug)
where d.slug is null
order by 2, 3;

-- Primary marker sanity (informational / soft): each linked mezmur should have
-- exactly one is_primary=true among its staged section links.
select
  'D_primary_marker_count' as check_group,
  trim(mezmur_slug) as mezmur_slug,
  count(*) filter (
    where lower(trim(coalesce(is_primary, ''))) in ('true', 't', '1', 'yes')
  )::int as primary_count,
  'expected exactly 1 primary section link' as reason
from public.mezmur_section_links_import
group by trim(mezmur_slug)
having count(*) filter (
  where lower(trim(coalesce(is_primary, ''))) in ('true', 't', '1', 'yes')
) <> 1
order by 2;

-- ============================================================================
-- E. Broken references against LIVE permanent tables
--    (these are the hard blockers for apply)
-- ============================================================================

-- E1. Staged mezmur slug not found in public.mezmur
select
  'E_mezmur_slug_missing_in_production' as check_group,
  trim(d.slug) as mezmur_slug,
  nullif(trim(d.title), '') as title,
  'no public.mezmur row with this slug — apply will skip inserts; links will fail' as reason
from public.mezmur_data_import d
left join public.mezmur m on m.slug = trim(d.slug)
where m.id is null
order by 2;

-- E2. Section-link mezmur missing in production
select
  'E_section_link_mezmur_missing' as check_group,
  trim(l.mezmur_slug) as mezmur_slug,
  trim(l.section_slug) as section_slug,
  'mezmur_slug not found in public.mezmur' as reason
from public.mezmur_section_links_import l
left join public.mezmur m on m.slug = trim(l.mezmur_slug)
where m.id is null
order by 2, 3;

-- E3. Occasion-link mezmur missing in production
select
  'E_occasion_link_mezmur_missing' as check_group,
  trim(l.mezmur_slug) as mezmur_slug,
  trim(l.occasion_slug) as occasion_slug,
  'mezmur_slug not found in public.mezmur' as reason
from public.mezmur_occasion_links_import l
left join public.mezmur m on m.slug = trim(l.mezmur_slug)
where m.id is null
order by 2, 3;

-- E4. Category-link mezmur missing in production
select
  'E_category_link_mezmur_missing' as check_group,
  trim(l.mezmur_slug) as mezmur_slug,
  trim(l.category_slug) as category_slug,
  'mezmur_slug not found in public.mezmur' as reason
from public.mezmur_category_links_import l
left join public.mezmur m on m.slug = trim(l.mezmur_slug)
where m.id is null
order by 2, 3;

-- E5. Occasion slug missing in public.mezmur_occasions
select
  'E_occasion_slug_missing' as check_group,
  trim(l.mezmur_slug) as mezmur_slug,
  trim(l.occasion_slug) as occasion_slug,
  'occasion_slug not found in public.mezmur_occasions' as reason
from public.mezmur_occasion_links_import l
left join public.mezmur_occasions o on o.slug = trim(l.occasion_slug)
where o.id is null
order by 3, 2;

-- E6. Category slug missing in public.categories
select
  'E_category_slug_missing' as check_group,
  trim(l.mezmur_slug) as mezmur_slug,
  trim(l.category_slug) as category_slug,
  coalesce(l.source_category, '') as source_category,
  'category_slug not found in public.categories — category_id fill will skip' as reason
from public.mezmur_category_links_import l
left join public.categories c on c.slug = trim(l.category_slug)
where c.id is null
order by 3, 2;

-- E7. Singer slug present in stage but missing in public.singers (soft — singers usually blank)
select
  'E_singer_slug_missing' as check_group,
  trim(d.slug) as mezmur_slug,
  trim(d.singer_slug) as singer_slug,
  trim(d.singer_name) as singer_name,
  'singer_slug not found in public.singers' as reason
from public.mezmur_data_import d
left join public.singers s on s.slug = nullif(trim(d.singer_slug), '')
where nullif(trim(d.singer_slug), '') is not null
  and s.id is null
order by 2;

-- E8. Permanent hierarchy tables present?
select
  'E_permanent_table_presence' as check_group,
  t.table_name,
  case when to_regclass('public.' || t.table_name) is null then 'MISSING' else 'present' end as status,
  case
    when to_regclass('public.' || t.table_name) is null
      then 'Run supabase/migrations/20261002180000_hymn_collections_sections.sql before apply'
    else 'ok'
  end as reason
from (
  values
    ('hymn_collections'),
    ('hymn_sections'),
    ('mezmur_section_links'),
    ('mezmur_occasions'),
    ('mezmur_occasion_links'),
    ('categories'),
    ('singers'),
    ('mezmur')
) as t(table_name)
order by 2;

-- ============================================================================
-- F. Required-zero summary (run last — one row per blocker family)
-- ============================================================================
select 'F_zero_required' as check_group, 'dup_collection_slugs' as item,
  (select count(*) from (
     select 1 from public.mezmur_collections_import
     where nullif(trim(collection_slug), '') is not null
     group by trim(collection_slug) having count(*) > 1
   ) x)::int as n
union all select 'F_zero_required', 'dup_section_slugs',
  (select count(*) from (
     select 1 from public.mezmur_sections_import
     where nullif(trim(section_slug), '') is not null
     group by trim(section_slug) having count(*) > 1
   ) x)::int
union all select 'F_zero_required', 'dup_mezmur_slugs',
  (select count(*) from (
     select 1 from public.mezmur_data_import
     where nullif(trim(slug), '') is not null
     group by trim(slug) having count(*) > 1
   ) x)::int
union all select 'F_zero_required', 'broken_collection_refs_in_stage',
  (select count(*) from public.mezmur_sections_import s
   left join public.mezmur_collections_import c on trim(c.collection_slug) = trim(s.collection_slug)
   where c.collection_slug is null)::int
union all select 'F_zero_required', 'broken_section_refs_in_stage',
  (select count(*) from public.mezmur_section_links_import l
   left join public.mezmur_sections_import s on trim(s.section_slug) = trim(l.section_slug)
   where s.section_slug is null)::int
union all select 'F_zero_required', 'broken_mezmur_refs_in_production_for_section_links',
  (select count(*) from public.mezmur_section_links_import l
   left join public.mezmur m on m.slug = trim(l.mezmur_slug)
   where m.id is null)::int
union all select 'F_zero_required', 'broken_occasion_refs',
  (select count(*) from public.mezmur_occasion_links_import l
   left join public.mezmur_occasions o on o.slug = trim(l.occasion_slug)
   where o.id is null)::int
union all select 'F_zero_required', 'broken_category_refs',
  (select count(*) from public.mezmur_category_links_import l
   left join public.categories c on c.slug = trim(l.category_slug)
   where c.id is null)::int
order by 2;

-- STOP RULE: if any F_zero_required.n > 0, do NOT run MEZMUR_APPLY_IMPORT.sql.
-- Review the matching E_/D_/B_ result sets for exact broken rows.
