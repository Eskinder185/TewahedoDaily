/**
 * The Mezmur Library offers one prominent Werb card; it shows only werbs, and "Show all hymns" returns.
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
    const card = page.getByTestId('werb-card')
    await card.waitFor({ timeout: 20000 })
    assert.ok(await card.isVisible())
    await card.click()
    await page.getByTestId('werb-only-note').waitFor({ timeout: 20000 })
    await page.waitForFunction(() => document.querySelectorAll('a[href*="/mezmur/"]').length > 0, null, { timeout: 20000 })
    assert.match(new URL(page.url()).search, /form=werb/)
    assert.ok(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 1), 'horizontal overflow')
    const heading = await page.locator('h2').first().innerText()
    assert.match(heading, /Werbs · \d+/)
    await page.getByTestId('werb-only-note').getByRole('button', { name: 'Show all hymns' }).click()
    await page.getByTestId('werb-card').waitFor({ timeout: 20000 })
    assert.doesNotMatch(new URL(page.url()).search, /form=/)
    console.log('ok  ', `${width}px Werb card → only werbs → show all hymns`)
  } catch (error) { failed += 1; console.log('FAIL', `${width}px`, String(error.message).split('\n')[0]) }
}
await browser.close()
if (failed) process.exit(1)
console.log('werb card journeys: all passed')
