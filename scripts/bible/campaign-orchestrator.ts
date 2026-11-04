import { existsSync, mkdirSync, readFileSync, writeFileSync } from 'node:fs'
import { createHash } from 'node:crypto'
import { join } from 'node:path'
import { buildAmharicQuestionPrompt, validateAmharicQuestionResponse, validateSourceBatch, type EditorialDraft } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { adaptEditorialBatchToCms } from './adapt-drafts-for-cms'
import { previewQuestionImport } from '../../src/lib/play/questionLibrary'
import { exclusionReasons, loadAudit, parseSingleColumnExport, preparePlaySourceBatch, type Candidate, type ExistingQuestion } from './prepare-play-source-batch'

const MODEL_ID = 'gemini-2.5-pro'
const TARGET_QUESTIONS = 1000
const ARTIFACTS_DIR = 'artifacts/faith-challenges'
const LIBRARY_DIR = join(ARTIFACTS_DIR, 'library')
const REQUIRED_INPUT_FILES = ['source-batch.json', 'source-manifest.json', 'eligibility-report.json', 'existing-prompts.json', 'gemini-prompt.json'] as const

export function missingBatchInputs(batchDir: string): string[] {
  return REQUIRED_INPUT_FILES.filter((name) => !existsSync(join(batchDir, name)))
}

export function writeMissingJson(path: string, value: unknown): boolean {
  if (existsSync(path)) return false
  writeFileSync(path, `${JSON.stringify(value, null, 2)}\n`, 'utf8')
  return true
}

export function shouldPrepareMore(acceptedUniqueIds: number, target: number, nextBatchIndex: number, maxBatches: number): boolean {
  return acceptedUniqueIds < target && nextBatchIndex <= maxBatches
}

export function countPendingPassages(batches: CampaignManifest['batches']): number {
  return batches.filter((batch) => batch.status === 'pending_generation').reduce((sum, batch) => sum + batch.passageCount, 0)
}

export interface CampaignManifest {
  campaignId: string
  targetQuestions: number
  acceptedQuestions: number
  preparedPassages: number
  pendingPassages: number
  remainingEligiblePassages: number
  sidecarAudit: Array<{ batchId: string; status: 'current' | 'stale'; responseSha256: string; draftsSha256: string }>
  cmsImportParts: Array<{ path: string; count: number }>
  totalBatches: number
  completedBatches: string[]
  pendingBatches: string[]
  failedBatches: string[]
  batches: Array<{
    batchId: string
    status: 'completed' | 'pending_generation' | 'failed'
    passageCount: number
    sourceHash: string
    acceptedCount: number
    rejectedCount: number
    bookSlugs: string[]
  }>
  usedPassages: Array<{
    passageId: string
    route: string
    verseIds: string[]
  }>
  bookCoverage: Record<string, { chaptersUsed: number; totalEligibleChapters: number }>
  categoryCoverage: Record<string, number>
  geminiExecution: {
    apiAvailable: boolean
    modelId: string
    callsMade: number
    estimatedCostUsd: number
    blocker: string | null
  }
}

export function categorizeBook(slug: string): string {
  const pentateuchAndHistories = new Set([
    'genesis', 'exodus', 'leviticus', 'numbers', 'deuteronomy',
    'joshua', 'judges', 'ruth', 'first-samuel', 'second-samuel',
    'first-kings', 'second-kings', 'first-chronicles', 'second-chronicles',
    'ezra', 'nehemiah',
  ])
  const wisdomAndPsalms = new Set([
    'job', 'psalms', 'tegsats', 'ecclesiastes', 'song-of-songs',
    'wisdom', 'sirach',
  ])
  const prophets = new Set([
    'isaiah', 'jeremiah', 'lamentations', 'baruch', 'ezekiel', 'daniel',
    'hosea', 'joel', 'amos', 'obadiah', 'jonah', 'micah', 'nahum',
    'habakkuk', 'zephaniah', 'haggai', 'zechariah', 'malachi',
  ])
  const canonicalAndOrthodox = new Set([
    'enoch', 'jubilees', 'first-meqabyan', 'second-meqabyan', 'third-meqabyan',
    'tobit', 'judith', 'clement', 'didascalia',
  ])
  const gospelsAndActs = new Set(['matthew', 'mark', 'luke', 'john', 'acts'])
  const epistlesAndRevelation = new Set([
    'romans', 'first-corinthians', 'second-corinthians', 'galatians', 'ephesians',
    'philippians', 'colossians', 'first-thessalonians', 'second-thessalonians',
    'first-timothy', 'second-timothy', 'titus', 'philemon', 'hebrews',
    'james', 'first-peter', 'second-peter', 'first-john', 'second-john', 'third-john',
    'jude', 'revelation',
  ])

  if (pentateuchAndHistories.has(slug)) return 'Old Testament Historical'
  if (wisdomAndPsalms.has(slug)) return 'Psalms & Wisdom Literature'
  if (prophets.has(slug)) return 'Prophets'
  if (canonicalAndOrthodox.has(slug)) return 'Ethiopian Orthodox Canonical'
  if (gospelsAndActs.has(slug)) return 'Gospels & Acts'
  if (epistlesAndRevelation.has(slug)) return 'Apostolic Epistles & Revelation'
  return 'Other Scripture'
}

export async function executeBatchWithGemini(batchId: string, apiKey: string) {
  const batchDir = join(ARTIFACTS_DIR, batchId)
  const promptFile = join(batchDir, 'gemini-prompt.json')
  const sourceFile = join(batchDir, 'source-batch.json')
  const existingFile = join(batchDir, 'existing-prompts.json')

  if (!existsSync(promptFile) || !existsSync(sourceFile)) {
    throw new Error(`Batch ${batchId} is missing source or prompt files.`)
  }

  const promptData = JSON.parse(readFileSync(promptFile, 'utf8'))
  const sourceBatch = JSON.parse(readFileSync(sourceFile, 'utf8'))
  const existingPrompts = existsSync(existingFile) ? JSON.parse(readFileSync(existingFile, 'utf8')) : []

  console.log(`[ORCHESTRATOR] Calling Gemini API for ${batchId} (${MODEL_ID})...`)
  const url = `https://generativelanguage.googleapis.com/v1beta/models/${MODEL_ID}:generateContent?key=${apiKey}`

  const response = await fetch(url, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      contents: [{ role: 'user', parts: [{ text: JSON.stringify(promptData.prompt) }] }],
      generationConfig: {
        responseMimeType: 'application/json',
        responseSchema: promptData.schema,
        temperature: 0.2,
      },
    }),
  })

  if (!response.ok) {
    const errText = await response.text()
    writeFileSync(join(batchDir, 'gemini-error.json'), JSON.stringify({ status: response.status, error: errText }, null, 2), 'utf8')
    throw new Error(`Gemini API returned HTTP ${response.status}: ${errText}`)
  }

  const resJson = await response.json()
  const rawText = resJson.candidates?.[0]?.content?.parts?.[0]?.text
  if (!rawText) {
    throw new Error(`Gemini API returned empty candidate response.`)
  }

  const parsed = JSON.parse(rawText)
  writeFileSync(join(batchDir, 'gemini-response.json'), `${JSON.stringify(parsed, null, 2)}\n`, 'utf8')

  // Validate response
  const validated = await validateAmharicQuestionResponse(sourceBatch, MODEL_ID, parsed, existingPrompts)
  writeFileSync(join(batchDir, 'drafts.json'), `${JSON.stringify({
    version: 1,
    status: 'draft',
    editorialReviewRequired: true,
    sourceHash: validated.sourceHash,
    modelId: MODEL_ID,
    drafts: validated.drafts,
  }, null, 2)}\n`, 'utf8')

  writeFileSync(join(batchDir, 'report.json'), `${JSON.stringify({
    version: 1,
    accepted: validated.drafts.length,
    rejected: 0,
    sourceHash: validated.sourceHash,
    modelId: MODEL_ID,
    publication: 'not_allowed',
    editorialReviewRequired: true,
  }, null, 2)}\n`, 'utf8')

  const cmsAdapted = adaptEditorialBatchToCms({ drafts: validated.drafts })
  writeFileSync(join(batchDir, 'cms-import.json'), `${JSON.stringify(cmsAdapted, null, 2)}\n`, 'utf8')
  console.log(`[ORCHESTRATOR] ${batchId} validated successfully! ${validated.drafts.length} drafts produced.`)

  return validated.drafts
}

export async function runCampaign(options: { maxBatches?: number; target?: number; execute?: boolean } = {}) {
  const target = options.target ?? TARGET_QUESTIONS
  const maxBatches = options.maxBatches ?? 150
  mkdirSync(ARTIFACTS_DIR, { recursive: true })
  mkdirSync(LIBRARY_DIR, { recursive: true })

  console.log(`[ORCHESTRATOR] Starting TewahedoDaily 1,000 Questions Campaign...`)
  console.log(`[ORCHESTRATOR] Target: ${target} accepted questions.`)

  // Check Gemini API Availability
  const apiKey = process.env.GEMINI_API_KEY || process.env.GOOGLE_GENAI_API_KEY
  const apiAvailable = Boolean(apiKey && apiKey.trim().length > 10)
  if (!apiAvailable) {
    console.log(`[ORCHESTRATOR] Notice: No GEMINI_API_KEY configured in environment.`)
    console.log(`[ORCHESTRATOR] Operating in Batch Preparation & Offline Verification Mode.`)
  }

  // Load candidate corpus and audit
  const rawCandidates = JSON.parse(readFileSync('exports/play-source-candidates.json', 'utf8'))
  const candidates = parseSingleColumnExport(JSON.stringify(rawCandidates), 'candidate') as Candidate[]
  const rawInventory = JSON.parse(readFileSync('exports/play-question-inventory.json', 'utf8'))
  const inventory = parseSingleColumnExport(JSON.stringify(rawInventory), 'question') as ExistingQuestion[]
  const audit = await loadAudit('artifacts/bible-audit')
  const { APPROVED_QUESTIONS } = await import('../../src/lib/play/approvedContent')

  // Calculate book eligibility totals
  const totalEligibleByBook: Record<string, number> = {}
  for (const c of candidates) {
    if (exclusionReasons(c, audit).length === 0) {
      totalEligibleByBook[c.book.slug] = (totalEligibleByBook[c.book.slug] || 0) + 1
    }
  }

  // Initialize tracking
  const usedRoutes = new Set<string>()
  const usedVerseIds = new Set<string>()
  const usedPassageRecords: Array<{ passageId: string; route: string; verseIds: string[] }> = []
  const allAcceptedDrafts: EditorialDraft[] = []
  const acceptedIds = new Set<string>()
  const acceptedPassages = new Set<string>()
  const batchSummaries: CampaignManifest['batches'] = []
  const completedBatches: string[] = []
  const pendingBatches: string[] = []
  const failedBatches: string[] = []
  const chaptersUsedByBook: Record<string, number> = {}
  const categoryCounts: Record<string, number> = {}
  const sidecarAudit: CampaignManifest['sidecarAudit'] = []
  const ingestDrafts = (batchId: string, drafts: EditorialDraft[], sourceHash: string, passageIds: Set<string>) => {
    if (!Array.isArray(drafts) || drafts.length > passageIds.size) throw new Error(`${batchId}: invalid draft count`)
    for (const draft of drafts) {
      if (draft.status !== 'draft' || draft.question.verifiedLocales.length ||
          draft.provenance.sourceHash !== sourceHash || !passageIds.has(draft.provenance.passageId) ||
          acceptedIds.has(draft.question.id) || acceptedPassages.has(draft.provenance.passageId)) {
        throw new Error(`${batchId}: duplicate, unverified, or source-mismatched accepted draft`)
      }
      acceptedIds.add(draft.question.id)
      acceptedPassages.add(draft.provenance.passageId)
    }
    allAcceptedDrafts.push(...drafts)
  }

  // 1. Process Batch 001 (Existing, Never Overwrite)
  const batch001Dir = join(ARTIFACTS_DIR, 'batch-001')
  if (existsSync(batch001Dir)) {
    console.log(`[ORCHESTRATOR] Preserving and ingesting existing Batch 001...`)
    const b1Manifest = JSON.parse(readFileSync(join(batch001Dir, 'source-manifest.json'), 'utf8'))
    const b1Passages = b1Manifest.passages as Array<{ passageId: string; book: string; chapter: number; verseIds: string[] }>
    for (const p of b1Passages) {
      const route = `/bible/${p.book}/${p.chapter}`
      usedRoutes.add(route)
      for (const vid of p.verseIds) usedVerseIds.add(vid)
      usedPassageRecords.push({ passageId: p.passageId, route, verseIds: p.verseIds })
      chaptersUsedByBook[p.book] = (chaptersUsedByBook[p.book] || 0) + 1
      const cat = categorizeBook(p.book)
      categoryCounts[cat] = (categoryCounts[cat] || 0) + 1
    }

    // Check revised drafts in batch-001/revised or batch-001/drafts.json
    const revisedDraftsPath = join(batch001Dir, 'revised', 'revised-drafts.json')
    const rawDraftsPath = join(batch001Dir, 'drafts.json')
    const b1DraftsFile = existsSync(revisedDraftsPath) ? revisedDraftsPath : rawDraftsPath
    if (existsSync(b1DraftsFile)) {
      const b1Data = JSON.parse(readFileSync(b1DraftsFile, 'utf8'))
      ingestDrafts('batch-001', b1Data.drafts, b1Manifest.sourceHash, new Set(b1Passages.map((p) => p.passageId)))
      completedBatches.push('batch-001')
      batchSummaries.push({
        batchId: 'batch-001',
        status: 'completed',
        passageCount: b1Passages.length,
        sourceHash: b1Manifest.sourceHash,
        acceptedCount: b1Data.drafts.length,
        rejectedCount: 0,
        bookSlugs: b1Passages.map((p) => p.book),
      })
    }
  }

  // 2. Prepare subsequent batches until target is reached or eligible sources are exhausted
  let batchIndex = 2
  const ownerAuthorization = {
    mode: 'owner_authorized' as const,
    basis: 'Website owner authorized AI-assisted Faith Challenges generation using controlled Bible content.',
    authorizedBy: 'site-owner',
    recordedAt: new Date().toISOString(),
  }

  while (shouldPrepareMore(acceptedIds.size, target, batchIndex, maxBatches)) {
    const batchId = `batch-${String(batchIndex).padStart(3, '0')}`
    const batchDir = join(ARTIFACTS_DIR, batchId)

    // Build localQuestions from used routes
    const usedAsQuestions: ExistingQuestion[] = usedPassageRecords.map((p) => ({
      source: { route: p.route, sourceId: p.verseIds[0] },
      prompt: { am: `used-${p.passageId}` },
    }))
    const localQuestions = [...APPROVED_QUESTIONS, ...usedAsQuestions]

    // Determine batch size based on available books with clean unused chapters
    const cleanUnused = candidates.filter((c) => {
      const route = `/bible/${c.book.slug}/${c.chapter.chapter_number}`
      return !usedRoutes.has(route) && exclusionReasons(c, audit).length === 0
    })
    const booksWithUnused = new Set(cleanUnused.map((c) => c.book.slug))
    const batchCount = Math.min(20, booksWithUnused.size)
    if (batchCount < 1 && !existsSync(batchDir)) {
      console.log(`[ORCHESTRATOR] All eligible candidate chapters have been exhausted at ${batchId}.`)
      break
    }

    // Check if this batch directory already exists
    const batchExists = existsSync(batchDir)
    const sourceFile = join(batchDir, 'source-batch.json')
    const sourceManifestFile = join(batchDir, 'source-manifest.json')
    if (!batchExists || missingBatchInputs(batchDir).length) {
      const prep = await preparePlaySourceBatch({
        candidates,
        inventory,
        localQuestions,
        audit,
        count: batchCount,
        maxVerses: 5,
        ownerAuthorization,
      })

      if (prep.blocked || !('batch' in prep) || !prep.batch) {
        console.log(`[ORCHESTRATOR] Batch ${batchId} blocked: ${prep.blocked}`)
        failedBatches.push(batchId)
        break
      }

      if (batchExists && existsSync(join(batchDir, 'drafts.json'))) {
        throw new Error(`${batchId}: completed batch has missing source files; refusing to replace it`)
      }
      if (existsSync(sourceFile) && JSON.stringify(JSON.parse(readFileSync(sourceFile, 'utf8'))) !== JSON.stringify(prep.batch)) {
        throw new Error(`${batchId}: interrupted source batch differs from fresh preparation`)
      }
      if (existsSync(sourceManifestFile) && JSON.parse(readFileSync(sourceManifestFile, 'utf8')).sourceHash !== prep.manifest.sourceHash) {
        throw new Error(`${batchId}: interrupted source manifest hash differs from fresh preparation`)
      }
      mkdirSync(batchDir, { recursive: true })

      // Write batch inputs
      writeMissingJson(sourceFile, prep.batch)
      writeMissingJson(sourceManifestFile, prep.manifest)
      writeMissingJson(join(batchDir, 'eligibility-report.json'), prep.eligibility)
      writeMissingJson(join(batchDir, 'existing-prompts.json'), prep.existingPrompts)

      // Build Gemini Prompt
      const prompt = await buildAmharicQuestionPrompt(prep.batch, MODEL_ID)
      writeMissingJson(join(batchDir, 'gemini-prompt.json'), prompt)
    }

    // Load manifest to track passages
    const sManifest = JSON.parse(readFileSync(join(batchDir, 'source-manifest.json'), 'utf8'))
    const sBatch = JSON.parse(readFileSync(join(batchDir, 'source-batch.json'), 'utf8'))
    if ((await validateSourceBatch(sBatch)).sourceHash !== sManifest.sourceHash) throw new Error(`${batchId}: source hash mismatch`)
    for (const p of sBatch.passages) {
      const route = `/bible/${p.book.slug}/${p.chapter.chapter_number}`
      const verseIds = p.verses.map((v: { id: string }) => v.id)
      if (usedRoutes.has(route) || verseIds.some((id: string) => usedVerseIds.has(id))) throw new Error(`${batchId}: duplicate source route or verse ID`)
      usedRoutes.add(route)
      for (const vid of verseIds) usedVerseIds.add(vid)
      usedPassageRecords.push({ passageId: p.id, route, verseIds })
      chaptersUsedByBook[p.book.slug] = (chaptersUsedByBook[p.book.slug] || 0) + 1
      const cat = categorizeBook(p.book.slug)
      categoryCounts[cat] = (categoryCounts[cat] || 0) + 1
    }

    // If drafts exist in batch (completed generation)
    const draftsFile = join(batchDir, 'drafts.json')
    if (existsSync(draftsFile)) {
      const draftsData = JSON.parse(readFileSync(draftsFile, 'utf8'))
      ingestDrafts(batchId, draftsData.drafts, sManifest.sourceHash, new Set(sBatch.passages.map((p: { id: string }) => p.id)))
      const responsePath = join(batchDir, 'offline-response.json')
      if (existsSync(responsePath)) {
        const responseBytes = readFileSync(responsePath)
        const draftBytes = readFileSync(draftsFile)
        const response = JSON.parse(responseBytes.toString('utf8'))
        const matching = response.modelId === draftsData.modelId &&
          response.questions?.length === draftsData.drafts.length &&
          response.questions.every((question: { prompt: { am: string }; game: string }, index: number) =>
            question.prompt.am === draftsData.drafts[index]?.question.prompt.am &&
            question.game === draftsData.drafts[index]?.question.game)
        sidecarAudit.push({
          batchId, status: matching ? 'current' : 'stale',
          responseSha256: createHash('sha256').update(responseBytes).digest('hex'),
          draftsSha256: createHash('sha256').update(draftBytes).digest('hex'),
        })
      }
      completedBatches.push(batchId)
      batchSummaries.push({
        batchId,
        status: 'completed',
        passageCount: sBatch.passages.length,
        sourceHash: sManifest.sourceHash,
        acceptedCount: draftsData.drafts.length,
        rejectedCount: 0,
        bookSlugs: sBatch.passages.map((p: { book: { slug: string } }) => p.book.slug),
      })
    } else if (options.execute && apiAvailable) {
      try {
        const drafts = await executeBatchWithGemini(batchId, apiKey!)
        ingestDrafts(batchId, drafts, sManifest.sourceHash, new Set(sBatch.passages.map((p: { id: string }) => p.id)))
        completedBatches.push(batchId)
        batchSummaries.push({
          batchId,
          status: 'completed',
          passageCount: sBatch.passages.length,
          sourceHash: sManifest.sourceHash,
          acceptedCount: drafts.length,
          rejectedCount: 0,
          bookSlugs: sBatch.passages.map((p: { book: { slug: string } }) => p.book.slug),
        })
      } catch (err) {
        console.error(`[ORCHESTRATOR] Generation failed for ${batchId}:`, err)
        failedBatches.push(batchId)
        batchSummaries.push({
          batchId,
          status: 'failed',
          passageCount: sBatch.passages.length,
          sourceHash: sManifest.sourceHash,
          acceptedCount: 0,
          rejectedCount: 0,
          bookSlugs: sBatch.passages.map((p: { book: { slug: string } }) => p.book.slug),
        })
      }
    } else {
      pendingBatches.push(batchId)
      batchSummaries.push({
        batchId,
        status: 'pending_generation',
        passageCount: sBatch.passages.length,
        sourceHash: sManifest.sourceHash,
        acceptedCount: 0,
        rejectedCount: 0,
        bookSlugs: sBatch.passages.map((p: { book: { slug: string } }) => p.book.slug),
      })
    }

    console.log(`[ORCHESTRATOR] ${batchId}: ${sBatch.passages.length} passages prepared. (Cumulative passages: ${usedPassageRecords.length})`)
    batchIndex++
  }

  // 3. Organize Content Library
  console.log(`[ORCHESTRATOR] Compiling content library in ${LIBRARY_DIR}...`)
  const byBookDir = join(LIBRARY_DIR, 'by-book')
  const byGameDir = join(LIBRARY_DIR, 'by-game')
  const byDiffDir = join(LIBRARY_DIR, 'by-difficulty')
  mkdirSync(byBookDir, { recursive: true })
  mkdirSync(byGameDir, { recursive: true })
  mkdirSync(byDiffDir, { recursive: true })

  // Write aggregate drafts
  writeFileSync(join(LIBRARY_DIR, 'all-drafts.json'), JSON.stringify({
    version: 1,
    campaignId: '1000-bilingual-bible-questions',
    totalDrafts: allAcceptedDrafts.length,
    drafts: allAcceptedDrafts,
  }, null, 2), 'utf8')

  // Generate CMS import package for all accepted drafts
  const cmsImportParts: CampaignManifest['cmsImportParts'] = []
  if (allAcceptedDrafts.length > 0) {
    const cmsImport = adaptEditorialBatchToCms({ drafts: allAcceptedDrafts })
    writeFileSync(join(LIBRARY_DIR, 'cms-import-all.json'), JSON.stringify(cmsImport, null, 2), 'utf8')
    const partsDir = join(LIBRARY_DIR, 'cms-import-parts')
    mkdirSync(partsDir, { recursive: true })
    for (let offset = 0; offset < cmsImport.length; offset += 100) {
      const part = cmsImport.slice(offset, offset + 100)
      const preview = previewQuestionImport(JSON.stringify(part), new Set<string>())
      if (preview.errors.length || preview.items.length !== part.length) throw new Error(`CMS package validation failed at offset ${offset}: ${preview.errors.join('; ')}`)
      const path = join(partsDir, `part-${String(offset / 100 + 1).padStart(3, '0')}.json`)
      writeFileSync(path, `${JSON.stringify(part, null, 2)}\n`, 'utf8')
      cmsImportParts.push({ path, count: part.length })
    }
  }

  // Group by book
  const byBook: Record<string, EditorialDraft[]> = {}
  for (const d of allAcceptedDrafts) {
    const route = d.question?.source?.route ?? ''
    const match = route.match(/\/bible\/([^/?#]+)/)
    const book = match ? match[1] : (d.provenance?.passageId?.split('-')[1] ?? 'unknown')
    byBook[book] = [...(byBook[book] || []), d]
  }
  for (const [book, drafts] of Object.entries(byBook)) {
    writeFileSync(join(byBookDir, `${book}.json`), JSON.stringify({ book, count: drafts.length, drafts }, null, 2), 'utf8')
  }

  // Group by game type
  const byGame: Record<string, EditorialDraft[]> = {}
  for (const d of allAcceptedDrafts) {
    const g = d.question?.game ?? 'trivia'
    byGame[g] = [...(byGame[g] || []), d]
  }
  for (const [game, drafts] of Object.entries(byGame)) {
    writeFileSync(join(byGameDir, `${game}.json`), JSON.stringify({ game, count: drafts.length, drafts }, null, 2), 'utf8')
  }

  // Group by difficulty
  const byDiff: Record<string, EditorialDraft[]> = {}
  for (const d of allAcceptedDrafts) {
    const diff = d.question?.difficulty ?? 'beginner'
    byDiff[diff] = [...(byDiff[diff] || []), d]
  }
  for (const [diff, drafts] of Object.entries(byDiff)) {
    writeFileSync(join(byDiffDir, `${diff}.json`), JSON.stringify({ difficulty: diff, count: drafts.length, drafts }, null, 2), 'utf8')
  }

  // Build Book Coverage Record
  const bookCoverage: Record<string, { chaptersUsed: number; totalEligibleChapters: number }> = {}
  for (const [slug, total] of Object.entries(totalEligibleByBook)) {
    bookCoverage[slug] = {
      chaptersUsed: chaptersUsedByBook[slug] || 0,
      totalEligibleChapters: total,
    }
  }

  // 4. Write Campaign Manifest
  const manifest: CampaignManifest = {
    campaignId: '1000-bilingual-bible-questions',
    targetQuestions: target,
    acceptedQuestions: acceptedIds.size,
    preparedPassages: usedPassageRecords.length,
    pendingPassages: countPendingPassages(batchSummaries),
    remainingEligiblePassages: Object.values(totalEligibleByBook).reduce((sum, n) => sum + n, 0) - usedPassageRecords.length,
    sidecarAudit,
    cmsImportParts,
    totalBatches: batchSummaries.length,
    completedBatches,
    pendingBatches,
    failedBatches,
    batches: batchSummaries,
    usedPassages: usedPassageRecords,
    bookCoverage,
    categoryCoverage: categoryCounts,
    geminiExecution: {
      apiAvailable,
      modelId: MODEL_ID,
      callsMade: options.execute && apiAvailable ? completedBatches.filter((id) => existsSync(join(ARTIFACTS_DIR, id, 'gemini-response.json'))).length : 0,
      estimatedCostUsd: options.execute && apiAvailable ? completedBatches.filter((id) => existsSync(join(ARTIFACTS_DIR, id, 'gemini-response.json'))).length * 0.005 : 0,
      blocker: options.execute && apiAvailable ? null : 'Offline preparation only; no Gemini calls were made by this run.',
    },
  }

  const manifestPath = join(ARTIFACTS_DIR, 'campaign-manifest.json')
  writeFileSync(manifestPath, JSON.stringify(manifest, null, 2), 'utf8')
  console.log(`[ORCHESTRATOR] Campaign manifest updated: ${manifestPath}`)
  console.log(`[ORCHESTRATOR] Total passages prepared: ${usedPassageRecords.length} across ${batchSummaries.length} batches.`)
  console.log(`[ORCHESTRATOR] Accepted validated questions: ${allAcceptedDrafts.length}`)
  console.log(`[ORCHESTRATOR] Pending generation batches: ${pendingBatches.length}`)

  return manifest
}

if (process.argv[1]?.endsWith('campaign-orchestrator.ts')) {
  const execute = process.argv.includes('--execute')
  const targetIdx = process.argv.indexOf('--target')
  const target = targetIdx !== -1 && process.argv[targetIdx + 1] ? Number(process.argv[targetIdx + 1]) : TARGET_QUESTIONS
  const maxBatchesIdx = process.argv.indexOf('--max-batches')
  const maxBatches = maxBatchesIdx !== -1 && process.argv[maxBatchesIdx + 1] ? Number(process.argv[maxBatchesIdx + 1]) : 60

  runCampaign({ execute, target, maxBatches }).catch((err) => {
    console.error(err)
    process.exit(1)
  })
}
