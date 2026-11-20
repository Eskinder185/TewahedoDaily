/**
 * Synthetic browser QA for Hymns Practice CMS simplification, beginner-friendly Mezmur editor,
 * public integrations, bilingual content, and desktop/mobile responsive layout.
 */
import assert from 'node:assert/strict'
import fs from 'node:fs/promises'
import path from 'node:path'
import { createServer } from 'vite'
import react from '@vitejs/plugin-react'
import { VitePWA } from 'vite-plugin-pwa'
import { chromium } from 'playwright'

const testPort = 4199
const base = `http://127.0.0.1:${testPort}`
const endpoint = 'https://synthetic-hymns-cms.supabase.co'
const screenshotDir = path.resolve(
  'artifacts',
  'hymns-cms-simplification',
)
await fs.mkdir(screenshotDir, { recursive: true })

const uuid = (n) => `00000000-0000-4000-8000-${String(n).padStart(12, '0')}`
const mezmurs = new Map([
  [
    uuid(1),
    {
      import_id: uuid(1),
      mezmur_id: uuid(1),
      slug: 'existing-published-hymn',
      title: 'Existing Published Hymn',
      transliteration_title: 'Existing Published Hymn',
      title_amharic: 'ነባር መዝሙር',
      title_english: 'Existing Published Hymn',
      description: 'Published hymn description',
      description_amharic: null,
      lyrics_amharic: 'የነባር መዝሙር ግጥም',
      lyrics_transliteration: 'Yeneber mezmur gitim',
      lyrics_english: 'Existing hymn lyrics',
      lyrics_geez: null,
      lyrics_oromo: null,
      primary_language: 'am',
      form: 'mezmur',
      status: 'published',
      featured: false,
      singer_id: 'z-1',
      zemari_id: 'z-1',
      singer_slug: 'zemari-dawit',
      singer_name: 'Zemari Dawit',
      thumbnail_url: null,
      image_path: null,
      image_alt: null,
      youtube_url: null,
      audio_url: null,
      source_url: null,
      rights_status: 'owned',
      created_by: 'staff-1',
      updated_at: '2026-11-10T12:00:00Z',
      created_at: '2026-11-01T12:00:00Z',
      deleted_at: null,
      source_submission_id: null,
    },
  ],
  [
    uuid(2),
    {
      import_id: uuid(2),
      mezmur_id: uuid(2),
      slug: 'pending-draft-wereb',
      title: 'Pending Draft Wereb',
      transliteration_title: 'Pending Draft Wereb',
      title_amharic: 'ረቂቅ ወረብ',
      title_english: 'Pending Draft Wereb',
      description: null,
      description_amharic: null,
      lyrics_amharic: 'ረቂቅ ወረብ ግጥም',
      lyrics_transliteration: null,
      lyrics_english: null,
      lyrics_geez: null,
      lyrics_oromo: null,
      primary_language: 'am',
      form: 'werb',
      status: 'draft',
      featured: false,
      singer_id: null,
      zemari_id: null,
      singer_slug: null,
      singer_name: null,
      thumbnail_url: null,
      image_path: null,
      image_alt: null,
      youtube_url: null,
      audio_url: null,
      source_url: null,
      rights_status: 'owned',
      created_by: 'staff-1',
      updated_at: '2026-11-11T12:00:00Z',
      created_at: '2026-11-02T12:00:00Z',
      deleted_at: null,
      source_submission_id: null,
    },
  ],
])

const zemaris = [
  {
    id: 'z-1',
    slug: 'zemari-dawit',
    name: 'Zemari Dawit',
    name_amharic: 'ዘማሪ ዳዊት',
    bio: 'Church Zemari',
    image_path: null,
    image_alt: null,
    youtube_url: null,
    sort_order: 1,
    is_featured: true,
    is_archived: false,
    status: 'published',
    published_mezmur_count: 1,
    mezmur_count: 1,
    updated_at: '2026-11-01T00:00:00Z',
    deleted_at: null,
  },
]

const categoryLinks = [
  { mezmur_id: uuid(1), mezmur_import_id: uuid(1), mezmur_slug: 'existing-published-hymn', category_slug: 'virgin-mary' },
]
const occasionLinks = [
  { mezmur_id: uuid(1), mezmur_import_id: uuid(1), mezmur_slug: 'existing-published-hymn', occasion_slug: 'gena' },
]
const collections = [
  { collection_id: 'c-1', collection_slug: 'virgin-mary', title: 'Virgin Mary', title_amharic: 'እመቤታችን ማርያም', description: '', description_amharic: '', image_path: null, image_alt: '', collection_type: 'category_group', sort_order: 20, is_featured: true, status: 'published', deleted_at: null },
  { collection_id: 'c-2', collection_slug: 'holidays-feasts', title: 'Holidays & Feasts', title_amharic: 'በዓላት እና አጽዋማት', description: '', description_amharic: '', image_path: null, image_alt: '', collection_type: 'occasion_group', sort_order: 10, is_featured: true, status: 'published', deleted_at: null },
]
const sections = [
  { section_id: 's-1', section_slug: 'virgin-mary', collection_slug: 'virgin-mary', parent_section_slug: null, title: 'Virgin Mary Hymns', title_amharic: 'የእመቤታችን መዝሙራት', description: '', description_amharic: '', image_path: null, image_alt: '', section_type: 'category', source_entity_type: 'category', source_entity_slug: 'virgin-mary', sort_order: 1, is_featured: true, status: 'published', deleted_at: null },
]
const submissions = [
  {
    id: 'sub-1',
    created_at: '2026-11-12T08:00:00Z',
    public_reference: 'SUB-101',
    title: 'Community Submitted Mezmur',
    contributor_name: 'Abebe',
    submission_type: 'mezmur',
    status: 'submitted',
    reviewed_by: null,
  },
]
const versions = new Map()

const [pwa] = VitePWA({ registerType: 'autoUpdate', devOptions: { enabled: false } })
const server = await createServer({
  configFile: false,
  envDir: false,
  plugins: [pwa, react()],
  cacheDir: 'node_modules/.vite-hymns-cms-tests',
  logLevel: 'error',
  optimizeDeps: { noDiscovery: true, include: ['react', 'react-dom/client', 'react-router-dom'] },
  resolve: { dedupe: ['react', 'react-dom'] },
  server: { host: '127.0.0.1', port: testPort, strictPort: true, hmr: false },
  define: {
    'import.meta.env.VITE_SUPABASE_URL': JSON.stringify(endpoint),
    'import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY': JSON.stringify('synthetic-public-key'),
  },
})

function filterInParam(val, rowVal) {
  const m = val?.match(/^in\.\((.*)\)$/)
  if (!m) return true
  const items = m[1].split(',').map((s) => s.replace(/^"|"$/g, ''))
  return items.includes(String(rowVal ?? ''))
}

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
    const session = {
      access_token: 'synthetic-jwt',
      token_type: 'bearer',
      expires_in: 3600,
      expires_at: Math.floor(Date.now() / 1000) + 3600,
      refresh_token: 'synthetic-refresh',
      user: { id: 'staff-1', email: 'editor@example.org', role: 'authenticated', aud: 'authenticated' },
    }
    for (let i = 0; i < 1; i++) {
      localStorage.setItem('sb-synthetic-hymns-cms-auth-token', JSON.stringify(session))
    }
  })

  await context.route('**/*', async (route) => {
    const request = route.request()
    const url = new URL(request.url())
    if (url.origin === base) return route.continue()
    if (url.origin !== endpoint) return route.abort()

    const cors = {
      'access-control-allow-origin': '*',
      'access-control-allow-headers': '*',
      'access-control-allow-methods': '*',
      'access-control-expose-headers': 'content-range',
    }
    const json = (body, status = 200, headers = {}) =>
      route.fulfill({ status, contentType: 'application/json', headers: { ...cors, ...headers }, body: JSON.stringify(body) })
    if (request.method() === 'OPTIONS') return json(null)

    const p = url.pathname
    const method = request.method()
    const eq = (key) => (url.searchParams.get(key) || '').replace(/^eq\./, '')
    const wantsObject = (request.headers().accept || '').includes('vnd.pgrst.object')
    const countHeader = (rows) =>
      request.headers().prefer?.includes('count=exact')
        ? { 'content-range': rows.length ? `0-${rows.length - 1}/${rows.length}` : '*/0' }
        : {}

    if (p.endsWith('/auth/v1/user')) return json({ id: 'staff-1', email: 'editor@example.org' })
    if (p.endsWith('/rest/v1/profiles')) {
      const profile = { id: 'staff-1', role: 'admin', display_name: 'Editor User', email: 'editor@example.org' }
      return json(wantsObject ? profile : [profile])
    }
    if (p.endsWith('/rest/v1/rpc/set_mezmur_classification_import')) {
      const body = JSON.parse(request.postData() || '{}')
      for (let i = categoryLinks.length - 1; i >= 0; i--) {
        if (categoryLinks[i].mezmur_import_id === body.p_mezmur_import_id) categoryLinks.splice(i, 1)
      }
      for (let i = occasionLinks.length - 1; i >= 0; i--) {
        if (occasionLinks[i].mezmur_import_id === body.p_mezmur_import_id) occasionLinks.splice(i, 1)
      }
      const m = mezmurs.get(body.p_mezmur_import_id)
      for (const slug of body.p_category_slugs || []) {
        categoryLinks.push({ mezmur_id: m?.mezmur_id || body.p_mezmur_import_id, mezmur_import_id: body.p_mezmur_import_id, mezmur_slug: m?.slug || '', category_slug: slug })
      }
      for (const slug of body.p_occasion_slugs || []) {
        occasionLinks.push({ mezmur_id: m?.mezmur_id || body.p_mezmur_import_id, mezmur_import_id: body.p_mezmur_import_id, mezmur_slug: m?.slug || '', occasion_slug: slug })
      }
      return json(null, 204)
    }
    if (p.endsWith('/rest/v1/rpc/publish_mezmur_import')) {
      const body = JSON.parse(request.postData() || '{}')
      const row = mezmurs.get(body.p_import_id)
      if (!row) return json({ message: 'Not found' }, 404)
      row.status = 'published'
      return json({ public_visible: true })
    }
    if (p.endsWith('/rest/v1/mezmur_data_import')) {
      if (method === 'GET') {
        let rows = [...mezmurs.values()].filter((r) => !r.deleted_at)
        if (url.searchParams.get('status')?.startsWith('eq.')) rows = rows.filter((r) => r.status === eq('status'))
        if (url.searchParams.get('status')?.startsWith('neq.')) rows = rows.filter((r) => r.status !== url.searchParams.get('status').replace(/^neq\./, ''))
        for (const k of ['import_id', 'mezmur_id', 'slug']) {
          if (url.searchParams.get(k)?.startsWith('eq.')) rows = rows.filter((r) => r[k] === eq(k))
        }
        const orParam = url.searchParams.get('or')
        if (orParam) {
          const match = orParam.match(/(?:import_id|mezmur_id|slug)\.eq\.([^,)]+)/)
          if (match) {
            const needle = match[1]
            rows = rows.filter((r) => r.import_id === needle || r.mezmur_id === needle || r.slug === needle)
          }
        }
        return json(wantsObject ? rows[0] || null : rows, 200, countHeader(rows))
      }
      if (method === 'POST') {
        const body = JSON.parse(request.postData() || '{}')
        const id = uuid(mezmurs.size + 1)
        const mId = id
        const created = {
          import_id: id,
          mezmur_id: mId,
          slug: body.slug || `new-mezmur-${mezmurs.size + 1}`,
          title: body.title || body.transliteration_title || 'New Mezmur',
          transliteration_title: body.transliteration_title || body.title || 'New Mezmur',
          title_amharic: body.title_amharic || null,
          title_english: body.title_english || null,
          description: body.description || null,
          description_amharic: null,
          lyrics_amharic: body.lyrics_amharic || null,
          lyrics_transliteration: body.lyrics_transliteration || null,
          lyrics_english: body.lyrics_english || null,
          lyrics_geez: body.lyrics_geez || null,
          lyrics_oromo: body.lyrics_oromo || null,
          primary_language: body.primary_language || 'am',
          form: body.form || 'mezmur',
          status: body.status || 'draft',
          featured: Boolean(body.featured),
          singer_id: body.singer_id || null,
          zemari_id: body.zemari_id || null,
          singer_slug: body.zemari_id === 'z-1' ? 'zemari-dawit' : null,
          singer_name: body.zemari_id === 'z-1' ? 'Zemari Dawit' : null,
          thumbnail_url: body.thumbnail_url || null,
          image_path: body.image_path || null,
          image_alt: body.image_alt || null,
          youtube_url: body.youtube_url || null,
          audio_url: body.audio_url || null,
          source_url: body.source_url || null,
          rights_status: 'owned',
          created_by: 'staff-1',
          updated_at: new Date().toISOString(),
          created_at: new Date().toISOString(),
          deleted_at: null,
          source_submission_id: null,
        }
        mezmurs.set(id, created)
        versions.set(id, [{ id: `v-${Date.now()}`, mezmur_id: id, created_at: new Date().toISOString(), changed_by: 'staff-1', snapshot: created }])
        return json(wantsObject ? created : [created], 201)
      }
      if (method === 'PATCH') {
        const id = eq('import_id') || eq('mezmur_id')
        const row = mezmurs.get(id)
        if (!row) return json(wantsObject ? null : [])
        Object.assign(row, JSON.parse(request.postData() || '{}'), { updated_at: new Date().toISOString() })
        if (row.zemari_id === 'z-1') {
          row.singer_name = 'Zemari Dawit'
          row.singer_slug = 'zemari-dawit'
        }
        return json(wantsObject ? row : [row])
      }
    }
    if (p.endsWith('/rest/v1/mezmur_public')) {
      let rows = [...mezmurs.values()].filter((m) => m.status === 'published' && !m.deleted_at)
      const slugParam = url.searchParams.get('slug')
      if (slugParam?.startsWith('eq.')) rows = rows.filter((r) => r.slug === slugParam.replace(/^eq\./, ''))
      else if (slugParam?.startsWith('in.(')) rows = rows.filter((r) => filterInParam(slugParam, r.slug))
      if (url.searchParams.get('form')?.startsWith('in.(')) rows = rows.filter((r) => filterInParam(url.searchParams.get('form'), r.form))
      if (url.searchParams.get('zemari_id')?.startsWith('eq.')) rows = rows.filter((r) => r.zemari_id === eq('zemari_id'))
      return json(wantsObject ? rows[0] || null : rows, 200, countHeader(rows))
    }
    if (/\/rest\/v1\/(mezmur_category_links_import|mezmur_category_links_public)$/.test(p)) {
      let rows = categoryLinks.slice()
      if (url.searchParams.get('mezmur_import_id')?.startsWith('eq.')) rows = rows.filter((r) => r.mezmur_import_id === eq('mezmur_import_id'))
      const cat = url.searchParams.get('category_slug')
      if (cat?.startsWith('eq.')) rows = rows.filter((r) => r.category_slug === eq('category_slug'))
      else if (cat?.startsWith('in.(')) rows = rows.filter((r) => filterInParam(cat, r.category_slug))
      return json(rows)
    }
    if (/\/rest\/v1\/(mezmur_occasion_links_import|mezmur_occasion_links_public)$/.test(p)) {
      let rows = occasionLinks.slice()
      if (url.searchParams.get('mezmur_import_id')?.startsWith('eq.')) rows = rows.filter((r) => r.mezmur_import_id === eq('mezmur_import_id'))
      const occ = url.searchParams.get('occasion_slug')
      if (occ?.startsWith('eq.')) rows = rows.filter((r) => r.occasion_slug === eq('occasion_slug'))
      else if (occ?.startsWith('in.(')) rows = rows.filter((r) => filterInParam(occ, r.occasion_slug))
      return json(rows)
    }
    if (p.endsWith('/rest/v1/categories')) return json([{ slug: 'virgin-mary', name: 'Virgin Mary' }])
    if (p.endsWith('/rest/v1/mezmur_occasions')) return json([{ slug: 'gena', name: 'Gena' }])
    if (p.endsWith('/rest/v1/mezmur_collections_import')) return json(collections)
    if (p.endsWith('/rest/v1/mezmur_sections_import')) return json(sections)
    if (/\/rest\/v1\/(zemaris|zemaris_with_counts)$/.test(p)) {
      const rows = url.searchParams.get('slug')?.startsWith('eq.') ? zemaris.filter((z) => z.slug === eq('slug')) : zemaris
      return json(wantsObject ? rows[0] || null : rows, 200, countHeader(rows))
    }
    if (p.endsWith('/rest/v1/community_submissions')) return json(submissions, 200, countHeader(submissions))
    if (p.endsWith('/rest/v1/content_versions')) return json(versions.get(eq('content_id')) || [])
    return json([], 200, countHeader([]))
  })

  const page = await context.newPage()
  page.setDefaultTimeout(12000)

  await run('Simplified Hymns dashboard shows 5 primary destinations, counts, search, recent edits, and collapsed Advanced Tools', async () => {
    await page.goto(`${base}/admin/hymns`)
    await page.getByRole('heading', { name: 'Hymns Practice', level: 1 }).waitFor()
    // 5 primary tabs + Overview = 6 tabs; Tags is hidden
    const nav = page.getByRole('navigation', { name: 'Hymns Practice sections' })
    for (const label of ['Overview', 'All Mezmurs', 'Categories & Occasions', 'Zemaris', 'Browse Collections', 'Review Queue']) {
      await nav.getByRole('link', { name: label, exact: true }).waitFor()
    }
    assert.equal(await nav.getByRole('link', { name: 'Tags' }).count(), 0)
    await page.getByText('Total Mezmurs').waitFor()
    await page.getByText('Unpublished (Draft)').waitFor()
    await page.getByRole('heading', { name: 'Recent edits' }).waitFor()
    await page.getByText('Existing Published Hymn').waitFor()
    // Advanced tools collapsed by default
    const advanced = page.locator('details').filter({ hasText: 'Advanced & Recovery Tools' })
    await advanced.waitFor()
    assert.equal(await advanced.getAttribute('open'), null)
    await advanced.locator('summary').click()
    await advanced.getByRole('link', { name: /CSV Import/ }).waitFor()
    await advanced.getByRole('link', { name: /Bulk Management/ }).waitFor()
    await advanced.getByRole('link', { name: /Version Review/ }).waitFor()
    await advanced.getByRole('link', { name: /Trash & Recovery/ }).waitFor()
    await page.screenshot({ path: path.join(screenshotDir, 'dashboard-desktop.png'), fullPage: true })
  })

  await run('Legacy /admin/hymns/occasions redirects to merged Categories & Occasions and /admin/hymns/review merges drafts + submissions', async () => {
    await page.goto(`${base}/admin/hymns/occasions`)
    await page.waitForURL((u) => u.pathname === '/admin/hymns/categories' && u.searchParams.get('tab') === 'occasions')
    await page.getByRole('heading', { name: 'Categories & Occasions', level: 1 }).waitFor()
    await page.getByRole('tab', { name: 'Occasions' }).waitFor()

    await page.goto(`${base}/admin/hymns/review`)
    await page.getByRole('heading', { name: 'Review Queue', level: 1 }).waitFor()
    await page.getByText('Pending Draft Wereb').waitFor()
    await page.getByText('Community Submitted Mezmur').waitFor()
  })

  await run('Guided 6-section Mezmur Editor create-edit-reopen-preview-publish-public-unpublish lifecycle', async () => {
    await page.goto(`${base}/admin/hymns/mezmur/new`)
    await page.getByRole('heading', { name: 'Add Mezmur', level: 1 }).waitFor()
    for (const heading of ['Basic information', 'Lyrics and translations', 'Singer', 'Categories and occasions', 'Approved media', 'Preview and publication']) {
      await page.getByRole('heading', { name: heading, level: 2 }).waitFor()
    }
    assert.equal(await page.getByText('Manage tags').count(), 0)
    await page.getByLabel('Publish readiness checklist').waitFor()

    await page.getByLabel(/Transliterated title/).fill('Staged Verification Wereb')
    await page.getByLabel(/Amharic title/).fill('የሙከራ ወረብ')
    await page.locator('textarea[id^="lyrics-"]').fill('የሙከራ ወረብ ግጥም')
    await page.getByLabel('Form').selectOption('werb')
    // Assign category + occasion + Zemari
    const catBox = page.getByRole('combobox', { name: 'Categories' })
    await catBox.click()
    await catBox.fill('Virgin')
    await page.getByRole('option', { name: /Virgin Mary/ }).first().click()
    await page.keyboard.press('Escape')

    const occBox = page.getByRole('combobox', { name: 'Occasions' })
    await occBox.click()
    await occBox.fill('Gena')
    await page.getByRole('option', { name: /Gena/ }).first().click()
    await page.keyboard.press('Escape')

    await page.getByRole('button', { name: 'Save Draft' }).click()
    await page.waitForURL((u) => /\/admin\/hymns\/mezmur\/.+\/edit/.test(u.pathname))
    await page.getByText('Mezmur saved as draft.').waitFor()

    // Verify draft is NOT leaked on public site
    await page.goto(`${base}/hymns/mezmur/staged-verification-wereb`)
    assert.equal(await page.getByText('የሙከራ ወረብ ግጥም').count(), 0)

    // Reopen in editor, preview, and publish
    await page.goBack()
    await page.getByRole('button', { name: 'Open live preview' }).click()
    await page.getByRole('heading', { name: 'Mezmur preview' }).waitFor()
    await page.getByRole('button', { name: 'Close' }).click()
    await page.screenshot({ path: path.join(screenshotDir, 'editor-desktop.png'), fullPage: true })

    await page.getByRole('button', { name: 'Publish', exact: true }).click()
    await page.getByText('Mezmur published successfully.').waitFor().catch(async (err) => {
      const alerts = await page.getByRole('alert').allInnerTexts().catch(() => [])
      const statuses = await page.getByRole('status').allInnerTexts().catch(() => [])
      throw new Error(`${err.message} | alerts=${JSON.stringify(alerts)} | statuses=${JSON.stringify(statuses)}`)
    })

    // Public detail & category & occasion & Wereb discovery reflect published hymn
    await page.goto(`${base}/hymns/mezmur/staged-verification-wereb`)
    await page.getByText('የሙከራ ወረብ ግጥም').waitFor()
    await page.goto(`${base}/hymns/category/virgin-mary?form=werb`)
    await page.getByText('Staged Verification Wereb').waitFor()

    // Return to Draft (unpublish) and verify hidden from public
    await page.goto(`${base}/admin/hymns/mezmur`)
    await page.locator('tr', { hasText: 'Staged Verification Wereb' }).getByRole('link', { name: 'Edit' }).click()
    await page.waitForURL((u) => /\/admin\/hymns\/mezmur\/.+\/edit/.test(u.pathname))
    await page.getByRole('heading', { name: 'Edit Mezmur', level: 1 }).waitFor()
    await page.getByRole('button', { name: 'Return to Draft' }).click()
    await page.getByText('Mezmur saved as draft.').waitFor()
    await page.goto(`${base}/hymns/mezmur/staged-verification-wereb`)
    assert.equal(await page.getByText('የሙከራ ወረብ ግጥም').count(), 0)
  })

  await run('Mobile (390px) dashboard and editor render cleanly without horizontal overflow', async () => {
    await page.setViewportSize({ width: 390, height: 844 })
    await page.goto(`${base}/admin/hymns`)
    await page.getByRole('heading', { name: 'Hymns Practice', level: 1 }).waitFor()
    const dashOverflow = await page.evaluate(() => {
      if (document.documentElement.scrollWidth <= window.innerWidth) return false
      const culprits = [...document.querySelectorAll('*')]
        .filter((el) => el.getBoundingClientRect().right > window.innerWidth + 1)
        .slice(0, 5)
        .map((el) => `${el.tagName}.${el.className}:${Math.round(el.getBoundingClientRect().right)}`)
      return culprits.join(', ') || true
    })
    assert.equal(dashOverflow, false, `Mobile dashboard overflow: ${dashOverflow}`)
    await page.screenshot({ path: path.join(screenshotDir, 'dashboard-mobile.png'), fullPage: true })

    await page.goto(`${base}/admin/hymns/mezmur/new`)
    await page.getByRole('heading', { name: 'Add Mezmur', level: 1 }).waitFor()
    await page.screenshot({ path: path.join(screenshotDir, 'editor-mobile.png'), fullPage: true })
  })

  console.log(`\n${passed} passed, ${failed} failed`)
  if (failed > 0) process.exitCode = 1
} finally {
  await browser?.close()
  await server.close()
}
