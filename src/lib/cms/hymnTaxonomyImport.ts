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
  const pageSize = 1000
  let from = 0
  const allRows: Record<string, unknown>[] = []

  while (true) {
    const to = from + pageSize - 1
    const { data, error } = await db()
      .from(table as never)
      .select(`mezmur_import_id, mezmur_slug, ${column}`)
      .range(from, to)
    if (error) {
      logOnce(table, error)
      if (isPermanentMissing(error)) missing.add(table)
      return []
    }
    const batch = (data || []) as Record<string, unknown>[]
    allRows.push(...batch)
    if (batch.length < pageSize) break
    from += pageSize
  }

  const distinctBySlug = new Map<string, Set<string>>()
  for (const row of allRows) {
    const slug = String(row[column] ?? '')
      .trim()
      .toLowerCase()
    if (!slug) continue
    const mezmurId = String(row.mezmur_import_id ?? row.mezmur_slug ?? '').trim()
    if (!distinctBySlug.has(slug)) {
      distinctBySlug.set(slug, new Set())
    }
    if (mezmurId) {
      distinctBySlug.get(slug)!.add(mezmurId)
    }
  }
  return [...distinctBySlug.entries()]
    .map(([slug, idSet]) => ({
      id: slug,
      slug,
      name: humanizeTaxonomySlug(slug),
      mezmur_count: idSet.size,
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
  mezmurImportId: string,
): Promise<string[]> {
  const importId = mezmurImportId.trim()
  if (!importId || missing.has(table)) return []
  const { data, error } = await db().from(table as never).select(column).eq('mezmur_import_id', importId)
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

export function listMezmurOccasionLinks(mezmurImportId: string): Promise<string[]> {
  return listMezmurLinks(OCCASION_LINKS, 'occasion_slug', mezmurImportId)
}

export function listMezmurCategoryLinks(mezmurImportId: string): Promise<string[]> {
  return listMezmurLinks(CATEGORY_LINKS, 'category_slug', mezmurImportId)
}

/** Replace category and occasion relationships together. The database RPC is transactional. */
export async function setMezmurClassificationLinks(
  mezmurImportId: string,
  categorySlugs: string[],
  occasionSlugs: string[],
): Promise<void> {
  const { requireCmsStaffSession } = await import('./cmsStaffAuth')
  await requireCmsStaffSession('mezmur classification links')
  const importId = mezmurImportId.trim()
  if (!importId) throw new Error('A stable Mezmur import ID is required to update classifications safely.')
  const cleanCategories = [...new Set(categorySlugs.map((value) => value.trim().toLowerCase()).filter(Boolean))]
  const cleanOccasions = [...new Set(occasionSlugs.map((value) => value.trim().toLowerCase()).filter(Boolean))]
  const { error } = await db().rpc('set_mezmur_classification_import' as never, {
    p_mezmur_import_id: importId,
    p_category_slugs: cleanCategories,
    p_occasion_slugs: cleanOccasions,
  } as never)
  if (!error) return
  const rendered = errorMessage(error)
  if (/function .*set_mezmur_classification_import|PGRST202/i.test(error.message || '')) {
    throw new Error('The UUID-safe Mezmur classification RPC is not installed. Apply migration 20261025020000_mezmur_bulk_classification.sql before editing classifications.')
  }
  throw new Error(rendered)
}
