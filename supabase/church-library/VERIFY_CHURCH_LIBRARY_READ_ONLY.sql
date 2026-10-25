-- ============================================================================
-- TEWAHEDODAILY: READ-ONLY VERIFICATION OF CHURCH LIBRARY UPLOAD SCHEMA
-- File: supabase/church-library/VERIFY_CHURCH_LIBRARY_READ_ONLY.sql
-- Run in Supabase SQL Editor to verify database state without modifying anything.
-- ============================================================================

-- 1. Verify church_library_books columns and types
SELECT 
    column_name, 
    data_type, 
    is_nullable, 
    column_default
FROM information_schema.columns
WHERE table_schema = 'public' 
  AND table_name = 'church_library_books'
ORDER BY ordinal_position;

-- 2. Verify church_library_book_versions columns and types
SELECT 
    column_name, 
    data_type, 
    is_nullable, 
    column_default
FROM information_schema.columns
WHERE table_schema = 'public' 
  AND table_name = 'church_library_book_versions'
ORDER BY ordinal_position;

-- 3. Verify church_library_versions view existence and security_invoker setting
SELECT 
    v.table_name,
    v.view_definition,
    pg_views.security_invoker
FROM information_schema.views v
JOIN pg_views ON v.table_name = pg_views.viewname AND pg_views.schemaname = 'public'
WHERE v.table_schema = 'public' 
  AND v.table_name = 'church_library_versions';

-- 4. Verify RLS is enabled on church_library_book_versions
SELECT 
    tablename, 
    rowsecurity 
FROM pg_tables 
WHERE schemaname = 'public' 
  AND tablename IN ('church_library_books', 'church_library_book_versions');

-- 5. Verify RLS policies on church_library_book_versions
SELECT 
    policyname, 
    permissive, 
    roles, 
    cmd, 
    qual, 
    with_check
FROM pg_policies
WHERE schemaname = 'public' 
  AND tablename = 'church_library_book_versions';

-- 6. Verify Storage RLS policies for bucket church-library-originals
SELECT 
    policyname, 
    roles, 
    cmd, 
    qual, 
    with_check
FROM pg_policies
WHERE schemaname = 'storage' 
  AND tablename = 'objects'
  AND policyname LIKE '%church_library_originals%';

-- 7. Verify is_staff() function existence and signature
SELECT 
    p.proname, 
    pg_catalog.pg_get_function_identity_arguments(p.oid) AS args,
    pg_catalog.pg_get_function_result(p.oid) AS result_type,
    p.prosecdef AS is_security_definer
FROM pg_proc p
JOIN pg_namespace n ON n.oid = p.pronamespace
WHERE n.nspname = 'public' 
  AND p.proname IN ('is_staff', 'is_cms_staff', 'activate_church_library_version', 'search_church_library');

-- 8. Verify bucket configuration in storage.buckets
SELECT 
    id, 
    name, 
    public, 
    file_size_limit, 
    allowed_mime_types
FROM storage.buckets
WHERE id = 'church-library-originals';
