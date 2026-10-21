/**
 * Faith and Order exact-text search.
 * Mocks cover errors and the no-chat rule. Live checks run when
 * VITE_TEWAHEDO_AI_API_URL is set (npm run test:faith-and-order-search).
 */
import assert from 'node:assert/strict'
import fs from 'node:fs'
import { translate } from '../src/i18n/index.ts'
import { AiClientError } from '../src/lib/ai/aiTypes.ts'
import { searchBuddyErrorMessage } from '../src/lib/searchBuddy/errorMessages.ts'
import {
  FAITH_AND_ORDER_QUERY_MAX,
  FaithAndOrderQueryError,
  assertFaithAndOrderQuery,
  assertFaithAndOrderRoute,
  faithAndOrderSearchPath,
  fetchFaithAndOrderManifest,
  fetchFaithAndOrderParagraph,
  fetchFaithAndOrderSection,
  layoutFaithAndOrderResults,
  searchFaithAndOrder,
} from '../src/lib/searchBuddy/faithAndOrderSearch.ts'

const VERSION = 'a'.repeat(64)
const SACRAMENT_SENTENCE =
  'There are seven sacraments: baptism, confirmation, penance, Holy Communion, function of the sick, matrimony, and holy orders.'

function source(overrides = {}) {
  return {
    source_id: 'faith-and-order',
    title: 'The Faith And Order Of The Church',
    version: VERSION,
    language: 'en',
    editorial_status: 'source_transcription_unreviewed',
    locator_kind: 'DOCX body paragraph, 1-based; not a printed page number',
    sections: [
      { id: 's000152', title: 'Introduction to Church Sacraments', start_paragraph: 152 },
      { id: 's000008', title: 'THE MYSTERY OF THE HOLY TRINITY', start_paragraph: 8 },
    ],
    paragraph_count: 501,
    mode: 'exact_document_search',
    generated: false,
    translation_available: false,
    ...overrides,
  }
}

function paragraph(id, number, text, extra = {}) {
  return {
    id,
    paragraph_number: number,
    section_id: 's000152',
    section_title: 'Introduction to Church Sacraments',
    is_heading: false,
    text,
    source_id: 'faith-and-order',
    version: VERSION,
    language: 'en',
    citation: `The Faith And Order Of The Church — Introduction to Church Sacraments — paragraph ${number}`,
    paragraph_path: `/api/documents/faith-and-order/${VERSION}/paragraphs/${id}`,
    section_path: `/api/documents/faith-and-order/${VERSION}/sections/s000152`,
    ...extra,
  }
}

function searchBody(query, results, status = 'matches') {
  return {
    type: 'document_search',
    mode: 'exact_document_search',
    generated: false,
    query,
    source: source(),
    status,
    count: results.length,
    results,
  }
}

const savedFetch = globalThis.fetch
const savedBase = process.env.VITE_TEWAHEDO_AI_API_URL
process.env.VITE_TEWAHEDO_AI_API_URL = 'http://faith-order.test'

const calls = []
function installFetch(handler) {
  calls.length = 0
  globalThis.fetch = async (input, init = {}) => {
    const url = String(input)
    const method = String(init.method || 'GET').toUpperCase()
    if (!url.includes('/api/documents/faith-and-order')) {
      return jsonResponse({})
    }
    calls.push({ url, method })
    return handler(url, init)
  }
}

function jsonResponse(body, status = 200, headers = {}) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { 'Content-Type': 'application/json', ...headers },
  })
}

const hit = paragraph('p000165', 165, SACRAMENT_SENTENCE, {
  context_before: [paragraph('p000164', 164, 'Number of Church Sacraments')],
  context_after: [paragraph('p000166', 166, 'Following sentence.')],
})

installFetch((url) => {
  const parsed = new URL(url)
  assert.equal(parsed.origin, 'http://faith-order.test')
  assert.equal(parsed.pathname, '/api/documents/faith-and-order/search')
  return jsonResponse(searchBody(parsed.searchParams.get('q'), [hit]))
})

const found = await searchFaithAndOrder('seven sacraments')
assert.equal(found.generated, false)
assert.equal(found.mode, 'exact_document_search')
assert.equal(found.results[0].text, SACRAMENT_SENTENCE)
assert.equal(found.results[0].text.includes('Burial'), false)
assert.equal(found.results[0].text.includes('function of the sick'), true)
assert.equal(calls.length, 1)
assert.equal(calls[0].method, 'GET')
assert.equal(calls.some((call) => call.url.includes('/api/chat')), false)
assert.equal(calls[0].url.includes('answer_language'), false)
assert.equal(calls[0].url.includes('history'), false)

const cards = layoutFaithAndOrderResults([
  {
    ...hit,
    context_before: [paragraph('p000164', 164, 'Number of Church Sacraments')],
    context_after: [paragraph('p000166', 166, 'Following sentence.')],
  },
  {
    ...paragraph('p000166', 166, 'Following sentence.'),
    context_before: [paragraph('p000165', 165, SACRAMENT_SENTENCE)],
    context_after: [paragraph('p000167', 167, 'Later paragraph.')],
  },
])
assert.equal(cards.length, 2)
assert.equal(cards[0].match.text, SACRAMENT_SENTENCE)
assert.deepEqual(cards[0].contextBefore.map((item) => item.id), ['p000164'])
assert.deepEqual(cards[0].contextAfter.map((item) => item.id), [])
assert.equal(cards[1].match.id, 'p000166')
assert.deepEqual(cards[1].contextBefore.map((item) => item.id), [])
assert.deepEqual(cards[1].contextAfter.map((item) => item.id), ['p000167'])
assert.equal(`${cards[0].match.text} ${cards[0].contextBefore[0].text}`.includes('\n'), false)

installFetch(() =>
  jsonResponse({
    ...searchBody('baptism', [paragraph('p000001', 1, 'A generated explanation of baptism.')]),
    generated: true,
  }),
)
await assert.rejects(() => searchFaithAndOrder('baptism'), (error) => {
  assert.equal(error instanceof AiClientError, true)
  assert.equal(String(error.message).includes('generated explanation'), false)
  return true
})

installFetch(() => jsonResponse({ detail: 'busy' }, 503))
await assert.rejects(() => searchFaithAndOrder('penance'), (error) => {
  assert.equal(error.code, 'unavailable')
  assert.equal(error.status, 503)
  return true
})
assert.equal(calls.length, 1)
assert.notEqual(
  searchBuddyErrorMessage(new AiClientError('unavailable', 'down', 503), 'en'),
  'No matching passage found in Faith and Order',
)

installFetch(() => jsonResponse({ detail: 'slow' }, 429, { 'Retry-After': '9' }))
await assert.rejects(() => searchFaithAndOrder('Trinity'), (error) => {
  assert.equal(error.code, 'rate_limited')
  assert.equal(error.retryAfterSeconds, 9)
  return true
})
assert.equal(calls.length, 1)
assert.notEqual(
  searchBuddyErrorMessage(new AiClientError('rate_limited', 'wait', 429, 9), 'en'),
  translate('en', 'searchBuddy.faith.noPassage'),
)

installFetch(() => {
  throw new TypeError('failed to fetch')
})
await assert.rejects(() => searchFaithAndOrder('confirmation'), (error) => {
  assert.equal(error.code, 'network')
  return true
})
assert.equal(calls.length, 1)

installFetch(() => jsonResponse(searchBody('zzzz-unrelated-topic', [], 'no_matching_passage')))
const empty = await searchFaithAndOrder('zzzz-unrelated-topic')
assert.equal(empty.status, 'no_matching_passage')
assert.equal(empty.generated, false)
assert.deepEqual(empty.results, [])

let longCalled = false
globalThis.fetch = async () => {
  longCalled = true
  throw new Error('must not fetch')
}
await assert.rejects(() => searchFaithAndOrder('x'.repeat(501)), (error) => {
  assert.equal(error instanceof FaithAndOrderQueryError, true)
  assert.equal(error.code, 'too_long')
  assert.equal(error.length, 501)
  return true
})
assert.equal(longCalled, false)
const exact = 'y'.repeat(FAITH_AND_ORDER_QUERY_MAX)
assert.equal(assertFaithAndOrderQuery(exact), exact)
assert.equal(assertFaithAndOrderQuery(`  ${exact}  `), exact)
assert.throws(() => assertFaithAndOrderQuery('   '), (error) => error.code === 'empty')

assert.throws(() => assertFaithAndOrderRoute('/api/chat'))
assert.throws(() => assertFaithAndOrderRoute('/api/documents/faith-and-order/../../api/chat'))
assert.throws(() => assertFaithAndOrderRoute('https://evil.test/api/documents/faith-and-order'))
assert.throws(() => faithAndOrderSearchPath('ok', 11))
const searchPath = faithAndOrderSearchPath('function of the sick', 5)
assert.equal(searchPath.startsWith('/api/documents/faith-and-order/search?'), true)
assert.equal(searchPath.includes('/api/chat'), false)
assert.equal(new URL(`http://faith-order.test${searchPath}`).searchParams.get('q'), 'function of the sick')

const buddy = fs.readFileSync(new URL('../src/components/search/SearchBuddy.tsx', import.meta.url), 'utf8')
const views = fs.readFileSync(new URL('../src/components/search/FaithAndOrderViews.tsx', import.meta.url), 'utf8')
const client = fs.readFileSync(new URL('../src/lib/searchBuddy/faithAndOrderSearch.ts', import.meta.url), 'utf8')
for (const file of [buddy, views]) {
  assert.equal(file.includes('/api/chat'), false)
  assert.equal(file.includes('postAiChat'), false)
  assert.equal(file.includes('sendSearchBuddyMessage'), false)
  assert.equal(file.includes('dangerouslySetInnerHTML'), false)
  assert.equal(file.includes('answerLanguage'), false)
  assert.equal(file.includes('Burial'), false)
}
assert.equal(client.includes("'/api/chat'"), false)
assert.equal(client.includes('slice(0, 500)'), false)
assert.equal(client.includes('/api/documents/faith-and-order'), true)

assert.equal(translate('en', 'searchBuddy.faith.noPassage'), 'No matching passage found in Faith and Order')
const amEmpty = translate('am', 'searchBuddy.faith.noPassage')
assert.ok(/[\u1200-\u137F]/.test(amEmpty))
assert.notEqual(amEmpty, translate('en', 'searchBuddy.faith.noPassage'))
assert.notEqual(searchBuddyErrorMessage(new AiClientError('network', 'down'), 'en'), translate('en', 'searchBuddy.faith.noPassage'))
assert.ok(/[\u1200-\u137F]/.test(searchBuddyErrorMessage(new AiClientError('unavailable', 'down', 503), 'am')))

console.log('faith-and-order mocks: ok')

globalThis.fetch = savedFetch
if (savedBase === undefined) delete process.env.VITE_TEWAHEDO_AI_API_URL
else process.env.VITE_TEWAHEDO_AI_API_URL = savedBase

const liveBase = process.env.VITE_TEWAHEDO_AI_API_URL || ''
if (!liveBase.startsWith('https://')) {
  console.log('faith-and-order live: skipped (set VITE_TEWAHEDO_AI_API_URL)')
  process.exit(0)
}

const liveCalls = []
const realFetch = globalThis.fetch.bind(globalThis)
globalThis.fetch = async (input, init) => {
  liveCalls.push({ url: String(input), method: String(init?.method || 'GET').toUpperCase() })
  return realFetch(input, init)
}

function assertNoModelCalls() {
  for (const call of liveCalls) {
    assert.equal(call.url.includes('/api/chat'), false, call.url)
    assert.equal(call.method === 'POST' && call.url.includes('/api/documents/faith-and-order'), false)
    assert.equal(/openai|generativelanguage|ollama|anthropic/i.test(call.url), false, call.url)
  }
}

const manifest = await fetchFaithAndOrderManifest()
assert.equal(manifest.mode, 'exact_document_search')
assert.equal(manifest.generated, false)
assert.equal(manifest.paragraph_count, 501)
assert.equal(manifest.translation_available, false)
assert.equal(manifest.language, 'en')
assert.ok(manifest.sections.length > 0)
assert.equal(
  manifest.sections.some((section) => section.title === 'THE SACRAMENT OF THE FUNCTION OF THE SICK'),
  true,
)

async function expectMatches(query, check) {
  const response = await searchFaithAndOrder(query, { limit: 5 })
  assert.equal(response.type, 'document_search')
  assert.equal(response.mode, 'exact_document_search')
  assert.equal(response.generated, false)
  assert.equal(response.status, 'matches')
  assert.ok(response.results.length > 0, query)
  check(response)
  assertNoModelCalls()
}

await expectMatches('seven sacraments', (response) => {
  const match = response.results.find((row) => row.text === SACRAMENT_SENTENCE)
  assert.ok(match, 'seven sacraments paragraph')
  assert.equal(match.text.includes('penance'), true)
  assert.equal(match.text.includes('holy orders'), true)
  assert.equal(match.text.includes('function of the sick'), true)
  assert.equal(match.text.includes('Burial'), false)
})

await expectMatches('baptism', (response) => {
  assert.ok(response.results.some((row) => row.section_title === 'THE MYSTERY OF BAPTISM' || row.section_title === 'The Sacrament of Baptism'))
  assert.ok(response.results.some((row) => row.text === 'One Baptism' || row.text.includes('Baptism')))
})

await expectMatches('infant baptism', (response) => {
  assert.ok(
    response.results.some(
      (row) => row.text === 'Baptism of Infants' || row.text.includes('male infants at the age of 40 days'),
    ),
  )
})

await expectMatches('penance', (response) => {
  assert.ok(response.results.some((row) => row.section_title === 'THE SACRAMENT OF PENANCE'))
})

await expectMatches('Trinity', (response) => {
  assert.ok(response.results.some((row) => row.section_title === 'THE MYSTERY OF THE HOLY TRINITY'))
})

await expectMatches('confirmation', (response) => {
  assert.ok(response.results.some((row) => row.section_title === 'THE SACRAMENT OF CONFIRMATION'))
})

await expectMatches('function of the sick', (response) => {
  assert.ok(
    response.results.some(
      (row) =>
        row.section_title === 'THE SACRAMENT OF THE FUNCTION OF THE SICK' &&
        row.text === 'THE SACRAMENT OF THE FUNCTION OF THE SICK',
    ),
  )
})

const unrelated = await searchFaithAndOrder('quantum blockchain pizza', { limit: 5 })
assert.equal(unrelated.status, 'no_matching_passage')
assert.equal(unrelated.generated, false)
assert.equal(unrelated.count, 0)
assert.deepEqual(unrelated.results, [])

const paragraphDoc = await fetchFaithAndOrderParagraph(manifest.version, 'p000165')
assert.equal(paragraphDoc.text, SACRAMENT_SENTENCE)
assert.equal(paragraphDoc.id, 'p000165')
assert.equal(paragraphDoc.language, 'en')

const sectionDoc = await fetchFaithAndOrderSection(manifest.version, 's000152')
assert.equal(sectionDoc.generated, false)
assert.equal(sectionDoc.section_id, 's000152')
const index = sectionDoc.paragraphs.findIndex((row) => row.id === 'p000165')
assert.ok(index > 0)
assert.equal(sectionDoc.paragraphs[index].text, SACRAMENT_SENTENCE)
assert.deepEqual(
  sectionDoc.paragraphs.map((row) => row.id),
  sectionDoc.paragraphs.map((row) => row.id),
)
for (let i = 1; i < sectionDoc.paragraphs.length; i += 1) {
  assert.ok(sectionDoc.paragraphs[i].paragraph_number >= sectionDoc.paragraphs[i - 1].paragraph_number)
}

assertNoModelCalls()
console.log(
  JSON.stringify({
    liveCalls: liveCalls.length,
    chatPosts: liveCalls.filter((call) => call.url.includes('/api/chat')).length,
    paragraph: paragraphDoc.id,
  }),
)
console.log('faith-and-order live: ok')
