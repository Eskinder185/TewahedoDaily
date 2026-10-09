/**
 * Local regression: Calendar sheet / Back / day nav + mobile EN↔አማ toggle.
 * Run against preview: BASE_URL=http://127.0.0.1:4173 node scripts/test-mobile-calendar-language.mjs
 */
import { chromium } from 'playwright'

const BASE = process.env.BASE_URL || 'http://127.0.0.1:4173'
const VIEWPORT = { width: 390, height: 844 }

function assert(cond, msg) {
  if (!cond) throw new Error(msg)
}

async function closeNavMenu(page) {
  const close = page.getByRole('button', { name: /close menu/i })
  if (await close.isVisible().catch(() => false)) {
    await close.click().catch(() => {})
    await page.waitForTimeout(250)
  }
  await page.keyboard.press('Escape').catch(() => {})
  await page.waitForTimeout(200)
}

/** Calendar event sheet — exclude the header nav drawer (also role=dialog). */
function calendarDialog(page) {
  return page.locator('[role="dialog"]').filter({ has: page.getByRole('button', { name: /^close$/i }) })
}

async function openDetail(page) {
  await closeNavMenu(page)
  const openCandidates = page.getByRole('button', { name: /open details/i })
  const n = await openCandidates.count().catch(() => 0)
  for (let i = 0; i < Math.min(n, 12); i++) {
    const el = openCandidates.nth(i)
    if (!(await el.isVisible().catch(() => false))) continue
    await el.click({ timeout: 3000 }).catch(() => {})
    await page.waitForTimeout(500)
    if (await calendarDialog(page).isVisible().catch(() => false)) return true
  }
  const cards = page.locator('button[aria-label*="Open details"], button[aria-label*="open details"]')
  const c = await cards.count()
  for (let i = 0; i < Math.min(c, 12); i++) {
    const el = cards.nth(i)
    if (!(await el.isVisible().catch(() => false))) continue
    await el.click({ timeout: 2000 }).catch(() => {})
    await page.waitForTimeout(500)
    if (await calendarDialog(page).isVisible().catch(() => false)) return true
  }
  return false
}

async function main() {
  const browser = await chromium.launch({ headless: true })
  const page = await browser.newPage({ viewport: VIEWPORT })
  const results = []

  // LANGUAGE-01: header one-tap switcher
  await page.goto(`${BASE}/`, { waitUntil: 'networkidle', timeout: 90000 })
  await page.waitForTimeout(800)
  const langBtn = page.getByRole('button', { name: /language|ቋንቋ/i }).first()
  assert(await langBtn.isVisible(), 'LANGUAGE-01: language button visible in header')
  const before = await langBtn.innerText()
  await langBtn.click()
  await page.waitForTimeout(600)
  const after = await langBtn.innerText()
  assert(before !== after || /አማ|EN/.test(after), 'LANGUAGE-01: toggle changes label')
  const htmlLang = await page.locator('html').getAttribute('lang')
  assert(htmlLang === 'am' || htmlLang === 'en', `LANGUAGE-01: html lang is ${htmlLang}`)
  // No Oromo option in drawer
  const hamburger = page.getByRole('button', { name: /open menu|ምናሌ/i })
  if (await hamburger.isVisible().catch(() => false)) {
    await hamburger.click()
    await page.waitForTimeout(400)
    const drawerText = await page.evaluate(() => document.body.innerText)
    assert(!/oromo|afaan/i.test(drawerText), 'LANGUAGE-01: no Oromo in drawer')
    await closeNavMenu(page)
  }
  results.push('LANGUAGE-01 PASS')

  // Stay on page after toggle
  await page.goto(`${BASE}/calendar`, { waitUntil: 'networkidle', timeout: 90000 })
  await page.waitForTimeout(1500)
  await closeNavMenu(page)
  const langOnCal = page.getByRole('button', { name: /language|ቋንቋ/i }).first()
  await langOnCal.click()
  await page.waitForTimeout(400)
  assert(page.url().includes('/calendar'), 'LANGUAGE-01: stays on calendar after switch')
  results.push('LANGUAGE-01 stay-on-page PASS')

  // CAL-04 day nav
  const prevDay = page.getByRole('button', { name: /previous day|ያለፈው ቀን/i })
  const nextDay = page.getByRole('button', { name: /next day|ቀጣዩ ቀን/i })
  assert((await prevDay.count()) >= 1, 'CAL-04: previous day control present')
  assert((await nextDay.count()) >= 1, 'CAL-04: next day control present')
  assert(await prevDay.first().isVisible(), 'CAL-04: previous day visible')
  assert(await nextDay.first().isVisible(), 'CAL-04: next day visible')
  await nextDay.first().click()
  await page.waitForTimeout(400)
  await prevDay.first().click()
  await page.waitForTimeout(400)
  results.push('CAL-04 PASS')

  // CAL-05 scroll restore (use a reachable offset; content height can change on open)
  await page.evaluate(() => {
    const maxY = Math.max(0, document.documentElement.scrollHeight - window.innerHeight)
    window.scrollTo(0, Math.min(280, maxY))
  })
  await page.waitForTimeout(200)
  const yBefore = await page.evaluate(() => window.scrollY)
  assert(yBefore > 40, `CAL-05: need scroll room (y=${yBefore})`)
  const opened = await openDetail(page)
  assert(opened, 'CAL-01/02: could open calendar detail')

  // CAL-01 sheet height ~72dvh
  const metrics = await page.evaluate(() => {
    const dialogs = Array.from(document.querySelectorAll('[role="dialog"]'))
    const dialog = dialogs.find((d) =>
      Array.from(d.querySelectorAll('button')).some((b) => /^close$/i.test((b.textContent || '').trim())),
    )
    if (!dialog) return null
    const r = dialog.getBoundingClientRect()
    const vh = window.innerHeight
    const body = dialog.querySelector('[class*="body"]') || dialog
    return {
      heightVh: Math.round((r.height / vh) * 100),
      maxHeight: getComputedStyle(dialog).maxHeight,
      bodyOverflow: body ? getComputedStyle(body).overflowY : null,
    }
  })
  assert(metrics && metrics.heightVh <= 78, `CAL-01: sheet too tall (${metrics?.heightVh}vh)`)
  assert(metrics && metrics.heightVh >= 55, `CAL-01: sheet too short (${metrics?.heightVh}vh)`)
  results.push(`CAL-01 PASS (${metrics.heightVh}vh)`)

  // CAL-02 Back closes detail
  await page.goBack()
  await page.waitForTimeout(700)
  assert(!(await calendarDialog(page).isVisible().catch(() => false)), 'CAL-02: dialog closed on Back')
  assert(page.url().includes('/calendar'), 'CAL-02: stayed on calendar')
  results.push('CAL-02 PASS')

  // CAL-05 after close
  await page.waitForTimeout(280)
  const yAfter = await page.evaluate(() => window.scrollY)
  assert(yAfter > 40, `CAL-05: should not jump to top (after=${yAfter})`)
  assert(Math.abs(yAfter - yBefore) < 120, `CAL-05: scroll restore (before=${yBefore} after=${yAfter})`)
  results.push('CAL-05 PASS')

  // CAL-03 Escape + focus (open again)
  assert(await openDetail(page), 'CAL-03: reopen detail')
  await page.keyboard.press('Escape')
  await page.waitForTimeout(500)
  assert(!(await calendarDialog(page).isVisible().catch(() => false)), 'CAL-03: Escape closes')
  results.push('CAL-03 Escape PASS')

  await browser.close()
  console.log(results.join('\n'))
  console.log('All mobile calendar/language regressions passed.')
}

main().catch((e) => {
  console.error(e)
  process.exit(1)
})
