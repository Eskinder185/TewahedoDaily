export type ErrorMessageOptions = {
  operation?: string
  fallback?: string
}

const SECRET_PATTERNS: RegExp[] = [
  /\bBearer\s+[A-Za-z0-9._~+/=-]+/gi,
  /\beyJ[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}\b/g,
  /((?:service[_-]?role|secret|api[_-]?key|access[_-]?token|refresh[_-]?token|password)\s*[:=]\s*)[^\s,;]+/gi,
  /(postgres(?:ql)?:\/\/[^:\s/@]+:)[^@\s/]+@/gi,
]

function safeText(value: unknown): string {
  if (typeof value === 'string') return value.trim()
  if (typeof value === 'number' || typeof value === 'boolean' || typeof value === 'bigint') return String(value)
  if (value instanceof Error) return value.message.trim()
  return ''
}

function redact(value: string): string {
  let result = value.replace(/[\r\n\t]+/g, ' ').replace(/\s{2,}/g, ' ').trim()
  for (const pattern of SECRET_PATTERNS) {
    result = result.replace(pattern, (_match, capture: unknown) =>
      typeof capture === 'string' && capture ? `${capture}[redacted]` : '[redacted]')
  }
  return result.slice(0, 1200)
}

function objectField(value: Record<string, unknown>, ...keys: string[]): string {
  for (const key of keys) {
    const found = safeText(value[key])
    if (found) return found
  }
  return ''
}

/** Formats browser and Supabase failures without coercing objects to "[object Object]". */
export function formatErrorMessage(error: unknown, options: ErrorMessageOptions = {}): string {
  const operation = redact(options.operation || '')
  const fallback = redact(options.fallback || 'Something went wrong. Please try again.')
  const prefix = operation ? `${operation} failed` : ''

  if (error == null) return prefix ? `${prefix}: ${fallback}` : fallback
  if (typeof error === 'string' || typeof error === 'number' || typeof error === 'boolean') {
    const message = redact(String(error))
    return prefix ? `${prefix}: ${message || fallback}` : message || fallback
  }

  const value = error as Record<string, unknown>
  const code = redact(objectField(value, 'code', 'error_code', 'statusCode', 'status'))
  const message = redact(error instanceof Error
    ? error.message
    : objectField(value, 'message', 'error_description', 'statusText', 'name'))
  const details = redact(objectField(value, 'details', 'detail', 'reason'))
  const hint = redact(objectField(value, 'hint'))
  const diagnostic = [...new Set([message, details, hint].filter(Boolean))].join(' — ')

  let summary = prefix
  if (code) summary += `${summary ? ' ' : ''}(${code})`
  if (diagnostic) summary += `${summary ? ': ' : ''}${diagnostic}`
  if (summary) return summary
  return prefix ? `${prefix}: ${fallback}` : fallback
}

export function errorMessage(error: unknown) {
  if (typeof error === 'object' && error && 'code' in error) {
    const code = safeText((error as { code?: unknown }).code)
    const message = safeText((error as { message?: unknown }).message)
    if (code === 'PGRST116') return 'This item was not found, or you do not have permission to view it.'
    if (/mezmur not found/i.test(message) || /mezmur no longer available/i.test(message)) {
      return 'This Mezmur no longer exists. Return to the library or create a new draft.'
    }
    if (code === '23505') return 'This slug already exists. Choose a unique slug.'
    if (code === '23503') return 'This item is in use, or a selected category, singer, or tag no longer exists.'
    if (code === 'NoSuchBucket' || /bucket not found|no such bucket/i.test(message)) {
      return "The private 'church-library-originals' storage bucket does not exist. An administrator must create the private storage bucket."
    }
    if ((code === '42501' || code === '403') && /storage|church_library_storage|bucket|objects/i.test(message)) {
      return 'Access denied to Church Library private storage. Verify that your account has the Church Library staff role.'
    }
    if (code === '413' || /payload too large|exceeded.*maximum allowed size/i.test(message)) {
      return 'The document exceeds the 100 MiB storage size limit. Please select a smaller file.'
    }
    if (/mime_type_not_allowed|invalid mime type|content type.*not permitted/i.test(message)) {
      return 'This file type is not permitted in Church Library private storage. Only PDF, EPUB, DOCX, UTF-8 TXT, and cover images are supported.'
    }
    if (code === '42501') return formatErrorMessage(error, { operation: 'Permission denied' })
    if ((code === '42703' || code === 'PGRST204') &&
      /zemaris_with_counts.*(deleted_at|deleted_by|deleted_from_status).*does not exist/i.test(message)) {
      return 'The Zemari summary view is out of date. The underlying Trash metadata exists, but the view must be refreshed.'
    }
    if ((code === '42703' || code === 'PGRST204' || code === 'PGRST205') &&
      /church_library_(books|book_versions|versions|sections|passages|passage_revisions)/i.test(message)) {
      return 'The Church Library upload schema is incomplete. Ask a database administrator to apply the reviewed Church Library upload repair migration.'
    }
  }
  return formatErrorMessage(error)
}
