/**
 * Church Library — structured (chapter → section → paragraph) reading, search,
 * bookmarks, reading progress, import and the review workflow.
 *
 * Reads go through Row Level Security: the public only ever receives books and
 * sections that are published and pass the existing rights/approval gates.
 */
import type { SupabaseClient } from '@supabase/supabase-js'
import { supabase as typedClient } from '../supabase/client'
import type { ImportPayload } from './structuredImport'

export type PublicationStatus = 'draft' | 'reviewed' | 'published'

export type StructuredBook = {
  id: string
  slug: string
  title: string
  title_amharic: string | null
  title_english: string | null
  title_geez: string | null
  author: string | null
  language: string
  collection_key: string | null
  source_document_name: string | null
  publication_status: PublicationStatus | null
  allow_original_download: boolean
  download_storage_path: string | null
  description: string | null
}

export type StructuredSection = {
  id: string
  book_id: string
  parent_section_id: string | null
  level: number
  stable_key: string
  title: string | null
  section_order: number
  page_start: number | null
  page_end: number | null
}

export type StructuredPassage = {
  id: string
  section_id: string | null
  stable_key: string | null
  passage_order: number
  block_type: string
  content: string
  page_start: number | null
  page_end: number | null
}

export type Edition = { slug: string; language: string; title: string }

const BOOK_FIELDS =
  'id, slug, title, title_amharic, title_english, title_geez, author, language, collection_key, source_document_name, publication_status, allow_original_download, download_storage_path, description'

// The structured-collection tables and RPCs are newer than the generated
// database types, so this module talks to Supabase through an untyped view of
// the same client (same session, same Row Level Security).
const supabase = typedClient as unknown as SupabaseClient | null

function db(): SupabaseClient {
  if (!supabase) throw new Error('The Church Library is not configured.')
  return supabase
}

export async function getStructuredBook(slug: string): Promise<{ book: StructuredBook; sections: StructuredSection[]; editions: Edition[] } | null> {
  const client = db()
  const { data: book, error } = await client.from('church_library_books').select(BOOK_FIELDS).eq('slug', slug).maybeSingle()
  if (error) throw new Error(error.message)
  if (!book) return null
  const b = book as unknown as StructuredBook
  const [sectionsRes, editionsRes] = await Promise.all([
    client
      .from('church_library_sections')
      .select('id, book_id, parent_section_id, level, stable_key, title, section_order, page_start, page_end')
      .eq('book_id', b.id)
      .order('section_order', { ascending: true }),
    b.collection_key
      ? client.from('church_library_books').select('slug, language, title').eq('collection_key', b.collection_key)
      : Promise.resolve({ data: [] as Edition[], error: null }),
  ])
  if (sectionsRes.error) throw new Error(sectionsRes.error.message)
  return {
    book: b,
    sections: (sectionsRes.data || []) as StructuredSection[],
    editions: ((editionsRes.data || []) as Edition[]).filter((e) => e.slug),
  }
}

export async function getPassagesForSections(bookId: string, sectionIds: string[]): Promise<StructuredPassage[]> {
  if (!sectionIds.length) return []
  const client = db()
  const out: StructuredPassage[] = []
  for (let i = 0; i < sectionIds.length; i += 60) {
    const chunk = sectionIds.slice(i, i + 60)
    const { data, error } = await client
      .from('church_library_passages')
      .select('id, section_id, stable_key, passage_order, block_type, content, page_start, page_end')
      .eq('book_id', bookId)
      .in('section_id', chunk)
      .order('passage_order', { ascending: true })
      .range(0, 999)
    if (error) throw new Error(error.message)
    out.push(...((data || []) as StructuredPassage[]))
  }
  return out.sort((a, b) => a.passage_order - b.passage_order)
}

export async function getOriginalDownloadUrl(book: StructuredBook): Promise<string | null> {
  if (!book.allow_original_download || !book.download_storage_path) return null
  const { data, error } = await db().storage.from('church-library-originals').createSignedUrl(book.download_storage_path, 600, {
    download: book.source_document_name || true,
  })
  if (error) return null
  return data?.signedUrl || null
}

// ------------------------------------------------------------- tree helpers --
export type SectionNode = StructuredSection & { children: SectionNode[] }

export function buildSectionTree(sections: StructuredSection[]): SectionNode[] {
  const byId = new Map<string, SectionNode>()
  sections.forEach((s) => byId.set(s.id, { ...s, children: [] }))
  const roots: SectionNode[] = []
  for (const s of [...byId.values()].sort((a, b) => a.section_order - b.section_order)) {
    const parent = s.parent_section_id ? byId.get(s.parent_section_id) : undefined
    if (parent) parent.children.push(s)
    else roots.push(s)
  }
  return roots
}

/** The chapter (level-1 ancestor) that contains a section. */
export function chapterOf(sections: StructuredSection[], key: string | undefined): StructuredSection | null {
  const byId = new Map(sections.map((s) => [s.id, s]))
  let s = sections.find((x) => x.stable_key === key) || null
  while (s && s.parent_section_id) s = byId.get(s.parent_section_id) || null
  return s || sections.find((x) => x.level === 1) || null
}

export function descendantIds(sections: StructuredSection[], rootId: string): string[] {
  const ids = [rootId]
  for (let i = 0; i < ids.length; i++) {
    for (const s of sections) if (s.parent_section_id === ids[i]) ids.push(s.id)
  }
  return ids
}

// --------------------------------------------------- bookmarks & progress --
export type Bookmark = { section_key: string | null; passage_key: string | null; label: string | null; created_at: string }

const LOCAL_BM = 'td.churchLibrary.bookmarks.v1'
const LOCAL_PROGRESS = 'td.churchLibrary.progress.v1'

function readLocal<T>(key: string, fallback: T): T {
  try {
    const raw = window.localStorage.getItem(key)
    return raw ? (JSON.parse(raw) as T) : fallback
  } catch {
    return fallback
  }
}
function writeLocal(key: string, value: unknown) {
  try {
    window.localStorage.setItem(key, JSON.stringify(value))
  } catch {
    /* storage unavailable */
  }
}

export async function listBookmarks(bookId: string, userId: string | null): Promise<Bookmark[]> {
  if (userId && supabase) {
    const { data, error } = await supabase
      .from('church_library_bookmarks')
      .select('section_key, passage_key, label, created_at')
      .eq('book_id', bookId)
      .order('created_at', { ascending: false })
    if (!error) return (data || []) as Bookmark[]
  }
  return readLocal<Record<string, Bookmark[]>>(LOCAL_BM, {})[bookId] || []
}

export async function toggleBookmark(bookId: string, userId: string | null, mark: Omit<Bookmark, 'created_at'>): Promise<Bookmark[]> {
  const existing = await listBookmarks(bookId, userId)
  const match = existing.find((b) => b.section_key === mark.section_key && b.passage_key === mark.passage_key)
  if (userId && supabase) {
    const q = supabase.from('church_library_bookmarks')
    const res = match
      ? await q.delete().eq('book_id', bookId).eq('section_key', mark.section_key ?? '').eq('passage_key', mark.passage_key ?? '')
      : await q.insert({ book_id: bookId, section_key: mark.section_key, passage_key: mark.passage_key, label: mark.label })
    if (!res.error) return listBookmarks(bookId, userId)
  }
  const all = readLocal<Record<string, Bookmark[]>>(LOCAL_BM, {})
  const list = all[bookId] || []
  all[bookId] = match
    ? list.filter((b) => !(b.section_key === mark.section_key && b.passage_key === mark.passage_key))
    : [{ ...mark, created_at: new Date().toISOString() }, ...list]
  writeLocal(LOCAL_BM, all)
  return all[bookId]
}

export type Progress = { section_key: string | null; passage_key: string | null; percent: number }

export async function readProgress(bookId: string, userId: string | null): Promise<Progress | null> {
  if (userId && supabase) {
    const { data, error } = await supabase
      .from('church_library_reading_progress')
      .select('section_key, passage_key, percent')
      .eq('book_id', bookId)
      .maybeSingle()
    if (!error && data) return { ...(data as Progress), percent: Number((data as Progress).percent) || 0 }
  }
  return readLocal<Record<string, Progress>>(LOCAL_PROGRESS, {})[bookId] || null
}

export async function saveProgress(bookId: string, userId: string | null, progress: Progress): Promise<void> {
  const all = readLocal<Record<string, Progress>>(LOCAL_PROGRESS, {})
  all[bookId] = progress
  writeLocal(LOCAL_PROGRESS, all)
  if (userId && supabase) {
    await supabase
      .from('church_library_reading_progress')
      .upsert({ book_id: bookId, section_key: progress.section_key, passage_key: progress.passage_key, percent: progress.percent, updated_at: new Date().toISOString() })
  }
}

// ------------------------------------------------------- staff: import --
export async function existingImportFingerprints(): Promise<{ slugs: Set<string>; hashes: Set<string> }> {
  const client = db()
  const [books, hashes] = await Promise.all([
    client.from('church_library_books').select('slug').not('slug', 'is', null),
    client.from('church_library_passages').select('content_hash').not('content_hash', 'is', null).range(0, 9999),
  ])
  return {
    slugs: new Set(((books.data || []) as { slug: string }[]).map((b) => b.slug)),
    hashes: new Set(((hashes.data || []) as { content_hash: string }[]).map((h) => h.content_hash)),
  }
}

export async function importStructured(payload: ImportPayload): Promise<{ book_id: string; slug: string; sections: number; passages: number }> {
  const { data, error } = await db().rpc('church_library_import_structured', { payload })
  if (error) throw new Error(error.message)
  return data as unknown as { book_id: string; slug: string; sections: number; passages: number }
}

export type ReviewBook = StructuredBook & {
  access_level: string
  rights_status: string
  approved_for_ingestion: boolean
  allow_search_quotes: boolean
  reviewed_at: string | null
  published_at: string | null
  review_notes: string | null
}

export async function listStructuredBooksForReview(): Promise<ReviewBook[]> {
  const { data, error } = await db()
    .from('church_library_books')
    .select(`${BOOK_FIELDS}, access_level, rights_status, approved_for_ingestion, allow_search_quotes, reviewed_at, published_at, review_notes`)
    .not('slug', 'is', null)
    .order('collection_key', { ascending: true })
  if (error) throw new Error(error.message)
  return (data || []) as unknown as ReviewBook[]
}

export async function setPublicationStatus(bookId: string, next: PublicationStatus, note?: string) {
  const { error } = await db().rpc('church_library_set_publication_status', {
    target_book_id: bookId,
    next_status: next,
    note: note || null,
  })
  if (error) throw new Error(error.message)
}

export function sectionHref(slug: string, sectionKey?: string | null, passageKey?: string | null): string {
  const base = `/library/read/${encodeURIComponent(slug)}${sectionKey ? `/${encodeURIComponent(sectionKey)}` : ''}`
  return passageKey ? `${base}#${encodeURIComponent(passageKey)}` : base
}
