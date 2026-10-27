import { createReadStream } from 'node:fs'
import readline from 'node:readline'

const rl = readline.createInterface({
  input: createReadStream('audit/mezmur-complete-repair/ORIGINAL_BACKUP.jsonl'),
  crlfDelay: Infinity,
})

let count = 0
for await (const line of rl) {
  const obj = JSON.parse(line)
  console.log(`[${count + 1}] import_id: ${obj.import_id}, slug: ${obj.slug}, title: ${obj.title}`)
  count++
  if (count >= 10) break
}
