/**
 * Search Buddy catalog reliability: per-catalog outcomes, time budgets,
 * bounded retries and partial results — against a local mock of the
 * Supabase REST API (no production data is read or written).
 *
 * Run: npm run test:search-catalog-status
 */
import assert from 'node:assert/strict'
import http from 'node:http'
import type { AddressInfo } from 'node:net'
import { classifyCatalogError, runCatalog, CatalogTimeoutError } from '../src/lib/search/catalogRunner'
import { reportSiteSources, siteSearchFlags } from '../src/lib/search/siteSearchStatus'

let passed = 0
const failures: string[] = []
async function test(name: string, fn: () => Promise<void> | void) {
  try {
    await fn()
    passed++
    console.log(`✓ ${name}`)
  } catch (error) {
    failures.push(name)
    console.log(`✗ ${name}\n    ${(error as Error).message.split('\n')[0]}`)
  }
}

// ---------------------------------------------------------------- unit ------
await test('classifies errors into catalog outcomes', () => {
  assert.equal(classifyCatalogError(new CatalogTimeoutError('bible', 10)), 'timeout')
  assert.equal(classifyCatalogError({ code: '57014', message: 'canceling statement due to statement timeout' }), 'timeout')
  assert.equal(classifyCatalogError({ code: '42501', message: 'permission denied for table x' }), 'unauthorized')
  assert.equal(classifyCatalogError({ status: 401, message: 'JWT expired' }), 'unauthorized')
  assert.equal(classifyCatalogError(new TypeError('Failed to fetch')), 'unavailable')
  assert.equal(classifyCatalogError({ status: 503, message: 'Service Unavailable' }), 'unavailable')
  assert.equal(classifyCatalogError({ code: 'PGRST100', message: 'failed to parse filter' }), 'query_error')
})

await test('success outcomes distinguish results from an empty catalog', async () => {
  const hit = { sourceType: 'mezmur', sourceId: '1', title: 'x', titleAmharic: '', description: '', route: '/x', imagePath: null, score: 0, matchKind: 'keyword', typeLabel: 'Mezmur' } as const
  assert.equal((await runCatalog('a', async () => [hit], (v) => [...v])).outcome, 'success_with_results')
  assert.equal((await runCatalog('a', async () => [], () => [])).outcome, 'success_empty')
})

await test('a hanging catalog times out within its budget (one bounded retry)', async () => {
  let calls = 0
  const t0 = Date.now()
  const run = await runCatalog('slow', () => { calls++; return new Promise<never>(() => {}) }, () => [], { timeoutMs: 200, retryDelayMs: 10 })
  const ms = Date.now() - t0
  assert.equal(run.outcome, 'timeout')
  assert.equal(run.failed, true)
  assert.equal(calls, 2)
  assert.ok(ms < 450, `took ${ms} ms`)
})

await test('transient failure then success is retried once and recovers', async () => {
  let calls = 0
  const run = await runCatalog('flaky', async () => {
    calls++
    if (calls === 1) throw new TypeError('Failed to fetch')
    return ['ok']
  }, (v) => v.map((id) => ({ sourceType: 'page', sourceId: id, title: id, titleAmharic: '', description: '', route: '/', imagePath: null, score: 0, matchKind: 'keyword', typeLabel: '' })) as never, { retryDelayMs: 1 })
  assert.equal(calls, 2)
  assert.equal(run.outcome, 'success_with_results')
})

await test('permission / query errors are not retried', async () => {
  let calls = 0
  const run = await runCatalog('locked', async () => { calls++; throw { code: '42501', message: 'permission denied' } }, () => [], { retryDelayMs: 1 })
  assert.equal(calls, 1)
  assert.equal(run.outcome, 'unauthorized')
})

await test('user cancellation propagates as AbortError (stale request dropped)', async () => {
  const controller = new AbortController()
  const p = runCatalog('x', () => new Promise<never>(() => {}), () => [], { signal: controller.signal, timeoutMs: 5000 })
  controller.abort()
  await assert.rejects(p, (e: Error) => e.name === 'AbortError')
})

await test('reports keep the outcome; failed only when every catalog failed', () => {
  const reports = reportSiteSources([
    { name: 'bible', failed: true, count: 0, outcome: 'timeout' },
    { name: 'hymns', failed: false, count: 3 },
  ])
  assert.equal(reports[0].outcome, 'timeout')
  assert.equal(reports[1].outcome, 'success_with_results')
  assert.deepEqual(siteSearchFlags(reports, 3), { partial: true, failed: false, zeroResults: false })
})

// --------------------------------------------------------- integration ------
type Mode = 'ok' | 'bible-hang' | 'bible-statement-timeout' | 'bible-unauthorized' | 'all-down'
let mode: Mode = 'ok'
const bibleRequests: string[] = []
const MEZMUR = {
  mezmur_id: '00000000-0000-4000-8000-000000000001', import_id: '10000000-0000-4000-8000-000000000001',
  slug: 'test-kidist-maryam', title: 'Kidist Maryam Test', title_amharic: 'ቅድስት ማርያም', status: 'published', deleted_at: null,
  primary_language: 'amharic', form: 'mezmur', search_keywords: 'maryam mary', lyrics_amharic: 'ሰላም ለኪ', singer_name: null,
}
const server = http.createServer((req, res) => {
  const url = new URL(req.url || '/', 'http://localhost')
  const table = url.pathname.replace(/^\/rest\/v1\/(rpc\/)?/, '')
  res.setHeader('content-type', 'application/json')
  const bible = table.startsWith('bible')
  if (bible) bibleRequests.push(table)
  if (mode === 'all-down') {
    res.statusCode = 503
    return res.end(JSON.stringify({ message: 'Service Unavailable' }))
  }
  if (bible && mode === 'bible-hang') return // never answers
  if (bible && mode === 'bible-statement-timeout') {
    res.statusCode = 500
    return res.end(JSON.stringify({ code: '57014', message: 'canceling statement due to statement timeout' }))
  }
  if (bible && mode === 'bible-unauthorized') {
    res.statusCode = 401
    return res.end(JSON.stringify({ code: '42501', message: 'permission denied for table bible_verses' }))
  }
  if (table === 'mezmur_public' || table === 'mezmur_data_import') return res.end(JSON.stringify([MEZMUR]))
  res.end('[]')
})
await new Promise<void>((r) => server.listen(0, '127.0.0.1', r))
process.env.VITE_SUPABASE_URL = `http://127.0.0.1:${(server.address() as AddressInfo).port}`
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'test-key'
const { searchSite, buildAssistantReply } = await import('../src/lib/search/searchSite')

const byName = (r: Awaited<ReturnType<typeof searchSite>>, name: string) => r.sources.find((s) => s.name === name)

await test('healthy search: every catalog reports success_* and Mezmur results are returned', async () => {
  mode = 'ok'
  const r = await searchSite('maryam')
  assert.equal(r.failed, false)
  assert.equal(r.partial, false)
  assert.ok(r.sources.every((s) => s.outcome === 'success_with_results' || s.outcome === 'success_empty'), JSON.stringify(r.sources))
  assert.ok(r.results.some((x) => x.route.includes('test-kidist-maryam')), 'mezmur result missing')
})

await test('Bible hangs: other catalogs still answer, Bible reports timeout, search finishes in bounded time', async () => {
  mode = 'bible-hang'
  const t0 = Date.now()
  const r = await searchSite('maryam')
  const ms = Date.now() - t0
  assert.equal(byName(r, 'bible')?.outcome, 'timeout')
  assert.equal(r.failed, false)
  assert.equal(r.partial, true)
  assert.ok(r.results.some((x) => x.route.includes('test-kidist-maryam')), 'partial results hidden')
  assert.ok(ms < 10000, `took ${ms} ms (budget 6 s + 3 s retry)`)
  console.log(`    finished in ${ms} ms with Bible timing out`)
})

await test('Postgres statement timeout on Bible text search → "timeout", not a generic failure', async () => {
  mode = 'bible-statement-timeout'
  const r = await searchSite('maryam')
  assert.equal(byName(r, 'bible')?.outcome, 'timeout')
  assert.ok(r.results.length > 0)
})

await test('Bible permission error → "unauthorized", not retried', async () => {
  mode = 'bible-unauthorized'
  bibleRequests.length = 0
  const r = await searchSite('maryam')
  assert.equal(byName(r, 'bible')?.outcome, 'unauthorized')
})

await test('everything down → failed, with a clear reply (no "catalog did not respond")', async () => {
  mode = 'all-down'
  const r = await searchSite('zzzz nothing')
  assert.equal(r.results.filter((x) => x.sourceType !== 'page').length, 0)
  const reply = buildAssistantReply({ ...r, results: [], failed: true })
  assert.match(reply, /temporarily unavailable/)
  assert.doesNotMatch(reply, /did not respond/)
})

await test('partial + no results reply names Bible specifically', () => {
  const reply = buildAssistantReply({
    query: 'x', resolvedQuery: 'x', results: [], intentMessage: null, zeroResults: false, partial: true, failed: false,
    sources: [{ name: 'bible', status: 'failed', count: 0, outcome: 'timeout' }, { name: 'hymns', status: 'empty', count: 0 }],
    totalCount: 0, isFollowUp: false,
  })
  assert.match(reply, /^Bible search is temporarily unavailable/)
})

server.close()
console.log(`\n${passed} passed, ${failures.length} failed`)
process.exit(failures.length ? 1 : 0)
