/**
 * The form of a hymn: an ordinary Mezmur or a Werb (ወረብ, the call-and-response chant sung in short verses).
 * The database holds more than one spelling (`werb` from the editor, `wereb` from older imports), so every reader
 * goes through this one normalizer instead of comparing strings.
 */
export type MezmurForm = 'mezmur' | 'werb'

const WERB_SPELLINGS = new Set(['werb', 'wereb', 'werab', 'werub', 'ወረብ'])

export function normalizeMezmurForm(value: unknown): MezmurForm {
  const key = typeof value === 'string' ? value.trim().toLowerCase() : ''
  return WERB_SPELLINGS.has(key) ? 'werb' : 'mezmur'
}

export const isWerb = (value: unknown): boolean => normalizeMezmurForm(value) === 'werb'
