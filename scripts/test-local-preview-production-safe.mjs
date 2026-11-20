/**
 * The local preview must be impossible to ship, and a production build must keep working with it disabled.
 *
 * Builds the app the way Cloudflare does (`vite build`) with the worst-case misconfiguration, VITE_LOCAL_PREVIEW=true set in the
 * build environment, into scratch folders, then proves:
 *   1. none of the preview-only code, text, routes or inventory files reached either bundle;
 *   2. the bundle still honours VITE_PLAY_DATABASE_ONLY (a database-only build does not use the preview override);
 *   3. a served production build works in a real browser: the Faith Challenges hub shows all 12 games, a game opens,
 *      there is no LOCAL PREVIEW banner, no write guard, no /play/local-review screen, and window.fetch is untouched.
 *   node scripts/test-local-preview-production-safe.mjs
 */
import assert from 'node:assert/strict'
import { spawn, spawnSync } from 'node:child_process'
import { existsSync, readdirSync, readFileSync, rmSync, statSync } from 'node:fs'
import { join } from 'node:path'
import { chromium } from 'playwright'

const FORBIDDEN = ['local-review', 'LocalPreviewReview', '/__local-preview', 'LOCAL PREVIEW', 'Blocked by the local preview write guard', 'review-inventory', '__localPreviewBlocked', 'Review all 834 drafts']
const scratch = (name) => join('.local-preview', name)

function build(outDir, extraEnv) {
  rmSync(outDir, { recursive: true, force: true })
  const run = spawnSync(process.execPath, ['node_modules/vite/bin/vite.js', 'build', '--outDir', outDir, '--emptyOutDir'], {
    env: { ...process.env, VITE_LOCAL_PREVIEW: 'true', NODE_ENV: 'production', ...extraEnv }, encoding: 'utf8', maxBuffer: 64 * 1024 * 1024,
  })
  assert.equal(run.status, 0, `production build failed:\n${run.stderr || run.stdout}`)
}
function filesOf(outDir) {
  const files = []
  const walk = (dir) => { for (const name of readdirSync(dir)) { const full = join(dir, name); if (statSync(full).isDirectory()) walk(full); else files.push(full) } }
  walk(outDir)
  return files
}
function assertNoPreviewCode(outDir, label) {
  const files = filesOf(outDir)
  const hits = []
  for (const file of files.filter((f) => /\.(js|css|html|json|webmanifest)$/.test(f))) {
    const body = readFileSync(file, 'utf8')
    for (const needle of FORBIDDEN) if (body.includes(needle)) hits.push(`${needle} in ${file}`)
  }
  assert.deepEqual(hits, [], `${label}: preview-only code leaked into the production bundle:\n${hits.join('\n')}`)
  assert.ok(!files.some((file) => /review-inventory|\.local-preview/.test(file.replace(outDir, ''))), `${label}: no inventory file is copied into the build output`)
  assert.ok(existsSync(join(outDir, 'index.html')), `${label}: the build produced a site`)
  return files.length
}

// ---- 1 + 2: worst-case builds
const normal = scratch('dist-safety-normal')
const dbOnly = scratch('dist-safety-dbonly')
build(normal, { VITE_PLAY_DATABASE_ONLY: 'false' })
const normalCount = assertNoPreviewCode(normal, 'bundled-content build with VITE_LOCAL_PREVIEW=true')
build(dbOnly, { VITE_PLAY_DATABASE_ONLY: 'true' })
const dbCount = assertNoPreviewCode(dbOnly, 'database-only build with VITE_LOCAL_PREVIEW=true')
assert.ok(filesOf(dbOnly).filter((f) => f.endsWith('.js')).some((f) => /play_content_items/.test(readFileSync(f, 'utf8'))), 'the published-content loader is in the database-only bundle')

// ---- 3: a served production build behaves like production
const port = '5291'
const server = spawn(process.execPath, ['node_modules/vite/bin/vite.js', 'preview', '--outDir', normal, '--host', '127.0.0.1', '--port', port, '--strictPort'], { stdio: 'ignore', windowsHide: true })
const stop = () => { if (process.platform === 'win32') spawnSync('taskkill', ['/pid', String(server.pid), '/T', '/F'], { stdio: 'ignore' }); else server.kill() }
process.on('exit', stop)
let browser
try {
  const base = `http://127.0.0.1:${port}`
  for (let i = 0; i < 60; i += 1) {
    try { if ((await fetch(`${base}/play`)).ok) break } catch { /* not up yet */ }
    await new Promise((r) => setTimeout(r, 500))
    if (i === 59) throw new Error('vite preview did not start')
  }
  browser = await chromium.launch()
  const context = await browser.newContext({ viewport: { width: 390, height: 844 }, serviceWorkers: 'block' })
  const page = await context.newPage()
  const errors = []
  page.on('pageerror', (e) => errors.push(e.message))
  await page.goto(`${base}/play`, { waitUntil: 'domcontentloaded' })
  await page.waitForFunction(() => document.querySelectorAll('[data-game-card]').length === 12, null, { timeout: 30000 })
  assert.equal(await page.locator('[data-local-preview-banner]').count(), 0, 'no LOCAL PREVIEW banner in a production build')
  const state = await page.evaluate(() => ({ guard: window.__localPreviewGuard, blocked: window.__localPreviewBlocked, fetchNative: /\[native code\]/.test(Function.prototype.toString.call(window.fetch)) }))
  assert.equal(state.guard, undefined, 'the write guard is not installed in a production build')
  assert.equal(state.blocked, undefined)
  assert.ok(state.fetchNative, 'window.fetch is the browser built-in, not a wrapper')
  const counts = await page.locator('[data-game-content]').allInnerTexts()
  assert.ok(counts.length === 12 && counts.every((text) => text.trim()), 'every game card shows its content count')
  // The game works with preview mode off: trivia opens and offers a way to start.
  await page.goto(`${base}/play/trivia`, { waitUntil: 'domcontentloaded' })
  await page.getByRole('button', { name: 'Start round' }).waitFor({ timeout: 30000 })
  // The review route does not exist in production: no review screen renders.
  await page.goto(`${base}/play/local-review`, { waitUntil: 'domcontentloaded' })
  await page.waitForTimeout(1500)
  assert.equal(await page.locator('[data-local-review], [data-review-summary]').count(), 0, 'no review screen at /play/local-review in a production build')
  assert.deepEqual(errors, [], `no uncaught browser errors: ${errors.join('; ')}`)
  console.log('Production build served: hub shows 12 games, trivia opens, no banner, no write guard, native fetch, no review screen.')
} finally {
  await browser?.close()
  stop()
  rmSync(normal, { recursive: true, force: true })
  rmSync(dbOnly, { recursive: true, force: true })
}
console.log(`Production-safe: built twice with VITE_LOCAL_PREVIEW=true (${normalCount} and ${dbCount} files); none of ${FORBIDDEN.length} preview-only markers present; no inventory shipped; database-only loader intact.`)
