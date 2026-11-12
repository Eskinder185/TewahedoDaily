/** Werb form spellings and the new figures/seasons. Run: npx tsx scripts/test-mezmur-form-taxonomy.ts */
import assert from 'node:assert/strict'
import { normalizeMezmurForm, isWerb } from '../src/lib/mezmur/mezmurForm.ts'
import { resolveTaxonomyQuery, canonicalizeCategory, canonicalizeOccasion } from '../src/lib/publicContent/taxonomy.ts'
import { CATEGORY_ENTRIES, OCCASION_ENTRIES } from '../src/lib/mezmur/taxonomyAliases.ts'

for (const spelling of ['werb', 'Werb', 'wereb', ' WEREB ', 'werab', 'ወረብ']) assert.equal(normalizeMezmurForm(spelling), 'werb', spelling)
for (const other of ['mezmur', '', null, undefined, 'hymn', 42]) assert.equal(normalizeMezmurForm(other), 'mezmur', String(other))
assert.ok(isWerb('wereb') && !isWerb('mezmur'))

const cases: Array<['category' | 'occasion', string, string]> = [
  ['occasion', 'ጽጌ', 'Tsige (Flower Season / Fast)'],
  ['occasion', 'tsome tsige', 'Tsige (Flower Season / Fast)'],
  ['occasion', 'Tsige', 'Tsige (Flower Season / Fast)'],
  ['occasion', 'ጾመ ገሃድ', 'Tsome Gehad'],
  ['occasion', 'tsion maryam', 'Hidar Tsion / Tsion Maryam'],
  ['category', 'abune gebre menfes kidus', 'Abune Gebre Menfes Kidus'],
  ['category', 'አቡነ አረጋዊ', 'Abune Aregawi'],
  ['category', 'saint paul', 'Kidus Pawlos / Saint Paul'],
  ['category', 'ቅዱስ ጴጥሮስ', 'Kidus Petros / Saint Peter'],
  ['category', 'kidus lalibela', 'Kidus Lalibela'],
  ['category', 'ቅድስት አርሴማ', 'Kidist Arsema'],
  ['category', 'nine saints', 'Nine Saints'],
  ['category', 'ቅዱስ መርቆሬዎስ', 'Kidus Merkorios'],
]
for (const [kind, query, canonical] of cases) {
  assert.ok(resolveTaxonomyQuery(query).some((hit) => hit.kind === kind && hit.canonical === canonical), `${query} should resolve to ${canonical}`)
  assert.equal((kind === 'category' ? canonicalizeCategory : canonicalizeOccasion)(canonical), canonical)
}
// Entries are unique and every one has an Amharic name and a slug a database row can use.
for (const list of [CATEGORY_ENTRIES, OCCASION_ENTRIES]) {
  assert.equal(new Set(list.map((entry) => entry.slug)).size, list.length)
  for (const entry of list) assert.ok(entry.amharic && /^[a-z0-9-]+$/.test(entry.slug), entry.canonical)
}
console.log('test-mezmur-form-taxonomy: ok')
