/**
 * Visual captures of the Home redesign at the viewports in the design brief.
 */
import { mkdirSync } from 'node:fs'
import { fileURLToPath } from 'node:url'
import { join } from 'node:path'
import { chromium } from 'playwright'

const BASE = process.env.BASE_URL ?? 'http://127.0.0.1:5173'
const OUT_DIR = fileURLToPath(new URL('../artifacts/home-redesign/', import.meta.url))

const VIEWPORTS = [
  { name: '1672x941', width: 1672, height: 941 },
  { name: '1440x900', width: 1440, height: 900 },
  { name: '1280x800', width: 1280, height: 800 },
  { name: '390x844', width: 390, height: 844 },
  { name: '360x800', width: 360, height: 800 },
]

async function main() {
  mkdirSync(OUT_DIR, { recursive: true })
  const browser = await chromium.launch()
  for (const view of VIEWPORTS) {
    const context = await browser.newContext({
      viewport: { width: view.width, height: view.height },
      locale: 'en-US',
      reducedMotion: 'no-preference',
    })
    const page = await context.newPage()
    await page.goto(BASE, { waitUntil: 'networkidle', timeout: 60000 })
    await page.mouse.move(0, 0)
    await page.getByRole('heading', { name: /One day\. A deeper connection/i }).waitFor({
      timeout: 15000,
    })
    await page.waitForTimeout(800)
    const metrics = await page.evaluate(() => {
      const cal = document.querySelector('article[data-iso]')
      const frame = document.querySelector('[data-calendar-event-image]')
      if (!cal || !frame) return null
      const cr = cal.getBoundingClientRect()
      const fr = frame.getBoundingClientRect()
      return {
        calendar: `${Math.round(cr.width)}x${Math.round(cr.height)} top=${Math.round(cr.top)}`,
        image: `${Math.round(fr.width)}x${Math.round(fr.height)}`,
        share: `${Math.round((fr.width / cr.width) * 100)}%`,
      }
    })
    const file = join(OUT_DIR, `home-${view.name}.png`)
    await page.screenshot({ path: file, fullPage: false })
    console.log(`wrote ${file}`, metrics || '')
    await context.close()
  }

  for (const view of [
    { name: '1672x941-am', width: 1672, height: 941 },
    { name: '390x844-am', width: 390, height: 844 },
    { name: '360x800-am', width: 360, height: 800 },
  ]) {
    const am = await browser.newContext({
      viewport: { width: view.width, height: view.height },
      locale: 'en-US',
      reducedMotion: 'no-preference',
    })
    await am.addInitScript(() => {
      localStorage.setItem('tewahedo-daily-locale', 'am')
    })
    const amPage = await am.newPage()
    await amPage.goto(BASE, { waitUntil: 'networkidle', timeout: 60000 })
    await amPage.mouse.move(0, 0)
    await amPage.waitForTimeout(800)
    await amPage.screenshot({ path: join(OUT_DIR, `home-${view.name}.png`), fullPage: false })
    console.log(`wrote ${join(OUT_DIR, `home-${view.name}.png`)}`)
    await am.close()
  }

  const night = await browser.newContext({
    viewport: { width: 1672, height: 941 },
    locale: 'en-US',
  })
  await night.addInitScript(() => {
    localStorage.setItem('tewahedo-theme', 'night')
  })
  const nightPage = await night.newPage()
  await nightPage.goto(BASE, { waitUntil: 'networkidle', timeout: 60000 })
  await nightPage.waitForTimeout(800)
  await nightPage.screenshot({ path: join(OUT_DIR, 'home-1672x941-night.png'), fullPage: false })
  await night.close()

  await browser.close()
  console.log('home layout captures done')
}

main().catch((error) => {
  console.error(error)
  process.exit(1)
})
