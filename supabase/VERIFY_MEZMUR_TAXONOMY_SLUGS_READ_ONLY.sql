-- READ-ONLY. Verifies the canonical taxonomy identifiers against the live database.
-- Safe to run any time in the Supabase SQL editor: SELECT statements only.

-- 1. Canonical categories: does each expected slug exist in public.categories?
with expected(label, slug) as (
  values
    ('Jesus Christ', 'jesus-christ'),
    ('Virgin Mary', 'virgin-mary'),
    ('Holy Trinity', 'holy-trinity'),
    ('Holy Spirit', 'holy-spirit'),
    ('Kidus Michael', 'kidus-michael'),
    ('Kidus Gabriel', 'kidus-gabriel'),
    ('Kidus Raphael', 'kidus-raphael'),
    ('Kidus Uriel', 'kidus-uriel'),
    ('Kidus Giorgis', 'kidus-giorgis'),
    ('Abune Tekle Haymanot', 'abune-tekle-haymanot'),
    ('Abune Gebre Menfes Kidus', 'abune-gebre-menfes-kidus'),
    ('Kidus Yared', 'kidus-yared'),
    ('Yohannes Metmek / John the Baptist', 'yohannes-metmek-john-the-baptist'),
    ('Kidus Estifanos / Saint Stephen', 'kidus-estifanos-saint-stephen'),
    ('Apostles', 'apostles'),
    ('Martyrs', 'martyrs'),
    ('Saints', 'saints'),
    ('Angels', 'angels'),
    ('Prophets', 'prophets'),
    ('Cross', 'cross'),
    ('Repentance', 'repentance'),
    ('Praise / Worship', 'praise-worship'),
    ('Prayer', 'prayer'),
    ('Salvation', 'salvation'),
    ('General', 'general')
)
select e.label, e.slug,
       c.slug is not null as exists_in_categories,
       c.name as live_name,
       (select count(*) from public.mezmur_category_links_import l where l.category_slug = e.slug) as link_rows
from expected e
left join public.categories c on c.slug = e.slug
order by exists_in_categories, e.label;

-- 2. Canonical occasions: does each expected slug exist in public.mezmur_occasions?
with expected(label, slug) as (
  values
    ('Gena', 'gena'),
    ('Timket', 'timket'),
    ('Meskel', 'meskel'),
    ('Hosanna', 'hosanna'),
    ('Siklet', 'siklet'),
    ('Tinsae', 'tinsae'),
    ('Erget', 'erget'),
    ('Pentecost', 'pentecost'),
    ('Debre Tabor', 'debre-tabor'),
    ('Filseta', 'filseta'),
    ('Kidane Mihret', 'kidane-mihret'),
    ('Lideta Maryam', 'lideta-maryam'),
    ('Abiy Tsom', 'abiy-tsom'),
    ('Tsome Nineveh', 'tsome-nineveh'),
    ('Tsome Nebiyat', 'tsome-nebiyat'),
    ('Tsome Hawariat', 'tsome-hawariat'),
    ('Holy Week', 'holy-week'),
    ('New Year / Enkutatash', 'new-year'),
    ('Annual Saint Feast', 'annual-saint-feast'),
    ('Wedding', 'wedding'),
    ('Baptism', 'baptism'),
    ('Funeral / Memorial', 'funeral'),
    ('Communion', 'communion'),
    ('General / Anytime', 'general')
)
select e.label, e.slug,
       o.slug is not null as exists_in_occasions,
       o.name as live_name, o.status,
       (select count(*) from public.mezmur_occasion_links_import l where l.occasion_slug = e.slug) as link_rows
from expected e
left join public.mezmur_occasions o on o.slug = e.slug
order by exists_in_occasions, e.label;

-- 3. Link rows that use a slug with no taxonomy record (e.g. slugified labels such
--    as "new-year-enkutatash" written by older importers).
select 'category' as kind, l.category_slug as slug, count(*) as link_rows
from public.mezmur_category_links_import l
left join public.categories c on c.slug = l.category_slug
where c.slug is null
group by l.category_slug
union all
select 'occasion', l.occasion_slug, count(*)
from public.mezmur_occasion_links_import l
left join public.mezmur_occasions o on o.slug = l.occasion_slug
where o.slug is null
group by l.occasion_slug
order by link_rows desc;

-- 4. Legacy spellings the app now treats as equivalent (see LINK_SLUG_EQUIVALENTS).
select slug, kind, exists_as_record from (
  select s as slug, 'category' as kind, exists(select 1 from public.categories c where c.slug = s) as exists_as_record
  from unnest(array['new-year-enkutatash','funeral-memorial','general-anytime','kidus-estifanos','yohannes-metmek','qedus-giorgis','qedus-urael','qedus-raphael','qedist-arsema']) s
  union all
  select s, 'occasion', exists(select 1 from public.mezmur_occasions o where o.slug = s)
  from unnest(array['new-year-enkutatash','funeral-memorial','general-anytime','kidus-estifanos','yohannes-metmek','qedus-giorgis','qedus-urael','qedus-raphael','qedist-arsema']) s
) x order by slug, kind;

-- 5. Browse sections per group, with their source entity.
select collection_slug, section_slug, source_entity_type, source_entity_slug, status
from public.mezmur_sections_import
where deleted_at is null
order by collection_slug, section_slug;
