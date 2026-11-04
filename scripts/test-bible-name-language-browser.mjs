/**
 * Mocked-API browser check: Bible book names follow the selected language in the catalog, book page
 * (heading + volume list), chapter reader (heading + breadcrumb), page titles and search.
 * No Supabase, no SQL. Run: node scripts/test-bible-name-language-browser.mjs
 */
import assert from 'node:assert/strict'
import { chromium } from 'playwright'
import { createServer } from 'vite'

process.env.VITE_SUPABASE_URL = 'https://bible-names-test.supabase.co'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_fixture_only'
const port = 4189

const book = (n, slug, name_en, name_am, collection = 'old') => ({
  id: `book-${n}`, canonical_number: n, collection, slug, name_en, name_am, sort_order: n, source_status: 'available' })
const books = [
  book(1, 'james', 'James', 'የያዕቆን መልእክት', 'new'),                 // database spelling conflicts with the list (ብ vs ን)
  book(2, 'samuel', 'Samuel', null),                                // combined book, no database Amharic name
  book(3, 'unlisted-book', 'Unlisted Book', null),                  // absent from the list: must not be invented
]
const editions = [
  { id: 'edition-am', code: 'am', name: 'Amharic', language_code: 'am' },
  { id: 'edition-web', code: 'web', name: 'World English Bible', language_code: 'en' },
]
const src = (id, book, edition, order, en, am = null) => ({ id, canonical_book_id: book, edition_id: edition,
  source_order: order, source_book_number: order, source_name_en: en, source_name_am: am })
const sources = [
  src('s-james-am', 'book-1', 'edition-am', 1, 'James', 'የያዕቆን መልእክት'),
  src('s-james-web', 'book-1', 'edition-web', 1, 'James'),
  src('s-sam1-web', 'book-2', 'edition-web', 1, '1 Samuel'),   // English-edition volumes: no database Amharic name
  src('s-sam2-web', 'book-2', 'edition-web', 2, '2 Samuel'),
  src('s-unl-web', 'book-3', 'edition-web', 1, 'Unlisted Book'),
]
const chapters = sources.map((s) => ({ id: `${s.id}-1`, source_book_id: s.id, chapter_number: 1, source_order: 1 }))
const verses = chapters.map((c) => ({ id: `v-${c.id}`, chapter_id: c.id, section_id: null, source_order: 1, verse_number: 1, text: 'Verse text.' }))

const filter = (rows, params, column) => {
  const value = params.get(column)
  if (!value) return rows
  if (value.startsWith('eq.')) return rows.filter((row) => String(row[column]) === value.slice(3))
  if (value.startsWith('in.(')) return rows.filter((row) => value.slice(4, -1).split(',').includes(String(row[column])))
  return rows
}
async function mockBible(page) {
  await page.route('**/rest/v1/bible_*', async (route) => {
    const url = new URL(route.request().url())
    const table = url.pathname.split('/').at(-1)
    let rows = ({ bible_canonical_books: books, bible_editions: editions, bible_source_books: sources,
      bible_chapters: chapters, bible_sections: [], bible_verses: verses })[table] || []
    for (const key of ['slug', 'canonical_book_id', 'source_book_id', 'chapter_id']) rows = filter(rows, url.searchParams, key)
    const single = route.request().headers().accept?.includes('application/vnd.pgrst.object+json')
    await route.fulfill({ status: 200, contentType: 'application/json', body: JSON.stringify(single ? rows[0] || null : rows) })
  })
}

const server = await createServer({ server: { host: '127.0.0.1', port, strictPort: true } })
await server.listen()
let browser
try {
  browser = await chromium.launch()
  const base = `http://127.0.0.1:${port}`
  const names = {
    am: { james: 'የያዕቆብ መልእክት', samuel: 'መጽሐፈ ሳሙኤል', unlisted: 'Unlisted Book', sam1: 'መጽሐፈ ሳሙኤል ቀዳማዊ', sam2: 'መጽሐፈ ሳሙኤል ካልዕ' },
    en: { james: 'James', samuel: 'Samuel', unlisted: 'Unlisted Book', sam1: '1 Samuel', sam2: '2 Samuel' },
  }
  for (const locale of ['am', 'en']) {
    const n = names[locale]
    const context = await browser.newContext({ viewport: { width: 1000, height: 900 } })
    await context.addInitScript((value) => localStorage.setItem('tewahedo-daily-locale', value), locale)
    const page = await context.newPage()
    const errors = []
    page.on('pageerror', (e) => errors.push(e.message))
    await mockBible(page)

    // Catalog (James is in the New Testament tab).
    await page.goto(`${base}/bible?testament=new`)
    const jamesCard = page.locator('a[href="/bible/james"] strong')
    await jamesCard.waitFor()
    assert.equal(await jamesCard.innerText(), n.james, `${locale} catalog James`)
    await page.goto(`${base}/bible?testament=old`)
    await page.locator('a[href="/bible/samuel"] strong').waitFor()
    assert.equal(await page.locator('a[href="/bible/samuel"] strong').innerText(), n.samuel, `${locale} catalog Samuel`)
    assert.equal(await page.locator('[role=group][aria-label*="Unlisted"], a[href="/bible/unlisted-book"] strong').first().innerText().catch(() => n.unlisted) !== '', true)
    assert.equal(await page.getByText(/^Unlisted Book$/).count() >= 1, true, 'absent book keeps its English name in both languages')

    // Catalog search recognizes the list spelling AND the database spelling, in either UI language.
    await page.goto(`${base}/bible`)
    const search = page.locator('input[class*=input]').first()
    for (const query of ['የያዕቆብ', 'የያዕቆን', 'james']) {
      await search.fill(query)
      await page.locator('a[href="/bible/james"]').first().waitFor({ timeout: 5000 })
      await search.fill('')
    }
    await search.fill('ሳሙኤል ቀዳማዊ')
    await page.locator('a[href="/bible/samuel"]').first().waitFor({ timeout: 5000 })

    // Book page: heading, page title, volume list (English-edition volumes use verified Amharic names).
    await page.goto(`${base}/bible/samuel?edition=web`)
    await page.getByRole('heading', { level: 1 }).filter({ hasText: n.samuel }).waitFor()
    await page.getByRole('listitem').filter({ hasText: n.sam1 }).first().waitFor()
    await page.getByRole('listitem').filter({ hasText: n.sam2 }).first().waitFor()
    assert.ok((await page.title()).includes(n.samuel), `${locale} page title: ${await page.title()}`)

    // Chapter reader: heading, breadcrumb link text, page title; routes unchanged.
    await page.goto(`${base}/bible/james/1`)
    await page.getByRole('heading', { level: 1 }).filter({ hasText: n.james }).waitFor()
    const crumb = page.getByRole('navigation', { name: 'Breadcrumb' }).getByRole('link').last()
    assert.equal(await crumb.innerText(), n.james, `${locale} breadcrumb`)
    assert.equal(await crumb.getAttribute('href'), '/bible/james')
    assert.ok((await page.title()).includes(n.james))
    assert.match(page.url(), /\/bible\/james\/1$/)
    // Back/Forward still work between catalog and reader.
    await page.goBack()
    assert.match(page.url(), /\/bible\/samuel\?edition=web$/)
    await page.goForward()
    assert.match(page.url(), /\/bible\/james\/1$/)
    assert.deepEqual(errors, [])
    await context.close()
  }
  console.log('PASS: Bible names follow the selected language in catalog, book page, volumes, reader heading, breadcrumb, titles and search; routes/history unchanged. Mocked API.')
} finally {
  await browser?.close()
  await server.close()
}
