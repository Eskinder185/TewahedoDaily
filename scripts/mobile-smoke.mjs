/**
 * Quick layout smoke: no horizontal overflow at common phone widths.
 * Run `npm run preview` first, then: `node scripts/mobile-smoke.mjs`
 * Optional: BASE_URL=http://127.0.0.1:4173
 */
import { chromium } from 'playwright'

const BASE = process.env.BASE_URL ?? 'http://127.0.0.1:4173'
const paths = [
  '/',
  '/practice',
  '/practice#chants',
  '/practice#movement',
  '/prayers',
  '/prayers/zeweter',
  '/prayers/wudase-mariam',
  '/prayers/mezmure-dawit',
  '/calendar',
  '/about',
]
const widths = [375, 390, 412, 430]

async function main() {
  const browser = await chromium.launch()
  const errors = []
  for (const w of widths) {
    const context = await browser.newContext({ viewport: { width: w, height: 900 } })
    const page = await context.newPage()
    for (const path of paths) {
      try {
        await page.goto(`${BASE}${path}`, { waitUntil: 'domcontentloaded', timeout: 120000 })
        await new Promise((r) => setTimeout(r, 800))
        const overflow = await page.evaluate(() => {
          const de = document.documentElement
          return de.scrollWidth > de.clientWidth + 2
        })
        if (overflow) errors.push(`${w}px ${path}: document scrollWidth > clientWidth`)
      } catch (e) {
        errors.push(`${w}px ${path}: ${/** @type {Error} */ (e).message}`)
      }
    }
    await context.close()
  }
  await browser.close()
  if (errors.length) {
    console.error(errors.join('\n'))
    process.exit(1)
  }
  console.log('Mobile smoke OK:', widths.join(', '), 'px; routes:', paths.length)
}

main()
