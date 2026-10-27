import { readFileSync } from 'node:fs'

const sql = readFileSync('supabase/mezmur-import/APPLY_ALL_MEZMUR_LYRICS_AND_TRANSLITERATIONS.sql', 'utf8')
const lines = sql.split(/\r?\n/)

const sqlSlugs = []
for (const l of lines) {
  const m = l.match(/where slug = '([^']+)'/i)
  if (m) sqlSlugs.push(m[1])
}

console.log('Total updates in SQL:', sqlSlugs.length)
const uniqueSqlSlugs = new Set(sqlSlugs)
console.log('Unique slugs in SQL:', uniqueSqlSlugs.size)

// Duplicate slugs in SQL?
const slugCounts = new Map()
for (const s of sqlSlugs) {
  slugCounts.set(s, (slugCounts.get(s) || 0) + 1)
}
const dupsInSql = [...slugCounts.entries()].filter(([s, c]) => c > 1)
console.log('Slugs appearing multiple times in SQL:', dupsInSql.length)

// How many of the 28 database duplicate slugs are in SQL?
const classFile = 'C:/Users/eskew/Downloads/mezmur-classification-2026-10-25 (7).csv'
const classLines = readFileSync(classFile, 'utf8').split(/\r?\n/).filter(l => l.trim())

function parseCsvLine(line) {
  const result = []
  let current = ''
  let inQuotes = false
  for (let i = 0; i < line.length; i++) {
    const c = line[i]
    if (c === '"') {
      if (inQuotes && line[i + 1] === '"') {
        current += '"'
        i++
      } else {
        inQuotes = !inQuotes
      }
    } else if (c === ',' && !inQuotes) {
      result.push(current)
      current = ''
    } else {
      current += c
    }
  }
  result.push(current)
  return result
}

const dbSlugMap = new Map()
for (let i = 1; i < classLines.length; i++) {
  const parts = parseCsvLine(classLines[i])
  const id = parts[0]
  const slug = parts[1]
  if (!dbSlugMap.has(slug)) dbSlugMap.set(slug, [])
  dbSlugMap.get(slug).push(id)
}

const dbDups = [...dbSlugMap.entries()].filter(([s, ids]) => ids.length > 1)
console.log('Database duplicate slugs:', dbDups.length)

const dupsPresentInSql = dbDups.filter(([s]) => uniqueSqlSlugs.has(s))
console.log('Of 28 DB duplicate slugs, how many are targeted by the 1,121 SQL updates?', dupsPresentInSql.length)
