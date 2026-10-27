-- Read-only export. Run as an authorized database administrator; this file contains no writes.
select
  m.import_id,
  m.mezmur_id,
  m.slug,
  m.title,
  m.title_amharic,
  m.title_english,
  m.youtube_url,
  m.status,
  m.updated_at,
  m.deleted_at,
  md5(lower(regexp_replace(coalesce(m.title_amharic, m.title, ''), '\s+', ' ', 'g'))) as title_fingerprint,
  md5(lower(regexp_replace(concat_ws(E'\n', m.lyrics_amharic, m.lyrics_geez, m.lyrics_english, m.lyrics_oromo, m.lyrics_transliteration), '\s+', ' ', 'g'))) as lyrics_fingerprint
from public.mezmur_data_import as m
where m.import_id is not null
order by m.import_id;
