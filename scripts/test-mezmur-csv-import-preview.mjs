/**
 * Playwright E2E test for /admin/hymns/import (Mezmur CSV Import Preview)
 * Uses mocked Supabase HTTP (never touches production database).
 */
import assert from 'node:assert/strict'
import { mkdir, readFile } from 'node:fs/promises'
import { chromium } from 'playwright'
import { createServer } from 'vite'

process.env.VITE_SUPABASE_URL = 'https://cms-test.supabase.co'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_test_only'

const server = await createServer({
  server: { host: '127.0.0.1', port: 4179, strictPort: true },
})
await server.listen()

let browser
try {
  browser = await chromium.launch()
  const page = await browser.newPage({ viewport: { width: 1440, height: 1000 } })
  const errors = []
  page.on('pageerror', (error) => errors.push(error.message))

  const user = {
    id: '11111111-1111-1111-1111-111111111111',
    email: 'admin@example.invalid',
    aud: 'authenticated',
    role: 'authenticated',
    app_metadata: {},
    user_metadata: {},
    created_at: new Date().toISOString(),
  }
  const token = [
    Buffer.from('{"alg":"HS256","typ":"JWT"}').toString('base64url'),
    Buffer.from(
      JSON.stringify({
        sub: user.id,
        exp: Math.floor(Date.now() / 1000) + 3600,
        role: 'authenticated',
      }),
    ).toString('base64url'),
    'mock',
  ].join('.')

  const savedDrafts = []
  const savedSectionLinks = []
  const savedCategoryLinks = []
  const savedOccasionLinks = []
  let importCapabilityAllowed = true

  const zemaris = [
    {
      id: 'aaaaaaaa-0000-0000-0000-000000000010',
      slug: 'zemari-tewodros-yosef',
      name: 'Zemari Tewodros Yosef',
      name_amharic: 'ዘማሪ ቴዎድሮስ ዮሴፍ',
      status: 'published',
      sort_order: 10,
      is_featured: false,
      created_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    },
    {
      id: 'aaaaaaaa-0000-0000-0000-000000000011',
      slug: 'zemari-diyakon-dawit-fantaye',
      name: 'Zemari Diyakon Dawit Fantaye',
      name_amharic: 'ዘማሪ ዲያቆን ዳዊት ፋንታዬ',
      status: 'published',
      sort_order: 20,
      is_featured: false,
      created_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    },
  ]

  const sections = [
    {
      id: 'sec-1',
      section_id: 'sec-1',
      collection_id: 'col-1',
      slug: 'christ-general',
      section_slug: 'christ-general',
      title: 'Jesus Christ & Salvation',
      sort_order: 10,
      status: 'published',
    },
    {
      id: 'sec-2',
      section_id: 'sec-2',
      collection_id: 'col-1',
      slug: 'mary-general',
      section_slug: 'mary-general',
      title: 'Virgin Mary',
      sort_order: 20,
      status: 'published',
    },
  ]

  await page.route('https://cms-test.supabase.co/**', async (route) => {
    const request = route.request()
    const url = new URL(request.url())
    let body = {}
    let status = 200
    const headers = {}

    if (url.pathname === '/auth/v1/token') {
      body = {
        access_token: token,
        refresh_token: 'test-refresh',
        expires_in: 3600,
        token_type: 'bearer',
        user,
      }
    } else if (url.pathname === '/auth/v1/user') {
      body = user
    } else if (url.pathname === '/rest/v1/profiles') {
      body = {
        id: user.id,
        email: user.email,
        display_name: 'Test Admin',
        role: 'admin',
      }
    } else if (url.pathname === '/rest/v1/rpc/is_staff') {
      body = true
    } else if (url.pathname === '/rest/v1/rpc/set_mezmur_classification_import') {
      const posted = request.postDataJSON()
      const savedMezmur = savedDrafts.find(
        (row) => row.import_id === posted.p_mezmur_import_id,
      )
      assert.ok(savedMezmur, 'classification RPC must target the saved Mezmur UUID')
      savedCategoryLinks.push(
        ...(posted.p_category_slugs || []).map((categorySlug) => ({
          mezmur_import_id: posted.p_mezmur_import_id,
          category_slug: categorySlug,
        })),
      )
      savedOccasionLinks.push(
        ...(posted.p_occasion_slugs || []).map((occasionSlug) => ({
          mezmur_import_id: posted.p_mezmur_import_id,
          occasion_slug: occasionSlug,
        })),
      )
      body = null
    } else if (url.pathname === '/rest/v1/rpc/validate_zemari_import_access') {
      body = {
        user_id: user.id,
        is_staff: true,
        can_select_zemaris: true,
        can_insert_zemaris: importCapabilityAllowed,
        can_update_zemaris: true,
        can_update_mezmur_links: true,
      }
    } else if (url.pathname === '/rest/v1/zemaris' || url.pathname === '/rest/v1/zemaris_with_counts') {
      if (request.method() === 'POST' || request.method() === 'PATCH') {
        const posted = request.postDataJSON()
        const rec = {
          ...posted,
          id: posted.id || crypto.randomUUID(),
          created_at: new Date().toISOString(),
          updated_at: new Date().toISOString(),
        }
        zemaris.push(rec)
        body = [rec]
      } else {
        const slugFilter = url.searchParams.get('slug')?.replace(/^eq\./, '')
        const idFilter = url.searchParams.get('id')?.replace(/^eq\./, '')
        body = zemaris.filter(
          (row) => (!slugFilter || row.slug === slugFilter) && (!idFilter || row.id === idFilter),
        )
      }
    } else if (url.pathname === '/rest/v1/mezmur_sections_import') {
      body = sections
    } else if (url.pathname === '/rest/v1/mezmur_category_links_import') {
      body = [{ category_slug: 'virgin-mary' }, { category_slug: 'cross' }]
    } else if (url.pathname === '/rest/v1/mezmur_occasion_links_import') {
      if (request.method() === 'POST') {
        const posted = request.postDataJSON()
        savedOccasionLinks.push(posted)
        body = posted
      } else {
        body = []
      }
    } else if (url.pathname === '/rest/v1/mezmur_section_links_import') {
      if (request.method() === 'POST') {
        const posted = request.postDataJSON()
        savedSectionLinks.push(posted)
        body = posted
      } else {
        body = []
      }
    } else if (url.pathname === '/rest/v1/mezmur_data_import') {
      if (request.method() === 'POST' || request.method() === 'PATCH') {
        const posted = request.postDataJSON()
        const rec = {
          ...posted,
          import_id: posted.import_id || crypto.randomUUID(),
          mezmur_id: posted.mezmur_id || crypto.randomUUID(),
          id: posted.id || posted.mezmur_id || crypto.randomUUID(),
          created_at: new Date().toISOString(),
          updated_at: new Date().toISOString(),
        }
        savedDrafts.push(rec)
        body = [rec]
      } else {
        body = []
      }
    } else {
      body = []
    }

    await route.fulfill({
      status,
      headers: { ...headers, 'access-control-expose-headers': 'content-range' },
      contentType: 'application/json',
      body: JSON.stringify(body),
    })
  })

  const base = 'http://127.0.0.1:4179'
  await page.goto(`${base}/admin/login`)
  await page.getByLabel('Email', { exact: true }).fill(user.email)
  await page.getByLabel('Password', { exact: true }).fill('test-password')
  await page.getByRole('button', { name: 'Sign in', exact: true }).click()
  await page.getByRole('heading', { name: 'Dashboard', exact: true }).waitFor()

  // Navigate to /admin/hymns/import
  await page.goto(`${base}/admin/hymns/import`)
  await page.getByRole('heading', { name: 'Mezmur CSV Import Preview' }).waitFor()

  // 1. Verify initial sample staged rows render with Amharic Unicode preserved
  assert.equal(
    await page.getByLabel('Amharic title row 1').inputValue(),
    'ኑ በእግዚአብሔር ደስ ይበለን',
  )

  // 2. Upload a real 10-row slice of mezmurs_2000.csv (including 1 intentional duplicate row)
  const fullCsv = await readFile(
    new URL('../mezmur-research/exports/mezmurs_2000.csv', import.meta.url),
    'utf8',
  )
  // Split RFC 4180 records without breaking inside multiline quoted cells
  const rawRecords = []
  let cur = ''
  let inQuotes = false
  for (let i = 0; i < fullCsv.length; i += 1) {
    const ch = fullCsv[i]
    const next = fullCsv[i + 1]
    if (ch === '"') {
      if (inQuotes && next === '"') {
        cur += '""'
        i += 1
      } else {
        inQuotes = !inQuotes
        cur += ch
      }
    } else if (!inQuotes && (ch === '\r' || ch === '\n')) {
      if (ch === '\r' && next === '\n') i += 1
      if (cur.trim()) rawRecords.push(cur)
      cur = ''
    } else {
      cur += ch
    }
  }
  if (cur.trim()) rawRecords.push(cur)

  const sliceLines = [rawRecords[0], ...rawRecords.slice(1, 11), rawRecords[1]] // 10 unique + 1 duplicate
  const uploadBuffer = Buffer.from(sliceLines.join('\r\n'), 'utf8')

  const fileInput = page.getByLabel('Upload Mezmur CSV file')
  await fileInput.setInputFiles({
    name: 'mezmurs_slice_test.csv',
    mimeType: 'text/csv',
    buffer: uploadBuffer,
  })

  await page
    .getByRole('status')
    .filter({ hasText: 'Loaded 11 rows from "mezmurs_slice_test.csv"' })
    .waitFor()

  // 3. Verify Duplicate Review tab shows the 1 duplicate row
  await page.getByRole('tab', { name: /Duplicates \(1\)/ }).click()
  await page.getByText(/Duplicate of row-1/).waitFor()
  await page.getByRole('tab', { name: /All Staged \(11\)/ }).click()

  // 4. Edit Amharic title, transliteration title, category, and occasion inline on Row 1
  await page.getByLabel('Amharic title row 1', { exact: true }).fill('ናና አማኑኤል የተስተካከለ')
  await page.getByLabel('Transliteration title row 1', { exact: true }).fill('Nana Amanuel Edited')
  await page.getByLabel('Category row 1', { exact: true }).selectOption('Virgin Mary')
  await page.getByLabel('Occasion row 1', { exact: true }).selectOption('Kidane Mihret')
  await page
    .getByLabel('Zemari profile match row 1', { exact: true })
    .selectOption('aaaaaaaa-0000-0000-0000-000000000010')

  // 5. Open Sections & Details modal on Row 1 and assign multiple hymn sections
  await page.getByRole('button', { name: 'Sections & Details' }).first().click()
  await page.getByRole('dialog').waitFor()
  const majorFeastsCheck = page.getByRole('dialog').getByLabel(/Virgin Mary/)
  if (!(await majorFeastsCheck.isChecked())) {
    await majorFeastsCheck.check()
  }
  await page.getByRole('dialog').getByRole('button', { name: 'Done' }).click()

  // 6. Select Row 1 for draft import and trigger "Import 1 Selected as Drafts"
  await page.getByLabel('Select row 1', { exact: true }).check()
  page.once('dialog', (dialog) => dialog.accept())
  await page.getByRole('button', { name: 'Import 1 Selected as Drafts' }).click()

  await page
    .getByRole('status')
    .filter({ hasText: 'Successfully imported 1 Mezmur record(s) as unpublished drafts' })
    .waitFor()

  assert.equal(savedDrafts.length, 1)
  assert.equal(savedDrafts[0].title, 'Nana Amanuel Edited')
  assert.equal(savedDrafts[0].title_amharic, 'ናና አማኑኤል የተስተካከለ')
  assert.equal(savedDrafts[0].status, 'draft')
  assert.equal(savedDrafts[0].zemari_id, 'aaaaaaaa-0000-0000-0000-000000000010')
  assert.ok(
    savedCategoryLinks.some(
      (link) =>
        link.mezmur_import_id === savedDrafts[0].import_id &&
        link.category_slug === 'virgin-mary',
    ),
  )
  assert.ok(
    savedOccasionLinks.some(
      (link) =>
        link.mezmur_import_id === savedDrafts[0].import_id &&
        link.occasion_slug === 'kidane-mihret',
    ),
  )
  assert.ok(savedSectionLinks.length >= 1)

  // 7. Navigate to /admin/hymns/zemaris and test Bulk Import Zemaris CSV panel
  await page.goto(`${base}/admin/hymns/zemaris`)
  await page.getByRole('heading', { name: 'Zemari Library' }).waitFor()
  await page.getByRole('button', { name: 'Bulk Import Zemaris CSV' }).click()
  await page.getByRole('heading', { name: 'Bulk Import Zemaris' }).waitFor()
  // Clear selection, select row 2, run the no-write validation, and import one draft.
  await page.getByRole('button', { name: 'Clear Selection' }).click()
  await page.getByLabel('Select Zemari row 2', { exact: true }).check()
  await page.getByRole('button', { name: 'Validate Import' }).click()
  await page.getByLabel('Import validation summary').waitFor()
  await page.getByText(/Validation summary — no database writes/).waitFor()
  await mkdir(new URL('../artifacts/', import.meta.url), { recursive: true })
  await page.screenshot({
    path: new URL('../artifacts/zemari-import-validation.png', import.meta.url).pathname.slice(1),
    fullPage: true,
  })
  await page.getByRole('button', { name: 'Import 1 Selected Zemaris' }).click()
  await page
    .getByRole('status')
    .filter({ hasText: 'Successfully imported 1 Zemaris as draft.' })
    .waitFor()
  assert.equal(zemaris.length, 3)
  assert.equal(zemaris.at(-1).slug, 'jan-yared')
  assert.equal(zemaris.at(-1).name_amharic, 'ጃን ያሬድ')
  assert.equal(zemaris.at(-1).status, 'draft')

  // Reload and validate again: the same source row is now a duplicate and cannot be inserted twice.
  await page.getByRole('button', { name: 'Load 185 Zemaris (With Lyrics)' }).click()
  await page.getByRole('button', { name: 'Validate Import' }).click()
  await page.getByLabel('Import validation summary').waitFor()
  assert.equal(await page.getByLabel('Select Zemari row 2', { exact: true }).isDisabled(), true)
  assert.equal(zemaris.length, 3)

  // Capability denial is shown clearly and leaves the import action disabled.
  importCapabilityAllowed = false
  await page.getByRole('button', { name: 'Validate Import' }).click()
  await page.getByRole('alert').filter({ hasText: /cannot create Zemari profiles/i }).waitFor()
  assert.equal(await page.getByRole('button', { name: /Import .* Selected Zemaris/ }).isDisabled(), true)

  assert.deepEqual(errors, [])

  console.log(
    'Playwright Mezmur & Zemari CSV Import Preview tests passed: CSV upload, duplicate detection, inline editing, section & Zemari linking, no-write validation, one-record draft import, read-back, and repeat-import prevention.',
  )
} finally {
  await browser?.close()
  await server.close()
}
