import { chromium } from 'playwright'
import { join } from 'path'

const b = await chromium.launch({ headless: true })
const p = await b.newPage({ viewport: { width: 390, height: 844 }, isMobile: true })
await p.goto('https://tewahedodaily.pages.dev/', { waitUntil: 'networkidle' })

await p.click('button[aria-label="Open search"]')
await p.waitForTimeout(600)

const input = p.locator('textarea[aria-label="Search the website"]')
await input.fill('Saint Michael')
await p.waitForTimeout(2000)

const results = await p.evaluate(() => {
  return Array.from(document.querySelectorAll('[role="dialog"] a, [role="dialog"] li, [role="listbox"] *')).map(el => el.innerText.trim()).filter(Boolean).slice(0, 10)
})

console.log('Search Results for "Saint Michael":', results)
await p.screenshot({ path: join('audit/mobile-first-site-review/screenshots', 'search-results-mobile-390.png') })
await b.close()
