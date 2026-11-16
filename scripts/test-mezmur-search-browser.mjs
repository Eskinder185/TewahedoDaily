import assert from 'node:assert/strict'
import { chromium } from 'playwright'

const baseUrl = process.env.MEZMUR_TEST_BASE || 'http://127.0.0.1:5173'

function rpcRow(query, page, index, total = 55) {
  const label = `${query} result ${((page - 1) * 24) + index + 1}`
  return {
    mezmur_id: `${query}-${page}-${index}`,
    slug: `${query}-${page}-${index}`,
    title: label,
    transliteration_title: label,
    title_amharic: query === 'amharic' ? 'ሰላም ለኪ' : null,
    title_english: label,
    primary_language: query === 'amharic' ? 'amharic' : 'english',
    form: 'mezmur',
    singer_name: 'Browser Test Zemari',
    youtube_url: null,
    audio_url: null,
    image_path: null,
    legacy_thumbnail_url: null,
    match_field: index === 0 ? 'exact title' : 'lyrics',
    match_preview: index === 0 ? label : `Matched lyric for ${query}`,
    total_count: total,
  }
}

async function installReadMocks(page) {
  const attempts = new Map()
  await page.route('**/api/hymns/search**', async (route) => {
    await route.fulfill({ status: 200, contentType: 'application/json', body: JSON.stringify({ query: '', count: 0, results: [] }) })
  })
  await page.route('**/rest/v1/**', async (route) => {
    const url = new URL(route.request().url())
    if (!url.pathname.endsWith('/rpc/search_public_mezmur_ranked')) {
      await route.fulfill({ status: 200, contentType: 'application/json', headers: { 'content-range': '*/0' }, body: '[]' })
      return
    }
    const body = route.request().postDataJSON() || {}
    const query = String(body.p_query || '')
    const pageNumber = Number(body.p_page || 1)
    attempts.set(query, (attempts.get(query) || 0) + 1)
    if (query === 'slow') await new Promise((resolve) => setTimeout(resolve, 650))
    if (query === 'recover' && attempts.get(query) === 1) {
      await route.fulfill({ status: 503, contentType: 'application/json', body: JSON.stringify({ message: 'Temporary search failure' }) })
      return
    }
    const total = query === 'empty' ? 0 : query === 'fast' || query === 'slow' || query === 'recover' ? 1 : 55
    const count = total ? Math.min(24, total - ((pageNumber - 1) * 24)) : 0
    const rows = Array.from({ length: Math.max(0, count) }, (_, index) => rpcRow(query, pageNumber, index, total))
    await route.fulfill({ status: 200, contentType: 'application/json', body: JSON.stringify(rows) })
  })
  return attempts
}

async function verifyViewport(browser, viewport) {
  const page = await browser.newPage({ viewport })
  await installReadMocks(page)
  await page.goto(`${baseUrl}/hymns?q=alpha`, { waitUntil: 'domcontentloaded' })
  await page.getByRole('heading', { name: 'alpha result 1', exact: true }).waitFor()
  assert.equal(await page.locator('nav').filter({ has: page.locator('button') }).last().isVisible(), true)
  assert.equal(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 1), true, `${viewport.width}px layout must not overflow`)

  const pager = page.locator('nav').filter({ hasText: /Page 1/i }).last()
  await pager.getByRole('button').last().click()
  await page.getByRole('heading', { name: 'alpha result 25', exact: true }).waitFor()
  assert.match(page.url(), /[?&]page=2(?:&|$)/)
  await page.goBack()
  await page.getByRole('heading', { name: 'alpha result 1', exact: true }).waitFor()
  assert.doesNotMatch(page.url(), /[?&]page=2(?:&|$)/)
  await page.close()
}

const browser = await chromium.launch({ headless: true })
try {
  await verifyViewport(browser, { width: 1280, height: 900 })
  await verifyViewport(browser, { width: 390, height: 844 })

  const page = await browser.newPage({ viewport: { width: 1280, height: 900 } })
  const attempts = await installReadMocks(page)
  await page.goto(`${baseUrl}/hymns?q=slow`, { waitUntil: 'domcontentloaded' })
  const input = page.locator('#hymn-search')
  await input.fill('fast')
  await page.waitForURL(/q=fast/)
  await page.getByRole('heading', { name: 'fast result 1', exact: true }).waitFor()
  await page.waitForTimeout(750)
  assert.equal(await page.getByRole('heading', { name: 'slow result 1', exact: true }).count(), 0, 'stale slow response replaced newer results')

  await input.fill('empty')
  await page.waitForURL(/q=empty/)
  await page.getByText(/No hymns|መዝሙሮች.*አልተገኙ/i).waitFor()
  assert.equal(await page.getByRole('alert').count(), 0, 'empty results must not render as a network error')

  await input.fill('recover')
  await page.waitForURL(/q=recover/)
  const alert = page.getByRole('alert')
  await alert.waitFor()
  assert.match(page.url(), /q=recover/)
  await alert.getByRole('button').click()
  await page.getByRole('heading', { name: 'recover result 1', exact: true }).waitFor()
  assert.equal(attempts.get('recover'), 2)
  assert.match(page.url(), /q=recover/, 'retry must preserve the query')
  await page.close()
} finally {
  await browser.close()
}

console.log('Mezmur browser search: desktop/mobile pagination, history, cancellation, empty state, and retry passed (mocked network)')
