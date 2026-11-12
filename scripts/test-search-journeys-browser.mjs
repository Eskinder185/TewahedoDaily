/**
 * Real-browser journeys for the three search experiences at 375/390/430px against a running dev server and the
 * live public (read-only) Supabase data. Start the app first (`npm run dev`), then:
 *   node scripts/test-search-journeys-browser.mjs        (BASE_URL optional)
 * Typed input only: no microphone is exercised here, and no speech accuracy is claimed.
 */
import { chromium } from 'playwright'
import assert from 'node:assert/strict'

const BASE = process.env.BASE_URL ?? 'http://127.0.0.1:5173'
const WIDTHS = [375, 390, 430]
const browser = await chromium.launch()
const failures = []
const check = async (name, fn) => { try { await fn(); console.log('ok  ', name) } catch (e) { failures.push(name); console.log('FAIL', name, '-', String(e.message).split('\n')[0]) } }

for (const width of WIDTHS) {
  const context = await browser.newContext({ viewport: { width, height: 844 }, isMobile: true, hasTouch: true })
  const page = await context.newPage()
  const noOverflow = async () => assert.ok(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 1), 'horizontal overflow')

  await check(`${width}px Mezmur Library: spelling drift finds the hymn`, async () => {
    await page.goto(`${BASE}/practice?q=${encodeURIComponent('igziaber siraw')}`, { waitUntil: 'networkidle' })
    await page.waitForSelector('a[href*="/mezmur/"]', { timeout: 15000 })
    await noOverflow()
    const text = await page.locator('main').innerText()
    assert.ok(!/invalid input syntax|PGRST|uuid/i.test(text), 'raw database text shown')
  })

  await check(`${width}px Mezmur Library: lyric request wrapper reaches a hymn`, async () => {
    await page.goto(`${BASE}/practice?q=${encodeURIComponent('find the hymn with the words aba abune teklehaymanot')}`, { waitUntil: 'networkidle' })
    await page.waitForSelector('a[href*="/mezmur/"]', { timeout: 15000 })
    await noOverflow()
  })

  await check(`${width}px Bible: Ethiopic-numeral reference opens exact verse`, async () => {
    await page.goto(`${BASE}/bible`, { waitUntil: 'networkidle' })
    const box = page.locator('input[placeholder*="Search"]').first()
    await box.fill('ዮሐንስ ፫፥፲፮')
    await box.press('Enter')
    await page.getByText('For God so loved the world').first().waitFor({ timeout: 15000 })
    await page.getByRole('link', { name: /Open in Bible/i }).first().click()
    await page.waitForURL(/\/bible\/john\/3/, { timeout: 15000 })
    assert.match(page.url(), /#verse-16/)
    await noOverflow()
  })

  await check(`${width}px Search Buddy: opens, accepts a typed lyric request, mic is a named button`, async () => {
    await page.goto(`${BASE}/`, { waitUntil: 'networkidle' })
    await page.getByRole('button', { name: 'Open search' }).first().click()
    const dialog = page.getByRole('dialog')
    const input = dialog.getByRole('textbox').first()
    await input.fill('find the hymn with the words aba abune teklehaymanot')
    await input.press('Enter')
    await dialog.locator('a[href*="/mezmur/"]').first().waitFor({ timeout: 25000 })
    const mic = dialog.getByRole('button', { name: /voice|microphone|dictate/i }).first()
    assert.ok(await mic.count(), 'microphone button has no accessible name')
    assert.match((await dialog.locator('h3 a').first().getAttribute('href')) || '', /\/mezmur\//, 'a lyric request should lead with a hymn')
    // Each card has a title link and an "Open" link to the same hymn; count cards by title link only.
    const links = await dialog.locator('h3 a[href*="/mezmur/"]').evaluateAll((els) => els.map((e) => e.getAttribute('href')))
    assert.equal(new Set(links).size, links.length, `duplicate hymn cards: ${links.join(', ')}`)
    await noOverflow()
  })
  await context.close()
}
await browser.close()
if (failures.length) { console.log(`\n${failures.length} journey check(s) failed`); process.exit(1) }
console.log('\nsearch journeys: all passed')
