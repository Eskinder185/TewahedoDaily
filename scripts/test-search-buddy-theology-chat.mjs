/**
 * Mocked routing: theology must POST /api/chat without Synaxarium/prayer/hymn GETs.
 * Run: npm run test:search-buddy-theology-chat
 */
import assert from 'node:assert/strict'

process.env.VITE_TEWAHEDO_AI_API_URL = 'http://mock-ai.test'

const calls = []

function pathOf(url) {
  try {
    return new URL(String(url)).pathname
  } catch {
    return String(url)
  }
}

function jsonResponse(body, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { 'Content-Type': 'application/json' },
  })
}

globalThis.fetch = async (input, init = {}) => {
  const url = String(input)
  const method = String(init.method || (init.body ? 'POST' : 'GET')).toUpperCase()
  let jsonBody = null
  if (typeof init.body === 'string') {
    try {
      jsonBody = JSON.parse(init.body)
    } catch {
      jsonBody = init.body
    }
  }
  const path = pathOf(url)
  calls.push({ path, method, jsonBody, url })

  if (path === '/api/chat' && method === 'POST') {
    return jsonResponse({
      type: 'ai',
      answer:
        'The Five Mysteries (አምስቱ ምሥጢራት) are: Mystery of the Trinity, Incarnation, Baptism, Holy Communion, and Resurrection of the Dead.',
      sources: [{ title: 'Ethiopian Orthodox catechesis', excerpt: 'Five Mysteries' }],
    })
  }

  // Deliberately return non-empty structured hits so a bad router would terminate early.
  if (path.startsWith('/api/synaxarium/search')) {
    return jsonResponse({
      query: 'bait',
      count: 1,
      results: [{ slug: 'bait-saint', title: 'Bait Saint', preview: 'Should not win theology' }],
    })
  }
  if (path.startsWith('/api/prayers/search')) {
    return jsonResponse({
      query: 'bait',
      count: 1,
      results: [{ slug: 'bait-prayer', title: 'Bait Prayer', preview: 'Should not win theology' }],
    })
  }
  if (path.startsWith('/api/hymns/search')) {
    return jsonResponse({
      query: 'bait',
      count: 1,
      results: [
        {
          slug: 'bait-hymn',
          title: 'Bait Hymn',
          title_amharic: '\u1218\u12DD\u1219\u122D',
          form: 'mezmur',
        },
      ],
    })
  }
  if (path.startsWith('/api/calendar/search')) {
    return jsonResponse({
      query: 'Meskel',
      count: 1,
      results: [
        {
          source_type: 'observance',
          slug: 'meskel',
          title: 'Meskel',
          preview: 'Finding of the True Cross',
        },
      ],
    })
  }
  if (path.startsWith('/api/calendar/today') || path.startsWith('/api/calendar/date')) {
    return jsonResponse({
      type: 'calendar_today',
      gregorian_date: '2026-10-16',
      ethiopian_label: 'Mock',
      fasting_status: { is_fast_day: true, label: 'Fasting day' },
      season: { title: 'Mock' },
      synaxarium: [],
      observances: [{ slug: 'mock', title: 'Mock observance' }],
    })
  }
  if (path.startsWith('/api/calendar/')) {
    return jsonResponse({
      gregorian_date: '2026-10-16',
      ethiopian_label: 'Mock',
      fasting_status: { is_fast_day: false, label: 'Not a fasting day' },
      season: { title: 'Mock' },
      synaxarium: [],
      observances: [],
      results: [],
      count: 0,
    })
  }
  if (path.startsWith('/api/synaxarium/day')) {
    return jsonResponse({
      type: 'synaxarium_today',
      day: { slug: 'mock', ethiopian_month: 'Meskerem', ethiopian_day: 1 },
      count: 1,
      commemorations: [{ slug: 'mock-saint', title: 'Mock Saint', preview: 'Commemoration' }],
    })
  }
  if (path.startsWith('/api/bible/')) {
    return jsonResponse({ results: [], count: 0 })
  }

  return jsonResponse({ detail: `unmocked ${path}` }, 404)
}

const { isExplanatoryTheologyQuery, detectCalendarRoute } = await import(
  '../src/lib/searchBuddy/calendarStructuredSearch.ts'
)
const { shouldUseAmharicStructuredPath } = await import(
  '../src/lib/searchBuddy/amharicStructuredSearch.ts'
)
const { sendSearchBuddyMessage } = await import('../src/lib/searchBuddy/sendSearchBuddyMessage.ts')
const { parseSearchBuddyResponse, isEmptySearchBuddyResponse } = await import(
  '../src/lib/searchBuddy/parseSearchBuddyResponse.ts'
)

const FIVE =
  'What are the Five Mysteries of the Ethiopian Orthodox Tewahedo Church?'
const FIVE_BI =
  'What are the Five Mysteries (\u12A0\u121D\u1235\u1271 \u121D\u1225\u1322\u122B\u1275) of the Ethiopian Orthodox Tewahedo Church? List all five in English and Amharic, explain each, and provide supporting Bible verses.'
const TRINITY = 'Explain the Holy Trinity.'
// ምሥጢረ ሥላሴ ምንድን ነው?
const AM_TRINITY =
  '\u121D\u1225\u1322\u122C \u1225\u120B\u1234 \u121D\u1295\u12F5\u1295 \u1290\u12CD?'
const DIFF =
  'Explain the difference between the Five Mysteries and Seven Sacraments.'
const JOHN = 'John 3:16'
const JOHN_AM = '\u12EE\u1210\u1295\u1235 3:16'
const MATTHEW_CH = 'Show Matthew chapter 5.'
const SAINT = 'Saint Tekle Haymanot synaxarium'
const SYN_TODAY = "Today's Synaxarium"
const FAST = "What is today's fasting information?"
const MESKEL = 'Find the feast of Meskel'
const HELLO = 'Hello'

// Heuristics
assert.equal(isExplanatoryTheologyQuery(FIVE), true)
assert.equal(isExplanatoryTheologyQuery(FIVE_BI), true)
assert.equal(isExplanatoryTheologyQuery(TRINITY), true)
assert.equal(isExplanatoryTheologyQuery(AM_TRINITY), true)
assert.equal(isExplanatoryTheologyQuery(DIFF), true)
assert.equal(isExplanatoryTheologyQuery('mysteries'), true)
assert.equal(isExplanatoryTheologyQuery('\u121D\u1225\u1322\u122B\u1275'), true)
assert.equal(shouldUseAmharicStructuredPath(FIVE_BI), false)
assert.equal(shouldUseAmharicStructuredPath(AM_TRINITY), false)
assert.equal(detectCalendarRoute(FIVE_BI), null)
assert.equal(detectCalendarRoute(SYN_TODAY)?.kind, 'synaxarium_today')
assert.equal(detectCalendarRoute(MESKEL)?.kind, 'calendar_search')
console.log('theology chat heuristics: ok')

function reset() {
  calls.length = 0
}
function chatPosts() {
  return calls.filter((c) => c.path === '/api/chat' && c.method === 'POST')
}
function synaxGets() {
  return calls.filter((c) => c.path.startsWith('/api/synaxarium/search'))
}
function prayerGets() {
  return calls.filter((c) => c.path.startsWith('/api/prayers/search'))
}
function hymnGets() {
  return calls.filter((c) => c.path.startsWith('/api/hymns/search'))
}

async function assertTheologyChat(q, label) {
  reset()
  const result = await sendSearchBuddyMessage(q)
  assert.equal(result.response.type, 'ai', `${label}: type ai, got ${result.response.type}`)
  assert.equal(result.empty, false, `${label}: not empty`)
  assert.ok(chatPosts().length >= 1, `${label}: POST /api/chat`)
  assert.equal(synaxGets().length, 0, `${label}: no synaxarium/search`)
  assert.equal(prayerGets().length, 0, `${label}: no prayers/search`)
  assert.equal(hymnGets().length, 0, `${label}: no hymns/search`)
  assert.ok(String(chatPosts()[0].jsonBody?.message || '').length > 0, `${label}: chat body`)
  console.log(JSON.stringify({ case: label, type: result.response.type, chat: chatCallsCount() }))
}

function chatCallsCount() {
  return chatPosts().length
}

await assertTheologyChat(FIVE, 'five-mysteries-en')
await assertTheologyChat(FIVE_BI, 'five-mysteries-bilingual')
await assertTheologyChat(TRINITY, 'holy-trinity')
await assertTheologyChat(AM_TRINITY, 'amharic-trinity')
await assertTheologyChat(DIFF, 'mysteries-vs-sacraments')
await assertTheologyChat(HELLO, 'greeting')

// Specialized routes still structured (mocked calendar/synax day)
reset()
const syn = await sendSearchBuddyMessage(SYN_TODAY)
assert.equal(chatPosts().length, 0, 'synaxarium today skips chat')
assert.ok(
  syn.response.type === 'synaxarium_today' ||
    syn.response.type === 'unknown' ||
    syn.response.type.startsWith('calendar') ||
    syn.response.type.startsWith('synaxarium'),
  `synaxarium today got ${syn.response.type}`,
)
console.log(JSON.stringify({ case: 'synaxarium-today', type: syn.response.type }))

reset()
const fast = await sendSearchBuddyMessage(FAST)
assert.ok(
  ['fasting_today', 'calendar_today', 'fast_today', 'calendar_fast', 'calendar_day'].includes(
    fast.response.type,
  ) ||
    fast.response.type.startsWith('calendar'),
  `fast today got ${fast.response.type}`,
)
assert.equal(chatPosts().length, 0, 'fast today skips chat')
console.log(JSON.stringify({ case: 'fast-today', type: fast.response.type }))

reset()
const meskel = await sendSearchBuddyMessage(MESKEL)
assert.ok(
  meskel.response.type === 'calendar_search' || meskel.response.type.startsWith('calendar'),
  `Meskel got ${meskel.response.type}`,
)
assert.equal(chatPosts().length, 0, 'Meskel feast stays calendar')
console.log(JSON.stringify({ case: 'meskel', type: meskel.response.type }))

// Bible refs still chat (resolveBibleQuery / English chat) — accept bible_* or ai from mock
reset()
globalThis.fetch = async (input, init = {}) => {
  const url = String(input)
  const method = String(init.method || (init.body ? 'POST' : 'GET')).toUpperCase()
  let jsonBody = null
  if (typeof init.body === 'string') {
    try {
      jsonBody = JSON.parse(init.body)
    } catch {
      jsonBody = init.body
    }
  }
  const path = pathOf(url)
  calls.push({ path, method, jsonBody, url })
  if (path === '/api/chat' && method === 'POST') {
    const message = String(jsonBody?.message || '')
    if (/john|3:16|matthew|chapter/i.test(message) || message.includes('\u12EE\u1210\u1295\u1235')) {
      return jsonResponse({
        type: 'bible_reference',
        reference: 'John 3:16',
        chapter: 3,
        verse: 16,
        book: { slug: 'john', name_en: 'John' },
        text: 'For God so loved the world…',
        verses: [{ verse: 16, text: 'For God so loved the world…' }],
      })
    }
    return jsonResponse({ type: 'ai', answer: 'Hello from the assistant.' })
  }
  return jsonResponse({ results: [], count: 0 })
}

reset()
const john = await sendSearchBuddyMessage(JOHN)
assert.ok(
  john.response.type === 'bible_reference' || john.response.type === 'bible_chapter',
  `John got ${john.response.type}`,
)
assert.ok(chatPosts().length >= 1, 'John uses /api/chat')
assert.equal(synaxGets().length, 0)
console.log(JSON.stringify({ case: 'john', type: john.response.type }))

reset()
const johnAm = await sendSearchBuddyMessage(JOHN_AM)
assert.ok(
  johnAm.response.type === 'bible_reference' ||
    johnAm.response.type === 'bible_chapter' ||
    johnAm.response.type === 'bible_search',
  `Amharic John got ${johnAm.response.type}`,
)
console.log(JSON.stringify({ case: 'john-am', type: johnAm.response.type }))

reset()
const matt = await sendSearchBuddyMessage(MATTHEW_CH)
assert.ok(chatPosts().length >= 1, 'Matthew chapter uses chat resolver path')
console.log(JSON.stringify({ case: 'matthew-ch', type: matt.response.type }))

// Error / empty handling (parse layer)
const malformed = parseSearchBuddyResponse({ nonsense: true })
assert.ok(malformed)
const emptyAi = parseSearchBuddyResponse({ type: 'ai', answer: '   ' })
assert.equal(isEmptySearchBuddyResponse(emptyAi), true)

// Cancelled / already-aborted signal: must not hang; may throw or short-circuit.
reset()
const controller = new AbortController()
controller.abort()
let cancelledHandled = false
try {
  await sendSearchBuddyMessage(FIVE, { signal: controller.signal })
  cancelledHandled = true
} catch (error) {
  cancelledHandled = true
  assert.ok(
    error?.name === 'AbortError' ||
      error?.code === 'aborted' ||
      error?.code === 'timeout' ||
      /abort/i.test(String(error?.message || error)),
    `expected abort-related error, got ${error}`,
  )
}
assert.equal(cancelledHandled, true, 'aborted request does not hang')
console.log(JSON.stringify({ case: 'cancelled', ok: true }))

// Saint + synaxarium word: may be structured; must not be confused with Five Mysteries
reset()
globalThis.fetch = async (input, init = {}) => {
  const url = String(input)
  const method = String(init.method || (init.body ? 'POST' : 'GET')).toUpperCase()
  let jsonBody = null
  if (typeof init.body === 'string') {
    try {
      jsonBody = JSON.parse(init.body)
    } catch {
      jsonBody = init.body
    }
  }
  const path = pathOf(url)
  calls.push({ path, method, jsonBody, url })
  if (path === '/api/chat') {
    return jsonResponse({ type: 'ai', answer: 'Saint Tekle Haymanot is commemorated…' })
  }
  if (path.startsWith('/api/synaxarium')) {
    return jsonResponse({
      results: [{ slug: 'tekle', title: 'Abune Tekle Haymanot', preview: 'Saint' }],
      commemorations: [{ slug: 'tekle', title: 'Abune Tekle Haymanot' }],
      count: 1,
      day: { slug: 'mock' },
    })
  }
  return jsonResponse({ results: [], count: 0 })
}
const saint = await sendSearchBuddyMessage(SAINT)
assert.notEqual(saint.response.type, 'unknown')
console.log(JSON.stringify({ case: 'saint-synax', type: saint.response.type }))

console.log('test-search-buddy-theology-chat: ok')
