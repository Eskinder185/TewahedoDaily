/**
 * Exact-text client for the uploaded Faith and Order source.
 * Searches and reads paragraphs. It does not ask a model to write an answer.
 */

import { getAiApiBaseUrl } from '../ai/aiConfig.ts'
import { aiFetch } from '../ai/aiClient.ts'
import { AiClientError } from '../ai/aiTypes.ts'

export const FAITH_AND_ORDER_ROUTE_PREFIX = '/api/documents/faith-and-order'
export const FAITH_AND_ORDER_QUERY_MAX = 500
export const FAITH_AND_ORDER_QUERY_MIN = 1
export const FAITH_AND_ORDER_LIMIT_DEFAULT = 5
export const FAITH_AND_ORDER_LIMIT_MIN = 1
export const FAITH_AND_ORDER_LIMIT_MAX = 10
export const FAITH_AND_ORDER_TIMEOUT_MS = 20_000

const VERSION_RE = /^[a-f0-9]{64}$/
const SECTION_RE = /^s[0-9]{6}$/
const PARAGRAPH_RE = /^p[0-9]{6}$/

export class FaithAndOrderQueryError extends Error {
  readonly code: 'empty' | 'too_long'
  readonly length: number

  constructor(code: 'empty' | 'too_long', length: number) {
    super(code === 'empty' ? 'Enter a search term.' : 'Search is too long.')
    this.name = 'FaithAndOrderQueryError'
    this.code = code
    this.length = length
  }
}

export type FaithAndOrderSectionRef = {
  id: string
  title: string
  start_paragraph: number
}

export type FaithAndOrderSource = {
  source_id: string
  title: string
  version: string
  language: string
  editorial_status: string
  locator_kind: string
  sections: FaithAndOrderSectionRef[]
  paragraph_count: number
  translation_available: boolean
  mode: string
  generated: boolean
  source_filename?: string
}

export type FaithAndOrderParagraph = {
  id: string
  paragraph_number: number
  section_id: string
  section_title: string
  is_heading: boolean
  text: string
  source_id: string
  version: string
  language: string
  citation: string
  paragraph_path: string
  section_path: string
}

export type FaithAndOrderSearchHit = FaithAndOrderParagraph & {
  context_before: FaithAndOrderParagraph[]
  context_after: FaithAndOrderParagraph[]
}

export type FaithAndOrderSearchResponse = {
  type: 'document_search'
  mode: 'exact_document_search'
  generated: false
  query: string
  source: FaithAndOrderSource
  status: 'matches' | 'no_matching_passage'
  count: number
  results: FaithAndOrderSearchHit[]
}

export type FaithAndOrderManifest = FaithAndOrderSource

export type FaithAndOrderSectionDocument = {
  source: FaithAndOrderSource
  section_id: string
  paragraphs: FaithAndOrderParagraph[]
  generated: false
}

export type FaithAndOrderPassageCard = {
  match: FaithAndOrderSearchHit
  contextBefore: FaithAndOrderParagraph[]
  contextAfter: FaithAndOrderParagraph[]
}

type RequestOptions = {
  signal?: AbortSignal
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
}

function reject(message: string): never {
  throw new AiClientError('unknown', message)
}

/** Accept only the fixed Faith and Order route. Rejects other APIs and escapes. */
export function assertFaithAndOrderRoute(path: string): void {
  if (typeof path !== 'string' || path.length === 0 || path.length > 2000) {
    reject('Blocked document path.')
  }
  if (
    !path.startsWith(FAITH_AND_ORDER_ROUTE_PREFIX) ||
    path.includes('..') ||
    path.includes('\\') ||
    path.includes('://') ||
    path.includes('\0') ||
    path.includes('//')
  ) {
    reject('Blocked document path.')
  }

  const queryIndex = path.indexOf('?')
  const pathname = queryIndex === -1 ? path : path.slice(0, queryIndex)
  const query = queryIndex === -1 ? '' : path.slice(queryIndex + 1)
  if (query.includes('#')) reject('Blocked document path.')

  if (pathname === FAITH_AND_ORDER_ROUTE_PREFIX) {
    if (query) reject('Blocked document path.')
    return
  }

  if (pathname === `${FAITH_AND_ORDER_ROUTE_PREFIX}/search`) {
    const params = new URLSearchParams(query)
    const keys = [...params.keys()]
    if (keys.some((key) => key !== 'q' && key !== 'limit')) reject('Blocked document path.')
    const q = params.get('q')
    if (q == null || q.length < FAITH_AND_ORDER_QUERY_MIN || q.length > FAITH_AND_ORDER_QUERY_MAX) {
      reject('Blocked document path.')
    }
    const limit = Number(params.get('limit'))
    if (!Number.isInteger(limit) || limit < FAITH_AND_ORDER_LIMIT_MIN || limit > FAITH_AND_ORDER_LIMIT_MAX) {
      reject('Blocked document path.')
    }
    return
  }

  const paragraph = pathname.match(
    /^\/api\/documents\/faith-and-order\/([a-f0-9]{64})\/paragraphs\/(p[0-9]{6})$/,
  )
  const section = pathname.match(
    /^\/api\/documents\/faith-and-order\/([a-f0-9]{64})\/sections\/(s[0-9]{6})$/,
  )
  if ((!paragraph && !section) || query) reject('Blocked document path.')
}

export function assertFaithAndOrderQuery(query: string): string {
  const trimmed = (query ?? '').trim()
  if (!trimmed) throw new FaithAndOrderQueryError('empty', 0)
  if (trimmed.length > FAITH_AND_ORDER_QUERY_MAX) {
    throw new FaithAndOrderQueryError('too_long', trimmed.length)
  }
  return trimmed
}

export function assertFaithAndOrderLimit(limit: number): number {
  if (
    !Number.isInteger(limit) ||
    limit < FAITH_AND_ORDER_LIMIT_MIN ||
    limit > FAITH_AND_ORDER_LIMIT_MAX
  ) {
    throw new AiClientError('bad_request', 'Search limit must be from 1 to 10.')
  }
  return limit
}

export function faithAndOrderManifestPath(): string {
  const path = FAITH_AND_ORDER_ROUTE_PREFIX
  assertFaithAndOrderRoute(path)
  return path
}

export function faithAndOrderSearchPath(query: string, limit = FAITH_AND_ORDER_LIMIT_DEFAULT): string {
  const checked = assertFaithAndOrderQuery(query)
  const checkedLimit = assertFaithAndOrderLimit(limit)
  const path = `${FAITH_AND_ORDER_ROUTE_PREFIX}/search?q=${encodeURIComponent(checked)}&limit=${checkedLimit}`
  assertFaithAndOrderRoute(path)
  return path
}

export function faithAndOrderParagraphPath(version: string, paragraphId: string): string {
  if (!VERSION_RE.test(version) || !PARAGRAPH_RE.test(paragraphId)) {
    reject('Blocked document path.')
  }
  const path = `${FAITH_AND_ORDER_ROUTE_PREFIX}/${version}/paragraphs/${paragraphId}`
  assertFaithAndOrderRoute(path)
  return path
}

export function faithAndOrderSectionPath(version: string, sectionId: string): string {
  if (!VERSION_RE.test(version) || !SECTION_RE.test(sectionId)) {
    reject('Blocked document path.')
  }
  const path = `${FAITH_AND_ORDER_ROUTE_PREFIX}/${version}/sections/${sectionId}`
  assertFaithAndOrderRoute(path)
  return path
}

function parseSectionRef(value: unknown): FaithAndOrderSectionRef | null {
  if (!isRecord(value)) return null
  if (typeof value.id !== 'string' || !SECTION_RE.test(value.id)) return null
  if (typeof value.title !== 'string' || value.title.length === 0) return null
  const start = value.start_paragraph
  return {
    id: value.id,
    title: value.title,
    start_paragraph: typeof start === 'number' && Number.isFinite(start) ? start : 0,
  }
}

function parseSource(value: unknown, fallback?: Partial<FaithAndOrderSource>): FaithAndOrderSource {
  if (!isRecord(value)) reject('Faith and Order source was unreadable.')
  const version = typeof value.version === 'string' ? value.version : fallback?.version
  if (!version || !VERSION_RE.test(version)) reject('Faith and Order source was unreadable.')
  if (typeof value.title !== 'string' || !value.title) reject('Faith and Order source was unreadable.')
  if (typeof value.language !== 'string' || !value.language) reject('Faith and Order source was unreadable.')
  if (typeof value.editorial_status !== 'string' || !value.editorial_status) {
    reject('Faith and Order source was unreadable.')
  }
  if (typeof value.locator_kind !== 'string' || !value.locator_kind) {
    reject('Faith and Order source was unreadable.')
  }
  if (typeof value.paragraph_count !== 'number' || !Number.isFinite(value.paragraph_count)) {
    reject('Faith and Order source was unreadable.')
  }
  if (typeof value.translation_available !== 'boolean') reject('Faith and Order source was unreadable.')
  const mode = typeof value.mode === 'string' ? value.mode : fallback?.mode
  if (mode !== 'exact_document_search') reject('Faith and Order source was unreadable.')
  const generated = typeof value.generated === 'boolean' ? value.generated : fallback?.generated
  if (generated !== false) reject('Faith and Order source was unreadable.')
  const sourceId = typeof value.source_id === 'string' ? value.source_id : 'faith-and-order'
  if (sourceId !== 'faith-and-order') reject('Faith and Order source was unreadable.')

  const rawSections = Array.isArray(value.sections) ? value.sections : []
  const sections = rawSections.map(parseSectionRef).filter((section): section is FaithAndOrderSectionRef => Boolean(section))
  if (rawSections.length > 0 && sections.length !== rawSections.length) {
    reject('Faith and Order source was unreadable.')
  }

  return {
    source_id: sourceId,
    title: value.title,
    version,
    language: value.language,
    editorial_status: value.editorial_status,
    locator_kind: value.locator_kind,
    sections,
    paragraph_count: value.paragraph_count,
    translation_available: value.translation_available,
    mode: 'exact_document_search',
    generated: false,
    source_filename: typeof value.source_filename === 'string' ? value.source_filename : undefined,
  }
}

function parseParagraph(
  value: unknown,
  fallback?: { version?: string; source_id?: string },
): FaithAndOrderParagraph | null {
  if (!isRecord(value)) return null
  if (typeof value.id !== 'string' || !PARAGRAPH_RE.test(value.id)) return null
  if (typeof value.text !== 'string') return null
  if (typeof value.paragraph_number !== 'number' || !Number.isInteger(value.paragraph_number)) return null
  if (typeof value.section_id !== 'string' || !SECTION_RE.test(value.section_id)) return null
  if (typeof value.section_title !== 'string') return null
  if (typeof value.language !== 'string' || !value.language) return null
  const version = typeof value.version === 'string' ? value.version : fallback?.version
  if (!version || !VERSION_RE.test(version)) return null
  const sourceId = typeof value.source_id === 'string' ? value.source_id : fallback?.source_id
  if (sourceId !== 'faith-and-order') return null
  const paragraphPath = faithAndOrderParagraphPath(version, value.id)
  const sectionPath = faithAndOrderSectionPath(version, value.section_id)
  if (typeof value.paragraph_path === 'string' && value.paragraph_path !== paragraphPath) return null
  if (typeof value.section_path === 'string' && value.section_path !== sectionPath) return null
  return {
    id: value.id,
    paragraph_number: value.paragraph_number,
    section_id: value.section_id,
    section_title: value.section_title,
    is_heading: value.is_heading === true,
    text: value.text,
    source_id: sourceId,
    version,
    language: value.language,
    citation: typeof value.citation === 'string' ? value.citation : '',
    paragraph_path: paragraphPath,
    section_path: sectionPath,
  }
}

function parseContext(value: unknown, source: FaithAndOrderSource): FaithAndOrderParagraph[] {
  if (value == null) return []
  if (!Array.isArray(value)) reject('Faith and Order search was unreadable.')
  return value.map((item) => {
    const paragraph = parseParagraph(item, source)
    if (!paragraph) reject('Faith and Order search was unreadable.')
    return paragraph
  })
}

export function parseFaithAndOrderManifest(value: unknown): FaithAndOrderManifest {
  return parseSource(value)
}

export function parseFaithAndOrderSearch(value: unknown): FaithAndOrderSearchResponse {
  if (!isRecord(value)) reject('Faith and Order search was unreadable.')
  if (value.type !== 'document_search') reject('Faith and Order search was unreadable.')
  if (value.mode !== 'exact_document_search') reject('Faith and Order search was unreadable.')
  if (value.generated !== false) reject('Faith and Order search was unreadable.')
  if (value.status !== 'matches' && value.status !== 'no_matching_passage') {
    reject('Faith and Order search was unreadable.')
  }
  if (typeof value.query !== 'string') reject('Faith and Order search was unreadable.')
  const source = parseSource(value.source)
  const rawResults = Array.isArray(value.results) ? value.results : null
  if (!rawResults) reject('Faith and Order search was unreadable.')

  const results: FaithAndOrderSearchHit[] = []
  for (const item of rawResults) {
    const paragraph = parseParagraph(item, source)
    if (!paragraph || !isRecord(item)) {
      reject('Faith and Order search was unreadable.')
    }
    results.push({
      ...paragraph,
      context_before: parseContext(item.context_before, source),
      context_after: parseContext(item.context_after, source),
    })
  }

  if (value.status === 'no_matching_passage') {
    return {
      type: 'document_search',
      mode: 'exact_document_search',
      generated: false,
      query: value.query,
      source,
      status: 'no_matching_passage',
      count: 0,
      results: [],
    }
  }

  return {
    type: 'document_search',
    mode: 'exact_document_search',
    generated: false,
    query: value.query,
    source,
    status: 'matches',
    count: results.length,
    results,
  }
}

export function parseFaithAndOrderSection(value: unknown): FaithAndOrderSectionDocument {
  if (!isRecord(value)) reject('Faith and Order section was unreadable.')
  if (value.generated !== false) reject('Faith and Order section was unreadable.')
  if (typeof value.section_id !== 'string' || !SECTION_RE.test(value.section_id)) {
    reject('Faith and Order section was unreadable.')
  }
  const source = parseSource(value.source)
  if (!Array.isArray(value.paragraphs)) reject('Faith and Order section was unreadable.')
  const paragraphs: FaithAndOrderParagraph[] = []
  for (const item of value.paragraphs) {
    const paragraph = parseParagraph(item, {
      version: source.version,
      source_id: source.source_id,
    })
    if (!paragraph || paragraph.section_id !== value.section_id) {
      reject('Faith and Order section was unreadable.')
    }
    paragraphs.push(paragraph)
  }
  return {
    source,
    section_id: value.section_id,
    paragraphs,
    generated: false,
  }
}

export function parseFaithAndOrderParagraph(value: unknown): FaithAndOrderParagraph {
  const paragraph = parseParagraph(value, { source_id: 'faith-and-order' })
  if (!paragraph) reject('Faith and Order paragraph was unreadable.')
  return paragraph
}

/**
 * Keep each source paragraph distinct.
 * A paragraph id is shown once: as a match first, otherwise as neighboring context.
 */
export function layoutFaithAndOrderResults(
  results: FaithAndOrderSearchHit[],
): FaithAndOrderPassageCard[] {
  const matches: FaithAndOrderSearchHit[] = []
  const matchIds = new Set<string>()
  for (const hit of results) {
    if (!hit?.id || matchIds.has(hit.id)) continue
    matchIds.add(hit.id)
    matches.push(hit)
  }
  const shown = new Set<string>(matchIds)
  return matches.map((match) => {
    const take = (list: FaithAndOrderParagraph[] | undefined) => {
      const out: FaithAndOrderParagraph[] = []
      for (const paragraph of list || []) {
        if (!paragraph?.id || shown.has(paragraph.id)) continue
        shown.add(paragraph.id)
        out.push(paragraph)
      }
      return out
    }
    return {
      match,
      contextBefore: take(match.context_before),
      contextAfter: take(match.context_after),
    }
  })
}

async function faithAndOrderGet<T>(path: string, options?: RequestOptions): Promise<T> {
  assertFaithAndOrderRoute(path)
  if (!getAiApiBaseUrl()) {
    throw new AiClientError('not_configured', 'Faith and Order search is not configured.')
  }
  return aiFetch<T>({
    path,
    method: 'GET',
    timeoutMs: FAITH_AND_ORDER_TIMEOUT_MS,
    signal: options?.signal,
    withAuth: true,
  })
}

export async function fetchFaithAndOrderManifest(
  options?: RequestOptions,
): Promise<FaithAndOrderManifest> {
  const payload = await faithAndOrderGet<unknown>(faithAndOrderManifestPath(), options)
  return parseFaithAndOrderManifest(payload)
}

export async function searchFaithAndOrder(
  query: string,
  options?: RequestOptions & { limit?: number },
): Promise<FaithAndOrderSearchResponse> {
  const path = faithAndOrderSearchPath(query, options?.limit ?? FAITH_AND_ORDER_LIMIT_DEFAULT)
  const payload = await faithAndOrderGet<unknown>(path, options)
  return parseFaithAndOrderSearch(payload)
}

export async function fetchFaithAndOrderParagraph(
  version: string,
  paragraphId: string,
  options?: RequestOptions,
): Promise<FaithAndOrderParagraph> {
  const payload = await faithAndOrderGet<unknown>(
    faithAndOrderParagraphPath(version, paragraphId),
    options,
  )
  return parseFaithAndOrderParagraph(payload)
}

export async function fetchFaithAndOrderSection(
  version: string,
  sectionId: string,
  options?: RequestOptions,
): Promise<FaithAndOrderSectionDocument> {
  const payload = await faithAndOrderGet<unknown>(faithAndOrderSectionPath(version, sectionId), options)
  return parseFaithAndOrderSection(payload)
}
