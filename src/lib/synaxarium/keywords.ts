/**
 * Synaxarium commemorations.keywords is PostgreSQL TEXT (confirmed via PostgREST:
 * `contains` → operator does not exist: text @> unknown).
 * Persist as pipe-separated: gabriel|angel|meskerem
 */

/** Always return a safe string[] for UI / internal use. */
export function normalizeKeywords(value: unknown): string[] {
  if (Array.isArray(value)) {
    return value
      .map((item) => String(item ?? '').trim())
      .filter(Boolean)
  }
  if (typeof value === 'string') {
    const trimmed = value.trim()
    if (!trimmed) return []
    // Accept pipe, comma, or JSON-looking array string leftovers.
    if (trimmed.startsWith('[') && trimmed.endsWith(']')) {
      try {
        const parsed = JSON.parse(trimmed) as unknown
        if (Array.isArray(parsed)) return normalizeKeywords(parsed)
      } catch {
        /* fall through to split */
      }
    }
    return trimmed
      .split(/[|,]/)
      .map((part) => part.trim().replace(/^\{|\}$/g, ''))
      .filter(Boolean)
  }
  return []
}

/** Alias for reading DB values into app state. */
export function parseKeywordsFromDb(value: unknown): string[] {
  return normalizeKeywords(value)
}

/** Serialize for TEXT column storage (pipe-separated). */
export function serializeKeywordsForDb(value: unknown): string | null {
  const parts = normalizeKeywords(value)
  if (!parts.length) return null
  return parts.join('|')
}

export function formatKeywordsForInput(value: unknown): string {
  return normalizeKeywords(value).join(', ')
}
