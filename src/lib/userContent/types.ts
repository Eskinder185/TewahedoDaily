/** Guest + authenticated favorites / reading progress shared types. */

export type UserContentType =
  | 'prayer'
  | 'psalm'
  | 'liturgy'
  | 'mezmur'
  | 'calendar_card'
  | 'synaxarium'
  | 'collection'

export type FavoriteRecord = {
  id: string
  contentType: UserContentType
  contentId?: string | null
  contentSlug?: string | null
  collectionSlug?: string | null
  title?: string | null
  route?: string | null
  createdAt: string
  source: 'local' | 'remote'
}

export type ReadingProgressRecord = {
  id: string
  contentType: UserContentType
  contentId?: string | null
  contentSlug?: string | null
  collectionSlug?: string | null
  sectionSlug?: string | null
  title?: string | null
  route?: string | null
  positionPercent?: number | null
  scrollOffset?: number | null
  updatedAt: string
  source: 'local' | 'remote'
}

export type FavoriteIdentity = {
  contentType: UserContentType
  contentId?: string | null
  contentSlug?: string | null
  collectionSlug?: string | null
  title?: string | null
  route?: string | null
}

export type ProgressIdentity = FavoriteIdentity & {
  sectionSlug?: string | null
  positionPercent?: number | null
  scrollOffset?: number | null
}

export function favoriteKey(item: FavoriteIdentity): string {
  const id = item.contentId?.trim()
  if (id) return `${item.contentType}:id:${id}`
  return `${item.contentType}:slug:${item.collectionSlug || ''}:${item.contentSlug || ''}:${item.route || ''}`
}

export function progressKey(item: ProgressIdentity): string {
  const id = item.contentId?.trim()
  if (id) return `${item.contentType}:id:${id}`
  return `${item.contentType}:route:${item.route || ''}:${item.collectionSlug || ''}:${item.contentSlug || ''}`
}
