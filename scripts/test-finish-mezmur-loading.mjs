import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'
import { spawn } from 'node:child_process'
import { chromium } from 'playwright'

const host = '127.0.0.1'
const port = 5191
const base = `http://${host}:${port}`
const supabaseOrigin = 'http://finish-mezmur-test.invalid'
const fixture = JSON.parse(await readFile(new URL('./fixtures/finish-mezmur-sample.json', import.meta.url), 'utf8'))
const successFixture = Array.from({ length: 12 }, (_, i) => ({ ...fixture[0], slug: `${fixture[0].slug}-${i}` }))
const command = process.platform === 'win32' ? (process.env.ComSpec ?? 'cmd.exe') : 'npm'
const args = process.platform === 'win32' ? ['/d', '/s', '/c', `npm.cmd run dev -- --host ${host} --port ${port}`] : ['run', 'dev', '--', '--host', host, '--port', String(port)]
const server = spawn(command, args, { env: { ...process.env, VITE_SUPABASE_URL: supabaseOrigin, VITE_SUPABASE_PUBLISHABLE_KEY: 'test-key' }, stdio: 'ignore', windowsHide: true })
for (let i = 0; i < 60; i += 1) { try { await fetch(base); break } catch { if (i === 59) throw new Error('Vite test server did not start'); await new Promise((r) => setTimeout(r, 250)) } }

const browser = await chromium.launch({ headless: true })
const page = await browser.newPage()
let mode = '503'
let requests = 0
await page.route(`${supabaseOrigin}/rest/v1/mezmur_public*`, async (route) => {
  requests += 1
  if (mode === 'hang') return
  if (mode === '503') return route.fulfill({ status: 503, contentType: 'application/json', body: '{}' })
  if (mode === 'empty') return route.fulfill({ status: 200, contentType: 'application/json', body: '[]' })
  return route.fulfill({ status: 200, contentType: 'application/json', body: JSON.stringify(successFixture) })
})

try {
  await page.goto(`${base}/play/finish-the-mezmur`, { waitUntil: 'domcontentloaded' })
  await page.getByText('Lyrics are not available right now').waitFor({ timeout: 12000 })
  mode = 'success'
  await page.getByRole('button', { name: 'Try again' }).click()
  await page.getByText('Set up your round').waitFor({ timeout: 12000 })
  mode = 'empty'
  await page.reload({ waitUntil: 'domcontentloaded' })
  await page.getByText('Lyrics are not available right now').waitFor({ timeout: 12000 })
  mode = 'hang'
  await page.reload({ waitUntil: 'domcontentloaded' })
  await page.getByText('Lyrics are not available right now').waitFor({ timeout: 12000 })
  assert.ok(requests >= 4)
  console.log('Finish Mezmur loading regression: PASS')
} finally {
  await browser.close()
  server.kill()
}
