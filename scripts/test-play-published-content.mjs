import assert from 'node:assert/strict'
import { spawn } from 'node:child_process'
import { chromium } from 'playwright'

const HOST = '127.0.0.1'
const PORT = 5187
const BASE = process.env.BASE_URL ?? `http://${HOST}:${PORT}`
const SUPABASE_ORIGIN = 'http://play-test-supabase.invalid'

const publishedQuestion = {
  id: 'synthetic-published-trivia',
  game: 'trivia',
  category: 'synthetic-published',
  difficulty: 'beginner',
  prompt: { en: 'Which synthetic answer is published?', am: 'የትኛው ሰው ሰራሽ መልስ ታትሟል?' },
  options: [
    { key: 'a', text: { en: 'Published answer', am: 'የታተመ መልስ' } },
    { key: 'b', text: { en: 'Other answer', am: 'ሌላ መልስ' } },
    { key: 'c', text: { en: 'Third answer', am: 'ሦስተኛ መልስ' } },
    { key: 'd', text: { en: 'Fourth answer', am: 'አራተኛ መልስ' } },
  ],
  correctKey: 'a',
  explanation: { en: 'Synthetic published explanation.', am: 'ሰው ሰራሽ የታተመ ማብራሪያ።' },
  source: { label: 'Synthetic source', route: '/bible/genesis/1', kind: 'bible', sourceId: 'synthetic' },
  verifiedLocales: ['en', 'am'],
}

let server
if (!process.env.BASE_URL) {
  const command = process.platform === 'win32' ? (process.env.ComSpec ?? 'cmd.exe') : 'npm'
  const args = process.platform === 'win32'
    ? ['/d', '/s', '/c', `npm.cmd run dev -- --host ${HOST} --port ${PORT}`]
    : ['run', 'dev', '--', '--host', HOST, '--port', String(PORT)]
  server = spawn(command, args, {
    env: {
      ...process.env,
      VITE_SUPABASE_URL: SUPABASE_ORIGIN,
      VITE_SUPABASE_PUBLISHABLE_KEY: 'synthetic-test-key',
    },
    stdio: 'ignore',
    windowsHide: true,
  })
  for (let attempt = 0; attempt < 60; attempt += 1) {
    try {
      await fetch(BASE)
      break
    } catch {
      if (attempt === 59) throw new Error('Vite test server did not start')
      await new Promise((resolve) => setTimeout(resolve, 250))
    }
  }
}

const browser = await chromium.launch({ headless: true })
const context = await browser.newContext()
const page = await context.newPage()
const pageErrors = []
page.on('pageerror', (error) => pageErrors.push(error.message))

let requestCount = 0
let mode = 'initial'
let releaseInitial
const initialRequest = new Promise((resolve) => { releaseInitial = resolve })

await page.route(`${SUPABASE_ORIGIN}/rest/v1/play_content_items*`, async (route) => {
  requestCount += 1
  const url = new URL(route.request().url())
  assert.equal(url.searchParams.get('game_type'), 'eq.trivia')
  assert.equal(url.searchParams.get('status'), 'eq.published')
  assert.equal(url.searchParams.get('order'), 'published_at.asc')

  if (mode === 'initial') {
    await initialRequest
    mode = 'failure'
    await route.fulfill({ status: 200, contentType: 'application/json', body: JSON.stringify([{ payload: publishedQuestion }]) })
  } else if (mode === 'failure') {
    await route.fulfill({ status: 503, contentType: 'application/json', body: JSON.stringify({ message: 'synthetic failure' }) })
  } else {
    await route.fulfill({ status: 200, contentType: 'application/json', body: JSON.stringify([{ payload: publishedQuestion }]) })
  }
})

try {
  await page.goto(`${BASE}/play/trivia`, { waitUntil: 'domcontentloaded', timeout: 60000 })
  await assert.rejects(page.getByText('Published questions could not be loaded.').waitFor({ state: 'visible', timeout: 500 }), /timeout/i)
  await page.getByText('Checking for published questions…').waitFor({ state: 'visible', timeout: 10000 })
  releaseInitial()
  await page.getByRole('option', { name: 'synthetic-published' }).waitFor({ state: 'attached', timeout: 10000 })

  await page.reload({ waitUntil: 'domcontentloaded' })
  await page.getByText('Published questions could not be loaded.').waitFor({ state: 'visible', timeout: 10000 })
  await page.getByRole('button', { name: 'Start round' }).click()
  await page.locator('article[class*="questionCard"]').waitFor({ state: 'visible', timeout: 10000 })
  mode = 'retry'
  await page.getByRole('button', { name: 'Try again' }).click()
  await page.getByText('Published questions could not be loaded.').waitFor({ state: 'hidden', timeout: 10000 })
  await page.reload({ waitUntil: 'domcontentloaded' })
  await page.getByRole('option', { name: 'synthetic-published' }).waitFor({ state: 'attached', timeout: 10000 })
  assert.ok(requestCount >= 3)

  const amContext = await browser.newContext()
  await amContext.addInitScript(() => window.localStorage.setItem('tewahedo-daily-locale', 'am'))
  const amPage = await amContext.newPage()
  let amRequest
  const amRequestReady = new Promise((resolve) => { amRequest = resolve })
  await amPage.route(`${SUPABASE_ORIGIN}/rest/v1/play_content_items*`, async (route) => {
    requestCount += 1
    const url = new URL(route.request().url())
    assert.equal(url.searchParams.get('game_type'), 'eq.trivia')
    assert.equal(url.searchParams.get('status'), 'eq.published')
    assert.equal(url.searchParams.get('order'), 'published_at.asc')
    await amRequestReady
    await route.fulfill({ status: 503, contentType: 'application/json', body: JSON.stringify({ message: 'synthetic failure' }) })
  })
  await amPage.goto(`${BASE}/play/trivia`, { waitUntil: 'domcontentloaded', timeout: 60000 })
  await amPage.getByText('የታተመ ይዘት በመፈለግ ላይ…').waitFor({ state: 'visible', timeout: 10000 })
  amRequest()
  await amPage.getByText('የታተመ ተጨማሪ ይዘት ሊጫን አልቻለም።').waitFor({ state: 'visible', timeout: 10000 })
  await amPage.getByRole('button', { name: 'እንደገና ይሞክሩ' }).waitFor({ state: 'visible', timeout: 10000 })
  await amContext.close()

  assert.deepEqual(pageErrors, [])
  console.log('Play published-content tests passed.')
} finally {
  await browser.close()
  if (server) server.kill()
}
