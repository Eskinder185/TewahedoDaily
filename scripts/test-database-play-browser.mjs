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
const server = await createServer({ configFile: false, envDir: false, plugins: [plugin, react()], cacheDir: 'node_modules/.vite-studio-tests', logLevel: 'error',
  optimizeDeps: { noDiscovery: true, include: ['react', 'react-dom/client', 'react-router-dom'] }, resolve: { dedupe: ['react', 'react-dom'] },
  server: { host: '127.0.0.1', port: 5199, strictPort: true, hmr: false },
  define: { 'import.meta.env.VITE_PLAY_DATABASE_ONLY': JSON.stringify('true'), 'import.meta.env.VITE_SUPABASE_URL': JSON.stringify(endpoint), 'import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY': JSON.stringify('synthetic-public-key') } })
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
    const reply = (body, status = 200) => route.fulfill({ status, contentType: 'application/json', headers: cors, body: JSON.stringify(body) })
    if (request.method() === 'OPTIONS') return reply(null)
    if (url.pathname.includes('/storage/')) return route.fulfill({ status: 200, contentType: 'image/png', headers: cors, body: Buffer.from('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==', 'base64') })
    if (url.pathname.endsWith('/mezmur_public')) return reply([1,2,3,4].map(i => ({ ...lyric, slug: 'source-song-' + i })))
    if (url.pathname.endsWith('/church_library_books')) return reply([{ slug: 'church-history-worldwide' }, { slug: 'church-history-ethiopian' }])
    if (url.pathname.endsWith('/play_content_items')) {
      const id = url.searchParams.get('id')?.replace(/^eq\./, '')
      const publicRead = request.method() === 'GET' && url.searchParams.get('status') === 'eq.published'
      if (publicRead && failCardReads) return reply({ message: 'Synthetic card outage' }, 503)
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
      return reply(request.headers().accept?.includes('vnd.pgrst.object') ? selected[0] || null : selected)
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
  const fixtureRows = await page.evaluate(async owner => {
    const { STUDIO_GAMES, newStudioRecord, toQuestionDraft, isServerStudioDraft, newHistoryTimelineRecord } = await import('/src/lib/play/contentStudio.ts')
    const { toStudioActivityDraft } = await import('/src/lib/play/studioActivity.ts')
    const result = []
    const add = draft => result.push({ ...draft, id: crypto.randomUUID(), question_id: draft.stable_id, status: 'published', published_at: '2026-11-04T12:00:00Z', updated_at: '2026-11-04T12:00:00Z', review_notes: null })
    for (const { id: game } of STUDIO_GAMES) {
      const record = newStudioRecord(game, owner)
      if (game === 'who-am-i') { record.draft.content.verifiedLocales = ['en']; record.draft.content.answer.en = 'Database identity' }
      if (game === 'match') record.draft.content.forEach(pair => { pair.verifiedLocales = ['en'] })
      if (game === 'trivia') record.draft.content.prompt.en = 'Database-only question'
      if (game === 'finish-the-mezmur') {
        for (let i = 1; i <= 4; i++) {
          const song = structuredClone(record); song.id = crypto.randomUUID()
          Object.assign(song.draft.content, { slug: 'source-song-' + i, title: 'Synthetic source ' + i, lyrics_amharic: Array.from({ length: 6 }, (_, n) => `የሙከራ ግጥም ቃል ${n}`).join('\n') })
          add(toStudioActivityDraft(song))
        }
      } else add(isServerStudioDraft(record.draft) ? toQuestionDraft(record.draft) : toStudioActivityDraft(record))
    }
    add(toStudioActivityDraft(newHistoryTimelineRecord(owner)))
    return result
  }, owner)
  rows.push(...fixtureRows)
  const publicGames = { trivia: 'Start round', emoji: 'Start round', 'finish-the-verse': 'Start round', 'finish-the-mezmur': 'Start round', history: 'Timeline Challenge', 'who-am-i': 'Start round', match: 'Start matching', 'bible-timeline': 'Start', feasts: 'Start playing', saints: 'Start playing', 'icon-memory': 'Deal the cards' }
  for (const [game, start] of Object.entries(publicGames)) await run(`${game}: published database payload reaches its existing engine`, async () => {
    await page.goto(`${base}/play/${game}`)
    const button = page.getByRole('button', { name: start, exact: true })
    await button.waitFor()
    assert.equal(await button.isDisabled(), false)
    assert.equal(await page.getByText('New challenges are being prepared.', { exact: true }).count(), 0)
  })
  await run('Adventure database story deep link, refresh, Back and Forward preserve the selected story', async () => {
    await page.goto(`${base}/play/adventures`)
    const story = page.getByRole('link', { name: /Start adventure/ }).first()
    await story.waitFor(); const href = await story.getAttribute('href'); await story.click()
    await page.waitForURL(url => !!url.searchParams.get('story'))
    const id = new URL(href, base).searchParams.get('story')
    const title = rows.find(row => row.game_type === 'adventures' && row.payload.draft.content.id === id).payload.draft.content.title.en
    await page.getByRole('heading', { name: title, exact: true }).waitFor()
    await page.reload(); await page.getByRole('heading', { name: title, exact: true }).waitFor()
    await page.getByRole('link', { name: 'All adventures', exact: true }).click()
    await page.goBack(); await page.getByRole('heading', { name: title, exact: true }).waitFor()
    await page.goForward(); await page.getByRole('link', { name: /Start adventure/ }).first().waitFor()
    assert.ok(href.includes('story='))
  })
  await run('unpublished and archived rows produce empty states across all twelve games, with no built-in fallback', async () => {
    rows.forEach(row => { row.status = 'archived'; row.published_at = null })
    for (const game of [...Object.keys(publicGames), 'adventures']) {
      await page.goto(`${base}/play/${game}`)
      await page.getByText('New challenges are being prepared.', { exact: true }).waitFor()
      assert.equal(await page.getByRole('button', { name: 'Start round', exact: true }).count(), 0)
    }
  })
  await run('network failure offers Retry without rendering static content; retry reads current publication', async () => {
    failCardReads = true
    await page.goto(`${base}/play/trivia`)
    await page.getByRole('alert').filter({ hasText: /Challenges could not be loaded/ }).waitFor()
    failCardReads = false
    const row = rows.find(row => row.game_type === 'trivia'); row.status = 'published'; row.published_at = '2026-11-04T12:00:00Z'
    await page.getByRole('button', { name: 'Retry', exact: true }).click()
    await page.getByRole('button', { name: 'Start round', exact: true }).click()
    await page.getByRole('heading', { name: 'Database-only question', exact: true }).waitFor()
  })
  await run('Studio saves a versioned shared activity as Draft and reopens it; publishing remains blocked', async () => {
    await go('?game=bible-timeline')
    await page.getByRole('button', { name: 'Create content', exact: true }).click()
    await page.getByRole('button', { name: /^Save draft/ }).click()
    await page.waitForURL(url => url.searchParams.get('item') !== 'new')
    await page.getByRole('button', { name: /^Save shared activity draft/ }).click()
    await page.getByText(/Shared activity draft\. Publishing is blocked/).waitFor()
    const saved = rows.at(-1)
    assert.equal(saved.status, 'draft'); assert.equal(saved.question_id, saved.stable_id)
    assert.equal(saved.payload.format, 'studio-activity-v1'); assert.equal(saved.payload.draft.game, 'bible-timeline')
    await page.reload(); await page.getByText(/Shared activity draft\. Publishing is blocked/).waitFor()
    assert.equal(await page.getByRole('button', { name: 'Publish / አትም', exact: true }).count(), 0)
  })
  await run('mobile bilingual empty states and navigation remain usable', async () => {
    await page.setViewportSize({ width: 390, height: 844 })
    await page.evaluate(() => localStorage.setItem('tewahedo-daily-locale', 'am'))
    await page.goto(`${base}/play/saints`)
    await page.getByText('አዲስ ፈተናዎች እየተዘጋጁ ናቸው።', { exact: true }).waitFor()
    assert.equal(await page.evaluate(() => document.documentElement.scrollWidth > innerWidth + 1), false)
    await page.screenshot({ path: path.join(screenshots, 'database-empty-am-390.png') })
  })
  await run('no browser errors or gameplay/XP writes from loading and previews', async () => { assert.deepEqual(errors, []); assert.deepEqual(await progress(), baselineProgress) })
  await context.close()
} finally { await browser?.close(); await server.close() }
console.log(`${passed} passed, ${failed} failed`)
console.log(`Synthetic QA screenshots: ${screenshots}`)
process.exitCode = failed ? 1 : 0
