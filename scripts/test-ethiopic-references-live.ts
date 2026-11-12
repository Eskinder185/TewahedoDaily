/** Live (public read-only) check that Ethiopic-numeral references reach the exact verse. Run: npx tsx --env-file=.env.local scripts/test-ethiopic-references-live.ts */
import assert from 'node:assert/strict'
import { resolveBibleQuery } from '../src/lib/search/resolveBibleQuery.ts'
import { searchSite } from '../src/lib/search/searchSite.ts'

const cases: Array<[string, string]> = [
  ['ዮሐንስ ፫፥፲፮', '/bible/john/3#verse-16'],
  ['ዮሐንስ ምዕራፍ ፫ ቁጥር ፲፮', '/bible/john/3#verse-16'],
  ['ማቴዎስ ፭፥፩', '/bible/matthew/5#verse-1'],
  ['John 3:16', '/bible/john/3#verse-16'],
  ['find John 3:16', '/bible/john/3#verse-16'],
]
for (const [query, route] of cases) {
  const direct = await resolveBibleQuery(query)
  assert.equal(direct.route, route, `resolveBibleQuery ${query}`)
  const site = await searchSite(query, { language: 'am' })
  assert.ok(site.results.some((r) => r.route.replace(/\?edition=\w+/, '') === route), `searchSite ${query} → ${route}; got ${site.results.slice(0, 3).map((r) => r.route).join(', ')}`)
  console.log('ok', query, '→', route)
}
