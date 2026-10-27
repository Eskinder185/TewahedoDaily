import { readFileSync } from 'node:fs'

const backupLines = readFileSync('audit/mezmur-complete-repair/ORIGINAL_BACKUP.jsonl', 'utf8').split(/\r?\n/).filter(Boolean)
const backupRecords = backupLines.map(l => JSON.parse(l))

const shareRec = backupRecords.find(r => r.slug === 'share')
const nanaRec = backupRecords.find(r => r.slug === 'nana-amanuel')

console.log('--- share in backup ---')
console.log('Title:', shareRec.title)
console.log('Lyrics snippet:', shareRec.lyrics_amharic?.slice(0, 100))

console.log('\n--- nana-amanuel in backup ---')
console.log('Title:', nanaRec.title)
console.log('Lyrics snippet:', nanaRec.lyrics_amharic?.slice(0, 100))
