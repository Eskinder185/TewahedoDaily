import assert from 'node:assert/strict'
import fs from 'node:fs'
import path from 'node:path'
import { chromium } from 'playwright'

const base = process.env.VOICE_TEST_BASE || 'http://127.0.0.1:4173'
const output = path.resolve('artifacts/voice-search')
fs.mkdirSync(output, { recursive: true })
const browser = await chromium.launch({ headless: true })

async function setup(viewport) {
  const context = await browser.newContext({ viewport, permissions: [] })
  await context.addInitScript(() => {
    window.__voice = { instances: [], aborts: 0, stops: 0 }
    class MockRecognition {
      lang = ''
      continuous = false
      interimResults = false
      maxAlternatives = 1
      onstart = null
      onresult = null
      onerror = null
      onend = null
      start() {
        window.__voice.instances.push(this)
        queueMicrotask(() => this.onstart?.())
      }
      stop() {
        window.__voice.stops++
        queueMicrotask(() => {
          this.onresult?.({ resultIndex: 0, results: [Object.assign([{ transcript: 'John 3:16' }], { isFinal: true })] })
          this.onend?.()
        })
      }
      abort() { window.__voice.aborts++ }
    }
    window.SpeechRecognition = MockRecognition
  })
  const page = await context.newPage()
  await page.goto(`${base}/bible`, { waitUntil: 'domcontentloaded' })
  const field = page.getByPlaceholder(/Search books/i)
  const mic = page.getByRole('button', { name: /Search the Bible by voice/i })
  const micState = page.locator('form[role="search"] button[aria-pressed]:not([aria-label^="Voice language"])')
  await mic.waitFor()
  return { context, page, field, mic, micState }
}

try {
  const desktop = await setup({ width: 1280, height: 850 })
  await desktop.page.screenshot({ path: path.join(output, 'bible-desktop.png'), fullPage: true })
  // Both languages are always visible; one tap switches (no menu to open).
  await desktop.page.getByRole('button', { name: /Voice language: Amharic/i }).click()
  await desktop.page.getByRole('button', { name: /Voice language: Amharic/i, pressed: true }).waitFor()
  await desktop.page.getByRole('button', { name: /Voice language: English/i }).click()
  await desktop.page.getByRole('button', { name: /Voice language: English/i, pressed: true }).waitFor()
  await desktop.mic.click()
  await desktop.page.waitForFunction(() => document.querySelector('form[role="search"] button[aria-pressed]:not([aria-label^="Voice language"])')?.getAttribute('aria-pressed') === 'true')
  assert.equal(await desktop.micState.getAttribute('aria-pressed'), 'true')
  assert.equal(await desktop.page.evaluate(() => window.__voice.instances.at(-1).lang), 'en-US')
  await desktop.page.getByRole('button', { name: /^Stop$/i }).click()
  await desktop.page.waitForFunction(() => document.querySelector('input[placeholder*="Search books"]')?.value === 'John 3:16')
  assert.equal(await desktop.field.inputValue(), 'John 3:16')
  await desktop.field.fill('John 3:17')
  assert.equal(await desktop.field.inputValue(), 'John 3:17')
  await desktop.mic.click()
  await desktop.page.keyboard.press('Escape')
  assert.ok(await desktop.page.evaluate(() => window.__voice.aborts >= 1))
  await desktop.mic.click()
  await desktop.page.evaluate(() => window.__voice.instances.at(-1).onerror?.({ error: 'not-allowed' }))
  await desktop.page.getByText(/Microphone access was blocked/i).waitFor()
  await desktop.mic.click()
  await desktop.page.evaluate(() => window.__voice.instances.at(-1).onend?.())
  await desktop.page.getByText(/didn't hear anything/i).waitFor()
  await desktop.context.close()

  const mobile = await setup({ width: 390, height: 844 })
  await mobile.page.screenshot({ path: path.join(output, 'bible-mobile.png'), fullPage: true })
  await mobile.mic.click()
  await mobile.page.screenshot({ path: path.join(output, 'bible-mobile-listening.png'), fullPage: true })
  await mobile.context.close()

  const hymn = await browser.newPage({ viewport: { width: 1280, height: 850 } })
  await hymn.goto(`${base}/hymns`, { waitUntil: 'domcontentloaded' })
  await hymn.getByRole('button', { name: /Search hymns by voice/i }).waitFor()
  assert.equal(await hymn.getByRole('button', { name: /Search hymns by voice/i }).count(), 1)
  await hymn.screenshot({ path: path.join(output, 'hymns-desktop.png'), fullPage: true })
  await hymn.close()
  const buddy = await browser.newPage({ viewport: { width: 1280, height: 850 } })
  await buddy.goto(`${base}/`, { waitUntil: 'domcontentloaded' })
  await buddy.getByRole('button', { name: 'Open search' }).click()
  await buddy.locator('textarea').first().waitFor()
  await buddy.screenshot({ path: path.join(output, 'search-buddy-desktop.png'), fullPage: true })
  await buddy.close()
  const buddyMobile = await browser.newPage({ viewport: { width: 390, height: 844 } })
  await buddyMobile.goto(`${base}/`, { waitUntil: 'domcontentloaded' })
  await buddyMobile.getByRole('button', { name: 'Open search' }).click()
  await buddyMobile.locator('textarea').first().waitFor()
  await buddyMobile.screenshot({ path: path.join(output, 'search-buddy-mobile.png'), fullPage: true })
  await buddyMobile.close()
  console.log('modern voice search browser checks: passed (mocked SpeechRecognition)')
} finally {
  await browser.close()
}
