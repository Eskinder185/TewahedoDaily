/**
 * Full Amharic question retry — deterministic tests with a mocked Supabase RPC.
 *
 * The database matches a whole question as one phrase and ANDs every word, so an
 * Amharic question with question words ("ምንድን ናቸው") finds nothing. The frontend
 * retries once with those words removed. No network or production access: the
 * Supabase client is a local object whose `rpc` is replaced below.
 *
 * Run: npx tsx scripts/test-church-library-amharic-retry.ts
 */
import assert from 'node:assert/strict'

// Configure a throwaway client BEFORE the module under test is imported, and make
// sure the optional AI gateway is not used.
process.env.VITE_SUPABASE_URL = 'https://mock.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'mock-publishable-key'
delete process.env.VITE_TEWAHEDO_AI_API_URL

const { supabase } = await import('../src/lib/supabase/client')
const { searchChurchLibrary, reduceAmharicQuestion, ChurchLibrarySearchError } = await import(
  '../src/lib/searchBuddy/churchLibrarySearch'
)
assert.ok(supabase, 'mock Supabase client must exist')

type Row = Record<string, unknown>
type Call = { fn: string; query: string }
type Handler = (fn: string, query: string) => { data: Row[] | null; error: { code?: string; message?: string } | null }

const calls: Call[] = []
let handler: Handler = () => ({ data: [], error: null })
;(supabase as unknown as { rpc: unknown }).rpc = async (fn: string, args: { search_query?: string }) => {
  const query = args?.search_query ?? ''
  calls.push({ fn, query })
  return handler(fn, query)
}

const row = (id: string, excerpt: string, language = 'am'): Row => ({
  passage_id: id,
  book_id: 'b1',
  title: 'Synthetic book',
  author: null,
  language,
  excerpt,
  page_start: null,
  page_end: null,
  chapter_reference: null,
  locator_label: null,
  source_url: null,
  keyword_rank: 1,
  semantic_rank: 0,
})

const FULL = 'አምስቱ አእማደ ምሥጢር ምንድን ናቸው?'
const SHORT = 'አምስቱ አእማደ ምሥጢር'
const why = row('am-why', 'አምስቱ አእማደ ምሥጢር ለምን አምስት እንደሆኑ ትውፊቱ ይገልጻል።')
const list = row(
  'am-list',
  'አምስቱ አእማደ ምሥጢር፦ 1. የንጋት መብራት። 2. የቀትር መብራት። 3. የምሽት መብራት። 4. የእኩለ ሌሊት መብራት። 5. የወደብ መብራት።',
)
const rpcOnly = (fn: string) => calls.filter((c) => c.fn === fn)

let passed = 0
async function test(name: string, fn: () => Promise<void> | void) {
  calls.length = 0
  handler = () => ({ data: [], error: null })
  await fn()
  passed += 1
  console.log(`✓ ${name}`)
}

// The mocked database only matches the reduced topic phrase, like the real one.
const matchesOnlyShort: Handler = (fn, query) =>
  fn === 'search_church_library' && query === SHORT ? { data: [why, list], error: null } : { data: [], error: null }

await test('reducer: removes reviewed question words and trailing punctuation only', () => {
  assert.equal(reduceAmharicQuestion(FULL), SHORT)
  assert.equal(reduceAmharicQuestion('አምስቱ አእማደ ምሥጢር ዘርዝር'), SHORT)
  assert.equal(reduceAmharicQuestion('  አምስቱ አእማደ ምሥጢር ምንድን ናቸው፧ '), SHORT)
})

await test('reducer: no change, empty, English or too-weak input returns null', () => {
  assert.equal(reduceAmharicQuestion(SHORT), null, 'unchanged')
  assert.equal(reduceAmharicQuestion('ምንድን ናቸው?'), null, 'nothing left')
  assert.equal(reduceAmharicQuestion('ሥላሴ ምንድን ነው'), null, 'too weak (one short word)')
  assert.equal(reduceAmharicQuestion('What are the five pillars?'), null, 'English')
  assert.equal(reduceAmharicQuestion(''), null)
})

await test('reducer: spelling variants are preserved exactly as typed', () => {
  assert.equal(reduceAmharicQuestion('አምስቱ አዕማደ ምስጢር ምንድን ናቸው'), 'አምስቱ አዕማደ ምስጢር')
  assert.equal(reduceAmharicQuestion('አምስቱ አእማደ ምሥጢር ምንድን ናቸው'), 'አምስቱ አእማደ ምሥጢር')
})

await test('full Amharic question: first search empty → one retry with reduced query → hits returned', async () => {
  handler = matchesOnlyShort
  const response = await searchChurchLibrary(FULL)
  assert.equal(response.count, 2)
  assert.equal(response.query, FULL, 'original question stays the response query')
  assert.deepEqual(rpcOnly('search_church_library').map((c) => c.query), [FULL, SHORT], 'exactly one retry')
  assert.deepEqual(rpcOnly('search_church_library_sections').map((c) => c.query), [FULL, SHORT])
})

await test('selector uses the ORIGINAL full question; result order and text untouched; citation aligned', async () => {
  handler = matchesOnlyShort
  const response = await searchChurchLibrary(FULL)
  assert.deepEqual(response.results.map((h) => h.passage_id), ['am-why', 'am-list'], 'order preserved')
  assert.equal(response.answer_passage_id, 'am-list')
  const cited = response.results.find((h) => h.passage_id === response.answer_passage_id)
  assert.ok(cited)
  assert.equal(response.answer, cited.excerpt)
  assert.equal(cited.excerpt, list.excerpt as string, 'excerpt text unchanged')
  assert.equal(response.answer_status, 'source_excerpt')
})

await test('short query that already works: no retry, one search per RPC', async () => {
  handler = matchesOnlyShort
  const response = await searchChurchLibrary(SHORT)
  assert.equal(response.count, 2)
  assert.deepEqual(rpcOnly('search_church_library').map((c) => c.query), [SHORT])
  assert.equal(response.answer_passage_id, 'am-why', 'non-enumeration question keeps the first result')
})

await test('English query: never retried, even with zero hits', async () => {
  const response = await searchChurchLibrary('What are the five lanterns?')
  assert.equal(response.count, 0)
  assert.equal(rpcOnly('search_church_library').length, 1)
})

await test('unrelated Amharic question: both searches empty → insufficient evidence, one retry only', async () => {
  const response = await searchChurchLibrary('የአዲስ አበባ ዝናብ ምንድን ነው?')
  assert.equal(response.count, 0)
  assert.equal(response.answer, null)
  assert.equal(response.answer_status, 'insufficient_evidence')
  assert.equal(rpcOnly('search_church_library').length, 2)
})

await test('no public books / no indexed content: not retried', async () => {
  handler = (fn) =>
    fn === 'church_library_search_status'
      ? { data: [{ eligible_books: 0, indexed_passages: 0 }], error: null }
      : { data: [], error: null }
  const response = await searchChurchLibrary(FULL)
  assert.equal(response.availability, 'no_public_books')
  assert.equal(rpcOnly('search_church_library').length, 1)
})

await test('empty input: no calls', async () => {
  const response = await searchChurchLibrary('   ')
  assert.equal(response.count, 0)
  assert.equal(calls.length, 0)
})

await test('permission error on the first search is not retried and keeps its classification', async () => {
  handler = (fn) => (fn === 'search_church_library' ? { data: null, error: { code: '42501', message: 'denied' } } : { data: [], error: null })
  await assert.rejects(searchChurchLibrary(FULL), (error) => error instanceof ChurchLibrarySearchError && error.code === 'permission')
  assert.equal(rpcOnly('search_church_library').length, 1)
})

await test('failed retry propagates the existing classification (not masked as empty)', async () => {
  handler = (fn, query) =>
    fn === 'search_church_library' && query === SHORT
      ? { data: null, error: { code: 'PGRST202', message: 'missing' } }
      : { data: [], error: null }
  await assert.rejects(searchChurchLibrary(FULL), (error) => error instanceof ChurchLibrarySearchError && error.code === 'not_installed')
  assert.equal(rpcOnly('search_church_library').length, 2)
})

console.log(`\nChurch Library Amharic retry: ${passed} tests passed`)
