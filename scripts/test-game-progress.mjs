// GameProgress: existing callers must render exactly as before; valueText and trailing are opt-in.
// The BASELINE strings are the markup produced before valueText/trailing existed (class suffixes normalised).
// Renders through Vite SSR; no network, no env, no Supabase. Run: node scripts/test-game-progress.mjs
import assert from 'node:assert/strict'
import { createElement } from 'react'
import { renderToStaticMarkup } from 'react-dom/server'
import react from '@vitejs/plugin-react'
import { createServer } from 'vite'

const vite = await createServer({ configFile: false, envDir: false, plugins: [react()], appType: 'custom', logLevel: 'silent', server: { middlewareMode: true, hmr: false } })
let passed = 0
const t = (name, fn) => { fn(); passed++; console.log(`✓ ${name}`) }
// Dev-SSR class names look like _gameProgress_vxusv_359 (hash and CSS line number); keep only the readable name.
const norm = (h) => h.replace(/_([A-Za-z]+)_[a-z0-9]+_\d+/g, '$1')
const bar = (label, current, total, text, pct) => `<div class="gameProgress"><div class="gameProgressMeta"><span>${label}</span><strong>${current}/${total}</strong></div><div class="gameProgressTrack" role="progressbar" aria-label="${label}" aria-valuetext="${text ?? `${current} / ${total}`}" aria-valuemin="0" aria-valuemax="${total}" aria-valuenow="${Math.min(current, total)}"><span style="width:${pct}%"></span></div></div>`

try {
  const { GameProgress } = await vite.ssrLoadModule('/src/components/play/GameProgress.tsx')
  const render = (props) => norm(renderToStaticMarkup(createElement(GameProgress, props)))

  t('existing callers: English with label (Timeline style)', () => assert.equal(render({ locale: 'en', current: 2, total: 5, label: 'Round' }), bar('Round', 2, 5, null, 40)))
  t('existing callers: Amharic label (Icon Memory style)', () => assert.equal(render({ locale: 'am', current: 0, total: 6, label: 'የተገኙ ጥንዶች' }), bar('የተገኙ ጥንዶች', 0, 6, null, 0)))
  t('existing callers: default English label, current above total is clamped', () => assert.equal(render({ locale: 'en', current: 9, total: 4 }), bar('Game progress', 9, 4, '9 / 4', 100)))
  t('existing callers: default Amharic label', () => assert.equal(render({ locale: 'am', current: 1, total: 3 }), bar('የጨዋታ እድገት', 1, 3, null, 33)))

  t('valueText replaces aria-valuetext only', () => {
    const html = render({ locale: 'en', current: 2, total: 5, label: 'Question', valueText: 'Question 2 of 5' })
    assert.equal(html, bar('Question', 2, 5, 'Question 2 of 5', 40))
    assert.match(html, /aria-label="Question"/)
    assert.doesNotMatch(html, /aria-valuetext="2 \/ 5"/)
  })

  t('trailing slot renders beside the count, outside the progressbar, and is not live', () => {
    const html = render({ locale: 'en', current: 3, total: 8, label: 'Picture', trailing: createElement('span', { className: 'chip' }, '12s') })
    assert.match(html, /<span class="gameProgressEnd"><strong>3\/8<\/strong><span class="gameProgressTrailing"><span class="chip">12s<\/span><\/span><\/span>/)
    const barHtml = html.slice(html.indexOf('role="progressbar"'))
    assert.ok(!barHtml.includes('12s'), 'trailing content must not be inside the progressbar')
    assert.doesNotMatch(html, /aria-live|role="status"|role="alert"/)
    assert.equal(html.split('role="progressbar"').length, 2)
    assert.match(html, /aria-valuetext="3 \/ 8"/)
  })

  t('no trailing wrapper when the slot is empty or falsy', () => {
    for (const trailing of [undefined, null, false, '']) assert.doesNotMatch(render({ locale: 'en', current: 1, total: 2, trailing }), /gameProgressEnd|gameProgressTrailing/)
  })

  console.log(`\n${passed} passed`)
} finally {
  await vite.close()
}
