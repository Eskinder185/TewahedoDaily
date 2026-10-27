import { buildChurchDaySnapshot } from './buildChurchDaySnapshot'
import type { ChurchDaySnapshot, ObservanceType } from './types'
import { getEntriesForDate, sortEotcEntriesForCalendarPanel } from '../eotcCalendar'
import type { EotcCalendarDatasetRow } from '../eotcCalendar/eotcTypes'
import { gregorianToEthiopian, formatEthiopianDate } from '../ethiopianDate'
import { daysInEthiopianMonth, ethiopianToGregorian } from '../calendar/ethiopianCalendarEngine'
import type { SynaxariumMonthDayPreview } from '../prayers/prayerLibraryTypes'
import { getSynaxariumMonthDayPreviews } from '../synaxarium/synaxariumService'

/**
 * Primary mini-calendar decoration. Shapes + border patterns (not color alone) are
 * defined in `MiniMonthCalendar.module.css`.
 */
export type CalendarCellMarkKind =
  | 'majorFeast'
  | 'feast'
  | 'fast'
  | 'mary'
  | 'saint'
  | 'recurring'
  | 'season'
  | 'movable'

export type CalendarDayCellMark = {
  primary: CalendarCellMarkKind
  /** When true, show an extra fast cue alongside non-fast primaries. */
  alsoFast: boolean
  /** Short label for aria-labels (dominant observance). */
  label: string
}

function hasType(types: ObservanceType[] | undefined, t: ObservanceType): boolean {
  return Boolean(types?.includes(t))
}

/** Map one EOTC row → grid mark (visual family). */
export function eotcRowToCellMarkKind(
  row: EotcCalendarDatasetRow,
): CalendarCellMarkKind {
  const e = row.entry
  const p = e.category.primary
  const k = e.date.kind
  const fs = e.observance.fastStatus

  if (k === 'season') return 'season'
  if (k === 'weekly-recurring' || k === 'monthly-recurring') return 'recurring'
  if (p === 'mary') return 'mary'
  if (p === 'angel' || p === 'saint' || p === 'martyr' || p === 'apostle') {
    return 'saint'
  }
  if (p === 'fast' || (fs === 'fast' && p !== 'major-feast' && p !== 'minor-feast')) {
    return 'fast'
  }
  if (p === 'major-feast') return 'majorFeast'
  if (p === 'minor-feast') return 'feast'
  if (k === 'movable') {
    if (p === 'major-feast') return 'majorFeast'
    if (fs === 'fast') return 'fast'
    return 'movable'
  }
  return 'feast'
}

function buildMarkFromEotc(sorted: EotcCalendarDatasetRow[]): CalendarDayCellMark | null {
  const contentRows = sorted.filter((row) => row.entry.date.kind !== 'weekly-recurring')
  if (contentRows.length === 0) return null
  const primary = eotcRowToCellMarkKind(contentRows[0])
  const anyFast = sorted.some((r) => r.entry.observance.fastStatus === 'fast')
  const alsoFast =
    anyFast && primary !== 'fast' && primary !== 'majorFeast' && primary !== 'feast'

  const head = contentRows[0].entry
  const labelBase = head.englishTitle?.trim() || head.title
  const label =
    contentRows.length > 1 ? `${labelBase} (+${contentRows.length - 1} more)` : labelBase

  return { primary, alsoFast, label }
}

function classifySnapshot(snap: ChurchDaySnapshot): CalendarDayCellMark | null {
  const types = snap.commemoration.observanceType ?? []
  const movableHits = snap.movableOnDay.length > 0

  const feastLikeTypes =
    hasType(types, 'feast') ||
    hasType(types, 'movable-feast') ||
    hasType(types, 'marian-observance') ||
    hasType(types, 'angel-commemoration') ||
    hasType(types, 'mixed-observance')

  const hasFast = hasType(types, 'fast')
  const hasSaint = hasType(types, 'saint-commemoration')
  const hasSeason = hasType(types, 'seasonal-observance')
  const hasMarian = hasType(types, 'marian-observance')
  const hasAngel = hasType(types, 'angel-commemoration')

  const title =
    snap.commemoration.title?.trim() ||
    snap.weekday.long ||
    'Liturgical day'

  // Do not treat generic Wednesday/Friday fast chips as Synaxarium commemorations.
  const looksLikeWeeklyFastOnly =
    hasFast &&
    !feastLikeTypes &&
    !hasSaint &&
    !hasMarian &&
    !hasAngel &&
    !movableHits &&
    !hasSeason &&
    /wednesday|friday/i.test(title)

  if (looksLikeWeeklyFastOnly) return null

  if (hasMarian) {
    return {
      primary: 'mary',
      alsoFast: hasFast,
      label: title,
    }
  }
  if (hasAngel || hasSaint) {
    return {
      primary: 'saint',
      alsoFast: hasFast,
      label: title,
    }
  }
  if (feastLikeTypes || movableHits) {
    const primary: CalendarCellMarkKind =
      movableHits && !feastLikeTypes ? 'movable' : 'feast'
    return { primary, alsoFast: hasFast, label: title }
  }
  if (hasSeason) {
    return { primary: 'season', alsoFast: hasFast, label: title }
  }

  return null
}

function monthDayKey(month: number, day: number): string {
  return `${month}-${day}`
}

function buildSynaxariumPreviewIndex(
  previews: SynaxariumMonthDayPreview[],
): Map<string, SynaxariumMonthDayPreview> {
  const map = new Map<string, SynaxariumMonthDayPreview>()
  for (const preview of previews) {
    map.set(monthDayKey(preview.day.ethiopianMonthNumber, preview.day.ethiopianDay), preview)
  }
  return map
}

function classifyDay(
  gregorianYear: number,
  monthIndex: number,
  day: number,
  synaxariumByEthDay: Map<string, SynaxariumMonthDayPreview>,
): CalendarDayCellMark | null {
  const d = new Date(gregorianYear, monthIndex, day)
  const rows = getEntriesForDate(d)
  const eotcMark = rows.length > 0 ? buildMarkFromEotc(sortEotcEntriesForCalendarPanel(rows)) : null
  if (eotcMark) return eotcMark

  const eth = gregorianToEthiopian(d)
  const preview = synaxariumByEthDay.get(monthDayKey(eth.month, eth.day))
  if (preview) {
    const label =
      preview.commemorationsCount > 1
        ? `${preview.primaryTitle} (+${preview.commemorationsCount - 1} more)`
        : preview.primaryTitle
    return {
      primary: 'saint',
      alsoFast: false,
      label,
    }
  }

  const snap = buildChurchDaySnapshot(d)
  return classifySnapshot(snap)
}

/**
 * Sync marks without Supabase (legacy callers). Prefer `computeCalendarDayMarksAsync`.
 */
export function computeCalendarDayMarks(
  gregorianYear: number,
  monthIndex: number,
): ReadonlyMap<number, CalendarDayCellMark> {
  const dim = new Date(gregorianYear, monthIndex + 1, 0).getDate()
  const map = new Map<number, CalendarDayCellMark>()
  const empty = new Map<string, SynaxariumMonthDayPreview>()
  for (let day = 1; day <= dim; day++) {
    const mark = classifyDay(gregorianYear, monthIndex, day, empty)
    if (mark) map.set(day, mark)
  }
  return map
}

/**
 * Month marks with one Supabase query per Ethiopian month spanned by the Gregorian month.
 */
export async function computeCalendarDayMarksAsync(
  gregorianYear: number,
  monthIndex: number,
): Promise<ReadonlyMap<number, CalendarDayCellMark>> {
  const dim = new Date(gregorianYear, monthIndex + 1, 0).getDate()
  const ethMonths = new Set<number>()
  for (let day = 1; day <= dim; day++) {
    ethMonths.add(gregorianToEthiopian(new Date(gregorianYear, monthIndex, day)).month)
  }

  const previewLists = await Promise.all(
    [...ethMonths].map(async (monthNumber) => {
      try {
        return await getSynaxariumMonthDayPreviews(monthNumber)
      } catch (error) {
        if (import.meta.env.DEV) console.error('[calendar] synaxarium month previews', error)
        return [] as SynaxariumMonthDayPreview[]
      }
    }),
  )
  const synaxariumByEthDay = buildSynaxariumPreviewIndex(previewLists.flat())

  const map = new Map<number, CalendarDayCellMark>()
  for (let day = 1; day <= dim; day++) {
    const mark = classifyDay(gregorianYear, monthIndex, day, synaxariumByEthDay)
    if (mark) map.set(day, mark)
  }
  return map
}

/**
 * Month marks for an entire Ethiopian month (1-13) with Pagume 5/6 support.
 */
export async function computeEthiopianMonthMarksAsync(
  ethiopianYear: number,
  ethiopianMonth: number,
): Promise<ReadonlyMap<number, CalendarDayCellMark>> {
  const dim = daysInEthiopianMonth(ethiopianYear, ethiopianMonth);
  let synaxariumByEthDay = new Map<string, SynaxariumMonthDayPreview>();
  try {
    const previews = await getSynaxariumMonthDayPreviews(ethiopianMonth);
    synaxariumByEthDay = buildSynaxariumPreviewIndex(previews);
  } catch (error) {
    if (import.meta.env.DEV) console.error('[calendar] synaxarium eth month previews', error);
  }

  const map = new Map<number, CalendarDayCellMark>();
  for (let ethDay = 1; ethDay <= dim; ethDay++) {
    const civil = ethiopianToGregorian({ year: ethiopianYear, month: ethiopianMonth, day: ethDay });
    const mark = classifyDay(civil.year, civil.month - 1, civil.day, synaxariumByEthDay);
    if (mark) map.set(ethDay, mark);
  }
  return map;
}

export type DayPreviewInfo = {
  gregorianLabel: string;
  ethiopianLabel: string;
  principalObservance: string;
  fastStatus: string;
  commemorationsCount: number;
  primaryKind?: CalendarCellMarkKind;
  alsoFast?: boolean;
};

/**
 * Generates an accurate preview for a day cell hover/focus popover.
 */
export function getDayPreviewInfo(
  date: Date,
  mark?: CalendarDayCellMark,
  locale: string = 'en',
): DayPreviewInfo {
  const isAmharic = locale === 'am';
  const eth = gregorianToEthiopian(date);
  const ethFormatted = isAmharic
    ? formatEthiopianDate(eth, 'am')
    : formatEthiopianDate(eth, 'en');

  const gregFormatted = new Intl.DateTimeFormat(isAmharic ? 'am-ET' : 'en-US', {
    weekday: 'short',
    month: 'short',
    day: 'numeric',
    year: 'numeric',
  }).format(date);

  const snap = buildChurchDaySnapshot(date);
  const rows = getEntriesForDate(date);

  const principalObservance =
    mark?.label ||
    (rows.length > 0
      ? rows[0].entry.title
      : (snap.commemoration?.title ?? (isAmharic ? 'መደበኛ ቀን' : 'Daily Church Rhythm')));

  const isFast = Boolean(mark?.alsoFast || mark?.primary === 'fast' || snap.fasting.weeklyFast || snap.fasting.seasonalFast);
  const fastSeasonName = snap.fasting.seasonalFast || snap.fasting.weeklyFast;

  const fastStatus = isFast
    ? (fastSeasonName
        ? (isAmharic ? 'የጾም ወቅት: ' : 'Fast: ') + fastSeasonName
        : (isAmharic ? 'የጾም ቀን' : 'Fasting Day'))
    : (isAmharic ? 'የፈሰክ ቀን (አይጾምም)' : 'Fast-Free Day');

  const commemorationsCount =
    (snap.commemoration ? 1 : 0) +
    (snap.movableOnDay?.length || 0) +
    (rows.length > 1 ? rows.length - 1 : 0);

  return {
    gregorianLabel: gregFormatted,
    ethiopianLabel: ethFormatted,
    principalObservance,
    fastStatus,
    commemorationsCount: Math.max(commemorationsCount, 1),
    primaryKind: mark?.primary,
    alsoFast: mark?.alsoFast,
  };
}
