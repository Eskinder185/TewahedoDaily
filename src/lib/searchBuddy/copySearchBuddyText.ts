import type { ChatMessage } from '../search/chatTypes.ts'
import type {
  BibleChapterResponse,
  BibleReferenceResponse,
  BibleSearchHit,
  BibleVerseRow,
  CalendarSearchHit,
  CalendarTodayFields,
  HymnRow,
  PrayerRow,
  SearchBuddyApiResponse,
  SynaxariumRow,
} from './apiTypes.ts'

function trimText(value: unknown): string {
  return typeof value === 'string' ? value.trim() : ''
}

function joinParts(parts: Array<string | null | undefined>): string {
  return parts.map((part) => (part || '').trim()).filter(Boolean).join('\n\n')
}

function verseLines(verses: BibleVerseRow[] | null | undefined): string[] {
  if (!Array.isArray(verses)) return []
  const lines: string[] = []
  for (const row of verses) {
    if (!row || typeof row !== 'object') continue
    const num = row.verse ?? row.verse_number
    const body =
      trimText(row.text) || trimText(row.text_amharic) || trimText(row.text_english)
    if (!body) continue
    const numLabel = num != null && String(num).trim() ? String(num).trim() : ''
    lines.push(numLabel ? `${numLabel}. ${body}` : body)
  }
  return lines
}

function mapPreviewLines<T>(
  rows: T[] | null | undefined,
  lineOf: (row: T) => string,
  limit = 8,
): string {
  if (!Array.isArray(rows) || rows.length === 0) return ''
  const lines: string[] = []
  for (const row of rows.slice(0, limit)) {
    const line = lineOf(row)
    if (line) lines.push(line)
  }
  return lines.join('\n')
}

function bibleHitLine(hit: BibleSearchHit): string {
  const book = trimText(hit.book_name)
  const chapter = hit.chapter != null && String(hit.chapter).trim() ? String(hit.chapter).trim() : ''
  const verse = hit.verse != null && String(hit.verse).trim() ? String(hit.verse).trim() : ''
  const composed =
    book && chapter ? `${book} ${chapter}${verse ? `:${verse}` : ''}` : book || chapter
  const ref = trimText(hit.reference) || composed
  const body =
    trimText(hit.text) ||
    trimText(hit.text_amharic) ||
    trimText(hit.text_english) ||
    trimText(hit.excerpt)
  if (ref && body) return `${ref}\n${body}`
  return ref || body
}

function hymnLine(row: HymnRow): string {
  return (
    trimText(row.title_amharic) ||
    trimText(row.title) ||
    trimText(row.title_english) ||
    trimText(row.title_transliteration) ||
    trimText(row.preview)
  )
}

function prayerLine(row: PrayerRow): string {
  return trimText(row.title_amharic) || trimText(row.title) || trimText(row.preview)
}

function synaxLine(row: SynaxariumRow): string {
  const title = trimText(row.title_amharic) || trimText(row.title)
  const preview = trimText(row.preview)
  if (title && preview && preview !== title) return `${title}\n${preview}`
  return title || preview
}

function calendarHitLine(row: CalendarSearchHit): string {
  const title = trimText(row.title_amharic) || trimText(row.title)
  const body = trimText(row.summary) || trimText(row.preview) || trimText(row.description)
  if (title && body && body !== title) return `${title}\n${body}`
  return title || body
}

function calendarFieldsText(fields: CalendarTodayFields): string {
  const title =
    trimText(fields.title) ||
    trimText(fields.title_amharic) ||
    trimText(fields.primary_observance) ||
    trimText(fields.observance_title) ||
    trimText(fields.observance) ||
    trimText(fields.ethiopian_date_english) ||
    trimText(fields.ethiopian_date) ||
    trimText(fields.display_date_english) ||
    // Optional legacy / API-extra label via index signature.
    trimText(fields['ethiopian_label'])

  const summary =
    trimText(fields.summary) ||
    trimText(fields.message) ||
    trimText(fields.fasting_status) ||
    trimText(fields.active_fast) ||
    trimText(fields.fast_name) ||
    trimText(fields.season_name) ||
    trimText(fields.liturgical_season) ||
    trimText(fields.season)

  const commemorations = Array.isArray(fields.commemorations)
    ? fields.commemorations
    : Array.isArray(fields.results)
      ? fields.results
      : []

  return joinParts([
    title,
    summary && summary !== title ? summary : '',
    mapPreviewLines(commemorations, synaxLine, 6),
  ])
}

function bibleReferenceText(response: BibleReferenceResponse): string {
  const ref = trimText(response.reference)
  const body =
    trimText(response.text) ||
    trimText(response.text_amharic) ||
    trimText(response.text_english)
  const lines = verseLines(response.verses)
  if (lines.length) return joinParts([ref, lines.join('\n')])
  if (body) return joinParts([ref, body])
  return joinParts([ref, trimText(response.message)])
}

function bibleChapterText(response: BibleChapterResponse): string {
  const ref = trimText(response.reference)
  const lines = verseLines(response.verses)
  if (lines.length) return joinParts([ref, lines.join('\n')])
  return joinParts([ref, trimText(response.message)])
}

/** Plain text suitable for clipboard from a Search Buddy API payload. */
export function plainTextFromSearchBuddyResponse(
  response: SearchBuddyApiResponse | null | undefined,
): string {
  if (!response) return ''

  switch (response.type) {
    case 'ai':
      return trimText(response.answer) || trimText(response.message)

    case 'bible_reference':
      return bibleReferenceText(response)

    case 'bible_chapter':
      return bibleChapterText(response)

    case 'bible_search':
      return mapPreviewLines(response.results, bibleHitLine) || trimText(response.message)

    case 'hymn_search':
    case 'hymn_occasion':
      return mapPreviewLines(response.results, hymnLine) || trimText(response.message)

    case 'prayer_search':
      return mapPreviewLines(response.results, prayerLine) || trimText(response.message)

    case 'prayer_collection':
    case 'prayer_section':
      return joinParts([
        trimText(response.title_amharic) || trimText(response.title),
        mapPreviewLines(response.prayers, prayerLine),
        trimText(response.message),
      ])

    case 'synaxarium_search':
      return mapPreviewLines(response.results, synaxLine) || trimText(response.message)

    case 'synaxarium_day':
      return joinParts([
        trimText(response.title_amharic) ||
          trimText(response.title) ||
          trimText(response.display_date_english) ||
          trimText(response.display_date_amharic),
        mapPreviewLines(response.commemorations, synaxLine),
        trimText(response.message),
      ])

    case 'calendar_today':
    case 'calendar_day':
    case 'fasting_today':
    case 'fast_today':
    case 'calendar_fast':
    case 'season_today':
    case 'calendar_season':
    case 'ethiopian_date_today':
    case 'synaxarium_today':
      return calendarFieldsText(response)

    case 'calendar_search':
      return mapPreviewLines(response.results, calendarHitLine) || trimText(response.message)

    case 'liturgy_search':
    case 'teaching_search':
    case 'unknown':
      return trimText(response.message)

    default: {
      const _exhaustive: never = response
      void _exhaustive
      return ''
    }
  }
}

/** Full assistant turn text (lead + structured body) for one-tap copy. */
export function plainTextFromSearchBuddyMessage(msg: ChatMessage): string {
  if (msg.role !== 'assistant') return trimText(msg.text)
  const parts: string[] = []
  if (msg.status === 'complete' && trimText(msg.text)) parts.push(trimText(msg.text))
  const fromResponse = plainTextFromSearchBuddyResponse(msg.response)
  if (fromResponse) {
    // Avoid duplicating lead when it matches the unknown message body.
    if (!parts.length || parts[0] !== fromResponse) parts.push(fromResponse)
  }
  if (msg.status === 'error' && trimText(msg.errorText)) parts.push(trimText(msg.errorText))
  return parts.filter(Boolean).join('\n\n')
}

export async function copyTextToClipboard(text: string): Promise<boolean> {
  const value = text.trim()
  if (!value) return false
  try {
    if (typeof navigator !== 'undefined' && navigator.clipboard?.writeText) {
      await navigator.clipboard.writeText(value)
      return true
    }
  } catch {
    /* fall through */
  }
  try {
    if (typeof document === 'undefined') return false
    const area = document.createElement('textarea')
    area.value = value
    area.setAttribute('readonly', '')
    area.style.position = 'fixed'
    area.style.opacity = '0'
    area.style.pointerEvents = 'none'
    document.body.appendChild(area)
    area.select()
    const ok = document.execCommand('copy')
    document.body.removeChild(area)
    return ok
  } catch {
    return false
  }
}
