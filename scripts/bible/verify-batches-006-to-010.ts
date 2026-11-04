import { readFileSync } from 'node:fs'
import { join } from 'node:path'
import { previewQuestionImport } from '../../src/lib/play/questionLibrary'

const batches = ['batch-006', 'batch-007', 'batch-008', 'batch-009', 'batch-010']
const seenIds = new Set<string>()

for (const b of batches) {
  const dir = join('artifacts/faith-challenges', b)
  const drafts = JSON.parse(readFileSync(join(dir, 'drafts.json'), 'utf8'))
  const report = JSON.parse(readFileSync(join(dir, 'report.json'), 'utf8'))
  const cms = JSON.parse(readFileSync(join(dir, 'cms-import.json'), 'utf8'))

  const cmsCount = Array.isArray(cms) ? cms.length : cms.items?.length ?? 0
  console.log(`=== CHECKING ${b} ===`)
  console.log(`Report accepted: ${report.accepted}, Drafts count: ${drafts.drafts.length}, CMS count: ${cmsCount}`)

  // Key distribution
  const keys = drafts.drafts.map((d: any) => d.question.correctKey)
  const dist = {
    a: keys.filter((k: string) => k === 'a').length,
    b: keys.filter((k: string) => k === 'b').length,
    c: keys.filter((k: string) => k === 'c').length,
    d: keys.filter((k: string) => k === 'd').length,
  }
  console.log(`Key distribution:`, dist)

  // CMS preview
  const preview = previewQuestionImport(JSON.stringify(cms), seenIds)
  console.log(`CMS preview: ${preview.items.length} items, ${preview.errors.length} errors`)
  if (preview.errors.length) {
    console.error(`Errors in ${b}:`, preview.errors)
    process.exit(1)
  }
  for (const item of preview.items) {
    const id = (item as any).stable_id || (item as any).id
    if (seenIds.has(id)) {
      console.error(`Duplicate ID found: ${id} in ${b}`)
      process.exit(1)
    }
    seenIds.add(id)
  }
}

console.log(`\nALL BATCHES 006-010 VERIFIED! Total unique items accumulated: ${seenIds.size}`)
