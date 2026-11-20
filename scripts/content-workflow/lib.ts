/**
 * Church content workflow: pure logic (no network, no speech model). See README.md in this folder.
 *
 * An ITEM is one source (recording, document, announcement) with its metadata, immutable numbered VERSIONS of every
 * derived artifact (transcript, translation, drafts), an append-only LOG, reviewer DECISIONS, and APPROVALS that are tied
 * to the exact content hash of a draft version. Nothing here publishes anything.
 */
import { createHash } from 'node:crypto'
import fs from 'node:fs'
import path from 'node:path'

export type Kind = 'recording' | 'teaching' | 'event' | 'notice' | 'bilingual'
export type PermissionStatus = 'confirmed' | 'unconfirmed' | 'denied'
export type State = 'received' | 'processed' | 'needs_review' | 'approved' | 'published'
export const STATES: State[] = ['received', 'processed', 'needs_review', 'approved', 'published']
export const DRAFT_TYPES = ['summary', 'article', 'study-guide', 'announcement', 'event-page', 'clips'] as const
export type DraftType = (typeof DRAFT_TYPES)[number]
/** What a block of a draft IS. Readers and reviewers must always be able to tell these apart. */
export const BLOCK_KINDS = ['quote', 'paraphrase', 'translation', 'scripture', 'detail', 'generated', 'heading'] as const
export type BlockKind = (typeof BLOCK_KINDS)[number]

export type Item = {
  id: string
  kind: Kind
  title: string
  /** True for demonstration content that is not real church material. Sample items can never be approved or published. */
  sample: boolean
  source: {
    path: string | null
    sha256: string | null
    bytes: number | null
    speaker: string | null
    date: string | null
    audience: string | null
    language: 'am' | 'en' | 'am+en'
    permission: { status: PermissionStatus; note: string; recordedBy: string | null; recordedAt: string }
    /** Channels this source may be published to, as stated at intake (e.g. website, telegram). */
    channels: string[]
  }
  createdAt: string
}
export type Signals = { avgLogProb?: number; noSpeechProb?: number; compressionRatio?: number; lowProbabilityWords?: Array<{ word: string; start: number; probability: number }> }
export type Segment = { id: string; start: number | null; end: number | null; text: string; signals?: Signals }
export type Correction = { segment: string; from: string; to: string; reason: string; by: string }
export type SegmentVersion = {
  artifact: string; version: number; basedOn: number | null; createdBy: string; createdAt: string; note: string
  segments: Segment[]; corrections: Correction[]
}
export type DraftBlock = { index: number; kind: BlockKind; lang: 'am' | 'en'; refs: string[]; scripture: string | null; text: string }
export type DraftVersion = {
  artifact: string; version: number; type: DraftType; generator: string; createdAt: string; note: string
  title: { en?: string; am?: string }; content: string; blocks: DraftBlock[]
}
export type GlossaryEntry = { term: string; language: 'am' | 'en'; preferred: string; variants: string[]; note?: string; status: 'approved' | 'proposed'; approvedBy?: string }
export type ReviewRow = {
  id: string; group: string; source: string; sourceText: string; proposed: string; translation: string
  question: string; needsQualifiedReviewer: boolean
}
export type Decision = { decision: 'accept' | 'correct' | 'reject' | 'needs-clergy'; correction: string; reviewer: string; role: string; at: string }
export type Approval = { draft: DraftType; version: number; sha256: string; by: string; role: string; evidence: string; at: string }
export type Publication = { draft: DraftType; version: number; sha256: string; channel: string; url: string; by: string; at: string }

export const sha256 = (value: string | Buffer) => createHash('sha256').update(value).digest('hex')
export const now = () => new Date().toISOString()
const squash = (value: string) => value.replace(/\s+/g, ' ').trim()

/* ------------------------------------------------------------------ storage */
export class Store {
  readonly root: string
  constructor(root: string) { this.root = root }
  dir(id: string) { return path.join(this.root, 'items', id) }
  exists(id: string) { return fs.existsSync(path.join(this.dir(id), 'item.json')) }
  private file(id: string, ...parts: string[]) { return path.join(this.dir(id), ...parts) }
  readJson<T>(id: string, name: string, fallback: T): T {
    const file = this.file(id, name)
    return fs.existsSync(file) ? (JSON.parse(fs.readFileSync(file, 'utf8')) as T) : fallback
  }
  writeJson(id: string, name: string, value: unknown) {
    const file = this.file(id, name)
    fs.mkdirSync(path.dirname(file), { recursive: true })
    const temp = `${file}.tmp`
    fs.writeFileSync(temp, `${JSON.stringify(value, null, 1)}\n`, 'utf8')
    fs.renameSync(temp, file) // atomic: a reader never sees a half-written file
  }
  item(id: string): Item {
    if (!this.exists(id)) throw new Error(`No item "${id}" in ${this.root}. Run: status`)
    return this.readJson<Item>(id, 'item.json', null as unknown as Item)
  }
  list(): string[] {
    const dir = path.join(this.root, 'items')
    return fs.existsSync(dir) ? fs.readdirSync(dir).filter(id => this.exists(id)).sort() : []
  }
  log(id: string, event: string, detail: Record<string, unknown> = {}) {
    fs.mkdirSync(this.dir(id), { recursive: true })
    fs.appendFileSync(this.file(id, 'log.jsonl'), `${JSON.stringify({ at: now(), event, ...detail })}\n`, 'utf8')
  }
  logEntries(id: string): Array<Record<string, unknown>> {
    const file = this.file(id, 'log.jsonl')
    return fs.existsSync(file) ? fs.readFileSync(file, 'utf8').split('\n').filter(Boolean).map(line => JSON.parse(line)) : []
  }
  /** Version numbers present for an artifact, ascending. Version files are never rewritten. */
  versions(id: string, artifact: string): number[] {
    const dir = this.file(id, 'versions')
    if (!fs.existsSync(dir)) return []
    const prefix = `${artifact}.v`
    return fs.readdirSync(dir).filter(name => name.startsWith(prefix) && name.endsWith('.json'))
      .map(name => Number(name.slice(prefix.length, -5))).filter(Number.isInteger).sort((a, b) => a - b)
  }
  latest<T>(id: string, artifact: string): T | null {
    const all = this.versions(id, artifact)
    return all.length ? this.readJson<T>(id, `versions/${artifact}.v${all[all.length - 1]}.json`, null as unknown as T) : null
  }
  version<T>(id: string, artifact: string, version: number): T | null {
    return this.versions(id, artifact).includes(version) ? this.readJson<T>(id, `versions/${artifact}.v${version}.json`, null as unknown as T) : null
  }
  /** Adds the next version of an artifact and returns its number. Existing versions are kept. */
  addVersion(id: string, artifact: string, body: Record<string, unknown>): number {
    const all = this.versions(id, artifact)
    const version = (all[all.length - 1] ?? 0) + 1
    const file = this.file(id, 'versions', `${artifact}.v${version}.json`)
    if (fs.existsSync(file)) throw new Error(`Refusing to overwrite ${file}`)
    this.writeJson(id, `versions/${artifact}.v${version}.json`, { artifact, version, createdAt: now(), ...body })
    this.log(id, 'version-added', { artifact, version })
    return version
  }
}

export function slugId(title: string, date: string | null, taken: (id: string) => boolean): string {
  const base = `${(date || now().slice(0, 10))}-${title.toLowerCase().normalize('NFKD').replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '').slice(0, 40) || 'item'}`
  let id = base
  for (let n = 2; taken(id); n++) id = `${base}-${n}`
  return id
}

/* ------------------------------------------------------------------ segments */
/** A written source becomes paragraph segments (p1, p2, …) so drafts can cite the exact passage. */
export function paragraphsToSegments(text: string): Segment[] {
  return text.replace(/\r\n/g, '\n').split(/\n\s*\n/).map(squash).filter(Boolean)
    .map((paragraph, index) => ({ id: `p${index + 1}`, start: null, end: null, text: paragraph }))
}

type Chunk = { index: number; transcript: Array<Omit<Segment, 'id'>>; translation?: Array<Omit<Segment, 'id'>>; translationError?: string }
/** Merge per-chunk speech output into s1… (transcript) and t1… (machine translation) segments. */
export function mergeChunks(chunks: Chunk[]): { transcript: Segment[]; translation: Segment[]; translationErrors: string[] } {
  const ordered = [...chunks].sort((a, b) => a.index - b.index)
  const transcript = ordered.flatMap(chunk => chunk.transcript).filter(row => row.text.trim()).map((row, index) => ({ id: `s${index + 1}`, ...row }))
  const translation = ordered.flatMap(chunk => chunk.translation ?? []).filter(row => row.text.trim()).map((row, index) => ({ id: `t${index + 1}`, ...row }))
  return { transcript, translation, translationErrors: ordered.flatMap(chunk => (chunk.translationError ? [`chunk ${chunk.index}: ${chunk.translationError}`] : [])) }
}

/**
 * Why a reviewer should listen to this segment again. These are Whisper's own decoding thresholds applied to the model's
 * raw signals: indicators of where to check, never a measure of accuracy.
 */
export function signalFlags(signals?: Signals): string[] {
  if (!signals) return []
  const flags: string[] = []
  if (signals.avgLogProb !== undefined && signals.avgLogProb < -1) flags.push('model was unsure of this wording (low average log-probability)')
  if (signals.noSpeechProb !== undefined && signals.noSpeechProb > 0.6) flags.push('may not be speech (music, silence or noise)')
  if (signals.compressionRatio !== undefined && signals.compressionRatio > 2.4) flags.push('repetitive output, a common sign of invented text')
  if (signals.lowProbabilityWords?.length) flags.push(`unclear word(s): ${signals.lowProbabilityWords.map(word => word.word).join(', ')}`)
  return flags
}

export const timeLabel = (seconds: number | null) => {
  if (seconds === null) return ''
  const s = Math.floor(seconds)
  const pad = (n: number) => String(n).padStart(2, '0')
  return `${s >= 3600 ? `${Math.floor(s / 3600)}:` : ''}${pad(Math.floor((s % 3600) / 60))}:${pad(s % 60)}`
}
export const segmentLabel = (segment: Segment) => (segment.start === null ? segment.id : `${segment.id} @ ${timeLabel(segment.start)}`)

/** Machine-translation segments that overlap a transcript segment in time (the two passes segment differently). */
export function overlappingTranslation(segment: Segment, translation: Segment[]): Segment[] {
  if (segment.start === null || segment.end === null) return []
  return translation.filter(row => row.start !== null && row.end !== null && row.start < segment.end! && row.end > segment.start!)
}

/* ------------------------------------------------------------------ glossary */
const escapeRegExp = (value: string) => value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
/**
 * Apply APPROVED glossary entries to a transcript. Every replacement is recorded against its segment so a reviewer can
 * trace it; proposed entries are never applied. Returns the new segments and the corrections made.
 */
export function applyGlossary(segments: Segment[], glossary: GlossaryEntry[], by: string): { segments: Segment[]; corrections: Correction[] } {
  const corrections: Correction[] = []
  const approved = glossary.filter(entry => entry.status === 'approved')
  const next = segments.map(segment => {
    let text = segment.text
    for (const entry of approved) {
      for (const variant of entry.variants) {
        if (!variant || variant === entry.preferred) continue
        // Ethiopic has no case and \b does not understand it: match on non-letter boundaries instead.
        const pattern = new RegExp(`(?<![\\p{L}\\p{M}])${escapeRegExp(variant)}(?![\\p{L}\\p{M}])`, entry.language === 'en' ? 'giu' : 'gu')
        if (!pattern.test(text)) continue
        text = text.replace(pattern, entry.preferred)
        corrections.push({ segment: segment.id, from: variant, to: entry.preferred, reason: `glossary: ${entry.term}`, by })
      }
    }
    return text === segment.text ? segment : { ...segment, text }
  })
  return { segments: next, corrections }
}

/* ------------------------------------------------------------------ drafts */
/**
 * Draft file format. A line starting with "::" opens a block and says what the block is:
 *   ::heading [lang=am]                 a section heading
 *   ::quote s12 [lang=am]               exact words from the cited segment(s); checked character for character
 *   ::paraphrase s3-s5 [lang=en]        the speaker's point in other words; must cite its segments
 *   ::translation s12 [lang=en]         a translation of the cited segment(s)
 *   ::scripture John 3:16 [edition=web] the verse text from that edition; checked against the site Bible
 *   ::detail p2                         a fact (date, place, name) taken from the cited passage
 *   ::generated [lang=en]               wording that is NOT from the source (framing, explanation, questions)
 * Optional first lines: "title-en: …" and "title-am: …".
 */
export function parseDraft(content: string): { title: { en?: string; am?: string }; blocks: DraftBlock[]; errors: string[] } {
  const title: { en?: string; am?: string } = {}
  const blocks: DraftBlock[] = []
  const errors: string[] = []
  let current: DraftBlock | null = null
  const close = () => { if (current) { current.text = current.text.trim(); if (!current.text) errors.push(`block ${current.index} (${current.kind}) is empty`); blocks.push(current); current = null } }
  for (const line of content.replace(/\r\n/g, '\n').split('\n')) {
    const titleMatch = /^title-(en|am):\s*(.+)$/.exec(line)
    if (titleMatch && !current && !blocks.length) { title[titleMatch[1] as 'en' | 'am'] = titleMatch[2].trim(); continue }
    if (line.startsWith('::')) {
      close()
      const words = line.slice(2).trim().split(/\s+/)
      const kind = words.shift() as BlockKind
      if (!BLOCK_KINDS.includes(kind)) { errors.push(`unknown block kind "${kind}"`); continue }
      const options = Object.fromEntries(words.filter(word => /^(lang|edition)=/.test(word)).map(word => word.split('=') as [string, string]))
      const rest = words.filter(word => !/^(lang|edition)=/.test(word))
      const lang = options.lang === 'am' ? 'am' : 'en'
      if (options.lang && options.lang !== 'am' && options.lang !== 'en') errors.push(`block ${blocks.length + 1}: lang must be am or en`)
      const scripture = kind === 'scripture' ? `${rest.join(' ')}${options.edition ? ` [${options.edition}]` : ''}` : null
      current = { index: blocks.length + 1, kind, lang: kind === 'scripture' && options.edition === 'am' ? 'am' : lang, refs: kind === 'scripture' ? [] : expandRefs(rest), scripture, text: '' }
      continue
    }
    if (current) current.text += `${line}\n`
    else if (line.trim()) errors.push(`text before the first block: "${line.trim().slice(0, 40)}"`)
  }
  close()
  if (!blocks.length) errors.push('the draft has no blocks')
  return { title, blocks, errors }
}
/** "s3-s5 s9" → [s3, s4, s5, s9] */
export function expandRefs(words: string[]): string[] {
  const refs: string[] = []
  for (const word of words) {
    const range = /^([a-z])(\d+)-\1?(\d+)$/.exec(word)
    if (range) { for (let n = Number(range[2]); n <= Number(range[3]); n++) refs.push(`${range[1]}${n}`) } else refs.push(word)
  }
  return refs
}

/**
 * Checks that do not need a person: every source-bound block cites real segments, and a quotation is word for word what
 * the source says in the source's own language. Scripture blocks are checked separately against the Bible edition.
 */
export function validateDraft(blocks: DraftBlock[], source: Segment[], sourceLanguage: Item['source']['language']): string[] {
  const errors: string[] = []
  const byId = new Map(source.map(segment => [segment.id, segment]))
  for (const block of blocks) {
    const label = `block ${block.index} (${block.kind})`
    if (['quote', 'paraphrase', 'translation', 'detail'].includes(block.kind)) {
      if (!block.refs.length) errors.push(`${label}: must cite the source segment(s) it comes from`)
      for (const ref of block.refs) if (!byId.has(ref)) errors.push(`${label}: cites "${ref}", which is not in the source`)
    }
    if (block.kind === 'scripture' && !block.scripture) errors.push(`${label}: must name the reference, e.g. ::scripture John 3:16`)
    if (block.kind === 'quote' && block.refs.every(ref => byId.has(ref))) {
      if (sourceLanguage !== 'am+en' && block.lang !== sourceLanguage) errors.push(`${label}: a quotation must be in the source language (${sourceLanguage}); use ::translation for other languages`)
      const cited = squash(block.refs.map(ref => byId.get(ref)!.text).join(' '))
      const quoted = squash(block.text.replace(/^["“”«»]+|["“”«»]+$/g, ''))
      if (!cited.includes(quoted)) errors.push(`${label}: the quoted words are not exactly what ${block.refs.join(', ')} says`)
    }
  }
  return errors
}

/* ------------------------------------------------------------------ scripture */
export type ScriptureCheck = { reference: string; where: string; editions: Array<{ edition: 'web' | 'am'; found: boolean; title: string; text: string; route: string; message: string }> }
/** Written references of the form "John 3:16" / "1 Kings 8:22-30" / "ዮሐንስ 3:16" / "ዮሐንስ ፫፥፲፮". Spoken-out references are not detected. */
export function findReferences(text: string): string[] {
  const found = new Set<string>()
  for (const match of text.matchAll(/\b((?:[1-3]\s)?[A-Z][a-z]+(?:\sof\s[A-Z][a-z]+)?)\s(\d{1,3}):(\d{1,3})(?:[-–](\d{1,3}))?/g)) found.add(match[0].replace('–', '-'))
  // "John chapter 3 verse 16", as speech-to-text writes a spoken English reference
  for (const match of text.matchAll(/\b((?:[1-3]\s)?[A-Z][a-z]+)\schapter\s(\d{1,3}),?\sverses?\s(\d{1,3})(?:\s(?:to|through|-)\s(\d{1,3}))?/g)) found.add(`${match[1]} ${match[2]}:${match[3]}${match[4] ? `-${match[4]}` : ''}`)
  for (const match of text.matchAll(/([ሀ-ፚ]+)\s+([\d፩-፼]+)\s*[:፥]\s*([\d፩-፼]+)/g)) found.add(match[0])
  return [...found]
}
/** True when a ::scripture block's text is exactly the edition's verse text. */
export const scriptureMatches = (blockText: string, editionText: string) => squash(blockText.replace(/^["“”«»]+|["“”«»]+$/g, '')) === squash(editionText)

/* ------------------------------------------------------------------ review */
const rowId = (...parts: string[]) => sha256(parts.join('\u0001')).slice(0, 12)
const DOCTRINAL = /\b(doctrine|dogma|heres|sacrament|myster|nature of christ|miaphysite|tewahedo|canon|council|salvation|intercession|theotokos|trinity|saint|miracle|fast(ing)?|eucharist|qurban|baptism|repentance|confession)\b|ምሥጢር|ተዋሕዶ|ቅዱስ|ተአምር|ቁርባን|ጥምቀት|ንስሐ|ሥላሴ|ድንግል/iu

export type ReviewInput = {
  item: Item
  transcript: SegmentVersion | null
  translation: SegmentVersion | null
  drafts: DraftVersion[]
  scripture: ScriptureCheck[]
}
/** Everything a person must look at, one row each. A row's id changes when its wording changes, so edits return to review. */
export function buildReviewRows(input: ReviewInput): ReviewRow[] {
  const rows: ReviewRow[] = []
  const source = input.transcript?.segments ?? []
  const byId = new Map(source.map(segment => [segment.id, segment]))
  const translated = (segment: Segment) => overlappingTranslation(segment, input.translation?.segments ?? []).map(row => row.text).join(' ')

  if (input.item.source.permission.status !== 'confirmed') {
    rows.push({ id: rowId('permission', input.item.source.permission.status), group: 'permission', source: 'intake', sourceText: input.item.source.permission.note || '(no note)',
      proposed: `Permission to publish is "${input.item.source.permission.status}".`, translation: '', question: 'Who gave permission to publish this, for which channels? Nothing can be approved until this is recorded as confirmed.', needsQualifiedReviewer: false })
  }
  for (const segment of source) {
    const flags = signalFlags(segment.signals)
    if (!flags.length) continue
    rows.push({ id: rowId('audio', segment.id, segment.text), group: 'unclear audio', source: segmentLabel(segment), sourceText: segment.text, proposed: segment.text, translation: translated(segment),
      question: `Listen again: ${flags.join('; ')}.`, needsQualifiedReviewer: false })
  }
  for (const correction of input.transcript?.corrections ?? []) {
    const segment = byId.get(correction.segment)
    rows.push({ id: rowId('correction', correction.segment, correction.from, correction.to), group: 'correction', source: segment ? segmentLabel(segment) : correction.segment, sourceText: correction.from,
      proposed: correction.to, translation: '', question: `Changed by ${correction.by} (${correction.reason}). Is the corrected wording right here?`, needsQualifiedReviewer: false })
  }
  if (input.translation?.segments.length) {
    rows.push({ id: rowId('machine-translation', String(input.translation.version), String(input.translation.segments.length)), group: 'translation', source: `translation v${input.translation.version}`, sourceText: '',
      proposed: `${input.translation.segments.length} machine-translated segments`, translation: '', question: 'The English translation is unreviewed machine output. A bilingual reader must check any passage before it is quoted or published.', needsQualifiedReviewer: true })
  }
  for (const check of input.scripture) {
    for (const edition of check.editions) {
      rows.push({ id: rowId('scripture', check.reference, edition.edition, edition.text), group: 'scripture', source: `${check.reference} (${check.where})`, sourceText: check.reference,
        proposed: edition.found ? `${edition.title}: ${edition.text}` : `NOT VERIFIED in ${edition.edition}: ${edition.message}`, translation: '',
        question: edition.found ? `Is this the passage the source means (${edition.edition === 'web' ? 'English WEB' : 'Amharic'} edition)?` : 'The reference was not found in this edition. Do not quote it until a reviewer supplies the verse.', needsQualifiedReviewer: !edition.found })
    }
  }
  for (const draft of input.drafts) {
    for (const block of draft.blocks) {
      if (block.kind === 'heading') continue
      const cited = block.refs.map(ref => byId.get(ref)).filter((segment): segment is Segment => Boolean(segment))
      const where = block.kind === 'scripture' ? block.scripture! : cited.length ? cited.map(segmentLabel).join(', ') : 'no source (generated)'
      const question = {
        quote: 'Exact quotation (matched the source automatically). Is the transcript itself right at this point?',
        paraphrase: 'Does this paraphrase say what the speaker said, without adding to it?',
        translation: 'Is this translation faithful to the cited passage?',
        scripture: 'Verse text was matched to the named edition. Is it the right passage for this place?',
        detail: 'Check this name, date, place or figure against the source.',
        generated: 'This wording is not from the source. Is it accurate and appropriate to publish under the church\'s name?',
        heading: '',
      }[block.kind]
      rows.push({ id: rowId('draft', draft.type, block.kind, block.lang, block.refs.join(','), block.text), group: `draft: ${draft.type} v${draft.version}`, source: where,
        sourceText: cited.map(segment => segment.text).join(' '), proposed: block.text, translation: '',
        question, needsQualifiedReviewer: block.kind !== 'quote' && block.kind !== 'detail' && DOCTRINAL.test(block.text) })
    }
  }
  return rows
}

export type Decisions = Record<string, Decision>
export const openRows = (rows: ReviewRow[], decisions: Decisions) => rows.filter(row => decisions[row.id]?.decision !== 'accept')

/* ------------------------------------------------------------------ approval and state */
export const draftHash = (draft: DraftVersion) => sha256(JSON.stringify({ type: draft.type, title: draft.title, content: draft.content }))

/** Reasons a draft cannot be approved right now. Empty means it can. */
export function approvalBlockers(item: Item, draft: DraftVersion, rows: ReviewRow[], decisions: Decisions): string[] {
  const blockers: string[] = []
  if (item.sample) blockers.push('this is SAMPLE content, which can never be approved or published')
  if (item.source.permission.status !== 'confirmed') blockers.push(`permission to publish is "${item.source.permission.status}", not confirmed`)
  const mine = rows.filter(row => row.group === `draft: ${draft.type} v${draft.version}` || row.group === 'scripture' || row.group === 'permission')
  const undecided = mine.filter(row => !decisions[row.id])
  const refused = mine.filter(row => decisions[row.id] && decisions[row.id].decision !== 'accept')
  if (undecided.length) blockers.push(`${undecided.length} review row(s) have no decision yet`)
  if (refused.length) blockers.push(`${refused.length} review row(s) were not accepted (corrections must be applied as a new version, then reviewed)`)
  return blockers
}

export type Status = { state: State; drafts: Array<{ type: DraftType; version: number; sha256: string; approved: Approval | null; staleApprovals: number; published: Publication[] }>; notes: string[] }
/**
 * The item's state, derived from what exists. An approval counts only for the exact version it was given to: when a
 * newer version of that draft exists, the approval is stale and the item is back in review.
 */
export function computeStatus(input: { hasProcessed: boolean; hasReview: boolean; drafts: DraftVersion[]; approvals: Approval[]; publications: Publication[] }): Status {
  const notes: string[] = []
  const drafts = input.drafts.map(draft => {
    const hash = draftHash(draft)
    const all = input.approvals.filter(approval => approval.draft === draft.type)
    const approved = all.find(approval => approval.sha256 === hash && approval.version === draft.version) ?? null
    const stale = all.filter(approval => approval.sha256 !== hash).length
    if (!approved && stale) notes.push(`${draft.type}: changed after approval; v${draft.version} must be reviewed and approved again`)
    return { type: draft.type, version: draft.version, sha256: hash, approved, staleApprovals: stale, published: input.publications.filter(publication => publication.draft === draft.type && publication.sha256 === hash) }
  })
  const state: State = drafts.some(draft => draft.approved && draft.published.length) ? 'published'
    : drafts.some(draft => draft.approved) ? 'approved'
    : input.hasReview ? 'needs_review'
    : input.hasProcessed ? 'processed' : 'received'
  return { state, drafts, notes }
}

/* ------------------------------------------------------------------ rendering */
export const escapeHtml = (value: string) => value.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;')
const PAGE_STYLE = `
:root{--bg:#f6f1e6;--card:#fffaf0;--ink:#1c2233;--muted:#5d6475;--line:#d9cfb8;--gold:#9a7421;--warn:#8a3b12;--ok:#2f6b3a}
@media (prefers-color-scheme:dark){:root{--bg:#141a2a;--card:#1c2438;--ink:#f1ead8;--muted:#b3b9c9;--line:#39435c;--gold:#e0b65a;--warn:#f0a070;--ok:#8fd19e}}
*{box-sizing:border-box}body{margin:0;background:var(--bg);color:var(--ink);font:16px/1.6 system-ui,"Noto Sans Ethiopic","Nyala",sans-serif}
main{max-width:60rem;margin:0 auto;padding:1rem}h1{font-size:1.5rem;line-height:1.25}h2{font-size:1.2rem;margin-top:2rem}
.banner{border:2px solid var(--warn);color:var(--warn);padding:.6rem .8rem;border-radius:.5rem;font-weight:600;margin:.8rem 0}
.banner.ok{border-color:var(--ok);color:var(--ok)}.meta{color:var(--muted);font-size:.9rem}
.card{background:var(--card);border:1px solid var(--line);border-radius:.6rem;padding:.8rem;margin:.8rem 0;overflow-wrap:anywhere}
.tag{display:inline-block;font-size:.72rem;letter-spacing:.04em;text-transform:uppercase;border:1px solid var(--gold);color:var(--gold);border-radius:1rem;padding:0 .5rem;margin-right:.4rem}
.tag.flag{border-color:var(--warn);color:var(--warn)}.src{color:var(--muted);font-size:.85rem}
label{display:block;font-size:.85rem;color:var(--muted);margin-top:.5rem}select,textarea,input,button{font:inherit;width:100%;padding:.45rem;border:1px solid var(--line);border-radius:.4rem;background:var(--bg);color:var(--ink)}
button{cursor:pointer;font-weight:600;margin-top:.6rem}blockquote{margin:.3rem 0;padding-left:.8rem;border-left:3px solid var(--gold)}
[lang=am]{font-size:1.05rem}`
export const page = (title: string, body: string, script = '') => `<!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><meta name="robots" content="noindex">
<title>${escapeHtml(title)}</title><style>${PAGE_STYLE}</style></head><body><main>${body}</main>${script ? `<script>${script}</script>` : ''}</body></html>
`

/** A self-contained review page: every row with its source, proposed wording, question and the reviewer's decision. */
export function renderReviewHtml(item: Item, rows: ReviewRow[], decisions: Decisions): string {
  const cards = rows.map(row => {
    const decided = decisions[row.id]
    return `<section class="card" data-row="${row.id}">
<div><span class="tag">${escapeHtml(row.group)}</span>${row.needsQualifiedReviewer ? '<span class="tag flag">needs a qualified reviewer</span>' : ''}<span class="src">${escapeHtml(row.source)}</span></div>
${row.sourceText ? `<p class="src">Source: ${escapeHtml(row.sourceText)}</p>` : ''}
<blockquote>${escapeHtml(row.proposed)}</blockquote>
${row.translation ? `<p class="src">Machine translation (unreviewed): ${escapeHtml(row.translation)}</p>` : ''}
<p><strong>${escapeHtml(row.question)}</strong></p>
<label>Decision<select data-decision><option value="">— not decided —</option>${['accept', 'correct', 'reject', 'needs-clergy'].map(value => `<option value="${value}"${decided?.decision === value ? ' selected' : ''}>${value}</option>`).join('')}</select></label>
<label>Correction or note<textarea data-correction rows="2">${escapeHtml(decided?.correction ?? '')}</textarea></label>
</section>`
  }).join('\n')
  const body = `<h1>Review: ${escapeHtml(item.title)}</h1>
${item.sample ? '<p class="banner">SAMPLE CONTENT — demonstration only, not real church material.</p>' : ''}
<p class="meta">${escapeHtml([item.kind, item.source.speaker && `speaker: ${item.source.speaker}`, item.source.date, `language: ${item.source.language}`, `permission: ${item.source.permission.status}`].filter(Boolean).join(' · '))}</p>
<p class="meta">${rows.length} rows. Your choices are saved in this browser as you go. When finished, download the decisions file and hand it back for import. Nothing on this page publishes anything.</p>
<label>Reviewer name<input id="reviewer"></label><label>Role (e.g. editor, deacon, priest)<input id="role"></label>
${cards}
<button id="download" type="button">Download decisions file</button>`
  const script = `const key='cw-review-${item.id}';const saved=JSON.parse(localStorage.getItem(key)||'{}');
const get=()=>{const out={reviewer:document.getElementById('reviewer').value,role:document.getElementById('role').value,rows:{}};document.querySelectorAll('[data-row]').forEach(c=>{const d=c.querySelector('[data-decision]').value;const n=c.querySelector('[data-correction]').value;if(d||n)out.rows[c.dataset.row]={decision:d,correction:n}});return out};
if(saved.reviewer)document.getElementById('reviewer').value=saved.reviewer;if(saved.role)document.getElementById('role').value=saved.role;
document.querySelectorAll('[data-row]').forEach(c=>{const s=saved.rows&&saved.rows[c.dataset.row];if(s){if(s.decision)c.querySelector('[data-decision]').value=s.decision;if(s.correction)c.querySelector('[data-correction]').value=s.correction}});
document.addEventListener('input',()=>localStorage.setItem(key,JSON.stringify(get())));
document.getElementById('download').onclick=()=>{const a=document.createElement('a');a.href=URL.createObjectURL(new Blob([JSON.stringify({item:'${item.id}',...get()},null,1)],{type:'application/json'}));a.download='decisions-${item.id}.json';a.click()};`
  return page(`Review: ${item.title}`, body, script)
}

const KIND_LABEL: Record<BlockKind, string> = { quote: 'Quotation', paraphrase: 'Paraphrase', translation: 'Translation', scripture: 'Scripture', detail: 'From the source', generated: 'Editorial wording', heading: '' }
/** Website preview of the latest drafts, with each block labelled for what it is and a banner that states approval. */
export function renderPreviewHtml(item: Item, status: Status, drafts: DraftVersion[], source: Segment[]): string {
  const byId = new Map(source.map(segment => [segment.id, segment]))
  const sections = drafts.map(draft => {
    const entry = status.drafts.find(row => row.type === draft.type)
    const banner = entry?.approved
      ? `<p class="banner ok">Approved version ${draft.version} — ${escapeHtml(entry.approved.by)} (${escapeHtml(entry.approved.role)}), ${entry.approved.at.slice(0, 10)}. Not published by this tool.</p>`
      : `<p class="banner">DRAFT version ${draft.version} — not approved. Do not publish or share.</p>`
    const blocks = draft.blocks.map(block => {
      if (block.kind === 'heading') return `<h3 lang="${block.lang}">${escapeHtml(block.text)}</h3>`
      const cited = block.refs.map(ref => byId.get(ref)).filter((segment): segment is Segment => Boolean(segment)).map(segmentLabel).join(', ')
      const text = escapeHtml(block.text).replace(/\n/g, '<br>')
      return `<div class="card"><span class="tag">${KIND_LABEL[block.kind]}</span><span class="src">${escapeHtml(block.scripture ?? cited)}</span>
${block.kind === 'quote' || block.kind === 'scripture' ? `<blockquote lang="${block.lang}">${text}</blockquote>` : `<p lang="${block.lang}">${text}</p>`}</div>`
    }).join('\n')
    return `<h2>${escapeHtml(draft.type)}${draft.title.en ? `: ${escapeHtml(draft.title.en)}` : ''}</h2>${draft.title.am ? `<p lang="am"><strong>${escapeHtml(draft.title.am)}</strong></p>` : ''}
${banner}<p class="meta">Prepared by: ${escapeHtml(draft.generator)}</p>${blocks}`
  }).join('\n')
  const body = `<h1>${escapeHtml(item.title)}</h1>
${item.sample ? '<p class="banner">SAMPLE CONTENT — demonstration only, not real church material.</p>' : ''}
<p class="meta">${escapeHtml([item.source.speaker && `Speaker: ${item.source.speaker}`, item.source.date, `Workflow state: ${status.state}`, `Permitted channels: ${item.source.channels.join(', ') || 'none recorded'}`].filter(Boolean).join(' · '))}</p>
${sections || '<p>No drafts yet.</p>'}`
  return page(`Preview: ${item.title}`, body)
}

/** Plain-text version of a draft for a messaging channel. Labels are kept so nobody mistakes paraphrase for quotation. */
export function renderChannelText(draft: DraftVersion, lang: 'am' | 'en'): string {
  const lines: string[] = []
  const title = draft.title[lang]
  if (title) lines.push(title, '')
  for (const block of draft.blocks.filter(block => block.lang === lang)) {
    if (block.kind === 'quote') lines.push(`“${block.text}”`)
    else if (block.kind === 'scripture') lines.push(`${block.text} (${block.scripture})`)
    else lines.push(block.text)
    lines.push('')
  }
  return `${lines.join('\n').trim()}\n`
}
