import catalogJson from '../data/calendarImageCatalog.json'

export type CalendarImageCatalogRow = {
  fileName: string
  title: string
  category: string
  summary: string
  bestUse?: string
}

const rows = catalogJson as CalendarImageCatalogRow[]

const byFileNameLower = new Map<string, CalendarImageCatalogRow>()
for (const row of rows) {
  byFileNameLower.set(row.fileName.toLowerCase(), row)
}

/**
 * Manifest / disk names that differ from catalog `fileName` keys.
 * Values must match a `fileName` in `calendarImageCatalog.json`.
 */
const FILE_NAME_ALIASES: Record<string, string> = {
  'abuneteklehaymanot.png': 'MonthlyAbuneTeklehaymanot.png',
  'saintgabrielcommemoration.png': 'MonthlySaintGabrielCommemoration.png',
  'saintmarycommemoration.png': 'MonthlySaintMaryCommemoration.png',
  'saintmichaelcommemoration.png': 'MonthlySaintMichaelCommemoration.png',
}

export function fileNameFromImageUrl(imageUrl: string): string {
  const noQuery = imageUrl.split('?')[0] ?? ''
  const slash = noQuery.lastIndexOf('/')
  const raw = slash >= 0 ? noQuery.slice(slash + 1) : noQuery
  try {
    return decodeURIComponent(raw)
  } catch {
    return raw
  }
}

function formatCategoryLabel(category: string): string {
  if (!category.trim()) return 'General'
  return category
    .split('-')
    .filter(Boolean)
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1).toLowerCase())
    .join(' ')
}

function titleFromFileStem(fileName: string): string {
  const base = fileName.replace(/\.(png|jpg|jpeg|webp)$/i, '')
  return base.replace(/([a-z])([A-Z])/g, '$1 $2').replace(/[-_]/g, ' ')
}

export type CalendarImageCatalogMeta = {
  title: string
  category: string
  categoryLabel: string
  summary: string
}

export function getCalendarImageCatalogMeta(imageUrl: string): CalendarImageCatalogMeta {
  const file = fileNameFromImageUrl(imageUrl)
  const key = file.toLowerCase()
  const aliasTarget = FILE_NAME_ALIASES[key]
  const row =
    byFileNameLower.get(key) ??
    (aliasTarget ? byFileNameLower.get(aliasTarget.toLowerCase()) : undefined)

  if (row) {
    return {
      title: row.title,
      category: row.category,
      categoryLabel: formatCategoryLabel(row.category),
      summary: row.summary,
    }
  }

  return {
    title: titleFromFileStem(file),
    category: 'general',
    categoryLabel: 'General',
    summary: 'Sacred calendar artwork supporting this observance.',
  }
}
