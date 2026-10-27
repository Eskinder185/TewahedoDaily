import { chromium } from 'playwright'

const b = await chromium.launch({ headless: true })
const p = await b.newPage({ viewport: { width: 390, height: 844 }, isMobile: true })
await p.goto('https://tewahedodaily.pages.dev/', { waitUntil: 'networkidle' })

const menuBtn = p.locator('button[aria-label="Open menu"]')
console.log('Menu button visible:', await menuBtn.isVisible())
await menuBtn.click()
await p.waitForTimeout(600)

const navVisible = await p.evaluate(() => {
  const links = Array.from(document.querySelectorAll('a')).map(a => ({ text: a.innerText.trim(), href: a.getAttribute('href') }))
  return links.filter(l => l.href && ['/bible', '/pray', '/practice', '/calendar'].includes(l.href))
})

console.log('Mobile menu navigation links after clicking menu:', navVisible)
await b.close()
