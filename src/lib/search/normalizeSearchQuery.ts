/**
 * Shared text normalization for Search Buddy + Bible page (typed and voice).
 * Does not invent religious content or change backend resolver rules.
 */
import { parseBibleReference } from '../bible/parseBibleReference.ts'
import {
  containsEthiopic,
  normalizeAmharicSearchText,
} from '../searchBuddy/amharicText.ts'

/** Collapse whitespace; strip trailing Latin ASR punctuation. */
export function normalizeSharedSearchQuery(raw: string): string {
  const collapsed = (raw || '').replace(/\s+/g, ' ').trim()
  if (!collapsed) return ''
  if (containsEthiopic(collapsed)) {
    return normalizeAmharicSearchText(collapsed)
  }
  return collapsed.replace(/[?!.,;:…]+$/g, '').replace(/\s+/g, ' ').trim()
}

/**
 * Canonical chat message for Bible-shaped queries.
 * Frontend-only: strips leading "Open/Show me/…" so POST /api/chat receives
 * the same book/chapter/verse shape Search Buddy's backend already resolves
 * (e.g. "Open John 3:16" → "John 3:16"). Does not modify the FastAPI resolver.
 */
export function prepareSearchBuddyMessage(raw: string): string {
  const normalized = normalizeSharedSearchQuery(raw)
  if (!normalized) return ''
  if (containsEthiopic(normalized)) return normalized

  const parsed = parseBibleReference(normalized)
  if (parsed.isReference && parsed.bookQuery && parsed.chapter != null) {
    let out = `${parsed.bookQuery} ${parsed.chapter}`
    if (parsed.verseStart != null) {
      out += `:${parsed.verseStart}`
      if (parsed.verseEnd != null && parsed.verseEnd !== parsed.verseStart) {
        out += `-${parsed.verseEnd}`
      }
    }
    return out
  }
  return normalized
}

export function formatCanonicalBibleReference(raw: string): string | null {
  const prepared = prepareSearchBuddyMessage(raw)
  const parsed = parseBibleReference(prepared)
  if (!parsed.isReference || !parsed.bookQuery || parsed.chapter == null) return null
  let out = `${parsed.bookQuery} ${parsed.chapter}`
  if (parsed.verseStart != null) {
    out += `:${parsed.verseStart}`
    if (parsed.verseEnd != null && parsed.verseEnd !== parsed.verseStart) {
      out += `-${parsed.verseEnd}`
    }
  }
  return out
}
