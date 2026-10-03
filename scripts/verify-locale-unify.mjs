/**
 * Browser verify: global EN / AM / Both across key pages and widths.
 * Usage: node scripts/verify-locale-unify.mjs [baseUrl]
 */
import { chromium } from 'playwright'
import fs from 'node:fs/promises'
import path from 'node:path'

const BASE = process.argv[2] || 'http://127.0.0.1:4181/'
const OUT = path.resolve('tmp/locale-unify-verify')
const WIDTHS = [320, 390, 430, 1280]
const MODES = ['en', 'am', 'both']
const PAGES = ['/', '/calendar', '/practice', '/pray', '/about', '/legal']

async function setLanguage(page, modeId) {
  const menuBtn = page.getByRole('button', { name: /open menu|ምናሌ ክፈት/i })
  if (await menuBtn.isVisible().catch(() => false)) {
    await menuBtn.click()
    await page.waitForTimeout(150)
  }

  const nameRe =
    modeId === 'en' ? /^english$/i : modeId === 'am' ? /^(amharic|አማርኛ)$/i : /^(both|ሁለቱም)$/i

  // Click the visible language radio (header on desktop, drawer on mobile).
  const radio = page.getByRole('radio', { name: nameRe })
  const count = await radio.count()
  let clicked = false
  for (let i = 0; i < count; i++) {
    const candidate = radio.nth(i)
    if (await candidate.isVisible()) {
      await candidate.click()
      clicked = true
      break
    }
  }
  if (!clicked) throw new Error(`No visible language radio for ${modeId}`)
  await page.waitForFunction(
    (expected) => document.documentElement.dataset.lang === expected,
    modeId,
    { timeout: 4000 },
  )

  await page.keyboard.press('Escape').catch(() => {})
  await page.waitForTimeout(120)
  const close = page.getByRole('button', { name: /close menu|ምናሌ ዝጋ/i })
  if (await close.isVisible().catch(() => false)) await close.click().catch(() => {})
  await page.locator('[class*="drawerRoot"]').waitFor({ state: 'hidden', timeout: 2000 }).catch(() => {})
}

async function main() {
  await fs.mkdir(OUT, { recursive: true })
  const browser = await chromium.launch({ headless: true })
  const report = { base: BASE, widths: {}, pages: {}, calendarPageLangToggle: null }

  for (const width of WIDTHS) {
    const page = await browser.newPage({ viewport: { width, height: width === 1280 ? 800 : 720 } })
    await page.goto(BASE, { waitUntil: 'domcontentloaded' })
    const overflow = await page.evaluate(
      () => document.documentElement.scrollWidth > document.documentElement.clientWidth + 1,
    )
    report.widths[width] = { overflowX: overflow, ok: !overflow }

    for (const mode of MODES) {
      await setLanguage(page, mode)
      const langAttr = await page.evaluate(() => ({
        htmlLang: document.documentElement.lang,
        dataLang: document.documentElement.dataset.lang,
      }))
      const shot = path.join(OUT, `home-${mode}-${width}.png`)
      await page.screenshot({ path: shot, fullPage: false })
      report.pages[`home:${mode}@${width}`] = {
        ...langAttr,
        shot,
        ok:
          (mode === 'am' && langAttr.htmlLang === 'am' && langAttr.dataLang === 'am') ||
          (mode === 'en' && langAttr.htmlLang === 'en' && langAttr.dataLang === 'en') ||
          (mode === 'both' && langAttr.htmlLang === 'en' && langAttr.dataLang === 'both'),
      }
    }
    await page.close()
  }

  {
    const page = await browser.newPage({ viewport: { width: 390, height: 844 } })
    await page.goto(new URL('/calendar', BASE).toString(), { waitUntil: 'domcontentloaded' })
    await page.waitForTimeout(800)
    report.calendarPageLangToggle = await page.locator('[class*="langToggle"]').count()

    for (const mode of MODES) {
      await setLanguage(page, mode)
      await page.waitForTimeout(300)
      const shot = path.join(OUT, `calendar-${mode}-390.png`)
      await page.screenshot({ path: shot, fullPage: false })
      report.pages[`calendar:${mode}`] = { shot }
    }

    await setLanguage(page, 'am')
    const fab = page.getByRole('button', { name: /አግኝ|find something/i })
    if (await fab.count()) {
      await fab.first().click()
      await page.screenshot({ path: path.join(OUT, 'searchbuddy-am-390.png'), fullPage: false })
      await page.keyboard.press('Escape')
    }
    await page.close()
  }

  {
    const page = await browser.newPage({ viewport: { width: 320, height: 720 } })
    await page.goto(BASE, { waitUntil: 'domcontentloaded' })
    await setLanguage(page, 'both')
    for (const route of PAGES) {
      await page.goto(new URL(route, BASE).toString(), { waitUntil: 'domcontentloaded' })
      await page.waitForTimeout(350)
      const overflow = await page.evaluate(
        () => document.documentElement.scrollWidth > document.documentElement.clientWidth + 1,
      )
      const shot = path.join(OUT, `both-320-${route.replace(/\//g, '_') || 'home'}.png`)
      await page.screenshot({ path: shot, fullPage: false })
      report.pages[`both@320:${route}`] = { overflowX: overflow, ok: !overflow, shot }
    }
    await page.close()
  }

  await browser.close()
  const reportPath = path.join(OUT, 'report.json')
  await fs.writeFile(reportPath, JSON.stringify(report, null, 2), 'utf8')
  console.log(JSON.stringify(report, null, 2))
  console.log(`\nWrote ${reportPath}`)
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
