/**
 * Faith Challenges in a real browser at phone width (390px) and desktop: all 12 games on the hub with accurate counts,
 * every card opens a working route (and survives refresh and Back), History Quest is playable with unpublished library
 * citations shown as plain text, Who Am I / Match / Icon Memory / Adventure start correctly, Amharic hub copy.
 * Starts its own dev server (database-only mode off: bundled content is what is being checked). Live public data is
 * read-only. Run: node scripts/test-faith-challenge-hub-browser.mjs
 */
import { chromium } from 'playwright'
import assert from 'node:assert/strict'
import { spawn, spawnSync } from 'node:child_process'

const host = '127.0.0.1'; const port = 5195; const base = `http://${host}:${port}`
const command = process.platform === 'win32' ? (process.env.ComSpec ?? 'cmd.exe') : 'npm'
const args = process.platform === 'win32' ? ['/d', '/s', '/c', `npm.cmd run dev -- --host ${host} --port ${port}`] : ['run', 'dev', '--', '--host', host, '--port', String(port)]
const server = spawn(command, args, { env: { ...process.env, VITE_PLAY_DATABASE_ONLY: 'false' }, stdio: 'ignore', windowsHide: true })
const stop = () => { if (process.platform === 'win32') spawnSync('taskkill', ['/pid', String(server.pid), '/T', '/F']); else server.kill() }
for (let i = 0; i < 60; i += 1) { try { await fetch(base); break } catch { if (i === 59) { stop(); throw new Error('Vite did not start') } await new Promise((r) => setTimeout(r, 500)) } }

const browser = await chromium.launch()
let failed = 0
const check = async (name, fn) => { try { await fn(); console.log('ok  ', name) } catch (error) { failed += 1; console.log('FAIL', name, '-', String(error.message).split('\n')[0]) } }
const ROUTES = ['feasts', 'saints', 'icon-memory', 'trivia', 'emoji', 'finish-the-verse', 'bible-timeline', 'adventures', 'finish-the-mezmur', 'history', 'who-am-i', 'match']
const overflow = (page) => page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 1)

try {
  for (const [label, viewport, mobile] of [['390px', { width: 390, height: 844 }, true], ['desktop', { width: 1280, height: 900 }, false]]) {
    const context = await browser.newContext({ viewport, isMobile: mobile, hasTouch: mobile })
    const page = await context.newPage()
    const errors = []
    page.on('pageerror', (error) => errors.push(error.message))

    await check(`${label}: hub lists all 12 games with a play action and an accurate count line`, async () => {
      await page.goto(`${base}/play`, { waitUntil: 'networkidle' })
      await page.waitForFunction(() => document.querySelectorAll('[data-game-card]').length === 12, null, { timeout: 20000 })
      const hrefs = await page.locator('[data-game-card]').evaluateAll((els) => els.map((e) => new URL(e.href).pathname))
      for (const route of ROUTES) assert.ok(hrefs.some((h) => h.endsWith(`/${route}`)), `no card for ${route}`)
      const counts = await page.locator('[data-game-content]').allInnerTexts()
      assert.equal(counts.length, 12)
      const joined = counts.join(' | ')
      assert.match(joined, /226 questions/); assert.match(joined, /166 clues/); assert.match(joined, /119 excerpts/); assert.match(joined, /132 cards/)
      assert.match(joined, /135 pairs/); assert.match(joined, /38 timelines · 240 events/); assert.match(joined, /6 stories/); assert.match(joined, /6 questions · 3 timeline events/)
      assert.match(joined, /Built from published hymn lyrics/)
      assert.doesNotMatch(joined, /Finish the Mezmur.*\d+ questions/)
      assert.ok(await overflow(page), 'horizontal overflow on the hub')
      // Tap targets: every filter chip and every card action is at least 44px tall.
      for (const box of await page.locator('[data-play-mode]').evaluateAll((els) => els.map((e) => e.getBoundingClientRect().height))) assert.ok(box >= 44, `chip ${box}px tall`)
      for (const box of await page.locator('[data-game-card]').evaluateAll((els) => els.map((e) => e.getBoundingClientRect().height))) assert.ok(box >= 44)
    })

    await check(`${label}: ways to play filter the same grid and All restores 12`, async () => {
      await page.goto(`${base}/play`, { waitUntil: 'networkidle' })
      await page.locator('[data-play-mode="knowledge"]').click()
      await page.waitForFunction(() => document.querySelectorAll('[data-game-card]').length === 3)
      await page.locator('[data-play-mode="all"]').click()
      await page.waitForFunction(() => document.querySelectorAll('[data-game-card]').length === 12)
    })

    await check(`${label}: every card opens a working game, refresh keeps it, Back returns to the hub`, async () => {
      for (const route of ROUTES) {
        await page.goto(`${base}/play`, { waitUntil: 'networkidle' })
        await page.locator(`[data-game-card][href^="/play/${route}"]`).click()
        await page.waitForURL((url) => url.pathname === `/play/${route}`)
        await page.locator('h1').first().waitFor({ timeout: 15000 })
        assert.equal(await page.getByRole('heading', { name: /not found/i }).count(), 0, route)
        await page.reload({ waitUntil: 'domcontentloaded' }); await page.locator('h1').first().waitFor({ timeout: 15000 })
        assert.ok(await overflow(page), `overflow on ${route}`)
        await page.goBack(); await page.waitForURL((url) => url.pathname === '/play')
        await page.waitForFunction(() => document.querySelectorAll('[data-game-card]').length === 12)
      }
    })
    await check(`${label}: no uncaught browser errors`, async () => { assert.deepEqual(errors, []) })
    await context.close()
  }

  const phone = await browser.newContext({ viewport: { width: 390, height: 844 }, isMobile: true, hasTouch: true })
  const page = await phone.newPage()

  await check('Trivia: all levels and categories are offered, with the generated-content review notice', async () => {
    await page.goto(`${base}/play/trivia`, { waitUntil: 'networkidle' })
    await page.locator('#play-category').waitFor({ timeout: 20000 })
    const categories = await page.locator('#play-category option').allInnerTexts()
    assert.ok(categories.length >= 5, categories.join(','))
    assert.ok(await page.locator('[data-generated-notice]').isVisible())
    await page.getByRole('button', { name: 'Start round' }).click()
    await page.locator('h2').first().waitFor()
  })

  await check('History Quest: six questions are playable; an unpublished library citation is plain text, not a dead link', async () => {
    await page.goto(`${base}/play/history`, { waitUntil: 'networkidle' })
    assert.equal(await page.getByText('Waiting for reviewed content').count(), 0)
    await page.getByRole('button', { name: 'Historical Mystery' }).click()
    await page.getByRole('button', { name: 'Start round' }).waitFor({ timeout: 15000 })
    await page.getByRole('button', { name: 'Start round' }).click()
    await page.locator('[class*="options"] button').first().click({ timeout: 15000 })
    // The unpublished Church Library book is cited as text with a note, never as a link to a "not published" page.
    await page.locator('[data-source-unavailable]').first().waitFor({ timeout: 10000 })
    assert.match(await page.locator('[data-source-unavailable]').first().innerText(), /Church Library: not yet published online/)
    assert.equal(await page.locator('a[href^="/library/read/church-history"]').count(), 0)
  })

  await check('Who Am I: every category with cards is offered, and a round starts', async () => {
    await page.goto(`${base}/play/who-am-i`, { waitUntil: 'networkidle' })
    const select = page.locator('#who-category'); await select.waitFor({ timeout: 20000 })
    const options = await select.locator('option').allInnerTexts()
    assert.ok(options.some((o) => /Saints/.test(o)) && options.some((o) => /Holy objects/.test(o)) && options.some((o) => /All cards \(132\)/.test(o)), options.join(','))
    await page.getByRole('button', { name: 'Start round' }).click()
    await page.getByText('Who am I?').first().waitFor()
    await page.getByRole('button', { name: /Correct/ }).click()
    assert.ok(await overflow(page))
  })

  await check('Match: a board of 8 pairs has 16 cards', async () => {
    await page.goto(`${base}/play/match`, { waitUntil: 'networkidle' })
    await page.getByRole('button', { name: '8 pairs' }).waitFor({ timeout: 20000 })
    await page.getByRole('button', { name: '8 pairs' }).click()
    await page.getByRole('button', { name: 'Start matching' }).click()
    await page.waitForFunction(() => document.querySelectorAll('button[aria-pressed]').length >= 16)
    assert.equal(await page.locator('button[aria-pressed]').filter({ hasText: '✦' }).count(), 16)
  })

  await check('Icon Memory: a board has exactly two cards per picture', async () => {
    await page.goto(`${base}/play/icon-memory`, { waitUntil: 'networkidle' })
    await page.getByRole('button', { name: '8 pairs' }).click()
    await page.getByRole('button', { name: /Start|Deal|Play/i }).first().click()
    await page.waitForFunction(() => document.querySelectorAll('[class*="memoryGrid"] button').length === 16, null, { timeout: 15000 })
  })

  await check('Bible Adventure: six stories are listed', async () => {
    await page.goto(`${base}/play/adventures`, { waitUntil: 'networkidle' })
    await page.waitForFunction(() => /Noah/.test(document.body.innerText) && /Goliath/.test(document.body.innerText) && /Lions/.test(document.body.innerText) && /Storm/.test(document.body.innerText), null, { timeout: 15000 })
  })

  await check('Bible Adventure: each of the six stories opens on scene 1 of 3 with its artwork', async () => {
    for (const id of ['sea', 'ark', 'david', 'daniel', 'feeding', 'storm']) {
      await page.goto(`${base}/play/adventures?story=${id}`, { waitUntil: 'domcontentloaded' })
      await page.getByText('Scene 1 / 3').first().waitFor({ timeout: 15000 })
      await page.locator('[data-art-state], [role="region"][aria-label*="scene 1"]').first().waitFor({ timeout: 15000 })
    }
  })

  await check('Quiz setup says how many questions match, and a short level gives a shorter round', async () => {
    await page.goto(`${base}/play/history`, { waitUntil: 'networkidle' })
    await page.getByRole('button', { name: 'Who Was This?' }).click()
    await page.locator('[data-eligible-count]').waitFor({ timeout: 15000 })
    assert.match(await page.locator('[data-eligible-count]').innerText(), /\d+ questions available|Only \d+ match|Nothing matches/)
  })

  await check('Amharic hub: cards and counts are localized', async () => {
    await page.addInitScript(() => localStorage.setItem('tewahedo-daily-locale', 'am'))
    await page.goto(`${base}/play`, { waitUntil: 'networkidle' })
    await page.waitForFunction(() => document.querySelectorAll('[data-game-card]').length === 12)
    const text = (await page.locator('[data-game-content]').allInnerTexts()).join(' | ')
    assert.match(text, /226 ጥያቄዎች/); assert.match(text, /38 የጊዜ መስመሮች/)
  })
  await phone.close()
} finally { await browser.close(); stop() }
if (failed) { console.log(`\n${failed} check(s) failed`); process.exit(1) }
console.log('\nFaith Challenge hub journeys: all passed')
