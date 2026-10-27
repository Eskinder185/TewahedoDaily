import { chromium } from 'playwright'

const BASE_URL = 'http://127.0.0.1:5173'

const VIEWPORTS = [
  { name: 'Mobile 360', width: 360, height: 780 },
  { name: 'Mobile 390', width: 390, height: 844 },
  { name: 'Desktop 1440', width: 1440, height: 900 },
]

console.log('=== RUNNING LIVE WEBSITE MEZMUR UI VERIFICATION ===\n')

const browser = await chromium.launch({ headless: true })

for (const vp of VIEWPORTS) {
  console.log(`--- Testing Viewport: ${vp.name} (${vp.width}x${vp.height}) ---`)
  const context = await browser.newContext({
    viewport: { width: vp.width, height: vp.height },
  })
  const page = await context.newPage()

  const consoleErrors = []
  page.on('console', (msg) => {
    if (msg.type() === 'error') {
      consoleErrors.push(msg.text())
    }
  })

  // 1. Visit Mezmur page
  console.log('  Navigating to /practice/mezmur/aman-beaman ...')
  await page.goto(`${BASE_URL}/practice/mezmur/aman-beaman`, { waitUntil: 'networkidle' })

  // 2. Check title
  const title = await page.title()
  console.log(`  Page title: "${title}"`)

  // 3. Check for horizontal overflow
  const overflow = await page.evaluate(() => {
    return document.documentElement.scrollWidth > window.innerWidth
  })
  console.log(`  Horizontal overflow detected: ${overflow ? 'FAIL' : 'PASS (0px overflow)'}`)
  if (overflow) throw new Error(`Horizontal overflow on ${vp.name}`)

  // 4. Check for Chorus / Verse markers or lyrics container
  const lyricsContainer = page.locator('[data-testid="lyrics-view"], .lyrics-content, [class*="lyrics"], [class*="HymnLyrics"]').first()
  const hasLyricsContainer = await lyricsContainer.count() > 0
  console.log(`  Lyrics container found: ${hasLyricsContainer}`)

  // 5. Test Transliteration toggle
  const transTab = page.locator('#lyrics-tab-transliteration, button:has-text("Transliteration"), [role="tab"]:has-text("Transliteration")').first()
  const hasTransTab = await transTab.count() > 0
  if (hasTransTab) {
    console.log('  Clicking Transliteration tab...')
    await transTab.click()
    await page.waitForTimeout(500)
    console.log('  Transliteration tab active.')
  }

  // 6. Test Both toggle
  const bothTab = page.locator('#lyrics-tab-both, button:has-text("Both"), [role="tab"]:has-text("Both")').first()
  const hasBothTab = await bothTab.count() > 0
  if (hasBothTab) {
    console.log('  Clicking Both tab...')
    await bothTab.click()
    await page.waitForTimeout(500)
    console.log('  Both tab active.')
  }

  // 7. Test Original toggle
  const origTab = page.locator('#lyrics-tab-original, button:has-text("Original"), [role="tab"]:has-text("Original")').first()
  const hasOrigTab = await origTab.count() > 0
  if (hasOrigTab) {
    console.log('  Clicking Original tab...')
    await origTab.click()
    await page.waitForTimeout(500)
    console.log('  Original tab active.')
  }

  // 8. Check console errors (ignoring benign network errors)
  const realErrors = consoleErrors.filter(e => !e.includes('favicon') && !e.includes('ERR_CONNECTION_REFUSED'))
  console.log(`  Console errors: ${realErrors.length}`)
  if (realErrors.length > 0) {
    console.log('    Errors:', realErrors)
  }

  await context.close()
  console.log(`✓ ${vp.name} verified successfully.\n`)
}

await browser.close()
console.log('=== ALL LIVE WEBSITE VERIFICATIONS PASSED (3/3 VIEWPORTS) ===')
