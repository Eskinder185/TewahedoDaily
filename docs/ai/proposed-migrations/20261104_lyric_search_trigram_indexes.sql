-- PROPOSED - NOT APPLIED. Optional performance support for Mezmur lyric search. Search WORKS without it
-- (it is bounded to <=2 filtered requests of <=60 rows); the indexes only keep the ILIKE scans fast as the
-- catalog grows. Review, apply to isolated staging first, never run EXPLAIN ANALYZE against production data you
-- are not authorised to read.
--
-- READ-ONLY CHECKS (run first; they change nothing):
--   select extname, extnamespace::regnamespace from pg_extension where extname = 'pg_trgm';
--   select indexname, indexdef from pg_indexes
--    where schemaname = 'public' and tablename in ('mezmur_data_import', 'bible_verses')
--      and indexdef ilike '%gin_trgm_ops%';
--       -- bible_verses_text_trgm_idx comes from 20261028100000_bible_verse_text_search_index.sql;
--       -- if it is missing live, apply THAT migration (it is already reviewed), not a new one.
--   explain select slug from public.mezmur_public
--    where lyrics_amharic ilike '%ሰላም ለናንተ%' limit 60;      -- plan only, no execution
--
-- Why these columns: mezmur_public is a view over mezmur_data_import; the search filters ILIKE '%term%' on the
-- title and lyric columns. A trigram GIN index on the base-table column serves the view's ILIKE (leading
-- wildcards cannot use a btree). pg_trgm handles Unicode text, including Ethiopic.
--
-- CREATE INDEX CONCURRENTLY cannot run inside a transaction block: run each statement separately.
-- Rollback for each index: DROP INDEX CONCURRENTLY IF EXISTS <name>;  (no data is touched either way).

create extension if not exists pg_trgm with schema extensions;

create index concurrently if not exists mezmur_import_title_trgm_idx
  on public.mezmur_data_import using gin (title extensions.gin_trgm_ops);
create index concurrently if not exists mezmur_import_title_amharic_trgm_idx
  on public.mezmur_data_import using gin (title_amharic extensions.gin_trgm_ops);
create index concurrently if not exists mezmur_import_lyrics_amharic_trgm_idx
  on public.mezmur_data_import using gin (lyrics_amharic extensions.gin_trgm_ops);
create index concurrently if not exists mezmur_import_lyrics_english_trgm_idx
  on public.mezmur_data_import using gin (lyrics_english extensions.gin_trgm_ops);
create index concurrently if not exists mezmur_import_lyrics_translit_trgm_idx
  on public.mezmur_data_import using gin (lyrics_transliteration extensions.gin_trgm_ops);
-- lyrics_geez / lyrics_oromo / title_english / search_keywords: add only if staging EXPLAIN shows a need.

-- NOT proposed here (needs a design decision, would change stored/derived data):
--   * a generated, normalized search column (Ethiopic variant letters folded, Latin doubled letters collapsed)
--     with its own trigram index. It would make the database prefilter variant-complete for Latin
--     transliteration; today only Ethiopic variants are covered (via '_' wildcards) and Latin variants are
--     matched in the browser/API only after the prefilter finds a candidate.
