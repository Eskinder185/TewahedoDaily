-- MEZMUR_STAGING_SCHEMA.sql
-- Creates PUBLIC staging tables that match the generated CSV headers EXACTLY.
-- All columns are TEXT so Supabase Table Editor / CSV upload accepts empty cells
-- (blank UUIDs, blank booleans, blank integers) without cast failures.
--
-- Prerequisites: none (safe to create before permanent hymn_* tables).
-- Does NOT insert content. Does NOT drop or alter permanent content tables.
--
-- CSV source folder (reference):
--   Documents/Codex/2026-09-29/files-mentioned-by-the-user-amharic/outputs/

begin;

-- Wipe and recreate so re-runs match the current CSV headers exactly.
drop table if exists public.mezmur_category_links_import cascade;
drop table if exists public.mezmur_occasion_links_import cascade;
drop table if exists public.mezmur_section_links_import cascade;
drop table if exists public.mezmur_data_import cascade;
drop table if exists public.mezmur_sections_import cascade;
drop table if exists public.mezmur_collections_import cascade;

-- ---------------------------------------------------------------------------
-- mezmur_collections.csv
-- Headers:
-- collection_id,collection_slug,title,title_amharic,description,description_amharic,
-- image_path,image_alt,collection_type,sort_order,is_featured,status
-- ---------------------------------------------------------------------------
create table public.mezmur_collections_import (
  collection_id text,
  collection_slug text,
  title text,
  title_amharic text,
  description text,
  description_amharic text,
  image_path text,
  image_alt text,
  collection_type text,
  sort_order text,
  is_featured text,
  status text
);

-- ---------------------------------------------------------------------------
-- mezmur_sections.csv
-- Headers:
-- section_id,section_slug,collection_slug,parent_section_slug,title,title_amharic,
-- description,description_amharic,image_path,image_alt,section_type,source_entity_type,
-- source_entity_slug,sort_order,is_featured,status
-- ---------------------------------------------------------------------------
create table public.mezmur_sections_import (
  section_id text,
  section_slug text,
  collection_slug text,
  parent_section_slug text,
  title text,
  title_amharic text,
  description text,
  description_amharic text,
  image_path text,
  image_alt text,
  section_type text,
  source_entity_type text,
  source_entity_slug text,
  sort_order text,
  is_featured text,
  status text
);

-- ---------------------------------------------------------------------------
-- mezmur_data.csv
-- Headers:
-- mezmur_id,slug,title,title_amharic,title_english,description,description_amharic,
-- lyrics_amharic,lyrics_transliteration,lyrics_english,lyrics_geez,lyrics_oromo,
-- primary_language,form,singer_id,singer_slug,singer_name,youtube_url,audio_url,
-- image_path,image_alt,legacy_thumbnail_url,search_keywords,status,review_status,
-- review_notes,source_url,source_notes,created_at,updated_at
-- ---------------------------------------------------------------------------
create table public.mezmur_data_import (
  mezmur_id text,
  slug text,
  title text,
  title_amharic text,
  title_english text,
  description text,
  description_amharic text,
  lyrics_amharic text,
  lyrics_transliteration text,
  lyrics_english text,
  lyrics_geez text,
  lyrics_oromo text,
  primary_language text,
  form text,
  singer_id text,
  singer_slug text,
  singer_name text,
  youtube_url text,
  audio_url text,
  image_path text,
  image_alt text,
  legacy_thumbnail_url text,
  search_keywords text,
  status text,
  review_status text,
  review_notes text,
  source_url text,
  source_notes text,
  created_at text,
  updated_at text
);

-- ---------------------------------------------------------------------------
-- mezmur_section_links.csv
-- Headers: mezmur_slug,section_slug,sort_order,is_primary
-- ---------------------------------------------------------------------------
create table public.mezmur_section_links_import (
  mezmur_slug text,
  section_slug text,
  sort_order text,
  is_primary text
);

-- ---------------------------------------------------------------------------
-- mezmur_occasion_links.csv
-- Headers: mezmur_slug,occasion_slug
-- ---------------------------------------------------------------------------
create table public.mezmur_occasion_links_import (
  mezmur_slug text,
  occasion_slug text
);

-- ---------------------------------------------------------------------------
-- mezmur_category_links.csv
-- Headers: mezmur_slug,category_slug,source_category,confidence
-- ---------------------------------------------------------------------------
create table public.mezmur_category_links_import (
  mezmur_slug text,
  category_slug text,
  source_category text,
  confidence text
);

comment on table public.mezmur_collections_import is
  'Staging only. Import mezmur_collections.csv here. Not a permanent content table.';
comment on table public.mezmur_sections_import is
  'Staging only. Import mezmur_sections.csv here.';
comment on table public.mezmur_data_import is
  'Staging only. Import mezmur_data.csv here. mezmur_id is intentionally blank; resolve by slug.';
comment on table public.mezmur_section_links_import is
  'Staging only. Import mezmur_section_links.csv here. Slugs only — no UUIDs.';
comment on table public.mezmur_occasion_links_import is
  'Staging only. Import mezmur_occasion_links.csv here.';
comment on table public.mezmur_category_links_import is
  'Staging only. Import mezmur_category_links.csv here. Maps to mezmur.category_id (no M2M table).';

-- Easy dashboard CSV import: authenticated staff / service role.
alter table public.mezmur_collections_import disable row level security;
alter table public.mezmur_sections_import disable row level security;
alter table public.mezmur_data_import disable row level security;
alter table public.mezmur_section_links_import disable row level security;
alter table public.mezmur_occasion_links_import disable row level security;
alter table public.mezmur_category_links_import disable row level security;

revoke all on public.mezmur_collections_import from public, anon;
revoke all on public.mezmur_sections_import from public, anon;
revoke all on public.mezmur_data_import from public, anon;
revoke all on public.mezmur_section_links_import from public, anon;
revoke all on public.mezmur_occasion_links_import from public, anon;
revoke all on public.mezmur_category_links_import from public, anon;

grant select, insert, update, delete, truncate on public.mezmur_collections_import to authenticated, service_role;
grant select, insert, update, delete, truncate on public.mezmur_sections_import to authenticated, service_role;
grant select, insert, update, delete, truncate on public.mezmur_data_import to authenticated, service_role;
grant select, insert, update, delete, truncate on public.mezmur_section_links_import to authenticated, service_role;
grant select, insert, update, delete, truncate on public.mezmur_occasion_links_import to authenticated, service_role;
grant select, insert, update, delete, truncate on public.mezmur_category_links_import to authenticated, service_role;

commit;

-- ---------------------------------------------------------------------------
-- After this script: truncate then CSV-import (Table Editor or \copy).
-- Do NOT import mezmur_duplicates_review.csv or mezmur_taxonomy_review.csv.
-- ---------------------------------------------------------------------------
--
-- truncate table
--   public.mezmur_collections_import,
--   public.mezmur_sections_import,
--   public.mezmur_data_import,
--   public.mezmur_section_links_import,
--   public.mezmur_occasion_links_import,
--   public.mezmur_category_links_import;
