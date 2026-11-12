/**
 * Ethiopic (Geʽez) numerals for search and Bible references. Pure functions, search-representation only:
 * stored Scripture and hymn text are never rewritten with these helpers.
 *
 * The Ethiopic system is additive with multiplicative markers: ፩–፱ are 1–9, ፲–፺ are 10–90, ፻ is 100 and ፼ is
 * 10,000. ፻ and ፼ multiply the value written before them (a bare ፻ is 100). There is no zero, so `0` stays Arabic.
 */
const ONES = '፩፪፫፬፭፮፯፰፱' // U+1369–1371
const TENS = '፲፳፴፵፶፷፸፹፺' // U+1372–137A
const HUNDRED = '፻' // U+137B
const TEN_THOUSAND = '፼' // U+137C
const NUMERAL_RUN = /[፩-፼]+/gu

export const isEthiopicNumeral = (char: string) => /^[፩-፼]$/u.test(char)

/** Value of one run of Ethiopic numeral characters, or null when it is not a well-formed number (≤ 99,999,999). */
export function parseEthiopicNumeral(run: string): number | null {
  if (!run || /[^፩-፼]/u.test(run)) return null
  let total = 0
  let current = 0
  let lastWasMultiplier = false
  for (const char of run) {
    const one = ONES.indexOf(char)
    const ten = TENS.indexOf(char)
    if (one >= 0) { current += one + 1; lastWasMultiplier = false }
    else if (ten >= 0) { current += (ten + 1) * 10; lastWasMultiplier = false }
    else if (char === HUNDRED) { current = (current || 1) * 100; total += current; current = 0; lastWasMultiplier = true }
    else if (char === TEN_THOUSAND) { total = (total + current || 1) * 10000; current = 0; lastWasMultiplier = true }
    else return null
  }
  void lastWasMultiplier
  const value = total + current
  return value > 0 && value <= 99_999_999 ? value : null
}

/** `ዮሐንስ ፫፥፲፮` → `ዮሐንስ 3፥16`. Malformed runs are left untouched so nothing is silently invented. */
export function ethiopicNumeralsToDigits(text: string): string {
  return text.replace(NUMERAL_RUN, (run) => { const value = parseEthiopicNumeral(run); return value === null ? run : String(value) })
}

/** Arabic → Ethiopic, for display and tests (1–9999). */
export function toEthiopicNumeral(value: number): string {
  if (!Number.isInteger(value) || value < 1 || value > 9999) throw new RangeError('Ethiopic numerals here cover 1–9999')
  const hundreds = Math.floor(value / 100)
  const rest = value % 100
  let out = ''
  if (hundreds) out += (hundreds > 1 ? toEthiopicNumeral(hundreds) : '') + HUNDRED
  if (Math.floor(rest / 10)) out += TENS[Math.floor(rest / 10) - 1]
  if (rest % 10) out += ONES[(rest % 10) - 1]
  return out
}

/** Ethiopic punctuation used inside references: ፥ (colon) between numbers becomes `:`; ፡ (word space) becomes a space. */
export function normalizeEthiopicReferencePunctuation(text: string): string {
  return text
    .replace(/(\d)\s*[፥]\s*(\d)/g, '$1:$2')
    .replace(/፡/g, ' ')
    .replace(/[።፣፤፦፧]+/g, ' ')
}
