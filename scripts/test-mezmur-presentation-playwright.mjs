/**
 * Playwright checks for the Mezmur reader (mobile cleanup) and Present Mezmur.
 *
 * Runs the production build against an in-browser mock of the Supabase REST
 * API (every request to the mock host is answered from the fixtures below), so
 * no production data is read or written.
 *
 *   npm run test:mezmur-presentation:e2e
 *   MEZMUR_FIXTURES=/path/rows.json  → use other rows (e.g. an export) instead
 *   SCREENSHOT_DIR=/path             → also save screenshots
 *
 * These are emulated viewports in headless Chromium — not real devices.
 */
import { execFileSync } from 'node:child_process'
import { createServer } from 'node:http'
import { existsSync, mkdirSync, readFileSync, statSync } from 'node:fs'
import { dirname, extname, join, resolve } from 'node:path'
import { fileURLToPath } from 'node:url'
const { chromium } = await import(process.env.PLAYWRIGHT_MODULE || 'playwright')

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..')
const MOCK = 'http://supabase.mock.test'
const outDir = resolve(root, 'tmp/e2e-mezmur-presentation-dist')
const shots = process.env.SCREENSHOT_DIR ? resolve(process.env.SCREENSHOT_DIR) : null
if (shots) mkdirSync(shots, { recursive: true })

if (!process.env.SKIP_BUILD || !existsSync(outDir)) {
  console.log('Building app against the mock Supabase host…')
  execFileSync(process.execPath, [resolve(root, 'node_modules/vite/bin/vite.js'), 'build', '--outDir', outDir, '--emptyOutDir'], {
    cwd: root,
    stdio: 'ignore',
    env: { ...process.env, VITE_SUPABASE_URL: MOCK, VITE_SUPABASE_PUBLISHABLE_KEY: 'mock-publishable-key' },
  })
}

// --- fixtures (synthetic text) ------------------------------------------------
const base = {
  status: 'published', deleted_at: null, form: 'mezmur', primary_language: 'amharic', language: 'amharic',
  description: null, singer_name: 'Test Zemari', image_path: null, legacy_thumbnail_url: null, audio_url: null,
  lyrics_geez: null, lyrics_oromo: null, lyrics_english: null, search_keywords: '', rights_status: 'owned', source_url: null,
}
const chorus = ['ሃሌ ሉያ ሃሌ ሉያ ለአምላካችን', 'ስብሐት ለእግዚአብሔር በአርያም (2x)']
const verse = (n) => [`ቀዳማይ መስመር ዘቁጥር ${n}`, `ዳግማይ መስመር ዘቁጥር ${n}`, `ሣልሳይ መስመር ዘቁጥር ${n}`, `ራብዓይ መስመር ዘቁጥር ${n}`]
const tChorus = ['Hale luya hale luya le-amlakachin', 'Sibhat le-Egziabher be-aryam (2x)']
const tVerse = (n) => [`Qedamay mesmer ze-qutir ${n}`, `Dagmay mesmer ze-qutir ${n}`, `Salsay mesmer ze-qutir ${n}`, `Rabay mesmer ze-qutir ${n}`]
const stanzas = (parts) => parts.map((p) => p.join('\n')).join('\n\n')
let ROWS = [
  {
    ...base, mezmur_id: '00000000-0000-4000-8000-000000000001', import_id: '10000000-0000-4000-8000-000000000001',
    slug: 'test-hale-luya', title: 'Hale Luya', search_keywords: 'hale luya halleluya', title_amharic: 'ሃሌ ሉያ ለአምላካችን', transliteration_title: 'Hale Luya Le-Amlakachin',
    lyrics_amharic: stanzas([chorus, verse(1), chorus, verse(2), chorus, verse(3), chorus]),
    lyrics_transliteration: stanzas([tChorus, tVerse(1), tChorus, tVerse(2), tChorus, tVerse(3), tChorus]),
    lyrics_english: 'Hallelujah, hallelujah to our God\nGlory to God in the highest\n\nThe first line\nThe second line',
    youtube_url: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', source_url: 'https://example.org/source',
  },
  {
    ...base, mezmur_id: '00000000-0000-4000-8000-000000000002', import_id: '10000000-0000-4000-8000-000000000002',
    slug: 'test-amharic-only', title: 'Amharic Only', title_amharic: 'አማርኛ ብቻ', transliteration_title: null,
    lyrics_amharic: 'አንድ መስመር\nሁለተኛ መስመር\n\nሦስተኛ መስመር', lyrics_transliteration: null, youtube_url: null,
  },
]
const longLine = (n) => `ይህ ረጅም መስመር ቁጥር ${n} ነው እና ብዙ ቃላትን ይዟል ስለዚህ በስላይድ ውስጥ መጠቅለል አለበት ሃሌ ሉያ`
ROWS.push({
  ...base, mezmur_id: '00000000-0000-4000-8000-000000000003', import_id: '10000000-0000-4000-8000-000000000003',
  slug: 'test-long-lines', title: 'Long Lines', title_amharic: 'ረጅም መስመሮች', transliteration_title: null,
  lyrics_amharic: Array.from({ length: 6 }, (_, i) => longLine(i + 1)).join('\n'), lyrics_transliteration: null, youtube_url: null,
})
if (process.env.MEZMUR_FIXTURES) ROWS = JSON.parse(readFileSync(process.env.MEZMUR_FIXTURES, 'utf8'))

function answer(url) {
  const u = new URL(url)
  const table = u.pathname.replace(/^\/rest\/v1\//, '')
  if (table !== 'mezmur_public' && table !== 'mezmur_data_import') return []
  let rows = ROWS
  for (const [key, raw] of u.searchParams) {
    if (['select', 'limit', 'offset', 'order', 'or', 'and'].includes(key)) continue
    const m = /^(eq|neq|in|is)\.(.*)$/.exec(raw)
    if (!m) continue
    const [, op, val] = m
    if (op === 'eq') rows = rows.filter((r) => String(r[key] ?? '') === val)
    if (op === 'neq') rows = rows.filter((r) => String(r[key] ?? '') !== val)
    if (op === 'is' && val === 'null') rows = rows.filter((r) => r[key] == null)
    if (op === 'in') {
      const set = new Set(val.replace(/^\(|\)$/g, '').split(',').map((v) => v.replace(/^"|"$/g, '')))
      rows = rows.filter((r) => set.has(String(r[key] ?? '')))
    }
  }
  const limit = u.searchParams.get('limit')
  return limit ? rows.slice(0, Number(limit)) : rows
}

// --- static server -------------------------------------------------------------
const types = { '.html': 'text/html; charset=utf-8', '.js': 'text/javascript', '.css': 'text/css', '.svg': 'image/svg+xml', '.png': 'image/png', '.webp': 'image/webp', '.json': 'application/json', '.woff2': 'font/woff2', '.webmanifest': 'application/manifest+json' }
const server = createServer((req, res) => {
  const path = decodeURIComponent(new URL(req.url, 'http://x').pathname)
  let file = join(outDir, path)
  if (!file.startsWith(outDir) || !existsSync(file) || statSync(file).isDirectory()) file = join(outDir, 'index.html')
  res.writeHead(200, { 'content-type': types[extname(file)] || 'application/octet-stream' })
  res.end(readFileSync(file))
})
await new Promise((done) => server.listen(0, '127.0.0.1', done))
const origin = `http://127.0.0.1:${server.address().port}`

const browser = await chromium.launch(process.env.PW_CHROMIUM_PATH ? { executablePath: process.env.PW_CHROMIUM_PATH } : {})
let passed = 0
const failures = []
async function test(name, fn) {
  if (process.env.ONLY && !name.includes(process.env.ONLY)) return
  try {
    await fn()
    passed++
    console.log(`✓ ${name}`)
  } catch (error) {
    failures.push(name)
    console.log(`✗ ${name}\n    ${String(error.message || error).split('\n').slice(0, process.env.DEBUG ? 12 : 1).join('\n    ')}`)
  }
}
function check(cond, message) {
  if (!cond) throw new Error(message)
}

const recordDownloads = () => {
  window.__downloads = []
  const click = HTMLAnchorElement.prototype.click
  HTMLAnchorElement.prototype.click = function () {
    if (this.download) window.__downloads.push(this.download)
    return click.call(this)
  }
}
let bibleMode = 'ok'
const axePath = resolve(root, 'node_modules/axe-core/axe.min.js')
async function openPage({ width, height, slug = 'test-hale-luya', touch = width < 768, init } = {}) {
  const context = await browser.newContext({
    viewport: { width, height }, deviceScaleFactor: 1, hasTouch: touch, isMobile: touch && width < 768,
    permissions: ['clipboard-read', 'clipboard-write'], acceptDownloads: true, reducedMotion: 'reduce',
  })
  await context.route(`${MOCK}/**`, (route) => {
    const url = route.request().url()
    if (bibleMode === 'statement-timeout' && /\/rest\/v1\/bible_/.test(url)) {
      return route.fulfill({ status: 500, contentType: 'application/json', body: JSON.stringify({ code: '57014', message: 'canceling statement due to statement timeout' }) })
    }
    return route.fulfill({ status: 200, contentType: 'application/json', body: JSON.stringify(answer(url)) })
  })
  // Offline test: keep third-party embeds out.
  await context.route(/youtube\.com|ytimg\.com|googlevideo|fonts\.(googleapis|gstatic)\.com/, (route) => route.abort())
  if (init) await context.addInitScript(init)
  const page = await context.newPage()
  if (process.env.DEBUG) {
    page.on('console', (m) => console.log('    [console]', m.type(), m.text().slice(0, 300)))
    page.on('pageerror', (e) => console.log('    [pageerror]', e.message))
  }
  await page.goto(`${origin}/practice/mezmur/${slug}`)
  await page.locator('[data-testid="lyrics-reading-experience"]').waitFor({ timeout: 20000 })
  return { context, page }
}

const sizes = [
  [320, 568], [360, 740], [375, 812], [390, 844], [412, 915], [430, 932], [768, 1024], [1440, 900], [1920, 1080],
]

for (const [width, height] of sizes) {
  await test(`${width}×${height}: title, language selector and first lyrics in the first screen; no sideways scroll`, async () => {
    const { context, page } = await openPage({ width, height })
    const m = await page.evaluate(() => {
      const top = (sel) => document.querySelector(sel)?.getBoundingClientRect()
      const firstLyric = document.querySelector('[data-testid="lyrics-reader"] article p:last-child, [data-testid="lyrics-reader"] article span')
      return {
        h1: top('h1')?.bottom,
        tabs: top('[role="tablist"]')?.bottom,
        lyric: firstLyric?.getBoundingClientRect().top,
        lyricText: firstLyric?.textContent?.slice(0, 20),
        overflow: document.documentElement.scrollWidth - document.documentElement.clientWidth,
        buttons: [...document.querySelectorAll('[data-testid="lyrics-reading-experience"] button')].map((b) => b.textContent.trim()),
        settingsOpen: document.querySelector('[data-testid="reading-settings-toggle"]')?.getAttribute('aria-expanded'),
      }
    })
    if (shots && [320, 375, 390, 430, 1440].includes(width)) await page.screenshot({ path: join(shots, `after-reader-${width}.png`) })
    await context.close()
    check(m.overflow <= 1, `page scrolls sideways by ${m.overflow}px`)
    check(m.h1 < height && m.tabs < height, `title/language selector below the fold (${m.h1}, ${m.tabs})`)
    if (width < 960) check(m.lyric + 24 < height, `first lyric line starts at ${Math.round(m.lyric)}px (viewport ${height})`)
    check(!m.buttons.some((t) => /^(PDF|Slides|Live)$/.test(t)), `old buttons still present: ${m.buttons.join(', ')}`)
    check(m.buttons.some((t) => /Present Mezmur/.test(t)), 'Present Mezmur button missing')
    if (width < 960) check(m.settingsOpen === 'false', 'reading settings should start collapsed on mobile')
    else check(m.settingsOpen === 'true', 'reading settings should start open on desktop')
  })
}

await test('mobile tap targets in the reader toolbar are at least 40×40', async () => {
  const { context, page } = await openPage({ width: 375, height: 812 })
  const small = await page.evaluate(() =>
    [...document.querySelectorAll('[data-testid="lyrics-reading-experience"] button:not([hidden])')]
      .filter((b) => b.offsetParent)
      .map((b) => ({ t: b.getAttribute('aria-label') || b.textContent.trim(), r: b.getBoundingClientRect() }))
      .filter(({ r }) => r.width < 40 || r.height < 40)
      .map(({ t, r }) => `${t} ${Math.round(r.width)}×${Math.round(r.height)}`),
  )
  await context.close()
  check(!small.length, small.join('; '))
})

await test('reading settings: collapsible with aria-expanded, settings still work', async () => {
  const { context, page } = await openPage({ width: 375, height: 812 })
  const toggle = page.locator('[data-testid="reading-settings-toggle"]')
  check(!(await page.locator('[data-testid="reading-settings"]').isVisible()), 'panel visible before opening')
  await toggle.click()
  check((await toggle.getAttribute('aria-expanded')) === 'true', 'aria-expanded not updated')
  await page.getByRole('button', { name: 'XL' }).click()
  const size = await page.locator('[data-testid="lyrics-reader"]').evaluate((el) => getComputedStyle(el).getPropertyValue('--reader-size'))
  check(size.trim() === '32px', `font size ${size}`)
  await context.close()
})

await test('language selector switches text and remembers the choice; nothing is fabricated', async () => {
  const { context, page } = await openPage({ width: 375, height: 812 })
  await page.getByRole('tab', { name: 'Transliteration' }).click()
  check((await page.locator('[data-testid="lyrics-reader"]').innerText()).includes('Hale luya hale luya'), 'transliteration not shown')
  await page.reload()
  await page.locator('[data-testid="lyrics-reading-experience"]').waitFor()
  check((await page.getByRole('tab', { name: 'Transliteration' }).getAttribute('aria-selected')) === 'true', 'choice not remembered')
  await page.goto(`${origin}/practice/mezmur/test-amharic-only`)
  await page.locator('[data-testid="lyrics-reading-experience"]').waitFor()
  check((await page.getByRole('tab').count()) === 0, 'unavailable languages offered for an Amharic-only Mezmur')
  await context.close()
})

await test('Share falls back to copying the exact current Mezmur URL; Copy link copies the URL, not lyrics', async () => {
  const { context, page } = await openPage({ width: 1440, height: 900, init: () => { Object.defineProperty(navigator, 'share', { value: undefined }) } })
  await page.locator('[data-testid="share-link"]').click()
  const shared = await page.evaluate(() => navigator.clipboard.readText())
  check(shared === `${origin}/practice/mezmur/test-hale-luya`, `copied ${shared}`)
  await page.evaluate(() => navigator.clipboard.writeText(''))
  await page.locator('[data-testid="more-actions"]').click()
  await page.locator('[data-testid="menu-copy-link"]').click()
  const copied = await page.evaluate(() => navigator.clipboard.readText())
  check(copied === shared, `copy link gave ${copied}`)
  check(!/ሃሌ/.test(copied), 'lyrics copied instead of the link')
  await context.close()
})

await test('Share uses the Web Share API with the current URL when available', async () => {
  const { context, page } = await openPage({
    width: 390, height: 844,
    init: () => { window.__shared = null; Object.defineProperty(navigator, 'share', { value: async (d) => { window.__shared = d } }) },
  })
  await page.locator('[data-testid="share-link"]').click()
  const data = await page.evaluate(() => window.__shared)
  check(data?.url?.endsWith('/practice/mezmur/test-hale-luya'), `share data ${JSON.stringify(data)}`)
  await context.close()
})

await test('More menu: keyboard opens, arrows move, Escape closes and returns focus', async () => {
  const { context, page } = await openPage({ width: 1440, height: 900 })
  const more = page.locator('[data-testid="more-actions"]')
  await more.focus()
  await page.keyboard.press('Enter')
  check((await more.getAttribute('aria-expanded')) === 'true', 'menu not open')
  check(await page.evaluate(() => document.activeElement?.getAttribute('role') === 'menuitem'), 'focus not in menu')
  await page.keyboard.press('ArrowDown')
  await page.keyboard.press('Escape')
  check((await more.getAttribute('aria-expanded')) === 'false', 'menu not closed')
  check(await page.evaluate(() => document.activeElement?.getAttribute('data-testid') === 'more-actions'), 'focus not returned')
  await context.close()
})

await test('mini-player: shown (compact, inside the viewport) with a recording, hidden without one', async () => {
  const { context, page } = await openPage({ width: 375, height: 812 })
  const dock = page.locator('#practice-mini-dock')
  await dock.waitFor()
  const box = await dock.boundingBox()
  if (process.env.DEBUG) console.log(await page.evaluate(() => [...document.querySelectorAll('#practice-mini-dock *')].map((e) => `${e.tagName}.${e.className} ${Math.round(e.getBoundingClientRect().height)} ${getComputedStyle(e).display}`).join('\n')))
  if (process.env.DEBUG) console.log(await page.evaluate(() => ({ ds: { ...document.documentElement.dataset }, h: document.documentElement.style.getPropertyValue('--mini-player-height'), fab: [...document.querySelectorAll('button')].filter((b) => getComputedStyle(b).position === 'fixed').map((b) => b.className + ' ' + JSON.stringify(b.getBoundingClientRect())) })))
  check(box.height <= 80, `mini-player is ${box.height}px tall`)
  check(box.y + box.height <= 812, 'mini-player off screen')
  // Lyrics can scroll fully clear of the mini-player.
  const clear = await page.evaluate(() => {
    window.scrollTo(0, document.documentElement.scrollHeight)
    const last = [...document.querySelectorAll('[data-testid="lyrics-reader"] article')].pop().getBoundingClientRect()
    return last.bottom <= document.getElementById('practice-mini-dock').getBoundingClientRect().top
  })
  check(clear, 'last verse stays hidden behind the mini-player')
  await page.goto(`${origin}/practice/mezmur/test-amharic-only`)
  await page.locator('[data-testid="lyrics-reading-experience"]').waitFor()
  check((await page.locator('#practice-mini-dock').count()) === 0, 'mini-player shown without audio')
  await context.close()
})

async function present(page) {
  await page.locator('[data-testid="present-mezmur"]').click()
  const dialog = page.locator('[data-testid="mezmur-presentation"]')
  await dialog.waitFor({ timeout: 15000 })
  return dialog
}
const counter = (page) => page.locator('[data-testid="presentation-counter"]').innerText()

await test('Present Mezmur: lazy chunk, full-viewport dialog, title slide, keyboard navigation, Escape exits', async () => {
  const { context, page } = await openPage({ width: 1920, height: 1080, touch: false })
  const before = await page.evaluate(() => performance.getEntriesByType('resource').map((r) => r.name).filter((n) => /MezmurPresentation|pptx/.test(n)))
  check(before.length === 0 || before.every((n) => !/pptx-vendor/.test(n)), `loaded too early: ${before}`)
  const dialog = await present(page)
  const loaded = await page.evaluate(() => performance.getEntriesByType('resource').map((r) => r.name))
  check(loaded.some((n) => /MezmurPresentation/.test(n)), 'presentation chunk not lazily loaded')
  check(!loaded.some((n) => /pptx-vendor/.test(n)), 'PowerPoint library loaded before export')
  const rect = await dialog.boundingBox()
  check(rect.width === 1920 && rect.height === 1080, `dialog ${rect.width}×${rect.height}`)
  const stage = await page.locator('[data-testid="presentation-stage"]').boundingBox()
  check(Math.abs(stage.width / stage.height - 16 / 9) < 0.02, `stage ratio ${stage.width / stage.height}`)
  check((await counter(page)).startsWith('1 /'), 'does not start at slide 1')
  check((await page.locator('[data-testid="presentation-stage"] h2').innerText()).includes('ሃሌ ሉያ'), 'title slide missing')
  if (shots) await page.screenshot({ path: join(shots, 'after-present-1920-title.png') })
  await page.keyboard.press('ArrowRight')
  check((await counter(page)).startsWith('2 /'), 'ArrowRight')
  const text = await page.locator('[data-testid="presentation-slide-text"]').innerText()
  // Opens in the reader's language (Amharic by default).
  check(text.includes('ሃሌ ሉያ ሃሌ ሉያ ለአምላካችን') && text.includes('(2x)'), `slide text: ${text.slice(0, 80)}`)
  if (shots) await page.screenshot({ path: join(shots, 'after-present-1920-both.png') })
  await page.keyboard.press(' ')
  check((await counter(page)).startsWith('3 /'), 'Space')
  await page.keyboard.press('ArrowLeft')
  check((await counter(page)).startsWith('2 /'), 'ArrowLeft')
  await page.keyboard.press('End')
  const [n, total] = (await counter(page)).split(' / ').map(Number)
  check(n === total, 'End')
  check(await page.locator('[data-testid="presentation-next"]').isDisabled(), 'next enabled on last slide')
  check(await page.evaluate(() => document.body.style.overflow === 'hidden'), 'page still scrolls behind the presentation')
  await page.keyboard.press('Escape')
  await dialog.waitFor({ state: 'detached' })
  check(await page.evaluate(() => document.activeElement?.getAttribute('data-testid') === 'present-mezmur'), 'focus not returned to Present button')
  check(await page.evaluate(() => document.body.style.overflow !== 'hidden'), 'scroll lock not released')
  await context.close()
})

await test('Present Mezmur: settings update slides immediately (lines, size, language, theme, title)', async () => {
  const { context, page } = await openPage({ width: 1440, height: 900, touch: false })
  await present(page)
  await page.locator('[data-testid="presentation-settings-toggle"]').click()
  const settings = page.locator('[data-testid="presentation-settings"]')
  await settings.waitFor()
  await page.locator('[data-testid="presentation-lang-original"]').click()
  await page.locator('[data-testid="presentation-lines-1"]').click()
  const total1 = Number((await counter(page)).split(' / ')[1])
  await page.locator('[data-testid="presentation-lines-6"]').click()
  const total6 = Number((await counter(page)).split(' / ')[1])
  check(total1 === 20 + 1 && total6 === 7 + 1, `slide totals 1-line=${total1}, 6-line=${total6}`)
  await page.locator('[data-testid="presentation-title-toggle"]').uncheck()
  check(Number((await counter(page)).split(' / ')[1]) === 7, 'title slide toggle')
  const v0 = Number(await page.locator('[data-testid="presentation-font-value"]').innerText())
  await page.locator('[data-testid="presentation-font-up"]').click()
  check(Number(await page.locator('[data-testid="presentation-font-value"]').innerText()) === v0 + 4, 'A+')
  await page.locator('[data-testid="presentation-lang-english"]').click()
  check((await page.locator('[data-testid="presentation-slide-text"]').innerText()).includes('Hallelujah'), 'English')
  await page.locator('[data-testid="presentation-theme-ivory"]').click()
  const bg = await page.locator('[data-testid="mezmur-presentation"]').evaluate((el) => getComputedStyle(el).backgroundColor)
  check(bg === 'rgb(251, 246, 234)', `ivory background ${bg}`)
  await context.close()
})

await test('Present Mezmur: unavailable languages are disabled, not faked', async () => {
  const { context, page } = await openPage({ width: 1440, height: 900, slug: 'test-amharic-only', touch: false })
  await present(page)
  await page.locator('[data-testid="presentation-settings-toggle"]').click()
  for (const id of ['transliteration', 'english', 'both']) {
    check(await page.locator(`[data-testid="presentation-lang-${id}"]`).isDisabled(), `${id} should be disabled`)
  }
  await context.close()
})

await test('Present Mezmur: largest text never leaves the slide (auto-fit + warning)', async () => {
  for (const [w, h] of [[320, 568], [375, 812], [768, 1024], [1920, 1080], [812, 375]]) {
    const { context, page } = await openPage({ width: w, height: h, init: () => localStorage.setItem('td.mezmurPresentation.v1', JSON.stringify({ fontSize: 128, linesPerSlide: 6, showTitle: false, language: 'both' })) })
    await present(page)
    await page.waitForTimeout(600) // let full-screen entry settle
    for (let i = 0; i < 3; i++) {
      const res = await page.evaluate(() => {
        const stage = document.querySelector('[data-testid="presentation-stage"]').getBoundingClientRect()
        const box = document.querySelector('[data-testid="presentation-slide-text"]')
        const kids = [...box.children].map((k) => k.getBoundingClientRect())
        const out = kids.some((r) => r.top < stage.top - 1 || r.bottom > stage.bottom + 1 || r.left < stage.left - 1 || r.right > stage.right + 1)
        return { out, warn: Boolean(document.querySelector('[data-testid="presentation-fit-warning"]')), dbg: JSON.stringify({ stage: [stage.top, stage.bottom, stage.left, stage.right].map(Math.round), kids: kids.map((r) => [r.top, r.bottom, r.left, r.right].map(Math.round)), fontSize: getComputedStyle(box).fontSize }) }
      })
      check(!res.out, `${w}×${h} slide ${i + 1}: text outside the slide ${process.env.DEBUG ? res.dbg : ''}`)
      await page.keyboard.press('ArrowRight')
    }
    if (shots && [375, 812].includes(w)) await page.screenshot({ path: join(shots, `after-present-${w}x${h}-large.png`) })
    await context.close()
  }
  // Very long lines at the largest size: text shrinks to fit and the presenter is told.
  for (const [w, h] of [[1920, 1080], [375, 812]]) {
    const { context, page } = await openPage({ width: w, height: h, slug: 'test-long-lines', init: () => localStorage.setItem('td.mezmurPresentation.v1', JSON.stringify({ fontSize: 128, linesPerSlide: 6, showTitle: false })) })
    await present(page)
    await page.waitForTimeout(600)
    const res = await page.evaluate(() => {
      const stage = document.querySelector('[data-testid="presentation-stage"]').getBoundingClientRect()
      const kids = [...document.querySelector('[data-testid="presentation-slide-text"]').children].map((k) => k.getBoundingClientRect())
      return { out: kids.some((r) => r.top < stage.top - 1 || r.bottom > stage.bottom + 1), warn: Boolean(document.querySelector('[data-testid="presentation-fit-warning"]')), dbg: JSON.stringify({ stage: [stage.top, stage.bottom], kids: kids.map((r) => [r.top, r.bottom].map(Math.round)) }) }
    })
    if (shots && w === 1920) await page.screenshot({ path: join(shots, 'after-present-1920-fit-warning.png') })
    await context.close()
    check(!res.out, `${w}×${h}: long lines overflow ${process.env.DEBUG ? res.dbg : ''}`)
    check(res.warn, `${w}×${h}: no fit warning`)
  }
})

await test('Present Mezmur on phones: swipe navigates, tap toggles controls, Exit is always reachable', async () => {
  const { context, page } = await openPage({ width: 375, height: 812 })
  await present(page)
  const stage = page.locator('[data-testid="presentation-stage"]')
  const box = await stage.boundingBox()
  const swipe = async (dx) => {
    const y = box.y + box.height / 2
    const x = box.x + box.width / 2
    await stage.dispatchEvent('pointerdown', { pointerId: 7, pointerType: 'touch', clientX: x, clientY: y, isPrimary: true })
    await stage.dispatchEvent('pointerup', { pointerId: 7, pointerType: 'touch', clientX: x + dx, clientY: y + 4, isPrimary: true })
  }
  await swipe(-160)
  check((await counter(page)).startsWith('2 /'), 'swipe left → next')
  await swipe(160)
  check((await counter(page)).startsWith('1 /'), 'swipe right → previous')
  if (shots) await page.screenshot({ path: join(shots, 'after-present-375-portrait.png') })
  const exitBox = await page.locator('[data-testid="presentation-exit"]').boundingBox()
  check(exitBox && exitBox.width >= 44 && exitBox.height >= 44 && exitBox.y >= 0, 'Exit not reachable')
  // Navigation bars sit outside the lyric area in portrait.
  const bars = await page.evaluate(() => {
    const s = document.querySelector('[data-testid="presentation-stage"]').getBoundingClientRect()
    const t = document.querySelector('[data-testid="presentation-next"]').getBoundingClientRect()
    return t.top >= s.bottom - 1
  })
  check(bars, 'navigation buttons cover the lyrics')
  await page.locator('[data-testid="presentation-exit"]').click()
  await page.locator('[data-testid="mezmur-presentation"]').waitFor({ state: 'detached' })
  await context.close()
})

await test('Present Mezmur: falls back to a fixed full-viewport view when fullscreen is refused (iOS-style)', async () => {
  const { context, page } = await openPage({
    width: 390, height: 844,
    init: () => {
      Element.prototype.requestFullscreen = function () { return Promise.reject(new TypeError('not allowed')) }
      Object.defineProperty(document, 'fullscreenEnabled', { value: false })
    },
  })
  const dialog = await present(page)
  const r = await dialog.boundingBox()
  check(r.width === 390 && r.height === 844 && r.x === 0 && r.y === 0, `fallback box ${JSON.stringify(r)}`)
  check((await dialog.getAttribute('data-fullscreen')) === 'false', 'claims fullscreen')
  await context.close()
})

await test('Download PowerPoint (.pptx) from the presentation: real file, lazy library', async () => {
  const { context, page } = await openPage({ width: 1440, height: 900, touch: false, init: recordDownloads })
  await present(page)
  await page.locator('[data-testid="presentation-settings-toggle"]').click()
  const [download] = await Promise.all([
    page.waitForEvent('download', { timeout: 20000 }),
    page.locator('[data-testid="presentation-download-pptx"]').click(),
  ])
  const names = await page.evaluate(() => window.__downloads)
  check(names.length === 1 && names[0] === 'ሃሌ ሉያ ለአምላካችን.pptx', `file name ${names}`)
  const file = await download.path()
  const bytes = readFileSync(file)
  check(bytes[0] === 0x50 && bytes[1] === 0x4b, 'not a zip/pptx')
  check(bytes.length > 20000, `tiny file ${bytes.length}`)
  const loaded = await page.evaluate(() => performance.getEntriesByType('resource').map((r) => r.name))
  check(loaded.some((n) => /pptx-vendor/.test(n)), 'PowerPoint library chunk not used')
  await context.close()
})

await test('Download PowerPoint from the reader’s More menu', async () => {
  const { context, page } = await openPage({ width: 390, height: 844, init: recordDownloads })
  await page.locator('[data-testid="more-actions"]').click()
  const [download] = await Promise.all([
    page.waitForEvent('download', { timeout: 20000 }),
    page.locator('[data-testid="menu-download-pptx"]').click(),
  ])
  const names = await page.evaluate(() => window.__downloads)
  check(names[0]?.endsWith('.pptx'), `file name ${names}`)
  check(readFileSync(await download.path()).length > 20000, 'empty download')
  await context.close()
})

await test('axe: no serious/critical issues in the reader and the presentation', async () => {
  if (!existsSync(axePath)) throw new Error('axe-core not installed (npm i --no-save axe-core)')
  const { context, page } = await openPage({ width: 375, height: 812 })
  await page.addScriptTag({ path: axePath })
  const run = () => page.evaluate(async () => {
    const r = await window.axe.run(document, { resultTypes: ['violations'] })
    return r.violations.filter((v) => ['serious', 'critical'].includes(v.impact)).map((v) => `${v.id}: ${v.nodes.slice(0, 2).map((n) => n.target.join(' ')).join(' | ')}`)
  })
  const reader = (await run()).filter((v) => !/^color-contrast: .*(site-header|footer)/i.test(v))
  await present(page)
  await page.locator('[data-testid="presentation-settings-toggle"]').click()
  const pres = await run()
  await context.close()
  const mine = [...reader, ...pres].filter((v) => /lyrics|presentation|present|mezmur|Practice|toolbar|menu|tab/i.test(v))
  if (reader.length || pres.length) console.log('    axe (all serious/critical):', [...reader, ...pres].join('\n      '))
  check(!mine.length, mine.join('; '))
})

await test('throttled network (slow 3G-like): lyrics readable before the presentation code downloads', async () => {
  const context = await browser.newContext({ viewport: { width: 375, height: 812 }, isMobile: true, hasTouch: true })
  await context.route(`${MOCK}/**`, (route) => route.fulfill({ status: 200, contentType: 'application/json', body: JSON.stringify(answer(route.request().url())) }))
  await context.route(/youtube\.com|ytimg\.com|fonts\.(googleapis|gstatic)\.com/, (route) => route.abort())
  const page = await context.newPage()
  const cdp = await context.newCDPSession(page)
  await cdp.send('Network.emulateNetworkConditions', { offline: false, latency: 400, downloadThroughput: (400 * 1024) / 8, uploadThroughput: (400 * 1024) / 8 })
  const t0 = Date.now()
  await page.goto(`${origin}/practice/mezmur/test-hale-luya`)
  await page.locator('[data-testid="lyrics-reader"] article').first().waitFor({ timeout: 60000 })
  const ms = Date.now() - t0
  const early = await page.evaluate(() => performance.getEntriesByType('resource').map((r) => r.name).filter((n) => /MezmurPresentation|pptx/.test(n)))
  console.log(`    lyrics visible after ${ms} ms at ~400 kbit/s, 400 ms RTT`)
  check(!early.some((n) => /pptx/.test(n)), `PowerPoint code downloaded on page load: ${early}`)
  await context.close()
})

await test('Search Buddy: Bible statement timeout shows a Bible-specific notice, other results and a retry', async () => {
  bibleMode = 'statement-timeout'
  const { context, page } = await openPage({ width: 390, height: 844 })
  await page.getByRole('button', { name: 'Open search' }).first().click()
  const input = page.getByLabel('Search the website')
  await input.waitFor()
  await input.fill('hale luya')
  await page.getByRole('button', { name: 'Search', exact: true }).last().click()
  const notice = page.locator('[data-testid="catalog-notice"]')
  await notice.waitFor({ timeout: 30000 }).catch(async (error) => {
    if (process.env.DEBUG) {
      await page.screenshot({ path: '/tmp/claude-0/sb-debug.png' })
      console.log((await page.locator('body').innerText()).slice(-1500))
    }
    throw error
  })
  const text = await notice.innerText()
  if (shots) await page.screenshot({ path: join(shots, 'after-search-buddy-bible-unavailable-390.png') })
  check(/Bible search is temporarily unavailable\. Other available results are shown below\./.test(text), `notice: ${text}`)
  check(!/did not respond|57014|statement/i.test(await page.locator('body').innerText()), 'technical detail or old message shown')
  check(await page.locator('a[href*="/practice/mezmur/test-hale-luya"], a[href*="/hymns/mezmur/test-hale-luya"]').count() > 0, 'Mezmur result not shown')
  check(await page.locator('[data-testid="catalog-retry"]').isVisible(), 'no retry')
  bibleMode = 'ok'
  await page.locator('[data-testid="catalog-retry"]').click()
  await page.waitForTimeout(1500)
  check((await page.locator('[data-testid="catalog-notice"]').count()) === 0, 'notice remains after a successful retry')
  await context.close()
})

await browser.close()
server.close()
console.log(`\n${passed} passed, ${failures.length} failed`)
if (failures.length) process.exit(1)
