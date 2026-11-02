// Deterministic regression: Picture Quiz must not start a round when fewer than four usable pictures exist.
// Renders the real component through Vite SSR with hand-made pools. Needs no network, no .env and no Supabase:
// placeholder env values are injected and nothing in this test performs a request.
// Run: node scripts/test-picture-quiz-insufficient.mjs
import assert from 'node:assert/strict'
import { createElement } from 'react'
import { renderToStaticMarkup } from 'react-dom/server'
import { MemoryRouter } from 'react-router-dom'
import react from '@vitejs/plugin-react'
import { createServer } from 'vite'

const vite = await createServer({
  configFile: false,
  envDir: false,
  plugins: [react()],
  appType: 'custom',
  logLevel: 'silent',
  server: { middlewareMode: true, hmr: false },
  define: {
    'import.meta.env.VITE_SUPABASE_URL': JSON.stringify('https://placeholder.invalid'),
    'import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY': JSON.stringify('placeholder'),
  },
})

let passed = 0
const t = (name, fn) => { fn(); passed++; console.log(`✓ ${name}`) }

try {
  const { PictureQuizGame } = await vite.ssrLoadModule('/src/components/play/PictureQuizGame.tsx')
  const { AuthContext } = await vite.ssrLoadModule('/src/lib/auth/useAuth.ts')
  // A signed-out visitor; no Supabase client or session is involved.
  const signedOut = { session: null, user: null, profile: null, role: null, loading: false, error: null, isAuthenticated: false, isStaff: false }
  const image = (n) => ({
    id: `pic-${n}`, kind: 'feast', src: `/images/test-${n}.webp`, fallbackSrc: '', width: 800, height: 600,
    answer: { en: `Feast ${n}`, am: `በዓል ${n}` }, alt: `Feast ${n}`,
    explanation: { en: 'Test explanation text for a picture.' }, description: 'Artwork for a Church feast.',
    source: { label: 'TewahedoDaily Calendar — test', route: '/calendar', kind: 'calendar' },
  })
  const config = (count) => ({ game: 'feasts', pool: Array.from({ length: count }, (_, i) => image(i + 1)), prompt: { en: 'Which feast?', am: 'የትኛው በዓል?' }, noun: { en: 'feast', am: 'በዓል' } })
  const render = (locale, count) => renderToStaticMarkup(createElement(AuthContext.Provider, { value: signedOut }, createElement(MemoryRouter, null, createElement(PictureQuizGame, { locale, config: config(count) }))))

  for (const count of [0, 1, 3]) {
    t(`English, ${count} pictures: insufficient state, no way to start a round`, () => {
      const html = render('en', count)
      assert.match(html, /Not enough pictures yet/)
      assert.match(html, /at least four approved pictures/)
      assert.match(html, /href="\/play"[^>]*>Explore games</)
      assert.doesNotMatch(html, /Start playing/)
      assert.doesNotMatch(html, /Choose your round/)
    })
    t(`Amharic, ${count} pictures: insufficient state, no way to start a round`, () => {
      const html = render('am', count)
      assert.match(html, /በቂ የተረጋገጡ ሥዕሎች ገና የሉም/)
      assert.match(html, /ቢያንስ አራት የተረጋገጡ ሥዕሎች/)
      assert.match(html, /href="\/play"[^>]*>ጨዋታዎችን ያስሱ</)
      assert.doesNotMatch(html, /ጨዋታውን ይጀምሩ/)
      assert.doesNotMatch(html, /ዙርዎን ይምረጡ/)
    })
  }

  t('four pictures is enough: normal setup is shown (control)', () => {
    const en = render('en', 4)
    assert.match(en, /Choose your round/)
    assert.match(en, /Start playing/)
    assert.doesNotMatch(en, /Not enough pictures yet/)
    const am = render('am', 4)
    assert.match(am, /ጨዋታውን ይጀምሩ/)
    assert.doesNotMatch(am, /በቂ የተረጋገጡ ሥዕሎች ገና የሉም/)
  })

  console.log(`\n${passed} passed`)
} finally {
  await vite.close()
}
