/** Validate and persist a manually curated, offline bilingual campaign batch. */
import { existsSync, readFileSync, writeFileSync } from 'node:fs'
import { createHash } from 'node:crypto'
import { join } from 'node:path'
import { validateAmharicQuestionResponse, validateSourceBatch } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { adaptEditorialBatchToCms } from './adapt-drafts-for-cms'
import { previewQuestionImport } from '../../src/lib/play/questionLibrary'
import { runCampaign } from './campaign-orchestrator'

type Pair = { am: string; en: string }
type Spec = {
  passageId: string
  verse: number
  game: 'trivia' | 'finish-the-verse'
  difficulty: 'beginner' | 'growing' | 'challenge'
  answer: Pair
  kind: 'person' | 'place' | 'object' | 'action' | 'number' | 'phrase'
  prompt?: Pair
  excerpt?: Pair
}
const extraOptions: Record<Spec['kind'], Pair[]> = {
  person: [
    { am: 'ንጉሥ ዳዊት', en: 'King David' }, { am: 'ነቢዩ ኤልያስ', en: 'Elijah the prophet' },
    { am: 'ሐዋርያው ጴጥሮስ', en: 'the apostle Peter' }, { am: 'ንጉሥ ሰሎሞን', en: 'King Solomon' },
  ],
  place: [
    { am: 'ወደ ኢየሩሳሌም', en: 'to Jerusalem' }, { am: 'ወደ ግብፅ', en: 'to Egypt' },
    { am: 'በሲና ተራራ', en: 'on Mount Sinai' }, { am: 'በዮርዳኖስ ወንዝ', en: 'at the Jordan River' },
  ],
  object: [
    { am: 'የወርቅ ዘውድ', en: 'a golden crown' }, { am: 'የድንጋይ ጽላት', en: 'a stone tablet' },
    { am: 'የእንጨት መርከብ', en: 'a wooden ark' }, { am: 'የብር ጽዋ', en: 'a silver cup' },
  ],
  action: [
    { am: 'ወደ ምድረ በዳ ሄዱ', en: 'they went into the wilderness' },
    { am: 'በሰላም ተመለሱ', en: 'they returned in peace' },
    { am: 'በእምነት ጸኑ', en: 'they remained steadfast in faith' },
    { am: 'ሕዝቡን ሰበሰቡ', en: 'they gathered the people' },
  ],
  number: [
    { am: 'ሦስት ቀን', en: 'three days' }, { am: 'ዐሥራ ሁለት ሰዎችን', en: 'twelve people' },
    { am: 'ሰላሳ ቀንና ሰላሳ ሌሊት', en: 'thirty days and thirty nights' },
    { am: 'አምስት እንጀራ', en: 'five loaves' },
  ],
  phrase: [
    { am: 'በምሕረትና በእውነት', en: 'in mercy and truth' },
    { am: 'በጥበብና በትዕግሥት', en: 'with wisdom and patience' },
    { am: 'በፍቅርና በሰላም', en: 'in love and peace' },
    { am: 'በፍርሃትና በጭንቀት', en: 'in fear and distress' },
  ],
}
const batchId = process.argv[2]
if (!/^batch-0(?:0[6-9]|1[0-5])$/.test(batchId || '')) throw new Error('Expected batch-006 through batch-015')
const batchDir = join('artifacts/faith-challenges', batchId)
const draftsPath = join(batchDir, 'drafts.json')
if (existsSync(draftsPath)) throw new Error(`${batchId} is already completed; refusing to overwrite it.`)
const sourceBatch = JSON.parse(readFileSync(join(batchDir, 'source-batch.json'), 'utf8'))
const sourceManifest = JSON.parse(readFileSync(join(batchDir, 'source-manifest.json'), 'utf8'))
const specs: Spec[] = JSON.parse(readFileSync(join(batchDir, 'offline-editorial-specs.json'), 'utf8'))
const { sourceHash } = await validateSourceBatch(sourceBatch)
if (sourceManifest.sourceHash !== sourceHash) throw new Error('Source manifest hash mismatch')
if (specs.length !== sourceBatch.passages.length || specs.length > 20) throw new Error('Expected one spec per source passage')
const modelId = 'offline-copilot-2026-11-04'
const library = JSON.parse(readFileSync('artifacts/faith-challenges/library/all-drafts.json', 'utf8'))
const completedPrompts = library.drafts.map((draft: { question: { prompt: { am: string } } }) => draft.question.prompt.am)
const existingPrompts = [...new Set([...completedPrompts, ...JSON.parse(readFileSync(join(batchDir, 'existing-prompts.json'), 'utf8'))])]
if (existingPrompts.length > 500) throw new Error('Cross-batch prompt window exceeds validator limit')
const usedPassageIds = new Set(library.drafts.map((draft: { provenance: { passageId: string } }) => draft.provenance.passageId))
const keys = ['a', 'b', 'c', 'd'] as const
const answerPositions = new Map(specs
  .map((spec) => ({ passageId: spec.passageId, rank: createHash('sha256').update(`${sourceHash}:${spec.passageId}`).digest('hex') }))
  .sort((a, b) => a.rank.localeCompare(b.rank))
  .map((item, rank) => [item.passageId, rank % 4]))
const questions = specs.map((spec, index) => {
  const passage = sourceBatch.passages[index]
  if (passage.id !== spec.passageId || usedPassageIds.has(spec.passageId)) throw new Error(`Unexpected or reused passage ${spec.passageId}`)
  const verse = passage.verses.find((item: { verse_number: number }) => item.verse_number === spec.verse)
  if (!verse || !verse.text.includes(spec.answer.am)) throw new Error(`Answer not in ${spec.passageId}:${spec.verse}`)
  if (spec.game === 'finish-the-verse') {
    if (!spec.excerpt || !verse.text.includes(spec.excerpt.am + spec.answer.am)) {
      // Whitespace/punctuation between fragments is allowed by the source validator.
      const start = verse.text.indexOf(spec.excerpt?.am || '')
      if (start < 0 || !verse.text.slice(start + (spec.excerpt?.am.length || 0)).trimStart().startsWith(spec.answer.am)) {
        throw new Error(`Nonadjacent verse completion in ${spec.passageId}:${spec.verse}`)
      }
    }
  } else if (!spec.prompt) throw new Error(`Missing trivia prompt for ${spec.passageId}`)
  const passageText = passage.verses.map((item: { text: string }) => item.text).join(' ')
  const distractors = [
    ...specs.filter((other) => other !== spec && other.kind === spec.kind).map((item) => item.answer),
    ...extraOptions[spec.kind],
  ].filter((option) => option.am !== spec.answer.am && !passageText.includes(option.am))
  const unique = [...new Map(distractors.map((option) => [option.am, option])).values()]
  if (unique.length < 3) throw new Error(`Need three distinct ${spec.kind} distractors for ${spec.passageId}`)
  const picked = [0, 1, 2].map((offset) => unique[(index + offset) % unique.length])
  const correctIndex = answerPositions.get(spec.passageId)!
  const optionText = [...picked]
  optionText.splice(correctIndex, 0, spec.answer)
  const referenceAm = `${passage.book.name_am} ${passage.chapter.chapter_number}:${spec.verse}`
  const referenceEn = `${passage.book.slug.replaceAll('-', ' ')} ${passage.chapter.chapter_number}:${spec.verse}`
  const prompt = spec.game === 'trivia' ? spec.prompt! : {
    am: `በ${referenceAm} ያለውን ቃል ያሟሉ፦ “${spec.excerpt!.am} ___”`,
    en: `Complete the verse in ${referenceEn}: “${spec.excerpt!.en} ___”`,
  }
  const explanation = spec.game === 'trivia' ? {
    am: `በ${referenceAm} ውስጥ “${spec.answer.am}” ተጽፏል።`,
    en: `${referenceEn} gives the answer: ${spec.answer.en}.`,
  } : {
    am: `በ${referenceAm} ውስጥ “${spec.excerpt!.am} ${spec.answer.am}” ተጽፏል።`,
    en: `${referenceEn} continues: “${spec.excerpt!.en} ${spec.answer.en}.”`,
  }
  return {
    passageId: spec.passageId, game: spec.game, category: 'Bible' as const, difficulty: spec.difficulty,
    prompt, options: keys.map((key, i) => ({ key, text: optionText[i] })),
    correctKey: keys[correctIndex], explanation,
    evidence: { verseId: verse.id, quoteAm: spec.answer.am },
    excerpt: spec.game === 'finish-the-verse' ? spec.excerpt! : null,
  }
})
const envelope = { version: 1, sourceHash, modelId, questions }
const validated = await validateAmharicQuestionResponse(sourceBatch, modelId, envelope, existingPrompts)
const cms = adaptEditorialBatchToCms({ drafts: validated.drafts })
const preview = previewQuestionImport(JSON.stringify(cms), new Set(library.drafts.map((draft: { question: { id: string } }) => draft.question.id)))
if (preview.errors.length || preview.items.length !== validated.drafts.length) throw new Error(`CMS preview rejected: ${preview.errors.join('; ')}`)
if (validated.drafts.some((draft) => draft.question.verifiedLocales.length || draft.status !== 'draft')) throw new Error('Draft state violation')
// All validation is complete. Persist the batch files, then rebuild aggregate tracking.
writeFileSync(join(batchDir, 'offline-response.json'), JSON.stringify(envelope, null, 2) + '\n')
writeFileSync(draftsPath, JSON.stringify({ version: 1, status: 'draft', editorialReviewRequired: true, sourceHash, modelId, drafts: validated.drafts }, null, 2) + '\n')
writeFileSync(join(batchDir, 'report.json'), JSON.stringify({ version: 1, accepted: validated.drafts.length, rejected: 0, sourceHash, modelId, publication: 'not_allowed', editorialReviewRequired: true }, null, 2) + '\n')
writeFileSync(join(batchDir, 'cms-import.json'), JSON.stringify(cms, null, 2) + '\n')
const manifest = await runCampaign({ execute: false })
if (!manifest.completedBatches.includes(batchId)) throw new Error('Campaign rebuild missed completed batch')
console.log(`${batchId}: ${validated.drafts.length} accepted; aggregate ${manifest.acceptedQuestions}; next ${manifest.pendingBatches[0]}`)
