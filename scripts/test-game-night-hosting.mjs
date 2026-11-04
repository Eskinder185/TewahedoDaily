/**
 * Game Night error mapping (pure) and host/guest flow against a mocked API (no Supabase, no SQL).
 * Run: node --experimental-strip-types --no-warnings scripts/test-game-night-hosting.mjs
 */
import assert from 'node:assert/strict'
import { chromium } from 'playwright'
import { createServer } from 'vite'
import { describeGameNightRpcError } from '../src/lib/play/gameNightProtocol.ts'

// ---- Pure mapping: only PostgREST "not found" means a missing migration. ----
const d = describeGameNightRpcError
const missing = d('create_play_room', { code: 'PGRST202', message: 'Could not find the function public.create_play_room(p_category, p_difficulty, p_question_count) in the schema cache' })
assert.match(missing, /not installed on this database yet \(missing create_play_room\)/)
assert.match(d('create_play_room', { message: 'Could not find the function public.create_play_room in the schema cache' }), /not installed/)
// The reproduced live-shape failure: function exists, pgcrypto is not on its search_path. NOT "missing migration".
const crypto = d('create_play_room', { code: '42883', message: 'function gen_random_bytes(integer) does not exist' })
assert.match(crypto, /installed, but .* pgcrypto/)
assert.doesNotMatch(crypto, /not installed/)
assert.match(d('join_play_room', { message: 'function digest(text, unknown) does not exist' }), /pgcrypto/)
assert.match(d('x', { code: '42P01', message: 'relation "play_private.game_night_questions" does not exist' }), /database object it needs is missing/)
assert.match(d('create_play_room', { code: '42501', message: 'Authentication required' }), /Sign in to host/)
assert.match(d('start_play_room_round', { message: 'No reviewed private questions available' }), /No reviewed Game Night questions/)
assert.equal(d('start_play_room_round', { code: '42501', message: 'Host permission required' }), 'Only the host of this room can do that.')
assert.match(d('submit_play_room_answer', { code: '23505', message: 'duplicate key value violates unique constraint "play_room_submissions_round_id_participant_id_key"' }), /already answered/)
assert.match(d('create_play_room', { code: '42501', message: 'permission denied for function create_play_room' }), /permission problem/)
assert.equal(d('create_play_room', { code: '22023', message: 'Invalid room settings' }), 'Invalid room settings')
assert.equal(d('x', {}), 'The Game Night request could not be completed.')

// ---- Mocked browser flow. ----
process.env.VITE_SUPABASE_URL = 'https://game-hosting-test.supabase.co'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_fixture_only'
const server = await createServer({ server: { host: '127.0.0.1', port: 4188, strictPort: true } })
await server.listen()
let browser
try {
  browser = await chromium.launch()
  const page = await browser.newPage()
  const errors = []
  page.on('pageerror', (e) => errors.push(e.message))
  const roomId = 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'
  const user = { id: '11111111-1111-1111-1111-111111111111', email: 'host@example.invalid', aud: 'authenticated', role: 'authenticated', app_metadata: {}, user_metadata: {} }
  const token = [Buffer.from('{"alg":"HS256","typ":"JWT"}').toString('base64url'),
    Buffer.from(JSON.stringify({ sub: user.id, exp: Math.floor(Date.now() / 1000) + 3600, role: 'authenticated' })).toString('base64url'), 'fixture'].join('.')
  await page.addInitScript(({ token, user }) => localStorage.setItem('sb-game-hosting-test-auth-token', JSON.stringify({
    access_token: token, refresh_token: 'fixture', expires_at: Math.floor(Date.now() / 1000) + 3600, expires_in: 3600, token_type: 'bearer', user })), { token, user })
  let createMode = 'missing' // missing -> pgcrypto -> ok
  let startMode = 'empty'
  const calls = []
  const state = (round) => ({ room_id: roomId, state: round ? 'playing' : 'lobby', role: 'host', settings: { category: 'All categories', difficulty: 'beginner', question_count: 5 },
    participants: [], round: round ? { id: 'r1', status: 'open', position: 1, question: { prompt: { en: 'First question' }, options: ['A', 'B', 'C', 'D'].map((key) => ({ key, text: { en: `Option ${key}` } })) } } : null })
  let started = false
  await page.route('https://game-hosting-test.supabase.co/**', async (route) => {
    const path = new URL(route.request().url()).pathname
    let data = []; let status = 200
    if (path === '/auth/v1/user') data = user
    else if (path === '/rest/v1/profiles') data = { id: user.id, role: 'user' }
    else if (path.endsWith('/create_play_room')) {
      calls.push(route.request().postDataJSON())
      if (createMode === 'missing') { status = 404; data = { code: 'PGRST202', message: 'Could not find the function public.create_play_room(p_category, p_difficulty, p_question_count) in the schema cache' } }
      else if (createMode === 'pgcrypto') { status = 404; data = { code: '42883', message: 'function gen_random_bytes(integer) does not exist' } }
      else data = { room_id: roomId, code: 'A1B2C3' }
    } else if (path.endsWith('/start_play_room_round')) {
      if (startMode === 'empty') { status = 400; data = { code: 'P0001', message: 'No reviewed private questions available' } } else { started = true; data = 'r1' }
    } else if (path.endsWith('/get_play_room_state')) data = state(started)
    await route.fulfill({ status, contentType: 'application/json', body: JSON.stringify(data) })
  })
  await page.goto('http://127.0.0.1:4188/play/game-night')
  await page.getByRole('button', { name: /Host a room/ }).click()
  const create = page.getByRole('button', { name: 'Create private room', exact: true })

  await create.click()
  await page.getByRole('alert').filter({ hasText: 'not installed on this database yet (missing create_play_room)' }).waitFor()
  createMode = 'pgcrypto'
  await create.click()
  const crypto = page.getByRole('alert').filter({ hasText: 'cannot reach the pgcrypto extension' })
  await crypto.waitFor()
  assert.equal(await page.getByText('not installed on this database').count(), 0, 'a pgcrypto failure must not claim the migration is missing')
  createMode = 'ok'
  await create.click()
  await page.getByText('A1B2C3', { exact: true }).waitFor()
  assert.equal(await page.getByRole('alert').count(), 0, 'error clears on success')
  assert.deepEqual(calls.at(-1), { p_category: 'All categories', p_difficulty: 'beginner', p_question_count: 5 })

  await page.getByRole('button', { name: 'Start next question' }).click()
  await page.getByRole('alert').filter({ hasText: 'No reviewed Game Night questions are available' }).waitFor()
  startMode = 'ok'
  await page.getByRole('button', { name: 'Start next question' }).click()
  await page.getByRole('heading', { name: 'First question', exact: true }).waitFor()
  assert.deepEqual(errors, [])
  console.log('PASS: Game Night error mapping (missing function vs pgcrypto vs empty bank) and mocked host flow. Mocked API, not database authorization.')
} finally {
  await browser?.close()
  await server.close()
}
