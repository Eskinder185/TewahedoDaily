import { chromium } from 'playwright'

const base = (process.argv[2] || 'http://127.0.0.1:5173').replace(/\/$/, '')
const browser = await chromium.launch({ headless: true })
const page = await browser.newPage()
page.setDefaultTimeout(15_000)
const errors = []
page.on('console', (message) => {
  if (message.type() === 'error') errors.push(message.text())
})
page.on('pageerror', (error) => errors.push(error.message))

await page.goto(`${base}/practice`, { waitUntil: 'domcontentloaded' })
await page.waitForTimeout(2_000)
const practice = {
  title: await page.title(),
  collection_links: await page.locator('a[href^="/practice/browse/"]').count(),
  body_excerpt: (await page.locator('body').innerText()).slice(0, 240),
}

await page.goto(`${base}/practice/mezmur/bezemenat-yeshemegele`, { waitUntil: 'domcontentloaded' })
await page.waitForTimeout(2_000)
const published = {
  url: page.url(),
  heading: await page.locator('h1').first().innerText(),
}

await page.goto(`${base}/practice/mezmur/kene-nesh`, { waitUntil: 'domcontentloaded' })
await page.waitForTimeout(2_000)
const draft = {
  url: page.url(),
  body_excerpt: (await page.locator('body').innerText()).slice(0, 240),
}

await browser.close()
console.log(JSON.stringify({ practice, published, draft, errors }, null, 2))
