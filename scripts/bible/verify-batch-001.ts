import { readFileSync } from 'node:fs'

const sourceBatch = JSON.parse(readFileSync('artifacts/faith-challenges/batch-001/source-batch.json', 'utf8'))
const rawResponse = JSON.parse(readFileSync('artifacts/faith-challenges/batch-001/gemini-response.json', 'utf8'))
const revisedResponse = JSON.parse(readFileSync('artifacts/faith-challenges/batch-001/revised/revised-gemini-response.json', 'utf8'))

console.log('Source batch passages:', sourceBatch.passages.length)
const passageMap = new Map<string, any>(sourceBatch.passages.map((p: any) => [p.id, p]))

function checkBatch(name: string, questions: any[]) {
  console.log(`Checking ${name} (${questions.length} questions)...`)
  let mismatched = 0
  questions.forEach((q, i) => {
    const passage = passageMap.get(q.passageId)
    if (!passage) {
      console.log(`  [${i}] Unknown passageId: ${q.passageId}`)
      mismatched++
      return
    }
    const verse = passage.verses.find((v: any) => v.id === q.evidence.verseId)
    if (!verse) {
      console.log(`  [${i}] Verse ID ${q.evidence.verseId} NOT found in passage ${q.passageId}`)
      mismatched++
      return
    }
    if (!verse.text.includes(q.evidence.quoteAm)) {
      console.log(`  [${i}] Quote "${q.evidence.quoteAm}" NOT found in verse ${verse.verse_number}`)
      mismatched++
      return
    }
  })
  console.log(`${name} mismatched: ${mismatched}`)
}

checkBatch('rawResponse', rawResponse.questions)
checkBatch('revisedResponse', revisedResponse.questions)

