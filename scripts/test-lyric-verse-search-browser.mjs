/**
 * Real React pages (Mezmur library, Mezmur detail, Bible search bar) against a mocked AI API and an in-memory
 * PostgREST emulator. No Supabase project, no SQL, no network. All verse/lyric text below is test FIXTURE data.
 * Run: node scripts/test-lyric-verse-search-browser.mjs
 */
import assert from 'node:assert/strict'
import { chromium } from 'playwright'
import { createServer } from 'vite'

process.env.VITE_SUPABASE_URL = 'https://lyric-search.supabase.co'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_fixture_only'
process.env.VITE_TEWAHEDO_AI_API_URL = 'https://ai-lyric-search.example'
const PORT = 4190

// ------------------------------------------------------------------ fixtures
const mezmur = (slug, title, extra = {}) => ({
  mezmur_id: `id-${slug}`, slug, title, title_amharic: null, title_english: null, primary_language: 'am', form: 'mezmur',
  singer_name: null, youtube_url: null, audio_url: null, image_path: null, legacy_thumbnail_url: null, search_keywords: null,
  lyrics_amharic: null, lyrics_transliteration: null, lyrics_english: null, lyrics_geez: null, lyrics_oromo: null,
  status: 'published', rights_status: 'owned', description: null, description_amharic: null, ...extra })
const hymns = [
  mezmur('selam-lenante', 'Selam Lenante', {
    title_amharic: 'ሰላም ለናንተ',
    lyrics_amharic: 'ሠላም ለናንተ ይሁን\nእግዚአብሔር ከእናንተ ጋር ይሁን',            // stored with the variant letter ሠ
    lyrics_transliteration: 'Selam lenante yihun Egziabher kenante gar yihun',
    lyrics_english: 'Peace be with you.  The Lord be with you all.',
  }),
  mezmur('peace', 'Peace'),
  mezmur('praise-the-lord', 'Praise the Lord', { primary_language: 'en', lyrics_english: 'Praise the Lord, all you nations; praise him, all you peoples.' }),
  mezmur('draft-hymn', 'Draft Peace Hymn', { status: 'draft', lyrics_english: 'Secret draft peace lyric' }),
  mezmur('restricted-hymn', 'Restricted Hymn', { rights_status: 'restricted' }), // the public view nulls its lyrics
]
const apiRow = (row, preview = '') => ({ slug: row.slug, title: row.title, title_amharic: row.title_amharic, title_english: row.title_english,
  primary_language: row.primary_language, form: row.form, preview, youtube_url: null, audio_url: null, zemari: null })

const editions = [{ id: 'e-am', code: 'am', name: 'Amharic', language_code: 'am' }, { id: 'e-web', code: 'web', name: 'World English Bible', language_code: 'en' }]
const books = [
  { id: 'b-gen', canonical_number: 1, collection: 'old', slug: 'genesis', name_en: 'Genesis', name_am: 'ኦሪት ዘፍጥረት', sort_order: 1, source_status: 'available' },
  { id: 'b-john', canonical_number: 4, collection: 'new', slug: 'john', name_en: 'John', name_am: 'የዮሐንስ ወንጌል', sort_order: 50, source_status: 'available' },
  { id: 'b-1john', canonical_number: 22, collection: 'new', slug: 'first-john', name_en: 'First John', name_am: '1ኛ የዮሐንስ መልእክት', sort_order: 68, source_status: 'available' },
]
const sources = []
for (const [bookId, name, nameAm] of [['b-gen', 'Genesis', 'ኦሪት ዘፍጥረት'], ['b-john', 'John', 'የዮሐንስ ወንጌል'], ['b-1john', '1 John', '1ኛ የዮሐንስ መልእክት']]) {
  for (const [code, edition] of [['am', 'e-am'], ['web', 'e-web']]) {
    sources.push({ id: `s-${bookId}-${code}`, canonical_book_id: bookId, edition_id: edition, source_order: 1, source_book_number: 1,
      source_name_en: name, source_name_am: code === 'am' ? nameAm : null })
  }
}
const chapterCount = { 'b-gen': 1, 'b-john': 3, 'b-1john': 4 }
const chapters = []
for (const source of sources) {
  for (let n = 1; n <= chapterCount[source.canonical_book_id]; n += 1) chapters.push({ id: `${source.id}-c${n}`, source_book_id: source.id, chapter_number: n, source_order: n })
}
const verses = []
const verse = (bookId, code, chapter, number, text) => verses.push({ id: `v-${bookId}-${code}-${chapter}-${number}`, chapter_id: `s-${bookId}-${code}-c${chapter}`,
  verse_number: number, source_order: number, section_id: null, text })
verse('b-gen', 'web', 1, 1, 'In the beginning, God created the heavens and the earth.')
verse('b-gen', 'am', 1, 1, 'በመጀመሪያ እግዚአብሔር ሰማይንና ምድርን ፈጠረ።')
verse('b-john', 'web', 3, 16, 'For God so loved the world, that he gave his only born Son, that whoever believes in him should not perish, but have eternal life.')
verse('b-1john', 'web', 4, 8, "He who doesn't love doesn't know God, for God is love.")

// ------------------------------------------------------------------ PostgREST emulator
const likeRegex = (pattern) => {
  const source = pattern.replace(/[.+^${}()|[\]\\]/g, '\\$&').replace(/[%*]/g, '.*').replace(/_/g, '.')
  return new RegExp(`^${source}$`, 'isu') // dotAll: LIKE wildcards match newlines too
}
const columnMatches = (value, spec) => {
  const [op, ...rest] = spec.split('.')
  const arg = rest.join('.')
  if (op === 'eq') return String(value) === arg
  if (op === 'in') return arg.slice(1, -1).split(',').includes(String(value))
  if (op === 'gte') return Number(value) >= Number(arg)
  if (op === 'lte') return Number(value) <= Number(arg)
  if (op === 'ilike') return typeof value === 'string' && likeRegex(arg).test(value.normalize('NFC'))
  return true
}
const orGroup = (row, group) => {
  const parts = [...group.matchAll(/(\w+)\.ilike\."?([^",)]*)"?(?=,|\)|$)/g)]
  return parts.some((part) => columnMatches(row[part[1]], `ilike.${part[2]}`))
}
const requests = { mezmurSearch: [], mezmurPublic: [], bibleVerseSearch: [] }
const reserved = new Set(['select', 'order', 'limit', 'offset', 'or'])
function query(table, rows, url) {
  let out = rows
  for (const [key, value] of url.searchParams) {
    if (reserved.has(key)) continue
    out = out.filter((row) => columnMatches(row[key], value))
  }
  for (const group of url.searchParams.getAll('or')) out = out.filter((row) => orGroup(row, group))
  const limit = Number(url.searchParams.get('limit') || 1000)
  if (table === 'mezmur_public') requests.mezmurPublic.push({ or: url.searchParams.getAll('or').length, limit, slugIn: url.searchParams.get('slug') })
  if (table === 'bible_verses' && url.searchParams.getAll('text').length) requests.bibleVerseSearch.push({ filters: url.searchParams.getAll('text'), limit })
  return out.slice(0, limit)
}
const embedVerse = (row) => {
  const chapter = chapters.find((c) => c.id === row.chapter_id)
  const source = sources.find((s) => s.id === chapter.source_book_id)
  const book = books.find((b) => b.id === source.canonical_book_id)
  const edition = editions.find((e) => e.id === source.edition_id)
  return { ...row, bible_chapters: { ...chapter, bible_source_books: { ...source, bible_canonical_books: book, bible_editions: edition } } }
}

// ------------------------------------------------------------------ test server
let apiMode = 'ok' // ok | down
let chatMode = 'unknown' // unknown | down | irrelevant
const apiHits = { hymns: [] }
const corsHeaders = { 'access-control-allow-origin': '*', 'access-control-allow-headers': '*', 'access-control-allow-methods': '*' }

const server = await createServer({ server: { host: '127.0.0.1', port: PORT, strictPort: true } })
await server.listen()
let browser
let passed = 0
const test = async (name, fn) => {
  await fn()
  passed += 1
  console.log(`PASS ${name}`)
}
const plain = (text) => text.replace(/\s+/g, ' ').trim()

try {
  browser = await chromium.launch()
  for (const width of [360, 390, 1280]) {
    const context = await browser.newContext({ viewport: { width, height: 900 } })
    await context.addInitScript(() => localStorage.setItem('tewahedo-daily-locale', 'en'))
    const page = await context.newPage()
    const errors = []
    page.on('pageerror', (e) => errors.push(e.message))
    if (process.env.DEBUG_SEARCH) { page.on('console', (m) => console.log('[console]', m.type(), m.text().slice(0, 200))); page.on('requestfailed', (r) => console.log('[requestfailed]', r.url().slice(0, 140), r.failure()?.errorText)) }
    await page.route('https://lyric-search.supabase.co/**', async (route) => {
      const url = new URL(route.request().url())
      const table = url.pathname.split('/').at(-1)
      if (route.request().method() === 'OPTIONS') return route.fulfill({ status: 204, headers: corsHeaders })
      let rows = []
      if (table === 'mezmur_public') rows = query(table, hymns.filter((h) => h.status === 'published' || true), url) // the view is leaky on purpose: the app must filter
      else if (table === 'bible_canonical_books') rows = books
      else if (table === 'bible_editions') rows = editions
      else if (table === 'bible_source_books') rows = query(table, sources, url)
      else if (table === 'bible_chapters') rows = query(table, chapters, url)
      else if (table === 'bible_verses') rows = query(table, verses, url).map((row) => (url.searchParams.get('select')?.includes('bible_chapters') ? embedVerse(row) : row))
      const single = route.request().headers().accept?.includes('vnd.pgrst.object')
      await route.fulfill({ status: 200, contentType: 'application/json', headers: corsHeaders, body: JSON.stringify(single ? rows[0] || null : rows) })
    })
    await page.route('https://ai-lyric-search.example/**', async (route) => {
      const url = new URL(route.request().url())
      if (route.request().method() === 'OPTIONS') return route.fulfill({ status: 204, headers: corsHeaders })
      if (url.pathname === '/api/hymns/search') {
        const q = url.searchParams.get('q') || ''
        apiHits.hymns.push(q)
        if (apiMode === 'down') return route.fulfill({ status: 503, headers: corsHeaders, body: 'unavailable' })
        // Scripted backend ranking: exact title first, then the lyric match. Order is authoritative.
        const bySlug = (...slugs) => slugs.map((slug) => apiRow(hymns.find((h) => h.slug === slug)))
        const results = /^peace$/i.test(q) ? bySlug('peace', 'selam-lenante', 'draft-hymn')
          : /egziabher|እግዚአብሔር|ሰላም|selam/i.test(q) ? bySlug('selam-lenante')
            : /praise/i.test(q) ? bySlug('praise-the-lord') : []
        return route.fulfill({ status: 200, contentType: 'application/json', headers: corsHeaders, body: JSON.stringify({ query: q, count: results.length, results }) })
      }
      if (url.pathname === '/api/chat') {
        if (chatMode === 'down') return route.fulfill({ status: 503, headers: corsHeaders, body: 'unavailable' })
        const body = chatMode === 'irrelevant'
          ? { type: 'bible_search', results: [{ book: { slug: 'john', name_en: 'John' }, chapter: 3, verse: 16, text: 'Completely unrelated sentence about harvest.' }] }
          : { type: 'unknown', message: 'No Bible passage matched.' }
        return route.fulfill({ status: 200, contentType: 'application/json', headers: corsHeaders, body: JSON.stringify(body) })
      }
      return route.fulfill({ status: 404, headers: corsHeaders, body: '{}' })
    })
    const overflow = async () => assert.ok(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 1), `${width}px: no horizontal overflow`)

    // ============================================================== MEZMUR
    await test(`${width}: Mezmur exact title ranks first; lyric match shows the highlighted passage`, async () => {
      apiMode = 'ok'
      await page.goto(`http://127.0.0.1:${PORT}/hymns?q=Peace`)
      const cards = page.locator('a[class*=card]')
      await cards.first().waitFor()
      assert.match(plain(await cards.first().innerText()), /Peace/)
      assert.match(await cards.first().getAttribute('href'), /^\/hymns\/mezmur\/peace$/, 'title match opens plain detail link')
      const second = cards.nth(1)
      assert.match(await second.getAttribute('href'), /^\/hymns\/mezmur\/selam-lenante\?q=Peace$/, 'lyric match opens the hymn with the query')
      const excerpt = second.locator('[data-testid=mezmur-lyric-excerpt]')
      assert.equal(plain(await excerpt.innerText()), 'Peace be with you. The Lord be with you all.')
      assert.deepEqual(await excerpt.locator('mark').allInnerTexts(), ['Peace'])
      assert.equal(await page.locator('a[href*="draft-hymn"]').count(), 0, 'unpublished hymn from a leaky view is never shown')
      await overflow()
    })
    await test(`${width}: Amharic lyric phrase (variant spelling, Ethiopic punctuation) highlights and opens the passage`, async () => {
      await page.goto(`http://127.0.0.1:${PORT}/hymns?q=${encodeURIComponent('እግዚአብሔር  ከእናንተ ጋር።')}`)
      const excerpt = page.locator('[data-testid=mezmur-lyric-excerpt]').first()
      await excerpt.waitFor()
      assert.match(plain(await excerpt.innerText()), /እግዚአብሔር ከእናንተ ጋር ይሁን/)
      assert.ok((await excerpt.locator('mark').allInnerTexts()).includes('እግዚአብሔር'))
      await page.locator('a[class*=card]').first().click()
      await page.waitForURL(/\/hymns\/mezmur\/selam-lenante\?q=/)
      // The lyrics viewer highlights the matched words (CSS Custom Highlight API) without altering the text.
      await page.waitForFunction(() => (globalThis.CSS?.highlights?.get('lyric-match')?.size || 0) > 0, null, { timeout: 15000 })
      const marked = await page.evaluate(() => [...CSS.highlights.get('lyric-match')].map((range) => range.toString()))
      assert.ok(marked.some((text) => text.includes('እግዚአብሔር')), JSON.stringify(marked))
      await page.goBack()
      await page.locator('a[class*=card]').first().waitFor()
      assert.match(page.url(), /\/hymns\?q=/, 'Back returns to the search results')
    })
    await test(`${width}: API down → bounded public fallback is lyric-aware and consistent (English, Latin, Amharic, whitespace)`, async () => {
      apiMode = 'down'
      requests.mezmurPublic.length = 0
      const cases = [
        ['Peace', 'peace'],                                                 // exact title first
        ['  the   lord  be with   you ', 'selam-lenante'],                  // English lyric phrase, odd whitespace
        ['egziabher kenante', 'selam-lenante'],                             // Latin transliterated lyric phrase
        ['ሰላም ለናንተ ይሁን', 'selam-lenante'],                                // Amharic phrase; user typed ሰ, stored ሠ
      ]
      for (const [q, slug] of cases) {
        if (process.env.DEBUG_SEARCH) console.log('[case]', q)
        await page.goto(`http://127.0.0.1:${PORT}/hymns?q=${encodeURIComponent(q)}`)
        await page.locator('a[class*=card]').first().waitFor()
        const hrefs = await page.locator('a[class*=card]').evaluateAll((links) => links.map((a) => a.getAttribute('href').split('?')[0]))
        assert.equal(hrefs[0], `/hymns/mezmur/${slug}`, `${q}: first result (${hrefs.join(', ')})`)
        assert.ok(!hrefs.some((href) => /draft-hymn|restricted-hymn/.test(href) && q !== 'Restricted'), `${q}: unpublished/restricted lyrics never match`)
      }
      // Bounded: searches are filtered (`or`) with limit <= 60; the whole catalog is never requested for a search.
      const searches = requests.mezmurPublic.filter((r) => r.or > 0)
      assert.ok(searches.length >= 4 && searches.every((r) => r.limit <= 60), JSON.stringify(searches))
      apiMode = 'ok'
    })
    await test(`${width}: non-matching and too-short queries are calm; restricted hymn matches by title only`, async () => {
      apiMode = 'down'
      await page.goto(`http://127.0.0.1:${PORT}/hymns?q=${encodeURIComponent('zzqx nothing here')}`)
      await page.locator('[class*=status]').first().waitFor()
      assert.equal(await page.locator('a[class*=card]').count(), 0)
      await page.goto(`http://127.0.0.1:${PORT}/hymns?q=Restricted`)
      await page.locator('a[class*=card]').first().waitFor()
      assert.match(await page.locator('a[class*=card]').first().getAttribute('href'), /restricted-hymn$/)
      assert.equal(await page.locator('[data-testid=mezmur-lyric-excerpt]').count(), 0, 'no lyric excerpt for a restricted hymn')
      apiMode = 'ok'
      await overflow()
    })

    // ============================================================== BIBLE
    const bar = () => page.locator('input[class*=input]').first()
    const results = () => page.locator('ul[aria-label] a[class*=result]')
    const search = async (text) => {
      await page.goto(`http://127.0.0.1:${PORT}/bible`)
      await bar().fill(text)
      await results().first().waitFor({ timeout: 20000 })
    }
    const marks = async (index = 0) => results().nth(index).locator('mark').allInnerTexts()
    const excerptOf = async (index = 0) => plain(await results().nth(index).locator('p[class*=resultExcerpt]').innerText())

    await test(`${width}: Bible John 3:16 reference lookup still resolves exactly (structured card, real verse text)`, async () => {
      chatMode = 'unknown'
      await page.goto(`http://127.0.0.1:${PORT}/bible`)
      await bar().fill('John 3:16')
      const card = page.locator('[class*=structured]')
      await card.waitFor({ timeout: 20000 })
      const shown = plain(await card.innerText())
      assert.match(shown, /John 3:16/)
      assert.ok(shown.includes('For God so loved the world, that he gave his only born Son'), shown)
      assert.equal(await page.locator('ul[aria-label] a[class*=result]').count(), 0, 'a direct reference is not mixed with text hits')
    })
    await test(`${width}: Bible English sentence → exact verse, edition, excerpt, highlighted words, direct link`, async () => {
      chatMode = 'unknown'
      await search('for God so loved the world')
      const first = results().first()
      assert.equal(await first.getAttribute('href'), '/bible/john/3?edition=web#verse-16')
      assert.match(plain(await first.innerText()), /John 3:16/)
      assert.match(plain(await first.innerText()), /English · WEB/)
      const stored = verses.find((v) => v.id === 'v-b-john-web-3-16').text
      assert.ok(stored.includes((await excerptOf()).replace(/…/g, '')), 'excerpt is verbatim stored text')
      const highlighted = (await marks()).map((word) => word.toLowerCase())
      for (const word of ['for', 'god', 'so', 'loved', 'the', 'world']) assert.ok(highlighted.includes(word), `${word} highlighted: ${highlighted}`)
      await overflow()
    })
    await test(`${width}: Bible partial phrase and multiple matches rank the exact phrase first`, async () => {
      await search('in the begin')
      assert.equal(await results().first().getAttribute('href'), '/bible/genesis/1?edition=web#verse-1')
      await search('God is love')
      assert.equal(await results().first().getAttribute('href'), '/bible/first-john/4?edition=web#verse-8', 'phrase match first')
      assert.equal(await results().nth(1).getAttribute('href'), '/bible/john/3?edition=web#verse-16', 'keyword match second')
      assert.ok(await results().count() >= 2)
    })
    await test(`${width}: Bible Amharic sentence with Ethiopic punctuation/spacing → Amharic edition only`, async () => {
      for (const text of ['በመጀመሪያ እግዚአብሔር ሰማይንና ምድርን ፈጠረ።', 'በመጀመሪያ  እግዚአብሔር፣ ሰማይንና   ምድርን', 'እግዚአብሔር ሰማይ']) {
        await search(text)
        assert.equal(await results().first().getAttribute('href'), '/bible/genesis/1?edition=am#verse-1', text)
        assert.match(plain(await results().first().innerText()), /Amharic/)
        assert.equal(await page.locator('ul[aria-label] a[class*=result][href*="edition=web"]').count(), 0, 'no English edition mixed in')
        assert.equal(await excerptOf(), 'በመጀመሪያ እግዚአብሔር ሰማይንና ምድርን ፈጠረ።', 'verbatim Amharic verse')
        assert.ok((await marks()).length >= 1)
      }
    })
    await test(`${width}: Bible sentence ending in a number is searched as text, not treated as a missing book`, async () => {
      chatMode = 'unknown'
      // "God is love 4" has the shape <book words> <number>, but "God is love" is no book: search the verse text.
      await search('God is love 4')
      assert.equal(await results().first().getAttribute('href'), '/bible/first-john/4?edition=web#verse-8')
      assert.equal(await page.getByText(/No Bible book matched/i).count(), 0)
    })
    await test(`${width}: Bible backend unavailable or irrelevant → local verse search still answers`, async () => {
      chatMode = 'down'
      await search('for God so loved the world')
      assert.equal(await results().first().getAttribute('href'), '/bible/john/3?edition=web#verse-16')
      chatMode = 'irrelevant'
      await search('for God so loved the world')
      assert.equal(await results().first().getAttribute('href'), '/bible/john/3?edition=web#verse-16')
      assert.equal(await page.getByText(/harvest/).count(), 0, 'an API hit whose text does not match is never shown')
      chatMode = 'unknown'
    })
    await test(`${width}: Bible searches are bounded and filtered; query lives in the URL (reload, Back/Forward)`, async () => {
      requests.bibleVerseSearch.length = 0
      await search('God is love')
      assert.ok(requests.bibleVerseSearch.length >= 1 && requests.bibleVerseSearch.every((r) => r.limit <= 120 && r.filters.length >= 1), JSON.stringify(requests.bibleVerseSearch))
      await page.waitForFunction(() => new URLSearchParams(location.search).get('q') === 'God is love')
      await page.reload()
      await results().first().waitFor({ timeout: 20000 })
      assert.equal(await bar().inputValue(), 'God is love')
      await results().first().click()
      await page.waitForURL(/\/bible\/first-john\/4/)
      await page.goBack()
      await results().first().waitFor({ timeout: 20000 })
      assert.equal(await bar().inputValue(), 'God is love', 'Back restores the search')
      await page.goForward()
      await page.waitForURL(/\/bible\/first-john\/4/)
    })
    assert.deepEqual(errors, [], `${width}px page errors`)
    await context.close()
  }
  console.log(`PASS: ${passed} real-component checks at 360px, 390px and desktop. Mocked API/PostgREST; no live data.`)
} finally {
  await browser?.close()
  await server.close()
}
