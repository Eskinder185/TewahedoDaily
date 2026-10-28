-- ============================================================================
-- TEWAHEDODAILY: CHURCH LIBRARY MULTILINGUAL SEARCH (PROPOSED — REVIEW FIRST)
--
-- Status: PROPOSED. Not applied to production. Review, then copy into
-- supabase/migrations/ with a fresh timestamp to deploy.
--
-- What it does (additive, idempotent, no content changes):
--   1. Adds public.church_library_search_aliases: a staff-managed vocabulary
--      that maps Amharic / Ge'ez-script / transliterated search terms to
--      English search terms (e.g. ሥላሴ -> trinity). Aliases are SEARCH
--      METADATA ONLY. They never alter or translate passage content.
--      Only rows with review_status = 'approved' are used by search.
--   2. Adds public.church_library_fold_text(): folds Ethiopic homophone
--      letters (ሥ/ስ, ሐ/ኀ/ሀ, ዐ/አ, ፀ/ጸ) and case so "ስላሴ" finds "ሥላሴ".
--   3. Replaces public.search_church_library() with the SAME signature and
--      return type (client and backend callers are unchanged):
--        * natural-language questions use stop-word-filtered OR matching
--          with a coverage threshold, instead of requiring every word;
--        * approved aliases expand Amharic/transliterated queries into
--          English terms, so Amharic questions reach English passages;
--        * search_language becomes a ranking preference instead of a hard
--          filter (an Amharic query no longer hides English books);
--        * candidate selection uses only the GIN-indexed tsvector
--          (the previous ILIKE '%…%' predicates forced sequential scans);
--        * every existing publication / rights / review gate is preserved
--          verbatim.
--
-- RLS: the alias table is staff-only. Anonymous visitors never read it
-- directly; it is consulted only inside the SECURITY DEFINER search RPC.
-- ============================================================================

BEGIN;

-- 1. Ethiopic + Latin folding --------------------------------------------------
CREATE OR REPLACE FUNCTION public.church_library_fold_text(input TEXT)
RETURNS TEXT
LANGUAGE sql
IMMUTABLE
PARALLEL SAFE
SET search_path = pg_catalog
AS $$
  SELECT translate(
    lower(coalesce(input, '')),
    -- ሐ-series, ኀ-series -> ሀ-series; ሠ-series -> ሰ-series; ዐ-series -> አ-series; ፀ-series -> ጸ-series
    'ሐሑሒሓሔሕሖኀኁኂኃኄኅኆሠሡሢሣሤሥሦዐዑዒዓዔዕዖፀፁፂፃፄፅፆ',
    'ሀሁሂሃሄህሆሀሁሂሃሄህሆሰሱሲሳሴስሶአኡኢኣኤእኦጸጹጺጻጼጽጾ'
  )
$$;

COMMENT ON FUNCTION public.church_library_fold_text(TEXT) IS
  'Search-only normalization: lower-case and fold Ethiopic homophone letters. Never applied to stored content.';

-- 2. Alias vocabulary ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.church_library_search_aliases (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  alias TEXT NOT NULL CHECK (nullif(btrim(alias), '') IS NOT NULL AND length(alias) <= 80),
  alias_folded TEXT GENERATED ALWAYS AS (public.church_library_fold_text(btrim(alias))) STORED,
  script TEXT NOT NULL DEFAULT 'ethiopic' CHECK (script IN ('ethiopic', 'latin')),
  topic TEXT NOT NULL CHECK (topic ~ '^[a-z0-9_]{2,60}$'),
  expansion TEXT[] NOT NULL CHECK (cardinality(expansion) BETWEEN 1 AND 8),
  review_status TEXT NOT NULL DEFAULT 'pending' CHECK (review_status IN ('pending', 'approved', 'rejected')),
  theological_note TEXT,
  source_note TEXT NOT NULL DEFAULT 'Derived search metadata; not source text.',
  created_by UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  reviewed_by UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  reviewed_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  CONSTRAINT church_library_search_aliases_unique UNIQUE (alias_folded, topic)
);

CREATE INDEX IF NOT EXISTS church_library_search_aliases_approved_idx
  ON public.church_library_search_aliases (alias_folded)
  WHERE review_status = 'approved';

COMMENT ON TABLE public.church_library_search_aliases IS
  'Staff-reviewed query-expansion vocabulary (Amharic/transliteration -> English search terms). Search metadata only; never displayed as source text.';

ALTER TABLE public.church_library_search_aliases ENABLE ROW LEVEL SECURITY;
REVOKE ALL ON public.church_library_search_aliases FROM anon, public;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.church_library_search_aliases TO authenticated;
GRANT ALL ON public.church_library_search_aliases TO service_role;

DROP POLICY IF EXISTS church_library_search_aliases_staff_all ON public.church_library_search_aliases;
CREATE POLICY church_library_search_aliases_staff_all ON public.church_library_search_aliases
  FOR ALL TO authenticated
  USING (coalesce(public.is_staff(), false))
  WITH CHECK (coalesce(public.is_staff(), false));

-- 3. Retrieval RPC (same signature/return type as 20261026160000) -------------
CREATE OR REPLACE FUNCTION public.search_church_library(
  search_query TEXT,
  result_limit INTEGER DEFAULT 8,
  search_language TEXT DEFAULT NULL,
  query_embedding extensions.vector(384) DEFAULT NULL
)
RETURNS TABLE (
  passage_id UUID,
  book_id UUID,
  title TEXT,
  author TEXT,
  language TEXT,
  excerpt TEXT,
  page_start INTEGER,
  page_end INTEGER,
  chapter_reference TEXT,
  locator_label TEXT,
  source_url TEXT,
  keyword_rank REAL,
  semantic_rank REAL
)
LANGUAGE plpgsql
STABLE
SECURITY DEFINER
SET search_path = public, extensions
AS $$
DECLARE
  q_raw TEXT := left(coalesce(search_query, ''), 500);
  q_folded TEXT := public.church_library_fold_text(left(coalesce(search_query, ''), 500));
  stop_words CONSTANT TEXT[] := ARRAY[
    -- English function words
    'a','an','and','are','as','at','be','by','can','do','does','did','for','from','how','i','in','is','it',
    'me','my','of','on','or','our','so','tell','that','the','their','them','there','these','this','those',
    'to','us','was','we','what','when','where','which','who','whom','why','will','with','you','your',
    'about','explain','explanation','please','meaning','mean','means','define','definition','describe',
    'has','have','had','he','she','his','her','him','they','its','not','any','also','very','more','into','than',
    'then','would','should','could','there','here','know','give','get',
    -- Amharic question / function words (folded spelling)
    'ምንድን','ምንድነው','ምንድር','ነው','ናቸው','ምን','ማለት','ስለ','እንዴት','ምንን','የት','ማን','ለምን','እና','ወይም',
    'ምንነት','አስረዳ','አስረዱኝ','ንገረኝ','ንገሩኝ','በቤተ','ክርስቲያን','ቤተ','ትምህርት'
  ];
  -- Words that frame the question but say little about the topic. They are
  -- dropped only when at least one more specific word remains.
  framing_words CONSTANT TEXT[] := ARRAY[
    'church','ethiopian','orthodox','tewahedo','tewahido','eotc','teach','teaches','teaching','teachings',
    'believe','believes','belief','say','says','christian','christians','faith'
  ];
  tokens TEXT[];
  core TEXT[];
  expansions TEXT[];
  q_core tsquery;
  q_alias tsquery;
  q_all tsquery;
  core_count INTEGER;
  limit_n INTEGER := greatest(1, least(coalesce(result_limit, 8), 30));
BEGIN
  IF btrim(q_raw) = '' THEN
    RETURN;
  END IF;

  -- Tokenize on anything that is not a letter/number (keeps Ethiopic words).
  SELECT coalesce(array_agg(DISTINCT t), ARRAY[]::TEXT[])
    INTO tokens
  FROM regexp_split_to_table(q_folded, '[^[:alnum:]ሀ-፿]+') AS t
  WHERE length(t) >= 2 AND NOT (t = ANY (stop_words));

  core := ARRAY(SELECT t FROM unnest(tokens) t WHERE NOT (t = ANY (framing_words)));
  IF cardinality(core) = 0 THEN
    core := tokens;
  END IF;
  -- Light English suffix stripping so 'sacraments' / 'baptized' / 'teaches'
  -- also match their other forms through prefix search. Ethiopic is untouched.
  core := ARRAY(
    SELECT DISTINCT CASE
      WHEN t ~ '^[a-z]+$' AND length(regexp_replace(t, '(ies|ing|ed|es|s|e)$', '')) >= 4
        THEN regexp_replace(t, '(ies|ing|ed|es|s|e)$', '')
      ELSE t
    END
    FROM unnest(core) t
  );
  core_count := cardinality(core);

  -- Approved alias expansion. Ethiopic aliases match as substrings (Amharic
  -- attaches prefixes such as የ-/ስለ-/በ-); Latin aliases match whole words.
  SELECT coalesce(array_agg(DISTINCT e), ARRAY[]::TEXT[])
    INTO expansions
  FROM public.church_library_search_aliases a
  CROSS JOIN LATERAL unnest(a.expansion) AS e
  WHERE a.review_status = 'approved'
    AND (
      (a.script = 'ethiopic' AND strpos(q_folded, a.alias_folded) > 0)
      OR (a.script = 'latin' AND q_folded ~ ('(^|[^[:alnum:]])' || regexp_replace(a.alias_folded, '([.^$*+?()[\]{}|\\-])', '\\\1', 'g') || '($|[^[:alnum:]])'))
    );

  SELECT string_agg(format('%s:*', quote_literal(t)), ' | ')::tsquery
    INTO q_core
  FROM unnest(core) t
  WHERE t ~ '^[[:alnum:]ሀ-፿]+$';

  SELECT string_agg(phraseto_tsquery('simple', e)::TEXT, ' | ')::tsquery
    INTO q_alias
  FROM unnest(expansions) e
  WHERE phraseto_tsquery('simple', e)::TEXT <> '';

  q_all := CASE
    WHEN q_core IS NOT NULL AND q_alias IS NOT NULL THEN q_core || q_alias
    ELSE coalesce(q_core, q_alias)
  END;

  IF q_all IS NULL THEN
    RETURN;
  END IF;

  RETURN QUERY
  WITH eligible AS (
    SELECT
      p.id, p.book_id, p.language AS p_language, p.content, p.page_start AS p_page_start,
      p.page_end AS p_page_end, p.chapter_reference AS p_chapter_reference,
      p.locator_label AS p_locator_label, p.passage_order, p.embedding, p.search_document,
      b.title AS b_title, b.author AS b_author, b.source_url AS b_source_url, b.allow_source_link
    FROM public.church_library_passages p
    JOIN public.church_library_books b ON b.id = p.book_id
    LEFT JOIN public.church_library_book_versions v ON v.id = p.version_id
    WHERE p.search_document @@ q_all
      AND (p.version_id = b.current_version_id OR (p.version_id IS NULL AND b.current_version_id IS NULL))
      AND (b.public_retrieval_enabled = true OR b.search_enabled = true)
      AND b.access_level IN ('public_search', 'public')
      AND b.approved_for_ingestion = true
      AND b.allow_search_quotes = true
      AND b.rights_status IN ('owned', 'licensed', 'public_domain', 'permission_granted')
      AND (b.processing_status = 'ready' OR b.ingestion_status = 'ready')
      AND (v.id IS NULL OR v.processing_status = 'ready')
  ),
  scored AS (
    SELECT
      e.*,
      CASE WHEN core_count = 0 THEN 0::REAL ELSE (
        SELECT count(*)::REAL FROM unnest(core) t
        WHERE e.search_document @@ format('%s:*', quote_literal(t))::tsquery
      ) / core_count END AS coverage,
      CASE WHEN q_alias IS NOT NULL AND e.search_document @@ q_alias THEN 1 ELSE 0 END AS alias_hit,
      CASE WHEN q_core IS NOT NULL THEN ts_rank_cd(e.search_document, q_core, 32) ELSE 0 END AS core_rank,
      CASE WHEN q_alias IS NOT NULL THEN ts_rank_cd(e.search_document, q_alias, 32) ELSE 0 END AS alias_rank
    FROM eligible e
  )
  , rated AS (
    SELECT
      s.id, s.book_id, s.b_title, s.b_author, s.p_language, s.content, s.p_page_start, s.p_page_end,
      s.p_chapter_reference, s.p_locator_label, s.passage_order,
      CASE WHEN s.allow_source_link AND s.b_source_url ~* '^https?://' THEN s.b_source_url ELSE NULL END AS safe_url,
      (
        s.coverage * 1.0
        + s.core_rank
        + s.alias_hit * 0.6 + s.alias_rank
        + CASE WHEN length(btrim(q_raw)) >= 4 AND strpos(lower(s.content), lower(btrim(left(q_raw, 100)))) > 0 THEN 0.5 ELSE 0 END
        + CASE WHEN EXISTS (
            SELECT 1 FROM unnest(core) t
            WHERE public.church_library_fold_text(coalesce(s.p_chapter_reference, '') || ' ' || coalesce(s.p_locator_label, '')) LIKE '%' || t || '%'
          ) THEN 0.4 ELSE 0 END
        + CASE WHEN search_language IS NOT NULL AND s.p_language = search_language THEN 0.1 ELSE 0 END
      )::REAL AS kr,
      CASE
        WHEN query_embedding IS NULL OR s.embedding IS NULL THEN 0::REAL
        ELSE (1 - (s.embedding <=> query_embedding))::REAL
      END AS sr
    FROM scored s
    -- Relevance floor: a passage must contain at least 60% of the specific
    -- query words (every word for one- or two-word queries), or match an
    -- approved alias. Weak overlaps are dropped so callers can honestly
    -- report that the library has no source evidence.
    WHERE s.alias_hit = 1
       OR s.coverage >= 0.6
  ),
  ranked AS (
    SELECT * FROM rated
    ORDER BY rated.kr + rated.sr DESC, rated.b_title, rated.passage_order
    LIMIT limit_n
  )
  SELECT
    r.id,
    r.book_id,
    r.b_title,
    r.b_author,
    r.p_language,
    -- Verbatim excerpt: short passages whole; long ones as the matching
    -- fragments (ts_headline only selects text, it never rewrites it).
    CASE
      WHEN length(r.content) <= 900 THEN r.content
      ELSE left(ts_headline('simple', r.content, q_all,
        'StartSel="", StopSel="", MaxFragments=3, MinWords=25, MaxWords=70, FragmentDelimiter=" … "'), 1200)
    END,
    r.p_page_start,
    r.p_page_end,
    r.p_chapter_reference,
    r.p_locator_label,
    r.safe_url,
    r.kr,
    r.sr
  FROM ranked r
  ORDER BY (r.kr + r.sr) DESC, r.b_title, r.passage_order;
END;
$$;

REVOKE ALL ON FUNCTION public.search_church_library(TEXT, INTEGER, TEXT, extensions.vector) FROM public;
GRANT EXECUTE ON FUNCTION public.search_church_library(TEXT, INTEGER, TEXT, extensions.vector) TO anon, authenticated, service_role;
REVOKE ALL ON FUNCTION public.church_library_fold_text(TEXT) FROM public;
GRANT EXECUTE ON FUNCTION public.church_library_fold_text(TEXT) TO authenticated, service_role;

NOTIFY pgrst, 'reload schema';

COMMIT;
