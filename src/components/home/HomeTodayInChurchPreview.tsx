import { useEffect, useMemo, useRef, useState } from 'react'
import type { TouchEvent } from 'react'
import { Link } from 'react-router-dom'
import { PageSection } from '../ui/PageSection'
import { useHomeToday } from '../../hooks/useHomeToday'
import { CalendarImage } from '../calendar/CalendarImage'
import type { ChurchDaySnapshot, MovableObservanceOnDay } from '../../lib/churchCalendar'
import {
  calendarImageManifest,
  resolveCommemorationImage,
  resolveEventImageById,
  resolveEventImagePresentation,
  resolveSeasonSupportImage,
} from '../../content/calendarImageManifest'
import { getEntriesForDate, sortEotcEntriesForCalendarPanel } from '../../lib/eotcCalendar'
import type { EotcCalendarDatasetRow } from '../../lib/eotcCalendar'
import styles from './HomeTodayInChurchPreview.module.css'

function fastLine(weekly: string | null, seasonal: string | null) {
  const parts = [weekly, seasonal].filter(Boolean)
  return parts.length ? parts.join(' · ') : null
}

type TodaySlideType =
  | 'major-feast'
  | 'holy-day'
  | 'saint'
  | 'monthly-commemoration'
  | 'synaxarium'
  | 'season'
  | 'fallback'

type TodaySlide = {
  id: string
  title: string
  type: TodaySlideType
  label: string
  summary: string
  image: string
  imageAlt: string
  priority: number
  tags: string[]
  ethiopianDate: string
  gregorianDate: string
  objectFit: 'cover' | 'contain'
  objectPosition: string
}

const SLIDE_INTERVAL_MS = 6500

const TYPE_LABEL: Record<TodaySlideType, string> = {
  'major-feast': 'Major Feast',
  'holy-day': 'Holy Day',
  saint: 'Saint',
  'monthly-commemoration': 'Monthly Commemoration',
  synaxarium: 'Synaxarium',
  season: 'Season',
  fallback: 'Today in Church',
}

const TYPE_PRIORITY: Record<TodaySlideType, number> = {
  'major-feast': 100,
  'holy-day': 95,
  saint: 85,
  'monthly-commemoration': 80,
  synaxarium: 70,
  season: 20,
  fallback: 1,
}

function slideTypeFromRow(row: EotcCalendarDatasetRow): TodaySlideType {
  const e = row.entry
  const primary = e.category.primary
  const secondary = e.category.secondary
  const kind = e.date.kind
  const hasSynaxariumSource = (e.sources ?? []).some((source) => source.type === 'synaxarium')
  const isExactDate = kind === 'fixed' || kind === 'movable'
  const isSaintFamily =
    primary === 'saint' ||
    primary === 'angel' ||
    primary === 'martyr' ||
    primary === 'apostle' ||
    secondary.includes('saint-commemoration') ||
    secondary.includes('angel-commemoration')

  if (kind === 'season') return 'season'
  if (isExactDate && (e.category.majorHoliday || primary === 'major-feast')) return 'major-feast'
  if (isExactDate && (primary === 'minor-feast' || primary === 'mary')) return 'holy-day'
  if (isExactDate && isSaintFamily) return 'saint'
  if (kind === 'monthly-recurring' && isSaintFamily) return 'monthly-commemoration'
  if (hasSynaxariumSource) return 'synaxarium'
  if (kind === 'monthly-recurring') return 'monthly-commemoration'
  if (isExactDate && primary === 'fast') return 'holy-day'
  return 'fallback'
}

function slideTypeFromMovable(item: MovableObservanceOnDay): TodaySlideType {
  if (item.scheduling === 'movable') return 'major-feast'
  if (/kidane|mary|marian|medhane/i.test(item.title)) return 'holy-day'
  return 'saint'
}

function buildRowSlide(
  row: EotcCalendarDatasetRow,
  snapshot: ChurchDaySnapshot,
): TodaySlide | null {
  const e = row.entry
  const title = e.englishTitle?.trim() || e.title
  const image =
    resolveEventImageById(e.id) ||
    resolveCommemorationImage(title, e.transliterationTitle ?? undefined, e.id)
  if (!image) return null

  const type = slideTypeFromRow(row)
  const presentation = resolveEventImagePresentation(e.id, {
    objectFit: 'cover',
    objectPosition: '50% 30%',
  }, e)

  return {
    id: e.id,
    title,
    type,
    label: TYPE_LABEL[type],
    summary: e.summary.short || e.summary.panel,
    image,
    imageAlt: `${title} observance image`,
    priority: TYPE_PRIORITY[type],
    tags: [e.category.primary, ...e.category.secondary, e.date.kind],
    ethiopianDate: snapshot.ethiopian.labelLong,
    gregorianDate: snapshot.gregorian.labelLong,
    objectFit: presentation.objectFit,
    objectPosition: presentation.objectPosition,
  }
}

function buildMovableSlide(
  item: MovableObservanceOnDay,
  snapshot: ChurchDaySnapshot,
): TodaySlide | null {
  const image =
    resolveEventImageById(item.catalogEventId) ||
    resolveCommemorationImage(item.title, item.transliterationTitle, item.catalogEventId)
  if (!image) return null

  const type = slideTypeFromMovable(item)
  const presentation = resolveEventImagePresentation(item.catalogEventId, {
    objectFit: 'cover',
    objectPosition: '50% 30%',
  })

  return {
    id: item.id,
    title: item.title,
    type,
    label: TYPE_LABEL[type],
    summary: item.shortDescription || item.meaning,
    image,
    imageAlt: `${item.title} observance image`,
    priority: TYPE_PRIORITY[type],
    tags: [item.scheduling, item.catalogEventId],
    ethiopianDate: snapshot.ethiopian.labelLong,
    gregorianDate: snapshot.gregorian.labelLong,
    objectFit: presentation.objectFit,
    objectPosition: presentation.objectPosition,
  }
}

function buildCommemorationSlide(snapshot: ChurchDaySnapshot): TodaySlide {
  const c = snapshot.commemoration
  const type: TodaySlideType = c.observanceType.includes('movable-feast')
    ? 'major-feast'
    : c.observanceType.includes('feast')
      ? 'holy-day'
      : c.observanceType.includes('marian-observance')
        ? 'holy-day'
        : c.observanceType.includes('saint-commemoration') ||
            c.observanceType.includes('angel-commemoration')
          ? 'saint'
          : c.observanceType.includes('seasonal-observance')
            ? 'season'
            : 'fallback'
  const image =
    resolveEventImageById(c.catalogEventId) ||
    resolveCommemorationImage(c.title, c.transliterationTitle, c.catalogEventId)
  const presentation = resolveEventImagePresentation(c.catalogEventId, {
    objectFit: 'cover',
    objectPosition: '50% 30%',
  })

  return {
    id: c.catalogEventId || 'today-commemoration',
    title: c.title,
    type,
    label: TYPE_LABEL[type],
    summary: c.shortDescription || c.whyTodayShort || c.summary,
    image,
    imageAlt: `${c.title} observance image`,
    priority: TYPE_PRIORITY[type],
    tags: c.observanceType,
    ethiopianDate: snapshot.ethiopian.labelLong,
    gregorianDate: snapshot.gregorian.labelLong,
    objectFit: presentation.objectFit,
    objectPosition: presentation.objectPosition,
  }
}

function buildFallbackSlide(snapshot: ChurchDaySnapshot): TodaySlide {
  const image =
    resolveSeasonSupportImage(snapshot.season.id, snapshot.fasting.seasonalFast) ||
    calendarImageManifest.support.feastDayPreparation ||
    calendarImageManifest.anchors.todayInChurch

  return {
    id: 'today-seasonal-fallback',
    title: snapshot.season.title,
    type: 'fallback',
    label: TYPE_LABEL.fallback,
    summary: snapshot.season.shortDescription || snapshot.season.summary,
    image,
    imageAlt: `${snapshot.season.title} seasonal church image`,
    priority: TYPE_PRIORITY.fallback,
    tags: ['season', snapshot.season.id || 'church-year'],
    ethiopianDate: snapshot.ethiopian.labelLong,
    gregorianDate: snapshot.gregorian.labelLong,
    objectFit: 'cover',
    objectPosition: '50% 40%',
  }
}

function buildSeasonSlide(snapshot: ChurchDaySnapshot): TodaySlide {
  const image =
    resolveSeasonSupportImage(snapshot.season.id, snapshot.fasting.seasonalFast) ||
    calendarImageManifest.support.feastDayPreparation ||
    calendarImageManifest.anchors.todayInChurch

  return {
    id: `season-${snapshot.season.id || 'church-year'}`,
    title: snapshot.season.title,
    type: 'season',
    label: TYPE_LABEL.season,
    summary: snapshot.season.shortDescription || snapshot.season.summary,
    image,
    imageAlt: `${snapshot.season.title} seasonal church image`,
    priority: TYPE_PRIORITY.season,
    tags: ['season', snapshot.season.id || 'church-year'],
    ethiopianDate: snapshot.ethiopian.labelLong,
    gregorianDate: snapshot.gregorian.labelLong,
    objectFit: 'cover',
    objectPosition: '50% 40%',
  }
}

function buildTodaySlides(snapshot: ChurchDaySnapshot): TodaySlide[] {
  const rows = sortEotcEntriesForCalendarPanel(getEntriesForDate(snapshot.referenceDate))
  const slides = [
    ...rows.map((row) => buildRowSlide(row, snapshot)),
    ...snapshot.movableOnDay.map((item) => buildMovableSlide(item, snapshot)),
    buildCommemorationSlide(snapshot),
    buildSeasonSlide(snapshot),
  ].filter((slide): slide is TodaySlide => Boolean(slide?.image))

  const deduped = new Map<string, TodaySlide>()
  for (const slide of slides) {
    const key = `${slide.id}:${slide.image}`
    const existing = deduped.get(key)
    if (!existing || slide.priority > existing.priority) deduped.set(key, slide)
  }

  const sorted = [...deduped.values()].sort((a, b) => {
    if (a.priority !== b.priority) return b.priority - a.priority
    return a.title.localeCompare(b.title, undefined, { sensitivity: 'base' })
  })

  return sorted.length > 0 ? sorted : [buildFallbackSlide(snapshot)]
}

function useReducedMotion() {
  const [reduced, setReduced] = useState(false)

  useEffect(() => {
    const query = window.matchMedia('(prefers-reduced-motion: reduce)')
    const update = () => setReduced(query.matches)
    update()
    query.addEventListener('change', update)
    return () => query.removeEventListener('change', update)
  }, [])

  return reduced
}

export function HomeTodayInChurchPreview() {
  const { snapshot } = useHomeToday()
  const { gregorian, ethiopian, commemoration, season, fasting } = snapshot
  const fast = fastLine(fasting.weeklyFast, fasting.seasonalFast)
  const seasonLine = `${season.title} - ${season.summary}`
  const slides = useMemo(() => buildTodaySlides(snapshot), [snapshot])
  const [activeIndex, setActiveIndex] = useState(0)
  const [paused, setPaused] = useState(false)
  const reducedMotion = useReducedMotion()
  const touchStartX = useRef<number | null>(null)
  const activeSlide = slides[activeIndex] ?? slides[0]
  const hasMultipleSlides = slides.length > 1

  useEffect(() => {
    setActiveIndex(0)
  }, [slides])

  useEffect(() => {
    if (!hasMultipleSlides || paused || reducedMotion) return undefined
    const timer = window.setInterval(() => {
      setActiveIndex((current) => (current + 1) % slides.length)
    }, SLIDE_INTERVAL_MS)
    return () => window.clearInterval(timer)
  }, [hasMultipleSlides, paused, reducedMotion, slides.length])

  const showPrevious = () => {
    setActiveIndex((current) => (current - 1 + slides.length) % slides.length)
  }

  const showNext = () => {
    setActiveIndex((current) => (current + 1) % slides.length)
  }

  const onTouchStart = (event: TouchEvent<HTMLElement>) => {
    touchStartX.current = event.touches[0]?.clientX ?? null
  }

  const onTouchEnd = (event: TouchEvent<HTMLElement>) => {
    const startX = touchStartX.current
    touchStartX.current = null
    if (startX == null || !hasMultipleSlides) return
    const endX = event.changedTouches[0]?.clientX ?? startX
    const delta = endX - startX
    if (Math.abs(delta) < 36) return
    if (delta > 0) showPrevious()
    else showNext()
  }

  return (
    <PageSection id="today-preview" className={styles.tail}>
      <div className={styles.top}>
        <header className={styles.head}>
          <p className={styles.eyebrow}>Today in Church</p>
          <h2 className={styles.title}>What the Church is keeping</h2>
        </header>
        <figure
          className={styles.figure}
          onMouseEnter={() => setPaused(true)}
          onMouseLeave={() => setPaused(false)}
          onFocus={() => setPaused(true)}
          onBlur={() => setPaused(false)}
          onTouchStart={onTouchStart}
          onTouchEnd={onTouchEnd}
        >
          <div className={styles.slideStage}>
            {slides.map((slide, index) => (
              <CalendarImage
                key={`${slide.id}-${slide.image}`}
                src={slide.image}
                fallbackSrc={calendarImageManifest.anchors.todayInChurch}
                alt={index === activeIndex ? slide.imageAlt : ''}
                className={`${styles.figureImg} ${
                  index === activeIndex ? styles.figureImgActive : ''
                }`}
                objectFit={slide.objectFit}
                objectPosition={slide.objectPosition}
                width={1600}
                height={1100}
                sizes="(max-width: 767px) 100vw, 45vw"
                loading={index === 0 ? 'eager' : 'lazy'}
                fetchPriority={index === 0 ? 'high' : 'low'}
              />
            ))}
          </div>
          <figcaption className={styles.caption}>
            <span>{activeSlide.label}</span>
            <strong>{activeSlide.title}</strong>
          </figcaption>
          {hasMultipleSlides ? (
            <>
              <div className={styles.controls} aria-label="Today in Church slideshow controls">
                <button type="button" onClick={showPrevious} aria-label="Previous observance image">
                  <span aria-hidden>‹</span>
                </button>
                <button type="button" onClick={showNext} aria-label="Next observance image">
                  <span aria-hidden>›</span>
                </button>
              </div>
              <div className={styles.dots} role="tablist" aria-label="Observance images">
                {slides.map((slide, index) => (
                  <button
                    key={`${slide.id}-dot`}
                    type="button"
                    className={index === activeIndex ? styles.dotActive : undefined}
                    onClick={() => setActiveIndex(index)}
                    role="tab"
                    aria-selected={index === activeIndex}
                    aria-label={`Show ${slide.title}`}
                  />
                ))}
              </div>
            </>
          ) : null}
        </figure>
      </div>

      <div className={styles.grid}>
        <div className={styles.chip}>
          <span className={styles.label}>Gregorian</span>
          <span className={styles.value}>{gregorian.labelLong}</span>
        </div>
        <div className={styles.chip}>
          <span className={styles.label}>Ethiopian</span>
          <span className={styles.value}>{ethiopian.labelLong}</span>
        </div>
        <div className={styles.chipWide}>
          <span className={styles.label}>{activeSlide.label}</span>
          <span className={styles.feast}>{activeSlide.title}</span>
          {commemoration.subtitle && activeSlide.id === commemoration.catalogEventId ? (
            <span className={styles.sub}>{commemoration.subtitle}</span>
          ) : null}
        </div>
        <div className={styles.chipWide}>
          <span className={styles.label}>Season &amp; fast</span>
          <span className={styles.season}>{seasonLine}</span>
          {fast ? <span className={styles.fast}>{fast}</span> : null}
        </div>
      </div>

      <p className={styles.meaning}>{activeSlide.summary}</p>

      <Link to="/calendar" className={styles.cta}>
        Open full calendar &amp; Today in Church
      </Link>
    </PageSection>
  )
}
