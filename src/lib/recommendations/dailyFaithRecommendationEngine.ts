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
  } catch {}

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
 * Recommends Scripture readings according to the 4-tier liturgical priority.
 * Asynchronously loads full verses from passageService to guarantee complete,
 * verified textual content with verse numbers and edition metadata.
 */
export async function recommendDailyScripture(
  context: DailyFaithContext
): Promise<RecommendedScripture[]> {
  const recommendations: RecommendedScripture[] = []

  // Check if active day has an explicit feast or Saint/Mary commemoration
  const isMaryOrKidaneMihret =
    context.saints.some((s) =>
      s.includes('ማርያም') ||
      s.toLowerCase().includes('mary') ||
      s.includes('ኪዳነ ምሕረት') ||
      s.toLowerCase().includes('kidane mihret')
    ) ||
    context.feasts.some((f) =>
      f.includes('ማርያም') ||
      f.toLowerCase().includes('mary') ||
      f.includes('ኪዳነ ምሕረት') ||
      f.toLowerCase().includes('kidane mihret')
    )

  const isCrossDay = context.feasts.some(
    (f) => f.includes('መስቀል') || f.toLowerCase().includes('cross')
  )

  const isTsigeSeason = context.seasons.some(
    (s) => s.toLowerCase().includes('tsige') || s.includes('ጽጌ')
  )

  const isCanonicalFastDay = context.fasts.some((f) =>
    f.toLowerCase().includes('wednesday') ||
    f.toLowerCase().includes('friday') ||
    f.toLowerCase().includes('lent') ||
    f.toLowerCase().includes('nineveh') ||
    f.toLowerCase().includes('ዐቢይ')
  )

  if (isCrossDay) {
    const passage = await fetchBiblePassageBilingual({
      bookSlug: '1-corinthians',
      chapterNumber: 1,
      verseStart: 18,
      verseEnd: 25,
    })
    recommendations.push({
      id: 'sc-cross-1',
      reference: '1 Corinthians 1:18–25',
      bookSlug: '1-corinthians',
      chapter: 1,
      verseStart: 18,
      verseEnd: 25,
      previewTextAmharic: passage.amharic?.verses[0]?.text || 'የመስቀሉ ቃል ለሚጠፉት ሞኝነት፥ ለእኛ ለምንድን ግን የእግዚአብሔር ኃይል ነውና።',
      previewTextEnglish: passage.english?.verses[0]?.text || 'For the word of the cross is foolishness to those who are dying, but to us who are being saved it is the power of God.',
      priority: 'feast_saint_scripture',
      priorityLabelEn: 'Feast-Related Scripture',
      priorityLabelAm: 'የበዓሉ የመጽሐፍ ቅዱስ ንባብ',
      sourceName: 'Feast of the Holy Cross',
      reasonEn: 'Appointed Gospel and Epistle reading for the feast of the Holy Cross.',
      reasonAm: 'ለተቀደሰው የመስቀል በዓል የተመደበ ንባብ።',
      readHref: passage.english?.readerHref || '/bible/1-corinthians/1#verse-18',
      passageAmharic: passage.amharic,
      passageEnglish: passage.english,
    })
  } else if (isMaryOrKidaneMihret) {
    const passage = await fetchBiblePassageBilingual({
      bookSlug: 'luke',
      chapterNumber: 1,
      verseStart: 46,
      verseEnd: 55,
    })
    const isKidane = context.saints.some((s) => s.includes('ኪዳነ ምሕረት') || s.toLowerCase().includes('kidane mihret'))
    recommendations.push({
      id: 'sc-mary-1',
      reference: 'Luke 1:46–55',
      bookSlug: 'luke',
      chapter: 1,
      verseStart: 46,
      verseEnd: 55,
      previewTextAmharic: passage.amharic?.verses[0]?.text || 'ማርያምም እንዲህ አለች፦ ነፍሴ ጌታን ታከብረዋለች፥ መንፈሴም በአምላኬ በመድኃኒቴ ሐሴት ታደርጋለች።',
      previewTextEnglish: passage.english?.verses[0]?.text || 'Mary said, "My soul magnifies the Lord, and my spirit rejoices in God my Savior."',
      priority: 'feast_saint_scripture',
      priorityLabelEn: isKidane ? 'Commemoration-Related Scripture' : 'Feast-Related Scripture',
      priorityLabelAm: isKidane ? 'የመታሰቢያው ንባብ' : 'የበዓሉ ንባብ',
      sourceName: isKidane ? 'Monthly Commemoration of Kidane Mihret' : 'Commemoration of Saint Mary',
      reasonEn: isKidane
        ? 'Gospel reading of the Magnificat in honor of Our Lady Mary and the Covenant of Mercy.'
        : 'Gospel reading commemorating Our Lady Mary, the Mother of God.',
      reasonAm: isKidane
        ? 'የእመቤታችን የኪዳነ ምሕረት መታሰቢያ የወንጌል ምስጋና ንባብ።'
        : 'የእመቤታችን የቅድስት ድንግል ማርያም የምስጋና ንባብ።',
      readHref: passage.english?.readerHref || '/bible/luke/1#verse-46',
      passageAmharic: passage.amharic,
      passageEnglish: passage.english,
    })
  } else if (isCanonicalFastDay) {
    const passage = await fetchBiblePassageBilingual({
      bookSlug: 'matthew',
      chapterNumber: 6,
      verseStart: 16,
      verseEnd: 18,
    })
    recommendations.push({
      id: 'sc-fast-1',
      reference: 'Matthew 6:16–18',
      bookSlug: 'matthew',
      chapter: 6,
      verseStart: 16,
      verseEnd: 18,
      previewTextAmharic: passage.amharic?.verses[0]?.text || 'ስትጦሙም፥ እንደ ግብዞች አትጠውልጉ፤ ለሰዎች እንደ ጦመኛ ሊታዩ ፊታቸውን ያጠፋሉና።',
      previewTextEnglish: passage.english?.verses[0]?.text || "Moreover when you fast, don't be like the hypocrites, with sad faces...",
      priority: 'thematic_scripture',
      priorityLabelEn: 'Thematic Scripture',
      priorityLabelAm: 'ስለ ጾም የሚመከር ንባብ',
      sourceName: 'Gospel on Fasting and Prayer',
      reasonEn: 'Thematic Gospel reading on the spiritual discipline of authentic prayer and fasting.',
      reasonAm: 'ስለ መንፈሳዊ ጾምና ጸሎት የሚያስተምር የወንጌል ንባብ።',
      readHref: passage.english?.readerHref || '/bible/matthew/6#verse-16',
      passageAmharic: passage.amharic,
      passageEnglish: passage.english,
    })
  } else if (isTsigeSeason) {
    const passage = await fetchBiblePassageBilingual({
      bookSlug: 'matthew',
      chapterNumber: 2,
      verseStart: 13,
      verseEnd: 15,
    })
    recommendations.push({
      id: 'sc-tsige-1',
      reference: 'Matthew 2:13–15',
      bookSlug: 'matthew',
      chapter: 2,
      verseStart: 13,
      verseEnd: 15,
      previewTextAmharic: passage.amharic?.verses[0]?.text || 'እነርሱም ከሄዱ በኋላ እነሆ፥ የጌታ መልአክ በሕልም ለዮሴፍ ታይቶ...',
      previewTextEnglish: passage.english?.verses[0]?.text || 'Now when they had departed, behold, an angel of the Lord appeared to Joseph in a dream...',
      priority: 'seasonal_scripture',
      priorityLabelEn: 'Seasonal Scripture',
      priorityLabelAm: 'የወቅቱ ንባብ (ዘመነ ጽጌ)',
      sourceName: 'Flight of the Holy Family',
      reasonEn: 'Seasonal reading commemorating the Flight of the Holy Family to Egypt during Zemene Tsige.',
      reasonAm: 'በዘመነ ጽጌ ወቅት የእመቤታችንን እና የጌታን ወደ ግብጽ መሰደድ የሚያዘክር ንባብ።',
      readHref: passage.english?.readerHref || '/bible/matthew/2#verse-13',
      passageAmharic: passage.amharic,
      passageEnglish: passage.english,
    })
  } else {
    // Thematic reading from Psalms of David
    const dayPsalm = ((context.ethiopianDate.day * 5) % 150) || 1
    const passage = await fetchBiblePassageBilingual({
      bookSlug: 'psalms',
      chapterNumber: dayPsalm,
      verseStart: 1,
      verseEnd: 6,
    })
    recommendations.push({
      id: `sc-psalm-${dayPsalm}`,
      reference: `Psalms ${dayPsalm}:1–6`,
      bookSlug: 'psalms',
      chapter: dayPsalm,
      verseStart: 1,
      verseEnd: 6,
      previewTextAmharic: passage.amharic?.verses[0]?.text || 'ምስጉን ነው በክፉዎች ምክር ያልሄደ...',
      previewTextEnglish: passage.english?.verses[0]?.text || "Blessed is the man who doesn't walk in the counsel of the wicked...",
      priority: 'thematic_scripture',
      priorityLabelEn: 'Thematic Suggestion',
      priorityLabelAm: 'የቀኑ የዳዊት መዝሙር',
      sourceName: 'Mezmure Dawit (Psalms)',
      reasonEn: `Daily prayer psalm suggested for day ${context.ethiopianDate.day} of the Ethiopian month.`,
      reasonAm: `በወሩ ቀን ${context.ethiopianDate.day} የሚነበብ የዳዊት መዝሙር ምስጋና።`,
      readHref: passage.english?.readerHref || `/bible/psalms/${dayPsalm}#verse-1`,
      passageAmharic: passage.amharic,
      passageEnglish: passage.english,
    })
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
      let catalogItems: any[] = []
      if (customCatalog) {
        catalogItems = customCatalog
      } else if (supabase) {
        const client = supabase as any
        const slugsToFetch = Array.from(chosenSlugs)
        const { data } = await client
          .from('mezmur_public')
          .select('mezmur_id, slug, title, title_amharic, singer_name, youtube_url, audio_url, lyrics_amharic')
          .in('slug', slugsToFetch)
        catalogItems = data || []
      }

      const catalogMap = new Map<string, any>(catalogItems.map((c) => [c.slug, c]))

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
          playHref: `/practice/mezmur/${link.mezmur_slug}`,
          lyricsHref: `/practice/mezmur/${link.mezmur_slug}`,
          hasPlayableMedia: hasMedia,
        })
      }
    }

    // 4. Fill remaining slots if fewer than limit (curated fallback from mezmur_public)
    if (hydratedMezmurs.length < limit) {
      let fallbackList: any[] = []
      if (customCatalog) {
        fallbackList = customCatalog.filter((m) => m.slug && !chosenSlugs.has(m.slug))
      } else if (supabase) {
        const client = supabase as any
        const needed = limit - hydratedMezmurs.length
        const { data } = await client
          .from('mezmur_public')
          .select('mezmur_id, slug, title, title_amharic, singer_name, youtube_url, audio_url, lyrics_amharic')
          .limit(needed + 5)
        fallbackList = (data || []).filter((m: any) => m.slug && !chosenSlugs.has(m.slug))
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
          playHref: `/practice/mezmur/${fb.slug}`,
          lyricsHref: `/practice/mezmur/${fb.slug}`,
          hasPlayableMedia: hasMedia,
        })
      }
    }

    // Sort descending by score
    hydratedMezmurs.sort((a, b) => b.score - a.score)
    return hydratedMezmurs.slice(0, limit)
  } catch (cause) {
    if (Boolean(typeof import.meta !== 'undefined' && import.meta?.env?.DEV)) {
      console.error('[dailyFaith] recommendDailyMezmurs error', cause)
    }
    return []
  }
}
