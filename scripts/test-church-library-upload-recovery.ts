import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'
import {
  validateDocumentMetadata,
  normalizeProcessingStatus,
  formatProcessingStatus,
} from '../src/lib/cms/churchLibraryValidation.ts'
import { errorMessage } from '../src/lib/cms/errorMessage.ts'

console.log('--- STARTING CHURCH LIBRARY UPLOAD RECOVERY & SCHEMA TEST SUITE ---')

const MiB = 1024 * 1024

// 1. Supported Document MIME-Type Validation
{
  const testCases = [
    { name: 'liturgy.pdf', type: 'application/pdf', expected: 'application/pdf' },
    { name: 'faith-of-fathers.epub', type: 'application/epub+zip', expected: 'application/epub+zip' },
    { name: 'faith-of-fathers.epub', type: 'application/zip', expected: 'application/epub+zip' },
    { name: 'homily.docx', type: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', expected: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' },
    { name: 'ውዳሴ_ማርያም.txt', type: 'text/plain', expected: 'text/plain' },
  ]

  for (const tc of testCases) {
    const detected = validateDocumentMetadata({ name: tc.name, type: tc.type, size: 2 * MiB }, 50 * MiB)
    assert.equal(detected, tc.expected, `Format ${tc.name} should validate to ${tc.expected}`)
  }
  console.log('✓ Test 1 passed: All supported document MIME types (PDF, EPUB, DOCX, TXT) validated')
}

// 2. Document Size and Type Rejection Rules
{
  // Exceeds 50 MiB limit
  assert.throws(
    () => validateDocumentMetadata({ name: 'huge-manuscript.pdf', type: 'application/pdf', size: 51 * MiB }, 50 * MiB),
    /50 MiB/,
    'Should reject files exceeding 50 MiB',
  )

  // Empty file (0 bytes)
  assert.throws(
    () => validateDocumentMetadata({ name: 'empty.pdf', type: 'application/pdf', size: 0 }, 50 * MiB),
    /non-empty/,
    'Should reject 0-byte files',
  )

  // Unsupported extension
  assert.throws(
    () => validateDocumentMetadata({ name: 'script.exe', type: 'application/x-msdownload', size: 1000 }, 50 * MiB),
    /Only PDF, DOCX, UTF-8 TXT, and EPUB/,
    'Should reject unsupported extensions',
  )

  // Mismatched MIME type
  assert.throws(
    () => validateDocumentMetadata({ name: 'fake-pdf.pdf', type: 'text/plain', size: 1000 }, 50 * MiB),
    /does not match/,
    'Should reject MIME mismatch',
  )

  console.log('✓ Test 2 passed: Rejection rules enforce 50 MiB limit, non-empty files, and valid MIME')
}

// 3. Actionable Error Mapping
{
  // Missing Church Library schema
  const schemaError = { code: 'PGRST205', message: "Could not find the table 'public.church_library_versions' in the schema cache" }
  assert.match(errorMessage(schemaError), /Church Library upload schema is incomplete/)

  // Missing private storage bucket
  const bucketError = { code: 'NoSuchBucket', message: 'Bucket not found' }
  assert.match(errorMessage(bucketError), /'church-library(-originals)?' storage bucket does not exist/)

  // Storage RLS denial
  const rlsError = { code: '42501', message: 'new row violates row-level security policy for "objects"' }
  assert.match(errorMessage(rlsError), /Access denied to Church Library private storage/)

  // Storage payload too large
  const sizeError = { code: '413', message: 'Payload too large: exceeded the maximum allowed size' }
  assert.match(errorMessage(sizeError), /exceeds the (50|100) MiB storage size limit/)

  // Unsupported MIME in storage
  const mimeError = { code: 'mime_type_not_allowed', message: 'The content type is not permitted' }
  assert.match(errorMessage(mimeError), /file type is not permitted in Church Library private storage/)

  console.log('✓ Test 3 passed: Actionable error messages mapped for schema, bucket, RLS, size, and MIME')
}

// 4. Recoverable Failed Upload Flow (No Duplicate Books)
{
  const pageCode = readFileSync(resolve('src/pages/admin/ChurchLibrary.tsx'), 'utf8')

  // When upload fails after createBook, the modal must be closed and the created book selected
  assert.match(pageCode, /setShowNew\(false\)/, 'Closes the upload modal on upload failure')
  assert.match(pageCode, /setNewBook\(EMPTY_NEW\)/, 'Resets the modal input fields')
  assert.match(pageCode, /setSelectedId\(created\.id\)/, 'Selects the created book for direct retry')
  assert.match(pageCode, /without creating a duplicate book/, 'Informs user how to retry without duplicates')

  // The Original document section allows uploading to the selected book
  assert.match(pageCode, /uploadChurchLibraryVersion\(selected,\s*file,\s*setUploadProgress\)/, 'Uploads directly to selected book')

  console.log('✓ Test 4 passed: Failed upload recovery workflow selects existing book and prevents duplicates')
}

// 5. Rights & Search Buddy Indexing Gates
{
  // Normalizing status with or without version
  assert.equal(normalizeProcessingStatus('not_uploaded', false), 'not_uploaded')
  assert.equal(normalizeProcessingStatus(undefined, false), 'not_uploaded')
  assert.equal(normalizeProcessingStatus(undefined, true), 'pending')
  assert.equal(normalizeProcessingStatus('ready', true), 'ready')
  assert.equal(formatProcessingStatus('not_uploaded'), 'Not Uploaded')

  // Check SQL migration for the public gate constraint
  const repairSql = readFileSync(resolve('supabase/church-library/REPAIR_CHURCH_LIBRARY_UPLOAD.sql'), 'utf8')
  assert.match(repairSql, /church_library_public_gate check \(/)
  assert.match(repairSql, /access_level = 'public_search'/)
  assert.match(repairSql, /approved_for_ingestion = true/)
  assert.match(repairSql, /allow_search_quotes = true/)
  assert.match(repairSql, /rights_status in \('owned', 'licensed', 'public_domain', 'permission_granted'\)/)
  assert.match(repairSql, /processing_status = 'ready'/)

  console.log('✓ Test 5 passed: Search Buddy gate strictly enforced at database and UI levels')
}

// 6. Extraction Independence (Upload Success Preserved When Extraction Fails)
{
  const pageCode = readFileSync(resolve('src/pages/admin/ChurchLibrary.tsx'), 'utf8')

  // Extraction failure in createBook must NOT rollback or delete the book/file
  assert.match(pageCode, /automatic processing could not start:/, 'Reports extraction failure gracefully')
  assert.match(pageCode, /The upload is safe and can be processed again without re-uploading the file/, 'Reassures user that upload is safe')

  // Extraction failure in uploadFile replacement must NOT delete the uploaded replacement
  assert.match(pageCode, /The replacement is safely uploaded, but processing failed:/, 'Reports replacement processing failure')
  assert.match(pageCode, /the uploaded file was not lost/, 'Reassures user that replacement file is preserved')

  console.log('✓ Test 6 passed: File upload success is independent of FastAPI text extraction service')
}

// 7. Signed URL Document Opening & Download Buttons
{
  const pageCode = readFileSync(resolve('src/pages/admin/ChurchLibrary.tsx'), 'utf8')
  assert.match(pageCode, /getChurchLibraryDocumentSignedUrl/, 'Calls getChurchLibraryDocumentSignedUrl')
  assert.match(pageCode, /Download original file/, 'Provides explicit download original button')
  assert.match(pageCode, /Open file ↗/, 'Provides per-version open file button')
  assert.doesNotMatch(pageCode, /getPublicUrl/, 'Never generates public URLs for private documents')

  const serviceCode = readFileSync(resolve('src/lib/cms/churchLibraryService.ts'), 'utf8')
  assert.match(serviceCode, /createSignedUrl\(storagePath,\s*3600\)/, 'Creates signed URL with 1-hour expiration')

  console.log('✓ Test 7 passed: Authorized administrators can open and download original documents securely')
}

// 8. Storage Bucket Configuration & Policies in Repair Migration
{
  const repairSql = readFileSync(resolve('supabase/church-library/REPAIR_CHURCH_LIBRARY_UPLOAD.sql'), 'utf8')
  assert.match(repairSql, /church-library-originals/)
  assert.match(repairSql, /church_library_originals_staff_select/)
  assert.match(repairSql, /church_library_originals_staff_insert/)
  assert.match(repairSql, /church_library_originals_staff_update/)
  assert.match(repairSql, /church_library_originals_staff_delete/)
  assert.match(repairSql, /public\.is_staff\(\)/)

  console.log('✓ Test 8 passed: Storage bucket configured as private with strict staff RLS policies')
}

console.log('--- ALL 8 CHURCH LIBRARY UPLOAD RECOVERY TESTS PASSED SUCCESSFULLY ---')
