import fs from 'node:fs'
const url = process.env.VITE_SUPABASE_URL
const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY || process.env.VITE_SUPABASE_ANON_KEY
const h = { apikey: key, Authorization: `Bearer ${key}` }
const books = await (
  await fetch(
    `${url}/rest/v1/bible_canonical_books?select=id,slug,name_en,name_am,collection,canonical_number&order=sort_order`,
    { headers: h },
  )
).json()
const sources = await (
  await fetch(
    `${url}/rest/v1/bible_source_books?select=canonical_book_id,source_name_en,source_name_am,source_book_number,source_order,edition_id&order=source_order`,
    { headers: h },
  )
).json()
const editions = await (await fetch(`${url}/rest/v1/bible_editions?select=id,code,name`, { headers: h })).json()
const ed = Object.fromEntries(editions.map((e) => [e.id, e.code]))
const byCanon = new Map(books.map((b) => [b.id, b]))
const grouped = new Map()
for (const s of sources) {
  const list = grouped.get(s.canonical_book_id) || []
  list.push({ ...s, edition: ed[s.edition_id] })
  grouped.set(s.canonical_book_id, list)
}
const out = []
for (const [id, list] of grouped) {
  const am = list.filter((x) => x.edition === 'am')
  if (am.length <= 1) continue
  const book = byCanon.get(id)
  out.push({
    number: book.canonical_number,
    en: book.name_en,
    am: book.name_am,
    slug: book.slug,
    volumes: am
      .sort((a, b) => a.source_order - b.source_order)
      .map((s) => ({ en: s.source_name_en, am: s.source_name_am })),
  })
}
fs.writeFileSync('tmp/bible-multi-volume.json', JSON.stringify(out, null, 2), 'utf8')
for (const row of out) {
  console.log(`\n${String(row.number).padStart(2, '0')} ${row.en} / ${row.am || '—'} (${row.slug})`)
  for (const v of row.volumes) console.log(`  - ${v.en} | ${v.am || '(no am)'}`)
}
