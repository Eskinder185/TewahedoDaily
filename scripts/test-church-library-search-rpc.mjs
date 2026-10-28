import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'

const migration = readFileSync(
  new URL('../supabase/migrations/20261028160000_install_church_library_search_rpc.sql', import.meta.url),
  'utf8',
)
const client = readFileSync(
  new URL('../src/lib/searchBuddy/churchLibrarySearch.ts', import.meta.url),
  'utf8',
)
const citations = readFileSync(
  new URL('../src/components/search/ChurchLibrarySources.tsx', import.meta.url),
  'utf8',
)

for (const argument of ['search_query text', 'result_limit integer', 'search_language text', 'query_embedding extensions.vector(384)']) {
  assert.ok(migration.includes(argument), `missing RPC argument: ${argument}`)
}
for (const field of [
  'passage_id uuid', 'book_id uuid', 'title text', 'author text', 'language text',
  'excerpt text', 'page_start integer', 'page_end integer', 'chapter_reference text',
  'locator_label text', 'source_url text', 'keyword_rank real', 'semantic_rank real',
]) assert.ok(migration.includes(field), `missing RPC result: ${field}`)

for (const gate of [
  'coalesce(b.search_enabled, false) is true',
  "b.ingestion_status = 'ready'",
  'b.public_retrieval_enabled is true',
  "b.access_level in ('public_search', 'public')",
  'b.approved_for_ingestion is true',
  'b.allow_search_quotes is true',
  "b.rights_status in ('owned', 'licensed', 'public_domain', 'permission_granted')",
  "b.processing_status = 'ready'",
]) assert.ok(migration.includes(gate), `missing public retrieval gate: ${gate}`)

for (const compatibilityStep of [
  'add column if not exists public_retrieval_enabled',
  'add column if not exists search_document',
  'set public_retrieval_enabled = coalesce(search_enabled, false)',
  "processing_status = coalesce(nullif(ingestion_status, ''), 'not_uploaded')",
]) assert.ok(migration.includes(compatibilityStep), `missing legacy-schema bridge: ${compatibilityStep}`)

assert.ok(migration.includes('security definer'))
assert.ok(migration.includes('set search_path = pg_catalog, public, extensions'))
assert.ok(migration.includes('owner to postgres'))
assert.ok(migration.includes('revoke all on function public.search_church_library'))
assert.ok(migration.includes('to anon, authenticated, service_role'))
assert.ok(migration.includes("notify pgrst, 'reload schema'"))
assert.ok(client.includes("supabase.rpc('search_church_library'"))
assert.ok(client.includes('if (error instanceof ChurchLibrarySearchError) throw error'))
assert.ok(client.includes('continue to the database'))
assert.ok(citations.includes('/library/${hit.book_id}?passage=${encodeURIComponent(hit.passage_id)}'))

console.log('Church Library search RPC contract, gates, fallback, and citation checks: OK')
