/**
 * Synaxarium compact presentation checks.
 * Run: node scripts/test-synaxarium-presentation.mjs
 */
import assert from 'node:assert/strict'
import {
  cleanSynaxariumTitle,
  deriveSynaxariumSummary,
  formatSynaxariumCategoryLabel,
  isSynaxariumDateHeading,
  isSynaxariumFragmentTitle,
  presentSynaxariumForDay,
} from '../src/lib/synaxarium/synaxariumPresentation.ts'

assert.equal(isSynaxariumDateHeading('Meskerem 22\n(October 02)', 'Meskerem 22\n(October 02)'), true)
assert.equal(isSynaxariumFragmentTitle('is commemorated Balan.'), true)
assert.equal(isSynaxariumFragmentTitle('Saint Julius'), false)

assert.equal(
  cleanSynaxariumTitle(
    'the Saints Kotolos (Cotylus) and his brother ‘Aksu became martyrs.',
    'On this day the Saints Kotolos (Cotylus) and his brother ‘Aksu became martyrs. These holy men were the sons of Sapor.',
  ),
  'Saints Kotolos (Cotylus) and his brother ‘Aksu',
)

assert.equal(
  cleanSynaxariumTitle('Saint Julius', 'On this day also Saint Julius became a martyr. This holy man came from the city of ‘Akfehas.'),
  'Saint Julius',
)

assert.equal(formatSynaxariumCategoryLabel('other'), 'COMMEMORATION')
assert.equal(formatSynaxariumCategoryLabel('martyr', 'Saints Kotolos became martyrs'), 'MARTYRS')
assert.equal(formatSynaxariumCategoryLabel('martyr', 'Saint Julius became a martyr'), 'MARTYR')

const derived = deriveSynaxariumSummary({
  summary: '',
  body: 'On this day also Saint Julius became a martyr. This holy man came from the city of ‘Akfehas.',
  title: 'Saint Julius',
})
assert.match(derived.summary, /Julius/i)
assert.equal(derived.derived, true)

const meskerem22 = presentSynaxariumForDay([
  {
    id: '1',
    slug: 'date',
    title: 'Meskerem 22\n(October 02)',
    body_english: 'Meskerem 22\n(October 02)',
    commemoration_type: 'other',
    sort_order: 1,
  },
  {
    id: '2',
    slug: 'kotolos',
    title: 'the Saints Kotolos (Cotylus) and his brother ‘Aksu became martyrs.',
    body_english:
      'On this day the Saints Kotolos (Cotylus) and his brother ‘Aksu became martyrs. These holy men were the sons of Sapor, King of Persia.',
    commemoration_type: 'martyr',
    sort_order: 2,
  },
  {
    id: '3',
    slug: 'julius',
    title: 'Saint Julius',
    body_english: 'On this day also Saint Julius became a martyr. This holy man came from the city of ‘Akfehas.',
    commemoration_type: 'martyr',
    sort_order: 3,
  },
  {
    id: '4',
    slug: 'three',
    title: 'Julius, Theodore and Ionias.',
    body_english: 'salutation to Julius, Theodore and Ionias.',
    commemoration_type: 'other',
    sort_order: 4,
  },
  {
    id: '5',
    slug: 'balan',
    title: 'is commemorated Balan.',
    body_english: 'on this day is commemorated Balan.',
    commemoration_type: 'other',
    sort_order: 5,
  },
])

assert.equal(meskerem22.some((i) => /Meskerem 22/i.test(i.title)), false, 'date header omitted')
assert.ok(meskerem22.find((i) => /Kotolos/i.test(i.title)))
assert.ok(meskerem22.find((i) => i.title === 'Saint Julius'))
const balan = meskerem22.find((i) => /Balan/i.test(i.title))
// Fragment may surface as cleaned "Balan" or be omitted — never as "is commemorated…"
assert.ok(!meskerem22.some((i) => /^is commemorated/i.test(i.title)))
if (balan) assert.ok(!/^is commemorated/i.test(balan.title))

console.log('synaxarium-presentation checks: ok')
console.log(
  meskerem22.map((i) => ({
    title: i.title,
    category: i.categoryLabel,
    summary: i.summary,
    review: i.reviewStatus,
  })),
)
