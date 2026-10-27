import { chromium } from 'playwright'
import { createServer } from 'vite'
import { mkdir } from 'node:fs/promises'
import { resolve } from 'node:path'

const outputDir = resolve('audit/screenshots-lyrics-correction')
await mkdir(outputDir, { recursive: true })

// Representative hymn fixture with corrected Amharic & standardized Transliteration
const fixture = {
  mezmur_id: '22222222-2222-4222-8222-222222222222',
  slug: 'mariyam-nitsihit-corrected',
  title: 'Mariyam Nitsihit',
  title_amharic: 'ማርያም ንጽሕት',
  title_english: 'Pure Mary',
  description: 'Ethiopian Orthodox Tewahedo Mezmur — Mariyam Nitsihit with standardized lyrics and transliteration.',
  lyrics_amharic: 
`ማርያም ንጽሕት ድንግል ማእምንት
ወላዲተ አምላክ ሰአሊተ ምሕረት ለውሉደ ሰብእ
ሰአሊለነ ኀበ ክርስቶስ ወልድኪ
ይሥረይ ኃጢአተነ ሰአሊለነ ቅድስት

VERSE 1
ማርያም ንጽሕት ድንግል ታማኝ
አምላክን የወለድሽ
የምሕረት አማላጅ ለሰው ልጆች
ወደ ልጅሽ ወደ ክርስቶስ ለምኚልን
ኃጢአታችንን ያስተሰርይልን ዘንድ ቅድስት ሆይ ለምኚልን

VERSE 2
የብርሃን መውጫ የምሥራቅ በር
የሕይወት ምግብ የተገኘብሽ
ንጽሕት አዳራሽ ድንቅ ድንኳን
ቅድስተ ቅዱሳን ማርያም ድንግል`,
  lyrics_transliteration: 
`Maryam nits’ht Dingil maemnt
Weladite amlak sealite mihret lewlude sebe
Sealilene hebe Kristos weldki
Yisrey hat’iatene sealilene Kidist

VERSE 1
Maryam nits’ht Dingil tamagn
Amlakn yeweledesh
Yemihret amalaj lesew lijoch
Wede lijesh wede Kristos leminyilen
Hat’iatachinen yasteseriyilen zend Kidist hoy leminyilen

VERSE 2
Yebrhan mewch’a yemisraq ber
Yehywet migb yetegenyebesh
Nits’ht adarash dinq dnkwan
Kidiste Kidusan Maryam Dingil`,
  lyrics_english: '',
  lyrics_geez: '',
  lyrics_oromo: '',
  primary_language: 'amharic',
  form: 'mezmur',
  singer_id: null,
  singer_slug: null,
  singer_name: 'Tewahedo Daily Choir',
  zemari_id: null,
  youtube_url: 'https://www.youtube.com/watch?v=sample12345',
  audio_url: null,
  image_path: null,
  image_alt: null,
  legacy_thumbnail_url: null,
  search_keywords: ['ማርያም', 'Maryam'],
  status: 'published',
  review_status: 'verified',
  rights_status: 'owned',
  source_url: null,
  source_notes: null,
}

// Start Vite dev server on dedicated port
const server = await createServer({
  server: { host: '127.0.0.1', port: 5188, strictPort: true },
})
await server.listen()

const baseUrl = 'http://127.0.0.1:5188'
console.log(`Server listening on ${baseUrl}`)

const browser = await chromium.launch({ headless: true })

try {
  // 1. Desktop - Amharic View (Parchment Theme)
  {
    const context = await browser.newContext({ viewport: { width: 1440, height: 1000 } })
    const page = await context.newPage()
    await page.route('**/rest/v1/**', async (route) => {
      const url = route.request().url()
      const body = url.includes('/mezmur_data_import') || url.includes('/mezmur_public') ? [fixture] : []
      await route.fulfill({ status: 200, contentType: 'application/json', body: JSON.stringify(body) })
    })

    await page.goto(`${baseUrl}/practice/mezmur/mariyam-nitsihit-corrected`, { waitUntil: 'networkidle', timeout: 30000 })
    await page.waitForSelector('[data-testid="lyrics-reading-experience"]', { timeout: 15000 })
    await page.screenshot({ path: `${outputDir}/01-desktop-amharic-parchment.png`, fullPage: false })
    console.log('✓ Captured 01-desktop-amharic-parchment.png')

    // 2. Desktop - Transliteration View
    const translitTab = page.getByRole('tab', { name: /Transliteration|ላቲን/i })
    if (await translitTab.isVisible()) {
      await translitTab.click()
      await page.waitForTimeout(500)
      await page.screenshot({ path: `${outputDir}/02-desktop-transliteration-view.png`, fullPage: false })
      console.log('✓ Captured 02-desktop-transliteration-view.png')
    }

    // 3. Desktop - Both View (Side-by-side)
    const bothTab = page.getByRole('tab', { name: /Both|ሁለቱም/i })
    if (await bothTab.isVisible()) {
      await bothTab.click()
      await page.waitForTimeout(500)
      await page.screenshot({ path: `${outputDir}/03-desktop-both-paired-view.png`, fullPage: false })
      console.log('✓ Captured 03-desktop-both-paired-view.png')
    }

    // 4. Desktop - Dark Theme
    const darkBtn = page.getByRole('button', { name: /Dark|ጨለማ/i })
    if (await darkBtn.isVisible()) {
      await darkBtn.click()
      await page.waitForTimeout(500)
      await page.screenshot({ path: `${outputDir}/04-desktop-dark-theme.png`, fullPage: false })
      console.log('✓ Captured 04-desktop-dark-theme.png')
    }

    await context.close()
  }

  // 5. Mobile View (iPhone 14 / 390x844)
  {
    const context = await browser.newContext({ viewport: { width: 390, height: 844 }, isMobile: true })
    const page = await context.newPage()
    await page.route('**/rest/v1/**', async (route) => {
      const url = route.request().url()
      const body = url.includes('/mezmur_data_import') || url.includes('/mezmur_public') ? [fixture] : []
      await route.fulfill({ status: 200, contentType: 'application/json', body: JSON.stringify(body) })
    })

    await page.goto(`${baseUrl}/practice/mezmur/mariyam-nitsihit-corrected`, { waitUntil: 'networkidle', timeout: 30000 })
    await page.waitForSelector('[data-testid="lyrics-reading-experience"]', { timeout: 15000 })
    await page.screenshot({ path: `${outputDir}/05-mobile-responsive-view.png`, fullPage: false })
    console.log('✓ Captured 05-mobile-responsive-view.png')

    await context.close()
  }

  console.log('\nAll browser verification screenshots captured successfully!')
} finally {
  await browser.close()
  await server.close()
}
