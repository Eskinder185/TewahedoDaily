/**
 * Temporary taxonomy derived from Mezmur import link tables.
 * Do NOT query public.mezmur_occasions / public.singers / public.mezmur.
 */
import { db, errorMessage } from './mezmurService'
import { classificationRpcErrorMessage } from './classificationErrors'
import { CATEGORY_ENTRIES, OCCASION_ENTRIES } from '../mezmur/taxonomyAliases'

export type DerivedTaxonomyItem = {
  id: string
  slug: string
  name: string
  name_amharic?: string | null
  parent_group?: string | null
  parent_group_slug?: string | null
  mezmur_count: number
}

const OCCASION_LINKS = 'mezmur_occasion_links_import' as const
const CATEGORY_LINKS = 'mezmur_category_links_import' as const

const missing = new Set<string>()
const logged = new Set<string>()

function logOnce(scope: string, error: { message?: string; code?: string } | null) {
  if (!error || logged.has(scope)) return
  logged.add(scope)
  if (import.meta.env?.DEV) {
    console.error(`[hymnTaxonomyImport] ${scope}`, error)
  }
}

function getCategoryParent(slug: string): { name: string; slug: string } {
  switch (slug) {
    case 'jesus-christ':
    case 'cross':
    case 'salvation':
      return { name: 'Jesus Christ & Salvation', slug: 'jesus-christ-salvation' }
    case 'virgin-mary':
      return { name: 'Virgin Mary', slug: 'category-virgin-mary' }
    case 'holy-trinity':
    case 'holy-spirit':
      return { name: 'Holy Trinity & Holy Spirit', slug: 'holy-trinity-holy-spirit' }
    case 'prayer':
    case 'praise-worship':
    case 'general':
    case 'repentance':
      return { name: 'Prayer & Worship', slug: 'prayer-worship' }
    default:
      return { name: 'Angels & Saints', slug: 'category-angels-saints' }
  }
}

function getOccasionParent(slug: string): { name: string; slug: string } {
  switch (slug) {
    case 'abiy-tsom':
    case 'tsome-gehad':
    case 'tsome-nineveh':
    case 'tsome-nebiyat':
    case 'tsome-hawariat':
    case 'holy-week':
      return { name: 'Fasting Seasons', slug: 'fasting-seasons' }
    case 'wedding':
    case 'baptism':
    case 'funeral':
    case 'communion':
      return { name: 'Church Life & Sacraments', slug: 'church-life-sacraments' }
    case 'general':
      return { name: 'Anytime Mezmurs', slug: 'anytime-mezmurs' }
    default:
      return { name: 'Holidays & Feasts', slug: 'occasion-holidays-feasts' }
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

/** Unique occasions from mezmur_occasion_links_import.occasion_slug, populated with canonical taxonomy metadata */
/**
 * Category and occasion slugs that already exist in the database. A hymn can only be linked to these; the editor uses
 * this to show which canonical entries still need their database row. Returns null when it cannot be read.
 */
export async function listConfiguredTaxonomySlugs(): Promise<{ categories: Set<string>; occasions: Set<string> } | null> {
  try {
    const [categories, occasions] = await Promise.all([
      db().from('categories' as never).select('slug').limit(1000),
      db().from('mezmur_occasions' as never).select('slug').limit(1000),
    ])
    if (categories.error || occasions.error) return null
    const slugs = (rows: unknown) => new Set(((rows as Array<{ slug?: string }> | null) ?? []).map((row) => String(row.slug ?? '').trim()).filter(Boolean))
    return { categories: slugs(categories.data), occasions: slugs(occasions.data) }
  } catch {
    return null
  }
}

export async function listDerivedOccasions(): Promise<DerivedTaxonomyItem[]> {
  const dbOccasions = await listDistinctSlugs(OCCASION_LINKS, 'occasion_slug')
  const countBySlug = new Map(dbOccasions.map((o) => [o.slug, o.mezmur_count]))

  const canonicalItems: DerivedTaxonomyItem[] = OCCASION_ENTRIES.map((entry) => {
    const parent = getOccasionParent(entry.slug)
    return {
      id: entry.slug,
      slug: entry.slug,
      name: entry.canonical,
      name_amharic: entry.amharic,
      parent_group: parent.name,
      parent_group_slug: parent.slug,
      mezmur_count: countBySlug.get(entry.slug) ?? 0,
    }
  })

  const canonicalSlugs = new Set(OCCASION_ENTRIES.map((e) => e.slug))
  const extraItems: DerivedTaxonomyItem[] = dbOccasions
    .filter((o) => !canonicalSlugs.has(o.slug))
    .map((o) => {
      const parent = getOccasionParent(o.slug)
      return {
        ...o,
        name_amharic: null,
        parent_group: parent.name,
        parent_group_slug: parent.slug,
      }
    })

  return [...canonicalItems, ...extraItems]
}

/** Unique categories from mezmur_category_links_import.category_slug, populated with canonical taxonomy metadata */
export async function listDerivedCategories(): Promise<DerivedTaxonomyItem[]> {
  const dbCategories = await listDistinctSlugs(CATEGORY_LINKS, 'category_slug')
  const countBySlug = new Map(dbCategories.map((c) => [c.slug, c.mezmur_count]))

  const canonicalItems: DerivedTaxonomyItem[] = CATEGORY_ENTRIES.map((entry) => {
    const parent = getCategoryParent(entry.slug)
    return {
      id: entry.slug,
      slug: entry.slug,
      name: entry.canonical,
      name_amharic: entry.amharic,
      parent_group: parent.name,
      parent_group_slug: parent.slug,
      mezmur_count: countBySlug.get(entry.slug) ?? 0,
    }
  })

  const canonicalSlugs = new Set(CATEGORY_ENTRIES.map((e) => e.slug))
  const extraItems: DerivedTaxonomyItem[] = dbCategories
    .filter((c) => !canonicalSlugs.has(c.slug))
    .map((c) => {
      const parent = getCategoryParent(c.slug)
      return {
        ...c,
        name_amharic: null,
        parent_group: parent.name,
        parent_group_slug: parent.slug,
      }
    })

  return [...canonicalItems, ...extraItems]
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
  throw new Error(classificationRpcErrorMessage(error))
}
