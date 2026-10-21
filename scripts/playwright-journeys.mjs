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

  await step('home companion heading', async () => {
    await page
      .getByRole('heading', { name: /One day\. A deeper connection/i })
      .waitFor({ state: 'visible', timeout: 10000 })
    ok('home companion heading')
  })

  await step('home resource links', async () => {
    const bible = page.getByRole('link', { name: /Read Scripture/i })
    const pray = page.getByRole('link', { name: /Browse prayers/i })
    const hymns = page.getByRole('link', { name: /Browse hymns/i })
    const calendar = page.getByRole('link', { name: /Open the church calendar/i })
    if ((await bible.getAttribute('href')) !== '/bible') throw new Error('Bible href')
    if ((await pray.getAttribute('href')) !== '/pray') throw new Error('Pray href')
    if ((await hymns.getAttribute('href')) !== '/practice') throw new Error('Hymns href')
    if ((await calendar.getAttribute('href')) !== '/calendar') throw new Error('Calendar href')
    ok('home resource links')
  })

  await step('home day navigation', async () => {
    const dayCard = page.locator('article[data-iso]').first()
    await dayCard.waitFor({ state: 'visible', timeout: 8000 })
    const before = await dayCard.getAttribute('data-iso')
    await page.getByRole('button', { name: /Next day/i }).click()
    await page.waitForFunction(
      (prev) => document.querySelector('article[data-iso]')?.getAttribute('data-iso') !== prev,
      before,
      { timeout: 8000 },
    )
    await page.getByRole('button', { name: /^Today$/i }).click()
    await page.waitForFunction(
      (prev) => document.querySelector('article[data-iso]')?.getAttribute('data-iso') === prev,
      before,
      { timeout: 8000 },
    )
    const href = await page.getByRole('link', { name: /Open this day in the calendar/i }).getAttribute('href')
    if (!href || !href.includes('/calendar?date=')) throw new Error(`day CTA href=${href}`)
    ok('home day navigation')
  })

  await step('obsolete Today page and see-all stay gone', async () => {
    const seeAll = page.getByText(/See all of today’s observances/i)
    if ((await seeAll.count()) > 0) throw new Error('see-all link present')
    await goto(page, '/today')
    await page.getByRole('heading', { name: /Page not found/i }).waitFor({ timeout: 10000 })
    ok('obsolete Today page and see-all stay gone')
  })

  await step('obsolete What the Church is keeping is gone', async () => {
    await goto(page, '/')
    const obsolete = page.getByRole('heading', { name: /What the Church is keeping/i })
    if ((await obsolete.count()) > 0) throw new Error('obsolete Home preview still rendered')
    ok('obsolete What the Church is keeping is gone')
  })

  await step('home event rotation controls', async () => {
    const dayNav = page.getByRole('navigation', { name: /Choose a calendar day/i })
    await dayNav.waitFor({ state: 'visible', timeout: 8000 })
    for (const name of [/^Previous day$/i, /^Today$/i, /^Next day$/i]) {
      if ((await dayNav.getByRole('button', { name }).count()) !== 1) {
        throw new Error(`day nav missing ${name}`)
      }
    }
    const prevEvent = page.getByRole('button', { name: /Previous event/i })
    const nextEvent = page.getByRole('button', { name: /Next event/i })
    if (await prevEvent.isVisible().catch(() => false)) throw new Error('Previous event toolbar still visible')
    if (await nextEvent.isVisible().catch(() => false)) throw new Error('Next event toolbar still visible')
    await page.getByRole('link', { name: /Open this day in the calendar/i }).first().waitFor({
      state: 'visible',
      timeout: 10000,
    })
    const pause = page.getByRole('button', { name: /Pause events/i })
    if (await pause.count()) {
      await pause.click()
      const play = page.getByRole('button', { name: /Play events/i })
      await play.waitFor({ state: 'visible', timeout: 4000 })
      if ((await play.getAttribute('aria-pressed')) !== 'true') {
        throw new Error('pause did not stick')
      }
      await play.click()
      await page.getByRole('button', { name: /Pause events/i }).waitFor({ state: 'visible', timeout: 4000 })
    }
    ok('home event rotation controls')
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
    await page.waitForURL(/\/pray(?:\/|$|\?)/, { timeout: 15000 })
    await page.getByRole('heading', { name: /Prayer collections/i }).waitFor({
      state: 'visible',
      timeout: 15000,
    })
    if (await page.locator('#today-preview').isVisible().catch(() => false)) {
      throw new Error('Today in Church preview still on Pray')
    }
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
    await drawer.getByRole('link', { name: 'Calendar' }).click()
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

  await step('Search Buddy calendar EN: Michael feast → annual → Calendar', async () => {
    await runCalendarQuestionJourney(page, 'en')
  })

  await step('Search Buddy calendar AM: Michael feast → annual → Calendar', async () => {
    await page.evaluate(() => {
      localStorage.setItem('tewahedo-daily-locale', 'am')
      document.documentElement.lang = 'am'
    })
    await page.reload({ waitUntil: 'domcontentloaded' })
    await page.locator('#main').waitFor({ state: 'visible', timeout: 30000 })
    await closeOverlays(page)
    await runCalendarQuestionJourney(page, 'am')
    await forceEnglish(page)
    await page.reload({ waitUntil: 'domcontentloaded' })
    await page.locator('#main').waitFor({ state: 'visible', timeout: 30000 })
  })
}

/**
 * @param {import('playwright').Page} page
 * @param {'en' | 'am'} lang
 */
async function runCalendarQuestionJourney(page, lang) {
  const openName = lang === 'am' ? /ፍለጋን ክፈት/ : /Open search/i
  const heading = lang === 'am' ? /የቤተ ክርስቲያን ቀን መቁጠሪያ/ : /Church calendar/i
  const question =
    lang === 'am' ? 'የቅዱስ ሚካኤል በዓል መቼ ነው?' : "When is Saint Michael's feast?"
  const annual = lang === 'am' ? 'ዓመታዊ በዓል' : 'Annual feast'
  const openCal = lang === 'am' ? /በቀን መቁጠሪያ ክፈት/ : /Open in Calendar/i
  const inputAria = lang === 'am' ? /ድረ-ገጹን ይፈልጉ/ : /Search the website/i
  const sendName = lang === 'am' ? /^ፈልግ$/ : /^Search$/i

  await page.getByRole('button', { name: openName }).click()
  const searchDialog = page.getByRole('dialog').filter({
    has: page.getByRole('heading', { name: lang === 'am' ? /^ፍለጋ$/ : /^Search$/i }),
  })
  await searchDialog.waitFor({ state: 'visible', timeout: 8000 })
  const composer = searchDialog.getByRole('textbox', { name: inputAria })
  await composer.fill(question)
  await searchDialog.getByRole('button', { name: sendName }).click()
  await searchDialog.getByRole('heading', { name: heading }).waitFor({ state: 'visible', timeout: 8000 })
  await searchDialog.getByRole('button', { name: annual, exact: true }).click()
  const calendarLink = searchDialog.getByRole('link', { name: openCal }).first()
  await calendarLink.waitFor({ state: 'visible', timeout: 8000 })
  const href = await calendarLink.getAttribute('href')
  if (!href || !/\/calendar\?date=\d{4}-\d{2}-\d{2}/.test(href)) {
    throw new Error(`calendar href=${href}`)
  }
  await Promise.all([
    page.waitForURL(new RegExp(`${href.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')}`), { timeout: 15000 }),
    calendarLink.click(),
  ])
  const landed = new URL(page.url())
  const path = `${landed.pathname}${landed.search}`
  if (path !== href && !path.endsWith(href)) throw new Error(`landed on ${page.url()} expected ${href}`)
  ok(`Search Buddy calendar ${lang} → ${href}`)
  await closeOverlays(page)
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
    await page.locator('article[data-iso]').waitFor({ state: 'visible', timeout: 8000 })
    await page.getByRole('link', { name: /Open this day in the calendar/i }).first().waitFor({
      state: 'visible',
      timeout: 10000,
    })
    if (await page.getByRole('button', { name: /Pause events/i }).count()) {
      throw new Error('autoplay pause control present under reduced motion')
    }
    const nextEvent = page.getByRole('button', { name: /Next event/i })
    if (await nextEvent.count()) {
      const before = await readEventState(page)
      await nextEvent.click()
      await waitForEventChange(page, before, 4000)
      ok('reduced-motion: event remains reachable')
    } else {
      ok('reduced-motion: single event, no autoplay')
    }
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

async function readEventState(page) {
  const card = page.locator('article[data-iso]').first()
  return {
    id: await card.getAttribute('data-event-id'),
    title: await card.getAttribute('data-event-title'),
    index: await card.getAttribute('data-event-index'),
    iso: await card.getAttribute('data-iso'),
  }
}

async function readImageFrame(page) {
  return page.locator('[data-calendar-event-image]').first().evaluate((el) => {
    const box = el.getBoundingClientRect()
    return { w: Math.round(box.width), h: Math.round(box.height) }
  })
}

async function waitForEventChange(page, previous, timeout = 12000) {
  await page.waitForFunction(
    (prev) => {
      const el = document.querySelector('article[data-iso]')
      if (!el) return false
      const id = el.getAttribute('data-event-id')
      const title = el.getAttribute('data-event-title')
      const index = el.getAttribute('data-event-index')
      return id !== prev.id && title !== prev.title && index !== prev.index
    },
    previous,
    { timeout },
  )
  return readEventState(page)
}

async function runAutoplayProof(page) {
  await page.mouse.move(0, 0)
  const pause = page.getByRole('button', { name: /Pause events/i })
  await page.getByRole('link', { name: /Open this day in the calendar/i }).first().waitFor({
    state: 'visible',
    timeout: 10000,
  })
  if (!(await pause.count())) {
    ok('home autoplay skipped (single event)')
    return
  }
  const first = await readEventState(page)
  const frameStart = await readImageFrame(page)
  const second = await waitForEventChange(page, first, 12000)
  const frameSecond = await readImageFrame(page)
  if (frameSecond.w !== frameStart.w || frameSecond.h !== frameStart.h) {
    throw new Error(`image jumped ${frameStart.w}x${frameStart.h} → ${frameSecond.w}x${frameSecond.h}`)
  }
  ok(`home autoplay 1: ${first.title} → ${second.title}`)
  const third = await waitForEventChange(page, second, 12000)
  const frameThird = await readImageFrame(page)
  if (frameThird.w !== frameStart.w || frameThird.h !== frameStart.h) {
    throw new Error(`image jumped ${frameStart.w}x${frameStart.h} → ${frameThird.w}x${frameThird.h}`)
  }
  ok(`home autoplay 2: ${second.title} → ${third.title}`)
  ok(`home image stable ${frameStart.w}x${frameStart.h}`)
  await page.waitForFunction(
    (origin) => document.querySelector('article[data-iso]')?.getAttribute('data-event-id') === origin.id,
    first,
    { timeout: 36000 },
  )
  ok(`home autoplay wraps to ${first.title}`)
  await pause.click()
  const paused = await readEventState(page)
  await page.waitForTimeout(9000)
  const still = await readEventState(page)
  if (still.id !== paused.id || still.index !== paused.index) throw new Error('pause did not hold')
  ok('home autoplay pause holds')
  await page.getByRole('button', { name: /Play events/i }).click()
  await page.mouse.move(0, 0)
  await waitForEventChange(page, still, 12000)
  ok('home autoplay resume')
  const beforeDate = await readEventState(page)
  await page.getByRole('button', { name: /Next day/i }).click()
  await page.waitForFunction(
    (prev) => document.querySelector('article[data-iso]')?.getAttribute('data-iso') !== prev,
    beforeDate.iso,
    { timeout: 8000 },
  )
  await page.getByRole('link', { name: /Open this day in the calendar/i }).first().waitFor({
    state: 'visible',
    timeout: 10000,
  })
  const afterDate = await readEventState(page)
  if (afterDate.index !== '0') throw new Error(`date change did not reset index (${afterDate.index})`)
  ok('home date navigation resets event')
}

async function assertHomeFitsViewport(page, name) {
  const dayNav = page.getByRole('navigation', { name: /Choose a calendar day/i })
  await dayNav.waitFor({ state: 'visible', timeout: 8000 })
  const openDay = page.getByRole('link', { name: /Open this day in the calendar/i }).first()
  await openDay.waitFor({ state: 'visible', timeout: 10000 })
  const fits = await page.evaluate(() => {
    const nav = document.querySelector('[aria-label="Choose a calendar day"]')
    const link = [...document.querySelectorAll('a')].find((el) =>
      /Open this day in the calendar/i.test(el.textContent || ''),
    )
    const navBox = nav?.getBoundingClientRect()
    const linkBox = link?.getBoundingClientRect()
    const height = window.innerHeight
    const navOk = !!navBox && navBox.bottom <= height + 2 && navBox.top >= -8
    const linkOk = !!linkBox && linkBox.bottom <= height + 2 && linkBox.top >= -8
    return { navOk, linkOk, navBottom: navBox?.bottom ?? -1, linkBottom: linkBox?.bottom ?? -1, height }
  })
  if (!fits.navOk || !fits.linkOk) {
    throw new Error(`${name} clipped (nav ${fits.navBottom}, link ${fits.linkBottom}, vh ${fits.height})`)
  }
  if (!(await openDay.isVisible())) throw new Error(`${name} calendar link hidden`)
  ok(`${name} first screen fits`)
}

async function runDesktopAndNight(browser) {
  for (const viewport of [
    { width: 1280, height: 800 },
    { width: 1440, height: 900 },
  ]) {
    const desktop = await browser.newContext({
      viewport,
      locale: 'en-US',
      reducedMotion: 'no-preference',
    })
    const desktopPage = await desktop.newPage()
    try {
      await goto(desktopPage, '/')
      await desktopPage.mouse.move(0, 0)
      await desktopPage.getByRole('heading', { name: /One day\. A deeper connection/i }).waitFor({
        timeout: 10000,
      })
      await assertNoOverflow(desktopPage, `home ${viewport.width} overflow`)
      await assertHomeFitsViewport(desktopPage, `home ${viewport.width}x${viewport.height}`)
      if (viewport.width === 1440) {
        const top = await desktopPage.locator('article[data-iso]').evaluate((el) => el.getBoundingClientRect().top)
        if (top < 200 || top > 300) throw new Error(`calendar top ${top}px not near 230–270`)
        ok(`home 1440 calendar top ${Math.round(top)}px`)
      }
      if (viewport.width === 1280) {
        await runAutoplayProof(desktopPage)
      }
      if (await desktopPage.getByRole('link', { name: /Read Scripture/i }).count()) {
        ok(`desktop ${viewport.width} resource cards present`)
      } else {
        fail(`desktop ${viewport.width} resource cards present`, 'missing Bible card')
      }
    } catch (error) {
      fail(`desktop home ${viewport.width}`, /** @type {Error} */ (error).message)
    } finally {
      await desktop.close()
    }
  }

  const night = await browser.newContext({
    viewport: VIEW_360,
    locale: 'en-US',
  })
  await night.addInitScript(() => {
    localStorage.setItem('tewahedo-theme', 'night')
  })
  const nightPage = await night.newPage()
  try {
    await goto(nightPage, '/')
    const theme = await nightPage.evaluate(() => document.documentElement.getAttribute('data-theme'))
    if (theme !== 'night') throw new Error(`data-theme=${theme}`)
    await assertNoOverflow(nightPage, 'home night 360 overflow')
    ok('night theme home')
  } catch (error) {
    fail('night theme home', /** @type {Error} */ (error).message)
  } finally {
    await night.close()
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
  await runDesktopAndNight(browser)
  await browser.close()

  console.log(`\n${passed.length} passed, ${failures.length} failed`)
  if (failures.length) {
    console.error(failures.join('\n'))
    process.exit(1)
  }
  console.log('Playwright journeys OK')
}

main()
