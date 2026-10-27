import * as fs from 'node:fs'
import { parseStructuredLyrics } from '../src/lib/mezmur/structuredLyricsParser.ts'

const backup = JSON.parse(fs.readFileSync('backup/MEZMUR_ORIGINAL_BACKUP.json', 'utf8'))

function stripAzmachPlaceholders(text: string): string {
  return text.split('\n')
    .filter(line => !/^\s*አዝ[.\s…–—_-]*$/i.test(line.trim()))
    .join('\n')
}

let remainingMismatches: any[] = []

for (const r of backup) {
  if (r.lyrics_amharic && r.lyrics_transliteration) {
    const amClean = stripAzmachPlaceholders(r.lyrics_amharic)
    const p = parseStructuredLyrics(amClean, r.lyrics_transliteration)
    if (p.alignmentStatus === 'line_mismatch') {
      remainingMismatches.push({
        slug: r.slug,
        title: r.title,
        mismatches: p.mismatches
      })
    }
  }
}

console.log('Line mismatches before stripping አዝ...:', 80)
console.log('Line mismatches after stripping አዝ...:', remainingMismatches.length)
console.log('\nRemaining line mismatches sample (first 10):')
for (const rm of remainingMismatches.slice(0, 10)) {
  console.log(`- ${rm.slug} (${rm.title}): ${rm.mismatches.slice(0, 2).join('; ')}`)
}
