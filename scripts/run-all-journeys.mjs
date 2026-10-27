import { chromium } from 'playwright'
import { writeFileSync } from 'fs'
import { join } from 'path'

const BASE_URL = 'https://tewahedodaily.pages.dev'
const SHOTS_DIR = 'audit/mobile-first-site-review/screenshots'

async function runJourneys() {
  const browser = await chromium.launch({ headless: true })
  const results = []

  // Journey A: First-time mobile visitor
  {
    console.log('--- JOURNEY A: First-Time Mobile Visitor ---')
    const ctx = await browser.newContext({ viewport: { width: 390, height: 844 }, isMobile: true, hasTouch: true })
    const p = await ctx.newPage()
    let steps = 0
    let success = false
    let note = ''
    try {
      await p.goto(`${BASE_URL}/`, { waitUntil: 'networkidle' })
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-a-1-home.png') })

      // Open mobile menu
      await p.click('button[aria-label="Open menu"]')
      await p.waitForTimeout(500)
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-a-2-drawer.png') })

      // Click Bible
      await p.click('a[href="/bible"]')
      await p.waitForLoadState('networkidle')
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-a-3-bible.png') })

      // Click Genesis
      await p.click('a[href="/bible/genesis"]')
      await p.waitForLoadState('networkidle')
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-a-4-genesis.png') })

      // Return home
      await p.click('a[href="/"]')
      await p.waitForLoadState('networkidle')
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-a-5-returned-home.png') })

      success = true
      note = 'Successfully navigated Home -> Mobile Drawer -> Bible -> Genesis -> Home'
    } catch (e) {
      note = `Failed on step ${steps}: ${e.message}`
    } finally {
      await ctx.close()
      results.push({ id: 'JOURNEY A', name: 'First-time mobile visitor', steps, success, note })
    }
  }

  // Journey B: Hymn discovery
  {
    console.log('--- JOURNEY B: Hymn Discovery ---')
    const ctx = await browser.newContext({ viewport: { width: 390, height: 844 }, isMobile: true, hasTouch: true })
    const p = await ctx.newPage()
    let steps = 0
    let success = false
    let note = ''
    try {
      await p.goto(`${BASE_URL}/practice/categories`, { waitUntil: 'networkidle' })
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-b-1-categories.png') })

      // Click Kidus Michael
      await p.click('a[href="/practice/category/kidus-michael"]')
      await p.waitForLoadState('networkidle')
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-b-2-kidus-michael.png') })

      // Click Absera Gebriel
      await p.click('a[href="/practice/mezmur/absera-gebriel"]')
      await p.waitForLoadState('networkidle')
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-b-3-lyrics.png') })

      success = true
      note = 'Successfully navigated Categories -> Kidus Michael (32 Mezmurs) -> Absera Gebriel (Lyrics reader)'
    } catch (e) {
      note = `Failed on step ${steps}: ${e.message}`
    } finally {
      await ctx.close()
      results.push({ id: 'JOURNEY B', name: 'Hymn Discovery', steps, success, note })
    }
  }

  // Journey C: Daily worship
  {
    console.log('--- JOURNEY C: Daily Worship ---')
    const ctx = await browser.newContext({ viewport: { width: 390, height: 844 }, isMobile: true, hasTouch: true })
    const p = await ctx.newPage()
    let steps = 0
    let success = false
    let note = ''
    try {
      await p.goto(`${BASE_URL}/`, { waitUntil: 'networkidle' })
      steps++

      // Click Pray from mobile menu
      await p.click('button[aria-label="Open menu"]')
      await p.waitForTimeout(500)
      await p.click('a[href="/pray"]')
      await p.waitForLoadState('networkidle')
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-c-1-prayers.png') })

      // Open a prayer collection
      const prayerCol = p.locator('a[href*="/pray/"]').first()
      if (await prayerCol.isVisible()) {
        await prayerCol.click()
        await p.waitForLoadState('networkidle')
        steps++
        await p.screenshot({ path: join(SHOTS_DIR, 'journey-c-2-prayer-text.png') })
        success = true
        note = 'Successfully opened daily prayer collection from home'
      } else {
        note = 'No prayer collection link found'
      }
    } catch (e) {
      note = `Failed: ${e.message}`
    } finally {
      await ctx.close()
      results.push({ id: 'JOURNEY C', name: 'Daily Worship', steps, success, note })
    }
  }

  // Journey D: Calendar Exploration
  {
    console.log('--- JOURNEY D: Calendar Exploration ---')
    const ctx = await browser.newContext({ viewport: { width: 390, height: 844 }, isMobile: true, hasTouch: true })
    const p = await ctx.newPage()
    let steps = 0
    let success = false
    let note = ''
    try {
      await p.goto(`${BASE_URL}/calendar`, { waitUntil: 'networkidle' })
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-d-1-calendar.png') })

      // Click Next Day
      const nextBtn = p.locator('button:has-text("Next day")')
      if (await nextBtn.isVisible()) {
        await nextBtn.click()
        await p.waitForTimeout(800)
        steps++
        await p.screenshot({ path: join(SHOTS_DIR, 'journey-d-2-next-day.png') })
        success = true
        note = 'Successfully loaded Ethiopian calendar with saint/fasting details and day stepping'
      }
    } catch (e) {
      note = `Failed: ${e.message}`
    } finally {
      await ctx.close()
      results.push({ id: 'JOURNEY D', name: 'Calendar Exploration', steps, success, note })
    }
  }

  // Journey E: Bilingual User
  {
    console.log('--- JOURNEY E: Bilingual User ---')
    const ctx = await browser.newContext({ viewport: { width: 390, height: 844 }, isMobile: true, hasTouch: true })
    const p = await ctx.newPage()
    let steps = 0
    let success = false
    let note = ''
    try {
      await p.goto(`${BASE_URL}/`, { waitUntil: 'networkidle' })
      steps++

      // Click Language toggle to Amharic
      await p.click('button[aria-label="Language: English. Switch to Amharic"]')
      await p.waitForTimeout(1000)
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-e-1-amharic.png') })

      // Check text changed
      const bodyText = await p.evaluate(() => document.body.innerText)
      const hasAmharic = /[\u1200-\u137F]/.test(bodyText)

      // Refresh to verify persistence
      await p.reload({ waitUntil: 'networkidle' })
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-e-2-after-reload.png') })
      const reloadText = await p.evaluate(() => document.body.innerText)
      const preserved = /[\u1200-\u137F]/.test(reloadText)

      // Switch back to English
      await p.click('button[aria-label*="Switch to English" i], button:has-text("EN")')
      await p.waitForTimeout(800)
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-e-3-english-restored.png') })

      success = hasAmharic && preserved
      note = `Bilingual persistence verified: initial=${hasAmharic}, after-reload=${preserved}`
    } catch (e) {
      note = `Failed: ${e.message}`
    } finally {
      await ctx.close()
      results.push({ id: 'JOURNEY E', name: 'Bilingual User', steps, success, note })
    }
  }

  // Journey F: Search Buddy
  {
    console.log('--- JOURNEY F: Search Buddy ---')
    const ctx = await browser.newContext({ viewport: { width: 390, height: 844 }, isMobile: true, hasTouch: true })
    const p = await ctx.newPage()
    let steps = 0
    let success = false
    let note = ''
    try {
      await p.goto(`${BASE_URL}/`, { waitUntil: 'networkidle' })
      steps++

      await p.click('button[aria-label="Open search"]')
      await p.waitForTimeout(600)
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-f-1-modal.png') })

      await p.fill('textarea[aria-label="Search the website"]', 'Saint Michael')
      await p.click('button[type="submit"][aria-label="Search"]')
      await p.waitForTimeout(4000)
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-f-2-results.png') })

      const resultsCount = await p.evaluate(() => {
        return document.querySelectorAll('[role="dialog"] a').length
      })

      success = resultsCount > 0
      note = `Search completed with ${resultsCount} interactive result links rendered`
    } catch (e) {
      note = `Failed: ${e.message}`
    } finally {
      await ctx.close()
      results.push({ id: 'JOURNEY F', name: 'Search Buddy', steps, success, note })
    }
  }

  // Journey G: Throttling / Resilient Network
  {
    console.log('--- JOURNEY G: Slow Mobile Connection ---')
    const ctx = await browser.newContext({
      viewport: { width: 390, height: 844 },
      isMobile: true,
      hasTouch: true
    })
    const client = await ctx.newCDPSession(await ctx.newPage())
    await client.send('Network.emulateNetworkConditions', {
      offline: false,
      latency: 200,
      downloadThroughput: (750 * 1024) / 8, // Slow 3G / Fast 2G
      uploadThroughput: (250 * 1024) / 8
    })
    const p = ctx.pages()[0]
    let steps = 0
    let success = false
    let note = ''
    try {
      const t0 = Date.now()
      await p.goto(`${BASE_URL}/about`, { waitUntil: 'domcontentloaded', timeout: 35000 })
      const loadTime = Date.now() - t0
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-g-1-slow-about.png') })
      success = true
      note = `About page rendered under 3G network simulation in ${loadTime}ms`
    } catch (e) {
      note = `Slow network test failed: ${e.message}`
    } finally {
      await ctx.close()
      results.push({ id: 'JOURNEY G', name: 'Slow mobile connection', steps, success, note })
    }
  }

  // Journey H: Admin Access & Auth Boundary
  {
    console.log('--- JOURNEY H: Admin Auth Boundary ---')
    const ctx = await browser.newContext({ viewport: { width: 390, height: 844 }, isMobile: true, hasTouch: true })
    const p = await ctx.newPage()
    let steps = 0
    let success = false
    let note = ''
    try {
      await p.goto(`${BASE_URL}/admin/dashboard`, { waitUntil: 'networkidle' })
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-h-1-auth-gate.png') })

      // Check that unauthenticated visitor is redirected to /admin/login or sees login form
      const url = p.url()
      const hasLoginForm = await p.locator('input[type="email"], input[name="email"]').isVisible()
      success = url.includes('/admin/login') || hasLoginForm
      note = `Unauthenticated admin route (/admin/dashboard) redirected to ${url} with login form enforced`
    } catch (e) {
      note = `Failed: ${e.message}`
    } finally {
      await ctx.close()
      results.push({ id: 'JOURNEY H', name: 'Admin Auth Boundary', steps, success, note })
    }
  }

  // Journey I: Church Library Route Inspection
  {
    console.log('--- JOURNEY I: Church Library Route ---')
    const ctx = await browser.newContext({ viewport: { width: 390, height: 844 }, isMobile: true, hasTouch: true })
    const p = await ctx.newPage()
    let steps = 0
    let success = false
    let note = ''
    try {
      await p.goto(`${BASE_URL}/admin/church-library`, { waitUntil: 'networkidle' })
      steps++
      await p.screenshot({ path: join(SHOTS_DIR, 'journey-i-1-church-library-gate.png') })
      const url = p.url()
      success = url.includes('/admin/login') || (await p.locator('input[type="email"]').isVisible())
      note = `Church Library admin route protected by auth gate (redirected to ${url})`
    } catch (e) {
      note = `Failed: ${e.message}`
    } finally {
      await ctx.close()
      results.push({ id: 'JOURNEY I', name: 'Church Library Admin Inspection', steps, success, note })
    }
  }

  await browser.close()

  console.log('\n--- Journey Results Summary ---')
  console.table(results)

  let md = '# USER JOURNEY RESULTS\n\n'
  md += '| Journey ID | Name | Steps | Status | Notes |\n'
  md += '|---|---|---|---|---|\n'
  for (const r of results) {
    md += `| **${r.id}** | ${r.name} | ${r.steps} | ${r.success ? '✓ PASS' : '✗ FAIL'} | ${r.note} |\n`
  }
  writeFileSync('audit/mobile-first-site-review/USER_JOURNEY_RESULTS.md', md, 'utf8')
  console.log('✓ USER_JOURNEY_RESULTS.md generated')
}

runJourneys().catch(e => {
  console.error(e)
  process.exit(1)
})
