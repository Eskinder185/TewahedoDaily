/**
 * Mobile UX verification for the restrained polish pass.
 * Requires: npm run build && npm run preview -- --host 127.0.0.1 --port 4174
 */
import { chromium } from 'playwright'
import fs from 'node:fs'
import path from 'node:path'

const BASE = process.env.QA_BASE || 'http://127.0.0.1:4174'
const OUT = path.resolve('tmp-qa-screens')
fs.mkdirSync(OUT, { recursive: true })

const browser = await chromium.launch({ headless: true })
const page = await browser.newPage()

async function shot(name, width = 390) {
  await page.setViewportSize({ width, height: 844 })
  await page.waitForTimeout(350)
  await page.screenshot({ path: path.join(OUT, `${name}-${width}.png`), fullPage: false })
}

const report = { base: BASE, checks: [] }

function note(label, ok, detail = {}) {
  report.checks.push({ label, ok, ...detail })
  console.log(`${ok ? '✓' : '✗'} ${label}`, detail)
}

// Calendar peek / fit
await page.goto(`${BASE}/calendar`, { waitUntil: 'networkidle', timeout: 60000 })
for (const w of [360, 390, 412, 430]) {
  await page.setViewportSize({ width: w, height: 844 })
  await page.waitForTimeout(400)
  const m = await page.evaluate(() => {
    const el = document.querySelector('[aria-label="Calendar events timeline"]')
    const card = el?.querySelector('[class*="dayCards"] > *')
    const next = card?.nextElementSibling
    return {
      scrollerW: el?.clientWidth ?? 0,
      cardW: card?.getBoundingClientRect().width ?? 0,
      peek: next
        ? Math.max(0, el.getBoundingClientRect().right - next.getBoundingClientRect().left)
        : null,
      overflow: document.documentElement.scrollWidth - document.documentElement.clientWidth,
    }
  })
  note(`calendar fit @${w}`, m.cardW <= m.scrollerW + 1 && m.overflow === 0, m)
}
await shot('calendar', 390)

// Hymn browse
await page.goto(`${BASE}/practice/browse/holidays-feasts`, { waitUntil: 'networkidle' })
await page.waitForTimeout(800)
const hymns = await page.evaluate(() => {
  const imgs = [...document.querySelectorAll('img')].filter((i) =>
    /calendar-web|content-media/.test(i.currentSrc || i.src),
  )
  return {
    n: imgs.length,
    ok: imgs.filter((i) => i.naturalWidth > 0).length,
    storageBroken: imgs.filter((i) => /hymns\/sections/.test(i.currentSrc || i.src)).length,
  }
})
note('holiday section images', hymns.storageBroken === 0 && hymns.ok > 0, hymns)
await shot('hymns-holidays', 390)

// Search overlay vs results
await page.goto(`${BASE}/practice?q=meskel`, { waitUntil: 'networkidle' })
await page.waitForTimeout(700)
const search = await page.evaluate(() => ({
  hasResults: /Search results/i.test(document.body.innerText),
  hasSuggest: Boolean(document.querySelector('[role="listbox"]')),
}))
note('search results without suggest overlay', search.hasResults && !search.hasSuggest, search)
await shot('search-results', 390)

// Saved guest list
await page.goto(`${BASE}/saved`, { waitUntil: 'networkidle' })
await page.waitForTimeout(500)
const saved = await page.evaluate(() => ({
  hasSavedLink: Boolean(document.querySelector('a[class*="savedLink"], [class*="savedList"]')),
  text: document.body.innerText.slice(0, 280),
}))
note('saved page reachable', /Saved|favorite/i.test(saved.text), saved)
await shot('saved', 390)

// 404 / home / today / about
await page.goto(`${BASE}/`, { waitUntil: 'networkidle' })
await shot('home', 390)
await page.goto(`${BASE}/today`, { waitUntil: 'networkidle' })
await page.waitForTimeout(1200)
const today = await page.evaluate(() => {
  const t = document.body.innerText
  return { hasPdf: /PDF/i.test(t), hasConfidence: /Confidence:/i.test(t) }
})
note('today clean copy', !today.hasPdf && !today.hasConfidence, today)
await shot('today', 390)
await page.goto(`${BASE}/about`, { waitUntil: 'networkidle' })
await shot('about', 390)

// Practice player sticky height (need a mezmur with video — open first library item if possible)
await page.goto(`${BASE}/practice`, { waitUntil: 'networkidle' })
await page.waitForTimeout(800)
const firstHref = await page.evaluate(() => {
  const a = document.querySelector('a[href*="/practice/mezmur/"]')
  return a?.getAttribute('href') || ''
})
if (firstHref) {
  await page.goto(`${BASE}${firstHref}`, { waitUntil: 'networkidle', timeout: 60000 })
  await page.waitForTimeout(1500)
  const sticky = await page.evaluate(() => {
    const bar = document.querySelector('[aria-label="Playback controls"]')
    const r = bar?.getBoundingClientRect()
    const parts = [...document.querySelectorAll('button')].some((b) =>
      /Loop Part|Part 1/i.test(b.getAttribute('aria-label') || b.textContent || ''),
    )
    const partLabels = [...document.querySelectorAll('[class*="partTitle"]')].map((el) =>
      el.textContent?.trim(),
    )
    return {
      stickyH: r?.height ?? null,
      parts: partLabels,
      hasAdvancedLead: /choose where my loop starts and ends/i.test(document.body.innerText),
      recordingLabels: [...document.querySelectorAll('button')].filter((b) =>
        /With lyrics|From memory/i.test(b.textContent || ''),
      ).map((b) => ({
        text: b.textContent?.trim(),
        w: b.getBoundingClientRect().width,
        overflow: b.scrollWidth > b.clientWidth + 1,
      })),
    }
  })
  note(
    'mini-player compact height',
    sticky.stickyH != null && sticky.stickyH < 160,
    { stickyH: sticky.stickyH },
  )
  note('parts visible', sticky.parts.includes('Part 1'), { parts: sticky.parts })
  note('advanced loop copy', sticky.hasAdvancedLead)
  note(
    'recording labels fit',
    sticky.recordingLabels.length === 0 || sticky.recordingLabels.every((r) => !r.overflow),
    { recordingLabels: sticky.recordingLabels },
  )
  await shot('mezmur-player', 390)
} else {
  note('mezmur detail available', false, { reason: 'no mezmur link on /practice' })
}

fs.writeFileSync(path.join(OUT, 'report.json'), JSON.stringify(report, null, 2))
console.log('\nWrote', path.join(OUT, 'report.json'))
await browser.close()
