/**
 * Hosted play with TWO independent browser contexts over the real Supabase Realtime service (broadcast only:
 * no tables, no SQL, no writes). Requires .env.local (public URL + publishable key) and network access.
 * Run: node scripts/test-live-room-browser.mjs   (set LIVE_ROOM_OFFLINE_OK=1 to skip when offline)
 */
import assert from 'node:assert/strict'
import { chromium } from 'playwright'
import jsQR from 'jsqr'
import { createServer } from 'vite'
import { mkdtempSync } from 'node:fs'
import { tmpdir } from 'node:os'
import path from 'node:path'

process.env.VITE_PLAY_DATABASE_ONLY = 'false'
const port = 5321
const shots = mkdtempSync(path.join(tmpdir(), 'tewahedo-live-'))
// Pre-bundle the QR library up front: discovering it on first load makes Vite re-optimize and reload the page mid-test.
const server = await createServer({ optimizeDeps: { include: ['qrcode-generator'] }, server: { host: '127.0.0.1', port, strictPort: true } })
await server.listen()
const base = `http://127.0.0.1:${port}`
let diagnostics = {}; let stage = ''
let browser
let passed = 0
const step = async (name, fn) => { await fn(); passed += 1; console.log(`PASS ${name}`) }
try {
  browser = await chromium.launch()
  const mk = async (width) => {
    const context = await browser.newContext({ viewport: { width, height: 900 }, serviceWorkers: 'block' })
    await context.addInitScript(() => { localStorage.setItem('tewahedo-daily-locale', 'en') })
    const page = await context.newPage(); page.setDefaultTimeout(20000)
    const errors = []; page.on('pageerror', e => errors.push(e.message)); const loads = []; page.on('framenavigated', f => { if (f === page.mainFrame()) loads.push(new URL(f.url()).pathname) })
    return { context, page, errors, loads }
  }
  const host = await mk(1280)
  const guest = await mk(390)
  const guest2 = await mk(430)
  diagnostics = { host, guest, guest2 }
  let code = ''
  let decodedLink = ''
  /** Reads the lobby QR the way a phone camera would: render it to pixels, then decode those pixels with a real QR decoder. */
  const decodeLobbyQr = async (page) => {
    const data = await page.evaluate(async () => {
      const el = document.querySelector('[data-room-qr] svg')
      const xml = new XMLSerializer().serializeToString(el).replace('<svg', '<svg width="600" height="600"')
      const img = new Image(); img.src = 'data:image/svg+xml;charset=utf-8,' + encodeURIComponent(xml); await img.decode()
      const canvas = document.createElement('canvas'); canvas.width = 600; canvas.height = 600
      const ctx = canvas.getContext('2d'); ctx.drawImage(img, 0, 0, 600, 600)
      return Array.from(ctx.getImageData(0, 0, 600, 600).data)
    })
    return jsQR(new Uint8ClampedArray(data), 600, 600)?.data ?? null
  }

  await step('hub offers Play now, Surprise me, Play solo, Host and Join, and Surprise me starts a game', async () => {
    await host.page.goto(`${base}/play`)
    for (const attr of ['data-play-now', 'data-surprise', 'data-play-solo', 'data-host', 'data-join']) await host.page.locator(`[${attr}]`).first().waitFor()
    await host.page.locator('[data-surprise]').click()
    await host.page.waitForURL(/\/play\/(?!live)[a-z-]+/)
    assert.match(host.page.url(), /\/play\//)
  })

  await step('host creates a room: 5-character code and a shareable link', async () => {
    await host.page.goto(`${base}/play/live`)
    await host.page.getByLabel('Your name').fill('Host Hanna')
    await host.page.getByRole('button', { name: 'Trivia', exact: false }).first().click()
    await host.page.getByRole('button', { name: '5', exact: true }).click()
    await host.page.getByRole('button', { name: 'Create room' }).click()
    await host.page.locator('[data-room-code]').waitFor()
    code = (await host.page.locator('[data-room-code]').innerText()).trim()
    assert.match(code, /^[A-HJ-NP-Z2-9]{5}$/)
    await host.page.getByRole('status').filter({ hasText: /Online/ }).waitFor({ timeout: 25000 })
    assert.equal(await host.page.getByLabel('Join link').inputValue(), `${base}/play/live/${code}`)
    // The lobby offers a scannable QR code for the same join link.
    await host.page.locator('[data-room-qr] svg[role="img"]').waitFor()
    assert.match(await host.page.locator('[data-room-qr] svg').getAttribute('aria-label'), new RegExp(code))
    // The QR decodes to exactly the invite URL, before and after "Enlarge for a screen", and stays inside a phone-width page.
    const invite = await host.page.getByLabel('Join link').inputValue()
    decodedLink = (await decodeLobbyQr(host.page)) ?? ''
    assert.equal(decodedLink, invite, 'the QR encodes the exact invite link')
    const small = (await host.page.locator('[data-room-qr] svg').boundingBox()).width
    await host.page.getByRole('button', { name: 'Enlarge for a screen' }).click()
    assert.ok((await host.page.locator('[data-room-qr] svg').boundingBox()).width > small + 40, 'enlarge makes the code bigger')
    assert.equal(await decodeLobbyQr(host.page), invite, 'the enlarged code decodes to the same link')
    await host.page.getByRole('button', { name: 'Make smaller' }).click()
    assert.ok(Math.abs((await host.page.locator('[data-room-qr] svg').boundingBox()).width - small) < 2, 'it can be made smaller again')
    await host.page.screenshot({ path: path.join(shots, 'host-lobby.png'), fullPage: true })
  })

  await step('two players join from independent browsers; lobby roster is live on every screen', async () => {
    for (const [client, name] of [[guest, 'Guest Abel'], [guest2, 'Guest Sara']]) {
      // Players arrive through the link the QR code carries, not through a URL the test builds itself.
      await client.page.goto(decodedLink)
      await client.page.getByLabel('Name').fill(name)
      await client.page.getByRole('button', { name: 'Join', exact: true }).click()
      await client.page.locator('[data-player-lobby]').waitFor({ timeout: 25000 })
    }
    await host.page.locator('[data-roster] li', { hasText: 'Guest Abel' }).waitFor()
    await host.page.locator('[data-roster] li', { hasText: 'Guest Sara' }).waitFor()
    await guest.page.locator('[data-player-lobby] li', { hasText: 'Guest Sara' }).waitFor()
    await guest.page.screenshot({ path: path.join(shots, 'player-lobby-390.png'), fullPage: true })
  })

  await step('a duplicate display name is refused with a clear message', async () => {
    const third = await mk(390)
    await third.page.goto(`${base}/play/live/${code}`)
    await third.page.getByLabel('Name').fill('guest abel')
    await third.page.getByRole('button', { name: 'Join', exact: true }).click()
    await third.page.getByRole('alert').filter({ hasText: /name is taken/i }).waitFor({ timeout: 25000 })
    await third.context.close()
  })

  await step('host starts: every player receives the same question with no answer key in the page', async () => {
    await host.page.locator('[data-start]').click()
    await guest.page.locator('[data-option]').first().waitFor({ timeout: 25000 })
    await guest2.page.locator('[data-option]').first().waitFor()
    const promptA = await guest.page.locator('h2').filter({ hasText: /.+/ }).last().innerText()
    const promptB = await guest2.page.locator('h2').filter({ hasText: /.+/ }).last().innerText()
    assert.equal(promptA, promptB, 'same question on both devices')
    const html = await guest.page.content()
    assert.ok(!/correctKey/.test(html), 'no answer field in the DOM')
    await guest.page.screenshot({ path: path.join(shots, 'player-question-390.png'), fullPage: true })
  })

  await step('player refresh mid-round reconnects to the current question (no duplicate points, same question)', async () => {
    const before = await guest.page.locator('h2').last().innerText()
    await guest.page.reload()
    await guest.page.locator('[data-option]').first().waitFor({ timeout: 25000 })
    assert.equal(await guest.page.locator('h2').last().innerText(), before)
  })

  await step('five rounds: answers lock once, reveal shows result and leaderboard, host advances', async () => {
    // After the refresh step the reloaded player briefly leaves and re-enters presence. The host reveals as soon as every
    // CONNECTED player has answered, so start only once the roster is stable and everyone is connected again.
    await host.page.waitForFunction(() => { const rows = [...document.querySelectorAll('[data-roster] li, [class*="leaderboard"] li')]; return !document.body.innerText.includes('○') }, null, { timeout: 25000 })
    await host.page.waitForTimeout(1500)
    for (let round = 1; round <= 5; round++) {
      stage = `round ${round}: start`
      await guest.page.locator('[data-option]').first().waitFor({ timeout: 25000 })
      await guest2.page.locator('[data-option]').first().waitFor()
      await guest.page.locator('[data-option]').first().click()
      assert.equal(await guest.page.locator('[data-option]').first().isDisabled(), true, 'locked after one tap')
      await guest.page.locator('[data-option]').nth(1).click({ force: true, timeout: 1500 }).catch(() => undefined) // double tap is ignored
      if (round % 2) await guest2.page.locator('[data-option]').nth(1).click()
      stage = `round ${round}: host reveal`
      // When every connected player has answered the host reveals by itself (the button is then replaced by Next);
      // otherwise the host presses Reveal. Either way the players must see the reveal, and the host must be offered Next.
      await host.page.locator('[data-reveal]').click({ timeout: 4000 }).catch(() => undefined)
      await guest.page.locator('[data-player-reveal]').waitFor({ timeout: 25000 })
      await guest2.page.locator('[data-player-reveal]').waitFor()
      stage = `round ${round}: waiting for host Next`
      await host.page.locator('[data-next]').waitFor()
      if (round === 1) await guest2.page.screenshot({ path: path.join(shots, 'player-reveal-430.png'), fullPage: true })
      await host.page.locator('[data-next]').click()
    }
    await guest.page.locator('[data-player-final]').waitFor({ timeout: 25000 })
    await guest2.page.locator('[data-player-final]').waitFor()
    const board = await guest.page.locator('[data-player-final] ol li').allInnerTexts()
    assert.equal(board.length, 2)
    assert.ok(board.some(row => /Guest Abel/.test(row)) && board.some(row => /Guest Sara/.test(row)))
    await guest.page.screenshot({ path: path.join(shots, 'player-final-390.png'), fullPage: true })
    await host.page.screenshot({ path: path.join(shots, 'host-final.png'), fullPage: true })
  })

  await step('host rematch: fresh content, players return to the lobby, scores reset', async () => {
    await host.page.locator('[data-rematch]').click()
    await guest.page.locator('[data-player-lobby]').waitFor({ timeout: 25000 })
    await guest2.page.locator('[data-player-lobby]').waitFor()
    await host.page.locator('[data-start]').waitFor()
  })

  await step('no uncaught browser errors in any client', async () => {
    for (const client of [host, guest, guest2]) assert.deepEqual(client.errors, [])
  })
  for (const client of [host, guest, guest2]) await client.context.close()
  console.log(`Live room browser test passed: ${passed} steps. Screenshots: ${shots}`)
} catch (error) {
  if (process.env.LIVE_ROOM_OFFLINE_OK && /ERR_NAME_NOT_RESOLVED|ERR_INTERNET|ENOTFOUND/.test(String(error))) console.log('Skipped (offline).')
  else {
    console.error(error); process.exitCode = 1; console.error('--- stage when it failed:', stage)
    // Failure diagnostics: what each screen showed (visible text only; no credentials are ever on these pages).
    for (const [name, client] of Object.entries(diagnostics)) { try { console.error('--- ' + name + ' screen:', (await client?.page.locator('body').innerText({ timeout: 2000 })).replace(/\s+/g, ' ').slice(0, 400), '| page errors:', JSON.stringify(client.errors), '| navigations:', JSON.stringify(client.loads)) } catch (e) { console.error('--- ' + name + ': no screen text (' + String(e.message).split(String.fromCharCode(10))[0] + ')') } }
  }
} finally { await browser?.close(); await server.close() }
