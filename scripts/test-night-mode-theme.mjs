import { chromium } from 'playwright'
import { createServer } from 'vite'
import { mkdir } from 'node:fs/promises'
import { resolve } from 'node:path'

const outputDir = resolve('audit/screenshots-night-mode/after')
await mkdir(outputDir, { recursive: true })
const server = await createServer({ server: { host: '127.0.0.1', port: 5201, strictPort: true } })
await server.listen()
const browser = await chromium.launch({ headless: true })
const routes = [
  { name: 'home', path: '/' },
  { name: 'calendar', path: '/calendar' },
  { name: 'bible', path: '/bible' },
  { name: 'library', path: '/library' },
  { name: 'prayers', path: '/prayers' },
]
const viewports = [
  { name: 'mobile', width: 390, height: 844 },
  { name: 'tablet', width: 768, height: 900 },
  { name: 'desktop', width: 1440, height: 900 },
]

function luminance([r, g, b]) {
  const linear = [r, g, b].map((value) => {
    const channel = value / 255
    return channel <= 0.03928 ? channel / 12.92 : ((channel + 0.055) / 1.055) ** 2.4
  })
  return 0.2126 * linear[0] + 0.7152 * linear[1] + 0.0722 * linear[2]
}

function contrast(foreground, background) {
  const a = luminance(foreground)
  const b = luminance(background)
  return (Math.max(a, b) + 0.05) / (Math.min(a, b) + 0.05)
}

try {
  for (const theme of ['day', 'night']) {
    for (const viewport of viewports) {
      const context = await browser.newContext({ viewport: { width: viewport.width, height: viewport.height } })
      const page = await context.newPage()
      await page.addInitScript((value) => localStorage.setItem('tewahedo-theme', value), theme)
      for (const route of routes) {
        await page.goto(`http://127.0.0.1:5201${route.path}`, { waitUntil: 'networkidle', timeout: 30000 })
        await page.evaluate((value) => document.documentElement.dataset.theme = value, theme)
        await page.waitForTimeout(250)
        const result = await page.evaluate(() => {
          const parse = (value) => {
            const match = value.match(/rgba?\((\d+),\s*(\d+),\s*(\d+)/)
            return match ? match.slice(1).map(Number) : null
          }
          const elements = [...document.querySelectorAll('body *')].filter((element) => {
            const style = getComputedStyle(element)
            return element.textContent?.trim() && style.visibility !== 'hidden' && style.display !== 'none'
          })
          const issues = []
          const ratios = []
          const luminance = (rgb) => rgb.map((value) => value / 255).map((value) => value <= 0.03928 ? value / 12.92 : ((value + 0.055) / 1.055) ** 2.4).reduce((sum, value, index) => sum + value * [0.2126, 0.7152, 0.0722][index], 0)
          for (const element of elements.slice(0, 500)) {
            const style = getComputedStyle(element)
            const foreground = parse(style.color)
            let node = element
            let background = null
            while (node && !background) {
              const candidate = parse(getComputedStyle(node).backgroundColor)
              if (candidate && getComputedStyle(node).backgroundColor !== 'rgba(0, 0, 0, 0)') background = candidate
              node = node.parentElement
            }
            if (!foreground || !background) continue
            const foregroundLuma = luminance(foreground)
            const backgroundLuma = luminance(background)
            const ratio = (Math.max(foregroundLuma, backgroundLuma) + 0.05) / (Math.min(foregroundLuma, backgroundLuma) + 0.05)
            ratios.push(ratio)
            if (foreground.join(',') === background.join(',')) issues.push({ text: element.textContent.trim().slice(0, 60), ratio: Number(ratio.toFixed(2)) })
          }
          return { theme: document.documentElement.dataset.theme, issues, minRatio: ratios.length ? Math.min(...ratios) : null }
        })
        if (result.theme !== theme) throw new Error(`Theme attribute did not apply for ${route.path}`)
        if (result.issues.length) throw new Error(`Same-color text found on ${route.path}: ${result.issues[0].text}`)
        console.log(`✓ ${theme} ${viewport.name} ${route.name} (min ${result.minRatio ?? 'n/a'}:1)`)
        await page.screenshot({ path: `${outputDir}/${theme}-${route.name}-${viewport.name}.png`, fullPage: false })
      }
      await context.close()
    }
  }
  console.log('Night-mode theme checks passed for day/night at 390, 768, and 1440px.')
} finally {
  await browser.close()
  await server.close()
}
