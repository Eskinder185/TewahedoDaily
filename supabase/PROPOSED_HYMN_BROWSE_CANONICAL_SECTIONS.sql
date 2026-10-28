-- PROPOSED — NOT APPLIED. Review, then run in the Supabase SQL editor when authorized.
--
-- Adds browse sections for canonical categories / occasions that have no row in
-- public.mezmur_sections_import (live snapshot 2026-10-24). Until this runs, the
-- same sections are provided by code (src/lib/publicContent/browseTaxonomy.ts,
-- CANONICAL_FALLBACK_SECTIONS); once rows exist, the code fallbacks step aside.
--
-- Safe to re-run: inserts only rows that do not exist yet. Existing sections,
-- groups, categories, occasions, Mezmur rows, lyrics and publication status are
-- not touched. mezmur_sections_import has no unique constraint, so the guard is
-- an explicit NOT EXISTS on (collection_slug, section_slug).

begin;

with proposed(collection_slug, section_slug, title, title_amharic, source_entity_type, source_entity_slug, sort_order) as (
  values
  ('jesus-christ', 'christ-salvation', 'Salvation', 'ድኅነት', 'category', 'salvation', '90'),
  ('angels-saints', 'saint-john-the-baptist', 'St. John the Baptist', 'ቅዱስ ዮሐንስ መጥምቅ', 'category', 'yohannes-metmek-john-the-baptist', '85'),
  ('angels-saints', 'prophets', 'Prophets', 'ነቢያት', 'category', 'prophets', '75'),
  ('angels-saints', 'annual-saint-feasts', 'Annual Saint Feasts', 'የቅዱሳን ዓመታዊ በዓላት', 'occasion', 'annual-saint-feast', '95'),
  ('repentance-fasting', 'tsome-nebiyat', 'Tsome Nebiyat / Fast of the Prophets', 'ጾመ ነቢያት', 'occasion', 'tsome-nebiyat', '60'),
  ('repentance-fasting', 'tsome-hawariat', 'Tsome Hawariat / Apostles Fast', 'ጾመ ሐዋርያት', 'occasion', 'tsome-hawariat', '70'),
  ('holidays-feasts', 'holidays-erget', 'Ascension / Erget', 'ዕርገት', 'occasion', 'erget', '95'),
  ('sacraments-church-life', 'baptism', 'Baptism', 'ሥርዓተ ጥምቀት', 'occasion', 'baptism', '30'),
  ('sacraments-church-life', 'funeral', 'Funeral / Memorial', 'ፍትሐት / መታሰቢያ', 'occasion', 'funeral', '40')
)
insert into public.mezmur_sections_import (
  section_id, section_slug, collection_slug, parent_section_slug, title, title_amharic,
  description, description_amharic, image_path, image_alt, section_type,
  source_entity_type, source_entity_slug, sort_order, is_featured, status
)
select
  gen_random_uuid()::text, p.section_slug, p.collection_slug, null, p.title, p.title_amharic,
  null, null, null, p.title, p.source_entity_type,
  p.source_entity_type, p.source_entity_slug, p.sort_order::text, 'false', 'published'
from proposed p
where not exists (
  select 1 from public.mezmur_sections_import s
  where s.collection_slug = p.collection_slug and s.section_slug = p.section_slug
);

commit;

-- ---------------------------------------------------------------------------
-- NOT INCLUDED (needs a separate decision): new canonical category rows.
-- Category links are validated against public.categories. If the read-only
-- check (VERIFY_MEZMUR_TAXONOMY_SLUGS_READ_ONLY.sql) shows that "salvation" or
-- "yohannes-metmek-john-the-baptist" are missing there, Mezmurs cannot be
-- linked to those categories until the rows are created by an editor.
-- ---------------------------------------------------------------------------
