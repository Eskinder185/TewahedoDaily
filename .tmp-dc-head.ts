/**
 * Selected-day "Day Experience" context for the Calendar right panel.
 * Sources stay separated: observances / fasts / seasons / monthly / synaxarium / mezmur / liturgy.
 */
import { gregorianToEthiopian, formatEthiopianLong, formatEthiopianDate, ETHIOPIAN_MONTH_NAMES } from '../lib/ethiopianDate'
import { getSynaxariumDayWithCommemorations } from '../lib/synaxarium/synaxariumService'
import { presentSynaxariumForDay } from '../lib/synaxarium/synaxariumPresentation'
import type {
  LiturgyCollection,
  LiturgyEntry,
  SynaxariumCommemoration,
} from '../lib/prayers/prayerLibraryTypes'
import {
  getLiturgyCollections,
  getLiturgyEntriesForSection,
  getLiturgySections,
} from '../lib/prayers/liturgySupabase'
import { resolveContentMediaUrl } from '../lib/cms/contentMedia'
import { buildDailyFaithContext, recommendDailyMezmurs, recommendDailyScripture, type RecommendedScripture } from '../lib/recommendations/dailyFaithRecommendationEngine'
import {
  loadOrthodoxCalendarCatalog,
  resolveOrthodoxDay,
} from '../lib/calendar/orthodoxCalendarData'
import type {
  DayFast,
  DayMonthlyCommemoration,
  DayObservance,
  DaySeason,
} from '../lib/calendar/orthodoxCalendarTypes'

export type DayBadge = {
  id: string
  label: string
  tone: 'feast' | 'fast' | 'saint' | 'season' | 'mary' | 'angel' | 'neutral'
}

export type DayCommemorationItem = {
  id: string
  slug: string
  title: string
  titleAmharic: string
  type: string
  typeLabel: string
  summary: string
  longerSummary: string
  imageUrl: string | null
  imageAlt: string
  featured: boolean
  sortOrder: number
  /** Internal only — never show in public UI. */
  reviewStatus?: 'ok' | 'needs_review' | 'omit_public'
  summaryDerived?: boolean
}

export type DayReadingItem = {
  id: string
  order: number
  label: string
  reference: string
  note: string
}

export type DayLiturgySummary = {
  collectionSlug: string
  collectionTitle: string
  openHref: string
  dayTypeLabel: string
  liturgicalEmphasis: string
  serviceFlow: string[]
  anaphoraTitle: string | null
  anaphoraSummary: string
  readingsPatternLabel: string
  readings: DayReadingItem[]
}

export type DayMezmurRecommendation = {
  id: string
  slug: string
  title: string
  titleAmharic: string
  singerName?: string | null
  hasPlayableMedia?: boolean
  language: string | null
  category: string | null
  occasion: string | null
  thumbnailUrl: string | null
  imageAlt: string
  youtubeUrl: string | null
  audioUrl: string | null
  practiceHref: string
  playHref: string | null
  matchReason: string
}

export type DayChurchContext = {
  gregorianDate: string
  gregorianLabel: string
  weekdayLabel: string
  ethiopianDate: {
    year: number
    month: number
    monthName: string
    day: number
  }
  ethiopianLabel: string
  ethiopianLabelAmharic?: string
  dayTitle: string
  dayOneLiner: string
  badges: DayBadge[]
  primaryObservance: DayObservance | null
  observances: DayObservance[]
  activeFast: DayFast | null
  fastFreeRule: DayFast | null
  relatedFasts: DayFast[]
  season: DaySeason | null
  monthlyCommemorations: DayMonthlyCommemoration[]
  synaxarium: DayCommemorationItem[]
  synaxariumDaySlug: string | null
  synaxariumAvailable: boolean
  fastingStatus: {
    isFastDay: boolean
    isFastFree: boolean
    isOptionalFast?: boolean
    label: string | null
    exceptionNote: string | null
  }
  liturgySummary: DayLiturgySummary | null
  mezmurRecommendations: DayMezmurRecommendation[]
  dailyScriptures?: RecommendedScripture[]
  whyThisDay: string
  practiceLinks: Array<{ label: string; href: string }>
}


const WEEKDAY_LONG = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
] as const

const MONTH_LONG = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
] as const

function stripLocal(d: Date): Date {
  return new Date(d.getFullYear(), d.getMonth(), d.getDate())
}

function toIsoLocal(d: Date): string {
  const y = d.getFullYear()
  const m = String(d.getMonth() + 1).padStart(2, '0')
  const day = String(d.getDate()).padStart(2, '0')
  return `${y}-${m}-${day}`
}

function formatGregorianLong(d: Date): string {
  return `${MONTH_LONG[d.getMonth()]} ${d.getDate()}, ${d.getFullYear()}`
}

function formatTypeLabel(raw: string | null | undefined): string {
  const value = (raw || '').trim()
  if (!value) return 'Commemoration'
  return value
    .replace(/[_-]+/g, ' ')
    .split(/\s+/)
    .filter(Boolean)
    .map((part) => part.charAt(0).toUpperCase() + part.slice(1).toLowerCase())
    .join(' ')
}

export function isGenericWeeklyFastCommemoration(item: {
  title?: string
  commemorationType?: string
  type?: string
}): boolean {
  const title = (item.title || '').toLowerCase()
  const type = (item.commemorationType || item.type || '').toLowerCase()
  if (/wednesday\s*fast|friday\s*fast|weekly\s*fast/.test(title)) return true
  if (/^(wednesday|friday)\b/.test(title) && /fast/.test(title)) return true
  if (type === 'weekly-fast' || type === 'weekday-fast') return true
  return false
}


function readingLabelFromEntry(entry: LiturgyEntry, index: number): string {
  const blob = `${entry.contentType || ''} ${entry.title || ''} ${entry.slug || ''}`.toLowerCase()
  if (/epistle|paul/.test(blob)) return 'Epistle'
  if (/acts/.test(blob)) return 'Acts'
  if (/psalm/.test(blob)) return 'Psalm'
  if (/gospel/.test(blob)) return 'Gospel'
  if (/lesson|reading/.test(blob)) return `Reading ${index + 1}`
  return entry.title?.trim() || `Reading ${index + 1}`
}

async function buildLiturgySummary(
  primary: DayObservance | null,
): Promise<DayLiturgySummary | null> {
  try {
    const collections = await getLiturgyCollections()
    if (!collections.length) return null

    const preferred: LiturgyCollection =
      collections.find(
        (c: LiturgyCollection) =>
          /divine|liturgy|kidase/i.test(c.slug) || /divine|liturgy|kidase/i.test(c.title),
      ) || collections[0]

    const sections = await getLiturgySections(preferred.id)
    const readingsSection =
      sections.find((s) => /reading/i.test(`${s.slug} ${s.title}`)) || sections[0] || null

    let readings: DayReadingItem[] = []
    if (readingsSection) {
      const entries = await getLiturgyEntriesForSection(readingsSection.id)
      readings = entries.slice(0, 8).map((entry, index) => ({
        id: entry.id,
        order: index + 1,
        label: readingLabelFromEntry(entry, index),
        reference: entry.title || entry.slug,
        note: '',
      }))
    }

    const anaphoraSection = sections.find((s) => /anaphora|kidase/i.test(`${s.slug} ${s.title}`))
    const dayTypeLabel = primary
      ? primary.isMajor
        ? 'Great feast'
        : formatTypeLabel(primary.observanceType)
      : 'Ordinary day'

    return {
      collectionSlug: preferred.slug,
      collectionTitle: preferred.title,
      openHref: `/pray/divine-liturgy`,
      dayTypeLabel,
      liturgicalEmphasis: primary
        ? `Keep the day’s focus on ${primary.title}.`
        : 'Pray with attentiveness to today’s commemorations.',
      serviceFlow: ['Opening', 'Readings', 'Anaphora', 'Communion'],
      anaphoraTitle: anaphoraSection?.title || null,
      anaphoraSummary: anaphoraSection
        ? `See ${anaphoraSection.title} in the Divine Liturgy collection.`
        : 'Standard anaphora is used for this day.',
      readingsPatternLabel: readings.length
        ? 'Readings from the liturgy library'
        : 'Standard reading pattern for this observance',
      readings,
    }
  } catch (cause) {
    if (import.meta.env.DEV) console.error('[dayChurchContext] liturgy', cause)
    return null
  }
}

function buildBadges(input: {
  primary: DayObservance | null
  observances: DayObservance[]
  fast: DayFast | null
  season: DaySeason | null
  monthly: DayMonthlyCommemoration[]
}): DayBadge[] {
  const badges: DayBadge[] = []
  const push = (badge: DayBadge) => {
    if (badges.some((b) => b.id === badge.id || b.label === badge.label)) return
    badges.push(badge)
  }

  const primary = input.primary
  if (primary?.isMajor) {
    push({ id: 'great-feast', label: 'Great feast', tone: 'feast' })
  } else if (primary && /feast/i.test(primary.observanceType)) {
    push({ id: 'feast', label: 'Feast', tone: 'feast' })
  }

  if (input.fast) push({ id: 'fast', label: 'Fast', tone: 'fast' })
  if (input.season) push({ id: 'season', label: 'Season', tone: 'season' })

  const blob = [
    primary?.category,
    primary?.observanceType,
    ...input.observances.map((o) => `${o.category} ${o.observanceType}`),
    ...input.monthly.map((m) => `${m.category} ${m.title}`),
  ]
    .join(' ')
    .toLowerCase()

  if (/mary|marian|virgin|filseta|lideta|kidane/.test(blob)) {
    push({ id: 'marian', label: 'Marian', tone: 'mary' })
  }
  if (/angel|michael|gabriel|raphael|uriel/.test(blob)) {
    push({ id: 'angel', label: 'Angel', tone: 'angel' })
  }
  if (/saint|martyr|apostle|abune|kidus/.test(blob) && !/angel/.test(blob)) {
    push({ id: 'saint', label: 'Saint', tone: 'saint' })
  }

  return badges.slice(0, 6)
}

function buildWhyThisDay(input: {
  primary: DayObservance | null
  season: DaySeason | null
  fast: DayFast | null
  monthly: DayMonthlyCommemoration[]
  synaxarium: DayCommemorationItem[]
}): string {
  const parts: string[] = []
  if (input.primary) {
    parts.push(
      input.primary.description ||
        `Today the Church marks ${input.primary.title}.`,
    )
  } else if (input.monthly[0]) {
    parts.push(`This Ethiopian day carries the monthly remembrance of ${input.monthly[0].title}.`)
  } else if (input.synaxarium[0]) {
    parts.push(
      input.synaxarium[0].summary ||
        `The Synaxarium remembers ${input.synaxarium[0].title} on this day.`,
    )
  }

  if (input.season) {
    parts.push(`We are in ${input.season.title}.`)
  }
  if (input.fast) {
    parts.push(`The Church keeps ${input.fast.name}.`)
  }
  if (!parts.length) {
    return 'Receive this day with quiet prayer, thanksgiving, and attention to the Church’s rhythm of worship.'
  }
  parts.push('Let the tone of prayer be reverent, thankful, and attentive.')
  return parts.join(' ')
}

/**
 * Load the full Day Experience model for a civil (Gregorian) date.
 * Individual sources fail soft — one missing table does not crash the panel.
 */
export async function loadDayChurchContext(date: Date): Promise<DayChurchContext> {
  const day = stripLocal(date)
  const eth = gregorianToEthiopian(day)
  const monthName = ETHIOPIAN_MONTH_NAMES[eth.month - 1] || `Month ${eth.month}`
  const weekdayLabel = WEEKDAY_LONG[day.getDay()]
  const gregorianLabel = formatGregorianLong(day)
  const ethiopianLabel = formatEthiopianLong(eth)
  const ethiopianLabelAmharic = formatEthiopianDate(eth, 'am', { includeYear: true })

  const catalog = await loadOrthodoxCalendarCatalog().catch(() => ({
    observances: [],
    fasts: [],
    seasons: [],
    monthly: [],
    loadedAt: Date.now(),
  }))
  const orthodox = resolveOrthodoxDay(day, catalog)

  let synaxarium: DayCommemorationItem[] = []
  let synaxariumDaySlug: string | null = null
  let synaxariumAvailable = false

  try {
    const bundle = await getSynaxariumDayWithCommemorations(eth.month, eth.day)
    if (bundle?.day) {
      synaxariumAvailable = true
      synaxariumDaySlug = bundle.day.slug
      synaxarium = presentSynaxariumForDay(
        (bundle.commemorations || []).filter(
          (c: SynaxariumCommemoration) => !isGenericWeeklyFastCommemoration(c),
        ),
      )
        .map((item) => {
          const path = item.imagePath
          return {
            id: item.id,
            slug: item.slug,
            title: item.title,
            titleAmharic: item.titleAmharic,
            type: item.category,
            typeLabel: item.categoryLabel,
            summary: item.summary,
            longerSummary: item.body || item.summary,
            imageUrl: path ? resolveContentMediaUrl(path) || null : null,
            imageAlt: item.imageAlt || item.title,
            featured: item.featured,
            sortOrder: item.sortOrder,
            reviewStatus: item.reviewStatus,
            summaryDerived: item.summaryDerived,
          } satisfies DayCommemorationItem
        })
        // Preserve Synaxarium source order (sort_order), not featured-first.
    }
  } catch (cause) {
    if (import.meta.env.DEV) console.error('[dayChurchContext] synaxarium', cause)
  }

  const liturgySummary = await buildLiturgySummary(orthodox.primaryObservance).catch(() => null)
  const dailyFaith = await buildDailyFaithContext(day).catch(() => null)
  const recommendedMezmurs = dailyFaith ? await recommendDailyMezmurs(dailyFaith, 4) : []
  const recommendedScriptures = dailyFaith ? await recommendDailyScripture(dailyFaith) : []

  const mezmurRecommendations: DayMezmurRecommendation[] = recommendedMezmurs.map((m) => ({
    id: m.id,
    slug: m.slug,
    title: m.title,
    titleAmharic: m.titleAmharic || m.title,
    singerName: (m as any).singerName ?? null,
    hasPlayableMedia: !!((m as any).hasPlayableMedia || m.audioUrl || m.youtubeUrl),
    language: null,
    category: m.category ?? null,
    occasion: m.occasion ?? null,
    thumbnailUrl: m.thumbnailUrl ?? null,
    imageAlt: m.title,
    youtubeUrl: m.youtubeUrl ?? null,
    audioUrl: m.audioUrl ?? null,
    practiceHref: m.lyricsHref,
    playHref: m.playHref,
    matchReason: m.matchReasonEn,
  }))

  const badges = buildBadges({
    primary: orthodox.primaryObservance,
    observances: orthodox.observances,
    fast: orthodox.activeFast,
    season: orthodox.season,
    monthly: orthodox.monthlyCommemorations,
  })

  const dayTitle =
    orthodox.primaryObservance?.title ||
    orthodox.monthlyCommemorations[0]?.title ||
    synaxarium[0]?.title ||
    `${monthName} ${eth.day}`

  const dayOneLiner =
    orthodox.primaryObservance?.summary ||
    orthodox.primaryObservance?.description ||
    orthodox.monthlyCommemorations[0]?.summary ||
    orthodox.monthlyCommemorations[0]?.description ||
    synaxarium[0]?.summary ||
    (orthodox.fastingStatus.isFastDay && orthodox.fastingStatus.label
      ? `A fasting day: ${orthodox.fastingStatus.label}.`
      : orthodox.fastingStatus.isFastFree
        ? orthodox.fastingStatus.exceptionNote ||
          'No regular Wednesday/Friday fast today.'
        : orthodox.season
          ? `We are in ${orthodox.season.title}.`
          : 'A day of prayer in the Ethiopian Orthodox Tewahedo Church.')

  const practiceLinks: DayChurchContext['practiceLinks'] = [
    { label: 'Open prayer collections', href: '/pray' },
    {
      label: 'Open liturgy',
      href: liturgySummary?.openHref || '/pray/divine-liturgy',
    },
  ]
  practiceLinks.push({ label: 'Explore Mezmur Library', href: '/hymns' })
  practiceLinks.push({
    label: synaxariumDaySlug ? 'View full Synaxarium' : 'Browse Synaxarium',
    href: synaxariumDaySlug ? `/pray/synaxarium/${synaxariumDaySlug}` : '/pray/synaxarium',
  })

  return {
    gregorianDate: toIsoLocal(day),
    gregorianLabel,
    weekdayLabel,
    ethiopianDate: {
      year: eth.year,
      month: eth.month,
      monthName,
      day: eth.day,
    },
    ethiopianLabel,
    ethiopianLabelAmharic,
    dayTitle,
    dayOneLiner,
    badges,
    primaryObservance: orthodox.primaryObservance,
    observances: orthodox.observances,
    activeFast: orthodox.activeFast,
    fastFreeRule: orthodox.fastFreeRule,
    relatedFasts: orthodox.relatedFasts,
    season: orthodox.season,
    monthlyCommemorations: orthodox.monthlyCommemorations,
    synaxarium,
    synaxariumDaySlug,
    synaxariumAvailable,
    fastingStatus: orthodox.fastingStatus,
    liturgySummary,
    mezmurRecommendations,
    dailyScriptures: recommendedScriptures,
    whyThisDay: buildWhyThisDay({
      primary: orthodox.primaryObservance,
      season: orthodox.season,
      fast: orthodox.activeFast,
      monthly: orthodox.monthlyCommemorations,
      synaxarium,
    }),
    practiceLinks,
  }
}
