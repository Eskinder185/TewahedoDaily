import { readFileSync } from 'node:fs'

const content = readFileSync('C:/Users/eskew/Downloads/mezmur-classification-2026-10-25 (7).csv', 'utf8')
const lines = content.split(/\r?\n/).filter(l => l.trim())
console.log('Total rows (excl header):', lines.length - 1)

const rows = []
for (let i = 1; i < lines.length; i++) {
  const parts = lines[i].split(',')
  const import_id = parts[0]?.replace(/^"|"$/g, '')
  const slug = parts[1]?.replace(/^"|"$/g, '')
  const title = parts[2]?.replace(/^"|"$/g, '')
  if (import_id && slug) {
    rows.push({ import_id, slug, title })
  }
}
console.log('Parsed rows:', rows.length)

const slugCounts = new Map()
for (const r of rows) {
  slugCounts.set(r.slug, (slugCounts.get(r.slug) || 0) + 1)
}

const duplicates = [...slugCounts.entries()].filter(([s, c]) => c > 1)
console.log('Duplicated slugs count:', duplicates.length)
let totalDupRows = 0
for (const [slug, count] of duplicates) {
  totalDupRows += count
  const matching = rows.filter(r => r.slug === slug)
  console.log(`Slug: ${slug} (${count} occurrences):`)
  matching.forEach(m => console.log(`   import_id: ${m.import_id} | title: ${m.title}`))
}
console.log('Total duplicated rows:', totalDupRows)
