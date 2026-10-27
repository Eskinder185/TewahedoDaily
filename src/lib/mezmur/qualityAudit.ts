export type QualityMezmur = {
  import_id?: string | null
  mezmur_id?: string | null
  slug?: string | null
  title?: string | null
  title_amharic?: string | null
  title_english?: string | null
  lyrics_amharic?: string | null
  lyrics_transliteration?: string | null
  lyrics_english?: string | null
  lyrics_geez?: string | null
  lyrics_oromo?: string | null
  youtube_url?: string | null
  singer_name?: string | null
  singer_slug?: string | null
  primary_language?: string | null
  status?: string | null
}

export type FormattingIssue = {
  field: string
  kind: 'replacement_character' | 'literal_escape' | 'html_fragment' | 'line_ending' | 'trailing_whitespace' | 'suspicious_repetition_marker' | 'control_character'
  severity: 'safe' | 'review'
  explanation: string
}

function hasNonPrintingControlCharacter(value: string) {
  return [...value].some((character) => {
    const code = character.charCodeAt(0)
    return code < 32 && code !== 9 && code !== 10 && code !== 13
  })
}

export function text(value: unknown) {
  return String(value ?? '').trim()
}

export function normalizedText(value: unknown) {
  return text(value)
    .normalize('NFKC')
    .toLocaleLowerCase('und')
    .replace(/[\u1361-\u1368\p{P}\p{S}]+/gu, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

export function normalizedLyric(value: unknown) {
  return normalizedText(value).replace(/\b(?:chorus|verse)\s*\d*\b/giu, '').replace(/\s+/g, ' ').trim()
}

export function titlePhoneticKey(value: unknown) {
  return normalizedText(value)
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[aeiouə]/g, '')
    .replace(/(sh|ch|kh|ts|dz)/g, '$1')
    .replace(/(.)\1+/g, '$1')
}

export function lyricText(row: QualityMezmur) {
  return [
    row.lyrics_amharic,
    row.lyrics_geez,
    row.lyrics_english,
    row.lyrics_oromo,
    row.lyrics_transliteration,
  ].map(text).filter(Boolean).join('\n')
}

export function recordingKey(value: unknown) {
  const raw = text(value)
  if (!raw) return ''
  try {
    const url = new URL(raw)
    if (url.hostname.endsWith('youtu.be')) return url.pathname.split('/').filter(Boolean)[0] || ''
    if (url.hostname.includes('youtube.com')) return url.searchParams.get('v') || url.pathname.match(/\/(?:embed|shorts)\/([^/?#]+)/)?.[1] || ''
  } catch {
    // Keep a normalized non-URL value as evidence rather than guessing a video ID.
  }
  return raw.toLowerCase().replace(/\/$/, '')
}

export function tokenSimilarity(left: string, right: string) {
  const a = new Set(normalizedLyric(left).split(' ').filter(Boolean))
  const b = new Set(normalizedLyric(right).split(' ').filter(Boolean))
  if (!a.size || !b.size) return 0
  let common = 0
  for (const token of a) if (b.has(token)) common++
  return common / (a.size + b.size - common)
}

export function auditFormatting(value: unknown, field: string): FormattingIssue[] {
  const raw = String(value ?? '')
  if (!raw) return []
  const issues: FormattingIssue[] = []
  if (raw.includes('\uFFFD')) issues.push({ field, kind: 'replacement_character', severity: 'review', explanation: 'Unicode replacement character; source text is corrupted and must not be guessed.' })
  if (/\\[nr]/.test(raw)) issues.push({ field, kind: 'literal_escape', severity: 'safe', explanation: 'Literal escape sequence can be converted to a real line break without changing words.' })
  if (/<\/?[a-z][^>]*>/i.test(raw)) issues.push({ field, kind: 'html_fragment', severity: 'review', explanation: 'Imported HTML fragment; preserve content and review before stripping markup.' })
  if (/\r\n?/.test(raw)) issues.push({ field, kind: 'line_ending', severity: 'safe', explanation: 'CRLF/CR line ending can be normalized to LF without changing lyrics.' })
  if (/[ \t]+$/m.test(raw)) issues.push({ field, kind: 'trailing_whitespace', severity: 'safe', explanation: 'Trailing whitespace can be trimmed without changing lyrics.' })
  if (/\/(?:2|3|4)\//.test(raw)) issues.push({ field, kind: 'suspicious_repetition_marker', severity: 'review', explanation: 'Repetition marker retained; it may be meaningful performance notation.' })
  if (hasNonPrintingControlCharacter(raw)) issues.push({ field, kind: 'control_character', severity: 'review', explanation: 'Non-printing control character requires source review.' })
  return issues
}

/** Only whitespace and line-ending changes; never removes repeated lyrics or markers. */
export function applySafeFormatting(value: unknown) {
  return String(value ?? '')
    .replace(/\\n/g, '\n')
    .replace(/\\r/g, '\n')
    .replace(/\r\n?/g, '\n')
    .split('\n')
    .map((line) => line.replace(/[ \t]+$/g, ''))
    .join('\n')
    .trim()
}
