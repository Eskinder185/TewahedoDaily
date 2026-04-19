/** Split chant text into lines (preserves empty-line stanza boundaries as separate empty strings filtered). */
export function splitLyricsLines(text: string): string[] {
  return text
    .split(/\r?\n/)
    .map((l) => l.trimEnd())
    .filter((l) => l.length > 0)
}

/** Stanza chunks split on blank lines. */
export function splitLyricsStanzas(text: string): string[] {
  return text
    .split(/\n\s*\n/)
    .map((s) => s.trim())
    .filter((s) => s.length > 0)
}

export function firstLetterHint(line: string): string {
  const t = line.trim()
  if (!t) return ''
  const words = t.split(/\s+/).filter(Boolean)
  return words
    .map((w) => {
      const ch = [...w][0]
      return ch && /[A-Za-z]/.test(ch) ? `${ch}.` : '·'
    })
    .join(' ')
}
