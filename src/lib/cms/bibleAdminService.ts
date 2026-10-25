import { supabase } from '../supabase/client'
import type { Json } from '../supabase/database.types'
import type {
  BibleChapter,
  BibleChapterDraft,
  BibleChapterRevision,
  BibleDraftVerse,
  BibleEdition,
  BibleImportJob,
  BibleSection,
  BibleVerse,
  CanonicalBook,
  SourceBook,
} from '../bible/bibleTypes'

export type BibleAdminCatalog = {
  editions: BibleEdition[]
  books: CanonicalBook[]
  sources: SourceBook[]
  chapters: BibleChapter[]
}

export type BibleChapterWorkspace = {
  chapter: BibleChapter
  sections: BibleSection[]
  publishedVerses: BibleVerse[]
  draft: BibleChapterDraft | null
  revisions: BibleChapterRevision[]
}

function db() {
  if (!supabase) throw new Error('Supabase is not configured for Bible Manager.')
  return supabase
}

function fail(operation: string, error: { message: string; code?: string; details?: string; hint?: string } | null): never {
  const code = error?.code ? ` (${error.code})` : ''
  const detail = [error?.message, error?.details, error?.hint].filter(Boolean).join(' · ')
  throw new Error(`${operation} failed${code}: ${detail || 'Unknown database error'}`)
}

export async function loadBibleAdminCatalog(): Promise<BibleAdminCatalog> {
  const client = db()
  const [editions, books, sources, chapters] = await Promise.all([
    client.from('bible_editions').select('*').order('name'),
    client.from('bible_canonical_books').select('*').order('sort_order'),
    client.from('bible_source_books').select('*').order('source_order'),
    client.from('bible_chapters').select('*').order('source_order'),
  ])
  if (editions.error) fail('Loading Bible editions', editions.error)
  if (books.error) fail('Loading canonical Bible books', books.error)
  if (sources.error) fail('Loading Bible source books', sources.error)
  if (chapters.error) fail('Loading Bible chapters', chapters.error)
  return {
    editions: editions.data || [],
    books: books.data || [],
    sources: sources.data || [],
    chapters: chapters.data || [],
  }
}

export async function loadBibleChapterWorkspace(chapterId: string): Promise<BibleChapterWorkspace> {
  const client = db()
  const [chapter, sections, verses, draft, revisions] = await Promise.all([
    client.from('bible_chapters').select('*').eq('id', chapterId).single(),
    client.from('bible_sections').select('*').eq('chapter_id', chapterId).order('source_order'),
    client.from('bible_verses').select('*').eq('chapter_id', chapterId).order('source_order'),
    client.from('bible_chapter_drafts').select('*').eq('chapter_id', chapterId).maybeSingle(),
    client.from('bible_chapter_revisions').select('*').eq('chapter_id', chapterId).order('revision_number', { ascending: false }).limit(50),
  ])
  if (chapter.error) fail('Loading the selected Bible chapter', chapter.error)
  if (sections.error) fail('Loading Bible section headings', sections.error)
  if (verses.error) fail('Loading published Bible verses', verses.error)
  if (draft.error) fail('Loading the Bible chapter draft', draft.error)
  if (revisions.error) fail('Loading Bible revision history', revisions.error)
  return {
    chapter: chapter.data,
    sections: sections.data || [],
    publishedVerses: verses.data || [],
    draft: draft.data,
    revisions: revisions.data || [],
  }
}

export function editableVerses(workspace: BibleChapterWorkspace): BibleDraftVerse[] {
  if (workspace.draft) return workspace.draft.verses
  return workspace.publishedVerses.map(({ section_id, source_order, verse_number, text }) => ({
    section_id,
    source_order,
    verse_number,
    text,
  }))
}

export async function saveBibleChapterDraft(
  chapterId: string,
  verses: BibleDraftVerse[],
  expectedUpdatedAt?: string | null,
): Promise<BibleChapterDraft> {
  const result = await db().rpc('save_bible_chapter_draft', {
    p_chapter_id: chapterId,
    p_verses: verses as unknown as Json,
    p_expected_updated_at: expectedUpdatedAt || null,
  })
  if (result.error) fail('Saving the Bible chapter draft', result.error)
  return result.data
}

export async function publishBibleChapter(chapterId: string, note?: string): Promise<BibleChapterRevision> {
  const result = await db().rpc('publish_bible_chapter_draft', {
    p_chapter_id: chapterId,
    p_note: note?.trim() || null,
  })
  if (result.error) fail('Publishing the Bible chapter', result.error)
  return result.data
}

export async function restoreBibleRevision(revisionId: string): Promise<BibleChapterDraft> {
  const result = await db().rpc('restore_bible_chapter_revision', { p_revision_id: revisionId })
  if (result.error) fail('Restoring the Bible revision to a draft', result.error)
  return result.data
}

export type BibleEditionMetadataInput = Pick<
  BibleEdition,
  'id' | 'name' | 'language_code' | 'source_edition' | 'attribution' | 'rights_status' | 'canon_code' | 'numbering_scheme'
>

export async function saveBibleEditionMetadata(input: BibleEditionMetadataInput): Promise<BibleEdition> {
  const result = await db().rpc('update_bible_edition_metadata', {
    p_edition_id: input.id,
    p_name: input.name,
    p_language_code: input.language_code,
    p_source_edition: input.source_edition || '',
    p_attribution: input.attribution || '',
    p_rights_status: input.rights_status,
    p_canon_code: input.canon_code,
    p_numbering_scheme: input.numbering_scheme,
  })
  if (result.error) fail('Saving Bible edition details', result.error)
  return result.data
}

export async function createBibleEdition(input: Omit<BibleEditionMetadataInput, 'id'> & { code: string }): Promise<BibleEdition> {
  const result = await db().rpc('create_bible_edition', {
    p_code: input.code,
    p_name: input.name,
    p_language_code: input.language_code,
    p_source_edition: input.source_edition || '',
    p_attribution: input.attribution || '',
    p_rights_status: input.rights_status,
    p_canon_code: input.canon_code,
    p_numbering_scheme: input.numbering_scheme,
  })
  if (result.error) fail('Creating the Bible translation', result.error)
  return result.data
}

export async function startBibleImport(input: {
  fileName: string
  format: 'csv' | 'json' | 'usfm'
  mode: 'create_only' | 'update_existing'
  totalChapters: number
}): Promise<string> {
  const result = await db().rpc('start_bible_import', {
    p_file_name: input.fileName,
    p_format: input.format,
    p_mode: input.mode,
    p_total_chapters: input.totalChapters,
  })
  if (result.error) fail('Starting the Bible import', result.error)
  return result.data
}

export type StagedBibleChapter = {
  editionCode: string
  bookSlug: string
  chapterNumber: number
  sourceName?: string
  verses: BibleDraftVerse[]
}

export async function stageBibleImportChapter(jobId: string, chapter: StagedBibleChapter) {
  const result = await db().rpc('stage_bible_import_chapter', {
    p_job_id: jobId,
    p_edition_code: chapter.editionCode,
    p_book_slug: chapter.bookSlug,
    p_chapter_number: chapter.chapterNumber,
    p_verses: chapter.verses as unknown as Json,
    p_source_name: chapter.sourceName || null,
  })
  if (result.error) fail(`Staging ${chapter.bookSlug} ${chapter.chapterNumber}`, result.error)
  return result.data as { status: 'created' | 'updated' | 'skipped'; chapter_id: string; reason?: string }
}

export async function finishBibleImport(input: {
  jobId: string
  processed: number
  created: number
  updated: number
  skipped: number
  errors: Array<{ chapter: string; message: string }>
}): Promise<BibleImportJob> {
  const result = await db().rpc('finish_bible_import', {
    p_job_id: input.jobId,
    p_processed: input.processed,
    p_created: input.created,
    p_updated: input.updated,
    p_skipped: input.skipped,
    p_errors: input.errors as unknown as Json,
  })
  if (result.error) fail('Finalizing the Bible import report', result.error)
  return result.data
}

export async function listBibleImportJobs(): Promise<BibleImportJob[]> {
  const result = await db().from('bible_import_jobs').select('*').order('created_at', { ascending: false }).limit(25)
  if (result.error) fail('Loading Bible import reports', result.error)
  return result.data || []
}
