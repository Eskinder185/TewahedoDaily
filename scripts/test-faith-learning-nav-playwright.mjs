/**
 * Faith & Learning navigation checks (Playwright Chromium) against the running app.
 *
 * Desktop: header disclosure, aria-expanded, Escape and outside-click dismissal,
 * Church Library → /library, Prayers → /pray.
 * Mobile: drawer disclosure, aria-expanded, Escape dismissal, same links.
 *
 * Start the app first (`npm run dev` or `npm run preview`), then:
 *   node scripts/test-faith-learning-nav-playwright.mjs
 * Optional: BASE_URL=http://127.0.0.1:4173
 */
import assert from 'node:assert/strict'
import { chromium } from 'playwright'

const BASE = process.env.BASE_URL ?? 'http://127.0.0.1:5173'
const DESKTOP = { width: 1280, height: 800 }
const MOBILE = { width: 390, height: 844 }

const results = []

async function check(name, fn) {
  try {
    await fn()
    results.push({ name, ok: true })
    console.log(`  ok  ${name}`)
  } catch (error) {
    results.push({ name, ok: false })
    console.error(`  FAIL  ${name}: ${error.message.split('\n')[0]}`)
  }
}

async function open(page, viewport) {
  await page.setViewportSize(viewport)
  await page.goto(BASE, { waitUntil: 'domcontentloaded', timeout: 60000 })
  await page.evaluate(() => localStorage.setItem('tewahedo-daily-locale', 'en'))
  await page.goto(BASE, { waitUntil: 'domcontentloaded', timeout: 60000 })
  await page.locator('#main').waitFor({ state: 'visible', timeout: 30000 })
}

/** Desktop disclosure button lives in the header nav, whose label toggles Open/Close. */
function desktopButton(page) {
  return page.locator('header [data-faith-learning] > button')
}

async function openDrawer(page) {
  await page.getByRole('button', { name: /Open menu/i }).click()
  const drawer = page.getByRole('dialog', { name: /Menu/i })
  await drawer.waitFor({ state: 'visible', timeout: 10000 })
  return drawer
}

async function runDesktop(browser) {
  const context = await browser.newContext({ viewport: DESKTOP, locale: 'en-US' })
  const page = await context.newPage()
  try {
    await open(page, DESKTOP)
    const button = desktopButton(page)

    await check('desktop: disclosure opens and closes with aria-expanded', async () => {
      await button.waitFor({ state: 'visible', timeout: 10000 })
      assert.equal(await button.getAttribute('aria-expanded'), 'false')
      await button.click()
      assert.equal(await button.getAttribute('aria-expanded'), 'true')
      await page.getByRole('link', { name: 'Church Library' }).waitFor({ state: 'visible', timeout: 5000 })
      await button.click()
      assert.equal(await button.getAttribute('aria-expanded'), 'false')
      assert.equal(await page.getByRole('link', { name: 'Church Library' }).count(), 0)
    })

    await check('desktop: Escape dismisses the disclosure', async () => {
      await button.click()
      assert.equal(await button.getAttribute('aria-expanded'), 'true')
      await page.keyboard.press('Escape')
      assert.equal(await button.getAttribute('aria-expanded'), 'false')
    })

    await check('desktop: outside click dismisses the disclosure', async () => {
      await button.click()
      assert.equal(await button.getAttribute('aria-expanded'), 'true')
      await page.locator('#main').click({ position: { x: 5, y: 5 } })
      assert.equal(await button.getAttribute('aria-expanded'), 'false')
    })

    await check('desktop: Church Library → /library', async () => {
      await button.click()
      await page.getByRole('link', { name: 'Church Library' }).click()
      await page.waitForURL(/\/library$/, { timeout: 15000 })
      assert.equal(await button.getAttribute('aria-expanded'), 'false')
    })

    await check('desktop: Prayers → /pray', async () => {
      await button.click()
      await page.getByRole('link', { name: 'Prayers' }).click()
      await page.waitForURL(/\/pray$/, { timeout: 15000 })
      assert.equal(await button.getAttribute('aria-expanded'), 'false')
    })
  } finally {
    await context.close()
  }
}

async function runMobile(browser) {
  const context = await browser.newContext({ viewport: MOBILE, locale: 'en-US', reducedMotion: 'reduce' })
  const page = await context.newPage()
  try {
    await open(page, MOBILE)

    await check('mobile: drawer disclosure opens and closes with aria-expanded', async () => {
      const drawer = await openDrawer(page)
      const button = drawer.locator('[data-faith-learning] > button')
      assert.equal(await button.getAttribute('aria-expanded'), 'false')
      await button.click()
      assert.equal(await button.getAttribute('aria-expanded'), 'true')
      await drawer.getByRole('link', { name: 'Church Library' }).waitFor({ state: 'visible', timeout: 5000 })
      await button.click()
      assert.equal(await button.getAttribute('aria-expanded'), 'false')
      assert.equal(await drawer.getByRole('link', { name: 'Church Library' }).count(), 0)
    })

    await check('mobile: Escape dismisses the disclosure', async () => {
      const drawer = page.getByRole('dialog', { name: /Menu/i })
      if (!(await drawer.isVisible())) await openDrawer(page)
      const button = page.locator('[role="dialog"] [data-faith-learning] > button')
      await button.click()
      assert.equal(await button.getAttribute('aria-expanded'), 'true')
      await page.keyboard.press('Escape')
      // Escape may also close the whole drawer; either way the submenu must be gone.
      const stillThere = await button.count()
      if (stillThere) assert.equal(await button.getAttribute('aria-expanded'), 'false')
      assert.equal(await page.getByRole('link', { name: 'Church Library' }).count(), 0)
    })

    for (const [label, path] of [
      ['Church Library', '/library'],
      ['Prayers', '/pray'],
    ]) {
      await check(`mobile: ${label} → ${path}`, async () => {
        await page.goto(BASE, { waitUntil: 'domcontentloaded', timeout: 60000 })
        await page.locator('#main').waitFor({ state: 'visible', timeout: 30000 })
        const drawer = await openDrawer(page)
        await drawer.locator('[data-faith-learning] > button').click()
        await drawer.getByRole('link', { name: label }).click()
        await page.waitForURL(new RegExp(`${path}$`), { timeout: 15000 })
        await drawer.waitFor({ state: 'hidden', timeout: 5000 })
      })
    }
  } finally {
    await context.close()
  }
}

async function main() {
  const probe = await fetch(BASE).catch(() => null)
  if (!probe || !probe.ok) {
    console.error(`App not reachable at ${BASE}. Start \`npm run dev\` (or preview) first, or set BASE_URL.`)
    process.exit(1)
  }
  const browser = await chromium.launch()
  try {
    await runDesktop(browser)
    await runMobile(browser)
  } finally {
    await browser.close()
  }
  const failed = results.filter((r) => !r.ok)
  console.log(`\n${results.length - failed.length} passed, ${failed.length} failed`)
  if (failed.length) process.exit(1)
}

main().catch((error) => {
  console.error(error)
  process.exit(1)
})
