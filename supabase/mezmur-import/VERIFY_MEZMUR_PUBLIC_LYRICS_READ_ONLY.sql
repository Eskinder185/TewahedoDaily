-- Read-only verification for public.mezmur_public and lyrics exposure.
-- Run in Supabase SQL editor as postgres, authenticated, or anon.

begin read only;

-- 1. Verify column count and exact names of public.mezmur_public (now 31 columns with has_stored_lyrics)
select
  count(*) as column_count,
  array_agg(column_name order by ordinal_position) as columns
from information_schema.columns
where table_schema = 'public' and table_name = 'mezmur_public';

-- 2. Verify security barrier is active on public.mezmur_public
select relname, reloptions
from pg_class
where relname = 'mezmur_public' and relnamespace = 'public'::regnamespace;

-- 3. Check rights_status distribution across published rows in base table vs view
select
  status,
  rights_status,
  count(*) as row_count,
  count(lyrics_amharic) as rows_with_amharic_lyrics,
  count(lyrics_geez) as rows_with_geez_lyrics,
  count(lyrics_english) as rows_with_english_lyrics,
  count(lyrics_oromo) as rows_with_oromo_lyrics,
  count(lyrics_transliteration) as rows_with_transliteration
from public.mezmur_data_import
where deleted_at is null
group by status, rights_status
order by status, rights_status;

-- 4. Check that public view displays lyrics for authorized Mezmurs and hides for restricted
select
  rights_status,
  count(*) as view_rows,
  count(case when lyrics_amharic is not null then 1 end) as exposed_amharic_lyrics,
  count(case when lyrics_amharic is null then 1 end) as redacted_amharic_lyrics,
  count(case when has_stored_lyrics = true then 1 end) as rows_with_stored_lyrics
from public.mezmur_public
group by rights_status
order by rights_status;

-- 5. Security audit: verify that no draft rows leak into public.mezmur_public
select count(*) as leaked_draft_rows
from public.mezmur_public
where status is distinct from 'published';

-- 6. Verify anonymous and authenticated SELECT grants on public.mezmur_public
select grantee, privilege_type
from information_schema.role_table_grants
where table_schema = 'public' and table_name = 'mezmur_public';

rollback;
