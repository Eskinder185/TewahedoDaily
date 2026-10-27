import { readFileSync } from 'node:fs'

const b29 = readFileSync('supabase/mezmur-import/SAFE_MEZMUR_UPDATES/SAFE_UPDATE_BATCHES/batch_29.sql', 'utf8')
const blocks = b29.split(/\s+--\s+([a-z0-9-]+)\s+\("([^"]+)"\)/gi)

const b29Records = []
for (let i = 1; i < blocks.length; i += 3) {
  const slug = blocks[i]
  const title = blocks[i + 1]
  const sql = blocks[i + 2]
  const idMatch = sql.match(/WHERE import_id = '([a-f0-9-]+)'::uuid/i)
  b29Records.push({ slug, title, import_id: idMatch ? idMatch[1] : null })
}

const fmt1 = readFileSync('C:/Users/eskew/Downloads/mezmur-lyrics-format-2026-10-25 (1).csv', 'utf8')
const fmt1Lines = fmt1.split(/\r?\n/)

console.log('Comparing Batch 29 records against mezmur-lyrics-format-2026-10-25 (1).csv:')
for (const r of b29Records) {
  const line = fmt1Lines.find(l => l.includes(r.import_id))
  if (line) {
    console.log(`[${r.slug}] (UUID: ${r.import_id}) -> ${line}`)
  } else {
    console.log(`[${r.slug}] (UUID: ${r.import_id}) -> NOT FOUND`)
  }
}
