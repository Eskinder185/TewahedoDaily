import type { BibleChapter, BibleEdition, BibleVerse, CanonicalBook, SourceBook } from '../../src/lib/bible/bibleTypes'
import { validateSourceBatch, type SourceBatch, type SourcePassage } from '../../src/lib/play/amharicBibleQuestionGenerator'

type ExistingQuestion = { source?: { route?: string; sourceId?: string }; prompt?: { am?: string } }
export type SourceExportApi = {
  loadEdition: () => Promise<BibleEdition>
  loadBooks: () => Promise<CanonicalBook[]>
  loadSourceBooks: (editionId: string) => Promise<SourceBook[]>
  loadChapters: (sourceBookIds: string[]) => Promise<BibleChapter[]>
  loadVerses: (chapterId: string, limit: number) => Promise<BibleVerse[]>
  loadPublishedQuestions: () => Promise<ExistingQuestion[]>
}

const transferableRights = new Set(['owned', 'licensed', 'public_domain', 'permission_granted'])
/**
 * Explicit, operator-selected source-use basis. It is separate from the database rights metadata,
 * which is never changed, and it covers only the Bible edition being exported.
 */
export type OwnerAuthorization = { mode: 'owner_authorized'; basis: string; authorizedBy: string; recordedAt: string }
export function assertOwnerAuthorization(value: unknown): asserts value is OwnerAuthorization {
  const item = value as Partial<OwnerAuthorization> | null
  if (!item || item.mode !== 'owner_authorized' || typeof item.basis !== 'string' || item.basis.trim().length < 10 ||
      typeof item.authorizedBy !== 'string' || !item.authorizedBy.trim() ||
      typeof item.recordedAt !== 'string' || Number.isNaN(Date.parse(item.recordedAt))) {
    throw new Error('Owner authorization requires mode owner_authorized, a written basis (10+ characters), authorizedBy, and an ISO timestamp.')
  }
}
const pathOf = (route: string) => route.split(/[?#]/, 1)[0].replace(/\/$/, '')
const chapterPath = (slug: string, chapter: number) => `/bible/${slug}/${chapter}`

function spreadOrder(length: number, count: number) {
  const anchors = new Set(Array.from({ length: Math.min(count, length) }, (_, i) => Math.floor(i * length / count)))
  return [...anchors, ...Array.from({ length }, (_, i) => i).filter((i) => !anchors.has(i))]
}

export async function prepareAmharicPlaySourceExport(api: SourceExportApi, options: {
  count: number; versesPerPassage: number; localQuestions: ExistingQuestion[]; ownerAuthorization?: OwnerAuthorization
}): Promise<{ batch: SourceBatch; manifest: Record<string, unknown>; existingPrompts: string[] }> {
  const { count, versesPerPassage, localQuestions, ownerAuthorization } = options
  if (ownerAuthorization !== undefined) assertOwnerAuthorization(ownerAuthorization)
  if (!Number.isSafeInteger(count) || count < 1 || count > 20 ||
      !Number.isSafeInteger(versesPerPassage) || versesPerPassage < 1 || versesPerPassage > 8) {
    throw new Error('Export requires 1–20 passages and 1–8 verses per passage.')
  }
  const edition = await api.loadEdition()
  if (edition.code !== 'am' || edition.review_status !== 'reviewed' ||
      edition.publication_status !== 'published' || !edition.is_public) {
    throw new Error('The Amharic source edition is not reviewed and published.')
  }
  if (!transferableRights.has(edition.rights_status) && !ownerAuthorization) {
    throw new Error('The Amharic edition has no eligible local export rights status.')
  }
  const [books, sourceBooks, publishedQuestions] = await Promise.all([
    api.loadBooks(), api.loadSourceBooks(edition.id), api.loadPublishedQuestions(),
  ])
  if (books.length > 200 || sourceBooks.length > 300 || publishedQuestions.length > 500 ||
      localQuestions.length > 2000) throw new Error('Source catalog or duplicate inventory exceeds its bound.')
  const existing = [...localQuestions, ...publishedQuestions]
  const usedRoutes = new Set(existing.map((question) => question.source?.route || '').filter(Boolean).map(pathOf))
  const usedVerseIds = new Set(existing.map((question) => question.source?.sourceId).filter((id): id is string => Boolean(id)))
  const allPrompts = [...new Set(existing.map((question) => question.prompt?.am?.trim() || '').filter(Boolean))]
  const existingPrompts = allPrompts.slice(-500)

  const eligibleBooks = books.filter((book) => book.source_status === 'available' && book.name_am &&
    sourceBooks.some((source) => source.canonical_book_id === book.id && source.edition_id === edition.id &&
      source.review_status === 'reviewed' && source.publication_status === 'published' && source.is_public))
    .sort((a, b) => a.sort_order - b.sort_order || a.canonical_number - b.canonical_number)
  const eligibleSources = sourceBooks.filter((source) => source.edition_id === edition.id &&
    source.review_status === 'reviewed' && source.publication_status === 'published' && source.is_public)
  if (eligibleBooks.length < count || !eligibleSources.length) throw new Error('Too few eligible Amharic books for this batch.')
  const chapters = await api.loadChapters(eligibleSources.map((source) => source.id))
  if (chapters.length > 3000) throw new Error('Chapter catalog exceeds its bound.')
  const passages: SourcePassage[] = []
  const revisions: Array<{ passageId: string; chapterUpdatedAt: string; verseUpdatedAt: string[] }> = []
  let duplicatesSkipped = 0
  for (const index of spreadOrder(eligibleBooks.length, count)) {
    if (passages.length === count) break
    const book = eligibleBooks[index]
    const sources = eligibleSources.filter((source) => source.canonical_book_id === book.id)
      .sort((a, b) => a.source_order - b.source_order)
    const chapterCandidates = sources.flatMap((source) => chapters.filter((chapter) =>
      chapter.source_book_id === source.id && chapter.chapter_number >= 1)
      .sort((a, b) => a.source_order - b.source_order).map((chapter) => ({ source, chapter })))
    for (const { source, chapter } of chapterCandidates) {
      if (usedRoutes.has(chapterPath(book.slug, chapter.chapter_number))) { duplicatesSkipped += 1; continue }
      const verses = (await api.loadVerses(chapter.id, versesPerPassage)).sort((a, b) => a.source_order - b.source_order)
      if (!verses.length || verses.length > versesPerPassage || verses.some((verse) => usedVerseIds.has(verse.id))) continue
      const passageId = `am-${book.slug}-${source.source_order}-${chapter.source_order}`
      passages.push({ id: passageId,
        edition: { id: edition.id, code: edition.code, review_status: edition.review_status,
          is_public: edition.is_public, publication_status: edition.publication_status,
          canon_code: edition.canon_code, numbering_scheme: edition.numbering_scheme, updated_at: edition.updated_at },
        book: { id: book.id, slug: book.slug, name_am: book.name_am, canonical_number: book.canonical_number,
          source_status: book.source_status },
        sourceBook: { id: source.id, edition_id: source.edition_id, canonical_book_id: source.canonical_book_id,
          review_status: source.review_status, is_public: source.is_public,
          publication_status: source.publication_status, updated_at: source.updated_at },
        chapter: { id: chapter.id, source_book_id: chapter.source_book_id,
          chapter_number: chapter.chapter_number, updated_at: chapter.updated_at },
        verses: verses.map((verse) => ({ id: verse.id, chapter_id: verse.chapter_id,
          verse_number: verse.verse_number, source_order: verse.source_order,
          text: verse.text, updated_at: verse.updated_at })) })
      revisions.push({ passageId, chapterUpdatedAt: chapter.updated_at,
        verseUpdatedAt: verses.map((verse) => verse.updated_at) })
      break
    }
  }
  if (passages.length === 0 || new Set(passages.map((passage) => passage.book.id)).size !== passages.length) {
    throw new Error('No distinct eligible books with small passages were available.')
  }
  const batch: SourceBatch = { version: 1, passages }
  const { sourceHash } = await validateSourceBatch(batch)
  return { batch, existingPrompts,
    manifest: { version: 1, sourceHash, editionId: edition.id, editionCode: edition.code,
      canonCode: edition.canon_code, numberingScheme: edition.numbering_scheme,
      editionUpdatedAt: edition.updated_at, rightsStatus: edition.rights_status,
      attribution: edition.attribution, sourceEdition: edition.source_edition,
      passageCount: passages.length, bookSlugs: passages.map((passage) => passage.book.slug),
      duplicateRoutesSkipped: duplicatesSkipped, comparedQuestionCount: existing.length,
      revisions, externalAiTransfer: ownerAuthorization ? 'permitted_owner_authorized' : 'blocked_pending_source_rights_review',
      sourceUse: ownerAuthorization
        ? { mode: ownerAuthorization.mode, basis: ownerAuthorization.basis.trim(), authorizedBy: ownerAuthorization.authorizedBy.trim(),
            recordedAt: ownerAuthorization.recordedAt, scope: { kind: 'bible_edition', editionId: edition.id, editionCode: edition.code },
            excludedScopes: ['church-library', 'mezmur', 'synaxarium', 'images', 'third-party'],
            databaseRightsStatusUnchanged: edition.rights_status }
        : { mode: 'database_rights_status', rightsStatus: edition.rights_status } } }
}
