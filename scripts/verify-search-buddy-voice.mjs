import { chromium, devices } from 'playwright'

const BASE = process.env.PREVIEW_BASE || 'http://127.0.0.1:4192'

async function main() {
  const browser = await chromium.launch()
  const context = await browser.newContext({ ...devices['iPhone 13'] })
  await context.grantPermissions(['microphone'], { origin: BASE })
  const page = await context.newPage()
  await page.goto(`${BASE}/`, { waitUntil: 'networkidle', timeout: 60000 })
  await page.getByRole('button', { name: /find something/i }).click()
  await page.getByLabel(/voice language/i).selectOption('am-ET')
  const afterLang = await page.locator('[class*="status"]').first().innerText()
  console.log('after am select:', afterLang.slice(0, 140))

  await page.getByRole('button', { name: /start voice search|search by voice/i }).click()
  // Either Listening… or a clear error/timeout — never silent idle with no status.
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

  // Force idle before language-switch race test.
  await page.getByRole('button', { name: /stop voice search|stop|starting/i }).click().catch(() => {})
  await page.waitForTimeout(200)
  // If still busy (hung start), wait for watchdog to clear the select.
  await page.waitForFunction(() => {
    const select = document.querySelector('label select, select')
    return select instanceof HTMLSelectElement && !select.disabled
  }, null, { timeout: 6000 })

  await page.getByLabel(/voice language/i).selectOption('en-US')
  await page.getByRole('button', { name: /start voice search|search by voice/i }).click()
  await page.waitForTimeout(400)
  // Switch language while/after session — hardStop must clear ref so next tap can start.
  await page.waitForFunction(() => {
    const select = document.querySelector('label select, select')
    return select instanceof HTMLSelectElement && !select.disabled
  }, null, { timeout: 6000 }).catch(async () => {
    await page.getByRole('button', { name: /stop voice search|stop|starting/i }).click()
  })
  await page.getByLabel(/voice language/i).selectOption('am-ET')
  await page.waitForTimeout(120)
  await page.getByRole('button', { name: /start voice search|search by voice/i }).click()
  await page.waitForTimeout(700)
  const afterSwitchBtn = await page
    .getByRole('button', { name: /stop voice search|stop|start voice search|search by voice|starting/i })
    .first()
    .innerText()
  const afterSwitchStatus = await page.locator('[class*="status"]').first().innerText()
  console.log('after en->am retap button:', afterSwitchBtn)
  console.log('after en->am retap status:', afterSwitchStatus.slice(0, 160))
  if (!afterSwitchStatus.trim() && !/stop|starting|listening/i.test(afterSwitchBtn)) {
    throw new Error('Amharic retap produced no visible feedback')
  }

  // 360px layout: mic visible and tappable size
  await page.setViewportSize({ width: 360, height: 740 })
  const box = await page.getByRole('button', { name: /start voice search|search by voice|stop/i }).boundingBox()
  console.log('360px mic box', box)
  if (!box || box.height < 40) throw new Error('mic tap target too small at 360px')

  await browser.close()
  console.log('verify-search-buddy-voice: ok')
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
