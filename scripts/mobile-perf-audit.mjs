/**
 * Production mobile navigation/performance audit.
 *
 * Requires: npm run build && npm run preview -- --host 127.0.0.1 --port 4173
 * Run:      node scripts/mobile-perf-audit.mjs
 * Optional: BASE_URL=http://127.0.0.1:4173 LABEL=before node scripts/mobile-perf-audit.mjs
 *
 * Uses desktop Chromium with optional CPU/network throttling.
 * That is not a physical iPhone or Android measurement.
 */
import { chromium } from 'playwright'
import fs from 'node:fs/promises'
import path from 'node:path'

const BASE = process.env.BASE_URL || 'http://127.0.0.1:4173'
const LABEL = process.env.LABEL || 'run'
const OUT = path.resolve('artifacts/mobile-perf', LABEL)
const SAMPLES = Number(process.env.SAMPLES || 5)
const THROTTLE = process.env.THROTTLE === '1'
const VIEWPORT = {
  width: Number(process.env.VW || 390),
  height: Number(process.env.VH || 844),
}

const CPU_RATE = 4
const NET = {
  offline: false,
  latency: 150,
  downloadThroughput: Math.round((1.6 * 1024 * 1024) / 8),
  uploadThroughput: Math.round((750 * 1024) / 8),
  connectionType: 'cellular3g',
}

function median(values) {
  const nums = values.filter((n) => Number.isFinite(n)).sort((a, b) => a - b)
  if (!nums.length) return null
  const mid = Math.floor(nums.length / 2)
  return nums.length % 2 ? nums[mid] : (nums[mid - 1] + nums[mid]) / 2
}

function summarize(values) {
  const nums = values.filter((n) => Number.isFinite(n))
  if (!nums.length) return { n: 0, median: null, min: null, max: null, samples: [] }
  return {
    n: nums.length,
    median: Math.round(median(nums)),
    min: Math.round(Math.min(...nums)),
    max: Math.round(Math.max(...nums)),
    samples: nums.map((n) => Math.round(n)),
  }
}

async function applyThrottle(page) {
  if (!THROTTLE) return { enabled: false }
  const client = await page.context().newCDPSession(page)
  await client.send('Emulation.setCPUThrottlingRate', { rate: CPU_RATE })
  await client.send('Network.emulateNetworkConditions', NET)
  return { enabled: true, cpuRate: CPU_RATE, network: NET }
}

async function installObservers(page) {
  await page.addInitScript(() => {
    window.__tdPerf = {
      longTasks: [],
      shifts: [],
      lcp: null,
      navStart: performance.timeOrigin,
    }
    try {
      new PerformanceObserver((list) => {
        for (const entry of list.getEntries()) {
          window.__tdPerf.longTasks.push({
            start: Math.round(entry.startTime),
            duration: Math.round(entry.duration),
            name: entry.name,
          })
        }
      }).observe({ type: 'longtask', buffered: true })
    } catch {
      /* longtask may be unavailable */
    }
    try {
      new PerformanceObserver((list) => {
        for (const entry of list.getEntries()) {
          if (!entry.hadRecentInput) {
            window.__tdPerf.shifts.push({
              value: Number(entry.value.toFixed(4)),
              start: Math.round(entry.startTime),
            })
          }
        }
      }).observe({ type: 'layout-shift', buffered: true })
    } catch {
      /* ignore */
    }
    try {
      new PerformanceObserver((list) => {
        const entries = list.getEntries()
        const last = entries[entries.length - 1]
        if (last) {
          window.__tdPerf.lcp = {
            start: Math.round(last.startTime),
            size: last.size,
            url: last.url || '',
          }
        }
      }).observe({ type: 'largest-contentful-paint', buffered: true })
    } catch {
      /* ignore */
    }
  })
}

async function collectResources(page) {
  return page.evaluate(() => {
    const resources = performance.getEntriesByType('resource').map((entry) => ({
      name: entry.name,
      type: entry.initiatorType,
      transferSize: entry.transferSize,
      encoded: entry.encodedBodySize,
      decoded: entry.decodedBodySize,
      duration: Math.round(entry.duration),
      start: Math.round(entry.startTime),
    }))
    const js = resources.filter((r) => r.type === 'script' || /\.js(\?|$)/.test(r.name))
    const css = resources.filter((r) => r.type === 'css' || r.type === 'link' || /\.css(\?|$)/.test(r.name))
    const img = resources.filter((r) => r.type === 'img' || /\.(webp|jpg|jpeg|png|svg)(\?|$)/i.test(r.name))
    const api = resources.filter((r) => /supabase|\/rest\/v1\/|\/api\//i.test(r.name))
    const sum = (list, key) => list.reduce((n, item) => n + (item[key] || 0), 0)
    const hero = img.filter((r) => /lalibela/i.test(r.name))
    const longTasks = window.__tdPerf?.longTasks || []
    const shifts = window.__tdPerf?.shifts || []
    return {
      href: location.href,
      title: document.title,
      jsCount: js.length,
      jsTransferKb: Math.round(sum(js, 'transferSize') / 1024),
      jsDecodedKb: Math.round(sum(js, 'decoded') / 1024),
      cssTransferKb: Math.round(sum(css, 'transferSize') / 1024),
      imgTransferKb: Math.round(sum(img, 'transferSize') / 1024),
      apiCount: api.length,
      apiNames: api.map((r) => r.name.replace(/https:\/\/[^/]+/, '')),
      hero,
      jsFiles: js
        .map((r) => ({
          file: r.name.split('/').pop(),
          transferKb: Math.round((r.transferSize || 0) / 1024),
          decodedKb: Math.round((r.decoded || 0) / 1024),
          duration: r.duration,
        }))
        .sort((a, b) => b.decodedKb - a.decodedKb)
        .slice(0, 16),
      longTasks,
      longTaskMs: longTasks.reduce((n, t) => n + t.duration, 0),
      cls: Number(shifts.reduce((n, s) => n + s.value, 0).toFixed(4)),
      lcp: window.__tdPerf?.lcp || null,
      images: [...document.images].slice(0, 12).map((imgEl) => ({
        src: (imgEl.currentSrc || imgEl.src).split('/').pop(),
        currentSrc: imgEl.currentSrc,
        natural: `${imgEl.naturalWidth}x${imgEl.naturalHeight}`,
        display: `${Math.round(imgEl.getBoundingClientRect().width)}x${Math.round(imgEl.getBoundingClientRect().height)}`,
        loading: imgEl.loading,
        complete: imgEl.complete,
      })),
      overflowX: document.documentElement.scrollWidth - document.documentElement.clientWidth,
      consoleReady: true,
    }
  })
}

async function waitForMeaningful(page, testers, timeout = 12000) {
  const started = Date.now()
  const deadline = started + timeout
  while (Date.now() < deadline) {
    for (const tester of testers) {
      try {
        if (await tester()) {
          return Date.now() - started
        }
      } catch {
        /* keep waiting */
      }
    }
    await page.waitForTimeout(40)
  }
  return Date.now() - started
}

async function clickNav(page, name, destPath, contentTesters) {
  const link = page.getByRole('link', { name }).first()
  const visible = await link.isVisible().catch(() => false)
  if (!visible) {
    const open = page.getByRole('button', { name: /open menu|ምናሌ ክፈት/i }).first()
    if (await open.isVisible().catch(() => false)) {
      await open.click()
      await page.waitForTimeout(80)
    }
  }
  const target = page.getByRole('link', { name }).first()
  await target.waitFor({ state: 'visible', timeout: 8000 })

  const mark = Date.now()
  const clickPromise = target.click()
  const urlPromise = page.waitForURL((url) => url.pathname === destPath, { timeout: 15000 })
  await clickPromise
  const afterClick = Date.now() - mark
  await urlPromise
  const afterRoute = Date.now() - mark
  const afterContent = await waitForMeaningful(page, contentTesters)
  const perf = await page.evaluate((startMs) => {
    const longTasks = (window.__tdPerf?.longTasks || []).filter((t) => t.start >= startMs - 50)
    return {
      longTasks,
      longTaskMs: longTasks.reduce((n, t) => n + t.duration, 0),
      now: Math.round(performance.now()),
    }
  }, afterRoute)
  return {
    destPath,
    tapToClickResolvedMs: afterClick,
    tapToRouteMs: afterRoute,
    tapToContentMs: afterRoute + afterContent,
    longTaskMsDuringNav: perf.longTaskMs,
  }
}

function prayReady(page) {
  return [
    async () => page.getByRole('heading', { name: /pray|ጸሎት/i }).first().isVisible(),
    async () => page.locator('#main h1').first().isVisible(),
  ]
}

function hymnsReady(page) {
  return [
    async () => page.getByRole('heading', { name: /hymns|mezmur|መዝሙር/i }).first().isVisible(),
    async () => page.locator('a[href*="/practice/"]').nth(1).isVisible(),
  ]
}

function calendarReady(page) {
  return [
    async () => page.getByRole('heading', { name: /calendar|ዘመን/i }).first().isVisible(),
    async () => page.locator('[aria-label="Calendar events timeline"]').isVisible(),
  ]
}

function bibleReady(page) {
  return [
    async () => page.getByRole('heading', { name: /bible|መጽሐፍ/i }).first().isVisible(),
    async () => page.locator('#main h1').first().isVisible(),
  ]
}

async function homeReady(page) {
  await page.waitForSelector('#main h1', { timeout: 20000 })
  await page.waitForTimeout(200)
}

async function withPage(browser, options, fn) {
  const context = await browser.newContext({
    viewport: VIEWPORT,
    locale: options.locale || 'en-US',
    colorScheme: options.colorScheme || 'light',
    reducedMotion: options.reducedMotion || 'no-preference',
    serviceWorkers: options.serviceWorkers || 'block',
  })
  const page = await context.newPage()
  const errors = []
  const failed = []
  page.on('pageerror', (err) => errors.push(String(err)))
  page.on('requestfailed', (req) => failed.push(`${req.method()} ${req.url()} ${req.failure()?.errorText || ''}`))
  await installObservers(page)
  const throttle = await applyThrottle(page)
  try {
    const result = await fn(page)
    return { ...result, errors, failed: failed.slice(0, 12), throttle }
  } finally {
    await context.close()
  }
}

async function measureColdHome(browser, extras = {}) {
  return withPage(browser, extras, async (page) => {
    const t0 = Date.now()
    await page.goto(`${BASE}/`, { waitUntil: 'domcontentloaded', timeout: 60000 })
    const dcl = Date.now() - t0
    await homeReady(page)
    const ready = Date.now() - t0
    await page.waitForTimeout(900)
    const resources = await collectResources(page)
    return { dclMs: dcl, readyMs: ready, ...resources }
  })
}

async function measureWarmHome(browser) {
  return withPage(browser, {}, async (page) => {
    await page.goto(`${BASE}/`, { waitUntil: 'load', timeout: 60000 })
    await homeReady(page)
    const t0 = Date.now()
    await page.goto(`${BASE}/`, { waitUntil: 'domcontentloaded', timeout: 60000 })
    await homeReady(page)
    const ready = Date.now() - t0
    await page.waitForTimeout(400)
    const resources = await collectResources(page)
    return { readyMs: ready, ...resources }
  })
}

async function measureNavSamples(browser, label, clicker) {
  const samples = []
  for (let i = 0; i < SAMPLES; i++) {
    const row = await withPage(browser, {}, async (page) => {
      await page.goto(`${BASE}/`, { waitUntil: 'domcontentloaded', timeout: 60000 })
      await homeReady(page)
      await page.waitForTimeout(250)
      return clicker(page)
    })
    samples.push(row)
  }
  return {
    label,
    tapToRoute: summarize(samples.map((s) => s.tapToRouteMs)),
    tapToContent: summarize(samples.map((s) => s.tapToContentMs)),
    tapToClickResolved: summarize(samples.map((s) => s.tapToClickResolvedMs)),
    longTaskMsDuringNav: summarize(samples.map((s) => s.longTaskMsDuringNav)),
    samples,
  }
}

async function measureWarmNavSamples(browser, label, destPath, clicker) {
  const samples = []
  await withPage(browser, { serviceWorkers: 'allow' }, async (page) => {
    await page.goto(`${BASE}/`, { waitUntil: 'load', timeout: 60000 })
    await homeReady(page)
    await clicker(page)
    await page.goto(`${BASE}/`, { waitUntil: 'domcontentloaded', timeout: 60000 })
    await homeReady(page)
    for (let i = 0; i < SAMPLES; i++) {
      await page.goto(`${BASE}/`, { waitUntil: 'domcontentloaded', timeout: 60000 })
      await homeReady(page)
      await page.waitForTimeout(150)
      samples.push(await clicker(page))
      if (page.url().includes(destPath)) {
        await page.goBack({ waitUntil: 'domcontentloaded' }).catch(() => {})
        await homeReady(page).catch(() => {})
      }
    }
  })
  return {
    label,
    tapToRoute: summarize(samples.map((s) => s.tapToRouteMs)),
    tapToContent: summarize(samples.map((s) => s.tapToContentMs)),
    tapToClickResolved: summarize(samples.map((s) => s.tapToClickResolvedMs)),
    longTaskMsDuringNav: summarize(samples.map((s) => s.longTaskMsDuringNav)),
    samples,
  }
}

async function captureTrace(browser, name, runner) {
  const context = await browser.newContext({
    viewport: VIEWPORT,
    serviceWorkers: 'block',
  })
  const page = await context.newPage()
  await installObservers(page)
  await applyThrottle(page)
  await page.context().tracing.start({ screenshots: true, snapshots: true })
  try {
    await runner(page)
  } finally {
    await page.context().tracing.stop({ path: path.join(OUT, `${name}.zip`) })
    await context.close()
  }
}

async function screenshotStates(browser) {
  const shots = []
  const configs = [
    { name: '390x844-en-day', viewport: { width: 390, height: 844 }, locale: 'en-US', colorScheme: 'light' },
    { name: '360x800-en-day', viewport: { width: 360, height: 800 }, locale: 'en-US', colorScheme: 'light' },
    { name: '412x915-en-day', viewport: { width: 412, height: 915 }, locale: 'en-US', colorScheme: 'light' },
    { name: '390x844-en-night', viewport: { width: 390, height: 844 }, locale: 'en-US', colorScheme: 'dark' },
    { name: '844x390-landscape', viewport: { width: 844, height: 390 }, locale: 'en-US', colorScheme: 'light' },
    { name: '390x844-reduced', viewport: { width: 390, height: 844 }, locale: 'en-US', reducedMotion: 'reduce' },
  ]
  for (const cfg of configs) {
    const context = await browser.newContext({
      viewport: cfg.viewport,
      locale: cfg.locale,
      colorScheme: cfg.colorScheme || 'light',
      reducedMotion: cfg.reducedMotion || 'no-preference',
      serviceWorkers: 'block',
    })
    const page = await context.newPage()
    if (cfg.colorScheme === 'dark') {
      await page.addInitScript(() => localStorage.setItem('tewahedo-theme', 'night'))
    }
    if (cfg.name.includes('am')) {
      await page.addInitScript(() => localStorage.setItem('tewahedo-daily-locale', 'am'))
    }
    await page.goto(`${BASE}/`, { waitUntil: 'domcontentloaded', timeout: 60000 })
    await homeReady(page).catch(() => {})
    await page.waitForTimeout(400)
    const file = path.join(OUT, `${cfg.name}.png`)
    await page.screenshot({ path: file, fullPage: false })
    shots.push({ name: cfg.name, overflowX: await page.evaluate(() => document.documentElement.scrollWidth - document.documentElement.clientWidth) })
    await context.close()
  }
  const am = await browser.newContext({
    viewport: VIEWPORT,
    serviceWorkers: 'block',
  })
  const page = await am.newPage()
  await page.addInitScript(() => localStorage.setItem('tewahedo-daily-locale', 'am'))
  await page.goto(`${BASE}/`, { waitUntil: 'domcontentloaded', timeout: 60000 })
  await homeReady(page).catch(() => {})
  await page.waitForTimeout(500)
  await page.screenshot({ path: path.join(OUT, '390x844-am-day.png'), fullPage: false })
  await am.close()
  return shots
}

async function extraJourneys(browser) {
  return withPage(browser, {}, async (page) => {
    const notes = {}
    await page.goto(`${BASE}/`, { waitUntil: 'domcontentloaded', timeout: 60000 })
    await homeReady(page)

    const openDay = page.getByRole('link', { name: /open (today|this day)|ዛሬን ክፈት/i }).first()
    if (await openDay.isVisible().catch(() => false)) {
      const t0 = Date.now()
      await openDay.click()
      await page.waitForURL('**/calendar**', { timeout: 15000 })
      notes.homeCalendarCard = {
        tapToRouteMs: Date.now() - t0,
        url: page.url(),
      }
    }

    await page.goto(`${BASE}/calendar`, { waitUntil: 'domcontentloaded', timeout: 60000 })
    await page.waitForTimeout(800)
    const next = page.getByRole('button', { name: /next day|ቀጣይ/i }).first()
    if (await next.isVisible().catch(() => false)) {
      const times = []
      for (let i = 0; i < 3; i++) {
        const t0 = Date.now()
        await next.click()
        await page.waitForTimeout(80)
        times.push(Date.now() - t0)
      }
      notes.calendarNextDayMs = times
    }

    await page.goto(`${BASE}/bible`, { waitUntil: 'domcontentloaded', timeout: 60000 })
    await page.waitForTimeout(600)
    const book = page.locator('a[href*="/bible/"]').first()
    if (await book.isVisible().catch(() => false)) {
      const href = await book.getAttribute('href')
      const t0 = Date.now()
      await book.click()
      await page.waitForURL('**/bible/**', { timeout: 15000 })
      notes.bibleBook = { href, tapToRouteMs: Date.now() - t0, url: page.url() }
      const chapter = page.locator('a[href*="/bible/"]').nth(1)
      if (await chapter.isVisible().catch(() => false)) {
        const t1 = Date.now()
        await chapter.click()
        await page.waitForTimeout(400)
        notes.bibleChapter = { tapToRouteMs: Date.now() - t1, url: page.url() }
      }
    }

    await page.goto(`${BASE}/practice`, { waitUntil: 'domcontentloaded', timeout: 60000 })
    await page.waitForTimeout(900)
    const category = page.locator('a[href*="/practice/"]').first()
    notes.hymnFirstLink = await category.getAttribute('href').catch(() => null)
    if (await category.isVisible().catch(() => false)) {
      const t0 = Date.now()
      await category.click()
      await page.waitForTimeout(700)
      notes.hymnCategory = { tapToRouteMs: Date.now() - t0, url: page.url() }
    }

    const buddy = page.getByRole('button', { name: /search buddy|ፈልግ/i }).first()
    notes.searchBuddyVisible = await buddy.isVisible().catch(() => false)
    if (notes.searchBuddyVisible) {
      const t0 = Date.now()
      await buddy.click()
      const dialog = page.getByRole('dialog')
      await dialog.waitFor({ state: 'visible', timeout: 8000 }).catch(() => {})
      notes.searchBuddyOpenMs = Date.now() - t0
    }

    return notes
  })
}

async function main() {
  await fs.mkdir(OUT, { recursive: true })
  const browser = await chromium.launch({ headless: true })
  const report = {
    label: LABEL,
    base: BASE,
    viewport: VIEWPORT,
    samples: SAMPLES,
    throttle: THROTTLE
      ? { note: 'Throttled desktop Chromium, not a physical iPhone or Android device.', cpuRate: CPU_RATE, network: NET }
      : { note: 'Unthrottled desktop Chromium. Not a physical-device test.' },
    startedAt: new Date().toISOString(),
  }

  try {
    report.coldHome = []
    for (let i = 0; i < Math.max(2, Math.min(SAMPLES, 3)); i++) {
      report.coldHome.push(await measureColdHome(browser))
    }
    report.warmHome = []
    for (let i = 0; i < Math.max(2, Math.min(SAMPLES, 3)); i++) {
      report.warmHome.push(await measureWarmHome(browser))
    }

    report.nav = {
      homeToPrayCold: await measureNavSamples(browser, 'Home → Pray cold', (page) =>
        clickNav(page, /pray|ጸሎት/i, '/pray', prayReady(page)),
      ),
      homeToHymnsCold: await measureNavSamples(browser, 'Home → Hymns cold', (page) =>
        clickNav(page, /hymns|mezmur|መዝሙር|practice/i, '/practice', hymnsReady(page)),
      ),
      homeToCalendarCold: await measureNavSamples(browser, 'Home → Calendar cold', (page) =>
        clickNav(page, /calendar|keep the day|ዘመን/i, '/calendar', calendarReady(page)),
      ),
      homeToBibleCold: await measureNavSamples(browser, 'Home → Bible cold', (page) =>
        clickNav(page, /bible|መጽሐፍ/i, '/bible', bibleReady(page)),
      ),
      homeToPrayWarm: await measureWarmNavSamples(browser, 'Home → Pray warm', '/pray', (page) =>
        clickNav(page, /pray|ጸሎት/i, '/pray', prayReady(page)),
      ),
    }

    report.extra = await extraJourneys(browser)
    report.shots = await screenshotStates(browser)

    await captureTrace(browser, 'home-to-pray', async (page) => {
      await page.goto(`${BASE}/`, { waitUntil: 'domcontentloaded', timeout: 60000 })
      await homeReady(page)
      await clickNav(page, /pray|ጸሎት/i, '/pray', prayReady(page))
      await page.waitForTimeout(400)
    })
    await captureTrace(browser, 'home-to-hymns', async (page) => {
      await page.goto(`${BASE}/`, { waitUntil: 'domcontentloaded', timeout: 60000 })
      await homeReady(page)
      await clickNav(page, /hymns|mezmur|መዝሙር|practice/i, '/practice', hymnsReady(page))
      await page.waitForTimeout(400)
    })
  } finally {
    await browser.close()
  }

  report.finishedAt = new Date().toISOString()
  const jsonPath = path.join(OUT, 'report.json')
  await fs.writeFile(jsonPath, JSON.stringify(report, null, 2))
  console.log(JSON.stringify({
    out: jsonPath,
    coldHomeReady: summarize(report.coldHome.map((r) => r.readyMs)),
    coldJsDecodedKb: summarize(report.coldHome.map((r) => r.jsDecodedKb)),
    coldJsFiles: report.coldHome[0]?.jsFiles,
    hero: report.coldHome[0]?.hero,
    images: report.coldHome[0]?.images,
    homeToPrayCold: report.nav.homeToPrayCold.tapToContent,
    homeToHymnsCold: report.nav.homeToHymnsCold.tapToContent,
    homeToCalendarCold: report.nav.homeToCalendarCold.tapToContent,
    homeToBibleCold: report.nav.homeToBibleCold.tapToContent,
    homeToPrayWarm: report.nav.homeToPrayWarm.tapToContent,
    extra: report.extra,
  }, null, 2))
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
