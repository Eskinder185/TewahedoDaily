/**
 * Test questions against source batch verses
 */
import fs from 'node:fs'

const sb = JSON.parse(fs.readFileSync('artifacts/faith-challenges/batch-007/source-batch.json', 'utf8'))
sb.passages.forEach((p: any, i: number) => {
  console.log(`\n=== P${i}: ${p.id} [${p.book.slug} ${p.chapter.chapter_number}] ===`)
  p.verses.forEach((v: any) => {
    console.log(`  v${v.verse_number} (${v.id}): "${v.text}"`)
  })
})

