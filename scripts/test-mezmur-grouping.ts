import assert from 'node:assert/strict'
import fs from 'node:fs'
import path from 'node:path'
import {
  MEZMUR_CATEGORY_BROWSE_GROUPS,
  MEZMUR_OCCASION_BROWSE_GROUPS,
} from '../src/lib/publicContent/mezmurBrowseGroups'
import { CATEGORY_ENTRIES, OCCASION_ENTRIES } from '../src/lib/mezmur/taxonomyAliases'

type Row = Record<string, string>

function parseCsv(input: string): Row[] {
  const rows: string[][] = []
  let row: string[] = []
  let cell = ''
  let quoted = false
  const text = input.replace(/^\uFEFF/, '')
  for (let i = 0; i < text.length; i += 1) {
    const char = text[i]
    if (quoted) {
      if (char === '"' && text[i + 1] === '"') { cell += '"'; i += 1 }
      else if (char === '"') quoted = false
      else cell += char
    } else if (char === '"') quoted = true
    else if (char === ',') { row.push(cell); cell = '' }
    else if (char === '\n' || char === '\r') {
      if (char === '\r' && text[i + 1] === '\n') i += 1
      row.push(cell); rows.push(row); row = []; cell = ''
    } else cell += char
  }
  if (cell || row.length) { row.push(cell); rows.push(row) }
  const [headers = [], ...body] = rows.filter((cells) => cells.some(Boolean))
  return body.map((cells) => Object.fromEntries(headers.map((header, index) => [header, cells[index] ?? ''])))
}

const reportDir = path.resolve('reports/mezmur-grouping')
const read = (name: string) => parseCsv(fs.readFileSync(path.join(reportDir, name), 'utf8'))

const grouped = read('mezmur_classification_grouped_2092.csv')
const categories = read('mezmur_category_relationships.csv')
const occasions = read('mezmur_occasion_relationships.csv')
const mapping = read('mezmur_browse_card_mapping.csv')
const summary = read('mezmur_grouping_summary.csv')
const review = read('mezmur_unclassified_review.csv')

assert.equal(grouped.length, 2092)
assert.equal(new Set(grouped.map((row) => row.import_id)).size, 2092)
assert.equal(grouped.filter((row) => row.publication_status === 'published').length, 1803)
assert.equal(grouped.filter((row) => row.publication_status === 'draft').length, 289)
assert.equal(grouped.every((row) => row.status === row.publication_status), true)
assert.equal(grouped.every((row) => row.review_required === row.needs_review), true)

assert.equal(MEZMUR_CATEGORY_BROWSE_GROUPS.length, 5)
assert.equal(MEZMUR_OCCASION_BROWSE_GROUPS.length, 4)
assert.equal(new Set(MEZMUR_CATEGORY_BROWSE_GROUPS.flatMap((group) => group.taxonomySlugs)).size, 25)
assert.equal(new Set(MEZMUR_OCCASION_BROWSE_GROUPS.flatMap((group) => group.taxonomySlugs)).size, 24)
assert.deepEqual(
  new Set(MEZMUR_CATEGORY_BROWSE_GROUPS.flatMap((group) => group.taxonomySlugs)),
  new Set(CATEGORY_ENTRIES.map((entry) => entry.slug)),
)

const prayerWorship = MEZMUR_CATEGORY_BROWSE_GROUPS.find((group) => group.slug === 'prayer-worship')
assert.ok(prayerWorship)
assert.ok(prayerWorship.taxonomySlugs.includes('repentance'))
assert.ok(prayerWorship.shortcuts?.some((item) => item.slug === 'fasting-suitable'))
assert.ok(!MEZMUR_CATEGORY_BROWSE_GROUPS.some((group) => group.slug === 'repentance'))

const virginMary = MEZMUR_CATEGORY_BROWSE_GROUPS.find((group) => group.slug === 'category-virgin-mary')
assert.deepEqual(
  virginMary?.shortcuts?.filter((item) => item.kind === 'occasion').map((item) => item.slug),
  ['kidane-mihret', 'filseta', 'lideta-maryam'],
)

const christ = MEZMUR_CATEGORY_BROWSE_GROUPS.find((group) => group.slug === 'jesus-christ-salvation')
assert.deepEqual(
  christ?.shortcuts?.filter((item) => item.kind === 'occasion').map((item) => item.slug),
  ['hosanna', 'gena', 'timket', 'siklet', 'tinsae', 'debre-tabor', 'meskel'],
)
assert.deepEqual(
  new Set(MEZMUR_OCCASION_BROWSE_GROUPS.flatMap((group) => group.taxonomySlugs)),
  new Set(OCCASION_ENTRIES.map((entry) => entry.slug)),
)

assert.equal(mapping.filter((row) => row.taxonomy_type === 'category').length, 25)
assert.equal(mapping.filter((row) => row.taxonomy_type === 'occasion').length, 24)
assert.equal(new Set(mapping.map((row) => `${row.taxonomy_type}:${row.canonical_slug}`)).size, 49)

assert.equal(new Set(categories.map((row) => `${row.mezmur_import_id}:${row.category_slug}`)).size, categories.length)
assert.equal(new Set(occasions.map((row) => `${row.mezmur_import_id}:${row.occasion_slug}`)).size, occasions.length)
assert.equal(categories.every((row) => row.source_category === 'lyrics-classifier-primary' || row.source_category === 'lyrics-classifier-secondary'), true)
assert.equal(occasions.every((row) => row.source_occasion === 'lyrics-classifier-primary' || row.source_occasion === 'lyrics-classifier-secondary'), true)
assert.equal(categories.every((row) => CATEGORY_ENTRIES.some((entry) => entry.slug === row.category_slug)), true)
assert.equal(occasions.every((row) => OCCASION_ENTRIES.some((entry) => entry.slug === row.occasion_slug)), true)
assert.equal(review.filter((row) => row.review_reasons.includes('no_canonical_category')).length, 466)

const cardSummaries = summary.filter((row) => row.subcategory === '(all)')
// Historical report artifacts retain the six-card snapshot. The live hierarchy
// intentionally nests Repentance beneath Prayer & Worship without rewriting it.
assert.equal(cardSummaries.filter((row) => row.dimension === 'category').length, 6)
assert.equal(cardSummaries.filter((row) => row.dimension === 'occasion').length, 4)
assert.equal(cardSummaries.every((row) => Number(row.published_records) <= Number(row.all_records)), true)

console.log(`Mezmur grouping checks passed: ${grouped.length} records, ${categories.length} category links, ${occasions.length} occasion links, ${review.length} review rows.`)
