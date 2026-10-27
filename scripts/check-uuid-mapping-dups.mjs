import { readFileSync } from 'node:fs'

const lines = readFileSync('supabase/mezmur-import/SAFE_MEZMUR_UPDATES/UUID_MAPPING.csv', 'utf8').split(/\r?\n/).filter(Boolean)
const counts = new Map()
const details = new Map()

for (let i = 1; i < lines.length; i++) {
  const parts = lines[i].split(',')
  const id = parts[0].replace(/^"|"$/g, '')
  const slug = parts[1]?.replace(/^"|"$/g, '')
  const title = parts[2]?.replace(/^"|"$/g, '')
  counts.set(id, (counts.get(id) || 0) + 1)
  if (!details.has(id)) details.set(id, [])
  details.get(id).push({ slug, title, line: i })
}

const dups = [...counts.entries()].filter(([id, c]) => c > 1)
console.log('Duplicate UUIDs in UUID_MAPPING.csv:', dups.length)
dups.forEach(([id, c]) => {
  console.log(`\nUUID: ${id} (${c} times):`)
  details.get(id).forEach(d => console.log(`  Line ${d.line}: slug="${d.slug}", title="${d.title}"`))
})
