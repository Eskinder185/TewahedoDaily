/**
 * Synaxarium Search Buddy flow: search → preview → back → full page → back.
 * Usage: node scripts/verify-synaxarium-search-buddy.mjs [baseUrl]
 */
import { chromium } from 'playwright'
import fs from 'node:fs/promises'
import path from 'node:path'

const BASE = process.argv[2] || 'http://127.0.0.1:4181/'
const OUT = path.resolve('tmp/synaxarium-search-buddy-verify')
const LIVE = 'https://tewahedodaily.pages.dev/'

async function ensureDir(dir) {
  await fs.mkdir(dir, { recursive: true })
}

async function openBuddy(page) {
  await page.getByRole('button', { name: /find something|አግኝ/i }).click()
  await page.getByRole('dialog').waitFor({ state: 'visible', timeout: 10000 })
}

async function runQuery(page, query) {
  const dialog = page.getByRole('dialog')
  await dialog.getByRole('textbox').fill(query)
  await dialog.locator('form button[type="submit"]').click()
  await page
    .waitForFunction(() => {
      const status = document.querySelector('[role="dialog"] [role="status"]')?.textContent || ''
      return !/Searching|Looking|በመፈለግ/i.test(status)
    }, null, { timeout: 25000 })
    .catch(() => {})
  await page.waitForTimeout(300)
  const status = (await dialog.locator('[role="status"]').innerText().catch(() => '')).trim()
  const buttons = dialog.locator('button.cardButton, button[class*="cardButton"]')
  const links = dialog.locator('a[href*="synaxarium"]')
  const btnCount = await buttons.count()
  const linkCount = await links.count()
  return { status, btnCount, linkCount }
}

async function main() {
  await ensureDir(OUT)
  const browser = await chromium.launch({ headless: true })
  const report = { base: BASE, steps: [], ok: true }

  // Before (live) — may not have Synaxarium search yet
  {
    const page = await browser.newPage({ viewport: { width: 390, height: 844 } })
    await page.goto(LIVE, { waitUntil: 'domcontentloaded', timeout: 60000 })
    await openBuddy(page).catch(() => {})
    await page.screenshot({ path: path.join(OUT, 'before-live-390.png'), fullPage: false })
    report.steps.push({ step: 'before-live', shot: 'before-live-390.png' })
    await page.close()
  }

  const page = await browser.newPage({ viewport: { width: 390, height: 844 } })
  await page.goto(BASE, { waitUntil: 'networkidle', timeout: 60000 })
  await openBuddy(page)
  await page.screenshot({ path: path.join(OUT, '01-open-390.png'), fullPage: false })

  // Zero results
  const zero = await runQuery(page, 'xyzzyqqq-no-match-999')
  report.steps.push({ step: 'zero', ...zero })
  await page.screenshot({ path: path.join(OUT, '02-zero-390.png'), fullPage: false })

  // Today's Synaxarium
  const today = await runQuery(page, "today's Synaxarium")
  report.steps.push({ step: 'today', ...today })
  await page.screenshot({ path: path.join(OUT, '03-today-results-390.png'), fullPage: false })

  const dialog = page.getByRole('dialog')
  const synaxBtn = dialog.locator('button').filter({ hasText: /Synaxarium|ስንክሳር|Preview/i }).first()
  const cardBtn = dialog.locator('button').filter({ has: page.locator('h3') }).first()
  const target = (await synaxBtn.count()) ? synaxBtn : cardBtn

  if ((await target.count()) === 0 && today.btnCount === 0 && today.linkCount === 0) {
    // Fallback: generic Synaxarium page query
    const pageHit = await runQuery(page, 'Synaxarium')
    report.steps.push({ step: 'synaxarium-page', ...pageHit })
    await page.screenshot({ path: path.join(OUT, '03b-synaxarium-page-390.png'), fullPage: false })
  }

  // Click first synaxarium preview card (button)
  const previewCards = dialog.locator('button').filter({ has: page.locator('h3') })
  const n = await previewCards.count()
  report.steps.push({ step: 'preview-card-count', n })
  if (n > 0) {
    await previewCards.first().click()
    await page.waitForTimeout(400)
    const back = dialog.getByRole('button', { name: /back to results|ወደ ውጤቶች/i })
    await back.waitFor({ state: 'visible', timeout: 5000 })
    await page.screenshot({ path: path.join(OUT, '04-preview-390.png'), fullPage: false })
    report.steps.push({ step: 'preview', hasBack: true })

    await back.click()
    await page.waitForTimeout(300)
    await page.screenshot({ path: path.join(OUT, '05-back-to-results-390.png'), fullPage: false })
    report.steps.push({ step: 'back-to-results', ok: true })

    // Re-open preview and open full page
    const again = dialog.locator('button').filter({ has: page.locator('h3') })
    if ((await again.count()) > 0) {
      await again.first().click()
      await page.waitForTimeout(300)
      const openFull = dialog.getByRole('button', { name: /open full page|ሙሉ ገጽ/i })
      await openFull.click()
      await page.waitForTimeout(800)
      const url = page.url()
      report.steps.push({ step: 'open-full', url })
      await page.screenshot({ path: path.join(OUT, '06-full-page-390.png'), fullPage: false })

      const backBuddy = page.getByRole('button', { name: /back to search buddy|ወደ ፍለጋ ረዳት/i })
      const hasBuddyBack = (await backBuddy.count()) > 0
      report.steps.push({ step: 'back-to-search-buddy-visible', hasBuddyBack })
      if (hasBuddyBack) {
        await backBuddy.click()
        await page.getByRole('dialog').waitFor({ state: 'visible', timeout: 8000 })
        await page.waitForTimeout(300)
        await page.screenshot({ path: path.join(OUT, '07-restored-session-390.png'), fullPage: false })
        const status = (await page.getByRole('dialog').locator('[role="status"]').innerText().catch(() => '')).trim()
        report.steps.push({ step: 'restored', status })
      }

      // Browser back should leave dialog / go previous history without loop
      await page.keyboard.press('Escape').catch(() => {})
      await page.waitForTimeout(200)
    }
  }

  // Amharic query
  await page.goto(BASE, { waitUntil: 'domcontentloaded' })
  await openBuddy(page)
  const am = await runQuery(page, 'ስንክሳር')
  report.steps.push({ step: 'amharic', ...am })
  await page.screenshot({ path: path.join(OUT, '08-amharic-390.png'), fullPage: false })

  // Desktop
  await page.setViewportSize({ width: 1280, height: 800 })
  await page.goto(BASE, { waitUntil: 'domcontentloaded' })
  await openBuddy(page)
  await runQuery(page, "today's Synaxarium")
  await page.screenshot({ path: path.join(OUT, '09-desktop-today.png'), fullPage: false })

  // Direct link refresh — session button only if session exists
  await page.goto(new URL('/pray/synaxarium', BASE).toString(), { waitUntil: 'domcontentloaded' })
  await page.screenshot({ path: path.join(OUT, '10-synaxarium-index.png'), fullPage: false })

  await fs.writeFile(path.join(OUT, 'report.json'), JSON.stringify(report, null, 2))
  await browser.close()
  console.log(JSON.stringify(report, null, 2))
  console.log('screenshots →', OUT)
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
