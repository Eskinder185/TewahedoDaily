const { chromium } = require('playwright')

async function check() {
  const browser = await chromium.launch()
  const page = await browser.newPage({ viewport: { width: 1280, height: 800 } })
  await page.goto('http://localhost:5173/calendar', { waitUntil: 'networkidle' })

  const rows = page.locator('button[class*="commemorationHead"]')
  const count = await rows.count()
  console.log('Synaxarium row count:', count)

  for (let i = 0; i < count; i++) {
    const title = await rows.nth(i).locator('span[class*="commemorationTitle"]').textContent()
    const type = await rows.nth(i).locator('span[class*="commemorationTypeBadge"]').textContent()
    console.log(`[${type}] ${title}`)
  }

  // Click first row
  await rows.first().click()
  await page.waitForTimeout(400)
  const storyLink = page.locator('a[class*="commemorationStoryLink"]').first()
  console.log('Story link visible:', await storyLink.isVisible(), 'href:', await storyLink.getAttribute('href'))

  await browser.close()
}

check().catch(console.error)
