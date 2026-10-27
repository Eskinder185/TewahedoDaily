import { readFileSync } from 'node:fs'

const backupLines = readFileSync('audit/mezmur-complete-repair/ORIGINAL_BACKUP.jsonl', 'utf8').split(/\r?\n/).filter(Boolean)
const backupRecords = backupLines.map(l => JSON.parse(l))

let emptyTarget = 0
let filledTarget = 0
for (const b of backupRecords) {
  const text = b.lyrics_amharic || b.lyrics_geez || b.lyrics_tigrinya || b.lyrics_english || b.lyrics_oromo
  if (text === '') emptyTarget++
  else if (text) filledTarget++
}

console.log('Original backup target lyrics stats:', { emptyTarget, filledTarget })
