const { chromium } = require('playwright')
const fs = require('fs')

async function main() {
  const browser = await chromium.launch({ headless: true })
  const page = await browser.newPage({ viewport: { width: 390, height: 844 } })

  try {
    await page.goto('http://localhost:5173/calendar', { waitUntil: 'load' })
    await page.waitForTimeout(2000)

    fs.mkdirSync('audit/calendar-knowledge-library/screenshots', { recursive: true })

    // Take overview screenshot
    await page.screenshot({ path: 'audit/calendar-knowledge-library/screenshots/calendar-mobile-overview.png' })
    console.log('Saved calendar-mobile-overview.png')

    // Find first accordion button and click it
    const accordionBtn = await page.$('button[aria-expanded="false"]')
    if (accordionBtn) {
      await accordionBtn.click({ force: true })
      await page.waitForTimeout(1000)
      await page.screenshot({ path: 'audit/calendar-knowledge-library/screenshots/calendar-accordion-expanded.png' })
      console.log('Saved calendar-accordion-expanded.png')
    }

    // Switch to dark theme by adding dark class to html or clicking theme toggle
    await page.evaluate(() => {
      document.documentElement.classList.add('dark')
    })
    await page.waitForTimeout(500)
    await page.screenshot({ path: 'audit/calendar-knowledge-library/screenshots/calendar-night-theme.png' })
    console.log('Saved calendar-night-theme.png')

    console.log('Screenshots completed successfully!')
  } catch (err) {
    console.error('Screenshot error:', err.message)
  } finally {
    await browser.close()
  }
}

main()
