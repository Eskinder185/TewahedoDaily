/** Permanent multilingual Mezmur regression cases verified against the dated public snapshot. */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { rankPublicRows, type PublicMezmurRow } from '../src/lib/search/mezmurLyricSearch.ts'
import { fuzzyTitleMatches } from '../src/lib/search/translitSkeleton.ts'
import { normalizeMezmurLanguage, type MezmurLanguageCode } from '../src/lib/mezmur/mezmurLanguage.ts'
import { normalizeMezmurForm, type MezmurForm } from '../src/lib/mezmur/mezmurForm.ts'

type GoldenCase = {
  id: string
  query: string
  language?: MezmurLanguageCode
  form?: MezmurForm
  expectedIncludes?: string[]
  expectedFuzzyIncludes?: string[]
  expectedNone?: boolean
}

const rows = JSON.parse(readFileSync('reports/mezmur-quality-audit/PUBLIC_MEZMUR_SNAPSHOT.json', 'utf8')) as PublicMezmurRow[]
const cases = JSON.parse(readFileSync('scripts/search-eval/mezmur-phase1-golden.json', 'utf8')) as GoldenCase[]

for (const test of cases) {
  const eligible = rows.filter((row) =>
    (!test.language || normalizeMezmurLanguage(row.primary_language) === test.language) &&
    (!test.form || normalizeMezmurForm(row.form) === test.form),
  )
  const strict = rankPublicRows(eligible, test.query).map((hit) => String(hit.row.slug))
  if (test.expectedNone) {
    assert.deepEqual(strict, [], test.id)
    continue
  }
  for (const slug of test.expectedIncludes || []) assert.ok(strict.includes(slug), `${test.id}: missing ${slug}`)
  if (test.expectedFuzzyIncludes?.length) {
    const fuzzy = fuzzyTitleMatches(
      eligible.filter((row) => row.slug).map((row) => ({ slug: String(row.slug), title: `${row.title || ''} ${row.title_english || ''} ${row.title_amharic || ''}` })),
      test.query,
      (entry) => entry.title,
      12,
    ).map((hit) => hit.item.slug)
    for (const slug of test.expectedFuzzyIncludes) assert.ok(fuzzy.includes(slug), `${test.id}: fuzzy match missing ${slug}`)
  }
}

console.log(`mezmur Phase 1 golden search: ${cases.length}/${cases.length} passed`)
