-- PROPOSAL ONLY — not applied anywhere, not in supabase/migrations. Review, then promote with a timestamped name.
--
-- Why: the client's lyric search sends filtered `ilike` requests with `.limit(60)` and no relevance order, so on a
-- common phrase the 60 rows PostgREST returns are arbitrary and the right hymn can be cut before it is ranked.
-- Ranking in the database, over the SAME public view the site already reads, removes that truncation and lets
-- pg_trgm provide the "similar spelling" tier with an index instead of downloading every title.
--
-- Rights: the function reads public.mezmur_public (security_barrier view). Restricted/external-only lyrics are
-- already NULL there, so they can never match. Never point this at mezmur_data_import.
--
-- Rollback (see bottom): drop the function and the indexes. No data is touched.

create extension if not exists pg_trgm with schema extensions;

-- Trigram indexes live on the base table (a view cannot be indexed). Expression matches the function below.
create index if not exists mezmur_data_import_title_trgm
  on public.mezmur_data_import using gin (lower(title) extensions.gin_trgm_ops)
  where deleted_at is null and lower(trim(coalesce(status, ''))) = 'published';
create index if not exists mezmur_data_import_title_en_trgm
  on public.mezmur_data_import using gin (lower(coalesce(title_english, '')) extensions.gin_trgm_ops)
  where deleted_at is null and lower(trim(coalesce(status, ''))) = 'published';
create index if not exists mezmur_data_import_translit_lyrics_trgm
  on public.mezmur_data_import using gin (lower(coalesce(lyrics_transliteration, '')) extensions.gin_trgm_ops)
  where deleted_at is null and lower(trim(coalesce(status, ''))) = 'published';

create or replace function public.search_public_mezmur(p_query text, p_limit integer default 20)
returns table (slug text, tier text, score real)
language sql
stable
security invoker
set search_path = public, extensions
as $$
  with q as (
    select lower(trim(regexp_replace(p_query, '\s+', ' ', 'g'))) as t
  ),
  hits as (
    select
      m.slug,
      case
        when lower(m.title) = q.t or lower(coalesce(m.title_english, '')) = q.t or m.title_amharic = q.t then 'title-exact'
        when lower(m.title) like '%' || q.t || '%' or m.title_amharic like '%' || q.t || '%' then 'title-phrase'
        when lower(coalesce(m.lyrics_transliteration, '')) like '%' || q.t || '%'
          or coalesce(m.lyrics_amharic, '') like '%' || q.t || '%'
          or lower(coalesce(m.lyrics_english, '')) like '%' || q.t || '%' then 'lyric-phrase'
        when similarity(lower(m.title), q.t) >= 0.35 then 'similar-spelling'
      end as tier,
      greatest(similarity(lower(m.title), q.t), similarity(lower(coalesce(m.title_english, '')), q.t))::real as score
    from public.mezmur_public m, q
    where length(q.t) >= 2
  )
  select h.slug, h.tier, h.score
  from hits h
  where h.tier is not null
  order by case h.tier when 'title-exact' then 0 when 'title-phrase' then 1 when 'lyric-phrase' then 2 else 3 end,
           h.score desc, h.slug
  limit least(greatest(coalesce(p_limit, 20), 1), 50);
$$;

revoke all on function public.search_public_mezmur(text, integer) from public;
grant execute on function public.search_public_mezmur(text, integer) to anon, authenticated;

-- Rollback:
--   drop function if exists public.search_public_mezmur(text, integer);
--   drop index if exists public.mezmur_data_import_title_trgm, public.mezmur_data_import_title_en_trgm,
--                        public.mezmur_data_import_translit_lyrics_trgm;
--   (leave pg_trgm installed; other features use it)
