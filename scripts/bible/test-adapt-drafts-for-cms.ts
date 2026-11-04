import assert from 'node:assert/strict'
import type { EditorialDraft } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { previewQuestionImport, validateQuestionDraft } from '../../src/lib/play/questionLibrary'
import { adaptDraftToCms, adaptEditorialBatchToCms } from './adapt-drafts-for-cms'

const draft: EditorialDraft = {
  status: 'draft',
  editorialReviewRequired: true,
  question: {
    id: 'trivia-genesis-1-1',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: { en: 'What was created?', am: 'ምን ተፈጠረ?' },
    options: [
      { key: 'a', text: { en: 'Light', am: 'ብርሃን' } },
      { key: 'b', text: { en: 'Darkness', am: 'ጨለማ' } },
      { key: 'c', text: { en: 'Sea', am: 'ባሕር' } },
      { key: 'd', text: { en: 'Sky', am: 'ሰማይ' } },
    ],
    correctKey: 'a',
    explanation: { en: 'Light was created in verse 3', am: 'ብርሃን በቁጥር ፫ ተፈጠረ' },
    source: {
      label: 'Genesis 1:3',
      route: '/bible/genesis/1?edition=am#verse-3',
      kind: 'bible',
      sourceId: '00000000-0000-0000-0000-000000000001',
    },
    verifiedLocales: [],
  },
  provenance: {
    sourceHash: 'a'.repeat(64),
    sourceRevision: '2026-10-01T00:00:00Z',
    modelId: 'gemini-2.5-pro',
    passageId: 'am-genesis-1-1',
    editionId: '00000000-0000-0000-0000-000000000002',
    canonCode: 'eotc-81',
    numberingScheme: 'source',
    bookId: '00000000-0000-0000-0000-000000000003',
    chapterId: '00000000-0000-0000-0000-000000000004',
    verseIds: ['00000000-0000-0000-0000-000000000001'],
    evidenceVerseId: '00000000-0000-0000-0000-000000000001',
  },
}

const cmsDraft = adaptDraftToCms(draft)
assert.equal(cmsDraft.stable_id, 'trivia-genesis-1-1')
assert.equal(cmsDraft.game_type, 'trivia')
assert.equal(cmsDraft.category, 'Bible')
assert.equal(cmsDraft.payload.source.route, '/bible/genesis/1')
assert.deepEqual(validateQuestionDraft(cmsDraft), [])

const batch = adaptEditorialBatchToCms({ drafts: [draft] })
const preview = previewQuestionImport(JSON.stringify(batch), new Set())
assert.equal(preview.errors.length, 0)
assert.equal(preview.items.length, 1)

console.log('CMS draft adaptation tests passed.')

