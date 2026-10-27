import { readFileSync } from 'node:fs'

const classFile = 'C:/Users/eskew/Downloads/mezmur-classification-2026-10-25 (7).csv'
const classLines = readFileSync(classFile, 'utf8').split(/\r?\n/).filter(l => l.trim())

console.log('Searching for nana-amanuel and share in classification file...')
for (let i = 1; i < classLines.length; i++) {
  const line = classLines[i]
  if (line.includes('nana') || line.includes('amanuel') || line.includes('share')) {
    console.log('class line:', line.slice(0, 150))
  }
}

console.log('\nSearching in ORIGINAL_BACKUP.jsonl...')
const backupLines = readFileSync('audit/mezmur-complete-repair/ORIGINAL_BACKUP.jsonl', 'utf8').split(/\r?\n/).filter(Boolean)
for (const l of backupLines) {
  const obj = JSON.parse(l)
  if (obj.slug === 'nana-amanuel' || obj.slug === 'share') {
    console.log('backup obj:', obj.slug, obj.title, 'import_id:', obj.import_id, 'lyrics:', (obj.lyrics_amharic || '').slice(0, 50))
  }
}
