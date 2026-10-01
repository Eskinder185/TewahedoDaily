import { createClient } from '@supabase/supabase-js'
import { readFileSync, existsSync } from 'node:fs'
import { getPsalmNumber } from '../src/lib/prayers/psalmNumber.ts'

function load(file) {
  if (!existsSync(file)) return
  for (const line of readFileSync(file, 'utf8').split(/\r?\n/)) {
    const t = line.trim()
    if (!t || t.startsWith('#')) continue
    const i = t.indexOf('=')
    if (i <= 0) continue
    const k = t.slice(0, i).trim()
    let v = t.slice(i + 1).trim()
    if ((v.startsWith('"') && v.endsWith('"')) || (v.startsWith("'") && v.endsWith("'"))) v = v.slice(1, -1)
    if (!process.env[k]) process.env[k] = v
  }
}
load('.env.local')
const sb = createClient(process.env.VITE_SUPABASE_URL, process.env.VITE_SUPABASE_PUBLISHABLE_KEY)
const CID = '73769ee2-6a34-4138-84e1-5f2430d3b61c'

const cases = [
  { slug: 'psalm-001', expect: 1 },
  { slug: 'psalm-002', expect: 2 },
  { slug: 'psalm-009', expect: 9 },
  { slug: 'psalm-010', expect: 10 },
  { slug: 'psalm-50', expect: 50 },
  { slug: 'psalm-51', expect: 51 },
  { slug: 'psalm-99', expect: 99 },
  { slug: 'psalm-100', expect: 100 },
  { slug: 'psalm-149', expect: 149 },
  { slug: 'psalm-150', expect: 150 },
  { slug: 'psalm-023', expect: 23 },
  { slug: 'psalm-119', expect: 119 },
]

let failed = 0
for (const c of cases) {
  const n = getPsalmNumber({ slug: c.slug })
  if (n !== c.expect) {
    console.error('FAIL helper', c.slug, n, 'expected', c.expect)
    failed++
  }
}

const { data: rows, error } = await sb
  .from('prayers')
  .select('id,slug,title,status,text_amharic,text_geez,text_english,title_geez')
  .eq('collection_id', CID)
  .eq('status', 'published')
if (error) throw error

const sorted = [...rows]
  .map((r) => ({ ...r, n: getPsalmNumber(r) }))
  .filter((r) => r.n != null)
  .sort((a, b) => a.n - b.n)

const numbers = sorted.map((r) => r.n)
const visible = numbers.length
const missing = []
for (let i = 1; i <= 150; i++) if (!numbers.includes(i)) missing.push(i)

const orderOk = numbers.every((n, i) => i === 0 || n > numbers[i - 1])

const testSlugs = {
  1: 'psalm-001',
  2: 'psalm-002',
  9: 'psalm-009',
  10: 'psalm-010',
  23: 'psalm-023',
  50: 'psalm-50',
  51: 'psalm-51',
  99: 'psalm-99',
  100: 'psalm-100',
  119: 'psalm-119',
  149: 'psalm-149',
  150: 'psalm-150',
}

for (const [n, slug] of Object.entries(testSlugs)) {
  const row = sorted.find((r) => r.n === Number(n))
  const detail = await sb
    .from('prayers')
    .select('slug,text_amharic,text_geez,text_english')
    .eq('collection_id', CID)
    .eq('slug', slug)
    .eq('status', 'published')
    .maybeSingle()
  const ok =
    row &&
    row.slug === slug &&
    detail.data &&
    (detail.data.text_amharic || '').trim() &&
    (detail.data.text_geez || '').trim()
  if (!ok) {
    console.error('FAIL live', n, slug, { rowSlug: row?.slug, detail: !!detail.data })
    failed++
  }
}

console.log(
  JSON.stringify(
    {
      failed,
      visible,
      missing,
      orderOk,
      first10: numbers.slice(0, 10),
      around50: numbers.filter((n) => n >= 48 && n <= 53),
      last5: numbers.slice(-5),
    },
    null,
    2,
  ),
)
process.exit(failed ? 1 : 0)
