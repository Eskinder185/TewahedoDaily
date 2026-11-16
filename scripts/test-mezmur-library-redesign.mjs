/** Browser QA for the compact Mezmur Library redesign. Requires a running app and read-only public data. */
import assert from 'node:assert/strict'
import { mkdir } from 'node:fs/promises'
import { chromium } from 'playwright'

const BASE = process.env.BASE_URL ?? 'http://127.0.0.1:5173'
const OUT = 'artifacts/mezmur-library-redesign/after'
const widths = [320, 375, 390, 430, 768, 1280, 1440]
await mkdir(OUT, { recursive: true })
const browser = await chromium.launch()

for (const width of widths) {
  const context = await browser.newContext({ viewport: { width, height: 900 }, isMobile: width < 768, hasTouch: width < 768, reducedMotion: 'reduce' })
  const page = await context.newPage()
  await page.goto(`${BASE}/hymns`, { waitUntil: 'domcontentloaded' })
  await page.getByRole('tab').first().waitFor({ timeout: 30_000 })
  await page.waitForTimeout(500)

  assert.ok(await page.getByRole('button', { name: /voice/i }).first().isVisible(), `${width}: voice search hidden`)
  assert.ok(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 1), `${width}: horizontal overflow`)
  for (const button of await page.getByTestId('werb-card').getByRole('button').all()) {
    const box = await button.boundingBox()
    assert.ok(box && box.height >= 44, `${width}: form target below 44px`)
  }
  for (const button of await page.getByRole('group', { name: 'Filter hymns by language' }).getByRole('button').all()) {
    const box = await button.boundingBox()
    assert.ok(box && box.height >= 44, `${width}: language target below 44px`)
  }

  const tabs = page.getByRole('tab')
  await tabs.first().focus()
  await tabs.first().press('ArrowRight')
  await page.waitForFunction(() => document.querySelectorAll('[role="tab"]')[1]?.getAttribute('aria-selected') === 'true')
  assert.equal(await tabs.nth(1).getAttribute('aria-selected'), 'true', `${width}: tab arrow navigation`)
  await tabs.nth(1).press('ArrowLeft')

  const werb = page.getByTestId('werb-card').getByRole('button', { name: /Werb/i })
  await werb.click()
  await page.waitForFunction(() => new URL(location.href).searchParams.get('form') === 'werb')
  await page.getByTestId('werb-card').getByRole('button', { name: 'All Hymns' }).click()
  await page.waitForFunction(() => !new URL(location.href).searchParams.has('form'))
  await page.getByRole('tab').first().waitFor()
  await page.waitForTimeout(500)

  const artwork = page.locator('main article img')
  for (let index = 0; index < await artwork.count(); index += 1) await artwork.nth(index).scrollIntoViewIfNeeded()
  await page.waitForTimeout(300)
  const images = await artwork.evaluateAll((nodes) => nodes.map((img) => ({ complete: img.complete, width: img.naturalWidth, alt: img.alt })))
  assert.ok(images.every((img) => img.complete && img.width > 0), `${width}: broken main artwork`)
  const card = page.locator('main article').first()
  if (await card.count()) {
    const duration = Number.parseFloat(await card.evaluate((node) => getComputedStyle(node).transitionDuration))
    assert.ok(duration <= 0.001, `${width}: reduced motion duration ${duration}s`)
  }

  await page.screenshot({ path: `${OUT}/library-${width}-light-en.png`, fullPage: true })
  await context.close()
}

const stateContext = await browser.newContext({ viewport: { width: 390, height: 900 }, isMobile: true, hasTouch: true })
const statePage = await stateContext.newPage()
await statePage.goto(`${BASE}/hymns?language=am&q=selam`, { waitUntil: 'domcontentloaded' })
await statePage.getByTestId('werb-card').waitFor({ timeout: 30_000 })
await statePage.getByRole('button', { name: /Werb/i }).click()
await statePage.waitForFunction(() => new URL(location.href).searchParams.get('form') === 'werb')
let url = new URL(statePage.url())
assert.equal(url.searchParams.get('q'), 'selam')
assert.equal(url.searchParams.get('language'), 'am')
await statePage.goBack()
await statePage.waitForFunction(() => !new URL(location.href).searchParams.has('form'))
await stateContext.close()

for (const [theme, locale] of [['night', 'am'], ['light', 'en']]) {
  const context = await browser.newContext({ viewport: { width: 390, height: 900 }, isMobile: true, hasTouch: true })
  await context.addInitScript(({ theme, locale }) => { localStorage.setItem('tewahedo-theme', theme); localStorage.setItem('tewahedo-daily-locale', locale) }, { theme, locale })
  const page = await context.newPage()
  await page.goto(`${BASE}/hymns/browse/occasion-holidays-feasts`, { waitUntil: 'domcontentloaded' })
  await page.locator('h1').waitFor({ timeout: 30_000 })
  await page.waitForTimeout(600)
  assert.ok(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 1), `${theme}: browse overflow`)
  await page.screenshot({ path: `${OUT}/occasion-group-390-${theme}-${locale}.png`, fullPage: true })
  await context.close()
}

await browser.close()
console.log(`mezmur library redesign browser QA: ${widths.length} widths plus URL, theme, and browse states passed`)
