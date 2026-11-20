/**
 * Real-browser test of the LOCAL Faith Challenges preview: all 12 games through the actual UI and real engines.
 *
 *   node scripts/test-local-preview-browser.mjs
 *   PREVIEW_GAMES=trivia,match PREVIEW_VIEWPORTS=390 node scripts/test-local-preview-browser.mjs   # focus while debugging
 *
 * It starts its own preview server (scripts/local-preview.mjs on port 5274), plays full rounds for every game at 390 and 1440 in
 * English, 390 in Amharic, and smoke-checks 430 and 768 (open, start, first interaction, no overflow). Screenshots go to
 * .local-preview/screenshots (git-ignored). It also proves the write guard: no non-read request reaches the hosted origin.
 * Reads the hosted Supabase origin only for public data the pages already read (published hymns, public media). No writes.
 */
import assert from 'node:assert/strict'
import { spawn, spawnSync } from 'node:child_process'
import { mkdirSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'
import { chromium } from 'playwright'

const PORT = process.env.LOCAL_PREVIEW_PORT || '5274'
const BASE = `http://127.0.0.1:${PORT}`
const SHOTS = join('.local-preview', 'screenshots')
mkdirSync(SHOTS, { recursive: true })

const GAMES = [
  { id: 'trivia', route: '/play/trivia', kind: 'quiz' },
  { id: 'finish-the-verse', route: '/play/finish-the-verse', kind: 'quiz' },
  { id: 'emoji', route: '/play/emoji', kind: 'quiz' },
  { id: 'history', route: '/play/history', kind: 'history' },
  { id: 'who-am-i', route: '/play/who-am-i', kind: 'who' },
  { id: 'match', route: '/play/match', kind: 'match' },
  { id: 'bible-timeline', route: '/play/bible-timeline', kind: 'timeline' },
  { id: 'adventures', route: '/play/adventures', kind: 'adventure' },
  { id: 'feasts', route: '/play/feasts', kind: 'picture' },
  { id: 'saints', route: '/play/saints', kind: 'picture' },
  { id: 'icon-memory', route: '/play/icon-memory', kind: 'memory' },
  { id: 'finish-the-mezmur', route: '/play/finish-the-mezmur', kind: 'mezmur' },
]
const only = (name) => (process.env[name] ? new Set(process.env[name].split(',')) : null)
const wantGames = only('PREVIEW_GAMES'); const wantViewports = only('PREVIEW_VIEWPORTS')
const VIEWPORTS = [
  { w: 390, h: 844, mobile: true, full: ['en', 'am'] },
  { w: 430, h: 932, mobile: true, full: [] },
  { w: 768, h: 1024, mobile: false, full: [] },
  { w: 1440, h: 900, mobile: false, full: ['en'] },
].filter((v) => !wantViewports || wantViewports.has(String(v.w)))

const L = {
  en: { start: /^(Start round|Start matching|Start playing|Start|Deal the cards)$/, next: /^(Next|Next picture|See results)/, again: /^(Play again|Fresh rounds)$/, check: /^(Check order|Check)$/, done: /(Round complete|Game complete|Discovered!|Session complete|Well played|Story complete|Complete)/i },
  am: { start: /^(ይጀምሩ|ጨዋታውን ይጀምሩ|ካርዶቹን ያድሉ)$/, next: /^(ቀጣይ|ውጤ)/, again: /^(እንደገና|እንደገና ይጫወቱ|አዲስ ዙሮች)$/, check: /^አረጋግጥ$/, done: /(ዙሩ ተጠናቋል|ጨዋታው ተጠናቋል|ተጠናቋል!|ምዕራፉ ተጠናቋል|ጥሩ ተጫውተዋል|ተጠናቅቋል)/ },
}

// ---------------------------------------------------------------- server
const lines = []
const server = spawn(process.execPath, ['scripts/local-preview.mjs'], { env: { ...process.env, LOCAL_PREVIEW_PORT: PORT }, stdio: ['ignore', 'pipe', 'pipe'], windowsHide: true })
server.stdout.on('data', (d) => lines.push(String(d))); server.stderr.on('data', (d) => lines.push(String(d)))
const stopServer = () => { if (process.platform === 'win32') spawnSync('taskkill', ['/pid', String(server.pid), '/T', '/F'], { stdio: 'ignore' }); else server.kill() }
process.on('exit', stopServer)
for (let i = 0; i < 120; i += 1) {
  try { if ((await fetch(`${BASE}/play`)).ok) break } catch { /* not up yet */ }
  await new Promise((r) => setTimeout(r, 500))
  if (i === 119) { console.log(lines.join('')); console.log('FAIL: preview server did not start'); process.exit(1) }
}

// ---------------------------------------------------------------- bookkeeping
const results = []
const problems = []
const record = (row) => { results.push(row); console.log(`${row.ok ? 'PASS' : 'FAIL'} ${row.game} @${row.viewport} ${row.locale} ${row.kind}: ${row.note}`); if (!row.ok) problems.push(row) }
const overflowOk = (page) => page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 1)
const main = (page) => page.locator('main')
const clickButton = async (page, name, options = {}) => { const button = main(page).getByRole('button', { name }).first(); await button.waitFor({ state: 'visible', timeout: options.timeout ?? 15000 }); await button.click() }
const isRight = (classNames) => classNames.split(/\s+/).some((token) => /right|correct/i.test(token) && !/wrong|incorrect/i.test(token))
const imagesLoaded = (page) => page.evaluate(async () => {
  const visible = () => [...document.querySelectorAll('main img, header img')].filter((img) => !img.hidden && img.getBoundingClientRect().width > 0)
  const deadline = Date.now() + 8000
  while (Date.now() < deadline && visible().some((img) => !(img.complete && img.naturalWidth > 0))) await new Promise((r) => setTimeout(r, 150))
  const imgs = visible()
  return { total: imgs.length, broken: imgs.filter((img) => img.naturalWidth === 0).map((img) => img.currentSrc.slice(-60)) }
})

// ---------------------------------------------------------------- game drivers (each returns a short note and asserts real outcomes)
async function quizRound(page, t, { level = true } = {}) {
  await main(page).getByRole('button', { name: t.start }).first().waitFor({ state: 'visible', timeout: 20000 })
  if (level) {
    const challenge = main(page).getByRole('button', { name: 'challenge', exact: true })
    if (await challenge.count()) { await challenge.click(); await page.locator('[data-eligible-count]').filter({ hasNotText: /Only|ብቻ/ }).waitFor({ timeout: 15000 }) } // the full bank has merged in
  }
  await clickButton(page, t.start)
  let right = 0; let asked = 0
  const prompts = new Set()
  for (let guard = 0; guard < 25; guard += 1) {
    const options = page.locator('[class*=options] button')
    const results = page.locator('[class*=scoreRow]').first()
    await Promise.race([options.first().waitFor({ timeout: 15000 }), results.waitFor({ timeout: 15000 })])
    if (await results.isVisible().catch(() => false)) break
    assert.ok((await options.count()) >= 2, 'a question shows at least two answer options')
    const index = asked % (await options.count())
    await options.nth(index).click()
    assert.equal(await options.first().isDisabled(), true, 'answers lock after one tap')
    prompts.add(`${(await page.locator('article h2').first().innerText().catch(() => '')).trim()}#${(await page.locator('article [class*="emoji"]').first().innerText().catch(() => '')).trim()}`)
    if (isRight(await options.nth(index).getAttribute('class'))) right += 1
    asked += 1
    await clickButton(page, t.next)
  }
  await page.locator('[class*=scoreRow]').first().waitFor({ timeout: 15000 })
  const score = (await page.locator('[class*=scoreRow] strong').first().innerText()).trim()
  assert.ok(asked >= 2, `a round has at least 2 questions (asked ${asked})`)
  assert.equal(prompts.size, asked, `no question repeats inside a round (${prompts.size} distinct of ${asked})`)
  assert.equal(score, `${right}/${asked}`, `shown score ${score} equals the ${right} correct answers given of ${asked}`)
  return `${asked} questions, ${right} correct, score ${score}`
}

async function pictureRound(page, t) {
  await main(page).getByRole('button', { name: t.start }).first().waitFor({ state: 'visible', timeout: 20000 })
  const five = main(page).getByRole('button', { name: '5', exact: true }); if (await five.count()) await five.click() // the game defaults to 8 pictures
  await clickButton(page, t.start)
  let right = 0
  for (let i = 0; i < 5; i += 1) {
    const choices = main(page).locator('button[class*="choice"]')
    await choices.first().waitFor({ timeout: 15000 })
    const shown = await imagesLoaded(page)
    assert.deepEqual(shown.broken, [], `picture questions show loaded artwork (${shown.total} images)`)
    assert.ok(shown.total >= 1, 'a picture is shown')
    const index = i % (await choices.count())
    await choices.nth(index).click()
    await page.waitForTimeout(300)
    const classes = await choices.nth(index).getAttribute('class')
    if (isRight(classes)) right += 1
    await clickButton(page, t.next)
  }
  await page.locator('[class*=scoreRow]').first().waitFor({ timeout: 15000 })
  const score = (await page.locator('[class*=scoreRow] strong').first().innerText()).trim()
  assert.equal(score, `${right}/5`, `picture score ${score} equals ${right} correct`)
  return `5 pictures, ${right} correct, score ${score}`
}

async function historyRound(page, t, locale) {
  if (locale === 'en') {
    await clickButton(page, 'Timeline Challenge')
    const moves = main(page).locator('button[aria-label^="Move"]')
    await moves.first().waitFor({ timeout: 15000 })
    await clickButton(page, /Check timeline/)
    await main(page).getByText(/correct|order|timeline/i).first().waitFor({ timeout: 10000 })
    await clickButton(page, /Modes/).catch(() => undefined)
    await clickButton(page, 'Who Was This?')
  } else {
    const modes = main(page).locator('button').filter({ hasNotText: /^$/ })
    await modes.nth(1).click().catch(() => undefined)
    await modes.nth(2).click().catch(() => undefined)
  }
  const challenge = main(page).getByRole('button', { name: 'challenge', exact: true }); await challenge.waitFor({ timeout: 15000 }); await challenge.click() // History has only a few questions, so its setup always says how many match
  return `history quiz mode: ${await quizRound(page, L[locale], { level: false })}${locale === 'en' ? '; timeline mode checked' : ''}`
}

async function whoRound(page, t) {
  await page.clock.install()
  await clickButton(page, t.start)
  let taps = 0
  for (let i = 0; i < 4; i += 1) { await page.locator('main button').filter({ hasText: /→/ }).last().click(); taps += 1 }
  // The game's timer is a chain of one-second timeouts re-armed by each render, so advance the fake clock one second at a time.
  for (let tick = 0; tick < 125; tick += 1) { await page.clock.runFor(1000); if (await page.getByText(t.done).first().isVisible().catch(() => false)) break }
  await page.getByText(t.done).first().waitFor({ timeout: 15000 })
  return `${taps} cards marked correct, timer ran out, round complete`
}

async function matchRound(page, t) {
  const fourPairs = main(page).getByRole('button', { name: /^(4 Pairs|4 ጥንድ|4)/i }).first()
  if (await fourPairs.count()) await fourPairs.click()
  await clickButton(page, t.start)
  const board = main(page).locator('button[aria-pressed]')
  await board.first().waitFor({ timeout: 15000 })
  const total = await board.count()
  assert.ok(total >= 8, `a 4-pair board has ${total} cards`)
  // Engine-agnostic pairing: flip two cards; a real pair stays open (and locks), a mismatch closes again.
  const stays = async (i) => (await board.nth(i).getAttribute('aria-pressed')) === 'true' || (await board.nth(i).isDisabled())
  const locked = new Set(); let flips = 0
  outer: for (let x = 0; x < total; x += 1) {
    for (let y = x + 1; y < total; y += 1) {
      if (locked.has(x) || locked.has(y)) continue
      await board.nth(x).click(); await board.nth(y).click(); flips += 1
      await page.waitForTimeout(1400)
      if ((await stays(x)) && (await stays(y))) { locked.add(x); locked.add(y); break }
      if (await page.getByText(t.done).first().isVisible().catch(() => false)) break outer
    }
    if (locked.size === total) break
  }
  await page.getByText(t.done).first().waitFor({ timeout: 20000 })
  return `${locked.size / 2} of ${total / 2} pairs found by flipping cards (${flips} attempts), discovery screen shown`
}

async function timelineRound(page, t) {
  await clickButton(page, t.start)
  for (let round = 0; round < 4; round += 1) {
    await page.locator('#tl-q').waitFor({ timeout: 15000 })
    const shown = await page.locator('ol li[data-tl-id]').locator('[class*="tlText"]').allInnerTexts()
    const wanted = await page.evaluate(async (texts) => {
      const mod = await import('/src/lib/play/bibleTimeline.ts'); const bank = await import('/src/lib/play/generatedBank.ts')
      const all = bank.mergeById(mod.TIMELINE_CHAINS, await bank.loadGeneratedTimelineChains())
      const has = (ev, x) => ev.title.en === x || ev.title.am === x
      const chain = all.find((c) => texts.every((x) => c.events.some((ev) => has(ev, x))))
      if (!chain) return null
      const index = (x) => chain.events.findIndex((ev) => has(ev, x))
      return [...texts].sort((p, q) => index(p) - index(q))
    }, shown.map((x) => x.trim()))
    assert.ok(wanted, 'displayed events map to a real chain')
    for (let i = 0; i < wanted.length; i += 1) {
      let current = (await page.locator('ol li[data-tl-id]').locator('[class*="tlText"]').allInnerTexts()).map((x) => x.trim())
      let at = current.indexOf(wanted[i])
      while (at > i) { await page.locator('ol li[data-tl-id]').nth(at).locator('button[data-move$=":up"]').click(); at -= 1 }
      current = null
    }
    await clickButton(page, t.check)
    await clickButton(page, t.next)
  }
  await page.getByText(t.done).first().waitFor({ timeout: 15000 })
  return '4 timelines ordered with the real controls, all checked, session complete'
}

async function adventureRound(page, t) {
  await main(page).locator('a[href*="?story="]').first().waitFor({ timeout: 20000 })
  const stories = await main(page).locator('a[href*="?story="]').count()
  assert.equal(stories, 6, 'all six existing stories are listed')
  await main(page).locator('a[href*="?story=david"]').first().click()
  await page.locator('[data-art-state], svg').first().waitFor({ timeout: 15000 })
  let scenes = 0; let actions = 0
  for (let guard = 0; guard < 40; guard += 1) {
    if (await page.getByText(t.done).first().isVisible().catch(() => false)) break
    const proceed = main(page).locator('button[class*="primary"]')
    if (await proceed.count()) { await proceed.first().click(); scenes += 1; await page.waitForTimeout(300); continue }
    const objects = main(page).locator('button[data-object]:not([disabled])')
    const n = await objects.count()
    for (let k = 0; k < n; k += 1) { await objects.nth(k).click(); actions += 1; await page.waitForTimeout(150); if (await proceed.count()) break }
    if (!n) await page.waitForTimeout(300)
  }
  await page.getByText(t.done).first().waitFor({ timeout: 10000 })
  assert.ok(actions >= 3, `the scenes were played through their own controls (${actions} actions)`)
  return `story played through ${scenes + 1} scenes with ${actions} interactions, completion shown`
}

async function memoryRound(page, t) {
  await main(page).getByRole('button', { name: t.start }).first().waitFor({ state: 'visible', timeout: 20000 })
  const four = main(page).getByRole('button', { name: /^(4 pairs|4 ጥንድ|4)/i }).first()
  if (await four.count()) await four.click()
  await clickButton(page, t.start)
  const grid = main(page).locator('[class*="memoryGrid"] button')
  await grid.first().waitFor({ timeout: 15000 })
  const total = await grid.count()
  const faceDown = async (i) => /face down|የተዘጋ/.test((await grid.nth(i).getAttribute('aria-label')) || '')
  const locked = new Set(); let flips = 0
  outer: for (let x = 0; x < total; x += 1) {
    for (let y = x + 1; y < total; y += 1) {
      if (locked.has(x) || locked.has(y)) continue
      await grid.nth(x).click(); await grid.nth(y).click(); flips += 1
      await page.waitForTimeout(1400)
      if (!(await faceDown(x)) && !(await faceDown(y))) { locked.add(x); locked.add(y); break }
      if (await page.getByText(t.done).first().isVisible().catch(() => false)) break outer
    }
    if (locked.size === total) break
  }
  await page.getByText(t.done).first().waitFor({ timeout: 20000 })
  const shown = await imagesLoaded(page)
  assert.deepEqual(shown.broken, [], 'memory artwork loaded')
  return `${locked.size / 2} of ${total / 2} picture-name pairs found (${flips} attempts), game complete`
}

async function mezmurRound(page, t) {
  await clickButton(page, t.start, { timeout: 25000 })
  const seen = new Set()
  for (let i = 0; i < 6; i += 1) {
    const card = page.locator('[data-fm-mode]').first()
    await card.waitFor({ timeout: 20000 })
    const mode = await card.getAttribute('data-fm-mode'); seen.add(mode)
    if (mode === 'choose') await card.locator('button[class*="choice"]').first().click()
    else if (mode === 'arrange') {
      const tiles = card.locator('button[class*="wordTile"]'); const n = await tiles.count()
      for (let k = 0; k < n; k += 1) await card.locator('button[class*="wordTile"]:not([disabled])').first().click()
      await card.locator('button[class*="primary"]').first().click()
    } else { await card.locator('input').fill('x'); await card.locator('button[type="submit"]').click() }
    await card.locator('[role="status"]').waitFor({ timeout: 10000 })
    await card.getByRole('button', { name: t.next }).click()
  }
  await page.getByText(t.done).first().waitFor({ timeout: 15000 })
  return `6 questions answered across formats [${[...seen].join(', ')}] from live published hymns, round complete`
}

const DRIVER = { quiz: quizRound, picture: pictureRound, history: historyRound, who: whoRound, match: matchRound, timeline: timelineRound, adventure: adventureRound, memory: memoryRound, mezmur: mezmurRound }

// ---------------------------------------------------------------- deterministic checks with a mocked network
const PNG = Buffer.from('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==', 'base64')
async function deterministicChecks(browser) {
  // (a) Start stays disabled, and no misleading "Only N match" line shows, until the full question bank has loaded.
  {
    const context = await browser.newContext({ viewport: { width: 390, height: 844 }, serviceWorkers: 'block' })
    await context.addInitScript(() => { try { localStorage.setItem('tewahedo-daily-locale', 'en') } catch { /* ignore */ } })
    const page = await context.newPage()
    let release
    const gate = new Promise((resolve) => { release = resolve })
    await page.route(/\/rest\/v1\/play_content_items/, async (route) => { await gate; await route.continue() })
    try {
      await page.goto(`${BASE}/play/emoji`, { waitUntil: 'domcontentloaded' })
      const start = main(page).getByRole('button', { name: 'Start round' })
      await start.waitFor({ state: 'visible', timeout: 20000 })
      assert.equal(await start.isDisabled(), true, 'Start is disabled while the bank loads')
      const loadingText = await page.locator('[data-eligible-count]').innerText()
      assert.match(loadingText, /Loading the full question bank/)
      assert.doesNotMatch(loadingText, /Only \d+ match/, 'no misleading short-pool message while loading')
      release()
      await page.waitForFunction(() => { const b = [...document.querySelectorAll('main button')].find((x) => x.textContent === 'Start round'); return b && !b.disabled }, null, { timeout: 20000 })
      await main(page).getByRole('button', { name: 'challenge', exact: true }).click()
      assert.match(await page.locator('[data-eligible-count]').innerText(), /^\d+ questions available/, 'after loading, the real pool size is shown')
      record({ game: 'quiz-setup', viewport: 390, locale: 'en', kind: 'race', ok: true, note: 'Start disabled and "Loading the full question bank…" shown until the bank loads; then the real count' })
    } catch (error) {
      record({ game: 'quiz-setup', viewport: 390, locale: 'en', kind: 'race', ok: false, note: String(error.message).split('\n')[0].slice(0, 200) })
    }
    await context.close()
  }
  // (b) Picture counts are the pictures that can be shown. Media is mocked: three feast images fail, the rest load.
  {
    const context = await browser.newContext({ viewport: { width: 390, height: 844 }, serviceWorkers: 'block' })
    await context.addInitScript(() => { try { localStorage.setItem('tewahedo-daily-locale', 'en') } catch { /* ignore */ } })
    const page = await context.newPage()
    await page.route(/\/storage\/v1\/object\/public\/content-media\//, (route) => (/\/(erget|debre-tabor|tsige-fast)-[0-9a-f]+-/.test(route.request().url())
      ? route.fulfill({ status: 400, contentType: 'application/json', body: '{"statusCode":"404","error":"not_found"}' })
      : route.fulfill({ status: 200, contentType: 'image/png', body: PNG })))
    try {
      await page.goto(`${BASE}/play`, { waitUntil: 'domcontentloaded' })
      await page.waitForFunction(() => document.querySelectorAll('[data-game-card]').length === 12, null, { timeout: 25000 })
      await page.waitForFunction(() => [...document.querySelectorAll('[data-game-content]')].some((el) => /can’t be shown right now/.test(el.textContent || '')), null, { timeout: 25000 })
      const texts = (await page.locator('[data-game-content]').allInnerTexts()).map((text) => text.replace(/\s+/g, ' ').trim())
      const feasts = texts.find((text) => /pictures · 3 more can’t be shown right now/.test(text))
      assert.ok(feasts, `a picture card says how many pictures cannot be shown: ${texts.join(' | ').slice(0, 300)}`)
      assert.match(feasts, /^9 pictures/, 'Church Feast counts the 9 pictures that load, not the 12 catalogued')
      await page.goto(`${BASE}/play/feasts`, { waitUntil: 'domcontentloaded' })
      await page.locator('[data-pictures-skipped]').waitFor({ timeout: 25000 })
      assert.match(await page.locator('[data-pictures-skipped]').innerText(), /^3 of 12 pictures/)
      record({ game: 'picture-counts', viewport: 390, locale: 'en', kind: 'counts', ok: true, note: 'hub says 9 pictures + "3 more can’t be shown right now"; the game says 3 of 12 are skipped' })
    } catch (error) {
      record({ game: 'picture-counts', viewport: 390, locale: 'en', kind: 'counts', ok: false, note: String(error.message).split('\n')[0].slice(0, 220) })
    }
    await context.close()
  }
  // (c) Day and night themes: the theme switches and nothing overflows on the hub, a game setup, a picture game and the review screen.
  for (const [width, height, mobile] of [[390, 844, true], [1440, 900, false]]) {
    const context = await browser.newContext({ viewport: { width, height }, isMobile: mobile, hasTouch: mobile, serviceWorkers: 'block' })
    await context.addInitScript(() => { try { localStorage.setItem('tewahedo-daily-locale', 'en') } catch { /* ignore */ } })
    const page = await context.newPage()
    try {
      const seen = []
      for (const theme of ['day', 'night']) {
        for (const route of ['/play', '/play/match', '/play/feasts', '/play/local-review']) {
          await page.goto(`${BASE}${route}`, { waitUntil: 'domcontentloaded' })
          await main(page).first().waitFor({ timeout: 25000 })
          await page.evaluate((value) => { document.documentElement.setAttribute('data-theme', value) }, theme)
          await page.waitForTimeout(700)
          const state = await page.evaluate(() => ({ theme: document.documentElement.dataset.theme, bg: getComputedStyle(document.body).backgroundColor }))
          assert.equal(state.theme, theme)
          assert.ok(await overflowOk(page), `${theme} ${route} at ${width}px overflows horizontally`)
          seen.push(`${theme}:${state.bg}`)
          if (route === '/play') await page.screenshot({ path: join(SHOTS, `theme-${theme}-${width}-hub.png`) })
        }
      }
      const backgrounds = new Set(seen.map((entry) => entry.split(':')[0] + ':' + entry.split(':')[1]))
      assert.ok([...backgrounds].some((entry) => entry.startsWith('day')) && [...backgrounds].some((entry) => entry.startsWith('night')))
      assert.notEqual(seen.find((entry) => entry.startsWith('day')).slice(4), seen.find((entry) => entry.startsWith('night')).slice(6), 'day and night use different backgrounds')
      record({ game: 'themes', viewport: width, locale: 'en', kind: 'themes', ok: true, note: 'day and night render on the hub, Match, Church Feast and the review screen without overflow' })
    } catch (error) {
      record({ game: 'themes', viewport: width, locale: 'en', kind: 'themes', ok: false, note: String(error.message).split('\n')[0].slice(0, 200) })
    }
    await context.close()
  }
}

// ---------------------------------------------------------------- run
const browser = await chromium.launch()
const consoleErrors = []; const failedRequests = []; const hostedWrites = []
try {
  for (const viewport of VIEWPORTS) {
    for (const locale of ['en', 'am']) {
      const full = viewport.full.includes(locale)
      if (locale === 'am' && !full) continue
      const context = await browser.newContext({ viewport: { width: viewport.w, height: viewport.h }, isMobile: viewport.mobile, hasTouch: viewport.mobile, serviceWorkers: 'block' })
      await context.addInitScript((l) => { try { localStorage.setItem('tewahedo-daily-locale', l) } catch { /* ignore */ } }, locale)
      const page = await context.newPage(); page.setDefaultTimeout(20000)
      page.on('console', (m) => { if (m.type() === 'error') consoleErrors.push(`@${viewport.w}/${locale}: ${m.text().slice(0, 200)}`) })
      page.on('pageerror', (e) => consoleErrors.push(`@${viewport.w}/${locale} pageerror: ${e.message.slice(0, 200)}`))
      page.on('requestfailed', (r) => { const u = r.url(); if (!/favicon|hot-update|\.map$/.test(u)) failedRequests.push(`@${viewport.w}/${locale}: ${u.slice(0, 120)} ${r.failure()?.errorText}`) })
      page.on('request', (r) => { if (/supabase\.co/.test(r.url()) && !['GET', 'HEAD', 'OPTIONS'].includes(r.method())) hostedWrites.push(`${r.method()} ${r.url().slice(0, 100)}`) })
      const tag = `${viewport.w}-${locale}`

      // ---- hub
      try {
        await page.goto(`${BASE}/play`, { waitUntil: 'domcontentloaded' })
        await page.waitForFunction(() => document.querySelectorAll('[data-game-card]').length === 12, null, { timeout: 25000 })
        assert.ok(await page.locator('[data-local-preview-banner]').isVisible(), 'LOCAL PREVIEW banner visible')
        const counts = await page.locator('[data-game-content]').allInnerTexts()
        assert.equal(counts.length, 12)
        assert.ok(counts.every((c) => c.trim().length > 0 && !/^0\b/.test(c.trim())), `every card shows an honest non-zero count: ${counts.join(' | ').slice(0, 200)}`)
        assert.ok(await overflowOk(page), 'no horizontal overflow on the hub')
        const hubImages = await imagesLoaded(page)
        assert.deepEqual(hubImages.broken, [], 'hub images loaded')
        for (const height of await page.locator('[data-game-card]').evaluateAll((els) => els.map((e) => e.getBoundingClientRect().height))) assert.ok(height >= 44)
        await page.screenshot({ path: join(SHOTS, `hub-${tag}.png`), fullPage: false })
        record({ game: 'hub', viewport: viewport.w, locale, kind: 'hub', ok: true, note: `12 cards, counts: ${counts.map((c) => c.replace(/\s+/g, ' ').trim()).join(' | ')}` })
      } catch (error) { record({ game: 'hub', viewport: viewport.w, locale, kind: 'hub', ok: false, note: String(error.message).split('\n')[0] }); await page.screenshot({ path: join(SHOTS, `hub-${tag}-FAIL.png`) }).catch(() => undefined) }

      // ---- games
      for (const game of GAMES.filter((g) => !wantGames || wantGames.has(g.id))) {
        const t = L[locale]
        try {
          await page.goto(`${BASE}${game.route}`, { waitUntil: 'domcontentloaded' })
          await main(page).first().waitFor({ timeout: 20000 })
          if (!full) {
            // smoke at 430 / 768: the game opens with content and a working start control, no overflow
            const startable = main(page).getByRole('button', { name: /Start|Deal|Timeline Challenge|Who Was|ይጀምሩ|ያድሉ/ }).first()
            const storyLink = main(page).locator('a[href*="?story="]').first()
            await (game.kind === 'adventure' ? storyLink : startable).waitFor({ state: 'visible', timeout: 25000 })
            assert.ok(await overflowOk(page), 'no horizontal overflow')
            await page.screenshot({ path: join(SHOTS, `${game.id}-${tag}-setup.png`) })
            record({ game: game.id, viewport: viewport.w, locale, kind: game.kind, ok: true, note: 'opens with content and a start control, no overflow' })
            continue
          }
          if (game.kind === 'history' && locale === 'am') { /* AM history: mode buttons are localized; covered via quiz mode only */ }
          await page.screenshot({ path: join(SHOTS, `${game.id}-${tag}-setup.png`) })
          const driver = DRIVER[game.kind]
          const note = await driver(page, t, locale)
          assert.ok(await overflowOk(page), 'no horizontal overflow at the end of the round')
          await page.screenshot({ path: join(SHOTS, `${game.id}-${tag}-result.png`) })
          // replay: play again must start another round without a reload
          const again = main(page).getByRole('button', { name: t.again }).first()
          let replay = 'n/a'
          if (await again.count()) { await again.click(); await page.waitForTimeout(600); replay = (await main(page).innerText()).length > 50 ? 'replay started' : 'replay empty'; assert.equal(replay, 'replay started') }
          // back navigation
          await page.goBack().catch(() => undefined)
          record({ game: game.id, viewport: viewport.w, locale, kind: game.kind, ok: true, note: `${note}; ${replay}` })
        } catch (error) {
          await page.screenshot({ path: join(SHOTS, `${game.id}-${tag}-FAIL.png`) }).catch(() => undefined)
          const where = String(error.stack).split('\n').find((row) => /test-local-preview-browser\.mjs:\d+/.test(row))?.trim().replace(/^.*\.mjs:/, 'line ').replace(/\)$/, '') ?? 'line ?'
          record({ game: game.id, viewport: viewport.w, locale, kind: game.kind, ok: false, note: `${String(error.message).split('\n')[0].slice(0, 200)} [${where}]` })
        }
      }

      // ---- write guard + local review screen (once, at the first viewport)
      if (viewport === VIEWPORTS[0] && locale === 'en' && !wantGames) {
        try {
          const guard = await page.evaluate(async () => {
            const origin = window.__localPreviewGuard
            const response = await fetch(`${origin}/rest/v1/play_content_items`, { method: 'POST', headers: { 'content-type': 'application/json' }, body: '{}' })
            return { origin, status: response.status, blocked: window.__localPreviewBlocked.length }
          })
          assert.equal(guard.status, 403); assert.ok(guard.blocked >= 1)
          await page.goto(`${BASE}/play/local-review`, { waitUntil: 'domcontentloaded' })
          await page.locator('[data-review-summary]').waitFor({ timeout: 25000 })
          const totalText = await page.locator('[data-review-count]').innerText()
          assert.match(totalText, /^834 of 834/)
          assert.equal(await page.locator('[data-review-only-note]').count(), 1)
          await page.locator('[data-review-tag]').selectOption('source-blocked')
          assert.match(await page.locator('[data-review-count]').innerText(), /^21 of 834/)
          assert.ok(await page.locator('[data-review-row]').first().evaluate((el) => el.textContent.includes('REVIEW ONLY')))
          await page.locator('[data-review-row] summary').first().click()
          assert.ok(await page.locator('[data-review-row] dl').first().isVisible())
          assert.ok(await overflowOk(page), 'no horizontal overflow on the review screen')
          await page.screenshot({ path: join(SHOTS, `local-review-${tag}.png`) })
          record({ game: 'review', viewport: viewport.w, locale, kind: 'review', ok: true, note: 'write guard returned 403 for a hosted POST; review screen lists 834 records, 21 source-blocked, REVIEW ONLY labels' })
        } catch (error) { record({ game: 'review', viewport: viewport.w, locale, kind: 'review', ok: false, note: String(error.message).split('\n')[0].slice(0, 220) }) }
      }
      await context.close()
    }
  }
  if (!wantGames) await deterministicChecks(browser)
} finally {
  await browser.close()
  stopServer()
}

const unexpected = consoleErrors.filter((e) => !/Failed to load resource: the server responded with a status of 403/.test(e))
writeFileSync(join('.local-preview', 'browser-results.json'), JSON.stringify({ results, consoleErrors, failedRequests, hostedWrites }, null, 1))
console.log(`\n${results.filter((r) => r.ok).length}/${results.length} checks passed; screenshots in ${SHOTS}`)
console.log(`hosted write requests observed: ${hostedWrites.length}${hostedWrites.length ? ` -> ${hostedWrites.join('; ')}` : ''}`)
console.log(`console errors (excluding the deliberate guard probe): ${unexpected.length}`); for (const e of unexpected.slice(0, 8)) console.log(`  ${e}`)
const realFailures = failedRequests.filter((e) => !/127\.0\.0\.1:\d+\/.*net::ERR_ABORTED/.test(e)) // Vite module fetches cancelled by navigation are not failures
const brokenArtwork = [...new Set(realFailures.filter((e) => /ERR_BLOCKED_BY_ORB/.test(e)).map((e) => e.replace(/^@[^:]+: /, '').replace(/ net::.*/, '')))]
console.log(`failed requests: ${failedRequests.length} total; ${failedRequests.length - realFailures.length} cancelled dev-module fetches (ignored); ${realFailures.length} real`)
console.log(`distinct hosted artwork URLs that did not return an image: ${brokenArtwork.length}`); for (const e of brokenArtwork) console.log(`  ${e}`)
for (const e of realFailures.filter((x) => !/ERR_BLOCKED_BY_ORB/.test(x)).slice(0, 8)) console.log(`  other: ${e}`)
if (problems.length || hostedWrites.length) process.exit(1)
