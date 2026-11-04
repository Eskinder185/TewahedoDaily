import type { BuiltInItem } from '../../../lib/play/staticContent'

export type StudioView = 'library' | 'settings' | 'coverage' | 'campaign'
export const STUDIO_VIEWS: Array<{ id: StudioView; en: string; am: string }> = [
  { id: 'library', en: 'Library', am: 'ቤተ-መጻሕፍት' },
  { id: 'settings', en: 'Game settings', am: 'የጨዋታ ቅንብር' },
  { id: 'coverage', en: 'Coverage', am: 'ሽፋን' },
  { id: 'campaign', en: 'Campaign drafts', am: 'የዘመቻ ረቂቆች' },
]
export type SavedCounts = Record<string, { server: number; local: number }>
export type BuiltInFilters = { search: string; category: string; difficulty: string; language: string }

/** Search and filters applied to read-only built-in content, same controls as the saved library. */
export function matchesBuiltIn(item: BuiltInItem, filters: BuiltInFilters): boolean {
  return (filters.category === 'all' || item.category === filters.category) && (filters.difficulty === 'all' || item.difficulty === filters.difficulty)
    && (filters.language === 'all' || item.locales.some(locale => locale === filters.language))
    && (!filters.search.trim() || item.search.includes(filters.search.trim().toLocaleLowerCase()))
}
