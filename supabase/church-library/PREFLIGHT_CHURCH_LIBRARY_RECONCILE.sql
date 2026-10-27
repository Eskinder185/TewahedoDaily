-- ============================================================================
-- TEWAHEDODAILY: PREFLIGHT SCHEMA & DATA AUDIT (READ-ONLY)
-- File: supabase/church-library/PREFLIGHT_CHURCH_LIBRARY_RECONCILE.sql
--
-- Purely read-only diagnostic queries. Does not modify or lock any data.
-- Run in Supabase SQL Editor before applying 20261026160000_reconcile_church_library_schema.sql.
-- ============================================================================

-- 1. Inspect existing 4 books (verifying IDs, draft status, and lack of storage_path)
SELECT
    id,
    title,
    author,
    language,
    category,
    COALESCE(ingestion_status, 'pending') AS ingestion_status,
    COALESCE(search_enabled, false) AS search_enabled,
    storage_path,
    created_at,
    updated_at
FROM public.church_library_books
ORDER BY created_at ASC;

-- 2. Check total count of books and passages currently in database
SELECT 
    (SELECT count(*) FROM public.church_library_books) AS total_books,
    (SELECT count(*) FROM public.church_library_passages) AS total_passages;

-- 3. Check existing columns on public.church_library_books
SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'church_library_books'
ORDER BY ordinal_position;

-- 4. Check existing columns on public.church_library_passages
SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'church_library_passages'
ORDER BY ordinal_position;

-- 5. Check if version-tracking and section tables or views already exist
SELECT
    table_name,
    table_type
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name IN (
    'church_library_books',
    'church_library_book_versions',
    'church_library_versions',
    'church_library_sections',
    'church_library_passages'
  )
ORDER BY table_name;

-- 6. Check helper functions & RPC status
SELECT
    p.proname AS function_name,
    pg_catalog.pg_get_function_identity_arguments(p.oid) AS arguments,
    pg_catalog.pg_get_function_result(p.oid) AS return_type,
    p.prosecdef AS is_security_definer
FROM pg_proc p
JOIN pg_namespace n ON n.oid = p.pronamespace
WHERE n.nspname = 'public'
  AND p.proname IN (
    'is_staff',
    'is_cms_staff',
    'activate_church_library_version',
    'search_church_library',
    'church_library_passage_search_document'
  )
ORDER BY p.proname;

-- 7. Check private storage bucket 'church-library-originals' configuration
SELECT
    id,
    name,
    public,
    file_size_limit,
    allowed_mime_types
FROM storage.buckets
WHERE id IN ('church-library-originals', 'church-library');

-- 8. Check active RLS policies on church_library tables
SELECT
    tablename,
    policyname,
    roles,
    cmd,
    qual
FROM pg_policies
WHERE schemaname = 'public'
  AND tablename LIKE 'church_library%'
ORDER BY tablename, policyname;
