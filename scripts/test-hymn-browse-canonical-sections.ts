/**
 * Integration test: runs the real Hymns Practice browse code (hymnBrowse.ts)
 * against a local mock of the Supabase REST API.
 *
 * Data: the live mezmur_sections_import snapshot (mezmur-research/data/
 * existing_tewahedodaily_snapshot.json) plus a few synthetic, clearly fake
 * Mezmurs linked to categories / occasions — no production lyrics are used.
 *
 * Checks that the group and section pages:
 *  - keep every existing section and URL,
 *  - show canonical fallback sections (Salvation, John the Baptist, Prophets,
 *    Tsome Nebiyat, Tsome Hawariat, Annual Saint Feast, Erget, Baptism, Funeral)
 *    when they have Mezmurs and hide them when empty,
 *  - count legacy link slugs (new-year-enkutatash, funeral-memorial),
 *  - fill manual sections (general-mezmur, repentance-holy-week) from links.
 *
 * Run: npm run test:hymn-browse-sections
 */
import assert from 'node:assert/strict'
import fs from 'node:fs'
import http from 'node:http'
import path from 'node:path'
import type { AddressInfo } from 'node:net'

type Row = Record<string, unknown>

const snapshot = JSON.parse(
  fs.readFileSync(path.join(process.cwd(), 'mezmur-research/data/existing_tewahedodaily_snapshot.json'), 'utf8'),
) as { mezmur_sections_import: Row[] }

const sections: Row[] = snapshot.mezmur_sections_import.map((r) => ({ ...r, deleted_at: null }))

// Synthetic published Mezmurs (fake slugs/titles, no lyrics)
const fake = (n: number, lang = 'amharic'): Row => ({
  mezmur_id: `00000000-0000-4000-8000-${String(n).padStart(12, '0')}`,
  import_id: `10000000-0000-4000-8000-${String(n).padStart(12, '0')}`,
  slug: `test-mezmur-${n}`, title: `Test Mezmur ${n}`, title_amharic: null, title_english: null,
  primary_language: lang, status: 'published', deleted_at: null, image_path: null, legacy_thumbnail_url: null,
  youtube_url: null, singer_name: null, zemari_id: null, singer_slug: null, search_keywords: '', form: 'mezmur',
})
const mezmurs: Row[] = Array.from({ length: 14 }, (_, i) => fake(i + 1))
mezmurs.push({ ...fake(99), status: 'draft' }) // must never be counted
// 1,200 published English Mezmurs: more than one 1,000-row response.
for (let n = 1000; n < 2200; n++) mezmurs.push(fake(n, 'english'))

const catLinks: Row[] = []
const occLinks: Row[] = []
const linkCat = (n: number, slug: string) => catLinks.push({ mezmur_import_id: fake(n).import_id, mezmur_id: fake(n).mezmur_id, mezmur_slug: fake(n).slug, category_slug: slug })
const linkOcc = (n: number, slug: string) => occLinks.push({ mezmur_import_id: fake(n).import_id, mezmur_id: fake(n).mezmur_id, mezmur_slug: fake(n).slug, occasion_slug: slug })
linkCat(1, 'salvation'); linkCat(2, 'salvation')
linkCat(3, 'yohannes-metmek-john-the-baptist')
linkCat(4, 'prophets')
linkOcc(5, 'tsome-nebiyat'); linkOcc(6, 'tsome-hawariat')
linkOcc(7, 'annual-saint-feast')
linkOcc(8, 'erget')
linkOcc(9, 'funeral-memorial') // legacy slug written by the old CSV importer
linkOcc(10, 'new-year-enkutatash') // legacy slug
linkOcc(11, 'general-anytime') // legacy slug
linkOcc(12, 'holy-week')
linkCat(13, 'kidus-michael') // existing live section
linkCat(13, 'Kidus Mikael')
linkCat(13, 'ቅዱስ ሚካኤል')
linkCat(14, 'Saint George')
linkOcc(14, 'Genna')
linkOcc(99, 'Gena')
linkCat(99, 'salvation') // draft — must not count
// no links for "baptism" → that fallback section must stay hidden

const TABLES: Record<string, Row[]> = {
  mezmur_sections_import: sections,
  mezmur_public: mezmurs,
  mezmur_category_links_public: catLinks,
  mezmur_occasion_links_public: occLinks,
  mezmur_section_links_import: [],
}

function applyFilters(rows: Row[], params: URLSearchParams): Row[] {
  let out = rows
  for (const [key, raw] of params) {
    if (['select', 'limit', 'offset', 'order'].includes(key)) continue
    const m = /^(eq|neq|in|is)\.(.*)$/.exec(raw)
    if (!m) continue
    const [, op, val] = m
    if (op === 'eq') out = out.filter((r) => String(r[key] ?? '') === val)
    if (op === 'neq') out = out.filter((r) => String(r[key] ?? '') !== val)
    if (op === 'is' && val === 'null') out = out.filter((r) => r[key] == null)
    if (op === 'in') {
      const set = new Set(val.replace(/^\(|\)$/g, '').split(',').map((v) => v.replace(/^"|"$/g, '')))
      out = out.filter((r) => set.has(String(r[key] ?? '')))
    }
  }
  const offset = Number(params.get('offset') || 0)
  // Like Supabase, never return more than 1,000 rows per request.
  const limit = Math.min(1000, params.get('limit') ? Number(params.get('limit')) : 1000)
  return out.slice(offset, offset + limit)
}

const server = http.createServer((req, res) => {
  const url = new URL(req.url || '/', 'http://localhost')
  const table = url.pathname.replace(/^\/rest\/v1\//, '')
  res.setHeader('content-type', 'application/json')
  const rows = TABLES[table]
  if (!rows) {
    res.statusCode = 404
    res.end(JSON.stringify({ code: 'PGRST205', message: `Could not find the table 'public.${table}' in the schema cache` }))
    return
  }
  let data = applyFilters(rows, url.searchParams)
  const range = /^(\d+)-(\d+)$/.exec(String(req.headers.range || ''))
  if (range) data = data.slice(Number(range[1]), Math.min(Number(range[2]) + 1, Number(range[1]) + 1000))
  res.end(JSON.stringify(data))
})

await new Promise<void>((resolve) => server.listen(0, '127.0.0.1', resolve))
const port = (server.address() as AddressInfo).port
process.env.VITE_SUPABASE_URL = `http://127.0.0.1:${port}`
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'test-publishable-key'

const browse = await import('../src/lib/publicContent/hymnBrowse')
const taxonomy = await import('../src/lib/publicContent/browseTaxonomy')
const { CATEGORY_ENTRIES, OCCASION_ENTRIES } = await import('../src/lib/mezmur/taxonomyAliases')
const { MEZMUR_CATEGORY_BROWSE_GROUPS, MEZMUR_OCCASION_BROWSE_GROUPS } = await import('../src/lib/publicContent/mezmurBrowseGroups')

let passed = 0
const failures: string[] = []
async function test(name: string, fn: () => Promise<void>) {
  try {
    await fn()
    passed++
    console.log(`✓ ${name}`)
  } catch (e) {
    failures.push(name)
    console.log(`✗ ${name}\n    ${(e as Error).message.split('\n')[0]}`)
  }
}

const liveBy = (g: string) => sections.filter((s) => s.collection_slug === g && s.status === 'published').map((s) => String(s.section_slug))
const slugsOf = async (g: string) => (await browse.getSectionsForCollection(g)).map((s) => s.slug)
const countOf = async (g: string, s: string) => (await browse.getSectionsForCollection(g)).find((x) => x.slug === s)?.mezmurCount ?? -1

for (const g of [...new Set(sections.map((s) => String(s.collection_slug)))]) {
  await test(`group ${g}: every live section is still listed`, async () => {
    const got = await slugsOf(g)
    for (const s of liveBy(g)) assert.ok(got.includes(s), `missing ${s}`)
  })
}
await test('Salvation appears under jesus-christ with 2 published Mezmurs (draft excluded)', async () => {
  assert.equal(await countOf('jesus-christ', 'christ-salvation'), 2)
})
await test('John the Baptist and Prophets appear under angels-saints', async () => {
  assert.equal(await countOf('angels-saints', 'saint-john-the-baptist'), 1)
  assert.equal(await countOf('angels-saints', 'prophets'), 1)
})
await test('Annual Saint Feasts appears under angels-saints', async () => {
  assert.equal(await countOf('angels-saints', 'annual-saint-feasts'), 1)
})
await test('Tsome Nebiyat and Tsome Hawariat appear under repentance-fasting', async () => {
  assert.equal(await countOf('repentance-fasting', 'tsome-nebiyat'), 1)
  assert.equal(await countOf('repentance-fasting', 'tsome-hawariat'), 1)
})
await test('Erget appears under holidays-feasts', async () => {
  assert.equal(await countOf('holidays-feasts', 'holidays-erget'), 1)
})
await test('Funeral counts a legacy "funeral-memorial" link; empty Baptism stays hidden', async () => {
  assert.equal(await countOf('sacraments-church-life', 'funeral'), 1)
  assert.ok(!(await slugsOf('sacraments-church-life')).includes('baptism'))
})
await test('New Year section counts a legacy "new-year-enkutatash" link', async () => {
  assert.equal(await countOf('holidays-feasts', 'holidays-new-year'), 1)
})
await test('manual sections now show linked Mezmurs (general-mezmur, repentance-holy-week)', async () => {
  assert.equal(await countOf('praise-general', 'general-mezmur'), 1)
  assert.equal(await countOf('repentance-fasting', 'repentance-holy-week'), 1)
  assert.equal(await countOf('holidays-feasts', 'holidays-holy-week'), 1)
})
await test('existing St. Michael section keeps its URL and count', async () => {
  const s = (await browse.getSectionsForCollection('angels-saints')).find((x) => x.slug === 'saint-michael')
  assert.equal(s?.href, '/hymns/browse/angels-saints/saint-michael')
  assert.equal(s?.mezmurCount, 1)
})
await test('section page resolves a fallback section and lists its Mezmurs', async () => {
  const section = await browse.getHymnSection('jesus-christ', 'christ-salvation')
  assert.equal(section?.title, 'Salvation')
  assert.equal(section?.href, '/hymns/browse/jesus-christ/christ-salvation')
  const { items, total } = await browse.getMezmursForSection('jesus-christ', 'christ-salvation')
  assert.equal(total, 2)
  assert.deepEqual(items.map((i) => i.slug).sort(), ['test-mezmur-1', 'test-mezmur-2'])
})
await test('section page for a live section is unchanged', async () => {
  const section = await browse.getHymnSection('angels-saints', 'saint-michael')
  assert.equal(section?.title, 'St. Michael')
  const { total } = await browse.getMezmursForSection('angels-saints', 'saint-michael')
  assert.equal(total, 1)
})
await test('unknown section slugs still return nothing (no catch-all fallback)', async () => {
  assert.equal(await browse.getHymnSection('jesus-christ', 'not-a-section'), null)
  assert.equal(await browse.getHymnSection('angels-saints', 'christ-salvation'), null)
})
await test('collection counts are not truncated at 1,000 rows (English Mezmur = 1,200)', async () => {
  const english = (await browse.getHymnCollections()).find((c) => c.slug === 'english-mezmur')
  assert.ok(english, 'english-mezmur collection missing')
  assert.equal(english.mezmurCount, 1200)
})
await test('every canonical CMS entry has a public subcategory route', async () => {
  const categories = new Set(MEZMUR_CATEGORY_BROWSE_GROUPS.flatMap((g) => g.taxonomySlugs))
  const occasions = new Set(MEZMUR_OCCASION_BROWSE_GROUPS.flatMap((g) => g.taxonomySlugs))
  for (const entry of CATEGORY_ENTRIES) assert.ok(categories.has(entry.slug), `category ${entry.slug}`)
  for (const entry of OCCASION_ENTRIES) assert.ok(occasions.has(entry.slug), `occasion ${entry.slug}`)
  for (const group of [...MEZMUR_CATEGORY_BROWSE_GROUPS, ...MEZMUR_OCCASION_BROWSE_GROUPS]) {
    const children = (await browse.loadBrowseGroupChildren(group.slug)).children
    const keys = children.map((child) => `${child.kind}:${child.slug}`)
    assert.equal(new Set(keys).size, keys.length, `duplicate in ${group.slug}`)
    for (const slug of group.taxonomySlugs) {
      assert.ok(keys.includes(`${group.kind}:${slug}`), `missing ${group.kind}:${slug} in ${group.slug}`)
    }
  }
})
await test('public cards merge CMS spelling variants and exclude draft links', async () => {
  const categories = await browse.getHymnCategories()
  const occasions = await browse.getHymnOccasions()
  assert.equal(categories.find((c) => c.slug === 'kidus-michael')?.mezmurCount, 1)
  assert.equal(categories.find((c) => c.slug === 'kidus-giorgis')?.mezmurCount, 1)
  assert.equal(occasions.find((c) => c.slug === 'gena')?.mezmurCount, 1)
  assert.equal(occasions.find((c) => c.slug === 'funeral')?.mezmurCount, 1)
  assert.equal(occasions.find((c) => c.slug === 'new-year')?.mezmurCount, 1)
  assert.ok(!categories.some((c) => ['Kidus Mikael', 'ቅዱስ ሚካኤል', 'Saint George'].includes(c.slug)))
  assert.ok(!occasions.some((c) => ['Genna', 'funeral-memorial', 'new-year-enkutatash'].includes(c.slug)))
})
await test('browse group children have canonical routes, counts, and no duplicates', async () => {
  const saints = (await browse.loadBrowseGroupChildren('category-angels-saints')).children
  const feasts = (await browse.loadBrowseGroupChildren('occasion-holidays-feasts')).children
  assert.equal(saints.filter((c) => c.slug === 'kidus-michael').length, 1)
  assert.equal(saints.find((c) => c.slug === 'kidus-giorgis')?.href, '/hymns/category/kidus-giorgis')
  assert.equal(saints.find((c) => c.slug === 'kidus-giorgis')?.mezmurCount, 1)
  assert.equal(feasts.find((c) => c.slug === 'gena')?.href, '/hymns/occasion/gena')
  assert.equal(feasts.find((c) => c.slug === 'gena')?.mezmurCount, 1)
  assert.equal(new Set(saints.map((c) => `${c.kind}:${c.slug}`)).size, saints.length)
})
await test('relationship filters select assigned published hymns, with category and occasion separate', async () => {
  const published = await browse.listImportMezmurCards()
  const categories = await browse.fetchAllCategoryLinks()
  const occasions = await browse.fetchAllOccasionLinks()
  const results = (kind: 'category' | 'occasion', slug: string) => {
    const links = kind === 'category' ? categories : occasions
    const matching = links.filter((link) => taxonomy.matchesBrowseLink(kind, [slug],
      kind === 'category' ? String((link as { category_slug: string }).category_slug) : String((link as { occasion_slug: string }).occasion_slug)))
    const ids = new Set(matching.map((link) => link.mezmur_id))
    const slugs = new Set(matching.map((link) => link.mezmur_slug))
    return published.filter((row) => ids.has(row.id) || slugs.has(row.slug)).map((row) => row.slug)
  }
  assert.deepEqual(results('category', 'kidus-michael'), ['test-mezmur-13'])
  assert.deepEqual(results('category', 'saint-george'), ['test-mezmur-14'])
  assert.deepEqual(results('occasion', 'gena'), ['test-mezmur-14'])
  assert.deepEqual(results('occasion', 'funeral'), ['test-mezmur-9'])
  assert.deepEqual(results('category', 'salvation').sort(), ['test-mezmur-1', 'test-mezmur-2'])
  assert.deepEqual(results('occasion', 'salvation'), [])
})
await test('mock data was read, never written', async () => {
  assert.equal(mezmurs.length, 1215)
  assert.equal(mezmurs.filter((m) => m.status === 'published').length, 1214)
})

server.close()
console.log(`\n${passed} passed, ${failures.length} failed`)
if (failures.length) process.exit(1)
