begin;

create extension if not exists pg_trgm with schema extensions;

create or replace function public.normalize_mezmur_search_text(value text)
returns text
language sql
immutable
parallel safe
set search_path = ''
as $$
  select trim(regexp_replace(lower(normalize(coalesce(value, ''), nfc)), '[[:space:][:punct:]፡-፨]+', ' ', 'g'))
$$;

comment on function public.normalize_mezmur_search_text(text) is
  'NFC-safe search folding for whitespace and punctuation. It does not transliterate or rewrite Ethiopic letters.';

create index if not exists mezmur_data_import_public_titles_search_idx
  on public.mezmur_data_import using gin (
    public.normalize_mezmur_search_text(concat_ws(' ', title, transliteration_title, title_amharic, title_english))
    extensions.gin_trgm_ops
  )
  where deleted_at is null and lower(trim(coalesce(status, ''))) = 'published';

create index if not exists mezmur_data_import_public_lyrics_search_idx
  on public.mezmur_data_import using gin (
    public.normalize_mezmur_search_text(concat_ws(' ', lyrics_amharic, lyrics_geez, lyrics_transliteration, lyrics_english, lyrics_oromo))
    extensions.gin_trgm_ops
  )
  where deleted_at is null and lower(trim(coalesce(status, ''))) = 'published';

create index if not exists mezmur_data_import_public_metadata_search_idx
  on public.mezmur_data_import using gin (
    public.normalize_mezmur_search_text(concat_ws(' ', singer_name, search_keywords))
    extensions.gin_trgm_ops
  )
  where deleted_at is null and lower(trim(coalesce(status, ''))) = 'published';

create index if not exists mezmur_category_links_public_search_idx
  on public.mezmur_category_links_import (category_slug, mezmur_import_id);

create index if not exists mezmur_occasion_links_public_search_idx
  on public.mezmur_occasion_links_import (occasion_slug, mezmur_import_id);

create or replace function public.search_public_mezmur_ranked(
  p_query text,
  p_page integer default 1,
  p_page_size integer default 24,
  p_language text default null,
  p_form text default null
)
returns table (
  mezmur_id uuid,
  slug text,
  title text,
  transliteration_title text,
  title_amharic text,
  title_english text,
  primary_language text,
  form text,
  singer_name text,
  youtube_url text,
  audio_url text,
  image_path text,
  legacy_thumbnail_url text,
  match_field text,
  match_preview text,
  total_count bigint
)
language sql
stable
security invoker
set search_path = ''
as $$
  with input as (
    select
      public.normalize_mezmur_search_text(left(p_query, 200)) as q,
      greatest(coalesce(p_page, 1), 1) as page_number,
      least(greatest(coalesce(p_page_size, 24), 1), 50) as page_size
  ), candidates as (
    select
      m.*,
      public.normalize_mezmur_search_text(m.title) as title_n,
      public.normalize_mezmur_search_text(m.transliteration_title) as transliteration_n,
      public.normalize_mezmur_search_text(m.title_amharic) as title_am_n,
      public.normalize_mezmur_search_text(m.title_english) as title_en_n,
      public.normalize_mezmur_search_text(m.singer_name) as singer_n,
      public.normalize_mezmur_search_text(m.search_keywords) as keywords_n,
      public.normalize_mezmur_search_text(m.lyrics_amharic) as lyrics_am_n,
      public.normalize_mezmur_search_text(m.lyrics_geez) as lyrics_geez_n,
      public.normalize_mezmur_search_text(m.lyrics_transliteration) as lyrics_transliteration_n,
      public.normalize_mezmur_search_text(m.lyrics_english) as lyrics_en_n,
      public.normalize_mezmur_search_text(m.lyrics_oromo) as lyrics_oromo_n,
      exists (
        select 1 from public.mezmur_category_links_public c
        where c.mezmur_id = m.mezmur_id
          and public.normalize_mezmur_search_text(c.category_slug) like '%' || i.q || '%'
      ) as category_match,
      exists (
        select 1 from public.mezmur_occasion_links_public o
        where o.mezmur_id = m.mezmur_id
          and public.normalize_mezmur_search_text(o.occasion_slug) like '%' || i.q || '%'
      ) as occasion_match
    from public.mezmur_public m
    cross join input i
    where i.q <> ''
      and (nullif(trim(p_language), '') is null or lower(m.primary_language) = lower(trim(p_language)))
      and (nullif(trim(p_form), '') is null or lower(m.form) = lower(trim(p_form)))
  ), ranked as (
    select
      c.*,
      case
        when c.title_n = i.q or c.transliteration_n = i.q or c.title_am_n = i.q or c.title_en_n = i.q then 0
        when c.title_n like i.q || '%' or c.title_am_n like i.q || '%' then 1
        when c.title_n like '%' || i.q || '%' or c.title_am_n like '%' || i.q || '%' then 2
        when c.transliteration_n like '%' || i.q || '%' or c.title_en_n like '%' || i.q || '%' then 3
        when c.singer_n like '%' || i.q || '%' then 4
        when c.category_match then 5
        when c.occasion_match then 6
        when c.lyrics_am_n like '%' || i.q || '%' or c.lyrics_geez_n like '%' || i.q || '%'
          or c.lyrics_transliteration_n like '%' || i.q || '%' or c.lyrics_en_n like '%' || i.q || '%'
          or c.lyrics_oromo_n like '%' || i.q || '%' then 7
        when c.keywords_n like '%' || i.q || '%' then 8
        else 99
      end as rank_tier
    from candidates c
    cross join input i
  ), labeled as (
    select
      r.*,
      case r.rank_tier
        when 0 then 'exact title'
        when 1 then 'title prefix'
        when 2 then 'title'
        when 3 then 'alternate title'
        when 4 then 'Zemari'
        when 5 then 'category'
        when 6 then 'occasion'
        when 7 then 'lyrics'
        when 8 then 'keywords'
      end as matched_field,
      case r.rank_tier
        when 7 then left(coalesce(
          nullif(r.lyrics_amharic, ''), nullif(r.lyrics_geez, ''), nullif(r.lyrics_transliteration, ''),
          nullif(r.lyrics_english, ''), nullif(r.lyrics_oromo, '')
        ), 480)
        else null
      end as matched_preview
    from ranked r
    where r.rank_tier < 99
  )
  select
    l.mezmur_id, l.slug, l.title, l.transliteration_title, l.title_amharic, l.title_english,
    l.primary_language, l.form, l.singer_name, l.youtube_url, l.audio_url,
    l.image_path, l.legacy_thumbnail_url, l.matched_field, l.matched_preview,
    count(*) over () as total_count
  from labeled l
  cross join input i
  order by l.rank_tier, length(coalesce(l.title, '')), l.title, l.slug
  limit i.page_size
  offset (i.page_number - 1) * i.page_size
$$;

revoke all on function public.search_public_mezmur_ranked(text, integer, integer, text, text) from public;
grant execute on function public.search_public_mezmur_ranked(text, integer, integer, text, text) to anon, authenticated;

notify pgrst, 'reload schema';
commit;
