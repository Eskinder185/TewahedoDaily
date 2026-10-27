const { chromium } = require('playwright')
const fs = require('fs')

async function run() {
  console.log('Launching browser to verify Calendar Knowledge UI on http://localhost:5173/calendar ...')
  const browser = await chromium.launch({ headless: true })
  const context = await browser.newContext({
    viewport: { width: 390, height: 844 }, // iPhone 14 mobile viewport
    deviceScaleFactor: 2
  })
  const page = await context.newPage()

  try {
    await page.goto('http://localhost:5173/calendar', { waitUntil: 'domcontentloaded', timeout: 15000 })
    console.log('Navigated to /calendar')

    // Wait for calendar content to settle
    await page.waitForTimeout(3000)

    // Check for event details buttons or cards
    const buttons = await page.$$('button')
    console.log(`Found ${buttons.length} buttons on calendar page`)

    // Look for accordion headers or "See more" / "What is this?"
    const expandButtons = await page.$$('button[aria-expanded]')
    console.log(`Found ${expandButtons.length} expandable accordion buttons`)

    if (expandButtons.length > 0) {
      // Click the first 3 expandable sections to open them
      for (let i = 0; i < Math.min(expandButtons.length, 4); i++) {
        await expandButtons[i].click().catch(() => {})
        await page.waitForTimeout(300)
      }
    }

    // Capture screenshot in Day / Light mode
    fs.mkdirSync('audit/calendar-knowledge-library/screenshots', { recursive: true })
    await page.screenshot({ path: 'audit/calendar-knowledge-library/screenshots/calendar-knowledge-day-mobile.png', fullPage: false })
    console.log('Saved audit/calendar-knowledge-library/screenshots/calendar-knowledge-day-mobile.png')

    // Toggle theme to dark/night if toggle button exists
    const themeBtn = await page.$('button[aria-label*="theme" i], button[aria-label*="dark" i], button[title*="theme" i]')
    if (themeBtn) {
      await themeBtn.click()
      await page.waitForTimeout(1000)
      await page.screenshot({ path: 'audit/calendar-knowledge-library/screenshots/calendar-knowledge-night-mobile.png', fullPage: false })
      console.log('Saved audit/calendar-knowledge-library/screenshots/calendar-knowledge-night-mobile.png')
    }

    console.log('Visual UI verification complete!')
  } catch (err) {
    console.error('Error during UI verification:', err)
  } finally {
    await browser.close()
  }
}

run()
