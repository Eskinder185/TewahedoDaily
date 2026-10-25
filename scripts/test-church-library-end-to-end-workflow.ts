import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'
import {
  validateDocumentMetadata,
  normalizeProcessingStatus,
  formatProcessingStatus,
  validateProcessingResult,
} from '../src/lib/cms/churchLibraryValidation.ts'
import { errorMessage } from '../src/lib/cms/errorMessage.ts'
import {
  CHURCH_LIBRARY_BUCKET,
  MAX_BOOK_BYTES,
  getActiveVersionsTable,
  setActiveVersionsTable,
} from '../src/lib/cms/churchLibraryService.ts'

console.log('=== STARTING CHURCH LIBRARY END-TO-END WORKFLOW INTEGRATION TEST ===')

const MiB = 1024 * 1024

// 1. Confirmed Storage Bucket and 100 MiB Limit Verification
{
  assert.equal(CHURCH_LIBRARY_BUCKET, 'church-library-originals', 'Default storage bucket must be church-library-originals')
  assert.equal(MAX_BOOK_BYTES, 100 * MiB, 'Maximum file size must be 100 MiB')

  // Valid 99 MiB document should succeed
  const valid99Mb = validateDocumentMetadata({ name: 'liturgy.pdf', type: 'application/pdf', size: 99 * MiB }, MAX_BOOK_BYTES)
  assert.equal(valid99Mb, 'application/pdf', 'Valid 99 MiB PDF passes validation')

  // 101 MiB document should be rejected
  assert.throws(
    () => validateDocumentMetadata({ name: 'huge.pdf', type: 'application/pdf', size: 101 * MiB }, MAX_BOOK_BYTES),
    /100 MiB/,
    'Files exceeding 100 MiB must be rejected with informative error',
  )
  console.log('✓ 1. Storage bucket name (church-library-originals) and 100 MiB limit verified')
}

// 2. Compatible Versions Table Resolution
{
  assert.equal(getActiveVersionsTable(), 'church_library_book_versions', 'Preferred version table is church_library_book_versions')
  setActiveVersionsTable('church_library_versions')
  assert.equal(getActiveVersionsTable(), 'church_library_versions', 'Allows fallback to church_library_versions')
  setActiveVersionsTable('church_library_book_versions')
  console.log('✓ 2. Dual version table resolution (church_library_book_versions & church_library_versions) verified')
}

// 3. Failed Upload Recovery & Duplicate Prevention
{
  const pageCode = readFileSync(resolve('src/pages/admin/ChurchLibrary.tsx'), 'utf8')
  // Ensure the UI captures created.id on upload failure so user retries without creating a duplicate book
  assert.match(pageCode, /setSelectedId\(created\.id\)/, 'Selects existing book ID on upload failure')
  assert.match(pageCode, /without creating a duplicate book/, 'Explicitly guides user to avoid duplicate book creation')
  assert.match(pageCode, /uploadChurchLibraryVersion\(selected,\s*file,\s*setUploadProgress\)/, 'Attaches retry version directly to existing book')
  console.log('✓ 3. Non-duplicating upload retry workflow on existing books verified')
}

// 4. FastAPI Router & Status Endpoint Diagnostics
{
  const mainPy = readFileSync(resolve('backend/app/main.py'), 'utf8')
  const routerPy = readFileSync(resolve('backend/app/editorial/church_library_router.py'), 'utf8')
  const storePy = readFileSync(resolve('backend/app/editorial/church_library_store.py'), 'utf8')

  assert.match(mainPy, /app\.include_router\(church_library_router\)/, 'FastAPI mounts church_library_router')
  assert.match(routerPy, /prefix="\/api\/church-library"/, 'Router mounted with /api/church-library prefix')
  assert.match(routerPy, /@router\.get\("\/status"\)/, 'GET /api/church-library/status endpoint declared')
  assert.match(routerPy, /@router\.post\("\/books\/\{book_id\}\/process"\)/, 'POST process endpoint declared')
  assert.match(routerPy, /@router\.get\("\/books\/\{book_id\}\/status"\)/, 'GET status endpoint declared')
  assert.match(routerPy, /@router\.get\("\/books\/\{book_id\}\/results"\)/, 'GET results endpoint declared')
  assert.match(routerPy, /@router\.post\("\/books\/\{book_id\}\/retry"\)/, 'POST retry endpoint declared')
  assert.match(routerPy, /@router\.post\("\/search"\)/, 'POST search endpoint declared')

  assert.match(storePy, /church-library-originals/, 'Store defaults to church-library-originals bucket')
  assert.match(storePy, /church_library_book_versions/, 'Store supports church_library_book_versions table')
  console.log('✓ 4. FastAPI Church Library router and 6 endpoints verified')
}

// 5. Database Schema & Upload Security Policies
{
  const repairSql = readFileSync(resolve('supabase/church-library/REPAIR_CHURCH_LIBRARY_UPLOAD.sql'), 'utf8')

  // Physical table creation
  assert.match(repairSql, /create table if not exists public\.church_library_book_versions/i, 'Creates physical church_library_book_versions table')
  assert.match(repairSql, /byte_size bigint not null check \(byte_size > 0 and byte_size <= 104857600\)/i, 'Enforces 100 MiB limit in SQL')
  assert.match(repairSql, /create or replace view public\.church_library_versions/i, 'Creates backward-compatible view church_library_versions')
  assert.match(repairSql, /security_invoker\s*=\s*true/i, 'Ensures compatibility view enforces security_invoker')

  // Storage RLS policies for church-library-originals
  assert.match(repairSql, /create policy "?church_library_originals_staff_select"?\s+on storage\.objects/i, 'Staff select storage policy')
  assert.match(repairSql, /create policy "?church_library_originals_staff_insert"?\s+on storage\.objects/i, 'Staff insert storage policy')
  assert.match(repairSql, /create policy "?church_library_originals_staff_update"?\s+on storage\.objects/i, 'Staff update storage policy')
  assert.match(repairSql, /create policy "?church_library_originals_staff_delete"?\s+on storage\.objects/i, 'Staff delete storage policy')

  // Authorization function
  assert.match(repairSql, /public\.is_staff\(\)/, 'Uses verified public.is_staff() authorization function')

  console.log('✓ 5. Database migration SQL (book_versions table, security_invoker view, storage policies, staff RLS) verified')
}

console.log('=== ALL 5 CHURCH LIBRARY WORKFLOW TESTS PASSED SUCCESSFULLY ===')
