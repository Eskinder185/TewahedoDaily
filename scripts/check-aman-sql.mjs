import { readFileSync } from 'node:fs'

const sql = readFileSync('supabase/mezmur-import/APPLY_ALL_MEZMUR_LYRICS_AND_TRANSLITERATIONS.sql', 'utf8')
const lines = sql.split(/\r?\n/)
for (const l of lines) {
  if (l.includes("where slug = 'aman-beaman'")) {
    console.log(l.slice(0, 300))
  }
}
