/**
 * Unified mobile user-journey checks (Playwright Chromium).
 *
 * Covers navigation, Search Buddy, content pages, language switching,
 * overflow at 360/390, and reduced-motion. Uses the existing `playwright`
 * dependency — not @playwright/test.
 *
 * Start the app first (`npm run dev` or `npm run preview`), then:
 *   npm run test:journeys
 * Optional: BASE_URL=http://127.0.0.1:4173
 */
import { chromium } from 'playwright'

const BASE = process.env.BASE_URL ?? 'http://127.0.0.1:5173'
const VIEW_360 = { width: 360, height: 800 }
const VIEW_390 = { width: 390, height: 844 }

/** @type {string[]} */
const failures = []
/** @type {string[]} */
const passed = []

function ok(name) {
  passed.push(name)
  console.log(`  ok  ${name}`)
}

function fail(name, detail) {
  const msg = `${name}: ${detail}`
  failures.push(msg)
  console.error(`  FAIL  ${msg}`)
}

async function overflow(page) {
  return page.evaluate(
    () => document.documentElement.scrollWidth > document.documentElement.clientWidth + 2,
  )
}

async function goto(page, path) {
  const response = await page.goto(`${BASE}${path}`, {
    waitUntil: 'domcontentloaded',
    timeout: 60000,
  })
  await page.locator('#main').waitFor({ state: 'visible', timeout: 30000 })
  return response
}

async function closeOverlays(page) {
  const closeSearch = page.getByRole('button', { name: /^Close$/i })
  if (await closeSearch.isVisible().catch(() => false)) {
    await closeSearch.click()
    await page.getByRole('dialog').waitFor({ state: 'hidden', timeout: 5000 }).catch(() => {})
  }
  const closeMenu = page.getByRole('button', { name: /Close menu/i })
  if (await closeMenu.isVisible().catch(() => false)) {
    await closeMenu.click()
  }
}

/**
 * @param {import('playwright').Page} page
 * @param {string} name
 */
async function assertNoOverflow(page, name) {
  const wide = await overflow(page)
  if (wide) fail(name, 'horizontal overflow (scrollWidth > clientWidth)')
  else ok(name)
}

/**
 * @param {string} name
 * @param {() => Promise<void>} fn
 */
async function step(name, fn) {
  try {
    await fn()
  } catch (error) {
    fail(name, /** @type {Error} */ (error).message)
  }
}

async function openDrawer(page) {
  await closeOverlays(page)
  await page.getByRole('button', { name: /Open menu/i }).click()
  return page.getByRole('dialog', { name: /Menu/i })
}

async function forceEnglish(page) {
  await page.evaluate(() => {
    localStorage.setItem('tewahedo-daily-locale', 'en')
    document.documentElement.lang = 'en'
  })
}

async function runJourneys(page) {
  await goto(page, '/')

  if (await page.locator('#main').count()) ok('home has main landmark')
  else fail('home has main landmark', 'missing #main')

  const skip = page.getByRole('link', { name: /Skip to main content/i })
  if (await skip.count()) ok('skip link present')
  else fail('skip link present', 'not found')

  await assertNoOverflow(page, 'home 360 overflow')

  await step('home calendar preview visible', async () => {
    await page
      .getByRole('heading', { name: /What the Church is keeping/i })
      .waitFor({ state: 'visible', timeout: 12000 })
    ok('home calendar preview visible')
  })

  await step('mobile drawer opens', async () => {
    const drawer = await openDrawer(page)
    await drawer.waitFor({ state: 'visible', timeout: 5000 })
    ok('mobile drawer opens')
  })

  await step('pray page heading', async () => {
    const drawer = page.getByRole('dialog', { name: /Menu/i })
    if (!(await drawer.isVisible().catch(() => false))) await openDrawer(page)
    await page.getByRole('dialog', { name: /Menu/i }).getByRole('link', { name: /^Pray$/i }).click()
    await page.waitForURL(/\/pray/, { timeout: 15000 })
    await page.locator('#main h1').first().waitFor({ state: 'visible', timeout: 15000 })
    ok('pray page heading')
    await assertNoOverflow(page, 'pray 360 overflow')
  })

  await step('nav to hymns /practice', async () => {
    const drawer = await openDrawer(page)
    await drawer.getByRole('link', { name: /^Hymns$/i }).click()
    await page.waitForURL(/\/practice/, { timeout: 15000 })
    ok('nav to hymns /practice')
    await assertNoOverflow(page, 'practice 360 overflow')
  })

  await step('calendar heading', async () => {
    const drawer = await openDrawer(page)
    await drawer.getByRole('link', { name: /^Calendar$/i }).click()
    await page.waitForURL(/\/calendar/, { timeout: 15000 })
    await page.getByRole('heading', { name: /^Calendar$/i }).waitFor({
      state: 'visible',
      timeout: 15000,
    })
    ok('calendar heading')
    await assertNoOverflow(page, 'calendar 360 overflow')
  })

  await step('nav to bible', async () => {
    const drawer = await openDrawer(page)
    await drawer.getByRole('link', { name: /^Bible$/i }).click()
    await page.waitForURL(/\/bible/, { timeout: 15000 })
    ok('nav to bible')
    await assertNoOverflow(page, 'bible 360 overflow')
  })

  await step('language switch EN ↔ AM', async () => {
    await goto(page, '/')
    await closeOverlays(page)
    await page.getByRole('button', { name: /Switch to Amharic/i }).first().click()
    const langAm = await page.evaluate(() => document.documentElement.lang)
    if (langAm === 'am') ok('language switch to Amharic')
    else fail('language switch to Amharic', `html lang=${langAm}`)

    await page.waitForTimeout(400)
    await assertNoOverflow(page, 'home Amharic 360 overflow')

    const amToggle = page.locator('header button[lang="am"]').first()
    await amToggle.click()
    const langEn = await page.evaluate(() => document.documentElement.lang)
    if (langEn === 'en') ok('language switch back to English')
    else fail('language switch back to English', `html lang=${langEn}`)
  })

  await forceEnglish(page)
  await page.reload({ waitUntil: 'domcontentloaded' })
  await page.locator('#main').waitFor({ state: 'visible', timeout: 30000 })
  await closeOverlays(page)

  await step('Search Buddy Open Calendar', async () => {
    await page.getByRole('button', { name: /Open search/i }).click()
    const searchDialog = page.getByRole('dialog').filter({
      has: page.getByRole('heading', { name: /^Search$/i }),
    })
    await searchDialog.waitFor({ state: 'visible', timeout: 8000 })
    ok('Search Buddy dialog opens')

    const toc = searchDialog.getByRole('heading', { name: /table of contents/i })
    if ((await toc.count()) === 0) ok('Search Buddy has no Faith and Order TOC')
    else fail('Search Buddy has no Faith and Order TOC', 'TOC heading present')

    const composer = searchDialog.getByRole('textbox', { name: /Search the website/i })
    await composer.fill('Open Calendar')
    await searchDialog.getByRole('button', { name: /^Search$/i }).click()

    const openLink = searchDialog.getByRole('link', { name: /Open/i }).first()
    await openLink.waitFor({ state: 'visible', timeout: 20000 })
    const href = await openLink.getAttribute('href')
    if (href && href.includes('/calendar')) ok('Search Buddy Open Calendar → /calendar')
    else fail('Search Buddy Open Calendar → /calendar', `href=${href}`)

    await assertNoOverflow(page, 'Search Buddy panel 360 overflow')
    await closeOverlays(page)
  })
}

async function runReducedMotion(browser) {
  const context = await browser.newContext({
    viewport: VIEW_360,
    reducedMotion: 'reduce',
    locale: 'en-US',
  })
  const page = await context.newPage()
  try {
    await goto(page, '/')
    await page.getByRole('button', { name: /Open search/i }).click()
    await page.getByRole('dialog').waitFor({ state: 'visible', timeout: 8000 })
    ok('reduced-motion: Search Buddy still opens')
    await assertNoOverflow(page, 'reduced-motion 360 overflow')
  } catch (error) {
    fail('reduced-motion journey', /** @type {Error} */ (error).message)
  } finally {
    await context.close()
  }
}

async function runOverflowSweep(browser) {
  const paths = ['/', '/pray', '/practice', '/calendar', '/bible']
  const context = await browser.newContext({ viewport: VIEW_390, locale: 'en-US' })
  const page = await context.newPage()
  try {
    for (const path of paths) {
      await goto(page, path)
      await page.waitForTimeout(500)
      await assertNoOverflow(page, `${path} 390 overflow`)
    }
  } catch (error) {
    fail('390 overflow sweep', /** @type {Error} */ (error).message)
  } finally {
    await context.close()
  }
}

async function main() {
  const probe = await fetch(BASE, { method: 'GET' }).catch(() => null)
  if (!probe || !probe.ok) {
    console.error(
      `App not reachable at ${BASE}. Start \`npm run dev\` (or preview) first, or set BASE_URL.`,
    )
    process.exit(1)
  }

  const browser = await chromium.launch()
  const context = await browser.newContext({ viewport: VIEW_360, locale: 'en-US' })
  const page = await context.newPage()
  page.setDefaultTimeout(15000)

  console.log(`Journeys against ${BASE}`)
  try {
    await runJourneys(page)
  } catch (error) {
    fail('360 journeys', /** @type {Error} */ (error).message)
  }
  await context.close()

  await runReducedMotion(browser)
  await runOverflowSweep(browser)
  await browser.close()

  console.log(`\n${passed.length} passed, ${failures.length} failed`)
  if (failures.length) {
    console.error(failures.join('\n'))
    process.exit(1)
  }
  console.log('Playwright journeys OK')
}

main()
