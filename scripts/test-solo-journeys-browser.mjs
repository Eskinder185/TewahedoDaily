/**
 * Solo player journeys in a real browser: full quiz rounds to results, fresh sessions on Play Again, refresh-resume,
 * keyboard play, and every game route at 375 / 390 / 430 px and desktop. Uses the real dev app (public Supabase reads only).
 * Run: node scripts/test-solo-journeys-browser.mjs
 */
import assert from 'node:assert/strict'
import { chromium } from 'playwright'
import { createServer } from 'vite'
import { mkdtempSync } from 'node:fs'
import { tmpdir } from 'node:os'
import path from 'node:path'

process.env.VITE_PLAY_DATABASE_ONLY = 'false'
const port = 5322
const shots = mkdtempSync(path.join(tmpdir(), 'tewahedo-solo-'))
const server = await createServer({ server: { host: '127.0.0.1', port, strictPort: true } })
await server.listen()
const base = `http://127.0.0.1:${port}`
const ROUTES = ['trivia', 'emoji', 'finish-the-verse', 'finish-the-mezmur', 'history', 'who-am-i', 'match', 'feasts', 'saints', 'bible-timeline', 'icon-memory', 'adventures']
let browser
let passed = 0
const step = async (name, fn) => { await fn(); passed += 1; console.log(`PASS ${name}`) }
const prompts = []
try {
  browser = await chromium.launch()
  const context = await browser.newContext({ viewport: { width: 390, height: 900 }, serviceWorkers: 'block' })
  await context.addInitScript(() => { if (!localStorage.getItem('tewahedo-daily-locale')) localStorage.setItem('tewahedo-daily-locale', 'en') })
  const page = await context.newPage(); page.setDefaultTimeout(20000)
  const errors = []; page.on('pageerror', e => errors.push(e.message))
  const optionButtons = () => page.locator('[class*=options] button')
  // Identity of the question on screen: prompt + emoji clue + the SET of options (their order is shuffled on purpose).
  const questionText = () => page.evaluate(() => {
    const prompt = document.querySelector('article h2')?.textContent?.trim() || ''
    const emoji = document.querySelector('article [class*="emoji"]')?.textContent?.trim() || ''
    const options = [...document.querySelectorAll('[class*="options"] button')].map(b => (b.textContent || '').replace(/\s+/g, ' ').trim()).sort().join('|')
    return `${prompt}#${emoji}#${options}`
  })

  async function playRound(game, { shot, again = false } = {}) {
    if (!again) await page.getByRole('button', { name: /Start round/ }).click() // Play Again starts a fresh round at once
    const asked = []
    for (let i = 0; i < 5; i++) {
      await optionButtons().first().waitFor()
      asked.push(await questionText())
      await optionButtons().nth(i % 4).click()
      assert.equal(await optionButtons().first().isDisabled(), true, 'answers lock after one tap (no double points)')
      await page.getByRole('button', { name: /^(Next|See results)$/ }).click()
    }
    await page.getByRole('heading', { name: /Well played/ }).waitFor()
    assert.match(await page.locator('[class*=scoreRow]').innerText(), /\d+\/5/)
    if (shot) await page.screenshot({ path: path.join(shots, shot) })
    return asked
  }

  for (const game of (process.env.SOLO_GAMES || 'trivia,emoji,finish-the-verse').split(',')) {
    await step(`${game}: full 5-question round to results, then Play Again draws a different set`, async () => {
      await page.goto(`${base}/play/${game}`)
      const first = await playRound(game, { shot: `${game}-results-390.png` })
      await page.getByRole('button', { name: /Play again/ }).click()
      const second = await playRound(game, { again: true })
      assert.equal(new Set(first).size, 5, 'no repeats inside a session')
      assert.equal(new Set(second).size, 5)
      const overlap = second.filter(q => first.includes(q)).length
      assert.ok(overlap < 5, `${game}: consecutive sessions must not be the same set (overlap ${overlap}/5)`)
      prompts.push([game, first[0], second[0]])
    })
  }

  await step('an unfinished session resumes after a refresh at the same question', async () => {
    await page.goto(`${base}/play/trivia`)
    await page.getByRole('button', { name: /Start round/ }).click()
    for (let i = 0; i < 2; i++) { await optionButtons().first().waitFor(); await optionButtons().first().click(); await page.getByRole('button', { name: /^Next$/ }).click() }
    await optionButtons().first().waitFor()
    const third = await questionText()
    await page.reload()
    await optionButtons().first().waitFor()
    assert.equal(await questionText(), third, 'same question after refresh')
    await page.getByText('3/5', { exact: true }).first().waitFor()
    await page.goto(`${base}/play`)
    await page.locator('[data-resume]').waitFor()
    assert.match(await page.locator('[data-resume]').innerText(), /Continue/)
  })

  await step('keyboard only: focus an answer, press Enter, read the explanation, continue', async () => {
    await page.goto(`${base}/play/emoji`)
    await page.getByRole('button', { name: /Start round/ }).click()
    await optionButtons().first().waitFor()
    await page.keyboard.press('Tab')
    let focused = ''
    for (let i = 0; i < 12 && !focused; i++) {
      focused = await page.evaluate(() => (document.activeElement?.closest('[class*=options]') ? 'option' : ''))
      if (!focused) await page.keyboard.press('Tab')
    }
    assert.equal(focused, 'option', 'an answer button is reachable by Tab')
    await page.keyboard.press('Enter')
    await page.getByRole('button', { name: /^(Next|See results)$/ }).waitFor()
    assert.ok(await page.getByText(/Correct!|Not quite/).first().isVisible(), 'feedback uses words, not only colour')
  })

  for (const width of [375, 390, 430, 1280]) {
    await step(`${width}px: hub and all 12 game routes render without horizontal overflow or page errors`, async () => {
      await page.setViewportSize({ width, height: 900 })
      const check = async (url) => {
        await page.goto(`${base}${url}`)
        await page.locator('h1').first().waitFor()
        const overflow = await page.evaluate(() => document.documentElement.scrollWidth - window.innerWidth)
        assert.ok(overflow <= 1, `${url} overflows by ${overflow}px`)
      }
      await check('/play')
      if (width === 390 || width === 1280) await page.screenshot({ path: path.join(shots, `hub-${width}.png`), fullPage: false })
      await check('/play/live')
      for (const route of ROUTES) await check(`/play/${route}`)
    })
  }

  await step('Amharic: the live-room entry and a quiz setup render Amharic copy', async () => {
    await page.addInitScript(() => localStorage.setItem('tewahedo-daily-locale', 'am'))
    await page.goto(`${base}/play/live`)
    await page.getByRole('heading', { name: 'ከጓደኞች ጋር ይጫወቱ' }).waitFor()
    // Finish the Verse has no unfinished session here (trivia and emoji do, by design), so its setup screen shows.
    await page.goto(`${base}/play/finish-the-verse`)
    await page.getByRole('button', { name: 'ይጀምሩ' }).waitFor()
  })

  await step('no uncaught browser errors', async () => { assert.deepEqual(errors, []) })
  await context.close()
  console.log(`Solo journey test passed: ${passed} steps. Screenshots: ${shots}`)
  console.log(JSON.stringify(prompts))
} catch (error) { console.error(error); process.exitCode = 1; try { for (const pg of browser.contexts().flatMap(c => c.pages())) await pg.screenshot({ path: path.join(shots, 'failure.png'), fullPage: true }); console.error('failure screenshot:', shots) } catch { /* ignore */ } } finally { await browser?.close(); await server.close() }
