import { createServer } from 'node:http'
import { readFileSync } from 'node:fs'
import { dirname, resolve } from 'node:path'
import { fileURLToPath } from 'node:url'
import { chromium } from 'playwright'

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..')
const html = readFileSync(resolve(root, 'scripts/fixtures/test-lyrics-experience.html'), 'utf8')

async function main() {
  const server = createServer((_req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' })
    res.end(html)
  })
  await new Promise((done) => server.listen(0, '127.0.0.1', done))
  const port = server.address().port
  const browser = await chromium.launch()
  const failures = []

  try {
    // 1. Responsive Viewport Audits (375px mobile, 1280px desktop)
    for (const width of [375, 414, 768, 1280]) {
      const page = await browser.newPage({ viewport: { width, height: 900 } })
      await page.goto(`http://127.0.0.1:${port}`)
      const overflow = await page.evaluate(
        () => document.documentElement.scrollWidth > document.documentElement.clientWidth + 2,
      )
      if (overflow) {
        failures.push(`${width}px viewport overflows horizontally`)
      }
      await page.close()
    }

    // 2. Interactive Feature Verification
    const page = await browser.newPage({ viewport: { width: 1280, height: 900 } })
    await page.goto(`http://127.0.0.1:${port}`)

    // Verify Reading Experience is present initially
    const readingSection = page.locator('[data-testid="lyrics-reading-experience"]')
    if (!(await readingSection.isVisible())) {
      failures.push('Initial reading experience section is not visible')
    }

    // Check Amharic typography
    const stanza1 = page.locator('#stanza-text-1')
    const stanzaText = await stanza1.textContent()
    if (!stanzaText?.includes('ሰማየ ሰማያት አይችለውም')) {
      failures.push('Amharic lyrics text not rendered properly')
    }
    const amharicClass = await stanza1.getAttribute('class')
    if (!amharicClass?.includes('ethiopicTypography')) {
      failures.push('Amharic lyrics must use ethiopicTypography class')
    }
    const amharicLang = await stanza1.getAttribute('lang')
    if (amharicLang !== 'am') {
      failures.push('Amharic lyrics must have lang="am"')
    }

    // Switch to Geʽez tab
    await page.locator('#tab-gez').click()
    const gezText = await stanza1.textContent()
    if (!gezText?.includes('ሰማየ ሰማያት ኢያግምሮ')) {
      failures.push('Geʽez tab did not display Geʽez lyrics')
    }
    const gezLang = await stanza1.getAttribute('lang')
    if (gezLang !== 'gez') {
      failures.push('Geʽez lyrics must have lang="gez"')
    }
    const gezClass = await stanza1.getAttribute('class')
    if (!gezClass?.includes('ethiopicTypography')) {
      failures.push('Geʽez lyrics must use ethiopicTypography class')
    }

    // Switch to English tab
    await page.locator('#tab-en').click()
    const enText = await stanza1.textContent()
    if (!enText?.includes('The highest heavens cannot contain Him')) {
      failures.push('English tab did not display English lyrics')
    }
    const enLang = await stanza1.getAttribute('lang')
    if (enLang !== 'en') {
      failures.push('English lyrics must have lang="en"')
    }
    const enClass = await stanza1.getAttribute('class')
    if (!enClass?.includes('latinTypography')) {
      failures.push('English lyrics must use latinTypography class')
    }

    // Switch to Oromo tab
    await page.locator('#tab-om').click()
    const omText = await stanza1.textContent()
    if (!omText?.includes('Waaqni samii samii hin danda\'amu')) {
      failures.push('Oromo tab did not display Oromo lyrics')
    }
    const omLang = await stanza1.getAttribute('lang')
    if (omLang !== 'om') {
      failures.push('Oromo lyrics must have lang="om"')
    }
    const omClass = await stanza1.getAttribute('class')
    if (!omClass?.includes('latinTypography')) {
      failures.push('Oromo lyrics must use latinTypography class')
    }

    // Test Font Size Scaling
    const readerPanel = page.locator('#panel-lyrics')
    await page.locator('#size-18').click()
    let readerStyle = await readerPanel.getAttribute('style')
    if (!readerStyle?.includes('--reader-size: 18px')) {
      failures.push('Font size S (18px) was not applied to reader')
    }

    await page.locator('#size-32').click()
    readerStyle = await readerPanel.getAttribute('style')
    if (!readerStyle?.includes('--reader-size: 32px')) {
      failures.push('Font size XL (32px) was not applied to reader')
    }

    // Test Reading Themes
    await page.locator('#theme-navy').click()
    let readerClass = await readerPanel.getAttribute('class')
    if (!readerClass?.includes('themeNavy')) {
      failures.push('Navy theme was not applied to reader')
    }

    await page.locator('#theme-gold').click()
    readerClass = await readerPanel.getAttribute('class')
    if (!readerClass?.includes('themeGold')) {
      failures.push('Gold theme was not applied to reader')
    }

    await page.locator('#theme-dark').click()
    readerClass = await readerPanel.getAttribute('class')
    if (!readerClass?.includes('themeDark')) {
      failures.push('Dark theme was not applied to reader')
    }

    // Test Verse Numbers toggle
    const verse1Label = page.locator('#label-verse-1')
    await page.locator('#verse-toggle').uncheck()
    let isHidden = await verse1Label.evaluate((el) => window.getComputedStyle(el).display === 'none')
    if (!isHidden) {
      failures.push('Unchecking verse numbers did not hide verse label')
    }
    await page.locator('#verse-toggle').check()
    let isVisible = await verse1Label.evaluate((el) => window.getComputedStyle(el).display !== 'none')
    if (!isVisible) {
      failures.push('Checking verse numbers did not show verse label')
    }

    // Test Missing-lyrics state
    await page.locator('#btn-show-missing').click()
    const missingNotice = page.locator('[data-testid="lyrics-missing-state"]')
    if (!(await missingNotice.isVisible())) {
      failures.push('Missing-lyrics state notice was not visible')
    }
    const contributeLink = page.locator('#contribute-link')
    if (!(await contributeLink.isVisible())) {
      failures.push('Contribute lyrics button was not visible in missing state')
    }

    // Test Restricted-lyrics state
    await page.locator('#btn-show-restricted').click()
    const restrictedNotice = page.locator('[data-testid="lyrics-restricted-state"]')
    if (!(await restrictedNotice.isVisible())) {
      failures.push('Restricted-lyrics state notice was not visible')
    }
    const sourceLink = page.locator('#source-link')
    if (!(await sourceLink.isVisible())) {
      failures.push('Authorized source link was not visible in restricted state')
    }

    // Test Loading state
    await page.locator('#btn-show-loading').click()
    const loadingNotice = page.locator('[data-testid="lyrics-loading-state"]')
    if (!(await loadingNotice.isVisible())) {
      failures.push('Loading state notice was not visible')
    }

    // Test Error state
    await page.locator('#btn-show-error').click()
    const errorNotice = page.locator('[data-testid="lyrics-error-state"]')
    if (!(await errorNotice.isVisible())) {
      failures.push('Error state notice was not visible')
    }
    const retryBtn = page.locator('#retry-btn')
    if (!(await retryBtn.isVisible())) {
      failures.push('Retry button was not visible in error state')
    }

    await page.close()
  } finally {
    await browser.close()
    server.close()
  }

  if (failures.length > 0) {
    console.error('Playwright verification failed:')
    console.error(failures.join('\n'))
    process.exit(1)
  }

  console.log('All Playwright tests passed for desktop, mobile, language tabs, typography, scaling, and state transitions!')
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
