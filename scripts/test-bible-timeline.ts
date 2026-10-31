import assert from 'node:assert/strict'
import { TIMELINE_CHAINS, TL_SIZE, buildTimelineBank, gradeOrder, isCorrectOrder, scrambledOrder, type TlDifficulty } from '../src/lib/play/bibleTimeline'
import { selectUnseen } from '../src/lib/play/questionHistory'

const seeded = (s = 7) => () => ((s = (s * 1664525 + 1013904223) % 4294967296) / 4294967296)

for (const chain of TIMELINE_CHAINS) {
  assert.equal(new Set(chain.events.map((e) => e.id)).size, chain.events.length, `${chain.id}: duplicate ids`)
  for (const e of chain.events) {
    assert.match(e.ref, /\d+:\d+/, `${e.id}: exact reference`)
    assert.match(e.route, /^\/bible\/[a-z0-9-]+\/\d+$/, `${e.id}: route`)
    assert.ok(e.note.length > 10 && e.title.en, `${e.id}: explanation and title`)
  }
}
for (const d of ['easy', 'medium', 'hard'] as TlDifficulty[]) {
  const bank = buildTimelineBank(d, 24, seeded())
  assert.ok(bank.length > 0, `${d}: bank non-empty`)
  for (const r of bank) {
    assert.ok(r.events.length >= TL_SIZE[d].min && r.events.length <= TL_SIZE[d].max, `${d}: size ${r.events.length}`)
    assert.ok(r.events.length >= 3 && r.events.length <= 8)
    const chain = TIMELINE_CHAINS.find((c) => c.id === r.chainId)!
    const idx = r.events.map((e) => chain.events.findIndex((x) => x.id === e.id))
    assert.deepEqual(idx, [...idx].sort((a, b) => a - b), 'canonical order preserved')
    const s = scrambledOrder(r, seeded(3))
    assert.ok(!isCorrectOrder(r, s), 'scramble is never pre-solved')
    assert.ok(isCorrectOrder(r, r.events.map((e) => e.id)))
    assert.ok(gradeOrder(r, r.events.map((e) => e.id)).every(Boolean))
  }
  const picked = selectUnseen(bank, (r) => r.id, { has: () => false }, 4, seeded()).picked
  assert.equal(new Set(picked.map((r) => r.id)).size, picked.length, 'no repeated rounds')
}
console.log('bible timeline tests passed')
