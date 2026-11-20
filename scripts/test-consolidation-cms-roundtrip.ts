import assert from 'node:assert/strict'
import { buildConsolidation } from './play/consolidate-content'
import { createQuestionLibraryApi, type QuestionLibraryClient } from '../src/lib/play/questionLibraryService'
import { fromLibraryRow, isStudioActivity, toStudioActivityDraft, validateLibraryDraft } from '../src/lib/play/studioActivity'
import { STUDIO_GAMES, type StudioRecord } from '../src/lib/play/contentStudio'
import type { QuestionDraft, QuestionRow } from '../src/lib/play/questionLibrary'

const { valid } = await buildConsolidation()
assert.equal(valid.length, 834)

const rows = new Map<string, QuestionRow>()
for (const [index, item] of valid.entries()) {
  const id = `00000000-0000-4000-8000-${String(index + 1).padStart(12, '0')}`
  rows.set(id, {
    id,
    question_id: item.draft.stable_id,
    ...structuredClone(item.draft),
    status: 'draft',
    review_notes: null,
    updated_at: '2026-11-16T12:00:00.000Z',
    published_at: null,
  })
}

class Query {
  private id = ''
  private patch?: Record<string, unknown>
  constructor(private readonly store: Map<string, QuestionRow>) {}
  select() { return this }
  order() { return Promise.resolve({ data: [...this.store.values()], error: null }) }
  eq(column: string, value: string) { if (column === 'id') this.id = value; return this }
  insert(value: Record<string, unknown>) { this.patch = value; return this }
  update(value: Record<string, unknown>) { this.patch = value; return this }
  single() {
    if (this.patch && this.id) {
      const current = this.store.get(this.id)
      if (!current) return Promise.resolve({ data: null, error: { message: 'not found' } })
      const saved = { ...current, ...structuredClone(this.patch), id: current.id, updated_at: '2026-11-16T12:01:00.000Z' } as QuestionRow
      this.store.set(this.id, saved)
      return Promise.resolve({ data: saved, error: null })
    }
    return Promise.resolve({ data: this.store.get(this.id) || null, error: null })
  }
}
const client = {
  from: () => new Query(rows),
  rpc: async () => ({ data: null, error: null }),
} as unknown as QuestionLibraryClient
const api = createQuestionLibraryApi(client, async () => ({ profileRole: 'admin' }))
const openedByGame = new Map<string, number>()

for (const original of [...rows.values()]) {
  const opened = fromLibraryRow(original, 'staging-admin')
  assert.ok(opened, `${original.stable_id} must open in the CMS`)
  assert.equal(validateLibraryDraft(original).length, 0, `${original.stable_id} must pass its real format validator`)
  openedByGame.set(opened.draft.game, (openedByGame.get(opened.draft.game) || 0) + 1)

  let editable: QuestionDraft
  if (isStudioActivity(original.payload)) {
    const edited = structuredClone(opened) as StudioRecord
    edited.name = `${edited.name} `
    editable = toStudioActivityDraft(edited)
  } else {
    editable = structuredClone({
      stable_id: original.stable_id,
      game_type: original.game_type,
      category: original.category,
      difficulty: original.difficulty,
      payload: original.payload,
      source_references: original.source_references,
    })
  }
  const saved = await api.save(editable, original.id)
  assert.equal(saved.status, 'draft')
  assert.equal(saved.stable_id, original.stable_id)
  assert.ok(fromLibraryRow(saved, 'staging-admin'), `${original.stable_id} must reopen after save`)
}

const importedGames = STUDIO_GAMES.filter(game => game.id !== 'finish-the-mezmur')
for (const game of importedGames) assert.ok((openedByGame.get(game.id) || 0) > 0, `${game.id} has no CMS round-trip fixture`)
assert.equal(openedByGame.get('finish-the-mezmur') || 0, 0, 'PR #15 must not fabricate a Mezmur source record')
assert.equal(rows.size, 834)
console.log(`CMS round trip: all ${rows.size} consolidated drafts opened, edited, saved, and reopened across ${importedGames.length} imported formats; Finish the Mezmur remains source-only and absent`)
