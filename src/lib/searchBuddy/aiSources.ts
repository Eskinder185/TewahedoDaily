/**
 * Helpers for AI response `sources[]` — Scripture passages vs generic links.
 * Verse bodies are taken only from FastAPI fields; never invented here.
 */
import type {
  AiGenericSource,
  AiScriptureSource,
  AiScriptureVerse,
  AiSource,
} from './apiTypes.ts'

function isRecord(value: unknown): value is Record<string, unknown> {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
}

function asTrimmedString(value: unknown): string | null {
  if (typeof value !== 'string') return null
  const trimmed = value.trim()
  return trimmed || null
}

function asFiniteNumber(value: unknown): number | null {
  if (typeof value === 'number' && Number.isFinite(value)) return value
  if (typeof value === 'string' && value.trim() && Number.isFinite(Number(value))) {
    return Number(value)
  }
  return null
}

function normalizeCoversRange(raw: unknown): number[] | null {
  if (!Array.isArray(raw) || raw.length < 2) return null
  const start = asFiniteNumber(raw[0])
  const end = asFiniteNumber(raw[1])
  if (start == null || end == null) return null
  return [start, end]
}

function normalizeScriptureVerse(raw: unknown): AiScriptureVerse | null {
  if (!isRecord(raw)) return null
  const text = asTrimmedString(raw.text)
  if (!text) return null
  return {
    verse_number: asFiniteNumber(raw.verse_number),
    text,
    covers_verse_range: normalizeCoversRange(raw.covers_verse_range),
  }
}

/** True when a source carries verified Scripture verse text from the API. */
export function isAiScriptureSource(source: unknown): source is AiScriptureSource {
  if (!isRecord(source)) return false
  if (!Array.isArray(source.verses) || source.verses.length === 0) return false
  return source.verses.some((row) => isRecord(row) && Boolean(asTrimmedString(row.text)))
}

/** True when a source is a generic citation (title/url/excerpt) without verse rows. */
export function isAiGenericSource(source: unknown): source is AiGenericSource {
  if (!isRecord(source)) return false
  if (isAiScriptureSource(source)) return false
  return Boolean(
    asTrimmedString(source.title) ||
      asTrimmedString(source.url) ||
      asTrimmedString(source.excerpt),
  )
}

export function normalizeAiScriptureSource(raw: unknown): AiScriptureSource | null {
  if (!isRecord(raw)) return null
  const verses = Array.isArray(raw.verses)
    ? raw.verses.map(normalizeScriptureVerse).filter((v): v is AiScriptureVerse => Boolean(v))
    : []
  if (!verses.length) return null
  return {
    reference: asTrimmedString(raw.reference),
    edition: asTrimmedString(raw.edition),
    language: asTrimmedString(raw.language),
    mystery: asTrimmedString(raw.mystery),
    verses,
  }
}

export function normalizeAiGenericSource(raw: unknown): AiGenericSource | null {
  if (!isRecord(raw) || isAiScriptureSource(raw)) return null
  const title = asTrimmedString(raw.title)
  const url = asTrimmedString(raw.url)
  const excerpt = asTrimmedString(raw.excerpt)
  if (!title && !url && !excerpt) return null
  return { title, url, excerpt }
}

/** Preserve FastAPI source fields; drop only completely empty rows. */
export function normalizeAiSources(raw: unknown): AiSource[] | undefined {
  if (!Array.isArray(raw)) return undefined
  const out: AiSource[] = []
  for (const row of raw) {
    const scripture = normalizeAiScriptureSource(row)
    if (scripture) {
      out.push(scripture)
      continue
    }
    const generic = normalizeAiGenericSource(row)
    if (generic) out.push(generic)
  }
  return out.length ? out : undefined
}

export function partitionAiSources(sources: AiSource[] | null | undefined): {
  scripture: AiScriptureSource[]
  generic: AiGenericSource[]
} {
  const list = Array.isArray(sources) ? sources : []
  const scripture: AiScriptureSource[] = []
  const generic: AiGenericSource[] = []
  for (const source of list) {
    if (isAiScriptureSource(source)) scripture.push(normalizeAiScriptureSource(source) || source)
    else if (isAiGenericSource(source)) generic.push(source)
  }
  return { scripture, generic }
}

/** Display label for covers_verse_range without inventing a new reference. */
export function coversRangeLabel(range: number[] | null | undefined): string | null {
  if (!Array.isArray(range) || range.length < 2) return null
  const start = asFiniteNumber(range[0])
  const end = asFiniteNumber(range[1])
  if (start == null || end == null) return null
  if (start === end) return String(start)
  return `${start}\u2013${end}`
}

/** Exact verse bodies from API, joined for display/copy. */
export function scriptureVerseText(source: AiScriptureSource): string {
  if (!Array.isArray(source.verses)) return ''
  return source.verses
    .map((row) => asTrimmedString(row.text))
    .filter((t): t is string => Boolean(t))
    .join('\n')
}

export function scriptureLanguageKey(language: string | null | undefined): 'en' | 'am' | 'other' {
  const lang = (language || '').trim().toLowerCase()
  if (lang === 'en' || lang === 'eng' || lang === 'english') return 'en'
  if (lang === 'am' || lang === 'amh' || lang === 'amharic') return 'am'
  return 'other'
}
