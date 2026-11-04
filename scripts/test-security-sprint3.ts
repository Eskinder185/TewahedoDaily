import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { claimVerifiedRoomReward, type RewardClient } from '../src/lib/play/verifiedRewards'

const room = 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'
const participant = 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb'
const receipt = { activity_id: `game-night:${room}`, awarded: true, xp_earned: 100, xp_total: 850 }
let passed = 0
async function test(label: string, run: () => unknown | Promise<unknown>) {
  await run(); passed++; console.log(`PASS ${label}`)
}
const client = (data: unknown): RewardClient => ({ rpc: async () => ({ data, error: null }) })
await test('only room/member references cross the reward boundary', async () => {
  const calls: unknown[] = []
  const result = await claimVerifiedRoomReward({ rpc: async (name, args) => {
    calls.push([name, args]); return { data: receipt, error: null }
  } }, room, participant)
  assert.deepEqual(calls, [['claim_verified_play_room_reward', { p_room_id: room, p_participant_id: participant }]])
  assert.deepEqual(result, receipt)
})
await test('duplicate receipts return total without another local increment', async () => {
  assert.deepEqual(await claimVerifiedRoomReward(client({ ...receipt, awarded: false, xp_earned: 0 }), room, participant),
    { ...receipt, awarded: false, xp_earned: 0 })
  assert.deepEqual(await Promise.all([1, 2].map(() => claimVerifiedRoomReward(client(receipt), room, participant))), [receipt, receipt])
})
await test('invalid references never invoke RPC', async () => {
  await assert.rejects(claimVerifiedRoomReward({ rpc: async () => { throw new Error('must not call') } }, '../escape', participant), /Invalid reward reference/)
})
for (const [label, value] of Object.entries({
  'wrong activity': { ...receipt, activity_id: 'adventure:invented' },
  'negative total': { ...receipt, xp_total: -1 },
  'inflated award': { ...receipt, xp_earned: 100000 },
  'fractional award': { ...receipt, xp_earned: 20.5 },
  'duplicate with delta': { ...receipt, awarded: false },
  'wrong type': { ...receipt, awarded: 'true' },
  'missing fields': {}, 'null response': null,
})) await test(`reject ${label}`, () => assert.rejects(claimVerifiedRoomReward(client(value), room, participant), /Invalid reward receipt/))
await test('backend failures do not expose raw errors or confirm rewards', async () => {
  await assert.rejects(claimVerifiedRoomReward({ rpc: async () => ({ data: null, error: { message: 'private SQL details' } }) }, room, participant),
    { message: 'Verified reward is unavailable. No reward was confirmed; you can retry.' })
})
await test('legacy self-scored RPC is absent from client sync', () => {
  const sync = readFileSync('src/lib/play/progressSync.ts', 'utf8')
  assert.doesNotMatch(sync, /\.rpc\(|p_score|p_snapshot/)
  assert.match(sync, /status: 'local-only'/)
})
await test('SQL preserves server membership, evidence, and atomic uniqueness boundaries', () => {
  const sql = readFileSync('docs/ai/proposed-migrations/20261103_verified_play_rewards.sql', 'utf8')
  const claim = sql.split('create or replace function public.claim_verified_play_room_reward')[1]
  assert.match(claim, /user_id=uid/)
  assert.match(claim, /state='finished' for update/)
  assert.match(claim, /submitted<>rounds/)
  assert.match(claim, /secure_question_id is not null/)
  assert.doesNotMatch(claim, /p_score|p_snapshot|p_user_id|p_activity/)
  assert.match(sql, /unique\(user_id,game_type,activity_id\), unique\(evidence_id\)/)
  assert.match(sql, /if ledger_id is null then return/)
})
await test('nested answer objects cannot be stringified into the SQL public view', () => {
  const sql = readFileSync('docs/ai/proposed-migrations/20261103_game_night_security.sql', 'utf8')
  assert.match(sql, /case when jsonb_typeof\(p_value\)='string'/)
  const dto = sql.split('create or replace function public.play_room_question_view')[1].split('revoke all on function')[0]
  assert.doesNotMatch(dto, /#>>|->>/)
  assert.match(sql, /count\(distinct o->>'key'\)/)
})
console.log(`${passed} passed, 0 failed. Client behavior and SQL source contracts only; no effective SQL authorization or concurrency was executed.`)
