-- Speeds the existing public, server-side `bible_verses.text ILIKE '%…%'`
-- search used by Bible Search and Search Buddy. It changes neither Bible
-- content nor RLS policies. pg_trgm supports Unicode text, including Ethiopic.
--
-- Apply through the Supabase SQL Editor / reviewed migration workflow only.

create extension if not exists pg_trgm with schema extensions;

create index if not exists bible_verses_text_trgm_idx
  on public.bible_verses
  using gin (text extensions.gin_trgm_ops);
