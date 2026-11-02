import { exactName, normalizeZemariName } from '../mezmur/zemariMatching'
import { normalizeTransliterationKey } from '../media/mediaResolver'

export type ZemariOption = {
  id: string
  name: string
  name_amharic?: string | null
  slug?: string | null
  is_archived?: boolean
  aliases?: readonly string[]
}

const fields = (option: ZemariOption) =>
  [option.name, option.name_amharic, option.slug?.replace(/[-_]+/g, ' '), ...(option.aliases ?? [])].filter(
    (value): value is string => Boolean(value && value.trim()),
  )

/** Search text for one Zemari: exact, honorific-stripped and Latin-transliteration-folded forms of every name. */
function haystack(option: ZemariOption) {
  const values = fields(option)
  return {
    plain: values.flatMap((value) => [exactName(value), normalizeZemariName(value)]).join(' | '),
    folded: values.map((value) => normalizeTransliterationKey(value, 3)).join(' | '),
  }
}

/** True when every typed word appears in the English name, Amharic name, slug, an alias, or a transliteration variant. */
export function zemariMatchesQuery(option: ZemariOption, query: string): boolean {
  const tokens = exactName(query).split(' ').filter(Boolean)
  if (!tokens.length) return true
  const { plain, folded } = haystack(option)
  return tokens.every((token) => {
    if (plain.includes(token)) return true
    const key = normalizeTransliterationKey(token, 3)
    return Boolean(key && folded.includes(key))
  })
}

export type ZemariDuplicate = { id: string; name: string; reason: 'name' | 'amharic name' | 'alias' | 'slug' | 'similar spelling' }

/** Existing Zemaris that the proposed profile would duplicate (names, aliases, slug, honorific/spelling variants). */
export function findDuplicateZemaris(
  proposed: { name: string; name_amharic?: string | null; slug: string },
  existing: readonly ZemariOption[],
): ZemariDuplicate[] {
  const names = [proposed.name, proposed.name_amharic].filter((value): value is string => Boolean(value?.trim()))
  const exact = new Set(names.map(exactName))
  const normalized = new Set(names.map(normalizeZemariName).filter((value) => value.length >= 2))
  const folded = new Set(names.map((value) => normalizeTransliterationKey(normalizeZemariName(value), 4)).filter(Boolean))
  const found = new Map<string, ZemariDuplicate>()
  for (const option of existing) {
    const label = option.name || option.name_amharic || option.slug || option.id
    let reason: ZemariDuplicate['reason'] | null = null
    if (option.name && exact.has(exactName(option.name))) reason = 'name'
    else if (option.name_amharic && exact.has(exactName(option.name_amharic))) reason = 'amharic name'
    else if ((option.aliases ?? []).some((alias) => exact.has(exactName(alias)) || normalized.has(normalizeZemariName(alias)))) reason = 'alias'
    else if (option.slug && option.slug === proposed.slug) reason = 'slug'
    else if (
      [option.name, option.name_amharic].some((value) => value && normalized.has(normalizeZemariName(value))) ||
      [option.name, ...(option.aliases ?? [])].some((value) => {
        const key = normalizeTransliterationKey(normalizeZemariName(value), 4)
        return Boolean(key && folded.has(key))
      })
    ) reason = 'similar spelling'
    if (reason) found.set(option.id, { id: option.id, name: label, reason })
  }
  return [...found.values()]
}
