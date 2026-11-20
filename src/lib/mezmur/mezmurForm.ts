/**
 * The form of a hymn: an ordinary Mezmur or a Werb (ወረብ, the call-and-response chant sung in short verses).
 * The database holds more than one spelling (`werb` from the editor, `wereb` from older imports), so every reader
 * goes through this one normalizer instead of comparing strings.
 */
export type MezmurForm = 'mezmur' | 'werb'
export type MezmurFormFilter = MezmurForm | 'all'

const WERB_SPELLINGS = new Set(['werb', 'wereb', 'werab', 'werub', 'ወረብ'])

export function normalizeMezmurForm(value: unknown): MezmurForm {
  const key = typeof value === 'string' ? value.trim().toLowerCase() : ''
  return WERB_SPELLINGS.has(key) ? 'werb' : 'mezmur'
}

export const isWerb = (value: unknown): boolean => normalizeMezmurForm(value) === 'werb'

export function isMezmurFormFilter(value: unknown): value is MezmurFormFilter {
  return value === 'all' || value === 'mezmur' || value === 'werb'
}

export function matchesMezmurForm(value: unknown, form?: MezmurFormFilter): boolean {
  if (!form || form === 'all') return true
  return normalizeMezmurForm(value) === form
}

export function mezmurFormAliases(form: MezmurForm): string[] {
  return form === 'werb' ? [...WERB_SPELLINGS] : ['mezmur']
}
