/** Browser integration with mocked Supabase HTTP. SQL security is tested separately. */
import assert from 'node:assert/strict'
import { mkdir } from 'node:fs/promises'
import { chromium } from 'playwright'
import { createServer } from 'vite'
process.env.VITE_SUPABASE_URL = 'https://cms-test.supabase.co'
process.env.VITE_SUPABASE_ANON_KEY = 'sb_publishable_test_only'
const server = await createServer({ server: { host: '127.0.0.1', port: 4176, strictPort: true } })
await server.listen()
let browser
try {
  browser = await chromium.launch()
  const page = await browser.newPage({ viewport: { width: 1440, height: 1000 } })
  const errors = []
  page.on('pageerror', error => errors.push(error.message))
  const user = { id: '11111111-1111-1111-1111-111111111111', email: 'admin@example.invalid', aud: 'authenticated', role: 'authenticated', app_metadata: {}, user_metadata: {}, created_at: new Date().toISOString() }
  const token = [Buffer.from('{"alg":"HS256","typ":"JWT"}').toString('base64url'), Buffer.from(JSON.stringify({ sub: user.id, exp: Math.floor(Date.now() / 1000) + 3600, role: 'authenticated' })).toString('base64url'), 'mock'].join('.')
  let role = 'admin'
  let saveFails = false
  let uploadFails = false
  let profileFails = false
  let clock = Date.now()
  const now = () => new Date(++clock).toISOString()
  const tables = {
    community_submissions: [], mezmur: [], saints: [], feasts: [], prayers: [], articles: [], content_versions: [], mezmur_tags: [],
    categories: [{ id: 'aaaaaaaa-0000-0000-0000-000000000001', name: 'Praise', name_amharic: 'ምስጋና', slug: 'praise', type: 'mezmur', is_archived: false }],
    singers: [{ id: 'aaaaaaaa-0000-0000-0000-000000000002', name: 'Choir', is_archived: false }],
    tags: [{ id: 'aaaaaaaa-0000-0000-0000-000000000003', name: 'Sunday', slug: 'sunday' }],
  }
  const uploads = []
  const requests = []
  const pixel = Buffer.from('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+j5ioAAAAASUVORK5CYII=', 'base64')
  await page.route('https://cms-test.supabase.co/**', async route => {
    const request = route.request()
    const url = new URL(request.url())
    requests.push(url)
    let body = {}; let status = 200; let headers = {}
    if (url.pathname === '/auth/v1/token') body = { access_token: token, refresh_token: 'test-refresh', expires_in: 3600, token_type: 'bearer', user }
    else if (url.pathname === '/auth/v1/user') body = user
    else if (url.pathname === '/auth/v1/logout') { status = 204; body = null }
    else if (url.pathname === '/rest/v1/profiles') {
      if (profileFails) { status = 500; body = { message: 'Profile unavailable' } }
      else body = { id: user.id, email: user.email, display_name: 'Test administrator', role }
    }
    else if (url.pathname === '/rest/v1/rpc/cms_version_authors') body = [{ id: user.id, display_name: 'Test administrator' }]
    else if (url.pathname === '/rest/v1/rpc/save_mezmur') {
      const { payload, tag_ids, expected_updated_at } = request.postDataJSON()
      const existing = tables.mezmur.find(row => row.id === payload.id)
      if (saveFails) { status = 409; body = { code: '40001', message: 'This mezmur changed since you opened it. Reload before saving.' } }
      else if (existing && existing.updated_at !== expected_updated_at) { status = 409; body = { code: '40001', message: 'Stale edit' } }
      else {
        tables.content_versions.unshift({ id: crypto.randomUUID(), content_type: 'mezmur', content_id: payload.id, created_at: now(), changed_by: user.id, snapshot: { operation: existing ? 'UPDATE' : 'INSERT', state: existing ? 'before' : 'created', record: structuredClone(existing || payload), tag_ids: tables.mezmur_tags.filter(tag => tag.mezmur_id === payload.id).map(tag => tag.tag_id) } })
        body = { ...payload, created_at: existing?.created_at || now(), created_by: existing?.created_by || user.id, updated_by: user.id, updated_at: now(), published_at: payload.status === 'published' ? now() : null }
        if (existing) Object.assign(existing, body); else tables.mezmur.push(body)
        tables.mezmur_tags = tables.mezmur_tags.filter(tag => tag.mezmur_id !== payload.id).concat(tag_ids.map(tag_id => ({ mezmur_id: payload.id, tag_id })))
        // Real PostgREST composite RPCs require the object Accept header.
        assert.ok(request.headers().accept.includes('vnd.pgrst.object'))
      }
    } else if (url.pathname.startsWith('/storage/v1/object/sign/') && request.method() === 'POST') {
      body = { signedURL: url.pathname.replace('/storage/v1', '') + '?token=test' }
    } else if (url.pathname.startsWith('/storage/v1/object/sign/') && request.method() === 'GET') {
      return route.fulfill({ status: 200, contentType: 'image/png', body: pixel })
    } else if (url.pathname.startsWith('/storage/v1/object/') && request.method() === 'POST') {
      if (uploadFails) { status = 500; body = { message: 'Upload failed', error: 'Upload failed' } }
      else { uploads.push(url.pathname); body = { Key: url.pathname.split('/object/')[1] } }
    } else if (url.pathname.startsWith('/rest/v1/')) {
      const table = url.pathname.split('/').at(-1)
      assert.ok(table in tables, 'Unexpected table ' + table)
      let selected = tables[table].filter(row => {
        for (const [key, value] of url.searchParams) {
          if (value.startsWith('eq.') && String(row[key]) !== value.slice(3)) return false
        }
        const search = url.searchParams.get('or')?.match(/title.ilike.%([^%]*)%/)?.[1]
        return !search || row.title?.toLowerCase().includes(search.toLowerCase())
      })
      if (request.method() === 'POST') {
        const record = { ...request.postDataJSON(), id: crypto.randomUUID(), is_archived: false }
        tables[table].push(record); selected = [record]
      } else if (request.method() === 'PATCH') selected.forEach(row => Object.assign(row, request.postDataJSON()))
      else if (request.method() === 'DELETE') tables[table] = tables[table].filter(row => !selected.includes(row))
      const count = selected.length
      const sort = url.searchParams.get('order')?.split(',')[0]?.split('.')
      if (sort) selected.sort((a, b) => String(a[sort[0]] || '').localeCompare(String(b[sort[0]] || '')) * (sort[1] === 'desc' ? -1 : 1))
      const start = Number(url.searchParams.get('offset') || 0)
      selected = selected.slice(start, start + Number(url.searchParams.get('limit') || 1000))
      headers = { 'content-range': `${start}-${start + selected.length - 1}/${count}` }
      body = request.headers().accept?.includes('vnd.pgrst.object') ? selected[0] : selected
    } else throw new Error('Unexpected request ' + url.pathname)
    await route.fulfill({ status, headers: { ...headers, 'access-control-expose-headers': 'content-range' }, contentType: 'application/json', body: status === 204 || request.method() === 'HEAD' ? '' : JSON.stringify(body) })
  })
  const base = 'http://127.0.0.1:4176'
  await page.goto(base + '/admin')
  await page.getByLabel('Email', { exact: true }).fill(user.email)
  await page.getByLabel('Password', { exact: true }).fill('test-password')
  await page.getByRole('button', { name: 'Sign in', exact: true }).click()
  await page.getByRole('heading', { name: 'Dashboard', exact: true }).waitFor()
  await page.getByRole('link', { name: '+ Add Mezmur' }).click()
  await page.getByRole('button', { name: 'Save Draft', exact: true }).click()
  await page.getByRole('alert').filter({ hasText: 'Title is required' }).waitFor()
  await page.getByLabel('Title *', { exact: true }).fill('Test Hymn')
  await page.getByRole('button', { name: 'Generate from title' }).click()
  await page.getByLabel('Amharic title', { exact: true }).fill('ምስጋና')
  await page.getByLabel('English lyrics', { exact: true }).fill('Praise in the morning\nPeace in the evening')
  await page.getByLabel('Singer', { exact: true }).selectOption(tables.singers[0].id)
  await page.getByLabel('Category', { exact: true }).selectOption(tables.categories[0].id)
  await page.getByLabel('Sunday', { exact: true }).check()
  await page.getByRole('button', { name: 'Save Draft', exact: true }).click()
  await page.getByRole('heading', { name: 'Edit Mezmur' }).waitFor()
  assert.equal(tables.mezmur.length, 1)
  assert.equal(tables.mezmur[0].status, 'draft')
  const id = tables.mezmur[0].id
  // Background session/profile refresh must not destroy unsaved editor state.
  await page.getByLabel('Title *', { exact: true }).fill('Edited Hymn')
  await page.evaluate(() => window.dispatchEvent(new Event('focus')))
  await page.getByLabel('Title *', { exact: true }).waitFor()
  assert.equal(await page.getByLabel('Title *', { exact: true }).inputValue(), 'Edited Hymn')
  profileFails = true
  await page.evaluate(() => window.dispatchEvent(new Event('focus')))
  await page.getByRole('alert').filter({ hasText: 'Unable to verify CMS access' }).waitFor()
  assert.equal(await page.getByLabel('Title *', { exact: true }).inputValue(), 'Edited Hymn')
  profileFails = false
  await page.getByRole('button', { name: 'Retry', exact: true }).click()
  await page.getByRole('alert').filter({ hasText: 'Unable to verify CMS access' }).waitFor({ state: 'hidden' })
  await page.getByRole('navigation', { name: 'Admin navigation' }).getByRole('link', { name: 'Dashboard', exact: true }).click()
  await page.getByRole('dialog', { name: 'Leave without saving?' }).waitFor()
  await page.getByRole('button', { name: 'Keep editing' }).click()
  saveFails = true
  await page.getByRole('button', { name: 'Save Draft', exact: true }).click()
  await page.getByRole('alert').filter({ hasText: 'changed since you opened' }).waitFor()
  assert.equal(await page.getByLabel('Title *', { exact: true }).inputValue(), 'Edited Hymn')
  saveFails = false
  const imageInput = page.getByLabel('Thumbnail upload', { exact: false })
  await imageInput.setInputFiles({ name: 'bad.svg', mimeType: 'image/svg+xml', buffer: Buffer.from('<svg/>') })
  await page.getByRole('alert').filter({ hasText: 'Choose a JPEG' }).waitFor()
  uploadFails = true
  await imageInput.setInputFiles({ name: 'cover.png', mimeType: 'image/png', buffer: pixel })
  await page.getByRole('alert').filter({ hasText: 'Upload failed' }).waitFor()
  uploadFails = false
  await imageInput.setInputFiles({ name: 'cover.png', mimeType: 'image/png', buffer: pixel })
  await page.getByRole('status').filter({ hasText: 'Upload complete' }).waitFor()
  await page.getByLabel('Audio upload', { exact: false }).setInputFiles({ name: 'audio.mp3', mimeType: 'audio/mpeg', buffer: Buffer.from('ID3-test-audio') })
  await page.getByRole('status').filter({ hasText: 'Upload complete' }).waitFor()
  await page.getByRole('button', { name: 'Save Draft', exact: true }).click()
  await page.getByRole('status').filter({ hasText: 'Mezmur saved as draft' }).waitFor()
  assert.equal(uploads.length, 2)
  assert.ok(tables.mezmur[0].audio_url.startsWith('storage://mezmur-audio/'))
  await page.getByRole('button', { name: 'Preview', exact: true }).click()
  await page.getByRole('dialog', { name: 'Mezmur preview' }).waitFor()
  await page.getByRole('button', { name: 'Close dialog' }).click()
  await page.getByRole('button', { name: 'Submit for Review', exact: true }).click()
  await page.getByRole('status').filter({ hasText: 'saved as pending review' }).waitFor()
  role = 'editor'
  await page.reload()
  page.once('dialog', dialog => dialog.accept())
  await page.getByRole('button', { name: 'Reject', exact: true }).click()
  await page.getByRole('status').filter({ hasText: 'saved as rejected' }).waitFor()
  assert.equal(tables.mezmur[0].status, 'rejected')
  await page.getByRole('button', { name: 'Submit for Review', exact: true }).click()
  await page.getByRole('status').filter({ hasText: 'saved as pending review' }).waitFor()
  await page.getByRole('button', { name: 'Publish', exact: true }).click()
  await page.getByRole('status').filter({ hasText: 'saved as published' }).waitFor()
  assert.equal(tables.mezmur[0].status, 'published')
  role = 'admin'
  await page.reload()
  await page.locator('summary').first().click()
  await page.getByRole('button', { name: 'Restore as draft' }).first().waitFor()
  page.once('dialog', dialog => dialog.accept())
  await page.getByRole('button', { name: 'Restore as draft' }).first().click()
  assert.equal(await page.getByLabel('Status', { exact: true }).inputValue(), 'draft')
  page.once('dialog', dialog => dialog.accept())
  await page.getByRole('button', { name: 'Save Draft', exact: true }).click()
  await page.getByRole('status').filter({ hasText: 'saved as draft' }).waitFor()
  await page.getByRole('navigation', { name: 'Admin navigation' }).getByRole('link', { name: 'Mezmur', exact: true }).click()
  await page.getByRole('button', { name: 'Duplicate', exact: true }).click()
  await page.getByRole('status').filter({ hasText: 'Draft copy created' }).waitFor()
  assert.equal(tables.mezmur.length, 2)
  await page.getByLabel('Search', { exact: true }).fill('no-match')
  await page.getByRole('button', { name: 'Apply filters' }).click()
  await page.getByText('No mezmur match these filters.').waitFor()
  await page.getByRole('button', { name: 'Reset', exact: true }).click()
  await page.getByRole('button', { name: 'Archive', exact: true }).first().waitFor()
  page.once('dialog', dialog => dialog.accept())
  await page.getByRole('button', { name: 'Archive', exact: true }).first().click()
  await page.getByRole('status').filter({ hasText: 'Mezmur archived' }).waitFor()
  page.once('dialog', dialog => dialog.accept())
  await page.getByRole('button', { name: 'Delete', exact: true }).last().click()
  await page.getByRole('status').filter({ hasText: 'Mezmur deleted' }).waitFor()
  for (const [path, name] of [['categories', 'category'], ['singers', 'singer'], ['tags', 'tag']]) {
    await page.goto(base + '/admin/' + path)
    await page.getByRole('button', { name: 'Add ' + name, exact: true }).click()
    await page.getByLabel('Name *', { exact: true }).fill('New ' + name)
    if (path !== 'singers') await page.getByRole('button', { name: 'Generate slug' }).click()
    await page.getByRole('button', { name: 'Save item', exact: true }).click()
    await page.getByRole('status').filter({ hasText: 'Item saved.' }).waitFor()
    assert.equal(tables[path].length, 2)
  }
  for (let index = 0; index < 25; index++) tables.mezmur.push({ ...tables.mezmur[0], id: crypto.randomUUID(), slug: 'seed-' + index, title: 'Seed ' + index, featured: index % 2 === 0, status: 'draft' })
  await page.goto(base + '/admin/mezmur')
  await page.getByText('26 mezmur found', { exact: true }).waitFor()
  await page.getByRole('button', { name: 'Next', exact: true }).click()
  await page.getByText('Page 2 of 2', { exact: true }).waitFor()
  await page.getByLabel('Status', { exact: true }).selectOption('draft')
  await page.getByLabel('Featured', { exact: true }).selectOption('yes')
  await page.getByLabel('Category', { exact: true }).selectOption(tables.categories[0].id)
  await page.getByLabel('Singer', { exact: true }).selectOption(tables.singers[0].id)
  await page.getByLabel('Sort', { exact: true }).selectOption('title')
  await page.getByRole('button', { name: 'Apply filters', exact: true }).click()
  await page.getByText('13 mezmur found', { exact: true }).waitFor()
  assert.ok(page.url().includes('sort=title'))
  tables.mezmur = tables.mezmur.slice(0, 1)
  role = 'contributor'
  await page.goto(base + '/admin/mezmur/new')
  await page.getByRole('heading', { name: 'Add Mezmur' }).waitFor()
  assert.equal(await page.getByRole('button', { name: 'Publish', exact: true }).count(), 0)
  await page.goto(base + '/admin/categories')
  await page.getByText('Only administrators can manage these items.').waitFor()
  assert.equal(await page.getByRole('button', { name: 'Add category' }).count(), 0)
  // A visible published record owned by someone else remains read-only.
  tables.mezmur = [{ ...tables.mezmur[0], id, created_by: 'another-user', status: 'published' }]
  await page.goto(base + `/admin/mezmur/${id}/edit`)
  await page.getByText('This content is read-only', { exact: false }).waitFor()
  assert.ok(await page.getByLabel('Title *', { exact: true }).isDisabled())
  role = 'admin'
  await page.goto(base + '/admin')
  await page.getByRole('heading', { name: 'Dashboard', exact: true }).waitFor()
  if (process.env.CMS_SCREENSHOTS) {
    await mkdir('test-results', { recursive: true })
    await page.screenshot({ path: 'test-results/admin-dashboard.png', fullPage: true })
    await page.goto(base + `/admin/mezmur/${id}/edit`)
    await page.getByRole('heading', { name: 'Edit Mezmur' }).waitFor()
    await page.screenshot({ path: 'test-results/admin-editor.png', fullPage: true })
  }
  await page.setViewportSize({ width: 390, height: 844 })
  await page.goto(base + '/admin')
  await page.getByRole('heading', { name: 'Dashboard', exact: true }).waitFor()
  assert.ok(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 2))
  await page.getByRole('button', { name: 'Menu', exact: true }).click()
  await page.getByRole('navigation', { name: 'Admin navigation' }).getByRole('link', { name: 'Mezmur', exact: true }).click()
  await page.getByRole('heading', { name: 'Mezmur', exact: true }).waitFor()
  assert.ok(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 2))
  assert.deepEqual(errors, [])
  assert.ok(requests.some(url => url.searchParams.has('or')))
  console.log('CMS admin smoke passed: create/edit, errors, unsaved guard, uploads, review/publish, restore, list actions, taxonomy, role UI, mobile layout.')
} finally { await browser?.close(); await server.close() }


