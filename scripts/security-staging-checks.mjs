/** Prepared disposable-staging HTTP tests. Default is plan-only, no requests.
 * --execute --disposable-staging requires separate human authorization.
 * Tokens stay in environment variables and are never printed or serialized. */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { pathToFileURL } from 'node:url'
import { fileURLToPath } from 'node:url'
import path from 'node:path'
import { assertHarnessTarget } from './security-staging-environment.mjs'

const roles = ['anon', 'player', 'host', 'editor', 'admin', 'super_admin']
const uuid = /^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$/i
export function validateFixture(f) {
  assert.equal(f?.disposable, true, 'Disposable fixture declaration required')
  assert.match(f.projectRef, /^[a-z]{20}$/, 'Exact staging project reference required')
  for (const key of ['openRoomId', 'rewardRoomId', 'playerParticipantId', 'rewardParticipantId']) assert.match(f[key], uuid, `Invalid ${key}`)
  assert.notEqual(f.openRoomId, f.rewardRoomId, 'Separate open and completed reward rooms required')
  assert.deepEqual(Object.keys(f).sort(), ['disposable', 'projectRef', 'openRoomId', 'rewardRoomId', 'playerParticipantId', 'rewardParticipantId'].sort(), 'No credentials or extra fields in fixture manifest')
  return f
}

function safeQuestion(q) {
  assert.ok(q && typeof q === 'object', 'Question object required')
  assert.deepEqual(Object.keys(q).sort(), ['options', 'prompt'], 'Unrevealed question must contain prompt/options only')
  for (const text of [q.prompt, ...q.options.map(o => o.text)]) {
    assert.ok(text && Object.keys(text).every(k => ['en', 'am'].includes(k)), 'Unexpected localized metadata')
    assert.ok(Object.values(text).every(v => v === null || typeof v === 'string'), 'Nested text metadata exposed')
  }
  assert.equal(q.options.length, 4, 'Four options required')
  for (const option of q.options) {
    assert.deepEqual(Object.keys(option).sort(), ['key', 'text'], 'Unexpected option metadata')
    assert.equal(typeof option.key, 'string', 'Scalar answer key required')
  }
}

export async function runStagingChecks(f, request) {
  let assertions = 0
  const denied = async (role, path, args, headers) => {
    const r = await request(role, path, args, headers)
    assert.ok([401, 403].includes(r.status), `${role}: expected permission denial for ${path}`); assertions++
  }
  for (const role of roles.slice(1)) {
    const identity = await request(role, '@auth/user')
    assert.equal(identity.status, 200, `${role}: valid JWT required before denial tests`)
    assert.match(identity.body.id, uuid, 'Authenticated identity required')
    const profile = await request(role, `profiles?select=role&id=eq.${identity.body.id}`)
    assert.equal(profile.status, 200, `${role}: profile lookup required`)
    assert.equal(profile.body[0]?.role, ['player', 'host'].includes(role) ? 'user' : role, 'Effective fixture role mismatch')
    assertions++
  }
  for (const role of roles) {
    await denied(role, 'play_room_submissions?select=*&limit=1')
    const privateRead = await request(role, 'game_night_questions?select=*&limit=1', undefined, { 'Accept-Profile': 'play_private' })
    assert.ok([401, 403].includes(privateRead.status)
      || (privateRead.status === 406 && privateRead.body.code === 'PGRST106'), 'Private bank must be inaccessible'); assertions++
    await denied(role, 'rpc/award_verified_play_activity', { p_evidence_id: f.rewardRoomId })
    if (role !== 'host') {
      for (const rpc of ['start_play_room_round', 'reveal_play_room_round', 'finish_play_room']) {
        await denied(role, `rpc/${rpc}`, { p_room_id: f.openRoomId })
      }
      await denied(role, 'rpc/get_play_room_state', { p_room_id: f.openRoomId })
    }
  }
  // Valid player membership is a capability token plus participant reference.
  const member = { p_room_id: f.openRoomId, p_participant_id: f.playerParticipantId, p_join_token: 'FROM_ENV' }
  const state = await request('player', 'rpc/get_play_room_state', member)
  assert.equal(state.status, 200, 'Valid player state'); assertions++
  assert.equal(state.body.round.status, 'open', 'Fixture round must still be open')
  safeQuestion(state.body.round.question); assertions++
  const hostState = await request('host', 'rpc/get_play_room_state', { p_room_id: f.openRoomId })
  assert.equal(hostState.status, 200, 'Host state'); safeQuestion(hostState.body.round.question); assertions++

  // Host fixture must have ZERO prior joins in this minute. Rejections are
  // independent HTTP transactions: rollback-prone counters fail this test.
  for (let n = 0; n < 10; n++) {
    const r = await request('host', 'rpc/join_play_room', { p_code: '!', p_display_name: 'Rejected fixture' })
    assert.equal(r.status, 200, 'Rejected join must commit an error envelope')
    assert.equal(r.body.error, 'invalid_join', 'Rejected attempt counted'); assertions++
  }
  const limited = await request('host', 'rpc/join_play_room', { p_code: '!', p_display_name: 'Rejected fixture' })
  assert.equal(limited.body.error, 'rate_limited', 'Eleventh committed rejection must be rate limited'); assertions++

  // Pre-provisioned completed room: authenticated membership and all 5/10/20
  // server-scored rounds; no prior reward. Requests use separate HTTP connections.
  const claim = { p_room_id: f.rewardRoomId, p_participant_id: f.rewardParticipantId }
  const results = await Promise.all([request('player', 'rpc/claim_verified_play_room_reward', claim), request('player', 'rpc/claim_verified_play_room_reward', claim)])
  assert.ok(results.every(r => r.status === 200), 'Both concurrent claims must return receipts')
  assert.equal(results.filter(r => r.body.awarded === true).length, 1, 'Concurrent requests must award exactly once')
  assert.equal(results.filter(r => r.body.awarded === false && r.body.xp_earned === 0).length, 1, 'Duplicate delta must be zero'); assertions++
  assert.equal(results[0].body.xp_total, results[1].body.xp_total, 'No other concurrent fixture activity permitted')
  const retry = await request('player', 'rpc/claim_verified_play_room_reward', claim)
  assert.equal(retry.body.awarded, false); assert.equal(retry.body.xp_earned, 0)
  assert.equal(retry.body.xp_total, results[0].body.xp_total); assertions++
  await denied('host', 'rpc/claim_verified_play_room_reward', claim)
  return assertions
}

async function main() {
  const args = process.argv.slice(2)
  const fileIndex = args.indexOf('--fixture')
  assert.ok(fileIndex >= 0 && args[fileIndex + 1], '--fixture FILE required')
  const valueFlags = ['--fixture','--staging-project-id','--production-project-id']
  const values = {}
  for (let i=0; i<args.length; i++) {
    if (valueFlags.includes(args[i])) {
      assert.ok(!values[args[i]] && args[i+1] && !args[i+1].startsWith('--'), 'Invalid argument')
      values[args[i]] = args[++i]
    } else assert.ok(['--execute','--disposable-staging'].includes(args[i]), 'Unexpected argument')
  }
  const f = validateFixture(JSON.parse(readFileSync(args[fileIndex + 1], 'utf8')))
  if (!args.includes('--execute')) { console.log('PLAN ONLY: 6-role access checks, open-answer projection, 11 failed joins, concurrent/retried reward claims. No HTTP requests.'); return }
  assert.ok(args.includes('--disposable-staging'), 'Explicit disposable-staging opt-in required')
  const target = assertHarnessTarget(values['--staging-project-id'], values['--production-project-id'], process.env,
    path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..'))
  assert.equal(f.projectRef, target.projectId, 'Fixture target mismatch')
  assert.equal(process.env.SECURITY_STAGING_PROJECT_REF, f.projectRef, 'Independent staging target confirmation required')
  const key = process.env.SECURITY_STAGING_PUBLISHABLE_KEY
  assert.ok(key && process.env.SECURITY_STAGING_PLAYER_JOIN_TOKEN, 'Staging public key and player join token required')
  for (const role of roles.slice(1)) assert.ok(process.env[`SECURITY_STAGING_${role.toUpperCase()}_JWT`], `Missing ${role} JWT`)
  // No service key needed. Test API authorization with real role JWTs.
  const request = async (role, path, args, extra = {}) => {
    const payload = args && { ...args }
    if (payload?.p_join_token === 'FROM_ENV') payload.p_join_token = process.env.SECURITY_STAGING_PLAYER_JOIN_TOKEN
    const target = path === '@auth/user' ? 'auth/v1/user' : `rest/v1/${path}`
    const response = await fetch(`https://${f.projectRef}.supabase.co/${target}`, {
      method: payload ? 'POST' : 'GET', signal: AbortSignal.timeout(15000), redirect: 'error',
      headers: { apikey: key, 'Content-Type': 'application/json', ...extra,
        ...(role === 'anon' ? {} : { Authorization: `Bearer ${process.env[`SECURITY_STAGING_${role.toUpperCase()}_JWT`]}` }) },
      body: payload ? JSON.stringify(payload) : undefined,
    })
    return { status: response.status, body: await response.json() }
  }
  console.log(`PASS ${await runStagingChecks(f, request)} staging assertions. Preserve receipt/ledger evidence separately; no credentials logged.`)
}
if (process.argv[1] && import.meta.url === pathToFileURL(process.argv[1]).href) {
  main().catch(() => { console.error('BLOCKED/FAIL: staging fixture, permissions or assertions failed. No raw responses logged. Inspect with approved staging tooling.'); process.exitCode = 1 })
}
