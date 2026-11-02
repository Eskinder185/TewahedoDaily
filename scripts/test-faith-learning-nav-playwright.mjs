/**
 * Primary Explore navigation checks (Playwright Chromium) against the running app.
 *
 * Desktop: header disclosure, aria-expanded, Escape and outside-click dismissal,
 * Calendar, Church Library, and Faith Challenges use their existing routes.
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
    console.error(`  FAIL  ${name}: ${error.message}`)
  }
}

async function open(page, viewport) {
  await page.setViewportSize(viewport)
  await page.goto(BASE, { waitUntil: 'domcontentloaded', timeout: 60000 })
  await page.evaluate(() => localStorage.setItem('tewahedo-daily-locale', 'en'))
  await page.goto(BASE, { waitUntil: 'domcontentloaded', timeout: 60000 })
  await page.locator('#main').waitFor({ state: 'visible', timeout: 30000 })
}

/** Desktop Explore disclosure button lives in the header nav. */
function desktopButton(page) {
  return page.locator('header nav').getByRole('button', { name: 'Explore' })
}

async function openDrawer(page) {
  await page.getByRole('button', { name: /Open menu|ምናሌ ክፈት/i }).click()
  const drawer = page.getByRole('dialog', { name: /Menu|ምናሌ/i })
  await drawer.waitFor({ state: 'visible', timeout: 10000 })
  return drawer
}

async function runDesktop(browser) {
  const context = await browser.newContext({ viewport: DESKTOP, locale: 'en-US' })
  const page = await context.newPage()
  try {
    await open(page, DESKTOP)
    const button = desktopButton(page)

    await check('desktop: primary order and routes', async () => {
      const labels = await page.locator('header nav > a, header nav > div > button').evaluateAll((elements) =>
        elements.map((element) => element.getAttribute('aria-label') ?? element.querySelector('span')?.textContent?.trim() ?? element.textContent?.trim()),
      )
      assert.deepEqual(labels, [
        'Home', 'Bible', 'Mezmur', 'Prayer', 'Explore',
      ])
      for (const [label, path] of [['Home', '/'], ['Bible', '/bible'], ['Mezmur', '/hymns'], ['Prayer', '/pray']]) {
        assert.equal(await page.locator('header nav').getByRole('link', { name: label, exact: true }).getAttribute('href'), path)
      }
    })

    await check('desktop: keyboard focus, ArrowDown, and Escape', async () => {
      await button.focus()
      assert.equal(await button.evaluate((element) => getComputedStyle(element).outlineStyle), 'solid', 'Explore needs a visible focus outline')
      await page.keyboard.press('ArrowDown')
      assert.equal(await button.getAttribute('aria-expanded'), 'true', 'ArrowDown opens Explore')
      assert.equal(await page.locator('header nav').getByRole('link', { name: 'Calendar' }).evaluate((element) => element === document.activeElement), true, 'ArrowDown focuses Calendar')
      await page.keyboard.press('Escape')
      assert.equal(await button.getAttribute('aria-expanded'), 'false', 'Escape closes Explore')
      assert.equal(await button.evaluate((element) => element === document.activeElement), true, 'Escape restores trigger focus')
    })

    await check('desktop: disclosure opens and closes with aria-expanded', async () => {
      await button.waitFor({ state: 'visible', timeout: 10000 })
      assert.equal(await button.getAttribute('aria-expanded'), 'false')
      await button.click()
      assert.equal(await button.getAttribute('aria-expanded'), 'true')
      await page.locator('header nav').getByRole('link', { name: 'Church Library' }).waitFor({ state: 'visible', timeout: 5000 })
      await button.click()
      assert.equal(await button.getAttribute('aria-expanded'), 'false')
      assert.equal(await page.locator('header nav').getByRole('link', { name: 'Church Library' }).count(), 0)
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

    await check('desktop: Faith Challenges → /play', async () => {
      await button.click()
      await page.locator('header nav').getByRole('link', { name: 'Faith Challenges' }).click()
      await page.waitForURL(/\/play$/, { timeout: 15000 })
      assert.equal(await button.getAttribute('aria-expanded'), 'false')
      assert.equal(await button.evaluate((element) => getComputedStyle(element).boxShadow !== 'none'), true)
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
      const button = drawer.getByRole('button', { name: 'Explore' })
      assert.equal(await button.getAttribute('aria-expanded'), 'false')
      await button.click()
      assert.equal(await button.getAttribute('aria-expanded'), 'true')
      await drawer.getByRole('link', { name: 'Church Library' }).waitFor({ state: 'visible', timeout: 5000 })
      await button.click()
      assert.equal(await button.getAttribute('aria-expanded'), 'false')
      assert.equal(await drawer.getByRole('link', { name: 'Church Library' }).count(), 0)
    })

    await check('mobile: Escape dismisses the disclosure', async () => {
      const drawer = page.getByRole('dialog', { name: /Menu|ምናሌ/i })
      if (!(await drawer.isVisible())) await openDrawer(page)
      const button = page.getByRole('dialog', { name: /Menu|ምናሌ/i }).getByRole('button', { name: 'Explore' })
      await button.click()
      assert.equal(await button.getAttribute('aria-expanded'), 'true')
      await page.keyboard.press('Escape')
      // Escape may also close the whole drawer; either way the submenu must be gone.
      const stillThere = await button.count()
      if (stillThere) assert.equal(await button.getAttribute('aria-expanded'), 'false')
      assert.equal(await page.getByRole('link', { name: 'Church Library' }).count(), 0)
    })

    for (const [label, path] of [
      ['Calendar', '/calendar'],
      ['Church Library', '/library'],
      ['Faith Challenges', '/play'],
    ]) {
      await check(`mobile: ${label} → ${path}`, async () => {
        await page.goto(BASE, { waitUntil: 'domcontentloaded', timeout: 60000 })
        await page.locator('#main').waitFor({ state: 'visible', timeout: 30000 })
        const drawer = await openDrawer(page)
        await drawer.getByRole('button', { name: 'Explore' }).click()
        await drawer.getByRole('link', { name: label }).click()
        await page.waitForURL(new RegExp(`${path}$`), { timeout: 15000 })
        await drawer.waitFor({ state: 'hidden', timeout: 5000 })
      })
    }

    await check('mobile: Amharic primary and Explore labels', async () => {
      await page.evaluate(() => localStorage.setItem('tewahedo-daily-locale', 'am'))
      await page.goto(BASE, { waitUntil: 'domcontentloaded', timeout: 60000 })
      const drawer = await openDrawer(page)
      for (const label of ['መነሻ', 'መጽሐፍ ቅዱስ', 'መዝሙር', 'ጸሎት']) {
        await drawer.getByRole('link', { name: label, exact: true }).waitFor({ state: 'visible' })
      }
      await drawer.getByRole('button', { name: 'ያስሱ' }).click()
      await drawer.getByRole('link', { name: 'የእምነት ፈተናዎች' }).waitFor({ state: 'visible' })
    })
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
