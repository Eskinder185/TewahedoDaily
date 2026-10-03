import { chromium, devices } from 'playwright'

const BASE = process.env.PREVIEW_BASE || 'http://127.0.0.1:4192'

async function main() {
  const browser = await chromium.launch()
  const context = await browser.newContext({ ...devices['iPhone 13'] })
  await context.grantPermissions(['microphone'], { origin: BASE })
  const page = await context.newPage()
  await page.goto(`${BASE}/`, { waitUntil: 'networkidle', timeout: 60000 })
  await page.getByRole('button', { name: /search|find something|open search/i }).click()

  // Voice language toggle must be gone (English-only recognition).
  const langToggle = page.getByLabel(/voice language/i)
  if ((await langToggle.count()) > 0) {
    throw new Error('Voice language toggle should not be visible')
  }

  await page.getByRole('button', { name: /start voice search|search by voice/i }).click()
  await page.waitForFunction(() => {
    const status = document.querySelector('[class*="status"]')?.textContent || ''
    const btn = document.querySelector('button[aria-pressed]')?.textContent || ''
    return /Listening|Starting|Could not start|permission|language|network|microphone|supported|didn't hear/i.test(
      `${status} ${btn}`,
    )
  }, null, { timeout: 6000 })
  const btn = await page
    .getByRole('button', { name: /stop voice search|stop|start voice search|search by voice|starting/i })
    .first()
    .innerText()
  const status = await page.locator('[class*="status"]').first().innerText()
  console.log('button:', btn)
  console.log('status:', status.slice(0, 160))
  console.log(
    'support',
    await page.evaluate(() => ({
      speech:
        typeof window.SpeechRecognition !== 'undefined' ||
        typeof window.webkitSpeechRecognition !== 'undefined',
      secure: window.isSecureContext,
    })),
  )

  await page.getByRole('button', { name: /stop voice search|stop|starting/i }).click().catch(() => {})
  await page.waitForTimeout(200)

  // Second session should still start cleanly (no stale 15s timer).
  await page.getByRole('button', { name: /start voice search|search by voice/i }).click()
  await page.waitForTimeout(500)
  const retapBtn = await page
    .getByRole('button', { name: /stop voice search|stop|start voice search|search by voice|starting/i })
    .first()
    .innerText()
  const retapStatus = await page.locator('[class*="status"]').first().innerText()
  console.log('retap button:', retapBtn)
  console.log('retap status:', retapStatus.slice(0, 160))
  if (!retapStatus.trim() && !/stop|starting|listening/i.test(retapBtn)) {
    throw new Error('English retap produced no visible feedback')
  }

  await page.setViewportSize({ width: 360, height: 740 })
  const box = await page.getByRole('button', { name: /start voice search|search by voice|stop/i }).boundingBox()
  console.log('360px mic box', box)
  if (!box || box.height < 40) throw new Error('mic tap target too small at 360px')

  await browser.close()
  console.log('verify-search-buddy-voice: ok')
}

main().catch((error) => {
  console.error(error)
  process.exit(1)
})
