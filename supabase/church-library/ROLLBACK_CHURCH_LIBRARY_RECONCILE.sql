-- ============================================================================
-- TEWAHEDODAILY: CHURCH LIBRARY SAFE ROLLBACK SCRIPT
-- File: supabase/church-library/ROLLBACK_CHURCH_LIBRARY_RECONCILE.sql
--
-- Safely rolls back version tracking, sections, views, and functions
-- WITHOUT modifying or deleting any of the existing four book records.
-- Preserves public.church_library_books and public.church_library_passages intact.
-- ============================================================================

BEGIN;

-- 1. Drop compatibility view and functions
DROP VIEW IF EXISTS public.church_library_versions CASCADE;
DROP FUNCTION IF EXISTS public.activate_church_library_version(UUID, UUID) CASCADE;
DROP FUNCTION IF EXISTS public.search_church_library(TEXT, INTEGER, TEXT, extensions.vector) CASCADE;

-- 2. Drop triggers and sync functions
DROP TRIGGER IF EXISTS trg_sync_church_library_books_legacy_columns ON public.church_library_books;
DROP FUNCTION IF EXISTS public.sync_church_library_books_legacy_columns() CASCADE;

DROP TRIGGER IF EXISTS church_library_passages_search_document ON public.church_library_passages;
DROP FUNCTION IF EXISTS public.church_library_passage_search_document() CASCADE;

-- 3. Drop foreign key constraint from church_library_books to versions table
ALTER TABLE public.church_library_books
  DROP CONSTRAINT IF EXISTS church_library_current_version_fk;

-- 4. Drop newly created sections and version-tracking tables
-- Note: church_library_books and church_library_passages are NOT dropped!
DROP TABLE IF EXISTS public.church_library_sections CASCADE;
DROP TABLE IF EXISTS public.church_library_book_versions CASCADE;

-- 5. Drop added indexes on church_library_passages and church_library_books
DROP INDEX IF EXISTS public.idx_church_library_passages_version_order;
DROP INDEX IF EXISTS public.idx_church_library_passages_book_order;
DROP INDEX IF EXISTS public.church_library_passages_search_document_gin;

-- 6. Reload schema cache
NOTIFY pgrst, 'reload schema';

COMMIT;
