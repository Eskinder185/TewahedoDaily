/** Finish the Mezmur generator + anti-repetition. Run: npx tsx scripts/test-finish-mezmur.ts */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import {
  buildFinishMezmurBankSeeded,
  cleanLyricLine,
  gradeTyped,
  normalizeForCompare,
  usableLines,
  type MezmurSong,
} from '../src/lib/play/finishMezmur'
import { loadSeen, markSeen, selectUnseen } from '../src/lib/play/questionHistory'

const songs: MezmurSong[] = JSON.parse(readFileSync(new URL('./fixtures/finish-mezmur-sample.json', import.meta.url), 'utf8'))

let passed = 0
const t = (name: string, fn: () => void) => { fn(); passed++; console.log(`✓ ${name}`) }
const seeded = () => { let a = 12345; return () => ((a = (a * 16807) % 2147483647) / 2147483647) }

t('clean strips repeat markers and parentheticals', () => {
  assert.equal(cleanLyricLine('መድኃኒት ክርስቶስ ያየብሽን መከራ/2/'), 'መድኃኒት ክርስቶስ ያየብሽን መከራ')
  assert.equal(cleanLyricLine('ወደ ሕይወት መንገድ ይመራኛል ጌታ ፪'), 'ወደ ሕይወት መንገድ ይመራኛል ጌታ')
  assert.equal(cleanLyricLine('እስራኤል ወደቀ (እስራኤል ተነሳ(2×))'), 'እስራኤል ወደቀ')
  assert.equal(cleanLyricLine('ገና እንዘምራለን /4/'), 'ገና እንዘምራለን')
})

t('section/chorus labels are excluded as targets', () => {
  const yes = usableLines(songs.find((s) => s.slug === 'yesemaym-yemdirm-geta')!)
  assert.ok(yes.every((l) => !/^አዝ/.test(l.am) && l.am !== 'አ.ዝ'), 'no Az label survived')
  const dinq = usableLines(songs.find((s) => s.slug === 'dinq-adrigolnyal')!)
  assert.ok(dinq.every((l) => l.am !== 'አ.ዝ'), 'no አ.ዝ label survived')
})

t('usable lines align amharic and transliteration', () => {
  for (const s of songs) for (const l of usableLines(s)) {
    assert.ok(l.am.length > 0, s.slug)
    assert.ok(l.tr.length > 0, `${s.slug} has transliteration for "${l.am}"`)
  }
})

t('a heavily-repeated song yields no choose questions it cannot distinguish', () => {
  // "mesqelke" is all repeats of one line → no usable multi-word distinct targets.
  const bank = buildFinishMezmurBankSeeded(songs.filter((s) => s.slug === 'mesqelke'), 'choose', 'medium', 7)
  assert.equal(bank.length, 0)
})

t('choose: 4 options, exactly one correct, all distinct real lines', () => {
  const bank = buildFinishMezmurBankSeeded(songs, 'choose', 'medium', 3)
  assert.ok(bank.length >= 30, `only ${bank.length} choose questions`)
  const allNorms = new Set(songs.flatMap((s) => usableLines(s).map((l) => l.norm)))
  for (const q of bank.slice(0, 40)) {
    assert.equal(q.options!.length, 4)
    const correct = q.options!.filter((o) => o.key === q.correctKey)
    assert.equal(correct.length, 1)
    assert.equal(normalizeForCompare(correct[0].am), normalizeForCompare(q.answer.am))
    // options are distinct
    const norms = q.options!.map((o) => normalizeForCompare(o.am))
    assert.equal(new Set(norms).size, 4, `duplicate option in ${q.id}`)
    // every option is a real lyric line somewhere
    for (const o of q.options!) assert.ok(allNorms.has(normalizeForCompare(o.am)), `fabricated option "${o.am}"`)
    // never the first line of a song (context exists)
    assert.ok(q.contextBefore.length >= 1, `${q.id} has no context`)
  }
})

t('choose: questions come from different sections, not only line 1', () => {
  const bank = buildFinishMezmurBankSeeded(songs, 'choose', 'medium', 9)
  const indexes = new Set(bank.map((q) => Number(q.id.split(':')[3])))
  assert.ok([...indexes].some((i) => i >= 3), 'targets include later lines')
})

t('arrange: 3..8 real words, shuffled not already in order', () => {
  const bank = buildFinishMezmurBankSeeded(songs, 'arrange', 'medium', 5)
  assert.ok(bank.length >= 20, `only ${bank.length} arrange questions`)
  for (const q of bank.slice(0, 40)) {
    assert.ok(q.words!.length >= 3 && q.words!.length <= 8)
    assert.deepEqual([...q.shuffledWords!].sort(), [...q.words!].sort())
    assert.equal(q.words!.join(' '), q.answer.am)
  }
})

t('type: grading accepts exact + transliteration, rejects wrong', () => {
  const q = buildFinishMezmurBankSeeded(songs, 'type', 'hard', 2)[0]
  assert.ok(gradeTyped(q.answer.am, q.answer))
  assert.ok(gradeTyped(q.answer.am + ' ', q.answer))
  assert.ok(gradeTyped(q.answer.tr.toUpperCase(), q.answer))
  assert.ok(!gradeTyped('የተሳሳተ መልስ ነው', q.answer))
})

t('type grading tolerates a trailing repeat marker in the answer line', () => {
  const answer = { am: 'ገና እንዘምራለን', tr: 'Gena inzemralen' }
  assert.ok(gradeTyped('ገና እንዘምራለን /2/', answer))
})

t('ids are stable and unique within a bank', () => {
  const a = buildFinishMezmurBankSeeded(songs, 'choose', 'medium', 1)
  const b = buildFinishMezmurBankSeeded(songs, 'choose', 'medium', 999)
  assert.deepEqual(new Set(a.map((q) => q.id)), new Set(b.map((q) => q.id)), 'same ids regardless of seed')
  assert.equal(new Set(a.map((q) => q.id)).size, a.length, 'ids unique')
})

// -------- anti-repetition --------
const store: Record<string, string> = {}
;(globalThis as unknown as { window: unknown }).window = {
  localStorage: {
    getItem: (k: string) => (k in store ? store[k] : null),
    setItem: (k: string, v: string) => { store[k] = v },
    removeItem: (k: string) => { delete store[k] },
  },
}

t('selectUnseen prefers never-seen and never repeats within a call', () => {
  const bank = buildFinishMezmurBankSeeded(songs, 'choose', 'medium', 4)
  const seen0 = loadSeen('finish-the-mezmur')
  const r1 = selectUnseen(bank, (q) => q.id, seen0, 5, seeded())
  assert.equal(r1.picked.length, 5)
  assert.equal(new Set(r1.picked.map((q) => q.id)).size, 5, 'no repeat in a round')
  assert.equal(r1.reusedSeen, false)
  markSeen('finish-the-mezmur', r1.picked.map((q) => q.id))
  const r2 = selectUnseen(bank, (q) => q.id, loadSeen('finish-the-mezmur'), 5, seeded())
  const overlap = r2.picked.filter((q) => r1.picked.some((p) => p.id === q.id))
  assert.equal(overlap.length, 0, 'second round avoids first round ids')
})

t('selectUnseen reports exhaustion and then reuses seen', () => {
  const small = buildFinishMezmurBankSeeded(songs, 'choose', 'medium', 4).slice(0, 4)
  markSeen('fm-exhaust', small.map((q) => q.id))
  const r = selectUnseen(small, (q) => q.id, loadSeen('fm-exhaust'), 4, seeded())
  assert.equal(r.exhausted, true)
  assert.equal(r.reusedSeen, true)
  assert.equal(new Set(r.picked.map((q) => q.id)).size, r.picked.length, 'still no in-round repeat')
})

console.log(`\n${passed} passed`)
