/**
 * Content Health — read-only Supabase audits for the CMS admin dashboard.
 * Derives issues client-side from batched fetches (no auto-rewrites of religious content).
 */
import { db } from './mezmurService'
import { getPsalmNumber } from '../prayers/psalmNumber'
import { ADMIN_PATHS } from '../../pages/admin/adminPaths'
import { isValidCalendarImagePath } from '../calendar/calendarImagePaths'
import { probeContentMediaExists } from './contentMedia'
import type {
  ContentHealthIssue,
  ContentHealthReport,
  CoverageMetric,
  DomainMetric,
  HealthDomain,
  HealthProgress,
  HealthSeverity,
} from './contentHealthTypes'

const PAGE = 500
const EXPECTED_PSALMS = 150
const ZEWTER_SLUG = 'zewter-tselot'
const ZEWTER_FIRST = 'sign-of-the-cross-opening'
const ZEWTER_LAST = 'magnificat-prayer'
const WUDASE_SLUG = 'wudase-mariam'
const WUDASE_WEEKDAYS = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday']

type ProgressFn = (progress: HealthProgress) => void

function logErr(context: string, error: unknown) {
  if (!import.meta.env.DEV) return
  if (error && typeof error === 'object') {
    const e = error as { code?: string; message?: string; details?: string; hint?: string }
    console.error(`[contentHealth] ${context}`, {
      code: e.code,
      message: e.message,
      details: e.details,
      hint: e.hint,
    })
    return
  }
  console.error(`[contentHealth] ${context}`, error)
}

function issue(
  partial: Omit<ContentHealthIssue, 'id' | 'detectedAt' | 'repairable'> & {
    repairable?: boolean
    id?: string
  },
  now: string,
): ContentHealthIssue {
  const id =
    partial.id ||
    [
      partial.domain,
      partial.issueType,
      partial.recordId || partial.recordSlug || partial.table,
      partial.title.slice(0, 40),
    ]
      .join(':')
      .replace(/\s+/g, '-')
  return {
    repairable: false,
    ...partial,
    id,
    detectedAt: now,
  }
}

function hasText(value?: string | null): boolean {
  return Boolean(value && value.trim())
}

function youtubeId(url?: string | null): string | null {
  if (!url?.trim()) return null
  try {
    const u = new URL(url.trim())
    if (!['youtube.com', 'www.youtube.com', 'm.youtube.com', 'youtu.be'].includes(u.hostname)) {
      return null
    }
    if (u.hostname === 'youtu.be') {
      const id = u.pathname.replace(/^\//, '').split('/')[0]
      return id && id.length >= 6 ? id : null
    }
    const v = u.searchParams.get('v')
    if (v && v.length >= 6) return v
    const embed = u.pathname.match(/\/embed\/([A-Za-z0-9_-]{6,})/)
    return embed?.[1] || null
  } catch {
    return null
  }
}

async function fetchAll<T extends Record<string, unknown>>(
  table: string,
  select: string,
  orderBy?: { column: string; ascending?: boolean },
): Promise<T[]> {
  const rows: T[] = []
  for (let offset = 0; ; offset += PAGE) {
    let query = db()
      .from(table as never)
      .select(select)
      .range(offset, offset + PAGE - 1)
    if (orderBy) {
      query = query.order(orderBy.column, { ascending: orderBy.ascending !== false })
    }
    const { data, error } = await query
    if (error) throw error
    const batch = (data || []) as unknown as T[]
    rows.push(...batch)
    if (batch.length < PAGE) return rows
  }
}

function countBySeverity(issues: ContentHealthIssue[], domain: HealthDomain) {
  const scoped = issues.filter((i) => i.domain === domain)
  return {
    critical: scoped.filter((i) => i.severity === 'critical').length,
    warning: scoped.filter((i) => i.severity === 'warning').length,
    review: scoped.filter((i) => i.severity === 'review').length,
    info: scoped.filter((i) => i.severity === 'info').length,
  }
}

function coverage(id: string, label: string, present: number, total: number): CoverageMetric {
  const safeTotal = Math.max(0, total)
  const pct = safeTotal === 0 ? 100 : Math.round((present / safeTotal) * 100)
  return { id, label, present, total: safeTotal, percent: pct }
}

function findDuplicateSlugs(rows: { id: string; slug?: string | null }[]): Map<string, string[]> {
  const map = new Map<string, string[]>()
  for (const row of rows) {
    const slug = (row.slug || '').trim().toLowerCase()
    if (!slug) continue
    const list = map.get(slug) || []
    list.push(row.id)
    map.set(slug, list)
  }
  for (const [slug, ids] of [...map.entries()]) {
    if (ids.length < 2) map.delete(slug)
  }
  return map
}

// —— Domain loaders & checks ——————————————————————————————————————————————

type MezmurRow = {
  id: string
  slug: string
  title: string | null
  title_amharic: string | null
  lyrics_amharic: string | null
  lyrics_english: string | null
  transliteration: string | null
  youtube_url: string | null
  audio_url: string | null
  thumbnail_url: string | null
  thumbnail_path: string | null
  image_alt: string | null
  description: string | null
  singer_id: string | null
  singer_name: string | null
  category_id: string | null
  status: string
  featured: boolean | null
}

type TagLink = { mezmur_id: string; tag_id: string }
type CategoryRow = { id: string }
type TagRow = { id: string }

async function loadImportMezmurRows(): Promise<MezmurRow[]> {
  const raw = await fetchAll<Record<string, unknown>>(
    'mezmur_data_import',
    'mezmur_id, slug, title, title_amharic, lyrics_amharic, lyrics_english, lyrics_transliteration, youtube_url, audio_url, image_path, image_alt, legacy_thumbnail_url, description, singer_id, singer_name, status, updated_at',
    { column: 'updated_at', ascending: false },
  )
  return raw.map((row) => {
    const id = String(row.mezmur_id || row.slug || '')
    const image =
      String(row.image_path || '').trim() ||
      String(row.legacy_thumbnail_url || '').trim() ||
      null
    return {
      id,
      slug: String(row.slug || ''),
      title: (row.title as string | null) || null,
      title_amharic: (row.title_amharic as string | null) || null,
      lyrics_amharic: (row.lyrics_amharic as string | null) || null,
      lyrics_english: (row.lyrics_english as string | null) || null,
      transliteration: (row.lyrics_transliteration as string | null) || null,
      youtube_url: (row.youtube_url as string | null) || null,
      audio_url: (row.audio_url as string | null) || null,
      thumbnail_url: image,
      thumbnail_path: (row.image_path as string | null) || null,
      image_alt: (row.image_alt as string | null) || null,
      description: (row.description as string | null) || null,
      singer_id: (row.singer_id as string | null) || null,
      singer_name: (row.singer_name as string | null) || null,
      category_id: null,
      status: String(row.status || ''),
      featured: false,
    }
  })
}

async function softFetchAll<T extends Record<string, unknown>>(
  table: string,
  select: string,
): Promise<T[]> {
  try {
    return await fetchAll<T>(table, select)
  } catch (cause) {
    if (import.meta.env.DEV) console.error(`[contentHealth] skip ${table}`, cause)
    return []
  }
}

type PrayerCollectionRow = {
  id: string
  slug: string
  title: string | null
  status: string
  sort_order: number
}

type PrayerSectionRow = {
  id: string
  collection_id: string
  slug: string
  title: string | null
  status: string
  sort_order: number
}

type PrayerRow = {
  id: string
  slug: string
  title: string | null
  title_amharic: string | null
  title_geez: string | null
  title_english: string | null
  text_amharic: string | null
  text_geez: string | null
  text_english: string | null
  collection_id: string | null
  section_id: string | null
  collection_slug: string | null
  section_slug: string | null
  sort_order: number
  status: string
}

type CalendarCardRow = {
  id: string
  slug: string
  title: string | null
  category: string | null
  status: string
  featured: boolean | null
  show_on_home: boolean | null
  home_featured: boolean | null
  home_sort_order: number | null
  home_start_date: string | null
  home_end_date: string | null
  ethiopian_month_number: number | null
  ethiopian_day: number | null
  is_monthly?: boolean | null
  image_path: string | null
  image_alt: string | null
  summary: string | null
  what_is_it: string | null
  why_celebrated: string | null
  important_information: string | null
  scripture_references: string | null
  fasting_notes: string | null
  season_notes: string | null
  synaxarium_day_id: string | null
  synaxarium_day_slug: string | null
  source_type: string | null
  source_id: string | null
  source_slug: string | null
}

type SynaxDayRow = {
  id: string
  slug: string
  ethiopian_month_number: number
  ethiopian_day: number
  status: string
  image_path: string | null
  image_alt: string | null
}

type SynaxCommRow = {
  id: string
  day_id: string
  day_slug: string | null
  slug: string
  title: string | null
  summary: string | null
  body_amharic: string | null
  body_english: string | null
  status: string
  image_path: string | null
  image_alt: string | null
}

type LiturgyCollectionRow = PrayerCollectionRow
type LiturgySectionRow = PrayerSectionRow
type LiturgyEntryRow = {
  id: string
  slug: string
  title: string | null
  section_id: string | null
  collection_id: string | null
  text_amharic: string | null
  text_english: string | null
  sort_order: number
  status: string
}

async function checkMezmur(now: string): Promise<{
  issues: ContentHealthIssue[]
  records: number
  coverage: CoverageMetric[]
}> {
  const [mezmur, categories, tags, tagLinks] = await Promise.all([
    loadImportMezmurRows(),
    softFetchAll<CategoryRow>('categories', 'id'),
    softFetchAll<TagRow>('tags', 'id'),
    softFetchAll<TagLink>('mezmur_tags', 'mezmur_id,tag_id'),
  ])

  const issues: ContentHealthIssue[] = []
  const categoryIds = new Set(categories.map((r) => r.id))
  const tagIds = new Set(tags.map((r) => r.id))
  const mezmurIds = new Set(mezmur.map((r) => r.id))
  // Singers derived from mezmur_data_import — do not query public.singers.

  for (const [slug, ids] of findDuplicateSlugs(mezmur)) {
    issues.push(
      issue(
        {
          severity: 'critical',
          domain: 'mezmur',
          issueType: 'duplicate_slug',
          title: `Duplicate Mezmur slug: ${slug}`,
          description: `${ids.length} Mezmur rows share slug “${slug}”.`,
          table: 'mezmur',
          recordId: ids[0],
          recordSlug: slug,
          adminRoute: `${ADMIN_PATHS.hymnsMezmur}/${ids[0]}/edit`,
          metadata: { count: ids.length },
        },
        now,
      ),
    )
  }

  let withAmharic = 0
  let withTranslit = 0
  let withImage = 0
  let withPlayback = 0

  for (const row of mezmur) {
    const published = row.status === 'published'
    const adminRoute = `${ADMIN_PATHS.hymnsMezmur}/${row.id}/edit`
    const base = {
      table: 'mezmur' as const,
      recordId: row.id,
      recordSlug: row.slug,
      adminRoute,
      domain: 'mezmur' as const,
    }

    if (!hasText(row.title)) {
      issues.push(
        issue(
          {
            ...base,
            severity: published ? 'critical' : 'warning',
            issueType: 'missing_title',
            title: 'Mezmur missing title',
            description: `Record ${row.slug || row.id} has no title.`,
          },
          now,
        ),
      )
    }
    if (!hasText(row.slug)) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'critical',
            issueType: 'missing_slug',
            title: 'Mezmur missing slug',
            description: `Mezmur ${row.id} has no slug.`,
          },
          now,
        ),
      )
    }
    if (published && !hasText(row.lyrics_amharic)) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'critical',
            issueType: 'published_no_lyrics',
            title: 'Published Mezmur has no Amharic lyrics',
            description: `“${row.title || row.slug}” is published without lyrics_amharic.`,
          },
          now,
        ),
      )
    } else if (!hasText(row.lyrics_amharic)) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'warning',
            issueType: 'missing_lyrics_amharic',
            title: 'Mezmur missing Amharic lyrics',
            description: `“${row.title || row.slug}” has no lyrics_amharic.`,
          },
          now,
        ),
      )
    } else {
      withAmharic += 1
    }

    if (hasText(row.transliteration)) withTranslit += 1
    else if (published) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'review',
            issueType: 'missing_transliteration',
            title: 'Published Mezmur missing transliteration',
            description: `“${row.title || row.slug}” has no transliteration lyrics.`,
          },
          now,
        ),
      )
    }

    if (!hasText(row.title_amharic) && published) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'warning',
            issueType: 'missing_title_amharic',
            title: 'Published Mezmur missing Amharic title',
            description: `“${row.title || row.slug}” has no title_amharic.`,
          },
          now,
        ),
      )
    }

    const hasThumb = hasText(row.thumbnail_url) || hasText(row.thumbnail_path)
    if (hasThumb) withImage += 1
    if (hasThumb && !hasText(row.image_alt)) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'warning',
            issueType: 'missing_image_alt',
            title: 'Mezmur image missing alt text',
            description: `“${row.title || row.slug}” has a thumbnail but empty image_alt.`,
            domain: 'media',
            repairable: true,
            metadata: { suggestedAlt: row.title || row.slug },
          },
          now,
        ),
      )
    }

    const yt = row.youtube_url
    if (hasText(yt) && !youtubeId(yt)) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'warning',
            issueType: 'invalid_youtube',
            title: 'Mezmur YouTube URL invalid',
            description: `“${row.title || row.slug}” has a youtube_url that does not yield a video ID.`,
            metadata: { youtube_url: yt },
          },
          now,
        ),
      )
    }

    const playable = Boolean(youtubeId(yt) || hasText(row.audio_url))
    if (playable) withPlayback += 1
    else if (published) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'review',
            issueType: 'no_playback_source',
            title: 'Published Mezmur has no playable media',
            description: `“${row.title || row.slug}” has neither a valid YouTube URL nor audio_url.`,
          },
          now,
        ),
      )
    }

    if (row.singer_id && !hasText(row.singer_name)) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'review',
            issueType: 'missing_singer_name',
            title: 'Mezmur has singer_id without singer_name',
            description: `“${row.title || row.slug}” has singer_id ${row.singer_id} but no singer_name.`,
            domain: 'relationships',
            metadata: { singer_id: row.singer_id },
          },
          now,
        ),
      )
    }
    if (row.category_id && !categoryIds.has(row.category_id)) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'warning',
            issueType: 'orphan_category',
            title: 'Mezmur category_id is invalid',
            description: `“${row.title || row.slug}” points to missing category ${row.category_id}.`,
            domain: 'relationships',
          },
          now,
        ),
      )
    }

    if (row.featured && row.status !== 'published') {
      issues.push(
        issue(
          {
            ...base,
            severity: 'critical',
            issueType: 'featured_unpublished',
            title: 'Featured Mezmur is not published',
            description: `“${row.title || row.slug}” is featured but status is ${row.status}.`,
          },
          now,
        ),
      )
    }
  }

  for (const link of tagLinks) {
    if (!mezmurIds.has(link.mezmur_id)) {
      issues.push(
        issue(
          {
            severity: 'warning',
            domain: 'relationships',
            issueType: 'orphan_mezmur_tag',
            title: 'Orphan mezmur_tags row',
            description: `Tag link references missing mezmur ${link.mezmur_id}.`,
            table: 'mezmur_tags',
            recordId: link.mezmur_id,
            metadata: { tag_id: link.tag_id },
          },
          now,
        ),
      )
    }
    if (!tagIds.has(link.tag_id)) {
      issues.push(
        issue(
          {
            severity: 'warning',
            domain: 'relationships',
            issueType: 'orphan_tag_id',
            title: 'mezmur_tags points to missing tag',
            description: `Tag ${link.tag_id} does not exist for mezmur ${link.mezmur_id}.`,
            table: 'mezmur_tags',
            recordId: link.mezmur_id,
            adminRoute: `${ADMIN_PATHS.hymnsMezmur}/${link.mezmur_id}/edit`,
          },
          now,
        ),
      )
    }
  }

  const total = mezmur.length
  return {
    issues,
    records: total,
    coverage: [
      coverage('mezmur-amharic-lyrics', 'Mezmur with Amharic lyrics', withAmharic, total),
      coverage('mezmur-transliteration', 'Mezmur with transliteration', withTranslit, total),
      coverage('mezmur-image', 'Mezmur with thumbnail', withImage, total),
      coverage('mezmur-playback', 'Mezmur with playable media', withPlayback, total),
    ],
  }
}

/** Hymn browse / classification health (taxonomy + browse groups). */
async function checkHymnClassification(now: string): Promise<{
  issues: ContentHealthIssue[]
  records: number
  coverage: CoverageMetric[]
}> {
  const issues: ContentHealthIssue[] = []
  const mezmur = await loadImportMezmurRows().then((rows) =>
    rows.map((m) => ({
      id: m.id,
      slug: m.slug,
      title: m.title,
      category: null as string | null,
      category_id: m.category_id,
      occasion: null as string | null,
      singer_id: m.singer_id,
      status: m.status,
    })),
  )

  let missingCategory = 0
  let missingOccasion = 0
  let missingSinger = 0
  const published = mezmur.filter((m) => m.status === 'published')

  for (const row of published) {
    const cat = (row.category || '').trim()
    const occ = (row.occasion || '').trim()
    const noCat =
      !row.category_id && (!cat || /^na$/i.test(cat) || cat === '-' || cat === '—')
    const noOcc = !occ || /^na$/i.test(occ) || occ === '-' || occ === '—'
    if (noCat) {
      missingCategory += 1
      if (missingCategory <= 25) {
        issues.push(
          issue(
            {
              severity: 'review',
              domain: 'mezmur',
              issueType: 'hymn_missing_category',
              title: 'Mezmur with no category',
              description: `“${row.title || row.slug}” has no category / category_id.`,
              table: 'mezmur',
              recordId: row.id,
              recordSlug: row.slug,
              adminRoute: `${ADMIN_PATHS.hymnsMezmur}/${row.id}/edit`,
            },
            now,
          ),
        )
      }
    }
    if (noOcc) {
      missingOccasion += 1
      if (missingOccasion <= 25) {
        issues.push(
          issue(
            {
              severity: 'review',
              domain: 'mezmur',
              issueType: 'hymn_missing_occasion',
              title: 'Mezmur with no occasion',
              description: `“${row.title || row.slug}” has no occasion.`,
              table: 'mezmur',
              recordId: row.id,
              recordSlug: row.slug,
              adminRoute: `${ADMIN_PATHS.hymnsMezmur}/${row.id}/edit`,
            },
            now,
          ),
        )
      }
    }
    if (!row.singer_id) {
      missingSinger += 1
    }
  }

  // Alias / duplicate occasion spellings (report only — do not merge)
  const occCounts = new Map<string, number>()
  for (const row of published) {
    const occ = (row.occasion || '').trim()
    if (!occ || /^na$/i.test(occ)) continue
    occCounts.set(occ, (occCounts.get(occ) || 0) + 1)
  }
  const aliasPairs: Array<[string, string]> = [
    ['Timket', 'Timkat'],
    ['Epiphany', 'Timkat'],
    ['Fasika', 'Tinsae'],
    ['Easter', 'Tinsae'],
  ]
  for (const [a, b] of aliasPairs) {
    const ca = [...occCounts.keys()].find((k) => k.toLowerCase() === a.toLowerCase())
    const cb = [...occCounts.keys()].find((k) => k.toLowerCase() === b.toLowerCase())
    if (ca && cb && ca !== cb) {
      issues.push(
        issue(
          {
            severity: 'review',
            domain: 'mezmur',
            issueType: 'hymn_occasion_alias',
            title: `Occasion alias pair: ${ca} / ${cb}`,
            description:
              `Published Mezmur use both “${ca}” (${occCounts.get(ca)}) and “${cb}” (${occCounts.get(cb)}). ` +
              'Do not merge without Admin review — normalize via mezmur_occasion_links_import.',
            table: 'mezmur',
            adminRoute: ADMIN_PATHS.hymnsOccasions,
            metadata: { a: ca, b: cb },
          },
          now,
        ),
      )
    }
  }

  // Import hymn collections + sections
  try {
    const groups = await fetchAll<{
      collection_id: string
      collection_slug: string
      title: string
      status: string
    }>('mezmur_collections_import', 'collection_id,collection_slug,title,status')
    const items = await fetchAll<{
      section_id: string
      collection_slug: string
      status: string
    }>('mezmur_sections_import', 'section_id,collection_slug,status')
    for (const g of groups.filter((x) => x.status === 'published' || !x.status)) {
      const childCount = items.filter(
        (i) =>
          i.collection_slug === g.collection_slug &&
          (i.status === 'published' || !i.status),
      ).length
      if (
        childCount === 0 &&
        g.collection_slug !== 'zemari-singers' &&
        g.collection_slug !== 'english-mezmur'
      ) {
        issues.push(
          issue(
            {
              severity: 'warning',
              domain: 'mezmur',
              issueType: 'empty_browse_group',
              title: `Empty collection: ${g.title}`,
              description: `Published collection “${g.collection_slug}” has no published sections.`,
              table: 'mezmur_collections_import',
              recordId: g.collection_id,
              recordSlug: g.collection_slug,
              adminRoute: `${ADMIN_PATHS.hymnsBrowseGroups}/${g.collection_id}/edit`,
            },
            now,
          ),
        )
      }
    }
  } catch {
    issues.push(
      issue(
        {
          severity: 'review',
          domain: 'mezmur',
          issueType: 'browse_groups_missing',
          title: 'Hymn import collections not available',
          description:
            'Ensure mezmur_collections_import / mezmur_sections_import are readable (MEZMUR_IMPORT_PUBLIC_READ_GRANTS.sql).',
          table: 'mezmur_collections_import',
          adminRoute: ADMIN_PATHS.hymnsBrowseGroups,
        },
        now,
      ),
    )
  }

  const total = published.length || 1
  return {
    issues,
    records: published.length,
    coverage: [
      coverage(
        'hymn-with-category',
        'Published Mezmur with category',
        published.length - missingCategory,
        total,
      ),
      coverage(
        'hymn-with-occasion',
        'Published Mezmur with occasion',
        published.length - missingOccasion,
        total,
      ),
      coverage(
        'hymn-with-singer',
        'Published Mezmur with singer',
        published.length - missingSinger,
        total,
      ),
    ],
  }
}

async function checkPrayersAndPsalms(now: string): Promise<{
  issues: ContentHealthIssue[]
  prayerRecords: number
  coverage: CoverageMetric[]
  psalms: ContentHealthReport['psalms']
  zeweter: ContentHealthReport['zeweter']
  prayerDomainIssues: ContentHealthIssue[]
  psalmDomainIssues: ContentHealthIssue[]
}> {
  const [collections, sections, prayers] = await Promise.all([
    fetchAll<PrayerCollectionRow>(
      'prayer_collections',
      'id,slug,title,status,sort_order',
      { column: 'sort_order' },
    ),
    fetchAll<PrayerSectionRow>(
      'prayer_sections',
      'id,collection_id,slug,title,status,sort_order',
      { column: 'sort_order' },
    ),
    fetchAll<PrayerRow>(
      'prayers',
      'id,slug,title,title_amharic,title_geez,title_english,text_amharic,text_geez,text_english,collection_id,section_id,collection_slug,section_slug,sort_order,status',
      { column: 'sort_order' },
    ),
  ])

  const issues: ContentHealthIssue[] = []
  const collectionById = new Map(collections.map((c) => [c.id, c]))
  const collectionBySlug = new Map(collections.map((c) => [c.slug, c]))
  const sectionById = new Map(sections.map((s) => [s.id, s]))

  for (const [slug, ids] of findDuplicateSlugs(collections)) {
    issues.push(
      issue(
        {
          severity: 'critical',
          domain: 'prayers',
          issueType: 'duplicate_collection_slug',
          title: `Duplicate prayer collection slug: ${slug}`,
          description: `${ids.length} collections share slug “${slug}”.`,
          table: 'prayer_collections',
          recordId: ids[0],
          recordSlug: slug,
          adminRoute: `${ADMIN_PATHS.prayCollections}/${ids[0]}/edit`,
        },
        now,
      ),
    )
  }

  for (const col of collections) {
    if (!hasText(col.title)) {
      issues.push(
        issue(
          {
            severity: 'critical',
            domain: 'prayers',
            issueType: 'collection_missing_title',
            title: 'Prayer collection missing title',
            description: `Collection ${col.slug || col.id} has no title.`,
            table: 'prayer_collections',
            recordId: col.id,
            recordSlug: col.slug,
            adminRoute: `${ADMIN_PATHS.prayCollections}/${col.id}/edit`,
          },
          now,
        ),
      )
    }
    if (!hasText(col.slug)) {
      issues.push(
        issue(
          {
            severity: 'critical',
            domain: 'prayers',
            issueType: 'collection_missing_slug',
            title: 'Prayer collection missing slug',
            description: `Collection ${col.id} has no slug.`,
            table: 'prayer_collections',
            recordId: col.id,
            adminRoute: `${ADMIN_PATHS.prayCollections}/${col.id}/edit`,
          },
          now,
        ),
      )
    }
    const prayerCount = prayers.filter((p) => p.collection_id === col.id).length
    if (col.status === 'published' && prayerCount === 0 && col.slug !== 'yekidane-tselot' && col.slug !== 'meharene-ab') {
      issues.push(
        issue(
          {
            severity: 'critical',
            domain: 'prayers',
            issueType: 'published_collection_empty',
            title: `Published collection “${col.title || col.slug}” has no prayers`,
            description: 'Published prayer collection contains zero prayer rows.',
            table: 'prayer_collections',
            recordId: col.id,
            recordSlug: col.slug,
            adminRoute: `${ADMIN_PATHS.prayCollections}/${col.id}/edit`,
          },
          now,
        ),
      )
    }
  }

  const sectionSlugKeys = new Map<string, string[]>()
  for (const section of sections) {
    const key = `${section.collection_id}::${(section.slug || '').toLowerCase()}`
    const list = sectionSlugKeys.get(key) || []
    list.push(section.id)
    sectionSlugKeys.set(key, list)

    if (!collectionById.has(section.collection_id)) {
      issues.push(
        issue(
          {
            severity: 'critical',
            domain: 'relationships',
            issueType: 'orphan_section',
            title: `Orphan prayer section: ${section.slug || section.id}`,
            description: `section.collection_id ${section.collection_id} does not exist.`,
            table: 'prayer_sections',
            recordId: section.id,
            recordSlug: section.slug,
          },
          now,
        ),
      )
    }
    if (!hasText(section.title)) {
      issues.push(
        issue(
          {
            severity: 'warning',
            domain: 'prayers',
            issueType: 'section_missing_title',
            title: 'Prayer section missing title',
            description: `Section ${section.slug || section.id} has no title.`,
            table: 'prayer_sections',
            recordId: section.id,
            recordSlug: section.slug,
          },
          now,
        ),
      )
    }
    const count = prayers.filter((p) => p.section_id === section.id).length
    if (count === 0) {
      issues.push(
        issue(
          {
            severity: 'review',
            domain: 'prayers',
            issueType: 'empty_section',
            title: `Section “${section.title || section.slug}” has no prayers`,
            description: 'Prayer section contains zero prayers.',
            table: 'prayer_sections',
            recordId: section.id,
            recordSlug: section.slug,
          },
          now,
        ),
      )
    }
  }
  for (const [key, ids] of sectionSlugKeys) {
    if (ids.length < 2) continue
    const slug = key.split('::')[1]
    issues.push(
      issue(
        {
          severity: 'warning',
          domain: 'prayers',
          issueType: 'duplicate_section_slug',
          title: `Duplicate section slug within collection: ${slug}`,
          description: `${ids.length} sections share the same slug in one collection.`,
          table: 'prayer_sections',
          recordId: ids[0],
          recordSlug: slug,
        },
        now,
      ),
    )
  }

  let amharic = 0
  let geez = 0
  let english = 0

  for (const prayer of prayers) {
    const col = prayer.collection_id ? collectionById.get(prayer.collection_id) : undefined
    const adminRoute = col
      ? `${ADMIN_PATHS.prayCollections}/${col.id}/edit`
      : ADMIN_PATHS.prayCollections
    const base = {
      table: 'prayers' as const,
      recordId: prayer.id,
      recordSlug: prayer.slug,
      adminRoute,
      domain: 'prayers' as const,
    }

    if (!prayer.collection_id) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'critical',
            issueType: 'prayer_missing_collection',
            title: `Prayer missing collection_id: ${prayer.slug || prayer.id}`,
            description: 'Prayer row has no collection_id.',
            domain: 'relationships',
          },
          now,
        ),
      )
    } else if (!col) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'critical',
            issueType: 'prayer_orphan_collection',
            title: `Prayer points to missing collection: ${prayer.slug || prayer.id}`,
            description: `collection_id ${prayer.collection_id} does not exist.`,
            domain: 'relationships',
          },
          now,
        ),
      )
    } else if (
      hasText(prayer.collection_slug) &&
      prayer.collection_slug !== col.slug
    ) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'warning',
            issueType: 'collection_slug_mismatch',
            title: `collection_slug mismatch: ${prayer.slug}`,
            description: `Prayer collection_slug “${prayer.collection_slug}” ≠ collection.slug “${col.slug}”.`,
            domain: 'relationships',
            metadata: { expected: col.slug, actual: prayer.collection_slug },
          },
          now,
        ),
      )
    }

    if (prayer.section_id) {
      const section = sectionById.get(prayer.section_id)
      if (!section) {
        issues.push(
          issue(
            {
              ...base,
              severity: 'critical',
              issueType: 'prayer_orphan_section',
              title: `Prayer points to missing section: ${prayer.slug}`,
              description: `section_id ${prayer.section_id} does not exist.`,
              domain: 'relationships',
            },
            now,
          ),
        )
      } else if (prayer.collection_id && section.collection_id !== prayer.collection_id) {
        issues.push(
          issue(
            {
              ...base,
              severity: 'critical',
              issueType: 'section_wrong_collection',
              title: `Prayer section belongs to another collection: ${prayer.slug}`,
              description: 'section.collection_id does not match prayer.collection_id.',
              domain: 'relationships',
            },
            now,
          ),
        )
      } else if (hasText(prayer.section_slug) && prayer.section_slug !== section.slug) {
        issues.push(
          issue(
            {
              ...base,
              severity: 'warning',
              issueType: 'section_slug_mismatch',
              title: `section_slug mismatch: ${prayer.slug}`,
              description: `Prayer section_slug “${prayer.section_slug}” ≠ section.slug “${section.slug}”.`,
              domain: 'relationships',
            },
            now,
          ),
        )
      }
    }

    if (!hasText(prayer.title) && !hasText(prayer.title_amharic) && !hasText(prayer.title_english)) {
      issues.push(
        issue(
          {
            ...base,
            severity: prayer.status === 'published' ? 'critical' : 'warning',
            issueType: 'prayer_missing_title',
            title: `Prayer missing title: ${prayer.slug || prayer.id}`,
            description: 'No title / title_amharic / title_english.',
          },
          now,
        ),
      )
    }

    const hasAnyText =
      hasText(prayer.text_amharic) || hasText(prayer.text_geez) || hasText(prayer.text_english)
    if (!hasAnyText) {
      issues.push(
        issue(
          {
            ...base,
            severity: prayer.status === 'published' ? 'critical' : 'warning',
            issueType: 'prayer_missing_all_text',
            title: `Prayer has no text in any language: ${prayer.slug || prayer.title || prayer.id}`,
            description: 'text_amharic, text_geez, and text_english are all empty.',
          },
          now,
        ),
      )
    }
    if (hasText(prayer.text_amharic)) amharic += 1
    if (hasText(prayer.text_geez)) geez += 1
    if (hasText(prayer.text_english)) english += 1
  }

  // Wudase weekday structure
  const wudase = collectionBySlug.get(WUDASE_SLUG) || collectionBySlug.get('wudasie-mariam')
  if (wudase) {
    const wudaseSections = sections.filter((s) => s.collection_id === wudase.id)
    const sectionSlugs = new Set(wudaseSections.map((s) => s.slug.toLowerCase()))
    for (const day of WUDASE_WEEKDAYS) {
      if (![...sectionSlugs].some((slug) => slug === day || slug.includes(day))) {
        issues.push(
          issue(
            {
              severity: 'review',
              domain: 'prayers',
              issueType: 'wudase_missing_weekday',
              title: `Wudase Mariam missing weekday: ${day}`,
              description: `No section slug matching “${day}” under collection ${wudase.slug}.`,
              table: 'prayer_sections',
              recordId: wudase.id,
              recordSlug: wudase.slug,
              adminRoute: `${ADMIN_PATHS.prayCollections}/${wudase.id}/edit`,
            },
            now,
          ),
        )
      }
    }
    for (const section of wudaseSections) {
      const count = prayers.filter((p) => p.section_id === section.id).length
      const softLinked = prayers.filter(
        (p) =>
          p.collection_id === wudase.id &&
          !p.section_id &&
          (p.slug === section.slug ||
            p.slug === `wudase-mariam-${section.slug}` ||
            p.slug.endsWith(`-${section.slug}`)),
      ).length
      if (count + softLinked === 0) {
        issues.push(
          issue(
            {
              severity: 'warning',
              domain: 'prayers',
              issueType: 'wudase_weekday_empty',
              title: `Wudase weekday has no prayers: ${section.title || section.slug}`,
              description: 'Weekday section (and soft-linked prayer slugs) have zero prayers.',
              table: 'prayer_sections',
              recordId: section.id,
              recordSlug: section.slug,
              adminRoute: `${ADMIN_PATHS.prayCollections}/${wudase.id}/edit`,
            },
            now,
          ),
        )
      }
    }
  } else {
    issues.push(
      issue(
        {
          severity: 'warning',
          domain: 'prayers',
          issueType: 'wudase_collection_missing',
          title: 'Wudase Mariam collection not found',
          description: `Expected slug “${WUDASE_SLUG}” (or wudasie-mariam) in prayer_collections.`,
          table: 'prayer_collections',
        },
        now,
      ),
    )
  }

  // Zeweter continuous bookends
  const zewter =
    collectionBySlug.get(ZEWTER_SLUG) ||
    collectionBySlug.get('zeweter-tselot') ||
    collectionBySlug.get('zeweter')
  let zeweter: ContentHealthReport['zeweter'] = {
    collectionSlug: zewter?.slug || null,
    prayerCount: 0,
    firstSlug: null,
    firstTitle: null,
    lastSlug: null,
    lastTitle: null,
    firstOk: false,
    lastOk: false,
  }
  if (zewter) {
    const zewterPrayers = prayers
      .filter((p) => p.collection_id === zewter.id)
      .sort((a, b) => a.sort_order - b.sort_order || a.slug.localeCompare(b.slug))
    const first = zewterPrayers[0]
    const last = zewterPrayers[zewterPrayers.length - 1]
    zeweter = {
      collectionSlug: zewter.slug,
      prayerCount: zewterPrayers.length,
      firstSlug: first?.slug || null,
      firstTitle: first?.title || first?.title_amharic || null,
      lastSlug: last?.slug || null,
      lastTitle: last?.title || last?.title_amharic || null,
      firstOk: first?.slug === ZEWTER_FIRST,
      lastOk: last?.slug === ZEWTER_LAST,
    }
    if (!zeweter.firstOk) {
      issues.push(
        issue(
          {
            severity: 'review',
            domain: 'prayers',
            issueType: 'zeweter_first_mismatch',
            title: 'Zeweter first prayer is not YeMeskel Milikit',
            description: `Expected slug ${ZEWTER_FIRST}; found ${first?.slug || 'none'} (${first?.title || '—'}).`,
            table: 'prayers',
            recordId: first?.id,
            recordSlug: first?.slug,
            adminRoute: `${ADMIN_PATHS.prayCollections}/${zewter.id}/edit`,
          },
          now,
        ),
      )
    }
    if (!zeweter.lastOk) {
      issues.push(
        issue(
          {
            severity: 'review',
            domain: 'prayers',
            issueType: 'zeweter_last_mismatch',
            title: "Zeweter last prayer is not Tselote Egzi'etne Mariam",
            description: `Expected slug ${ZEWTER_LAST}; found ${last?.slug || 'none'} (${last?.title || '—'}).`,
            table: 'prayers',
            recordId: last?.id,
            recordSlug: last?.slug,
            adminRoute: `${ADMIN_PATHS.prayCollections}/${zewter.id}/edit`,
          },
          now,
        ),
      )
    }
  } else {
    issues.push(
      issue(
        {
          severity: 'critical',
          domain: 'prayers',
          issueType: 'zeweter_collection_missing',
          title: 'Zeweter Tselot collection not found',
          description: `Expected canonical slug “${ZEWTER_SLUG}”.`,
          table: 'prayer_collections',
        },
        now,
      ),
    )
  }

  // Mezmure Dawit psalms
  const dawit =
    collectionBySlug.get('mezmure-dawit') ||
    collections.find((c) => /mezmure?-?dawit|psalm/i.test(c.slug))
  const psalmIssues: ContentHealthIssue[] = []
  const psalmNumbers: number[] = []
  const invalidSlugs: string[] = []
  const byNumber = new Map<number, string[]>()

  if (dawit) {
    const rows = prayers.filter((p) => p.collection_id === dawit.id)
    for (const row of rows) {
      const n = getPsalmNumber({ slug: row.slug, title: row.title })
      if (n == null) {
        invalidSlugs.push(row.slug)
        psalmIssues.push(
          issue(
            {
              severity: 'warning',
              domain: 'psalms',
              issueType: 'invalid_psalm_slug',
              title: `Invalid Psalm slug: ${row.slug}`,
              description: 'Could not extract Psalm number 1–150 from slug/title.',
              table: 'prayers',
              recordId: row.id,
              recordSlug: row.slug,
              adminRoute: `${ADMIN_PATHS.prayCollections}/${dawit.id}/edit`,
            },
            now,
          ),
        )
        continue
      }
      psalmNumbers.push(n)
      const list = byNumber.get(n) || []
      list.push(row.id)
      byNumber.set(n, list)

      if (
        row.status === 'published' &&
        !hasText(row.text_amharic) &&
        !hasText(row.text_geez) &&
        !hasText(row.text_english)
      ) {
        psalmIssues.push(
          issue(
            {
              severity: 'critical',
              domain: 'psalms',
              issueType: 'published_psalm_no_text',
              title: `Published Psalm ${n} has no text`,
              description: `Psalm ${n} (${row.slug}) is published with no language text.`,
              table: 'prayers',
              recordId: row.id,
              recordSlug: row.slug,
              adminRoute: `${ADMIN_PATHS.prayCollections}/${dawit.id}/edit`,
            },
            now,
          ),
        )
      }
    }

    const missing: number[] = []
    for (let n = 1; n <= EXPECTED_PSALMS; n++) {
      if (!byNumber.has(n)) missing.push(n)
    }
    const duplicates = [...byNumber.entries()]
      .filter(([, ids]) => ids.length > 1)
      .map(([number, ids]) => ({ number, count: ids.length }))

    for (const n of missing.slice(0, 40)) {
      psalmIssues.push(
        issue(
          {
            severity: 'critical',
            domain: 'psalms',
            issueType: 'missing_psalm',
            title: `Missing Psalm ${n}`,
            description: `No prayer slug maps to Psalm ${n} in collection ${dawit.slug}.`,
            table: 'prayers',
            recordSlug: dawit.slug,
            adminRoute: `${ADMIN_PATHS.prayCollections}/${dawit.id}/edit`,
            metadata: { psalm: n },
          },
          now,
        ),
      )
    }
    if (missing.length > 40) {
      psalmIssues.push(
        issue(
          {
            severity: 'critical',
            domain: 'psalms',
            issueType: 'missing_psalms_more',
            title: `${missing.length - 40} additional missing Psalms`,
            description: `Missing Psalms continue after 40 listed issues (total missing ${missing.length}).`,
            table: 'prayers',
            recordSlug: dawit.slug,
            adminRoute: `${ADMIN_PATHS.prayCollections}/${dawit.id}/edit`,
            metadata: { missingCount: missing.length },
          },
          now,
        ),
      )
    }
    for (const dup of duplicates) {
      psalmIssues.push(
        issue(
          {
            severity: 'critical',
            domain: 'psalms',
            issueType: 'duplicate_psalm',
            title: `Duplicate Psalm ${dup.number} (${dup.count} rows)`,
            description: 'Multiple prayer rows resolve to the same Psalm number. Do not auto-merge.',
            table: 'prayers',
            recordSlug: dawit.slug,
            adminRoute: `${ADMIN_PATHS.prayCollections}/${dawit.id}/edit`,
            metadata: { psalm: dup.number, count: dup.count },
          },
          now,
        ),
      )
    }

    const psalmsReport: ContentHealthReport['psalms'] = {
      collectionSlug: dawit.slug,
      detected: byNumber.size,
      expected: EXPECTED_PSALMS,
      min: psalmNumbers.length ? Math.min(...psalmNumbers) : null,
      max: psalmNumbers.length ? Math.max(...psalmNumbers) : null,
      missing,
      duplicates,
      invalidSlugs,
    }

    issues.push(...psalmIssues)
    const prayerOnly = issues.filter((i) => i.domain === 'prayers' || i.domain === 'relationships')
    return {
      issues,
      prayerRecords: prayers.length + collections.length + sections.length,
      coverage: [
        coverage('prayer-amharic', 'Prayers with Amharic text', amharic, prayers.length),
        coverage('prayer-geez', "Prayers with Ge'ez text", geez, prayers.length),
        coverage('prayer-english', 'Prayers with English text', english, prayers.length),
        coverage('psalms-complete', 'Psalms present (1–150)', byNumber.size, EXPECTED_PSALMS),
      ],
      psalms: psalmsReport,
      zeweter,
      prayerDomainIssues: prayerOnly,
      psalmDomainIssues: psalmIssues,
    }
  }

  issues.push(
    issue(
      {
        severity: 'critical',
        domain: 'psalms',
        issueType: 'dawit_collection_missing',
        title: 'Mezmure Dawit collection not found',
        description: 'Expected slug mezmure-dawit in prayer_collections.',
        table: 'prayer_collections',
      },
      now,
    ),
  )

  return {
    issues,
    prayerRecords: prayers.length + collections.length + sections.length,
    coverage: [
      coverage('prayer-amharic', 'Prayers with Amharic text', amharic, prayers.length),
      coverage('prayer-geez', "Prayers with Ge'ez text", geez, prayers.length),
      coverage('prayer-english', 'Prayers with English text', english, prayers.length),
      coverage('psalms-complete', 'Psalms present (1–150)', 0, EXPECTED_PSALMS),
    ],
    psalms: {
      collectionSlug: null,
      detected: 0,
      expected: EXPECTED_PSALMS,
      min: null,
      max: null,
      missing: Array.from({ length: EXPECTED_PSALMS }, (_, i) => i + 1),
      duplicates: [],
      invalidSlugs: [],
    },
    zeweter,
    prayerDomainIssues: issues.filter((i) => i.domain === 'prayers' || i.domain === 'relationships'),
    psalmDomainIssues: issues.filter((i) => i.domain === 'psalms'),
  }
}

async function checkPrayerGuides(now: string): Promise<{
  issues: ContentHealthIssue[]
  records: number
}> {
  type GuideRow = {
    id: string
    slug: string
    title: string | null
    title_amharic: string | null
    status: string
    review_status: string | null
  }
  type SectionRow = {
    id: string
    guide_id: string
    slug: string
    title: string | null
    body_english: string | null
    body_amharic: string | null
    sort_order: number | null
    review_status: string | null
  }

  let guides: GuideRow[] = []
  let sections: SectionRow[] = []
  try {
    guides = await fetchAll<GuideRow>(
      'prayer_guides',
      'id,slug,title,title_amharic,status,review_status',
      { column: 'sort_order' },
    )
    sections = await fetchAll<SectionRow>(
      'prayer_guide_sections',
      'id,guide_id,slug,title,body_english,body_amharic,sort_order,review_status',
      { column: 'sort_order' },
    )
  } catch (error) {
    logErr('prayer_guides', error)
    return { issues: [], records: 0 }
  }

  const issues: ContentHealthIssue[] = []
  const sectionsByGuide = new Map<string, SectionRow[]>()
  for (const section of sections) {
    const list = sectionsByGuide.get(section.guide_id) || []
    list.push(section)
    sectionsByGuide.set(section.guide_id, list)
  }

  for (const guide of guides) {
    const adminRoute = `${ADMIN_PATHS.prayGuides}/${guide.id}/edit`
    if (!hasText(guide.title)) {
      issues.push(
        issue(
          {
            severity: 'critical',
            domain: 'prayers',
            issueType: 'guide_missing_title',
            title: `Guide missing title: ${guide.slug}`,
            description: 'prayer_guides.title is required.',
            table: 'prayer_guides',
            recordId: guide.id,
            recordSlug: guide.slug,
            adminRoute,
          },
          now,
        ),
      )
    }

    const guideSections = sectionsByGuide.get(guide.id) || []
    if (guide.status === 'published' && guideSections.length === 0) {
      issues.push(
        issue(
          {
            severity: 'critical',
            domain: 'prayers',
            issueType: 'published_guide_no_sections',
            title: `Published guide has zero sections: ${guide.title || guide.slug}`,
            description: 'A published prayer guide should include at least one section.',
            table: 'prayer_guides',
            recordId: guide.id,
            recordSlug: guide.slug,
            adminRoute,
          },
          now,
        ),
      )
    }

    const slugCounts = new Map<string, number>()
    const orders = guideSections.map((s) => Number(s.sort_order))
    for (const section of guideSections) {
      slugCounts.set(section.slug, (slugCounts.get(section.slug) || 0) + 1)
      const sectionAdmin = adminRoute
      if (!hasText(section.body_amharic)) {
        issues.push(
          issue(
            {
              severity: 'warning',
              domain: 'prayers',
              issueType: 'guide_section_missing_amharic',
              title: `Guide section missing Amharic: ${section.title || section.slug}`,
              description: `Section ${section.slug} in ${guide.slug} has no Amharic body.`,
              table: 'prayer_guide_sections',
              recordId: section.id,
              recordSlug: section.slug,
              adminRoute: sectionAdmin,
            },
            now,
          ),
        )
      }
      if (!hasText(section.body_english)) {
        issues.push(
          issue(
            {
              severity: 'review',
              domain: 'prayers',
              issueType: 'guide_section_missing_english',
              title: `Guide section missing English: ${section.title || section.slug}`,
              description: `Draft English translation missing for ${section.slug} in ${guide.slug}.`,
              table: 'prayer_guide_sections',
              recordId: section.id,
              recordSlug: section.slug,
              adminRoute: sectionAdmin,
            },
            now,
          ),
        )
      }
      if (section.review_status === 'needs_review') {
        issues.push(
          issue(
            {
              severity: 'review',
              domain: 'prayers',
              issueType: 'guide_section_needs_review',
              title: `Guide section needs review: ${section.title || section.slug}`,
              description: `Marked needs_review in ${guide.slug}.`,
              table: 'prayer_guide_sections',
              recordId: section.id,
              recordSlug: section.slug,
              adminRoute: sectionAdmin,
            },
            now,
          ),
        )
      }
    }

    for (const [slug, count] of slugCounts) {
      if (count > 1) {
        issues.push(
          issue(
            {
              severity: 'critical',
              domain: 'prayers',
              issueType: 'guide_duplicate_section_slug',
              title: `Duplicate section slug in ${guide.slug}: ${slug}`,
              description: `Slug "${slug}" appears ${count} times.`,
              table: 'prayer_guide_sections',
              recordSlug: guide.slug,
              adminRoute,
            },
            now,
          ),
        )
      }
    }

    const sorted = [...orders].sort((a, b) => a - b)
    const invalidOrder =
      sorted.some((n) => !Number.isFinite(n)) ||
      sorted.some((n, i) => i > 0 && n === sorted[i - 1])
    if (guideSections.length > 1 && invalidOrder) {
      issues.push(
        issue(
          {
            severity: 'warning',
            domain: 'prayers',
            issueType: 'guide_invalid_section_order',
            title: `Invalid section ordering: ${guide.title || guide.slug}`,
            description: 'Section sort_order values should be unique finite integers.',
            table: 'prayer_guide_sections',
            recordId: guide.id,
            recordSlug: guide.slug,
            adminRoute,
          },
          now,
        ),
      )
    }
  }

  return { issues, records: guides.length + sections.length }
}

async function checkCalendar(now: string): Promise<{
  issues: ContentHealthIssue[]
  records: number
  coverage: CoverageMetric[]
}> {
  let cards: CalendarCardRow[] = []
  try {
    cards = await fetchAll<CalendarCardRow>(
      'calendar_cards',
      'id,slug,title,category,status,featured,show_on_home,home_featured,home_sort_order,home_start_date,home_end_date,ethiopian_month_number,ethiopian_day,is_monthly,image_path,image_alt,summary,what_is_it,why_celebrated,important_information,scripture_references,fasting_notes,season_notes,synaxarium_day_id,synaxarium_day_slug,source_type,source_id,source_slug',
      { column: 'sort_order' },
    )
  } catch (error) {
    // Older DB without homepage/source columns — retry core select.
    logErr('calendar_cards homepage/source columns', error)
    cards = await fetchAll<CalendarCardRow>(
      'calendar_cards',
      'id,slug,title,category,status,featured,ethiopian_month_number,ethiopian_day,image_path,image_alt,summary,what_is_it,why_celebrated,important_information,scripture_references,fasting_notes,season_notes,synaxarium_day_id,synaxarium_day_slug',
      { column: 'sort_order' },
    )
  }

  let days: SynaxDayRow[] = []
  try {
    days = await fetchAll<SynaxDayRow>(
      'synaxarium_days',
      'id,slug,ethiopian_month_number,ethiopian_day,status,image_path,image_alt',
    )
  } catch (error) {
    logErr('synaxarium_days', error)
  }
  const dayById = new Map(days.map((d) => [d.id, d]))
  const dayBySlug = new Map(days.map((d) => [d.slug, d]))

  const issues: ContentHealthIssue[] = []
  let withImage = 0
  let withSummary = 0
  let withWhy = 0

  for (const [slug, ids] of findDuplicateSlugs(cards)) {
    issues.push(
      issue(
        {
          severity: 'critical',
          domain: 'calendar',
          issueType: 'duplicate_card_slug',
          title: `Duplicate calendar card slug: ${slug}`,
          description: `${ids.length} calendar_cards share this slug.`,
          table: 'calendar_cards',
          recordId: ids[0],
          recordSlug: slug,
          adminRoute: `${ADMIN_PATHS.calendarCards}/${ids[0]}/edit`,
        },
        now,
      ),
    )
  }

  for (const card of cards) {
    const adminRoute = `${ADMIN_PATHS.calendarCards}/${card.id}/edit`
    const published = card.status === 'published'
    const linkedMode =
      Boolean(card.source_type) &&
      card.source_type !== 'manual' &&
      Boolean(card.source_id || card.source_slug)
    const base = {
      table: 'calendar_cards' as const,
      recordId: card.id,
      recordSlug: card.slug,
      adminRoute,
      domain: 'calendar' as const,
    }

    if (!hasText(card.title)) {
      issues.push(
        issue(
          {
            ...base,
            severity: linkedMode ? 'info' : published ? 'critical' : 'warning',
            issueType: 'card_missing_title',
            title: linkedMode
              ? 'Calendar card title blank (will inherit from linked source)'
              : 'Calendar card missing title',
            description: linkedMode
              ? `Card ${card.slug || card.id} has no override title — public UI should inherit from ${card.source_type}.`
              : `Card ${card.slug || card.id} has no title.`,
          },
          now,
        ),
      )
    }
    if (!linkedMode && (!card.ethiopian_month_number || !card.ethiopian_day)) {
      issues.push(
        issue(
          {
            ...base,
            severity: published ? 'critical' : 'warning',
            issueType: 'card_missing_date',
            title: 'Calendar card missing Ethiopian date',
            description: `“${card.title || card.slug}” needs ethiopian_month_number and ethiopian_day.`,
          },
          now,
        ),
      )
    }
    if (!hasText(card.category) && published) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'warning',
            issueType: 'card_missing_category',
            title: 'Published calendar card missing category',
            description: `“${card.title || card.slug}” has no category.`,
          },
          now,
        ),
      )
    }

    if (hasText(card.image_path)) {
      withImage += 1
      if (!hasText(card.image_alt)) {
        issues.push(
          issue(
            {
              ...base,
              severity: 'warning',
              issueType: 'card_missing_image_alt',
              title: 'Calendar card image missing alt text',
              description: `“${card.title || card.slug}” has image_path but empty image_alt.`,
              domain: 'media',
              repairable: true,
              metadata: { suggestedAlt: card.title || card.slug },
            },
            now,
          ),
        )
      }

      const path = String(card.image_path || '').trim()
      if (path.startsWith('calendar/') || path.includes('/calendar/')) {
        if (!isValidCalendarImagePath(path)) {
          issues.push(
            issue(
              {
                ...base,
                severity: 'review',
                issueType: 'card_invalid_calendar_image_folder',
                title: 'Calendar image path outside category folders',
                description: `“${card.title || card.slug}” uses “${path}”. Prefer calendar/<category>/<slug>.webp.`,
                domain: 'media',
              },
              now,
            ),
          )
        }
      }

      // Best-effort broken object probe (skip absolute legacy URLs). Cap probes.
      if (!/^https?:\/\//i.test(path) && published && withImage <= 40) {
        try {
          const ok = await probeContentMediaExists(path)
          if (!ok) {
            issues.push(
              issue(
                {
                  ...base,
                  severity: 'warning',
            issueType: 'card_broken_image_storage',
                  title: 'IMAGE_PATH_INVALID · Calendar card image may be missing in storage',
                  description: `Could not fetch “${path}” for “${card.title || card.slug}”.`,
                  domain: 'media',
                },
                now,
              ),
            )
          }
        } catch {
          /* ignore probe failures */
        }
      }
    } else if (published) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'warning',
            issueType: 'card_missing_image',
            title: 'IMAGE_PATH_MISSING · Published calendar card missing image',
            description: `“${card.title || card.slug}” has no image_path.`,
            domain: 'media',
          },
          now,
        ),
      )
    }

    if (hasText(card.summary)) withSummary += 1
    else if (published && !linkedMode) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'review',
            issueType: 'card_missing_summary',
            title: 'Published card missing summary',
            description: `“${card.title || card.slug}” has no summary.`,
          },
          now,
        ),
      )
    }
    if (hasText(card.why_celebrated)) withWhy += 1
    else if (published && !linkedMode) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'review',
            issueType: 'card_missing_why',
            title: 'Published card missing why_celebrated',
            description: `“${card.title || card.slug}” lacks educational why text.`,
          },
          now,
        ),
      )
    }
    if (published && !linkedMode && !hasText(card.what_is_it)) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'review',
            issueType: 'card_missing_what',
            title: 'Published card missing what_is_it',
            description: `“${card.title || card.slug}” lacks what_is_it.`,
          },
          now,
        ),
      )
    }

    // Homepage flags
    if (card.show_on_home) {
      if (card.status !== 'published') {
        issues.push(
          issue(
            {
              ...base,
              severity: 'critical',
              issueType: 'home_card_unpublished',
              title: 'Homepage calendar card is not published',
              description: `“${card.title || card.slug}” has show_on_home but status is ${card.status}.`,
            },
            now,
          ),
        )
      }
      if (!hasText(card.image_path)) {
        issues.push(
          issue(
            {
              ...base,
              severity: 'critical',
              issueType: 'home_card_no_image',
              title: 'Homepage calendar card missing image',
              description: `“${card.title || card.slug}” is marked for homepage without an image.`,
              domain: 'media',
            },
            now,
          ),
        )
      }
      if (
        hasText(card.home_start_date) &&
        hasText(card.home_end_date) &&
        (card.home_start_date as string) > (card.home_end_date as string)
      ) {
        issues.push(
          issue(
            {
              ...base,
              severity: 'warning',
              issueType: 'home_date_range_invalid',
              title: 'Homepage date window is invalid',
              description: `home_start_date (${card.home_start_date}) is after home_end_date (${card.home_end_date}).`,
            },
            now,
          ),
        )
      }
      if (hasText(card.home_end_date)) {
        const today = new Date().toISOString().slice(0, 10)
        if ((card.home_end_date as string) < today && card.show_on_home) {
          issues.push(
            issue(
              {
                ...base,
                severity: 'info',
                issueType: 'home_window_expired',
                title: 'Homepage date window expired',
                description: `“${card.title || card.slug}” home_end_date ${card.home_end_date} is in the past.`,
              },
              now,
            ),
          )
        }
      }
    }

    if (card.synaxarium_day_id) {
      const day = dayById.get(card.synaxarium_day_id)
      if (!day) {
        issues.push(
          issue(
            {
              ...base,
              severity: 'warning',
              issueType: 'card_broken_synax_day',
              title: 'Calendar card Synaxarium day_id is broken',
              description: `synaxarium_day_id ${card.synaxarium_day_id} not found.`,
              domain: 'relationships',
            },
            now,
          ),
        )
      } else {
        if (
          hasText(card.synaxarium_day_slug) &&
          card.synaxarium_day_slug !== day.slug
        ) {
          issues.push(
            issue(
              {
                ...base,
                severity: 'review',
                issueType: 'card_synax_slug_mismatch',
                title: 'Calendar card Synaxarium slug mismatch',
                description: `Card slug “${card.synaxarium_day_slug}” ≠ day.slug “${day.slug}”.`,
                domain: 'relationships',
              },
              now,
            ),
          )
        }
        if (
          card.ethiopian_month_number &&
          card.ethiopian_day &&
          (day.ethiopian_month_number !== card.ethiopian_month_number ||
            day.ethiopian_day !== card.ethiopian_day)
        ) {
          issues.push(
            issue(
              {
                ...base,
                severity: 'review',
                issueType: 'card_synax_date_mismatch',
                title: 'Calendar card date ≠ linked Synaxarium day',
                description: 'Ethiopian month/day on the card disagrees with the linked day.',
                domain: 'relationships',
              },
              now,
            ),
          )
        }
      }
    } else if (hasText(card.synaxarium_day_slug) && !dayBySlug.has(card.synaxarium_day_slug!)) {
      issues.push(
        issue(
          {
            ...base,
            severity: 'review',
            issueType: 'card_synax_slug_orphan',
            title: 'Calendar card Synaxarium slug not found',
            description: `synaxarium_day_slug “${card.synaxarium_day_slug}” has no matching day.`,
            domain: 'relationships',
          },
          now,
        ),
      )
    }

    // Structured source link validation
    const sourceType = (card.source_type || '').trim().toLowerCase()
    if (sourceType && sourceType !== 'manual') {
      const allowed = new Set([
        'observance',
        'fast',
        'season',
        'monthly_commemoration',
        'synaxarium_day',
        'synaxarium_commemoration',
      ])
      if (!allowed.has(sourceType)) {
        issues.push(
          issue(
            {
              ...base,
              severity: 'warning',
              issueType: 'card_invalid_source_type',
              title: `Invalid calendar card source_type: ${sourceType}`,
              description: 'Use observance|fast|season|monthly_commemoration|synaxarium_*|manual.',
              domain: 'relationships',
            },
            now,
          ),
        )
      } else if (!card.source_id && !card.source_slug) {
        issues.push(
          issue(
            {
              ...base,
              severity: published ? 'critical' : 'warning',
              issueType: 'card_missing_source_ref',
              title: 'MISSING_SOURCE · Linked calendar card missing source_id/source_slug',
              description: `source_type=${sourceType} but no source identity is set.`,
              domain: 'relationships',
            },
            now,
          ),
        )
      } else {
        // Heuristic: invented Meskerem 1 on linked non-monthly cards (DATE_SOURCE_MISMATCH / STALE).
        if (
          !card.is_monthly &&
          sourceType !== 'monthly_commemoration' &&
          Number(card.ethiopian_month_number) === 1 &&
          Number(card.ethiopian_day) === 1
        ) {
          issues.push(
            issue(
              {
                ...base,
                severity: 'review',
                issueType: 'card_stale_meskerem_1',
                title: 'DATE_SOURCE_MISMATCH · Card stores Meskerem 1 (likely invented placeholder)',
                description: `“${card.title || card.slug}” has eth month/day 1/1. Prefer live source rule; run Sync or FIX_CALENDAR_CARDS_DATE_RULES.sql.`,
                domain: 'relationships',
                repairable: true,
              },
              now,
            ),
          )
        }
        const table =
          sourceType === 'observance'
            ? 'orthodox_observances'
            : sourceType === 'fast'
              ? 'liturgical_fasts'
              : sourceType === 'season'
                ? 'liturgical_seasons'
                : sourceType === 'monthly_commemoration'
                  ? 'monthly_commemorations'
                  : sourceType === 'synaxarium_day'
                    ? 'synaxarium_days'
                    : 'synaxarium_commemorations'
        try {
          let data: { id?: string; slug?: string } | null = null
          if (card.source_id) {
            const byId = await db()
              .from(table as never)
              .select('id,slug')
              .eq('id', card.source_id)
              .limit(1)
              .maybeSingle()
            if (byId.error) throw byId.error
            data = (byId.data as { id?: string; slug?: string } | null) || null
          }
          if (!data && card.source_slug) {
            const bySlug = await db()
              .from(table as never)
              .select('id,slug')
              .eq('slug', card.source_slug)
              .limit(1)
              .maybeSingle()
            if (bySlug.error) throw bySlug.error
            data = (bySlug.data as { id?: string; slug?: string } | null) || null
            if (data && card.source_id && data.id && data.id !== card.source_id) {
              issues.push(
                issue(
                  {
                    ...base,
                    severity: 'warning',
                    issueType: 'card_source_id_mismatch',
                    // Alias for Content Health filters / docs
                    title: 'SOURCE_ID_MISMATCH · Calendar card source_id stale — slug still matches',
                    description: `Card source_id “${card.source_id}” not found, but slug “${card.source_slug}” resolves. Run Sync Calendar Cards.`,
                    domain: 'relationships',
                  },
                  now,
                ),
              )
            }
          }
          if (!data) {
            issues.push(
              issue(
                {
                  ...base,
                  severity: published ? 'critical' : 'warning',
                  issueType: 'card_source_not_found',
                  title: `MISSING_SOURCE · Linked ${sourceType} source not found`,
                  description: `No row in ${table} for id=${card.source_id || '—'} slug=${card.source_slug || '—'}.`,
                  domain: 'relationships',
                },
                now,
              ),
            )
          } else if (
            card.source_id &&
            card.source_slug &&
            data.slug &&
            data.slug !== card.source_slug &&
            data.id === card.source_id
          ) {
            issues.push(
              issue(
                {
                  ...base,
                  severity: 'review',
                  issueType: 'card_source_slug_mismatch',
                  title: 'SOURCE_SLUG_MISMATCH · Calendar card source_slug ≠ linked record slug',
                  description: `Card source_slug “${card.source_slug}” vs record “${data.slug}”.`,
                  domain: 'relationships',
                },
                now,
              ),
            )
          }
        } catch (error) {
          logErr(`card source ${sourceType}`, error)
          issues.push(
            issue(
              {
                ...base,
                severity: 'warning',
                issueType: 'card_source_lookup_failed',
                title: `Could not validate linked ${sourceType}`,
                description: error instanceof Error ? error.message : 'Source lookup failed.',
                domain: 'system',
              },
              now,
            ),
          )
        }
      }

      if (published && !hasText(card.image_path)) {
        issues.push(
          issue(
            {
              ...base,
              severity: 'warning',
              issueType: 'linked_card_missing_image',
              title: 'Linked calendar card missing image',
              description: 'Linked cards still need a visual image on calendar_cards.',
              domain: 'media',
            },
            now,
          ),
        )
      }
    }
  }

  // Enriched structured calendar sources (authoritative for public Calendar)
  type EnrichedSourceRow = {
    id: string
    slug: string
    title?: string | null
    name?: string | null
    status?: string | null
    summary?: string | null
    what_is_it?: string | null
    why_celebrated?: string | null
    image_path?: string | null
    image_alt?: string | null
    content_review_status?: string | null
  }

  const enrichedSelect =
    'id,slug,status,summary,what_is_it,why_celebrated,image_path,image_alt,content_review_status'
  const sourceTables: Array<{
    table: string
    titleCol: 'title' | 'name'
    adminBase: string
  }> = [
    { table: 'orthodox_observances', titleCol: 'title', adminBase: ADMIN_PATHS.calendarCards },
    { table: 'monthly_commemorations', titleCol: 'title', adminBase: ADMIN_PATHS.calendarCards },
    { table: 'liturgical_fasts', titleCol: 'name', adminBase: ADMIN_PATHS.calendarCards },
    { table: 'liturgical_seasons', titleCol: 'title', adminBase: ADMIN_PATHS.calendarCards },
  ]

  let enrichedRecords = 0
  let enrichedWithSummary = 0
  let enrichedWithWhat = 0
  let enrichedWithWhy = 0

  for (const src of sourceTables) {
    let rows: EnrichedSourceRow[] = []
    try {
      const titleField = src.titleCol === 'name' ? 'name' : 'title'
      rows = await fetchAll<EnrichedSourceRow>(
        src.table,
        `${enrichedSelect},${titleField}`,
      )
    } catch (error) {
      logErr(`${src.table} enriched health`, error)
      continue
    }
    enrichedRecords += rows.length

    const sourceLinkCounts = new Map<string, string[]>()
    for (const card of cards) {
      const st = (card.source_type || '').trim().toLowerCase()
      const expected =
        src.table === 'orthodox_observances'
          ? 'observance'
          : src.table === 'liturgical_fasts'
            ? 'fast'
            : src.table === 'liturgical_seasons'
              ? 'season'
              : 'monthly_commemoration'
      if (st !== expected) continue
      const key = card.source_id || card.source_slug || ''
      if (!key) continue
      const list = sourceLinkCounts.get(key) || []
      list.push(card.id)
      sourceLinkCounts.set(key, list)
    }
    for (const [key, ids] of sourceLinkCounts) {
      if (ids.length < 2) continue
      issues.push(
        issue(
          {
            severity: 'warning',
            domain: 'calendar',
            issueType: 'duplicate_source_link',
            title: `DUPLICATE_CARD · Duplicate calendar_cards link to ${src.table}`,
            description: `${ids.length} cards link to the same source (${key}).`,
            table: 'calendar_cards',
            recordId: ids[0],
            adminRoute: `${ADMIN_PATHS.calendarCards}/${ids[0]}/edit`,
          },
          now,
        ),
      )
    }

    for (const row of rows) {
      const label = (row.title || row.name || row.slug || row.id).trim()
      const published = (row.status || '').toLowerCase() === 'published'
      const base = {
        table: src.table,
        recordId: row.id,
        recordSlug: row.slug,
        adminRoute: src.adminBase,
        domain: 'calendar' as const,
      }
      const expected =
        src.table === 'orthodox_observances'
          ? 'observance'
          : src.table === 'liturgical_fasts'
            ? 'fast'
            : src.table === 'liturgical_seasons'
              ? 'season'
              : 'monthly_commemoration'
      const hasCard = cards.some((card) => {
        const st = (card.source_type || '').trim().toLowerCase()
        if (st !== expected) return false
        if (card.source_id && card.source_id === row.id) return true
        if (card.source_slug && row.slug && card.source_slug === row.slug) return true
        return false
      })
      if (published && !hasCard) {
        issues.push(
          issue(
            {
              ...base,
              severity: 'warning',
              issueType: 'source_missing_calendar_card',
              title: `Missing calendar card for ${label}`,
              description: `Published ${src.table} “${label}” has no linked calendar_cards row. Run Sync Calendar Cards.`,
              adminRoute: ADMIN_PATHS.calendarCards,
            },
            now,
          ),
        )
      }
      if (hasText(row.summary)) enrichedWithSummary += 1
      else if (published) {
        issues.push(
          issue(
            {
              ...base,
              severity: 'review',
              issueType: 'source_missing_summary',
              title: `Missing summary: ${label}`,
              description: `${src.table} “${label}” has no summary for the public Calendar.`,
            },
            now,
          ),
        )
      }
      if (hasText(row.what_is_it)) enrichedWithWhat += 1
      else if (published) {
        issues.push(
          issue(
            {
              ...base,
              severity: 'review',
              issueType: 'source_missing_what_is_it',
              title: `Missing what_is_it: ${label}`,
              description: `${src.table} “${label}” lacks educational definition text.`,
            },
            now,
          ),
        )
      }
      if (hasText(row.why_celebrated)) enrichedWithWhy += 1
      else if (published) {
        issues.push(
          issue(
            {
              ...base,
              severity: 'review',
              issueType: 'source_missing_why_celebrated',
              title: `Missing why_celebrated: ${label}`,
              description: `${src.table} “${label}” lacks why-celebrated text.`,
            },
            now,
          ),
        )
      }
      if (
        (src.table === 'orthodox_observances' || src.table === 'monthly_commemorations') &&
        published &&
        !hasText(row.image_path)
      ) {
        issues.push(
          issue(
            {
              ...base,
              severity: 'info',
              issueType: 'source_missing_image',
              title: `Missing image: ${label}`,
              description: `${src.table} “${label}” has no image_path (calendar_cards can still supply one).`,
              domain: 'media',
            },
            now,
          ),
        )
      }
      if (hasText(row.image_path) && !hasText(row.image_alt) && published) {
        issues.push(
          issue(
            {
              ...base,
              severity: 'warning',
              issueType: 'source_missing_image_alt',
              title: `Missing image alt: ${label}`,
              description: `${src.table} “${label}” has image_path but empty image_alt.`,
              domain: 'media',
            },
            now,
          ),
        )
      }
      const review = (row.content_review_status || '').trim().toLowerCase()
      if (review && review !== 'approved' && review !== 'ok' && published) {
        issues.push(
          issue(
            {
              ...base,
              severity: 'review',
              issueType: 'source_review_needed',
              title: `Review needed: ${label}`,
              description: `${src.table} “${label}” content_review_status is “${row.content_review_status}”.`,
            },
            now,
          ),
        )
      }
    }
  }

  return {
    issues,
    records: cards.length + enrichedRecords,
    coverage: [
      coverage('calendar-image', 'Calendar cards with image', withImage, cards.length),
      coverage('calendar-summary', 'Calendar cards with summary', withSummary, cards.length),
      coverage('calendar-why', 'Calendar cards with why_celebrated', withWhy, cards.length),
      coverage(
        'source-summary',
        'Structured sources with summary',
        enrichedWithSummary,
        enrichedRecords,
      ),
      coverage(
        'source-what',
        'Structured sources with what_is_it',
        enrichedWithWhat,
        enrichedRecords,
      ),
      coverage(
        'source-why',
        'Structured sources with why_celebrated',
        enrichedWithWhy,
        enrichedRecords,
      ),
    ],
  }
}

async function checkSynaxarium(now: string): Promise<{
  issues: ContentHealthIssue[]
  records: number
}> {
  const [days, commemorations] = await Promise.all([
    fetchAll<SynaxDayRow>(
      'synaxarium_days',
      'id,slug,ethiopian_month_number,ethiopian_day,status,image_path,image_alt',
    ),
    fetchAll<SynaxCommRow>(
      'synaxarium_commemorations',
      'id,day_id,day_slug,slug,title,summary,body_amharic,body_english,status,image_path,image_alt',
    ),
  ])

  const issues: ContentHealthIssue[] = []
  const dayById = new Map(days.map((d) => [d.id, d]))

  for (const [slug, ids] of findDuplicateSlugs(days)) {
    issues.push(
      issue(
        {
          severity: 'warning',
          domain: 'synaxarium',
          issueType: 'duplicate_day_slug',
          title: `Duplicate Synaxarium day slug: ${slug}`,
          description: `${ids.length} days share this slug.`,
          table: 'synaxarium_days',
          recordId: ids[0],
          recordSlug: slug,
          adminRoute: `${ADMIN_PATHS.calendarSynaxarium}/${ids[0]}/edit`,
        },
        now,
      ),
    )
  }

  for (const day of days) {
    const count = commemorations.filter((c) => c.day_id === day.id).length
    if (day.status === 'published' && count === 0) {
      issues.push(
        issue(
          {
            severity: 'review',
            domain: 'synaxarium',
            issueType: 'published_day_empty',
            title: `Published Synaxarium day has no commemorations: ${day.slug}`,
            description: 'Published day with zero commemorations.',
            table: 'synaxarium_days',
            recordId: day.id,
            recordSlug: day.slug,
            adminRoute: `${ADMIN_PATHS.calendarSynaxarium}/${day.id}/edit`,
          },
          now,
        ),
      )
    }
    if (hasText(day.image_path) && !hasText(day.image_alt)) {
      issues.push(
        issue(
          {
            severity: 'warning',
            domain: 'media',
            issueType: 'synax_day_missing_alt',
            title: `Synaxarium day image missing alt: ${day.slug}`,
            description: 'image_path set but image_alt empty.',
            table: 'synaxarium_days',
            recordId: day.id,
            recordSlug: day.slug,
            adminRoute: `${ADMIN_PATHS.calendarSynaxarium}/${day.id}/edit`,
            repairable: true,
          },
          now,
        ),
      )
    }
  }

  for (const row of commemorations) {
    const day = dayById.get(row.day_id)
    if (!day) {
      issues.push(
        issue(
          {
            severity: 'critical',
            domain: 'relationships',
            issueType: 'orphan_commemoration',
            title: `Orphan Synaxarium commemoration: ${row.slug || row.id}`,
            description: `day_id ${row.day_id} does not exist.`,
            table: 'synaxarium_commemorations',
            recordId: row.id,
            recordSlug: row.slug,
          },
          now,
        ),
      )
    } else if (hasText(row.day_slug) && row.day_slug !== day.slug) {
      issues.push(
        issue(
          {
            severity: 'warning',
            domain: 'relationships',
            issueType: 'commemoration_day_slug_mismatch',
            title: `Commemoration day_slug mismatch: ${row.slug}`,
            description: `day_slug “${row.day_slug}” ≠ day.slug “${day.slug}”.`,
            table: 'synaxarium_commemorations',
            recordId: row.id,
            recordSlug: row.slug,
            adminRoute: `${ADMIN_PATHS.calendarSynaxarium}/${day.id}/edit`,
          },
          now,
        ),
      )
    }
    if (!hasText(row.title)) {
      issues.push(
        issue(
          {
            severity: row.status === 'published' ? 'critical' : 'warning',
            domain: 'synaxarium',
            issueType: 'commemoration_missing_title',
            title: `Commemoration missing title: ${row.slug || row.id}`,
            description: 'Title is empty.',
            table: 'synaxarium_commemorations',
            recordId: row.id,
            recordSlug: row.slug,
            adminRoute: day
              ? `${ADMIN_PATHS.calendarSynaxarium}/${day.id}/edit`
              : ADMIN_PATHS.calendarSynaxarium,
          },
          now,
        ),
      )
    }
    if (
      row.status === 'published' &&
      !hasText(row.summary) &&
      !hasText(row.body_amharic) &&
      !hasText(row.body_english)
    ) {
      issues.push(
        issue(
          {
            severity: 'warning',
            domain: 'synaxarium',
            issueType: 'commemoration_thin_content',
            title: `Published commemoration has little content: ${row.title || row.slug}`,
            description: 'No summary or body text in Amharic/English.',
            table: 'synaxarium_commemorations',
            recordId: row.id,
            recordSlug: row.slug,
            adminRoute: day
              ? `${ADMIN_PATHS.calendarSynaxarium}/${day.id}/edit`
              : ADMIN_PATHS.calendarSynaxarium,
          },
          now,
        ),
      )
    }
    if (hasText(row.image_path) && !hasText(row.image_alt)) {
      issues.push(
        issue(
          {
            severity: 'warning',
            domain: 'media',
            issueType: 'commemoration_missing_alt',
            title: `Commemoration image missing alt: ${row.title || row.slug}`,
            description: 'image_path set but image_alt empty.',
            table: 'synaxarium_commemorations',
            recordId: row.id,
            recordSlug: row.slug,
            repairable: true,
          },
          now,
        ),
      )
    }
  }

  return { issues, records: days.length + commemorations.length }
}

async function checkLiturgy(now: string): Promise<{
  issues: ContentHealthIssue[]
  records: number
}> {
  const [collections, sections, entries] = await Promise.all([
    fetchAll<LiturgyCollectionRow>(
      'liturgy_collections',
      'id,slug,title,status,sort_order',
      { column: 'sort_order' },
    ),
    fetchAll<LiturgySectionRow>(
      'liturgy_sections',
      'id,collection_id,slug,title,status,sort_order',
      { column: 'sort_order' },
    ),
    fetchAll<LiturgyEntryRow>(
      'liturgy_entries',
      'id,slug,title,section_id,collection_id,text_amharic,text_english,sort_order,status',
      { column: 'sort_order' },
    ),
  ])

  const issues: ContentHealthIssue[] = []
  const collectionById = new Map(collections.map((c) => [c.id, c]))
  const sectionById = new Map(sections.map((s) => [s.id, s]))

  for (const section of sections) {
    if (!collectionById.has(section.collection_id)) {
      issues.push(
        issue(
          {
            severity: 'critical',
            domain: 'liturgy',
            issueType: 'orphan_liturgy_section',
            title: `Orphan liturgy section: ${section.slug || section.id}`,
            description: `collection_id ${section.collection_id} missing.`,
            table: 'liturgy_sections',
            recordId: section.id,
            recordSlug: section.slug,
            adminRoute: ADMIN_PATHS.prayLiturgy,
          },
          now,
        ),
      )
    }
    const count = entries.filter((e) => e.section_id === section.id).length
    if (section.status === 'published' && count === 0) {
      issues.push(
        issue(
          {
            severity: 'warning',
            domain: 'liturgy',
            issueType: 'empty_liturgy_section',
            title: `Published liturgy section has no entries: ${section.title || section.slug}`,
            description: 'Section is published with zero entries.',
            table: 'liturgy_sections',
            recordId: section.id,
            recordSlug: section.slug,
            adminRoute: `${ADMIN_PATHS.prayLiturgy}/${section.collection_id}/edit`,
          },
          now,
        ),
      )
    }
  }

  for (const entry of entries) {
    if (entry.section_id && !sectionById.has(entry.section_id)) {
      issues.push(
        issue(
          {
            severity: 'critical',
            domain: 'liturgy',
            issueType: 'orphan_liturgy_entry',
            title: `Orphan liturgy entry: ${entry.slug || entry.id}`,
            description: `section_id ${entry.section_id} missing.`,
            table: 'liturgy_entries',
            recordId: entry.id,
            recordSlug: entry.slug,
          },
          now,
        ),
      )
    }
    if (
      entry.status === 'published' &&
      !hasText(entry.text_amharic) &&
      !hasText(entry.text_english)
    ) {
      issues.push(
        issue(
          {
            severity: 'warning',
            domain: 'liturgy',
            issueType: 'liturgy_entry_no_text',
            title: `Published liturgy entry missing text: ${entry.title || entry.slug}`,
            description: 'No Amharic or English text.',
            table: 'liturgy_entries',
            recordId: entry.id,
            recordSlug: entry.slug,
          },
          now,
        ),
      )
    }
  }

  return { issues, records: collections.length + sections.length + entries.length }
}

function emptyDomain(domain: HealthDomain, label: string): DomainMetric {
  return {
    domain,
    label,
    recordCount: 0,
    critical: 0,
    warning: 0,
    review: 0,
    info: 0,
    highlights: [],
  }
}

/** Probe favorites / reading-progress tables and Pray search catalog health. */
async function checkUserPersistence(now: string): Promise<{ issues: ContentHealthIssue[] }> {
  const issues: ContentHealthIssue[] = []
  if (!supabaseConfigured()) {
    issues.push(
      issue(
        {
          severity: 'warning',
          domain: 'system',
          issueType: 'supabase_unconfigured',
          title: 'Supabase client not configured',
          description: 'Favorites and reading progress cannot sync without a configured client.',
          table: '—',
        },
        now,
      ),
    )
    return { issues }
  }

  const client = db()

  const favProbe = await client.from('user_favorites').select('id', { count: 'exact', head: true }).limit(1)
  if (favProbe.error) {
    logErr('user_favorites probe', favProbe.error)
    issues.push(
      issue(
        {
          severity: 'critical',
          domain: 'system',
          issueType: 'user_favorites_inaccessible',
          title: 'user_favorites missing or inaccessible',
          description: `${favProbe.error.message}. Apply supabase/FIX_USER_FAVORITES_PROGRESS.sql.`,
          table: 'user_favorites',
          metadata: {
            code: favProbe.error.code || null,
            hint: favProbe.error.hint || null,
          },
        },
        now,
      ),
    )
  }

  const progressProbe = await client
    .from('user_reading_progress')
    .select('id', { count: 'exact', head: true })
    .limit(1)
  if (progressProbe.error) {
    logErr('user_reading_progress probe', progressProbe.error)
    issues.push(
      issue(
        {
          severity: 'critical',
          domain: 'system',
          issueType: 'user_reading_progress_inaccessible',
          title: 'user_reading_progress missing or inaccessible',
          description: `${progressProbe.error.message}. Apply supabase/FIX_USER_FAVORITES_PROGRESS.sql.`,
          table: 'user_reading_progress',
          metadata: {
            code: progressProbe.error.code || null,
            hint: progressProbe.error.hint || null,
          },
        },
        now,
      ),
    )
  }

  // Legacy public.mezmur_favorites is retired — favorites use public.user_favorites only.

  // Sample Pray search catalog for missing routes / duplicate slugs within a collection
  try {
    type PrayerSample = { id: string; slug: string; collection_slug: string | null; status: string }
    const { data, error } = await (client as unknown as {
      from: (t: string) => {
        select: (c: string) => {
          eq: (col: string, val: string) => {
            limit: (n: number) => Promise<{ data: PrayerSample[] | null; error: { message: string } | null }>
          }
        }
      }
    })
      .from('prayers')
      .select('id,slug,collection_slug,status')
      .eq('status', 'published')
      .limit(2000)
    if (error) throw error
    const prayers = data || []
    const seen = new Map<string, string>()
    for (const row of prayers) {
      const key = `${row.collection_slug || ''}::${row.slug}`
      if (!row.slug) {
        issues.push(
          issue(
            {
              severity: 'warning',
              domain: 'prayers',
              issueType: 'pray_search_missing_slug',
              title: 'Published prayer missing slug (search routing)',
              description: 'Pray search cannot build a canonical route without a slug.',
              table: 'prayers',
              recordId: row.id,
            },
            now,
          ),
        )
        continue
      }
      const prev = seen.get(key)
      if (prev) {
        issues.push(
          issue(
            {
              severity: 'review',
              domain: 'prayers',
              issueType: 'pray_search_duplicate_slug',
              title: `Duplicate prayer slug in collection: ${row.slug}`,
              description: `Slug collision may confuse Pray search routing (${prev} vs ${row.id}).`,
              table: 'prayers',
              recordId: row.id,
              recordSlug: row.slug,
            },
            now,
          ),
        )
      } else {
        seen.set(key, row.id)
      }
    }
  } catch (error) {
    logErr('pray search catalog sample', error)
  }

  return { issues }
}

function supabaseConfigured(): boolean {
  try {
    db()
    return true
  } catch {
    return false
  }
}


/** Run full Content Health audit. Domain failures are isolated. */
export async function runContentHealthCheck(
  onProgress?: ProgressFn,
): Promise<ContentHealthReport> {
  const started = Date.now()
  const now = new Date().toISOString()
  const allIssues: ContentHealthIssue[] = []
  const coverage: CoverageMetric[] = []
  const domainErrors: ContentHealthReport['domainErrors'] = []
  const domains: DomainMetric[] = []
  let recordsChecked = 0

  let psalms: ContentHealthReport['psalms'] = {
    collectionSlug: null,
    detected: 0,
    expected: EXPECTED_PSALMS,
    min: null,
    max: null,
    missing: [],
    duplicates: [],
    invalidSlugs: [],
  }
  let zeweter: ContentHealthReport['zeweter'] = {
    collectionSlug: null,
    prayerCount: 0,
    firstSlug: null,
    firstTitle: null,
    lastSlug: null,
    lastTitle: null,
    firstOk: false,
    lastOk: false,
  }

  onProgress?.({ phase: 'Checking Mezmur…', domain: 'mezmur' })
  try {
    const mezmur = await checkMezmur(now)
    const hymnClass = await checkHymnClassification(now)
    allIssues.push(...mezmur.issues, ...hymnClass.issues)
    coverage.push(...mezmur.coverage, ...hymnClass.coverage)
    recordsChecked += mezmur.records
    const sev = countBySeverity([...mezmur.issues, ...hymnClass.issues], 'mezmur')
    const mediaSev = countBySeverity(mezmur.issues, 'media')
    domains.push({
      domain: 'mezmur',
      label: 'Mezmur / Hymn Classification',
      recordCount: mezmur.records,
      ...sev,
      highlights: [...mezmur.coverage, ...hymnClass.coverage]
        .slice(0, 3)
        .map((c) => `${c.label}: ${c.percent}%`),
    })
    // fold mezmur media into media domain later
    void mediaSev
  } catch (error) {
    logErr('mezmur', error)
    domainErrors.push({
      domain: 'mezmur',
      message: error instanceof Error ? error.message : 'Mezmur check failed',
    })
    domains.push(emptyDomain('mezmur', 'Mezmur'))
  }

  onProgress?.({ phase: 'Checking Prayers & Psalms…', domain: 'prayers' })
  try {
    const prayerBundle = await checkPrayersAndPsalms(now)
    const guideBundle = await checkPrayerGuides(now)
    allIssues.push(...prayerBundle.issues, ...guideBundle.issues)
    coverage.push(...prayerBundle.coverage)
    recordsChecked += prayerBundle.prayerRecords + guideBundle.records
    psalms = prayerBundle.psalms
    zeweter = prayerBundle.zeweter
    const prayerSev = countBySeverity(
      [...prayerBundle.issues, ...guideBundle.issues].filter(
        (i) => i.domain === 'prayers' || i.domain === 'relationships',
      ),
      'prayers',
    )
    // recount prayers domain specifically
    const prayerOnly = [...prayerBundle.issues, ...guideBundle.issues].filter(
      (i) => i.domain === 'prayers',
    )
    domains.push({
      domain: 'prayers',
      label: 'Prayers',
      recordCount: prayerBundle.prayerRecords + guideBundle.records,
      critical: prayerOnly.filter((i) => i.severity === 'critical').length,
      warning: prayerOnly.filter((i) => i.severity === 'warning').length,
      review: prayerOnly.filter((i) => i.severity === 'review').length,
      info: prayerOnly.filter((i) => i.severity === 'info').length,
      highlights: [
        zeweter.collectionSlug
          ? `Zeweter: ${zeweter.prayerCount} prayers`
          : 'Zeweter collection missing',
        guideBundle.records
          ? `Guides checked: ${guideBundle.records}`
          : 'No prayer guides yet',
      ],
    })
    void prayerSev
    const psalmOnly = prayerBundle.issues.filter((i) => i.domain === 'psalms')
    domains.push({
      domain: 'psalms',
      label: 'Psalms',
      recordCount: psalms.detected,
      critical: psalmOnly.filter((i) => i.severity === 'critical').length,
      warning: psalmOnly.filter((i) => i.severity === 'warning').length,
      review: psalmOnly.filter((i) => i.severity === 'review').length,
      info: psalmOnly.filter((i) => i.severity === 'info').length,
      highlights: [
        `${psalms.detected} / ${psalms.expected} detected`,
        psalms.missing.length ? `Missing: ${psalms.missing.slice(0, 8).join(', ')}${psalms.missing.length > 8 ? '…' : ''}` : 'No missing Psalms',
      ],
    })
  } catch (error) {
    logErr('prayers', error)
    domainErrors.push({
      domain: 'prayers',
      message: error instanceof Error ? error.message : 'Prayer check failed',
    })
    domains.push(emptyDomain('prayers', 'Prayers'), emptyDomain('psalms', 'Psalms'))
  }

  onProgress?.({ phase: 'Checking Liturgy…', domain: 'liturgy' })
  try {
    const liturgy = await checkLiturgy(now)
    allIssues.push(...liturgy.issues)
    recordsChecked += liturgy.records
    const sev = countBySeverity(liturgy.issues, 'liturgy')
    domains.push({
      domain: 'liturgy',
      label: 'Liturgy',
      recordCount: liturgy.records,
      ...sev,
      highlights: [],
    })
  } catch (error) {
    logErr('liturgy', error)
    domainErrors.push({
      domain: 'liturgy',
      message: error instanceof Error ? error.message : 'Liturgy check failed',
    })
    domains.push(emptyDomain('liturgy', 'Liturgy'))
  }

  onProgress?.({ phase: 'Checking Calendar…', domain: 'calendar' })
  try {
    const calendar = await checkCalendar(now)
    allIssues.push(...calendar.issues)
    coverage.push(...calendar.coverage)
    recordsChecked += calendar.records
    const calIssues = calendar.issues.filter((i) => i.domain === 'calendar')
    domains.push({
      domain: 'calendar',
      label: 'Calendar',
      recordCount: calendar.records,
      critical: calIssues.filter((i) => i.severity === 'critical').length,
      warning: calIssues.filter((i) => i.severity === 'warning').length,
      review: calIssues.filter((i) => i.severity === 'review').length,
      info: calIssues.filter((i) => i.severity === 'info').length,
      highlights: calendar.coverage.slice(0, 2).map((c) => `${c.label}: ${c.percent}%`),
    })
  } catch (error) {
    logErr('calendar', error)
    domainErrors.push({
      domain: 'calendar',
      message: error instanceof Error ? error.message : 'Calendar check failed',
    })
    domains.push(emptyDomain('calendar', 'Calendar'))
  }

  onProgress?.({ phase: 'Checking Synaxarium…', domain: 'synaxarium' })
  try {
    const synax = await checkSynaxarium(now)
    allIssues.push(...synax.issues)
    recordsChecked += synax.records
    const synIssues = synax.issues.filter((i) => i.domain === 'synaxarium')
    domains.push({
      domain: 'synaxarium',
      label: 'Synaxarium',
      recordCount: synax.records,
      critical: synIssues.filter((i) => i.severity === 'critical').length,
      warning: synIssues.filter((i) => i.severity === 'warning').length,
      review: synIssues.filter((i) => i.severity === 'review').length,
      info: synIssues.filter((i) => i.severity === 'info').length,
      highlights: [],
    })
  } catch (error) {
    logErr('synaxarium', error)
    domainErrors.push({
      domain: 'synaxarium',
      message: error instanceof Error ? error.message : 'Synaxarium check failed',
    })
    domains.push(emptyDomain('synaxarium', 'Synaxarium'))
  }

  // Aggregate media + relationships domain cards from all issues
  onProgress?.({ phase: 'Checking Favorites & Progress…', domain: 'system' })
  try {
    const persistence = await checkUserPersistence(now)
    allIssues.push(...persistence.issues)
  } catch (error) {
    logErr('persistence', error)
    domainErrors.push({
      domain: 'system',
      message: error instanceof Error ? error.message : 'Favorites/progress check failed',
    })
  }

  const mediaIssues = allIssues.filter((i) => i.domain === 'media')
  domains.push({
    domain: 'media',
    label: 'Media',
    recordCount: mediaIssues.length,
    critical: mediaIssues.filter((i) => i.severity === 'critical').length,
    warning: mediaIssues.filter((i) => i.severity === 'warning').length,
    review: mediaIssues.filter((i) => i.severity === 'review').length,
    info: mediaIssues.filter((i) => i.severity === 'info').length,
    highlights: [`${mediaIssues.filter((i) => i.issueType.includes('alt')).length} missing alt texts`],
  })
  const relIssues = allIssues.filter((i) => i.domain === 'relationships')
  domains.push({
    domain: 'relationships',
    label: 'Relationships',
    recordCount: relIssues.length,
    critical: relIssues.filter((i) => i.severity === 'critical').length,
    warning: relIssues.filter((i) => i.severity === 'warning').length,
    review: relIssues.filter((i) => i.severity === 'review').length,
    info: relIssues.filter((i) => i.severity === 'info').length,
    highlights: [],
  })

  for (const err of domainErrors) {
    allIssues.push(
      issue(
        {
          severity: 'critical',
          domain: 'system',
          issueType: 'domain_scan_failed',
          title: `${err.domain} health scan failed`,
          description: err.message,
          table: '—',
        },
        now,
      ),
    )
  }

  const critical = allIssues.filter((i) => i.severity === 'critical').length
  const warning = allIssues.filter((i) => i.severity === 'warning').length
  const review = allIssues.filter((i) => i.severity === 'review').length
  const info = allIssues.filter((i) => i.severity === 'info').length
  const problemRecords = new Set(
    allIssues.map((i) => i.recordId || i.recordSlug || i.id).filter(Boolean),
  ).size
  const healthyEstimate = Math.max(0, recordsChecked - problemRecords)

  const completenessPercent =
    coverage.length === 0
      ? 100
      : Math.round(coverage.reduce((sum, c) => sum + c.percent, 0) / coverage.length)

  onProgress?.({ phase: 'Done' })

  return {
    checkedAt: now,
    durationMs: Date.now() - started,
    issues: allIssues.sort((a, b) => {
      const order: Record<HealthSeverity, number> = {
        critical: 0,
        warning: 1,
        review: 2,
        info: 3,
      }
      return order[a.severity] - order[b.severity] || a.title.localeCompare(b.title)
    }),
    domains,
    coverage,
    totals: {
      critical,
      warning,
      review,
      info,
      healthyEstimate,
      recordsChecked,
    },
    completenessPercent,
    psalms,
    zeweter,
    domainErrors,
  }
}

export type { ContentHealthIssue, ContentHealthReport, HealthDomain, HealthSeverity }