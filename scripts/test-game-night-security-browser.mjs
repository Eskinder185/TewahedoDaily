/** Mocked API/UI integration. All backend data stays in memory; no live writes. */
import assert from 'node:assert/strict'
import { chromium } from 'playwright'
import { createServer } from 'vite'

process.env.VITE_SUPABASE_URL = 'https://game-security-test.supabase.co'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_fixture_only'
const server = await createServer({ server: { host: '127.0.0.1', port: 4187, strictPort: true } })
await server.listen()
let browser
try {
  browser = await chromium.launch()
  const page = await browser.newPage()
  const errors = []
  page.on('pageerror', e => errors.push(e.message))
  const roomId = 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'
  const participantId = 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb'
  const user = { id: '11111111-1111-1111-1111-111111111111', email: 'player@example.invalid', aud: 'authenticated', role: 'authenticated', app_metadata: {}, user_metadata: {} }
  const token = [Buffer.from('{"alg":"HS256","typ":"JWT"}').toString('base64url'), Buffer.from(JSON.stringify({ sub: user.id, exp: Math.floor(Date.now() / 1000) + 3600, role: 'authenticated' })).toString('base64url'), 'fixture'].join('.')
  await page.addInitScript(({ token, user }) => localStorage.setItem('sb-game-security-test-auth-token', JSON.stringify({ access_token: token, refresh_token: 'fixture', expires_at: Math.floor(Date.now() / 1000) + 3600, user })), { token, user })
  let round = 1; let finished = false; let joinRejected = true; let rewardFails = true; let claims = 0; let legacyCalls = 0
  const roomState = () => ({ room_id: roomId, state: finished ? 'finished' : 'playing', role: 'player', settings: { category: 'Fixture', difficulty: 'beginner', question_count: 5 },
    participants: [{ id: participantId, display_name: 'Player', score: 0 }],
    round: { id: `round-${round}`, status: finished ? 'revealed' : 'open', position: round,
      question: { prompt: { en: `Question ${round}` }, options: ['A', 'B', 'C', 'D'].map(key => ({ key, text: { en: `Option ${key}` } })) } } })
  await page.route('https://game-security-test.supabase.co/**', async route => {
    const path = new URL(route.request().url()).pathname
    let data = []; let status = 200
    if (path === '/auth/v1/user') data = user
    else if (path === '/rest/v1/profiles') data = { id: user.id, role: 'user' }
    else if (path.endsWith('/join_play_room')) data = joinRejected ? { error: 'room_unavailable' } : { room_id: roomId, participant_id: participantId, join_token: 'fixture-token' }
    else if (path.endsWith('/get_play_room_state')) data = roomState()
    else if (path.endsWith('/submit_play_room_answer')) data = { accepted: true }
    else if (path.endsWith('/claim_verified_play_room_reward')) {
      claims++
      assert.deepEqual(route.request().postDataJSON(), { p_room_id: roomId, p_participant_id: participantId })
      if (rewardFails) { status = 403; data = { message: 'Fixture denial', code: '42501' } }
      else data = { activity_id: `game-night:${roomId}`, awarded: false, xp_earned: 0, xp_total: 850 }
    } else if (path.endsWith('/record_play_completion')) { legacyCalls++; status = 403; data = { code: '42501' } }
    await route.fulfill({ status, contentType: 'application/json', body: JSON.stringify(data) })
  })
  await page.goto('http://127.0.0.1:4187/play/game-night')
  await page.getByRole('button', { name: /Join with a code/ }).click()
  await page.getByLabel('Room code').fill('ABCDEF')
  await page.getByLabel('Display name').fill('Player')
  await page.getByRole('button', { name: 'Join', exact: true }).click()
  await page.getByRole('alert').filter({ hasText: 'not found or expired' }).waitFor()
  assert.equal(await page.evaluate(() => sessionStorage.getItem('tewahedo-play-room-session')), null)
  joinRejected = false
  await page.getByRole('button', { name: 'Join', exact: true }).click()
  await page.getByRole('heading', { name: 'Question 1', exact: true }).waitFor()
  await page.getByRole('button', { name: 'Option A', exact: true }).click()
  await page.getByRole('button', { name: 'Option A', exact: true, pressed: true }).waitFor()
  assert.equal(await page.getByRole('button', { name: 'Option B', exact: true }).isDisabled(), true)
  round = 2
  await page.getByRole('heading', { name: 'Question 2', exact: true }).waitFor()
  assert.equal(await page.getByRole('button', { name: 'Option B', exact: true }).isDisabled(), false)
  assert.equal(await page.getByText('Answer revealed', { exact: true }).count(), 0)
  finished = true
  await page.getByRole('button', { name: 'Claim verified room XP', exact: true }).click()
  await page.getByRole('alert').filter({ hasText: 'XP was not confirmed.' }).waitFor()
  assert.equal(await page.getByText('Verified total XP: 850', { exact: true }).count(), 0)
  rewardFails = false
  await page.getByRole('button', { name: 'Claim verified room XP', exact: true }).click()
  await page.getByRole('status').filter({ hasText: 'Verified total XP: 850' }).waitFor()
  assert.equal(claims, 2)
  assert.equal(await page.getByRole('button', { name: 'Claim verified room XP', exact: true }).count(), 0)
  assert.equal(await page.evaluate(async () => {
    const { syncPlayCompletion } = await import('/src/lib/play/progressSync.ts')
    const result = await syncPlayCompletion({ id: 'fixture-user' }, { game: 'adventure', score: 999, maxScore: 1, category: 'forged', progress: {} })
    return result.status
  }), 'local-only')
  assert.equal(legacyCalls, 0)
  assert.deepEqual(errors, [])
  console.log('PASS: rejected join preserves no credentials; player selection resets each round; no open reveal UI; denied reward then idempotent receipt retry. Mocked API, not database authorization.')
} finally { await browser?.close(); await server.close() }
