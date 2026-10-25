import assert from 'node:assert/strict'
import { chromium } from 'playwright'
import { createServer } from 'vite'

process.env.VITE_SUPABASE_URL = 'https://language-filter-test.supabase.co'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_language_filter_test'

const server = await createServer({ server: { host: '127.0.0.1', port: 4187, strictPort: true } })
await server.listen()
let browser
try {
  browser = await chromium.launch()
  for (const width of [375, 1280]) {
    const page = await browser.newPage({ viewport: { width, height: 900 } })
    const errors = []
    page.on('pageerror', (error) => errors.push(error.message))

    // 1. Initial page displays category cards
    await page.goto('http://127.0.0.1:4187/practice?theme=night')
    const group = page.getByRole('group', { name: /filter hymns by language/i })
    await group.waitFor()

    const categories = [
      'Holidays & Feasts',
      'Angels & Saints',
      'Virgin Mary',
      'Jesus Christ',
      'Repentance & Fasting',
      'English Mezmur',
      'Sacraments & Church Life',
      'Praise & General',
      'Zemari / Singers',
    ]

    for (const cat of categories) {
      await page.getByRole('link', { name: new RegExp(cat, 'i') }).waitFor()
    }

    // 2. Language selection keeps category cards visible (NOT replaced by search results)
    const expectedLanguages = [
      ['Amharic / አማርኛ', 'am'],
      ['Tigrinya / ትግርኛ', 'ti'],
      ['Oromo / Afaan Oromoo', 'om'],
      ['Geʽez / ግዕዝ', 'gez'],
      ['English', 'en'],
      ['All', 'all'],
    ]

    for (const [name, code] of expectedLanguages) {
      const button = group.getByRole('button', { name, exact: true })
      await button.click()
      if (code === 'all') {
        await page.waitForURL((url) => !url.searchParams.has('language') && url.searchParams.get('theme') === 'night')
      } else {
        await page.waitForURL((url) => url.searchParams.get('language') === code && url.searchParams.get('theme') === 'night')
      }
      const btnsInfo = await page.evaluate(() => ({
        url: window.location.href,
        btns: Array.from(document.querySelectorAll('[role="group"] button')).map((b) => ({
          text: b.textContent?.trim(),
          pressed: b.getAttribute('aria-pressed'),
        })),
      }))
      console.log(`[width ${width}] buttons state for ${name}:`, JSON.stringify(btnsInfo))
      await page.waitForFunction(
        ([n]) => {
          const btns = Array.from(document.querySelectorAll('[role="group"] button'))
          const target = btns.find((b) => b.textContent?.trim() === n)
          return target && target.getAttribute('aria-pressed') === 'true'
        },
        [name],
        { timeout: 5000 },
      )
      console.log(`[width ${width}] Pressed verified for ${name} (${code})`)

      // Assert category cards are STILL visible under this language!
      for (const cat of ['Virgin Mary', 'Jesus Christ', 'Holidays & Feasts', 'Angels & Saints', 'Zemari / Singers']) {
        assert.ok(
          await page.getByRole('link', { name: new RegExp(cat, 'i') }).count() > 0,
          `Category card "${cat}" must remain visible after selecting language "${name}"`,
        )
      }

      // Ensure "Search results" heading is NOT present in browse mode!
      assert.equal(
        await page.getByText(/Search results|መዝሙር ተገኝቷል/i).count(),
        0,
        `Selecting language "${name}" must not activate search results mode`,
      )
    }

    // 3. Test Tigrinya selection + Category navigation
    await group.getByRole('button', { name: 'Tigrinya / ትግርኛ', exact: true }).click()
    await page.waitForURL((url) => url.searchParams.get('language') === 'ti')

    const maryCard = page.getByRole('link', { name: /Virgin Mary/i })
    const cardHref = await maryCard.getAttribute('href')
    assert.match(cardHref || '', /language=ti/, 'Category card link must preserve language query')

    // 4. Test Search Mode activation when searching
    const searchInput = page.getByRole('combobox', { name: /search/i })
    await searchInput.fill('ማርያም')
    await page.waitForURL((url) => url.searchParams.get('q') === 'ማርያም' && url.searchParams.get('language') === 'ti')

    // In Search Mode, search controls are active and clear button exists
    const clearBtn = page.getByRole('button', { name: /clear/i })
    await clearBtn.waitFor()

    // 5. Clearing search restores Browse mode and retains selected language
    await clearBtn.click()
    await page.waitForURL((url) => !url.searchParams.has('q') && url.searchParams.get('language') === 'ti')

    // Category cards restored!
    await page.getByRole('link', { name: /Virgin Mary/i }).waitFor()

    // 6. Test direct /hymns?language=ti URL route
    await page.goto('http://127.0.0.1:4187/hymns?language=ti')
    await page.getByRole('link', { name: /Virgin Mary/i }).waitFor()
    const tiButton = page.getByRole('button', { name: 'Tigrinya / ትግርኛ', exact: true })
    assert.equal(await tiButton.getAttribute('aria-pressed'), 'true')

    // No horizontal overflow
    assert.equal(await page.evaluate(() => document.documentElement.scrollWidth > document.documentElement.clientWidth + 2), false)
    assert.deepEqual(errors, [])
    await page.close()
  }
  console.log('PASS: Category cards restored on homepage, language chips keep Browse mode active, URL query preserved, search toggles, and mobile/desktop responsive')
} finally {
  await browser?.close()
  await server.close()
}
