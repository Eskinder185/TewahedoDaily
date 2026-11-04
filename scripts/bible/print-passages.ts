/**
 * Print batch passages helper for drafting
 */
import fs from 'node:fs'

for (let b = 7; b <= 10; b++) {
  const pad = String(b).padStart(3, '0')
  const sb = JSON.parse(fs.readFileSync(`artifacts/faith-challenges/batch-${pad}/source-batch.json`, 'utf8'))
  console.log(`\n================ BATCH ${pad} (${sb.passages.length} passages) ================`)
  sb.passages.forEach((p: any, i: number) => {
    console.log(`Passage ${i}: ${p.id} [${p.book.slug} ${p.chapter.chapter_number}] (${p.verses.length} verses)`)
    p.verses.forEach((v: any) => {
      console.log(`   v${v.verse_number} (${v.id}): ${v.text.slice(0, 70)}...`)
    })
  })
}

