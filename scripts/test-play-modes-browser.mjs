/** Actual App/Router/UI; synthetic Auth and read-only PostgREST, no live services. */
import assert from 'node:assert/strict'
import { mkdtempSync } from 'node:fs'
import { tmpdir } from 'node:os'
import { join } from 'node:path'
import { createServer } from 'vite'
import react from '@vitejs/plugin-react'
import { chromium } from 'playwright'

const base = 'http://127.0.0.1:5198'
const endpoint = 'https://play-modes-fixture.invalid'
const artifacts = mkdtempSync(join(tmpdir(), 'tewahedo-play-modes-'))
const entry = `import React from 'react';import{createRoot}from'react-dom/client';import{createBrowserRouter,RouterProvider}from'react-router-dom';import App from '/src/App.tsx';import{LocaleProvider}from'/src/lib/i18n/locale.tsx';import{ThemeProvider}from'/src/components/layout/ThemeProvider.tsx';import'/src/index.css';const router=createBrowserRouter([{path:'*',element:<App/>}]);createRoot(document.getElementById('root')).render(<ThemeProvider><LocaleProvider><RouterProvider router={router}/></LocaleProvider></ThemeProvider>);`
const auth = `import React from 'react';import{AuthContext}from'/src/lib/auth/useAuth.ts';export function AuthProvider({children}){const role=localStorage.getItem('mode-test-role')||'anon';const user=role==='anon'?null:{id:'11111111-1111-4111-8111-111111111111'};const profile=user?{id:user.id,role,display_name:'Synthetic staff'}:null;return React.createElement(AuthContext.Provider,{value:{user,profile,session:user?{user}:null,role,loading:false,error:null,isStaff:role==='editor',isAuthenticated:!!user}},children)}`
const staff = `export async function requireCmsStaffSession(){if(localStorage.getItem('mode-test-role')!=='editor')throw new Error('Staff role required');return{profileRole:'editor'}}export function getLastCmsStaffProbe(){return null}export function mapStaffWriteError(error){return error}`
const server = await createServer({ configFile: false, envDir: false, cacheDir: join(artifacts, 'vite'), logLevel: 'error',
  server: { host: '127.0.0.1', port: 5198, strictPort: true },
  optimizeDeps: { noDiscovery: true, include: ['react', 'react-dom/client', 'react-router-dom', 'qrcode-generator'] }, resolve: { dedupe: ['react', 'react-dom'] },
  define: { 'import.meta.env.VITE_SUPABASE_URL': JSON.stringify(endpoint), 'import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY': JSON.stringify('synthetic-public-key') },
  plugins: [{ name: 'play-mode-fixture', enforce: 'pre',
    resolveId(source) { if (source === '/__mode-entry.jsx') return source; if (/(?:^|\/)AuthProvider(?:\.tsx)?$/.test(source)) return '\0mode-auth.jsx'; if (/(?:^|\/)cmsStaffAuth(?:\.ts)?$/.test(source)) return '\0mode-staff.js' },
    load(id) { if (id === '/__mode-entry.jsx') return entry; if (id === '\0mode-auth.jsx') return auth; if (id === '\0mode-staff.js') return staff },
    configureServer(vite) { vite.middlewares.use(async (req, res, next) => {
      if (req.url?.startsWith('/src/') || req.url?.startsWith('/@') || req.url?.includes('.') || req.url?.startsWith('/node_modules/')) return next()
      try { res.setHeader('Content-Type', 'text/html'); res.end(await vite.transformIndexHtml(req.url, '<!doctype html><html><head><meta name="viewport" content="width=device-width, initial-scale=1"></head><body><div id="root"></div><script type="module" src="/__mode-entry.jsx"></script></body></html>')) } catch (error) { next(error) }
    }) },
  }, react()],
})
let browser
let passed = 0
const errors = []
const test = async (name, run) => { await run(); passed++; console.log(`PASS ${name}`) }
const modeCounts = { knowledge: 3, timeline: 2, visual: 6, word: 2, story: 1 }
try {
  await server.listen(); browser = await chromium.launch()
  const context = await browser.newContext({ viewport: { width: 1280, height: 900 }, hasTouch: true, serviceWorkers: 'block' })
  await context.route('**/*', async route => {
    const request = route.request(), url = new URL(request.url())
    if (url.origin === base) return route.continue()
    if (url.origin !== endpoint) return route.abort()
    // PostgREST calls read-only functions with POST; a list_* RPC (the Search Buddy suggestions) reads and never writes.
    const readOnlyRpc = request.method() === 'POST' && /^\/rest\/v1\/rpc\/list_[a-z_]+$/.test(url.pathname)
    assert.ok(request.method() === 'GET' || readOnlyRpc, `navigation may not mutate the backend: ${request.method()} ${url.pathname}`)
    // PostgREST reports the exact row count in Content-Range; the Studio refuses an inventory page without it.
    return route.fulfill({ status: 200, contentType: 'application/json', headers: { 'content-range': '*/0', 'access-control-allow-origin': '*', 'access-control-expose-headers': 'content-range' }, body: '[]' })
  })
  const page = await context.newPage(); page.setDefaultTimeout(15000)
  page.on('pageerror', error => errors.push(error.message))
  await page.goto(`${base}/play`)
  await test('Five modes and all twelve existing route links', async () => {
    await page.locator('[data-play-mode]').first().waitFor()
    // All, plus the five ways to play, filtering ONE grid that shows all twelve games by default.
    assert.equal(await page.locator('[data-play-mode]').count(), 6)
    assert.equal(await page.locator('[data-game-card]').count(), 12)
    assert.equal(await page.getByRole('link', { name: /Show all 12 games/i }).count(), 0)
    assert.equal(await page.getByText('Browse by topic').count(), 0)
    const routes = []
    for (const mode of Object.keys(modeCounts)) {
      await page.goto(`${base}/play?mode=${mode}`)
      await page.locator('[data-game-card]').first().waitFor()
      routes.push(...await page.locator('[data-game-card]').evaluateAll(cards => cards.map(card => new URL(card.href).pathname)))
    }
    assert.equal(new Set(routes).size, 12)
    for (const route of routes) {
      await page.goto(`${base}${route}`)
      await page.locator('h1').first().waitFor()
      assert.equal(await page.getByRole('heading', { name: 'Admin unavailable' }).count(), 0)
      assert.ok(!await page.getByRole('heading', { name: /Page not found/i }).count())
    }
  })
  await test('Mode filters, refresh, Back and Forward preserve difficulty', async () => {
    await page.goto(`${base}/play?level=challenge`)
    for (const [mode, count] of Object.entries(modeCounts)) {
      await page.locator(`[data-play-mode="${mode}"]`).click()
      await page.waitForURL(url => url.searchParams.get('mode') === mode)
      await page.waitForFunction(expected => document.querySelectorAll('[data-game-card]').length === expected, count)
      assert.equal(await page.locator('[data-game-card]').count(), count)
      assert.equal(new URL(page.url()).searchParams.get('level'), 'challenge')
    }
    await page.reload(); await page.locator('[data-game-card]').first().waitFor()
    assert.equal(await page.locator('[data-game-card]').count(), 1)
    await page.goBack(); await page.locator('[data-play-mode="word"][aria-current="page"]').waitFor()
    assert.equal(new URL(page.url()).searchParams.get('mode'), 'word')
    assert.equal(await page.locator('[data-game-card]').count(), 2)
    await page.goForward(); await page.locator('[data-play-mode="story"][aria-current="page"]').waitFor()
    await page.locator('[data-play-mode="all"]').click()
    await page.waitForFunction(() => document.querySelectorAll('[data-game-card]').length === 12)
    assert.equal(new URL(page.url()).searchParams.get('mode'), null)
  })
  await test('Legacy topic URLs and keyboard controls remain functional', async () => {
    await page.goto(`${base}/play?section=music&level=challenge`)
    await page.locator('[data-game-card]').first().waitFor()
    assert.equal(await page.locator('[data-game-card]').count(), 1)
    assert.equal(await page.getByRole('button', { name: 'Scripture', exact: true }).count(), 0, 'topic filter buttons are gone')
    const mode = page.locator('[data-play-mode="knowledge"]')
    await mode.focus(); await page.keyboard.press('Enter')
    await page.waitForURL(url => url.searchParams.get('mode') === 'knowledge')
  })
  await test('History supports replay links, without claiming partial-round resume', async () => {
    await page.evaluate(() => localStorage.setItem('tewahedo-play-progress-v1', JSON.stringify({ xp: 40, achievements: [], history: [{ id: 'fixture', game: 'adventure', score: 1, maxScore: 1, xpEarned: 40, completedAt: new Date().toISOString() }] })))
    await page.goto(`${base}/play`)
    const recent = page.locator('aside').filter({ has: page.getByRole('heading', { name: 'Keep exploring' }) })
    await recent.getByRole('link', { name: /Bible Adventure/ }).waitFor()
    assert.ok(await recent.getByText(/partial rounds are not resumed/).isVisible())
  })
  await test('Progress section never overlaps the last row of game cards', async () => {
    await page.goto(`${base}/play?mode=visual`); await page.locator('[data-game-card]').first().waitFor()
    assert.ok(await page.evaluate(() => document.querySelector('[aria-label="Your progress"]').getBoundingClientRect().top >= [...document.querySelectorAll('[data-game-card]')].at(-1).getBoundingClientRect().bottom + 16))
  })
  await test('Game Night mixed guide is explicit, linked and history-safe', async () => {
    await page.goto(`${base}/play/game-night`)
    await page.getByRole('button', { name: /Explore mixed challenge guide/ }).click()
    await page.waitForURL(url => url.searchParams.get('view') === 'mixed')
    await page.locator('ol li a').first().waitFor()
    assert.equal(await page.locator('ol li a').count(), 5)
    assert.ok(await page.getByText(/Mixed rooms, shared scores, teams/).isVisible())
    await page.reload(); await page.locator('ol li a').first().waitFor()
    await page.locator('ol li a').first().click(); await page.waitForURL('**/play/trivia')
    await page.goBack(); await page.locator('ol li a').first().waitFor()
    await page.getByRole('button', { name: 'Back to Game Night choices' }).click()
    // One way to host: the old private-room views now lead to the no-account live rooms.
    await page.getByRole('button', { name: /Host a room/ }).click()
    await page.waitForURL('**/play/live')
    await page.getByRole('heading', { name: 'Host a game' }).waitFor()
    assert.equal(await page.getByText(/Hosts must sign in/).count(), 0)
    await page.goto(`${base}/play`)
    await page.locator('[data-host]').waitFor(); await page.locator('[data-join]').waitFor()
    await page.locator('form[aria-label="Join with a code"] input').fill('AB')
    await page.locator('[data-join]').click()
    await page.getByRole('alert').filter({ hasText: '5 letters or numbers' }).waitFor()
    // A valid code opens the room page, which connects to the live service; that part is covered by test-live-room-browser.
  })
  await test('Compact CMS mode filter retains access to all twelve editors without card grids', async () => {
    await page.evaluate(() => localStorage.setItem('mode-test-role', 'editor'))
    await page.goto(`${base}/admin/play/studio`)
    await page.getByRole('combobox', { name: 'Game', exact: true }).waitFor()
    assert.equal(await page.locator('[data-studio-game], [data-content-mode]').count(), 0)
    assert.equal(await page.locator('[data-game-selector] option').count(), 13)
    assert.equal(await page.locator('[data-mode-selector] option').count(), 6)
    await page.getByRole('status').filter({ hasText: 'records shown' }).waitFor()
    assert.equal(await page.getByRole('alert').count(), 0)
    for (const mode of Object.keys(modeCounts)) {
      await page.getByRole('combobox', { name: 'Mode', exact: true }).selectOption(mode)
      await page.waitForURL(url => url.searchParams.get('mode') === mode)
      await page.waitForFunction(mode => document.querySelector('[data-mode-selector]')?.value === mode, mode)
      assert.equal(await page.getByRole('combobox', { name: 'Mode', exact: true }).inputValue(), mode)
      assert.equal(await page.locator('[data-game-selector] option').count(), 13)
    }
    await page.goto(`${base}/admin/play`)
    await page.getByRole('heading', { name: 'Game Content Studio', exact: true }).waitFor()
    assert.equal(await page.locator('[data-mode-selector] option').count(), 6)
  })
  for (const [width, locale, theme] of [[360, 'en', 'day'], [390, 'am', 'night'], [1280, 'en', 'night']]) {
    await test(`${width}px ${locale} ${theme}: responsive public/CMS screens and keyboard focus`, async () => {
      await page.setViewportSize({ width, height: 900 })
      await page.emulateMedia({ reducedMotion: 'reduce' })
      await page.evaluate(({ locale, theme }) => { localStorage.setItem('tewahedo-daily-locale', locale); localStorage.setItem('tewahedo-theme', theme) }, { locale, theme })
      for (const route of ['/play', '/play/game-night', '/admin/play/studio']) {
        await page.goto(`${base}${route}`)
        await page.locator(route === '/play' ? '[data-play-mode]' : route.includes('studio') ? '[data-game-selector]' : 'section button').first().waitFor()
        assert.equal(await page.evaluate(() => document.documentElement.scrollWidth > innerWidth + 2), false, `${route} must fit viewport`)
        const control = page.locator(route === '/play' ? '[data-play-mode]' : route.includes('studio') ? '[data-game-selector]' : 'section button').first()
        await page.keyboard.press('Tab'); await control.focus()
        assert.ok(await control.evaluate(el => el.matches(':focus-visible') && getComputedStyle(el).outlineStyle !== 'none'))
        await page.screenshot({ path: join(artifacts, `${width}-${locale}-${route.replaceAll('/', '_')}.png`), fullPage: true })
        if (route === '/play') await page.locator('[aria-labelledby="games-title"]').screenshot({ path: join(artifacts, `${width}-${locale}-modes.png`) })
        if (route === '/play' && width <= 390) {
          await (route === "/play" ? page.locator('[data-play-mode="knowledge"]') : control).tap()
          await page.waitForURL(url => url.searchParams.get('mode') === 'knowledge')
          await page.waitForFunction(() => document.querySelectorAll('[data-game-card]').length === 3)
        }
      }
      if (locale === 'am') assert.equal(await page.locator('[data-mode-selector] option[value="word"]').textContent(), 'ቃሉን ያሟሉ')
    })
  }
  assert.deepEqual(errors, [])
  console.log(`${passed} passed, 0 failed. Screenshots: ${artifacts}`)
} finally { await browser?.close(); await server.close() }
