import { chromium } from 'playwright'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const outPath = path.join(__dirname, 'practice-mobile-player.png')

const url = 'http://127.0.0.1:5173/practice#chants'

const browser = await chromium.launch()
const page = await browser.newPage({
  viewport: { width: 390, height: 844 },
  deviceScaleFactor: 2,
})
await page.goto(url, { waitUntil: 'domcontentloaded' })
await page.waitForTimeout(2000)
await page.getByRole('button', { name: /^Open /i }).first().click({ timeout: 20000 })
await page.waitForTimeout(3500)
await page.screenshot({ path: outPath, fullPage: true })
await browser.close()
