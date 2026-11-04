import assert from 'node:assert/strict'
import { mkdtemp, rm } from 'node:fs/promises'
import { tmpdir } from 'node:os'
import { join } from 'node:path'
import { createServer } from 'vite'
import react from '@vitejs/plugin-react'
import { chromium } from 'playwright'

// Exercise the real boundary and Church Library module without authentication
// bypasses or external requests. Supabase reads use a synthetic, empty catalog.
const cacheDir = await mkdtemp(join(tmpdir(), 'td-admin-module-recovery-'))
let server
let browser
let checks = 0
try {
  server = await createServer({
    configFile: false,
    envDir: false,
    cacheDir,
    define: {
      'import.meta.env.VITE_SUPABASE_URL': JSON.stringify('https://admin-recovery-test.supabase.co'),
      'import.meta.env.VITE_SUPABASE_ANON_KEY': JSON.stringify('fixture-public-key'),
    },
    optimizeDeps: { noDiscovery: true, include: ['react', 'react-dom/client', 'react-router-dom', '@supabase/supabase-js', 'mammoth', 'pdfjs-dist'] },
    logLevel: 'silent',
    plugins: [react(), {
      name: 'admin-module-recovery-fixture',
      resolveId(id) {
        if (id === '/__admin_fixture.jsx') return '\0admin-recovery.jsx'
      },
      load(id) {
        if (id !== '\0admin-recovery.jsx') return
        return `
          import React, { lazy, Suspense } from 'react';
          import { createRoot } from 'react-dom/client';
          import { MemoryRouter } from 'react-router-dom';
          import { AdminErrorBoundary } from '/src/pages/admin/AdminErrorBoundary.tsx';
          const Page = lazy(() => import('/src/pages/admin/ChurchLibrary.tsx').then(m => ({default:m.ChurchLibrary})));
          function BrokenPage() { throw new Error('Fixture rendering failure'); }
          createRoot(document.getElementById('root')).render(React.createElement(MemoryRouter, null,
            React.createElement(AdminErrorBoundary, null,
              React.createElement(Suspense, {fallback: React.createElement('p', null, 'Loading')},
                React.createElement(location.search.includes('render-error') ? BrokenPage : Page)))));
        `
      },
      configureServer(vite) {
        vite.middlewares.use(async (req, res, next) => {
          if (req.url?.startsWith('/__admin_recovery')) {
            try {
              const html = await vite.transformIndexHtml(req.url, '<div id="root"></div><script type="module" src="/__admin_fixture.jsx"></script>')
              res.setHeader('Content-Type', 'text/html')
              res.end(html)
            } catch (error) { next(error) }
          } else next()
        })
      },
    }],
    server: { host: '127.0.0.1', port: 0 },
  })
  await server.listen()
  const origin = server.resolvedUrls.local[0].replace(/\/$/, '')
  browser = await chromium.launch()
  const page = await browser.newPage()
  let failModule = true
  await page.route('**/*', async route => {
    const url = new URL(route.request().url())
    if (url.origin === 'https://admin-recovery-test.supabase.co') {
      assert.ok(['GET', 'HEAD'].includes(route.request().method()), 'fixture must never write')
      return route.fulfill({ status: 200, contentType: 'application/json', headers: { 'content-range': '*/0' }, body: route.request().method() === 'HEAD' ? '' : '[]' })
    }
    if (url.origin !== origin) return route.abort()
    if (url.pathname === '/src/pages/admin/ChurchLibrary.tsx' && failModule) {
      failModule = false
      return route.abort('failed')
    }
    return route.continue()
  })
  await page.goto(`${origin}/__admin_recovery?book=fixture`)
  await page.getByRole('button', { name: 'Reload this page' }).waitFor()
  assert.match(await page.getByRole('alert').innerText(), /Failed to fetch dynamically imported module/i)
  checks++
  assert.equal(await page.getByRole('link', { name: 'Try again' }).count(), 0)
  checks++
  await page.getByRole('button', { name: 'Reload this page' }).click()
  await page.getByRole('heading', { name: 'Church Library', exact: true }).waitFor()
  assert.equal(new URL(page.url()).search, '?book=fixture', 'reload preserves destination and query')
  checks++
  assert.equal(await page.getByRole('alert').count(), 0)
  checks++
  await page.getByRole('button', { name: 'Upload book', exact: true }).click()
  await page.getByRole('heading', { name: 'Upload a book', exact: true }).waitFor()
  checks++
  await page.goto(`${origin}/__admin_recovery?render-error`)
  await page.getByRole('alert').waitFor()
  assert.equal(await page.getByRole('alert').innerText(), 'Fixture rendering failure')
  assert.equal(await page.getByRole('button', { name: 'Reload this page' }).count(), 0)
  assert.equal(await page.getByRole('link', { name: 'Try again' }).count(), 1)
  checks++
  console.log(`Admin module recovery: ${checks} passed, 0 failed`)
} finally {
  await browser?.close()
  await server?.close()
  await rm(cacheDir, { recursive: true, force: true })
}
