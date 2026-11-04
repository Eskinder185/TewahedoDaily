// Adapter converting generate-amharic-play-drafts output to CMS bulk import format.
import { readFile, writeFile } from 'node:fs/promises'
import { resolve } from 'node:path'
import { pathToFileURL } from 'node:url'
import type { EditorialDraft } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { validateQuestionDraft, type QuestionDraft, type QuestionGameType } from '../../src/lib/play/questionLibrary'

export function adaptDraftToCms(draft: EditorialDraft): QuestionDraft {
  const q = draft.question
  const baseRoute = q.source.route.split('?')[0].split('#')[0]
  const sourceRef = {
    label: q.source.label,
    route: baseRoute,
    kind: 'bible' as const,
  }

  const payload: Record<string, unknown> = {
    id: q.id,
    game: q.game,
    category: q.category,
    difficulty: q.difficulty,
    prompt: q.prompt,
    options: q.options,
    correctKey: q.correctKey,
    explanation: q.explanation,
    source: sourceRef,
    verifiedLocales: ['en'],
    ...(q.excerpt ? { excerpt: q.excerpt } : {}),
    provenance: draft.provenance,
  }

  const cmsDraft: QuestionDraft = {
    stable_id: q.id,
    game_type: q.game as QuestionGameType,
    category: q.category,
    difficulty: q.difficulty,
    payload,
    source_references: [sourceRef],
  }

  const errors = validateQuestionDraft(cmsDraft)
  if (errors.length) {
    throw new Error(`CMS conversion validation failed for ${q.id}: ${errors.join(', ')}`)
  }

  return cmsDraft
}

export function adaptEditorialBatchToCms(batch: { drafts: EditorialDraft[] }): QuestionDraft[] {
  return batch.drafts.map(adaptDraftToCms)
}

async function main() {
  const [inPath, outPath] = process.argv.slice(2)
  if (!inPath || !outPath) {
    throw new Error('Usage: tsx adapt-drafts-for-cms.ts <drafts.json> <cms-import.json>')
  }
  const raw = JSON.parse(await readFile(resolve(inPath), 'utf8')) as { drafts: EditorialDraft[] }
  const adapted = adaptEditorialBatchToCms(raw)
  await writeFile(resolve(outPath), `${JSON.stringify(adapted, null, 2)}\n`, 'utf8')
  console.log(JSON.stringify({ adaptedCount: adapted.length, outPath }))
}

if (import.meta.url === pathToFileURL(process.argv[1] || '').href) {
  main().catch((err) => {
    console.error(err)
    process.exit(1)
  })
}

