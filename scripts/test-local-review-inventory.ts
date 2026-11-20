/** The LOCAL review inventory must describe all 834 consolidated drafts honestly. Run: npx tsx scripts/test-local-review-inventory.ts */
import assert from 'node:assert/strict'
import { buildReviewInventory, PUBLISHED_LIBRARY_SLUGS } from './play/build-local-review-inventory'

const inventory = await buildReviewInventory()
const { rows } = inventory
let passed = 0
const t = (name: string, fn: () => void) => { fn(); passed += 1; console.log(`✓ ${name}`) }
const count = (tag: string) => rows.filter((row) => row.tags.includes(tag as never)).length

t('all 834 consolidated records are listed once, with unique stable IDs', () => {
  assert.equal(rows.length, 834)
  assert.equal(new Set(rows.map((row) => row.id)).size, 834)
})
t('every one of the 11 imported formats is present (Finish the Mezmur is source-only and absent)', () => {
  const games = new Set(rows.map((row) => row.game))
  assert.deepEqual([...games].sort(), ['adventures', 'bible-timeline', 'emoji', 'feasts', 'finish-the-verse', 'history', 'icon-memory', 'match', 'saints', 'trivia', 'who-am-i'])
  assert.ok(!games.has('finish-the-mezmur'))
})
t('exactly 21 records are source blocked: 14 Seven Sacraments and 7 History, by the published-book rule', () => {
  const blocked = rows.filter((row) => row.tags.includes('source-blocked'))
  assert.equal(blocked.length, 21)
  assert.equal(blocked.filter((row) => row.sources.some((s) => s.route.includes('seven-sacraments'))).length, 14)
  assert.equal(blocked.filter((row) => row.game === 'history').length, 7)
  assert.ok(blocked.every((row) => row.sources.some((s) => s.blocked && s.note)))
  assert.ok(rows.filter((row) => !row.tags.includes('source-blocked')).every((row) => row.sources.every((s) => !s.blocked)))
  assert.equal(PUBLISHED_LIBRARY_SLUGS.length, 4)
})
t('the six Who Am I? cards whose Amharic claim was removed are flagged', () => {
  assert.equal(count('downgraded-amharic'), 6)
  assert.ok(rows.filter((row) => row.tags.includes('downgraded-amharic')).every((row) => row.game === 'who-am-i'))
})
t('nothing is labelled approved, published or rights-cleared; held content always requires review', () => {
  for (const row of rows) {
    assert.doesNotMatch(row.reviewState + row.rights, /\b(is|are|was|has been|have been)\s+(approved|published|cleared|licen[cs]ed)\b/i, row.id)
    assert.match(row.rights, /^Not recorded in the draft/)
    assert.match(row.reviewState, /^Draft \(local only\)/)
    if (row.tags.includes('source-blocked')) assert.ok(row.tags.includes('editorial-review'))
  }
})
t('generated and bundled provenance partition the rows; no row is invalid', () => {
  assert.equal(count('generated-draft') + count('existing-bundled'), 834)
  assert.equal(count('invalid'), 0)
  assert.ok(rows.every((row) => row.provenance.origin.length > 0 && (row.provenance.kind === 'generated') === row.provenance.origin.includes('/generated/')))
})
t('every row shows content, a source, and Amharic exactly where it exists (nothing translated or invented here)', () => {
  for (const row of rows) {
    assert.ok(row.title && row.fields.length > 0, row.id)
    assert.ok(row.sources.length > 0, `${row.id} cites a source`)
    const hasAm = row.fields.some((field) => field.am.trim() && field.am !== field.en)
    assert.equal(row.tags.includes('no-amharic'), !hasAm && !row.tags.includes('translation-review'), `${row.id} Amharic label matches its text`)
  }
})
t('quiz rows show the options, the correct answer and the explanation', () => {
  const quiz = rows.filter((r) => ['trivia', 'emoji', 'finish-the-verse', 'history'].includes(r.game) && r.id !== 'legacy-history-chronology')
  assert.equal(quiz.length, 226 + 166 + 119 + 6, 'every quiz row is checked (the one History chronology activity is not a quiz)')
  const chronology = rows.find((r) => r.id === 'legacy-history-chronology')!
  assert.ok(chronology.fields.length >= 3 && chronology.fields.every((f) => /^Event \d+ · \d+$/.test(f.label)), 'the chronology lists its dated events')
  for (const row of quiz) {
    const labels = row.fields.map((field) => field.label)
    assert.ok(labels.includes('Correct answer') && labels.includes('Explanation') && labels.some((l) => l.startsWith('Option')), row.id)
    assert.equal(labels.filter((l) => l.endsWith('(correct)')).length, 1, `${row.id} marks exactly one correct option`)
  }
})
t('picture decks list every picture and describe the artwork status', () => {
  for (const row of rows.filter((r) => ['feasts', 'saints', 'icon-memory'].includes(r.game))) {
    assert.ok(row.artwork.items.length >= 4 && row.artwork.status.length > 0, row.id)
  }
})
console.log(`\n${passed} passed`)
