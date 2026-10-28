/**
 * TEWAHEDODAILY — DAILY FAITH RECOMMENDATION ENGINE
 *
 * Generates explainable, prioritized Bible verse and Mezmur recommendations
 * tied directly to Church calendar context, feast days, fasting seasons, and saints.
 */

import {
  type EthiopianDate,
  gregorianToEthiopian,
  getCivilDateInTimezone,
  getEthiopianWeekday,
} from '../calendar/ethiopianCalendarEngine'
import { loadOrthodoxCalendarCatalog, resolveOrthodoxDay } from '../calendar/orthodoxCalendarData'
import { getSynaxariumDayWithCommemorations } from '../synaxarium/synaxariumService'
import { supabase } from '../supabase/client'
import type { SupabaseClient } from '@supabase/supabase-js'
import { selectDailyScriptureCandidates } from './dailyScriptureSelection'
import {
  fetchBiblePassageBilingual,
  type BiblePassageResult,
} from '../bible/passageService'
import {
  CALENDAR_MEZMUR_LINKS,
  type CalendarMezmurLink,
} from './calendarMezmursData'

export type ScripturePriority =
  | 'appointed_reading'
  | 'feast_saint_scripture'
  | 'seasonal_scripture'
  | 'thematic_scripture'

export interface RecommendedScripture {
  id: string
  reference: string
  bookSlug: string
  chapter: number
  verseStart: number
  verseEnd?: number
  previewTextAmharic?: string
  previewTextEnglish?: string
  priority: ScripturePriority
  priorityLabelEn: string
  priorityLabelAm: string
  sourceName?: string
  reasonEn: string
  reasonAm: string
  readHref: string
  passageAmharic?: BiblePassageResult | null
  passageEnglish?: BiblePassageResult | null
}

export interface RecommendedMezmur {
  id: string
  slug: string
  title: string
  titleAmharic?: string | null
  singerName?: string | null
  audioUrl?: string | null
  youtubeUrl?: string | null
  thumbnailUrl?: string | null
  category?: string | null
  occasion?: string | null
  score: number
  matchReasonEn: string
  matchReasonAm: string
  playHref: string
  lyricsHref: string
  hasPlayableMedia?: boolean
}

export interface DailyFaithContext {
  gregorianDate: string
  ethiopianDate: EthiopianDate
  timezone: string
  weekdayIndex: number
  weekdayNameEn: string
  weekdayNameAm: string
  fasts: string[]
  seasons: string[]
  feasts: string[]
  saints: string[]
  themes: string[]
  scriptureReferences: string[]
  sourceIds: string[]
  cardSlugs?: string[]
}

/**
 * Builds the canonical DailyFaithContext for any given date.
 */
export async function buildDailyFaithContext(
  civilDate: Date,
  timeZone: string = 'Africa/Addis_Ababa'
): Promise<DailyFaithContext> {
  const civil = getCivilDateInTimezone(civilDate, timeZone)
  const ethDate = gregorianToEthiopian(civilDate, timeZone)
  const weekday = getEthiopianWeekday(civilDate)

  const iso = `${civil.year}-${String(civil.month).padStart(2, '0')}-${String(civil.day).padStart(2, '0')}`

  // Orthodox catalog data
  const catalog = await loadOrthodoxCalendarCatalog().catch(() => ({
    observances: [],
    fasts: [],
    seasons: [],
    monthly: [],
    loadedAt: Date.now(),
  }))
  const orthodox = resolveOrthodoxDay(civilDate, catalog)

  const fasts: string[] = []
  if (orthodox.activeFast) fasts.push(orthodox.activeFast.name)
  if (orthodox.fastingStatus.isFastDay && orthodox.fastingStatus.label) {
    fasts.push(orthodox.fastingStatus.label)
  }

  const seasons: string[] = []
  if (orthodox.season) seasons.push(orthodox.season.title)

  const feasts: string[] = []
  if (orthodox.primaryObservance) feasts.push(orthodox.primaryObservance.title)
  orthodox.observances.forEach((o) => {
    if (!feasts.includes(o.title)) feasts.push(o.title)
  })

  const saints: string[] = []
  orthodox.monthlyCommemorations.forEach((m) => {
    if (!saints.includes(m.title)) saints.push(m.title)
  })

  // Collect candidate card slugs for deterministic Mezmur matching
  const cardSlugs: string[] = []
  if (orthodox.primaryObservance?.slug) {
    const s = orthodox.primaryObservance.slug
    cardSlugs.push(s, `observance-${s}`)
  }
  orthodox.observances.forEach((o) => {
    if (o.slug) cardSlugs.push(o.slug, `observance-${o.slug}`)
  })
  if (orthodox.activeFast?.slug) {
    const s = orthodox.activeFast.slug
    cardSlugs.push(s, `fast-${s}`)
  }
  if (
    orthodox.fastingStatus.isFastDay &&
    (weekday.index === 3 || weekday.index === 5 || orthodox.fastingStatus.label?.includes('Wednesday') || orthodox.fastingStatus.label?.includes('Friday'))
  ) {
    cardSlugs.push('fast-weekly-wednesday-friday')
  }
  if (orthodox.season?.slug) {
    const s = orthodox.season.slug
    cardSlugs.push(s, `season-${s}`)
  }
  orthodox.monthlyCommemorations.forEach((m) => {
    if (m.slug) cardSlugs.push(m.slug, `monthly-${m.slug}`)
  })

  // Synaxarium commemorations
  try {
    const synBundle = await getSynaxariumDayWithCommemorations(ethDate.month, ethDate.day)
    if (synBundle?.commemorations) {
      synBundle.commemorations.forEach((c) => {
        if (c.title && !saints.includes(c.title)) saints.push(c.title)
      })
    }
  } catch { /* Other calendar sources still supply the day context. */ }

  const themes: string[] = []
  if (fasts.length > 0) themes.push('repentance', 'fasting', 'prayer')
  if (feasts.some((f) => f.includes('መስቀል') || f.toLowerCase().includes('cross'))) themes.push('cross')
  if (feasts.some((f) => f.includes('ትንሣኤ') || f.toLowerCase().includes('easter') || f.toLowerCase().includes('fasika'))) themes.push('resurrection')
  if (feasts.some((f) => f.includes('ልደት') || f.toLowerCase().includes('nativity'))) themes.push('nativity')
  if (feasts.some((f) => f.includes('ጥምቀት') || f.toLowerCase().includes('timket') || f.toLowerCase().includes('epiphany'))) themes.push('epiphany')
  if (saints.some((s) => s.includes('ማርያም') || s.toLowerCase().includes('mary') || s.includes('ኪዳነ ምሕረት') || s.toLowerCase().includes('kidane mihret'))) themes.push('saint_mary')

  return {
    gregorianDate: iso,
    ethiopianDate: ethDate,
    timezone: timeZone,
    weekdayIndex: weekday.index,
    weekdayNameEn: weekday.name,
    weekdayNameAm: getEthiopianWeekday(civilDate, 'am').name,
    fasts,
    seasons,
    feasts,
    saints,
    themes,
    scriptureReferences: [],
    sourceIds: [],
    cardSlugs,
  }
}

/**
 * Loads up to two distinct thematic suggestions from the existing Bible dataset.
 * No source-verified daily EOTC lectionary mappings are currently installed.
 * Asynchronously loads full verses from passageService to guarantee complete,
 * verified textual content with verse numbers and edition metadata.
 */
export async function recommendDailyScripture(
  context: DailyFaithContext,
  loadPassage = fetchBiblePassageBilingual,
): Promise<RecommendedScripture[]> {
  const recommendations: RecommendedScripture[] = []
  for (const candidate of selectDailyScriptureCandidates(context)) {
    const passage = await loadPassage(candidate).catch(() => null)
    if (!passage?.amharic?.verses.length && !passage?.english?.verses.length) continue
    recommendations.push({
      id: 'sc-' + candidate.bookSlug + '-' + candidate.chapterNumber + '-' + candidate.verseStart,
      reference: candidate.reference,
      bookSlug: candidate.bookSlug,
      chapter: candidate.chapterNumber,
      verseStart: candidate.verseStart,
      verseEnd: candidate.verseEnd,
      priority: 'thematic_scripture',
      priorityLabelEn: 'Suggested Scripture',
      priorityLabelAm: 'የተመከረ የመጽሐፍ ቅዱስ ንባብ',
      sourceName: candidate.subjectEn,
      reasonEn: candidate.subjectEn,
      reasonAm: candidate.subjectAm,
      readHref: passage.english?.readerHref || passage.amharic!.readerHref,
      passageAmharic: passage.amharic,
      passageEnglish: passage.english,
    })
    if (recommendations.length === 2) break
  }
  return recommendations
}

/**
 * Recommends Mezmurs with deterministic multi-factor explainable scoring.
 * Evaluates all active calendar cards, feasts, fasts, and commemorations.
 *
 * Implements a deterministic 5-Level priority ranking:
 *   Level 1: Exact Commemoration Match (score: 100)
 *   Level 2: Verified Saint / Angel / Feast Match (score: 85)
 *   Level 3: Fasting Occasion Match (score: 75)
 *   Level 4: Liturgical Season Match (score: 65)
 *   Level 5: Thematic / General Worship Match (score: 50 / 20)
 *
 * Guarantees fair representation across distinct simultaneous commemorations
 * (e.g. Annunciation is not drowned out by Season of Tsige).
 * Never invents unverified associations (e.g. Uriel has 0 published hymns).
 */
export async function recommendDailyMezmurs(
  context: DailyFaithContext,
  limit: number = 4,
  customCatalog?: Array<{
    import_id?: string
    mezmur_id?: string | null
    id?: string
    slug?: string
    title?: string
    title_amharic?: string | null
    singer?: string | null
    singer_name?: string | null
    occasion?: string | null
    category?: string | null
    youtube_url?: string | null
    audio_url?: string | null
    search_keywords?: string | null
    lyrics_amharic?: string | null
  }>
): Promise<RecommendedMezmur[]> {
  type CatalogItem = NonNullable<typeof customCatalog>[number]
  type CatalogClient = SupabaseClient<{ public: { Tables: Record<string, never>; Views: { mezmur_public: { Row: CatalogItem; Relationships: [] } }; Functions: Record<string, never> } }>
  try {
    const cardSlugs = new Set<string>(context.cardSlugs || [])

    // Also match card slugs inferred from context strings
    if (context.seasons.some((s) => /tsige|ጽጌ/i.test(s))) {
      cardSlugs.add('tsige-season')
    }
    if (context.fasts.some((f) => /tsige|ጽጌ/i.test(f))) {
      cardSlugs.add('fast-tsige-fast')
    }
    if (context.fasts.some((f) => /wednesday|friday|ረቡዕ|ዓርብ/i.test(f))) {
      cardSlugs.add('fast-weekly-wednesday-friday')
    }
    if (context.seasons.some((s) => /lent|ዓቢይ/i.test(s))) {
      cardSlugs.add('great-lent')
    }

    // 1. Gather all approved candidate associations from verified links
    const candidateLinks: Array<CalendarMezmurLink & { computedScore: number }> = []
    for (const link of CALENDAR_MEZMUR_LINKS) {
      if (link.review_status !== 'approved') continue

      let matches = cardSlugs.has(link.calendar_card_slug)

      // Fallback matching by title/keywords if slug didn't match directly
      if (!matches) {
        const titleLower = link.event_title.toLowerCase()
        const amLower = (link.event_title_amharic || '').toLowerCase()
        if (
          context.feasts.some((f) => {
            const fl = f.toLowerCase()
            return titleLower.includes(fl) || fl.includes(titleLower) || (amLower && f.includes(amLower))
          }) ||
          context.saints.some((s) => {
            const sl = s.toLowerCase()
            return titleLower.includes(sl) || sl.includes(titleLower) || (amLower && s.includes(amLower))
          })
        ) {
          matches = true
        }
      }

      if (matches) {
        let computedScore = 50
        switch (link.relationship_type) {
          case 'exact_commemoration':
            computedScore = 100
            break
          case 'saint_angel':
          case 'feast':
            computedScore = 85
            break
          case 'fasting_occasion':
            computedScore = 75
            break
          case 'liturgical_season':
            computedScore = 65
            break
          case 'thematic':
          default:
            computedScore = 50
            break
        }
        candidateLinks.push({ ...link, computedScore })
      }
    }

    // 2. Multi-card Fair Distribution
    // Group candidates by distinct commemoration entity (calendar_card_slug)
    const distinctCardGroups = new Map<string, Array<CalendarMezmurLink & { computedScore: number }>>()
    for (const link of candidateLinks) {
      const key = link.calendar_card_slug
      const group = distinctCardGroups.get(key) || []
      group.push(link)
      distinctCardGroups.set(key, group)
    }

    // Sort each group by priority ascending (1 = highest), then score descending
    for (const group of distinctCardGroups.values()) {
      group.sort((a, b) => a.priority - b.priority || b.computedScore - a.computedScore)
    }

    // Order commemoration groups: observances / feasts first, then monthly commemorations, then fasts, then seasons
    const sortedGroups = Array.from(distinctCardGroups.entries()).sort((a, b) => {
      const orderKind = (k: string) => {
        if (k.startsWith('observance-')) return 1
        if (k.startsWith('monthly-')) return 2
        if (k.startsWith('fast-')) return 3
        if (k.includes('season') || k.includes('lent') || k.includes('week') || k.includes('period')) return 4
        return 5
      }
      return orderKind(a[0]) - orderKind(b[0])
    })

    // Fair round-robin allocation across distinct commemorations
    const chosenLinks: Array<CalendarMezmurLink & { computedScore: number }> = []
    const chosenSlugs = new Set<string>()

    let round = 0
    let addedInRound = true
    while (chosenLinks.length < limit && addedInRound) {
      addedInRound = false
      for (const [, group] of sortedGroups) {
        if (group[round]) {
          const item = group[round]
          if (!chosenSlugs.has(item.mezmur_slug)) {
            chosenLinks.push(item)
            chosenSlugs.add(item.mezmur_slug)
            addedInRound = true
            if (chosenLinks.length >= limit) break
          }
        }
      }
      round++
    }

    // 3. Hydrate hymn metadata (singer, audio_url, youtube_url, lyrics)
    const hydratedMezmurs: RecommendedMezmur[] = []

    if (chosenLinks.length > 0) {
      let catalogItems: CatalogItem[] = []
      if (customCatalog) {
        catalogItems = customCatalog
      } else if (supabase) {
        const client = supabase as unknown as CatalogClient
        const slugsToFetch = Array.from(chosenSlugs)
        const { data } = await client
          .from('mezmur_public')
          .select('mezmur_id, slug, title, title_amharic, singer_name, youtube_url, audio_url, lyrics_amharic')
          .in('slug', slugsToFetch)
        catalogItems = (data || []) as unknown as CatalogItem[]
      }

      const catalogMap = new Map(catalogItems.map((c) => [c.slug, c]))

      for (const link of chosenLinks) {
        const cat = catalogMap.get(link.mezmur_slug)
        const hasMedia = Boolean(cat?.youtube_url || cat?.audio_url)
        let finalScore = link.computedScore
        if (hasMedia) finalScore += 5
        if (cat?.lyrics_amharic) finalScore += 3

        hydratedMezmurs.push({
          id: cat?.mezmur_id || cat?.id || link.mezmur_slug,
          slug: link.mezmur_slug,
          title: cat?.title || link.mezmur_title,
          titleAmharic: cat?.title_amharic || link.mezmur_title_amharic || null,
          singerName: cat?.singer_name || cat?.singer || null,
          audioUrl: cat?.audio_url || null,
          youtubeUrl: cat?.youtube_url || null,
          thumbnailUrl: null,
          category: link.relationship_type,
          occasion: link.event_title,
          score: finalScore,
          matchReasonEn: link.reason_en,
          matchReasonAm: link.reason_am,
          playHref: `/hymns/mezmur/${link.mezmur_slug}`,
          lyricsHref: `/hymns/mezmur/${link.mezmur_slug}`,
          hasPlayableMedia: hasMedia,
        })
      }
    }

    // 4. Fill remaining slots if fewer than limit (curated fallback from mezmur_public)
    if (hydratedMezmurs.length < limit) {
      let fallbackList: CatalogItem[] = []
      if (customCatalog) {
        fallbackList = customCatalog.filter((m) => m.slug && !chosenSlugs.has(m.slug))
      } else if (supabase) {
        const client = supabase as unknown as CatalogClient
        const needed = limit - hydratedMezmurs.length
        const { data } = await client
          .from('mezmur_public')
          .select('mezmur_id, slug, title, title_amharic, singer_name, youtube_url, audio_url, lyrics_amharic')
          .limit(needed + 5)
        fallbackList = ((data || []) as unknown as CatalogItem[]).filter((m) => m.slug && !chosenSlugs.has(m.slug))
      }

      for (const fb of fallbackList) {
        if (hydratedMezmurs.length >= limit) break
        if (!fb.slug || chosenSlugs.has(fb.slug)) continue

        chosenSlugs.add(fb.slug)
        const hasMedia = Boolean(fb.youtube_url || fb.audio_url)
        hydratedMezmurs.push({
          id: fb.mezmur_id || fb.id || fb.slug,
          slug: fb.slug,
          title: fb.title || 'Untitled Hymn',
          titleAmharic: fb.title_amharic || null,
          singerName: fb.singer_name || fb.singer || null,
          audioUrl: fb.audio_url || null,
          youtubeUrl: fb.youtube_url || null,
          thumbnailUrl: null,
          category: 'general_worship',
          occasion: null,
          score: 20 + (hasMedia ? 5 : 0),
          matchReasonEn: 'General worship suggestion',
          matchReasonAm: 'አጠቃላይ የምስጋና መዝሙር',
          playHref: `/hymns/mezmur/${fb.slug}`,
          lyricsHref: `/hymns/mezmur/${fb.slug}`,
          hasPlayableMedia: hasMedia,
        })
      }
    }

    // Sort descending by score
    hydratedMezmurs.sort((a, b) => b.score - a.score)
    return hydratedMezmurs.slice(0, limit)
  } catch (cause) {
    if (typeof import.meta !== 'undefined' && import.meta?.env?.DEV) {
      console.error('[dailyFaith] recommendDailyMezmurs error', cause)
    }
    return []
  }
}
