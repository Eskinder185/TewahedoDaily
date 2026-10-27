import { chromium } from 'playwright'

const b = await chromium.launch({ headless: true })
const p = await b.newPage({ viewport: { width: 390, height: 844 }, isMobile: true })
await p.goto('https://tewahedodaily.pages.dev/', { waitUntil: 'networkidle' })

await p.click('button[aria-label="Open search"]')
await p.waitForTimeout(1000)

const inputs = await p.evaluate(() => {
  return Array.from(document.querySelectorAll('input, textarea')).map(i => ({
    tag: i.tagName,
    type: i.getAttribute('type'),
    placeholder: i.getAttribute('placeholder'),
    aria: i.getAttribute('aria-label')
  }))
})

console.log('Search Inputs:', inputs)
await b.close()
