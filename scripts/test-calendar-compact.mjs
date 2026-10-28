import assert from 'node:assert/strict'
import { chromium } from 'playwright'

const base = process.env.BASE_URL || 'http://127.0.0.1:4173'
function fixture(readings, hymns, date = '2026-10-27') {
  const passage = (language) => ({ editionName: language === 'am' ? 'Amharic fixture' : 'English fixture', verses: Array.from({ length: 4 }, (_, i) => ({ id: language + i, verseNumber: i + 1, text: language === 'am' ? 'የሙከራ ንባብ ' + (i + 1) : 'Test reading verse ' + (i + 1) })) })
  return { gregorianDate: date, ethiopianLabel: date, gregorianLabel: date, dayTitle: 'Test date', badges: [], fastingStatus: {}, season: null, activeFast: null, synaxarium: [], liturgySummary: null,
    dailyScriptures: Array.from({ length: readings }, (_, i) => ({ id: 'reading-' + i, reference: 'Luke ' + (i + 1) + ':1–4', reasonEn: 'Reading subject ' + i, reasonAm: 'የንባብ ርዕስ ' + i, priorityLabelEn: 'Suggested Scripture', priorityLabelAm: 'የተመከረ ንባብ', readHref: '/bible/luke/' + (i + 1) + '#verse-1', passageAmharic: passage('am'), passageEnglish: passage('en') })),
    mezmurRecommendations: Array.from({ length: hymns }, (_, i) => ({ id: 'hymn-' + i, slug: 'hymn-' + i, title: 'Test hymn ' + i, titleAmharic: 'መዝሙር ' + i, matchReason: 'Published fixture association ' + i, practiceHref: '/hymns/mezmur/hymn-' + i })) }
}
const browser = await chromium.launch({ headless: true })
try {
  for (const width of [375, 390, 1280]) {
    const page = await browser.newPage({ viewport: { width, height: 844 }, reducedMotion: 'reduce' })
    await page.addInitScript(() => { if (!localStorage.getItem('tewahedo-daily-locale')) localStorage.setItem('tewahedo-daily-locale', 'en') })
    await page.goto(base + '/scripts/fixtures/calendar-compact.html')
    await page.waitForFunction(() => typeof window.renderCalendar === 'function')
    const render = async (data) => { await page.evaluate((value) => window.renderCalendar(value), data); await page.getByRole('heading', { name: data.gregorianDate, exact: true }).waitFor() }
    const readings = page.locator('article')
    const hymns = page.getByRole('link', { name: /View Hymn:/ })
    const originalUrl = page.url()
    for (const [r, h] of [[0, 0], [1, 1], [2, 2], [4, 6]]) {
      await render(fixture(r, h, '2026-10-' + (10 + r)))
      assert.equal(await readings.count(), Math.min(1, r))
      assert.equal(await hymns.count(), Math.min(2, h))
      const showReadings = page.getByRole('button', { name: 'Show all readings (' + r + ')', exact: true })
      assert.equal(await showReadings.count(), r > 1 ? 1 : 0)
      if (r > 1) {
        const controls = await showReadings.getAttribute('aria-controls')
        assert.ok(await page.locator('[id="' + controls + '"]').count())
        await showReadings.click()
        assert.equal(await readings.count(), r)
        await page.getByRole('button', { name: 'Show fewer readings', exact: true }).click()
        assert.equal(await readings.count(), 1)
      }
      if (h > 2) {
        await page.getByRole('button', { name: 'Show all Mezmurs (' + h + ')', exact: true }).click()
        assert.equal(await hymns.count(), h)
        await page.getByRole('button', { name: 'Show fewer Mezmurs', exact: true }).click()
        assert.equal(await hymns.count(), 2)
      }
    }
    await page.getByRole('button', { name: 'English', exact: true }).click()
    assert.equal(await readings.first().getByText('Test reading verse 2', { exact: true }).count(), 0)
    await page.getByRole('button', { name: /Expand full passage/ }).click()
    await readings.first().getByText('Test reading verse 4', { exact: false }).waitFor()
    assert.equal(await readings.first().getByText('Test reading verse 4', { exact: false }).count(), 1)
    await page.getByRole('button', { name: 'Show all readings (4)', exact: true }).click()
    assert.equal(await page.getByRole('button', { name: /Collapse passage/ }).count(), 1)
    assert.equal(await page.getByRole('button', { name: /Expand full passage/ }).count(), 3)
    await page.getByRole('button', { name: 'Show all Mezmurs (6)', exact: true }).click()
    await render(fixture(3, 5, '2026-11-01'))
    assert.equal(await readings.count(), 1)
    assert.equal(await hymns.count(), 2)
    assert.equal(await page.getByRole('button', { name: 'English', exact: true }).getAttribute('aria-pressed'), 'true')
    for (const [mode, edition] of [['አማርኛ', 'am'], ['English', 'web'], ['Parallel', 'both']]) {
      await page.getByRole('button', { name: mode, exact: true }).click()
      const href = await page.getByRole('link', { name: 'Read in Bible Reader', exact: false }).first().getAttribute('href')
      const url = new URL(href, base)
      assert.equal(url.searchParams.get('edition'), edition)
      assert.equal(url.searchParams.get('returnTo'), '/calendar?date=2026-11-01')
    }
    const panels = page.locator('section[aria-labelledby="scripture-heading"], section[aria-labelledby="mezmur-heading"]')
    const a = await panels.nth(0).boundingBox(); const b = await panels.nth(1).boundingBox()
    assert.ok(width < 1024 ? b.y >= a.y + a.height : Math.abs(a.y - b.y) < 2)
    assert.ok(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth), 'No horizontal overflow at ' + width)
    assert.equal(page.url(), originalUrl, 'Expansion and translation do not add browser history entries')
    await page.evaluate(() => localStorage.setItem('tewahedo-daily-locale', 'am'))
    await page.reload()
    await page.waitForFunction(() => typeof window.renderCalendar === 'function')
    await page.evaluate((value) => window.renderCalendar(value), fixture(3, 5))
    const amReadings = page.getByRole('button', { name: 'ሁሉንም ንባቦች አሳይ (3)', exact: true })
    await amReadings.click()
    assert.equal(await readings.count(), 3)
    await page.getByRole('button', { name: 'ሁሉንም መዝሙራት አሳይ (5)', exact: true }).click()
    assert.equal(await page.getByRole('link', { name: /መዝሙሩን ይመልከቱ:/ }).count(), 5)
    console.log(width + 'px: counts, expansion, independent passage controls, date reset, modes, links, layout passed')
    await page.close()
  }
} finally { await browser.close() }
