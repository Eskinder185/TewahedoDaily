export const MEZMUR_PUBLICATION_ROLES = ['editor', 'admin', 'super_admin'] as const
export const MEZMUR_PUBLICATION_RIGHTS = [
  'owned',
  'licensed',
  'authorized_contributor',
  'public_domain',
  'display_only',
] as const

export type MezmurPublicationRights = (typeof MEZMUR_PUBLICATION_RIGHTS)[number]

export type MezmurStatus = 'draft' | 'published'

export const mezmurStatuses: MezmurStatus[] = ['draft', 'published']

export function mezmurStatusLabel(status: string | null | undefined): 'Draft' | 'Published' {
  return String(status ?? '').trim().toLowerCase() === 'published' ? 'Published' : 'Draft'
}

export function normalizeMezmurStatus(value: unknown): MezmurStatus {
  const v = String(value ?? '').trim().toLowerCase()
  if (v === 'published' || v === 'active' || v === 'true' || v === '1') return 'published'
  return 'draft'
}

export function canPublishMezmur(role: string | null | undefined): boolean {
  return MEZMUR_PUBLICATION_ROLES.includes(role as (typeof MEZMUR_PUBLICATION_ROLES)[number])
}

export function isVerifiedMezmurRights(value: string | null | undefined): boolean {
  const v = String(value ?? '').trim().toLowerCase()
  if (v === 'external_only' || v === 'restricted') return false
  return true
}

export type MezmurPublicationCheck = {
  role: string | null | undefined
  /** Rights basis currently stored on the record. */
  rightsStatus?: string | null | undefined
  rightsConfirmedAt?: string | null | undefined
  rightsConfirmedBy?: string | null | undefined
  youtubeUrl?: string | null | undefined
  sourceUrl?: string | null | undefined
  title: string | null | undefined
  slug: string | null | undefined
  lyricsAmharic?: string | null | undefined
}

/** Publication checks for staff Mezmur publication. */
export function publicationBlockReason(input: MezmurPublicationCheck): string | null {
  if (!canPublishMezmur(input.role)) {
    return 'An editor, admin, or super admin role is required to publish.'
  }
  if (!input.title?.trim() || !input.slug?.trim()) {
    return 'Title and slug are required to publish.'
  }
  const isRestricted =
    input.rightsStatus === 'restricted' || input.rightsStatus === 'external_only'
  const hasExternalDestination = Boolean(
    input.youtubeUrl?.trim() || input.sourceUrl?.trim(),
  )
  if (isRestricted && !hasExternalDestination) {
    return 'Add a YouTube or authorized source link before publishing a restricted-lyrics Mezmur.'
  }
  return null
}
