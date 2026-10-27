-- Phase 4 read-only identity export.
-- Run only from an authorized PostgreSQL administrator session.
-- No private lyrics are exported. The fingerprint is one-way and is used only
-- to distinguish duplicate/variant records during reconciliation.
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
  md5(concat_ws(chr(10), coalesce(m.lyrics_amharic, ''), coalesce(m.lyrics_transliteration, ''), coalesce(m.lyrics_english, ''), coalesce(m.lyrics_geez, ''), coalesce(m.lyrics_oromo, ''))) as lyrics_fingerprint
from public.mezmur_data_import as m
order by m.import_id;
