import { readFileSync } from 'node:fs'

const sql = readFileSync('supabase/mezmur-import/APPLY_ALL_MEZMUR_LYRICS_AND_TRANSLITERATIONS.sql', 'utf8')

// Split by statement boundaries
// Statements start with "update public.mezmur_data_import set "
const rawStatements = sql.split(/(?=update public\.mezmur_data_import set )/g).filter(s => s.startsWith('update public.mezmur_data_import set'))

console.log('Total statements found:', rawStatements.length)

const parsed = []
for (let i = 0; i < rawStatements.length; i++) {
  const stmt = rawStatements[i].trim()
  const slugMatch = stmt.match(/where slug = '([^']+)' and deleted_at is null;/i)
  if (!slugMatch) {
    console.error(`Statement ${i} missing slug:`, stmt.slice(-100))
    continue
  }
  const slug = slugMatch[1]
  parsed.push({ idx: i, slug, stmt })
}

console.log('Successfully parsed statements:', parsed.length)
console.log('Sample parsed[0]:', parsed[0].slug)
