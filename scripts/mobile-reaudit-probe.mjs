/**
 * Independent production/local probe for mobile re-audit.
 * Run: node scripts/mobile-reaudit-probe.mjs
 * Optional: BASE_URL=http://127.0.0.1:4173 node scripts/mobile-reaudit-probe.mjs
 */
import { chromium } from 'playwright'
import fs from 'node:fs/promises'
import path from 'node:path'

const BASE = process.env.BASE_URL || 'https://tewahedodaily.pages.dev'
const OUT = path.resolve('tmp/mobile-reaudit-2026-10-09')
const VIEWPORT = { width: 390, height: 844 }

async function closeNavMenu(page) {
  const close = page.getByRole('button', { name: /close menu/i })
  if (await close.isVisible().catch(() => false)) {
    await close.click().catch(() => {})
    await page.waitForTimeout(250)
  }
  await page.keyboard.press('Escape').catch(() => {})
  await page.waitForTimeout(150)
}

function calendarDialog(page) {
  return page.locator('[role="dialog"]').filter({ has: page.getByRole('button', { name: /^close$/i }) })
}

async function openCalendarDetail(page) {
  await closeNavMenu(page)
  const cards = page.getByRole('button', { name: /open details/i })
  const n = await cards.count().catch(() => 0)
  for (let i = 0; i < Math.min(n, 12); i++) {
    const el = cards.nth(i)
    if (!(await el.isVisible().catch(() => false))) continue
    await el.click({ timeout: 3000 }).catch(() => {})
    await page.waitForTimeout(600)
    if (await calendarDialog(page).isVisible().catch(() => false)) return true
  }
  return false
}

async function main() {
  await fs.mkdir(OUT, { recursive: true })
  const browser = await chromium.launch({ headless: true })
  const page = await browser.newPage({ viewport: VIEWPORT })
  const report = { base: BASE, viewport: VIEWPORT, checks: {} }

  await page.goto(`${BASE}/`, { waitUntil: 'domcontentloaded', timeout: 60000 })
  await page.waitForTimeout(1200)
  await page.screenshot({ path: path.join(OUT, 'home-390.png'), fullPage: false })

  const langMenuBtn = page.getByRole('button', { name: /language|ቋንቋ/i })
  const langRadio = page.getByRole('radio', { name: /english|amharic|አማርኛ|both|oromo|afaan/i })
  const hamburger = page.getByRole('button', { name: /open menu|\u121D\u1293\u120C \u12AD\u1348\u1275/i })

  report.checks.language = {
    menuButtonVisible: await langMenuBtn.first().isVisible().catch(() => false),
    menuButtonCount: await langMenuBtn.count(),
    headerRadioVisible: await langRadio.first().isVisible().catch(() => false),
    headerRadioCount: await langRadio.count(),
    hamburgerVisible: await hamburger.first().isVisible().catch(() => false),
    triggerText: (await langMenuBtn.first().innerText().catch(() => '')).trim(),
  }

  if (report.checks.language.hamburgerVisible) {
    await hamburger.first().click()
    await page.waitForTimeout(400)
    report.checks.language.drawer = await page.evaluate(() => {
      const text = document.body.innerText
      return {
        hasEnglish: /english/i.test(text),
        hasAmharic: /amharic|\u12A0\u121B\u122D\u129B/i.test(text),
        hasOromo: /oromo|afaan/i.test(text),
        hasBoth: /\bboth\b|\u1201\u1208\u1271\u121D/i.test(text),
      }
    })
    await page.screenshot({ path: path.join(OUT, 'home-drawer-390.png'), fullPage: false })
    await closeNavMenu(page)
  }

  await page.goto(`${BASE}/calendar`, { waitUntil: 'domcontentloaded', timeout: 60000 })
  await page.waitForTimeout(2000)
  await closeNavMenu(page)
  await page.screenshot({ path: path.join(OUT, 'calendar-390.png'), fullPage: false })

  report.checks.calendar = {
    prevMonth: await page.getByRole('button', { name: /previous month|prev month/i }).count(),
    nextMonth: await page.getByRole('button', { name: /next month/i }).count(),
    prevDay: await page.getByRole('button', { name: /previous day|prev day|\u12EB\u1208\u1348\u12CD \u1240\u1295/i }).count(),
    nextDay: await page.getByRole('button', { name: /next day|\u1240\u1323\u12E9 \u1240\u1295/i }).count(),
    openDetailsButtons: await page.getByRole('button', { name: /open details/i }).count(),
  }

  const opened = await openCalendarDetail(page)

  if (opened) {
    const metrics = await page.evaluate(() => {
      const dialogs = Array.from(document.querySelectorAll('[role="dialog"]'))
      const dialog = dialogs.find((d) =>
        Array.from(d.querySelectorAll('button')).some((b) => /^close$/i.test((b.textContent || '').trim())),
      )
      if (!dialog) return null
      const r = dialog.getBoundingClientRect()
      const vh = window.innerHeight
      const close = Array.from(dialog.querySelectorAll('button')).find((b) =>
        /^close$/i.test((b.textContent || '').trim()),
      )
      const closeR = close?.getBoundingClientRect()
      const body = dialog.querySelector('[class*="body"]')
      return {
        height: Math.round(r.height),
        heightVh: Math.round((r.height / vh) * 100),
        top: Math.round(r.top),
        closeVisible: Boolean(closeR && closeR.top >= 0 && closeR.bottom <= vh + 2),
        closeMin: closeR ? Math.round(Math.min(closeR.width, closeR.height)) : null,
        overflowY: body ? getComputedStyle(body).overflowY : getComputedStyle(dialog).overflowY,
        maxHeight: getComputedStyle(dialog).maxHeight,
      }
    })
    report.checks.calendar.detail = { opened: true, ...metrics }
    await page.screenshot({ path: path.join(OUT, 'calendar-detail-390.png'), fullPage: false })

    const urlBeforeBack = page.url()
    await page.goBack()
    await page.waitForTimeout(800)
    const dialogAfterBack = await calendarDialog(page).isVisible().catch(() => false)
    report.checks.calendar.backBehavior = {
      urlBefore: urlBeforeBack,
      urlAfter: page.url(),
      dialogStillOpen: dialogAfterBack,
      stayedOnCalendar: page.url().includes('/calendar'),
      closedDetail: !dialogAfterBack && page.url().includes('/calendar'),
    }
  } else {
    report.checks.calendar.detail = { opened: false }
  }

  await page.goto(`${BASE}/bible`, { waitUntil: 'domcontentloaded', timeout: 60000 })
  await page.waitForTimeout(1500)
  await closeNavMenu(page)
  const search = page
    .getByRole('searchbox')
    .or(page.locator('input[type="search"], input[placeholder*="Search"], input[placeholder*="John"]'))
    .first()
  report.checks.bible = { searchVisible: await search.isVisible().catch(() => false) }
  if (report.checks.bible.searchVisible) {
    await search.fill('John 3:16')
    await page.keyboard.press('Enter').catch(() => {})
    await page.waitForTimeout(250)
    await search.fill('Mark 1:1')
    await page.keyboard.press('Enter').catch(() => {})
    await page.waitForTimeout(2800)
    const bodyText = await page.locator('main').innerText().catch(() => '')
    report.checks.bible.afterRace = {
      mentionsJohn316: /John\s*3\s*:\s*16/i.test(bodyText),
      mentionsMark11: /Mark\s*1\s*:\s*1/i.test(bodyText),
    }
    await page.screenshot({ path: path.join(OUT, 'bible-search-390.png'), fullPage: false })
  }

  await page.goto(`${BASE}/`, { waitUntil: 'domcontentloaded' })
  await page.waitForTimeout(800)
  await closeNavMenu(page)
  report.checks.touch = await page.evaluate(() => {
    const nodes = Array.from(
      document.querySelectorAll('header a, header button, footer a, [data-header] button'),
    )
    const small = []
    for (const el of nodes.slice(0, 40)) {
      const r = el.getBoundingClientRect()
      if (r.width < 1 || r.height < 1) continue
      if (r.width < 44 || r.height < 44) {
        small.push({
          text: (el.getAttribute('aria-label') || el.textContent || '').trim().slice(0, 40),
          w: Math.round(r.width),
          h: Math.round(r.height),
        })
      }
    }
    return { sampled: Math.min(nodes.length, 40), undersized: small }
  })

  await browser.close()
  const reportPath = path.join(OUT, 'probe-report.json')
  await fs.writeFile(reportPath, JSON.stringify(report, null, 2), 'utf8')
  console.log(JSON.stringify(report, null, 2))
  console.log(`\nWrote ${reportPath}`)
}

main().catch((e) => {
  console.error(e)
  process.exit(1)
})
