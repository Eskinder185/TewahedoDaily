const url = process.env.VITE_SUPABASE_URL
const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY || process.env.VITE_SUPABASE_ANON_KEY
const h = { apikey: key, Authorization: `Bearer ${key}` }
const books = await (
  await fetch(
    `${url}/rest/v1/bible_canonical_books?select=canonical_number,slug,name_en,name_am,collection&order=sort_order`,
    { headers: h },
  )
).json()
const bad = []
const seen = new Map()
for (const b of books) {
  const am = b.name_am || ''
  if (/\uFFFD/.test(am)) bad.push({ kind: 'replacement', slug: b.slug, name_am: am })
  const key2 = `${b.collection}:${b.canonical_number}`
  if (seen.has(key2)) bad.push({ kind: 'dup-number', a: seen.get(key2), b: b.slug })
  else seen.set(key2, b.slug)
}
console.log(
  JSON.stringify(
    {
      total: books.length,
      old: books.filter((b) => b.collection === 'old').length,
      neu: books.filter((b) => b.collection === 'new').length,
      uniqueSlugs: new Set(books.map((b) => b.slug)).size,
      corruptOrDup: bad,
      genesis: books.find((b) => b.slug === 'genesis'),
      samuel: books.find((b) => b.slug === 'samuel'),
    },
    null,
    2,
  ),
)
