/** Real React routes, mocked Supabase HTTP; database rules tested separately with SQL. */
import assert from 'node:assert/strict'
import { chromium } from 'playwright'
import { createServer } from 'vite'
import { mkdir } from 'node:fs/promises'
process.env.VITE_SUPABASE_URL = 'https://public-test.supabase.co'
process.env.VITE_SUPABASE_ANON_KEY = 'sb_publishable_test'
process.env.VITE_PUBLIC_MEZMUR_SOURCE = 'supabase'
process.env.VITE_TURNSTILE_SITE_KEY = 'test-site-key'
const server = await createServer({
  server: { host: '127.0.0.1', port: 4178, strictPort: true },
})
await server.listen()
let browser
try {
  browser = await chromium.launch()
  const page = await browser.newPage()
  const errors = []
  const requests = []
  page.on('pageerror', (error) => errors.push(error.message))
  page.on('request', (request) => requests.push(request.url()))
  const base = 'http://127.0.0.1:4178'
  const id = 'dddddddd-dddd-dddd-dddd-dddddddddddd'
  const user = {
    id: '11111111-1111-1111-1111-111111111111',
    email: 'listener@example.invalid',
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
  const row = {
    id,
    slug: 'discovery-song',
    title: 'Discovery Song',
    title_amharic: 'የምስጋና መዝሙር',
    title_oromo: null,
    description: 'A published hymn',
    singer_name: 'Discovery Choir',
    category_name: 'Praise',
    languages: ['am', 'en', 'om'],
    tags: [
      { id: 'tag', name: 'Pascha', slug: 'occasion-pascha', kind: 'occasion' },
    ],
    thumbnail_url: 'https://media.invalid/cover.png',
    audio_url: 'https://media.invalid/audio.wav',
    youtube_url: 'https://www.youtube.com/watch?v=abcdefghijk',
    lyrics_amharic: 'እግዚአብሔር ይመስገን',
    lyrics_english: 'A searchable lyric phrase',
    lyrics_oromo: 'Galata',
    transliteration: 'Igziabeher yimesgen',
    featured: true,
    status: 'published',
    published_at: new Date().toISOString(),
    contributor_credit: 'Consenting contributor',
  }
  let filters
  let query
  let favorite = false
  let memberRole = null
  let fail = false
  const wav = Buffer.alloc(44 + 8000 * 2 * 30)
  wav.write('RIFF', 0)
  wav.writeUInt32LE(wav.length - 8, 4)
  wav.write('WAVEfmt ', 8)
  wav.writeUInt32LE(16, 16)
  wav.writeUInt16LE(1, 20)
  wav.writeUInt16LE(1, 22)
  wav.writeUInt32LE(8000, 24)
  wav.writeUInt32LE(16000, 28)
  wav.writeUInt16LE(2, 32)
  wav.writeUInt16LE(16, 34)
  wav.write('data', 36)
  wav.writeUInt32LE(wav.length - 44, 40)
  await page.route('https://media.invalid/**', (route) =>
    route.fulfill(
      route.request().url().endsWith('.wav')
        ? { contentType: 'audio/wav', body: wav }
        : {
            contentType: 'image/png',
            body: Buffer.from(
              'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+jRZkAAAAASUVORK5CYII=',
              'base64',
            ),
          },
    ),
  )
  await page.route('https://challenges.cloudflare.com/**', (route) =>
    route.fulfill({
      contentType: 'application/javascript',
      body: 'window.turnstile={render:(el,o)=>{setTimeout(()=>o.callback("token"),5);return "test"},remove:()=>{}}',
    }),
  )
  await page.route('https://public-test.supabase.co/**', async (route) => {
    const req = route.request()
    const url = new URL(req.url())
    let body = []
    let status = 200
    if (url.pathname === '/rest/v1/rpc/discover_mezmur') {
      filters = req.postDataJSON()
      body = {
        items: filters.page_number === 2 ? [] : [row],
        total: 25,
        page: filters.page_number,
      }
      if (fail) {
        status = 500
        body = { message: 'Test outage' }
      }
    } else if (url.pathname === '/rest/v1/rpc/public_discovery_facets')
      body = {
        singers: [{ id: 'singer', name: 'Discovery Choir' }],
        categories: [{ id: 'category', name: 'Praise' }],
        occasions: [{ slug: 'occasion-pascha', name: 'Pascha' }],
      }
    else if (url.pathname === '/rest/v1/rpc/public_mezmur_detail')
      body = ['discovery-song', 'old-song'].includes(
        req.postDataJSON().slug_or_alias,
      )
        ? row
        : null
    else if (url.pathname === '/rest/v1/rpc/search_public_content') {
      query = req.postDataJSON()
      body = {
        items: ['mezmur', 'saints', 'prayers', 'feasts', 'articles'].map(
          (kind) => ({
            kind,
            slug: kind === 'mezmur' ? 'discovery-song' : 'test',
            title: 'Discovery ' + kind,
            title_amharic: '',
            description: 'Published result',
          }),
        ),
        total: 5,
      }
    } else if (
      [
        '/rest/v1/saints',
        '/rest/v1/prayers',
        '/rest/v1/feasts',
        '/rest/v1/articles',
      ].includes(url.pathname)
    ) {
      assert.equal(url.searchParams.get('status'), 'eq.published')
      body = {
        title: 'Discovery article',
        body: 'Plain text content',
        body_amharic: '',
        description: 'Published result',
      }
    } else if (url.pathname === '/auth/v1/token')
      body = {
        access_token: token,
        refresh_token: 'test-refresh',
        expires_in: 3600,
        token_type: 'bearer',
        user,
      }
    else if (url.pathname === '/auth/v1/user') body = user
    else if (url.pathname === '/rest/v1/profiles') body = memberRole ? {id:user.id,email:user.email,role:memberRole,display_name:'Test member',avatar_url:null,created_at:user.created_at,updated_at:user.created_at} : null
    else if (url.pathname === '/rest/v1/mezmur_favorites') {
      if (req.method() === 'POST') favorite = true
      if (req.method() === 'DELETE') favorite = false
      body = favorite ? { mezmur_id: id } : null
    } else if (url.pathname === '/rest/v1/rpc/public_favorites')
      body = { items: favorite ? [row] : [], total: favorite ? 1 : 0 }
    else throw new Error('Unexpected request ' + url.pathname)
    await route.fulfill({
      status,
      contentType: 'application/json',
      body: JSON.stringify(body),
    })
  })
  await page.goto(base + '/practice')
  await page.getByRole('link',{name:'Admin Login',exact:true}).click()
  await page.getByRole('heading',{name:'CMS sign in'}).waitFor()
  assert.ok(page.url().endsWith('/admin/login'))
  await page.goto(base + '/practice')
  await page
    .getByRole('heading', { name: 'Discovery Song', exact: true })
    .waitFor()
  assert.ok(
    !requests.some((url) =>
      /amharic-chants\.json|english-mezmur-chants\.json|chant-data-mezmur/.test(
        url,
      ),
    ),
    'CMS listing does not load JSON library',
  )
  await page.getByLabel('Search', { exact: true }).fill('Choir')
  await page.locator('select[name="language"]').selectOption('am')
  await page.locator('select[name="singer"]').selectOption('singer')
  await page.locator('select[name="category"]').selectOption('category')
  await page.locator('select[name="occasion"]').selectOption('occasion-pascha')
  await page.locator('select[name="featured"]').selectOption('yes')
  await page.locator('select[name="sort"]').selectOption('alphabetical')
  await page.getByRole('button', { name: 'Apply filters' }).click()
  await page.waitForURL((url) => url.searchParams.get('q') === 'Choir')
  await page
    .getByRole('heading', { name: 'Discovery Song', exact: true })
    .waitFor()
  assert.deepEqual(filters, {
    q: 'Choir',
    language: 'am',
    singer: 'singer',
    category: 'category',
    occasion: 'occasion-pascha',
    featured_only: true,
    sort_by: 'alphabetical',
    page_number: 1,
  })
  await page.getByRole('button', { name: 'Next', exact: true }).click()
  await page.getByText('No published Mezmur match these filters.').waitFor()
  assert.equal(filters.page_number, 2)
  await page.getByRole('button', { name: 'Previous', exact: true }).click()
  await page
    .getByRole('heading', { name: 'Discovery Song', exact: true })
    .click()
  await page
    .getByRole('heading', { name: 'Discovery Song', exact: true })
    .waitFor()
  await page
    .getByRole('button', { name: 'English lyrics', exact: true })
    .click()
  await page.getByText('A searchable lyric phrase', { exact: true }).waitFor()
  await page.getByRole('button', { name: 'Oromo lyrics', exact: true }).click()
  await page.getByText('Galata', { exact: true }).waitFor()
  assert.equal(await page.title(), 'Discovery Song | Tewahedo Daily')
  assert.ok(
    (
      await page
        .locator('meta[property="og:description"]')
        .getAttribute('content')
    ).includes('published hymn'),
  )
  const correction = await page
    .getByRole('link', { name: 'Suggest a Correction' })
    .getAttribute('href')
  assert.equal(new URL(correction, base).searchParams.get('content_id'), id)
  await page.getByRole('button', { name: 'Play audio', exact: true }).click()
  await page.waitForFunction(
    () => document.querySelector('audio')?.currentTime > 0,
  )
  const start = await page
    .locator('audio')
    .evaluate((audio) => audio.currentTime)
  await page.getByRole('link', { name: 'About', exact: true }).click()
  await page.getByRole('heading', { name: /Tewahedo Daily/ }).waitFor()
  await page.waitForFunction(
    (time) => document.querySelector('audio')?.currentTime > time,
    start,
  )
  await page.getByRole('button', { name: 'Close audio player' }).click()
  await page.goto(base + correction)
  await page.getByRole('heading', { name: 'Suggest a Correction' }).waitFor()
  await page.getByLabel('Suggested correction').waitFor()
  await page.goto(base + '/account')
  await page.getByLabel('Email', { exact: true }).fill(user.email)
  await page.getByLabel('Password', { exact: true }).fill('password')
  await page.getByRole('button', { name: 'Sign in', exact: true }).click()
  await page.getByText('Signed in as ' + user.email).waitFor()
  assert.equal(await page.getByRole('link',{name:/^Admin (Login|Dashboard)$/}).count(),0)
  for (const role of ['user','contributor','editor','admin','super_admin']) {
    memberRole=role;await page.reload();await page.getByText('Signed in as ' + user.email).waitFor()
    if(role==='user') assert.equal(await page.getByRole('link',{name:/^Admin (Login|Dashboard)$/}).count(),0)
    else assert.equal(await page.getByRole('link',{name:'Admin Dashboard',exact:true}).getAttribute('href'),'/admin')
  }
  memberRole=null
  await page.goto(base + '/practice/mezmur/discovery-song')
  await page.getByRole('button', { name: 'Add favorite', exact: true }).click()
  await page
    .getByRole('button', { name: 'Remove favorite', exact: true })
    .waitFor()
  assert.equal(favorite, true)
  await page.goto(base + '/favorites')
  await page.getByRole('heading', { name: 'Discovery Song' }).waitFor()
  await page.goto(base + '/practice/mezmur/secret-draft')
  await page.getByRole('heading', { name: 'Mezmur not found' }).waitFor()
  fail = true
  await page.goto(base + '/practice')
  await page.getByRole('alert').waitFor()
  assert.equal(
    await page.getByRole('heading', { name: 'Discovery Song' }).count(),
    0,
  )
  assert.ok(
    !requests.some((url) =>
      /amharic-chants\.json|english-mezmur-chants\.json/.test(url),
    ),
  )
  fail = false
  for (const path of [
    '/practice',
    '/practice/mezmur/discovery-song',
    '/favorites',
  ]) {
    await page.goto(base + path)
    await page.setViewportSize({ width: 390, height: 844 })
    await page.getByRole('heading',{name:'Discovery Song',exact:true}).waitFor()
    await page.evaluate(()=>document.fonts.ready)
    assert.ok(
      await page.evaluate(
        () => document.documentElement.scrollWidth <= innerWidth + 1,
      ),
      'mobile overflow ' + path,
    )
    if(process.env.PUBLIC_SCREENSHOTS){await mkdir('.cms-test/screens',{recursive:true});await page.screenshot({path:'.cms-test/screens/'+path.replace(/[^a-z0-9]/gi,'-')+'.png',fullPage:true})}
  }
  const menu=page.locator('header button[aria-expanded]')
  await menu.click()
  const drawer=page.getByRole('dialog')
  await drawer.waitFor()
  await drawer.getByRole('link',{name:'About',exact:true}).click()
  await page.getByRole('heading',{name:/Tewahedo Daily/}).waitFor()
  await menu.click();await page.keyboard.press('Escape');await drawer.waitFor({state:'hidden'})
  assert.deepEqual(errors, [])
  console.log(
    'Public browser passed: filters, pagination, multilingual detail, correction target, persistent audio, ordinary-user favorites, no fallback on failure, and mobile layout.',
  )
} finally {
  await browser?.close()
  await server.close()
}
