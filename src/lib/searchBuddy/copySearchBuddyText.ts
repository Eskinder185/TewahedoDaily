import type { ChatMessage } from '../search/chatTypes.ts'
import type { SearchBuddyApiResponse } from './apiTypes.ts'

function trimText(value: unknown): string {
  return typeof value === 'string' ? value.trim() : ''
}

function verseLines(response: SearchBuddyApiResponse): string[] {
  const verses = Array.isArray(response.verses) ? response.verses : []
  const lines: string[] = []
  for (const row of verses) {
    if (!row || typeof row !== 'object') continue
    const rec = row as Record<string, unknown>
    const num = rec.verse ?? rec.verse_number ?? rec.number
    const body =
      trimText(rec.text) ||
      trimText(rec.text_amharic) ||
      trimText(rec.text_english) ||
      trimText(rec.content)
    if (!body) continue
    lines.push(num != null && String(num).trim() ? `${String(num).trim()}. ${body}` : body)
  }
  return lines
}

/** Plain text suitable for clipboard from a Search Buddy API payload. */
export function plainTextFromSearchBuddyResponse(
  response: SearchBuddyApiResponse | null | undefined,
): string {
  if (!response) return ''

  switch (response.type) {
    case 'ai': {
      return trimText(response.answer) || trimText(response.message)
    }
    case 'bible_reference':
    case 'bible_chapter': {
      const parts: string[] = []
      const ref = trimText(response.reference)
      if (ref) parts.push(ref)
      const body =
        trimText(response.text) ||
        trimText(response.text_amharic) ||
        trimText(response.text_english)
      const lines = verseLines(response)
      if (lines.length) parts.push(lines.join('\n'))
      else if (body) parts.push(body)
      return parts.join('\n\n')
    }
    case 'unknown':
      return trimText(response.message)
    default: {
      const parts: string[] = []
      const title =
        trimText(response.title) ||
        trimText(response.primary_observance) ||
        trimText(response.ethiopian_label) ||
        trimText(response.ethiopian_date_english)
      const summary =
        trimText(response.summary) ||
        trimText(response.message) ||
        trimText(response.fasting_status) ||
        trimText(response.active_fast)
      if (title) parts.push(title)
      if (summary && summary !== title) parts.push(summary)
      return parts.join('\n\n')
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
