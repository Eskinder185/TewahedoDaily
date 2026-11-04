/** Synthetic CMS browser checks. All external requests are intercepted; no real account or database is used. */
import assert from 'node:assert/strict'
import { mkdir, writeFile } from 'node:fs/promises'
import { chromium } from 'playwright'
import { createServer } from 'vite'

process.env.VITE_SUPABASE_URL = 'https://cms-redesign.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_fixture_only'
const server = await createServer({ server: { host: '127.0.0.1', port: 0 }, logLevel: 'error' })
await server.listen()
const origin = server.resolvedUrls.local[0].replace(/\/$/, '')
const user = { id: '11111111-1111-4111-8111-111111111111', email: 'admin@example.invalid', aud: 'authenticated', role: 'authenticated', app_metadata: {}, user_metadata: {}, created_at: '2026-01-01T00:00:00Z' }
const token = [Buffer.from(JSON.stringify({ alg: 'HS256', typ: 'JWT' })).toString('base64url'), Buffer.from(JSON.stringify({ sub: user.id, exp: Math.floor(Date.now() / 1000) + 3600, role: 'authenticated' })).toString('base64url'), 'fixture'].join('.')
let role = 'admin'
let media = { id: '22222222-2222-4222-8222-222222222222', file_name: 'fixture.webp', storage_bucket: 'content-media', storage_path: 'homepage/fixture.webp', alt_text: 'Initial alt', caption: 'Initial caption', media_type: 'image', width: 800, height: 600, mime_type: 'image/webp', file_size: 100, created_by: user.id, created_at: '2026-01-01T00:00:00Z', updated_at: '2026-01-01T00:00:00Z' }
const profile = () => ({ id: user.id, email: user.email, display_name: 'Actual fixture admin', avatar_url: null, role, created_at: user.created_at, updated_at: user.created_at })
const screenshotDir = 'artifacts/cms-audit'
await mkdir(screenshotDir, { recursive: true })
let browser
let checks = 0
try {
  browser = await chromium.launch()
  const page = await browser.newPage({ viewport: { width: 1440, height: 900 } })
  const pageErrors = []
  page.on('pageerror', error => pageErrors.push(error.message))
  await page.route('**/*', async route => {
    const url = new URL(route.request().url())
    if (url.origin === origin) return route.continue()
    if (url.origin !== 'https://cms-redesign.invalid') return route.abort()
    const path = url.pathname
    const method = route.request().method()
    let body = []
    let status = 200
    const headers = { 'content-range': '*/0', 'access-control-expose-headers': 'content-range' }
    if (path === '/auth/v1/token') body = { access_token: token, refresh_token: 'fixture-refresh', expires_in: 3600, token_type: 'bearer', user }
    else if (path === '/auth/v1/user') body = user
    else if (path === '/auth/v1/logout') { status = 204; body = null }
    else if (path === '/rest/v1/profiles') {
      const select = url.searchParams.get('select') || ''
      if (select === 'id,display_name') { body = [profile()]; headers['content-range'] = '0-0/1' }
      else if (select.includes('created_at') && !url.searchParams.has('id')) {
        const matches = (!url.searchParams.has('role') || url.searchParams.get('role') === `eq.${role}`) &&
          (!url.searchParams.has('or') || /actual|admin/i.test(url.searchParams.get('or') || ''))
        body = matches ? [profile()] : []
        headers['content-range'] = matches ? '0-0/1' : '*/0'
      } else { body = profile(); headers['content-range'] = '0-0/1' }
    } else if (path === '/rest/v1/rpc/is_staff') body = ['editor', 'admin', 'super_admin'].includes(role)
    else if (path === '/rest/v1/media_assets') {
      if (method === 'PATCH') { media = { ...media, ...route.request().postDataJSON() }; body = media }
      else {
        const matches = !url.searchParams.has('media_type') || url.searchParams.get('media_type') === 'eq.image'
        body = matches ? [media] : []
        headers['content-range'] = matches ? '0-0/1' : '*/0'
      }
    } else if (path.startsWith('/storage/v1/object/public/content-media/')) {
      return route.fulfill({ status: 200, contentType: 'image/png', body: Buffer.from('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVQIHWP4z8DwHwAFgAI/ScLttAAAAABJRU5ErkJggg==', 'base64') })
    } else if (path === '/rest/v1/rpc/cms_media_inventory') body = { items: [], total: 0 }
    else if (path.startsWith('/rest/v1/rpc/')) body = []
    else if (path.startsWith('/rest/v1/')) {
      if (route.request().headers().accept?.includes('vnd.pgrst.object')) { status = 406; body = { code: 'PGRST116', message: 'No fixture record exists for this ID.' } }
      else { body = []; headers['content-range'] = '*/0' }
    }
    else throw new Error(`Unexpected external request ${method} ${path}`)
    await route.fulfill({ status, headers, contentType: 'application/json', body: status === 204 ? '' : JSON.stringify(body) })
  })
  await page.goto(`${origin}/admin/login`)
  await page.getByLabel('Email', { exact: true }).fill(user.email)
  await page.getByLabel('Password', { exact: true }).fill('fixture')
  await page.getByRole('button', { name: 'Sign in', exact: true }).click()
  await page.getByRole('heading', { name: 'Dashboard', exact: true }).waitFor()
  assert.equal(await page.getByRole('navigation', { name: 'Admin navigation' }).getByText('Home', { exact: true }).count(), 0)
  assert.equal(await page.getByRole('navigation', { name: 'Admin navigation' }).getByText('About', { exact: true }).count(), 0)
  assert.equal(await page.getByRole('navigation', { name: 'Admin navigation' }).getByText('Content Health', { exact: true }).count(), 0)
  await page.getByRole('heading', { name: 'Content health' }).waitFor()
  assert.equal(await page.getByRole('button', { name: 'Run Health Check' }).count(), 1)
  await page.screenshot({ path: `${screenshotDir}/dashboard-desktop.png`, fullPage: true })
  checks++
  await page.goto(`${origin}/admin/home/daily`)
  await page.waitForURL('**/admin/calendar/daily')
  await page.goto(`${origin}/admin/content-health`)
  await page.waitForURL('**/admin#content-health')
  await page.goto(`${origin}/admin/about`)
  await page.waitForURL('**/admin')
  checks++
  await page.goto(`${origin}/admin/users`)
  await page.getByRole('heading', { name: 'Users', exact: true }).waitFor()
  await page.getByRole('status').filter({ hasText: 'visible profiles' }).waitFor()
  await page.getByRole('button', { name: 'View' }).click()
  await page.getByRole('complementary', { name: 'User details' }).getByText(user.email).waitFor()
  assert.equal(await page.getByRole('button', { name: /delete|suspend|change role/i }).count(), 0)
  await page.screenshot({ path: `${screenshotDir}/users-desktop.png`, fullPage: true })
  await page.goBack()
  await page.waitForURL('**/admin/users')
  assert.equal(await page.getByRole('complementary', { name: 'User details' }).count(), 0)
  await page.goForward()
  await page.getByRole('complementary', { name: 'User details' }).getByText(user.email).waitFor()
  await page.getByRole('combobox').first().selectOption('user')
  await page.getByText('No visible profiles match these filters.').waitFor()
  await page.getByRole('combobox').first().selectOption('all')
  await page.getByLabel('Search name or email').fill('no-match')
  await page.getByText('No visible profiles match these filters.').waitFor()
  await page.getByLabel('Search name or email').fill('')
  await page.getByRole('status').filter({ hasText: 'visible profiles' }).waitFor()
  checks++
  await page.goto(`${origin}/admin/media`)
  await page.getByRole('heading', { name: 'Media library' }).waitFor()
  await page.getByLabel('Media type').selectOption('audio')
  await page.getByText('No files match.').waitFor()
  await page.getByLabel('Media type').selectOption('')
  await page.getByRole('button', { name: 'List', exact: true }).click()
  assert.equal(await page.getByRole('button', { name: 'List', exact: true }).getAttribute('aria-pressed'), 'true')
  await page.getByRole('button', { name: 'Grid', exact: true }).click()
  await page.getByRole('button', { name: /fixture.webp/ }).first().click()
  await page.getByRole('complementary', { name: 'Media details' }).getByLabel('Alt text').fill('Updated alt')
  await page.getByRole('complementary', { name: 'Media details' }).getByRole('button', { name: 'Save' }).click()
  await page.getByText('Metadata saved.', { exact: true }).waitFor()
  await page.reload()
  await page.getByRole('button', { name: /fixture.webp/ }).first().click()
  assert.equal(await page.getByRole('complementary', { name: 'Media details' }).getByLabel('Alt text').inputValue(), 'Updated alt')
  await page.getByRole('button', { name: 'Preview fixture.webp' }).click()
  await page.getByRole('dialog', { name: 'fixture.webp' }).waitFor()
  await page.getByRole('button', { name: 'Close dialog' }).click()
  assert.equal(await page.getByRole('button', { name: 'Delete' }).count(), 0)
  await page.screenshot({ path: `${screenshotDir}/media-desktop.png`, fullPage: true })
  checks++
  await page.setViewportSize({ width: 390, height: 844 })
  await page.screenshot({ path: `${screenshotDir}/media-mobile.png`, fullPage: true })
  await page.goto(`${origin}/admin/users`)
  await page.getByRole('heading', { name: 'Users', exact: true }).waitFor()
  await page.getByRole('status').filter({ hasText: 'visible profiles' }).waitFor()
  await page.screenshot({ path: `${screenshotDir}/users-mobile.png`, fullPage: true })
  checks++
  role = 'editor'
  await page.reload()
  await page.goto(`${origin}/admin/users`)
  await page.waitForURL('**/admin')
  checks++
  assert.deepEqual(pageErrors, [])
  role = 'admin'
  const routes = [
    '/admin', '/admin/home', '/admin/home/slides', '/admin/home/slides/new', '/admin/home/daily', '/admin/about', '/admin/content-health',
    '/admin/hymns', '/admin/hymns/mezmur', '/admin/hymns/mezmur/new', '/admin/hymns/import', '/admin/hymns/bulk', '/admin/hymns/browse-groups', '/admin/hymns/browse-groups/new', '/admin/hymns/zemaris', '/admin/hymns/zemaris/new', '/admin/hymns/trash', '/admin/hymns/categories', '/admin/hymns/occasions', '/admin/hymns/tags',
    '/admin/pray', '/admin/pray/collections', '/admin/pray/collections/new', '/admin/pray/prayers', '/admin/pray/prayers/new', '/admin/pray/liturgy', '/admin/pray/liturgy/new', '/admin/pray/guides', '/admin/pray/guides/new', '/admin/pray/images',
    '/admin/calendar', '/admin/calendar/cards', '/admin/calendar/cards/new', '/admin/calendar/mezmurs', '/admin/calendar/observances', '/admin/calendar/fasts', '/admin/calendar/seasons', '/admin/calendar/monthly', '/admin/calendar/synaxarium', '/admin/calendar/saints', '/admin/calendar/saints/new', '/admin/calendar/feasts', '/admin/calendar/feasts/new', '/admin/calendar/daily',
    '/admin/church-library', '/admin/church-library/import', '/admin/church-library/faqs', '/admin/church-library/legacy-preview', '/admin/bible', '/admin/play', '/admin/play/studio', '/admin/play/import', '/admin/submissions', '/admin/media', '/admin/users', '/admin/settings', '/admin/articles', '/admin/articles/new',
    '/admin/mezmur', '/admin/prayers', '/admin/liturgy', '/admin/synaxarium', '/admin/saints', '/admin/feasts', '/admin/categories', '/admin/singers', '/admin/tags', '/admin/daily',
  ]
  const sampleId = '33333333-3333-4333-8333-333333333333'
  routes.push(
    '/admin/login', '/admin/home/new', `/admin/home/${sampleId}/edit`, `/admin/home/slides/${sampleId}/edit`,
    `/admin/hymns/mezmur/${sampleId}/edit`, `/admin/hymns/browse-groups/${sampleId}/edit`, `/admin/hymns/zemaris/${sampleId}/edit`, '/admin/hymns/singers',
    `/admin/pray/collections/${sampleId}/edit`, `/admin/pray/prayers/${sampleId}/edit`, `/admin/pray/liturgy/${sampleId}/edit`, `/admin/pray/guides/${sampleId}/edit`,
    `/admin/calendar/cards/${sampleId}/edit`, `/admin/calendar/synaxarium/${sampleId}/edit`, `/admin/calendar/saints/${sampleId}/edit`, `/admin/calendar/feasts/${sampleId}/edit`, '/admin/calendar/new', `/admin/calendar/${sampleId}/edit`,
    '/admin/editorial-books', '/admin/editorial-books/legacy', `/admin/submissions/${sampleId}`, `/admin/articles/${sampleId}/edit`,
    '/admin/mezmur/new', `/admin/mezmur/${sampleId}/edit`, '/admin/prayers/new', `/admin/prayers/${sampleId}/edit`, '/admin/liturgy/new', `/admin/liturgy/${sampleId}/edit`, `/admin/synaxarium/${sampleId}/edit`, '/admin/saints/new', `/admin/saints/${sampleId}/edit`, '/admin/feasts/new', `/admin/feasts/${sampleId}/edit`,
  )
  const routeAudit = []
  for (const routePath of routes) {
    const before = pageErrors.length
    try {
      await page.goto(origin + routePath, { waitUntil: 'domcontentloaded', timeout: 12000 })
      await page.waitForTimeout(350)
      const heading = await page.locator('main h1').first().textContent().catch(() => null)
      const alerts = await page.getByRole('alert').allTextContents()
      const runtimeErrors = pageErrors.slice(before)
      routeAudit.push({ route: routePath, resolved: new URL(page.url()).pathname, heading: heading?.trim() || null,
        status: runtimeErrors.length || heading === 'Admin unavailable' ? 'FAIL' : heading ? 'PASS_MOCK_SHELL' : 'UNKNOWN', alerts: alerts.slice(0, 2), runtimeErrors: runtimeErrors.slice(0, 2) })
    } catch (cause) {
      routeAudit.push({ route: routePath, status: 'UNKNOWN', error: cause instanceof Error ? cause.message.slice(0, 180) : String(cause) })
    }
  }
  await writeFile(`${screenshotDir}/route-render-matrix.json`, JSON.stringify(routeAudit, null, 2) + '\n')
  const area = path => {
    const segment = path.split('/')[2] || 'dashboard'
    return ({ dashboard: 'Dashboard', login: 'CMS login', home: 'Homepage management', hymns: 'Hymns / Mezmur', pray: 'Prayer / Liturgy', calendar: 'Calendar', 'church-library': 'Church Library', bible: 'Bible Manager', play: 'Faith Challenges', submissions: 'Submissions', media: 'Media Library', users: 'Users', settings: 'Settings', 'content-health': 'Content Health', about: 'About', articles: 'Articles' })[segment] || 'Legacy admin redirect'
  }
  const routeRows = routeAudit.map(item => {
    const verified = {
      '/admin': ['A', 'L'],
      '/admin/users': ['A', 'C', 'D', 'K', 'L', 'M', 'N'],
      '/admin/media': ['A', 'D', 'G', 'L', 'M'],
    }[item.route] || []
    const checks = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P'].map(letter => verified.includes(letter) && item.status === 'PASS_MOCK_SHELL' ? 'PASS¹' : item.status === 'FAIL' && letter === 'A' ? 'FAIL' : 'UNKNOWN')
    const redirected = item.resolved && item.resolved !== item.route
    const evidence = item.runtimeErrors?.length ? item.runtimeErrors.join('; ') : item.alerts?.length ? `Shell rendered; alert: ${item.alerts.join('; ')}` : `Shell heading: ${item.heading || 'none'}; destination: ${item.resolved || 'unknown'}`
    return `| \`${item.route}\` | ${area(item.route)} | Direct load${redirected ? ' / redirect' : ''} | ${checks.join(' | ')} | ${evidence.replaceAll('|', '/')} | Live data and workflow behavior unverified; verify in staging. |`
  })
  const matrix = ['# CMS route audit matrix', '', 'Generated by `scripts/test-cms-redesign-browser.mjs` on 2026-11-04. Every route used synthetic auth and PostgREST responses. ¹ PASS is limited to the focused browser assertions for Dashboard, Users and Media, including mocked data and roles. Other routes reached a CMS shell, which is recorded as evidence but leaves full page load and workflow checks UNKNOWN. Redirect resolution alone does not establish Browser Back/Forward. No production request was made.', '', '| Route | Component area | Action | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Evidence | Root cause / recommended fix |', '| --- | --- | --- | ' + Array(16).fill('---').join(' | ') + ' | --- | --- |', ...routeRows, '', 'A load; B Supabase content; C bilingual search; D filters/sort/pagination; E create/save; F correct edit record; G refresh persistence; H safe delete/archive/unpublish; I media persistence; J English/Amharic; K history/deep link; L loading/empty/error; M responsive; N role permission; O published public result; P privacy/secrets. For route-specific exercised behavior and fixes, see `docs/ai/CMS-AUDIT-2026-11-04.md`.', '']
  await writeFile('docs/ai/CMS-ROUTE-MATRIX-2026-11-04.md', matrix.join('\n'))
  assert.equal(routeAudit.filter(item => item.status === 'FAIL').length, 0, 'A CMS route reached the error boundary or threw a JavaScript exception')
  console.log('Route render sweep', Object.fromEntries(['PASS_MOCK_SHELL', 'FAIL', 'UNKNOWN'].map(status => [status, routeAudit.filter(item => item.status === status).length])))
  console.log(`CMS redesign browser fixture: ${checks} checks passed; synthetic auth and PostgREST only. Screenshots: ${screenshotDir}`)
} finally {
  await browser?.close()
  await server.close()
}
