/**
 * Regression suite: Bible page, Mezmur page, Search Buddy, voice parity.
 *
 * Always runs:
 *   1) Architecture source assertions
 *   2) Mocked fetch pipeline / call-graph tests
 *
 * When VITE_TEWAHEDO_AI_API_URL is set (via --env-file-if-exists=.env.local):
 *   3) Live FastAPI smoke for the same cases
 *
 * Run: npm run test:search-regression
 */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'

const root = join(dirname(fileURLToPath(import.meta.url)), '..')
const readSrc = (rel) => readFileSync(join(root, rel), 'utf8')
const realFetch = globalThis.fetch.bind(globalThis)

const JOHN_ASR =
  '\u12E8\u12EE\u1200\u1295\u1235 \u12CB\u1295\u130C\u120D \u121D\u12D5\u122B\u134D \u1201\u1208\u1275 \u1241\u1325\u122D \u1236\u1235\u1275'
const GENESIS =
  '\u12A6\u122A\u1275 \u12D8\u134D\u1325\u1228\u1275 \u121D\u12D5\u122B\u134D \u1201\u1208\u1275 \u1241\u1325\u122D \u12A0\u1295\u12F5'
const JOHN_COLON = '\u12EE\u1210\u1295\u1235 3\u136516'
const HYMN_TITLE = '\u12E8\u1235\u1219 \u1275\u122D\u1313\u121C'
const HYMN_LYRIC =
  '\u12E8\u1218\u120B\u12D5\u12AD\u1275 \u12A0\u1208\u1243 \u1245\u12F1\u1235 \u121A\u12AB\u12A4\u120D'

function readConfiguredAiUrl() {
  const fromMeta =
    typeof import.meta !== 'undefined' && import.meta.env
      ? String(import.meta.env.VITE_TEWAHEDO_AI_API_URL || '').trim()
      : ''
  const fromProcess = String(process.env.VITE_TEWAHEDO_AI_API_URL || '').trim()
  return (fromMeta || fromProcess).replace(/\/+$/, '')
}

function setAiUrl(url) {
  process.env.VITE_TEWAHEDO_AI_API_URL = url
  if (typeof import.meta !== 'undefined' && import.meta.env) {
    import.meta.env.VITE_TEWAHEDO_AI_API_URL = url
  }
}

const liveBaseFromEnv = readConfiguredAiUrl()

function jsonResponse(body, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { 'Content-Type': 'application/json' },
  })
}

function pathOf(url) {
  try {
    return new URL(String(url)).pathname
  } catch {
    return String(url)
  }
}

async function withRetry(fn, attempts = 3) {
  let last
  for (let i = 0; i < attempts; i += 1) {
    try {
      return await fn()
    } catch (error) {
      last = error
      if (error?.code === 'unavailable' || error?.code === 'timeout') {
        await new Promise((r) => setTimeout(r, 400 * (i + 1)))
        continue
      }
      throw error
    }
  }
  throw last
}

// ---------------------------------------------------------------------------
// 1) Architecture assertions
// ---------------------------------------------------------------------------
console.log('--- architecture ---')

const bibleBar = readSrc('src/components/bible/BibleSearchBar.tsx')
assert.ok(!bibleBar.includes('parseBibleReference'), 'Bible page must not use parseBibleReference')
assert.ok(bibleBar.includes('searchBibleShared'), 'Bible page must use searchBibleShared')

const sharedBible = readSrc('src/lib/search/sharedBibleSearch.ts')
assert.ok(sharedBible.includes('resolveBibleQuery'), 'sharedBibleSearch must call resolveBibleQuery')
assert.ok(!sharedBible.includes('parseBibleReference'), 'sharedBibleSearch must not parse locally')
assert.ok(!sharedBible.includes('resolveBibleBook'), 'sharedBibleSearch must not resolveBibleBook')

const resolveBibleSrc = readSrc('src/lib/search/resolveBibleQuery.ts')
assert.ok(resolveBibleSrc.includes("path: '/api/chat'"))
assert.ok(resolveBibleSrc.includes('message: query'))
assert.ok(resolveBibleSrc.includes('timezone'))

const mezmurPage = readSrc('src/pages/PublicMezmurLibrary.tsx')
assert.ok(!mezmurPage.includes('Say the letters separately'), 'remove letter-by-letter hint')
assert.ok(mezmurPage.includes('amharicOnly'), 'Mezmur voice must lock Amharic')
assert.ok(mezmurPage.includes('searchMezmursUnified'), 'Mezmur uses backend hymn search')
assert.ok(mezmurPage.includes('heardTranscript'), 'Mezmur keeps transcript visible')

const unifiedHymn = readSrc('src/lib/search/unifiedHymnSearch.ts')
assert.ok(unifiedHymn.includes('searchHymns'), 'unifiedHymnSearch uses shared searchHymns')
assert.ok(!/\.sort\s*\(/.test(unifiedHymn), 'no React re-rank/sort of hymn results')

const searchHymnsSrc = readSrc('src/lib/search/searchHymns.ts')
assert.ok(searchHymnsSrc.includes('fetchHymnsSearchApi'))

const amharicRoute = readSrc('src/lib/searchBuddy/amharicStructuredSearch.ts')
assert.ok(amharicRoute.includes('resolveBibleQuery'))
assert.ok(amharicRoute.includes('searchHymns'))
const bibleIdx = amharicRoute.indexOf('if (bibleLike)')
const hymnIdx = amharicRoute.indexOf('// Hymn routing')
assert.ok(bibleIdx >= 0 && hymnIdx > bibleIdx, 'Bible routing must precede hymn routing')

const voiceSrc = readSrc('src/components/search/MezmurVoiceSearch.tsx')
assert.ok(voiceSrc.includes('amharicOnly'))
assert.ok(voiceSrc.includes('transcribeAudio'))
assert.ok(
  voiceSrc.includes("lang === 'am' || amharicOnly") || voiceSrc.includes("amharicOnly ? 'am'"),
  'Amharic-only must skip browser SpeechRecognition',
)
assert.ok(readSrc('src/lib/ai/transcribeAudio.ts').includes("path: '/api/transcribe'"))

const leadSrc = readSrc('src/lib/search/assistantLead.ts')
assert.ok(leadSrc.includes("case 'bible_reference'"))
assert.ok(leadSrc.includes('Here are the hymns I found.'))

console.log('architecture: ok')

// ---------------------------------------------------------------------------
// 2) Mocked fetch pipelines
// ---------------------------------------------------------------------------
console.log('--- mocked pipelines ---')

setAiUrl('http://mock-ai.test')
const calls = []
globalThis.__mockTranscript = JOHN_ASR

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
  const isForm = typeof FormData !== 'undefined' && init.body instanceof FormData
  calls.push({ path: pathOf(url), method, jsonBody, isForm, url })

  const path = pathOf(url)

  if (path === '/api/transcribe' && method === 'POST') {
    return jsonResponse({ text: globalThis.__mockTranscript || JOHN_ASR, language: 'am' })
  }

  if (path === '/api/chat' && method === 'POST') {
    const message = String(jsonBody?.message || '')
    if (message.includes('\u12D8\u134D\u1325\u1228\u1275')) {
      return jsonResponse({
        type: 'bible_reference',
        reference: 'Genesis 2:1',
        chapter: 2,
        verse: 1,
        book: { slug: 'genesis', name_en: 'Genesis' },
        text: 'Thus the heavens and the earth were finished…',
        verses: [{ verse: 1, text: 'Thus the heavens and the earth were finished…' }],
      })
    }
    if (message.includes('3') && (message.includes('\u1365') || message.includes(':'))) {
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
    return jsonResponse({
      type: 'bible_reference',
      reference: 'John 2:3',
      chapter: 2,
      verse: 3,
      book: { slug: 'john', name_en: 'John' },
      text: 'And when they wanted wine…',
      verses: [{ verse: 3, text: 'And when they wanted wine…' }],
    })
  }

  if (path === '/api/hymns/search') {
    const q = decodeURIComponent((url.split('q=')[1] || '').split('&')[0] || '')
    return jsonResponse({
      query: q,
      count: 2,
      results: [
        {
          slug: 'yesimu-tirguame',
          title: 'Yesimu Tirguame',
          title_amharic: HYMN_TITLE,
          form: 'mezmur',
          preview: 'Saint Michael…',
          youtube_url: 'https://www.youtube.com/watch?v=x',
          primary_language: 'amharic',
        },
        { slug: 'other-hymn', title: 'Other', title_amharic: '\u12A0\u120D\u120B', form: 'mezmur' },
      ],
    })
  }

  if (
    path.startsWith('/api/prayers/') ||
    path.startsWith('/api/synaxarium/') ||
    path.startsWith('/api/bible/search') ||
    path.startsWith('/api/calendar/')
  ) {
    return jsonResponse({ results: [], count: 0, query: '' })
  }

  return jsonResponse({ detail: `unmocked ${path}` }, 404)
}

const { transcribeAudio } = await import('../src/lib/ai/transcribeAudio.ts')
const { resolveBibleQuery } = await import('../src/lib/search/resolveBibleQuery.ts')
const { searchBibleShared, resolveSharedBibleDestination } = await import(
  '../src/lib/search/sharedBibleSearch.ts'
)
const { searchHymns } = await import('../src/lib/search/searchHymns.ts')
const { searchMezmursUnified } = await import('../src/lib/search/unifiedHymnSearch.ts')
const { sendSearchBuddyMessage } = await import(
  '../src/lib/searchBuddy/sendSearchBuddyMessage.ts'
)
const { assistantLeadForResponse } = await import('../src/lib/search/assistantLead.ts')

const resetCalls = () => {
  calls.length = 0
}
const chatCalls = () => calls.filter((c) => c.path === '/api/chat' && c.method === 'POST')
const hymnCalls = () => calls.filter((c) => c.path === '/api/hymns/search')
const transcribeCalls = () => calls.filter((c) => c.path === '/api/transcribe')

// Bible page
resetCalls()
const b1 = await searchBibleShared(JOHN_ASR, { language: 'am' })
assert.equal(b1.structured?.type, 'bible_reference')
assert.equal(b1.structured?.reference, 'John 2:3')
assert.equal(b1.empty, false, 'must not show not-found when bible_reference succeeds')
assert.ok(chatCalls().length >= 1)
assert.equal(chatCalls()[0].jsonBody.message, JOHN_ASR)
assert.ok(chatCalls()[0].jsonBody.timezone)
assert.equal(hymnCalls().length, 0)
assert.ok((b1.structured?.text || b1.structured?.verses?.[0]?.text || '').length > 0)
const b1Route = resolveSharedBibleDestination(b1)
assert.ok(b1Route?.startsWith('/bible/john/2'))
assert.notEqual(assistantLeadForResponse(b1.structured, b1.empty), 'Here are the hymns I found.')
console.log(JSON.stringify({ bible: 'john-asr', ref: 'John 2:3', route: b1Route }))

resetCalls()
const b2 = await resolveBibleQuery(GENESIS)
assert.equal(b2.response.reference, 'Genesis 2:1')
assert.ok(b2.route?.startsWith('/bible/genesis/2'))
console.log(JSON.stringify({ bible: 'genesis', ref: 'Genesis 2:1' }))

resetCalls()
const b3 = await resolveBibleQuery(JOHN_COLON)
assert.equal(b3.response.reference, 'John 3:16')
assert.ok(b3.route?.startsWith('/bible/john/3'))
console.log(JSON.stringify({ bible: 'john-colon', ref: 'John 3:16' }))

// Mezmur page
resetCalls()
const m1 = await searchMezmursUnified(HYMN_TITLE, { limit: 20 })
assert.equal(m1.items[0]?.slug, 'yesimu-tirguame')
assert.ok(hymnCalls().length >= 1)
assert.equal(chatCalls().length, 0)
console.log(JSON.stringify({ mezmur: 'title', first: 'yesimu-tirguame' }))

resetCalls()
const m2 = await searchMezmursUnified(HYMN_LYRIC, { limit: 20 })
const m2direct = await searchHymns(HYMN_LYRIC, { limit: 20 })
assert.equal(m2.items[0]?.slug, 'yesimu-tirguame')
assert.deepEqual(
  m2.items.map((i) => i.slug),
  m2direct.results.map((r) => r.slug),
)
assert.equal(chatCalls().length, 0, 'lyric must not route to Bible')
console.log(JSON.stringify({ mezmur: 'lyric', first: 'yesimu-tirguame' }))

// Search Buddy
resetCalls()
const sb1 = await sendSearchBuddyMessage(JOHN_ASR)
assert.equal(sb1.response.type, 'bible_reference')
assert.equal(sb1.response.reference, 'John 2:3')
assert.equal(hymnCalls().length, 0, 'no hymn search after bible_reference')
assert.notEqual(assistantLeadForResponse(sb1.response, sb1.empty), 'Here are the hymns I found.')
console.log(JSON.stringify({ buddy: 'john', hymnsAfter: 0 }))

resetCalls()
const sb2 = await sendSearchBuddyMessage(HYMN_TITLE)
assert.equal(sb2.response.type, 'hymn_search')
assert.equal(sb2.response.results?.[0]?.slug, 'yesimu-tirguame')
console.log(JSON.stringify({ buddy: 'title', slug: 'yesimu-tirguame' }))

resetCalls()
const sb3plain = await sendSearchBuddyMessage(HYMN_LYRIC)
assert.notEqual(sb3plain.response.type, 'bible_reference')
assert.notEqual(sb3plain.response.type, 'hymn_search')
const sb3ctx = await sendSearchBuddyMessage(HYMN_LYRIC, { hymnContext: true })
assert.equal(sb3ctx.response.type, 'hymn_search')
assert.equal(sb3ctx.response.results?.[0]?.slug, 'yesimu-tirguame')
console.log(JSON.stringify({ buddy: 'lyric', plain: sb3plain.response.type, ctx: 'hymn_search' }))

// Voice parity
resetCalls()
globalThis.__mockTranscript = JOHN_ASR
const voiceBible = await transcribeAudio(new Blob(['a'], { type: 'audio/webm' }), { language: 'am' })
assert.equal(voiceBible.text, JOHN_ASR)
assert.ok(transcribeCalls()[0]?.isForm)
const fromVoice = await resolveBibleQuery(voiceBible.text)
const fromTyped = await resolveBibleQuery(JOHN_ASR)
assert.equal(fromVoice.response.reference, fromTyped.response.reference)
assert.equal(fromVoice.route, fromTyped.route)
assert.ok(chatCalls().every((c) => c.jsonBody?.message === JOHN_ASR))
console.log(JSON.stringify({ voice: 'bible-parity', ref: fromVoice.response.reference }))

resetCalls()
globalThis.__mockTranscript = HYMN_TITLE
const voiceHymn = await transcribeAudio(new Blob(['b'], { type: 'audio/webm' }), { language: 'am' })
assert.equal(voiceHymn.text, HYMN_TITLE)
const hymnVoice = await searchHymns(voiceHymn.text, { limit: 20 })
const hymnTyped = await searchHymns(HYMN_TITLE, { limit: 20 })
assert.deepEqual(
  hymnVoice.results.map((r) => r.slug),
  hymnTyped.results.map((r) => r.slug),
)
assert.equal(hymnVoice.results[0]?.slug, 'yesimu-tirguame')
assert.equal(chatCalls().length, 0)
console.log(JSON.stringify({ voice: 'hymn-parity', first: 'yesimu-tirguame' }))

console.log('mocked pipelines: ok')

// ---------------------------------------------------------------------------
// 3) Live FastAPI smoke (optional)
// ---------------------------------------------------------------------------
globalThis.fetch = realFetch
if (!liveBaseFromEnv || process.env.SEARCH_REGRESSION_MOCK_ONLY === '1') {
  console.log('live API: skipped')
  console.log('test-search-regression: ok')
  process.exit(0)
}

console.log('--- live API ---')
setAiUrl(liveBaseFromEnv)

const { getAiApiBaseUrl } = await import('../src/lib/ai/aiConfig.ts')
assert.equal(getAiApiBaseUrl(), liveBaseFromEnv)

const liveBible = await withRetry(() => resolveBibleQuery(JOHN_ASR))
assert.equal(liveBible.response.type, 'bible_reference')
assert.equal(liveBible.response.reference, 'John 2:3')
assert.ok(liveBible.route?.startsWith('/bible/john/2'))
assert.ok(!liveBible.empty)

const liveGen = await withRetry(() => resolveBibleQuery(GENESIS))
assert.equal(liveGen.response.reference, 'Genesis 2:1')

const liveJ316 = await withRetry(() => resolveBibleQuery(JOHN_COLON))
assert.equal(liveJ316.response.reference, 'John 3:16')

const liveTitle = await withRetry(() => searchHymns(HYMN_TITLE, { limit: 20 }))
assert.equal(liveTitle.results[0]?.slug, 'yesimu-tirguame')

const liveLyric = await withRetry(() => searchHymns(HYMN_LYRIC, { limit: 20 }))
assert.equal(liveLyric.results[0]?.slug, 'yesimu-tirguame')

const liveBuddy = await withRetry(() => sendSearchBuddyMessage(JOHN_ASR))
assert.equal(liveBuddy.response.type, 'bible_reference')
assert.equal(liveBuddy.response.reference, 'John 2:3')
assert.notEqual(assistantLeadForResponse(liveBuddy.response, liveBuddy.empty), 'Here are the hymns I found.')

const liveBuddyTitle = await withRetry(() => sendSearchBuddyMessage(HYMN_TITLE))
assert.equal(liveBuddyTitle.response.type, 'hymn_search')

const liveBuddyLyricCtx = await withRetry(() =>
  sendSearchBuddyMessage(HYMN_LYRIC, { hymnContext: true }),
)
assert.equal(liveBuddyLyricCtx.response.type, 'hymn_search')

console.log(
  JSON.stringify({
    live: {
      john: liveBible.response.reference,
      genesis: liveGen.response.reference,
      j316: liveJ316.response.reference,
      hymn: liveTitle.results[0]?.slug,
      lyric: liveLyric.results[0]?.slug,
    },
  }),
)
console.log('live API: ok')
console.log('test-search-regression: ok')
