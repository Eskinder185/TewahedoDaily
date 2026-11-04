import assert from 'node:assert/strict'
import { runStagingChecks, validateFixture } from './security-staging-checks.mjs'

const f = validateFixture({ disposable: true, projectRef: 'a'.repeat(20),
  openRoomId: 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', rewardRoomId: 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
  playerParticipantId: 'cccccccc-cccc-cccc-cccc-cccccccccccc', rewardParticipantId: 'dddddddd-dddd-dddd-dddd-dddddddddddd' })
function fixture(mode = '') {
  let calls = 0; let claims = 0
  return async (role, path, args) => {
    if (path === '@auth/user') return { status: mode === 'expired' ? 401 : 200, body: { id: f.playerParticipantId } }
    if (path.startsWith('profiles?')) return { status: 200, body: [{ role: ['player', 'host'].includes(role) ? 'user' : role }] }
    if (path === 'rpc/get_play_room_state' && (role === 'host' || args.p_join_token)) return { status: 200, body: { round: { status: 'open', question: {
      prompt: { en: 'Fixture' }, options: ['A', 'B', 'C', 'D'].map(key => ({ key, text: { en: key } })), ...(mode === 'leak' ? { explanation: 'answer' } : {}),
    } } } }
    if (path === 'rpc/join_play_room') return { status: 200, body: { error: ++calls <= 10 || mode === 'rollback' ? 'invalid_join' : 'rate_limited' } }
    if (path === 'rpc/claim_verified_play_room_reward' && role === 'player') return { status: 200, body: { awarded: ++claims === 1 || mode === 'double', xp_earned: claims === 1 || mode === 'double' ? 100 : 0, xp_total: 100 } }
    return { status: 403, body: { code: '42501' } }
  }
}
const count = await runStagingChecks(f, fixture())
for (const mode of ['expired', 'leak', 'rollback', 'double']) await assert.rejects(runStagingChecks(f, fixture(mode)))
assert.throws(() => validateFixture({ ...f, disposable: false }))
assert.throws(() => validateFixture({ ...f, token: 'must not be in manifest' }))
console.log(`PASS: ${count}-assertion staging harness exercised with fake transport; detects expired JWT, answer leak, counter rollback and duplicate award; rejects unsafe manifests. NO live authorization verified.`)
