import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'

const migration = readFileSync('supabase/migrations/20261030120000_church_library_approved_faq.sql', 'utf8').toLowerCase()
const searchBuddy = readFileSync('src/components/search/SearchBuddy.tsx', 'utf8')
const faqService = readFileSync('src/lib/searchBuddy/churchLibraryFaq.ts', 'utf8')

assert.match(migration, /enable row level security/)
assert.match(migration, /publication_status = 'published' and review_status = 'approved'/)
assert.match(migration, /public\.is_staff\(\)/)
assert.match(migration, /church_library_faq_validate_sources/)
assert.match(migration, /replace the starter placeholder with a source-reviewed bilingual answer/)
assert.match(migration, /church_library_book_is_public/)
assert.match(migration, /grant execute on function public\.search_church_library_faq.*to anon, authenticated, service_role/s)
assert.doesNotMatch(migration, /grant (insert|update|delete).*to anon/)
assert.match(migration, /on conflict \(stable_id\) do nothing/)
assert.match(migration, /similarity\(/, 'FAQ retrieval must support phrasing variations')
assert.match(migration, /search_query ~ '\[ሀ-፼\]'/, 'FAQ retrieval must detect Ethiopic questions')
assert.match(searchBuddy, /Popular Questions/)
assert.match(searchBuddy, /ChurchLibraryFaqAnswer/)
assert.match(faqService, /if \(!sources\.length\) return null/, 'answers without citations must never render')

console.log('Church Library approved FAQ tests passed.')
