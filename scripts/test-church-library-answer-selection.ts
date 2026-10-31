/**
 * Church Library answer selection — synthetic English and Amharic regression tests.
 *
 * Fixtures are invented, neutral text (no real passage IDs or doctrine). They only
 * exercise structure: numbered lists, explanatory prose, counts and ambiguity.
 *
 * Run: npx tsx scripts/test-church-library-answer-selection.ts
 */
import assert from 'node:assert/strict'
import {
  selectEnumerationAnswer,
  expectedCount,
  isEnumerationQuestion,
  numberedItemCount,
} from '../src/lib/searchBuddy/selectEnumerationAnswer'

type Hit = { passage_id: string; excerpt: string }
const hit = (passage_id: string, excerpt: string): Hit => ({ passage_id, excerpt })

// ── English fixtures ───────────────────────────────────────────────
const enWhy = hit(
  'en-why',
  'Many readers ask why the number of lanterns is five. The tradition explains the number by the five gates of the old city, and the reason is repeated in the commentary on lanterns.',
)
const enList = hit(
  'en-list',
  'The five lanterns are: 1. The lantern of dawn. 2. The lantern of noon. 3. The lantern of dusk. 4. The lantern of midnight. 5. The lantern of the harbor.',
)
const enListFour = hit(
  'en-list-four',
  'The lanterns of the hall: 1. The lantern of dawn. 2. The lantern of noon. 3. The lantern of dusk. 4. The lantern of midnight.',
)
const enUnrelatedList = hit(
  'en-unrelated',
  'Steps for baking: 1. Mix the flour. 2. Add water. 3. Knead the dough. 4. Rest it. 5. Bake the loaf.',
)

// ── Amharic fixtures ───────────────────────────────────────────────
const amWhy = hit('am-why', 'አምስቱ መብራቶች ለምን አምስት እንደሆኑ ትውፊቱ ይገልጻል። ምክንያቱ የከተማው አምስት በሮች ናቸው።')
const amList = hit(
  'am-list',
  'አምስቱ መብራቶች፦ 1. የንጋት መብራት። 2. የቀትር መብራት። 3. የምሽት መብራት። 4. የእኩለ ሌሊት መብራት። 5. የወደብ መብራት።',
)
const amListEthiopicNumerals = hit(
  'am-list-ethiopic',
  'አምስቱ መብራቶች፦ ፩. የንጋት መብራት። ፪. የቀትር መብራት። ፫. የምሽት መብራት። ፬. የእኩለ ሌሊት መብራት። ፭. የወደብ መብራት።',
)

let passed = 0
function test(name: string, fn: () => void) {
  fn()
  passed += 1
  console.log(`✓ ${name}`)
}

test('helpers: count words, list intent and numbered items (English and Amharic)', () => {
  assert.equal(expectedCount('What are the five lanterns?'), 5)
  assert.equal(expectedCount('አምስቱ መብራቶች ምንድን ናቸው'), 5)
  assert.equal(expectedCount('Tell me about lanterns'), null)
  assert.equal(isEnumerationQuestion('List the lanterns'), true)
  assert.equal(isEnumerationQuestion('ዘርዝር መብራቶችን'), true)
  assert.equal(isEnumerationQuestion('Why are lanterns lit'), false)
  assert.equal(numberedItemCount(enList.excerpt), 5)
  assert.equal(numberedItemCount(amListEthiopicNumerals.excerpt), 5)
  assert.equal(numberedItemCount('See page 12. Then 3. more'), 0, 'page numbers are not list items')
})

test('English enumeration: later list passage beats a higher-ranked explanation', () => {
  const hits = [enWhy, enList]
  const chosen = selectEnumerationAnswer('What are the five lanterns?', hits)
  assert.equal(chosen, enList)
})

test('Amharic enumeration: later list passage beats a higher-ranked explanation', () => {
  const hits = [amWhy, amList]
  assert.equal(selectEnumerationAnswer('አምስቱ መብራቶች ምንድን ናቸው', hits), amList)
  assert.equal(selectEnumerationAnswer('አምስቱ መብራቶች ምንድን ናቸው', [amWhy, amListEthiopicNumerals]), amListEthiopicNumerals)
})

test('non-enumeration question keeps the first result (null)', () => {
  assert.equal(selectEnumerationAnswer('Why is the number of lanterns five?', [enWhy, enList]), null)
  assert.equal(selectEnumerationAnswer('ስለ መብራቶች ንገረኝ', [amWhy, amList]), null)
})

test('count mismatch falls back (null), never inventing or padding a list', () => {
  assert.equal(selectEnumerationAnswer('What are the five lanterns?', [enWhy, enListFour]), null)
})

test('ambiguous equal candidates fall back (null)', () => {
  const twin = hit('en-list-twin', enList.excerpt)
  assert.equal(selectEnumerationAnswer('What are the five lanterns?', [enWhy, enList, twin]), null)
})

test('weak relevance: an unrelated numbered list is not chosen', () => {
  assert.equal(selectEnumerationAnswer('What are the five lanterns?', [enWhy, enUnrelatedList]), null)
})

test('a question with no usable key terms falls back (null)', () => {
  assert.equal(selectEnumerationAnswer('List the five', [enWhy, enList]), null)
})

test('empty and single-hit inputs fall back (null)', () => {
  assert.equal(selectEnumerationAnswer('What are the five lanterns?', []), null)
  assert.equal(selectEnumerationAnswer('What are the five lanterns?', [enList]), null)
  assert.equal(selectEnumerationAnswer('', [enWhy, enList]), null)
})

test('when the first hit is already the list, it is returned (no change in behavior)', () => {
  assert.equal(selectEnumerationAnswer('What are the five lanterns?', [enList, enWhy]), enList)
})

test('source fidelity and citation alignment: same object, unchanged text, input order untouched', () => {
  const hits = [enWhy, enList, enUnrelatedList]
  const before = hits.map((h) => ({ ...h }))
  const chosen = selectEnumerationAnswer('What are the five lanterns?', hits)
  assert.ok(chosen)
  assert.ok(hits.includes(chosen), 'result must be one of the input hits')
  assert.equal(chosen.excerpt, 'The five lanterns are: 1. The lantern of dawn. 2. The lantern of noon. 3. The lantern of dusk. 4. The lantern of midnight. 5. The lantern of the harbor.')
  assert.equal(chosen.passage_id, 'en-list', 'answer_passage_id must be the selected hit')
  assert.deepEqual(hits.map((h) => ({ ...h })), before, 'hits are not reordered or mutated')
})

test('determinism: repeated calls agree', () => {
  const hits = [amWhy, amList]
  const first = selectEnumerationAnswer('አምስቱ መብራቶች ምንድን ናቸው', hits)
  for (let i = 0; i < 20; i += 1) assert.equal(selectEnumerationAnswer('አምስቱ መብራቶች ምንድን ናቸው', hits), first)
})

console.log(`\nChurch Library answer selection: ${passed} tests passed`)
