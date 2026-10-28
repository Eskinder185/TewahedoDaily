-- Faster public link views (same four columns, same rows, same grants).
-- The previous version re-counted mezmur_public once per link row to check
-- slug uniqueness; this computes the published ids and unique slugs once.
begin;

create or replace view public.mezmur_category_links_public
with (security_barrier=true) as
with pub as materialized (
  select p.mezmur_id, lower(trim(p.slug)) as slug_key,
         count(*) over (partition by lower(trim(p.slug))) as slug_count
  from public.mezmur_public p
)
select distinct l.mezmur_import_id, m.mezmur_id, m.slug as mezmur_slug, l.category_slug
from public.mezmur_category_links_import l
join public.mezmur_data_import m on m.import_id = l.mezmur_import_id
where l.mezmur_import_id is not null
  and m.deleted_at is null
  and lower(trim(coalesce(m.status,''))) = 'published'
  and (
    (m.mezmur_id is not null and m.mezmur_id in (select mezmur_id from pub where mezmur_id is not null))
    or (m.mezmur_id is null and lower(trim(m.slug)) in (select slug_key from pub where slug_count = 1))
  );

create or replace view public.mezmur_occasion_links_public
with (security_barrier=true) as
with pub as materialized (
  select p.mezmur_id, lower(trim(p.slug)) as slug_key,
         count(*) over (partition by lower(trim(p.slug))) as slug_count
  from public.mezmur_public p
)
select distinct l.mezmur_import_id, m.mezmur_id, m.slug as mezmur_slug, l.occasion_slug
from public.mezmur_occasion_links_import l
join public.mezmur_data_import m on m.import_id = l.mezmur_import_id
where l.mezmur_import_id is not null
  and m.deleted_at is null
  and lower(trim(coalesce(m.status,''))) = 'published'
  and (
    (m.mezmur_id is not null and m.mezmur_id in (select mezmur_id from pub where mezmur_id is not null))
    or (m.mezmur_id is null and lower(trim(m.slug)) in (select slug_key from pub where slug_count = 1))
  );

grant select on public.mezmur_category_links_public to anon, authenticated;
grant select on public.mezmur_occasion_links_public to anon, authenticated;

-- Indexes used by the views and by section pages (add-only).
create index if not exists mezmur_category_links_import_category_idx on public.mezmur_category_links_import(category_slug);
create index if not exists mezmur_occasion_links_import_occasion_idx on public.mezmur_occasion_links_import(occasion_slug);

commit;

select
  (select count(*) from public.mezmur_category_links_public) as category_links_visible,
  (select count(*) from public.mezmur_occasion_links_public) as occasion_links_visible;
