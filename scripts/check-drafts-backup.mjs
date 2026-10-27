import { readFileSync } from 'node:fs'

const lines = readFileSync('audit/mezmur-complete-repair/ORIGINAL_BACKUP.jsonl', 'utf8').split(/\r?\n/).filter(Boolean)
const records = lines.map(l => JSON.parse(l))
const draftsWithLyrics = records.filter(r => r.status === 'draft' && (r.lyrics_amharic || r.lyrics_geez || r.lyrics_tigrinya || r.lyrics_english || r.lyrics_oromo))
console.log('Drafts with lyrics in backup:', draftsWithLyrics.length)
draftsWithLyrics.forEach(d => console.log(d.slug, `"${d.title}"`))
