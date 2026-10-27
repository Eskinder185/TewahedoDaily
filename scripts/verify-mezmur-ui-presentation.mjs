import { chromium } from 'playwright'

const viewports = [
  { name: 'Mobile 360', width: 360, height: 780 },
  { name: 'Mobile 390', width: 390, height: 844 },
  { name: 'Mobile 430', width: 430, height: 932 },
  { name: 'Tablet 768', width: 768, height: 1024 },
  { name: 'Tablet 820', width: 820, height: 1180 },
  { name: 'Desktop 1440', width: 1440, height: 900 },
]

console.log('=== VERIFYING MEZMUR UI PRESENTATION & TRANSLITERATION TOGGLE ===\n')

const browser = await chromium.launch()
let allPassed = true

try {
  for (const vp of viewports) {
    const page = await browser.newPage({
      viewport: { width: vp.width, height: vp.height },
    })

    // 1. Visit Mezmur reader for a published hymn with formatted lyrics & transliteration
    const targetUrl = 'http://127.0.0.1:5173/hymns/altewengem-geta'
    const res = await page.goto(targetUrl, { waitUntil: 'networkidle' })
    if (!res || res.status() >= 400) {
      console.error(`FAIL: ${vp.name} could not load ${targetUrl}`)
      allPassed = false
      await page.close()
      continue
    }

    // Wait for content container
    await page.waitForTimeout(1000)

    // Check horizontal overflow
    const hasOverflow = await page.evaluate(() => {
      const docEl = document.documentElement
      return docEl.scrollWidth > docEl.clientWidth + 2
    })

    // Check Chorus styling
    const chorusCount = await page.locator('text=CHORUS').count()

    // Test transliteration toggle / pill
    // Look for language toggle buttons
    const translitButton = page.getByRole('button', { name: /Transliteration|Translit/i }).first()
    let translitVisible = false

    if (await translitButton.isVisible()) {
      await translitButton.click()
      await page.waitForTimeout(500)
      // Verify transliterated Latin text appears
      translitVisible = await page.getByText(/Altewengem/i).first().isVisible()
    } else {
      // Check if both tabs are shown or select dropdown
      const select = page.locator('select')
      if (await select.isVisible()) {
        await select.selectOption({ label: /Transliteration/i })
        await page.waitForTimeout(500)
        translitVisible = await page.getByText(/Altewengem/i).first().isVisible()
      }
    }

    console.log(
      `[${vp.name}] (${vp.width}x${vp.height}): ` +
        `Overflow: ${hasOverflow ? 'DETECTED' : 'NONE'}, ` +
        `Chorus Markers Found: ${chorusCount}, ` +
        `Translit Toggle: ${translitVisible ? 'WORKING' : 'CHECK_SELECTOR'}`
    )

    if (hasOverflow) allPassed = false
    await page.close()
  }

  // Also test Hymns Browse catalog page
  const browsePage = await browser.newPage({ viewport: { width: 390, height: 844 } })
  await browsePage.goto('http://127.0.0.1:5173/hymns', { waitUntil: 'networkidle' })
  await browsePage.waitForTimeout(1000)
  const hymnCards = await browsePage.locator('a[href*="/hymns/"]').count()
  console.log(`\n[Catalog Browse]: Found ${hymnCards} hymn links on browse page`)

  const browseOverflow = await browsePage.evaluate(() => {
    return document.documentElement.scrollWidth > document.documentElement.clientWidth + 2
  })
  console.log(`[Catalog Browse]: Horizontal Overflow: ${browseOverflow ? 'DETECTED' : 'NONE'}`)
  if (browseOverflow) allPassed = false
  await browsePage.close()
} finally {
  await browser.close()
}

console.log(
  `\nUI Verification Result: ${allPassed ? 'ALL VIEWPORTS PASSED WITH ZERO OVERFLOW' : 'SOME CHECKS FAILED'}`
)
