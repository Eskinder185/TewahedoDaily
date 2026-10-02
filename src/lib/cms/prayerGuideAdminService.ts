/**
 * CMS service for prayer educational guides.
 */
import { db, errorMessage, slugify, statuses } from './mezmurService'
import type { ContentStatus } from '../supabase/cms.types'
import {
  mapGuide,
  mapSection,
  type PrayerGuide,
  type PrayerGuideReviewStatus,
  type PrayerGuideSection,
  type PrayerGuideWithSections,
} from '../prayers/prayerGuides'

export { errorMessage, slugify, statuses }
export type { ContentStatus, PrayerGuide, PrayerGuideReviewStatus, PrayerGuideSection }

export const GUIDE_REVIEW_STATUSES: PrayerGuideReviewStatus[] = [
  'draft',
  'needs_review',
  'reviewed',
]

const GUIDE_SELECT =
  'id, slug, title, title_amharic, summary, summary_amharic, status, sort_order, source_title, source_reference, review_status, published_at, created_at, updated_at'

const SECTION_SELECT =
  'id, guide_id, slug, title, title_amharic, body_english, body_amharic, sort_order, source_reference, review_status, review_notes, created_at, updated_at'

export type PrayerGuideListItem = PrayerGuide & {
  sectionCount: number
  reviewIssueCount: number
}

export type PrayerGuideInput = {
  slug: string
  title: string
  title_amharic: string
  summary: string
  summary_amharic: string
  status: ContentStatus
  sort_order: number
  source_title: string
  source_reference: string
  review_status: PrayerGuideReviewStatus
}

export type PrayerGuideSectionInput = {
  slug: string
  title: string
  title_amharic: string
  body_english: string
  body_amharic: string
  sort_order: number
  source_reference: string
  review_status: PrayerGuideReviewStatus
  review_notes: string
}

export function emptyGuideInput(): PrayerGuideInput {
  return {
    slug: '',
    title: '',
    title_amharic: '',
    summary: '',
    summary_amharic: '',
    status: 'draft',
    sort_order: 0,
    source_title: '',
    source_reference: '',
    review_status: 'draft',
  }
}

export function emptySectionInput(sortOrder = 0): PrayerGuideSectionInput {
  return {
    slug: '',
    title: '',
    title_amharic: '',
    body_english: '',
    body_amharic: '',
    sort_order: sortOrder,
    source_reference: '',
    review_status: 'needs_review',
    review_notes: '',
  }
}

export function guideToInput(guide: PrayerGuide): PrayerGuideInput {
  return {
    slug: guide.slug,
    title: guide.title,
    title_amharic: guide.titleAmharic,
    summary: guide.summary,
    summary_amharic: guide.summaryAmharic,
    status: guide.status,
    sort_order: guide.sortOrder,
    source_title: guide.sourceTitle,
    source_reference: guide.sourceReference,
    review_status: guide.reviewStatus,
  }
}

export function sectionToInput(section: PrayerGuideSection): PrayerGuideSectionInput {
  return {
    slug: section.slug,
    title: section.title,
    title_amharic: section.titleAmharic,
    body_english: section.bodyEnglish,
    body_amharic: section.bodyAmharic,
    sort_order: section.sortOrder,
    source_reference: section.sourceReference,
    review_status: section.reviewStatus,
    review_notes: section.reviewNotes,
  }
}

type GuideRow = Parameters<typeof mapGuide>[0]
type SectionRow = Parameters<typeof mapSection>[0]

export async function listPrayerGuidesAdmin(): Promise<PrayerGuideListItem[]> {
  const { data: guides, error } = await db()
    .from('prayer_guides' as never)
    .select(GUIDE_SELECT)
    .order('sort_order', { ascending: true })
    .order('updated_at', { ascending: false })
  if (error) throw error

  const { data: sections, error: sectionError } = await db()
    .from('prayer_guide_sections' as never)
    .select('guide_id, review_status')
  if (sectionError) throw sectionError

  const byGuide = new Map<string, { count: number; issues: number }>()
  for (const row of (sections || []) as Array<{ guide_id: string; review_status: string }>) {
    const current = byGuide.get(row.guide_id) || { count: 0, issues: 0 }
    current.count += 1
    if (row.review_status === 'needs_review') current.issues += 1
    byGuide.set(row.guide_id, current)
  }

  return ((guides || []) as GuideRow[]).map((row) => {
    const guide = mapGuide(row)
    const stats = byGuide.get(guide.id) || { count: 0, issues: 0 }
    return {
      ...guide,
      sectionCount: stats.count,
      reviewIssueCount: stats.issues,
    }
  })
}

export async function getPrayerGuideAdmin(idOrSlug: string): Promise<PrayerGuideWithSections | null> {
  const isUuid =
    /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i.test(idOrSlug)
  let query = db().from('prayer_guides' as never).select(GUIDE_SELECT)
  query = isUuid ? query.eq('id', idOrSlug) : query.eq('slug', idOrSlug)
  const { data: guide, error } = await query.maybeSingle()
  if (error) throw error
  if (!guide) return null

  const guideRow = guide as GuideRow
  const { data: sections, error: sectionError } = await db()
    .from('prayer_guide_sections' as never)
    .select(SECTION_SELECT)
    .eq('guide_id', guideRow.id)
    .order('sort_order', { ascending: true })
    .order('slug', { ascending: true })
  if (sectionError) throw sectionError

  return {
    ...mapGuide(guideRow),
    sections: ((sections || []) as SectionRow[]).map(mapSection),
  }
}

export async function savePrayerGuide(
  id: string | null,
  input: PrayerGuideInput,
): Promise<PrayerGuide> {
  const slug = (input.slug || slugify(input.title)).trim().toLowerCase()
  if (!slug) throw new Error('Slug is required.')
  if (!input.title.trim()) throw new Error('Title is required.')

  const payload: Record<string, unknown> = {
    slug,
    title: input.title.trim(),
    title_amharic: input.title_amharic.trim() || null,
    summary: input.summary.trim() || null,
    summary_amharic: input.summary_amharic.trim() || null,
    status: input.status,
    sort_order: Number(input.sort_order) || 0,
    source_title: input.source_title.trim() || null,
    source_reference: input.source_reference.trim() || null,
    review_status: input.review_status,
    published_at: input.status === 'published' ? new Date().toISOString() : null,
    updated_at: new Date().toISOString(),
  }

  if (id) {
    if (input.status === 'published') {
      const { data: current } = await db()
        .from('prayer_guides' as never)
        .select('published_at, status')
        .eq('id', id)
        .maybeSingle()
      const row = current as { published_at: string | null; status: string } | null
      if (row?.status === 'published') {
        payload.published_at = row.published_at
      }
    }
    const { data, error } = await db()
      .from('prayer_guides' as never)
      .update(payload as never)
      .eq('id', id)
      .select(GUIDE_SELECT)
      .single()
    if (error) throw error
    return mapGuide(data as GuideRow)
  }

  const { data, error } = await db()
    .from('prayer_guides' as never)
    .insert(payload as never)
    .select(GUIDE_SELECT)
    .single()
  if (error) throw error
  return mapGuide(data as GuideRow)
}

export async function savePrayerGuideSection(
  guideId: string,
  sectionId: string | null,
  input: PrayerGuideSectionInput,
): Promise<PrayerGuideSection> {
  const slug = (input.slug || slugify(input.title)).trim().toLowerCase()
  if (!slug) throw new Error('Section slug is required.')
  if (!input.title.trim()) throw new Error('Section title is required.')

  const payload = {
    guide_id: guideId,
    slug,
    title: input.title.trim(),
    title_amharic: input.title_amharic.trim() || null,
    body_english: input.body_english.trim() || null,
    body_amharic: input.body_amharic.trim() || null,
    sort_order: Number(input.sort_order) || 0,
    source_reference: input.source_reference.trim() || null,
    review_status: input.review_status,
    review_notes: input.review_notes.trim() || null,
    updated_at: new Date().toISOString(),
  }

  if (sectionId) {
    const { data, error } = await db()
      .from('prayer_guide_sections' as never)
      .update(payload as never)
      .eq('id', sectionId)
      .select(SECTION_SELECT)
      .single()
    if (error) throw error
    return mapSection(data as SectionRow)
  }

  const { data, error } = await db()
    .from('prayer_guide_sections' as never)
    .insert(payload as never)
    .select(SECTION_SELECT)
    .single()
  if (error) throw error
  return mapSection(data as SectionRow)
}

export async function deletePrayerGuideSection(sectionId: string): Promise<void> {
  const { error } = await db()
    .from('prayer_guide_sections' as never)
    .delete()
    .eq('id', sectionId)
  if (error) throw error
}

export async function countPrayerGuides(): Promise<number> {
  const { count, error } = await db()
    .from('prayer_guides' as never)
    .select('id', { count: 'exact', head: true })
  if (error) throw error
  return count || 0
}

type SeedBundle = {
  guides: Array<{
    slug: string
    title: string
    title_amharic: string
    summary: string
    summary_amharic: string
    status: ContentStatus
    sort_order: number
    source_title: string
    source_reference: string
    review_status: PrayerGuideReviewStatus
    sections: PrayerGuideSectionInput[]
  }>
}

/** Upsert bundled CSV seed (staff session required by RLS). */
export async function importBundledPrayerGuidesSeed(): Promise<{
  guides: number
  sections: number
}> {
  const { default: seed } = await import('../prayers/prayerGuidesSeed.json')
  const bundle = seed as SeedBundle
  let guideCount = 0
  let sectionCount = 0

  for (const item of bundle.guides) {
    const existing = await getPrayerGuideAdmin(item.slug)
    const saved = await savePrayerGuide(existing?.id || null, {
      slug: item.slug,
      title: item.title,
      title_amharic: item.title_amharic,
      summary: item.summary,
      summary_amharic: item.summary_amharic,
      status: item.status,
      sort_order: item.sort_order,
      source_title: item.source_title,
      source_reference: item.source_reference,
      review_status: item.review_status,
    })
    guideCount += 1

    const latest = await getPrayerGuideAdmin(saved.id)
    const bySlug = new Map((latest?.sections || []).map((row) => [row.slug, row.id]))

    for (const section of item.sections) {
      await savePrayerGuideSection(saved.id, bySlug.get(section.slug) || null, {
        slug: section.slug,
        title: section.title,
        title_amharic: section.title_amharic,
        body_english: section.body_english,
        body_amharic: section.body_amharic,
        sort_order: section.sort_order,
        source_reference: section.source_reference,
        review_status: section.review_status,
        review_notes: section.review_notes,
      })
      sectionCount += 1
    }
  }

  return { guides: guideCount, sections: sectionCount }
}
