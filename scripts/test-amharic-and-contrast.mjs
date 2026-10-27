import { chromium } from 'playwright'
import fs from 'fs'

function getLuminance(r, g, b) {
  const [rs, gs, bs] = [r, g, b].map((c) => {
    c = c / 255
    return c <= 0.03928 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4)
  })
  return 0.2126 * rs + 0.7152 * gs + 0.0722 * bs
}

function parseRgba(colorStr) {
  if (!colorStr) return { r: 0, g: 0, b: 0, a: 1 }
  const match = colorStr.match(/rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*([\d.]+))?\)/)
  if (!match) return { r: 0, g: 0, b: 0, a: 1 }
  return {
    r: parseInt(match[1], 10),
    g: parseInt(match[2], 10),
    b: parseInt(match[3], 10),
    a: match[4] !== undefined ? parseFloat(match[4]) : 1
  }
}

function blendRgb(fgRgba, bgRgba) {
  const a = fgRgba.a
  const r = Math.round(fgRgba.r * a + bgRgba.r * (1 - a))
  const g = Math.round(fgRgba.g * a + bgRgba.g * (1 - a))
  const b = Math.round(fgRgba.b * a + bgRgba.b * (1 - a))
  return { r, g, b, a: 1 }
}

function getContrastRatio(c1, c2) {
  const l1 = getLuminance(c1.r, c1.g, c1.b)
  const l2 = getLuminance(c2.r, c2.g, c2.b)
  const brightest = Math.max(l1, l2)
  const darkest = Math.min(l1, l2)
  return (brightest + 0.05) / (darkest + 0.05)
}

async function run() {
  const browser = await chromium.launch({ headless: true })
  const context = await browser.newContext()
  const page = await context.newPage()

  // Set Amharic locale in localStorage before page load
  await page.addInitScript(() => {
    localStorage.setItem('tewahedo-daily-locale', 'am')
  })

  console.log('Navigating to http://localhost:5173/calendar?date=2026-10-26 in Amharic locale...')
  await page.goto('http://localhost:5173/calendar?date=2026-10-26', { waitUntil: 'networkidle' })
  await page.waitForTimeout(1500)

  // Diagnostics
  const bannerEthDate = await page.$eval('h2[id="daily-banner-title"]', el => el.textContent.trim())
  console.log('Banner Eth Date (Amharic):', bannerEthDate)
  const hasDoubleAmYear = bannerEthDate.includes('ዓ.ም. ዓ.ም.')
  console.log('Has double ዓ.ም.:', hasDoubleAmYear)

  const dayTitle = await page.$eval('p[class*="dayTitle"]', el => el.textContent.trim())
  console.log('Day Title (Amharic):', dayTitle)

  const fastingNotice = await page.$eval('div[class*="fastingNotice"]', el => el.innerText.trim())
  console.log('Fasting Notice (Amharic):\n', fastingNotice)

  const scriptureHeading = await page.$eval('h3[id="scripture-heading"]', el => el.textContent.trim())
  console.log('Scripture Heading (Amharic):', scriptureHeading)

  const mezmurHeading = await page.$eval('h3[id="mezmur-heading"]', el => el.textContent.trim())
  console.log('Mezmur Heading (Amharic):', mezmurHeading)

  // Verify Accurate Contrast with Alpha Blending
  async function testAccurateContrast(theme) {
    console.log(`\n=== Measuring Alpha-Blended WCAG Contrast in ${theme.toUpperCase()} Mode ===`)
    await page.evaluate((t) => document.documentElement.setAttribute('data-theme', t), theme)
    await page.waitForTimeout(400)

    const rawData = await page.evaluate(() => {
      function getParentBg(el) {
        let cur = el.parentElement
        while (cur && cur !== document.documentElement) {
          const s = window.getComputedStyle(cur)
          if (s.backgroundColor && s.backgroundColor !== 'rgba(0, 0, 0, 0)' && s.backgroundColor !== 'transparent') {
            return s.backgroundColor
          }
          cur = cur.parentElement
        }
        return window.getComputedStyle(document.body).backgroundColor
      }

      const elementsToCheck = [
        { name: 'Banner Eth Date', sel: 'h2[id="daily-banner-title"]' },
        { name: 'Day Title', sel: 'p[class*="dayTitle"]' },
        { name: 'Season Badge', sel: 'span[class*="badgeSeason"]' },
        { name: 'Feast Badge', sel: 'span[class*="badgeFeast"]' },
        { name: 'Optional Fast Badge', sel: 'span[class*="badgeOptionalFast"]' },
        { name: 'Scripture Heading', sel: 'h3[id="scripture-heading"]' },
        { name: 'Scripture Reference', sel: 'h4[class*="scriptureRef"]' },
        { name: 'Read Scripture Button', sel: 'a[class*="readScriptureBtn"]' },
        { name: 'Mezmur Title', sel: 'p[class*="mezmurTitle"]' },
        { name: 'Synaxarium Header', sel: 'button[class*="commemorationHead"]' }
      ]

      return elementsToCheck.map(item => {
        const el = document.querySelector(item.sel)
        if (!el) return { name: item.name, found: false }
        const style = window.getComputedStyle(el)
        return {
          name: item.name,
          found: true,
          color: style.color,
          ownBg: style.backgroundColor,
          parentBg: getParentBg(el)
        }
      })
    })

    for (const item of rawData) {
      if (!item.found) continue
      const fgRgba = parseRgba(item.color)
      const ownBgRgba = parseRgba(item.ownBg)
      const parentBgRgba = parseRgba(item.parentBg)

      // Blend ownBg over parentBg
      const effectiveBg = ownBgRgba.a > 0 ? blendRgb(ownBgRgba, parentBgRgba) : parentBgRgba
      const effectiveFg = fgRgba.a < 1 ? blendRgb(fgRgba, effectiveBg) : fgRgba

      const ratio = getContrastRatio(effectiveFg, effectiveBg)
      const isLarge = item.name.includes('Title') || item.name.includes('Date') || item.name.includes('Heading')
      const pass = isLarge ? ratio >= 3.0 : ratio >= 4.5

      console.log(`  ${item.name.padEnd(24)}: ${ratio.toFixed(2)}:1 [${pass ? 'PASS WCAG' : 'FAIL'}]`)
    }
  }

  await testAccurateContrast('day')
  await testAccurateContrast('night')

  // Save Amharic screenshots
  await page.setViewportSize({ width: 390, height: 844 })
  await page.evaluate(() => document.documentElement.setAttribute('data-theme', 'night'))
  await page.screenshot({ path: 'audit/screenshots-faith-dashboard/amharic-iphone13-night.png', fullPage: true })
  console.log('\nSaved audit/screenshots-faith-dashboard/amharic-iphone13-night.png')

  await page.evaluate(() => document.documentElement.setAttribute('data-theme', 'day'))
  await page.screenshot({ path: 'audit/screenshots-faith-dashboard/amharic-iphone13-day.png', fullPage: true })
  console.log('Saved audit/screenshots-faith-dashboard/amharic-iphone13-day.png')

  await browser.close()
  console.log('\nAmharic verification finished successfully.')
}

run().catch(err => {
  console.error(err)
  process.exit(1)
})
