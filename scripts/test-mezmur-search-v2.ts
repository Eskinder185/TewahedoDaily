import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { collectPagedRows } from '../src/lib/publicContent/mezmurVisibility'

const migration = readFileSync('supabase/migrations/20261116120000_ranked_paginated_mezmur_search.sql', 'utf8')
assert.match(migration, /from public\.mezmur_public m/i, 'search must use the rights-filtered public projection')
assert.match(migration, /security invoker/i)
assert.match(migration, /count\(\*\) over \(\) as total_count/i)
assert.match(migration, /offset \(i\.page_number - 1\) \* i\.page_size/i)
assert.match(migration, /when 0 then 'exact title'[\s\S]*when 3 then 'alternate title'[\s\S]*when 4 then 'Zemari'[\s\S]*when 5 then 'category'[\s\S]*when 6 then 'occasion'[\s\S]*when 7 then 'lyrics'/i)
assert.match(migration, /normalize\(coalesce\(value, ''\), nfc\)/i)
assert.match(migration, /gin_trgm_ops/i)

const source = Array.from({ length: 2_305 }, (_, index) => index + 1)
const ranges: Array<[number, number]> = []
const loaded = await collectPagedRows(async (from, to) => {
  ranges.push([from, to])
  // Simulate a Data API with a 1,000-row hard response cap.
  return source.slice(from, Math.min(to + 1, from + 1_000))
}, { pageSize: 500 })
assert.equal(loaded.length, source.length)
assert.equal(loaded.at(-1), 2_305)
assert.deepEqual(ranges, [[0, 499], [500, 999], [1000, 1499], [1500, 1999], [2000, 2499]])

const page = 73
const pageSize = 24
const expectedOffset = (page - 1) * pageSize
assert.deepEqual(source.slice(expectedOffset, expectedOffset + pageSize), loaded.slice(expectedOffset, expectedOffset + pageSize))

const library = readFileSync('src/pages/PublicMezmurLibrary.tsx', 'utf8')
assert.match(library, /new AbortController\(\)/)
assert.match(library, /controller\.abort\(\)/)
assert.match(library, /if \(!active \|\| controller\.signal\.aborted\) return/)
assert.match(library, /setReloadTick\(\(n\) => n \+ 1\)/)
assert.match(library, /result && result\.total > 24/)

console.log('Mezmur search v2: ranked fields, cancellation guard, retry, indexes, and pagination beyond 1,000 passed')
