/**
 * Normalized Learn How to Pray data: collection → section → bilingual content.
 */
import { supabase } from '../supabase/client'
import seed from './prayerLearningSeed.json'

export type LearningLang = 'am' | 'en'
export type GuideLangMode = 'am' | 'en' | 'both'

export type LearningContentKind =
  | 'instruction'
  | 'prayer'
  | 'body'
  | 'reference'
  | 'timeline_item'
  | 'list_item'
  | string

export type LearningDisplayStyle =
  | 'guided_steps'
  | 'article_group'
  | 'accordion_group'
  | 'reference_group'
  | 'step_card'
  | 'prayer_block'
  | 'article'
  | 'timeline'
  | 'group_overview'
  | 'accordion'
  | 'reference_list'
  | string

export type LearningContentRow = {
  contentId: string
  sectionSlug: string
  contentOrder: number
  contentKind: LearningContentKind
  language: LearningLang
  heading: string
  body: string
  sourceReference: string
  status: string
}

export type LearningSection = {
  sectionSlug: string
  collectionSlug: string
  parentSectionSlug: string
  sortOrder: number
  titleEnglish: string
  titleAmharic: string
  summaryEnglish: string
  summaryAmharic: string
  contentType: string
  displayStyle: LearningDisplayStyle
  showInContents: boolean
  stepNumber: number | null
  isExpandable: boolean
  status: string
  content: LearningContentRow[]
  children: LearningSection[]
}

export type LearningCollection = {
  collectionSlug: string
  titleEnglish: string
  titleAmharic: string
  descriptionEnglish: string
  descriptionAmharic: string
  sortOrder: number
  displayStyle: LearningDisplayStyle
  status: string
  sections: LearningSection[]
}

export type PrayerLearningTree = {
  collections: LearningCollection[]
  guided: LearningCollection | null
  learnCollections: LearningCollection[]
  source: 'supabase' | 'seed'
}

type CollectionRow = {
  collection_slug: string
  title_english: string
  title_amharic: string | null
  description_english: string | null
  description_amharic: string | null
  sort_order: number
  display_style: string | null
  status: string
}

type SectionRow = {
  section_slug: string
  collection_slug: string
  parent_section_slug: string | null
  sort_order: number
  title_english: string
  title_amharic: string | null
  summary_english: string | null
  summary_amharic: string | null
  content_type: string | null
  display_style: string | null
  show_in_contents: boolean | null
  step_number: number | null
  is_expandable: boolean | null
  status: string
}

type ContentRow = {
  content_id: string
  section_slug: string
  content_order: number
  content_kind: string | null
  language: string
  heading: string | null
  body: string | null
  source_reference: string | null
  status: string
}

const COLLECTION_SELECT =
  'collection_slug, title_english, title_amharic, description_english, description_amharic, sort_order, display_style, status'
const SECTION_SELECT =
  'section_slug, collection_slug, parent_section_slug, sort_order, title_english, title_amharic, summary_english, summary_amharic, content_type, display_style, show_in_contents, step_number, is_expandable, status'
const CONTENT_SELECT =
  'content_id, section_slug, content_order, content_kind, language, heading, body, source_reference, status'

function mapContent(row: ContentRow): LearningContentRow {
  return {
    contentId: row.content_id,
    sectionSlug: row.section_slug,
    contentOrder: row.content_order,
    contentKind: row.content_kind || 'body',
    language: row.language === 'en' ? 'en' : 'am',
    heading: row.heading || '',
    body: row.body || '',
    sourceReference: row.source_reference || '',
    status: row.status,
  }
}

function mapSection(row: SectionRow, content: LearningContentRow[]): LearningSection {
  return {
    sectionSlug: row.section_slug,
    collectionSlug: row.collection_slug,
    parentSectionSlug: row.parent_section_slug || '',
    sortOrder: row.sort_order,
    titleEnglish: row.title_english,
    titleAmharic: row.title_amharic || '',
    summaryEnglish: row.summary_english || '',
    summaryAmharic: row.summary_amharic || '',
    contentType: row.content_type || '',
    displayStyle: row.display_style || 'article',
    showInContents: row.show_in_contents !== false,
    stepNumber: row.step_number == null ? null : Number(row.step_number),
    isExpandable: Boolean(row.is_expandable),
    status: row.status,
    content: content
      .filter((item) => item.sectionSlug === row.section_slug)
      .sort((a, b) => a.contentOrder - b.contentOrder),
    children: [],
  }
}

function buildTree(
  collectionRows: CollectionRow[],
  sectionRows: SectionRow[],
  contentRows: ContentRow[],
  source: 'supabase' | 'seed',
): PrayerLearningTree {
  const content = contentRows.map(mapContent)
  const sections = sectionRows
    .map((row) => mapSection(row, content))
    .sort((a, b) => a.sortOrder - b.sortOrder || a.sectionSlug.localeCompare(b.sectionSlug))

  const bySlug = new Map(sections.map((section) => [section.sectionSlug, section]))
  for (const section of sections) {
    section.children = []
  }
  for (const section of sections) {
    if (!section.parentSectionSlug) continue
    const parent = bySlug.get(section.parentSectionSlug)
    if (parent) parent.children.push(section)
  }
  for (const section of sections) {
    section.children.sort((a, b) => a.sortOrder - b.sortOrder)
  }

  const collections = collectionRows
    .slice()
    .sort((a, b) => a.sort_order - b.sort_order || a.collection_slug.localeCompare(b.collection_slug))
    .map((row) => {
      // Include sections whose parent lives in another collection (e.g. private-prayer
      // under kinds-of-prayer in foundations, but listed in ways-we-pray).
      const topSections = sections.filter((section) => {
        if (section.collectionSlug !== row.collection_slug) return false
        if (!section.parentSectionSlug) return true
        const parent = bySlug.get(section.parentSectionSlug)
        return !parent || parent.collectionSlug !== row.collection_slug
      })
      return {
        collectionSlug: row.collection_slug,
        titleEnglish: row.title_english,
        titleAmharic: row.title_amharic || '',
        descriptionEnglish: row.description_english || '',
        descriptionAmharic: row.description_amharic || '',
        sortOrder: row.sort_order,
        displayStyle: row.display_style || 'article_group',
        status: row.status,
        sections: topSections,
      } satisfies LearningCollection
    })

  const guided = collections.find((collection) => collection.collectionSlug === 'guided-practice') || null
  const learnCollections = collections.filter((collection) => collection.collectionSlug !== 'guided-practice')

  return { collections, guided, learnCollections, source }
}

function seedRows(): {
  collections: CollectionRow[]
  sections: SectionRow[]
  content: ContentRow[]
} {
  return {
    collections: (seed.collections as CollectionRow[]).map((row) => ({ ...row })),
    sections: (seed.sections as SectionRow[]).map((row) => ({
      ...row,
      parent_section_slug: row.parent_section_slug || null,
      show_in_contents: row.show_in_contents !== false,
      step_number: row.step_number,
      is_expandable: Boolean(row.is_expandable),
    })),
    content: (seed.content as ContentRow[]).map((row) => ({ ...row })),
  }
}

async function fetchPublishedLearning(): Promise<{
  collections: CollectionRow[]
  sections: SectionRow[]
  content: ContentRow[]
} | null> {
  if (!supabase) return null
  const [collectionsRes, sectionsRes, contentRes] = await Promise.all([
    supabase
      .from('prayer_learning_collections' as never)
      .select(COLLECTION_SELECT)
      .eq('status', 'published')
      .order('sort_order', { ascending: true }),
    supabase
      .from('prayer_learning_sections' as never)
      .select(SECTION_SELECT)
      .eq('status', 'published')
      .order('sort_order', { ascending: true }),
    supabase
      .from('prayer_learning_content' as never)
      .select(CONTENT_SELECT)
      .eq('status', 'published')
      .order('content_order', { ascending: true }),
  ])

  if (collectionsRes.error || sectionsRes.error || contentRes.error) {
    if (import.meta.env.DEV) {
      console.warn('[prayerLearning] fetch', {
        collections: collectionsRes.error?.message,
        sections: sectionsRes.error?.message,
        content: contentRes.error?.message,
      })
    }
    return null
  }

  const collections = (collectionsRes.data || []) as unknown as CollectionRow[]
  if (collections.length === 0) return null

  return {
    collections,
    sections: (sectionsRes.data || []) as unknown as SectionRow[],
    content: (contentRes.data || []) as unknown as ContentRow[],
  }
}

/** Prefer published Supabase rows; fall back to bundled seed when empty/unavailable. */
export async function loadPrayerLearningTree(): Promise<PrayerLearningTree> {
  const remote = await fetchPublishedLearning()
  if (remote) return buildTree(remote.collections, remote.sections, remote.content, 'supabase')
  const local = seedRows()
  return buildTree(local.collections, local.sections, local.content, 'seed')
}

export function guidedSteps(collection: LearningCollection | null): LearningSection[] {
  if (!collection) return []
  const flat: LearningSection[] = []
  for (const section of collection.sections) {
    flat.push(section)
    for (const child of section.children) flat.push(child)
  }
  return flat
    .filter((section) => section.stepNumber != null)
    .sort((a, b) => (a.stepNumber || 0) - (b.stepNumber || 0))
}

export function contentForLang(section: LearningSection, lang: GuideLangMode): LearningContentRow[] {
  const ordered = [...section.content].sort((a, b) => a.contentOrder - b.contentOrder)
  if (lang === 'am') return ordered.filter((row) => row.language === 'am')
  if (lang === 'en') return ordered.filter((row) => row.language === 'en')
  const am = ordered.filter((row) => row.language === 'am')
  const en = ordered.filter((row) => row.language === 'en')
  return [...am, ...en]
}

export function isPrayerSection(section: LearningSection): boolean {
  return section.displayStyle === 'prayer_block' || section.contentType === 'prayer'
}

export function timelineItems(section: LearningSection, lang: GuideLangMode): LearningContentRow[] {
  return contentForLang(section, lang).filter((row) => row.contentKind === 'timeline_item')
}

export function listItems(section: LearningSection, lang: GuideLangMode): LearningContentRow[] {
  return contentForLang(section, lang).filter((row) => row.contentKind === 'list_item')
}

export function proseItems(section: LearningSection, lang: GuideLangMode): LearningContentRow[] {
  return contentForLang(section, lang).filter(
    (row) => row.contentKind !== 'timeline_item' && row.contentKind !== 'list_item',
  )
}

export const GUIDE_LANG_STORAGE_KEY = 'td-prayer-guide-lang-v1'
export const LAST_SECTION_STORAGE_KEY = 'td-learn-how-to-pray-last-section-v1'

export function loadGuideLang(): GuideLangMode {
  if (typeof window === 'undefined') return 'am'
  try {
    const raw = window.localStorage.getItem(GUIDE_LANG_STORAGE_KEY)
    if (raw === 'am' || raw === 'en' || raw === 'both') return raw
  } catch {
    /* ignore */
  }
  return 'am'
}

export function saveGuideLang(mode: GuideLangMode) {
  if (typeof window === 'undefined') return
  try {
    window.localStorage.setItem(GUIDE_LANG_STORAGE_KEY, mode)
  } catch {
    /* ignore */
  }
}

export function loadLastSectionSlug(): string | null {
  if (typeof window === 'undefined') return null
  try {
    const raw = window.localStorage.getItem(LAST_SECTION_STORAGE_KEY)
    return raw && raw.trim() ? raw.trim() : null
  } catch {
    return null
  }
}

export function saveLastSectionSlug(slug: string) {
  if (typeof window === 'undefined' || !slug.trim()) return
  try {
    window.localStorage.setItem(LAST_SECTION_STORAGE_KEY, slug.trim())
  } catch {
    /* ignore */
  }
}

/** All Learn About Prayer sections in sort_order (parent + children, de-duplicated). */
export function orderedLearnSections(tree: PrayerLearningTree): LearningSection[] {
  const bySlug = new Map<string, LearningSection>()

  function walk(section: LearningSection) {
    if (section.stepNumber != null) return
    bySlug.set(section.sectionSlug, section)
    for (const child of section.children) walk(child)
  }

  for (const collection of tree.learnCollections) {
    for (const section of collection.sections) walk(section)
  }

  return [...bySlug.values()].sort(
    (a, b) => a.sortOrder - b.sortOrder || a.sectionSlug.localeCompare(b.sectionSlug),
  )
}

export function nextLearnSection(
  tree: PrayerLearningTree,
  currentSlug: string,
): LearningSection | null {
  const ordered = orderedLearnSections(tree)
  const index = ordered.findIndex((section) => section.sectionSlug === currentSlug)
  if (index < 0 || index >= ordered.length - 1) return null
  return ordered[index + 1]
}

export function findSectionBySlug(
  tree: PrayerLearningTree,
  slug: string,
): LearningSection | null {
  for (const collection of tree.collections) {
    for (const section of collection.sections) {
      if (section.sectionSlug === slug) return section
      for (const child of section.children) {
        if (child.sectionSlug === slug) return child
      }
    }
  }
  return null
}
