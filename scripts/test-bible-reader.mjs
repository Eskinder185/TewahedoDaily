import assert from 'node:assert/strict'
import { chromium } from 'playwright'

const base = process.env.BIBLE_TEST_URL || 'http://127.0.0.1:4177'
const books = Array.from({ length: 81 }, (_, i) => ({
  id: `book-${i + 1}`, canonical_number: i < 46 ? i + 1 : i - 45,
  collection: i < 46 ? 'old' : 'new', sort_order: i + 1,
  slug: i === 0 ? 'genesis' : i === 15 ? 'enoch' : i === 22 ? 'proverbs' : `book-${i + 1}`,
  name_en: i === 0 ? 'Genesis' : i === 15 ? 'Enoch' : i === 22 ? 'Proverbs' : `Book ${i + 1}`,
  name_am: i === 0 ? 'ኦሪት ዘፍጥረት' : i === 15 ? 'መጽሐፈ ሄኖክ' : null,
  source_status: i === 0 || i === 15 || i === 22 ? 'available' : 'missing',
}))
const editions = [
  { id: 'edition-am', code: 'am', name: 'Amharic', language_code: 'am' },
  { id: 'edition-web', code: 'web', name: 'World English Bible', language_code: 'en' },
  { id: 'edition-gez', code: 'gez-liturgical', name: 'Liturgical Geʽez', language_code: 'gez' },
]
const sources = [
  { id: 'source-gen-am', canonical_book_id: 'book-1', edition_id: 'edition-am', source_order: 1, source_book_number: 1, source_name_en: 'Genesis', source_name_am: 'ኦሪት ዘፍጥረት' },
  { id: 'source-gen-web', canonical_book_id: 'book-1', edition_id: 'edition-web', source_order: 1, source_book_number: 1, source_name_en: 'Genesis' },
  { id: 'source-gen-gez', canonical_book_id: 'book-1', edition_id: 'edition-gez', source_order: 1, source_book_number: 1, source_name_en: 'Genesis', source_name_am: 'ኦሪት ዘፍጥረት' },
  { id: 'source-enoch', canonical_book_id: 'book-16', edition_id: 'edition-am', source_order: 16, source_book_number: 16, source_name_en: 'Enoch', source_name_am: 'መጽሐፈ ሄኖክ' },
  { id: 'source-prov-am', canonical_book_id: 'book-23', edition_id: 'edition-am', source_order: 29, source_book_number: 29, source_name_en: 'Proverbs' },
  { id: 'source-prov-web', canonical_book_id: 'book-23', edition_id: 'edition-web', source_order: 20, source_book_number: 20, source_name_en: 'Proverbs' },
]
const chapters = sources.flatMap((source) => [1, 2].map((number) => ({
  id: `${source.id}-${number}`, source_book_id: source.id, chapter_number: number, source_order: number,
})))
const sections = [
  { id: 'section-a', chapter_id: 'source-gen-am-1', source_order: 1, title: null },
  { id: 'section-b', chapter_id: 'source-gen-am-1', source_order: 2, title: 'የፍጥረት መጀመሪያ' },
]
const verses = [
  { id: 'verse-a', chapter_id: 'source-gen-am-1', section_id: 'section-a', source_order: 1, verse_number: 1, text: 'በመጀመሪያ እግዚአብሔር ፈጠረ።' },
  { id: 'verse-b', chapter_id: 'source-gen-am-1', section_id: 'section-b', source_order: 1, verse_number: 1, text: 'የተደጋገመ የቁጥር ምልክት።' },
  { id: 'verse-c', chapter_id: 'source-gen-web-1', section_id: null, source_order: 1, verse_number: 1, text: 'In the beginning God created.' },
  { id: 'verse-gez', chapter_id: 'source-gen-gez-1', section_id: null, source_order: 1, verse_number: 1, text: 'በቀዳሚ ገብረ እግዚአብሔር።' },
]

function filter(rows, params, column) {
  const value = params.get(column)
  if (!value) return rows
  if (value.startsWith('eq.')) return rows.filter((row) => String(row[column]) === value.slice(3))
  if (value.startsWith('in.(')) return rows.filter((row) => value.slice(4, -1).split(',').includes(String(row[column])))
  return rows
}

async function mockBible(page, published) {
  await page.route('**/rest/v1/bible_*', async (route) => {
    const url = new URL(route.request().url())
    const table = url.pathname.split('/').at(-1)
    let rows = ({
      bible_canonical_books: books, bible_editions: published ? editions : [],
      bible_source_books: published ? sources : [], bible_chapters: published ? chapters : [],
      bible_sections: published ? sections : [], bible_verses: published ? verses : [],
    })[table] || []
    for (const key of ['slug', 'canonical_book_id', 'source_book_id', 'chapter_id']) rows = filter(rows, url.searchParams, key)
    const single = route.request().headers().accept?.includes('application/vnd.pgrst.object+json')
    await route.fulfill({ status: 200, contentType: 'application/json', body: JSON.stringify(single ? rows[0] || null : rows) })
  })
}

const browser = await chromium.launch({ headless: true })
try {
  const draft = await browser.newPage({ viewport: { width: 390, height: 844 } })
  await mockBible(draft, false)
  await draft.goto(`${base}/bible`)
  await draft.getByText('Reading text is being prepared for publication.').waitFor()
  assert.equal(await draft.locator('ol[class*=bookList] > li').count(), 46)
  assert.equal(await draft.locator('a[href="/bible/genesis"]').count(), 0)
  await draft.close()

  const page = await browser.newPage({ viewport: { width: 390, height: 844 } })
  await mockBible(page, true)
  await page.goto(`${base}/bible`)
  await page.getByRole('link', { name: /Genesis/ }).waitFor()
  assert.equal(await page.locator('ol[class*=bookList] > li').count(), 46)
  await page.getByRole('button', { name: /New Testament/ }).click()
  assert.equal(await page.locator('ol[class*=bookList] > li').count(), 35)
  await page.goto(`${base}/bible/enoch`)
  await page.getByRole('heading', { name: /Enoch/ }).waitFor()
  assert.equal(await page.getByRole('group', { name: 'Reading translation' }).count(), 0)
  await page.goto(`${base}/bible/genesis/1`)
  await page.getByText('In the beginning God created.').waitFor()
  await page.getByRole('button', { name: 'Geʽez' }).click()
  await page.getByText('በቀዳሚ ገብረ እግዚአብሔር።').waitFor()
  assert.match(page.url(), /edition=gez-liturgical/)
  await page.getByRole('button', { name: 'English', exact: true }).click()
  await page.getByRole('button', { name: 'Amharic', exact: true }).click()
  await page.getByText('የተደጋገመ የቁጥር ምልክት።').waitFor()
  assert.equal(await page.locator('ol[class*=verses] li').count(), 2)
  await page.getByRole('button', { name: 'ሁለቱም' }).click()
  await page.getByText('In the beginning God created.').waitFor()
  await page.locator('a[href^="/bible/genesis/2"]').last().click()
  await page.locator('p[class*=notice]').filter({ hasText: /no published verses|የታተሙ ቁጥሮች/ }).first().waitFor()
  await page.goto(`${base}/bible/genesis/1?edition=both`)
  await page.getByText('In the beginning God created.').waitFor()
  await page.locator('label[class*=chapterPicker] select').selectOption('2')
  await page.locator('p[class*=notice]').filter({ hasText: /no published verses|የታተሙ ቁጥሮች/ }).first().waitFor()
  const languageTrigger = page.getByLabel(/Language: Amharic\. Switch to English/)
  if (await languageTrigger.count()) await languageTrigger.click()
  await page.goto(`${base}/bible/proverbs/1`)
  await page.locator('p[class*=notice]').filter({ hasText: /alignment|ማዛመድ/ }).waitFor()
  assert.equal(await page.getByRole('button', { name: /^(Both|ሁለቱም)$/ }).count(), 0)
  await page.goto(`${base}/bible/genesis/99`)
  await page.getByText(/This chapter was not found|ይህ ምዕራፍ አልተገኘም/).waitFor()
  await page.goto(`${base}/bible/no-such-book`)
  await page.getByText(/This Bible book was not found|ይህ መጽሐፍ አልተገኘም/).waitFor()
  for (const [width, height] of [[320, 844], [360, 844], [375, 844], [390, 844], [393, 844], [412, 844], [430, 844], [667, 375], [768, 1024], [1280, 800], [1440, 900]]) {
    await page.setViewportSize({ width, height })
    await page.goto(`${base}/bible/genesis/1?edition=web`)
    await page.getByRole('heading', { level: 1, name: /Genesis|ኦሪት ዘፍጥረት/ }).waitFor()
    await page.getByText('In the beginning God created.').waitFor()
    assert.ok(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth), `horizontal overflow at ${width}px`)
    if (width === 390 && process.env.BIBLE_SCREENSHOT_PATH) await page.screenshot({ path: process.env.BIBLE_SCREENSHOT_PATH, fullPage: true })
  }
  await page.close()
  console.log('Bible reader browser checks passed: draft RLS state, 81 slots, Amharic-only, WEB, duplicate labels, Both, Proverbs, 320–1440px and phone landscape.')
} finally {
  await browser.close()
}
