import { chromium } from 'playwright'

const viewports = [
  { name: 'Mobile 360', width: 360, height: 780 },
  { name: 'Mobile 390', width: 390, height: 844 },
  { name: 'Mobile 430', width: 430, height: 932 },
  { name: 'Tablet 768', width: 768, height: 1024 },
  { name: 'Tablet 820', width: 820, height: 1180 },
  { name: 'Desktop 1440', width: 1440, height: 900 },
]

console.log('=== VERIFYING MEZMUR UI PRESENTATION ACROSS VIEWPORTS ===\n')

const browser = await chromium.launch()
let allPassed = true

try {
  for (const vp of viewports) {
    const page = await browser.newPage({
      viewport: { width: vp.width, height: vp.height },
    })

    const targetUrl = 'http://127.0.0.1:5173/practice/mezmur/altewengem-geta'
    await page.goto(targetUrl, { waitUntil: 'domcontentloaded', timeout: 15000 })
    await page.waitForTimeout(1000)

    // Check horizontal overflow
    const hasOverflow = await page.evaluate(() => {
      const docEl = document.documentElement
      return docEl.scrollWidth > docEl.clientWidth + 2
    })

    // Check Chorus headers in UI
    const chorusCount = await page.locator('text=CHORUS').count()

    // Test transliteration tab
    const translitTab = page.locator('#lyrics-tab-transliteration')
    let translitOk = false
    if (await translitTab.isVisible()) {
      await translitTab.click()
      await page.waitForTimeout(400)
      translitOk = await page.getByText(/Altewengem geta/i).first().isVisible()
    }

    // Test Both mode tab
    const bothTab = page.locator('#lyrics-tab-both')
    let bothOk = false
    if (await bothTab.isVisible()) {
      await bothTab.click()
      await page.waitForTimeout(400)
      const hasEth = await page.getByText(/አልተወኝም ጌታ/i).first().isVisible()
      const hasLat = await page.getByText(/Altewengem/i).first().isVisible()
      bothOk = hasEth && hasLat
    }

    console.log(
      `✓ [${vp.name}] (${vp.width}x${vp.height}): ` +
        `Overflow: ${hasOverflow ? 'DETECTED' : 'NONE'}, ` +
        `Chorus Headers: ${chorusCount}, ` +
        `Translit Tab: ${translitOk ? 'PASSED' : 'FAILED'}, ` +
        `Both Tab: ${bothOk ? 'PASSED' : 'FAILED'}`
    )

    if (hasOverflow || !translitOk || !bothOk) allPassed = false
    await page.close()
  }
} finally {
  await browser.close()
}

console.log(`\nOverall UI Test Status: ${allPassed ? '100% PASSED' : 'CHECK ISSUES'}`)
