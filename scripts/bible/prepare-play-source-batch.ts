// Offline, read-only converter: SQL Editor exports -> validated generator input files.
// It never connects to Supabase, never calls an AI model, and never overwrites files.
//
// Usage:
//   npx tsx scripts/bible/prepare-play-source-batch.ts \
//     --candidates exports/play-source-candidates.csv \
//     --inventory exports/play-question-inventory.csv \
//     --out-dir artifacts/faith-challenges/batch-001 [--count 20] [--verses 5] [--audit-dir artifacts/bible-audit]
//
// Exit codes: 0 = batch written; 2 = blocked (rights or eligibility), report written; 1 = input error.
import { createHash } from 'node:crypto'
import { mkdir, readFile, readdir, stat, writeFile } from 'node:fs/promises'
import { join, resolve } from 'node:path'
import { pathToFileURL } from 'node:url'
import type { BibleChapter, BibleEdition, BibleVerse, CanonicalBook, SourceBook } from '../../src/lib/bible/bibleTypes'
import { GenerationValidationError, validateSourceBatch } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { assertOwnerAuthorization, prepareAmharicPlaySourceExport, type OwnerAuthorization, type SourceExportApi } from './amharic-play-source-export'

const TRANSFERABLE_RIGHTS = new Set(['owned', 'licensed', 'public_domain', 'permission_granted'])
const MAX_SOURCE_BYTES = 65_536
const MAX_EXISTING_BYTES = 131_072
const MAX_INPUT_BYTES = 20_000_000

type Row = Record<string, string>
type Verse = Pick<BibleVerse, 'id' | 'chapter_id' | 'verse_number' | 'source_order' | 'text' | 'updated_at'> & { section_id: string | null }
export type Candidate = {
  edition: BibleEdition
  book: CanonicalBook
  sourceBook: SourceBook
  chapter: BibleChapter
  sectionOrder: number
  verses: Verse[]
}
export type ExistingQuestion = { stable_id?: string; status?: string; source?: { route?: string; sourceId?: string }; prompt?: { am?: string } }
export type Audit = {
  anomalyChapters: Map<string, string[]>
  numbering: Map<string, Row>
  verseHashes: Map<string, string>
  reviewBooks: Set<string>
}

export function parseCsv(text: string): Row[] {
  const records: string[][] = []
  let field = ''
  let record: string[] = []
  let quoted = false
  const input = text.replace(/^\uFEFF/, '')
  for (let i = 0; i < input.length; i += 1) {
    const char = input[i]
    if (quoted) {
      if (char === '"' && input[i + 1] === '"') { field += '"'; i += 1 }
      else if (char === '"') quoted = false
      else field += char
    } else if (char === '"') quoted = true
    else if (char === ',') { record.push(field); field = '' }
    else if (char === '\n' || char === '\r') {
      if (char === '\r' && input[i + 1] === '\n') i += 1
      record.push(field); field = ''
      if (record.some((value) => value !== '')) records.push(record)
      record = []
    } else field += char
  }
  if (field !== '' || record.length) { record.push(field); if (record.some((value) => value !== '')) records.push(record) }
  const [header, ...rows] = records
  if (!header) return []
  return rows.map((values) => Object.fromEntries(header.map((name, index) => [name.trim(), values[index] ?? ''])))
}

async function readBounded(path: string) {
  const info = await stat(resolve(path))
  if (!info.isFile() || info.size > MAX_INPUT_BYTES) throw new Error(`${path} is missing or exceeds ${MAX_INPUT_BYTES} bytes.`)
  return readFile(resolve(path), 'utf8')
}

/** Accepts SQL Editor "Download CSV" or "Copy as JSON" output for a single jsonb column. */
export function parseSingleColumnExport(text: string, column: string): unknown[] {
  const trimmed = text.replace(/^\uFEFF/, '').trim()
  const rows: unknown[] = trimmed.startsWith('[') ? JSON.parse(trimmed) as unknown[] : parseCsv(trimmed)
  return rows.map((row, index) => {
    const value = row && typeof row === 'object' && column in (row as object) ? (row as Record<string, unknown>)[column] : undefined
    if (value === undefined) throw new Error(`Row ${index + 1} has no "${column}" column.`)
    return typeof value === 'string' ? JSON.parse(value) as unknown : value
  })
}

export async function loadAudit(auditDir: string): Promise<Audit> {
  const read = async (name: string) => parseCsv(await readBounded(join(auditDir, name)))
  const anomalyChapters = new Map<string, string[]>()
  for (const row of await read('02-all-anomalies.csv')) {
    if (row.edition !== 'am' || row.classification === 'NO_ISSUE') continue
    const key = `${row.source_book}|${row.chapter}`
    anomalyChapters.set(key, [...(anomalyChapters.get(key) || []), row.issue_type])
  }
  const numbering = new Map<string, Row>()
  for (const row of await read('05-verse-numbering-report.csv')) {
    if (row.edition === 'am') numbering.set(`${row.source_book}|${row.chapter}`, row)
  }
  const verseHashes = new Map<string, string>()
  for (const row of await read('13-verse-scan-index.csv')) {
    if (row.edition === 'am') verseHashes.set(`${row.source_book}|${row.chapter}|${row.source_position}`, row.text_sha256)
  }
  const reviewBooks = new Set((await read('09-cross-edition-review.csv'))
    .filter((row) => row.classification !== 'NO_ISSUE').map((row) => row.canonical_book))
  return { anomalyChapters, numbering, verseHashes, reviewBooks }
}

/** Returns the reasons a candidate chapter is excluded; an empty array means eligible. */
export function exclusionReasons(candidate: Candidate, audit: Audit): string[] {
  const reasons: string[] = []
  const sourceBookNumber = candidate.sourceBook.source_book_number
  const chapterKey = `${sourceBookNumber}|${candidate.chapter.chapter_number}`
  const numbering = audit.numbering.get(chapterKey)
  if (!numbering) reasons.push('chapter_not_covered_by_audit')
  else {
    if (numbering.first_label !== '1') reasons.push('chapter_starts_above_verse_1')
    for (const column of ['gap_jumps', 'repeated_labels', 'descending_jumps', 'adjacent_duplicate_texts']) {
      if (Number(numbering[column] || 0) > 0) reasons.push(`numbering_${column}`)
    }
  }
  const anomalies = audit.anomalyChapters.get(chapterKey)
  if (anomalies) reasons.push(...[...new Set(anomalies)].map((type) => `unresolved_anomaly_${type.toLowerCase()}`))
  if (audit.reviewBooks.has(candidate.book.slug)) reasons.push('cross_edition_mapping_review')
  if (candidate.sectionOrder < 1) reasons.push('snapshot_position_unknown_direct_verses')
  for (const [index, verse] of candidate.verses.entries()) {
    if (!verse.text?.trim()) { reasons.push('blank_verse'); break }
    if (index > 0 && verse.verse_number !== candidate.verses[index - 1].verse_number + 1) { reasons.push('non_contiguous_verse_numbers'); break }
    const expected = audit.verseHashes.get(`${chapterKey}|${candidate.sectionOrder}:${verse.source_order}`)
    const actual = createHash('sha256').update(verse.text).digest('hex')
    if (!expected) { reasons.push('verse_missing_from_audited_snapshot'); break }
    if (expected !== actual) { reasons.push('database_text_differs_from_audited_snapshot'); break }
  }
  return [...new Set(reasons)]
}

function candidateShapeError(value: unknown): string | null {
  const c = value as Partial<Candidate> | null
  if (!c || typeof c !== 'object' || !c.edition || !c.book || !c.sourceBook || !c.chapter || !Array.isArray(c.verses)) {
    return 'candidate is missing edition, book, sourceBook, chapter, or verses'
  }
  if (!Number.isSafeInteger(c.sourceBook.source_book_number)) return 'sourceBook.source_book_number is required'
  return null
}

export async function preparePlaySourceBatch(input: {
  candidates: unknown[]; inventory: ExistingQuestion[]; localQuestions: ExistingQuestion[]
  audit: Audit; count: number; maxVerses: number; ownerAuthorization?: OwnerAuthorization
}) {
  if (input.ownerAuthorization !== undefined) assertOwnerAuthorization(input.ownerAuthorization)
  const shapeErrors = input.candidates.map(candidateShapeError).filter(Boolean)
  if (shapeErrors.length) throw new Error(`Invalid candidate export: ${shapeErrors[0]}`)
  const candidates = input.candidates as Candidate[]
  const editionIds = new Set(candidates.map((candidate) => candidate.edition.id))
  if (editionIds.size !== 1) throw new Error(`Expected exactly one Amharic edition, found ${editionIds.size}.`)
  const edition = candidates[0].edition

  const excluded: Array<{ book: string; chapter: number; sourceBook: number; reasons: string[] }> = []
  const eligible: Candidate[] = []
  for (const candidate of candidates) {
    const reasons = exclusionReasons(candidate, input.audit)
    if (reasons.length) excluded.push({ book: candidate.book.slug, chapter: candidate.chapter.chapter_number,
      sourceBook: candidate.sourceBook.source_book_number, reasons })
    else eligible.push(candidate)
  }
  const reasonCounts: Record<string, number> = {}
  for (const item of excluded) for (const reason of item.reasons) reasonCounts[reason] = (reasonCounts[reason] || 0) + 1
  const eligibleBookSlugs = [...new Set(eligible.map((candidate) => candidate.book.slug))]
  const rights = { rightsStatus: edition.rights_status, attribution: edition.attribution ?? null,
    sourceEdition: edition.source_edition ?? null,
    transferable: TRANSFERABLE_RIGHTS.has(edition.rights_status) || Boolean(input.ownerAuthorization),
    ownerAuthorization: input.ownerAuthorization ? {
      mode: input.ownerAuthorization.mode,
      basis: input.ownerAuthorization.basis,
      authorizedBy: input.ownerAuthorization.authorizedBy,
      recordedAt: input.ownerAuthorization.recordedAt,
      scope: 'bible_edition_only',
    } : null }
  const eligibility = { version: 1, editionId: edition.id, editionCode: edition.code,
    canonCode: edition.canon_code, numberingScheme: edition.numbering_scheme, editionUpdatedAt: edition.updated_at,
    candidateChapters: candidates.length, eligibleChapters: eligible.length,
    booksWithCandidates: new Set(candidates.map((candidate) => candidate.book.slug)).size,
    booksWithEligibleChapters: eligibleBookSlugs.length, exclusionReasonCounts: reasonCounts, excluded,
    inventoryQuestions: input.inventory.length, localQuestions: input.localQuestions.length, rights }
  if (!rights.transferable) {
    return { blocked: `Edition rights_status is "${edition.rights_status}"; transfer to an external AI model is not permitted until rights are confirmed or explicit owner authorization is selected.`, eligibility }
  }

  const byBook = new Map<string, Candidate[]>()
  for (const candidate of eligible) byBook.set(candidate.book.id, [...(byBook.get(candidate.book.id) || []), candidate])
  const api: SourceExportApi = {
    loadEdition: async () => edition,
    loadBooks: async () => [...new Map(eligible.map((candidate) => [candidate.book.id, candidate.book])).values()],
    loadSourceBooks: async () => [...new Map(eligible.map((candidate) => [candidate.sourceBook.id, candidate.sourceBook])).values()],
    loadChapters: async () => eligible.map((candidate) => candidate.chapter),
    loadVerses: async (chapterId, limit) => (eligible.find((candidate) => candidate.chapter.id === chapterId)?.verses || [])
      .slice(0, limit).map(({ section_id: _section, ...verse }) => ({ ...verse, section_id: null, created_at: verse.updated_at }) as BibleVerse),
    loadPublishedQuestions: async () => input.inventory,
  }
  let lastError: unknown = null
  for (let verses = input.maxVerses; verses >= 1; verses -= 1) {
    try {
      const result = await prepareAmharicPlaySourceExport(api, { count: input.count, versesPerPassage: verses, localQuestions: input.localQuestions, ownerAuthorization: input.ownerAuthorization })
      const sourceBytes = Buffer.byteLength(JSON.stringify(result.batch))
      const existingBytes = Buffer.byteLength(JSON.stringify(result.existingPrompts))
      if (existingBytes > MAX_EXISTING_BYTES) throw new Error('Existing prompt inventory exceeds the generator 128 KB input bound.')
      if (sourceBytes > MAX_SOURCE_BYTES) throw new GenerationValidationError('SOURCE_BATCH_INVALID', 'Source batch exceeds 64 KB.')
      await validateSourceBatch(result.batch)
      return { blocked: null, eligibility, versesPerPassage: verses, sourceBytes, existingBytes, ...result }
    } catch (error) {
      lastError = error
      if (!(error instanceof GenerationValidationError && error.code === 'SOURCE_BATCH_INVALID')) break
    }
  }
  return { blocked: lastError instanceof Error ? lastError.message : String(lastError), eligibility }
}

function argMap(argv: string[]) {
  const allowed = new Set(['--candidates', '--inventory', '--out-dir', '--count', '--verses', '--audit-dir',
    '--owner-authorized', '--owner-basis', '--owner-by'])
  const options = new Map<string, string>()
  for (let i = 0; i < argv.length; i += 2) {
    const [key, value] = [argv[i], argv[i + 1]]
    if (!allowed.has(key) || !value || value.startsWith('--') || options.has(key)) {
      throw new Error('Usage: tsx prepare-play-source-batch.ts --candidates FILE --inventory FILE --out-dir DIR [--count 20] [--verses 5] [--audit-dir artifacts/bible-audit] [--owner-authorized true --owner-basis BASIS --owner-by IDENTITY]')
    }
    options.set(key, value)
  }
  for (const required of ['--candidates', '--inventory', '--out-dir']) if (!options.has(required)) throw new Error(`${required} is required.`)
  return options
}

async function main() {
  const options = argMap(process.argv.slice(2))
  const outDir = resolve(options.get('--out-dir')!)
  try { if ((await readdir(outDir)).length) throw new Error(`Refusing to write into non-empty directory: ${outDir}`) }
  catch (error) { if ((error as NodeJS.ErrnoException).code !== 'ENOENT') throw error }
  const count = Number(options.get('--count') ?? 20)
  const maxVerses = Number(options.get('--verses') ?? 5)

  const ownerAuthorized = options.get('--owner-authorized')
  const ownerBasis = options.get('--owner-basis')
  const ownerBy = options.get('--owner-by')
  let ownerAuthorization: OwnerAuthorization | undefined
  if (ownerAuthorized || ownerBasis || ownerBy) {
    if (!ownerAuthorized || (ownerAuthorized !== 'true' && ownerAuthorized !== 'yes') || !ownerBasis || !ownerBy) {
      throw new Error('Owner authorization requires --owner-authorized true, --owner-basis "<written basis 10+ chars>", and --owner-by "<authorizer identity>".')
    }
    ownerAuthorization = {
      mode: 'owner_authorized',
      basis: ownerBasis,
      authorizedBy: ownerBy,
      recordedAt: new Date().toISOString(),
    }
    assertOwnerAuthorization(ownerAuthorization)
  }

  const candidates = parseSingleColumnExport(await readBounded(options.get('--candidates')!), 'candidate')
  const inventory = parseSingleColumnExport(await readBounded(options.get('--inventory')!), 'question') as ExistingQuestion[]
  const { APPROVED_QUESTIONS } = await import('../../src/lib/play/approvedContent')
  const audit = await loadAudit(resolve(options.get('--audit-dir') ?? 'artifacts/bible-audit'))
  const result = await preparePlaySourceBatch({ candidates, inventory, localQuestions: APPROVED_QUESTIONS, audit, count, maxVerses, ownerAuthorization })
  await mkdir(outDir, { recursive: true })
  const write = (name: string, value: unknown) => writeFile(join(outDir, name), `${JSON.stringify(value, null, 2)}\n`, { flag: 'wx' })
  await write('eligibility-report.json', result.eligibility)
  if (result.blocked || !('batch' in result)) {
    console.log(JSON.stringify({ status: 'blocked', reason: result.blocked, outDir,
      eligibleChapters: result.eligibility.eligibleChapters, booksWithEligibleChapters: result.eligibility.booksWithEligibleChapters }))
    process.exitCode = 2
    return
  }
  await writeFile(join(outDir, 'source-batch.json'), `${JSON.stringify(result.batch)}\n`, { flag: 'wx' })
  await write('existing-prompts.json', result.existingPrompts)
  const passages = result.batch.passages.map((passage) => ({ passageId: passage.id, book: passage.book.slug,
    bookNameAm: passage.book.name_am, chapter: passage.chapter.chapter_number,
    verses: passage.verses.map((verse) => verse.verse_number), verseIds: passage.verses.map((verse) => verse.id),
    chapterUpdatedAt: passage.chapter.updated_at }))
  await write('source-manifest.json', { ...result.manifest, generatedAt: new Date().toISOString(), batchId: outDir.split(/[\\/]/).pop(),
    versesPerPassage: result.versesPerPassage, sourceBytes: result.sourceBytes, existingPromptBytes: result.existingBytes,
    existingPromptCount: result.existingPrompts.length, auditSource: 'artifacts/bible-audit (02, 05, 09, 13)',
    snapshotRole: 'secondary QA reference; Supabase export is the primary source', passages,
    previousBatchVerseIds: [], publication: 'not_allowed', editorialReviewRequired: true })
  console.log(JSON.stringify({ status: 'ready', outDir, sourceHash: result.manifest.sourceHash, passages: passages.length,
    versesPerPassage: result.versesPerPassage, sourceBytes: result.sourceBytes, existingPrompts: result.existingPrompts.length }))
}

if (import.meta.url === pathToFileURL(process.argv[1] || '').href) {
  main().catch((error) => { console.error(error instanceof Error ? error.message : error); process.exitCode = 1 })
}
