/**
 * Public + shared types/helpers for Pray educational guides.
 * Public reads are limited to published guides by RLS; authenticated staff
 * (is_staff) can also read drafts for preview.
 */
import { supabase } from '../supabase/client'
import type { ContentStatus } from '../supabase/cms.types'

export type PrayerGuideReviewStatus = 'draft' | 'needs_review' | 'reviewed'

export type PrayerGuide = {
  id: string
  slug: string
  title: string
  titleAmharic: string
  summary: string
  summaryAmharic: string
  status: ContentStatus
  sortOrder: number
  sourceTitle: string
  sourceReference: string
  reviewStatus: PrayerGuideReviewStatus
  publishedAt: string | null
  createdAt: string
  updatedAt: string
}

export type PrayerGuideContentType = 'instruction' | 'prayer' | 'article'

export type PrayerGuideSection = {
  id: string
  guideId: string
  slug: string
  title: string
  titleAmharic: string
  bodyEnglish: string
  bodyAmharic: string
  sortOrder: number
  sourceReference: string
  reviewStatus: PrayerGuideReviewStatus
  reviewNotes: string
  contentType: PrayerGuideContentType | null
  createdAt: string
  updatedAt: string
}

export type PrayerGuideWithSections = PrayerGuide & {
  sections: PrayerGuideSection[]
}

type GuideRow = {
  id: string
  slug: string
  title: string
  title_amharic: string | null
  summary: string | null
  summary_amharic: string | null
  status: ContentStatus
  sort_order: number
  source_title: string | null
  source_reference: string | null
  review_status: string
  published_at: string | null
  created_at: string
  updated_at: string
}

type SectionRow = {
  id: string
  guide_id: string
  slug: string
  title: string
  title_amharic: string | null
  body_english: string | null
  body_amharic: string | null
  sort_order: number
  source_reference: string | null
  review_status: string
  review_notes: string | null
  content_type?: string | null
  created_at: string
  updated_at: string
}

function asContentType(value?: string | null): PrayerGuideContentType | null {
  if (value === 'instruction' || value === 'prayer' || value === 'article') return value
  return null
}

function asReviewStatus(value?: string | null): PrayerGuideReviewStatus {
  if (value === 'reviewed' || value === 'draft' || value === 'needs_review') return value
  return 'needs_review'
}

export function mapGuide(row: GuideRow): PrayerGuide {
  return {
    id: row.id,
    slug: row.slug,
    title: row.title,
    titleAmharic: row.title_amharic || '',
    summary: row.summary || '',
    summaryAmharic: row.summary_amharic || '',
    status: row.status,
    sortOrder: row.sort_order,
    sourceTitle: row.source_title || '',
    sourceReference: row.source_reference || '',
    reviewStatus: asReviewStatus(row.review_status),
    publishedAt: row.published_at,
    createdAt: row.created_at,
    updatedAt: row.updated_at,
  }
}

export function mapSection(row: SectionRow): PrayerGuideSection {
  return {
    id: row.id,
    guideId: row.guide_id,
    slug: row.slug,
    title: row.title,
    titleAmharic: row.title_amharic || '',
    bodyEnglish: row.body_english || '',
    bodyAmharic: row.body_amharic || '',
    sortOrder: row.sort_order,
    sourceReference: row.source_reference || '',
    reviewStatus: asReviewStatus(row.review_status),
    reviewNotes: row.review_notes || '',
    contentType: asContentType(row.content_type),
    createdAt: row.created_at,
    updatedAt: row.updated_at,
  }
}

export function prayerGuidePath(slug: string, sectionSlug?: string): string {
  const base = `/pray/${slug}`
  return sectionSlug ? `${base}#${sectionSlug}` : base
}

/** Curated hub card when published guides are not yet visible to the public. */
export const LEARN_HOW_TO_PRAY_CARD = {
  id: 'learn-how-to-pray',
  slug: 'learn-how-to-pray',
  title: 'Learn How to Pray',
  titleAmharic: 'እንዴት መጸለይ እንደሚገባ',
  summary:
    'Build a foundation for Orthodox prayer through guided practice and teaching.',
} as const

const GUIDE_SELECT =
  'id, slug, title, title_amharic, summary, summary_amharic, status, sort_order, source_title, source_reference, review_status, published_at, created_at, updated_at'

const SECTION_SELECT_BASE =
  'id, guide_id, slug, title, title_amharic, body_english, body_amharic, sort_order, source_reference, review_status, review_notes, created_at, updated_at'

const SECTION_SELECT = `${SECTION_SELECT_BASE}, content_type`

async function fetchGuideSections(guideId: string): Promise<SectionRow[]> {
  if (!supabase) return []
  const primary = await supabase
    .from('prayer_guide_sections' as never)
    .select(SECTION_SELECT)
    .eq('guide_id', guideId)
    .order('sort_order', { ascending: true })
  if (!primary.error) return (primary.data || []) as unknown as SectionRow[]

  // content_type may not exist until FIX_PRAYER_GUIDE_CONTENT_TYPE.sql is applied.
  if (/content_type/i.test(primary.error.message)) {
    const fallback = await supabase
      .from('prayer_guide_sections' as never)
      .select(SECTION_SELECT_BASE)
      .eq('guide_id', guideId)
      .order('sort_order', { ascending: true })
    if (fallback.error) throw new Error(fallback.error.message)
    return (fallback.data || []) as unknown as SectionRow[]
  }
  throw new Error(primary.error.message)
}

/**
 * Published guides for the public Pray hub.
 * Drafts are intentionally excluded here; the hub keeps a curated fallback card.
 */
export async function listPublishedPrayerGuides(): Promise<PrayerGuide[]> {
  if (!supabase) return []
  const { data, error } = await supabase
    .from('prayer_guides' as never)
    .select(GUIDE_SELECT)
    .eq('status', 'published')
    .order('sort_order', { ascending: true })
    .order('title', { ascending: true })
  if (error) {
    if (import.meta.env.DEV) console.warn('[prayerGuides] listPublished', error.message)
    return []
  }
  return ((data || []) as unknown as GuideRow[]).map(mapGuide)
}

/**
 * Load a guide by slug with sections ordered by sort_order.
 * Does not filter status client-side: RLS returns published to the public and
 * also drafts to authenticated staff (is_staff) for admin preview.
 */
export async function getPrayerGuide(slug: string): Promise<PrayerGuideWithSections | null> {
  if (!supabase || !slug.trim()) return null
  const { data: guide, error } = await supabase
    .from('prayer_guides' as never)
    .select(GUIDE_SELECT)
    .eq('slug', slug.trim().toLowerCase())
    .maybeSingle()
  if (error) {
    if (import.meta.env.DEV) console.warn('[prayerGuides] getPrayerGuide', error.message)
    throw new Error(error.message)
  }
  if (!guide) return null

  const guideRow = guide as unknown as GuideRow
  let sections: SectionRow[]
  try {
    sections = await fetchGuideSections(guideRow.id)
  } catch (error) {
    if (import.meta.env.DEV) {
      console.warn('[prayerGuides] sections', error instanceof Error ? error.message : error)
    }
    throw error instanceof Error ? error : new Error('Unable to load guide sections.')
  }

  return {
    ...mapGuide(guideRow),
    sections: sections.map(mapSection),
  }
}

/** @deprecated Prefer getPrayerGuide — RLS already scopes public vs staff preview. */
export async function getPublishedPrayerGuide(
  slug: string,
): Promise<PrayerGuideWithSections | null> {
  try {
    const guide = await getPrayerGuide(slug)
    if (!guide) return null
    if (guide.status !== 'published') return guide
    return guide
  } catch {
    return null
  }
}

/**
 * True when slug is a prayer guide visible under current auth (published for
 * public; drafts included for staff via RLS). Used for /pray/:slug dispatch.
 */
export async function isPrayerGuideSlug(slug: string): Promise<boolean> {
  if (!supabase || !slug.trim()) return false
  const { data, error } = await supabase
    .from('prayer_guides' as never)
    .select('id')
    .eq('slug', slug.trim().toLowerCase())
    .maybeSingle()
  if (error) {
    if (import.meta.env.DEV) console.warn('[prayerGuides] isPrayerGuideSlug', error.message)
    return false
  }
  return Boolean(data)
}

/** @deprecated Prefer isPrayerGuideSlug */
export async function isPublishedPrayerGuideSlug(slug: string): Promise<boolean> {
  return isPrayerGuideSlug(slug)
}
