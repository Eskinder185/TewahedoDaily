/** Canonical admin URLs for the page-based CMS. */

export const ADMIN_PATHS = {
  hymnsMezmur: '/admin/hymns/mezmur',
  hymnsSingers: '/admin/hymns/singers',
  hymnsCategories: '/admin/hymns/categories',
  hymnsTags: '/admin/hymns/tags',
  prayCollections: '/admin/pray/collections',
  prayPrayers: '/admin/pray/prayers',
  prayLiturgy: '/admin/pray/liturgy',
  prayImages: '/admin/pray/images',
  calendarCards: '/admin/calendar/cards',
  calendarObservances: '/admin/calendar/observances',
  calendarFasts: '/admin/calendar/fasts',
  calendarSeasons: '/admin/calendar/seasons',
  calendarMonthly: '/admin/calendar/monthly',
  calendarSynaxarium: '/admin/calendar/synaxarium',
  calendarSaints: '/admin/calendar/saints',
  calendarFeasts: '/admin/calendar/feasts',
  calendarDaily: '/admin/calendar/daily',
  homeSlides: '/admin/home/slides',
  homeDaily: '/admin/home/daily',
  submissions: '/admin/submissions',
  media: '/admin/media',
} as const

export function contentAdminBase(kind: string): string {
  switch (kind) {
    case 'saints':
      return ADMIN_PATHS.calendarSaints
    case 'feasts':
      return ADMIN_PATHS.calendarFeasts
    case 'mezmur':
      return ADMIN_PATHS.hymnsMezmur
    default:
      return `/admin/${kind}`
  }
}

export function adminEditPath(type: string, id: string): string {
  return `${contentAdminBase(type)}/${id}/edit`
}

export function structureAdminBase(kind: 'prayers' | 'liturgy'): string {
  return kind === 'prayers' ? ADMIN_PATHS.prayCollections : ADMIN_PATHS.prayLiturgy
}
