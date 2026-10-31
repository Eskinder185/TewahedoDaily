/**
 * Complete Phase 1 mobile regression matrix.
 *
 * Start `npm run preview` first, or set BASE_URL to an available local server.
 * This uses the repository's existing Playwright dependency and does not
 * require authenticated or production data.
 */
import assert from 'node:assert/strict'
import { chromium } from 'playwright'

const BASE_URL = process.env.BASE_URL ?? 'http://127.0.0.1:4173'
const WIDTHS = [320, 375, 430]
const ROUTES = [
  { name: 'Homepage', path: '/', heading: /one day|አንድ ቀን/i },
  { name: 'Bible', path: '/bible', heading: /bible|መጽሐፍ ቅዱስ/i },
  { name: 'Calendar', path: '/calendar', selector: '#calendar', heading: /calendar|ቀን መቁጠሪያ/i },
  { name: 'Mezmur', path: '/practice', heading: /hymns|mezmur|መዝሙር/i },
  { name: 'Church Library', path: '/library', heading: /church library|ቤተ ክርስቲያን/i },
  { name: 'Tewahedo Play', path: '/play', heading: /play|ጨዋታ/i },
]

function describeError(error) {
  return error instanceof Error ? error.message : String(error)
}

async function assertNoOverflow(page) {
  return page.evaluate(() => {
    const root = document.documentElement
    const body = document.body
    return {
      overflow: root.scrollWidth > root.clientWidth + 2 || body.scrollWidth > body.clientWidth + 2,
      scrollWidth: Math.max(root.scrollWidth, body.scrollWidth),
      clientWidth: Math.min(root.clientWidth, body.clientWidth),
    }
  })
}

async function assertNavigation(page) {
  const nav = page.locator('header nav, nav, [role="navigation"]').first()
  const menuButton = page.getByRole('button', { name: /open menu|ምናሌ ክፈት/i }).first()
  const navVisible = await nav.isVisible().catch(() => false)
  const menuVisible = await menuButton.isVisible().catch(() => false)
  const links = await page.locator('a[href]').count()
  assert.ok(navVisible || menuVisible || links > 0, 'no accessible navigation or links found')
}

async function assertPrimaryContent(page, route) {
  if (route.selector) {
    await page.locator(route.selector).waitFor({ state: 'visible', timeout: 15000 })
    return
  }
  await page.getByRole('heading', { name: route.heading }).first().waitFor({
    state: 'visible',
    timeout: 15000,
  })
}

async function inspectVisibleControls(page, width) {
  return page.evaluate((viewportWidth) => {
    const nodes = [...document.querySelectorAll('a[href], button, input, select, textarea')]
    const clipped = nodes
      .filter((node) => {
        const element = /** @type {HTMLElement} */ (node)
        const style = window.getComputedStyle(element)
        const rect = element.getBoundingClientRect()
        const horizontalScroller = element.closest('*') && (() => {
          let parent = element.parentElement
          while (parent) {
            const parentStyle = window.getComputedStyle(parent)
            if ((parentStyle.overflowX === 'auto' || parentStyle.overflowX === 'scroll') &&
              parent.scrollWidth > parent.clientWidth + 2) {
              return true
            }
            parent = parent.parentElement
          }
          return false
        })()
        return style.display !== 'none' &&
          style.visibility !== 'hidden' &&
          rect.width > 0 &&
          rect.height > 0 &&
          !horizontalScroller &&
          (rect.left < -2 || rect.right > viewportWidth + 2)
      })
      .slice(0, 5)
      .map((node) => ({
        tag: node.tagName.toLowerCase(),
        text: (node.textContent || '').trim().replace(/\s+/g, ' ').slice(0, 80),
        aria: node.getAttribute('aria-label') || '',
      }))
    const undersized = nodes
      .filter((node) => ['BUTTON', 'INPUT', 'SELECT', 'TEXTAREA'].includes(node.tagName))
      .filter((node) => {
        const element = /** @type {HTMLElement} */ (node)
        const style = window.getComputedStyle(element)
        const rect = element.getBoundingClientRect()
        return style.display !== 'none' &&
          style.visibility !== 'hidden' &&
          rect.width > 0 &&
          rect.height > 0 &&
          (rect.width < 32 || rect.height < 32)
      })
      .slice(0, 5)
      .map((node) => ({
        tag: node.tagName.toLowerCase(),
        text: (node.textContent || '').trim().replace(/\s+/g, ' ').slice(0, 80),
        aria: node.getAttribute('aria-label') || '',
      }))
    return { clipped, undersized }
  }, width)
}

async function runCase(browser, route, width) {
  const context = await browser.newContext({
    viewport: { width, height: 844 },
    reducedMotion: 'reduce',
    isMobile: true,
    hasTouch: true,
  })
  const page = await context.newPage()
  const consoleErrors = []
  const pageErrors = []
  page.on('console', (message) => {
    if (message.type() === 'error') consoleErrors.push(message.text())
  })
  page.on('pageerror', (error) => pageErrors.push(describeError(error)))

  try {
    const response = await page.goto(`${BASE_URL}${route.path}`, {
      waitUntil: 'domcontentloaded',
      timeout: 60000,
    })
    assert.ok(response && response.status() < 500, `route returned HTTP ${response?.status() ?? 'unknown'}`)
    await page.locator('#main').waitFor({ state: 'visible', timeout: 15000 })
    await page.waitForTimeout(1200)
    await assertPrimaryContent(page, route)
    await assertNavigation(page)

    const overflow = await assertNoOverflow(page)
    assert.equal(overflow.overflow, false, `horizontal overflow ${overflow.scrollWidth}px > ${overflow.clientWidth}px`)

    const controls = await inspectVisibleControls(page, width)
    assert.deepEqual(controls.clipped, [], `visible controls clipped: ${JSON.stringify(controls.clipped)}`)
    assert.deepEqual(controls.undersized, [], `obviously undersized controls: ${JSON.stringify(controls.undersized)}`)
    assert.deepEqual(pageErrors, [], `fatal page errors: ${JSON.stringify(pageErrors)}`)

    return {
      status: consoleErrors.length ? 'UNKNOWN' : 'PASS',
      evidence: consoleErrors.length
        ? `console errors observed: ${JSON.stringify(consoleErrors.slice(0, 3))}`
        : 'rendered, primary content visible, navigation present, no overflow, no clipped/undersized controls',
    }
  } catch (error) {
    return {
      status: 'FAIL',
      evidence: `${describeError(error)}${consoleErrors.length ? `; console errors: ${JSON.stringify(consoleErrors.slice(0, 3))}` : ''}`,
    }
  } finally {
    await context.close()
  }
}

async function main() {
  const browser = await chromium.launch()
  const results = []

  try {
    for (const route of ROUTES) {
      for (const width of WIDTHS) {
        const result = await runCase(browser, route, width)
        results.push({ route: route.name, width, ...result })
        console.log(`${result.status.padEnd(7)} ${route.name.padEnd(16)} ${width}px — ${result.evidence}`)
      }
    }
  } finally {
    await browser.close()
  }

  const failures = results.filter((result) => result.status === 'FAIL')
  const unknowns = results.filter((result) => result.status === 'UNKNOWN')
  console.log(`\nMatrix: ${results.length} cases; PASS ${results.length - failures.length - unknowns.length}; FAIL ${failures.length}; UNKNOWN ${unknowns.length}`)
  if (failures.length) process.exitCode = 1
}

main().catch((error) => {
  console.error(error)
  process.exitCode = 1
})
