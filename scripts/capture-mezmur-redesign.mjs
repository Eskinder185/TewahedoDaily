import { mkdirSync } from 'node:fs'
import { fileURLToPath } from 'node:url'
import { join } from 'node:path'
import { chromium } from 'playwright'

const base = process.env.BASE_URL ?? 'http://127.0.0.1:4173'
const out = fileURLToPath(new URL('../artifacts/mezmur-admin-redesign/', import.meta.url))
const sizes = [
  [1440, 900],
  [1024, 768],
  [768, 900],
  [390, 844],
  [320, 720],
]

mkdirSync(out, { recursive: true })
const browser = await chromium.launch()
for (const theme of ['day', 'night']) {
  for (const [width, height] of sizes) {
    const context = await browser.newContext({ viewport: { width, height }, reducedMotion: 'reduce' })
    await context.addInitScript((value) => localStorage.setItem('tewahedo-theme', value), theme)
    const page = await context.newPage()
    const errors = []
    page.on('pageerror', (error) => errors.push(error.message))
    await page.goto(base, { waitUntil: 'networkidle', timeout: 60000 })
    const overflow = await page.evaluate(() => document.documentElement.scrollWidth > window.innerWidth + 1)
    if (overflow) throw new Error(`${theme} ${width}px has horizontal overflow`)
    if (errors.length) throw new Error(`${theme} ${width}px page errors: ${errors.join('; ')}`)
    const path = join(out, `home-${theme}-${width}x${height}.png`)
    await page.screenshot({ path, fullPage: true })
    console.log(`wrote ${path}`)
    await context.close()
  }
}
await browser.close()
