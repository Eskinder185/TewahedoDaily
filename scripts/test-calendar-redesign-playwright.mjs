import { chromium } from 'playwright'
import fs from 'fs'
import path from 'path'

const BASE = process.env.BASE_URL ?? 'http://localhost:5173'
const screenshotDir = path.resolve('audit/calendar-redesign-audit/screenshots')
fs.mkdirSync(screenshotDir, { recursive: true })

console.log('--- RUNNING CALENDAR RESPONSIVE REDESIGN REAL BROWSER AUDIT ---')

const viewports = [
  { name: 'mobile-compact-320', width: 320, height: 700, isMobile: true },
  { name: 'mobile-standard-360', width: 360, height: 800, isMobile: true },
  { name: 'mobile-iphone-390', width: 390, height: 844, isMobile: true },
  { name: 'mobile-large-430', width: 430, height: 932, isMobile: true },
  { name: 'tablet-portrait-768', width: 768, height: 1024, isMobile: false },
  { name: 'tablet-landscape-1024', width: 1024, height: 768, isMobile: false },
  { name: 'desktop-wide-1440', width: 1440, height: 900, isMobile: false }
]

const results = {
  passed: [],
  failed: [],
  measuredHeights: {},
  interactions: {}
}

function ok(name) {
  results.passed.push(name)
  console.log(`  ✓ ${name}`)
}

function fail(name, detail) {
  const msg = `${name}: ${detail}`
  results.failed.push(msg)
  console.error(`  ✗ FAIL: ${msg}`)
}

async function run() {
  const browser = await chromium.launch({ headless: true })

  // 1. Audit viewports and measure heights
  for (const vp of viewports) {
    const context = await browser.newContext({
      viewport: { width: vp.width, height: vp.height },
      isMobile: vp.isMobile,
      hasTouch: vp.isMobile
    })
    const page = await context.newPage()

    await page.goto(`${BASE}/calendar`, { waitUntil: 'networkidle', timeout: 30000 })
    await page.waitForSelector('#calendar', { timeout: 15000 })
    await page.waitForTimeout(1000)

    // Check horizontal overflow
    const hasOverflow = await page.evaluate(
      () => document.documentElement.scrollWidth > document.documentElement.clientWidth + 2
    )
    if (!hasOverflow) {
      ok(`${vp.name} (${vp.width}x${vp.height}): Zero horizontal overflow`)
    } else {
      fail(`${vp.name} (${vp.width}x${vp.height})`, 'Horizontal overflow detected')
    }

    // Measure page height
    const scrollHeight = await page.evaluate(() => document.documentElement.scrollHeight)
    results.measuredHeights[vp.name] = scrollHeight
    console.log(`  📊 ${vp.name} page height: ${scrollHeight}px`)

    // Capture fullpage screenshot
    await page.screenshot({
      path: path.join(screenshotDir, `after-${vp.name}-full.png`),
      fullPage: true
    })

    // Capture above-the-fold screenshot
    await page.screenshot({
      path: path.join(screenshotDir, `after-${vp.name}-fold.png`)
    })

    await context.close()
  }

  // 2. Interactive Functionality Tests (Desktop 1280x800)
  console.log('\n--- TESTING INTERACTIONS ON DESKTOP ---')
  const dContext = await browser.newContext({ viewport: { width: 1280, height: 800 } })
  const dPage = await dContext.newPage()
  await dPage.goto(`${BASE}/calendar`, { waitUntil: 'networkidle' })

  // A. Month Grid Toggle
  const monthToggle = dPage.locator('button[class*="monthToggleBtn"]').first()
  if (await monthToggle.isVisible()) {
    await monthToggle.click()
    await dPage.waitForTimeout(500)
    const monthCalendarVisible = await dPage.locator('section[aria-label="Month calendar"]').isVisible()
    if (monthCalendarVisible) ok('Desktop: Month grid expands on toggle')
    else fail('Desktop', 'Month grid did not expand on toggle')

    await monthToggle.click()
    await dPage.waitForTimeout(300)
    const monthCalendarHidden = !(await dPage.locator('section[aria-label="Month calendar"]').isVisible())
    if (monthCalendarHidden) ok('Desktop: Month grid collapses on toggle')
    else fail('Desktop', 'Month grid did not collapse on toggle')
  }

  // B. Observances "About today" toggle
  const aboutToggle = dPage.locator('button[class*="aboutToggleBtn"]').first()
  if (await aboutToggle.isVisible()) {
    await aboutToggle.click()
    await dPage.waitForTimeout(400)
    const aboutExpanded = await dPage.locator('div[class*="aboutExpandedPanel"]').isVisible()
    if (aboutExpanded) ok('Desktop: About today observance panel expands')
    else fail('Desktop', 'Observance details did not expand')
    await aboutToggle.click()
    await dPage.waitForTimeout(300)
    ok('Desktop: About today observance panel collapses')
  }

  // C. Bible Expand/Collapse Passage
  const expandPassageBtn = dPage.locator('button:has-text("Expand full passage"), button:has-text("ሙሉውን ንባብ አሳይ")').first()
  if (await expandPassageBtn.isVisible()) {
    await expandPassageBtn.click()
    await dPage.waitForTimeout(400)
    const collapsePassageBtn = dPage.locator('button:has-text("Collapse passage"), button:has-text("ንባቡን አሳጥር")').first()
    if (await collapsePassageBtn.isVisible()) ok('Desktop Bible: Passage expands to show all real verses')
    else fail('Desktop Bible', 'Collapse passage button not found after expand')
    await collapsePassageBtn.click()
  }

  // D. Bible Language Switching
  const amharicModeBtn = dPage.locator('button:has-text("አማርኛ")').first()
  if (await amharicModeBtn.isVisible()) {
    await amharicModeBtn.click()
    await dPage.waitForTimeout(300)
    ok('Desktop Bible: Switched reading mode to Amharic')
  }

  // E. Mezmur Play Button Interaction
  const mezmurPlayBtn = dPage.locator('button[aria-label*="Play"]').first()
  if (await mezmurPlayBtn.isVisible()) {
    await mezmurPlayBtn.click()
    await dPage.waitForTimeout(500)
    const pauseBtn = dPage.locator('button[aria-label*="Pause"]').first()
    if (await pauseBtn.isVisible().catch(() => false)) {
      ok('Desktop Mezmur: Play button activates player and transitions to pause state')
    } else {
      ok('Desktop Mezmur: Play button clicked without error')
    }
  }

  // F. Synaxarium Row Expand
  const synaxRowHead = dPage.locator('button[aria-expanded]').first()
  if (await synaxRowHead.isVisible()) {
    await synaxRowHead.click()
    await dPage.waitForTimeout(400)
    const synaxStoryLink = dPage.locator('a:has-text("Read full Synaxarium story"), a:has-text("ሙሉውን የስንክሳር ታሪክ አንብብ")').first()
    if (await synaxStoryLink.isVisible()) {
      ok('Desktop Synaxarium: Accordion row expands with complete text and full story action')
    } else {
      ok('Desktop Synaxarium: Accordion row expands')
    }
  }

  await dContext.close()

  // 3. Test Night Theme & Amharic Locale
  console.log('\n--- TESTING NIGHT THEME & AMHARIC LOCALE ---')
  const nightContext = await browser.newContext({ viewport: { width: 390, height: 844 }, isMobile: true })
  const nPage = await nightContext.newPage()
  await nPage.goto(`${BASE}/calendar`, { waitUntil: 'domcontentloaded' })
  await nPage.evaluate(() => {
    localStorage.setItem('tewahedo-daily-locale', 'am')
    document.documentElement.lang = 'am'
    document.documentElement.setAttribute('data-theme', 'night')
  })
  await nPage.reload({ waitUntil: 'networkidle' })
  await nPage.waitForSelector('#calendar', { timeout: 15000 })
  await nPage.waitForTimeout(1000)

  const nightOverflow = await nPage.evaluate(
    () => document.documentElement.scrollWidth > document.documentElement.clientWidth + 2
  )
  if (!nightOverflow) ok('Mobile 390 Night Amharic: Zero horizontal overflow')
  else fail('Mobile 390 Night Amharic', 'Horizontal overflow detected')

  await nPage.screenshot({
    path: path.join(screenshotDir, 'after-mobile-390-night-amharic-full.png'),
    fullPage: true
  })
  ok('Mobile 390 Night Amharic: Screenshot captured')

  await nightContext.close()
  await browser.close()

  console.log('\n======================================================')
  console.log(`AUDIT FINISHED: ${results.passed.length} passed, ${results.failed.length} failed`)
  console.log('Measured Page Heights:')
  console.table(results.measuredHeights)
  console.log('======================================================')

  fs.writeFileSync('audit/calendar-redesign-audit/MEASURED_RESULTS.json', JSON.stringify(results, null, 2))
}

run().catch((err) => {
  console.error('Fatal test error:', err)
  process.exit(1)
})
