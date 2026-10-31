import assert from 'node:assert/strict'
import { mkdir } from 'node:fs/promises'
import { chromium } from 'playwright'

const baseUrl = process.env.PREVIEW_URL || 'http://127.0.0.1:4173'
const screenshotDir = process.env.SCREENSHOT_DIR
const legacyBookId = 'fixture-legacy-reader'
const structuredSlug = 'fixture-structured-reader'
const structuredBookId = 'fixture-structured-book'

const legacyBook = {
  id: legacyBookId,
  title: 'Fictional Legacy Reader',
  title_amharic: null,
  author: 'Test Author',
  language: 'en',
  category: 'Test',
  description: 'Synthetic browser-test content.',
  cover_storage_path: null,
  storage_path: null,
  current_version_id: null,
  processing_status: 'ready',
  public_retrieval_enabled: true,
}

const legacySections = [
  { id: 'legacy-section-1', section_order: 0, title: 'Opening Chapter', chapter_reference: 'Chapter 1' },
  { id: 'legacy-section-2', section_order: 1, title: 'Closing Chapter', chapter_reference: 'Chapter 2' },
]

const legacyPassages = [
  {
    id: 'legacy-passage-1',
    section_id: 'legacy-section-1',
    passage_order: 0,
    content: 'This is fictional legacy reader content for deterministic browser testing.',
    locator_label: 'Opening paragraph',
    page_start: 1,
    page_end: 1,
  },
  {
    id: 'legacy-passage-2',
    section_id: 'legacy-section-2',
    passage_order: 1,
    content: 'This is the second fictional passage.',
    locator_label: 'Closing paragraph',
    page_start: 2,
    page_end: 2,
  },
]

const structuredBook = {
  id: structuredBookId,
  slug: structuredSlug,
  title: 'Fictional Structured Reader',
  title_amharic: null,
  title_english: 'Fictional Structured Reader',
  title_geez: null,
  author: 'Test Author',
  language: 'en',
  collection_key: null,
  source_document_name: null,
  publication_status: 'published',
  allow_original_download: false,
  download_storage_path: null,
  description: 'Synthetic structured-reader content.',
}

const structuredSections = [
  {
    id: 'structured-chapter-1',
    book_id: structuredBookId,
    parent_section_id: null,
    level: 1,
    stable_key: 'chapter-one',
    title: 'Chapter One',
    section_order: 0,
    page_start: 1,
    page_end: 1,
  },
  {
    id: 'structured-section-1',
    book_id: structuredBookId,
    parent_section_id: 'structured-chapter-1',
    level: 2,
    stable_key: 'section-one',
    title: 'Section One',
    section_order: 1,
    page_start: 1,
    page_end: 1,
  },
]

const structuredPassages = [
  {
    id: 'structured-passage-1',
    section_id: 'structured-section-1',
    stable_key: 'passage-one',
    passage_order: 0,
    block_type: 'paragraph',
    content: 'This is fictional structured reader content for deterministic browser testing.',
    page_start: 1,
    page_end: 1,
  },
]

const structuredLanguageFixtures = {
  en: {
    title: structuredBook.title,
    content: structuredPassages[0].content,
  },
  am: {
    title: 'ምናባዊ የተዋቀረ አንባቢ',
    content: 'ይህ ለተወሰነ የአሳሽ ሙከራ የተዘጋጀ ምናባዊ ይዘት ነው።',
  },
  gez: {
    title: 'ጽሑፈ ምናባዊ አንባቢ',
    content: 'ዝንቱ ለምርመራ አሳሽ ዝግጁ ዝክረ ጽሑፍ እዩ።',
  },
}

let structuredLanguage = 'en'

function jsonResponse(route, body, status = 200) {
  return route.fulfill({
    status,
    contentType: 'application/json',
    body: JSON.stringify(body),
  })
}

async function installSupabaseMocks(page) {
  await page.route('**/rest/v1/**', async (route) => {
    const request = route.request()
    const url = new URL(request.url())
    const table = url.pathname.split('/').pop()
    const query = url.search

    if (table === 'church_library_books' && query.includes(`id=eq.${legacyBookId}`)) {
      return jsonResponse(route, legacyBook)
    }
    if (table === 'church_library_sections' && query.includes(`book_id=eq.${legacyBookId}`)) {
      return jsonResponse(route, legacySections)
    }
    if (table === 'church_library_passages' && query.includes(`book_id=eq.${legacyBookId}`)) {
      return jsonResponse(route, legacyPassages)
    }
    if (table === 'church_library_books' && query.includes(`slug=eq.${structuredSlug}`)) {
      return jsonResponse(route, {
        ...structuredBook,
        title: structuredLanguageFixtures[structuredLanguage].title,
        language: structuredLanguage,
      })
    }
    if (table === 'church_library_sections' && query.includes(`book_id=eq.${structuredBookId}`)) {
      return jsonResponse(route, structuredSections)
    }
    if (table === 'church_library_passages' && query.includes(`book_id=eq.${structuredBookId}`)) {
      return jsonResponse(route, [{
        ...structuredPassages[0],
        content: structuredLanguageFixtures[structuredLanguage].content,
      }])
    }

    return jsonResponse(route, [])
  })

  await page.route('**/auth/v1/**', (route) => jsonResponse(route, { user: null }))
}

async function assertNoOverflow(page) {
  assert.equal(
    await page.evaluate(() => document.documentElement.scrollWidth <= document.documentElement.clientWidth + 2),
    true,
    `${page.url()} has horizontal overflow`,
  )
}

async function assertNoClipping(page) {
  const clipped = await page.evaluate(() => {
      const elements = [...document.querySelectorAll('h1, h2, h3, p, button, a')]
      return elements.flatMap((element) => {
        const rect = element.getBoundingClientRect()
        if (rect.width === 0 || rect.height === 0) return []
        return rect.left >= -1 && rect.right <= window.innerWidth + 1
          ? []
          : [{ tag: element.tagName, text: element.textContent?.trim().slice(0, 40), left: rect.left, right: rect.right }]
      })
    })
  assert.deepEqual(clipped, [], `${page.url()} contains clipped text or controls: ${JSON.stringify(clipped)}`)
}

async function assertFocusInside(page, panel) {
  assert.equal(
    await page.evaluate((element) => element.contains(document.activeElement), await panel.elementHandle()),
    true,
    'focus did not move inside the open panel',
  )
}

async function testLegacy(page, width) {
  const route = `${baseUrl}/library/${legacyBookId}?passage=legacy-passage-1`
  await page.goto(route, { waitUntil: 'networkidle' })
  await assertNoOverflow(page)
  await assert(page.getByRole('heading', { name: legacyBook.title }).first().isVisible(), 'legacy content did not render')
  await assert(page.getByText(legacyPassages[0].content).isVisible(), 'legacy passage did not render')

  const contents = page.getByRole('button', { name: /table of contents/i })
  if (width < 900 && await contents.count() === 0) {
    throw new Error(`legacy contents trigger missing; buttons=${JSON.stringify(await page.locator('button').allTextContents())}`)
  }
  await assert.equal(await page.getByText('library.toc', { exact: true }).count(), 0)
  await assert.equal(await page.getByText('library.tableOfContents', { exact: true }).count(), 0)
  if (width < 900) await contents.click()
  const panel = page.locator('#legacy-library-contents')
  await assert.equal(await panel.getAttribute('role'), width < 900 ? 'dialog' : null)
  if (width < 900) {
    await assertFocusInside(page, panel)
    await page.keyboard.press('Tab')
    await assertFocusInside(page, panel)
    await page.keyboard.press('Shift+Tab')
    await assertFocusInside(page, panel)
    await page.keyboard.press('Escape')
    await assert.equal(await page.locator('#legacy-library-contents').getAttribute('class').then((value) => value?.includes('sidebarOpen')), false)
    await assert.equal(await page.evaluate(() => document.activeElement?.getAttribute('aria-label')), await contents.getAttribute('aria-label'))
    await contents.click()
    await page.mouse.click(width - 5, 450)
    await assert.equal(await page.evaluate(() => document.activeElement?.getAttribute('aria-label')), await contents.getAttribute('aria-label'))
    await contents.click()
    await page.mouse.click(width - 5, 450)
    await assert.equal(await panel.isVisible(), false)
  } else {
    await assert.equal(await page.getByRole('button', { name: 'Opening Chapter' }).isVisible(), true)
  }
}

async function testStructured(page, width, language) {
  structuredLanguage = language
  const route = `${baseUrl}/library/read/${structuredSlug}/chapter-one`
  await page.goto(route, { waitUntil: 'networkidle' })
  await assertNoOverflow(page)
  await assertNoClipping(page)
  const fixture = structuredLanguageFixtures[language]
  await assert(page.getByRole('heading', { name: fixture.title }).isVisible(), `${language} structured title did not render`)
  await assert(page.getByText(fixture.content).isVisible(), `${language} structured passage did not render`)
  await assert.equal(await page.locator('article[lang]').getAttribute('lang'), language)
  if (language !== 'en') {
    await assert.match(
      await page.locator('article[lang]').evaluate((element) => getComputedStyle(element).fontFamily),
      /Noto Sans Ethiopic|Abyssinica SIL|Nyala/,
    )
  }

  const contents = page.locator('button[aria-controls="cl-contents-panel"]')
  await contents.click()
  const contentsPanel = page.locator('#cl-contents-panel')
  if (width < 900) {
    await assert.equal(await contentsPanel.getAttribute('role'), 'dialog')
    await assertFocusInside(page, contentsPanel)
    await page.keyboard.press('Tab')
    await assertFocusInside(page, contentsPanel)
    await page.keyboard.press('Shift+Tab')
    await assertFocusInside(page, contentsPanel)
    await page.keyboard.press('Escape')
    await assert.equal(await page.evaluate(() => document.activeElement?.getAttribute('aria-controls')), 'cl-contents-panel')
  } else {
    await assert.equal(await page.getByRole('link', { name: 'Chapter One' }).isVisible(), true)
  }

  const bookmarks = page.locator('button[aria-controls="cl-bookmarks-panel"]')
  await bookmarks.click()
  const bookmarkPanel = page.locator('#cl-bookmarks-panel')
  await assert.equal(await bookmarkPanel.getAttribute('role'), 'dialog')
  if (width < 900) {
    await assertFocusInside(page, bookmarkPanel)
    await page.keyboard.press('Tab')
    await assertFocusInside(page, bookmarkPanel)
    await page.keyboard.press('Shift+Tab')
    await assertFocusInside(page, bookmarkPanel)
    await page.locator('#cl-bookmarks-panel > div:first-child > button').click()
    await assert.equal(await page.evaluate(() => document.activeElement?.getAttribute('aria-controls')), 'cl-bookmarks-panel')
    await bookmarks.click()
    await page.keyboard.press('Escape')
    await assert.equal(await page.evaluate(() => document.activeElement?.getAttribute('aria-controls')), 'cl-bookmarks-panel')
    await assert.equal(await page.locator('#cl-bookmarks-panel').count(), 0)
  } else {
    await assert.equal(await bookmarkPanel.isVisible(), true)
    await assert.equal(await bookmarkPanel.locator('h2').isVisible(), true)
  }

  if (width < 900 && await page.locator('#cl-bookmarks-panel').count()) {
    await page.locator('#cl-bookmarks-panel > div:first-child > button').click()
  }
  const themeButton = page.getByRole('toolbar', { name: 'Reader tools' }).locator('button').filter({ has: page.locator('svg') })
  const beforeTheme = await page.locator('article').evaluate((element) => {
    let node = element.parentElement?.parentElement?.parentElement
    return node?.className || ''
  })
  await themeButton.click()
  const afterTheme = await page.locator('article').evaluate((element) => {
    let node = element.parentElement?.parentElement?.parentElement
    return node?.className || ''
  })
  await assert.notEqual(afterTheme, beforeTheme)
}

async function main() {
  const browser = await chromium.launch({ headless: true })
  const failures = []

  if (screenshotDir) await mkdir(screenshotDir, { recursive: true })
  for (const width of [320, 390, 430, 1440]) {
    const page = await browser.newPage({ viewport: { width, height: 900 }, isMobile: width === 390 })
    const consoleErrors = []
    page.on('console', (message) => {
      if (message.type() === 'error') consoleErrors.push(`${message.text()} (${message.location().url})`)
    })
    await installSupabaseMocks(page)
    try {
      await testLegacy(page, width)
    for (const language of ['en', 'am', 'gez']) {
      await testStructured(page, width, language)
    }
    if (screenshotDir) {
      await page.screenshot({ path: `${screenshotDir}/reader-${width}.png`, fullPage: true })
    }
      assert.deepEqual(consoleErrors, [], `unexpected console errors at ${width}px: ${consoleErrors.join(' | ')}`)
      console.log(`PASS ${width}px legacy and structured readers`)
    } catch (error) {
      failures.push(`${width}px: ${error.message}`)
      console.error(`FAIL ${width}px: ${error.message}`)
    } finally {
      await page.close()
    }
  }

  await browser.close()
  if (failures.length) {
    console.error(failures.join('\n'))
    process.exit(1)
  }
  console.log('Public Church Library reader interaction checks passed')
}

main().catch((error) => {
  console.error(error)
  process.exit(1)
})
