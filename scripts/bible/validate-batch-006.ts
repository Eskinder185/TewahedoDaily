/**
 * Validate and finalize Batch 006
 */
import { readFileSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const { validateAmharicQuestionResponse } = await import('../../src/lib/play/amharicBibleQuestionGenerator')
  const { adaptEditorialBatchToCms } = await import('./adapt-drafts-for-cms')
  const { previewQuestionImport } = await import('../../src/lib/play/questionLibrary')

  const BATCH_DIR = 'artifacts/faith-challenges/batch-006'
  const sourceBatch = JSON.parse(readFileSync(join(BATCH_DIR, 'source-batch.json'), 'utf8'))
  const existingPrompts = JSON.parse(readFileSync(join(BATCH_DIR, 'existing-prompts.json'), 'utf8'))
  const offlineResponse = JSON.parse(readFileSync(join(BATCH_DIR, 'offline-response.json'), 'utf8'))
  const modelId = 'copilot-agent-mode'

  console.log('Validating Batch 006 through validateAmharicQuestionResponse...')
  const responseEnvelope = {
    version: 1,
    sourceHash: offlineResponse.sourceHash,
    modelId,
    questions: offlineResponse.questions
  }

  const validated = await validateAmharicQuestionResponse(sourceBatch, modelId, responseEnvelope, existingPrompts)
  console.log(`Batch 006 Generator validation PASSED! ${validated.drafts.length} drafts produced.`)

  writeFileSync(join(BATCH_DIR, 'gemini-response.json'), `${JSON.stringify(responseEnvelope, null, 2)}\n`, 'utf8')
  writeFileSync(join(BATCH_DIR, 'drafts.json'), `${JSON.stringify({
    version: 1,
    status: 'draft',
    editorialReviewRequired: true,
    sourceHash: validated.sourceHash,
    modelId,
    drafts: validated.drafts,
  }, null, 2)}\n`, 'utf8')

  writeFileSync(join(BATCH_DIR, 'report.json'), `${JSON.stringify({
    version: 1,
    accepted: validated.drafts.length,
    rejected: 0,
    sourceHash: validated.sourceHash,
    modelId,
    publication: 'not_allowed',
    editorialReviewRequired: true,
  }, null, 2)}\n`, 'utf8')

  const cmsAdapted = adaptEditorialBatchToCms({ drafts: validated.drafts })
  writeFileSync(join(BATCH_DIR, 'cms-import.json'), `${JSON.stringify(cmsAdapted, null, 2)}\n`, 'utf8')

  const preview = previewQuestionImport(JSON.stringify(cmsAdapted), new Set())
  console.log(`Batch 006 CMS preview: ${preview.items.length} items, ${preview.errors.length} errors.`)
}

run().catch(console.error)

