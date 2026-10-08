import type { BibleVerseRow } from '../../../lib/searchBuddy/apiTypes.ts'

export function textOrNull(value: unknown): string | null {
  if (typeof value !== 'string') return null
  const trimmed = value.trim()
  return trimmed || null
}

export function displayText(
  ...candidates: Array<string | null | undefined>
): string | null {
  for (const c of candidates) {
    const t = textOrNull(c)
    if (t) return t
  }
  return null
}

export function verseNumber(row: BibleVerseRow): string | null {
  const raw = row.verse_number ?? row.verse
  if (raw === null || raw === undefined || raw === '') return null
  return String(raw)
}

export function verseBody(row: BibleVerseRow): string | null {
  return displayText(row.text, row.text_amharic, row.text_english)
}

export function bookChapterLabel(parts: {
  book?: string | null
  book_name?: string | null
  chapter?: number | string | null
  verse?: number | string | null
  verse_end?: number | string | null
}): string {
  const book = displayText(parts.book_name, parts.book) || ''
  const chapter =
    parts.chapter !== null && parts.chapter !== undefined && parts.chapter !== ''
      ? String(parts.chapter)
      : ''
  const verse =
    parts.verse !== null && parts.verse !== undefined && parts.verse !== ''
      ? String(parts.verse)
      : ''
  const verseEnd =
    parts.verse_end !== null && parts.verse_end !== undefined && parts.verse_end !== ''
      ? String(parts.verse_end)
      : ''

  let ref = book
  if (chapter) ref = ref ? `${ref} ${chapter}` : chapter
  if (verse) {
    ref = `${ref}:${verse}`
    if (verseEnd && verseEnd !== verse) ref = `${ref}–${verseEnd}`
  }
  return ref.trim()
}

export function safeExternalUrl(url: unknown): string | null {
  const raw = textOrNull(url)
  if (!raw) return null
  try {
    const parsed = new URL(raw)
    if (parsed.protocol === 'http:' || parsed.protocol === 'https:') return parsed.toString()
  } catch {
    return null
  }
  return null
}

export function formatCommemorationType(value: unknown): string | null {
  const raw = textOrNull(value)
  if (!raw) return null
  return raw.replace(/_/g, ' ')
}
