/**
 * Church Library structured import — parse, clean, validate and preview.
 *
 * Pure (no network). Turns Markdown files (with optional YAML frontmatter and
 * stable IDs) or JSON payloads into the exact payload accepted by the
 * `church_library_import_structured` database function.
 *
 * Text rules:
 *   - paragraph wording is never changed, summarised or "corrected";
 *   - editorial review markers 〔…〕 are taken out of the text and kept as
 *     review notes on that paragraph;
 *   - HTML character entities left by converters are decoded (reported);
 *   - anything uncertain is reported as an issue, never silently fixed.
 *
 * Markdown conventions (all optional except the content itself):
 *   ---                         frontmatter: id, subject, language, title,
 *   id: SS-001                  chapter_number, book_title, book_title_am,
 *   language: am                book_title_en, book_title_gez, source_document
 *   ---
 *   # Chapter title {#SS-001}           chapter (level 1)
 *   ## Section title {#SS-001-S001}      section (level 2)
 *   ### Sub-section {#SS-001-S001-A}      sub-section (level 3)
 *   <!-- section SS-001-S000 -->         untitled lead section
 *   <!-- page: 12 -->                    original page number from here on
 *   <!-- SS-001-S001-P001 -->            ID of the next paragraph
 */

export type BlockType = 'paragraph' | 'list_item' | 'quotation' | 'heading'
export type LibraryLanguage = 'am' | 'en' | 'gez' | 'mixed' | 'other'

export type ImportSection = {
  key: string
  parent_key: string | null
  level: number
  title: string | null
  source_heading: string | null
  page_start: number | null
  page_end: number | null
}

export type ImportPassage = {
  key: string
  section_key: string | null
  block_type: BlockType
  content: string
  content_hash: string
  page_start: number | null
  page_end: number | null
  review_notes: string[]
}

export type ImportBookMeta = {
  slug: string
  title: string
  title_amharic: string | null
  title_english: string | null
  title_geez: string | null
  language: LibraryLanguage
  collection_key: string | null
  source_document_name: string | null
  source_document_sha256: string | null
  author: string | null
  category: string | null
  description: string | null
  document_type: string
}

export type ImportPayload = {
  book: ImportBookMeta
  sections: ImportSection[]
  passages: ImportPassage[]
}

export type IssueLevel = 'error' | 'warning' | 'info'
export type ImportIssue = { level: IssueLevel; file?: string; key?: string; message: string }

export type ImportPreview = {
  payloads: ImportPayload[]
  issues: ImportIssue[]
  stats: {
    files: number
    books: number
    chapters: number
    sections: number
    paragraphs: number
    reviewNotes: number
    entitiesDecoded: number
    duplicateParagraphsWithinImport: number
    duplicateParagraphsExisting: number
  }
}

export type SourceFile = { name: string; text: string }

const REVIEW_MARK = /\s*〔[^〕]*〕\s*/gu
const ENTITY = /&(#x[0-9a-f]+|#\d+|amp|lt|gt|quot|apos|nbsp);/gi
const ETHIOPIC = /[ሀ-፿ᎀ-᎟ⶀ-⷟꬀-꬯]/u
const LANGS: LibraryLanguage[] = ['am', 'en', 'gez', 'mixed', 'other']

/** Deterministic 53-bit hash (cyrb53), hex. Same result in the browser and Node. */
export function contentHash(text: string): string {
  const s = text.normalize('NFC').replace(/\s+/g, ' ').trim()
  let h1 = 0xdeadbeef
  let h2 = 0x41c6ce57
  for (let i = 0; i < s.length; i++) {
    const ch = s.charCodeAt(i)
    h1 = Math.imul(h1 ^ ch, 2654435761)
    h2 = Math.imul(h2 ^ ch, 1597334677)
  }
  h1 = Math.imul(h1 ^ (h1 >>> 16), 2246822507) ^ Math.imul(h2 ^ (h2 >>> 13), 3266489909)
  h2 = Math.imul(h2 ^ (h2 >>> 16), 2246822507) ^ Math.imul(h1 ^ (h1 >>> 13), 3266489909)
  return (4294967296 * (2097151 & h2) + (h1 >>> 0)).toString(16).padStart(14, '0')
}

export function slugify(value: string): string {
  return value
    .normalize('NFKD')
    .replace(/[̀-ͯ]/g, '')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
    .slice(0, 80)
}

function decodeEntities(text: string): { text: string; count: number } {
  let count = 0
  const out = text.replace(ENTITY, (m, body: string) => {
    count++
    const b = body.toLowerCase()
    if (b === 'amp') return '&'
    if (b === 'lt') return '<'
    if (b === 'gt') return '>'
    if (b === 'quot') return '"'
    if (b === 'apos') return "'"
    if (b === 'nbsp') return ' '
    const code = b.startsWith('#x') ? parseInt(b.slice(2), 16) : parseInt(b.slice(1), 10)
    return Number.isFinite(code) ? String.fromCodePoint(code) : m
  })
  return { text: out, count }
}

/** Minimal YAML frontmatter reader (flat key: value pairs, JSON-style strings). */
export function parseFrontmatter(text: string): { meta: Record<string, string>; body: string } {
  const m = /^\uFEFF?---\r?\n([\s\S]*?)\r?\n---\r?\n?/.exec(text)
  if (!m) return { meta: {}, body: text }
  const meta: Record<string, string> = {}
  for (const line of m[1].split(/\r?\n/)) {
    const kv = /^([A-Za-z0-9_]+):\s*(.*)$/.exec(line)
    if (!kv) continue
    let v = kv[2].trim()
    if (v.startsWith('"') && v.endsWith('"')) {
      try {
        v = JSON.parse(v)
      } catch {
        v = v.slice(1, -1)
      }
    } else if (v.startsWith("'") && v.endsWith("'")) {
      v = v.slice(1, -1).replace(/''/g, "'")
    }
    if (v === 'null') v = ''
    meta[kv[1]] = v
  }
  return { meta, body: text.slice(m[0].length) }
}

function normaliseLanguage(value: string | undefined, sample: string): LibraryLanguage {
  const v = (value || '').toLowerCase().trim()
  if (LANGS.includes(v as LibraryLanguage)) return v as LibraryLanguage
  if (v === 'amharic') return 'am'
  if (v === 'english') return 'en'
  if (v === 'geez' || v === 'ge\'ez' || v === 'gez') return 'gez'
  return ETHIOPIC.test(sample) ? 'am' : 'en'
}

function blockTypeOf(text: string): { type: BlockType; content: string } {
  if (/^>\s?/.test(text)) {
    return { type: 'quotation', content: text.split('\n').map((l) => l.replace(/^>\s?/, '')).join('\n') }
  }
  if (/^(-|\*|\+)\s+\S/.test(text) || /^\d+\.\s+\S/.test(text)) return { type: 'list_item', content: text }
  return { type: 'paragraph', content: text }
}

const HEADING = /^(#{1,4})\s+(.+?)\s*(?:\{#([A-Za-z0-9_.:-]+)\})?\s*$/
const ID_COMMENT = /^<!--\s*([A-Za-z0-9_.:-]+)\s*-->$/
const SECTION_COMMENT = /^<!--\s*section\s+([A-Za-z0-9_.:-]+)\s*-->$/i
const PAGE_COMMENT = /^<!--\s*page\s*:?\s*(\d+)\s*-->$/i

type ParsedFile = {
  file: string
  meta: Record<string, string>
  language: LibraryLanguage
  subject: string
  order: number
  sections: ImportSection[]
  passages: ImportPassage[]
}

function parseMarkdownFile(file: SourceFile, issues: ImportIssue[], counters: { entities: number; notes: number }): ParsedFile {
  const { meta, body } = parseFrontmatter(file.text.replace(/\r\n?/g, '\n'))
  const language = normaliseLanguage(meta.language, body)
  const subject = slugify(meta.subject || meta.collection || file.name.replace(/\.[^.]+$/, '').replace(/^\d+-/, '')) || 'church-library'
  const chapterId = (meta.id || '').trim()
  const sections: ImportSection[] = []
  const passages: ImportPassage[] = []
  const lines = body.split('\n')

  let chapterKey: string | null = null
  let level2: string | null = null
  let current: string | null = null
  let pendingId: string | null = null
  let page: number | null = null
  let autoSection = 0
  const autoPara = new Map<string, number>()

  const addSection = (s: ImportSection) => {
    sections.push(s)
    current = s.key
  }
  const ensureChapter = () => {
    if (chapterKey) return
    chapterKey = chapterId || slugify(file.name.replace(/\.[^.]+$/, '')).toUpperCase() || 'CH-1'
    addSection({ key: chapterKey, parent_key: null, level: 1, title: meta.title || null, source_heading: null, page_start: page, page_end: page })
    issues.push({ level: 'info', file: file.name, message: 'No chapter heading found; the chapter title comes from the frontmatter.' })
  }

  let i = 0
  while (i < lines.length) {
    const raw = lines[i]
    const line = raw.trim()
    if (!line) {
      i++
      continue
    }
    let m: RegExpExecArray | null
    if ((m = PAGE_COMMENT.exec(line))) {
      page = Number(m[1])
      i++
      continue
    }
    if ((m = SECTION_COMMENT.exec(line))) {
      ensureChapter()
      // Untitled lead section: a sibling of the chapter's titled sections.
      addSection({ key: m[1], parent_key: chapterKey, level: 2, title: null, source_heading: null, page_start: page, page_end: page })
      level2 = null
      i++
      continue
    }
    if ((m = ID_COMMENT.exec(line))) {
      pendingId = m[1]
      i++
      continue
    }
    if (line.startsWith('<!--')) {
      // other comments are editorial; never part of the text
      while (i < lines.length && !lines[i].includes('-->')) i++
      i++
      continue
    }
    if ((m = HEADING.exec(line))) {
      const depth = m[1].length
      const title = m[2].trim()
      if (depth === 1) {
        chapterKey = m[3] || chapterId || `CH-${sections.filter((s) => s.level === 1).length + 1}`
        addSection({ key: chapterKey, parent_key: null, level: 1, title, source_heading: title, page_start: page, page_end: page })
        level2 = null
      } else {
        ensureChapter()
        autoSection++
        const key = m[3] || `${chapterKey}-S${String(autoSection).padStart(3, '0')}`
        if (!m[3]) issues.push({ level: 'info', file: file.name, key, message: `Heading "${title}" had no ID; assigned ${key}.` })
        const parent = depth === 2 || !level2 ? chapterKey : level2
        addSection({ key, parent_key: parent, level: Math.min(4, depth), title, source_heading: title, page_start: page, page_end: page })
        if (depth === 2) level2 = key
      }
      i++
      continue
    }
    // paragraph: consecutive non-blank, non-structural lines
    const buf: string[] = []
    while (i < lines.length && lines[i].trim() && !HEADING.test(lines[i].trim()) && !lines[i].trim().startsWith('<!--')) {
      buf.push(lines[i].replace(/\s+$/, ''))
      i++
    }
    ensureChapter()
    let text = buf.join('\n')
    const decoded = decodeEntities(text)
    if (decoded.count) {
      counters.entities += decoded.count
      issues.push({ level: 'warning', file: file.name, key: pendingId || undefined, message: `Decoded ${decoded.count} HTML character entit${decoded.count === 1 ? 'y' : 'ies'} (formatting artifact).` })
      text = decoded.text
    }
    const notes = text.match(/〔[^〕]*〕/gu) || []
    if (notes.length) {
      counters.notes += notes.length
      text = text.replace(REVIEW_MARK, ' ').replace(/[ \t]{2,}/g, ' ').trim()
    }
    const sectionKey = current
    const n = (autoPara.get(sectionKey || '') || 0) + 1
    autoPara.set(sectionKey || '', n)
    const key = pendingId || `${sectionKey}-P${String(n).padStart(3, '0')}`
    pendingId = null
    if (!text) {
      issues.push({ level: 'warning', file: file.name, key, message: 'A block contained only editorial notes; the notes are kept on the next paragraph.' })
      continue
    }
    const { type, content } = blockTypeOf(text)
    passages.push({ key, section_key: sectionKey, block_type: type, content, content_hash: contentHash(content), page_start: page, page_end: page, review_notes: notes })
  }
  return { file: file.name, meta, language, subject, order: Number(meta.chapter_number ?? NaN), sections, passages }
}

type ManifestLike = {
  chapters?: Array<{ sections?: Record<string, Array<{ review_markers?: Array<{ paragraph: string; markers: string[] }> }>> }>
  subject?: string
  title?: Record<string, string>
  source_documents?: Record<string, { file?: string; sha256?: string }>
}

function isPayload(value: unknown): value is ImportPayload {
  return Boolean(value && typeof value === 'object' && 'book' in value && 'passages' in value)
}

/** Build preview + payloads from any mix of .md and .json files. */
export function buildImportPreview(files: SourceFile[], options: { existingHashes?: Set<string>; existingSlugs?: Set<string> } = {}): ImportPreview {
  const issues: ImportIssue[] = []
  const counters = { entities: 0, notes: 0 }
  let manifest: ManifestLike | null = null
  const direct: ImportPayload[] = []
  const parsed: ParsedFile[] = []

  for (const f of files) {
    const lower = f.name.toLowerCase()
    if (lower.endsWith('.json')) {
      try {
        const data = JSON.parse(f.text) as unknown
        if (Array.isArray(data) && data.every(isPayload)) direct.push(...(data as ImportPayload[]))
        else if (isPayload(data)) direct.push(data)
        else if (data && typeof data === 'object' && 'chapters' in (data as object)) manifest = data as ManifestLike
        else issues.push({ level: 'error', file: f.name, message: 'JSON is neither an import payload nor a collection manifest.' })
      } catch (e) {
        issues.push({ level: 'error', file: f.name, message: `Invalid JSON: ${(e as Error).message}` })
      }
      continue
    }
    if (lower.endsWith('.md') || lower.endsWith('.markdown') || lower.endsWith('.txt')) {
      const pf = parseMarkdownFile(f, issues, counters)
      if (pf.meta.publication_status === 'not_publishable') {
        issues.push({ level: 'info', file: f.name, message: 'Skipped: marked not publishable (review material).' })
        continue
      }
      parsed.push(pf)
      continue
    }
    issues.push({ level: 'warning', file: f.name, message: 'Unsupported file type; skipped.' })
  }

  // Group Markdown files into one book per (subject, language), ordered by chapter.
  const groups = new Map<string, ParsedFile[]>()
  for (const pf of parsed) {
    const k = `${pf.subject}::${pf.language}`
    groups.set(k, [...(groups.get(k) || []), pf])
  }
  const payloads: ImportPayload[] = [...direct]
  for (const [k, list] of groups) {
    list.sort((a, b) => (Number.isFinite(a.order) ? a.order : 1e9) - (Number.isFinite(b.order) ? b.order : 1e9) || a.file.localeCompare(b.file))
    const [subject, language] = k.split('::') as [string, LibraryLanguage]
    const meta = list[0].meta
    const mTitle = manifest?.subject === subject ? manifest.title : undefined
    const titleAm = meta.book_title_am || mTitle?.am || null
    const titleEn = meta.book_title_en || mTitle?.en || null
    const titleGez = meta.book_title_gez || mTitle?.gez || null
    const title = meta.book_title || (language === 'am' ? titleAm : language === 'gez' ? titleGez : titleEn) || titleEn || titleAm ||
      subject.replace(/-/g, ' ').replace(/\b\w/g, (c) => c.toUpperCase())
    const src = manifest?.subject === subject ? manifest.source_documents?.[language] : undefined
    payloads.push({
      book: {
        slug: `${subject}-${language}`,
        title,
        title_amharic: titleAm,
        title_english: titleEn,
        title_geez: titleGez,
        language,
        collection_key: subject,
        source_document_name: meta.source_document || src?.file || null,
        source_document_sha256: src?.sha256 || null,
        author: meta.author || null,
        category: meta.category || null,
        description: meta.description || null,
        document_type: meta.document_type || 'book',
      },
      sections: list.flatMap((f) => f.sections),
      passages: list.flatMap((f) => f.passages),
    })
  }

  // Review notes recorded in a collection manifest travel with their paragraphs.
  if (manifest?.chapters) {
    const notes = new Map<string, string[]>()
    for (const ch of manifest.chapters) {
      for (const [lang, secs] of Object.entries(ch.sections || {})) {
        for (const s of secs || []) {
          for (const r of s.review_markers || []) notes.set(`${lang}::${r.paragraph}`, r.markers)
        }
      }
    }
    for (const p of payloads) {
      for (const q of p.passages) {
        const extra = notes.get(`${p.book.language}::${q.key}`)
        if (extra?.length) q.review_notes = [...new Set([...q.review_notes, ...extra])]
      }
    }
  }

  // Validation and duplicate detection.
  let dupWithin = 0
  let dupExisting = 0
  for (const p of payloads) {
    const slugs = options.existingSlugs
    if (!/^[a-z0-9]+(-[a-z0-9]+)*$/.test(p.book.slug)) issues.push({ level: 'error', message: `Invalid book slug "${p.book.slug}".` })
    if (slugs?.has(p.book.slug)) issues.push({ level: 'error', message: `A book with slug "${p.book.slug}" already exists. Existing books are never overwritten.` })
    const sectionKeys = new Set<string>()
    for (const s of p.sections) {
      if (sectionKeys.has(s.key)) issues.push({ level: 'error', key: s.key, message: `Duplicate section ID ${s.key} in "${p.book.slug}".` })
      sectionKeys.add(s.key)
      if (s.parent_key && !sectionKeys.has(s.parent_key)) issues.push({ level: 'error', key: s.key, message: `Section ${s.key} appears before its parent ${s.parent_key}.` })
    }
    const pKeys = new Set<string>()
    const seen = new Map<string, string>()
    for (const q of p.passages) {
      if (pKeys.has(q.key)) issues.push({ level: 'error', key: q.key, message: `Duplicate paragraph ID ${q.key} in "${p.book.slug}".` })
      pKeys.add(q.key)
      if (q.section_key && !sectionKeys.has(q.section_key)) issues.push({ level: 'error', key: q.key, message: `Paragraph ${q.key} refers to unknown section ${q.section_key}.` })
      if (!q.content.trim()) issues.push({ level: 'error', key: q.key, message: `Paragraph ${q.key} is empty.` })
      const first = seen.get(q.content_hash)
      if (first) {
        dupWithin++
        issues.push({ level: 'info', key: q.key, message: `Same text as ${first} (kept — repeated teachings are preserved).` })
      } else seen.set(q.content_hash, q.key)
      if (options.existingHashes?.has(q.content_hash)) {
        dupExisting++
        issues.push({ level: 'warning', key: q.key, message: `Paragraph ${q.key} already exists in another Church Library book.` })
      }
    }
    if (!p.passages.length) issues.push({ level: 'error', message: `"${p.book.slug}" has no paragraphs.` })
  }
  if (counters.notes) issues.push({ level: 'warning', message: `${counters.notes} editorial review marker(s) were removed from the text and kept as review notes on their paragraphs.` })

  return {
    payloads,
    issues,
    stats: {
      files: files.length,
      books: payloads.length,
      chapters: payloads.reduce((n, p) => n + p.sections.filter((s) => s.level === 1).length, 0),
      sections: payloads.reduce((n, p) => n + p.sections.filter((s) => s.level > 1).length, 0),
      paragraphs: payloads.reduce((n, p) => n + p.passages.length, 0),
      reviewNotes: counters.notes,
      entitiesDecoded: counters.entities,
      duplicateParagraphsWithinImport: dupWithin,
      duplicateParagraphsExisting: dupExisting,
    },
  }
}

export function hasBlockingIssues(preview: ImportPreview): boolean {
  return preview.issues.some((i) => i.level === 'error')
}
