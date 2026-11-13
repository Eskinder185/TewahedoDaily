/** Regression: a closed realtime transport never reports an outage or leaves a stray channel. Run: npx tsx scripts/test-live-transport.ts */
import assert from 'node:assert/strict'
process.env.VITE_SUPABASE_URL ||= 'https://transport-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY ||= 'synthetic-public-key'
const { createRealtimeTransport } = await import('../src/lib/play/liveTransport.ts')

type Status = 'SUBSCRIBED' | 'CHANNEL_ERROR' | 'TIMED_OUT' | 'CLOSED'
function fakeClient() {
  const calls = { created: 0, track: [] as unknown[], untrack: 0, removed: 0, sent: [] as unknown[] }
  let callback: ((status: Status) => void) | null = null
  const channel = {
    on() { return channel },
    subscribe(cb: (status: Status) => void) { callback = cb; return channel },
    async track(payload: unknown) { calls.track.push(payload); return 'ok' },
    async untrack() { calls.untrack += 1; return 'ok' },
    async send(message: unknown) { calls.sent.push(message); return 'ok' },
    presenceState: () => ({}),
  }
  return { client: { channel: () => { calls.created += 1; return channel }, removeChannel: async () => { calls.removed += 1 } } as never, calls, emit: (status: Status) => callback?.(status) }
}
const tick = () => new Promise((resolve) => setTimeout(resolve, 15))
const settle = (promise: Promise<void>) => Promise.race([promise.then(() => 'resolved', () => 'rejected'), new Promise<string>((resolve) => setTimeout(() => resolve('pending'), 160))])
let passed = 0
const test = async (name: string, fn: () => Promise<void>) => { await fn(); passed += 1; console.log(`PASS ${name}`) }

await test('a transport that is never closed and never connects reports the outage after its timeout', async () => {
  const fake = fakeClient()
  const transport = createRealtimeTransport('ABCDE', 'host', { client: fake.client, readyTimeoutMs: 60 })!
  assert.equal(await settle(transport.ready), 'rejected')
})

await test('closing in the same tick (React development double mount): no channel is created, nothing is sent, no outage is reported', async () => {
  const fake = fakeClient()
  const transport = createRealtimeTransport('ABCDE', 'p1', { client: fake.client, readyTimeoutMs: 40 })!
  transport.send({ from: 'player', body: { t: 'leave', id: 'p1' } } as never) // what the guest page's cleanup does
  transport.close()
  assert.equal(await settle(transport.ready), 'pending')
  assert.equal(fake.calls.created, 0, 'a channel joined and left on the same topic can silently unsubscribe its replacement')
  assert.equal(fake.calls.removed, 0)
  assert.equal(fake.calls.sent.length, 0, 'no stray leave message reaches the room')
})

await test('closing after the channel exists: late statuses are ignored, presence is never announced', async () => {
  const fake = fakeClient()
  const transport = createRealtimeTransport('ABCDE', 'p1', { client: fake.client, readyTimeoutMs: 40 })!
  await tick()
  assert.equal(fake.calls.created, 1)
  transport.close()
  fake.emit('SUBSCRIBED'); fake.emit('CHANNEL_ERROR'); fake.emit('TIMED_OUT')
  assert.equal(await settle(transport.ready), 'pending')
  assert.equal(fake.calls.track.length, 0)
  assert.equal(fake.calls.removed, 1)
})

await test('a healthy transport connects, announces itself once, delivers queued messages in order, and survives the timeout window', async () => {
  const fake = fakeClient()
  const transport = createRealtimeTransport('ABCDE', 'p1', { client: fake.client, readyTimeoutMs: 60 })!
  transport.send({ from: 'player', body: { t: 'hello', id: 'p1', n: 1 } } as never)
  transport.send({ from: 'player', body: { t: 'hello', id: 'p1', n: 2 } } as never)
  await tick()
  assert.equal(fake.calls.sent.length, 0, 'queued until the channel has joined')
  fake.emit('SUBSCRIBED')
  assert.equal(await settle(transport.ready), 'resolved')
  assert.deepEqual((fake.calls.sent as Array<{ payload: { body: { n: number } } }>).map((m) => m.payload.body.n), [1, 2])
  await new Promise((resolve) => setTimeout(resolve, 100))
  assert.deepEqual(fake.calls.track, [{ id: 'p1' }])
  transport.send({ from: 'player', body: { t: 'hello', id: 'p1', n: 3 } } as never)
  assert.equal(fake.calls.sent.length, 3)
  transport.close(); transport.close()
  assert.equal(fake.calls.removed, 1, 'closing twice removes the channel once')
  transport.send({ from: 'player', body: { t: 'hello', id: 'p1', n: 4 } } as never)
  assert.equal(fake.calls.sent.length, 3, 'nothing is sent after close')
})

await test('a real channel error still reports an outage', async () => {
  const fake = fakeClient()
  const transport = createRealtimeTransport('ABCDE', 'host', { client: fake.client, readyTimeoutMs: 5000 })!
  await tick()
  fake.emit('CHANNEL_ERROR')
  assert.equal(await settle(transport.ready), 'rejected')
  transport.close()
})

await test('no client configured: no transport', async () => {
  assert.equal(createRealtimeTransport('ABCDE', 'host', { client: null }), null)
})
console.log(`\n${passed} passed`)
