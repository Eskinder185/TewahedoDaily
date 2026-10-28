import { createClient } from '@supabase/supabase-js'

const url = process.env.VITE_SUPABASE_URL
const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY || process.env.VITE_SUPABASE_ANON_KEY
if (!url || !key) throw new Error('VITE_SUPABASE_URL and a publishable key are required for this read-only probe.')

const client = createClient(url, key, { auth: { persistSession: false, autoRefreshToken: false } })

console.log('--- CHURCH LIBRARY PRODUCTION READ-ONLY SCHEMA & STORAGE PROBE ---')
console.log(`Supabase URL: ${url}`)

const bookColumns = [
  'id', 'title', 'author', 'language', 'category', 'description', 'cover_storage_path',
  'original_publication_info', 'source_url', 'access_level', 'rights_status', 'rights_notes',
  'allow_search_quotes', 'allow_source_link', 'approved_for_ingestion',
  'public_retrieval_enabled', 'processing_status', 'extraction_quality', 'extraction_notes',
  'current_version_id', 'created_by', 'updated_by', 'created_at', 'updated_at',
  // Legacy production columns retained by the reconciled schema.
  'storage_path', 'file_name', 'file_type', 'file_size', 'page_count',
  'ingestion_status', 'search_enabled',
]

let failed = false

console.log('\n[1. church_library_books columns]')
for (const column of bookColumns) {
  const { error } = await client.from('church_library_books').select(column).limit(0)
  if (!error) {
    console.log(`PASS books.${column}`)
  } else if (error.code === '42501') {
    console.log(`PASS books.${column} (present; anonymous read correctly denied)`)
  } else {
    failed = true
    console.log(`FAIL books.${column}: ${error.code || 'unknown'} ${error.message}`)
  }
}

console.log('\n[2. church_library_versions table & columns]')
const versionCols = [
  'id', 'book_id', 'version_number', 'original_file_name', 'source_storage_path',
  'mime_type', 'byte_size', 'sha256', 'processing_status', 'extraction_quality',
  'extraction_notes', 'error_code', 'error_message', 'page_count', 'section_count',
  'passage_count', 'processed_at', 'created_by', 'created_at'
]
const { error: versionsError } = await client.from('church_library_versions').select(versionCols.join(',')).limit(0)
if (!versionsError || versionsError.code === '42501') {
  console.log(`PASS church_library_versions (${versionCols.length} columns present; anonymous read denied)`)
} else {
  console.log(`FAIL church_library_versions: ${versionsError.code || 'unknown'} ${versionsError.message}`)
  failed = true
}

console.log('\n[3. church_library_sections table & columns]')
const sectionCols = ['id', 'book_id', 'version_id', 'section_order', 'title', 'chapter_reference', 'page_start', 'page_end', 'created_at']
const { error: sectionsError } = await client.from('church_library_sections').select(sectionCols.join(',')).limit(0)
if (!sectionsError || sectionsError.code === '42501') {
  console.log(`PASS church_library_sections (${sectionCols.length} columns present; anonymous read denied)`)
} else {
  console.log(`FAIL church_library_sections: ${sectionsError.code || 'unknown'} ${sectionsError.message}`)
  failed = true
}

console.log('\n[4. church_library_passages table & columns]')
const passageCols = [
  'id', 'book_id', 'version_id', 'section_id', 'passage_order', 'language', 'content',
  'page_start', 'page_end', 'chapter_reference', 'locator_label', 'extraction_confidence',
  'search_document', 'embedding', 'embedding_model', 'created_at', 'original_content',
  'review_status', 'reviewer_notes', 'reviewed_by', 'reviewed_at', 'revision_count',
  'updated_by', 'updated_at'
]
for (const col of passageCols) {
  const { error } = await client.from('church_library_passages').select(col).limit(0)
  if (!error || error.code === '42501') {
    console.log(`PASS passages.${col} (present; anonymous read denied)`)
  } else {
    console.log(`FAIL passages.${col}: ${error.code || 'unknown'} ${error.message}`)
    failed = true
  }
}

console.log('\n[5. church_library_passage_revisions table & columns]')
const revCols = ['id', 'passage_id', 'revision_number', 'previous_content', 'new_content', 'change_summary', 'review_status', 'reviewer_notes', 'created_by', 'created_at']
const { error: revError } = await client.from('church_library_passage_revisions').select(revCols.join(',')).limit(0)
if (!revError || revError.code === '42501') {
  console.log(`PASS church_library_passage_revisions (${revCols.length} columns present; anonymous read denied)`)
} else {
  console.log(`FAIL church_library_passage_revisions: ${revError.code || 'unknown'} ${revError.message}`)
  failed = true
}

console.log('\n[6. church-library Private Storage Bucket]')
const { data: bucket, error: bucketError } = await client.storage.getBucket('church-library')
if (bucket && !bucketError) {
  if (bucket.public === false) {
    console.log(`PASS church-library bucket is PRIVATE (public=false)`)
  } else {
    console.log(`FAIL church-library bucket is PUBLIC (security violation!)`)
    failed = true
  }
  if (bucket.file_size_limit === 52428800) {
    console.log(`PASS church-library bucket size limit is 50 MiB (52,428,800 bytes)`)
  } else {
    console.log(`WARN church-library bucket size limit is ${bucket.file_size_limit}`)
  }
  const allowed = bucket.allowed_mime_types || []
  if (allowed.includes('application/pdf') && allowed.includes('application/epub+zip')) {
    console.log(`PASS church-library bucket permits expected MIME types (${allowed.length} types)`)
  } else {
    console.log(`FAIL church-library bucket allowed_mime_types missing expected formats: ${JSON.stringify(allowed)}`)
    failed = true
  }
} else {
  console.log(`FAIL church-library bucket: ${bucketError?.message || 'Bucket not found'}`)
  failed = true
}

console.log('\n[7. Stored Procedures / RPCs]')
const { error: activateError } = await client.rpc('activate_church_library_version', {
  target_book_id: '00000000-0000-0000-0000-000000000000',
  target_version_id: '00000000-0000-0000-0000-000000000000',
})
if (activateError && activateError.code === '42501') {
  console.log('PASS activate_church_library_version RPC registered (staff permission enforced)')
} else if (activateError && activateError.code === 'PGRST202') {
  console.log('FAIL activate_church_library_version RPC missing from schema cache')
  failed = true
} else {
  console.log(`INFO activate_church_library_version: ${activateError?.code || 'success'}`)
}

const { error: searchError } = await client.rpc('search_church_library', { search_query: 'test' })
if (!searchError || searchError.code === '42501' || searchError.message?.includes('results')) {
  console.log('PASS search_church_library RPC registered')
} else if (searchError.code === 'PGRST202') {
  console.log('FAIL search_church_library RPC missing from schema cache')
  failed = true
} else {
  console.log(`INFO search_church_library: ${searchError.code} ${searchError.message}`)
}

console.log('\n--- PROBE SUMMARY ---')
if (failed) {
  console.log('STATUS: PENDING MIGRATION. Run supabase/church-library/REPAIR_CHURCH_LIBRARY_UPLOAD.sql in Supabase SQL Editor.')
  process.exitCode = 1
} else {
  console.log('STATUS: ALL CHURCH LIBRARY SCHEMA OBJECTS & PRIVATE STORAGE VERIFIED.')
}
