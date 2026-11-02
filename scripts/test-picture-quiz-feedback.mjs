// Picture Quiz feedback/results regression: static safeguards + isolated browser run on an owned dev server.
// Usage: node scripts/test-picture-quiz-feedback.mjs   (set PQ_PORT to change the port, default 5199)
import { spawn, execSync } from 'node:child_process'
import { readFileSync } from 'node:fs'
import { chromium } from 'playwright'

const PORT = Number(process.env.PQ_PORT || 5199)
const BASE = `http://127.0.0.1:${PORT}`
const failures = []
let checks = 0
const check = (ok, label) => { checks++; if (!ok) { failures.push(label); console.log(`  FAIL ${label}`) } }

// ---------- static safeguards ----------
const quiz = readFileSync('src/components/play/PictureQuizGame.tsx', 'utf8')
const panel = readFileSync('src/components/play/PlayProgressPanel.tsx', 'utf8')
check((quiz.match(/role="status"/g) || []).length === 1, 'exactly one role="status" live region in PictureQuizGame')
check(/export const BADGES/.test(panel), 'BADGES is exported')
check(!/PictureQuiz|PlayGamePage/.test(panel.split('\n').filter((l) => l.startsWith('import')).join('\n')), 'PlayProgressPanel does not import a game (no circular import)')
check((quiz.match(/recordPlayCompletion\(/g) || []).length === 1 && (quiz.match(/syncPlayCompletion\(/g) || []).length === 1, 'completion recording unchanged (one call each)')
check(/handlePlayImageError/.test(quiz), 'image fallback handler preserved')
check(/TILES - opened \+ 1/.test(quiz) && /mode === 'reveal' \? TILES - opened \+ 1 : 1/.test(quiz), 'point formula preserved')

// ---------- dev server ----------
const server = spawn('npx', ['vite', '--port', String(PORT), '--strictPort', '--host', '127.0.0.1'], { shell: true, stdio: 'ignore' })
const stopServer = () => {
  try { if (process.platform === 'win32') execSync(`taskkill /pid ${server.pid} /T /F`, { stdio: 'ignore' }); else server.kill('SIGTERM') } catch { /* already gone */ }
}
process.on('exit', stopServer)
for (let i = 0; i < 120; i++) {
  try { if ((await fetch(BASE)).ok) break } catch { /* not up yet */ }
  await new Promise((r) => setTimeout(r, 500))
  if (i === 119) { console.log('FAIL dev server did not start'); stopServer(); process.exit(1) }
}

const T = {
  en: { look: 'Look & name', reveal: 'Reveal the picture', start: 'Start playing', more: 'Reveal more', correct: 'Correct', xp: 'XP earned', points: 'Points', badge: 'First Steps', yours: 'Your answer', right: 'Correct answer', again: 'Play again', change: 'Change round', explore: 'Explore games', badges: 'Badges earned' },
  am: { look: 'ይመልከቱና ይለዩ', reveal: 'ሥዕሉን ይግለጡ', start: 'ጨዋታውን ይጀምሩ', more: 'ተጨማሪ ይግለጡ', correct: 'ትክክል', xp: 'የተገኘ XP', points: 'ነጥብ', badge: 'የመጀመሪያ እርምጃ', yours: 'የእርስዎ መልስ', right: 'ትክክለኛ መልስ', again: 'እንደገና ይጫወቱ', change: 'ሌላ ዙር', explore: 'ጨዋታዎችን ያስሱ', badges: 'ያገኟቸው ምልክቶች' },
}
const LENGTH = 5
const seen = { right: 0, wrong: 0 }
const focusId = (page) => page.evaluate(() => document.activeElement?.id || document.activeElement?.tagName)
const noOverflow = (page) => page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 1)

async function run(browser, { game, locale, width, height, mode, reduced, replay }) {
  const tag = `${game}/${locale}/${width}/${mode}${reduced ? '/reduced' : ''}`
  const t = T[locale]
  const ctx = await browser.newContext({ viewport: { width, height }, reducedMotion: reduced ? 'reduce' : 'no-preference' })
  await ctx.addInitScript((l) => { try { localStorage.setItem('tewahedo-daily-locale', l) } catch { /* ignore */ } }, locale)
  const page = await ctx.newPage()
  const errors = []
  page.on('pageerror', (e) => errors.push(String(e)))
  try {
    await page.goto(`${BASE}/play/${game}`, { waitUntil: 'domcontentloaded' })
    await page.getByRole('button', { name: new RegExp(t.start) }).waitFor({ timeout: 20000 })
    await page.locator('[aria-pressed]', { hasText: mode === 'reveal' ? t.reveal : t.look }).first().click()
    await page.locator('[aria-pressed]', { hasText: new RegExp(`^${LENGTH}$`) }).click()
    await page.getByRole('button', { name: new RegExp(t.start) }).click()
    check(await noOverflow(page), `${tag}: no overflow on first question`)

    for (let q = 0; q < LENGTH; q++) {
      await page.locator('#pq-q').waitFor()
      check((await focusId(page)) === 'pq-q', `${tag} q${q + 1}: question heading focused`)
      if (mode === 'reveal' && q === 0) {
        const more = page.getByRole('button', { name: t.more })
        const box = await more.boundingBox()
        check(box && box.height >= 43.5, `${tag}: Reveal more is >=44px (${box?.height})`)
        await more.click()
      }
      const choices = page.locator('button[class*="choice"]:not([class*="choiceKey"])')
      check((await choices.count()) === 4, `${tag} q${q + 1}: four choices`)
      const pick = (q * 3 + 1) % 4
      await choices.nth(pick).click()
      const status = page.locator('[role="status"]')
      check((await status.count()) === 1, `${tag} q${q + 1}: single live region (${await status.count()})`)
      const live = (await status.first().textContent())?.trim() || ''
      check(live.length > 0, `${tag} q${q + 1}: live region announces result`)
      const rightBadges = await page.locator('button >> text=' + t.right).count()
      const wrongBadges = await page.locator('button >> text=' + t.yours).count()
      check(rightBadges === 1, `${tag} q${q + 1}: one correct-answer badge (${rightBadges})`)
      const wasWrong = wrongBadges === 1
      if (wasWrong) seen.wrong++; else seen.right++
      check(wrongBadges <= 1, `${tag} q${q + 1}: at most one your-answer badge`)
      const minOpacity = await choices.evaluateAll((els) => Math.min(...els.map((e) => Number(getComputedStyle(e).opacity))))
      check(minOpacity >= 0.85, `${tag} q${q + 1}: unselected choices readable (opacity ${minOpacity})`)
      const next = page.locator('button[class*="primary"]').last()
      check((await next.evaluate((e) => e === document.activeElement)), `${tag} q${q + 1}: Next focused after answer`)
      const fb = await page.locator('[class*="feedback"]').first().textContent()
      if (locale === 'am' && !/[ሀ-፿]{6,}/.test(fb || '')) check(/\(በእንግሊዝኛ ብቻ\)/.test(fb || ''), `${tag} q${q + 1}: English-only explanation flagged in Amharic`)
      if (reduced) {
        const anim = await page.locator('[class*="feedbackEnter"]').first().evaluate((e) => getComputedStyle(e).animationName)
        check(anim === 'none', `${tag} q${q + 1}: no feedback animation under reduced motion (${anim})`)
      }
      check(await noOverflow(page), `${tag} q${q + 1}: no overflow after answer`)
      await next.click()
    }

    await page.locator('#pq-results').waitFor()
    check((await focusId(page)) === 'pq-results', `${tag}: results heading focused`)
    const body = (await page.locator('#pq-results').locator('xpath=..').textContent()) || ''
    check(body.includes(t.correct) && body.includes(t.xp), `${tag}: Correct and XP labels shown`)
    if (mode === 'reveal') check(body.includes(t.points), `${tag}: Points label shown`)
    check(body.includes(t.badges) && body.includes(t.badge), `${tag}: earned badge named on fresh profile`)
    check((await page.locator('ol > li img').count()) >= LENGTH, `${tag}: review has an entry per question`)
    check((await page.locator('ol > li a[href]').count()) >= LENGTH, `${tag}: review keeps source links`)
    check((body.match(new RegExp(t.right + ':', 'g')) || []).length >= LENGTH, `${tag}: review shows correct answer lines`)
    check(await page.getByRole('link', { name: t.explore }).count() === 1, `${tag}: Explore games link`)
    check(await page.getByRole('button', { name: t.change }).count() === 1, `${tag}: Change round`)
    for (const loc of [page.getByRole('button', { name: t.again }), page.getByRole('button', { name: t.change }), page.getByRole('link', { name: t.explore })]) {
      const box = await loc.boundingBox()
      check(box && box.height >= 43.5, `${tag}: results action >=44px (${box?.height})`)
    }
    check(await noOverflow(page), `${tag}: no overflow on results`)
    if (replay) {
      await page.getByRole('button', { name: t.again }).click()
      await page.locator('#pq-q').waitFor()
      check((await focusId(page)) === 'pq-q', `${tag}: replay focuses question heading`)
      check((await page.locator('#pq-results').count()) === 0, `${tag}: replay leaves results`)
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
  for (const game of ['feasts', 'saints']) {
    for (const locale of ['en', 'am']) {
      for (const [width, height] of [[390, 844], [1440, 900]]) {
        for (const mode of ['look', 'reveal']) {
          await run(browser, { game, locale, width, height, mode, reduced: false, replay: mode === 'look' })
        }
      }
    }
  }
  await run(browser, { game: 'feasts', locale: 'en', width: 390, height: 844, mode: 'reveal', reduced: true, replay: false })
  await run(browser, { game: 'saints', locale: 'am', width: 390, height: 844, mode: 'look', reduced: true, replay: false })
  check(seen.right > 0 && seen.wrong > 0, `both outcomes exercised (right ${seen.right}, wrong ${seen.wrong})`)
} finally {
  await browser.close()
  stopServer()
}
console.log(`${checks - failures.length}/${checks} checks passed`)
if (failures.length) { console.log('FAILED:\n' + failures.join('\n')); process.exit(1) }
