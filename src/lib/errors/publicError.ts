/**
 * Public-facing error text. Database, network and stack details (UUID syntax errors, PostgREST codes, SQL words,
 * "Failed to fetch") are for logs and the CMS, never for a reader. Anything technical becomes the supplied
 * plain-language fallback; short human messages written for readers pass through unchanged.
 */
const TECHNICAL = [
  /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/i,
  /invalid input syntax|violates|duplicate key|syntax error at|relation ".*" does not exist|column .* does not exist/i,
  /\b(PGRST\d+|SQLSTATE|42P01|42703|23505|22P02|JWT|row-level security|schema cache|permission denied)\b/i,
  /\b(TypeError|ReferenceError|SyntaxError|AbortError|NetworkError)\b|failed to fetch|load failed|undefined is not|cannot read propert/i,
  /\bat\s+\S+\s+\(.*:\d+:\d+\)|https?:\/\/\S+\/(rest|auth)\/v1/i,
]

export function isTechnicalMessage(message: unknown): boolean {
  if (typeof message !== 'string') return true
  const text = message.trim()
  if (!text || text.length > 200) return true
  return TECHNICAL.some((pattern) => pattern.test(text))
}

/** `cause` may be an Error, a string (as stored by useAsync) or anything thrown. */
export function publicErrorMessage(cause: unknown, fallback: string): string {
  const message = cause instanceof Error ? cause.message : typeof cause === 'string' ? cause : ''
  return isTechnicalMessage(message) ? fallback : message.trim()
}
