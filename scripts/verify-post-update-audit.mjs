/**
 * Browser smoke for post-update audit fixes.
 * Usage: node scripts/verify-post-update-audit.mjs [baseUrl]
 */
import { chromium } from 'playwright'
import fs from 'node:fs/promises'
import path from 'node:path'

const BASE = process.argv[2] || 'http://127.0.0.1:4181/'
const OUT = path.resolve('tmp/post-update-audit-verify')
const report = { base: BASE, checks: [] }

async function check(name, fn) {
  try {
    const detail = await fn()
    report.checks.push({ name, ok: true, detail })
  } catch (err) {
    report.checks.push({ name, ok: false, error: String(err?.message || err) })
  }
}

async function main() {
  await fs.mkdir(OUT, { recursive: true })
  const browser = await chromium.launch({ headless: true })
  const page = await browser.newPage({ viewport: { width: 390, height: 844 } })

  await check('L01 focus trap', async () => {
    await page.goto(BASE, { waitUntil: 'domcontentloaded' })
    await page.getByRole('button', { name: /find something|አግኝ/i }).click()
    const dialog = page.getByRole('dialog')
    await dialog.waitFor({ state: 'visible' })
    await dialog.getByRole('textbox').fill('Saint Uriel Synaxarium')
    await dialog.locator('form button[type="submit"]').click()
    await page.waitForTimeout(2500)
    const seeMore = dialog.getByRole('button', { name: /see more|ተጨማሪ/i })
    if (await seeMore.count()) await seeMore.click()
    await page.waitForTimeout(200)
    // Tab repeatedly; active element must stay inside dialog
    for (let i = 0; i < 12; i += 1) await page.keyboard.press('Tab')
    const inside = await page.evaluate(() => {
      const dialog = document.querySelector('[role="dialog"]')
      return Boolean(dialog && dialog.contains(document.activeElement))
    })
    if (!inside) throw new Error('focus left dialog after Tab')
    await page.keyboard.press('Escape')
    await dialog.waitFor({ state: 'hidden' })
    const onFab = await page.evaluate(() =>
      /find something|አግኝ/i.test(document.activeElement?.textContent || ''),
    )
    if (!onFab) throw new Error('Escape did not restore focus to launcher')
    return { inside, onFab }
  })

  await check('L03 Timkat hero naturalWidth', async () => {
    await page.goto(new URL('/practice/browse/holidays-feasts/holidays-timket', BASE).toString(), {
      waitUntil: 'networkidle',
    })
    await page.waitForTimeout(800)
    const meta = await page.evaluate(() => {
      const img = document.querySelector('header img, .collectionHero img, img')
      if (!img) return { present: false }
      return {
        present: true,
        complete: img.complete,
        naturalWidth: img.naturalWidth,
        src: img.currentSrc || img.src,
      }
    })
    if (!meta.present) throw new Error('no hero img')
    if (!meta.naturalWidth) throw new Error(`broken image src=${meta.src}`)
    await page.screenshot({ path: path.join(OUT, 'timkat-hero-390.png') })
    return meta
  })

  await check('L04 mezmur title in viewport', async () => {
    await page.goto(new URL('/practice/browse/holidays-feasts/holidays-timket', BASE).toString(), {
      waitUntil: 'domcontentloaded',
    })
    const link = page.locator('a[href*="/practice/mezmur/"]').first()
    await link.waitFor({ timeout: 10000 })
    await link.click()
    await page.waitForTimeout(600)
    const metrics = await page.evaluate(() => {
      const h1 = document.querySelector('h1')
      const rect = h1?.getBoundingClientRect()
      return { scrollY: window.scrollY, h1Top: rect?.top ?? null, text: h1?.textContent || '' }
    })
    if (metrics.h1Top == null || metrics.h1Top < 0) {
      throw new Error(`h1 above viewport: ${JSON.stringify(metrics)}`)
    }
    await page.screenshot({ path: path.join(OUT, 'mezmur-title-390.png') })
    return metrics
  })

  await check('L05 Timkat practice search', async () => {
    await page.goto(new URL('/practice', BASE).toString(), { waitUntil: 'domcontentloaded' })
    await page.locator('#hymn-search').fill('Timkat')
    await page.waitForTimeout(1200)
    const body = await page.locator('#main').innerText()
    if (/Search results · 0/i.test(body) && /No hymns matched/i.test(body)) {
      throw new Error('still shows contradictory zero hymn message')
    }
    if (/no hymn titles matched/i.test(body) && !/hymns from matching sections/i.test(body)) {
      // sections-only copy is acceptable if no linked mezmurs were returned
    }
    const hasSection = /Timkat|Epiphany|ጥምቀት/i.test(body)
    if (!hasSection) throw new Error('no Timkat section suggestion')
    const falseZero = /Search results · 0/i.test(body) && /No hymns matched your search/i.test(body)
    if (falseZero) throw new Error('contradictory zero message')
    await page.screenshot({ path: path.join(OUT, 'timkat-search-390.png') })
    return { hasSection, snippet: body.slice(0, 500) }
  })

  await check('L07 Amharic feast label', async () => {
    await page.goto(new URL('/calendar', BASE).toString(), { waitUntil: 'domcontentloaded' })
    // open language menu if needed
    const amBtn = page.getByRole('radio', { name: /አማርኛ|Amharic/i }).or(page.getByRole('button', { name: /አማርኛ/i }))
    if (await amBtn.count()) {
      await amBtn.first().click({ force: true }).catch(() => {})
    }
    await page.waitForTimeout(400)
    const text = await page.locator('body').innerText()
    if (text.includes('በጣም ጥሩ ድግስ')) throw new Error('bad feast terminology still present')
    return { avoidedBadPhrase: true }
  })

  await check('L08 weekday dedupe', async () => {
    await page.goto(new URL('/pray/wudase-mariam', BASE).toString(), { waitUntil: 'networkidle' })
    await page.waitForTimeout(600)
    const text = await page.locator('main, #main').innerText()
    if (/Monday\s*\/\s*Monday/i.test(text)) throw new Error('Monday / Monday still present')
    return { ok: true }
  })

  await check('L09 single main landmark', async () => {
    await page.goto(new URL('/pray/zewter-tselot', BASE).toString(), { waitUntil: 'domcontentloaded' })
    const count = await page.locator('main').count()
    if (count !== 1) throw new Error(`expected 1 main, found ${count}`)
    return { count }
  })

  await check('L13 legal target height', async () => {
    await page.goto(new URL('/legal', BASE).toString(), { waitUntil: 'domcontentloaded' })
    const h = await page.locator('nav a[href="#privacy"]').first().evaluate((el) => el.getBoundingClientRect().height)
    if (h < 43.5) throw new Error(`privacy anchor height ${h}`)
    return { height: h }
  })

  await fs.writeFile(path.join(OUT, 'report.json'), JSON.stringify(report, null, 2))
  await browser.close()
  const failed = report.checks.filter((c) => !c.ok)
  console.log(JSON.stringify(report, null, 2))
  if (failed.length) process.exit(1)
}

main().catch((e) => {
  console.error(e)
  process.exit(1)
})
