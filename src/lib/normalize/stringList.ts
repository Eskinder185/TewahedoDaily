/**
 * Normalize unknown Supabase / CSV / JSON list-like values into string[].
 * Live `mezmur.search_keywords` is text (often pipe-separated), while migrations
 * declare text[] — never call .join/.map on raw DB values.
 */
export function normalizeStringList(value: unknown): string[] {
  if (value == null) return []

  if (Array.isArray(value)) {
    const out: string[] = []
    for (const item of value) {
      if (typeof item === 'string') {
        const trimmed = item.trim()
        if (trimmed) out.push(trimmed)
      } else if (item != null && typeof item !== 'object') {
        const trimmed = String(item).trim()
        if (trimmed) out.push(trimmed)
      }
    }
    return out
  }

  if (typeof value === 'string') {
    const trimmed = value.trim()
    if (!trimmed) return []

    if (
      (trimmed.startsWith('[') && trimmed.endsWith(']')) ||
      (trimmed.startsWith('{') && trimmed.endsWith('}'))
    ) {
      try {
        const parsed: unknown = JSON.parse(trimmed)
        if (Array.isArray(parsed)) return normalizeStringList(parsed)
      } catch {
        // fall through to delimiter split
      }
    }

    return trimmed
      .split(/[|,;]+/)
      .map((part) => part.trim())
      .filter(Boolean)
  }

  if (typeof value === 'number' || typeof value === 'boolean') {
    return [String(value)]
  }

  return []
}

export function normalizeStringListLower(value: unknown): string[] {
  return normalizeStringList(value).map((item) => item.toLowerCase())
}
