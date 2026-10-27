-- ============================================================================
-- TEWAHEDODAILY: CHURCH LIBRARY RECONCILED SCHEMA MIGRATION
-- Migration: 20261026160000_reconcile_church_library_schema.sql
--
-- Forward-only, additive, and idempotent repair migration.
-- Scoped strictly to private document upload, storage RLS, and version activation.
-- Preserves all four existing book IDs, metadata, and draft status.
-- Preserves existing passages without breaking schema constraints.
-- Reuses existing private bucket 'church-library-originals'.
-- Synchronizes legacy columns (ingestion_status, search_enabled, storage_path)
-- with modern columns (processing_status, public_retrieval_enabled, current_version_id).
-- ============================================================================

BEGIN;

CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA extensions;

-- 1. Ensure public.church_library_books has all required columns
ALTER TABLE public.church_library_books
  ADD COLUMN IF NOT EXISTS current_version_id UUID,
  ADD COLUMN IF NOT EXISTS cover_storage_path TEXT,
  ADD COLUMN IF NOT EXISTS original_publication_info TEXT,
  ADD COLUMN IF NOT EXISTS source_url TEXT,
  ADD COLUMN IF NOT EXISTS access_level TEXT NOT NULL DEFAULT 'private',
  ADD COLUMN IF NOT EXISTS rights_status TEXT NOT NULL DEFAULT 'unknown',
  ADD COLUMN IF NOT EXISTS rights_notes TEXT,
  ADD COLUMN IF NOT EXISTS allow_search_quotes BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS allow_source_link BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS approved_for_ingestion BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS public_retrieval_enabled BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS processing_status TEXT NOT NULL DEFAULT 'not_uploaded',
  ADD COLUMN IF NOT EXISTS extraction_quality TEXT NOT NULL DEFAULT 'not_checked',
  ADD COLUMN IF NOT EXISTS extraction_notes TEXT;

-- 2. Backfill existing books to reconcile legacy and new column states
-- Preserves original four book records exactly as drafts.
UPDATE public.church_library_books
SET processing_status = COALESCE(NULLIF(processing_status, 'not_uploaded'), ingestion_status, 'pending'),
    public_retrieval_enabled = COALESCE(public_retrieval_enabled, search_enabled, false)
WHERE processing_status = 'not_uploaded' AND ingestion_status IS NOT NULL;

-- 3. Trigger to maintain bidirectional sync between legacy and new columns
CREATE OR REPLACE FUNCTION public.sync_church_library_books_legacy_columns()
RETURNS trigger
LANGUAGE plpgsql
SECURITY INVOKER
AS $$
BEGIN
  IF NEW.processing_status IS NOT NULL THEN
    NEW.ingestion_status := NEW.processing_status;
  ELSIF NEW.ingestion_status IS NOT NULL THEN
    NEW.processing_status := NEW.ingestion_status;
  END IF;

  IF NEW.public_retrieval_enabled IS NOT NULL THEN
    NEW.search_enabled := NEW.public_retrieval_enabled;
  ELSIF NEW.search_enabled IS NOT NULL THEN
    NEW.public_retrieval_enabled := NEW.search_enabled;
  END IF;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_sync_church_library_books_legacy_columns ON public.church_library_books;
CREATE TRIGGER trg_sync_church_library_books_legacy_columns
BEFORE INSERT OR UPDATE ON public.church_library_books
FOR EACH ROW
EXECUTE FUNCTION public.sync_church_library_books_legacy_columns();

-- 4. Create public.church_library_book_versions table (100 MiB limit)
CREATE TABLE IF NOT EXISTS public.church_library_book_versions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  book_id UUID NOT NULL REFERENCES public.church_library_books(id) ON DELETE CASCADE,
  version_number INTEGER NOT NULL CHECK (version_number > 0),
  original_file_name TEXT NOT NULL,
  source_storage_path TEXT NOT NULL,
  mime_type TEXT NOT NULL,
  byte_size BIGINT NOT NULL CHECK (byte_size > 0 AND byte_size <= 104857600),
  sha256 TEXT,
  processing_status TEXT NOT NULL DEFAULT 'pending'
    CHECK (processing_status IN ('pending', 'processing', 'ready', 'needs_ocr', 'failed')),
  extraction_quality TEXT NOT NULL DEFAULT 'not_checked'
    CHECK (extraction_quality IN ('not_checked', 'good', 'partial', 'uncertain', 'unreadable')),
  extraction_notes TEXT,
  error_code TEXT,
  error_message TEXT,
  page_count INTEGER CHECK (page_count IS NULL OR page_count >= 0),
  section_count INTEGER NOT NULL DEFAULT 0 CHECK (section_count >= 0),
  passage_count INTEGER NOT NULL DEFAULT 0 CHECK (passage_count >= 0),
  processed_at TIMESTAMPTZ,
  created_by UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  CONSTRAINT church_library_book_versions_unique_book_version UNIQUE (book_id, version_number),
  CONSTRAINT church_library_book_versions_unique_storage_path UNIQUE (source_storage_path)
);

CREATE INDEX IF NOT EXISTS idx_church_library_book_versions_book_id
  ON public.church_library_book_versions(book_id, version_number DESC);

-- 5. Foreign key link from church_library_books.current_version_id to versions
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint
    WHERE conrelid = 'public.church_library_books'::regclass
      AND conname = 'church_library_current_version_fk'
  ) THEN
    ALTER TABLE public.church_library_books
      ADD CONSTRAINT church_library_current_version_fk
      FOREIGN KEY (current_version_id)
      REFERENCES public.church_library_book_versions(id)
      ON DELETE SET NULL;
  END IF;
END $$;

-- 6. Compatibility View: public.church_library_versions
CREATE OR REPLACE VIEW public.church_library_versions
WITH (security_invoker = true)
AS
  SELECT * FROM public.church_library_book_versions;

-- 7. Create public.church_library_sections table
CREATE TABLE IF NOT EXISTS public.church_library_sections (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  book_id UUID NOT NULL REFERENCES public.church_library_books(id) ON DELETE CASCADE,
  version_id UUID NOT NULL REFERENCES public.church_library_book_versions(id) ON DELETE CASCADE,
  section_order INTEGER NOT NULL CHECK (section_order >= 0),
  title TEXT,
  chapter_reference TEXT,
  page_start INTEGER CHECK (page_start IS NULL OR page_start > 0),
  page_end INTEGER CHECK (page_end IS NULL OR page_end >= page_start),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (version_id, section_order)
);

CREATE INDEX IF NOT EXISTS idx_church_library_sections_book_version
  ON public.church_library_sections(book_id, version_id, section_order);

-- 8. Reconcile public.church_library_passages
-- Ensures existing unversioned passages are preserved and new versioned passages work seamlessly
CREATE TABLE IF NOT EXISTS public.church_library_passages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  book_id UUID NOT NULL REFERENCES public.church_library_books(id) ON DELETE CASCADE,
  passage_order INTEGER NOT NULL CHECK (passage_order >= 0),
  language TEXT NOT NULL DEFAULT 'en'
    CHECK (language IN ('en', 'am', 'gez', 'mixed', 'other')),
  content TEXT NOT NULL CHECK (nullif(btrim(content), '') is not null),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE public.church_library_passages
  ADD COLUMN IF NOT EXISTS version_id UUID REFERENCES public.church_library_book_versions(id) ON DELETE CASCADE,
  ADD COLUMN IF NOT EXISTS section_id UUID REFERENCES public.church_library_sections(id) ON DELETE SET NULL,
  ADD COLUMN IF NOT EXISTS page_start INTEGER CHECK (page_start IS NULL OR page_start > 0),
  ADD COLUMN IF NOT EXISTS page_end INTEGER CHECK (page_end IS NULL OR page_end >= page_start),
  ADD COLUMN IF NOT EXISTS chapter_reference TEXT,
  ADD COLUMN IF NOT EXISTS locator_label TEXT,
  ADD COLUMN IF NOT EXISTS extraction_confidence REAL CHECK (extraction_confidence IS NULL OR extraction_confidence BETWEEN 0 AND 1),
  ADD COLUMN IF NOT EXISTS search_document TSVECTOR,
  ADD COLUMN IF NOT EXISTS embedding extensions.vector(384),
  ADD COLUMN IF NOT EXISTS embedding_model TEXT,
  ADD COLUMN IF NOT EXISTS review_status TEXT NOT NULL DEFAULT 'pending',
  ADD COLUMN IF NOT EXISTS reviewer_notes TEXT;

CREATE UNIQUE INDEX IF NOT EXISTS idx_church_library_passages_version_order
  ON public.church_library_passages (version_id, passage_order)
  WHERE version_id IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_church_library_passages_book_order
  ON public.church_library_passages (book_id, passage_order);

-- tsvector trigger function for automatic text search indexing
CREATE OR REPLACE FUNCTION public.church_library_passage_search_document()
RETURNS trigger
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
BEGIN
  NEW.search_document := to_tsvector('simple',
    coalesce(NEW.content, '') || ' ' ||
    coalesce(NEW.chapter_reference, '') || ' ' ||
    coalesce(NEW.locator_label, '')
  );
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS church_library_passages_search_document ON public.church_library_passages;
CREATE TRIGGER church_library_passages_search_document
BEFORE INSERT OR UPDATE OF content, chapter_reference, locator_label ON public.church_library_passages
FOR EACH ROW EXECUTE FUNCTION public.church_library_passage_search_document();

-- Backfill search_document on existing passages where missing
UPDATE public.church_library_passages
SET search_document = to_tsvector('simple', coalesce(content, ''))
WHERE search_document IS NULL;

CREATE INDEX IF NOT EXISTS church_library_passages_search_document_gin
  ON public.church_library_passages USING gin (search_document);

-- 9. Storage Configuration: private bucket 'church-library-originals'
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'church-library-originals', 'church-library-originals', false, 104857600,
  ARRAY[
    'application/pdf',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'text/plain',
    'application/epub+zip',
    'image/jpeg',
    'image/png',
    'image/webp'
  ]
)
ON CONFLICT (id) DO UPDATE SET
  public = false,
  file_size_limit = 104857600,
  allowed_mime_types = EXCLUDED.allowed_mime_types;

-- Storage RLS on storage.objects for 'church-library-originals'
DROP POLICY IF EXISTS "church_library_originals_staff_select" ON storage.objects;
CREATE POLICY "church_library_originals_staff_select"
  ON storage.objects FOR SELECT TO authenticated
  USING (bucket_id = 'church-library-originals' AND coalesce(public.is_staff(), false));

DROP POLICY IF EXISTS "church_library_originals_staff_insert" ON storage.objects;
CREATE POLICY "church_library_originals_staff_insert"
  ON storage.objects FOR INSERT TO authenticated
  WITH CHECK (bucket_id = 'church-library-originals' AND coalesce(public.is_staff(), false));

DROP POLICY IF EXISTS "church_library_originals_staff_update" ON storage.objects;
CREATE POLICY "church_library_originals_staff_update"
  ON storage.objects FOR UPDATE TO authenticated
  USING (bucket_id = 'church-library-originals' AND coalesce(public.is_staff(), false))
  WITH CHECK (bucket_id = 'church-library-originals' AND coalesce(public.is_staff(), false));

DROP POLICY IF EXISTS "church_library_originals_staff_delete" ON storage.objects;
CREATE POLICY "church_library_originals_staff_delete"
  ON storage.objects FOR DELETE TO authenticated
  USING (bucket_id = 'church-library-originals' AND coalesce(public.is_staff(), false));

-- 10. Table Row Level Security (RLS) & Role Grants
ALTER TABLE public.church_library_books ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.church_library_book_versions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.church_library_sections ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.church_library_passages ENABLE ROW LEVEL SECURITY;

-- Grants
GRANT SELECT, INSERT, UPDATE, DELETE ON public.church_library_books TO authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.church_library_book_versions TO authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.church_library_versions TO authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.church_library_sections TO authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.church_library_passages TO authenticated;

GRANT SELECT ON public.church_library_books TO anon;
GRANT SELECT ON public.church_library_sections TO anon;
GRANT SELECT ON public.church_library_passages TO anon;

REVOKE ALL ON public.church_library_book_versions FROM anon, public;
REVOKE ALL ON public.church_library_versions FROM anon, public;

GRANT ALL ON public.church_library_books TO service_role;
GRANT ALL ON public.church_library_book_versions TO service_role;
GRANT ALL ON public.church_library_versions TO service_role;
GRANT ALL ON public.church_library_sections TO service_role;
GRANT ALL ON public.church_library_passages TO service_role;

-- Staff RLS Policies
DROP POLICY IF EXISTS church_library_books_staff_all ON public.church_library_books;
CREATE POLICY church_library_books_staff_all ON public.church_library_books
  FOR ALL TO authenticated
  USING (coalesce(public.is_staff(), false))
  WITH CHECK (coalesce(public.is_staff(), false));

DROP POLICY IF EXISTS church_library_book_versions_staff_all ON public.church_library_book_versions;
CREATE POLICY church_library_book_versions_staff_all ON public.church_library_book_versions
  FOR ALL TO authenticated
  USING (coalesce(public.is_staff(), false))
  WITH CHECK (coalesce(public.is_staff(), false));

DROP POLICY IF EXISTS church_library_sections_staff_all ON public.church_library_sections;
CREATE POLICY church_library_sections_staff_all ON public.church_library_sections
  FOR ALL TO authenticated
  USING (coalesce(public.is_staff(), false))
  WITH CHECK (coalesce(public.is_staff(), false));

DROP POLICY IF EXISTS church_library_passages_staff_all ON public.church_library_passages;
CREATE POLICY church_library_passages_staff_all ON public.church_library_passages
  FOR ALL TO authenticated
  USING (coalesce(public.is_staff(), false))
  WITH CHECK (coalesce(public.is_staff(), false));

-- Public Read Policies for Visitors
-- Strict gate: Drafts, unapproved books, and private access books are strictly blocked from anonymous read
DROP POLICY IF EXISTS church_library_books_public_read ON public.church_library_books;
CREATE POLICY church_library_books_public_read ON public.church_library_books
  FOR SELECT TO anon, authenticated
  USING (
    (public_retrieval_enabled = true OR search_enabled = true)
    AND access_level IN ('public_search', 'public')
    AND approved_for_ingestion = true
    AND (processing_status = 'ready' OR ingestion_status = 'ready')
  );

DROP POLICY IF EXISTS church_library_sections_public_read ON public.church_library_sections;
CREATE POLICY church_library_sections_public_read ON public.church_library_sections
  FOR SELECT TO anon, authenticated
  USING (
    EXISTS (
      SELECT 1 FROM public.church_library_books b
      WHERE b.id = church_library_sections.book_id
        AND (b.public_retrieval_enabled = true OR b.search_enabled = true)
        AND b.access_level IN ('public_search', 'public')
        AND b.approved_for_ingestion = true
        AND (b.processing_status = 'ready' OR b.ingestion_status = 'ready')
    )
  );

DROP POLICY IF EXISTS church_library_passages_public_read ON public.church_library_passages;
CREATE POLICY church_library_passages_public_read ON public.church_library_passages
  FOR SELECT TO anon, authenticated
  USING (
    EXISTS (
      SELECT 1 FROM public.church_library_books b
      WHERE b.id = church_library_passages.book_id
        AND (b.public_retrieval_enabled = true OR b.search_enabled = true)
        AND b.access_level IN ('public_search', 'public')
        AND b.approved_for_ingestion = true
        AND (b.processing_status = 'ready' OR b.ingestion_status = 'ready')
    )
  );

-- 11. RPC: activate_church_library_version
CREATE OR REPLACE FUNCTION public.activate_church_library_version(
  target_book_id UUID,
  target_version_id UUID
)
RETURNS public.church_library_books
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  result public.church_library_books;
  v_storage_path text;
BEGIN
  IF NOT coalesce(public.is_staff(), false) THEN
    RAISE EXCEPTION 'Church Library staff role required' USING ERRCODE = '42501';
  END IF;

  SELECT source_storage_path INTO v_storage_path
  FROM public.church_library_book_versions
  WHERE id = target_version_id AND book_id = target_book_id;

  IF v_storage_path IS NULL THEN
    RAISE EXCEPTION 'The selected file version does not belong to this book' USING ERRCODE = '23503';
  END IF;

  UPDATE public.church_library_books
  SET current_version_id = target_version_id,
      processing_status = 'pending',
      ingestion_status = 'pending',
      extraction_quality = 'not_checked',
      extraction_notes = NULL,
      public_retrieval_enabled = false,
      search_enabled = false,
      storage_path = v_storage_path,
      updated_at = now()
  WHERE id = target_book_id
  RETURNING * INTO result;

  IF result.id IS NULL THEN
    RAISE EXCEPTION 'Church Library book not found' USING ERRCODE = 'P0002';
  END IF;

  RETURN result;
END;
$$;

REVOKE ALL ON FUNCTION public.activate_church_library_version(UUID, UUID) FROM anon, public;
GRANT EXECUTE ON FUNCTION public.activate_church_library_version(UUID, UUID) TO authenticated, service_role;

-- 12. RPC: search_church_library
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
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public, extensions
AS $$
  WITH eligible AS (
    SELECT
      p.*,
      b.title,
      b.author,
      b.source_url,
      b.allow_source_link,
      (
        ts_rank_cd(p.search_document, websearch_to_tsquery('simple', left(search_query, 500)))
        + CASE WHEN p.content ILIKE '%' || btrim(left(search_query, 100)) || '%' THEN 0.5::REAL ELSE 0::REAL END
        + CASE WHEN b.title ILIKE '%' || btrim(left(search_query, 100)) || '%' THEN 0.8::REAL ELSE 0::REAL END
      ) AS kr,
      CASE
        WHEN query_embedding IS NULL OR p.embedding IS NULL THEN 0::REAL
        ELSE (1 - (p.embedding <=> query_embedding))::REAL
      END AS sr
    FROM public.church_library_passages p
    JOIN public.church_library_books b ON b.id = p.book_id
    LEFT JOIN public.church_library_book_versions v ON v.id = p.version_id
    WHERE (p.version_id = b.current_version_id OR (p.version_id IS NULL AND b.current_version_id IS NULL))
      AND (b.public_retrieval_enabled = true OR b.search_enabled = true)
      AND b.access_level IN ('public_search', 'public')
      AND b.approved_for_ingestion = true
      AND b.allow_search_quotes = true
      AND b.rights_status IN ('owned', 'licensed', 'public_domain', 'permission_granted')
      AND (b.processing_status = 'ready' OR b.ingestion_status = 'ready')
      AND (v.id IS NULL OR v.processing_status = 'ready')
      AND (search_language IS NULL OR p.language = search_language OR p.language = 'mixed')
      AND (
        p.search_document @@ websearch_to_tsquery('simple', left(search_query, 500))
        OR p.content ILIKE '%' || btrim(left(search_query, 100)) || '%'
        OR b.title ILIKE '%' || btrim(left(search_query, 100)) || '%'
      )
  )
  SELECT
    id,
    book_id,
    title,
    author,
    language,
    left(content, 900),
    page_start,
    page_end,
    chapter_reference,
    locator_label,
    CASE WHEN allow_source_link AND source_url ~* '^https?://' THEN source_url ELSE NULL END,
    kr,
    sr
  FROM eligible
  ORDER BY (kr + sr) DESC, title, passage_order
  LIMIT greatest(1, least(coalesce(result_limit, 8), 30));
$$;

REVOKE ALL ON FUNCTION public.search_church_library(TEXT, INTEGER, TEXT, extensions.vector) FROM public;
GRANT EXECUTE ON FUNCTION public.search_church_library(TEXT, INTEGER, TEXT, extensions.vector) TO anon, authenticated, service_role;

NOTIFY pgrst, 'reload schema';

COMMIT;
