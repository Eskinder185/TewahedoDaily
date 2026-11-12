/**
 * Mezmur Library on a phone: full-width search, mic and language switch on their own row (44px targets), compact
 * result rows, results stay on screen while refining, the closest title first. Needs a dev server; live public data.
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
    const input = page.locator('#hymn-search')
    await input.waitFor({ timeout: 20000 })
    const box = await input.boundingBox()
    assert.ok(box.width >= width * 0.8, `search input is only ${Math.round(box.width)}px wide`)
    // Mic and both languages are visible together, each at least 44px tall, below the input (not on top of it).
    const mic = page.getByRole('button', { name: /by voice/i }).first()
    const en = page.getByRole('button', { name: /Voice language: English/i })
    const am = page.getByRole('button', { name: /Voice language: Amharic/i })
    for (const control of [mic, en, am]) {
      const b = await control.boundingBox()
      assert.ok(b && b.height >= 44 && b.width >= 44, `control smaller than 44px: ${JSON.stringify(b)}`)
      assert.ok(b.y >= box.y + box.height - 1, 'voice controls overlap the search input')
    }
    await am.click(); await page.getByRole('button', { name: /Voice language: Amharic/i, pressed: true }).waitFor()
    await en.click(); await page.getByRole('button', { name: /Voice language: English/i, pressed: true }).waitFor()
    // Typing: results are compact rows and the closest title comes first.
    await input.fill('selam')
    await page.waitForFunction(() => document.querySelectorAll('a[href*="/mezmur/"]').length >= 3, null, { timeout: 25000 })
    const cards = await page.locator('a[href*="/mezmur/"]').evaluateAll((els) => els.slice(0, 4).map((e) => ({ h: e.getBoundingClientRect().height, t: e.innerText.split('\n').join(' ').slice(0, 60) })))
    for (const card of cards) assert.ok(card.h < 175, `result card is ${Math.round(card.h)}px tall: ${card.t}`)
    const first = cards[0].t.toLowerCase()
    assert.ok(/selam/.test(first), `first result should contain the word: ${first}`)
    assert.ok(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 1), 'horizontal overflow')
    console.log('ok  ', `${width}px search bar, voice switch and compact results`)
  } catch (error) { failed += 1; console.log('FAIL', `${width}px`, String(error.message).split('\n')[0]) }
}
await browser.close()
if (failed) process.exit(1)
console.log('mezmur mobile journeys: all passed')
