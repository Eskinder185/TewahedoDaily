/**
 * Search Buddy Bible lookup against public Supabase Bible tables.
 * Uses targeted queries only — never loads the full verse corpus.
 */
import { supabase } from '../supabase/client'
import { loadBibleCatalog, type BibleCatalog } from './bibleQueries'
import type {
  BibleEditionCode,
  CanonicalBook,
  SourceBook,
} from './bibleTypes'
import { parseBibleReference, type ParsedBibleReference } from './parseBibleReference'
import type { SiteSearchResult } from '../search/types'

export type BibleSearchLanguage = 'am' | 'en'

export type BibleSearchOptions = {
  language?: BibleSearchLanguage
  textLimit?: number
}

type ResolvedBook = {
  book: CanonicalBook
  /** Volume targeted by queries like "1 Samuel"; null = whole canonical book. */
  preferredSource: SourceBook | null
  displayNameEn: string
  displayNameAm: string
  score: number
}

type EditionRef = {
  code: BibleEditionCode
  languageCode: string
  name: string
}

type LocatedChapter = {
  chapterId: string
  chapterNumber: number
  ordinal: number
  source: SourceBook
  edition: EditionRef
}

type VerseRow = {
  id: string
  verse_number: number
  source_order: number
  text: string
}

const TEXT_LIMIT_DEFAULT = 12
const CATALOG_TTL_MS = 5 * 60 * 1000

let catalogCache: { at: number; data: BibleCatalog } | null = null

/** Safe English aliases → canonical slug or volume label. DB names remain primary. */
const EN_ALIASES: Record<string, string> = {
  gen: 'genesis',
  exo: 'exodus',
  exod: 'exodus',
  lev: 'leviticus',
  num: 'numbers',
  deut: 'deuteronomy',
  dt: 'deuteronomy',
  josh: 'joshua',
  jos: 'joshua',
  jdg: 'judges',
  judg: 'judges',
  rut: 'ruth',
  ps: 'psalms',
  psa: 'psalms',
  psalm: 'psalms',
  prov: 'proverbs',
  ecc: 'ecclesiastes',
  eccl: 'ecclesiastes',
  song: 'song-of-songs',
  sos: 'song-of-songs',
  isa: 'isaiah',
  jer: 'jeremiah-collection',
  ezek: 'ezekiel',
  dan: 'daniel',
  hos: 'hosea',
  obad: 'obadiah',
  mic: 'micah',
  nah: 'nahum',
  hab: 'habakkuk',
  zeph: 'zephaniah',
  hag: 'haggai',
  zech: 'zechariah',
  mal: 'malachi',
  matt: 'matthew',
  mt: 'matthew',
  mrk: 'mark',
  mk: 'mark',
  luk: 'luke',
  lk: 'luke',
  jn: 'john',
  jhn: 'john',
  act: 'acts',
  rom: 'romans',
  gal: 'galatians',
  eph: 'ephesians',
  phil: 'philippians',
  php: 'philippians',
  col: 'colossians',
  tit: 'titus',
  phm: 'philemon',
  heb: 'hebrews',
  jas: 'james',
  rev: 'revelation',
  '1 sam': '1 samuel',
  '2 sam': '2 samuel',
  '1 sam.': '1 samuel',
  '2 sam.': '2 samuel',
  '1 kgs': '1 kings',
  '2 kgs': '2 kings',
  '1 cor': '1 corinthians',
  '2 cor': '2 corinthians',
  '1 thess': '1 thessalonians',
  '2 thess': '2 thessalonians',
  '1 tim': '1 timothy',
  '2 tim': '2 timothy',
  '1 pet': '1 peter',
  '2 pet': '2 peter',
  '1 jn': '1 john',
  '2 jn': '2 john',
  '3 jn': '3 john',
}

function db() {
  if (!supabase) throw new Error('The Bible library is unavailable right now.')
  return supabase
}

function norm(value: string): string {
  return value
    .normalize('NFC')
    .toLowerCase()
    .replace(/[.\u2019'’]/g, '')
    .replace(/\s+/g, ' ')
    .trim()
}

function stripAmharicPrefixes(value: string): string {
  return value
    .normalize('NFC')
    .replace(/^(የ|ኦሪት|መጽሐፈ|ትንቢተ|ወደ)\s*/u, '')
    .replace(/^(1ኛ|2ኛ|3ኛ)\s*/u, '')
    .trim()
}

function editionCode(catalog: BibleCatalog, editionId: string): BibleEditionCode | null {
  const code = catalog.editions.find((e) => e.id === editionId)?.code
  return code === 'am' || code === 'web' ? code : null
}

function editionRef(catalog: BibleCatalog, editionId: string): EditionRef | null {
  const edition = catalog.editions.find((e) => e.id === editionId)
  if (!edition) return null
  const code = edition.code === 'am' || edition.code === 'web' ? edition.code : null
  if (!code) return null
  return { code, languageCode: edition.language_code, name: edition.name }
}

async function getCatalog(): Promise<BibleCatalog> {
  const now = Date.now()
  if (catalogCache && now - catalogCache.at < CATALOG_TTL_MS) return catalogCache.data
  const data = await loadBibleCatalog()
  catalogCache = { at: now, data }
  return data
}

function expandBookQuery(bookQuery: string): string {
  const key = norm(bookQuery)
  const aliased = EN_ALIASES[key]
  if (aliased) return aliased
  // "Jn." already stripped by norm
  return bookQuery
}

function scoreBookMatch(
  queryRaw: string,
  book: CanonicalBook,
  sources: SourceBook[],
): { score: number; preferredSource: SourceBook | null; displayNameEn: string; displayNameAm: string } | null {
  const q = norm(expandBookQuery(queryRaw))
  const qAm = queryRaw.normalize('NFC').trim()
  if (!q && !qAm) return null

  let best = 0
  let preferredSource: SourceBook | null = null
  let displayNameEn = book.name_en || book.slug
  let displayNameAm = book.name_am || book.name_en || book.slug

  const consider = (score: number, labelEn?: string | null, labelAm?: string | null, source?: SourceBook | null) => {
    if (score > best) {
      best = score
      if (source) preferredSource = source
      if (labelEn) displayNameEn = labelEn
      if (labelAm) displayNameAm = labelAm
    }
  }

  const slug = norm(book.slug.replace(/-/g, ' '))
  const nameEn = book.name_en ? norm(book.name_en) : ''
  const nameAm = book.name_am?.normalize('NFC').trim() || ''

  if (q && (q === norm(book.slug) || q === slug)) consider(100, book.name_en, book.name_am)
  if (q && nameEn && q === nameEn) consider(98, book.name_en, book.name_am)
  if (qAm && nameAm && qAm === nameAm) consider(98, book.name_en, book.name_am)

  // Alias already expanded to slug-like forms ("1 samuel", "psalms")
  if (q && EN_ALIASES[norm(queryRaw)] && (q === slug || q === nameEn || q === norm(book.slug))) {
    consider(96, book.name_en, book.name_am)
  }

  for (const source of sources) {
    const snEn = source.source_name_en ? norm(source.source_name_en) : ''
    const snAm = source.source_name_am?.normalize('NFC').trim() || ''
    const shortAm = source.source_short_name_am?.normalize('NFC').trim() || ''
    const shortEn = source.source_short_name_en ? norm(source.source_short_name_en) : ''

    if (q && snEn && q === snEn) {
      consider(97, source.source_name_en, source.source_name_am || book.name_am, source)
    }
    if (qAm && snAm && qAm === snAm) {
      consider(97, source.source_name_en || book.name_en, source.source_name_am, source)
    }
    if (q && shortEn && q === shortEn) {
      consider(90, source.source_name_en || book.name_en, source.source_name_am || book.name_am, source)
    }
    // Amharic short names from DB only — exact or query starts with short stem for longer forms.
    if (qAm && shortAm && (qAm === shortAm || (shortAm.length >= 2 && qAm.startsWith(shortAm)))) {
      consider(88, source.source_name_en || book.name_en, source.source_name_am || book.name_am, source)
    }
  }

  // Soft English contains (avoid matching "john" inside unrelated long titles as primary)
  if (q && nameEn) {
    if (nameEn.startsWith(q) || q.startsWith(nameEn)) consider(80, book.name_en, book.name_am)
    else if (nameEn.includes(` ${q}`) || nameEn.includes(q)) consider(60, book.name_en, book.name_am)
  }

  // Amharic: strip liturgical prefixes, then token / prefix match
  if (qAm && nameAm) {
    const stripped = stripAmharicPrefixes(nameAm)
    const firstToken = stripped.split(/\s+/)[0] || ''
    if (stripped === qAm || firstToken === qAm) consider(95, book.name_en, book.name_am)
    else if (stripped.startsWith(qAm) || qAm.startsWith(firstToken) && firstToken.length >= 3) {
      consider(85, book.name_en, book.name_am)
    } else if (nameAm.includes(qAm)) consider(70, book.name_en, book.name_am)
  }

  for (const source of sources) {
    const snAm = source.source_name_am?.normalize('NFC').trim() || ''
    if (!qAm || !snAm) continue
    const stripped = stripAmharicPrefixes(snAm)
    const firstToken = stripped.split(/\s+/)[0] || ''
    if (stripped === qAm || firstToken === qAm) {
      consider(94, source.source_name_en || book.name_en, source.source_name_am, source)
    } else if (stripped.startsWith(qAm)) {
      consider(84, source.source_name_en || book.name_en, source.source_name_am, source)
    }
  }

  // Volume-style English: "1 samuel" against source "1 Samuel" when canonical is "Samuel"
  if (q) {
    for (const source of sources) {
      const snEn = source.source_name_en ? norm(source.source_name_en) : ''
      if (!snEn) continue
      if (snEn === q || snEn.replace(/\s+/g, '') === q.replace(/\s+/g, '')) {
        consider(97, source.source_name_en, source.source_name_am || book.name_am, source)
      }
    }
    // "first corinthians" ↔ name_en
    const asFirst = q.replace(/^1\s+/, 'first ').replace(/^2\s+/, 'second ').replace(/^3\s+/, 'third ')
    if (nameEn && asFirst === nameEn) consider(96, book.name_en, book.name_am)
    const asDigit = q
      .replace(/^first\s+/, '1 ')
      .replace(/^second\s+/, '2 ')
      .replace(/^third\s+/, '3 ')
    for (const source of sources) {
      const snEn = source.source_name_en ? norm(source.source_name_en) : ''
      if (snEn && (snEn === asDigit || snEn === q)) {
        consider(96, source.source_name_en, source.source_name_am || book.name_am, source)
      }
    }
  }

  if (best < 70) return null
  return { score: best, preferredSource, displayNameEn, displayNameAm }
}

export async function resolveBibleBook(bookQuery: string): Promise<ResolvedBook | null> {
  const catalog = await getCatalog()
  const sourcesByBook = new Map<string, SourceBook[]>()
  for (const source of catalog.sources) {
    const list = sourcesByBook.get(source.canonical_book_id) || []
    list.push(source)
    sourcesByBook.set(source.canonical_book_id, list)
  }

  let best: ResolvedBook | null = null
  for (const book of catalog.books) {
    const hit = scoreBookMatch(bookQuery, book, sourcesByBook.get(book.id) || [])
    if (!hit) continue
    // Prefer Gospel John over Johannine letters when scores tie-ish and query is bare "john" / ዮሐንስ
    const candidate: ResolvedBook = {
      book,
      preferredSource: hit.preferredSource,
      displayNameEn: hit.displayNameEn,
      displayNameAm: hit.displayNameAm,
      score: hit.score,
    }
    if (
      !best ||
      candidate.score > best.score ||
      (candidate.score === best.score && book.sort_order < best.book.sort_order)
    ) {
      best = candidate
    }
  }

  // Disambiguate bare John / Ethiopic Gospel name → Gospel of John
  if (best) {
    const q = norm(expandBookQuery(bookQuery))
    const qAm = bookQuery.normalize('NFC').trim()
    const bareJohn = q === 'john' || qAm === '\u12ee\u1210\u1295\u1235'
    if (bareJohn && best.book.slug !== 'john') {
      const gospel = catalog.books.find((b) => b.slug === 'john')
      if (gospel) {
        const hit = scoreBookMatch(bookQuery, gospel, sourcesByBook.get(gospel.id) || [])
        if (hit && hit.score >= 70) {
          best = {
            book: gospel,
            preferredSource: hit.preferredSource,
            displayNameEn: hit.displayNameEn,
            displayNameAm: hit.displayNameAm,
            score: hit.score,
          }
        }
      }
    }
  }

  return best
}

function sourcesForEdition(
  catalog: BibleCatalog,
  bookId: string,
  editionId: string,
  preferred: SourceBook | null,
): SourceBook[] {
  const all = catalog.sources
    .filter((s) => s.canonical_book_id === bookId && s.edition_id === editionId)
    .sort((a, b) => a.source_order - b.source_order)
  if (!preferred) return all
  // Prefer the matched volume when it belongs to this edition; else match by source_part / name.
  if (preferred.edition_id === editionId) return all.filter((s) => s.id === preferred.id)
  const byPart =
    preferred.source_part != null
      ? all.filter((s) => s.source_part === preferred.source_part)
      : []
  if (byPart.length) return byPart
  const prefName = preferred.source_name_en ? norm(preferred.source_name_en) : ''
  const byName = prefName ? all.filter((s) => s.source_name_en && norm(s.source_name_en) === prefName) : []
  if (byName.length) return byName
  // Cross-edition volume: "1 Samuel" → first volume in order when part numbers align via source_order rank
  const prefRank = catalog.sources
    .filter((s) => s.canonical_book_id === bookId && s.edition_id === preferred.edition_id)
    .sort((a, b) => a.source_order - b.source_order)
    .findIndex((s) => s.id === preferred.id)
  if (prefRank >= 0 && all[prefRank]) return [all[prefRank]]
  return all
}

async function locateChapter(
  catalog: BibleCatalog,
  resolved: ResolvedBook,
  chapterNumber: number,
  prefer: BibleSearchLanguage,
): Promise<{ located: LocatedChapter[]; missingEdition: BibleEditionCode[] }> {
  const editionOrder: BibleEditionCode[] =
    prefer === 'am' ? ['am', 'web'] : ['web', 'am']
  const located: LocatedChapter[] = []
  const missingEdition: BibleEditionCode[] = []

  for (const code of editionOrder) {
    const edition = catalog.editions.find((e) => e.code === code)
    if (!edition) {
      missingEdition.push(code)
      continue
    }
    const volumeSources = sourcesForEdition(catalog, resolved.book.id, edition.id, resolved.preferredSource)
    if (!volumeSources.length) {
      missingEdition.push(code)
      continue
    }

    // Reader ordinal across the full canonical book for this edition (all volumes).
    const allEditionSources = catalog.sources
      .filter((s) => s.canonical_book_id === resolved.book.id && s.edition_id === edition.id)
      .sort((a, b) => a.source_order - b.source_order)

    const chapterRows = (
      await db()
        .from('bible_chapters')
        .select('id, chapter_number, source_order, source_book_id')
        .in(
          'source_book_id',
          allEditionSources.map((s) => s.id),
        )
        .order('source_order')
    )

    if (chapterRows.error) throw new Error(chapterRows.error.message)
    const bySource = new Map<string, typeof chapterRows.data>()
    for (const row of chapterRows.data || []) {
      const list = bySource.get(row.source_book_id) || []
      list.push(row)
      bySource.set(row.source_book_id, list)
    }

    const ordered: Array<{
      id: string
      chapter_number: number
      source: SourceBook
      ordinal: number
    }> = []
    for (const source of allEditionSources) {
      const rows = (bySource.get(source.id) || []).sort((a, b) => a.source_order - b.source_order)
      for (const row of rows) {
        ordered.push({
          id: row.id,
          chapter_number: row.chapter_number,
          source,
          ordinal: ordered.length + 1,
        })
      }
    }

    const volumeIds = new Set(volumeSources.map((s) => s.id))
    const match = ordered.find(
      (row) => volumeIds.has(row.source.id) && row.chapter_number === chapterNumber,
    )
    if (!match) {
      missingEdition.push(code)
      continue
    }
    const ref = editionRef(catalog, edition.id)
    if (!ref) continue
    located.push({
      chapterId: match.id,
      chapterNumber: match.chapter_number,
      ordinal: match.ordinal,
      source: match.source,
      edition: ref,
    })
  }

  return { located, missingEdition }
}

async function loadVersesByNumbers(
  chapterId: string,
  verseStart: number,
  verseEnd: number,
): Promise<VerseRow[]> {
  const { data, error } = await db()
    .from('bible_verses')
    .select('id, verse_number, source_order, text')
    .eq('chapter_id', chapterId)
    .gte('verse_number', verseStart)
    .lte('verse_number', verseEnd)
    .order('source_order')
    .order('id')
  if (error) throw new Error(error.message)
  return data || []
}

function languageLabel(edition: EditionRef): string {
  if (edition.code === 'am') return 'Amharic'
  if (edition.code === 'web') return 'English · WEB'
  return edition.name
}

function testamentLabel(collection: CanonicalBook['collection']): string {
  return collection === 'old' ? 'Old Testament' : 'New Testament'
}

function bookAvailability(catalog: BibleCatalog, bookId: string): { am: boolean; en: boolean } {
  let am = false
  let en = false
  for (const source of catalog.sources) {
    if (source.canonical_book_id !== bookId) continue
    const code = editionCode(catalog, source.edition_id)
    if (code === 'am') am = true
    if (code === 'web') en = true
  }
  return { am, en }
}

function toBookResult(resolved: ResolvedBook, catalog: BibleCatalog): SiteSearchResult {
  const avail = bookAvailability(catalog, resolved.book.id)
  const langs = [avail.am ? 'Amharic' : null, avail.en ? 'English' : null].filter(Boolean).join(' / ')
  return {
    sourceType: 'bible-book',
    sourceId: `bible-book:${resolved.book.id}`,
    title: resolved.displayNameEn,
    titleAmharic: resolved.displayNameAm !== resolved.displayNameEn ? resolved.displayNameAm : resolved.book.name_am || '',
    description: `${testamentLabel(resolved.book.collection)}${langs ? ` · ${langs} available` : ''}`,
    route: `/bible/${resolved.book.slug}`,
    imagePath: null,
    score: 0.001,
    matchKind: 'exact',
    typeLabel: 'Bible',
    sourceLabel: langs || undefined,
  }
}

function toChapterResult(
  resolved: ResolvedBook,
  chapter: LocatedChapter,
): SiteSearchResult {
  const title = `${resolved.displayNameEn} ${chapter.chapterNumber}`
  return {
    sourceType: 'bible-chapter',
    sourceId: `bible-chapter:${chapter.chapterId}`,
    title,
    titleAmharic: resolved.displayNameAm || '',
    description: `${languageLabel(chapter.edition)} · Chapter ${chapter.chapterNumber}`,
    route: `/bible/${resolved.book.slug}/${chapter.ordinal}`,
    imagePath: null,
    score: 0.001,
    matchKind: 'exact',
    typeLabel: 'Bible chapter',
    sourceLabel: languageLabel(chapter.edition),
  }
}

function toVerseResults(
  resolved: ResolvedBook,
  chapter: LocatedChapter,
  verses: VerseRow[],
  kind: 'bible-verse' | 'bible-range',
): SiteSearchResult[] {
  if (!verses.length) return []
  if (kind === 'bible-verse' && verses.length === 1) {
    const v = verses[0]
    return [
      {
        sourceType: 'bible-verse',
        sourceId: `bible-verse:${v.id}`,
        title: `${resolved.displayNameEn} ${chapter.chapterNumber}:${v.verse_number}`,
        titleAmharic: resolved.displayNameAm || '',
        description: languageLabel(chapter.edition),
        route: `/bible/${resolved.book.slug}/${chapter.ordinal}`,
        imagePath: null,
        score: 0.001,
        matchKind: 'exact',
        typeLabel: 'Bible verse',
        excerpt: v.text,
        sourceLabel: languageLabel(chapter.edition),
      },
    ]
  }

  // Range or duplicate labels: one card listing verses in source order (not silently dropped).
  const label =
    verses.length === 1
      ? `${resolved.displayNameEn} ${chapter.chapterNumber}:${verses[0].verse_number}`
      : `${resolved.displayNameEn} ${chapter.chapterNumber}:${verses[0].verse_number}–${verses[verses.length - 1].verse_number}`
  const excerpt = verses
    .map((v) => `${v.verse_number} ${v.text}`)
    .join('\n')
    .slice(0, 900)

  return [
    {
      sourceType: kind,
      sourceId: `bible-range:${chapter.chapterId}:${verses.map((v) => v.id).join(',')}`,
      title: label,
      titleAmharic: resolved.displayNameAm || '',
      description: `${languageLabel(chapter.edition)} · ${verses.length} verse row${verses.length === 1 ? '' : 's'}`,
      route: `/bible/${resolved.book.slug}/${chapter.ordinal}`,
      imagePath: null,
      score: 0.001,
      matchKind: 'exact',
      typeLabel: kind === 'bible-range' ? 'Bible range' : 'Bible verse',
      excerpt,
      sourceLabel: languageLabel(chapter.edition),
    },
  ]
}

function calmMissing(message: string, route = '/bible'): SiteSearchResult {
  return {
    sourceType: 'bible-book',
    sourceId: `bible-notice:${norm(message).slice(0, 40)}`,
    title: message,
    titleAmharic: '',
    description: 'Open the Bible library to browse available books.',
    route,
    imagePath: null,
    score: 0.02,
    matchKind: 'exact',
    typeLabel: 'Bible',
  }
}

export async function searchBibleReference(
  parsed: ParsedBibleReference,
  options: BibleSearchOptions = {},
): Promise<{ results: SiteSearchResult[]; intentMessage: string | null; handled: boolean }> {
  const language = options.language || 'en'
  if (!parsed.bookQuery) return { results: [], intentMessage: null, handled: false }

  const resolved = await resolveBibleBook(parsed.bookQuery)
  if (!resolved) {
    if (parsed.isReference) {
      return {
        results: [calmMissing(`No Bible book matched “${parsed.bookQuery}”.`)],
        intentMessage: `I could not find a Bible book named ${parsed.bookQuery}.`,
        handled: true,
      }
    }
    return { results: [], intentMessage: null, handled: false }
  }

  const catalog = await getCatalog()
  const avail = bookAvailability(catalog, resolved.book.id)

  // Book only
  if (parsed.chapter == null) {
    if (!avail.am && !avail.en) {
      return {
        results: [
          calmMissing(
            `${resolved.displayNameEn} is in the catalog, but no published source text is available yet.`,
            `/bible/${resolved.book.slug}`,
          ),
        ],
        intentMessage: `${resolved.displayNameEn} has no published Bible text yet.`,
        handled: true,
      }
    }
    return {
      results: [toBookResult(resolved, catalog)],
      intentMessage: `I found the book of ${resolved.displayNameEn}.`,
      handled: true,
    }
  }

  const { located } = await locateChapter(catalog, resolved, parsed.chapter, language)
  if (!located.length) {
    return {
      results: [
        calmMissing(
          `${resolved.displayNameEn} chapter ${parsed.chapter} was not found in the published sources.`,
          `/bible/${resolved.book.slug}`,
        ),
      ],
      intentMessage: `I could not find ${resolved.displayNameEn} ${parsed.chapter}.`,
      handled: true,
    }
  }

  // Chapter only
  if (parsed.verseStart == null) {
    const primary = located[0]
    const results = located.map((ch) => toChapterResult(resolved, ch))
    // Optional short preview from primary edition
    try {
      const preview = await loadVersesByNumbers(primary.chapterId, 1, 2)
      if (preview.length && results[0]) {
        results[0] = {
          ...results[0],
          excerpt: preview.map((v) => v.text).join(' ').slice(0, 220),
        }
      }
    } catch {
      /* preview is optional */
    }
    return {
      results,
      intentMessage: `I found ${resolved.displayNameEn} chapter ${parsed.chapter}.`,
      handled: true,
    }
  }

  const verseEnd = parsed.verseEnd ?? parsed.verseStart
  const kind = verseEnd !== parsed.verseStart ? 'bible-range' : 'bible-verse'
  const results: SiteSearchResult[] = []
  let anyRows = false
  let anyChapterHadGap = false

  for (const chapter of located) {
    const rows = await loadVersesByNumbers(chapter.chapterId, parsed.verseStart, verseEnd)
    if (!rows.length) {
      anyChapterHadGap = true
      continue
    }
    anyRows = true
    // If specific single verse requested, include every row with that label (duplicates kept).
    const filtered =
      kind === 'bible-verse'
        ? rows.filter((r) => r.verse_number === parsed.verseStart)
        : rows
    if (!filtered.length) {
      anyChapterHadGap = true
      continue
    }
    results.push(...toVerseResults(resolved, chapter, filtered, kind))
  }

  if (!anyRows) {
    return {
      results: [
        calmMissing(
          'That verse number is not present in this imported source chapter.',
          `/bible/${resolved.book.slug}/${located[0].ordinal}`,
        ),
      ],
      intentMessage: 'That verse number is not present in this imported source chapter.',
      handled: true,
    }
  }

  if (anyChapterHadGap && results.length) {
    // Partial availability across editions — keep found rows; note in intent.
    return {
      results,
      intentMessage: `I found ${results[0].title}${results.length > 1 ? ' in more than one edition' : ''}.`,
      handled: true,
    }
  }

  return {
    results,
    intentMessage:
      results.length === 1
        ? `I found ${results[0].title}.`
        : `I found ${results.length} Bible matches.`,
    handled: true,
  }
}

type VerseTextEmbed = {
  id: string
  verse_number: number
  source_order: number
  text: string
  bible_chapters: {
    id: string
    chapter_number: number
    source_order: number
    source_book_id: string
    bible_source_books: {
      id: string
      source_order: number
      source_name_en: string | null
      source_name_am: string | null
      canonical_book_id: string
      edition_id: string
      bible_canonical_books: {
        id: string
        slug: string
        name_en: string | null
        name_am: string | null
        collection: 'old' | 'new'
      }
      bible_editions: {
        code: string
        language_code: string
        name: string
      }
    }
  }
}

export async function searchBibleText(
  queryRaw: string,
  options: BibleSearchOptions = {},
): Promise<SiteSearchResult[]> {
  const q = (queryRaw || '').trim()
  if (q.length < 2) return []
  const limit = options.textLimit ?? TEXT_LIMIT_DEFAULT
  const language = options.language || 'en'

  // Escape ILIKE wildcards in user input
  const pattern = `%${q.replace(/[%_\\]/g, '\\$&')}%`

  const { data, error } = await db()
    .from('bible_verses')
    .select(
      `
      id,
      verse_number,
      source_order,
      text,
      bible_chapters!inner (
        id,
        chapter_number,
        source_order,
        source_book_id,
        bible_source_books!inner (
          id,
          source_order,
          source_name_en,
          source_name_am,
          canonical_book_id,
          edition_id,
          bible_canonical_books!inner (
            id,
            slug,
            name_en,
            name_am,
            collection
          ),
          bible_editions!inner (
            code,
            language_code,
            name
          )
        )
      )
    `,
    )
    .ilike('text', pattern)
    .limit(Math.min(40, limit * 3))

  if (error) throw new Error(error.message)
  const rows = (data || []) as unknown as VerseTextEmbed[]

  const catalog = await getCatalog()
  const preferCode: BibleEditionCode = language === 'am' ? 'am' : 'web'

  const ranked = [...rows].sort((a, b) => {
    const aCode = a.bible_chapters.bible_source_books.bible_editions.code
    const bCode = b.bible_chapters.bible_source_books.bible_editions.code
    const aPref = aCode === preferCode ? 0 : 1
    const bPref = bCode === preferCode ? 0 : 1
    if (aPref !== bPref) return aPref - bPref
    return a.source_order - b.source_order
  })

  /** chapterId → reader ordinal within canonical book + edition */
  const ordinalCache = new Map<string, number>()
  async function ordinalFor(
    bookId: string,
    editionId: string,
    chapterId: string,
    fallback: number,
  ): Promise<number> {
    const cached = ordinalCache.get(chapterId)
    if (cached != null) return cached
    const allSources = catalog.sources
      .filter((s) => s.canonical_book_id === bookId && s.edition_id === editionId)
      .sort((a, b) => a.source_order - b.source_order)
    if (!allSources.length) {
      ordinalCache.set(chapterId, fallback)
      return fallback
    }
    const { data: chRows, error: chErr } = await db()
      .from('bible_chapters')
      .select('id, source_book_id, source_order')
      .in(
        'source_book_id',
        allSources.map((s) => s.id),
      )
      .order('source_order')
    if (chErr) {
      ordinalCache.set(chapterId, fallback)
      return fallback
    }
    let n = 0
    let found = fallback
    for (const src of allSources) {
      const list = (chRows || [])
        .filter((c) => c.source_book_id === src.id)
        .sort((a, b) => a.source_order - b.source_order)
      for (const c of list) {
        n += 1
        ordinalCache.set(c.id, n)
        if (c.id === chapterId) found = n
      }
    }
    return ordinalCache.get(chapterId) ?? found
  }

  const results: SiteSearchResult[] = []
  const seen = new Set<string>()

  for (const row of ranked) {
    if (results.length >= limit) break
    const chapter = row.bible_chapters
    const source = chapter.bible_source_books
    const book = source.bible_canonical_books
    const edition = source.bible_editions
    const code = edition.code === 'am' || edition.code === 'web' ? edition.code : null
    if (!code) continue

    if (seen.has(row.id)) continue
    seen.add(row.id)

    const ordinal = await ordinalFor(
      book.id,
      source.edition_id,
      chapter.id,
      chapter.chapter_number,
    )

    const bookName = book.name_en || source.source_name_en || book.slug
    const editionLabel =
      code === 'am' ? 'Amharic' : code === 'web' ? 'English · WEB' : edition.name
    const excerpt =
      row.text.length > 220 ? `${row.text.slice(0, 217).trim()}…` : row.text

    results.push({
      sourceType: 'bible-text',
      sourceId: `bible-text:${row.id}`,
      title: `${bookName} ${chapter.chapter_number}:${row.verse_number}`,
      titleAmharic: book.name_am || '',
      description: editionLabel,
      route: `/bible/${book.slug}/${ordinal}`,
      imagePath: null,
      score: 0.015,
      matchKind: 'keyword',
      typeLabel: 'Bible text',
      excerpt,
      sourceLabel: editionLabel,
    })
  }

  return results
}

/**
 * Top-level Bible search for Search Buddy.
 * Direct references are resolved first; otherwise verse text is searched.
 */
export async function searchBible(
  queryRaw: string,
  options: BibleSearchOptions = {},
): Promise<{
  results: SiteSearchResult[]
  intentMessage: string | null
  /** True when a direct reference was handled (including unknown book / missing verse). */
  directReference: boolean
}> {
  const parsed = parseBibleReference(queryRaw)
  const resolvedBook =
    parsed.bookQuery && (parsed.isReference || parsed.chapter == null)
      ? await resolveBibleBook(parsed.bookQuery)
      : null

  // Direct reference: chapter/verse shape, or clear book-only match
  if (parsed.isReference || (resolvedBook && !parsed.isReference && parsed.chapter == null && parsed.bookQuery)) {
    // Book-only only when resolver is confident
    if (!parsed.isReference && resolvedBook) {
      // Avoid treating common English words as books (score floor already 70)
      if (resolvedBook.score < 80) {
        // fall through to text search
      } else {
        const ref = await searchBibleReference(
          { ...parsed, isReference: true },
          options,
        )
        return {
          results: ref.results,
          intentMessage: ref.intentMessage,
          directReference: true,
        }
      }
    }
    if (parsed.isReference) {
      const ref = await searchBibleReference(parsed, options)
      return {
        results: ref.results,
        intentMessage: ref.intentMessage,
        directReference: true,
      }
    }
  }

  const textResults = await searchBibleText(queryRaw, options)
  return {
    results: textResults,
    intentMessage: textResults.length
      ? `I found ${textResults.length} Bible passage${textResults.length === 1 ? '' : 's'} matching your search.`
      : null,
    directReference: false,
  }
}

/** Test helper — clear catalog cache between cases. */
export function clearBibleSearchCache() {
  catalogCache = null
}
