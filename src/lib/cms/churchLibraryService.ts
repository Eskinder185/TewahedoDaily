import { getAiApiBaseUrl } from '../ai/aiConfig'
import type { CmsTables } from '../supabase/cms.types'
import { db } from './mezmurService'
import {
  normalizeLanguage,
  normalizeProcessingStatus,
  optionalText,
  requiredText,
  requireUuid,
  validateDocumentMetadata,
  validateProcessingResult,
} from './churchLibraryValidation'

export type ChurchLibraryBook = CmsTables['church_library_books']['Row']
export type ChurchLibraryVersion = CmsTables['church_library_versions']['Row']
export type ChurchLibraryPassage = CmsTables['church_library_passages']['Row']
export type ChurchLibraryPassageRevision = CmsTables['church_library_passage_revisions']['Row']

const configuredBucket =
  typeof import.meta !== 'undefined' && import.meta.env
    ? (import.meta.env.VITE_CHURCH_LIBRARY_BUCKET as string | undefined)
    : undefined

export const CHURCH_LIBRARY_BUCKET = configuredBucket?.trim() || 'church-library-originals'
export const MAX_BOOK_BYTES = 100 * 1024 * 1024
export const DOCUMENT_ACCEPT = '.pdf,.docx,.txt,.epub,application/pdf,application/vnd.openxmlformats-officedocument.wordprocessingml.document,text/plain,application/epub+zip'

export type ChurchLibraryUploadPhase =
  | 'validating'
  | 'reserving-version'
  | 'uploading'
  | 'activating'
  | 'complete'

export type ChurchLibraryUploadProgress = {
  phase: ChurchLibraryUploadPhase
  percent: number
  message: string
}

export type ChurchLibraryUploadProgressHandler = (progress: ChurchLibraryUploadProgress) => void

export type ChurchLibraryBackendStatus = {
  configured: boolean
  database_ready: boolean
  private_bucket_ready: boolean
  document_processing: 'ready' | 'dependency_unavailable'
  cms_role: string
  supported_types: string[]
  originals_bucket: string
  embedding_model: string | null
  multilingual_embeddings_approved: boolean
}

export type ChurchLibraryProcessingStatus = {
  book: Pick<
    ChurchLibraryBook,
    | 'id'
    | 'title'
    | 'current_version_id'
    | 'processing_status'
    | 'extraction_quality'
    | 'extraction_notes'
    | 'public_retrieval_enabled'
  >
  version: Pick<
    ChurchLibraryVersion,
    | 'id'
    | 'version_number'
    | 'processing_status'
    | 'extraction_quality'
    | 'extraction_notes'
    | 'page_count'
    | 'section_count'
    | 'passage_count'
    | 'processed_at'
    | 'error_code'
    | 'error_message'
  > | null
}

type ChurchLibraryExtractionResults = {
  book_id: string
  version_id: string
  processing_status: 'ready'
  passages: ChurchLibraryPassage[]
  has_more: boolean
}

function safeFileName(name: unknown): string {
  const original = requiredText(name, 'Filename', 255)
  return original.normalize('NFKC').replace(/[^\p{L}\p{N}._-]/gu, '-').slice(-120) || 'document'
}

export function validateChurchLibraryFile(file: File): string {
  return validateDocumentMetadata(file, MAX_BOOK_BYTES)
}

type UnknownRow = Record<string, unknown>

function asRow(value: unknown, operation: string): UnknownRow {
  if (!value || typeof value !== 'object' || Array.isArray(value)) {
    throw new Error(`${operation} returned an invalid database response.`)
  }
  return value as UnknownRow
}

export function normalizeChurchLibraryBook(value: unknown): ChurchLibraryBook {
  const row = asRow(value, 'Church Library book query')
  const id = requireUuid(row.id, 'Book ID')
  const title = requiredText(row.title, 'Book title', 300)
  const currentVersionId = typeof row.current_version_id === 'string' ? row.current_version_id : null
  return {
    ...row,
    id,
    title,
    author: optionalText(row.author, 'Author', 300),
    language: normalizeLanguage(row.language),
    category: optionalText(row.category, 'Category', 160),
    description: optionalText(row.description, 'Description', 10_000),
    cover_storage_path: typeof row.cover_storage_path === 'string' ? row.cover_storage_path : null,
    original_publication_info: typeof row.original_publication_info === 'string' ? row.original_publication_info : null,
    source_url: typeof row.source_url === 'string' ? row.source_url : null,
    access_level: ['private', 'staff', 'public_search'].includes(String(row.access_level))
      ? row.access_level as ChurchLibraryBook['access_level'] : 'private',
    rights_status: ['unknown', 'owned', 'licensed', 'public_domain', 'permission_granted', 'restricted'].includes(String(row.rights_status))
      ? row.rights_status as ChurchLibraryBook['rights_status'] : 'unknown',
    rights_notes: typeof row.rights_notes === 'string' ? row.rights_notes : null,
    allow_search_quotes: row.allow_search_quotes === true,
    allow_source_link: row.allow_source_link === true,
    approved_for_ingestion: row.approved_for_ingestion === true,
    public_retrieval_enabled: row.public_retrieval_enabled === true,
    processing_status: normalizeProcessingStatus(row.processing_status, Boolean(currentVersionId)),
    extraction_quality: ['not_checked', 'good', 'partial', 'uncertain', 'unreadable'].includes(String(row.extraction_quality))
      ? row.extraction_quality as ChurchLibraryBook['extraction_quality'] : 'not_checked',
    extraction_notes: typeof row.extraction_notes === 'string' ? row.extraction_notes : null,
    current_version_id: currentVersionId,
    created_by: typeof row.created_by === 'string' ? row.created_by : null,
    updated_by: typeof row.updated_by === 'string' ? row.updated_by : null,
    created_at: typeof row.created_at === 'string' ? row.created_at : '',
    updated_at: typeof row.updated_at === 'string' ? row.updated_at : '',
  } as ChurchLibraryBook
}

async function authenticatedStaffUserId(): Promise<string> {
  const { data, error } = await db().auth.getUser()
  if (error) throw new Error(`Could not verify the signed-in staff account: ${error.message}`)
  if (!data.user?.id) throw new Error('Sign in as Church Library staff before uploading or editing books.')
  return requireUuid(data.user.id, 'Authenticated user ID')
}

async function validateChurchLibraryFileContents(file: File, mimeType: string): Promise<void> {
  const bytes = new Uint8Array(await file.slice(0, Math.min(file.size, 4096)).arrayBuffer())
  const startsWith = (...expected: number[]) => expected.every((value, index) => bytes[index] === value)
  if (mimeType === 'application/pdf' && !startsWith(0x25, 0x50, 0x44, 0x46, 0x2d)) {
    throw new Error('The selected .pdf file does not contain a PDF signature.')
  }
  if (
    (mimeType === 'application/epub+zip' ||
      mimeType === 'application/vnd.openxmlformats-officedocument.wordprocessingml.document') &&
    !(
      startsWith(0x50, 0x4b, 0x03, 0x04) ||
      startsWith(0x50, 0x4b, 0x05, 0x06) ||
      startsWith(0x50, 0x4b, 0x07, 0x08)
    )
  ) {
    throw new Error('The selected document is not a valid ZIP-based DOCX or EPUB file.')
  }
  if (mimeType === 'text/plain') {
    if (bytes.includes(0)) throw new Error('TXT files must be plain UTF-8 text, not binary data.')
    try {
      new TextDecoder('utf-8', { fatal: true }).decode(bytes)
    } catch {
      throw new Error('TXT files must use UTF-8 so Amharic and Geʽez characters are preserved.')
    }
  }
}

export async function listChurchLibraryBooks(): Promise<ChurchLibraryBook[]> {
  const { data, error } = await db().from('church_library_books').select('*').order('updated_at', { ascending: false })
  if (error) throw error
  return (data || []).map(normalizeChurchLibraryBook)
}

export async function createChurchLibraryBook(
  payload: Pick<ChurchLibraryBook, 'title' | 'author' | 'language' | 'category' | 'description'>,
): Promise<ChurchLibraryBook> {
  const userId = await authenticatedStaffUserId()
  const validated = {
    title: requiredText(payload.title, 'Book title', 300),
    author: optionalText(payload.author, 'Author', 300),
    language: normalizeLanguage(payload.language),
    category: optionalText(payload.category, 'Category', 160),
    description: optionalText(payload.description, 'Description', 10_000),
  }
  const { data, error } = await db().from('church_library_books').insert({
    ...validated,
    created_by: userId,
  }).select('*').single()
  if (error) throw error
  return normalizeChurchLibraryBook(data)
}

export async function updateChurchLibraryBook(id: string, payload: Partial<ChurchLibraryBook>) {
  requireUuid(id, 'Book ID')
  await authenticatedStaffUserId()
  const safe: CmsTables['church_library_books']['Update'] = {
    title: payload.title,
    author: payload.author,
    language: payload.language,
    category: payload.category,
    description: payload.description,
    cover_storage_path: payload.cover_storage_path,
    original_publication_info: payload.original_publication_info,
    source_url: payload.source_url,
    access_level: payload.access_level,
    rights_status: payload.rights_status,
    rights_notes: payload.rights_notes,
    allow_search_quotes: payload.allow_search_quotes,
    allow_source_link: payload.allow_source_link,
    approved_for_ingestion: payload.approved_for_ingestion,
    public_retrieval_enabled: payload.public_retrieval_enabled,
  }
  for (const key of Object.keys(safe) as (keyof typeof safe)[]) {
    if (safe[key] === undefined) delete safe[key]
  }
  const { data, error } = await db().from('church_library_books').update(safe).eq('id', id).select('*').single()
  if (error) throw error
  return normalizeChurchLibraryBook(data)
}

export type VersionsTableName = 'church_library_book_versions' | 'church_library_versions'
let activeVersionsTable: VersionsTableName = 'church_library_book_versions'

export function getActiveVersionsTable(): VersionsTableName {
  return activeVersionsTable
}

export function setActiveVersionsTable(name: VersionsTableName): void {
  activeVersionsTable = name
}

export async function uploadChurchLibraryVersion(
  book: ChurchLibraryBook,
  file: File,
  onProgress?: ChurchLibraryUploadProgressHandler,
): Promise<ChurchLibraryVersion> {
  onProgress?.({ phase: 'validating', percent: 5, message: 'Validating document…' })
  const bookId = requireUuid(book?.id, 'Book ID')
  const mimeType = validateChurchLibraryFile(file)
  await validateChurchLibraryFileContents(file, mimeType)
  onProgress?.({ phase: 'reserving-version', percent: 15, message: 'Reserving a private file version…' })
  
  let targetTable = activeVersionsTable
  let latestResult = await db().from(targetTable)
    .select('version_number').eq('book_id', bookId).order('version_number', { ascending: false }).limit(1)
  if (latestResult.error && (latestResult.error.code === 'PGRST205' || latestResult.error.code === '42P01')) {
    const fallbackTable: VersionsTableName = targetTable === 'church_library_book_versions' ? 'church_library_versions' : 'church_library_book_versions'
    const fallbackResult = await db().from(fallbackTable)
      .select('version_number').eq('book_id', bookId).order('version_number', { ascending: false }).limit(1)
    if (!fallbackResult.error) {
      activeVersionsTable = fallbackTable
      targetTable = fallbackTable
      latestResult = fallbackResult
    }
  }
  if (latestResult.error) throw latestResult.error

  const versionNumber = (latestResult.data?.[0]?.version_number || 0) + 1
  const versionId = crypto.randomUUID()
  const path = `${bookId}/${versionId}/${safeFileName(file.name)}`
  if (path.startsWith('/') || path.includes('..')) throw new Error('The private storage path is invalid.')
  const userId = await authenticatedStaffUserId()
  const { data: version, error } = await db().from(targetTable).insert({
    id: versionId,
    book_id: bookId,
    version_number: versionNumber,
    original_file_name: file.name,
    source_storage_path: path,
    mime_type: mimeType,
    byte_size: file.size,
    created_by: userId,
  }).select('*').single()
  if (error) throw error
  onProgress?.({ phase: 'uploading', percent: 35, message: `Uploading ${file.name} to private storage…` })
  const uploaded = await db().storage.from(CHURCH_LIBRARY_BUCKET).upload(path, file, {
    contentType: mimeType,
    upsert: false,
  })
  if (uploaded.error) {
    await db().from(targetTable).delete().eq('id', versionId)
    throw uploaded.error
  }
  onProgress?.({ phase: 'activating', percent: 85, message: 'Activating the uploaded version…' })
  const activated = await db().rpc('activate_church_library_version', {
    target_book_id: bookId,
    target_version_id: versionId,
  })
  if (activated.error) {
    await db().storage.from(CHURCH_LIBRARY_BUCKET).remove([path])
    await db().from(targetTable).delete().eq('id', versionId)
    throw activated.error
  }
  onProgress?.({ phase: 'complete', percent: 100, message: 'Upload complete.' })
  return version as ChurchLibraryVersion
}

export async function uploadChurchLibraryCover(bookId: string, file: File): Promise<string> {
  if (!['image/jpeg', 'image/png', 'image/webp'].includes(file.type)) throw new Error('Cover images must be JPEG, PNG, or WebP.')
  if (file.size > 10 * 1024 * 1024) throw new Error('Cover images are limited to 10 MiB.')
  const path = `${bookId}/covers/${crypto.randomUUID()}-${safeFileName(file.name)}`
  const { error } = await db().storage.from(CHURCH_LIBRARY_BUCKET).upload(path, file, { contentType: file.type })
  if (error) throw error
  return path
}

async function backendRequest<T>(path: string, init: RequestInit = {}): Promise<T> {
  const base = getAiApiBaseUrl()
  if (!base) throw new Error('The Church Library processing API is not configured.')
  const { data, error } = await db().auth.getSession()
  if (error || !data.session) throw new Error('Sign in as staff before processing books.')
  const url = `${base.replace(/\/$/, '')}${path}`
  const method = init.method || 'GET'
  const response = await fetch(url, {
    ...init,
    headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${data.session.access_token}`, ...(init.headers || {}) },
    cache: 'no-store',
  })
  if (!response.ok) {
    const payload = await response.json().catch(() => null) as { detail?: string | { message?: string } } | null
    const detail = typeof payload?.detail === 'string' ? payload.detail : payload?.detail?.message
    if (response.status === 404) {
      throw new Error(
        `The deployed processing API does not provide ${method} ${path} (404 Not Found). Deploy the backend Church Library router before processing books.`,
      )
    }
    throw new Error(detail || `${method} ${path} failed (${response.status}).`)
  }
  try {
    return await response.json() as T
  } catch {
    throw new Error(`${method} ${path} returned an invalid JSON response.`)
  }
}

export async function processChurchLibraryBook(bookId: string) {
  const id = requireUuid(bookId, 'Book ID')
  return validateProcessingResult(await backendRequest<unknown>(
    `/api/church-library/books/${encodeURIComponent(id)}/process`,
    { method: 'POST' },
  ), 'Book processing API')
}

let activeStatusPromise: Promise<ChurchLibraryBackendStatus> | null = null
let cachedStatus: { data: ChurchLibraryBackendStatus; expires: number } | null = null

export function churchLibraryStatus(forceRefresh = false): Promise<ChurchLibraryBackendStatus> {
  const now = Date.now()
  if (!forceRefresh && cachedStatus && now < cachedStatus.expires) {
    return Promise.resolve(cachedStatus.data)
  }
  if (!forceRefresh && activeStatusPromise) {
    return activeStatusPromise
  }
  activeStatusPromise = backendRequest<ChurchLibraryBackendStatus>('/api/church-library/status')
    .then((data) => {
      cachedStatus = { data, expires: Date.now() + 2500 }
      return data
    })
    .finally(() => {
      activeStatusPromise = null
    })
  return activeStatusPromise
}

export function churchLibraryProcessingStatus(bookId: string) {
  return backendRequest<ChurchLibraryProcessingStatus>(
    `/api/church-library/books/${encodeURIComponent(bookId)}/status`,
  )
}

export async function retryChurchLibraryBook(bookId: string) {
  const id = requireUuid(bookId, 'Book ID')
  return validateProcessingResult(await backendRequest<unknown>(
    `/api/church-library/books/${encodeURIComponent(id)}/retry`,
    { method: 'POST' },
  ), 'Book retry API')
}

export async function listChurchLibraryVersions(bookId: string): Promise<ChurchLibraryVersion[]> {
  try {
    let targetTable = activeVersionsTable
    let result = await db().from(targetTable).select('*').eq('book_id', bookId).order('version_number', { ascending: false })
    if (result.error && (result.error.code === 'PGRST205' || result.error.code === '42P01')) {
      const fallbackTable: VersionsTableName = targetTable === 'church_library_book_versions' ? 'church_library_versions' : 'church_library_book_versions'
      const fallbackResult = await db().from(fallbackTable).select('*').eq('book_id', bookId).order('version_number', { ascending: false })
      if (!fallbackResult.error) {
        activeVersionsTable = fallbackTable
        targetTable = fallbackTable
        result = fallbackResult
      }
    }
    if (result.error) {
      if (result.error.code === 'PGRST205' || result.error.code === '42P01') {
        console.warn('church_library_book_versions table not yet available in Supabase schema.')
        return []
      }
      throw result.error
    }
    return (result.data || []) as ChurchLibraryVersion[]
  } catch (err) {
    console.warn('Could not load Church Library versions:', err)
    return []
  }
}

/**
 * Directly queries extracted passages for a book from Supabase.
 * Returns empty array if schema migration is pending.
 */
export async function listChurchLibraryPassages(bookId: string): Promise<ChurchLibraryPassage[]> {
  requireUuid(bookId, 'Book ID')
  try {
    const { data, error } = await db()
      .from('church_library_passages')
      .select('*')
      .eq('book_id', bookId)
      .order('passage_order', { ascending: true })
    if (!error && data && data.length > 0) {
      return data as ChurchLibraryPassage[]
    }
    if (error && (error.code === 'PGRST205' || error.code === '42P01')) {
      return []
    }
  } catch {
    // Continue to fallback
  }

  // Fallback to backend extraction endpoint if reachable
  try {
    return await previewChurchLibraryPassages(bookId)
  } catch {
    return []
  }
}

/**
 * Preview extraction results from the authenticated backend extraction endpoint.
 */
export async function previewChurchLibraryPassages(bookId: string): Promise<ChurchLibraryPassage[]> {
  const result = await backendRequest<ChurchLibraryExtractionResults>(
    `/api/church-library/books/${encodeURIComponent(bookId)}/results?limit=100&offset=0`,
  )
  return result.passages
}

/**
 * Update an extracted passage with optimistic locking, review status, and revision history.
 */
export async function updateChurchLibraryPassage(params: {
  passageId: string
  content: string
  reviewStatus: 'pending' | 'reviewed' | 'needs_attention'
  reviewerNotes?: string | null
  expectedRevision?: number
}): Promise<ChurchLibraryPassage> {
  const passageId = requireUuid(params.passageId, 'Passage ID')
  await authenticatedStaffUserId()

  // 1. Try atomic database RPC with revision guard
  const { data, error } = await db().rpc('update_church_library_passage', {
    p_passage_id: passageId,
    p_new_content: params.content,
    p_review_status: params.reviewStatus,
    p_reviewer_notes: params.reviewerNotes || null,
    p_expected_revision: params.expectedRevision ?? null,
  })

  if (!error && data) {
    return data as ChurchLibraryPassage
  }

  // If RPC is missing (PGRST202 or 42883), fallback to direct table update
  if (error && (error.code === 'PGRST202' || error.code === '42883')) {
    const updatePayload: CmsTables['church_library_passages']['Update'] = {
      content: params.content,
      review_status: params.reviewStatus,
      reviewer_notes: params.reviewerNotes || null,
      updated_at: new Date().toISOString(),
    }
    const { data: fallbackData, error: fallbackError } = await db()
      .from('church_library_passages')
      .update(updatePayload)
      .eq('id', passageId)
      .select('*')
      .single()
    if (fallbackError) throw fallbackError
    return fallbackData as ChurchLibraryPassage
  }

  if (error) {
    if (error.code === 'P0002') {
      throw new Error('This passage was modified by another editor. Please reload and review the latest revision before saving.')
    }
    throw error
  }

  throw new Error('Failed to update passage.')
}

/**
 * Rollback a passage to a previous revision.
 */
export async function rollbackChurchLibraryPassage(params: {
  passageId: string
  targetRevision: number
}): Promise<ChurchLibraryPassage> {
  const passageId = requireUuid(params.passageId, 'Passage ID')
  await authenticatedStaffUserId()

  // 1. Try atomic rollback RPC
  const { data, error } = await db().rpc('rollback_church_library_passage', {
    p_passage_id: passageId,
    p_target_revision: params.targetRevision,
  })

  if (!error && data) {
    return data as ChurchLibraryPassage
  }

  // 2. Fallback: query revision record and update directly
  const { data: rev, error: revError } = await db()
    .from('church_library_passage_revisions')
    .select('*')
    .eq('passage_id', passageId)
    .eq('revision_number', params.targetRevision)
    .single()

  if (revError || !rev) {
    throw new Error(`Revision ${params.targetRevision} not found.`)
  }

  const { data: updated, error: updateError } = await db()
    .from('church_library_passages')
    .update({
      content: rev.content,
      review_status: rev.review_status,
      reviewer_notes: `Rolled back to revision ${params.targetRevision}`,
      updated_at: new Date().toISOString(),
    })
    .eq('id', passageId)
    .select('*')
    .single()

  if (updateError) throw updateError
  return updated as ChurchLibraryPassage
}

/**
 * List the audit trail of revisions for a given passage.
 */
export async function listPassageRevisions(passageId: string): Promise<ChurchLibraryPassageRevision[]> {
  requireUuid(passageId, 'Passage ID')
  try {
    const { data, error } = await db()
      .from('church_library_passage_revisions')
      .select('*')
      .eq('passage_id', passageId)
      .order('revision_number', { ascending: false })
    if (error) {
      if (error.code === 'PGRST205' || error.code === '42P01') {
        return []
      }
      throw error
    }
    return (data || []) as ChurchLibraryPassageRevision[]
  } catch {
    return []
  }
}

/**
 * Securely generate a private signed URL for reading a book original document.
 * Exclusively uses createSignedUrl. Never creates or returns a public URL.
 */
export async function getChurchLibraryDocumentSignedUrl(storagePath: string): Promise<string> {
  if (!storagePath) throw new Error('Document path is required.')
  const { data, error } = await db().storage.from(CHURCH_LIBRARY_BUCKET).createSignedUrl(storagePath, 3600)
  if (error || !data?.signedUrl) {
    throw new Error(`Failed to generate secure document URL: ${error?.message || 'Storage error'}`)
  }
  return data.signedUrl
}

/**
 * Download a private book document into an ArrayBuffer for client-side parsing (EPUB, DOCX, TXT).
 */
export async function fetchChurchLibraryDocumentBlob(storagePath: string): Promise<ArrayBuffer> {
  if (!storagePath) throw new Error('Document path is required.')
  const { data, error } = await db().storage.from(CHURCH_LIBRARY_BUCKET).download(storagePath)
  if (error || !data) {
    throw new Error(`Failed to download document: ${error?.message || 'Download error'}`)
  }
  return await data.arrayBuffer()
}

/**
 * Securely generate a signed URL for a book cover thumbnail.
 */
export async function getChurchLibraryCoverSignedUrl(coverPath: string): Promise<string | null> {
  if (!coverPath) return null
  try {
    const { data, error } = await db().storage.from(CHURCH_LIBRARY_BUCKET).createSignedUrl(coverPath, 7200)
    if (error || !data?.signedUrl) return null
    return data.signedUrl
  } catch {
    return null
  }
}

export async function removeChurchLibraryBook(book: ChurchLibraryBook) {
  const versions = await listChurchLibraryVersions(book.id)
  const paths = versions.map((version) => version.source_storage_path)
  if (book.cover_storage_path) paths.push(book.cover_storage_path)
  const { error } = await db().from('church_library_books').delete().eq('id', book.id)
  if (error) throw error
  if (paths.length) {
    const removed = await db().storage.from(CHURCH_LIBRARY_BUCKET).remove(paths)
    if (removed.error) throw new Error('Book metadata was removed, but an administrator must clean up its private files.')
  }
}
