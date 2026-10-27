import { chromium } from 'playwright'

async function run() {
  const browser = await chromium.launch()
  const page = await browser.newPage({ viewport: { width: 390, height: 844 } })
  
  console.log('Navigating to http://localhost:5173/calendar?date=2026-10-26 ...')
  await page.goto('http://localhost:5173/calendar?date=2026-10-26', { waitUntil: 'networkidle' })
  
  // Wait 2 seconds for any async context to resolve
  await page.waitForTimeout(2000)
  
  await page.screenshot({ path: 'audit/screenshot-oct26-current.png', fullPage: true })
  console.log('Saved audit/screenshot-oct26-current.png')
  
  // Inspect the dashboard text and computed styles
  const data = await page.evaluate(() => {
    const banner = document.querySelector('[class*="banner"]')
    const bannerTitle = banner?.querySelector('h2')?.textContent
    const greg = banner?.querySelector('span')?.textContent
    const dayTitle = banner?.querySelector('p')?.textContent
    const badges = Array.from(document.querySelectorAll('[class*="badge"]')).map(b => b.textContent)
    const fasting = document.querySelector('[class*="fastingNotice"]')?.textContent
    const scripture = document.querySelector('[class*="scriptureRef"]')?.textContent
    const mezmur = document.querySelector('[class*="mezmurTitle"]')?.textContent
    const emptyMez = document.querySelector('[aria-labelledby="mezmur-heading"] [class*="emptyNotice"]')?.textContent
    
    // Sample some computed colors
    const bannerHeadingEl = banner?.querySelector('h2')
    const bannerHeadingColor = bannerHeadingEl ? window.getComputedStyle(bannerHeadingEl).color : null
    const bannerBg = banner ? window.getComputedStyle(banner).backgroundColor : null
    
    const dayTitleEl = banner?.querySelector('[class*="dayTitle"]')
    const dayTitleColor = dayTitleEl ? window.getComputedStyle(dayTitleEl).color : null

    const scriptureEl = document.querySelector('[class*="scriptureRef"]')
    const scriptureColor = scriptureEl ? window.getComputedStyle(scriptureEl).color : null
    const scriptureBg = scriptureEl ? window.getComputedStyle(scriptureEl.closest('[class*="scriptureItem"]') || scriptureEl).backgroundColor : null

    return {
      bannerTitle,
      greg,
      dayTitle,
      badges,
      fasting,
      scripture,
      mezmur,
      emptyMez,
      colors: {
        bannerHeadingColor,
        bannerBg,
        dayTitleColor,
        scriptureColor,
        scriptureBg
      }
    }
  })
  
  console.log('Rendered data:', JSON.stringify(data, null, 2))
  await browser.close()
}

run().catch(console.error)
