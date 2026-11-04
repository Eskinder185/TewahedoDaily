/** Offline inventory and draft-import plan. Never opens a database connection or writes rows. */
import { readFileSync, writeFileSync } from 'node:fs'
import { resolve } from 'node:path'
import { createHash } from 'node:crypto'
import { validateQuestionDraft, type QuestionDraft } from '../../src/lib/play/questionLibrary'
import type { PlayQuestion } from '../../src/lib/play/types'

const sources = [
  'artifacts/faith-challenges/library/all-drafts.json',
  'artifacts/play-bible-question-drafts-50.json',
  'artifacts/play-bible-question-drafts-v2-pilot.json',
  'artifacts/play-bible-question-bank-v2-batch-1.json',
  'artifacts/play-bible-question-bank-v2-batch-2.json',
  'artifacts/play-bible-bank-v3-batch-1.json',
] as const
const read = (path: string): unknown => JSON.parse(readFileSync(resolve(path), 'utf8'))
const object = (value: unknown): value is Record<string, unknown> => !!value && typeof value === 'object' && !Array.isArray(value)
const canonical = (value: unknown): unknown => Array.isArray(value) ? value.map(canonical) : object(value)
  ? Object.fromEntries(Object.keys(value).sort().map(key => [key, canonical(value[key])])) : value
const hash = (value: unknown) => createHash('sha256').update(JSON.stringify(canonical(value))).digest('hex')
const comparable = (value: { game_type?: unknown; category?: unknown; difficulty?: unknown; payload?: unknown; source_references?: unknown }) => ({ game_type: value.game_type, category: value.category,
  difficulty: value.difficulty, payload: value.payload, source_references: value.source_references })

export function inventoryGenerated(existingRows: unknown[] | null = null) {
  const existing = new Map<string, Record<string, unknown>[]>()
  for (const row of existingRows || []) {
    if (!object(row)) throw new Error('Existing-row export contains a non-object row.')
    const payloadId = object(row.payload) ? row.payload.id : null
    for (const id of new Set([row.stable_id, row.question_id, payloadId])) {
      if (typeof id === 'string' && id) existing.set(id, [...(existing.get(id) || []), row])
    }
  }
  const seen = new Set<string>()
  const items: Array<{ id: string; game: string; sourceFile: string; sourceHash: string; draftHash: string; action: 'pending-reconciliation' | 'insert-draft' | 'skip-existing' | 'conflict' | 'reject'; errors: string[]; conflictReasons: string[]; existingStatus?: string; existingRowId?: string; draft: QuestionDraft }> = []
  for (const sourceFile of sources) {
    const file = read(sourceFile)
    if (!object(file)) throw new Error(`${sourceFile}: expected an object`)
    const entries = file.drafts || file.questions
    if (!Array.isArray(entries)) throw new Error(`${sourceFile}: no question array`)
    for (const entry of entries) {
      const wrapped = object(entry) && object(entry.question)
      const q = (wrapped ? entry.question : entry) as PlayQuestion
      if (!object(q)) throw new Error(`${sourceFile}: malformed question`)
      const source = object(q.source) ? { label: String(q.source.label || ''), route: String(q.source.route || '').split('?')[0].split('#')[0], kind: q.source.kind } : { label: '', route: '', kind: 'bible' }
      const provenance = wrapped && object(entry.provenance) ? entry.provenance : {
        generatorFile: sourceFile, sourceSnapshot: typeof file.sourceSnapshot === 'string' ? file.sourceSnapshot : undefined,
        edition: typeof file.edition === 'string' ? file.edition : undefined,
      }
      const draft: QuestionDraft = {
        stable_id: String(q.id || ''), game_type: q.game, category: q.category, difficulty: q.difficulty,
        payload: { ...q, source, verifiedLocales: ['en'], provenance }, source_references: [source],
      }
      const errors = validateQuestionDraft(draft)
      if (!source.label || !source.route) errors.push('Missing source reference.')
      if (seen.has(draft.stable_id)) errors.push('Duplicate stable ID in canonical generated files.')
      seen.add(draft.stable_id)
      const matches = [...new Set(existing.get(draft.stable_id) || [])]
      const stored = matches[0]
      const conflictReasons: string[] = []
      if (matches.length > 1) conflictReasons.push('Identifier matches multiple existing rows.')
      if (stored) {
        if (stored.stable_id !== draft.stable_id || stored.question_id !== draft.stable_id || !object(stored.payload) || stored.payload.id !== draft.stable_id) {
          conflictReasons.push('Existing question_id, stable_id and payload.id do not all match.')
        }
        if (hash(comparable(stored)) !== hash(comparable(draft))) conflictReasons.push('Existing content or source references differ from generated draft.')
      }
      items.push({ id: draft.stable_id, game: String(q.game || ''), sourceFile, sourceHash: hash(q), draftHash: hash(comparable(draft)),
        action: errors.length ? 'reject' : conflictReasons.length ? 'conflict' : stored ? 'skip-existing' : existingRows === null ? 'pending-reconciliation' : 'insert-draft', errors, conflictReasons,
        ...(stored ? { existingStatus: String(stored.status || 'unknown'), existingRowId: String(stored.id || '') } : {}), draft })
    }
  }
  const breakdown = Object.fromEntries([...new Set(items.map(item => item.game))].sort().map(game => [game, items.filter(item => item.game === game).length]))
  return { mode: 'offline-dry-run', databaseReconciled: existingRows !== null, total: items.length, breakdown,
    valid: items.filter(item => !item.errors.length).length, rejected: items.filter(item => item.action === 'reject').length,
    conflicts: existingRows !== null ? items.filter(item => item.action === 'conflict').length : null,
    duplicateIds: items.filter(item => item.errors.some(error => error.includes('Duplicate stable ID'))).map(item => item.id),
    missingSources: items.filter(item => item.errors.some(error => error.includes('source reference') || error.includes('source.'))).map(item => item.id),
    alreadyImported: existingRows !== null ? items.filter(item => item.action === 'skip-existing' || item.action === 'conflict').length : null,
    skipped: existingRows !== null ? items.filter(item => item.action === 'skip-existing').length : null,
    notYetImported: existingRows !== null ? items.filter(item => item.action === 'insert-draft').length : null,
    insertCandidatesAwaitingReconciliation: items.filter(item => item.action === 'insert-draft' || item.action === 'pending-reconciliation').length, items }
}

export function parseCompleteStaffInventory(value: unknown): unknown[] {
  if (!object(value) || value.kind !== 'faith-challenges-staff-inventory-v1' || value.complete !== true ||
      !Array.isArray(value.rows) || !Number.isSafeInteger(value.visibleCount) || value.visibleCount !== value.rows.length ||
      value.pageSize !== 250 || !Number.isSafeInteger(value.pages) || value.pages !== Math.max(1, Math.ceil(value.visibleCount / 250)) ||
      typeof value.exportedAt !== 'string' || !Number.isFinite(Date.parse(value.exportedAt))) {
    throw new Error('Existing-row export must be a complete counted staff-inventory-v1 envelope. Partial or legacy arrays are rejected.')
  }
  const ids = new Set<string>()
  for (const row of value.rows) {
    if (!object(row) || typeof row.id !== 'string' || !row.id || ids.has(row.id)) throw new Error('Staff inventory has a malformed or repeated row ID.')
    ids.add(row.id)
  }
  return value.rows
}

if (process.argv[1]?.replaceAll('\\', '/').endsWith('/inventory-generated-questions.ts')) {
  const args = process.argv.slice(2)
  const existingArg = args.indexOf('--existing-export')
  const draftsArg = args.indexOf('--drafts-out')
  const reportArg = args.indexOf('--report-out')
  if (args.length !== (existingArg < 0 ? 0 : 2) + (draftsArg < 0 ? 0 : 2) + (reportArg < 0 ? 0 : 2) ||
      (existingArg >= 0 && !args[existingArg + 1]) || (draftsArg >= 0 && !args[draftsArg + 1]) || (reportArg >= 0 && !args[reportArg + 1])) {
    throw new Error('Usage: inventory-generated-questions.ts [--existing-export staff-records.json] [--drafts-out new-file.json] [--report-out new-report.json]')
  }
  const exportFile = existingArg >= 0 ? read(args[existingArg + 1]) : null
  const rows = exportFile === null ? null : parseCompleteStaffInventory(exportFile)
  const plan = inventoryGenerated(rows)
  if (draftsArg >= 0) writeFileSync(resolve(args[draftsArg + 1]), JSON.stringify(plan.items.filter(item => item.action === 'insert-draft' || item.action === 'pending-reconciliation').map(item => item.draft), null, 2) + '\n', { flag: 'wx' })
  const report = { ...plan, items: plan.items.map(({ draft: _draft, ...item }) => item) }
  if (reportArg >= 0) writeFileSync(resolve(args[reportArg + 1]), JSON.stringify(report, null, 2) + '\n', { flag: 'wx' })
  console.log(JSON.stringify(report, null, 2))
}
