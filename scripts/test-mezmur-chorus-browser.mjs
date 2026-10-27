import { chromium } from 'playwright'
import fs from 'fs'
import path from 'path'

const SCREENSHOT_DIR = 'artifacts/mezmur-chorus-cleanup'
fs.mkdirSync(SCREENSHOT_DIR, { recursive: true })

async function runBrowserTest() {
  console.log('=== TESTING MEZMUR LYRICS PRESENTATION IN BROWSER ===\n')

  const cleanedRecords = JSON.parse(
    fs.readFileSync('supabase/mezmur-cleanup/CLEANED_MEZMUR_LYRICS.json', 'utf8')
  )
  const sampleMezmur = cleanedRecords.find((r) => r.slug === 'altewengem-geta')
  if (!sampleMezmur) {
    throw new Error('Could not find altewengem-geta in cleaned records')
  }

  const browser = await chromium.launch({ headless: true })
  const context = await browser.newContext({
    viewport: { width: 1280, height: 900 },
  })

  const envFile = fs.readFileSync('.env.local', 'utf8')
  const supabaseUrl = envFile.match(/^VITE_SUPABASE_URL=(.+)$/m)?.[1]?.trim()

  if (supabaseUrl) {
    await context.route(`${supabaseUrl}/**`, async (route) => {
      const req = route.request()
      const url = new URL(req.url())

      // If querying mezmur_public for altewengem-geta, return the cleaned record
      if (url.pathname.includes('/rest/v1/mezmur_public')) {
        const fullRecord = {
          ...sampleMezmur,
          singer_name: 'Zemari Demo',
          singer_slug: 'zemari-demo',
          youtube_url: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
          created_at: new Date().toISOString(),
          updated_at: new Date().toISOString(),
          rights_status: 'public_domain',
        }
        return route.fulfill({
          status: 200,
          contentType: 'application/json',
          headers: { 'content-range': '0-0/1' },
          body: JSON.stringify([fullRecord]),
        })
      }

      return route.continue()
    })
  }

  const page = await context.newPage()

  try {
    console.log('Navigating to http://localhost:5173/practice/mezmur/altewengem-geta...')
    await page.goto('http://localhost:5173/practice/mezmur/altewengem-geta', {
      waitUntil: 'networkidle',
    })
    await page.waitForTimeout(1000)

    // Verify title
    const heading = await page.textContent('h1')
    console.log('Page heading:', heading)
    assert(heading && heading.includes('አልተወኝም ጌታ'), 'Mezmur title rendered')

    // Inspect rendered sections inside reader
    const sections = page.locator('article')
    const count = await sections.count()
    console.log(`Rendered lyric sections count: ${count}`)
    assert(count >= 7, 'Rendered chorus + all 6 verses')

    // Section 1: Opening Chorus (MUST have NO heading label)
    const sec1 = sections.nth(0)
    const sec1Label = await sec1.locator('p[class*="sectionLabel"]').count()
    assert(sec1Label === 0, 'Section 1 (Chorus) has NO heading label')

    const sec1Text = await sec1.textContent()
    assert(sec1Text.includes('አልተወኝም ጌታ ለካስ ይወደኛል'), 'Section 1 contains opening chorus lyrics')
    console.log('✓ Section 1 verified: Opening chorus without heading')

    // Section 2: Verse 1
    const sec2 = sections.nth(1)
    const sec2Label = await sec2.locator('p[class*="sectionLabel"]').textContent()
    assert(sec2Label && sec2Label.includes('VERSE 1'), 'Section 2 has VERSE 1 heading')
    console.log(`✓ Section 2 label: "${sec2Label.trim()}"`)

    // Section 3: Verse 2
    const sec3 = sections.nth(2)
    const sec3Label = await sec3.locator('p[class*="sectionLabel"]').textContent()
    assert(sec3Label && sec3Label.includes('VERSE 2'), 'Section 3 has VERSE 2 heading')
    console.log(`✓ Section 3 label: "${sec3Label.trim()}"`)

    // Section 7: Verse 6 (Last Verse)
    const sec7 = sections.nth(6)
    const sec7Label = await sec7.locator('p[class*="sectionLabel"]').textContent()
    assert(sec7Label && sec7Label.includes('VERSE 6'), 'Section 7 has VERSE 6 heading')
    console.log(`✓ Section 7 label: "${sec7Label.trim()}"`)

    // Verify no trailing chorus
    if (count > 7) {
      const extraText = await sections.nth(7).textContent()
      console.log('Unexpected 8th section:', extraText)
      assert(false, 'Hymn should have ended with Verse 6 without duplicate chorus at end')
    }

    // Capture screenshot
    await page.screenshot({
      path: path.join(SCREENSHOT_DIR, '01-cleaned-mezmur-continuous-view.png'),
    })
    console.log('✓ Screenshot saved to artifacts/mezmur-chorus-cleanup/01-cleaned-mezmur-continuous-view.png')

    // Copy to brain artifact directory if possible
    try {
      fs.copyFileSync(
        path.join(SCREENSHOT_DIR, '01-cleaned-mezmur-continuous-view.png'),
        'C:/Users/eskew/.gemini/antigravity/brain/c15877f1-e414-4f62-a04a-eba2ca2e35e8/01-cleaned-mezmur-continuous-view.png'
      )
    } catch {}

    console.log('\n=== BROWSER UI PRESENTATION TEST PASSED 100% ===\n')
  } catch (err) {
    console.error('Browser Test Failed:', err)
    await page.screenshot({ path: path.join(SCREENSHOT_DIR, 'failure.png') })
    throw err
  } finally {
    await browser.close()
  }
}

function assert(cond, msg) {
  if (!cond) {
    console.error(`✗ FAIL: ${msg}`)
    throw new Error(msg)
  }
  console.log(`✓ PASS: ${msg}`)
}

runBrowserTest()
