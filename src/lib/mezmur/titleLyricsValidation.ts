export type MezmurTitleLyricsValues = {
  title_amharic?: string | null
  transliteration_title?: string | null
  lyrics_amharic?: string | null
  lyrics_transliteration?: string | null
  import_id?: string | null
}

export type MezmurFieldIssue = {
  field: keyof MezmurTitleLyricsValues
  message: string
  severity: 'error' | 'warning'
}

const ETHIOPIC = /[\u1200-\u137f]/u
const LATIN = /[A-Za-z]/

function text(value: string | null | undefined) {
  return value?.trim() || ''
}

function compact(value: string) {
  return value.normalize('NFKC').replace(/\s+/g, ' ').trim().toLocaleLowerCase()
}

/**
 * Flags accidental title/lyric interchange and script mismatches without
 * rewriting source text. Drafts may retain warnings; publishing can use the
 * error subset as an explicit editorial check.
 */
export function validateMezmurTitleLyrics(values: MezmurTitleLyricsValues): MezmurFieldIssue[] {
  const titleAmharic = text(values.title_amharic)
  const transliterationTitle = text(values.transliteration_title)
  const lyricsAmharic = text(values.lyrics_amharic)
  const lyricsTransliteration = text(values.lyrics_transliteration)
  const issues: MezmurFieldIssue[] = []

  if (!titleAmharic) issues.push({ field: 'title_amharic', severity: 'error', message: 'Amharic title is missing.' })
  if (!transliterationTitle) issues.push({ field: 'transliteration_title', severity: 'error', message: 'Transliterated title is missing.' })
  if (!lyricsAmharic) issues.push({ field: 'lyrics_amharic', severity: 'error', message: 'Amharic lyrics are missing.' })
  if (!lyricsTransliteration) issues.push({ field: 'lyrics_transliteration', severity: 'warning', message: 'Transliterated lyrics are missing.' })

  if (titleAmharic && !ETHIOPIC.test(titleAmharic)) {
    issues.push({ field: 'title_amharic', severity: 'error', message: 'Amharic title does not contain Ethiopic script.' })
  }
  if (transliterationTitle && ETHIOPIC.test(transliterationTitle)) {
    issues.push({ field: 'transliteration_title', severity: 'error', message: 'Transliterated title contains Ethiopic script; keep it Latin-character only.' })
  }
  if (transliterationTitle && !LATIN.test(transliterationTitle)) {
    issues.push({ field: 'transliteration_title', severity: 'warning', message: 'Transliterated title has no Latin characters; verify the source text.' })
  }
  if (lyricsAmharic && !ETHIOPIC.test(lyricsAmharic)) {
    issues.push({ field: 'lyrics_amharic', severity: 'error', message: 'Amharic lyrics do not contain Ethiopic script; fields may be swapped.' })
  }
  if (lyricsTransliteration && ETHIOPIC.test(lyricsTransliteration)) {
    issues.push({ field: 'lyrics_transliteration', severity: 'error', message: 'Transliterated lyrics contain Ethiopic script; fields may be swapped.' })
  }
  if (titleAmharic && lyricsAmharic) {
    const firstLine = lyricsAmharic.split(/\r?\n/).find((line) => line.trim()) || ''
    if (compact(titleAmharic) === compact(lyricsAmharic)) {
      issues.push({ field: 'title_amharic', severity: 'error', message: 'Amharic title duplicates the complete lyrics; fields appear swapped.' })
    } else if (compact(titleAmharic) === compact(firstLine) && lyricsAmharic.length > firstLine.length + 24) {
      issues.push({ field: 'title_amharic', severity: 'warning', message: 'Amharic title matches the first lyric line; verify it is a title rather than copied lyrics.' })
    }
  }
  if (transliterationTitle && lyricsTransliteration && compact(transliterationTitle) === compact(lyricsTransliteration)) {
    issues.push({ field: 'transliteration_title', severity: 'error', message: 'Transliterated title duplicates the complete transliterated lyrics; fields appear swapped.' })
  }
  if (values.import_id !== undefined && !text(values.import_id)) {
    issues.push({ field: 'import_id', severity: 'error', message: 'Existing Mezmur has no immutable import_id; it cannot be updated safely.' })
  }
  return issues
}

export function titleLyricsErrors(values: MezmurTitleLyricsValues) {
  return validateMezmurTitleLyrics(values).filter((issue) => issue.severity === 'error')
}
