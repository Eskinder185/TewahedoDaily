/** Browser integration with mocked Supabase HTTP. SQL security is tested separately. */
import assert from 'node:assert/strict'
import { mkdir } from 'node:fs/promises'
import { chromium } from 'playwright'
import { createServer } from 'vite'
process.env.VITE_SUPABASE_URL = 'https://cms-test.supabase.co'
process.env.VITE_SUPABASE_ANON_KEY = 'sb_publishable_test_only'
const server = await createServer({
  server: { host: '127.0.0.1', port: 4181, strictPort: true },
})
await server.listen()
let browser
try {
  browser = await chromium.launch()
  const page = await browser.newPage({
    viewport: { width: 1440, height: 1000 },
  })
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
  let role = 'admin'
  let uploadFails = false
  let profileFails = false
  let clock = Date.now()
  const now = () => new Date(++clock).toISOString()
  const tables = {
    daily_content: [],
    community_submissions: [],
    mezmur: [],
    saints: [],
    feasts: [],
    prayers: [],
    articles: [],
    content_versions: [],
    mezmur_tags: [],
    categories: [
      {
        id: 'aaaaaaaa-0000-0000-0000-000000000001',
        name: 'Praise',
        name_amharic: 'ምስጋና',
        slug: 'praise',
        type: 'mezmur',
        is_archived: false,
      },
    ],
    singers: [
      {
        id: 'aaaaaaaa-0000-0000-0000-000000000002',
        name: 'Choir',
        is_archived: false,
      },
    ],
    tags: [
      {
        id: 'aaaaaaaa-0000-0000-0000-000000000003',
        name: 'Sunday',
        slug: 'sunday',
      },
    ],
  }
  const uploads = []
  let files = []
  const requests = []
  const pixel = Buffer.from(
    'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+j5ioAAAAASUVORK5CYII=',
    'base64',
  )
  await page.route('https://cms-test.supabase.co/**', async (route) => {
    const request = route.request()
    const url = new URL(request.url())
    requests.push(url)
    if (request.method() === 'OPTIONS')
      return route.fulfill({
        status: 204,
        headers: {
          'access-control-allow-origin': '*',
          'access-control-allow-methods': 'POST,GET,DELETE,PATCH,OPTIONS',
          'access-control-allow-headers': '*',
        },
      })
    let body = {}
    let status = 200
    let headers = {}
    if (url.pathname === '/auth/v1/token')
      body = {
        access_token: token,
        refresh_token: 'test-refresh',
        expires_in: 3600,
        token_type: 'bearer',
        user,
      }
    else if (url.pathname === '/auth/v1/user') body = user
    else if (url.pathname === '/auth/v1/logout') {
      status = 204
      body = null
    } else if (url.pathname === '/rest/v1/profiles') {
      if (profileFails) {
        status = 500
        body = { message: 'Profile unavailable' }
      } else
        body = {
          id: user.id,
          email: user.email,
          display_name: 'Test administrator',
          role,
        }
    } else if (url.pathname === '/rest/v1/rpc/cms_version_authors')
      body = [{ id: user.id, display_name: 'Test administrator' }]
    else if (url.pathname === '/rest/v1/rpc/save_cms_content') {
      const { content_kind: kind, payload } = request.postDataJSON()
      const existing = tables[kind].find((r) => r.id === payload.id)
      tables.content_versions.unshift({
        id: crypto.randomUUID(),
        content_type: kind,
        content_id: payload.id,
        changed_by: user.id,
        created_at: now(),
        snapshot: { record: structuredClone(existing || payload) },
      })
      body = { ...payload, created_by: user.id, updated_at: now() }
      if (existing) Object.assign(existing, body)
      else tables[kind].push(body)
    } else if (url.pathname === '/rest/v1/rpc/cms_media_inventory') {
      const { q, media_type } = request.postDataJSON()
      const items = files.filter(
        (f) =>
          f.name.includes(q) &&
          (!media_type || f.metadata.mimetype.startsWith(media_type)),
      )
      body = { items, total: items.length }
    } else if (url.pathname === '/rest/v1/rpc/public_daily_content') {
      const day = tables.daily_content[0]
      body = day?.published
        ? {
            ...day,
            saint: tables.saints[0],
            feast: tables.feasts[0],
            mezmur: null,
          }
        : null
    } else if (
      url.pathname.startsWith('/storage/v1/object/sign/') &&
      request.method() === 'POST'
    ) {
      body = {
        signedURL: url.pathname.replace('/storage/v1', '') + '?token=test',
      }
    } else if (
      url.pathname.startsWith('/storage/v1/object/sign/') &&
      request.method() === 'GET'
    ) {
      return route.fulfill({
        status: 200,
        contentType: 'image/png',
        body: pixel,
      })
    } else if (
      url.pathname.startsWith('/storage/v1/object/') &&
      request.method() === 'POST'
    ) {
      if (uploadFails) {
        status = 500
        body = { message: 'Upload failed', error: 'Upload failed' }
      } else {
        uploads.push(url.pathname)
        const path = url.pathname.split('/object/')[1]
        const [bucket_id, ...parts] = path.split('/')
        files.push({
          id: crypto.randomUUID(),
          bucket_id,
          name: parts.join('/'),
          metadata: { mimetype: request.headers()['content-type'], size: 100 },
          in_use: !path.includes('/library/'),
          created_at: now(),
        })
        body = { Key: path }
      }
    } else if (
      url.pathname.startsWith('/storage/v1/object/') &&
      request.method() === 'DELETE'
    ) {
      const name = request.postDataJSON().prefixes[0]
      const selected = files.filter((f) => f.name === name && !f.in_use)
      files = files.filter((f) => !selected.includes(f))
      body = selected
    } else if (url.pathname.startsWith('/rest/v1/')) {
      const table = url.pathname.split('/').at(-1)
      assert.ok(table in tables, 'Unexpected table ' + table)
      let selected = tables[table].filter((row) => {
        for (const [key, value] of url.searchParams) {
          if (value.startsWith('eq.') && String(row[key]) !== value.slice(3))
            return false
        }
        const search = url.searchParams
          .get('or')
          ?.match(/title.ilike.%([^%]*)%/)?.[1]
        return (
          !search || row.title?.toLowerCase().includes(search.toLowerCase())
        )
      })
      if (request.method() === 'POST') {
        const record = {
          ...request.postDataJSON(),
          id: crypto.randomUUID(),
          is_archived: false,
        }
        tables[table].push(record)
        selected = [record]
      } else if (request.method() === 'PATCH')
        selected.forEach((row) => Object.assign(row, request.postDataJSON()))
      else if (request.method() === 'DELETE')
        tables[table] = tables[table].filter((row) => !selected.includes(row))
      const count = selected.length
      const sort = url.searchParams.get('order')?.split(',')[0]?.split('.')
      if (sort)
        selected.sort(
          (a, b) =>
            String(a[sort[0]] || '').localeCompare(String(b[sort[0]] || '')) *
            (sort[1] === 'desc' ? -1 : 1),
        )
      const start = Number(url.searchParams.get('offset') || 0)
      selected = selected.slice(
        start,
        start + Number(url.searchParams.get('limit') || 1000),
      )
      headers = {
        'content-range': `${start}-${start + selected.length - 1}/${count}`,
      }
      body = request.headers().accept?.includes('vnd.pgrst.object')
        ? (selected[0] ?? null)
        : selected
    } else throw new Error('Unexpected request ' + url.pathname)
    await route.fulfill({
      status,
      headers: {
        ...headers,
        'access-control-expose-headers': 'content-range',
        'access-control-allow-origin': '*',
      },
      contentType: 'application/json',
      body:
        status === 204 || request.method() === 'HEAD'
          ? ''
          : JSON.stringify(body),
    })
  })
  const base = 'http://127.0.0.1:4181'
  await page.goto(base + '/admin')
  await page.getByLabel('Email', { exact: true }).fill(user.email)
  await page.getByLabel('Password', { exact: true }).fill('test-password')
  await page.getByRole('button', { name: 'Sign in', exact: true }).click()
  await page.getByRole('heading', { name: 'Dashboard', exact: true }).waitFor()
  page.on('dialog', (dialog) => dialog.accept())
  for (const kind of ['saints', 'feasts', 'prayers', 'articles']) {
    await page.goto(base + `/admin/${kind}/new`)
    await page.getByLabel('Title / name', { exact: true }).fill('Test ' + kind)
    await page.getByLabel('Slug', { exact: true }).fill('test-' + kind)
    await page
      .getByLabel('English text')
      .fill('Readable English ' + kind)
    await page.getByLabel('Amharic text', { exact: true }).fill('የቅዱስ ታሪክ')
    await page.getByLabel('Oromo text', { exact: true }).fill('Galata ' + kind)
    if (kind === 'articles')
      await page.getByLabel('Teaching category').selectOption('Bible study')
    await page.getByRole('button', { name: 'Save Draft', exact: true }).click()
    await page.waitForURL(/\/edit$/)
    await page.reload()
    await page.getByLabel('Upload image or audio').waitFor()
    assert.equal(tables[kind][0].status, 'draft')
    await page
      .getByLabel('Upload image or audio')
      .setInputFiles({ name: 'icon.png', mimeType: 'image/png', buffer: pixel })
    await page
      .getByText('Upload finished', { exact: true })
      .waitFor({ timeout: 10000 })
      .catch(async (e) => {
        console.log(await page.locator('main').innerText())
        throw e
      })
    await page
      .getByLabel('Upload image or audio')
      .setInputFiles({
        name: 'reading.mp3',
        mimeType: 'audio/mpeg',
        buffer: Buffer.from('test audio'),
      })
    await page.getByText('Upload finished', { exact: true }).waitFor()
    await page
      .getByRole('button', { name: 'Submit for Review', exact: true })
      .click()
    await page.getByText('Saved as pending_review.', { exact: true }).waitFor()
    await page.getByRole('button', { name: 'Publish', exact: true }).click()
    await page.getByText('Saved as published.', { exact: true }).waitFor()
    assert.equal(tables[kind][0].status, 'published')
    assert.ok(tables[kind][0].audio_url.startsWith('storage://'))
    if (kind === 'saints') {
      await page
        .getByLabel('English text')
        .fill('Changed biography')
      await page
        .getByRole('button', { name: 'Save changes', exact: true })
        .click()
      await page.getByText('Saved as published.', { exact: true }).waitFor()
      await page.locator('details').first().locator('summary').click()
      await page
        .locator('details')
        .first()
        .getByRole('button', { name: 'Restore as draft' })
        .click()
      assert.equal(
        await page.getByLabel('English text').inputValue(),
        'Readable English saints',
      )
      await page
        .getByRole('button', { name: 'Save Draft', exact: true })
        .click()
      await page.getByText('Saved as draft.', { exact: true }).waitFor()
      await page.getByRole('button', { name: 'Publish', exact: true }).click()
      await page.getByText('Saved as published.', { exact: true }).waitFor()
    }
    await page.getByRole('button', { name: 'Preview', exact: true }).click()
    await page
      .getByRole('dialog')
      .getByRole('heading', { name: 'Test ' + kind, exact: true })
      .waitFor()
    await page.keyboard.press('Escape')
    await page.goto(base + `/content/${kind}/test-${kind}`)
    await page
      .getByRole('heading', { name: 'Test ' + kind, exact: true })
      .waitFor()
    await page
      .getByRole('main')
      .getByRole('button', { name: 'English', exact: true })
      .click()
    await page.getByText('Readable English ' + kind, { exact: true }).waitFor()
    await page
      .getByRole('main')
      .getByRole('button', { name: 'Oromo', exact: true })
      .click()
    await page.getByText('Galata ' + kind, { exact: true }).waitFor()
  }
  await page.goto(base + '/admin/daily')
  await page
    .getByLabel('Daily saints')
    .selectOption(tables.saints[0].id, { timeout: 5000 })
    .catch(async (e) => {
      console.log(await page.locator('body').innerText())
      console.log(errors)
      throw e
    })
  await page.getByLabel('Daily feasts').selectOption(tables.feasts[0].id)
  await page.getByLabel('Bible reading references').fill('John 1:1–14')
  await page.getByLabel('Fasting indicator').selectOption('Fasting day')
  await page
    .getByLabel('Homepage announcement')
    .fill('Welcome to today’s readings')
  await page.getByLabel('Publish this schedule').check()
  await page.getByRole('button', { name: 'Save schedule', exact: true }).click()
  await page.getByText('Schedule saved.', { exact: false }).waitFor()
  assert.equal(tables.daily_content[0].published, true)
  await page.goto(base + '/today')
  await page.getByText('Welcome to today’s readings', { exact: true }).waitFor()
  await page.getByText('John 1:1–14', { exact: true }).waitFor()
  for (const path of [
    '/saints',
    '/feasts',
    '/prayer-library',
    '/today',
    '/admin/media',
    '/admin/saints',
    '/admin/feasts/' + tables.feasts[0].id + '/edit',
    '/admin/daily',
  ]) {
    await page.setViewportSize({ width: 390, height: 844 })
    await page.goto(base + path)
    await page.locator('h1').first().waitFor()
    assert.ok(
      await page.evaluate(
        () => document.documentElement.scrollWidth <= window.innerWidth + 2,
      ),
      'Mobile overflow: ' + path,
    )
  }

  await page.goto(base + '/admin/media')
  await page
    .getByRole('heading', { name: 'Media library', exact: true })
    .waitFor()
  await page
    .getByText('Protected: referenced by content or revision history.')
    .first()
    .waitFor()
  assert.ok(
    await page
      .getByRole('button', { name: 'Delete', exact: true })
      .first()
      .isDisabled(),
  )
  await page
    .getByLabel('Upload image or audio')
    .setInputFiles({
      name: 'unsafe.svg',
      mimeType: 'image/svg+xml',
      buffer: Buffer.from('<svg/>'),
    })
  await page.getByRole('alert').filter({ hasText: 'Choose a JPEG' }).waitFor()
  uploadFails = true
  await page
    .getByLabel('Upload image or audio')
    .setInputFiles({ name: 'failed.png', mimeType: 'image/png', buffer: pixel })
  await page.getByRole('alert').filter({ hasText: 'Upload failed' }).waitFor()
  uploadFails = false
  await page
    .getByLabel('Upload image or audio')
    .setInputFiles({ name: 'unused.png', mimeType: 'image/png', buffer: pixel })
  await page.getByText('Upload finished', { exact: true }).waitFor()
  await page.getByLabel('Search files').fill('unused.png')
  await page.getByRole('button', { name: 'Delete', exact: true }).click()
  await page.getByText('File deleted.', { exact: true }).waitFor()
  assert.ok(!files.some((f) => f.name.endsWith('unused.png')))
  await page.getByLabel('Search files').fill('')
  await page.getByLabel('File type').selectOption('audio')
  await page.getByRole('article').first().waitFor()
  assert.equal(await page.getByRole('article').count(), 4)
  await mkdir('test-results', { recursive: true })
  await page.screenshot({
    path: 'test-results/platform-media-mobile.png',
    fullPage: true,
  })
  role = 'contributor'
  await page.goto(base + '/admin/saints/' + tables.saints[0].id + '/edit')
  await page.getByLabel('Title / name', { exact: true }).waitFor()
  assert.ok(await page.getByLabel('Title / name', { exact: true }).isDisabled())
  assert.equal(
    await page.getByRole('button', { name: 'Publish', exact: true }).count(),
    0,
  )
  assert.equal(
    await page
      .getByRole('navigation', { name: 'Admin navigation' })
      .getByRole('link', { name: 'Daily', exact: true })
      .count(),
    0,
  )
  assert.equal(uploads.length, 9)
  assert.deepEqual(errors, [])
  console.log(
    'Content platform browser passed: four editors, image/audio uploads, review/publish, public translations, daily schedule/homepage, contributor controls, eight mobile routes.',
  )
} finally {
  await browser?.close()
  await server.close()
}
