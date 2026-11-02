// Bible Timeline feedback/review regression: static safeguards + isolated browser run on an owned dev server.
// Usage: node scripts/test-bible-timeline-feedback.mjs   (set BT_PORT to change the port, default 5198)
import { spawn } from 'node:child_process'
import { readFileSync } from 'node:fs'
import { chromium } from 'playwright'

const PORT = Number(process.env.BT_PORT || 5198)
const BASE = `http://127.0.0.1:${PORT}`
const failures = []
let checks = 0
const check = (ok, label) => { checks++; if (!ok) { failures.push(label); console.log(`  FAIL ${label}`) } }
const info = []

// ---------- static safeguards ----------
const src = readFileSync('src/components/play/BibleTimelineGame.tsx', 'utf8')
check((src.match(/role="status"/g) || []).length === 1, 'exactly one role="status" in BibleTimelineGame')
check(!/autoFocus/.test(src), 'no autoFocus (explicit ref focus instead)')
check((src.match(/recordPlayCompletion\(/g) || []).length === 1 && (src.match(/syncPlayCompletion\(/g) || []).length === 1, 'completion recording unchanged (one call each)')
check(/gradeOrder\(r, order\)/.test(src) && /isCorrectOrder\(round, order\)/.test(src), 'grading calls preserved')
check(/markSeen\(GAME, rounds\.map/.test(src) && /resetSeen\(GAME\)/.test(src), 'seen-round history preserved')

// ---------- dev server ----------
const server = spawn(process.execPath, ['node_modules/vite/bin/vite.js', '--port', String(PORT), '--strictPort', '--host', '127.0.0.1'], { stdio: 'ignore' })
const stopServer = () => { try { server.kill() } catch { /* already gone */ } }
process.on('exit', stopServer)
for (let i = 0; i < 120; i++) {
  try { if ((await fetch(BASE)).ok) break } catch { /* not up yet */ }
  await new Promise((r) => setTimeout(r, 500))
  if (i === 119) { console.log('FAIL dev server did not start'); stopServer(); process.exit(1) }
}

const T = {
  en: { start: 'Start', check: 'Check order', correctPos: 'Correct position', wrongPos: 'Wrong position', correct: 'Correct', xp: 'XP earned', badge: 'First Steps', badges: 'Badges earned', yours: 'Your order', right: 'Correct order', again: 'Fresh rounds', change: 'Change level', explore: 'Explore games', hint: 'Reveal a hint', notQuite: 'Not quite' },
  am: { start: 'ይጀምሩ', check: 'አረጋግጥ', correctPos: 'ትክክለኛ ቦታ', wrongPos: 'የተሳሳተ ቦታ', correct: 'ትክክል', xp: 'የተገኘ XP', badge: 'የመጀመሪያ እርምጃ', badges: 'ያገኟቸው ምልክቶች', yours: 'የእርስዎ ቅደም ተከተል', right: 'ትክክለኛው ቅደም ተከተል', again: 'አዲስ ዙሮች', change: 'ደረጃ ይቀይሩ', explore: 'ጨዋታዎችን ያስሱ', hint: 'ፍንጭ ይግለጡ', notQuite: 'ገና አይደለም' },
}
const ROUNDS = 4
const focusId = (page) => page.evaluate(() => document.activeElement?.id || document.activeElement?.tagName)
/** Focus moves in a passive effect after the click, so poll briefly instead of reading it once. */
const focusIs = (page, id) => page.waitForFunction((x) => document.activeElement?.id === x, id, { timeout: 2000 }).then(() => true, () => false)
const noOverflow = (page) => page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 1)
const cardTexts = (page) => page.locator('ol li[data-tl-id]').evaluateAll((els) => els.map((e) => e.querySelector('[class*="tlText"]')?.textContent?.trim() || ''))

/** Reorder the cards with the real up buttons so they match the canonical chronology (learned from the app's own data module). */
async function arrangeCorrectly(page) {
  const shown = await cardTexts(page)
  const wanted = await page.evaluate(async (texts) => {
    const mod = await import('/src/lib/play/bibleTimeline.ts')
    const has = (ev, t) => ev.title.en === t || ev.title.am === t
    const chain = mod.TIMELINE_CHAINS.find((c) => texts.every((t) => c.events.some((ev) => has(ev, t))))
    if (!chain) return null
    const idx = (t) => chain.events.findIndex((ev) => has(ev, t))
    return [...texts].sort((a, b) => idx(a) - idx(b))
  }, shown)
  if (!wanted) throw new Error('could not map displayed events to a chain')
  for (let i = 0; i < wanted.length; i++) {
    const cur = await cardTexts(page)
    let at = cur.indexOf(wanted[i])
    while (at > i) {
      await page.locator('ol li[data-tl-id]').nth(at).locator('button[data-move$=":up"]').click()
      at--
    }
  }
}

/** Start from the canonical order, then swap the first pair to guarantee a wrong result. */
async function arrangeIncorrectly(page) {
  await arrangeCorrectly(page)
  await page.locator('ol li[data-tl-id]').nth(1).locator('button[data-move$=":up"]').click()
}

async function run(browser, { locale, width, height, pattern, reduced, replay, hint }) {
  const tag = `${locale}/${width}/${pattern.map((p) => (p ? 'R' : 'W')).join('')}${reduced ? '/reduced' : ''}`
  const t = T[locale]
  const ctx = await browser.newContext({ viewport: { width, height }, reducedMotion: reduced ? 'reduce' : 'no-preference' })
  await ctx.addInitScript((l) => { try { localStorage.setItem('tewahedo-daily-locale', l) } catch { /* ignore */ } }, locale)
  const page = await ctx.newPage()
  const errors = []
  page.on('pageerror', (e) => errors.push(String(e)))
  try {
    await page.goto(`${BASE}/play/bible-timeline`, { waitUntil: 'domcontentloaded' })
    await page.getByRole('button', { name: t.start, exact: true }).waitFor({ timeout: 20000 })
    await page.getByRole('button', { name: t.start, exact: true }).click()
    let expectedRight = 0

    for (let q = 0; q < ROUNDS; q++) {
      await page.locator('#tl-q').waitFor()
      check(await focusIs(page, 'tl-q'), `${tag} r${q + 1}: question heading focused`)
      check((await page.locator('ol[class*="dots"]').count()) === 0, `${tag} r${q + 1}: redundant dots removed`)
      const hudStrong = await page.locator('[class*="hud"]').first().locator('strong').count()
      check(hudStrong === 1, `${tag} r${q + 1}: round count shown once, in GameProgress (${hudStrong} strong)`)
      check(await page.locator('[role="progressbar"]').count() === 1, `${tag} r${q + 1}: GameProgress preserved`)
      const valueText = await page.locator('[role="progressbar"]').getAttribute('aria-valuetext')
      check(valueText === (locale === 'am' ? `ዙር ${q + 1} ከ ${ROUNDS}` : `Round ${q + 1} of ${ROUNDS}`), `${tag} r${q + 1}: progress valuetext (${valueText})`)
      check((await page.locator('[role="progressbar"]').getAttribute('aria-valuenow')) === String(q + 1), `${tag} r${q + 1}: progress is position-based`)
      check((await page.locator('[role="progressbar"]').locator('xpath=ancestor-or-self::*[@aria-live]').count()) === 0, `${tag} r${q + 1}: progress bar is not a live region`)
      check(await noOverflow(page), `${tag} r${q + 1}: no overflow`)

      if (q === 0) {
        // keyboard control still works and announces the new position
        const firstDown = page.locator('ol li[data-tl-id]').first().locator('button[data-move$=":down"]')
        await firstDown.focus(); await page.keyboard.press('Enter')
        const live0 = ((await page.locator('p[role="status"][class*="srOnly"]').textContent()) || '').trim()
        check(live0.length > 0, `${tag}: keyboard move announces position`)
        const downs = page.locator('button[data-move]')
        const box = await downs.first().boundingBox()
        check(box && box.height >= 43.5 && box.width >= 43.5, `${tag}: move buttons >=44px (${box?.width}x${box?.height})`)
        if (hint) {
          await page.getByRole('button', { name: t.hint }).click()
          const regions = await page.locator('[role="status"]').count()
          info.push(`${tag}: live regions with hint revealed = ${regions} (GameHint adds its own; unchanged by scope)`)
        }
      }

      const wantRight = pattern[q]
      if (wantRight) await arrangeCorrectly(page)
      else await arrangeIncorrectly(page)
      if (wantRight) expectedRight++
      const n = (await cardTexts(page)).length
      const liveRegion = page.locator('p[role="status"][class*="srOnly"]')
      await page.evaluate(() => {
        const region = document.querySelector('p[role="status"][class*="srOnly"]')
        window.__tlStatusChanges = []
        window.__tlStatusObserver?.disconnect()
        window.__tlStatusObserver = new MutationObserver(() => {
          window.__tlStatusChanges.push((region?.textContent || '').trim())
        })
        if (region) window.__tlStatusObserver.observe(region, { childList: true, characterData: true, subtree: true })
      })
      const changesBeforeCheck = await page.evaluate(() => window.__tlStatusChanges.length)
      await page.getByRole('button', { name: t.check, exact: true }).click()

      const live = ((await liveRegion.textContent()) || '').trim()
      const changesAfterCheck = await page.evaluate(() => window.__tlStatusChanges.slice())
      check(live.length > 0, `${tag} r${q + 1}: live region announces result`)
      check(changesAfterCheck.length > changesBeforeCheck && changesAfterCheck.at(-1) === live, `${tag} r${q + 1}: Check updates the live region (${changesAfterCheck.at(-1) || 'no mutation'})`)
      const goodBadges = await page.locator('ol li[data-tl-id]').getByText(t.correctPos).count()
      const badBadges = await page.locator('ol li[data-tl-id]').getByText(t.wrongPos).count()
      check(goodBadges + badBadges === n, `${tag} r${q + 1}: every card has a position badge (${goodBadges}+${badBadges} of ${n})`)
      if (wantRight) {
        check(badBadges === 0 && goodBadges === n, `${tag} r${q + 1}: correct order -> all ✓`)
        check(locale === 'am' ? live.includes('ትክክል') : live.startsWith('Correct'), `${tag} r${q + 1}: correct announcement (${live})`)
      } else {
        check(badBadges >= 2, `${tag} r${q + 1}: wrong order -> at least two ✕ (${badBadges})`)
        check(live.includes(String(goodBadges)) && live.includes(String(n)), `${tag} r${q + 1}: announcement states ${goodBadges} of ${n} (${live})`)
        if (locale === 'en') check(live.startsWith(t.notQuite), `${tag} r${q + 1}: wrong announcement starts "Not quite"`)
      }
      const next = page.locator('button[class*="primary"]').last()
      check(await next.evaluate((e) => e === document.activeElement), `${tag} r${q + 1}: Next focused after Check`)
      check((await page.locator('[class*="tlReview"] a[href]').count()) === n, `${tag} r${q + 1}: source link per event after Check`)
      if (locale === 'am') check((await page.locator('[class*="tlReview"] [lang="en"]').count()) >= n, `${tag} r${q + 1}: English notes tagged lang=en`)
      if (reduced) {
        const anim = await page.locator('[class*="enter"]').first().evaluate((e) => getComputedStyle(e).animationName)
        check(anim === 'none', `${tag} r${q + 1}: no feedback animation under reduced motion (${anim})`)
      }
      check(await noOverflow(page), `${tag} r${q + 1}: no overflow after Check`)
      await next.click()
      if (q < pattern.length - 1) {
        const nextAnnouncement = ((await liveRegion.textContent()) || '').trim()
        check(nextAnnouncement === '', `${tag} r${q + 1}: Next clears stale result announcement`)
      } else {
        check(await page.locator('p[role="status"][class*="srOnly"]').count() === 0, `${tag}: completion removes the round status region`)
      }
    }

    await page.locator('#tl-results').waitFor()
    check(await focusIs(page, 'tl-results'), `${tag}: results heading focused`)
    const body = (await page.locator('#tl-results').locator('xpath=..').textContent()) || ''
    check(body.includes(t.correct) && body.includes(t.xp), `${tag}: Correct and XP earned labels`)
    check(body.includes(`${expectedRight}/${ROUNDS}`), `${tag}: score ${expectedRight}/${ROUNDS} shown`)
    check(body.includes(t.badges) && body.includes(t.badge), `${tag}: earned badge named on fresh profile`)
    const reviewItems = page.locator('ol[class*="rounds"] > li')
    check((await reviewItems.count()) === ROUNDS, `${tag}: review entry per round`)
    check((await page.locator('h4', { hasText: t.yours }).count()) === ROUNDS && (await page.locator('h4', { hasText: t.right }).count()) === ROUNDS, `${tag}: your-order and correct-order columns per round`)
    check((await page.locator('ol[class*="rounds"] a[href^="/"]').count()) >= ROUNDS * 3, `${tag}: review keeps Bible source links`)
    check((await page.locator('ol[class*="rounds"] ol').first().locator('xpath=..').locator('xpath=..').locator('[class*="badge"]').count()) > 0, `${tag}: review shows per-event markers`)
    check((await page.getByRole('link', { name: t.explore }).count()) === 1, `${tag}: Explore games link`)
    check((await page.getByRole('button', { name: t.change }).count()) === 1, `${tag}: Change level`)
    for (const loc of [page.getByRole('button', { name: t.again }), page.getByRole('button', { name: t.change }), page.getByRole('link', { name: t.explore })]) {
      const box = await loc.boundingBox()
      check(box && box.height >= 43.5, `${tag}: results action >=44px (${box?.height})`)
    }
    check(await noOverflow(page), `${tag}: no overflow on results`)
    if (replay) {
      await page.getByRole('button', { name: t.again }).click()
      await page.locator('#tl-q').waitFor()
      check(await focusIs(page, 'tl-q'), `${tag}: replay focuses question heading`)
      check((await page.locator('#tl-results').count()) === 0, `${tag}: replay leaves results`)
      check(((await page.locator('p[role="status"][class*="srOnly"]').textContent()) || '').trim() === '', `${tag}: replay clears stale announcement`)
    }
    check(errors.length === 0, `${tag}: no page errors (${errors[0] || ''})`)
  } catch (e) {
    check(false, `${tag}: threw ${String(e).split('\n')[0]}`)
  } finally {
    await ctx.close()
  }
}

const browser = await chromium.launch()
try {
  for (const locale of ['en', 'am']) {
    for (const [width, height] of [[390, 844], [1440, 900]]) {
      await run(browser, { locale, width, height, pattern: [true, false, true, false], reduced: false, replay: true, hint: width === 390 })
    }
  }
  await run(browser, { locale: 'en', width: 390, height: 844, pattern: [true, true, true, true], reduced: false, replay: false })
  await run(browser, { locale: 'en', width: 390, height: 844, pattern: [true, false, true, false], reduced: true, replay: false })
  await run(browser, { locale: 'am', width: 1440, height: 900, pattern: [false, true, false, true], reduced: true, replay: false })
  await run(browser, { locale: 'en', width: 390, height: 844, pattern: [false, false, false, false], reduced: false, replay: false })
  await run(browser, { locale: 'en', width: 390, height: 844, pattern: [true, true, true, true], reduced: false, replay: false })
} finally {
  await browser.close()
  stopServer()
}
info.forEach((l) => console.log('INFO ' + l))
console.log(`${checks - failures.length}/${checks} checks passed`)
if (failures.length) { console.log('FAILED:\n' + failures.join('\n')); process.exit(1) }
process.exit(0)
