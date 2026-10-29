import { createClient } from '@supabase/supabase-js'

const url = process.env.SUPABASE_URL
const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
const anonKey = process.env.VITE_SUPABASE_PUBLISHABLE_KEY || process.env.VITE_SUPABASE_ANON_KEY

if (!url) {
  throw new Error('SUPABASE_URL is required for this read-only audit.')
}

const slugs = [
  'five-pillars-of-mystery-am',
  'five-pillars-of-mystery-en',
  'seven-sacraments-baptism-am',
  'seven-sacraments-baptism-en',
]

const admin = serviceKey ? createClient(url, serviceKey, {
  auth: { persistSession: false, autoRefreshToken: false },
}) : null

const { data: books, error: booksError } = admin ? await admin
  .from('church_library_books')
  .select('id,slug,title,language,storage_path,download_storage_path,publication_status,access_level,processing_status,ingestion_status,search_enabled,public_retrieval_enabled,approved_for_ingestion,allow_search_quotes,current_version_id')
  .in('slug', slugs)
  .order('slug') : { data: [], error: null }

if (booksError) throw booksError

const results = []
for (const book of books || []) {
  if (!admin) break
  const [{ count: passageCount, error: passageError }, { data: languageRows, error: languageError }, { count: searchableCount, error: searchableError }] = await Promise.all([
    admin.from('church_library_passages').select('id', { count: 'exact', head: true }).eq('book_id', book.id),
    admin.from('church_library_passages').select('language').eq('book_id', book.id),
    admin.from('church_library_passages').select('id', { count: 'exact', head: true }).eq('book_id', book.id).not('search_document', 'is', null),
  ])
  if (passageError) throw passageError
  if (languageError) throw languageError
  if (searchableError) throw searchableError

  const { data: samples, error: sampleError } = await admin
    .from('church_library_passages')
    .select('id,stable_key,chapter_reference,locator_label,language')
    .eq('book_id', book.id)
    .order('passage_order')
    .limit(3)
  if (sampleError) throw sampleError

  results.push({
    ...book,
    passage_count: passageCount || 0,
    indexed_passage_count: searchableCount || 0,
    passage_languages: [...new Set((languageRows || []).map((row) => row.language).filter(Boolean))],
    sample_passages: samples || [],
  })
}

const rpcChecks = []
for (const [query, language] of [['How many sacraments are there?', 'en'], ['ሰባቱ ምሥጢራት', 'am']]) {
  if (!admin) break
  const { data, error } = await admin.rpc('search_church_library_sections', {
    search_query: query,
    result_limit: 8,
    search_language: language,
  })
  rpcChecks.push({ query, role: 'service_role', count: Array.isArray(data) ? data.length : 0, error_code: error?.code || null, error_message: error?.message || null })
}

let anonymousChecks = null
if (anonKey) {
  const anon = createClient(url, anonKey, { auth: { persistSession: false, autoRefreshToken: false } })
  const { data, error } = await anon.rpc('search_church_library_sections', {
    search_query: 'How many sacraments are there?',
    result_limit: 8,
    search_language: 'en',
  })
  anonymousChecks = { count: Array.isArray(data) ? data.length : 0, error_code: error?.code || null, error_message: error?.message || null }
}

console.log(JSON.stringify({
  project_ref: new URL(url).hostname.split('.')[0],
  expected_books: slugs.length,
  privileged_audit_available: Boolean(admin),
  books_found: results.length,
  books: results,
  rpc_checks: rpcChecks,
  anonymous_check: anonymousChecks,
}, null, 2))
