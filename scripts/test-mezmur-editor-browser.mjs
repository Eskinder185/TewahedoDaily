// Real-component browser test for the CMS Mezmur editor against an in-memory fake Supabase (no real project, no network).
// Covers image remove/replace/add, every lyrics language, draft save, publish, and reopening saved Mezmurs.
// Run: node scripts/test-mezmur-editor-browser.mjs
import assert from 'node:assert/strict'
import react from '@vitejs/plugin-react'
import { chromium } from 'playwright'
import { createServer } from 'vite'

const PORT = 5197
const SUPABASE = 'https://placeholder.invalid'
const vite = await createServer({
  configFile: false,
  envDir: false,
  plugins: [react()],
  logLevel: 'error',
  cacheDir: new URL('../node_modules/.vite-mezmur-editor-browser', import.meta.url).pathname.replace(/^\/([A-Za-z]:)/, '$1'),
  resolve: { dedupe: ['react', 'react-dom'] },
  optimizeDeps: { force: true, include: ['react', 'react-dom/client', 'react-router-dom'] },
  server: { port: PORT, strictPort: true, hmr: false },
  define: {
    'import.meta.env.VITE_SUPABASE_URL': JSON.stringify(SUPABASE),
    'import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY': JSON.stringify('placeholder'),
  },
})
await vite.listen()

// ── Fake backend ──────────────────────────────────────────────────────────────
const store = new Map()
const calls = []
const assets = [
  { id: 'asset-1', file_name: 'Saint Yared.webp', storage_bucket: 'content-media', storage_path: 'calendar/general/yared-96548f68-1792449396141.webp', alt_text: 'Saint Yared', media_type: 'image', mime_type: 'image/webp', created_at: '2026-10-19T00:00:00Z' },
  { id: 'asset-2', file_name: 'Timket.webp', storage_bucket: 'content-media', storage_path: 'calendar/christ/timket-436e0376-1792010746233.webp', alt_text: 'Timket', media_type: 'image', mime_type: 'image/webp', created_at: '2026-10-19T00:00:00Z' },
]
let counter = 0
const blankRow = (overrides = {}) => {
  const n = ++counter
  const id = `00000000-0000-4000-8000-${String(n).padStart(12, '0')}`
  const row = {
    import_id: id, mezmur_id: id, slug: `seed-${n}`, title: `Seed ${n}`, transliteration_title: `Seed ${n}`, title_amharic: 'ሙከራ', title_english: null,
    description: null, description_amharic: null, lyrics_amharic: null, lyrics_transliteration: null, lyrics_english: null, lyrics_geez: null, lyrics_oromo: null,
    primary_language: null, form: 'mezmur', singer_id: null, singer_slug: null, singer_name: null, zemari_id: null, youtube_url: null, audio_url: null,
    image_path: null, image_alt: null, legacy_thumbnail_url: null, search_keywords: null, status: 'draft', review_status: null, review_notes: null,
    source_url: null, source_notes: null, rights_status: null, publication_approved_at: null, publication_approved_by: null,
    created_at: '2026-10-01T00:00:00Z', updated_at: '2026-10-01T00:00:00Z', deleted_at: null, deleted_by: null, deleted_from_status: null,
    ...overrides,
  }
  store.set(id, row)
  return row
}
const jwt = (() => {
  const b64 = (value) => Buffer.from(JSON.stringify(value)).toString('base64url')
  return `${b64({ alg: 'HS256', typ: 'JWT' })}.${b64({ sub: 'staff-1', role: 'authenticated', exp: Math.floor(Date.now() / 1000) + 7200 })}.sig`
})()
const user = { id: 'staff-1', aud: 'authenticated', role: 'authenticated', email: 'editor@example.test', app_metadata: {}, user_metadata: {}, created_at: '2026-01-01T00:00:00Z' }
const cors = { 'access-control-allow-origin': '*', 'access-control-allow-headers': '*', 'access-control-allow-methods': '*', 'access-control-expose-headers': 'content-range' }

async function installBackend(context) {
  await context.addInitScript(({ token, userValue }) => {
    localStorage.setItem('sb-placeholder-auth-token', JSON.stringify({
      access_token: token, refresh_token: 'refresh', token_type: 'bearer', expires_in: 7200, expires_at: Math.floor(Date.now() / 1000) + 7200, user: userValue,
    }))
  }, { token: jwt, userValue: user })
  await context.route(`${SUPABASE}/**`, async (route) => {
    const request = route.request()
    const url = new URL(request.url())
    const method = request.method()
    const json = (body, status = 200, headers = {}) => route.fulfill({ status, contentType: 'application/json', headers: { ...cors, ...headers }, body: JSON.stringify(body) })
    if (method === 'OPTIONS') return route.fulfill({ status: 204, headers: cors })
    if (method !== 'GET') calls.push({ method, path: url.pathname, body: request.postData() })
    if (url.pathname.startsWith('/storage/v1/object/public/') && method === 'GET') return route.fulfill({ status: 200, contentType: 'image/png', headers: cors, body: Buffer.from('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==', 'base64') })
    if (url.pathname.startsWith('/auth/v1/user')) return json(user)
    if (url.pathname.startsWith('/auth/v1/')) return json({ access_token: jwt, refresh_token: 'refresh', token_type: 'bearer', expires_in: 7200, user })
    if (url.pathname.endsWith('/rpc/is_staff')) return json(true)
    if (url.pathname.endsWith('/rpc/publish_mezmur_import')) {
      const { p_import_id: importId } = JSON.parse(request.postData() || '{}')
      const row = store.get(importId)
      if (!row) return json({ code: 'P0002', message: 'Expected one Mezmur' }, 400)
      const hasLyrics = ['lyrics_amharic', 'lyrics_geez', 'lyrics_english', 'lyrics_oromo', 'lyrics_transliteration'].some((key) => String(row[key] ?? '').trim())
      if (!hasLyrics) return json({ code: '23514', message: 'Title, slug, and at least one supported lyrics field are required to publish' }, 400)
      row.status = 'published'
      return json({ public_visible: true })
    }
    const wantsObject = (request.headers().accept || '').includes('vnd.pgrst.object')
    if (url.pathname.endsWith('/rest/v1/profiles')) return wantsObject ? json({ id: 'staff-1', role: 'editor' }) : json([{ id: 'staff-1', role: 'editor' }])
    if (url.pathname.endsWith('/rest/v1/media_assets') && method === 'GET') return json(assets, 200, { 'content-range': `0-${assets.length - 1}/${assets.length}` })
    if (url.pathname.endsWith('/rest/v1/mezmur_data_import')) {
      const eq = (key) => (url.searchParams.get(key) || '').replace(/^eq\./, '')
      if (method === 'GET') {
        const rows = [...store.values()].filter((row) => ['import_id', 'mezmur_id', 'slug'].every((key) => !url.searchParams.has(key) || row[key] === eq(key)))
        return json(rows)
      }
      if (method === 'PATCH') {
        const row = store.get(eq('import_id'))
        if (!row) return json([])
        Object.assign(row, JSON.parse(request.postData() || '{}'))
        return json([row])
      }
      if (method === 'POST') {
        const created = blankRow(JSON.parse(request.postData() || '{}'))
        return json([created], 201)
      }
    }
    if (method === 'GET') return json([], 200, { 'content-range': '*/0' })
    return json([])
  })
}

let passed = 0
const t = async (name, fn) => { await fn(); passed++; console.log(`✓ ${name}`) }
const browser = await chromium.launch()
const context = await browser.newContext({ viewport: { width: 1280, height: 1000 } })
await installBackend(context)
const consoleErrors = []

async function open(path) {
  const page = await context.newPage()
  page.on('pageerror', (error) => consoleErrors.push(error.message))
  await page.goto(`http://localhost:${PORT}/scripts/fixtures/mezmur-editor-browser.html?path=${encodeURIComponent(path)}`)
  await page.getByRole('heading', { level: 1 }).waitFor({ timeout: 20000 })
  return page
}
const edit = (row) => `/admin/hymns/mezmur/${row.import_id}/edit`
const lyricsBox = (page) => page.locator('textarea[id^="lyrics-"]')
const tab = (page, name) => page.getByRole('tab', { name })
const waitSaved = (page, text) => page.getByRole('status').filter({ hasText: text }).first().waitFor({ timeout: 15000 })

try {
  const seed = (extra = {}) => blankRow({ lyrics_english: 'Praise the Lord', youtube_url: 'https://www.youtube.com/watch?v=abc123', audio_url: 'https://example.com/audio.mp3', zemari_id: 'zemari-keep', singer_id: 'zemari-keep', primary_language: 'en', ...extra })

  await t('Remove image clears the thumbnail, survives save and reopen, keeps YouTube/audio/Zemari, and never touches the Media Library', async () => {
    const row = seed({ image_path: 'mezmur/old.webp', image_alt: 'Old art', legacy_thumbnail_url: 'https://example.com/legacy.jpg' })
    calls.length = 0
    const page = await open(edit(row))
    await page.getByRole('button', { name: 'Remove image' }).click()
    assert.equal(await page.getByRole('button', { name: 'Remove image' }).count(), 0, 'button disappears once the image is removed')
    await page.getByRole('button', { name: 'Choose from Media' }).waitFor()
    await page.getByRole('button', { name: 'Save Draft' }).click()
    await waitSaved(page, 'saved as draft')
    const saved = store.get(row.import_id)
    assert.equal(saved.image_path, null)
    assert.equal(saved.legacy_thumbnail_url, null, 'legacy thumbnail cleared so it cannot reappear')
    assert.equal(saved.image_alt, null)
    assert.equal(saved.youtube_url, 'https://www.youtube.com/watch?v=abc123')
    assert.equal(saved.audio_url, 'https://example.com/audio.mp3')
    assert.equal(saved.zemari_id, 'zemari-keep')
    assert.equal(saved.lyrics_english, 'Praise the Lord')
    assert.equal(calls.filter((call) => /media_assets|storage/.test(call.path)).length, 0, 'no Media Library or Storage writes/deletes')
    await page.close()
    const reopened = await open(edit(row))
    assert.equal(await reopened.getByRole('button', { name: 'Remove image' }).count(), 0, 'stays removed after reopening')
    await reopened.getByRole('button', { name: 'Choose from Media' }).waitFor()
    assert.equal(await reopened.getByLabel('YouTube URL').inputValue(), 'https://www.youtube.com/watch?v=abc123')
    await reopened.close()
  })

  await t('Replace and add image from the Media Library persist after reopening', async () => {
    const row = seed({ image_path: 'mezmur/old.webp', image_alt: 'Old art' })
    const page = await open(edit(row))
    await page.getByRole('button', { name: 'Change image' }).click()
    await page.getByRole('button', { name: /Saint Yared\.webp/ }).click()
    await page.getByRole('button', { name: 'Save Draft' }).click()
    await waitSaved(page, 'saved as draft')
    assert.equal(store.get(row.import_id).image_path, 'calendar/general/yared-96548f68-1792449396141.webp')
    assert.equal(store.get(row.import_id).youtube_url, 'https://www.youtube.com/watch?v=abc123')
    await page.close()
    const reopened = await open(edit(row))
    await reopened.getByRole('button', { name: 'Remove image' }).waitFor()
    await reopened.close()

    const blank = seed()
    const addPage = await open(edit(blank))
    await addPage.getByRole('button', { name: 'Choose from Media' }).click()
    await addPage.getByRole('button', { name: /Timket\.webp/ }).click()
    await addPage.getByRole('button', { name: 'Save Draft' }).click()
    await waitSaved(addPage, 'saved as draft')
    assert.equal(store.get(blank.import_id).image_path, 'calendar/christ/timket-436e0376-1792010746233.webp')
    await addPage.close()
  })

  const languages = [
    { key: 'lyrics_amharic', tab: /Amharic/, text: 'እግዚአብሔር ይመስገን' },
    { key: 'lyrics_english', tab: /^English/, text: 'Praise the Lord' },
    { key: 'lyrics_geez', tab: /Ge/, text: 'ስብሐት ለእግዚአብሔር' },
    { key: 'lyrics_oromo', tab: /Oromo/, text: 'Waaqayyoon galateeffadhaa' },
    { key: 'lyrics_transliteration', tab: /Transliteration/, text: 'Egziabher yimesgen' },
  ]
  for (const language of languages) {
    await t(`Lyrics only in ${language.key}: save draft, publish, reopen on the right tab`, async () => {
      const page = await open('/admin/hymns/mezmur/new')
      await page.getByLabel(/^Transliterated title/).fill(`Only ${language.key}`)
      await page.getByLabel(/^Amharic title/).fill('ሙከራ መዝሙር')
      await page.getByRole('button', { name: 'Generate from title' }).click()
      await tab(page, language.tab).first().click()
      await lyricsBox(page).fill(language.text)
      await page.getByRole('button', { name: 'Save Draft' }).click()
      await waitSaved(page, 'saved as draft')
      const row = [...store.values()].find((item) => item.transliteration_title === `Only ${language.key}`)
      assert.ok(row, 'row created')
      assert.equal(row[language.key.replace('lyrics_transliteration', 'lyrics_transliteration')], language.text)
      await page.getByRole('button', { name: 'Publish' }).click()
      await waitSaved(page, 'published successfully')
      assert.equal(row.status, 'published')
      assert.equal(await page.locator('[role="alert"]').filter({ hasText: /Amharic lyrics|at least one/ }).count(), 0, 'no incorrect required-lyrics warning')
      await page.close()
      const reopened = await open(edit(row))
      assert.equal(await reopened.getByRole('tab', { selected: true }).innerText().then((value) => value.replace(/\s*•$/, '')), (await tab(reopened, language.tab).first().innerText()).replace(/\s*•$/, ''), 'opens on the tab that holds lyrics')
      assert.equal(await lyricsBox(reopened).inputValue(), language.text)
      await reopened.close()
    })
  }

  await t('Switching lyrics tabs preserves text; a Mezmur with no lyrics cannot publish; Amharic lyrics are not required', async () => {
    const row = seed({ lyrics_english: null })
    const page = await open(edit(row))
    await page.getByRole('button', { name: 'Publish' }).click()
    await page.getByRole('alert').filter({ hasText: /at least one supported language/i }).first().waitFor()
    assert.equal(await page.getByRole('alert').filter({ hasText: /Amharic lyrics (are|do)/ }).count(), 0)
    await tab(page, /^English/).click()
    await lyricsBox(page).fill('English lines')
    await tab(page, /Oromo/).click()
    await lyricsBox(page).fill('Oromo lines')
    await tab(page, /^English/).click()
    assert.equal(await lyricsBox(page).inputValue(), 'English lines')
    await tab(page, /Oromo/).click()
    assert.equal(await lyricsBox(page).inputValue(), 'Oromo lines')
    await page.getByRole('button', { name: 'Publish' }).click()
    await waitSaved(page, 'published successfully')
    assert.equal(store.get(row.import_id).lyrics_english, 'English lines')
    assert.equal(store.get(row.import_id).lyrics_oromo, 'Oromo lines')
    assert.equal(store.get(row.import_id).lyrics_amharic, null)
    await page.close()
  })

  await t('Return to draft and re-publish keep titles, Zemari, links and media', async () => {
    const row = seed({ status: 'published', image_path: 'mezmur/keep.webp' })
    const page = await open(edit(row))
    await page.getByRole('button', { name: 'Return to Draft' }).click()
    await waitSaved(page, 'saved as draft')
    assert.equal(store.get(row.import_id).status, 'draft')
    assert.equal(store.get(row.import_id).image_path, 'mezmur/keep.webp')
    assert.equal(store.get(row.import_id).title_amharic, 'ሙከራ')
    assert.equal(store.get(row.import_id).zemari_id, 'zemari-keep')
    await page.getByRole('button', { name: 'Publish' }).click()
    await waitSaved(page, 'published successfully')
    assert.equal(store.get(row.import_id).status, 'published')
    await page.close()
  })

  assert.deepEqual(consoleErrors, [], 'no uncaught page errors')
  console.log(`Mezmur editor browser checks passed (${passed} scenarios).`)
} finally {
  await browser.close()
  await vite.close()
}
