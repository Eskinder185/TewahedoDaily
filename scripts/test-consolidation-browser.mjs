/**
 * Anonymous public visitor, VITE_PLAY_DATABASE_ONLY=true, the REAL app. The fake PostgREST endpoint serves exactly the rows
 * scripts/play/consolidate-content.ts produces (published), so this proves the consolidated inventory reaches every game
 * through the production data path. No auth, no writes, no external network.
 * Run: node scripts/test-consolidation-browser.mjs   (LIBRARY_BOOKS=production simulates only the 4 books published today)
 */
import assert from 'node:assert/strict'
import { execFileSync } from 'node:child_process'
import { readFileSync, mkdtempSync } from 'node:fs'
import { tmpdir } from 'node:os'
import path from 'node:path'
import { createServer } from 'vite'
import { chromium } from 'playwright'

const endpoint = 'https://consolidation-fixture.invalid'
process.env.VITE_PLAY_DATABASE_ONLY = 'true'
process.env.VITE_SUPABASE_URL = endpoint
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'
const work = mkdtempSync(path.join(tmpdir(), 'tewahedo-consolidation-'))
const manifestPath = path.join(work, 'manifest.json')
execFileSync(process.execPath, ['node_modules/tsx/dist/cli.mjs', 'scripts/play/consolidate-content.ts', '--manifest', manifestPath], { stdio: 'pipe', env: { ...process.env, VITE_SUPABASE_URL: endpoint } })
const manifest = JSON.parse(readFileSync(manifestPath, 'utf8'))
const counts = JSON.parse(readFileSync('src/lib/play/generated/counts.json', 'utf8'))
const productionBooks = process.env.LIBRARY_BOOKS === 'production'
const books = productionBooks ? ['five-pillars-of-mystery-am', 'five-pillars-of-mystery-en', 'seven-sacraments-baptism-am', 'seven-sacraments-baptism-en']
  : ['seven-sacraments', 'church-history-worldwide', 'church-history-ethiopia']

const port = 5327
const server = await createServer({ server: { host: '127.0.0.1', port, strictPort: true }, cacheDir: 'node_modules/.vite-consolidation-tests', logLevel: 'error' })
await server.listen()
const base = `http://127.0.0.1:${port}`
// Source-only Mezmur selections: hymns are served by the fake public projection; no lyrics are stored in the game table.
const { toStudioActivityDraft } = await server.ssrLoadModule('/src/lib/play/studioActivity.ts')
const songs = [1, 2, 3, 4, 5, 6].map(i => ({ slug: `synthetic-hymn-${i}`, title: `Synthetic hymn ${i}`, title_amharic: `የሙከራ መዝሙር ${i}`, title_english: `Synthetic hymn ${i}`, primary_language: 'am', lyrics_english: null, lyrics_transliteration: null, youtube_url: null,
  lyrics_amharic: ['አንድ', 'ሁለት', 'ሦስት', 'አራት', 'አምስት', 'ስድስት', 'ሰባት'].map(word => `የሙከራ ግጥም መስመር ${word} ${i}`).join('\n') }))
const mezmurRows = songs.map(song => ({ ...toStudioActivityDraft({ version: 1, id: '00000000-0000-4000-8000-000000000001', stableId: `legacy-finish-the-mezmur-${song.slug}`, owner: 'x', name: song.slug, status: 'draft', updatedAt: '2026-11-16T00:00:00Z', category: 'mezmur', difficulty: 'beginner', draft: { game: 'finish-the-mezmur', content: song } }) }))
const rows = [...manifest.rows, ...mezmurRows].map((row, index) => ({ id: `00000000-0000-4000-8000-${String(index).padStart(12, '0')}`, question_id: row.stable_id, stable_id: row.stable_id, game_type: row.game_type, category: row.category, difficulty: row.difficulty,
  status: 'published', published_at: '2026-11-16T12:00:00Z', updated_at: '2026-11-16T12:00:00Z', review_notes: null, payload: row.payload, source_references: row.source_references }))
const writes = []
let browser, passed = 0, failed = 0
const run = async (name, fn) => { try { await fn(); passed++; console.log(`PASS ${name}`) } catch (error) { failed++; console.error(`FAIL ${name}: ${String(error.message).split('\n')[0]}`); if (process.env.DEBUG_TEXT) console.error('   page:', (await globalThis.__page?.locator('body').innerText().catch(() => '') ?? '').replace(/\s+/g, ' ').slice(Number(process.env.DEBUG_FROM || 0), Number(process.env.DEBUG_FROM || 0) + 1800)) } }
try {
  browser = await chromium.launch()
  const context = await browser.newContext({ viewport: { width: 1280, height: 900 }, serviceWorkers: 'block' })
  await context.addInitScript(() => { if (!localStorage.getItem('tewahedo-daily-locale')) localStorage.setItem('tewahedo-daily-locale', 'en') })
  await context.route('**/*', async route => {
    const request = route.request(), url = new URL(request.url())
    if (url.origin === base) return route.continue()
    if (url.origin !== endpoint) return route.abort()
    const cors = { 'access-control-allow-origin': '*', 'access-control-allow-headers': '*', 'access-control-allow-methods': '*', 'access-control-expose-headers': 'content-range' }
    const reply = (body, status = 200, headers = {}) => route.fulfill({ status, contentType: 'application/json', headers: { ...cors, ...headers }, body: JSON.stringify(body) })
    if (request.method() === 'OPTIONS') return reply(null)
    if (request.method() !== 'GET') { writes.push(`${request.method()} ${url.pathname}`); return reply({ message: 'Anonymous visitors cannot write' }, 401) }
    if (url.pathname.includes('/storage/')) return route.fulfill({ status: 200, contentType: 'image/png', headers: cors, body: Buffer.from('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==', 'base64') })
    const param = key => url.searchParams.get(key)?.replace(/^(eq|in)\./, '')
    if (url.pathname.endsWith('/play_content_items')) {
      if (param('status') !== 'published') return reply([])
      let selected = rows.filter(row => !param('game_type') || row.game_type === param('game_type'))
      selected.sort((a, b) => a.question_id.localeCompare(b.question_id))
      const offset = Number(param('offset') || 0), limit = url.searchParams.has('limit') ? Number(param('limit')) : selected.length
      return reply(selected.slice(offset, offset + limit))
    }
    if (url.pathname.endsWith('/mezmur_public')) {
      const wanted = url.searchParams.get('slug')?.replace(/^in\.\(|\)$/g, '').split(',').map(slug => slug.replace(/"/g, ''))
      return reply(songs.filter(song => !wanted || wanted.includes(song.slug)))
    }
    if (url.pathname.endsWith('/church_library_books')) return reply(books.map(slug => ({ slug })))
    return reply([])
  })
  const page = await context.newPage(); page.setDefaultTimeout(20000); globalThis.__page = page; globalThis.__page = page
  const errors = []; page.on('pageerror', error => errors.push(error.message))
  const optionButtons = () => page.locator('[class*=options] button')
  const ROUTES = ['trivia', 'emoji', 'finish-the-verse', 'finish-the-mezmur', 'history', 'who-am-i', 'match', 'feasts', 'saints', 'bible-timeline', 'icon-memory', 'adventures']
  const noErrorState = async () => {
    assert.equal(await page.getByText(/could not be loaded|New challenges are being prepared|not enough yet/).count(), 0, 'database error or empty state shown')
  }

  await run(`hub (desktop, English): every game shows its exact published count, with the right unit${productionBooks ? ' [production books]' : ''}`, async () => {
    await page.goto(`${base}/play`)
    const n = (game, extra = 0) => counts[game].total - extra
    const trivia = productionBooks ? n('trivia', 10) : n('trivia')
    const body = () => page.locator('body').innerText()
    const expected = [`${trivia} questions`, `${n('emoji')} clues`, `${n('finish-the-verse')} excerpts`, `${n('who-am-i')} cards`, `${productionBooks ? n('match', 4) : n('match')} pairs`,
      `${n('bible-timeline')} timelines · ${counts['bible-timeline'].events} events`, `${n('feasts')} pictures`, `${n('saints')} pictures`, `${n('icon-memory')} pictures`, `${n('adventures')} stories`]
    await page.getByText(expected[0]).first().waitFor()
    await page.waitForFunction(() => !/Loading…/.test(document.body.innerText))
    const text = await body()
    for (const item of expected) assert.ok(text.includes(item), `hub is missing "${item}"`)
    assert.equal(await page.getByText(/Published challenge counts could not be loaded/).count(), 0)
    assert.equal((await body()).includes('226 questions'), !productionBooks)
  })
  for (const game of ROUTES) await run(`${game}: loads database content and offers to start (no error/empty state)`, async () => {
    if (productionBooks && game === 'history') {
      await page.goto(`${base}/play/${game}`)
      await page.getByText('New challenges are being prepared.').waitFor()
      return
    }
    await page.goto(`${base}/play/${game}`)
    const start = page.getByRole('button', { name: /Start|Timeline Challenge|Deal the cards|Begin|Play/ }).first()
    const link = page.getByRole('link', { name: /Start adventure/ }).first()
    await Promise.race([start.waitFor(), link.waitFor()])
    await noErrorState()
  })
  for (const game of ['trivia', 'emoji', 'finish-the-verse']) await run(`${game}: complete a full 5-question round from database content, then replay`, async () => {
    for (const again of [false, true]) {
      if (!again) {
        await page.goto(`${base}/play/${game}`)
        await page.getByRole('button', { name: 'challenge', exact: true }).click()
        await page.getByRole('button', { name: /Start round/ }).click()
      }
      for (let i = 0; i < 5; i++) {
        await optionButtons().first().waitFor()
        await optionButtons().nth(i % 4).click()
        await page.getByRole('button', { name: /^(Next|See results)$/ }).click()
      }
      await page.getByRole('heading', { name: /Well played/ }).waitFor()
      assert.match(await page.locator('[class*=scoreRow]').innerText(), /\d+\/5/)
      if (!again) await page.getByRole('button', { name: /Play again/ }).click()
    }
  })
  await run('Amharic hub at 390px: counts localized, no overflow', async () => {
    await page.setViewportSize({ width: 390, height: 844 })
    await page.evaluate(() => localStorage.setItem('tewahedo-daily-locale', 'am'))
    await page.goto(`${base}/play`)
    await page.getByText(/ጥያቄዎች|ጥያቄ/).first().waitFor()
    assert.equal(await page.evaluate(() => document.documentElement.scrollWidth > innerWidth + 1), false)
    for (const game of ROUTES) { await page.goto(`${base}/play/${game}`); assert.equal(await page.evaluate(() => document.documentElement.scrollWidth > innerWidth + 1), false, `${game} overflows`) }
  })
  await run('anonymous visitor: no table writes and no browser errors', async () => { assert.deepEqual(writes.filter(w => w.includes('play_content_items')), []); assert.deepEqual(errors, []) })
  await context.close()
} finally { await browser?.close(); await server.close() }
console.log(`${passed} passed, ${failed} failed`)
process.exitCode = failed ? 1 : 0
