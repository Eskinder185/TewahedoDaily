/**
 * Browser regression checks for the public mobile shell.
 *
 * Run after `npm run preview` (or set BASE_URL). This deliberately avoids
 * authenticated actions and does not require real account credentials.
 */
import assert from 'node:assert/strict'
import { chromium } from 'playwright'

const baseUrl = process.env.BASE_URL ?? 'http://127.0.0.1:4173'
const widths = [320, 360, 375, 390, 412, 430]

async function assertNoHorizontalOverflow(page, label) {
  const overflow = await page.evaluate(
    () => document.documentElement.scrollWidth > document.documentElement.clientWidth + 2,
  )
  assert.equal(overflow, false, `${label} must not have horizontal page overflow`)
}

async function main() {
  const browser = await chromium.launch()
  const consoleErrors = []

  try {
    for (const width of widths) {
      const context = await browser.newContext({
        viewport: { width, height: 844 },
        reducedMotion: 'reduce',
      })
      const page = await context.newPage()
      page.on('console', (message) => {
        if (message.type() === 'error') consoleErrors.push(`${width}px: ${message.text()}`)
      })

      await page.goto(`${baseUrl}/`, { waitUntil: 'domcontentloaded' })
      await assertNoHorizontalOverflow(page, `${width}px homepage`)

      await page.getByRole('button', { name: /open menu/i }).click()
      const account = page.getByRole('link', { name: /account/i }).first()
      await assert.equal(await account.isVisible(), true, `${width}px drawer exposes Account`)
      await account.click()
      await page.waitForURL(/\/account$/)
      await assertNoHorizontalOverflow(page, `${width}px account page`)

      await context.close()
    }
  } finally {
    await browser.close()
  }

  console.log(`mobile shell regression: ${widths.join(', ')}px passed`)
  if (consoleErrors.length) {
    console.log(`observed ${consoleErrors.length} console error(s); inspect network availability separately`)
  }
}

main().catch((error) => {
  console.error(error)
  process.exit(1)
})
