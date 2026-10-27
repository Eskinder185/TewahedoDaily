-- ============================================================================
-- TEWAHEDODAILY: POST-MIGRATION VERIFICATION SCRIPT (READ-ONLY)
-- File: supabase/church-library/VERIFY_CHURCH_LIBRARY_RECONCILE.sql
--
-- Run in Supabase SQL Editor to verify database state after applying
-- 20261026160000_reconcile_church_library_schema.sql.
-- ============================================================================

-- 1. Check preservation of the 4 original books and their reconciled status
SELECT
    id,
    title,
    author,
    language,
    category,
    processing_status,
    ingestion_status,
    public_retrieval_enabled,
    search_enabled,
    current_version_id,
    storage_path,
    created_at,
    updated_at
FROM public.church_library_books
ORDER BY created_at ASC;

-- 2. Verify all columns on public.church_library_books
SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'church_library_books'
ORDER BY ordinal_position;

-- 3. Verify all columns on public.church_library_book_versions
SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'church_library_book_versions'
ORDER BY ordinal_position;

-- 4. Verify public.church_library_versions view settings
SELECT
    v.table_name,
    pg_views.security_invoker
FROM information_schema.views v
JOIN pg_views ON v.table_name = pg_views.viewname AND pg_views.schemaname = 'public'
WHERE v.table_schema = 'public'
  AND v.table_name = 'church_library_versions';

-- 5. Verify all columns on public.church_library_sections
SELECT
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'church_library_sections'
ORDER BY ordinal_position;

-- 6. Verify all columns on public.church_library_passages
SELECT
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'church_library_passages'
ORDER BY ordinal_position;

-- 7. Verify Row Level Security is enabled on all tables
SELECT
    tablename,
    rowsecurity
FROM pg_tables
WHERE schemaname = 'public'
  AND tablename IN (
    'church_library_books',
    'church_library_book_versions',
    'church_library_sections',
    'church_library_passages'
  );

-- 8. Verify RLS policies on all Church Library tables
SELECT
    tablename,
    policyname,
    roles,
    cmd,
    qual
FROM pg_policies
WHERE schemaname = 'public'
  AND tablename IN (
    'church_library_books',
    'church_library_book_versions',
    'church_library_sections',
    'church_library_passages'
  )
ORDER BY tablename, policyname;

-- 9. Verify private storage bucket and its RLS policies
SELECT
    id,
    name,
    public,
    file_size_limit,
    allowed_mime_types
FROM storage.buckets
WHERE id = 'church-library-originals';

SELECT
    policyname,
    roles,
    cmd,
    qual
FROM pg_policies
WHERE schemaname = 'storage'
  AND tablename = 'objects'
  AND policyname LIKE '%church_library_originals%';

-- 10. Verify RPC functions and security configuration
SELECT
    p.proname AS function_name,
    pg_catalog.pg_get_function_identity_arguments(p.oid) AS arguments,
    pg_catalog.pg_get_function_result(p.oid) AS return_type,
    p.prosecdef AS is_security_definer
FROM pg_proc p
JOIN pg_namespace n ON n.oid = p.pronamespace
WHERE n.nspname = 'public'
  AND p.proname IN (
    'activate_church_library_version',
    'search_church_library',
    'sync_church_library_books_legacy_columns',
    'church_library_passage_search_document'
  )
ORDER BY p.proname;
