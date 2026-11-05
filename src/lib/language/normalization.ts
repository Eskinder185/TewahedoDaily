/** Search-only normalization. Never persist this value in place of source text. */
export type OrthographyOptions = {
  /** Common Ethiopic spellings with the same pronunciation. Enabled by default. */
  foldEthiopicVariants?: boolean
  /** Latin diacritics and the conservative ph/f, ck/k, doubled-letter conventions. */
  foldLatinVariants?: boolean
}

const ETHIOPIC_ROWS: readonly [number, number][] = [
  [0x1210, 0x1200], [0x1280, 0x1200], // ሐ/ኀ → ሀ
  [0x1220, 0x1230], // ሠ → ሰ
  [0x1340, 0x1338], // ፀ → ጸ
  [0x12d0, 0x12a0], // ዐ → አ
]

const variantMap = new Map<string, string>()
for (const [from, to] of ETHIOPIC_ROWS) {
  for (let order = 0; order < 7; order += 1) {
    variantMap.set(String.fromCodePoint(from + order), String.fromCodePoint(to + order))
  }
}

const WORD = /[\p{L}\p{N}][\p{L}\p{N}\p{M}]*(?:['’ʼ][\p{L}\p{N}\p{M}]+)*/gu
export type NormalizedSpan = { value: string; start: number; end: number }

export function normalizeWord(value: string, options: OrthographyOptions = {}): string {
  const latin = options.foldLatinVariants !== false
  const ethiopic = options.foldEthiopicVariants !== false
  let word = value.normalize('NFKC').toLowerCase()
  if (latin) word = word.normalize('NFD').replace(/\p{M}/gu, '')
  word = word.replace(/['’ʼʾʿ`´]/gu, '')
  if (ethiopic) word = [...word].map((char) => variantMap.get(char) ?? char).join('')
  if (latin && !/[\u1200-\u139f\u2d80-\u2ddf\uab00-\uab2f]/u.test(word)) {
    word = word.replace(/ph/g, 'f').replace(/ck/g, 'k').replace(/([a-z])\1+/g, '$1')
  }
  return word
}

/** UTF-16 offsets remain valid for slicing the original JS string, including mixed scripts. */
export function normalizedSpans(text: string, options: OrthographyOptions = {}): NormalizedSpan[] {
  return [...text.matchAll(WORD)].map((match) => ({
    value: normalizeWord(match[0], options),
    start: match.index ?? 0,
    end: (match.index ?? 0) + match[0].length,
  }))
}

export function normalizeForSearch(text: string, options: OrthographyOptions = {}): string {
  return normalizedSpans(text, options).map((span) => span.value).filter(Boolean).join(' ')
}
