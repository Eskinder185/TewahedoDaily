import { CONFIRMED_MEZMUR_FAMILIES, type ConfirmedMezmurFamily } from '../../data/confirmedMezmurFamilies.ts'

export function confirmedAlternatesFor(slug: string, families: readonly ConfirmedMezmurFamily[] = CONFIRMED_MEZMUR_FAMILIES) {
  const family = families.find((item) => item.approved === true && item.versions.length >= 2 && item.versions.some((version) => version.slug === slug))
  return family ? family.versions.filter((version) => version.slug !== slug) : []
}

/** Collapse only confirmed families present in this result page; keep the highest-ranked original. */
export function groupConfirmedSearchResults<T extends { slug: string }>(items: T[], families: readonly ConfirmedMezmurFamily[] = CONFIRMED_MEZMUR_FAMILIES): Array<T & { confirmedVersionCount?: number }> {
  if (!families.length) return items
  const familyBySlug = new Map<string, string>()
  for (const family of families) {
    if (family.approved !== true || family.versions.length < 2) continue
    for (const version of family.versions) familyBySlug.set(version.slug, family.id)
  }
  const groupCounts = new Map<string, number>()
  for (const item of items) {
    const group = familyBySlug.get(item.slug)
    if (group) groupCounts.set(group, (groupCounts.get(group) ?? 0) + 1)
  }
  const seen = new Set<string>()
  return items.flatMap((item) => {
    const group = familyBySlug.get(item.slug)
    if (!group) return [item]
    if (seen.has(group)) return []
    seen.add(group)
    return [{ ...item, confirmedVersionCount: groupCounts.get(group) ?? 1 }]
  })
}
