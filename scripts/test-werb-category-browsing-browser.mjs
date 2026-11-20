/**
 * Real PublicMezmurLibrary / BrowseGroup / Collection / Section / Detail + Router + hymnBrowse.ts;
 * fake Supabase PostgREST, external requests blocked.
 */
import assert from 'node:assert/strict'
import { createServer } from 'vite'
import react from '@vitejs/plugin-react'
import { chromium } from 'playwright'

const testPort = Number(process.env.WERB_TEST_PORT || 5198)
const base = `http://127.0.0.1:${testPort}`
const endpoint = 'https://werb-fixture.invalid'

const entry = `import React from 'react';
import { createRoot } from 'react-dom/client';
import { createBrowserRouter, RouterProvider } from 'react-router-dom';
import App from '/src/App.tsx';
import { LocaleProvider } from '/src/lib/i18n/locale.tsx';
import { ThemeProvider } from '/src/components/layout/ThemeProvider.tsx';
import '/src/index.css';
const router = createBrowserRouter([{ path: '*', element: <App /> }]);
createRoot(document.getElementById('root')).render(
  <ThemeProvider><LocaleProvider><RouterProvider router={router} /></LocaleProvider></ThemeProvider>
);`

const plugin = {
  name: 'werb-offline-fixtures',
  enforce: 'pre',
  resolveId(source) {
    if (source === '/__werb-entry.jsx') return source
  },
  load(id) {
    if (id === '/__werb-entry.jsx') return entry
  },
  configureServer(vite) {
    vite.middlewares.use(async (req, res, next) => {
      if (!req.headers.accept?.includes('text/html')) return next()
      res.setHeader('Content-Type', 'text/html')
      res.end(
        await vite.transformIndexHtml(
          req.url,
          '<!doctype html><html><head><meta name="viewport" content="width=device-width, initial-scale=1"></head><body><div id="root"></div><script type="module" src="/__werb-entry.jsx"></script></body></html>',
        ),
      )
    })
  },
}

// Synthetic catalog:
// - 2 published Werbs in Virgin Mary (one 'werb', one 'wereb' alias, both 'am')
// - 1 published Werb in Gena occasion ('ወረብ' alias, 'gez')
// - 1 published unclassified Werb ('werb', 'am', no category/occasion link)
// - 1 unpublished draft Werb in Virgin Mary (must NOT appear)
// - 2 published ordinary Mezmurs in Virgin Mary & Holy Trinity (must NOT appear in Werb mode)
const mezmurs = [
  {
    mezmur_id: 'w-mary-1',
    slug: 'werb-mary-one',
    title: 'Werb Mary One',
    title_amharic: 'የማርያም ወረብ አንድ',
    title_english: 'Werb Mary One',
    primary_language: 'am',
    form: 'werb',
    status: 'published',
    singer_name: 'Zemari Dawit',
    zemari_id: 'z-1',
    singer_slug: 'zemari-dawit',
    image_path: null,
    legacy_thumbnail_url: null,
    audio_url: null,
    youtube_url: null,
    lyrics_amharic: 'የማርያም ወረብ ግጥም',
    lyrics_english: 'Mary Werb lyric',
    lyrics_transliteration: null,
    deleted_at: null,
  },
  {
    mezmur_id: 'w-mary-2',
    slug: 'werb-mary-two',
    title: 'Werb Mary Two',
    title_amharic: 'የማርያም ወረብ ሁለት',
    title_english: 'Werb Mary Two',
    primary_language: 'am',
    form: 'wereb',
    status: 'published',
    singer_name: 'Zemari Dawit',
    zemari_id: 'z-1',
    singer_slug: 'zemari-dawit',
    image_path: null,
    legacy_thumbnail_url: null,
    audio_url: null,
    youtube_url: null,
    lyrics_amharic: 'የማርያም ወረብ ሁለት ግጥም',
    lyrics_english: 'Mary Werb two lyric',
    lyrics_transliteration: null,
    deleted_at: null,
  },
  {
    mezmur_id: 'w-gena-1',
    slug: 'werb-gena-one',
    title: 'Werb Gena One',
    title_amharic: 'የገና ወረብ አንድ',
    title_english: 'Werb Gena One',
    primary_language: 'gez',
    form: 'ወረብ',
    status: 'published',
    singer_name: null,
    zemari_id: null,
    singer_slug: null,
    image_path: null,
    legacy_thumbnail_url: null,
    audio_url: null,
    youtube_url: null,
    lyrics_amharic: 'የገና ወረብ ግጥም',
    lyrics_english: 'Gena Werb lyric',
    lyrics_transliteration: null,
    deleted_at: null,
  },
  {
    mezmur_id: 'w-unclassified',
    slug: 'werb-unclassified',
    title: 'Unclassified Werb Solo',
    title_amharic: 'ያልተመደበ ወረብ',
    title_english: 'Unclassified Werb Solo',
    primary_language: 'am',
    form: 'werb',
    status: 'published',
    singer_name: null,
    zemari_id: null,
    singer_slug: null,
    image_path: null,
    legacy_thumbnail_url: null,
    audio_url: null,
    youtube_url: null,
    lyrics_amharic: 'ያልተመደበ ወረብ ግጥም',
    lyrics_english: 'Unclassified Werb lyric',
    lyrics_transliteration: null,
    deleted_at: null,
  },
  {
    mezmur_id: 'w-draft',
    slug: 'werb-draft-hidden',
    title: 'Draft Werb Hidden',
    title_amharic: 'ረቂቅ ወረብ',
    title_english: 'Draft Werb Hidden',
    primary_language: 'am',
    form: 'werb',
    status: 'draft',
    singer_name: null,
    zemari_id: null,
    singer_slug: null,
    image_path: null,
    legacy_thumbnail_url: null,
    audio_url: null,
    youtube_url: null,
    lyrics_amharic: 'ረቂቅ',
    lyrics_english: null,
    lyrics_transliteration: null,
    deleted_at: null,
  },
  {
    mezmur_id: 'm-mary-1',
    slug: 'ordinary-mary-mezmur',
    title: 'Ordinary Mary Mezmur',
    title_amharic: 'መዝሙር ማርያም',
    title_english: 'Ordinary Mary Mezmur',
    primary_language: 'am',
    form: 'mezmur',
    status: 'published',
    singer_name: 'Zemari Dawit',
    zemari_id: 'z-1',
    singer_slug: 'zemari-dawit',
    image_path: null,
    legacy_thumbnail_url: null,
    audio_url: null,
    youtube_url: null,
    lyrics_amharic: 'መዝሙር ግጥም',
    lyrics_english: 'Ordinary Mezmur lyric',
    lyrics_transliteration: null,
    deleted_at: null,
  },
  {
    mezmur_id: 'm-trinity-1',
    slug: 'ordinary-trinity-mezmur',
    title: 'Ordinary Trinity Mezmur',
    title_amharic: 'የሥላሴ መዝሙር',
    title_english: 'Ordinary Trinity Mezmur',
    primary_language: 'am',
    form: 'mezmur',
    status: 'published',
    singer_name: null,
    zemari_id: null,
    singer_slug: null,
    image_path: null,
    legacy_thumbnail_url: null,
    audio_url: null,
    youtube_url: null,
    lyrics_amharic: 'የሥላሴ መዝሙር',
    lyrics_english: 'Trinity Mezmur lyric',
    lyrics_transliteration: null,
    deleted_at: null,
  },
]

const categoryLinks = [
  { mezmur_id: 'w-mary-1', mezmur_import_id: 'w-mary-1', mezmur_slug: 'werb-mary-one', category_slug: 'virgin-mary' },
  { mezmur_id: 'w-mary-2', mezmur_import_id: 'w-mary-2', mezmur_slug: 'werb-mary-two', category_slug: 'virgin-mary' },
  { mezmur_id: 'w-draft', mezmur_import_id: 'w-draft', mezmur_slug: 'werb-draft-hidden', category_slug: 'virgin-mary' },
  { mezmur_id: 'm-mary-1', mezmur_import_id: 'm-mary-1', mezmur_slug: 'ordinary-mary-mezmur', category_slug: 'virgin-mary' },
  { mezmur_id: 'm-trinity-1', mezmur_import_id: 'm-trinity-1', mezmur_slug: 'ordinary-trinity-mezmur', category_slug: 'holy-trinity' },
]

const occasionLinks = [
  { mezmur_id: 'w-gena-1', mezmur_import_id: 'w-gena-1', mezmur_slug: 'werb-gena-one', occasion_slug: 'gena' },
]

const collections = [
  { collection_id: 'c-1', collection_slug: 'virgin-mary', title: 'Virgin Mary', title_amharic: 'እመቤታችን ማርያም', description: '', description_amharic: '', image_path: null, image_alt: '', collection_type: 'category_group', sort_order: 20, is_featured: true, status: 'published', deleted_at: null },
  { collection_id: 'c-2', collection_slug: 'holy-trinity', title: 'Holy Trinity', title_amharic: 'ቅድስት ሥላሴ', description: '', description_amharic: '', image_path: null, image_alt: '', collection_type: 'category_group', sort_order: 25, is_featured: true, status: 'published', deleted_at: null },
  { collection_id: 'c-3', collection_slug: 'holidays-feasts', title: 'Holidays & Feasts', title_amharic: 'በዓላት እና አጽዋማት', description: '', description_amharic: '', image_path: null, image_alt: '', collection_type: 'occasion_group', sort_order: 10, is_featured: true, status: 'published', deleted_at: null },
]

const sections = [
  { section_id: 's-1', section_slug: 'virgin-mary', collection_slug: 'virgin-mary', parent_section_slug: null, title: 'Virgin Mary Hymns', title_amharic: 'የእመቤታችን መዝሙራት', description: '', description_amharic: '', image_path: null, image_alt: '', section_type: 'category', source_entity_type: 'category', source_entity_slug: 'virgin-mary', sort_order: 1, is_featured: true, status: 'published', deleted_at: null },
]

const sectionLinks = [
  { section_slug: 'virgin-mary', mezmur_slug: 'werb-mary-one', mezmur_id: 'w-mary-1', mezmur_import_id: 'w-mary-1', sort_order: 1 },
  { section_slug: 'virgin-mary', mezmur_slug: 'werb-mary-two', mezmur_id: 'w-mary-2', mezmur_import_id: 'w-mary-2', sort_order: 2 },
  { section_slug: 'virgin-mary', mezmur_slug: 'ordinary-mary-mezmur', mezmur_id: 'm-mary-1', mezmur_import_id: 'm-mary-1', sort_order: 3 },
]

const zemaris = [
  { id: 'z-1', slug: 'zemari-dawit', name: 'Zemari Dawit', name_amharic: 'ዘማሪ ዳዊት', bio: '', image_path: null, image_alt: '', youtube_url: null, sort_order: 1, is_featured: true, status: 'published', published_mezmur_count: 3, mezmur_count: 3, updated_at: '2026-11-01T00:00:00Z', deleted_at: null },
]

function filterInParam(val, rowVal) {
  const m = val?.match(/^in\.\((.*)\)$/)
  if (!m) return true
  const items = m[1].split(',').map((s) => s.replace(/^"|"$/g, ''))
  return items.includes(String(rowVal ?? ''))
}

const server = await createServer({
  configFile: false,
  envDir: false,
  plugins: [plugin, react()],
  cacheDir: 'node_modules/.vite-werb-tests',
  logLevel: 'error',
  optimizeDeps: { noDiscovery: true, include: ['react', 'react-dom/client', 'react-router-dom'] },
  resolve: { dedupe: ['react', 'react-dom'] },
  server: { host: '127.0.0.1', port: testPort, strictPort: true, hmr: false },
  define: {
    'import.meta.env.VITE_SUPABASE_URL': JSON.stringify(endpoint),
    'import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY': JSON.stringify('synthetic-public-key'),
  },
})

let browser
let passed = 0
let failed = 0
const run = async (name, fn) => {
  try {
    await fn()
    passed++
    console.log(`PASS ${name}`)
  } catch (error) {
    failed++
    console.error(`FAIL ${name}: ${error.message}`)
  }
}

try {
  await server.listen()
  browser = await chromium.launch()
  const context = await browser.newContext({ viewport: { width: 1440, height: 900 }, serviceWorkers: 'block' })
  await context.addInitScript(() => {
    localStorage.setItem('tewahedo-daily-locale', 'en')
  })
  await context.route('**/*', async (route) => {
    const request = route.request()
    const url = new URL(request.url())
    if (url.origin === base) return route.continue()
    if (url.origin !== endpoint) return route.abort()
    const cors = { 'access-control-allow-origin': '*', 'access-control-allow-headers': '*', 'access-control-allow-methods': '*', 'access-control-expose-headers': 'content-range' }
    const reply = (body, status = 200, headers = {}) => route.fulfill({ status, contentType: 'application/json', headers: { ...cors, ...headers }, body: JSON.stringify(body) })
    if (request.method() === 'OPTIONS') return reply(null)

    const p = url.pathname
    if (p.endsWith('/mezmur_public')) {
      let rows = mezmurs.filter((m) => m.status === 'published' && !m.deleted_at)
      const slugParam = url.searchParams.get('slug')
      if (slugParam?.startsWith('eq.')) rows = rows.filter((r) => r.slug === slugParam.replace(/^eq\./, ''))
      else if (slugParam?.startsWith('in.(')) rows = rows.filter((r) => filterInParam(slugParam, r.slug))
      if (url.searchParams.has('primary_language') && url.searchParams.get('primary_language').startsWith('in.(')) rows = rows.filter((r) => filterInParam(url.searchParams.get('primary_language'), r.primary_language))
      if (url.searchParams.has('form') && url.searchParams.get('form').startsWith('in.(')) rows = rows.filter((r) => filterInParam(url.searchParams.get('form'), r.form))
      if (url.searchParams.get('zemari_id')?.startsWith('eq.')) rows = rows.filter((r) => r.zemari_id === url.searchParams.get('zemari_id').replace(/^eq\./, ''))
      const or = url.searchParams.get('or')
      if (or) {
        const needle = or.match(/ilike\.%([^%]+)%/)?.[1]?.toLowerCase() || ''
        if (needle) rows = rows.filter((r) => `${r.title} ${r.title_amharic} ${r.lyrics_amharic}`.toLowerCase().includes(needle))
      }
      const total = rows.length
      const offset = Number(url.searchParams.get('offset') || 0)
      const limit = url.searchParams.has('limit') ? Number(url.searchParams.get('limit')) : total
      const paged = rows.slice(offset, offset + limit)
      const rangeHeader = total === 0 ? '*/0' : `${offset}-${offset + Math.max(0, paged.length - 1)}/${total}`
      return reply(paged, 200, request.headers().prefer?.includes('count=exact') ? { 'content-range': rangeHeader } : {})
    }
    if (p.endsWith('/mezmur_category_links_public')) {
      let rows = categoryLinks.slice()
      const cat = url.searchParams.get('category_slug')
      if (cat?.startsWith('in.(')) rows = rows.filter((r) => filterInParam(cat, r.category_slug))
      else if (cat?.startsWith('eq.')) rows = rows.filter((r) => r.category_slug === cat.replace(/^eq\./, ''))
      return reply(rows)
    }
    if (p.endsWith('/mezmur_occasion_links_public')) {
      let rows = occasionLinks.slice()
      const occ = url.searchParams.get('occasion_slug')
      if (occ?.startsWith('in.(')) rows = rows.filter((r) => filterInParam(occ, r.occasion_slug))
      else if (occ?.startsWith('eq.')) rows = rows.filter((r) => r.occasion_slug === occ.replace(/^eq\./, ''))
      return reply(rows)
    }
    if (p.endsWith('/mezmur_collections_import')) {
      let rows = collections.slice()
      if (url.searchParams.get('collection_slug')?.startsWith('eq.')) rows = rows.filter((r) => r.collection_slug === url.searchParams.get('collection_slug').replace(/^eq\./, ''))
      return reply(rows)
    }
    if (p.endsWith('/mezmur_sections_import')) {
      let rows = sections.slice()
      if (url.searchParams.get('collection_slug')?.startsWith('eq.')) rows = rows.filter((r) => r.collection_slug === url.searchParams.get('collection_slug').replace(/^eq\./, ''))
      if (url.searchParams.get('section_slug')?.startsWith('eq.')) rows = rows.filter((r) => r.section_slug === url.searchParams.get('section_slug').replace(/^eq\./, ''))
      return reply(rows)
    }
    if (p.endsWith('/mezmur_section_links_import')) {
      let rows = sectionLinks.slice()
      if (url.searchParams.get('section_slug')?.startsWith('in.(')) rows = rows.filter((r) => filterInParam(url.searchParams.get('section_slug'), r.section_slug))
      if (url.searchParams.get('section_slug')?.startsWith('eq.')) rows = rows.filter((r) => r.section_slug === url.searchParams.get('section_slug').replace(/^eq\./, ''))
      return reply(rows)
    }
    if (p.endsWith('/zemaris_with_counts') || p.endsWith('/zemaris')) {
      return reply(zemaris, 200, request.headers().prefer?.includes('count=exact') ? { 'content-range': `0-${zemaris.length - 1}/${zemaris.length}` } : {})
    }
    return reply([])
  })

  const page = await context.newPage()
  page.setDefaultTimeout(12000)

  await run('All Hymns -> Werb preserves category & occasion tabs and accurate Werb counts', async () => {
    await page.goto(`${base}/hymns`)
    await page.getByRole('button', { name: 'All Hymns', exact: true }).waitFor()
    await page.getByRole('tab', { name: 'Categories', exact: true }).waitFor()
    // All Hymns: Virgin Mary has 3 published (2 werb + 1 ordinary, draft excluded)
    const maryAll = page.locator('a[href*="/hymns/browse/category-virgin-mary"]')
    await maryAll.waitFor()
    assert.match(await maryAll.innerText(), /3 Mezmurs/)

    // Switch to Werb: category & occasion cards stay visible, Virgin Mary count becomes 2, Holy Trinity becomes 0
    await page.getByRole('button', { name: /Werb/ }).click()
    await page.waitForURL((u) => u.searchParams.get('form') === 'werb')
    await page.getByRole('tab', { name: 'Categories', exact: true }).waitFor()
    const maryWerb = page.locator('a[href*="/hymns/browse/category-virgin-mary"][href*="form=werb"]')
    await maryWerb.waitFor()
    assert.match(await maryWerb.innerText(), /2 Mezmurs/)
    const trinityWerb = page.locator('a[href*="/hymns/browse/holy-trinity-holy-spirit"][href*="form=werb"]')
    await trinityWerb.waitFor()
    assert.match(await trinityWerb.innerText(), /0 Mezmurs/)
  })

  await run('Werb -> category -> subcategory -> hymn shows only published Werb and preserves back/forward', async () => {
    await page.locator('a[href*="/hymns/browse/category-virgin-mary"][href*="form=werb"]').click()
    await page.waitForURL((u) => u.pathname === '/hymns/browse/category-virgin-mary' && u.searchParams.get('form') === 'werb')
    await page.getByRole('heading', { name: 'Virgin Mary', exact: true, level: 1 }).waitFor()
    const subLink = page.locator('a[href*="/hymns/category/virgin-mary"][href*="form=werb"]').first()
    await subLink.waitFor()
    assert.match(await subLink.innerText(), /2 Mezmurs/)
    await subLink.click()
    await page.waitForURL((u) => u.searchParams.get('form') === 'werb')
    await page.getByText('Werb Mary One').waitFor()
    await page.getByText('Werb Mary Two').waitFor()
    assert.equal(await page.getByText('Ordinary Mary Mezmur').count(), 0)
    assert.equal(await page.getByText('Draft Werb Hidden').count(), 0)

    await page.getByRole('link', { name: /Werb Mary One/ }).click()
    await page.waitForURL((u) => u.pathname === '/hymns/mezmur/werb-mary-one')
    await page.goBack()
    await page.waitForURL((u) => u.searchParams.get('form') === 'werb')
    await page.getByText('Werb Mary One').waitFor()
  })

  await run('Zero-Werb category shows useful empty state and allows switching to All Hymns', async () => {
    await page.goto(`${base}/hymns/category/holy-trinity?form=werb`)
    await page.getByText('No Werb found in this collection.').waitFor()
    await page.getByRole('button', { name: 'View All Hymns in this collection' }).click()
    await page.waitForURL((u) => !u.searchParams.has('form'))
    await page.getByText('Ordinary Trinity Mezmur').waitFor()
  })

  await run('Werb -> Occasions -> Gena -> Werb Gena One (Geʽez) & language filter', async () => {
    await page.goto(`${base}/hymns?form=werb&browse=occasions`)
    const feastsLink = page.locator('a[href*="/hymns/browse/occasion-holidays-feasts"][href*="form=werb"]')
    await feastsLink.waitFor()
    assert.match(await feastsLink.innerText(), /1 Mezmur/)
    await feastsLink.click()
    await page.locator('a[href*="/hymns/occasion/gena"][href*="form=werb"]').click()
    await page.getByText('Werb Gena One').waitFor()
    // Filter to Amharic -> empty in Gena Werb, switch to Ge'ez -> shows Werb Gena One
    await page.getByRole('group', { name: 'Language' }).getByRole('button', { name: /Amharic/ }).click()
    await page.waitForURL((u) => u.searchParams.get('language') === 'am')
    await page.getByText('No Werb found in this collection.').waitFor()
    await page.getByRole('group', { name: 'Language' }).getByRole('button', { name: /Ge/ }).click()
    await page.waitForURL((u) => u.searchParams.get('language') === 'gez')
    await page.getByText('Werb Gena One').waitFor()
  })

  await run('Unclassified Werb remains discoverable via All Werb view and search', async () => {
    await page.goto(`${base}/hymns?form=werb`)
    await page.getByRole('link', { name: /View all Werb/ }).click()
    await page.waitForURL((u) => u.searchParams.get('form') === 'werb' && u.searchParams.get('view') === 'all')
    await page.getByText('Unclassified Werb Solo').waitFor()
    assert.equal(await page.getByText('Ordinary Mary Mezmur').count(), 0)
    assert.equal(await page.getByText('Draft Werb Hidden').count(), 0)
    // Switch back to All Hymns from All Werb restores normal category browse
    await page.getByRole('button', { name: 'All Hymns', exact: true }).click()
    await page.waitForURL((u) => !u.searchParams.has('form') && !u.searchParams.has('view'))
    await page.getByRole('tab', { name: 'Categories', exact: true }).waitFor()
    // Search within Werb mode
    await page.getByRole('button', { name: /Werb/ }).click()
    await page.locator('button[aria-pressed="true"]', { hasText: 'Werb' }).waitFor()
    await page.locator('#hymn-search').fill('Unclassified')
    await page.waitForFunction(() => {
      const sp = new URLSearchParams(window.location.search)
      return sp.get('form') === 'werb' && sp.get('q') === 'Unclassified'
    })
    await page.getByText('Unclassified Werb Solo').waitFor()
    assert.equal(await page.getByText('Ordinary Mary Mezmur').count(), 0)
  })

  await run('Mobile (320px, 390px, 430px), Desktop (1440px), and Light/Night themes have no horizontal overflow', async () => {
    for (const width of [320, 390, 430, 1440]) {
      await page.setViewportSize({ width, height: 844 })
      for (const theme of ['light', 'night']) {
        await page.evaluate((t) => document.documentElement.setAttribute('data-theme', t), theme)
        await page.goto(`${base}/hymns?form=werb`)
        await page.getByRole('tab', { name: 'Categories', exact: true }).waitFor()
        const overflow = await page.evaluate(() => document.documentElement.scrollWidth > window.innerWidth)
        assert.equal(overflow, false, `Overflow at width=${width}, theme=${theme}`)
      }
    }
  })

  console.log(`\n${passed} passed, ${failed} failed`)
  if (failed > 0) process.exitCode = 1
} finally {
  await browser?.close()
  await server.close()
}
