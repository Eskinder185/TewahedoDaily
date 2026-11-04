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
const zemaris = new Map()
const zemariAliases = [{ zemari_id: 'z-dawit', alias: 'Dawit T.' }]
const addZemari = (row) => {
  const full = { bio: null, bio_amharic: null, image_path: null, image_alt: null, youtube_url: null, website_url: null, sort_order: 0, is_featured: false, status: 'published',
    created_at: '2026-10-01T00:00:00Z', updated_at: '2026-10-01T00:00:00Z', deleted_at: null, deleted_by: null, deleted_from_status: null, mezmur_count: 0, published_mezmur_count: 0, ...row }
  zemaris.set(full.id, full)
  return full
}
addZemari({ id: 'z-dawit', slug: 'zemari-diyakon-dawit-tilahun', name: 'Zemari Diyakon Dawit Tilahun', name_amharic: 'ዘማሪ ዲያቆን ዳዊት ጥላሁን' })
addZemari({ id: 'z-kidist', slug: 'zemarit-kidisit-mitiku', name: 'Zemarit Kidisit Mitiku', name_amharic: 'ዘማሪት ቅድስት ምትኩ' })
addZemari({ id: 'z-tewodros', slug: 'like-mezemiran-tewodros-yoseph', name: 'Like Mezemiran Tewodros Yoseph', name_amharic: 'ሊቀ መዘምራን ቴዎድሮስ ዮሴፍ' })
// Classification taxonomy as stored in the database: 'cross', 'prayer' and 'baptism' are canonical in code but not yet present.
const dbCategories = new Set(['jesus-christ', 'virgin-mary', 'general', 'saints'])
const dbOccasions = new Set(['gena', 'timket', 'general'])
const classificationLinks = new Map()
let classificationRpcDefect = false
let classificationRpcCalls = 0
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
    if (url.pathname.endsWith('/rpc/set_mezmur_classification_import')) {
      const body = JSON.parse(request.postData() || '{}')
      classificationRpcCalls += 1
      if (classificationRpcDefect) return json({ code: '42703', message: 'column "value" does not exist', details: null, hint: null }, 400)
      const invalidCategories = body.p_category_slugs.filter((slug) => !dbCategories.has(slug))
      if (invalidCategories.length) return json({ code: '23503', message: `Invalid category slug(s): ${invalidCategories.join(', ')}`, details: null, hint: null }, 409)
      const invalidOccasions = body.p_occasion_slugs.filter((slug) => !dbOccasions.has(slug))
      if (invalidOccasions.length) return json({ code: '23503', message: `Invalid occasion slug(s): ${invalidOccasions.join(', ')}`, details: null, hint: null }, 409)
      classificationLinks.set(body.p_mezmur_import_id, { categories: [...body.p_category_slugs], occasions: [...body.p_occasion_slugs] })
      return json(null, 204)
    }
    if (/\/rest\/v1\/mezmur_(category|occasion)_links_import$/.test(url.pathname) && method === 'GET') {
      const importId = (url.searchParams.get('mezmur_import_id') || '').replace(/^eq\./, '')
      const stored = classificationLinks.get(importId) || { categories: [], occasions: [] }
      return url.pathname.includes('category')
        ? json(stored.categories.map((category_slug) => ({ category_slug })))
        : json(stored.occasions.map((occasion_slug) => ({ occasion_slug })))
    }
    const wantsObject = (request.headers().accept || '').includes('vnd.pgrst.object')
    if (url.pathname.endsWith('/rest/v1/profiles')) return wantsObject ? json({ id: 'staff-1', role: 'editor' }) : json([{ id: 'staff-1', role: 'editor' }])
    if (url.pathname.endsWith('/rest/v1/media_assets') && method === 'GET') return json(assets, 200, { 'content-range': `0-${assets.length - 1}/${assets.length}` })
    if (/\/rest\/v1\/(zemaris|zemaris_with_counts)$/.test(url.pathname)) {
      const eq = (key) => (url.searchParams.get(key) || '').replace(/^eq\./, '')
      if (method === 'GET') {
        const rows = [...zemaris.values()].filter((row) => ['id', 'slug'].every((key) => !url.searchParams.has(key) || row[key] === eq(key)))
        return json(rows)
      }
      if (method === 'POST') {
        const created = addZemari({ id: `z-new-${zemaris.size + 1}`, ...JSON.parse(request.postData() || '{}') })
        return json([created], 201)
      }
      return json([])
    }
    if (url.pathname.endsWith('/rest/v1/zemari_aliases') && method === 'GET') return json(zemariAliases)
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
  page.on('pageerror', (error) => { consoleErrors.push(error.message); if (process.env.DEBUG_EDITOR) console.log('PAGEERROR', error.message) })
  if (process.env.DEBUG_EDITOR) page.on('console', (message) => { if (message.type() === 'error') console.log('CONSOLE', message.text().slice(0, 300)) })
  await page.goto(`http://localhost:${PORT}/scripts/fixtures/mezmur-editor-browser.html?path=${encodeURIComponent(path)}`)
  await page.getByRole('heading', { level: 1 }).waitFor({ timeout: 90000 })
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

  const zemariBox = (page) => page.getByRole('combobox', { name: 'Zemari' })
  const optionTexts = (page) => page.getByRole('listbox', { name: 'Zemaris' }).getByRole('option').allInnerTexts()
  const search = async (page, text) => { await zemariBox(page).click(); await zemariBox(page).fill(text) }

  await t('Zemari search matches English, Amharic, transliteration variants and aliases as you type', async () => {
    const row = seed({ zemari_id: null, singer_id: null })
    const page = await open(edit(row))
    await search(page, 'Dawit')
    assert.deepEqual((await optionTexts(page)).filter((text) => /Dawit/.test(text)).length, 1)
    await zemariBox(page).fill('ዳዊት')
    assert.ok((await optionTexts(page)).some((text) => /ዳዊት/.test(text)), 'Amharic name')
    await zemariBox(page).fill('Qidisit Mitiku')
    assert.ok((await optionTexts(page)).some((text) => /Kidisit Mitiku/.test(text)), 'transliteration spelling variant (Qidisit/Kidisit)')
    await zemariBox(page).fill('Tewodros Yosef')
    assert.ok((await optionTexts(page)).some((text) => /Tewodros Yoseph/.test(text)), 'Yosef/Yoseph variant')
    await zemariBox(page).fill('Dawit T.')
    assert.ok((await optionTexts(page)).some((text) => /Dawit Tilahun/.test(text)), 'verified alias')
    await zemariBox(page).fill('nobody-at-all')
    const none = await optionTexts(page)
    assert.deepEqual(none.map((text) => text.replace(/^✓?\s*/, '')), ['No Zemari', '+ Create New Zemari'])
    await page.close()
  })

  await t('Selecting an existing Zemari by keyboard keeps unsaved lyrics, saves, and reopens with that Zemari', async () => {
    const row = seed({ zemari_id: null, singer_id: null, lyrics_english: null })
    const page = await open(edit(row))
    await tab(page, /^English/).click()
    await lyricsBox(page).fill('Unsaved lyrics must survive')
    await page.getByLabel('Description').fill('Unsaved description')
    await search(page, 'dawit')
    await page.keyboard.press('ArrowDown')
    await page.keyboard.press('Enter')
    assert.match(await zemariBox(page).inputValue(), /Dawit Tilahun/)
    assert.equal(await lyricsBox(page).inputValue(), 'Unsaved lyrics must survive')
    await page.getByRole('button', { name: 'Save Draft' }).click()
    await waitSaved(page, 'saved as draft')
    assert.equal(store.get(row.import_id).zemari_id, 'z-dawit')
    assert.equal(store.get(row.import_id).singer_id, 'z-dawit')
    await page.close()
    const reopened = await open(edit(row))
    assert.match(await zemariBox(reopened).inputValue(), /Dawit Tilahun/)
    await reopened.close()
  })

  await t('Duplicate names, Amharic names and aliases are blocked before anything is created', async () => {
    const row = seed({ zemari_id: null, singer_id: null })
    const page = await open(edit(row))
    const before = calls.filter((call) => /zemaris/.test(call.path)).length
    for (const attempt of [{ name: 'zemari diyakon dawit tilahun' }, { name: 'Someone New', amharic: 'ዘማሪት ቅድስት ምትኩ' }, { name: 'Dawit T.' }, { name: 'Qidusit Mitiku Different' }]) {
      await search(page, attempt.name)
      await page.getByRole('option', { name: '+ Create New Zemari' }).click()
      const dialog = page.getByRole('dialog')
      await dialog.getByLabel(/^Name/).fill(attempt.name)
      if (attempt.amharic) await dialog.getByLabel('Amharic name').fill(attempt.amharic)
      await dialog.getByRole('checkbox').check()
      if (attempt.name === 'Qidusit Mitiku Different') {
        assert.equal(await dialog.getByRole('alert').count(), 0, 'a different person is not flagged')
        await dialog.getByRole('button', { name: 'Cancel' }).click()
        continue
      }
      await dialog.getByRole('alert').filter({ hasText: /existing Zemari/ }).waitFor()
      assert.equal(await dialog.getByRole('button', { name: 'Create Zemari' }).isDisabled(), true, 'create is disabled for a duplicate')
      await dialog.getByRole('button', { name: 'Cancel' }).click()
    }
    assert.equal(calls.filter((call) => /zemaris/.test(call.path)).length, before, 'no Zemari write was attempted')
    // "Use this Zemari" selects the existing one instead
    await search(page, 'Kidisit')
    await page.getByRole('option', { name: '+ Create New Zemari' }).click()
    const dialog = page.getByRole('dialog')
    await dialog.getByLabel(/^Name/).fill('Zemarit Kidisit Mitiku')
    await dialog.getByRole('button', { name: 'Use this Zemari' }).click()
    assert.match(await zemariBox(page).inputValue(), /Kidisit Mitiku/)
    await page.close()
  })

  await t('Create and select a new Zemari: needs explicit confirmation, preserves unsaved edits, saves and reopens', async () => {
    const row = seed({ zemari_id: null, singer_id: null, lyrics_english: null })
    const page = await open(edit(row))
    await tab(page, /^English/).click()
    await lyricsBox(page).fill('Draft lyrics typed before creating a Zemari')
    await page.getByLabel(/^Amharic title/).fill('ርዕስ ተቀይሯል')
    const writesBefore = zemaris.size
    await search(page, 'Brand New Singer')
    await page.getByRole('option', { name: '+ Create New Zemari' }).click()
    const dialog = page.getByRole('dialog')
    assert.equal(await dialog.getByLabel(/^Name/).inputValue(), 'Brand New Singer', 'prefilled from the search text')
    await dialog.getByLabel('Amharic name').fill('አዲስ ዘማሪ')
    assert.equal(await dialog.getByRole('button', { name: 'Create Zemari' }).isDisabled(), true, 'cannot create before confirming')
    assert.equal(zemaris.size, writesBefore, 'nothing created yet')
    await dialog.getByRole('checkbox').check()
    await dialog.getByRole('button', { name: 'Create Zemari' }).click()
    await waitSaved(page, 'was created and selected')
    assert.equal(zemaris.size, writesBefore + 1)
    const created = [...zemaris.values()].find((item) => item.slug === 'brand-new-singer')
    assert.equal(created.name, 'Brand New Singer')
    assert.equal(created.name_amharic, 'አዲስ ዘማሪ')
    assert.match(await zemariBox(page).inputValue(), /Brand New Singer/)
    assert.equal(await lyricsBox(page).inputValue(), 'Draft lyrics typed before creating a Zemari', 'unsaved lyrics intact')
    assert.equal(await page.getByLabel(/^Amharic title/).inputValue(), 'ርዕስ ተቀይሯል', 'unsaved metadata intact')
    assert.equal(store.get(row.import_id).zemari_id, null, 'creating a Zemari does not save the Mezmur')
    assert.equal(calls.filter((call) => /mezmur_data_import/.test(call.path) && call.method === 'PATCH').length >= 0, true)
    await page.getByRole('button', { name: 'Save Draft' }).click()
    await waitSaved(page, 'saved as draft')
    assert.equal(store.get(row.import_id).zemari_id, created.id)
    assert.equal(store.get(row.import_id).lyrics_english, 'Draft lyrics typed before creating a Zemari')
    await page.close()
    const reopened = await open(edit(row))
    assert.match(await zemariBox(reopened).inputValue(), /Brand New Singer/)
    await reopened.close()
  })

  await t('Zemari selector works at 360px and the existing assignment is never changed by browsing', async () => {
    const row = seed({ zemari_id: 'z-kidist', singer_id: 'z-kidist' })
    const page = await context.newPage()
    await page.setViewportSize({ width: 360, height: 780 })
    await page.goto(`http://localhost:${PORT}/scripts/fixtures/mezmur-editor-browser.html?path=${encodeURIComponent(edit(row))}`)
    await page.getByRole('heading', { level: 1 }).waitFor()
    await zemariBox(page).click()
    const box = await page.getByRole('listbox', { name: 'Zemaris' }).boundingBox()
    assert.ok(box.x >= 0 && box.x + box.width <= 360 + 1, 'listbox stays inside the viewport')
    for (const option of await page.getByRole('listbox', { name: 'Zemaris' }).getByRole('option').all()) {
      assert.ok((await option.boundingBox()).height >= 44 - 1, 'touch-sized options')
    }
    await page.keyboard.press('Escape')
    assert.match(await zemariBox(page).inputValue(), /Kidisit Mitiku/, 'Escape keeps the current Zemari')
    assert.equal(store.get(row.import_id).zemari_id, 'z-kidist')
    // The wider editor form already overflows a 360px screen (lyric tabs/footer buttons); the Zemari control itself must not.
    const field = await zemariBox(page).boundingBox()
    assert.ok(field.x >= 0 && field.x + field.width <= 360 + 1, 'Zemari field fits the 360px viewport')
    await page.close()
  })

  const pick = async (page, label, search, optionName) => {
    const box = page.getByRole('combobox', { name: label })
    await box.click()
    await box.fill(search)
    await page.getByRole('option', { name: optionName }).first().click()
    await page.keyboard.press('Escape')
  }
  const chips = (page, label) => page.getByLabel(`Selected ${label}`)

  await t('Classification saves categories and occasions that exist in the database, and they reopen selected', async () => {
    const row = seed()
    const page = await open(edit(row))
    await pick(page, 'Categories', 'Virgin', /Virgin Mary \/ ድንግል ማርያም/)
    await pick(page, 'Occasions', 'Gena', /Gena \/ ገና/)
    await page.getByRole('button', { name: 'Save Draft' }).click()
    await waitSaved(page, 'saved as draft')
    assert.equal(await page.getByRole('alert').filter({ hasText: /NOT saved/ }).count(), 0)
    assert.deepEqual(classificationLinks.get(row.import_id), { categories: ['virgin-mary'], occasions: ['gena'] })
    assert.ok(await page.getByText('All changes saved').isVisible())
    await page.close()
    const reopened = await open(edit(row))
    await chips(reopened, 'categories').getByText(/Virgin Mary/).waitFor()
    await chips(reopened, 'occasions').getByText(/Gena/).waitFor()
    await reopened.close()
  })

  await t('A canonical slug missing from the database shows the real RPC error and keeps the pending selections until the taxonomy exists', async () => {
    const row = seed({ lyrics_english: 'Original lyrics' })
    const page = await open(edit(row))
    await pick(page, 'Categories', 'Cross', /Cross \/ መስቀል/)
    await pick(page, 'Categories', 'Prayer', /Prayer \/ ጸሎት/)
    await pick(page, 'Occasions', 'Baptism', /Baptism \/ ሥርዓተ ጥምቀት/)
    await tab(page, /^English/).click()
    await lyricsBox(page).fill('Edited lyrics are saved even though the classification is rejected')
    await page.getByRole('button', { name: 'Save Draft' }).click()
    const alert = page.getByRole('alert').filter({ hasText: /NOT saved/ })
    await alert.waitFor({ timeout: 15000 })
    const text = await alert.innerText()
    assert.match(text, /Invalid category slug\(s\): cross, prayer/, 'shows the actual RPC message')
    assert.match(text, /23503/, 'shows the error code')
    assert.match(text, /20261101130000_mezmur_canonical_taxonomy_slugs\.sql/, 'points to the taxonomy migration')
    assert.doesNotMatch(text, /in use/, 'does not use the misleading generic 23503 text')
    assert.equal(classificationLinks.has(row.import_id), false, 'no partial classification was stored')
    assert.equal(store.get(row.import_id).lyrics_english, 'Edited lyrics are saved even though the classification is rejected', 'the Mezmur itself was saved')
    await chips(page, 'categories').getByText(/Cross/).waitFor()
    await chips(page, 'categories').getByText(/Prayer/).waitFor()
    await chips(page, 'occasions').getByText(/Baptism/).waitFor()
    assert.ok(await page.getByText('Unsaved changes').isVisible(), 'the editor still reports unsaved classification changes')

    // The administrator applies the additive taxonomy migration; the same pending selections now save.
    for (const slug of ['cross', 'prayer']) dbCategories.add(slug)
    dbOccasions.add('baptism')
    await page.getByRole('button', { name: 'Save Draft' }).click()
    await waitSaved(page, 'saved as draft')
    assert.equal(await page.getByRole('alert').filter({ hasText: /NOT saved/ }).count(), 0)
    assert.deepEqual(classificationLinks.get(row.import_id), { categories: ['cross', 'prayer'], occasions: ['baptism'] })
    await page.close()
    const reopened = await open(edit(row))
    await chips(reopened, 'categories').getByText(/Cross/).waitFor()
    await chips(reopened, 'occasions').getByText(/Baptism/).waitFor()
    await reopened.close()
    for (const slug of ['cross', 'prayer']) dbCategories.delete(slug)
    dbOccasions.delete('baptism')
  })

  await t('A SQLSTATE 42703 defect inside the classification RPC saves the Mezmur once, keeps selections, never shows them as saved, and a retry after the fix is idempotent', async () => {
    const row = seed({ lyrics_english: 'Original lyrics' })
    const rowsBefore = store.size
    classificationRpcDefect = true
    classificationRpcCalls = 0
    const page = await open(edit(row))
    await pick(page, 'Categories', 'Virgin', /Virgin Mary \/ ድንግል ማርያም/)
    await pick(page, 'Occasions', 'Gena', /Gena \/ ገና/)
    await tab(page, /^English/).click()
    await lyricsBox(page).fill('Lyrics saved even though classification links hit the SQL defect')
    await page.getByRole('button', { name: 'Save Draft' }).click()
    const alert = page.getByRole('alert').filter({ hasText: /NOT saved/ })
    await alert.waitFor({ timeout: 15000 })
    const text = await alert.innerText()
    assert.match(text, /42703/, 'shows the SQLSTATE')
    assert.match(text, /column "value" does not exist/, 'shows the real database message')
    assert.match(text, /20261104_mezmur_classification_rpc_unnest_alias\.sql/, 'points an administrator at the reviewed patch')
    assert.match(text, /not a problem with your selections/)
    assert.doesNotMatch(text, /in use|not installed/, 'does not misreport the cause')
    assert.equal(classificationLinks.has(row.import_id), false, 'no partial classification was stored')
    assert.equal(store.get(row.import_id).lyrics_english, 'Lyrics saved even though classification links hit the SQL defect', 'the Mezmur itself was saved')
    assert.equal(store.size, rowsBefore + 0, 'saving did not create a duplicate Mezmur')
    await chips(page, 'categories').getByText(/Virgin Mary/).waitFor()
    await chips(page, 'occasions').getByText(/Gena/).waitFor()
    assert.ok(await page.getByText('Unsaved changes').isVisible(), 'the editor does not claim the classifications are saved')
    assert.equal(await page.getByRole('status').filter({ hasText: /^Mezmur (saved as draft|published successfully)\.$/ }).count(), 0, 'no unqualified success banner')

    // Pressing Save while the defect persists retries the links only; still exactly one Mezmur and no stored links.
    await page.getByRole('button', { name: 'Save Draft' }).click()
    await alert.waitFor({ timeout: 15000 })
    assert.ok(classificationRpcCalls >= 2, 'the retry calls the RPC again')
    assert.equal(store.size, rowsBefore)
    assert.equal(classificationLinks.has(row.import_id), false)

    // An administrator applies the reviewed SQL patch; the same pending selections now save, once.
    classificationRpcDefect = false
    classificationRpcCalls = 0
    await page.getByRole('button', { name: 'Save Draft' }).click()
    await waitSaved(page, 'saved as draft')
    assert.equal(await page.getByRole('alert').filter({ hasText: /NOT saved/ }).count(), 0)
    assert.deepEqual(classificationLinks.get(row.import_id), { categories: ['virgin-mary'], occasions: ['gena'] })
    assert.equal(classificationRpcCalls, 1, 'one successful write, no duplicate calls')
    assert.equal(store.size, rowsBefore, 'still exactly one Mezmur')
    assert.equal(await page.getByText('Unsaved changes').count(), 0, 'now genuinely saved')
    await page.close()
    const reopened = await open(edit(row))
    await chips(reopened, 'categories').getByText(/Virgin Mary/).waitFor()
    await chips(reopened, 'occasions').getByText(/Gena/).waitFor()
    await reopened.close()
    classificationLinks.delete(row.import_id)
  })

  assert.deepEqual(consoleErrors, [], 'no uncaught page errors')
  console.log(`Mezmur editor browser checks passed (${passed} scenarios).`)
} finally {
  await browser.close()
  await vite.close()
}
