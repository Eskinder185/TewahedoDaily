import assert from 'node:assert/strict'
import fs from 'node:fs'
import path from 'node:path'

const source = fs.readFileSync(path.join(process.cwd(), 'src/lib/publicContent/hymnBrowse.ts'), 'utf8')
const start = source.indexOf('export async function getMezmurBySlug')
const end = source.indexOf('\nexport ', start + 1)
const resolver = source.slice(start, end === -1 ? undefined : end)

assert.ok(start >= 0, 'getMezmurBySlug must exist')
assert.match(resolver, /\.eq\('slug', trimmed\)[\s\S]{0,240}\.limit\(2\)/, 'slug lookup must fetch enough rows to detect a collision')
assert.match(resolver, /matchingSlugRows\.length > 1/, 'slug lookup must reject ambiguous results')
assert.match(resolver, /route is ambiguous/, 'route rejection must explain the safe recovery path')
assert.doesNotMatch(resolver, /\.eq\('slug', trimmed\)[\s\S]{0,240}\.limit\(1\)/, 'slug lookup must not silently take a first row')
assert.doesNotMatch(resolver, /\.eq\('mezmur_id', trimmed\)[\s\S]{0,240}\.limit\(1\)/, 'legacy identifier fallback must not silently take a first row')
assert.doesNotMatch(resolver, /\.eq\('slug', matchedSlug\)[\s\S]{0,240}\.limit\(1\)/, 'linked slug fallback must not silently take a first row')

console.log('Mezmur public-route collision safety checks passed.')
