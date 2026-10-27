import { chromium } from 'playwright'

const b = await chromium.launch({ headless: true })
const p = await b.newPage({ viewport: { width: 390, height: 844 }, isMobile: true })
await p.goto('https://tewahedodaily.pages.dev/', { waitUntil: 'networkidle' })

const searchBtn = p.locator('button[aria-label="Open search"]')
console.log('Search button visible:', await searchBtn.isVisible())
await searchBtn.click()
await p.waitForTimeout(600)

const searchDialog = await p.evaluate(() => {
  const dialog = document.querySelector('[role="dialog"], [aria-label*="Search" i], .searchModal, input[type="search"], textarea')
  return {
    found: Boolean(dialog),
    tag: dialog?.tagName,
    placeholder: dialog?.getAttribute('placeholder')
  }
})

console.log('Search dialog opened:', searchDialog)
await b.close()
