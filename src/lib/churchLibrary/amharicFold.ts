/**
 * Amharic-aware search folding — mirrors public.church_library_fold_am in SQL.
 * Letters written interchangeably are treated as the same letter; the stored
 * text is never changed (only search keys and highlighting use this).
 */
const FROM = 'ሐሑሒሓሔሕሖሗኀኁኂኃኄኅኆኇሠሡሢሣሤሥሦሧዐዑዒዓዔዕዖፀፁፂፃፄፅፆሃኣ፥፡።፣፤፦፧፨'
const TO = 'ሀሁሂሀሄህሆሏሀሁሂሀሄህሆሏሰሱሲሳሴስሶሷአኡኢአኤእኦጸጹጺጻጼጽጾሀአ:       '

const MAP = new Map<string, string>()
{
  const f = [...FROM]
  const t = [...TO]
  f.forEach((ch, i) => MAP.set(ch, t[i]))
}

export function foldAmharic(input: string): string {
  let out = ''
  for (const ch of (input || '').toLowerCase()) out += MAP.get(ch) ?? ch
  return out.replace(/\s+/g, ' ').trim()
}

/**
 * Split `text` into parts, marking the spans that match `query` after folding.
 * Works per character, so highlighted spans always map back to the original text.
 */
export function highlightFolded(text: string, query: string): Array<{ text: string; match: boolean }> {
  const q = foldAmharic(query)
  if (q.length < 2) return [{ text, match: false }]
  const chars = [...text]
  // Fold char-by-char, keeping an index back into the original characters.
  const folded: string[] = []
  const origin: number[] = []
  let prevSpace = true
  chars.forEach((ch, i) => {
    let f = (MAP.get(ch.toLowerCase()) ?? ch.toLowerCase())
    if (/\s/.test(f)) {
      if (prevSpace) return
      f = ' '
      prevSpace = true
    } else prevSpace = false
    for (const c of f) {
      folded.push(c)
      origin.push(i)
    }
  })
  const hay = folded.join('')
  const parts: Array<{ text: string; match: boolean }> = []
  let cursor = 0
  let from = 0
  while (from <= hay.length - q.length) {
    const at = hay.indexOf(q, from)
    if (at < 0) break
    const start = origin[at]
    const end = origin[at + q.length - 1] + 1
    if (start > cursor) parts.push({ text: chars.slice(cursor, start).join(''), match: false })
    parts.push({ text: chars.slice(start, end).join(''), match: true })
    cursor = end
    from = at + q.length
  }
  if (cursor < chars.length) parts.push({ text: chars.slice(cursor).join(''), match: false })
  return parts.length ? parts : [{ text, match: false }]
}
