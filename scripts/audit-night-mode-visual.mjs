import { chromium } from 'playwright'
import { createServer } from 'vite'
import { mkdir } from 'node:fs/promises'
import { resolve } from 'node:path'

const outputDir = resolve('audit/screenshots-night-mode/before')
await mkdir(outputDir, { recursive: true })

const server = await createServer({
  server: { host: '127.0.0.1', port: 5199, strictPort: true },
})
await server.listen()

const baseUrl = 'http://127.0.0.1:5199'
console.log(`Test server running at ${baseUrl}`)

const browser = await chromium.launch({ headless: true })

const routes = [
  { name: 'home', path: '/' },
  { name: 'calendar', path: '/calendar' },
  { name: 'bible', path: '/bible' },
  { name: 'mezmurs', path: '/practice/mezmur' },
  { name: 'prayers', path: '/prayers' },
  { name: 'synaxarium', path: '/synaxarium' },
  { name: 'library', path: '/library' },
]

try {
  for (const theme of ['day', 'night']) {
    for (const vp of [
      { name: 'desktop', width: 1440, height: 900 },
      { name: 'mobile', width: 390, height: 844 },
    ]) {
      const context = await browser.newContext({ viewport: { width: vp.width, height: vp.height } })
      const page = await context.newPage()

      // Set initial theme in localStorage before load
      await page.addInitScript((th) => {
        localStorage.setItem('tewahedo-theme', th)
      }, theme)

      for (const route of routes) {
        try {
          await page.goto(`${baseUrl}${route.path}`, { waitUntil: 'networkidle', timeout: 30000 })
          // Ensure theme is applied to html element
          await page.evaluate((th) => {
            document.documentElement.setAttribute('data-theme', th)
          }, theme)
          await page.waitForTimeout(600)

          const filename = `${theme}-${route.name}-${vp.name}.png`
          await page.screenshot({ path: `${outputDir}/${filename}`, fullPage: false })
          console.log(`✓ Captured ${filename}`)
        } catch (err) {
          console.error(`Failed ${theme} ${route.name} ${vp.name}:`, err.message)
        }
      }
      await context.close()
    }
  }
} finally {
  await browser.close()
  await server.close()
}
