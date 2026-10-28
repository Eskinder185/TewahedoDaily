-- Keep Mezmur titles and lyrics as four independently stored values.
--
-- This is intentionally forward-only and does not backfill or alter any hymn
-- text. Legacy `title` remains a compatibility mirror for older clients; it
-- is not inferred from lyrics, search keywords, or any other field.
begin;

do $$
declare
  v_columns text[];
  v_expected text[] := array[
    'mezmur_id','slug','title','title_amharic','title_english','description','description_amharic',
    'lyrics_amharic','lyrics_transliteration','lyrics_english','lyrics_geez','lyrics_oromo',
    'primary_language','form','singer_id','singer_slug','singer_name','zemari_id',
    'youtube_url','audio_url','image_path','image_alt','legacy_thumbnail_url','search_keywords',
    'status','review_status','source_url','created_at','updated_at','rights_status','has_stored_lyrics'
  ];
begin
  if to_regclass('public.mezmur_data_import') is null
     or to_regclass('public.mezmur_public') is null then
    raise exception 'Mezmur title/lyrics separation requires public.mezmur_data_import and public.mezmur_public'
      using errcode = '42P01';
  end if;

  select array_agg(a.attname order by a.attnum) into v_columns
  from pg_attribute a
  where a.attrelid = 'public.mezmur_public'::regclass
    and a.attnum > 0 and not a.attisdropped;

  if v_columns is distinct from v_expected then
    raise exception 'Refusing to extend unexpected mezmur_public contract: %', v_columns
      using errcode = '55000';
  end if;
end $$;

-- Nullable by design. Existing rows keep their source values untouched; the
-- application reads the legacy `title` only as a compatibility fallback until
-- an administrator explicitly supplies a dedicated transliteration title.
alter table public.mezmur_data_import
  add column if not exists transliteration_title text;

comment on column public.mezmur_data_import.transliteration_title is
  'Latin-character Mezmur title only. Distinct from title_amharic and lyrics_transliteration.';

-- Preserve the first 31 public columns, their names, order, and expressions.
-- PostgreSQL permits a view replacement to append a new trailing column; no
-- existing public consumer needs to change its select list.
create or replace view public.mezmur_public
with (security_barrier = true)
as
select
  mezmur_id, slug, title, title_amharic, title_english, description, description_amharic,
  case when lower(trim(coalesce(rights_status, 'unknown'))) in ('external_only', 'restricted') then null else lyrics_amharic end as lyrics_amharic,
  case when lower(trim(coalesce(rights_status, 'unknown'))) in ('external_only', 'restricted') then null else lyrics_transliteration end as lyrics_transliteration,
  case when lower(trim(coalesce(rights_status, 'unknown'))) in ('external_only', 'restricted') then null else lyrics_english end as lyrics_english,
  case when lower(trim(coalesce(rights_status, 'unknown'))) in ('external_only', 'restricted') then null else lyrics_geez end as lyrics_geez,
  case when lower(trim(coalesce(rights_status, 'unknown'))) in ('external_only', 'restricted') then null else lyrics_oromo end as lyrics_oromo,
  primary_language, form, singer_id, singer_slug, singer_name, zemari_id,
  youtube_url, audio_url, image_path, image_alt, legacy_thumbnail_url, search_keywords,
  status, review_status, source_url, created_at, updated_at, rights_status,
  (nullif(trim(coalesce(lyrics_amharic, '')), '') is not null
   or nullif(trim(coalesce(lyrics_geez, '')), '') is not null
   or nullif(trim(coalesce(lyrics_english, '')), '') is not null
   or nullif(trim(coalesce(lyrics_oromo, '')), '') is not null
   or nullif(trim(coalesce(lyrics_transliteration, '')), '') is not null) as has_stored_lyrics,
  -- Trailing column only: legacy rows return NULL and the client safely falls
  -- back to the legacy title mirror for display, never to lyrics or keywords.
  transliteration_title
from public.mezmur_data_import
where deleted_at is null
  and lower(trim(coalesce(status, ''))) = 'published'
  and nullif(trim(coalesce(title, '')), '') is not null
  and nullif(trim(coalesce(slug, '')), '') is not null;

revoke all on public.mezmur_public from public;
grant select on public.mezmur_public to anon, authenticated;

-- Validate that the replacement appended exactly one compatible column.
do $$
declare
  v_columns text[];
  v_expected text[] := array[
    'mezmur_id','slug','title','title_amharic','title_english','description','description_amharic',
    'lyrics_amharic','lyrics_transliteration','lyrics_english','lyrics_geez','lyrics_oromo',
    'primary_language','form','singer_id','singer_slug','singer_name','zemari_id',
    'youtube_url','audio_url','image_path','image_alt','legacy_thumbnail_url','search_keywords',
    'status','review_status','source_url','created_at','updated_at','rights_status','has_stored_lyrics',
    'transliteration_title'
  ];
begin
  select array_agg(a.attname order by a.attnum) into v_columns
  from pg_attribute a
  where a.attrelid = 'public.mezmur_public'::regclass
    and a.attnum > 0 and not a.attisdropped;
  if v_columns is distinct from v_expected then
    raise exception 'Unexpected post-migration mezmur_public contract: %', v_columns using errcode = '55000';
  end if;
end $$;

notify pgrst, 'reload schema';
commit;
