/**
 * The Mezmur Library offers a compact All Hymns / Werb selector backed by the existing URL state.
 * Needs a dev server (npm run dev). Live public data, read-only. At 375/390/430px.
 */
import { chromium } from 'playwright'
import assert from 'node:assert/strict'

const BASE = process.env.BASE_URL ?? 'http://127.0.0.1:5173'
const browser = await chromium.launch()
let failed = 0
for (const width of [375, 390, 430]) {
  const page = await (await browser.newContext({ viewport: { width, height: 844 }, isMobile: true, hasTouch: true })).newPage()
  try {
    await page.goto(`${BASE}/hymns`, { waitUntil: 'networkidle' })
    const selector = page.getByTestId('werb-card')
    await selector.waitFor({ timeout: 20000 })
    assert.ok(await selector.isVisible())
    const werb = selector.getByRole('button', { name: /Werb/i })
    await werb.click()
    await page.getByRole('button', { name: /Werb/i, pressed: true }).waitFor({ timeout: 20000 })
    assert.match(new URL(page.url()).search, /form=werb/)
    const filteredBrowseLink = page.locator('a[href*="form=werb"]').first()
    await filteredBrowseLink.waitFor({ timeout: 20000 })
    assert.ok(await page.locator('a[href*="form=werb"]').count(), 'Werb browse links preserve the form filter')
    await page.getByRole('link', { name: /View all Werb/i }).click()
    await page.waitForFunction(() => document.querySelectorAll('a[href*="/mezmur/"]').length > 0, null, { timeout: 20000 })
    assert.equal(new URL(page.url()).searchParams.get('view'), 'all')
    assert.ok(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 1), 'horizontal overflow')
    const heading = await page.locator('h2').first().innerText()
    assert.match(heading, /Werbs · \d+/)
    await page.getByTestId('werb-card').getByRole('button', { name: 'All Hymns' }).click()
    await page.getByRole('button', { name: 'All Hymns', pressed: true }).waitFor({ timeout: 20000 })
    assert.doesNotMatch(new URL(page.url()).search, /form=/)
    console.log('ok  ', `${width}px All Hymns / Werb selector preserves URL state`)
  } catch (error) { failed += 1; console.log('FAIL', `${width}px`, String(error.message).split('\n')[0]) }
}
await browser.close()
if (failed) process.exit(1)
console.log('werb selector journeys: all passed')
