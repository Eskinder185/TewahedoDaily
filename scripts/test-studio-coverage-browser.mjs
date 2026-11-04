/** Real studio/Router/service components; fake Auth + PostgREST, external requests blocked. */
import assert from 'node:assert/strict'
import { createServer } from 'vite'
import react from '@vitejs/plugin-react'
import { chromium } from 'playwright'
import { mkdtempSync } from 'node:fs'
import { tmpdir } from 'node:os'
import path from 'node:path'

const base = 'http://127.0.0.1:5199'
const endpoint = 'https://studio-fixture.invalid'
const owner = '11111111-1111-4111-8111-111111111111'
const screenshots = mkdtempSync(path.join(tmpdir(), 'tewahedo-studio-qa-'))
const entry = `import React from 'react';import{createRoot}from'react-dom/client';import{createBrowserRouter,RouterProvider}from'react-router-dom';import App from '/src/App.tsx';import{LocaleProvider}from'/src/lib/i18n/locale.tsx';import{ThemeProvider}from'/src/components/layout/ThemeProvider.tsx';import'/src/index.css';const router=createBrowserRouter([{path:'*',element:<App/>}]);window.__router=router;createRoot(document.getElementById('root')).render(<ThemeProvider><LocaleProvider><RouterProvider router={router}/></LocaleProvider></ThemeProvider>);`
const auth = `import React from 'react';import{AuthContext}from'/src/lib/auth/useAuth.ts';export function AuthProvider({children}){const role=localStorage.getItem('studio-test-role')||'editor';const user=role==='anon'?null:{id:'${owner}'};const profile=user?{id:user.id,role,display_name:'Synthetic staff'}:null;return React.createElement(AuthContext.Provider,{value:{user,profile,session:user?{user}:null,role,loading:false,error:null,isStaff:['editor','admin','super_admin'].includes(role),isAuthenticated:!!user}},children)}`
const staff = `export async function requireCmsStaffSession(){const role=localStorage.getItem('studio-test-role')||'editor';if(!['editor','admin','super_admin'].includes(role))throw new Error('Staff role required');return{profileRole:role}}export function getLastCmsStaffProbe(){return null}export function mapStaffWriteError(error){return error}`
const passage = `export async function fetchBiblePassage(params){return{isComplete:true,editionCode:params.preferredEdition,readerHref:'/bible/'+params.bookSlug+'/'+params.chapterNumber+'?edition='+params.preferredEdition,verses:[{id:'source-verse',text:params.preferredEdition==='am'?'የሙከራ ጥቅስ ቃል':'Synthetic exact source word'}]}}export async function fetchBiblePassageBilingual(){return{amharic:{isComplete:true,editionCode:'am',editionName:'Synthetic Amharic',bookTitleEn:'Genesis',chapterNumber:1,readerHref:'/bible/genesis/1?edition=am#verse-1',verses:[{id:'am-verse',verseNumber:1,text:'የሙከራ ጥቅስ ቃል'}]},english:{isComplete:true,editionCode:'web',editionName:'Synthetic English',bookTitleEn:'Genesis',chapterNumber:1,readerHref:'/bible/genesis/1?edition=web#verse-1',verses:[{id:'web-verse',verseNumber:1,text:'Synthetic exact source word'}]}}}`
const mocks = { AuthProvider: auth, cmsStaffAuth: staff, studioBibleSource: passage.replace('fetchBiblePassage(', 'fetchStudioPassage(').replace('fetchBiblePassageBilingual(', 'fetchStudioPassageBilingual(')
  + "export async function listStudioBooks(){return [{slug:'genesis',en:'Genesis',am:'ዘፍጥረት'}]}" }
const plugin = {
  name: 'studio-offline-fixtures', enforce: 'pre',
  resolveId(source) {
    if (source === '/__studio-entry.jsx') return source
    const name = source.split('/').at(-1).replace(/\.(tsx?|jsx?)$/, '')
    if (Object.hasOwn(mocks, name)) return `\0studio-${name}.jsx`
  },
  load(id) {
    if (id === '/__studio-entry.jsx') return entry
    if (id.startsWith('\0studio-')) return mocks[id.slice(8, -4)]
  },
  configureServer(vite) {
    vite.middlewares.use(async (req, res, next) => {
      if (!req.headers.accept?.includes('text/html')) return next()
      res.setHeader('Content-Type', 'text/html')
      res.end(await vite.transformIndexHtml(req.url, '<!doctype html><html><head><meta name="viewport" content="width=device-width, initial-scale=1"></head><body><div id="root"></div><script type="module" src="/__studio-entry.jsx"></script></body></html>'))
    })
  },
}
const rows = []
const writes = []
let role = 'editor'
let failWrite = false
let failCardReads = false
const lyric = { slug: 'synthetic-song', title: 'Synthetic song', title_amharic: 'የሙከራ መዝሙር', title_english: 'Synthetic song', primary_language: 'am', lyrics_english: null, lyrics_transliteration: null, youtube_url: null,
  lyrics_amharic: ['አንድ', 'ሁለት', 'ሦስት', 'አራት', 'አምስት', 'ስድስት'].map(word => `የሙከራ ግጥም መስመር ${word}`).join('\n') }
const server = await createServer({ configFile: false, envDir: false, plugins: [plugin, react()], cacheDir: 'node_modules/.vite-studio-coverage-tests', logLevel: 'error',
  optimizeDeps: { noDiscovery: true, include: ['react', 'react-dom/client', 'react-router-dom'] }, resolve: { dedupe: ['react', 'react-dom'] },
  server: { host: '127.0.0.1', port: 5199, strictPort: true, hmr: false },
  define: { 'import.meta.env.VITE_SUPABASE_URL': JSON.stringify(endpoint), 'import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY': JSON.stringify('synthetic-public-key') } })
let browser
let passed = 0, failed = 0
const run = async (name, fn) => { try { await fn(); passed++; console.log(`PASS ${name}`) } catch (error) { failed++; console.error(`FAIL ${name}: ${error.message}`) } }
try {
  await server.listen(); browser = await chromium.launch()
  const context = await browser.newContext({ viewport: { width: 1280, height: 900 }, serviceWorkers: 'block' })
  const errors = []
  await context.addInitScript(() => { if (!localStorage.getItem('tewahedo-daily-locale')) localStorage.setItem('tewahedo-daily-locale', 'en') })
  await context.route('**/*', async route => {
    const request = route.request(), url = new URL(request.url())
    if (url.origin === base) return route.continue()
    if (url.origin !== endpoint) return route.abort()
    const cors = { 'access-control-allow-origin': '*', 'access-control-allow-headers': '*', 'access-control-allow-methods': '*' }
    const reply = (body, status = 200, headers = {}) => route.fulfill({ status, contentType: 'application/json', headers: { ...cors, ...headers }, body: JSON.stringify(body) })
    if (request.method() === 'OPTIONS') return reply(null)
    if (url.pathname.includes('/storage/')) return route.fulfill({ status: 200, contentType: 'image/png', headers: cors, body: Buffer.from('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==', 'base64') })
    if (url.pathname.endsWith('/mezmur_public')) return reply([lyric])
    if (url.pathname.endsWith('/play_content_items')) {
      const id = url.searchParams.get('id')?.replace(/^eq\./, '')
      const publicRead = request.method() === 'GET' && url.searchParams.get('status') === 'eq.published'
      if (publicRead && failCardReads && ['eq.who-am-i', 'eq.match'].includes(url.searchParams.get('game_type'))) return reply({ message: 'Synthetic card outage' }, 503)
      if (!['editor', 'admin', 'super_admin'].includes(role) && !publicRead) return reply({ message: 'Staff required' }, 403)
      let selected = id ? rows.filter(row => row.id === id) : rows.slice()
      if (publicRead) selected = selected.filter(row => row.status === 'published' && row.published_at)
      if (url.searchParams.has('game_type')) selected = selected.filter(row => row.game_type === url.searchParams.get('game_type').replace(/^eq\./, ''))
      if (['POST', 'PATCH', 'DELETE'].includes(request.method())) {
        writes.push({ method: request.method(), id })
        if (failWrite) return reply({ message: 'Synthetic write denied', code: '42501' }, 403)
        if (request.method() === 'POST') {
          const value = request.postDataJSON(); assert.equal(value.question_id, value.stable_id); assert.equal(value.status, 'draft')
          const row = { ...value, id: crypto.randomUUID(), updated_at: new Date().toISOString(), published_at: null, review_notes: null }; rows.push(row); selected = [row]
        } else if (request.method() === 'PATCH') {
          if (selected[0]?.status !== 'draft') return reply({ message: 'Content locked' }, 403)
          Object.assign(selected[0], request.postDataJSON(), { updated_at: new Date().toISOString() })
        } else return reply({ message: 'Delete denied' }, 403)
      }
      const count = selected.length
      const from = Number(url.searchParams.get('offset') || 0)
      const to = from + Number(url.searchParams.get('limit') || count || 250)
      if (url.searchParams.has('offset') || url.searchParams.has('limit')) selected = selected.slice(from, to)
      return reply(request.headers().accept?.includes('vnd.pgrst.object') ? selected[0] || null : selected, 200,
        { 'content-range': `${from}-${from + selected.length - 1}/${count}`, 'access-control-expose-headers': 'content-range' })
    }
    if (url.pathname.endsWith('/rpc/review_play_content')) {
      const input = request.postDataJSON(), row = rows.find(row => row.id === input.p_id)
      writes.push({ method: 'RPC', status: input.p_status })
      const allowed = row && ((row.status === 'draft' && input.p_status === 'review') || (role === 'admin' && ['review>approved', 'approved>published', 'published>archived', 'archived>draft', 'published>draft'].includes(`${row.status}>${input.p_status}`)))
      if (!allowed) return reply({ message: 'Transition denied' }, 403)
      row.status = input.p_status; row.published_at = row.status === 'published' ? new Date().toISOString() : null
      return reply(row)
    }
    return reply([])
  })
  const page = await context.newPage(); page.setDefaultTimeout(15000)
  page.on('pageerror', error => errors.push(error.message))
  page.on('dialog', dialog => void dialog.accept())
  const go = async search => { await page.goto(`${base}/admin/play/studio${search}`); await page.getByRole('heading', { name: 'Game Content Studio', exact: true }).waitFor() }
  const progress = () => page.evaluate(() => Object.fromEntries(Object.entries(localStorage).filter(([key]) => /play.*progress|progress.*play|xp/i.test(key))))
  const evalModule = (modulePath, fn) => page.evaluate(([target, source]) => import(/* @vite-ignore */ target).then(module => new Function('module', `return (${source})(module)`)(module)), [modulePath, fn.toString()])
  const tab = name => page.locator(`[data-studio-tab="${name}"]`)
  const overflow = async label => assert.ok(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 1), `${label}: no horizontal overflow`)
  const selectGame = async id => { await page.locator('[data-game-selector]').selectOption(id); await page.waitForFunction(value => new URLSearchParams(location.search).get('game') === value, id) }
  await go('')
  await page.evaluate(() => localStorage.setItem('studio-test-role', 'admin')); await page.reload()
  await page.getByRole('heading', { name: 'Game Content Studio', exact: true }).waitFor()
  const baselineProgress = await progress()
  const writesAtStart = writes.length
  const campaignQuestion = (id, extra = {}) => ({ id, game: 'trivia', category: 'Bible', difficulty: 'beginner',
    prompt: { en: `English prompt ${id}`, am: `የአማርኛ ጥያቄ ${id}` },
    options: ['a', 'b', 'c', 'd'].map(key => ({ key, text: { en: `Option ${key}`, am: `አማራጭ ${key}` } })), correctKey: 'c',
    explanation: { en: 'Because of the cited verse.', am: 'በተጠቀሰው ጥቅስ ምክንያት።' },
    source: { label: 'Genesis 10:1', route: '/bible/genesis/10?edition=web#verse-1', kind: 'bible' }, verifiedLocales: [], ...extra })
  const provenance = { sourceHash: 'ab12cd34ef567890', sourceRevision: 'r1', modelId: 'fixture-model', passageId: 'p-genesis-10', editionId: 'e', canonCode: 'c', numberingScheme: 's', bookId: 'b', chapterId: 'c', verseIds: ['verse-aaaaaaaa'], evidenceVerseId: 'verse-aaaaaaaa' }
  const campaignFile = JSON.stringify({ version: 1, campaignId: 'fixture-campaign', totalDrafts: 3, drafts: [
    { status: 'draft', editorialReviewRequired: true, question: campaignQuestion('bible-test-0001'), provenance },
    { status: 'draft', editorialReviewRequired: true, question: campaignQuestion('bible-test-0002', { difficulty: 'growing' }), provenance },
    { status: 'draft', editorialReviewRequired: true, question: campaignQuestion('bible-test-0003', { options: [{ key: 'a', text: { en: 'Only one' } }] }), provenance },
  ] })

  for (const width of [1280, 390]) {
    await page.setViewportSize({ width, height: 900 })
    await go('')
    await run(`${width}px: Studio mirrors the public page: five categories, all twelve games, compact tabs`, async () => {
      assert.deepEqual(await page.locator('[data-studio-tab]').evaluateAll(tabs => tabs.map(item => item.dataset.studioTab)), ['library', 'settings', 'coverage', 'campaign'])
      await page.getByText('Browse existing games and their sources', { exact: true }).click()
      assert.equal(await page.locator('[data-open-game]').count(), 12)
      await page.locator('details summary', { hasText: 'Categories and modes' }).click()
      const details = await page.locator('details summary', { hasText: 'Categories and modes' }).locator('..').innerText()
      for (const category of ['Icons & feasts', 'Scripture', 'Mezmur', 'History', 'Family & group']) assert.ok(details.includes(category), category)
      assert.equal(await page.locator('[data-studio-game]').count(), 0, 'no redundant per-game cards')
      await overflow('overview')
      await page.screenshot({ path: path.join(screenshots, `overview-${width}.png`), fullPage: true })
    })
    await run(`${width}px: every public game shows its existing built-in content (read-only, with source)`, async () => {
      const expected = await evalModule('/src/lib/play/staticContent.ts', module => module.builtInCounts())
      for (const [game, count] of Object.entries(expected)) {
        await selectGame(game)
        const section = page.locator('[data-built-in-section]')
        await section.waitFor()
        if (game === 'finish-the-mezmur') { assert.match(await section.innerText(), /published Mezmur records/); continue }
        assert.ok(count > 0, `${game} has built-in content`)
        assert.match(await section.locator('[data-built-in-count]').innerText(), new RegExp(`^${count} of ${count} `), game)
        assert.equal(await section.locator('[data-built-in-item]').count(), Math.min(count, 12), `${game}: items visible`)
        assert.match(await section.innerText(), /Source:/)
        assert.match(await section.innerText(), /Live · built-in/)
      }
      await overflow('built-in')
      await selectGame('trivia'); await page.locator('[data-built-in-section]').waitFor()
      await page.screenshot({ path: path.join(screenshots, `trivia-library-${width}.png`), fullPage: true })
    })
    await run(`${width}px: search narrows built-in content; opening an item creates an editable DRAFT COPY and writes nothing`, async () => {
      await selectGame('trivia')
      const section = page.locator('[data-built-in-section]')
      const total = Number((await section.locator('[data-built-in-count]').innerText()).match(/of (\d+)/)[1])
      const first = await section.locator('[data-built-in-item]').first().getAttribute('data-built-in-item')
      await page.getByLabel('Search content').fill(first)
      await page.waitForFunction(() => new URLSearchParams(location.search).get('q'))
      const narrowed = Number((await section.locator('[data-built-in-count]').innerText()).match(/^(\d+) of/)[1])
      assert.ok(narrowed >= 1 && narrowed <= total, `${narrowed}/${total}`)
      assert.equal(await section.locator(`[data-built-in-item="${first}"]`).count(), 1)
      await page.getByLabel('Search content').fill('zzzz-no-such-item')
      await page.waitForFunction(() => new URLSearchParams(location.search).get('q') === 'zzzz-no-such-item')
      assert.match(await section.locator('[data-built-in-count]').innerText(), /^0 of /)
      await page.getByLabel('Search content').fill('')
      await page.waitForFunction(() => !new URLSearchParams(location.search).get('q'))
      const before = writes.length
      await section.locator('[data-built-in-item]').first().getByRole('button', { name: /Open editable copy/ }).click()
      await page.getByRole('region', { name: 'Dedicated game editor' }).waitFor()
      assert.equal(writes.length, before, 'opening a copy writes nothing')
      await page.getByRole('button', { name: /Library/ }).first().click()
    })
    await go('?game=adventures')
    await run(`${width}px: a built-in story opens as a LOCAL draft copy, saves, restores after reload, and the original is untouched`, async () => {
      const originalTitle = await evalModule('/src/lib/play/bibleAdventureStories.ts', module => module.bibleAdventureStories[0].title.en)
      await page.locator('[data-built-in-item]').first().getByRole('button', { name: /Open editable copy/ }).click()
      await page.getByRole('region', { name: 'Dedicated game editor' }).waitFor()
      const validation = page.getByRole('region', { name: 'Validation errors' })
      assert.equal(await validation.count(), 0, `copy of a built-in story must validate: ${(await validation.allInnerTexts()).join(' | ').replace(/\n/g, ' ; ')}`)
      await page.getByRole('button', { name: /^Save draft/ }).click()
      await page.getByRole('status').filter({ hasText: /Local draft saved and reopened/ }).waitFor()
      await page.reload()
      await page.getByRole('heading', { name: 'Game Content Studio', exact: true }).waitFor()
      await page.getByRole('button', { name: /Library/ }).first().click()
      await page.locator('ul[class*=library] li', { hasText: /Local browser/ }).first().waitFor() // saved local draft restored after reload
      assert.equal(await evalModule('/src/lib/play/bibleAdventureStories.ts', module => module.bibleAdventureStories[0].title.en), originalTitle)
      assert.equal(await page.locator('[data-built-in-item]').count(), 6, 'built-in stories still all listed')
    })
    await go('?view=settings')
    await run(`${width}px: Game settings are LOCAL proposals; hub preview is accurate and the public hub is unchanged`, async () => {
      assert.match(await page.locator('[data-settings-limitation]').innerText(), /LOCAL proposals/)
      const select = page.locator('[data-settings-game]')
      assert.equal(await select.locator('option').count(), 12)
      await select.selectOption('trivia')
      await page.getByLabel('Title / ርዕስ · English').fill('Edited Trivia Title')
      await page.getByLabel('Display order / ቅደም ተከተል').fill('1')
      assert.match(await page.locator('[data-game-settings]').innerText(), /already used by another game/)
      assert.equal(await page.getByRole('button', { name: /Save local proposal/ }).isDisabled(), true)
      await page.getByLabel('Display order / ቅደም ተከተል').fill('42')
      // Trivia's removed legacy artwork can be empty. Use the existing mapped Cana artwork.
      await page.locator('[data-settings-thumbnail]').selectOption('emoji')
      assert.match(await page.locator('[aria-label="Accurate hub card preview"]').innerText(), /Edited Trivia Title/)
      await page.getByRole('button', { name: /Save local proposal/ }).click()
      await page.getByRole('status').filter({ hasText: /LOCAL proposal and reopened/ }).waitFor()
      const preview = page.locator('[aria-label="Accurate hub card preview"]')
      await page.getByRole('button', { name: /^Remove Image/ }).click()
      assert.equal(await preview.locator('img').count(), 0)
      await page.getByRole('button', { name: /^Undo unsaved changes/ }).click()
      await preview.locator('img').waitFor()
      await page.getByRole('button', { name: /^Remove Image/ }).click()
      await page.getByRole('button', { name: /Save local proposal/ }).click()
      await page.getByRole('status').filter({ hasText: /LOCAL proposal and reopened/ }).waitFor()
      await page.reload()
      await tab('settings').waitFor()
      await page.locator('[data-settings-game]').selectOption('trivia')
      assert.equal(await page.getByLabel('Title / ርዕስ · English').inputValue(), 'Edited Trivia Title')
      assert.equal(await page.getByLabel('Display order / ቅደም ተከተል').inputValue(), '42')
      assert.equal(await page.locator('[data-settings-thumbnail]').inputValue(), '')
      assert.equal(await preview.locator('img').count(), 0, 'removed thumbnail stays removed after reopening')
      await page.locator('[data-settings-thumbnail]').selectOption('emoji')
      await preview.locator('img').waitFor()
      await page.getByRole('button', { name: /Save local proposal/ }).click()
      await overflow('settings')
      await page.screenshot({ path: path.join(screenshots, `settings-${width}.png`), fullPage: true })
      await page.goto(`${base}/play`)
      await page.getByRole('heading', { level: 3, name: 'Bible & Tewahedo Trivia' }).first().waitFor()
      assert.equal(await page.getByText('Edited Trivia Title').count(), 0, 'public hub does not read the local proposal')
      await go('?view=settings')
      await page.locator('[data-settings-game]').selectOption('trivia')
      await page.getByRole('button', { name: /Restore public values/ }).click()
      await page.getByRole('status').filter({ hasText: /Restored/ }).waitFor()
      assert.equal(await page.getByLabel('Title / ርዕስ · English').inputValue(), 'Bible & Tewahedo Trivia')
    })
    await go('?view=coverage')
    await run(`${width}px: coverage matrix lists every public feature with source, editability, adapter and blocker`, async () => {
      const expected = await evalModule('/src/lib/play/coverage.ts', module => module.coverageRows().map(row => ({ id: row.id, game: row.game })))
      assert.equal(await page.locator('[data-coverage-row]').count(), expected.length)
      const games = await evalModule('/src/lib/play/contentStudio.ts', module => module.STUDIO_GAMES.map(game => game.id))
      for (const game of games) assert.ok(expected.some(row => row.id === `content-${game}`), `${game} has a coverage row`)
      assert.deepEqual((await page.locator('[data-coverage-matrix] thead th').allInnerTexts()).map(text => text.toLowerCase()), ['public feature', 'source file / data', 'cms view', 'editable?', 'public adapter?', 'blocker'])
      const text = (await page.locator('[data-coverage-matrix]').innerText()).toLowerCase()
      for (const phrase of ['gameCatalog.ts', 'approvedContent.ts', 'bibleAdventureStories.ts', 'imageCatalog.ts', 'Game Night', 'UNVERIFIED'].map(item => item.toLowerCase())) assert.ok(text.includes(phrase), `${phrase} missing from: ${text.slice(0, 1500).replace(/\n/g, ' | ')}`)
      await page.locator('[data-coverage-row="content-adventures"] button').click()
      await page.waitForFunction(() => new URLSearchParams(location.search).get('game') === 'adventures')
      await page.locator('[data-built-in-section]').waitFor()
      await overflow('coverage')
      await page.screenshot({ path: path.join(screenshots, `coverage-${width}.png`), fullPage: true })
    })
    await go('?view=campaign')
    await run(`${width}px: campaign drafts are reviewed locally, never approved or published, and export drafts only`, async () => {
      assert.match(await page.locator('[data-campaign-panel]').innerText(), /NOT approved and NOT published/)
      await page.locator('[data-campaign-file]').setInputFiles({ name: 'batch-007-drafts.json', mimeType: 'application/json', buffer: Buffer.from(campaignFile) })
      await page.locator('[data-campaign-summary]').waitFor()
      assert.match(await page.locator('[data-campaign-summary]').innerText(), /3 drafts · 2 valid · 0 marked ready \(0 exportable\)/)
      const text = await page.locator('[data-campaign-panel]').innerText()
      for (const phrase of ['batch-007', 'genesis 10:1', 'trivia', 'Generated draft', 'Amharic unverified', 'Unreviewed']) assert.ok(text.includes(phrase), phrase)
      await page.locator('[data-campaign-item="bible-test-0001"] summary').click()
      const detail = await page.locator('[data-campaign-item="bible-test-0001"]').innerText()
      for (const phrase of ['English prompt', 'የአማርኛ ጥያቄ', 'Source evidence', 'p-genesis-10', 'fixture-model', 'ab12cd34']) assert.ok(detail.includes(phrase), phrase)
      assert.match(await page.locator('[data-campaign-item="bible-test-0003"]').innerText(), /validation error/)
      assert.equal(await page.locator('[data-campaign-download]').isDisabled(), true, 'nothing is exportable before human review')
      await page.getByLabel('Human review for bible-test-0001').selectOption('ready')
      await page.getByLabel('Human review for bible-test-0003').selectOption('ready')
      assert.match(await page.locator('[data-campaign-download]').innerText(), /Download 1 reviewed draft candidates/, 'an invalid draft can never be exported')
      const [download] = await Promise.all([page.waitForEvent('download'), page.locator('[data-campaign-download]').click()])
      const exported = JSON.parse(await (await import('node:fs/promises')).readFile(await download.path(), 'utf8'))
      assert.equal(exported.length, 1)
      assert.equal(exported[0].stable_id, 'bible-test-0001')
      assert.ok(!('status' in exported[0]) && !('published_at' in exported[0]), 'drafts only')
      assert.deepEqual(exported[0].payload.verifiedLocales, ['en'], 'generated Amharic stays unverified')
      assert.equal(exported[0].payload.provenance.passageId, 'p-genesis-10', 'evidence travels with the draft')
      await page.reload()
      await page.locator('[data-campaign-file]').setInputFiles({ name: 'batch-007-drafts.json', mimeType: 'application/json', buffer: Buffer.from(campaignFile) })
      await page.locator('[data-campaign-summary]').waitFor()
      assert.match(await page.locator('[data-campaign-summary]').innerText(), /2 marked ready \(1 exportable\)/, 'human review decisions persist locally')
      await page.getByLabel('Human review for bible-test-0001').selectOption('unreviewed')
      await page.getByLabel('Human review for bible-test-0003').selectOption('unreviewed')
      await overflow('campaign')
      await page.screenshot({ path: path.join(screenshots, `campaign-${width}.png`), fullPage: true })
    })
    await run(`${width}px: the real generated campaign file loads when present`, async () => {
      const file = path.resolve('artifacts/faith-challenges/library/all-drafts.json')
      const { existsSync } = await import('node:fs')
      if (!existsSync(file)) return
      await page.goto(`${base}/admin/play/studio?view=campaign`)
      await page.locator('[data-campaign-file]').setInputFiles(file)
      await page.locator('[data-campaign-summary]').waitFor()
      assert.match(await page.locator('[data-campaign-summary]').innerText(), /^\d+ drafts · \d+ valid · 0 marked ready/)
      assert.ok(await page.locator('[data-campaign-item]').count() >= 1)
    })
  }
  await run('Nothing in these views wrote to the server, published, or touched XP/progress', async () => {
    assert.equal(writes.length, writesAtStart, 'no server writes from built-in, settings, coverage or campaign views')
    assert.deepEqual(await progress(), baselineProgress)
    assert.deepEqual(errors, [])
  })
  await context.close()
} finally { await browser?.close(); await server.close() }
console.log(`${passed} passed, ${failed} failed`)
console.log(`Synthetic QA screenshots: ${screenshots}`)
process.exitCode = failed ? 1 : 0
