-- ============================================================================
-- TEWAHEDODAILY: CHURCH LIBRARY MINIMAL PRIVATE UPLOAD REPAIR
-- File: supabase/church-library/REPAIR_CHURCH_LIBRARY_UPLOAD.sql
--
-- Forward-only, additive, and idempotent repair migration.
-- Scoped strictly to private document upload, storage RLS, and version activation.
-- Preserves existing books, metadata, passages, and public storage buckets.
-- Does NOT touch or alter passage schemas or Search Buddy functions.
-- ============================================================================

BEGIN;

-- 1. Ensure public.church_library_books has current_version_id and upload metadata columns
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

-- 2. Create public.church_library_book_versions table (100 MiB limit)
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

-- Index for efficient lookup by book_id
CREATE INDEX IF NOT EXISTS idx_church_library_book_versions_book_id
    ON public.church_library_book_versions(book_id, version_number DESC);

-- Foreign key link from church_library_books.current_version_id to versions
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

-- 3. Compatibility View: public.church_library_versions
-- Using WITH (security_invoker = true) so callers cannot bypass base table RLS
CREATE OR REPLACE VIEW public.church_library_versions
WITH (security_invoker = true)
AS
    SELECT * FROM public.church_library_book_versions;

-- 4. Enable Row Level Security (RLS)
ALTER TABLE public.church_library_book_versions ENABLE ROW LEVEL SECURITY;

-- 5. RLS Policies on public.church_library_book_versions using public.is_staff()
DROP POLICY IF EXISTS church_library_book_versions_staff_select ON public.church_library_book_versions;
CREATE POLICY church_library_book_versions_staff_select
    ON public.church_library_book_versions
    FOR SELECT
    TO authenticated
    USING (coalesce(public.is_staff(), false));

DROP POLICY IF EXISTS church_library_book_versions_staff_insert ON public.church_library_book_versions;
CREATE POLICY church_library_book_versions_staff_insert
    ON public.church_library_book_versions
    FOR INSERT
    TO authenticated
    WITH CHECK (coalesce(public.is_staff(), false));

DROP POLICY IF EXISTS church_library_book_versions_staff_update ON public.church_library_book_versions;
CREATE POLICY church_library_book_versions_staff_update
    ON public.church_library_book_versions
    FOR UPDATE
    TO authenticated
    USING (coalesce(public.is_staff(), false))
    WITH CHECK (coalesce(public.is_staff(), false));

DROP POLICY IF EXISTS church_library_book_versions_staff_delete ON public.church_library_book_versions;
CREATE POLICY church_library_book_versions_staff_delete
    ON public.church_library_book_versions
    FOR DELETE
    TO authenticated
    USING (coalesce(public.is_staff(), false));

-- Grants
REVOKE ALL ON public.church_library_book_versions FROM anon, public;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.church_library_book_versions TO authenticated;
GRANT ALL ON public.church_library_book_versions TO service_role;

REVOKE ALL ON public.church_library_versions FROM anon, public;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.church_library_versions TO authenticated;
GRANT ALL ON public.church_library_versions TO service_role;

-- 6. RPC: activate_church_library_version
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
BEGIN
    IF NOT coalesce(public.is_staff(), false) THEN
        RAISE EXCEPTION 'Church Library staff role required' USING ERRCODE = '42501';
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM public.church_library_book_versions
        WHERE id = target_version_id AND book_id = target_book_id
    ) THEN
        RAISE EXCEPTION 'The selected file version does not belong to this book' USING ERRCODE = '23503';
    END IF;

    UPDATE public.church_library_books
    SET current_version_id = target_version_id,
        processing_status = 'pending',
        extraction_quality = 'not_checked',
        extraction_notes = NULL,
        public_retrieval_enabled = false,
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

-- 7. Secure Storage Policies on existing private bucket 'church-library-originals'
DROP POLICY IF EXISTS "church_library_originals_staff_select" ON storage.objects;
CREATE POLICY "church_library_originals_staff_select"
    ON storage.objects
    FOR SELECT
    TO authenticated
    USING (
        bucket_id = 'church-library-originals'
        AND coalesce(public.is_staff(), false)
    );

DROP POLICY IF EXISTS "church_library_originals_staff_insert" ON storage.objects;
CREATE POLICY "church_library_originals_staff_insert"
    ON storage.objects
    FOR INSERT
    TO authenticated
    WITH CHECK (
        bucket_id = 'church-library-originals'
        AND coalesce(public.is_staff(), false)
    );

DROP POLICY IF EXISTS "church_library_originals_staff_update" ON storage.objects;
CREATE POLICY "church_library_originals_staff_update"
    ON storage.objects
    FOR UPDATE
    TO authenticated
    USING (
        bucket_id = 'church-library-originals'
        AND coalesce(public.is_staff(), false)
    )
    WITH CHECK (
        bucket_id = 'church-library-originals'
        AND coalesce(public.is_staff(), false)
    );

DROP POLICY IF EXISTS "church_library_originals_staff_delete" ON storage.objects;
CREATE POLICY "church_library_originals_staff_delete"
    ON storage.objects
    FOR DELETE
    TO authenticated
    USING (
        bucket_id = 'church-library-originals'
        AND coalesce(public.is_staff(), false)
    );

NOTIFY pgrst, 'reload schema';

COMMIT;
