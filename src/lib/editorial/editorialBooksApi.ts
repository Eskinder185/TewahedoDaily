/**
 * Private editorial five-book preview client — matches FastAPI `/api/editorial/*`.
 *
 * Access control is server-side:
 * - ENABLE_EDITORIAL_PREVIEW must be on
 * - Authorization: Bearer <Supabase CMS access_token>
 * - Backend verifies JWT (signature/aud/iss when configured) and
 *   ``profiles.role`` in editor|admin|super_admin (same as ``is_staff()``)
 *
 * Legacy ``X-Editorial-Token`` is no longer used by this client.
 */

import { getAiApiBaseUrl, isAiApiConfigured } from '../ai/aiConfig'
import { supabase } from '../supabase/client'

export class EditorialApiError extends Error {
  status: number
  constructor(status: number, message: string) {
    super(message)
    this.status = status
  }
}

async function getCmsAccessToken(): Promise<string> {
  if (!supabase) {
    throw new EditorialApiError(0, 'Supabase is not configured.')
  }
  const { data, error } = await supabase.auth.getSession()
  if (error) {
    throw new EditorialApiError(401, error.message || 'Could not read CMS session.')
  }
  const token = data.session?.access_token?.trim()
  if (!token) {
    throw new EditorialApiError(
      401,
      'Sign in to the CMS as editor, admin, or super_admin.',
    )
  }
  return token
}

async function editorialFetch<T>(
  path: string,
  init: RequestInit = {},
): Promise<T> {
  if (!isAiApiConfigured()) {
    throw new EditorialApiError(
      0,
      'Set VITE_TEWAHEDO_AI_API_URL to reach the AI backend.',
    )
  }
  const token = await getCmsAccessToken()
  const baseUrl = getAiApiBaseUrl()
  if (!baseUrl) {
    throw new EditorialApiError(0, 'AI API base URL is not configured.')
  }
  const base = baseUrl.replace(/\/$/, '')
  const response = await fetch(`${base}${path}`, {
    ...init,
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${token}`,
      ...(init.headers || {}),
    },
    cache: 'no-store',
  })
  if (!response.ok) {
    const detail = await response.text()
    throw new EditorialApiError(
      response.status,
      `${response.status}: ${detail.slice(0, 400)}`,
    )
  }
  return (await response.json()) as T
}

export type EditorialBookSummary = {
  document_id: string
  title: string
  section_count: number
  paragraph_count: number
  languages_available: string[]
  package_approved_for_ingestion: boolean
  content_status?: string
  final_human_approval?: boolean
}

export type TocSection = {
  section_id: string
  title_en: string
  heading_level: number
  paragraph_count: number
  first_paragraph_id: string
  last_paragraph_id: string
  numbering_status?: string | null
  title_source?: string | null
}

export type BookToc = {
  document_id: string
  title: string
  languages_available: string[]
  sections: TocSection[]
  headings: Array<{
    paragraph_id: string
    section_id: string
    title_en: string
    level: number | null
  }>
  published: boolean
  visibility: string
  pagination_kind: string
  metadata?: Record<string, unknown>
}

export type ContentSegment = {
  kind: string
  text: string
  reference_unit_ids?: string[]
}

export type ReadingParagraph = {
  id: string
  document_id: string
  section_id: string
  order: number
  role: string
  text?: string
  text_en: string
  language?: string
  content_origin?: string
  content_kind?: string
  approved_for_ingestion: boolean
  approval_status?: string
  source_unit_ids?: string[]
  reference_unit_ids?: string[]
  unresolved_issue_ids?: string[]
  revision_ids?: string[]
  content_segments?: ContentSegment[]
  amharic_source_text: string | null
  source_records?: Array<Record<string, unknown>>
  reference_evidence?: Array<Record<string, unknown>>
  visibility: string
  heading_level?: number | null
}

export type ReadingPage = {
  document_id: string
  title: string
  section_id: string | null
  items: ReadingParagraph[]
  page: {
    limit: number
    total_paragraphs: number
    next_after: string | null
    previous_after: string | null
    has_previous: boolean
    has_next: boolean
  }
  navigation: {
    previous_paragraph_id: string | null
    next_paragraph_id: string | null
    previous_section_id: string | null
    next_section_id: string | null
  }
  visibility: string
  published: boolean
}

export type SearchHit = {
  paragraph_id: string
  document_id: string
  section_id: string
  score: number
  snippet_en: string
  has_amharic_source: boolean
  content_kind: string
  approved_for_ingestion: boolean
  public_retrieval_eligible: boolean
}

export type SearchFilters = {
  document_id?: string
  content_kind?: string
  has_amharic_source?: boolean
  limit?: number
}

export function listEditorialBooks() {
  return editorialFetch<{ books: EditorialBookSummary[]; published: boolean }>(
    '/api/editorial/books',
  )
}

export function getBookToc(documentId: string) {
  return editorialFetch<BookToc>(
    `/api/editorial/books/${encodeURIComponent(documentId)}`,
  )
}

export function getReadingPage(
  documentId: string,
  opts: { sectionId?: string; after?: string; limit?: number } = {},
) {
  const params = new URLSearchParams()
  if (opts.sectionId) params.set('section_id', opts.sectionId)
  if (opts.after) params.set('after', opts.after)
  if (opts.limit) params.set('limit', String(opts.limit))
  const qs = params.toString()
  return editorialFetch<ReadingPage>(
    `/api/editorial/books/${encodeURIComponent(documentId)}/paragraphs${
      qs ? `?${qs}` : ''
    }`,
  )
}

export function getParagraph(paragraphId: string) {
  return editorialFetch<ReadingParagraph>(
    `/api/editorial/paragraphs/${encodeURIComponent(paragraphId)}`,
  )
}

export function searchEditorialBooks(q: string, filters: SearchFilters = {}) {
  const params = new URLSearchParams({ q })
  if (filters.document_id) params.set('document_id', filters.document_id)
  if (filters.content_kind) params.set('content_kind', filters.content_kind)
  if (typeof filters.has_amharic_source === 'boolean') {
    params.set('has_amharic_source', String(filters.has_amharic_source))
  }
  if (filters.limit) params.set('limit', String(filters.limit))
  return editorialFetch<{
    query: string
    filters: Record<string, unknown>
    hits: SearchHit[]
    note: string
  }>(`/api/editorial/search?${params}`)
}

export function getIngestionPlan(documentId?: string) {
  const params = new URLSearchParams()
  if (documentId) params.set('document_id', documentId)
  const qs = params.toString()
  return editorialFetch<Record<string, unknown>>(
    `/api/editorial/ingestion/plan${qs ? `?${qs}` : ''}`,
  )
}

export function getEditorialStatus() {
  return editorialFetch<Record<string, unknown>>('/api/editorial/status')
}

export function getRetrievalDiagnostics() {
  return editorialFetch<Record<string, unknown>>(
    '/api/editorial/diagnostics/retrieval',
  )
}

export function recordEditorialApproval(body: {
  target_type: 'paragraph' | 'section' | 'document'
  target_id: string
  document_id: string
  approved_for_ingestion: boolean
  reviewer: string
  notes?: string
  section_id?: string
}) {
  return editorialFetch<Record<string, unknown>>('/api/editorial/approvals', {
    method: 'POST',
    body: JSON.stringify(body),
  })
}

export function contentKindLabel(kind: string | undefined): string {
  switch (kind) {
    case 'reference_supplement':
      return 'Added explanation (supplement)'
    case 'added_explanation':
      return 'Added explanation'
    case 'english_reading':
      return 'English reading'
    case 'original_source':
      return 'Original source'
    default:
      return kind || 'Reading'
  }
}
