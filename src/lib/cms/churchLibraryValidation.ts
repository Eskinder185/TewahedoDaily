export const CHURCH_LIBRARY_LANGUAGES = ['en', 'am', 'gez', 'mixed', 'other'] as const
export const CHURCH_LIBRARY_PROCESSING_STATUSES = [
  'not_uploaded', 'pending', 'processing', 'ready', 'needs_ocr', 'failed',
] as const

export type ChurchLibraryLanguage = (typeof CHURCH_LIBRARY_LANGUAGES)[number]
export type ChurchLibraryProcessingState = (typeof CHURCH_LIBRARY_PROCESSING_STATUSES)[number]

const UUID_PATTERN = /^[0-9a-f]{8}-[0-9a-f]{4}-[1-8][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i
const DOCUMENT_MIME_BY_EXTENSION: Record<string, string> = {
  pdf: 'application/pdf',
  docx: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
  txt: 'text/plain',
  epub: 'application/epub+zip',
}

export function requiredText(value: unknown, label: string, maxLength: number): string {
  if (typeof value !== 'string' || !value.trim()) throw new Error(`${label} is required.`)
  const text = value.trim()
  if (text.length > maxLength) throw new Error(`${label} must be ${maxLength} characters or fewer.`)
  return text
}

export function optionalText(value: unknown, label: string, maxLength: number): string | null {
  if (value === null || value === undefined || value === '') return null
  if (typeof value !== 'string') throw new Error(`${label} must be text.`)
  const text = value.trim()
  if (!text) return null
  if (text.length > maxLength) throw new Error(`${label} must be ${maxLength} characters or fewer.`)
  return text
}

export function requireUuid(value: unknown, label: string): string {
  if (typeof value !== 'string' || !UUID_PATTERN.test(value)) {
    throw new Error(`${label} is missing or invalid. Refresh the Church Library and try again.`)
  }
  return value
}

export function normalizeLanguage(value: unknown): ChurchLibraryLanguage {
  return CHURCH_LIBRARY_LANGUAGES.includes(value as ChurchLibraryLanguage)
    ? value as ChurchLibraryLanguage
    : 'en'
}

export function normalizeProcessingStatus(
  value: unknown,
  hasCurrentVersion = false,
): ChurchLibraryProcessingState {
  if (CHURCH_LIBRARY_PROCESSING_STATUSES.includes(value as ChurchLibraryProcessingState)) {
    return value as ChurchLibraryProcessingState
  }
  return hasCurrentVersion ? 'pending' : 'not_uploaded'
}

export function formatProcessingStatus(value: unknown, hasCurrentVersion = false): string {
  const status = normalizeProcessingStatus(value, hasCurrentVersion)
  return status.split('_').map((part) => part[0]?.toUpperCase() + part.slice(1)).join(' ')
}

export function validateDocumentMetadata(
  file: { name?: unknown; size?: unknown; type?: unknown } | null | undefined,
  maxBytes: number,
): string {
  if (!file || typeof file !== 'object') {
    throw new Error('Choose an EPUB, PDF, DOCX, or UTF-8 TXT book file.')
  }
  const fileName = requiredText(file.name, 'Filename', 255)
  if (typeof file.size !== 'number' || !Number.isFinite(file.size)) {
    throw new Error('The selected file size is unavailable. Choose the file again.')
  }
  if (file.size <= 0) throw new Error('Choose a non-empty document.')
  if (file.size > maxBytes) {
    const limitMiB = Math.round(maxBytes / (1024 * 1024))
    throw new Error(`Documents are limited to ${limitMiB} MiB.`)
  }
  const extension = fileName.split('.').pop()?.toLowerCase() || ''
  const expected = DOCUMENT_MIME_BY_EXTENSION[extension]
  if (!expected) throw new Error('Only PDF, DOCX, UTF-8 TXT, and EPUB files are supported.')
  if (file.type !== undefined && typeof file.type !== 'string') {
    throw new Error('The selected file content type is invalid.')
  }
  const browserType = typeof file.type === 'string' ? file.type.trim().toLowerCase() : ''
  if (browserType && browserType !== expected && !(extension === 'epub' && browserType === 'application/zip')) {
    throw new Error(`The file content type does not match .${extension}.`)
  }
  return expected
}

export function validateProcessingResult(value: unknown, operation: string): {
  status: string
  passage_count: number
  notes?: string | null
} {
  if (!value || typeof value !== 'object' || Array.isArray(value)) {
    throw new Error(`${operation} returned an invalid response.`)
  }
  const result = value as Record<string, unknown>
  if (typeof result.status !== 'string' || !result.status) {
    throw new Error(`${operation} did not return a processing status.`)
  }
  if (typeof result.passage_count !== 'number' || !Number.isInteger(result.passage_count) || result.passage_count < 0) {
    throw new Error(`${operation} did not return a valid passage count.`)
  }
  return {
    status: result.status,
    passage_count: result.passage_count,
    notes: typeof result.notes === 'string' ? result.notes : null,
  }
}
