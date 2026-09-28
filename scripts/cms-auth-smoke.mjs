/** Mocked browser integration test; no Supabase project or credentials required. */
import assert from 'node:assert/strict'
import { chromium } from 'playwright'
import { createServer } from 'vite'

process.env.VITE_SUPABASE_URL = 'https://cms-test.supabase.co'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_test_only'
const server = await createServer({ server: { host: '127.0.0.1', port: 4175, strictPort: true } })
await server.listen()
let browser
try {
  browser = await chromium.launch()
  const page = await browser.newPage()
  const errors = []
  page.on('pageerror', error => errors.push(error.message))
  const user = { id: '11111111-1111-1111-1111-111111111111', email: 'cms@example.invalid', aud: 'authenticated', role: 'authenticated', app_metadata: {}, user_metadata: {}, created_at: new Date().toISOString() }
  const token = [Buffer.from(JSON.stringify({ alg: 'HS256', typ: 'JWT' })).toString('base64url'), Buffer.from(JSON.stringify({ sub: user.id, exp: Math.floor(Date.now() / 1000) + 3600, role: 'authenticated' })).toString('base64url'), 'mock'].join('.')
  let memberRole = 'editor'
  let profileFails = false
  await page.route('https://cms-test.supabase.co/**', async route => {
    const url = new URL(route.request().url())
    let status = 200
    let body = {}
    if (url.pathname === '/auth/v1/token') {
      if (route.request().postDataJSON().password !== 'test-password') {
        status = 400; body = { error: 'invalid_grant', error_description: 'Invalid login credentials' }
      } else body = { access_token: token, refresh_token: 'test-refresh', expires_in: 3600, token_type: 'bearer', user }
    } else if (url.pathname === '/rest/v1/profiles') {
      if (profileFails) { status = 500; body = { message: 'Test failure' } }
      else body = memberRole ? { id: user.id, email: user.email, display_name: 'Test editor', avatar_url: null, role: memberRole, created_at: user.created_at, updated_at: user.created_at } : null
    } else if (url.pathname === '/auth/v1/user') body = user
    else if (url.pathname === '/auth/v1/logout') { status = 204; body = null }
    else if (url.pathname.startsWith('/rest/v1/')) body = []
    else throw new Error('Unexpected request: ' + url.pathname)
    await route.fulfill({ status, contentType: 'application/json', body: status === 204 ? '' : JSON.stringify(body) })
  })
  await page.goto('http://127.0.0.1:4175/admin')
  await page.getByRole('heading', { name: 'CMS sign in' }).waitFor()
  assert.ok(page.url().endsWith('/admin/login'))
  async function login(password = 'test-password') {
    await page.getByLabel('Email', { exact: true }).fill(user.email)
    await page.getByLabel('Password', { exact: true }).fill(password)
    await page.getByRole('button', { name: 'Sign in', exact: true }).click()
  }
  await login('wrong-password')
  await page.getByRole('alert').filter({ hasText: 'Sign-in failed' }).waitFor()
  await login()
  await page.getByRole('heading', { name: 'Dashboard' }).waitFor()
  await page.reload()
  await page.getByRole('heading', { name: 'Dashboard' }).waitFor()
  profileFails = true
  await page.reload()
  await page.getByRole('alert').filter({ hasText: 'Unable to verify CMS access' }).waitFor()
  profileFails = false
  await page.getByRole('button', { name: 'Retry' }).click()
  await page.getByRole('heading', { name: 'Dashboard' }).waitFor()
  page.once('dialog', dialog => dialog.accept())
  await page.getByRole('button', { name: 'Sign out' }).click()
  await page.getByRole('heading', { name: 'CMS sign in' }).waitFor()
  memberRole = null
  await login()
  await page.getByRole('alert').filter({ hasText: 'not been assigned CMS access' }).waitFor()
  await page.goto('http://127.0.0.1:4175/admin')
  await page.getByRole('alert').filter({ hasText: 'not been assigned CMS access' }).waitFor()
  assert.ok(page.url().endsWith('/admin/login'))
  assert.deepEqual(errors, [])
  console.log('CMS Auth smoke passed: login failure/success, restoration, profile failure/retry, sign-out, unassigned denial.')
} finally {
  await browser?.close()
  await server.close()
}

