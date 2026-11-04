/** Browser coverage with an in-memory Supabase fixture. No production requests. */
import assert from 'node:assert/strict'
import { chromium } from 'playwright'
import { createServer } from 'vite'

process.env.VITE_SUPABASE_URL = 'https://faith-challenges-test.supabase.co'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_fixture_only'
const server = await createServer({ server: { host: '127.0.0.1', port: 4185, strictPort: true } })
await server.listen()
let browser
try {
  browser = await chromium.launch()
  const page = await browser.newPage({ viewport: { width: 1280, height: 900 } })
  const errors = []
  page.on('pageerror', error => errors.push(error.message))
  await page.route('**/*', route => ['http://127.0.0.1:4185', 'https://faith-challenges-test.supabase.co'].includes(new URL(route.request().url()).origin) ? route.continue() : route.abort())
  const user = { id: '11111111-1111-1111-1111-111111111111', email: 'editor@example.invalid', aud: 'authenticated', role: 'authenticated', app_metadata: {}, user_metadata: {}, created_at: new Date().toISOString() }
  const token = [Buffer.from('{"alg":"HS256","typ":"JWT"}').toString('base64url'),
    Buffer.from(JSON.stringify({ sub: user.id, exp: Math.floor(Date.now() / 1000) + 3600, role: 'authenticated' })).toString('base64url'), 'fixture'].join('.')
  let staff = true
  let role = 'editor'
  // Mirrors public.play_content_transition_allowed(): editors only submit drafts for review; admins do the rest.
  const adminEdges = ['review>approved', 'review>rejected', 'review>draft', 'review>archived', 'approved>published', 'approved>draft',
    'approved>archived', 'rejected>draft', 'rejected>archived', 'published>draft', 'published>archived', 'draft>archived', 'archived>draft']
  const allowed = (from, to) => (from === 'draft' && to === 'review' && ['editor', 'admin'].includes(role)) ||
    (role === 'admin' && adminEdges.includes(`${from}>${to}`))
  let counter = 0
  const now = () => new Date(Date.now() + counter++ * 1000).toISOString()
  const rows = []
  const record = value => ({ id: crypto.randomUUID(), question_id: value.question_id, stable_id: value.stable_id,
    game_type: value.game_type, category: value.category, difficulty: value.difficulty, status: 'draft',
    payload: value.payload, source_references: value.source_references, review_notes: null, updated_at: now(), published_at: null })
  await page.route('https://faith-challenges-test.supabase.co/**', async route => {
    const request = route.request()
    const url = new URL(request.url())
    let data = null; let status = 200; let headers = {}
    if (url.pathname === '/auth/v1/token') data = { access_token: token, refresh_token: 'fixture-refresh', expires_in: 3600, token_type: 'bearer', user }
    else if (url.pathname === '/auth/v1/user') data = user
    else if (url.pathname === '/rest/v1/profiles') data = { id: user.id, email: user.email, role: staff ? role : 'user' }
    else if (url.pathname === '/rest/v1/rpc/is_staff') data = staff
    else if (url.pathname === '/rest/v1/rpc/review_play_content') {
      if (!staff) { status = 403; data = { message: 'Staff role required', code: '42501' } }
      else {
        const input = request.postDataJSON()
        const item = rows.find(row => row.id === input.p_id)
        if (!item) { status = 404; data = { message: 'Question not found' } }
        else if (!allowed(item.status, input.p_status)) { status = 400; data = { message: 'Invalid editorial transition', code: '22023' } }
        else {
          item.status = input.p_status
          item.review_notes = input.p_notes
          item.updated_at = now()
          item.published_at = item.status === 'published' ? now() : null
          data = item
        }
      }
    } else if (url.pathname === '/rest/v1/play_content_items') {
      if (!staff) { status = 403; data = { message: 'Staff role required', code: '42501' } }
      else {
        const id = url.searchParams.get('id')?.replace(/^eq\./, '')
        let selected = id ? rows.filter(row => row.id === id) : [...rows]
        if (request.method() === 'POST') {
          const input = request.postDataJSON()
          assert.equal(input.question_id, input.stable_id)
          rows.push(record(input)); selected = [rows.at(-1)]
        } else if (request.method() === 'PATCH') {
          selected.forEach(row => Object.assign(row, request.postDataJSON(), { updated_at: now() }))
        }
        const count = selected.length
        const from = Number(url.searchParams.get('offset') || 0)
        const to = from + Number(url.searchParams.get('limit') || count || 250)
        if (url.searchParams.has('offset') || url.searchParams.has('limit')) selected = selected.slice(from, to)
        headers = { 'content-range': `${from}-${from + selected.length - 1}/${count}`, 'access-control-expose-headers': 'content-range' }
        data = request.headers().accept?.includes('vnd.pgrst.object') ? selected[0] || null : selected
      }
    } else if (url.pathname.startsWith('/rest/v1/') && ['GET', 'HEAD'].includes(request.method())) data = []
    else throw new Error(`Unexpected fixture request: ${url.pathname}`)
    await route.fulfill({ status, headers, contentType: 'application/json', body: request.method() === 'HEAD' ? '' : JSON.stringify(data) })
  })

  await page.goto('http://127.0.0.1:4185/admin/play')
  await page.getByLabel('Email', { exact: true }).fill(user.email)
  await page.getByLabel('Password', { exact: true }).fill('fixture-password')
  await page.getByRole('button', { name: 'Sign in', exact: true }).click()
  await page.getByRole('heading', { name: 'Dashboard', exact: true }).waitFor()
  await page.getByRole('navigation', { name: 'Admin navigation' }).getByRole('link', { name: 'Faith Challenges' }).click()
  await page.getByRole('heading', { name: 'Game Content Studio', exact: true }).waitFor()
  assert.equal(await page.locator('[data-game-content-studio]').count(), 1)
  assert.equal(await page.locator('[data-studio-game]').count(), 0)
  assert.equal(await page.locator('[data-game-selector] option').count(), 13)
  assert.equal(await page.locator('button[data-game]').count(), 0)
  assert.equal(await page.getByRole('region', { name: 'Question editor', exact: true }).count(), 0)
  await page.getByRole('combobox', { name: 'Game', exact: true }).selectOption('trivia')
  await page.getByRole('button', { name: 'Create content', exact: true }).click()
  const editor = page.getByRole('region', { name: 'Dedicated game editor' })
  const prompt = editor.getByLabel('Question / ጥያቄ · English', { exact: true })
  await prompt.fill('')
  assert.equal(await page.getByRole('button', { name: /^Save draft/ }).isDisabled(), true)
  await page.getByRole('region', { name: 'Validation errors' }).waitFor()
  assert.equal(rows.length, 0, 'invalid draft must not be persisted')
  await editor.locator('details').filter({ has: page.getByLabel('Stable question ID / ቋሚ መለያ', { exact: true }) }).locator('summary').click()
  await editor.getByLabel('Stable question ID / ቋሚ መለያ', { exact: true }).fill('creation-fixture')
  await editor.getByLabel('Category / ምድብ', { exact: true }).fill('Bible')
  await prompt.fill('What was created?')
  await editor.getByLabel('Explanation / ማብራሪያ · English', { exact: true }).fill('Genesis describes creation.')
  for (const [index, answer] of ['Heaven', 'Earth', 'Moon', 'Stars'].entries()) await editor.getByLabel('Answer ' + (index + 1) + ' / መልስ · English', { exact: true }).fill(answer)
  await page.getByRole('button', { name: /^Save draft/ }).click()
  await page.waitForFunction(() => new URLSearchParams(location.search).get('item') !== 'new')
  assert.equal(rows.length, 1); assert.equal(rows[0].status, 'draft')
  await page.reload()
  await page.getByLabel('Question / ጥያቄ · English', { exact: true }).waitFor()
  assert.equal(await page.getByLabel('Question / ጥያቄ · English', { exact: true }).inputValue(), 'What was created?')
  await page.getByRole('button', { name: /Playable preview/ }).click()
  await page.getByRole('region', { name: 'Playable editorial preview' }).getByText('What was created?', { exact: true }).waitFor()
  const confirmClick = async button => { page.once('dialog', dialog => dialog.accept()); await button.click() }
  assert.equal(await page.getByRole('button', { name: 'Approve / አጽድቅ', exact: true }).count(), 0)
  await confirmClick(page.getByRole('button', { name: 'Submit for review / ለግምገማ አቅርብ', exact: true }))
  await page.getByRole('status').filter({ hasText: /confirmed: review/ }).first().waitFor()
  assert.equal(rows[0].status, 'review')
  for (const name of ['Approve / አጽድቅ', 'Reject / ውድቅ አድርግ', 'Publish / አትም', 'Archive / ማህደር አስገባ']) assert.equal(await page.getByRole('button', { name, exact: true }).count(), 0)
  role = 'admin'; await page.reload()
  await page.getByRole('button', { name: 'Approve / አጽድቅ', exact: true }).waitFor()
  await confirmClick(page.getByRole('button', { name: 'Approve / አጽድቅ', exact: true }))
  await page.getByRole('button', { name: 'Publish / አትም', exact: true }).waitFor()
  assert.equal(rows[0].status, 'approved')
  await confirmClick(page.getByRole('button', { name: 'Publish / አትም', exact: true }))
  await page.getByRole('button', { name: 'Unpublish to draft / ህትመት አስወግድ', exact: true }).waitFor()
  assert.equal(rows[0].status, 'published'); assert.ok(rows[0].published_at)
  assert.equal(await page.getByLabel('Question / ጥያቄ · English', { exact: true }).isDisabled(), true)
  page.once('dialog', dialog => dialog.dismiss())
  await page.getByRole('button', { name: 'Unpublish to draft / ህትመት አስወግድ', exact: true }).click()
  assert.equal(rows[0].status, 'published')
  await confirmClick(page.getByRole('button', { name: 'Unpublish to draft / ህትመት አስወግድ', exact: true }))
  await page.getByRole('button', { name: 'Submit for review / ለግምገማ አቅርብ', exact: true }).waitFor()
  assert.equal(rows[0].status, 'draft')
  await page.goto('http://127.0.0.1:4185/admin/play')
  await page.getByRole('combobox', { name: 'Status', exact: true }).getByRole('option', { name: 'draft (1)', exact: true }).waitFor({ state: 'attached' })
  await page.getByLabel('Search content', { exact: true }).fill('zzz-no-match')
  await page.getByText(/No saved content matches/).waitFor()
  await page.getByLabel('Search content', { exact: true }).fill('')
  await page.getByRole('region', { name: 'Content library' }).getByRole('link', { name: 'What was created?', exact: true }).waitFor()
  await page.getByRole('link', { name: /Advanced import/ }).click()
  await page.waitForURL('**/admin/play/import')
  await page.getByRole('heading', { name: /Import & data tools/ }).waitFor()
  const draftJson = page.getByLabel('Draft JSON / የረቂቅ JSON', { exact: true })
  await draftJson.fill('{bad')
  await page.getByRole('alert').filter({ hasText: 'Import must be valid JSON.' }).waitFor()
  const imported = { ...rows[0], stable_id: 'import-fixture', payload: { ...rows[0].payload, id: 'import-fixture', prompt: { en: 'Imported question', am: 'የሙከራ ጥያቄ' } } }
  await draftJson.fill(JSON.stringify([imported]))
  const importButton = page.getByRole('button', { name: /^Import as drafts/ })
  assert.equal(await importButton.isDisabled(), true)
  await page.getByRole('checkbox', { name: /I reviewed these drafts/ }).check()
  await importButton.click()
  await page.getByRole('status').filter({ hasText: /Imported 1 drafts/ }).waitFor()
  assert.equal(rows.length, 2); assert.equal(rows[1].status, 'draft'); assert.equal(rows[1].published_at, null)
  await draftJson.fill(JSON.stringify([imported]))
  await page.getByRole('alert').filter({ hasText: /stable ID already exists/ }).waitFor()
  assert.equal(await importButton.isDisabled(), true)
  await page.getByRole('link', { name: /Back to Studio/ }).click()
  await page.getByRole('heading', { name: 'Game Content Studio', exact: true }).waitFor()
  staff = false; await page.reload()
  await page.getByRole('heading', { name: 'CMS sign in' }).waitFor()
  assert.equal(await page.locator('[data-game-content-studio]').count(), 0)
  assert.deepEqual(errors, [])
  console.log('PASS unified Studio: invalid-save prevention, create/reload/preview, editor-only review, admin approval/publication/confirmed unpublish, search/counts, validated draft import, duplicate rejection and unauthorized access. Mocked API, not live RLS.')

} finally {
  await browser?.close()
  await server.close()
}
