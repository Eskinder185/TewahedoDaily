/**
 * Browser checks for Search Buddy / Mezmur voice UI and Learn How to Pray Night prayer contrast.
 * Run against a local preview (default http://127.0.0.1:4173).
 */
import assert from 'node:assert/strict'
import { chromium } from 'playwright'

const BASE = process.env.PREVIEW_BASE || 'http://127.0.0.1:4173'

async function main() {
  const browser = await chromium.launch()
  const page = await browser.newPage({ viewport: { width: 390, height: 844 } })

  await page.goto(`${BASE}/practice`, { waitUntil: 'networkidle', timeout: 60000 })
  await page.getByRole('radio', { name: /^English$/i }).click({ timeout: 5000 }).catch(() => {})
  await assert.ok(await page.getByRole('button', { name: /search by voice/i }).count())
  const practiceSupport = await page.evaluate(() => ({
    secure: window.isSecureContext,
    speech: typeof window.SpeechRecognition !== 'undefined' || typeof window.webkitSpeechRecognition !== 'undefined',
  }))
  console.log('practice voice environment', practiceSupport)

  await page.getByRole('button', { name: /find something/i }).click()
  await assert.ok(await page.getByRole('dialog').count())
  await assert.ok(await page.getByRole('button', { name: /search by voice/i }).count() >= 1)
  await page.keyboard.press('Escape').catch(() => {})

  await page.addInitScript(() => {
    localStorage.setItem('tewahedo-theme', 'night')
  })
  await page.goto(`${BASE}/pray/learn-how-to-pray`, { waitUntil: 'networkidle', timeout: 60000 })
  await page.getByRole('radio', { name: /^English$/i }).click({ timeout: 5000 }).catch(() => {})
  await page.waitForFunction(() => document.documentElement.getAttribute('data-theme') === 'night', null, {
    timeout: 5000,
  })
  await page.getByRole('button', { name: /go to step 6:/i }).click()
  await page.waitForTimeout(300)

  const contrast = await page.evaluate(() => {
    const block = document.querySelector('[class*="prayerBlock"]')
    const text =
      document.querySelector('[class*="prayerEn"]') ||
      document.querySelector('[class*="prayerAm"]') ||
      document.querySelector('[class*="prayerText"] p')
    if (!block || !text) return null
    const blockStyles = getComputedStyle(block)
    const textStyles = getComputedStyle(text)
    const parse = (c) => {
      const rgb = c.match(/rgba?\((\d+),\s*(\d+),\s*(\d+)/i)
      if (rgb) return [Number(rgb[1]), Number(rgb[2]), Number(rgb[3])]
      const srgb = c.match(/color\(srgb\s+([0-9.]+)\s+([0-9.]+)\s+([0-9.]+)/i)
      if (srgb) return [Number(srgb[1]) * 255, Number(srgb[2]) * 255, Number(srgb[3]) * 255]
      return null
    }
    const bg = parse(blockStyles.backgroundColor)
    const fg = parse(textStyles.color)
    if (!bg || !fg) return { bg: blockStyles.backgroundColor, fg: textStyles.color, ratio: null }
    const lum = ([r, g, b]) => {
      const s = [r, g, b].map((v) => {
        const x = v / 255
        return x <= 0.03928 ? x / 12.92 : ((x + 0.055) / 1.055) ** 2.4
      })
      return 0.2126 * s[0] + 0.7152 * s[1] + 0.0722 * s[2]
    }
    const L1 = lum(bg)
    const L2 = lum(fg)
    const ratio = (Math.max(L1, L2) + 0.05) / (Math.min(L1, L2) + 0.05)
    return { bg: blockStyles.backgroundColor, fg: textStyles.color, ratio, bgLum: L1, fgLum: L2 }
  })

  assert.ok(contrast, 'prayer block missing on step 6')
  console.log('night step 6 prayer contrast', contrast)
  assert.ok(contrast.ratio != null && contrast.ratio >= 4.5, `night prayer text contrast too low: ${contrast.ratio}`)
  assert.ok(contrast.bgLum < 0.25, `night prayer block background not dark enough: ${contrast.bgLum}`)

  // Breakpoints: no horizontal overflow on guided step
  for (const width of [320, 390, 768, 1280]) {
    await page.setViewportSize({ width, height: width === 1280 ? 800 : 700 })
    const overflow = await page.evaluate(
      () => document.documentElement.scrollWidth > document.documentElement.clientWidth + 2,
    )
    assert.equal(overflow, false, `overflow at ${width}px`)
  }

  await browser.close()
  console.log('verify-voice-and-pray-theme: ok')
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
