-- MEZMUR_STAGING_SCHEMA_FIX.sql
-- Additive fix so each public.mezmur_*_import staging table accepts the
-- corresponding generated CSV headers in the Supabase Table Editor importer.
--
-- Rules:
-- - Does NOT rename or remove CSV columns
-- - Does NOT drop tables or truncate data
-- - Does NOT modify permanent production content tables
-- - Keeps / adds import_id uuid + imported_at timestamptz (not in CSVs;
--   defaults fill them during import)
-- - Ensures every CSV header exists as TEXT (empty cells import safely)
--
-- CSV sources (actual headers verified 2026-10-02):
--   mezmur_collections.csv
--   mezmur_sections.csv
--   mezmur_data.csv
--   mezmur_section_links.csv
--   mezmur_occasion_links.csv
--   mezmur_category_links.csv
--
-- Review CSVs are intentionally excluded:
--   mezmur_duplicates_review.csv
--   mezmur_taxonomy_review.csv

begin;

create schema if not exists cms_private;

-- ---------------------------------------------------------------------------
-- Helpers: add column if missing; coerce existing column to text if needed
-- ---------------------------------------------------------------------------
create or replace function cms_private.ensure_staging_text_column(
  p_table regclass,
  p_column text
) returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_schema text;
  v_table text;
  v_udt text;
begin
  select n.nspname, c.relname
  into v_schema, v_table
  from pg_class c
  join pg_namespace n on n.oid = c.relnamespace
  where c.oid = p_table;

  if not exists (
    select 1
    from information_schema.columns
    where table_schema = v_schema
      and table_name = v_table
      and column_name = p_column
  ) then
    execute format(
      'alter table %s add column %I text',
      p_table,
      p_column
    );
    return;
  end if;

  select c.udt_name
  into v_udt
  from information_schema.columns c
  where c.table_schema = v_schema
    and c.table_name = v_table
    and c.column_name = p_column;

  -- Supabase CSV importer fails on empty strings into uuid/int/bool/timestamptz.
  -- Coerce ambiguous import fields to text without dropping values.
  if v_udt is distinct from 'text' and v_udt is distinct from 'varchar' then
    execute format(
      'alter table %s alter column %I type text using %I::text',
      p_table,
      p_column,
      p_column
    );
  end if;
end;
$$;

create or replace function cms_private.ensure_staging_meta_columns(
  p_table regclass
) returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_schema text;
  v_table text;
begin
  select n.nspname, c.relname
  into v_schema, v_table
  from pg_class c
  join pg_namespace n on n.oid = c.relnamespace
  where c.oid = p_table;

  if not exists (
    select 1 from information_schema.columns
    where table_schema = v_schema and table_name = v_table and column_name = 'import_id'
  ) then
    execute format(
      'alter table %s add column import_id uuid not null default gen_random_uuid()',
      p_table
    );
  end if;

  if not exists (
    select 1 from information_schema.columns
    where table_schema = v_schema and table_name = v_table and column_name = 'imported_at'
  ) then
    execute format(
      'alter table %s add column imported_at timestamptz not null default now()',
      p_table
    );
  end if;
end;
$$;

-- ---------------------------------------------------------------------------
-- Create tables if they do not exist yet (full CSV header set + meta columns)
-- ---------------------------------------------------------------------------
create table if not exists public.mezmur_collections_import (
  import_id uuid not null default gen_random_uuid(),
  imported_at timestamptz not null default now(),
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

create table if not exists public.mezmur_sections_import (
  import_id uuid not null default gen_random_uuid(),
  imported_at timestamptz not null default now(),
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

create table if not exists public.mezmur_data_import (
  import_id uuid not null default gen_random_uuid(),
  imported_at timestamptz not null default now(),
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

create table if not exists public.mezmur_section_links_import (
  import_id uuid not null default gen_random_uuid(),
  imported_at timestamptz not null default now(),
  mezmur_slug text,
  section_slug text,
  sort_order text,
  is_primary text
);

create table if not exists public.mezmur_occasion_links_import (
  import_id uuid not null default gen_random_uuid(),
  imported_at timestamptz not null default now(),
  mezmur_slug text,
  occasion_slug text
);

create table if not exists public.mezmur_category_links_import (
  import_id uuid not null default gen_random_uuid(),
  imported_at timestamptz not null default now(),
  mezmur_slug text,
  category_slug text,
  source_category text,
  confidence text
);

-- ---------------------------------------------------------------------------
-- Ensure meta columns on existing tables
-- ---------------------------------------------------------------------------
select cms_private.ensure_staging_meta_columns('public.mezmur_collections_import'::regclass);
select cms_private.ensure_staging_meta_columns('public.mezmur_sections_import'::regclass);
select cms_private.ensure_staging_meta_columns('public.mezmur_data_import'::regclass);
select cms_private.ensure_staging_meta_columns('public.mezmur_section_links_import'::regclass);
select cms_private.ensure_staging_meta_columns('public.mezmur_occasion_links_import'::regclass);
select cms_private.ensure_staging_meta_columns('public.mezmur_category_links_import'::regclass);

-- ---------------------------------------------------------------------------
-- Ensure every CSV header exists as TEXT
-- mezmur_collections.csv
-- ---------------------------------------------------------------------------
select cms_private.ensure_staging_text_column('public.mezmur_collections_import'::regclass, 'collection_id');
select cms_private.ensure_staging_text_column('public.mezmur_collections_import'::regclass, 'collection_slug');
select cms_private.ensure_staging_text_column('public.mezmur_collections_import'::regclass, 'title');
select cms_private.ensure_staging_text_column('public.mezmur_collections_import'::regclass, 'title_amharic');
select cms_private.ensure_staging_text_column('public.mezmur_collections_import'::regclass, 'description');
select cms_private.ensure_staging_text_column('public.mezmur_collections_import'::regclass, 'description_amharic');
select cms_private.ensure_staging_text_column('public.mezmur_collections_import'::regclass, 'image_path');
select cms_private.ensure_staging_text_column('public.mezmur_collections_import'::regclass, 'image_alt');
select cms_private.ensure_staging_text_column('public.mezmur_collections_import'::regclass, 'collection_type');
select cms_private.ensure_staging_text_column('public.mezmur_collections_import'::regclass, 'sort_order');
select cms_private.ensure_staging_text_column('public.mezmur_collections_import'::regclass, 'is_featured');
select cms_private.ensure_staging_text_column('public.mezmur_collections_import'::regclass, 'status');

-- mezmur_sections.csv
select cms_private.ensure_staging_text_column('public.mezmur_sections_import'::regclass, 'section_id');
select cms_private.ensure_staging_text_column('public.mezmur_sections_import'::regclass, 'section_slug');
select cms_private.ensure_staging_text_column('public.mezmur_sections_import'::regclass, 'collection_slug');
select cms_private.ensure_staging_text_column('public.mezmur_sections_import'::regclass, 'parent_section_slug');
select cms_private.ensure_staging_text_column('public.mezmur_sections_import'::regclass, 'title');
select cms_private.ensure_staging_text_column('public.mezmur_sections_import'::regclass, 'title_amharic');
select cms_private.ensure_staging_text_column('public.mezmur_sections_import'::regclass, 'description');
select cms_private.ensure_staging_text_column('public.mezmur_sections_import'::regclass, 'description_amharic');
select cms_private.ensure_staging_text_column('public.mezmur_sections_import'::regclass, 'image_path');
select cms_private.ensure_staging_text_column('public.mezmur_sections_import'::regclass, 'image_alt');
select cms_private.ensure_staging_text_column('public.mezmur_sections_import'::regclass, 'section_type');
select cms_private.ensure_staging_text_column('public.mezmur_sections_import'::regclass, 'source_entity_type');
select cms_private.ensure_staging_text_column('public.mezmur_sections_import'::regclass, 'source_entity_slug');
select cms_private.ensure_staging_text_column('public.mezmur_sections_import'::regclass, 'sort_order');
select cms_private.ensure_staging_text_column('public.mezmur_sections_import'::regclass, 'is_featured');
select cms_private.ensure_staging_text_column('public.mezmur_sections_import'::regclass, 'status');

-- mezmur_data.csv
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'mezmur_id');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'slug');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'title');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'title_amharic');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'title_english');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'description');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'description_amharic');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'lyrics_amharic');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'lyrics_transliteration');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'lyrics_english');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'lyrics_geez');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'lyrics_oromo');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'primary_language');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'form');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'singer_id');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'singer_slug');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'singer_name');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'youtube_url');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'audio_url');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'image_path');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'image_alt');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'legacy_thumbnail_url');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'search_keywords');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'status');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'review_status');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'review_notes');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'source_url');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'source_notes');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'created_at');
select cms_private.ensure_staging_text_column('public.mezmur_data_import'::regclass, 'updated_at');

-- mezmur_section_links.csv
select cms_private.ensure_staging_text_column('public.mezmur_section_links_import'::regclass, 'mezmur_slug');
select cms_private.ensure_staging_text_column('public.mezmur_section_links_import'::regclass, 'section_slug');
select cms_private.ensure_staging_text_column('public.mezmur_section_links_import'::regclass, 'sort_order');
select cms_private.ensure_staging_text_column('public.mezmur_section_links_import'::regclass, 'is_primary');

-- mezmur_occasion_links.csv
select cms_private.ensure_staging_text_column('public.mezmur_occasion_links_import'::regclass, 'mezmur_slug');
select cms_private.ensure_staging_text_column('public.mezmur_occasion_links_import'::regclass, 'occasion_slug');

-- mezmur_category_links.csv
select cms_private.ensure_staging_text_column('public.mezmur_category_links_import'::regclass, 'mezmur_slug');
select cms_private.ensure_staging_text_column('public.mezmur_category_links_import'::regclass, 'category_slug');
select cms_private.ensure_staging_text_column('public.mezmur_category_links_import'::regclass, 'source_category');
select cms_private.ensure_staging_text_column('public.mezmur_category_links_import'::regclass, 'confidence');

-- ---------------------------------------------------------------------------
-- Dashboard import grants (idempotent)
-- ---------------------------------------------------------------------------
alter table public.mezmur_collections_import disable row level security;
alter table public.mezmur_sections_import disable row level security;
alter table public.mezmur_data_import disable row level security;
alter table public.mezmur_section_links_import disable row level security;
alter table public.mezmur_occasion_links_import disable row level security;
alter table public.mezmur_category_links_import disable row level security;

grant select, insert, update, delete, truncate
  on public.mezmur_collections_import,
     public.mezmur_sections_import,
     public.mezmur_data_import,
     public.mezmur_section_links_import,
     public.mezmur_occasion_links_import,
     public.mezmur_category_links_import
  to authenticated, service_role;

-- ---------------------------------------------------------------------------
-- Post-fix verification: every CSV header must exist
-- ---------------------------------------------------------------------------
create or replace view public.mezmur_staging_header_audit as
with expected(table_name, column_name) as (
  values
    -- collections
    ('mezmur_collections_import','collection_id'),
    ('mezmur_collections_import','collection_slug'),
    ('mezmur_collections_import','title'),
    ('mezmur_collections_import','title_amharic'),
    ('mezmur_collections_import','description'),
    ('mezmur_collections_import','description_amharic'),
    ('mezmur_collections_import','image_path'),
    ('mezmur_collections_import','image_alt'),
    ('mezmur_collections_import','collection_type'),
    ('mezmur_collections_import','sort_order'),
    ('mezmur_collections_import','is_featured'),
    ('mezmur_collections_import','status'),
    -- sections
    ('mezmur_sections_import','section_id'),
    ('mezmur_sections_import','section_slug'),
    ('mezmur_sections_import','collection_slug'),
    ('mezmur_sections_import','parent_section_slug'),
    ('mezmur_sections_import','title'),
    ('mezmur_sections_import','title_amharic'),
    ('mezmur_sections_import','description'),
    ('mezmur_sections_import','description_amharic'),
    ('mezmur_sections_import','image_path'),
    ('mezmur_sections_import','image_alt'),
    ('mezmur_sections_import','section_type'),
    ('mezmur_sections_import','source_entity_type'),
    ('mezmur_sections_import','source_entity_slug'),
    ('mezmur_sections_import','sort_order'),
    ('mezmur_sections_import','is_featured'),
    ('mezmur_sections_import','status'),
    -- data
    ('mezmur_data_import','mezmur_id'),
    ('mezmur_data_import','slug'),
    ('mezmur_data_import','title'),
    ('mezmur_data_import','title_amharic'),
    ('mezmur_data_import','title_english'),
    ('mezmur_data_import','description'),
    ('mezmur_data_import','description_amharic'),
    ('mezmur_data_import','lyrics_amharic'),
    ('mezmur_data_import','lyrics_transliteration'),
    ('mezmur_data_import','lyrics_english'),
    ('mezmur_data_import','lyrics_geez'),
    ('mezmur_data_import','lyrics_oromo'),
    ('mezmur_data_import','primary_language'),
    ('mezmur_data_import','form'),
    ('mezmur_data_import','singer_id'),
    ('mezmur_data_import','singer_slug'),
    ('mezmur_data_import','singer_name'),
    ('mezmur_data_import','youtube_url'),
    ('mezmur_data_import','audio_url'),
    ('mezmur_data_import','image_path'),
    ('mezmur_data_import','image_alt'),
    ('mezmur_data_import','legacy_thumbnail_url'),
    ('mezmur_data_import','search_keywords'),
    ('mezmur_data_import','status'),
    ('mezmur_data_import','review_status'),
    ('mezmur_data_import','review_notes'),
    ('mezmur_data_import','source_url'),
    ('mezmur_data_import','source_notes'),
    ('mezmur_data_import','created_at'),
    ('mezmur_data_import','updated_at'),
    -- section links
    ('mezmur_section_links_import','mezmur_slug'),
    ('mezmur_section_links_import','section_slug'),
    ('mezmur_section_links_import','sort_order'),
    ('mezmur_section_links_import','is_primary'),
    -- occasion links
    ('mezmur_occasion_links_import','mezmur_slug'),
    ('mezmur_occasion_links_import','occasion_slug'),
    -- category links
    ('mezmur_category_links_import','mezmur_slug'),
    ('mezmur_category_links_import','category_slug'),
    ('mezmur_category_links_import','source_category'),
    ('mezmur_category_links_import','confidence')
)
select
  e.table_name,
  e.column_name as required_csv_header,
  case when c.column_name is null then 'MISSING' else 'ok' end as status,
  c.data_type
from expected e
left join information_schema.columns c
  on c.table_schema = 'public'
 and c.table_name = e.table_name
 and c.column_name = e.column_name
order by e.table_name, e.column_name;

grant select on public.mezmur_staging_header_audit to authenticated, service_role;

commit;

-- After apply, verify (must return zero rows):
--   select * from public.mezmur_staging_header_audit where status = 'MISSING';
--
-- Then import the six production CSVs in Table Editor.
-- Extra DB columns import_id / imported_at are filled by defaults and must NOT
-- appear in the CSV headers.
