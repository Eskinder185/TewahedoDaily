import { readFileSync } from 'node:fs'

const backupLines = readFileSync('audit/mezmur-complete-repair/ORIGINAL_BACKUP.jsonl', 'utf8').split(/\r?\n/).filter(Boolean)
const backupRecords = backupLines.map(l => JSON.parse(l))

let nullTrans = 0
let emptyTrans = 0
let filledTrans = 0
for (const b of backupRecords) {
  if (b.lyrics_transliteration === null) nullTrans++
  else if (b.lyrics_transliteration === '') emptyTrans++
  else filledTrans++
}

console.log('Original backup transliteration stats:', { nullTrans, emptyTrans, filledTrans })
