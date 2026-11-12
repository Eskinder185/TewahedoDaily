/** Real React pages + browser history, synthetic services, no external requests.
 * Run: node scripts/test-navigation-history.mjs (starts its own loopback Vite).
 * Fixtures validate navigation, not Supabase permissions or deployed SPA hosting. */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { setTimeout as pause } from 'node:timers/promises'
import react from '@vitejs/plugin-react'
import { createServer } from 'vite'
import { chromium } from 'playwright'

const entry = `
import React, { StrictMode } from 'react'; import { createRoot } from 'react-dom/client';
import { createBrowserRouter, RouterProvider } from 'react-router-dom';
import App from '/src/App.tsx'; import { LocaleProvider } from '/src/lib/i18n/locale.tsx';
import { ThemeProvider } from '/src/components/layout/ThemeProvider.tsx'; import '/src/index.css';
const router = createBrowserRouter([{path:'*',element:<App/>}]); window.__router=router;
createRoot(document.getElementById('root')).render(<StrictMode><ThemeProvider><LocaleProvider><RouterProvider router={router}/></LocaleProvider></ThemeProvider></StrictMode>);`

const hymnExports = [...readFileSync('src/lib/publicContent/hymnBrowse.ts', 'utf8')
  .matchAll(/^export (?:async )?function (\w+)/gm)].map(match => match[1])
const implemented = ['getHymnCollections', 'getHymnCollectionBySlug', 'loadBrowseGroupChildren', 'getHymnSection',
  'getMezmursForSection', 'getMezmurBySlug', 'getHymnSingersPage', 'searchImportMezmurs']
const browse = `
const group={id:'group',slug:'jesus-christ-salvation',title:'Jesus Christ & Salvation',titleAmharic:'ኢየሱስ ክርስቶስ',href:'/hymns/browse/jesus-christ-salvation',mezmurCount:28};
const section={id:'section',slug:'praise',title:'Praise',titleAmharic:'ምስጋና',mezmurCount:28};
const hymn={id:'hymn',slug:'history-praise',title:'History Praise',titleAmharic:'ምስጋና',title_amharic:'ምስጋና',lyrics_english:'Praise the Lord',occasion_slugs:[],status:'published',language:'en',form:'mezmur',has_stored_lyrics:true};
export const CANONICAL_MAJOR_COLLECTIONS=[group];
export async function getHymnCollections(){return [group]}
export async function getHymnCollectionBySlug(slug){return slug===group.slug?group:null}
export async function loadBrowseGroupChildren(){return {group,children:[{...section,name:section.title,href:group.href+'/praise'}]}}
export async function getHymnSection(_,slug){return slug==='praise'?section:null}
export async function getMezmursForSection(_,__,options={}) { return {items:[hymn],total:28,page:options.page||1} }
export async function getMezmurBySlug(slug){return slug===hymn.slug?hymn:null}
export async function getHymnSingersPage(){return {items:[],total:0,hasMore:false}}
export async function searchImportMezmurs(){return {items:[hymn],total:1,page:1}}
${hymnExports.filter(name => !implemented.includes(name)).map(name => `export async function ${name}(){return []}`).join('\n')}`

const calendar = `
const event={id:'history-feast',slug:'history-feast',kind:'observance',title:'History feast',titleAmharic:'በዓል',categoryLabel:'Feast',tone:'christ',isMajor:true,isEveOrPreparation:false,movableLabel:null,ethiopianDateLabel:'',summary:'Synthetic navigation fixture.',summaryAmharic:'',description:'',imageUrl:null,imageAlt:'',objectPosition:'center',hasImage:false,fields:{}};
const iso=d=>[d.getFullYear(),String(d.getMonth()+1).padStart(2,'0'),String(d.getDate()).padStart(2,'0')].join('-');
export async function getCalendarEventsForRange(start,end){let rows=[];for(let d=new Date(start);d<=end;d.setDate(d.getDate()+1))rows.push({date:new Date(d),iso:iso(d),gregorianShort:iso(d),gregorianAria:iso(d),ethiopianLabel:'',events:[event]});return rows}
export async function getHomepageTodayEvents(){return [event]}
export async function getCalendarEventsForDate(){return {events:[event],cards:[],context:null}}
export function eventsFromDayContext(){return [event]}
export function invalidateCalendarCardsCache(){}
export async function refreshPublishedCalendarCards(){return []}
export function filterRepeatedSeasonsForTimeline(groups){return groups}`
const auth = `import React from 'react';import {AuthContext} from '/src/lib/auth/useAuth.ts';
const profile={id:'history-staff',role:'editor',display_name:'Synthetic Editor'};
export function AuthProvider({children}){return React.createElement(AuthContext.Provider,{value:{profile,user:{id:profile.id},session:{user:{id:profile.id}},role:'editor',loading:false,error:null,isAuthenticated:true,isStaff:true}},children)}`
const mocks = { hymnBrowse: browse, getCalendarEventsForDate: calendar, dayChurchContext: 'export async function loadDayChurchContext(){return null}',
  unifiedHymnSearch: "export async function searchMezmursUnified(){return {items:[],total:0,page:1}}", AuthProvider: auth }
let server
const plugin = {
  name: 'navigation-fixtures', enforce: 'pre',
  resolveId(source) {
    if (source === '/__navigation-entry.jsx') return source
    const name = source.split('/').at(-1).replace(/\.(tsx?|jsx?)$/, '')
    if (Object.hasOwn(mocks, name)) return `\0navigation-${name}.jsx`
  },
  load(id) {
    if (id === '/__navigation-entry.jsx') return entry
    if (id.startsWith('\0navigation-')) return mocks[id.slice(12, -4)]
  },
  configureServer(vite) {
    vite.middlewares.use(async (req, res, next) => {
      if (!req.headers.accept?.includes('text/html')) return next()
      const html = await vite.transformIndexHtml(req.url, '<!doctype html><html><head><meta name="viewport" content="width=device-width, initial-scale=1" /></head><body><div id="root"></div><script type="module" src="/__navigation-entry.jsx"></script></body></html>')
      res.setHeader('Content-Type', 'text/html'); res.end(html)
    })
  },
}
let browser
let passed = 0
let failed = 0
const until = async check => {
  const deadline = Date.now() + 12000
  while (!(await check())) {
    assert.ok(Date.now() < deadline, 'DOM did not reach expected state')
    await pause(25)
  }
}
const test = async (name, fn) => {
  try { await fn(); passed++; console.log(`PASS ${name}`) }
  catch (error) { failed++; console.error(`FAIL ${name}: ${error.message}`) }
}
try {
  server = await createServer({ configFile: false, envDir: false, plugins: [plugin, react()], logLevel: 'error',
    cacheDir: 'node_modules/.vite-navigation-history',
    optimizeDeps: { noDiscovery: true, include: ['react', 'react-dom/client', 'react-router-dom'] },
    resolve: { dedupe: ['react', 'react-dom'] }, server: { host: '127.0.0.1', port: 5196, strictPort: true, hmr: false },
    define: { 'import.meta.env.VITE_SUPABASE_URL': JSON.stringify('https://navigation.invalid'),
      'import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY': JSON.stringify('synthetic-public-key') } })
  await server.listen()
  browser = await chromium.launch({ headless: true })
  for (const width of [1280, 390]) {
    const context = await browser.newContext({ viewport: { width, height: 844 }, hasTouch: width === 390, serviceWorkers: 'block' })
    const errors = []
    await context.addInitScript(() => localStorage.setItem('tewahedo-daily-locale', 'en'))
    await context.route('**/*', route => {
      const url = new URL(route.request().url())
      if (url.origin === 'http://127.0.0.1:5196') return route.continue()
      if (url.hostname === 'navigation.invalid') return route.fulfill({ status: 200, contentType: 'application/json',
        headers: { 'access-control-allow-origin': '*', 'access-control-allow-headers': '*', 'access-control-allow-methods': '*' }, body: '[]' })
      return route.abort()
    })
    const page = await context.newPage()
    page.setDefaultTimeout(12000)
    page.on('pageerror', error => errors.push(error.message))
    const go = async path => { await page.goto(`http://127.0.0.1:5196${path}`); await page.locator('main').waitFor({timeout:30000}) }
    const query = () => new URL(page.url()).searchParams
    const waitQuery = async (key, value) => { await page.waitForFunction(([key, value]) => new URLSearchParams(location.search).get(key) === value, [key, value]) }
    await test(`${width}: multilevel Mezmur Back/Forward, refresh, detail`, async () => {
      await go('/hymns')
      await page.getByRole('link', { name: /Jesus Christ & Salvation/ }).click()
      await page.getByRole('link', { name: /Praise/ }).click()
      await page.getByRole('link', { name: /History Praise/ }).click()
      await page.getByRole('heading', { name: 'ምስጋና', exact: true }).waitFor(); await page.getByText('History Praise', {exact:true}).first().waitFor()
      await page.goBack(); await page.getByRole('heading', { name: 'Praise', exact: true }).waitFor()
      await page.goBack(); await page.getByRole('heading', { name: 'Jesus Christ & Salvation', exact: true }).waitFor()
      await page.goForward(); await page.getByRole('heading', { name: 'Praise', exact: true }).waitFor()
      await page.reload(); await page.getByRole('heading', { name: 'Praise', exact: true }).waitFor()
      await page.goForward(); await page.getByRole('heading', { name: 'ምስጋና', exact: true }).waitFor(); await page.getByText('History Praise', {exact:true}).first().waitFor()
    })
    await test(`${width}: search/filter/tab history, pending typing cannot overwrite POP`, async () => {
      await go('/hymns?q=first&language=en&browse=occasions')
      const input = page.locator('#hymn-search')
      assert.equal(await input.inputValue(), 'first')
      await input.fill('second'); await waitQuery('q', 'second')
      await input.fill('must-not-leak'); await page.goBack()
      await waitQuery('q', 'first'); await pause(420)
      assert.equal(await input.inputValue(), 'first'); assert.equal(query().get('q'), 'first')
      await page.goForward(); await waitQuery('q', 'second'); assert.equal(await input.inputValue(), 'second')
      await page.reload(); assert.equal(await input.inputValue(), 'second')
      await go('/hymns?browse=occasions')
      await page.getByRole('tab', { name: 'Categories', exact: true }).click()
      await page.goBack(); await until(async () => await page.getByRole('tab', { name: 'Occasions', exact: true }).getAttribute('aria-selected') === 'true')
    })
    await test(`${width}: section search and pagination history`, async () => {
      await go('/hymns/browse/jesus-christ-salvation/praise?q=one&page=2')
      const input = page.getByRole('textbox', { name: /Search within/ })
      assert.equal(await input.inputValue(), 'one')
      await input.fill('two'); await waitQuery('q', 'two'); assert.equal(query().get('page'), null)
      await page.goBack(); await waitQuery('q', 'one'); assert.equal(query().get('page'), '2'); await until(async () => await input.inputValue() === 'one')
    })
    await test(`${width}: Calendar date/month/mode/filter, Back/Forward and deep link`, async () => {
      await go('/calendar?date=2026-11-03&grid=open')
      await page.getByRole('button', { name: 'Next day', exact: true }).click(); await waitQuery('date', '2026-11-04')
      await page.goBack(); await waitQuery('date', '2026-11-03')
      await page.getByRole('button', { name: 'Next Month', exact: true }).click(); await waitQuery('month', '2026-12')
      await until(async () => await page.getByRole('combobox', { name: 'Select Month', exact: true }).inputValue() === '11')
      await page.goBack(); await until(async () => await page.getByRole('combobox', { name: 'Select Month', exact: true }).inputValue() === '10')
      await page.goForward(); await waitQuery('month', '2026-12')
      await page.getByRole('button', { name: 'Ethiopian', exact: true }).click(); await waitQuery('mode', 'ethiopian')
      await page.reload(); assert.equal(await page.getByRole('button', { name: 'Ethiopian', exact: true }).getAttribute('aria-pressed'), 'true')
      await page.goBack(); await until(async () => await page.getByRole('button', { name: 'Gregorian', exact: true }).getAttribute('aria-pressed') === 'true')
      await go('/calendar?date=not-a-date&month=bogus&grid=open')
      assert.ok(Number.isFinite(Number(await page.getByRole('combobox', { name: 'Select Month', exact: true }).inputValue())))
    })
    await test(`${width}: Calendar event URL restores through Back/Forward/refresh`, async () => {
      await go('/calendar?date=2026-11-03&event=history-feast')
      await page.getByRole('dialog').waitFor()
      await page.reload(); await page.getByRole('dialog').waitFor()
      await page.keyboard.press('Escape'); await waitQuery('event', null)
      await page.goBack(); await page.getByRole('dialog').waitFor()
      await page.goForward(); await page.getByRole('dialog').waitFor({ state: 'hidden' })
    })
    await test(`${width}: entry-keyed scroll restoration and new destination top`, async () => {
      await go('/hymns')
      await page.getByRole('tab', { name: 'Categories', exact: true }).waitFor()
      await page.evaluate(() => window.scrollTo({top:450,behavior:'instant'}))
      await page.waitForFunction(() => window.scrollY > 200)
      const y = await page.evaluate(() => window.scrollY)
      await page.evaluate(() => window.__router.navigate('/calendar?date=2026-11-03'))
      await page.waitForFunction(() => window.scrollY === 0)
      await page.goBack(); await page.waitForFunction(y => Math.abs(window.scrollY-y)<3, y)
      await page.goForward(); await page.waitForFunction(() => window.scrollY === 0)
    })
    await test(`${width}: CMS editor blocks Back until discard and preserves draft on cancel`, async () => {
      await go('/admin/hymns/mezmur?search=retain')
      await page.evaluate(() => window.__router.navigate('/admin/hymns/mezmur/new'))
      const title = page.getByLabel(/^Transliterated title/)
      await title.fill('Unsaved navigation test')
      await page.evaluate(() => window.history.back())
      await page.getByRole('button', { name: 'Keep editing', exact: true }).click()
      assert.equal(await title.inputValue(), 'Unsaved navigation test')
      assert.ok(new URL(page.url()).pathname.endsWith('/new'))
      await page.evaluate(() => window.history.back())
      await page.getByRole('button', { name: 'Discard changes', exact: true }).click()
      await waitQuery('search', 'retain')
      assert.ok(new URL(page.url()).pathname.endsWith('/mezmur'))
    })
    await test(`${width}: Bible catalog, Prayer and Library search/filter history`, async () => {
      await go('/bible?testament=new')
      await page.getByRole('button', { name: /Old Testament/ }).click(); await waitQuery('testament', null)
      await page.goBack(); await until(async () => await page.getByRole('button', { name: /New Testament/ }).getAttribute('aria-pressed') === 'true')
      await go('/pray?q=morning')
      assert.equal(await page.locator('#prayer-search').inputValue(), 'morning')
      await page.locator('#prayer-search').fill('evening'); await waitQuery('q', 'evening')
      await page.goBack(); await until(async () => await page.locator('#prayer-search').inputValue() === 'morning')
      await go('/library?category=Theology&q=faith')
      const librarySearch = page.getByRole('searchbox', { name: 'Search Church Library books' })
      assert.equal(await librarySearch.inputValue(), 'faith')
      await page.getByRole('tab', { name: 'Patristics', exact: true }).click(); await waitQuery('category', 'Patristics')
      await page.goBack(); await until(async () => await page.getByRole('tab', { name: 'Theology', exact: true }).getAttribute('aria-selected') === 'true')
      await page.reload(); assert.equal(await librarySearch.inputValue(), 'faith')
    })
    await test(`${width}: Faith Challenges catalog and CMS filters are shareable`, async () => {
      await go('/play?mode=visual&level=challenge')
      assert.equal(await page.getByRole('button', { name: 'Challenge', exact: true }).getAttribute('aria-pressed'), 'true')
      await page.locator('[data-play-mode="word"]').click(); await waitQuery('mode', 'word')
      await page.goBack(); await waitQuery('mode', 'visual')
      await go('/admin/play?status=draft&q=seed')
      const publication = page.getByRole('combobox', { name: 'Status', exact: true })
      assert.equal(await publication.inputValue(), 'draft')
      await publication.selectOption('published'); await waitQuery('status', 'published')
      await page.goBack(); await until(async () => await publication.inputValue() === 'draft')
      await page.reload(); assert.equal(await publication.inputValue(), 'draft')
    })
    if (width === 390) await test('390: touch drawer destinations and browser Back', async () => {
      await go('/hymns?browse=occasions')
      await page.getByRole('button', { name: 'Open menu', exact: true }).tap()
      const menu = page.getByRole('dialog', { name: 'Menu', exact: true })
      await menu.getByRole('link', { name: 'Bible', exact: true }).tap()
      await page.waitForURL('**/bible')
      await menu.waitFor({ state: 'hidden' })
      await page.goBack(); await waitQuery('browse', 'occasions')
      await until(async () => await page.getByRole('tab', { name: 'Occasions', exact: true }).getAttribute('aria-selected') === 'true')
    })
    await test(`${width}: no uncaught browser errors`, async () => assert.deepEqual(errors, []))
    await context.close()
  }
} finally {
  await browser?.close()
  await server?.close()
}
console.log(`${passed} passed, ${failed} failed`)
process.exitCode = failed ? 1 : 0
