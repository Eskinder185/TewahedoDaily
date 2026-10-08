/** Ethiopic Unicode block (includes Amharic). */
const ETHIOPIC_RE = /[\u1200-\u137F\u1380-\u139F\u2D80-\u2DDF\uAB00-\uAB2F]/

/** Terminal / decorative punctuation commonly returned by ASR. */
const AMHARIC_PUNCT_RE = /[\u1362\u1363\u1364\u1365\u1366\u1367\u061F?!.,;:\u2026]+/g

export function containsEthiopic(text: string): boolean {
  return ETHIOPIC_RE.test(text)
}

/**
 * Normalize Amharic search text for structured retrieval.
 * Trims whitespace and strips terminal punctuation; does not transliterate.
 */
export function normalizeAmharicSearchText(text: string): string {
  return text
    .replace(AMHARIC_PUNCT_RE, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}
