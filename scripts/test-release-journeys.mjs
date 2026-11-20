/** Release smoke: key public journeys at 375/430/768/1440px, English/Amharic, day/night. Run against a dev server: BASE_URL=http://127.0.0.1:5173 node scripts/test-release-journeys.mjs */
import { chromium } from 'playwright'
const base = process.env.BASE_URL ?? 'http://127.0.0.1:5173'
const b = await chromium.launch()
const out = []
const note = (ok, name, extra = '') => { out.push(ok); console.log(ok ? 'ok  ' : 'FAIL', name, extra) }
for (const [w, h] of [[375, 812], [430, 932], [768, 1024], [1440, 900]]) {
  for (const [locale, theme] of [['en', 'day'], ['am', 'night']]) {
    const ctx = await b.newContext({ viewport: { width: w, height: h }, serviceWorkers: 'block' })
    await ctx.addInitScript(([l, t]) => { localStorage.setItem('tewahedo-daily-locale', l); localStorage.setItem('tewahedo-theme', t) }, [locale, theme])
    const p = await ctx.newPage()
    const errors = []
    p.on('pageerror', e => errors.push(e.message))
    p.on('console', m => { if (m.type() === 'error' && !/Failed to load resource.*(403|404)|favicon/.test(m.text())) errors.push(m.text().slice(0, 140)) })
    const bad = []
    p.on('response', r => { if (r.request().resourceType() === 'image' && r.status() >= 400) bad.push(`${r.status()} ${r.url().slice(0, 100)}`) })
    const tag = `${w}px ${locale}/${theme}`
    const visit = async (path, wait) => { await p.goto(base + path, { waitUntil: 'networkidle' }); if (wait) await p.waitForSelector(wait, { timeout: 20000 }) }
    const overflow = () => p.evaluate(() => document.documentElement.scrollWidth > innerWidth + 1)
    const brokenImgs = () => p.evaluate(() => [...document.images].filter(i => i.complete && i.naturalWidth === 0 && i.currentSrc).map(i => i.currentSrc.slice(-70)))
    try {
      await visit('/')
      note(!(await overflow()), `${tag} home no overflow`)
      await visit('/practice', 'main'); await p.waitForTimeout(2500)
      note(!(await overflow()), `${tag} mezmur library no overflow`)
      note((await brokenImgs()).length === 0, `${tag} mezmur library images load`, JSON.stringify(await brokenImgs()))
      await visit('/prayers')
      const prayersText = (await p.locator('main').first().innerText()).toLowerCase()
      note(!/synaxarium|ስንክሳር|liturgy of the ethiopian church|ሥርዓተ ቅዳሴ/.test(prayersText), `${tag} prayers page no longer lists Synaxarium/Liturgy`)
      note(!(await overflow()), `${tag} prayers no overflow`)
      await visit('/church-library')
      await p.waitForTimeout(1500)
      const lib = (await p.locator('main').first().innerText()).toLowerCase()
      note(/synaxarium|ስንክሳር/.test(lib) && /liturgy|ቅዳሴ/.test(lib), `${tag} church library lists Synaxarium and Liturgy`)
      note(!(await overflow()), `${tag} church library no overflow`)
      note((await brokenImgs()).length === 0, `${tag} church library images load`, JSON.stringify(await brokenImgs()))
      for (const path of ['/prayers/synaxarium', '/prayers/divine-liturgy']) {
        await visit(path); await p.waitForTimeout(800)
        const t = (await p.locator('main').first().innerText()).trim()
        note(t.length > 80 && !(await overflow()), `${tag} deep link ${path} renders`, t.slice(0, 60).replace(/\s+/g, ' '))
      }
      await visit('/play', '[data-game-card]')
      note((await p.locator('[data-game-card]').count()) === 12 && !(await overflow()), `${tag} play hub 12 cards`)
      for (const g of ['trivia', 'emoji', 'finish-the-verse', 'who-am-i', 'match', 'history', 'bible-timeline', 'feasts', 'saints', 'icon-memory', 'finish-the-mezmur', 'adventures']) {
        await visit(`/play/${g}`); await p.waitForTimeout(500)
        const txt = (await p.locator('main').first().innerText()).replace(/\s+/g, ' ')
        const failedState = /being prepared|could not be loaded|Retry/.test(txt)
        if (failedState || (await overflow())) note(false, `${tag} /play/${g}`, failedState ? 'shows preparing/retry' : 'overflow')
      }
      note(true, `${tag} all 12 game routes open without a preparing/Retry state`)
    } catch (e) { note(false, `${tag} journey`, String(e.message).split('\n')[0]) }
    note(bad.length === 0, `${tag} no failed image requests`, bad.slice(0, 3).join(' | '))
    note(errors.length === 0, `${tag} no console/page errors`, errors.slice(0, 2).join(' | '))
    await ctx.close()
  }
}
await b.close()
console.log(`\n${out.filter(Boolean).length}/${out.length} checks passed`)
process.exit(out.every(Boolean) ? 0 : 1)
