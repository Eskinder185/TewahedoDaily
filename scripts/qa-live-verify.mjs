import { chromium } from 'playwright'

const browser = await chromium.launch({ headless: true })
const page = await browser.newPage()
await page.goto('http://127.0.0.1:4174/calendar', { waitUntil: 'networkidle', timeout: 60000 })

const widths = [320, 360, 375, 390, 393, 412, 430, 768, 1280]
const out = []

for (const w of widths) {
  await page.setViewportSize({ width: w, height: 844 })
  await page.waitForTimeout(450)
  const m = await page.evaluate(() => {
    const el = document.querySelector('[aria-label="Calendar events timeline"]')
    const card = el?.querySelector('[class*="dayCards"] > *')
    const header = document.querySelector('[data-header]')
    const media = el?.querySelector('[class*="media"]')
    const r = media?.getBoundingClientRect()
    return {
      overflow: document.documentElement.scrollWidth - document.documentElement.clientWidth,
      scrollerW: el?.clientWidth ?? null,
      cardW: card?.getBoundingClientRect().width ?? null,
      headerOverflow: header ? header.scrollWidth - header.clientWidth : null,
      mediaAR: r && r.height ? +(r.width / r.height).toFixed(3) : null,
    }
  })

  await page.evaluate(() => {
    const el = document.querySelector('[aria-label="Calendar events timeline"]')
    if (el) el.scrollLeft = Math.max(0, (el.scrollWidth - el.clientWidth) / 2)
  })
  await page.waitForTimeout(120)
  const mid = await page.evaluate(
    () => document.querySelector('[aria-label="Calendar events timeline"]')?.scrollLeft ?? 0,
  )
  await page.locator('button[aria-label="Show later calendar events"]').click()
  await page.waitForTimeout(500)
  const after = await page.evaluate(
    () => document.querySelector('[aria-label="Calendar events timeline"]')?.scrollLeft ?? 0,
  )

  out.push({
    w,
    ...m,
    arrowDelta: after - mid,
    arrowMoved: after > mid + 10,
    fits: m.cardW != null && m.scrollerW != null ? m.cardW <= m.scrollerW + 1 : null,
  })
}

// Hymn holidays images + 404 + today copy
await page.setViewportSize({ width: 390, height: 844 })
await page.goto('http://127.0.0.1:4174/practice/browse/holidays-feasts', {
  waitUntil: 'networkidle',
  timeout: 60000,
})
await page.waitForTimeout(800)
const hymns = await page.evaluate(() => {
  const imgs = [...document.querySelectorAll('img')].filter((i) =>
    /calendar-web|content-media/.test(i.currentSrc || i.src),
  )
  return {
    count: imgs.length,
    allLoaded: imgs.every((i) => i.complete && i.naturalWidth > 0),
    brokenStorage: imgs.filter((i) => /hymns\/sections/.test(i.currentSrc || i.src)).length,
    samples: imgs.slice(0, 5).map((i) => (i.currentSrc || i.src).split('/').pop()),
  }
})

await page.goto('http://127.0.0.1:4174/today', { waitUntil: 'networkidle', timeout: 60000 })
await page.waitForTimeout(1200)
const today = await page.evaluate(() => {
  const t = document.body.innerText
  return {
    hasConfidence: /Confidence:\s*High/i.test(t),
    hasPdf: /PDF/i.test(t),
    hasMezmurPlaceholder: /No specific mezmur linked/i.test(t),
    hasEditorialPlaceholder: /will appear here when published/i.test(t),
  }
})

await page.goto('http://127.0.0.1:4174/nope-route-xyz', { waitUntil: 'networkidle' })
const notFound = await page.evaluate(() => /Page not found/i.test(document.body.innerText))

// Network on practice
const reqs = []
page.on('request', (req) => {
  const u = req.url()
  if (/supabase|rest\/v1/i.test(u)) reqs.push(u)
})
await page.goto('http://127.0.0.1:4174/practice', { waitUntil: 'networkidle', timeout: 60000 })
await page.waitForTimeout(500)
const legacy = reqs.filter((u) => /\/(mezmur|singers)(\?|$)/i.test(u) && !/import/i.test(u))
const imports = reqs.filter((u) => /_import/i.test(u))

console.log(
  JSON.stringify(
    { calendar: out, hymns, today, notFound, network: { legacy, importTables: [...new Set(imports.map((u) => u.split('?')[0].split('/').pop()))] } },
    null,
    2,
  ),
)

await browser.close()
