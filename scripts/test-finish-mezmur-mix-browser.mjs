/** Mix it up is the default and the first question's format varies between rounds. Mocked lyrics; no live data. */
import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'
import { spawn } from 'node:child_process'
import { chromium } from 'playwright'

const host = '127.0.0.1'; const port = 5193; const base = `http://${host}:${port}`
const origin = 'http://finish-mezmur-mix.invalid'
const fixture = JSON.parse(await readFile(new URL('./fixtures/finish-mezmur-sample.json', import.meta.url), 'utf8'))
const rows = Array.from({ length: 12 }, (_, i) => ({ ...fixture[0], slug: `${fixture[0].slug}-${i}` }))
const command = process.platform === 'win32' ? (process.env.ComSpec ?? 'cmd.exe') : 'npm'
const args = process.platform === 'win32' ? ['/d', '/s', '/c', `npm.cmd run dev -- --host ${host} --port ${port}`] : ['run', 'dev', '--', '--host', host, '--port', String(port)]
const server = spawn(command, args, { env: { ...process.env, VITE_SUPABASE_URL: origin, VITE_SUPABASE_PUBLISHABLE_KEY: 'test-key', VITE_PLAY_DATABASE_ONLY: 'false' }, stdio: 'ignore', windowsHide: true })
for (let i = 0; i < 60; i += 1) { try { await fetch(base); break } catch { if (i === 59) throw new Error('Vite did not start'); await new Promise((r) => setTimeout(r, 500)) } }
const browser = await chromium.launch({ headless: true })
const page = await browser.newPage()
await page.route(`${origin}/rest/v1/**`, (route) => route.fulfill({ status: 200, contentType: 'application/json', body: JSON.stringify(rows) }))
try {
  const firstFormats = new Set()
  for (let round = 0; round < 10; round += 1) {
    await page.goto(`${base}/play/finish-the-mezmur`, { waitUntil: 'domcontentloaded' })
    await page.getByText('Set up your round').waitFor({ timeout: 15000 })
    if (round === 0) assert.equal(await page.locator('[data-fm-mode-choice="mix"]').getAttribute('aria-pressed'), 'true', 'Mix it up is the default')
    await page.getByRole('button', { name: 'Start round' }).click()
    const card = page.locator('[data-fm-mode]').first()
    await card.waitFor({ timeout: 10000 })
    firstFormats.add(await card.getAttribute('data-fm-mode'))
  }
  assert.ok(firstFormats.size >= 2, `first-question format never varied: ${[...firstFormats]}`)
  console.log('Finish Mezmur mix: PASS, first-question formats seen:', [...firstFormats].join(', '))
} finally { await browser.close(); server.kill() }
