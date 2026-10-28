-- Read-only preflight/postflight audit for 20261027140000.
-- Run in Supabase SQL Editor as an authorized administrator; no rows change.
select
  count(*) filter (where nullif(trim(coalesce(title_amharic, '')), '') is null) as missing_amharic_title,
  count(*) filter (where nullif(trim(coalesce(transliteration_title, '')), '') is null) as missing_dedicated_transliteration_title,
  count(*) filter (where nullif(trim(coalesce(lyrics_amharic, '')), '') is null) as missing_amharic_lyrics,
  count(*) filter (where nullif(trim(coalesce(lyrics_transliteration, '')), '') is null) as missing_transliterated_lyrics,
  count(*) filter (where transliteration_title ~ '[ሀ-፿]') as transliteration_title_with_ethiopic,
  count(*) filter (where lyrics_transliteration ~ '[ሀ-፿]') as transliterated_lyrics_with_ethiopic,
  count(*) filter (where import_id is null) as missing_import_id
from public.mezmur_data_import
where deleted_at is null;

select lower(trim(slug)) as normalized_slug, count(*) as records
from public.mezmur_data_import
where deleted_at is null and nullif(trim(coalesce(slug, '')), '') is not null
group by lower(trim(slug))
having count(*) > 1
order by records desc, normalized_slug;
