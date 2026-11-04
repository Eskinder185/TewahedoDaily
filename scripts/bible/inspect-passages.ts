import fs from 'node:fs'
import path from 'node:path'

const batchName = process.argv[2] || 'batch-011'
const startIdx = parseInt(process.argv[3] || '0', 10)
const endIdx = parseInt(process.argv[4] || '19', 10)

const filePath = path.join('artifacts/faith-challenges', batchName, 'source-batch.json')
const sb = JSON.parse(fs.readFileSync(filePath, 'utf8'))

console.log(`PASSAGES FOR ${batchName} [${startIdx} to ${endIdx}]:`)
sb.passages.slice(startIdx, endIdx + 1).forEach((p: any, idx: number) => {
  const i = startIdx + idx
  console.log(`\n=== P${i}: ${p.id} [${p.book.name_am} / ${p.book.slug} ch${p.chapter.chapter_number}] ===`)
  p.verses.forEach((v: any) => {
    console.log(`  v${v.verse_number} (${v.id}): "${v.text}"`)
  })
})
