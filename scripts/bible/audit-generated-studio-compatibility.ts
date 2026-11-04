import { readFileSync } from 'node:fs'
import type { QuestionDraft, QuestionRow } from '../../src/lib/play/questionLibrary'

process.env.VITE_SUPABASE_URL = 'https://offline-studio-fixture.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_offline_fixture'
const { fromLibraryRow } = await import('../../src/lib/play/studioActivity')

const drafts = JSON.parse(readFileSync('artifacts/faith-challenges/generated-cms-drafts-2026-11-04.json', 'utf8')) as QuestionDraft[]
const failures: Array<{ id: string; error: string }> = []
let compatible = 0
for (const [index, draft] of drafts.entries()) {
  const row = { ...draft, id: `00000000-0000-4000-8000-${String(index + 1).padStart(12, '0')}`,
    question_id: draft.stable_id, status: 'draft', review_notes: null, updated_at: '2026-11-04T12:00:00Z', published_at: null } as QuestionRow
  try {
    if (fromLibraryRow(row, 'fixture-editor')) compatible++
    else failures.push({ id: draft.stable_id, error: 'No Studio adapter' })
  } catch (cause) { failures.push({ id: draft.stable_id, error: cause instanceof Error ? cause.message : String(cause) }) }
}
console.log(JSON.stringify({ total: drafts.length, compatible, incompatible: failures.length, firstFailures: failures.slice(0, 12) }, null, 2))
if (failures.length) process.exitCode = 1
