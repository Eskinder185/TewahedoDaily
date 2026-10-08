import type {
  AiAssistantResponse,
  BibleChapterResponse,
  BibleReferenceResponse,
  BibleSearchResponse,
  CalendarTodayResponse,
  EthiopianDateTodayResponse,
  FastingTodayResponse,
  GenericTypedResponse,
  HymnOccasionResponse,
  HymnSearchResponse,
  PrayerCollectionResponse,
  PrayerSearchResponse,
  PrayerSectionResponse,
  SearchBuddyApiResponse,
  SeasonTodayResponse,
  SynaxariumDayResponse,
  SynaxariumSearchResponse,
  SynaxariumTodayResponse,
} from '../../../lib/searchBuddy/apiTypes.ts'

import { AiResponseCard } from './AiResponseCard.tsx'
import { BibleChapterResult } from './BibleChapterResult.tsx'
import { BibleReferenceResult } from './BibleReferenceResult.tsx'
import { BibleSearchResults } from './BibleSearchResults.tsx'
import {
  CalendarTodayResult,
  EthiopianDateTodayResult,
  FastingTodayResult,
  SeasonTodayResult,
  SynaxariumTodayResult,
} from './CalendarTodayResults.tsx'
import { GenericTypedResult } from './GenericTypedResult.tsx'
import { HymnOccasionResults } from './HymnOccasionResults.tsx'
import { HymnResults } from './HymnResults.tsx'
import { PrayerCollectionResults } from './PrayerCollectionResults.tsx'
import { PrayerResults } from './PrayerResults.tsx'
import { PrayerSectionResults } from './PrayerSectionResults.tsx'
import { SynaxariumDayResults } from './SynaxariumDayResults.tsx'
import { SynaxariumSearchResults } from './SynaxariumSearchResults.tsx'
import styles from './ResultCard.module.css'

type Props = {
  response: SearchBuddyApiResponse | null
  empty?: boolean
}

export function SearchBuddyResults({ response, empty }: Props) {
  if (!response) return null

  if (empty) {
    return (
      <p className={styles.emptyNote} role="status">
        No results matched that question. Try a verse reference, feast name, hymn, or prayer.
      </p>
    )
  }

  switch (response.type) {
    case 'bible_search':
      return <BibleSearchResults data={response as BibleSearchResponse} />

    case 'bible_reference':
      return <BibleReferenceResult data={response as BibleReferenceResponse} />

    case 'bible_chapter':
      return <BibleChapterResult data={response as BibleChapterResponse} />

    case 'hymn_search':
      return <HymnResults data={response as HymnSearchResponse} />

    case 'hymn_occasion':
      return <HymnOccasionResults data={response as HymnOccasionResponse} />

    case 'prayer_search':
      return <PrayerResults data={response as PrayerSearchResponse} />

    case 'prayer_collection':
      return <PrayerCollectionResults data={response as PrayerCollectionResponse} />

    case 'prayer_section':
      return <PrayerSectionResults data={response as PrayerSectionResponse} />

    case 'synaxarium_search':
      return <SynaxariumSearchResults data={response as SynaxariumSearchResponse} />

    case 'synaxarium_day':
      return <SynaxariumDayResults data={response as SynaxariumDayResponse} />

    case 'calendar_today':
    case 'calendar_day':
      return <CalendarTodayResult data={response as CalendarTodayResponse} />

    case 'fasting_today':
    case 'fast_today':
    case 'calendar_fast':
      return <FastingTodayResult data={response as FastingTodayResponse} />

    case 'season_today':
    case 'calendar_season':
      return <SeasonTodayResult data={response as SeasonTodayResponse} />

    case 'ethiopian_date_today':
      return (
        <EthiopianDateTodayResult
          data={response as EthiopianDateTodayResponse}
        />
      )

    case 'synaxarium_today':
      return (
        <SynaxariumTodayResult
          data={response as SynaxariumTodayResponse}
        />
      )

    case 'ai':
      return <AiResponseCard data={response as AiAssistantResponse} />

    default:
      return <GenericTypedResult data={response as GenericTypedResponse} />
  }
}
