import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { useTranslation } from '../../i18n'
import { PageSection } from '../ui/PageSection'
import { useHomeToday } from '../../hooks/useHomeToday'
import { CalendarEventCard } from '../calendar/CalendarEventCard'
import { CalendarEventDetail } from '../calendar/CalendarEventDetail'
import { getHomepageTodayEvents, invalidateCalendarCardsCache } from '../../lib/calendar/getCalendarEventsForDate'
import type { PresentableCalendarEvent } from '../../lib/calendar/calendarPresentation'
import { useLocale } from '../../lib/i18n/locale'
import styles from './HomeTodayInChurchPreview.module.css'

const AUTOPLAY_MS = 6500

export function HomeTodayInChurchPreview() {
  const t = useTranslation()
  const { contentLocale: lang } = useLocale()
  const { snapshot, now } = useHomeToday()
  const { gregorian, ethiopian } = snapshot

  const [events, setEvents] = useState<PresentableCalendarEvent[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string>()
  const [slide, setSlide] = useState(0)
  const [detailEvent, setDetailEvent] = useState<PresentableCalendarEvent | null>(null)
  const [paused, setPaused] = useState(false)
  const regionRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    let active = true
    const load = () => {
      setLoading(true)
      setError(undefined)
      void getHomepageTodayEvents(now)
        .then((nextEvents) => {
          if (!active) return
          setEvents(nextEvents)
          setSlide(0)
        })
        .catch((cause) => {
          if (!active) return
          if (import.meta.env.DEV) console.error('[home] Today in Church', cause)
          setError(
            cause && typeof cause === 'object' && 'message' in cause
              ? String((cause as { message?: unknown }).message)
              : 'Unable to load Today in Church.',
          )
          setEvents([])
        })
        .finally(() => {
          if (active) setLoading(false)
        })
    }
    load()
    const onVisible = () => {
      if (document.visibilityState === 'visible') {
        invalidateCalendarCardsCache()
        load()
      }
    }
    document.addEventListener('visibilitychange', onVisible)
    return () => {
      active = false
      document.removeEventListener('visibilitychange', onVisible)
    }
  }, [now])

  const count = events.length
  const activeEvent = count > 0 ? events[Math.min(slide, count - 1)] : null
  const multi = count > 1

  const goSlide = useCallback(
    (dir: -1 | 1) => {
      if (count <= 1) return
      setSlide((prev) => (prev + dir + count) % count)
    },
    [count],
  )

  useEffect(() => {
    if (count <= 1 || paused || detailEvent) return
    const reduce =
      typeof window !== 'undefined' &&
      window.matchMedia('(prefers-reduced-motion: reduce)').matches
    if (reduce) return
    const id = window.setInterval(() => {
      setSlide((prev) => (prev + 1) % count)
    }, AUTOPLAY_MS)
    return () => window.clearInterval(id)
  }, [count, paused, detailEvent])

  const dateLine = useMemo(() => {
    const eth = ethiopian.labelLong || ''
    const gre = gregorian.labelLong || ''
    if (eth && gre) return `${eth} · ${gre}`
    return eth || gre
  }, [ethiopian.labelLong, gregorian.labelLong])

  return (
    <PageSection id="today-preview" className={styles.tail}>
      <div className={styles.layout}>
        <div className={styles.copy}>
          <p className={styles.eyebrow}>{t('home.today.eyebrow')}</p>
          <h2 className={styles.title}>{t('home.today.title')}</h2>
          {dateLine ? <p className={styles.dateLine}>{dateLine}</p> : null}
        </div>

        <div
          className={styles.previewBody}
          ref={regionRef}
          onMouseEnter={() => setPaused(true)}
          onMouseLeave={() => setPaused(false)}
          onFocusCapture={() => setPaused(true)}
          onBlurCapture={(e) => {
            if (!regionRef.current?.contains(e.relatedTarget as Node | null)) {
              setPaused(false)
            }
          }}
        >
          {error && !loading && events.length === 0 ? (
            <p className={styles.status} role="alert">
              {import.meta.env.DEV ? error : 'Unable to load Today in Church right now.'}
            </p>
          ) : loading ? (
            <div className={styles.skeletonCard} role="status" aria-label="Loading today’s observances">
              <div className={styles.skeletonMedia} />
              <div className={styles.skeletonLines}>
                <span className={styles.skeletonLine} />
                <span className={styles.skeletonLineShort} />
              </div>
            </div>
          ) : events.length === 0 ? (
            <p className={styles.status} role="status">
              No special observances listed for today.
            </p>
          ) : (
            <div
              className={styles.carousel}
              role="region"
              aria-roledescription="carousel"
              aria-label="Today in Church"
            >
              <div className={styles.slideStage}>
                {activeEvent ? (
                  <CalendarEventCard
                    event={activeEvent}
                    dateLabel={ethiopian.labelLong || undefined}
                    lang={lang}
                    variant="home"
                    onOpen={setDetailEvent}
                  />
                ) : null}

                {multi ? (
                  <div className={styles.controls}>
                    <button
                      type="button"
                      aria-label="Previous today's card"
                      onClick={() => goSlide(-1)}
                    >
                      ‹
                    </button>
                    <button
                      type="button"
                      aria-label="Next today's card"
                      onClick={() => goSlide(1)}
                    >
                      ›
                    </button>
                  </div>
                ) : null}
              </div>

              {multi ? (
                <div className={styles.dots} role="group" aria-label="Today's observances">
                  {events.map((event, index) => (
                    <button
                      key={`${event.kind}-${event.id}`}
                      type="button"
                      aria-pressed={index === slide}
                      aria-label={`Show card ${index + 1} of ${count}: ${event.title}`}
                      className={index === slide ? styles.dotActive : undefined}
                      onClick={() => setSlide(index)}
                    />
                  ))}
                </div>
              ) : null}

              {multi ? (
                <p className={styles.srOnly} aria-live="polite">
                  Card {slide + 1} of {count}
                </p>
              ) : null}
            </div>
          )}
        </div>
      </div>

      <CalendarEventDetail
        open={detailEvent != null}
        event={detailEvent}
        dateLabel={gregorian.labelLong}
        ethiopianLabel={ethiopian.labelLong}
        onClose={() => setDetailEvent(null)}
      />
    </PageSection>
  )
}
