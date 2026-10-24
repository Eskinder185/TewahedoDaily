/**
 * Temporary taxonomy derived from Mezmur import link tables.
 * Do NOT query public.mezmur_occasions / public.singers / public.mezmur.
 */
import { db, errorMessage } from './mezmurService'

export type DerivedTaxonomyItem = {
  id: string
  slug: string
  name: string
  mezmur_count: number
}

const OCCASION_LINKS = 'mezmur_occasion_links_import' as const
const CATEGORY_LINKS = 'mezmur_category_links_import' as const

const missing = new Set<string>()
const logged = new Set<string>()

function logOnce(scope: string, error: { message?: string; code?: string } | null) {
  if (!error || logged.has(scope)) return
  logged.add(scope)
  if (import.meta.env.DEV) {
    console.error(`[hymnTaxonomyImport] ${scope}`, error)
  }
}

function isPermanentMissing(error: { message?: string; code?: string } | null) {
  if (!error) return false
  return (
    error.code === 'PGRST205' ||
    error.code === '42P01' ||
    error.code === '42501' ||
    /Could not find the table|relation .* does not exist|permission denied/i.test(
      error.message || '',
    )
  )
}

export function humanizeTaxonomySlug(slug: string): string {
  return slug
    .split(/[-_]+/)
    .filter(Boolean)
    .map((part) => part.charAt(0).toUpperCase() + part.slice(1))
    .join(' ')
}

async function listDistinctSlugs(
  table: typeof OCCASION_LINKS | typeof CATEGORY_LINKS,
  column: 'occasion_slug' | 'category_slug',
): Promise<DerivedTaxonomyItem[]> {
  if (missing.has(table)) return []
  const { data, error } = await db().from(table as never).select(column)
  if (error) {
    logOnce(table, error)
    if (isPermanentMissing(error)) missing.add(table)
    return []
  }
  const tally = new Map<string, number>()
  for (const row of (data || []) as Record<string, unknown>[]) {
    const slug = String(row[column] ?? '')
      .trim()
      .toLowerCase()
    if (!slug) continue
    tally.set(slug, (tally.get(slug) || 0) + 1)
  }
  return [...tally.entries()]
    .map(([slug, mezmur_count]) => ({
      id: slug,
      slug,
      name: humanizeTaxonomySlug(slug),
      mezmur_count,
    }))
    .sort((a, b) => a.name.localeCompare(b.name, undefined, { sensitivity: 'base' }))
}

/** Unique occasions from mezmur_occasion_links_import.occasion_slug */
export async function listDerivedOccasions(): Promise<DerivedTaxonomyItem[]> {
  return listDistinctSlugs(OCCASION_LINKS, 'occasion_slug')
}

/** Unique categories from mezmur_category_links_import.category_slug */
export async function listDerivedCategories(): Promise<DerivedTaxonomyItem[]> {
  return listDistinctSlugs(CATEGORY_LINKS, 'category_slug')
}

async function listMezmurLinks(
  table: typeof OCCASION_LINKS | typeof CATEGORY_LINKS,
  column: 'occasion_slug' | 'category_slug',
  mezmurSlug: string,
): Promise<string[]> {
  const slug = mezmurSlug.trim()
  if (!slug || missing.has(table)) return []
  const { data, error } = await db().from(table as never).select(column).eq('mezmur_slug', slug)
  if (error) {
    logOnce(`${table}.list`, error)
    if (isPermanentMissing(error)) {
      missing.add(table)
      return []
    }
    throw new Error(errorMessage(error))
  }
  return [...new Set(
    ((data || []) as Record<string, unknown>[])
      .map((row) => String(row[column] ?? '').trim().toLowerCase())
      .filter(Boolean),
  )]
}

export function listMezmurOccasionLinks(mezmurSlug: string): Promise<string[]> {
  return listMezmurLinks(OCCASION_LINKS, 'occasion_slug', mezmurSlug)
}

export function listMezmurCategoryLinks(mezmurSlug: string): Promise<string[]> {
  return listMezmurLinks(CATEGORY_LINKS, 'category_slug', mezmurSlug)
}

/** Replace category and occasion relationships together. The database RPC is transactional. */
export async function setMezmurClassificationLinks(
  mezmurSlug: string,
  categorySlugs: string[],
  occasionSlugs: string[],
  previousMezmurSlug?: string | null,
): Promise<void> {
  const { requireCmsStaffSession } = await import('./cmsStaffAuth')
  await requireCmsStaffSession('mezmur classification links')
  const slug = mezmurSlug.trim()
  if (!slug) return
  const cleanCategories = [...new Set(categorySlugs.map((value) => value.trim().toLowerCase()).filter(Boolean))]
  const cleanOccasions = [...new Set(occasionSlugs.map((value) => value.trim().toLowerCase()).filter(Boolean))]
  const { error } = await db().rpc('set_mezmur_classification_import' as never, {
    p_mezmur_slug: slug,
    p_category_slugs: cleanCategories,
    p_occasion_slugs: cleanOccasions,
    p_previous_mezmur_slug: previousMezmurSlug?.trim() || null,
  } as never)
  if (!error) return

  // Compatibility fallback for local schemas where the migration has not been applied yet.
  if (!/function .*set_mezmur_classification_import|PGRST202/i.test(error.message || '')) {
    throw new Error(errorMessage(error))
  }
  for (const [table, column, values] of [
    [CATEGORY_LINKS, 'category_slug', cleanCategories],
    [OCCASION_LINKS, 'occasion_slug', cleanOccasions],
  ] as const) {
    const slugs = [...new Set([slug, previousMezmurSlug?.trim()].filter((value): value is string => Boolean(value)))]
    const removed = await db().from(table as never).delete().in('mezmur_slug', slugs)
    if (removed.error) throw new Error(errorMessage(removed.error))
    if (values.length) {
      const inserted = await db().from(table as never).insert(
        values.map((value) => ({ mezmur_slug: slug, [column]: value })) as never,
      )
      if (inserted.error) throw new Error(errorMessage(inserted.error))
    }
  }
}

/** Upsert a single occasion link for a mezmur slug (import table). */
export async function setMezmurOccasionLink(
  mezmurSlug: string,
  occasionSlug: string | null,
): Promise<void> {
  const { requireCmsStaffSession } = await import('./cmsStaffAuth')
  await requireCmsStaffSession('mezmur occasion link')
  const slug = mezmurSlug.trim()
  if (!slug) return
  if (missing.has(OCCASION_LINKS)) return

  const { error: delError } = await db()
    .from(OCCASION_LINKS as never)
    .delete()
    .eq('mezmur_slug', slug)
  if (delError) {
    logOnce(`${OCCASION_LINKS}.delete`, delError)
    if (isPermanentMissing(delError)) {
      missing.add(OCCASION_LINKS)
      return
    }
    throw new Error(errorMessage(delError))
  }

  const occasion = occasionSlug?.trim()
  if (!occasion) return

  const { error: insError } = await db()
    .from(OCCASION_LINKS as never)
    .insert({ mezmur_slug: slug, occasion_slug: occasion } as never)
  if (insError) {
    logOnce(`${OCCASION_LINKS}.insert`, insError)
    if (isPermanentMissing(insError)) {
      missing.add(OCCASION_LINKS)
      return
    }
    throw new Error(errorMessage(insError))
  }
}
