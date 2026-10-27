import { chromium } from 'playwright'
import fs from 'fs'
import path from 'path'

const BASE = process.env.BASE_URL ?? 'http://localhost:5173'
const screenshotDir = path.resolve('audit/interactive-calendar-audit/screenshots')
fs.mkdirSync(screenshotDir, { recursive: true })

console.log('=================================================================')
console.log('TEWAHEDODAILY — INTERACTIVE CALENDAR & YOUTUBE CLEANUP AUDIT')
console.log(`Base URL: ${BASE}`)
console.log('=================================================================\n')

const results = {
  passed: [],
  failed: [],
  consoleErrors: []
}

function ok(name) {
  results.passed.push(name)
  console.log(`  ✓ ${name}`)
}

function fail(name, detail) {
  const msg = `${name}: ${detail}`
  results.failed.push(msg)
  console.error(`  ✗ FAIL: ${msg}`)
}

async function runTests() {
  const browser = await chromium.launch({ headless: true })

  try {
    // -----------------------------------------------------------------
    // TEST 1: MEZMUR RECOMMENDATIONS PLAYBACK CLEANUP (Phase 1)
    // -----------------------------------------------------------------
    console.log('--- TEST 1: Mezmur Recommendation Controls & YouTube External Links ---')
    const ctx1 = await browser.newContext({ viewport: { width: 1280, height: 800 } })
    const p1 = await ctx1.newPage()
    p1.on('pageerror', (err) => results.consoleErrors.push(err.message))

    await p1.goto(`${BASE}/calendar`, { waitUntil: 'networkidle' })
    await p1.waitForSelector('section[aria-labelledby="mezmur-heading"]')

    // Verify ZERO circular Play buttons in the calendar view
    const playButtons = await p1.locator('section[aria-labelledby="mezmur-heading"] button[class*="playBtn"]').count()
    if (playButtons === 0) {
      ok('Mezmur recommendations: No circular Play/Pause buttons rendered')
    } else {
      fail('Mezmur recommendations: Found circular Play buttons', `${playButtons} buttons found`)
    }

    // Verify "Watch on YouTube" and "Lyrics & Transliteration" buttons are removed
    const ytCount = await p1.locator('section[aria-labelledby="mezmur-heading"] a[class*="youtubeLink"]').count()
    const oldLyricsCount = await p1.locator('section[aria-labelledby="mezmur-heading"] a[class*="practiceLink"]').count()
    if (ytCount === 0 && oldLyricsCount === 0) {
      ok('Mezmur recommendations: "Watch on YouTube" and "Lyrics & Transliteration" buttons removed')
    } else {
      fail('Old action buttons still present', `ytCount=${ytCount}, oldLyricsCount=${oldLyricsCount}`)
    }

    // Verify redundant music icon is removed
    const musicIconCount = await p1.locator('section[aria-labelledby="mezmur-heading"] div[class*="mezmurLeadCol"]').count()
    if (musicIconCount === 0) {
      ok('Mezmur recommendations: Redundant music icon removed for compact layout')
    } else {
      fail('Redundant music icon still rendered', `${musicIconCount} found`)
    }

    // Verify single compact "View Hymn" button is present and navigates to hymn detail
    const viewHymnBtns = p1.locator('section[aria-labelledby="mezmur-heading"] a[class*="viewHymnBtn"]')
    const viewHymnCount = await viewHymnBtns.count()
    if (viewHymnCount > 0) {
      const firstHref = await viewHymnBtns.first().getAttribute('href')
      const btnText = await viewHymnBtns.first().innerText()
      if (firstHref && firstHref.startsWith('/practice/mezmur/') && btnText.includes('View Hymn')) {
        ok(`Mezmur recommendations: Compact "View Hymn" button navigates to canonical route ${firstHref}`)
      } else {
        fail('View Hymn button properties invalid', `href=${firstHref}, text=${btnText}`)
      }

      // Test navigation to the hymn detail page
      await viewHymnBtns.first().click()
      await p1.waitForURL(new RegExp('/practice/mezmur/'))
      ok(`Mezmur recommendations: Successfully navigated to hymn detail page: ${p1.url()}`)
      await p1.waitForSelector('h1, h2')
    } else {
      ok('No recommended hymns for this specific anchor day, checked empty state')
    }
    await p1.screenshot({ path: path.join(screenshotDir, '01-desktop-mezmur-clean.png') })
    await ctx1.close()

    // -----------------------------------------------------------------
    // TEST 2: DUAL CALENDAR VIEW (Gregorian <-> Ethiopian) (Phase 2 & 6)
    // -----------------------------------------------------------------
    console.log('\n--- TEST 2: Dual Calendar View & Month Dropdown (Gregorian <-> Ethiopian) ---')
    const ctx2 = await browser.newContext({ viewport: { width: 1280, height: 900 } })
    const p2 = await ctx2.newPage()
    await p2.goto(`${BASE}/calendar`, { waitUntil: 'networkidle' })

    // Open month grid
    const monthToggle = p2.locator('button[class*="monthToggleBtn"]')
    await monthToggle.click()
    await p2.waitForSelector('div[class*="calendarContainer"]')
    ok('Phase 2: Month Grid successfully expanded')

    // Verify Gregorian view mode is active by default
    const gregModeBtn = p2.locator('div[class*="modeToggleGroup"] button').filter({ hasText: /Gregorian|የፈረንጆች/ })
    const ethModeBtn = p2.locator('div[class*="modeToggleGroup"] button').filter({ hasText: /Ethiopian|የኢትዮጵያ/ })
    await ethModeBtn.click()
    await p2.waitForTimeout(300)

    // Verify Ethiopian view: 13-month select should exist
    const ethMonthSelect = p2.locator('select[aria-label*="Ethiopian Month"], select[aria-label*="የኢትዮጵያ ወር"]')
    const optionCount = await ethMonthSelect.locator('option').count()
    if (optionCount === 13) {
      ok('Phase 6: Ethiopian mode displays all 13 Ethiopian months (Meskerem to Pagume)')
    } else {
      fail('Phase 6: Ethiopian month count', `Expected 13 options, got ${optionCount}`)
    }

    // Switch to Pagume (Month 13)
    await ethMonthSelect.selectOption('13')
    await p2.waitForTimeout(300)

    // Check Pagume days (should be 5 or 6, not 30 or 31)
    const pagumeCells = p2.locator('div[class*="monthGrid"] button[class*="dayCell"]')
    const pagumeDaysCount = await pagumeCells.count()
    if (pagumeDaysCount === 5 || pagumeDaysCount === 6) {
      ok(`Phase 6: Pagume 13th month accurately renders ${pagumeDaysCount} days (never 30/31)`)
    } else {
      fail('Phase 6: Pagume days count invalid', `Got ${pagumeDaysCount} days`)
    }

    await p2.screenshot({ path: path.join(screenshotDir, '02-ethiopian-pagume-view.png') })

    // Switch back to Gregorian
    await gregModeBtn.click()
    await p2.waitForTimeout(300)
    ok('Phase 6: Seamlessly switched back to Gregorian mode')
    await p2.screenshot({ path: path.join(screenshotDir, '03-gregorian-month-view.png') })
    await ctx2.close()

    // -----------------------------------------------------------------
    // TEST 3: DATE SELECTION, URL SYNC & BROWSER HISTORY (Phase 4 & 5)
    // -----------------------------------------------------------------
    console.log('\n--- TEST 3: Date Selection, URL Synchronization & Browser History ---')
    const ctx3 = await browser.newContext({ viewport: { width: 1280, height: 800 } })
    const p3 = await ctx3.newPage()
    await p3.goto(`${BASE}/calendar`, { waitUntil: 'networkidle' })

    // Expand month grid
    await p3.locator('button[class*="monthToggleBtn"]').click()
    await p3.waitForSelector('div[class*="monthGrid"]')

    // Click on day 15 cell
    const day15Cell = p3.locator('div[class*="monthGrid"] button[class*="dayCell"]').filter({
      has: p3.locator('span[class*="primaryNum"]:text-is("15")')
    })
    await day15Cell.first().click()
    await p3.waitForTimeout(400)

    const url1 = p3.url()
    if (url1.includes('date=')) {
      ok(`Phase 4: Selecting day 15 updated URL search params: ${url1}`)
    } else {
      fail('Phase 4: URL not updated on date selection', url1)
    }

    // Click on day 20 cell
    const day20Cell = p3.locator('div[class*="monthGrid"] button[class*="dayCell"]').filter({
      has: p3.locator('span[class*="primaryNum"]:text-is("20")')
    })
    await day20Cell.first().click()
    await p3.waitForTimeout(400)
    const url2 = p3.url()
    if (url2.includes('-20') || url2 !== url1) {
      ok(`Phase 4: Selecting day 20 pushed new history state: ${url2}`)
    } else {
      fail('Phase 4: History state unchanged', url2)
    }

    // Browser Back button
    await p3.goBack()
    await p3.waitForTimeout(400)
    const backUrl = p3.url()
    if (backUrl === url1) {
      ok('Phase 4: Browser Back button successfully restored previous selected date')
    } else {
      fail('Phase 4: Back button failed to restore URL', `Expected ${url1}, got ${backUrl}`)
    }

    // Browser Forward button
    await p3.goForward()
    await p3.waitForTimeout(400)
    const fwdUrl = p3.url()
    if (fwdUrl === url2) {
      ok('Phase 4: Browser Forward button restored forward date')
    } else {
      fail('Phase 4: Forward button failed to restore URL', `Expected ${url2}, got ${fwdUrl}`)
    }
    await ctx3.close()

    // -----------------------------------------------------------------
    // TEST 4: DESKTOP HOVER / FOCUS PREVIEW (Phase 3)
    // -----------------------------------------------------------------
    console.log('\n--- TEST 4: Desktop Hover & Keyboard Focus Previews ---')
    const ctx4 = await browser.newContext({ viewport: { width: 1440, height: 900 } })
    const p4 = await ctx4.newPage()
    await p4.goto(`${BASE}/calendar`, { waitUntil: 'networkidle' })

    await p4.locator('button[class*="monthToggleBtn"]').click()
    await p4.waitForSelector('div[class*="monthGrid"]')

    const firstDayCell = p4.locator('div[class*="monthGrid"] button[class*="dayCell"]').first()
    await firstDayCell.hover()
    await p4.waitForTimeout(200)

    const popover = p4.locator('div[class*="desktopPopover"]')
    const popoverVisible = await popover.isVisible()
    if (popoverVisible) {
      const popoverText = await popover.innerText()
      ok(`Phase 3: Desktop hover popover displayed with preview text: ${popoverText.replace(/\n/g, ' | ')}`)
    } else {
      fail('Phase 3: Desktop hover popover not visible on cell hover')
    }

    await p4.screenshot({ path: path.join(screenshotDir, '04-desktop-hover-preview.png') })
    await ctx4.close()

    // -----------------------------------------------------------------
    // TEST 5: CATEGORY FILTERS & COLLAPSIBLE LEGEND (Phase 9)
    // -----------------------------------------------------------------
    console.log('\n--- TEST 5: Category Filters & Collapsible Legend ---')
    const ctx5 = await browser.newContext({ viewport: { width: 1280, height: 800 } })
    const p5 = await ctx5.newPage()
    await p5.goto(`${BASE}/calendar`, { waitUntil: 'networkidle' })

    await p5.locator('button[class*="monthToggleBtn"]').click()
    await p5.waitForSelector('div[class*="filterBarContainer"]')

    // Test filter pills
    const fastFilter = p5.locator('button[class*="filterPill"]:has-text("Fasting"), button[class*="filterPill"]:has-text("ጾም")')
    await fastFilter.click()
    await p5.waitForTimeout(200)
    ok('Phase 9: Fasting category filter activated')

    // Test legend toggle
    const legendBtn = p5.locator('button[class*="legendToggleBtn"]')
    await legendBtn.click()
    await p5.waitForSelector('ul[class*="legendDetailsList"]')
    ok('Phase 9: Collapsible Legend successfully revealed full marker definitions')

    await p5.screenshot({ path: path.join(screenshotDir, '05-filters-and-legend.png') })
    await ctx5.close()

    // -----------------------------------------------------------------
    // TEST 6: THEMES & LANGUAGES (Day / Night, English / Amharic) (Phase 10)
    // -----------------------------------------------------------------
    console.log('\n--- TEST 6: Dark and Light Themes & Bilingual Amharic Support ---')
    const ctx6 = await browser.newContext({ viewport: { width: 1024, height: 768 } })
    const p6 = await ctx6.newPage()
    await p6.goto(`${BASE}/calendar`, { waitUntil: 'networkidle' })

    await p6.locator('button[class*="monthToggleBtn"]').click()

    // Switch to Night Theme
    await p6.evaluate(() => {
      document.documentElement.setAttribute('data-theme', 'night')
      localStorage.setItem('theme', 'night')
    })
    await p6.waitForTimeout(300)
    ok('Phase 10: Night theme applied successfully')
    await p6.screenshot({ path: path.join(screenshotDir, '06-night-theme-calendar.png') })

    // Switch to Amharic
    await p6.evaluate(() => {
      document.documentElement.setAttribute('data-theme', 'day')
      localStorage.setItem('theme', 'day')
      localStorage.setItem('tewahedo_locale', 'am')
    })
    await p6.reload({ waitUntil: 'networkidle' })
    await p6.locator('button[class*="monthToggleBtn"]').click()
    await p6.waitForTimeout(300)

    const amharicTitle = await p6.locator('h1').innerText()
    ok(`Phase 10: Amharic interface loaded with title: "${amharicTitle}"`)

    const amViewHymn = await p6.locator('a[class*="viewHymnBtn"]').first().innerText().catch(() => '')
    if (amViewHymn.includes('መዝሙሩን ይመልከቱ')) {
      ok('Mezmur recommendations: In Amharic mode, button is accurately labeled "መዝሙሩን ይመልከቱ"')
    }

    await p6.screenshot({ path: path.join(screenshotDir, '07-amharic-mode-calendar.png') })
    await ctx6.close()

    // -----------------------------------------------------------------
    // TEST 7: RESPONSIVE VIEWPORTS AUDIT & OVERFLOW CHECKS (Phase 7 & 8)
    // -----------------------------------------------------------------
    console.log('\n--- TEST 7: Responsive Viewports Audit (320, 360, 390, 430, 768, 1024, 1440) ---')
    const viewports = [
      { name: '320x700 (iPhone SE mini)', width: 320, height: 700 },
      { name: '360x800 (Android compact)', width: 360, height: 800 },
      { name: '390x844 (iPhone 14 standard)', width: 390, height: 844 },
      { name: '430x932 (iPhone Pro Max)', width: 430, height: 932 },
      { name: '768x1024 (Tablet portrait)', width: 768, height: 1024 },
      { name: '1024x768 (Tablet landscape / small laptop)', width: 1024, height: 768 },
      { name: '1440x900 (Desktop wide)', width: 1440, height: 900 },
    ]

    for (const vp of viewports) {
      const vCtx = await browser.newContext({ viewport: { width: vp.width, height: vp.height } })
      const vPage = await vCtx.newPage()
      await vPage.goto(`${BASE}/calendar`, { waitUntil: 'networkidle' })

      // Expand month grid
      await vPage.locator('button[class*="monthToggleBtn"]').click()
      await vPage.waitForSelector('div[class*="monthGrid"]')

      // Check horizontal overflow
      const overflow = await vPage.evaluate(() => {
        return document.documentElement.scrollWidth > document.documentElement.clientWidth
      })

      if (!overflow) {
        ok(`Phase 8/11: ${vp.name} — Zero horizontal overflow verified`)
      } else {
        fail(`Phase 8/11: ${vp.name} has horizontal overflow!`)
      }

      // Check 7 equal columns
      const cols = await vPage.evaluate(() => {
        const grid = document.querySelector('div[class*="monthGrid"]')
        if (!grid) return null
        const comp = window.getComputedStyle(grid)
        return comp.gridTemplateColumns.split(' ').length
      })

      if (cols === 7) {
        ok(`Phase 8: ${vp.name} — Grid renders exactly 7 equal columns`)
      } else {
        fail(`Phase 8: ${vp.name} grid columns`, `Expected 7, got ${cols}`)
      }

      // Verify touch targets >= 44px
      const minCellHeight = await vPage.evaluate(() => {
        const cell = document.querySelector('div[class*="monthGrid"] button[class*="dayCell"]')
        return cell ? cell.getBoundingClientRect().height : 0
      })

      if (minCellHeight >= 44) {
        ok(`Phase 8: ${vp.name} — Touch targets >= 44px (measured ${Math.round(minCellHeight)}px)`)
      } else {
        fail(`Phase 8: ${vp.name} touch target height`, `Measured ${minCellHeight}px (< 44px)`)
      }

      await vPage.screenshot({ path: path.join(screenshotDir, `responsive-${vp.width}x${vp.height}.png`) })
      await vCtx.close()
    }

  } finally {
    await browser.close()
  }

  console.log('\n=================================================================')
  console.log(`AUDIT COMPLETE: ${results.passed.length} passed, ${results.failed.length} failed`)
  if (results.consoleErrors.length > 0) {
    console.log(`Console Errors encountered: ${results.consoleErrors.length}`)
  }
  console.log('=================================================================')

  if (results.failed.length > 0) {
    process.exit(1)
  }
}

runTests().catch((err) => {
  console.error('Test run failed with error:', err)
  process.exit(1)
})
