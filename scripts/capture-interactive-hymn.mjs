import { chromium } from 'playwright'
import { mkdir } from 'node:fs/promises'

const baseUrl = process.env.BASE_URL || 'http://127.0.0.1:5173'
const output = 'artifacts/hymn-lyrics'
await mkdir(output, { recursive: true })

const browser = await chromium.launch({ headless: true })
try {
  const detailHref = '/practice/mezmur/qa-rights-cleared-hymn'
  const fixture = {
    mezmur_id: '11111111-1111-4111-8111-111111111111',
    slug: 'qa-rights-cleared-hymn',
    title: 'Selam LeKie',
    title_amharic: 'ሰላም ለኪ',
    title_english: 'Peace Be Unto You',
    description: 'A rights-cleared quality-assurance fixture for the interactive reader.',
    lyrics_amharic: 'ቁጥር 1\nሰላም ለኪ ማርያም\nሰላም ለኪ እመ አምላክ\n\nአዝማች\nደስ ይበለን በዛሬው ቀን\nበሰላም እንዘምር',
    lyrics_transliteration: 'Selam leki Maryam\nSelam leki eme Amlak',
    lyrics_english: '', lyrics_geez: '', lyrics_oromo: '', primary_language: 'am', form: 'mezmur',
    singer_id: null, singer_slug: null, singer_name: 'Tewahedo Daily Choir', zemari_id: null,
    youtube_url: null, audio_url: null, image_path: null, image_alt: null, legacy_thumbnail_url: null,
    search_keywords: ['ሰላም', 'Selam'], status: 'published', review_status: 'verified', review_notes: null,
    source_url: null, source_notes: null, structured_lyrics: null, lyrics_language: 'am',
    source_info: 'Tewahedo Daily QA test text', rights_status: 'unknown', external_lyrics_url: null,
    last_verified_at: '2026-10-23T00:00:00Z', related_content: [],
  }

  for (const target of [
    { name: 'desktop', width: 1440, height: 1000 },
    { name: 'mobile-390x844', width: 390, height: 844 },
  ]) {
    const context = await browser.newContext({
      viewport: { width: target.width, height: target.height },
      permissions: ['clipboard-read', 'clipboard-write'],
    })
    await context.addInitScript(() => { Object.defineProperty(navigator, 'share', { value: undefined, configurable: true }) })
    const page = await context.newPage()
    await page.route('**/rest/v1/**', async (route) => {
      const url = route.request().url()
      const body = url.includes('/mezmur_data_import') ? [fixture]
        : url.includes('/mezmur_occasion_links_import') ? [{ occasion_slug: 'fasting' }]
          : []
      await route.fulfill({ status: 200, contentType: 'application/json', body: JSON.stringify(body), headers: { 'content-range': `0-${Math.max(0, body.length - 1)}/${body.length}` } })
    })
    await page.goto(`${baseUrl}${detailHref}`, { waitUntil: 'networkidle', timeout: 45_000 })
    await page.locator('text=Lyrics tools').or(page.locator('text=የመዝሙር መሣሪያዎች')).first().waitFor({ timeout: 20_000 })
    await page.screenshot({ path: `${output}/${target.name}.png`, fullPage: true })

    const overflow = await page.evaluate(() => document.documentElement.scrollWidth - document.documentElement.clientWidth)
    if (overflow > 1) throw new Error(`${target.name} has ${overflow}px horizontal overflow`)

    await page.getByRole('button', { name: /^Copy$|^ቅዳ$/ }).click()
    await page.getByRole('status').filter({ hasText: /Lyrics copied|ግጥሙ ተቀድቷል/ }).waitFor()
    await page.getByRole('button', { name: /^Share$|^አጋራ$/ }).click()
    await page.getByRole('status').filter({ hasText: /Link copied|ማገናኛው ተቀድቷል/ }).waitFor()
    for (const name of [/^Copy$|^ቅዳ$/, /^Share$|^አጋራ$/, /^PDF$/, /^Slides$|^ስላይዶች$/, /^Live$|^በቀጥታ$/]) {
      if (!(await page.getByRole('button', { name }).isEnabled())) throw new Error(`${name} must be available to every reader`)
    }

    const popupPromise = context.waitForEvent('page')
    await page.getByRole('button', { name: 'PDF' }).click()
    const printable = await popupPromise
    await printable.waitForLoadState('domcontentloaded')
    if (!(await printable.locator('body').innerText()).includes('ሰላም ለኪ')) throw new Error('Printable PDF view lost Amharic text')
    await printable.close()

    const live = page.getByRole('button', { name: /^Live$|^በቀጥታ$/ })
    await live.click()
    await page.keyboard.press('ArrowRight')
    await page.screenshot({ path: `${output}/${target.name}-live.png` })
    await page.keyboard.press('Escape')
    await context.close()
  }
  console.log(`captured fixture-backed ${detailHref} to ${output}`)
} finally {
  await browser.close()
}
