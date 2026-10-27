import { chromium } from 'playwright'
import { mkdirSync } from 'node:fs'
import { resolve } from 'node:path'

async function runPlaywright() {
  console.log('Starting Playwright UI verification for Admin Review System...')
  mkdirSync(resolve('audit/screenshots'), { recursive: true })

  const browser = await chromium.launch({ headless: true })
  const context = await browser.newContext({
    viewport: { width: 1280, height: 800 },
  })
  const page = await context.newPage()

  try {
    // 1. Visit Admin Dashboard
    console.log('Navigating to http://localhost:5173/admin ...')
    await page.goto('http://localhost:5173/admin', { waitUntil: 'networkidle', timeout: 15000 }).catch(() => {
      return page.goto('http://localhost:5173/admin', { waitUntil: 'domcontentloaded' })
    })
    await page.waitForTimeout(1000)
    await page.screenshot({ path: 'audit/screenshots/admin-dashboard-review-tracker.png', fullPage: true })
    console.log('Captured audit/screenshots/admin-dashboard-review-tracker.png')

    // 2. Visit Mezmur CMS List
    console.log('Navigating to http://localhost:5173/admin/hymns/mezmur ...')
    await page.goto('http://localhost:5173/admin/hymns/mezmur', { waitUntil: 'networkidle', timeout: 15000 }).catch(() => {
      return page.goto('http://localhost:5173/admin/hymns/mezmur', { waitUntil: 'domcontentloaded' })
    })
    await page.waitForTimeout(1000)
    await page.screenshot({ path: 'audit/screenshots/admin-mezmur-list-review-tags.png', fullPage: true })
    console.log('Captured audit/screenshots/admin-mezmur-list-review-tags.png')

    // 3. Visit Calendar Cards CMS List
    console.log('Navigating to http://localhost:5173/admin/calendar/cards ...')
    await page.goto('http://localhost:5173/admin/calendar/cards', { waitUntil: 'networkidle', timeout: 15000 }).catch(() => {
      return page.goto('http://localhost:5173/admin/calendar/cards', { waitUntil: 'domcontentloaded' })
    })
    await page.waitForTimeout(1000)
    await page.screenshot({ path: 'audit/screenshots/admin-calendar-cards-review-tags.png', fullPage: true })
    console.log('Captured audit/screenshots/admin-calendar-cards-review-tags.png')

    // 4. Visit Public Calendar page to confirm zero admin tags leak to visitors
    console.log('Navigating to http://localhost:5173/calendar ...')
    await page.goto('http://localhost:5173/calendar', { waitUntil: 'networkidle', timeout: 15000 }).catch(() => {
      return page.goto('http://localhost:5173/calendar', { waitUntil: 'domcontentloaded' })
    })
    await page.waitForTimeout(1000)
    const pageText = await page.textContent('body')
    const hasAdminReviewLeak = pageText.includes('Needs Review') || pageText.includes('Reviewed Tag') || pageText.includes('admin_content_review')
    if (hasAdminReviewLeak) {
      console.error('CRITICAL ERROR: Admin review text leaked to public calendar page!')
    } else {
      console.log('Verified: Zero admin review indicators leaked to public calendar page.')
    }
    await page.screenshot({ path: 'audit/screenshots/public-calendar-clean-visitor.png', fullPage: false })
    console.log('Captured audit/screenshots/public-calendar-clean-visitor.png')

    console.log('\nPlaywright tests finished successfully.')
  } catch (err) {
    console.error('Playwright test failed:', err)
  } finally {
    await browser.close()
  }
}

runPlaywright()
