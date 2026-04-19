import { chromium } from 'playwright'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const outPath = path.join(__dirname, 'practice-desktop-player.png')

const url = 'http://127.0.0.1:5173/practice#chants'

const browser = await chromium.launch()
const page = await browser.newPage({ viewport: { width: 1440, height: 900 } })
await page.goto(url, { waitUntil: 'networkidle' })
await page.waitForTimeout(2000)
const openBtn = page.getByRole('button', { name: /^Open /i }).first()
await openBtn.click({ timeout: 20000 })
await page.waitForTimeout(3500)
await page.screenshot({ path: outPath, fullPage: true })
await browser.close()
