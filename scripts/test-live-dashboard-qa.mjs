import { chromium } from 'playwright'
import fs from 'fs'

// Helper to calculate relative luminance according to WCAG 2.1
function getLuminance(r, g, b) {
  const [rs, gs, bs] = [r, g, b].map((c) => {
    c = c / 255
    return c <= 0.03928 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4)
  })
  return 0.2126 * rs + 0.7152 * gs + 0.0722 * bs
}

function parseRgb(colorStr) {
  if (!colorStr) return [0, 0, 0]
  const match = colorStr.match(/rgba?\((\d+),\s*(\d+),\s*(\d+)/)
  if (!match) return [0, 0, 0]
  return [parseInt(match[1], 10), parseInt(match[2], 10), parseInt(match[3], 10)]
}

function getContrastRatio(rgb1, rgb2) {
  const l1 = getLuminance(rgb1[0], rgb1[1], rgb1[2])
  const l2 = getLuminance(rgb2[0], rgb2[1], rgb2[2])
  const brightest = Math.max(l1, l2)
  const darkest = Math.min(l1, l2)
  return (brightest + 0.05) / (darkest + 0.05)
}

async function run() {
  const browser = await chromium.launch({ headless: true })
  const context = await browser.newContext()
  const page = await context.newPage()

  console.log('Navigating to http://localhost:5173/calendar?date=2026-10-26 ...')
  await page.goto('http://localhost:5173/calendar?date=2026-10-26', { waitUntil: 'networkidle' })
  await page.waitForTimeout(1500)

  // 1. Diagnostics on Default Theme (Night or Day depending on user setting)
  const results = {}

  // Check Eth Date text
  const ethDate = await page.$eval('h2[id="daily-banner-title"]', el => el.textContent.trim()).catch(() => null)
  results.ethDate = ethDate
  console.log('Banner Eth Date:', ethDate)

  // Verify no double E.C.
  const hasDoubleEc = ethDate && (ethDate.includes('E.C. E.C.') || ethDate.includes('ዓ.ም. ዓ.ም.'))
  results.hasDoubleEc = hasDoubleEc
  console.log('Has double E.C.:', hasDoubleEc)

  // Check Fasting notice
  const fastingNotice = await page.$eval('div[class*="fastingNotice"]', el => el.innerText.trim()).catch(() => null)
  results.fastingNotice = fastingNotice
  console.log('Fasting Notice:\n', fastingNotice)

  // Check Day Title
  const dayTitle = await page.$eval('p[class*="dayTitle"]', el => el.textContent.trim()).catch(() => null)
  results.dayTitle = dayTitle
  console.log('Day Title:', dayTitle)

  // Check Mezmurs
  const mezmurs = await page.$$eval('div[class*="mezmurCard"]', cards => {
    return cards.map(c => {
      const title = c.querySelector('p[class*="mezmurTitle"]')?.textContent?.trim()
      const amharic = c.querySelector('p[class*="mezmurAmharic"]')?.textContent?.trim()
      const singer = c.querySelector('p[class*="mezmurSinger"]')?.textContent?.trim()
      const match = c.querySelector('span[class*="mezmurMatch"]')?.textContent?.trim()
      const hasPlay = !!c.querySelector('button[class*="playBtn"]')
      return { title, amharic, singer, match, hasPlay }
    })
  }).catch(() => [])
  results.mezmurs = mezmurs
  console.log('Mezmurs found:', mezmurs.length)
  mezmurs.forEach((m, i) => console.log(`  [${i+1}] ${m.title} | ${m.singer || 'no singer'} | play: ${m.hasPlay} | match: ${m.match}`))

  // Check Scripture Items & Verses
  const scriptures = await page.$$eval('article[class*="scriptureItem"]', items => {
    return items.map(it => {
      const ref = it.querySelector('h4[class*="scriptureRef"]')?.textContent?.trim()
      const verses = Array.from(it.querySelectorAll('p[class*="verseLine"]')).map(v => v.textContent.trim())
      const headers = Array.from(it.querySelectorAll('h5[class*="editionHeader"]')).map(h => h.textContent.trim())
      const btn = it.querySelector('a[class*="readScriptureBtn"]')?.textContent?.trim()
      return { ref, headers, versesCount: verses.length, sampleVerse: verses[0], btn }
    })
  }).catch(() => [])
  results.scriptures = scriptures
  console.log('Scriptures found:', scriptures.length)
  scriptures.forEach((s, i) => console.log(`  [${i+1}] ${s.ref} | headers: ${s.headers.join(', ')} | verses: ${s.versesCount} | btn: ${s.btn}`))

  // 2. Test Reading Mode Buttons
  console.log('\nTesting Reading Mode Switching...')
  // Click Amharic mode
  await page.click('button:has-text("አማርኛ")')
  await page.waitForTimeout(300)
  const amHeaders = await page.$$eval('h5[class*="editionHeader"]', hs => hs.map(h => h.textContent.trim()))
  console.log('Amharic mode edition headers:', amHeaders)

  // Click English mode
  await page.click('button:has-text("English (WEB)")')
  await page.waitForTimeout(300)
  const enHeaders = await page.$$eval('h5[class*="editionHeader"]', hs => hs.map(h => h.textContent.trim()))
  console.log('English mode edition headers:', enHeaders)

  // Switch back to Parallel mode
  await page.click('button:has-text("Side-by-Side"), button:has-text("ጎን ለጎን")')
  await page.waitForTimeout(300)

  // 3. Contrast Ratios & Theme Check
  async function checkContrastForTheme(themeName) {
    console.log(`\n--- Measuring WCAG Contrast in ${themeName.toUpperCase()} Mode ---`)
    await page.evaluate((theme) => {
      document.documentElement.setAttribute('data-theme', theme)
    }, themeName)
    await page.waitForTimeout(500)

    const measurements = await page.evaluate(() => {
      function getBgColor(el) {
        let cur = el
        while (cur && cur !== document.documentElement) {
          const bg = window.getComputedStyle(cur).backgroundColor
          if (bg && bg !== 'rgba(0, 0, 0, 0)' && bg !== 'transparent') {
            return bg
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
        const color = style.color
        // For buttons or badges, el itself has a background color
        const ownBg = style.backgroundColor
        const bg = (ownBg && ownBg !== 'rgba(0, 0, 0, 0)' && ownBg !== 'transparent') ? ownBg : getBgColor(el)
        return { name: item.name, found: true, color, bg }
      })
    })

    const contrastResults = []
    for (const m of measurements) {
      if (!m.found) continue
      const fgRgb = parseRgb(m.color)
      const bgRgb = parseRgb(m.bg)
      const ratio = getContrastRatio(fgRgb, bgRgb)
      const passesAA = ratio >= 4.5 || (ratio >= 3.0 && m.name.includes('Title'))
      contrastResults.push({ name: m.name, ratio: ratio.toFixed(2), fg: m.color, bg: m.bg, passesAA })
      console.log(`  ${m.name.padEnd(24)}: ${ratio.toFixed(2)}:1 [${passesAA ? 'PASS WCAG AA' : 'FAIL'}] (fg: ${m.color}, bg: ${m.bg})`)
    }
    return contrastResults
  }

  const dayContrasts = await checkContrastForTheme('day')
  const nightContrasts = await checkContrastForTheme('night')

  // 4. Multi-viewport Screenshots
  const viewports = [
    { name: 'mobile-360x800', width: 360, height: 800 },
    { name: 'mobile-390x844-iphone13', width: 390, height: 844 },
    { name: 'mobile-430x932-promax', width: 430, height: 932 },
    { name: 'tablet-768x1024', width: 768, height: 1024 },
    { name: 'desktop-1440x900', width: 1440, height: 900 }
  ]

  console.log('\n--- Capturing Multi-Viewport Screenshots ---')
  if (!fs.existsSync('audit/screenshots-faith-dashboard')) {
    fs.mkdirSync('audit/screenshots-faith-dashboard', { recursive: true })
  }

  for (const vp of viewports) {
    await page.setViewportSize({ width: vp.width, height: vp.height })
    // Night screenshot
    await page.evaluate(() => document.documentElement.setAttribute('data-theme', 'night'))
    await page.waitForTimeout(400)
    await page.screenshot({
      path: `audit/screenshots-faith-dashboard/${vp.name}-night.png`,
      fullPage: true
    })
    console.log(`  Saved audit/screenshots-faith-dashboard/${vp.name}-night.png`)

    // Day screenshot
    await page.evaluate(() => document.documentElement.setAttribute('data-theme', 'day'))
    await page.waitForTimeout(400)
    await page.screenshot({
      path: `audit/screenshots-faith-dashboard/${vp.name}-day.png`,
      fullPage: true
    })
    console.log(`  Saved audit/screenshots-faith-dashboard/${vp.name}-day.png`)
  }

  await browser.close()

  console.log('\n=== ALL DIAGNOSTICS & SCREENSHOTS COMPLETED SUCCESSFULLY ===')
}

run().catch(err => {
  console.error('Test run failed:', err)
  process.exit(1)
})
