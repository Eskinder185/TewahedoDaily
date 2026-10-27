import { chromium } from 'playwright'

const b = await chromium.launch({ headless: true })
const p = await b.newPage({ viewport: { width: 390, height: 844 }, isMobile: true })
await p.goto('https://tewahedodaily.pages.dev/', { waitUntil: 'networkidle' })

await p.click('button[aria-label="Open search"]')
await p.waitForTimeout(600)

const input = p.locator('textarea[aria-label="Search the website"]')
await input.fill('Saint Michael')
await p.waitForTimeout(2000)

const modalText = await p.evaluate(() => {
  const modal = document.querySelector('[role="dialog"]')
  return modal ? modal.innerText : 'NO_DIALOG'
})

console.log('MODAL TEXT AFTER TYPING:\n', modalText)
await b.close()
