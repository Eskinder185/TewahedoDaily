/**
 * Smoke-check the PUBLIC site (default https://tewahedodaily.pages.dev) in a fresh browser at phone width:
 * the Game Night section, the icon on every game card across the five ways to play, hosting a room, and a lobby QR
 * code that decodes (with a real decoder) to exactly the production invite link. Hosting only opens a Realtime
 * broadcast channel: no tables, no writes. Run: node scripts/verify-production-play.mjs [https://site]
 */
import { chromium } from 'playwright'
import jsQR from 'jsqr'
import assert from 'node:assert/strict'

const base = (process.argv[2] ?? process.env.BASE_URL ?? 'https://tewahedodaily.pages.dev').replace(/\/$/, '')
const MODES = ['knowledge', 'timeline', 'visual', 'word', 'story']
const EXPECTED_ICONS = ['adventures', 'bible-timeline', 'emoji', 'feasts', 'finish-the-mezmur', 'finish-the-verse', 'history', 'icon-memory', 'match', 'saints', 'trivia', 'who-am-i']
const browser = await chromium.launch()
let failed = 0
const check = async (name, fn) => { try { await fn(); console.log('ok  ', name) } catch (error) { failed += 1; console.log('FAIL', name, '-', String(error.message).split('\n')[0]) } }
const context = await browser.newContext({ viewport: { width: 390, height: 844 }, isMobile: true, hasTouch: true, serviceWorkers: 'block' })
const page = await context.newPage()
const overflow = () => page.evaluate(() => document.documentElement.scrollWidth > window.innerWidth + 1)

await check('hub: one Host a Game Night action, a labelled room-code field with Join, and the three steps', async () => {
  await page.goto(`${base}/play`, { waitUntil: 'networkidle' })
  assert.equal(await page.locator('[data-host]').count(), 1)
  await page.locator('form[aria-label="Join with a code"] input').waitFor()
  assert.equal(await page.locator('[data-join]').count(), 1)
  assert.equal(await page.locator('ol li').filter({ hasText: /Open a room|Share the code|Play together/ }).count(), 3)
  await page.locator('form[aria-label="Join with a code"] input').fill('AB')
  await page.locator('[data-join]').click()
  await page.getByRole('alert').filter({ hasText: '5 letters or numbers' }).waitFor()
  assert.equal(await overflow(), false)
})
await check('cards: every one of the 12 games shows its own SVG icon and no photograph', async () => {
  const icons = new Set()
  for (const mode of MODES) {
    await page.goto(`${base}/play?mode=${mode}`, { waitUntil: 'networkidle' })
    await page.locator('[data-game-card]').first().waitFor()
    assert.equal(await page.locator('[data-game-card] img').count(), 0, `a photograph is still on a ${mode} card`)
    for (const id of await page.locator('[data-game-icon]').evaluateAll((els) => els.map((e) => e.getAttribute('data-game-icon')))) icons.add(id)
  }
  assert.deepEqual([...icons].sort(), EXPECTED_ICONS)
})
await check('hosting: a room is created, the lobby shows the QR, it decodes to the exact production invite and enlarges', async () => {
  await page.goto(`${base}/play/live`, { waitUntil: 'networkidle' })
  await page.getByRole('button', { name: 'Create room' }).click()
  await page.locator('[data-room-code]').waitFor({ timeout: 30000 })
  await page.getByRole('status').filter({ hasText: /Online/ }).waitFor({ timeout: 30000 })
  const invite = await page.getByLabel('Join link').inputValue()
  assert.ok(invite.startsWith(`${base}/play/live/`), `invite is not on the production origin: ${invite}`)
  assert.ok(!/localhost|127\.0\.0\.1/.test(invite))
  const decode = async () => {
    const data = await page.evaluate(async () => {
      const el = document.querySelector('[data-room-qr] svg'); const xml = new XMLSerializer().serializeToString(el).replace('<svg', '<svg width="600" height="600"')
      const img = new Image(); img.src = 'data:image/svg+xml;charset=utf-8,' + encodeURIComponent(xml); await img.decode()
      const canvas = document.createElement('canvas'); canvas.width = 600; canvas.height = 600; const ctx = canvas.getContext('2d'); ctx.drawImage(img, 0, 0, 600, 600)
      return Array.from(ctx.getImageData(0, 0, 600, 600).data)
    })
    return jsQR(new Uint8ClampedArray(data), 600, 600)?.data
  }
  assert.equal(await decode(), invite)
  await page.getByText('Scan with a phone camera to join').waitFor()
  const small = (await page.locator('[data-room-qr] svg').boundingBox()).width
  await page.getByRole('button', { name: 'Enlarge for a screen' }).click()
  const large = (await page.locator('[data-room-qr] svg').boundingBox()).width
  assert.ok(large > small + 40)
  assert.equal(await decode(), invite)
  assert.equal(await overflow(), false)
  await page.getByRole('button', { name: 'Make smaller' }).click()
  assert.equal(await page.getByRole('button', { name: 'Copy link' }).count(), 1)
  // Opening the decoded link reaches that room in a second browser context.
  const second = await (await browser.newContext({ viewport: { width: 390, height: 844 }, isMobile: true })).newPage()
  await second.goto(invite, { waitUntil: 'networkidle' })
  await second.getByLabel('Name').waitFor({ timeout: 20000 })
  assert.match(await second.locator('h1').innerText(), new RegExp(invite.split('/').pop()))
  await second.close()
})
await browser.close()
if (failed) { console.log(`\n${failed} production check(s) failed`); process.exit(1) }
console.log(`\nproduction checks passed on ${base}`)
