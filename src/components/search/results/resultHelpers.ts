import type { BibleVerseRow } from '../../../lib/searchBuddy/apiTypes.ts'
import { flattenBibleBookFields } from '../../../lib/search/bibleRoute.ts'

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

/** Turn API book slugs ("1-john", "john") into readable titles when book_name is absent. */
export function humanizeBookName(raw: string | null | undefined): string {
  const value = textOrNull(raw)
  if (!value) return ''
  if (/[\u1200-\u137F]/.test(value)) return value
  if (!/^[a-z0-9][a-z0-9\s_-]*$/i.test(value)) return value
  return value
    .replace(/[_]+/g, ' ')
    .split(/[-\s]+/)
    .filter(Boolean)
    .map((part) => {
      if (/^\d+$/.test(part)) return part
      return part.charAt(0).toUpperCase() + part.slice(1).toLowerCase()
    })
    .join(' ')
}

export function bookChapterLabel(parts: {
  book?: unknown
  book_name?: string | null
  book_slug?: string | null
  chapter?: number | string | null
  verse?: number | string | null
  verse_end?: number | string | null
  end_verse?: number | string | null
}): string {
  const flat = flattenBibleBookFields(parts)
  const book = humanizeBookName(displayText(flat.book_name, flat.book, parts.book_name))
  const chapter =
    parts.chapter !== null && parts.chapter !== undefined && parts.chapter !== ''
      ? String(parts.chapter)
      : ''
  const verse =
    parts.verse !== null && parts.verse !== undefined && parts.verse !== ''
      ? String(parts.verse)
      : ''
  const verseEndRaw = parts.verse_end ?? parts.end_verse
  const verseEnd =
    verseEndRaw !== null && verseEndRaw !== undefined && verseEndRaw !== ''
      ? String(verseEndRaw)
      : ''

  let ref = book
  if (chapter) ref = ref ? `${ref} ${chapter}` : chapter
  if (verse) {
    ref = `${ref}:${verse}`
    if (verseEnd && verseEnd !== verse) ref = `${ref}–${verseEnd}`
  }
  return ref.trim()
}

export function bibleLanguageLabel(value: unknown): string | null {
  const raw = textOrNull(value)
  if (!raw) return null
  const key = raw.toLowerCase()
  const labels: Record<string, string> = {
    am: 'Amharic',
    amharic: 'Amharic',
    en: 'English',
    eng: 'English',
    english: 'English',
    om: 'Oromo',
    oromo: 'Oromo',
    gez: 'Geʽez',
    geez: 'Geʽez',
    geez_text: 'Geʽez',
    web: 'English (WEB)',
  }
  if (labels[key]) return labels[key]
  return humanizeBookName(raw)
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
