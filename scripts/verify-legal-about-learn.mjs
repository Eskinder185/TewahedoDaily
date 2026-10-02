/**
 * Verify Legal, About, and Learn How to Pray for QA follow-up.
 * Requires: npm run preview (default http://127.0.0.1:4173)
 */
import { chromium } from 'playwright'
import assert from 'node:assert/strict'
import fs from 'node:fs'
import path from 'node:path'

const BASE = process.env.BASE_URL ?? 'http://127.0.0.1:4173'
const widths = [360, 390, 430, 1280]

async function main() {
  const browser = await chromium.launch()
  const failures = []
  const notes = []

  // Asset size checks (About hero)
  const aboutDerivatives = [
    'public/images/about/about-hero-640.webp',
    'public/images/about/about-hero-1024.webp',
    'public/images/about/about-hero-1600.webp',
  ]
  for (const rel of aboutDerivatives) {
    const full = path.resolve(rel)
    assert.ok(fs.existsSync(full), `missing ${rel}`)
    const bytes = fs.statSync(full).size
    notes.push(`${rel}: ${(bytes / 1024).toFixed(1)} KB`)
    assert.ok(bytes < 250_000, `${rel} still too large (${bytes})`)
  }
  const jpgBytes = fs.statSync('public/images/about/about-hero.jpg').size
  notes.push(`about-hero.jpg fallback retained: ${(jpgBytes / 1024).toFixed(1)} KB`)

  for (const width of widths) {
    const context = await browser.newContext({ viewport: { width, height: 900 } })
    const page = await context.newPage()
    const consoleErrors = []
    page.on('pageerror', (err) => consoleErrors.push(err.message))
    page.on('console', (msg) => {
      if (msg.type() === 'error') consoleErrors.push(msg.text())
    })

    // --- Legal ---
    await page.goto(`${BASE}/legal`, { waitUntil: 'networkidle', timeout: 60000 })
    const legalH1 = await page.locator('h1').first().textContent()
    assert.equal(legalH1?.trim(), 'Legal', `legal h1 at ${width}`)
    for (const id of ['copyright', 'privacy', 'removal', 'sources']) {
      const count = await page.locator(`#${id}`).count()
      assert.equal(count, 1, `missing #${id} at ${width}`)
    }
    // Hash navigation
    await page.goto(`${BASE}/legal#privacy`, { waitUntil: 'networkidle', timeout: 60000 })
    await page.waitForTimeout(400)
    const privacyVisible = await page.evaluate(() => {
      const el = document.getElementById('privacy')
      if (!el) return false
      const rect = el.getBoundingClientRect()
      return rect.top < window.innerHeight && rect.bottom > 0
    })
    assert.ok(privacyVisible, `#privacy should be in view after hash at ${width}`)

    // Refresh preserves route
    await page.reload({ waitUntil: 'networkidle' })
    assert.equal((await page.locator('h1').first().textContent())?.trim(), 'Legal')

    // Footer links
    const footerLegal = await page.locator('footer a[href="/legal"]').count()
    assert.ok(footerLegal >= 1, 'footer should link to /legal')

    // Nested main check on legal (should be exactly one)
    const legalMains = await page.locator('main').count()
    assert.equal(legalMains, 1, `legal nested main at ${width}: ${legalMains}`)

    // Overflow
    const legalOverflow = await page.evaluate(
      () => document.documentElement.scrollWidth > document.documentElement.clientWidth + 2,
    )
    if (legalOverflow) failures.push(`${width}px /legal overflow`)

    // --- About ---
    await page.goto(`${BASE}/about`, { waitUntil: 'networkidle', timeout: 60000 })
    const aboutH1 = await page.locator('h1').first().count()
    assert.ok(aboutH1 >= 1, `about h1 at ${width}`)
    const heroSrc = await page.locator('header img, .heroBackdropImg, img[src*="about-hero"]').first().getAttribute('src')
    assert.ok(heroSrc && /about-hero-(640|1024|1600)\.webp/.test(heroSrc), `about hero src at ${width}: ${heroSrc}`)
    const aboutOverflow = await page.evaluate(
      () => document.documentElement.scrollWidth > document.documentElement.clientWidth + 2,
    )
    if (aboutOverflow) failures.push(`${width}px /about overflow`)

    // --- Learn How to Pray ---
    await page.goto(`${BASE}/pray/learn-how-to-pray`, { waitUntil: 'networkidle', timeout: 60000 })
    await page.waitForTimeout(600)
    const learnH1 = await page.locator('h1').first().textContent()
    assert.ok(learnH1 && /pray/i.test(learnH1), `learn h1 at ${width}: ${learnH1}`)
    const learnMains = await page.locator('main').count()
    assert.equal(learnMains, 1, `learn nested main at ${width}: got ${learnMains}`)
    // Language switcher present
    const langControls = await page.locator('button, [role="tab"]').filter({ hasText: /Amharic|English|Both|አማርኛ/i }).count()
    assert.ok(langControls >= 1, `language controls at ${width}`)
    // Accordion / guided content present
    const guidedOrLearn = await page.locator('#guided-practice, #learn-about-prayer, [class*="guided"]').count()
    assert.ok(guidedOrLearn >= 1, `guided/learn content at ${width}`)
    const learnOverflow = await page.evaluate(
      () => document.documentElement.scrollWidth > document.documentElement.clientWidth + 2,
    )
    if (learnOverflow) failures.push(`${width}px /pray/learn-how-to-pray overflow`)

    if (consoleErrors.length) {
      failures.push(`${width}px console: ${consoleErrors.slice(0, 3).join(' | ')}`)
    }

    await context.close()
  }

  await browser.close()

  console.log('Notes:')
  for (const n of notes) console.log(' -', n)
  if (failures.length) {
    console.error('FAILURES:\n' + failures.join('\n'))
    process.exit(1)
  }
  console.log('Legal / About / Learn verification OK at', widths.join(', '), 'px')
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
