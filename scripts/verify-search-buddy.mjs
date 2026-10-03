/**
 * Search Buddy browser verification: widths, queries, Open routes, screenshots.
 * Usage: node scripts/verify-search-buddy.mjs [baseUrl]
 */
import { chromium } from 'playwright'
import fs from 'node:fs/promises'
import path from 'node:path'

const AFTER_URL = process.argv[2] || 'http://127.0.0.1:4180/'
const BEFORE_URL = 'https://tewahedodaily.pages.dev/'
const OUT = path.resolve('tmp/search-buddy-verify')

const WIDTHS = [320, 360, 390, 430]
const QUERIES = [
  'Find Meskel hymns',
  'Take me to the calendar',
  'Where can I learn how to pray?',
  'Find St Michael hymns',
  'Show me fasting information',
  'Find a Zemari',
  'Show English Mezmurs',
  'Find a prayer',
  'Timkat',
  'repentance',
  'show my favorites',
  'Meskle',
  'መስቀል',
  'Meskel ጸሎት',
  'xyzzy-no-such-content-999',
]

async function ensureDir(dir) {
  await fs.mkdir(dir, { recursive: true })
}

async function openBuddy(page) {
  const fab = page.getByRole('button', { name: /find something|አግኝ/i })
  await fab.click()
  await page.getByRole('dialog').waitFor({ state: 'visible', timeout: 8000 })
}

async function runQuery(page, query) {
  const dialog = page.getByRole('dialog')
  const input = dialog.getByRole('textbox')
  await input.fill(query)
  await dialog.locator('form button[type="submit"]').click()
  // Wait until searching status clears or results appear
  await page.waitForFunction(
    () => {
      const status = document.querySelector('[role="dialog"] [role="status"]')?.textContent || ''
      return !/Searching|Looking|በመፈለግ/i.test(status)
    },
    null,
    { timeout: 20000 },
  ).catch(() => {})
  await page.waitForTimeout(200)
  const status = (await dialog.locator('[role="status"]').innerText().catch(() => '')).trim()
  const cards = dialog.locator('a[href]')
  const count = await cards.count()
  const results = []
  for (let i = 0; i < Math.min(count, 8); i++) {
    const card = cards.nth(i)
    const href = await card.getAttribute('href')
    const title = (await card.locator('h3').innerText().catch(() => '')).trim()
    const type = (await card.locator('p').first().innerText().catch(() => '')).trim()
    results.push({ href, title, type })
  }
  return { status, results }
}

async function checkLayout(page, width) {
  await page.setViewportSize({ width, height: 720 })
  await page.goto(AFTER_URL, { waitUntil: 'domcontentloaded' })
  await openBuddy(page)
  const metrics = await page.evaluate(() => {
    const dialog = document.querySelector('[role="dialog"]')
    const form = dialog?.querySelector('form')
    const overflowX = document.documentElement.scrollWidth > document.documentElement.clientWidth + 1
    const formBox = form?.getBoundingClientRect()
    const input = form?.querySelector('input')
    const btn = form?.querySelector('button[type="submit"]')
    return {
      overflowX,
      formWidth: formBox?.width ?? 0,
      inputBottom: input?.getBoundingClientRect().bottom ?? 0,
      btnTop: btn?.getBoundingClientRect().top ?? 0,
      panelWidth: dialog?.getBoundingClientRect().width ?? 0,
      viewport: window.innerWidth,
    }
  })
  return metrics
}

async function main() {
  await ensureDir(OUT)
  const browser = await chromium.launch({ headless: true })
  const report = { afterUrl: AFTER_URL, widths: {}, queries: {}, a11y: {}, beforeShot: null, afterShot: null }

  // Before screenshot (live)
  {
    const page = await browser.newPage({ viewport: { width: 320, height: 720 } })
    try {
      await page.goto(BEFORE_URL, { waitUntil: 'domcontentloaded', timeout: 45000 })
      await openBuddy(page)
      const beforePath = path.join(OUT, 'before-320.png')
      await page.screenshot({ path: beforePath, fullPage: false })
      report.beforeShot = beforePath
    } catch (err) {
      report.beforeShot = `failed: ${err.message}`
    }
    await page.close()
  }

  // Width layout checks + after screenshot
  for (const width of WIDTHS) {
    const page = await browser.newPage()
    try {
      const metrics = await checkLayout(page, width)
      report.widths[width] = {
        ok: !metrics.overflowX && metrics.formWidth <= width + 1,
        ...metrics,
      }
      if (width === 320) {
        const afterPath = path.join(OUT, 'after-320.png')
        await page.screenshot({ path: afterPath, fullPage: false })
        report.afterShot = afterPath
      }
    } catch (err) {
      report.widths[width] = { ok: false, error: err.message }
    }
    await page.close()
  }

  // Desktop
  {
    const page = await browser.newPage({ viewport: { width: 1280, height: 800 } })
    await page.goto(AFTER_URL, { waitUntil: 'domcontentloaded' })
    await openBuddy(page)
    await page.screenshot({ path: path.join(OUT, 'after-desktop.png'), fullPage: false })
    await page.close()
  }

  // Short landscape
  {
    const page = await browser.newPage({ viewport: { width: 740, height: 360 } })
    await page.goto(AFTER_URL, { waitUntil: 'domcontentloaded' })
    await openBuddy(page)
    const overflowX = await page.evaluate(
      () => document.documentElement.scrollWidth > document.documentElement.clientWidth + 1,
    )
    report.widths.landscape740x360 = { ok: !overflowX, overflowX }
    await page.screenshot({ path: path.join(OUT, 'after-landscape.png'), fullPage: false })
    await page.close()
  }

  // Query suite
  {
    const page = await browser.newPage({ viewport: { width: 390, height: 844 } })
    await page.goto(AFTER_URL, { waitUntil: 'domcontentloaded' })
    await openBuddy(page)

    for (const query of QUERIES) {
      const out = await runQuery(page, query)
      const slugTitles = out.results.filter((r) => /^[a-z0-9]+(?:-[a-z0-9]+)+(?:-\d+)?$/i.test(r.title))
      const badRoutes = out.results.filter(
        (r) => !r.href || r.href.includes(':') || r.href.startsWith('/admin'),
      )
      report.queries[query] = {
        status: out.status,
        count: out.results.length,
        top: out.results.slice(0, 5),
        slugTitles: slugTitles.map((r) => r.title),
        badRoutes: badRoutes.map((r) => r.href),
        ok:
          (query.includes('xyzzy')
            ? out.results.length === 0 || /couldn.?t find|አልተገኘ/i.test(out.status)
            : out.results.length > 0) &&
          slugTitles.length === 0 &&
          badRoutes.length === 0,
      }
    }

    // Escape closes + focus restore
    await page.keyboard.press('Escape')
    await page.waitForTimeout(200)
    const closed = await page.getByRole('dialog').count()
    const focused = await page.evaluate(() => {
      const el = document.activeElement
      return el?.tagName === 'BUTTON' && /find something|አግኝ/i.test(el.textContent || '')
    })
    report.a11y.escapeCloses = closed === 0
    report.a11y.focusRestored = focused

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
