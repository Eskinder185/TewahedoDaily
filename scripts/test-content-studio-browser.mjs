/** Real studio/Router/service components; fake Auth + PostgREST, external requests blocked. */
import assert from 'node:assert/strict'
import { createServer } from 'vite'
import react from '@vitejs/plugin-react'
import { chromium } from 'playwright'
import { mkdtempSync, readFileSync } from 'node:fs'
import { tmpdir } from 'node:os'
import path from 'node:path'

const base = 'http://127.0.0.1:5195'
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
const server = await createServer({ configFile: false, envDir: false, plugins: [plugin, react()], cacheDir: 'node_modules/.vite-studio-tests', logLevel: 'error',
  optimizeDeps: { noDiscovery: true, include: ['react', 'react-dom/client', 'react-router-dom'] }, resolve: { dedupe: ['react', 'react-dom'] },
  server: { host: '127.0.0.1', port: 5195, strictPort: true, hmr: false },
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
      if (failWrite) return reply({ message: 'Synthetic review denied', code: '42501' }, 403)
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
  await go('')
  const baselineProgress = await progress()
  await run('Compact selector exposes all twelve distinct games without navigation cards', async () => {
    const ids = await page.locator('[data-game-selector] option').evaluateAll(options => options.map(option => option.value).filter(value => value !== 'all'))
    assert.equal(ids.length, 12); assert.equal(new Set(ids).size, 12)
    assert.equal(await page.locator('[data-studio-game]').count(), 0)
  })
  await run('Main CMS route is one Studio, with no legacy forms or duplicate bottom panels', async () => {
    for (const width of [1280, 390]) {
      await page.setViewportSize({ width, height: 900 })
      await page.goto(`${base}/admin/play`)
      await page.getByRole('heading', { name: 'Game Content Studio', exact: true }).waitFor()
      assert.equal(await page.locator('[data-game-content-studio]').count(), 1)
      assert.equal(await page.locator('[data-studio-game], [data-content-mode]').count(), 0)
      assert.equal(await page.locator('[data-game-selector] option').count(), 13)
      assert.equal(await page.locator('[data-mode-selector] option').count(), 6)
      assert.equal(await page.getByRole('region', { name: 'Loaded studio content overview', exact: true }).count(), 0)
      assert.equal(await page.getByRole('navigation', { name: 'Twelve game content libraries', exact: true }).count(), 0)
      assert.equal(await page.locator('[data-game-content-studio] [class*="gameCard"], [data-game-content-studio] [class*="dashboard"]').count(), 0)
      assert.equal(await page.locator('button[data-game]').count(), 0)
      assert.equal(await page.getByRole('region', { name: 'Question editor', exact: true }).count(), 0)
      assert.equal(await page.getByLabel('Draft JSON', { exact: true }).count(), 0)
      assert.equal(await page.getByRole('heading', { name: 'What kind of challenge?', exact: true }).count(), 0)
      assert.equal(await page.getByRole('region', { name: 'Content library', exact: true }).count(), 1)
      assert.ok(await page.getByRole('region', { name: 'Content library', exact: true }).evaluate(element => element.getBoundingClientRect().top < innerHeight - 100), 'content library must begin in the initial viewport')
      assert.equal(await page.evaluate(() => document.documentElement.scrollWidth > innerWidth + 1), false)
      await page.evaluate(() => scrollTo(0, document.documentElement.scrollHeight))
      assert.equal(await page.locator('[data-game-content-studio] [class*="gameCard"], [data-game-content-studio] [class*="dashboard"]').count(), 0, 'no cards at the bottom either')
      await page.evaluate(() => scrollTo(0, 0))
      await page.screenshot({ path: path.join(screenshots, `compact-admin-play-${width}.png`), fullPage: true })
      await page.getByRole('link', { name: /Advanced import/ }).click()
      await page.getByRole('region', { name: 'Validated server draft import' }).waitFor()
      assert.equal(await page.locator('[data-studio-game]').count(), 0)
      await page.getByRole('link', { name: /Back to Studio/ }).click()
      await page.getByRole('heading', { name: 'Game Content Studio', exact: true }).waitFor()
    }
    await page.setViewportSize({ width: 1280, height: 900 })
  })
  await run('Guided creation, immediate desktop preview, mobile tabs and field help preserve unsaved text', async () => {
    await page.goto(`${base}/admin/play`)
    const before = writes.length
    await page.getByRole('button', { name: 'Create content', exact: true }).click()
    await page.getByLabel('Game to create / ጨዋታ', { exact: true }).selectOption('trivia')
    await page.getByRole('button', { name: 'Start editing', exact: true }).click()
    const editor = page.getByRole('region', { name: 'Dedicated game editor' })
    const question = editor.getByLabel('Question / ጥያቄ · English', { exact: true })
    const preview = page.getByRole('region', { name: 'Playable editorial preview' })
    await preview.waitFor()
    assert.equal(await editor.getByLabel('Stable question ID / ቋሚ መለያ', { exact: true }).isVisible(), false)
    await question.fill('Friendly live preview sample')
    await preview.getByText('Friendly live preview sample', { exact: true }).waitFor()
    assert.ok(await preview.evaluate(el => el.getBoundingClientRect().left > document.getElementById('studio-edit-panel').getBoundingClientRect().left))
    await page.screenshot({ path: path.join(screenshots, 'visual-desktop.png'), fullPage: true })
    await question.fill('')
    assert.equal(await question.getAttribute('aria-invalid'), 'true')
    assert.equal(await page.getByRole('button', { name: /^Save draft/ }).isDisabled(), true)
    await question.fill('Friendly live preview sample')
    await page.setViewportSize({ width: 390, height: 844 })
    const editTab = page.getByRole('tab', { name: 'Edit', exact: true })
    const previewTab = page.getByRole('tab', { name: 'Preview', exact: true })
    await editTab.click(); assert.equal(await question.isVisible(), true)
    await page.screenshot({ path: path.join(screenshots, 'visual-mobile-edit.png'), fullPage: true })
    await editTab.focus(); await page.keyboard.press('ArrowRight')
    await preview.getByText('Friendly live preview sample', { exact: true }).waitFor()
    assert.equal(await question.isVisible(), false)
    assert.equal(await previewTab.getAttribute('aria-selected'), 'true')
    await page.screenshot({ path: path.join(screenshots, 'visual-mobile-preview.png'), fullPage: true })
    await page.keyboard.press('ArrowLeft')
    assert.equal(await question.inputValue(), 'Friendly live preview sample')
    assert.equal(await question.isVisible(), true)
    assert.equal(writes.length, before, 'editing and preview must not save or publish automatically')
    assert.deepEqual(await progress(), baselineProgress)
    await page.setViewportSize({ width: 1280, height: 900 })
  })
  const savedIds = new Map()
  for (const game of ['history', 'who-am-i', 'match', 'bible-timeline', 'adventures', 'finish-the-mezmur', 'trivia', 'emoji', 'finish-the-verse', 'feasts', 'saints', 'icon-memory']) {
    await run(`${game}: dedicated fields, bilingual edit, save/reload and playable preview`, async () => {
      await go('')
      await page.getByRole('combobox', { name: 'Game', exact: true }).selectOption(game)
      await page.waitForURL(url => url.searchParams.get('game') === game)
      await page.getByRole('button', { name: 'Create content', exact: true }).click()
      const editor = page.getByRole('region', { name: 'Dedicated game editor' })
      await editor.waitFor()
      const before = writes.length
      if (['history', 'trivia', 'emoji', 'finish-the-verse'].includes(game)) {
        await editor.getByLabel('Question / ጥያቄ · English', { exact: true }).fill(`Synthetic edited ${game}`)
        await editor.getByLabel('Question / ጥያቄ · አማርኛ', { exact: true }).fill('የሙከራ ጥያቄ')
        if (game === 'trivia') await editor.getByLabel('Category / ምድብ', { exact: true }).fill('studio-synthetic')
      } else {
        await editor.getByLabel('Local draft label / የረቂቅ ስም').fill(`Saved ${game} ሙከራ`)
        if (game === 'who-am-i') {
          await editor.getByLabel('Reviewed Amharic / የተገመገመ አማርኛ', { exact: true }).uncheck()
          await editor.getByLabel('Identity / ማንነት · English', { exact: true }).fill('Synthetic identity')
        }
        if (game === 'match') {
          for (const checkbox of await editor.getByLabel(/^Reviewed Amharic pair/).all()) await checkbox.uncheck()
          await editor.getByLabel('Pair 1 left / ጥያቄ · English', { exact: true }).fill('Synthetic pair left')
        }
        if (game === 'finish-the-mezmur') {
          await editor.getByRole('button', { name: /Load published lyric sources/ }).click()
          await editor.getByLabel('Published Mezmur / የታተመ መዝሙር').selectOption(lyric.slug)
        }
        const firstAmharic = editor.locator('input[lang="am"], textarea[lang="am"]').first()
        if (await firstAmharic.count()) await firstAmharic.fill('የሙከራ አማርኛ')
      }
      await editor.getByRole('button', { name: /^Save draft/ }).click()
      await page.waitForFunction(() => new URLSearchParams(location.search).get('item') !== 'new')
      const id = new URL(page.url()).searchParams.get('item'); assert.ok(id); savedIds.set(game, id)
      const remote = ['history', 'trivia', 'emoji', 'finish-the-verse'].includes(game)
      assert.equal(writes.length - before, remote ? 1 : 0)
      await page.reload(); await page.getByRole('region', { name: 'Dedicated game editor' }).waitFor()
      if (remote) assert.equal(await page.getByLabel('Question / ጥያቄ · English', { exact: true }).inputValue(), `Synthetic edited ${game}`)
      else assert.equal(await page.getByLabel('Local draft label / የረቂቅ ስም').inputValue(), `Saved ${game} ሙከራ`)
      await page.getByRole('button', { name: 'Playable preview / ቅድመ እይታ', exact: true }).click()
      await page.getByRole('region', { name: 'Playable editorial preview' }).waitFor()
      assert.ok(await page.getByRole('region', { name: 'Playable editorial preview' }).getByRole('button').count() > 0, 'interactive preview controls')
      assert.deepEqual(await progress(), baselineProgress)
    })
  }
  await run('Populated compact library supports selectors, search and history without management cards', async () => {
    await go('')
    const library = page.getByRole('region', { name: 'Content library', exact: true })
    const rows = library.locator('ul').first().locator(':scope > li')
    const waitRows = async count => { await page.waitForFunction(count => document.querySelector('[aria-label="Content library"] ul')?.children.length === count, count); assert.equal(await rows.count(), count) }
    await waitRows(12)
    const mode = page.getByRole('combobox', { name: 'Mode', exact: true })
    await mode.selectOption('knowledge'); await waitRows(3)
    await mode.selectOption('word'); await waitRows(2)
    await page.goBack(); await waitRows(3); assert.equal(await mode.inputValue(), 'knowledge')
    await mode.selectOption('all'); await waitRows(12)
    await page.getByRole('combobox', { name: 'Game', exact: true }).selectOption('emoji'); await waitRows(1)
    await page.getByRole('combobox', { name: 'Game', exact: true }).selectOption('all'); await waitRows(12)
    await page.getByLabel('Search content', { exact: true }).fill('Saved who-am-i'); await waitRows(1)
    await page.getByLabel('Search content', { exact: true }).fill(''); await waitRows(12)
    for (const width of [1280, 390]) {
      await page.setViewportSize({ width, height: 900 })
      await page.evaluate(() => scrollTo(0, document.documentElement.scrollHeight))
      assert.equal(await page.locator('[data-studio-game], [data-content-mode], [aria-label="Loaded studio content overview"]').count(), 0)
      assert.equal(await page.evaluate(() => document.documentElement.scrollWidth > innerWidth + 1), false)
      await page.evaluate(() => scrollTo(0, 0))
      console.log(`LAYOUT ${width}px ` + JSON.stringify(await library.evaluate(element => ({ libraryTop: Math.round(element.getBoundingClientRect().top), libraryHeight: Math.round(element.getBoundingClientRect().height), studioHeight: Math.round(document.querySelector('[data-game-content-studio]').getBoundingClientRect().height) }))))
      await page.screenshot({ path: path.join(screenshots, `compact-populated-${width}.png`), fullPage: true })
    }
    await page.setViewportSize({ width: 1280, height: 900 })
  })
  for (const game of ['feasts', 'saints', 'icon-memory']) await run(`${game}: remove, undo, persist missing image and replace from approved artwork`, async () => {
    const before = writes.length
    await go(`?game=${game}&item=${savedIds.get(game)}`)
    let image = page.getByRole('region', { name: 'Card image 1', exact: true })
    const original = await image.getByRole('img').getAttribute('src')
    await image.getByRole('button', { name: 'Remove Image / ምስል አስወግድ', exact: true }).click()
    assert.equal(await image.getByRole('img').count(), 0)
    await page.getByText('Image draft preview only.', { exact: false }).waitFor()
    await image.getByRole('button', { name: /Undo image change/ }).click()
    assert.equal(await image.getByRole('img').getAttribute('src'), original)
    await image.getByRole('button', { name: /^Remove Image/ }).click()
    await page.getByRole('button', { name: /^Save draft/ }).click()
    await page.getByRole('status').filter({ hasText: /Local draft saved/ }).waitFor()
    await page.reload(); await page.getByRole('region', { name: 'Dedicated game editor' }).waitFor()
    image = page.getByRole('region', { name: 'Card image 1', exact: true })
    assert.equal(await image.getByRole('img').count(), 0, 'no fallback resurrects a removed image')
    const saved = await page.evaluate(async ({ owner, id }) => {
      const { studioStorage, validateStudioDraft } = await import('/src/lib/play/contentStudio.ts')
      const record = studioStorage(localStorage, owner, 'editor').load().find(record => record.id === id)
      return { image: record.draft.content[0], errors: validateStudioDraft(record.draft) }
    }, { owner, id: savedIds.get(game) })
    assert.equal(saved.image.src, ''); assert.equal(saved.image.fallbackSrc, '')
    assert.ok(saved.errors.some(error => error.includes('Replace the removed image')))
    assert.equal(await page.getByRole('region', { name: 'Playable editorial preview' }).getByRole('button').count(), 0, 'incomplete images cannot play')
    await image.getByRole('button', { name: /^Change Image/ }).click()
    const picker = page.getByLabel('Approved catalog image 1 / ሥዕል', { exact: true })
    await picker.waitFor()
    const replacement = await picker.locator('option:not([disabled])').evaluateAll((options, current) => options.find(option => option.value && option.value !== current)?.value, saved.image.id)
    assert.ok(replacement)
    await picker.selectOption(replacement)
    const updated = page.getByRole('region', { name: 'Card image 1', exact: true })
    assert.ok(await updated.getByRole('img').getAttribute('src'))
    await page.getByRole('button', { name: /^Save draft/ }).click()
    await page.getByRole('status').filter({ hasText: /Local draft saved/ }).waitFor()
    await page.reload(); await page.getByRole('region', { name: 'Dedicated game editor' }).waitFor()
    assert.equal(await page.getByRole('region', { name: 'Card image 1', exact: true }).getByRole('img').count(), 1)
    if (game === 'saints') {
      await page.screenshot({ path: path.join(screenshots, 'image-controls-desktop.png') })
      await page.setViewportSize({ width: 390, height: 900 })
      await page.getByRole('region', { name: 'Card image 1', exact: true }).scrollIntoViewIfNeeded()
      await page.screenshot({ path: path.join(screenshots, 'image-controls-mobile.png') })
      assert.equal(await page.evaluate(() => document.documentElement.scrollWidth > innerWidth + 1), false)
      await page.setViewportSize({ width: 1280, height: 900 })
    }
    assert.equal(writes.length, before, 'local image edits never mutate server data or shared media')
  })
  await run('confirmed local deletion/recovery preserves unrelated content, survives reload and supports cancellation', async () => {
    const id = savedIds.get('bible-timeline'), before = writes.length
    await go(`?game=bible-timeline&item=${id}`)
    page.removeAllListeners('dialog'); page.once('dialog', dialog => void dialog.dismiss())
    await page.getByRole('button', { name: 'Delete / ሰርዝ', exact: true }).click()
    assert.equal(new URL(page.url()).searchParams.get('item'), id)
    page.on('dialog', dialog => void dialog.accept())
    const snapshot = await page.evaluate(owner => localStorage.getItem(`tewahedo.studio.drafts.v1.${owner}`), owner)
    await page.getByRole('button', { name: 'Delete / ሰርዝ', exact: true }).click()
    await page.waitForURL(url => !url.searchParams.has('item'))
    await page.reload(); await page.getByText(/^Deleted local drafts/).click()
    await page.getByRole('button', { name: /^Restore deleted draft/ }).click()
    assert.equal(await page.evaluate(owner => localStorage.getItem(`tewahedo.studio.drafts.v1.${owner}`), owner), snapshot, 'exact draft and all unrelated data restored')
    const row = page.getByRole('region', { name: 'Content library', exact: true }).locator('li').filter({ has: page.getByRole('link', { name: 'Saved bible-timeline ሙከራ', exact: true }) })
    await row.getByRole('button', { name: 'Delete / ሰርዝ', exact: true }).click()
    await page.getByText(/^Deleted local drafts/).click()
    await page.getByRole('button', { name: /^Restore deleted draft/ }).click()
    assert.equal(writes.length, before)
    await go(`?game=trivia&item=${savedIds.get('trivia')}`)
    assert.equal(await page.getByRole('button', { name: 'Delete / ሰርዝ', exact: true }).isDisabled(), true, 'server deletion unavailable without verified grants')
  })
  await run('Existing Who and Match server drafts still save/reopen through their own card schemas', async () => {
    for (const game of ['who-am-i', 'match']) {
      const draft = await page.evaluate(async ({ owner, id }) => {
        const { studioStorage } = await import('/src/lib/play/contentStudio.ts')
        return studioStorage(localStorage, owner, 'editor').load().find(record => record.id === id).draft
      }, { owner, id: savedIds.get(game) })
      const payload = game === 'match' ? draft.content[0] : draft.content
      const fixture = { id: crypto.randomUUID(), question_id: payload.id, stable_id: payload.id, game_type: game, category: payload.category, difficulty: 'beginner', status: 'draft', payload, source_references: [payload.source], review_notes: null, published_at: null, updated_at: new Date().toISOString() }
      rows.push(fixture)
      await go(`?game=${game}&item=${fixture.id}`)
      const field = page.getByLabel(game === 'match' ? 'Pair 1 left / ጥያቄ · English' : 'Identity / ማንነት · English', { exact: true })
      await field.fill(`Edited server ${game}`)
      await page.getByRole('button', { name: /^Save draft/ }).click()
      await page.getByRole('status').filter({ hasText: 'Server draft saved and reopened.' }).waitFor()
      await page.reload(); await field.waitFor()
      assert.equal(await field.inputValue(), `Edited server ${game}`)
      assert.equal(fixture.question_id, fixture.stable_id)
      assert.equal(await page.getByRole('button', { name: 'Publish / አትም', exact: true }).count(), 0)
      rows.splice(rows.indexOf(fixture), 1)
    }
  })
  await run('Saved Who Am I draft plays in the real engine with bilingual data and no XP', async () => {
    await go(`?game=who-am-i&item=${savedIds.get('who-am-i')}`)
    assert.equal(await page.locator('[data-studio-game]').count(), 0, 'game chooser does not crowd an open editor')
    await page.getByRole('button', { name: /Test saved gameplay/ }).click()
    const gameplay = page.getByRole('region', { name: 'Saved gameplay test' })
    await gameplay.getByRole('button', { name: 'Start round', exact: true }).click()
    await gameplay.getByText('Synthetic identity', { exact: true }).waitFor()
    await gameplay.getByRole('button', { name: /Correct/ }).click()
    await gameplay.getByRole('button', { name: 'End test round', exact: true }).click()
    await gameplay.getByRole('heading', { name: 'Round complete', exact: true }).waitFor()
    assert.deepEqual(await progress(), baselineProgress)
    await page.getByLabel('Gameplay test language / የሙከራ ቋንቋ').selectOption('am')
    await gameplay.getByRole('button', { name: 'ይጀምሩ', exact: true }).click()
    await gameplay.getByText('የሙከራ አማርኛ', { exact: true }).waitFor()
  })
  await run('Saved Match collection completes in the real engine without rewards', async () => {
    await go(`?game=match&item=${savedIds.get('match')}`)
    const draft = await page.evaluate(async ({ owner, id }) => {
      const { studioStorage } = await import('/src/lib/play/contentStudio.ts')
      return studioStorage(localStorage, owner, 'editor').load().find(record => record.id === id).draft
    }, { owner, id: savedIds.get('match') })
    await page.getByRole('button', { name: /Test saved gameplay/ }).click()
    const gameplay = page.getByRole('region', { name: 'Saved gameplay test' })
    await gameplay.getByRole('button', { name: 'Start matching', exact: true }).click()
    const cards = draft.content.slice(0, 4).flatMap(pair => [`${pair.id}-left`, `${pair.id}-right`]).sort((a, b) => a.split('').reverse().join('').localeCompare(b.split('').reverse().join('')))
    const buttons = gameplay.locator('[class*="grid"] > button')
    assert.equal(await buttons.count(), 8)
    for (const pair of draft.content.slice(0, 4)) {
      await buttons.nth(cards.indexOf(`${pair.id}-left`)).click()
      await buttons.nth(cards.indexOf(`${pair.id}-right`)).click()
    }
    await gameplay.getByRole('heading', { name: 'Discovered!', exact: true }).waitFor()
    await gameplay.getByText(draft.content[0].explanation.en, { exact: true }).waitFor()
    assert.deepEqual(await progress(), baselineProgress)
  })
  await run('Adventure wrong answer cannot advance; discoveries unlock only after both findings', async () => {
    await go(`?game=adventures&item=${savedIds.get('adventures')}`)
    await page.getByRole('button', { name: 'Playable preview / ቅድመ እይታ', exact: true }).click()
    const preview = page.getByRole('region', { name: 'Playable editorial preview' })
    const next = preview.getByRole('button', { name: 'Next scene / ቀጣይ ትዕይንት' })
    assert.equal(await next.isDisabled(), true)
    await preview.getByRole('button', { name: 'Inspect the camp', exact: true }).click()
    assert.equal(await next.isDisabled(), true)
    await preview.getByRole('button', { name: 'Look at the sea', exact: true }).click()
    await next.click()
    await preview.getByRole('button', { name: 'He threw a stone', exact: true }).click()
    assert.equal(await next.isDisabled(), true)
    await preview.getByRole('button', { name: 'He stretched out his hand', exact: true }).click()
    assert.equal(await next.isDisabled(), false)
  })
  await run('History chronology edits years and bilingual events, saves locally, and never becomes a quiz row', async () => {
    await go('?game=history')
    await page.getByRole('button', { name: 'New local chronology / አዲስ የክስተት ቅደም ተከተል' }).click()
    const before = writes.length
    await page.getByLabel('Local draft label / የረቂቅ ስም').fill('Synthetic local chronology')
    await page.getByLabel('Historical event 1 · አማርኛ', { exact: true }).fill('የሙከራ ክስተት')
    await page.getByLabel('Historical year 1 (AD)', { exact: true }).fill('324')
    await page.getByRole('button', { name: /^Save draft/ }).click()
    await page.waitForFunction(() => new URLSearchParams(location.search).get('item') !== 'new')
    await page.reload(); assert.equal(await page.getByLabel('Historical year 1 (AD)', { exact: true }).inputValue(), '324')
    assert.equal(writes.length, before)
    await page.getByRole('button', { name: 'Playable preview / ቅድመ እይታ', exact: true }).click()
    const preview = page.getByRole('region', { name: 'Playable editorial preview' })
    await preview.getByRole('button', { name: 'Check chronology / አረጋግጥ', exact: true }).click()
    await preview.getByRole('status').filter({ hasText: /Not yet/ }).waitFor()
  })
  await run('Keyboard timeline reordering, mobile overflow and unsaved navigation protection', async () => {
    await go(`?game=bible-timeline&item=${savedIds.get('bible-timeline')}`)
    const firstTitle = page.getByLabel('Event 1 title · English', { exact: true })
    const original = await firstTitle.inputValue()
    const move = page.getByRole('button', { name: 'Move event 1 down', exact: true })
    await move.focus(); await page.keyboard.press('Enter')
    assert.notEqual(await firstTitle.inputValue(), original)
    await page.getByRole('combobox', { name: 'Mode', exact: true }).selectOption('knowledge')
    await page.getByRole('button', { name: 'Keep editing / አርትዖቱን ቀጥል' }).click()
    assert.equal(new URL(page.url()).searchParams.get('game'), 'bible-timeline')
    assert.equal(await page.getByRole('combobox', { name: 'Mode', exact: true }).inputValue(), 'all')
    await page.getByRole('button', { name: /^Save draft/ }).click()
    await page.getByRole('status').filter({ hasText: /confirmed/ }).first().waitFor()
    await page.setViewportSize({ width: 390, height: 844 })
    assert.equal(await page.evaluate(() => document.documentElement.scrollWidth > innerWidth + 1), false)
    await page.setViewportSize({ width: 1280, height: 900 })
  })
  await run('Editor can submit but cannot approve/publish; admin confirms real RPC transitions', async () => {
    await go(`?game=trivia&item=${savedIds.get('trivia')}`)
    assert.equal(await page.getByRole('button', { name: 'Approve / አጽድቅ', exact: true }).count(), 0)
    await page.getByRole('button', { name: 'Submit for review / ለግምገማ አቅርብ', exact: true }).click()
    await page.getByRole('status').filter({ hasText: /confirmed: review/ }).first().waitFor()
    role = 'admin'; await page.evaluate(() => localStorage.setItem('studio-test-role', 'admin')); await page.reload()
    await page.getByRole('button', { name: 'Approve / አጽድቅ', exact: true }).click()
    await page.getByRole('button', { name: 'Publish / አትም', exact: true }).click()
    await page.getByRole('status').filter({ hasText: /confirmed: published/ }).first().waitFor()
    assert.equal(await page.getByLabel('Question / ጥያቄ · English', { exact: true }).isDisabled(), true)
    assert.ok(rows.find(row => row.id === savedIds.get('trivia')).published_at)
  })
  await run('Studio save/reload/review/publish reaches the actual anonymous public Trivia reader', async () => {
    role = 'anon'
    await page.evaluate(() => localStorage.setItem('studio-test-role', 'anon'))
    try {
      await page.goto(`${base}/play/trivia?level=beginner`)
      await page.getByRole('option', { name: 'studio-synthetic', exact: true }).waitFor({ state: 'attached' })
      await page.locator('#play-category').selectOption('studio-synthetic')
      await page.getByRole('button', { name: 'Start round', exact: true }).click()
      await page.getByRole('heading', { name: 'Synthetic edited trivia', exact: true }).waitFor()
      const saved = rows.find(row => row.id === savedIds.get('trivia'))
      const correct = saved.payload.options.find(option => option.key === saved.payload.correctKey).text.en
      await page.getByRole('button', { name: correct, exact: true }).click()
      assert.equal(await page.getByText('Synthetic edited emoji', { exact: true }).count(), 0)
      assert.deepEqual(await progress(), baselineProgress, 'answering in the public reader has not completed a round or granted XP')
    } finally {
      role = 'admin'; await page.evaluate(() => localStorage.setItem('studio-test-role', 'admin'))
    }
  })
  await run('server archive/unpublish confirm actual returned status; denial never claims success or exposes drafts', async () => {
    const id = savedIds.get('trivia')
    await go(`?game=trivia&item=${id}`)
    failWrite = true
    await page.getByRole('button', { name: 'Archive / ማህደር አስገባ', exact: true }).click()
    await page.getByRole('alert').filter({ hasText: /Synthetic review denied/ }).waitFor()
    assert.equal(rows.find(row => row.id === id).status, 'published')
    failWrite = false
    await page.getByRole('button', { name: 'Archive / ማህደር አስገባ', exact: true }).click()
    await page.getByRole('status').filter({ hasText: /confirmed: archived/ }).first().waitFor()
    assert.equal(rows.find(row => row.id === id).published_at, null)
    for (const action of ['Return to draft / ወደ ረቂቅ መልስ', 'Submit for review / ለግምገማ አቅርብ', 'Approve / አጽድቅ', 'Publish / አትም', 'Unpublish to draft / ህትመት አስወግድ']) {
      await page.getByRole('button', { name: action, exact: true }).click()
    }
    await page.getByRole('status').filter({ hasText: /confirmed: draft/ }).first().waitFor()
    assert.equal(rows.find(row => row.id === id).published_at, null)
    try {
      role = 'anon'; await page.evaluate(() => localStorage.setItem('studio-test-role', 'anon'))
      await page.goto(`${base}/play/trivia`)
      await page.getByRole('button', { name: 'Start round', exact: true }).click()
      await page.getByRole('heading', { name: 'Synthetic edited trivia', exact: true }).waitFor({ state: 'hidden' })
      assert.equal(rows.find(row => row.id === id).status, 'draft')
    } finally { role = 'admin'; await page.evaluate(() => localStorage.setItem('studio-test-role', 'admin')) }
  })
  await run('Verse picker preserves exact source and publication rejects a changed quotation', async () => {
    await go(`?game=finish-the-verse&item=${savedIds.get('finish-the-verse')}`)
    const picker = page.getByRole('region', { name: 'Passage picker' })
    await picker.getByRole('button', { name: 'Load reviewed Bible books / መጻሕፍትን ጫን' }).click()
    await picker.getByRole('button', { name: 'Load published passage / ጥቅስ ጫን' }).click()
    await picker.getByRole('button', { name: 'word', exact: true }).click()
    const excerpt = page.getByLabel('Verse with blank / ጥቅስ · English', { exact: true })
    assert.equal(await excerpt.inputValue(), 'Synthetic exact source ____')
    await page.getByLabel('Reviewed Amharic / የተገመገመ አማርኛ', { exact: true }).uncheck()
    await excerpt.fill('Altered quotation ____')
    await page.getByRole('button', { name: /^Save draft/ }).click()
    await page.getByRole('button', { name: 'Submit for review / ለግምገማ አቅርብ', exact: true }).click()
    await page.getByRole('button', { name: 'Approve / አጽድቅ', exact: true }).click()
    await page.getByRole('status').filter({ hasText: /confirmed: approved/ }).first().waitFor()
    const before = writes.filter(write => write.method === 'RPC' && write.status === 'published').length
    await page.getByRole('button', { name: 'Publish / አትም', exact: true }).click()
    await page.getByRole('alert').filter({ hasText: /Cannot verify the en excerpt/ }).waitFor()
    assert.equal(writes.filter(write => write.method === 'RPC' && write.status === 'published').length, before, 'bad quotation must not reach publication RPC')
    assert.equal(rows.find(row => row.id === savedIds.get('finish-the-verse')).status, 'approved')
  })
  await run('Public Who/Match readers use only eligible fixture rows; draft edits never affect visitors', async () => {
    const payloads = await page.evaluate(async ({ owner, ids }) => {
      const { studioStorage } = await import('/src/lib/play/contentStudio.ts')
      const records = studioStorage(localStorage, owner, 'editor').load()
      return { who: records.find(record => record.id === ids.who).draft.content, pairs: records.find(record => record.id === ids.match).draft.content }
    }, { owner, ids: { who: savedIds.get('who-am-i'), match: savedIds.get('match') } })
    role = 'anon'; await page.evaluate(() => localStorage.setItem('studio-test-role', 'anon'))
    try {
      await page.goto(`${base}/play/who-am-i`)
      await page.getByRole('button', { name: 'Start round', exact: true }).click()
      assert.equal(await page.getByText('Synthetic identity', { exact: true }).count(), 0, 'local unpublished draft must not enter public gameplay')
      // Seed an independently published synthetic database bank. This is reader
      // verification, NOT evidence that the blocked publishing workflow is live.
      const seeded = [['who-am-i', payloads.who], ...payloads.pairs.map(pair => ['match', pair])].map(([game, payload]) => ({
        id: crypto.randomUUID(), question_id: payload.id, stable_id: payload.id, game_type: game, category: payload.category,
        difficulty: 'beginner', payload, source_references: [payload.source], status: 'published', published_at: new Date().toISOString(), updated_at: new Date().toISOString(), review_notes: null,
      }))
      rows.push(...seeded)
      await page.reload()
      await page.getByRole('button', { name: 'Start round', exact: true }).click()
      await page.getByText('Synthetic identity', { exact: true }).waitFor()
      await page.evaluate(() => localStorage.setItem('tewahedo-daily-locale', 'am'))
      await page.reload()
      await page.getByRole('button', { name: 'ይጀምሩ', exact: true }).click()
      await page.getByText('Synthetic identity', { exact: true }).waitFor()
      await page.getByRole('note').filter({ hasText: 'English content shown' }).waitFor()
      assert.equal(await page.getByText('የሙከራ አማርኛ', { exact: true }).count(), 0, 'public play must not present unverified draft translations')
      await page.evaluate(() => localStorage.setItem('tewahedo-daily-locale', 'en'))
      await page.goto(`${base}/play/match`)
      await page.getByRole('button', { name: 'Start matching', exact: true }).click()
      const buttons = page.locator('[class*="grid"] > button')
      const index = await page.evaluate(async () => {
        const { MATCH_PAIRS } = await import('/src/lib/play/approvedContent.ts')
        const { mergeCardBank } = await import('/src/lib/play/cardContent.ts')
        const { loadPublishedGameCards } = await import('/src/lib/play/contentService.ts')
        const { withPublicSources } = await import('/src/lib/play/sourceAvailability.ts')
        const pairs = mergeCardBank('match', await withPublicSources(MATCH_PAIRS), await withPublicSources(await loadPublishedGameCards('match'))).slice(0, 4)
        const target = pairs.find(pair => pair.left.en === 'Synthetic pair left')
        const keys = pairs.flatMap(pair => [`${pair.id}-left`, `${pair.id}-right`]).sort((a, b) => a.split('').reverse().join('').localeCompare(b.split('').reverse().join('')))
        return keys.indexOf(`${target?.id}-left`)
      })
      assert.ok(index >= 0)
      await buttons.nth(index).click()
      await page.getByText('Synthetic pair left', { exact: true }).waitFor()
      seeded.forEach(row => { row.status = 'draft'; row.published_at = null })
      await page.reload()
      await page.getByRole('button', { name: 'Start matching', exact: true }).click()
      assert.equal(await page.getByText('Synthetic pair left', { exact: true }).count(), 0)
      failCardReads = true
      await page.goto(`${base}/play/who-am-i`)
      await page.getByText('Published questions could not be loaded. Available verified content is still ready to play.', { exact: true }).waitFor()
      await page.getByRole('button', { name: 'Start round', exact: true }).click()
      await page.getByText('Other players give clues', { exact: true }).waitFor()
      assert.equal(await page.getByText('Synthetic identity', { exact: true }).count(), 0)
      assert.deepEqual(await progress(), baselineProgress)
      seeded.forEach(row => rows.splice(rows.indexOf(row), 1))
    } finally { failCardReads = false; role = 'admin'; await page.evaluate(() => localStorage.setItem('studio-test-role', 'admin')) }
  })
  await run('Local duplicate/archive/restore stay local, and import requires validated preview confirmation', async () => {
    await go(`?game=bible-timeline&item=${savedIds.get('bible-timeline')}`)
    const before = writes.length
    await page.getByRole('button', { name: 'Duplicate draft / ረቂቅ ቅዳ', exact: true }).click()
    await page.getByRole('button', { name: /^Save draft/ }).click()
    await page.waitForFunction(() => new URLSearchParams(location.search).get('item') !== 'new')
    const copyId = new URL(page.url()).searchParams.get('item')
    assert.notEqual(copyId, savedIds.get('bible-timeline'))
    await page.getByRole('button', { name: /^Archive local draft/ }).click()
    await page.getByRole('button', { name: /^Restore local draft/ }).click()
    const exported = await page.evaluate(() => JSON.parse(localStorage.getItem(`tewahedo.studio.drafts.v1.${'11111111-1111-4111-8111-111111111111'}`)).find(record => record.id === new URLSearchParams(location.search).get('item')))
    await go('?game=bible-timeline')
    await page.getByText('Import local draft exports / የአካባቢ ረቂቆችን አስገባ', { exact: true }).click()
    const file = page.getByLabel('Studio export file / ፋይል')
    await file.setInputFiles({ name: 'invalid.json', mimeType: 'application/json', buffer: Buffer.from('{broken') })
    await page.getByRole('alert').waitFor()
    await file.setInputFiles({ name: 'local-drafts.json', mimeType: 'application/json', buffer: Buffer.from(JSON.stringify({ version: 1, records: [exported] })) })
    const importButton = page.getByRole('button', { name: 'Import as local drafts / እንደ ረቂቅ አስገባ', exact: true })
    await importButton.waitFor(); assert.equal(await importButton.isDisabled(), true)
    await page.getByLabel('I reviewed these sources and drafts / ምንጮቹን ገምግሜአለሁ').check()
    await importButton.click(); await importButton.waitFor({ state: 'hidden' })
    assert.equal(writes.length, before)
  })
  for (const width of [768, 390]) await run(`${width}px: every editor/preview fits, preserves bilingual controls and keyboard access`, async () => {
    await page.setViewportSize({ width, height: 900 })
    for (const [game, id] of savedIds) {
      await go(`?game=${game}&item=${id}`)
      const editor = page.getByRole('region', { name: 'Dedicated game editor' }); await editor.waitFor()
      await page.getByRole('button', { name: 'Playable preview / ቅድመ እይታ', exact: true }).click()
      await page.getByRole('region', { name: 'Playable editorial preview' }).waitFor()
      assert.equal(await page.evaluate(() => document.documentElement.scrollWidth > innerWidth + 1), false, `${game}: overflow at ${width}`)
      const inputs = editor.locator('input[lang="am"],textarea[lang="am"]')
      if (await inputs.count()) assert.ok(await inputs.first().getAttribute('lang') === 'am')
      const previewButton = page.getByRole('button', { name: 'Playable preview / ቅድመ እይታ', exact: true })
      await previewButton.focus(); assert.ok(await previewButton.evaluate(element => element === document.activeElement))
      if (width === 390) { await editor.getByRole('heading', { level: 2 }).first().scrollIntoViewIfNeeded(); await page.screenshot({ path: path.join(screenshots, `${game}-390.png`) }) }
    }
    await page.setViewportSize({ width: 1280, height: 900 })
  })
  await run('Amharic and night-theme studio dashboard remain accessible', async () => {
    await page.evaluate(() => { localStorage.setItem('tewahedo-daily-locale', 'am'); localStorage.setItem('tewahedo-theme', 'night') })
    await page.goto(`${base}/admin/play/studio`)
    await page.getByRole('heading', { name: 'የጨዋታ ይዘት ስቱዲዮ', exact: true }).waitFor()
    assert.equal(await page.locator('html').getAttribute('data-theme'), 'night')
    assert.equal(await page.locator('[data-studio-game]').count(), 0)
    assert.equal(await page.locator('[data-game-selector] option').count(), 13)
    await page.getByRole('heading', { level: 1 }).scrollIntoViewIfNeeded()
    await page.screenshot({ path: path.join(screenshots, 'dashboard-amharic.png') })
    await page.evaluate(() => localStorage.setItem('tewahedo-daily-locale', 'en'))
  })
  await run('Write errors remain visible and never claim saved success', async () => {
    await go('?game=emoji')
    await page.getByRole('button', { name: 'Create content', exact: true }).click()
    failWrite = true
    await page.getByRole('button', { name: /^Save draft/ }).click()
    await page.getByRole('alert').filter({ hasText: /Synthetic write denied/ }).waitFor()
    assert.equal(new URL(page.url()).searchParams.get('item'), 'new')
    failWrite = false
  })
  await run('Ordinary users and anonymous visitors cannot access studio or write', async () => {
    // Reload is deliberately confirmed by the test dialog handler; no failed-save draft is retained.
    const before = writes.length
    for (role of ['user', 'anon']) {
      await page.evaluate(role => localStorage.setItem('studio-test-role', role), role)
      await page.goto(`${base}/admin/play/studio`)
      await page.getByRole('heading', { name: 'CMS sign in', exact: true }).waitFor()
      assert.equal(await page.getByRole('region', { name: 'Dedicated game editor' }).count(), 0)
    }
    assert.equal(writes.length, before)
  })
  await run('All 220 generated draft rows remain searchable and paginated in the Studio fixture', async () => {
    role = 'editor'
    const drafts = JSON.parse(readFileSync('artifacts/faith-challenges/generated-cms-drafts-2026-11-04.json', 'utf8'))
    assert.equal(drafts.length, 220)
    rows.splice(0, rows.length, ...drafts.map((draft, index) => ({ ...draft,
      id: `00000000-0000-4000-8000-${String(index + 1).padStart(12, '0')}`,
      question_id: draft.stable_id, status: 'draft', review_notes: null,
      updated_at: '2026-11-04T12:00:00Z', published_at: null })))
    await page.evaluate(() => { localStorage.clear(); localStorage.setItem('studio-test-role', 'editor'); localStorage.setItem('tewahedo-daily-locale', 'en') })
    await go('')
    await page.getByRole('status').filter({ hasText: '220 records shown' }).waitFor()
    const pages = page.getByRole('navigation', { name: 'Question Library pages' })
    await pages.getByText('Page 1 of 9').waitFor()
    await pages.getByRole('button', { name: 'Next' }).click()
    await pages.getByText('Page 2 of 9').waitFor()
    const phrase = drafts[0].payload.prompt.en.slice(0, 45)
    await page.getByLabel('Search content').fill(phrase)
    await page.getByRole('status').filter({ hasText: '1 records shown' }).waitFor()
    await page.goto(`${base}/admin/play/studio?game=${drafts[0].game_type}&item=${rows[0].id}`)
    await page.getByRole('region', { name: 'Dedicated game editor' }).waitFor()
    assert.ok(await page.locator('[lang="am"]').count() > 0)
  })
  await run('No uncaught browser errors or XP/progress mutations', async () => { assert.deepEqual(errors, []); assert.deepEqual(await progress(), baselineProgress) })
  await context.close()
} finally { await browser?.close(); await server.close() }
console.log(`${passed} passed, ${failed} failed`)
console.log(`Synthetic QA screenshots: ${screenshots}`)
process.exitCode = failed ? 1 : 0
