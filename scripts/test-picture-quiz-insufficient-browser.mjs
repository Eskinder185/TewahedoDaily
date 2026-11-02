// Browser regression: Picture Quiz with synthetic pools of 3 and 4 pictures, in real Chromium. No Supabase, no network.
// Run: node scripts/test-picture-quiz-insufficient-browser.mjs
import assert from 'node:assert/strict'
import react from '@vitejs/plugin-react'
import { chromium } from 'playwright'
import { createServer } from 'vite'

const PORT = 5196
const vite = await createServer({
  configFile: false,
  envDir: false,
  plugins: [react()],
  logLevel: 'error',
  // Own dep cache (not shared with the app's dev server) and a single React copy.
  cacheDir: new URL('../node_modules/.vite-picture-quiz-browser', import.meta.url).pathname.replace(/^\/([A-Za-z]:)/, '$1'),
  resolve: { dedupe: ['react', 'react-dom'] },
  optimizeDeps: { force: true, include: ['react', 'react-dom/client', 'react-router-dom'] },
  server: { port: PORT, strictPort: true, hmr: false },
  define: {
    'import.meta.env.VITE_SUPABASE_URL': JSON.stringify('https://placeholder.invalid'),
    'import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY': JSON.stringify('placeholder'),
  },
})
await vite.listen()

let passed = 0
const t = async (name, fn) => { await fn(); passed++; console.log(`✓ ${name}`) }
const browser = await chromium.launch()
try {
  const open = async (locale, count) => {
    const page = await browser.newPage({ viewport: { width: 390, height: 844 } })
    const errors = []
    page.on('pageerror', (e) => errors.push(e.message))
    await page.goto(`http://localhost:${PORT}/scripts/fixtures/picture-quiz-browser.html?locale=${locale}&count=${count}`)
    await page.locator('#root h1, #root h2').first().waitFor({ timeout: 15000 })
    return { page, errors }
  }
  const text = (page) => page.locator('#root').innerText()

  await t('English, 3 pictures: insufficient state, Explore games link, no Start playing', async () => {
    const { page, errors } = await open('en', 3)
    const body = await text(page)
    assert.match(body, /Not enough pictures yet/)
    assert.match(body, /at least four approved pictures/)
    assert.equal(await page.getByRole('link', { name: 'Explore games' }).getAttribute('href'), '/play')
    assert.equal(await page.getByText(/Start playing/).count(), 0)
    assert.equal(await page.getByText(/Choose your round/).count(), 0)
    assert.deepEqual(errors, [])
    await page.close()
  })
  await t('Amharic, 3 pictures: insufficient state, Explore games link, no start button', async () => {
    const { page, errors } = await open('am', 3)
    const body = await text(page)
    assert.match(body, /በቂ የተረጋገጡ ሥዕሎች ገና የሉም/)
    assert.match(body, /ቢያንስ አራት የተረጋገጡ ሥዕሎች/)
    assert.equal(await page.getByRole('link', { name: 'ጨዋታዎችን ያስሱ' }).getAttribute('href'), '/play')
    assert.equal(await page.getByText(/ጨዋታውን ይጀምሩ/).count(), 0)
    assert.equal(await page.getByText(/ዙርዎን ይምረጡ/).count(), 0)
    assert.deepEqual(errors, [])
    await page.close()
  })
  await t('English, 4 pictures: normal setup with Start playing', async () => {
    const { page, errors } = await open('en', 4)
    const body = await text(page)
    assert.match(body, /Choose your round/)
    assert.equal(await page.getByRole('button', { name: /Start playing/ }).count(), 1)
    assert.doesNotMatch(body, /Not enough pictures yet/)
    assert.deepEqual(errors, [])
    await page.close()
  })
  await t('Amharic, 4 pictures: normal setup', async () => {
    const { page, errors } = await open('am', 4)
    const body = await text(page)
    assert.match(body, /ዙርዎን ይምረጡ/)
    assert.equal(await page.getByRole('button', { name: /ጨዋታውን ይጀምሩ/ }).count(), 1)
    assert.doesNotMatch(body, /በቂ የተረጋገጡ ሥዕሎች ገና የሉም/)
    assert.deepEqual(errors, [])
    await page.close()
  })
  console.log(`\n${passed} passed`)
} finally {
  await browser.close()
  await vite.close()
}
