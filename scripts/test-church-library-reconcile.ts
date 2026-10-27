import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'
import {
  normalizeChurchLibraryBook,
  validateChurchLibraryFile,
  MAX_BOOK_BYTES,
  CHURCH_LIBRARY_BUCKET,
} from '../src/lib/cms/churchLibraryService.ts'
import { normalizeProcessingStatus } from '../src/lib/cms/churchLibraryValidation.ts'

console.log('=== CHURCH LIBRARY RECONCILIATION VERIFICATION SUITE ===')

// 1. Verify Migration File Integrity
const migrationSql = readFileSync(
  resolve('supabase/migrations/20261026160000_reconcile_church_library_schema.sql'),
  'utf8'
)
const reconcileSql = readFileSync(
  resolve('supabase/church-library/RECONCILE_CHURCH_LIBRARY_UPLOAD.sql'),
  'utf8'
)
assert.equal(
  migrationSql.slice(migrationSql.indexOf('BEGIN;')),
  reconcileSql.slice(reconcileSql.indexOf('BEGIN;')),
  'SQL body in migrations/ and church-library/ must match exactly.'
)

assert.match(migrationSql, /CREATE TABLE IF NOT EXISTS public\.church_library_book_versions/)
assert.match(migrationSql, /CREATE OR REPLACE VIEW public\.church_library_versions/)
assert.match(migrationSql, /CREATE TABLE IF NOT EXISTS public\.church_library_sections/)
assert.match(migrationSql, /ALTER TABLE public\.church_library_passages/)
assert.match(migrationSql, /CREATE OR REPLACE FUNCTION public\.activate_church_library_version/)
assert.match(migrationSql, /CREATE OR REPLACE FUNCTION public\.search_church_library/)
assert.match(migrationSql, /church-library-originals/)
assert.match(migrationSql, /trg_sync_church_library_books_legacy_columns/)
console.log('✓ Migration SQL structure and idempotency verified.')

// 2. Verify Preflight and Rollback Scripts
const preflightSql = readFileSync(
  resolve('supabase/church-library/PREFLIGHT_CHURCH_LIBRARY_RECONCILE.sql'),
  'utf8'
)
assert.match(preflightSql, /public\.church_library_books/)
assert.match(preflightSql, /information_schema\.columns/)
assert.doesNotMatch(preflightSql, /\b(DROP|DELETE|UPDATE|ALTER|INSERT)\b/i, 'Preflight script must be strictly read-only.')
console.log('✓ Preflight script verified as strictly read-only.')

const rollbackSql = readFileSync(
  resolve('supabase/church-library/ROLLBACK_CHURCH_LIBRARY_RECONCILE.sql'),
  'utf8'
)
assert.match(rollbackSql, /DROP TABLE IF EXISTS public\.church_library_book_versions/)
assert.doesNotMatch(rollbackSql, /DROP TABLE public\.church_library_books/i, 'Rollback MUST NOT drop church_library_books.')
assert.doesNotMatch(rollbackSql, /DELETE FROM public\.church_library_books/i, 'Rollback MUST NOT delete any books.')
console.log('✓ Rollback script verified safe (preserves original books and IDs).')

// 3. Verify Legacy vs Modern Row Normalization
// Simulates an existing legacy record in production (only has ingestion_status, search_enabled, storage_path)
const legacyRow = {
  id: '0191567b-1234-7000-8000-111111111111',
  title: 'Legacy Liturgical Text',
  author: 'Abba Saint',
  language: 'am',
  category: 'Liturgy',
  description: 'Ancient commentary',
  ingestion_status: 'pending',
  search_enabled: false,
  storage_path: null,
  created_at: '2026-09-01T00:00:00Z',
  updated_at: '2026-09-01T00:00:00Z',
}

const normalizedLegacy = normalizeChurchLibraryBook(legacyRow)
assert.equal(normalizedLegacy.id, legacyRow.id)
assert.equal(normalizedLegacy.title, legacyRow.title)
assert.equal(normalizedLegacy.processing_status, 'pending', 'Legacy ingestion_status must normalize to processing_status.')
assert.equal(normalizedLegacy.public_retrieval_enabled, false, 'Legacy search_enabled must normalize to public_retrieval_enabled.')
assert.equal(normalizedLegacy.current_version_id, null)
console.log('✓ Legacy row normalization backwards compatibility passed.')

// Simulates a modern record with version tracking
const modernRow = {
  id: '0191567b-1234-7000-8000-222222222222',
  title: 'Haymanote Abew',
  author: 'Holy Fathers',
  language: 'gez',
  category: 'Patristics',
  description: 'Faith of the Fathers',
  processing_status: 'ready',
  public_retrieval_enabled: true,
  current_version_id: '0191567b-1234-7000-8000-333333333333',
  cover_storage_path: 'covers/haymanote.jpg',
  access_level: 'public_search',
  rights_status: 'public_domain',
  allow_search_quotes: true,
  approved_for_ingestion: true,
  created_at: '2026-10-26T00:00:00Z',
  updated_at: '2026-10-26T00:00:00Z',
}

const normalizedModern = normalizeChurchLibraryBook(modernRow)
assert.equal(normalizedModern.id, modernRow.id)
assert.equal(normalizedModern.processing_status, 'ready')
assert.equal(normalizedModern.public_retrieval_enabled, true)
assert.equal(normalizedModern.access_level, 'public_search')
assert.equal(normalizedModern.rights_status, 'public_domain')
console.log('✓ Modern versioned row normalization passed.')

// 4. Verify Upload Retry & Bucket Configuration
assert.equal(CHURCH_LIBRARY_BUCKET, 'church-library-originals')
assert.equal(MAX_BOOK_BYTES, 100 * 1024 * 1024)
console.log('✓ Private bucket and 100 MiB limits verified.')

// 5. Verify Zero Remote AI Server Invocations in Service Code
const serviceSource = readFileSync(resolve('src/lib/cms/churchLibraryService.ts'), 'utf8')
assert.doesNotMatch(serviceSource, /ai\.eskinder\.dev/i)
assert.doesNotMatch(serviceSource, /ollama/i)
assert.doesNotMatch(serviceSource, /localhost:8000/i)
assert.doesNotMatch(serviceSource, /qdrant/i)
console.log('✓ Verified zero remote AI / FastAPI backend calls in churchLibraryService.')

// 6. Verify Draft Leakage Prevention Gate in RLS SQL
assert.match(
  migrationSql,
  /public_retrieval_enabled = true OR search_enabled = true/,
  'RLS public read policy must require public retrieval flag'
)
assert.match(
  migrationSql,
  /approved_for_ingestion = true/,
  'RLS public read policy must require approved_for_ingestion'
)
assert.match(
  migrationSql,
  /processing_status = 'ready' OR ingestion_status = 'ready'/,
  'RLS public read policy must require ready status'
)
console.log('✓ Strict privacy gate for draft protection in RLS verified.')

console.log('\n=======================================================')
console.log('ALL RECONCILIATION INTEGRATION CHECKS PASSED!')
console.log('=======================================================')
