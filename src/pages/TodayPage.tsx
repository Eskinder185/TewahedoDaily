import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { useTranslation } from '../i18n'
import { useLocale } from '../lib/i18n/locale'
import { PageSection } from '../components/ui/PageSection'
import { CalendarEventImage } from '../components/calendar/CalendarEventImage'
import { LiturgyContextCard } from '../components/calendar/LiturgyContextCard'
import { Artwork, Notice } from '../components/publicContent/PublicUi'
import { useHomeToday } from '../hooks/useHomeToday'
import { publicDaily, todayInAddis } from '../lib/cms/dailyService'
import { useAsync } from '../lib/cms/useAsync'
import { resolveCalendarDayDetail } from '../lib/calendarDayDetails'
import { isInternalPlaceholderCopy } from '../lib/calendarDayDetails/publicLiturgyCopy'
import { collectEotcMatchesForLocalDay } from '../lib/eotcCalendar'
import { gregorianToEthiopian } from '../lib/ethiopianDate'
import { getSynaxariumDayWithCommemorations } from '../lib/prayers/synaxariumSupabase'
import type { SynaxariumDayBundle } from '../lib/prayers/prayerLibraryTypes'
import { supabase } from '../lib/supabase/client'
import {
  resolveEventImageById,
  resolveEventImagePresentation,
} from '../content/calendarImageManifest'
import publicStyles from '../components/publicContent/PublicContent.module.css'
import styles from './TodayPage.module.css'

function fastLine(weekly: string | null, seasonal: string | null) {
  const parts = [weekly, seasonal].filter(Boolean)
  return parts.length ? parts.join(' · ') : null
}

function publicCopy(text: string | null | undefined): string {
  const raw = (text || '').trim()
  if (!raw || isInternalPlaceholderCopy(raw)) return ''
  return raw
}

/**
 * Full “Today in Church” experience — homepage only shows a compact preview.
 */
export function TodayPage() {
  const t = useTranslation()
  const { contentLocale } = useLocale()
  const preferAmharic = contentLocale === 'am'
  const { now, snapshot } = useHomeToday()
  const day = todayInAddis()
  const editorial = useAsync(
    useCallback(
      () => (supabase ? publicDaily(day) : Promise.resolve(null)),
      [day],
    ),
  )
  const [synaxariumBundle, setSynaxariumBundle] = useState<SynaxariumDayBundle | null>()

  useEffect(() => {
    let active = true
    setSynaxariumBundle(undefined)
    const eth = gregorianToEthiopian(now)
    void getSynaxariumDayWithCommemorations(eth.month, eth.day)
      .then((bundle) => {
        if (active) setSynaxariumBundle(bundle)
      })
      .catch((cause) => {
        if (import.meta.env.DEV) console.error('[today] synaxarium', cause)
        if (active) setSynaxariumBundle(null)
      })
    return () => {
      active = false
    }
  }, [now])

  const entries = useMemo(() => collectEotcMatchesForLocalDay(now), [now])
  const detail = useMemo(() => {
    if (synaxariumBundle === undefined) return null
    return resolveCalendarDayDetail(now, entries, {
      synaxariumBundle,
      preferAmharic,
    })
  }, [now, entries, synaxariumBundle, preferAmharic])
  const primary = entries[0]
  const imagePresentation = resolveEventImagePresentation(primary?.entry.id, {
    objectFit: 'cover',
    objectPosition: 'center center',
  })
  const heroImage =
    detail?.imageUrl ||
    (primary ? resolveEventImageById(primary.entry.id) : null) ||
    null
  const fast = fastLine(
    snapshot.fasting.weeklyFast,
    snapshot.fasting.seasonalFast,
  )
  const commemorations = detail?.commemorations
    .map((item) => item.title.trim())
    .filter(Boolean)
    .slice(0, 8)

  return (
    <PageSection id="today" variant="tint" className={styles.page}>
      <header className={styles.head}>
        <p className={styles.eyebrow}>{t('today.section.eyebrow')}</p>
        <h1 className={styles.title}>{t('today.section.title')}</h1>
        <p className={styles.dates}>
          <span>{snapshot.gregorian.labelLong}</span>
          <span aria-hidden> · </span>
          <span lang="am">{snapshot.ethiopian.labelLong}</span>
        </p>
        <p className={styles.season}>
          {snapshot.season.title}
          {fast ? ` · ${fast}` : ''}
        </p>
        <p className={styles.seasonSummary}>{snapshot.season.summary}</p>
      </header>

      <figure className={styles.hero}>
        <CalendarEventImage
          src={heroImage}
          alt={t('calendar.page.observanceImage', {
            title: detail?.title || snapshot.commemoration.title,
          })}
          position={imagePresentation.objectPosition}
          className={styles.heroFrame}
          priority
          sizes="(max-width: 820px) 100vw, 40rem"
        />
        <figcaption className={styles.heroCaption}>
          <span>{t('calendar.today.title')}</span>
          <strong>{detail?.title || snapshot.commemoration.title}</strong>
        </figcaption>
      </figure>

      {detail?.shortDescription ? (
        <p className={styles.summary}>{detail.shortDescription}</p>
      ) : snapshot.commemoration.shortDescription ? (
        <p className={styles.summary}>{snapshot.commemoration.shortDescription}</p>
      ) : null}

      {commemorations && commemorations.length > 0 ? (
        <section className={styles.block} aria-label={t('calendar.detail.commemorations')}>
          <h2 className={styles.blockTitle}>{t('calendar.detail.commemorations')}</h2>
          <ul className={styles.list}>
            {commemorations.map((line, index) => (
              <li key={`${line}-${index}`}>{line}</li>
            ))}
          </ul>
          {detail?.expandedContent?.whyCelebrated?.trim() ? (
            <details className={styles.more}>
              <summary>{t('calendar.detail.readMore')}</summary>
              <p>{detail.expandedContent.whyCelebrated.trim()}</p>
            </details>
          ) : null}
        </section>
      ) : null}

      {detail?.liturgyContext ? (
        <LiturgyContextCard context={detail.liturgyContext} />
      ) : null}

      {(() => {
        const data = editorial.data
        const selectedKinds = (['mezmur', 'saint', 'feast'] as const).filter((kind) =>
          Boolean(publicCopy(data?.[kind]?.title)),
        )
        const hasNote = Boolean(
          publicCopy(data?.summary) || publicCopy(data?.announcement),
        )
        if (!data || (!selectedKinds.length && !hasNote && !editorial.loading)) {
          return null
        }
        return (
          <section className={styles.block} aria-label={t('todayPage.selectionsAria')}>
            <h2 className={styles.blockTitle}>{t('todayPage.selectionsTitle')}</h2>
            <Notice {...editorial} retry={editorial.reload} />
            {publicCopy(data.announcement) ? (
              <p className={styles.summary}>{publicCopy(data.announcement)}</p>
            ) : null}
            {selectedKinds.length ? (
              <div className={`${publicStyles.grid} ${styles.selectionGrid}`}>
                {selectedKinds.map((kind) => {
                  const item = data[kind]!
                  const title = publicCopy(item.title)
                  const heading =
                    kind === 'mezmur'
                      ? t('todayPage.mezmurOfDay')
                      : kind === 'saint'
                        ? t('todayPage.saintOfDay')
                        : t('todayPage.feastOfDay')
                  return (
                    <article className={publicStyles.card} key={kind}>
                      <h3>{heading}</h3>
                      <Artwork reference={item.thumbnail_url} />
                      <Link
                        to={
                          kind === 'mezmur'
                            ? `/practice/mezmur/${item.slug}`
                            : `/content/${kind === 'saint' ? 'saints' : 'feasts'}/${item.slug}`
                        }
                      >
                        {title}
                      </Link>
                    </article>
                  )
                })}
              </div>
            ) : !editorial.loading ? (
              <p className={publicStyles.muted}>
                No editorial selections are published for today. See the calendar for feasts and
                commemorations.
              </p>
            ) : null}
            {hasNote ? (
              <div className={publicStyles.card}>
                {publicCopy(data.summary) ? (
                  <>
                    <h3>Today’s note</h3>
                    <p>{publicCopy(data.summary)}</p>
                  </>
                ) : null}
                {publicCopy(data.announcement) ? (
                  <>
                    <h3>Announcement</h3>
                    <p className={publicStyles.lyrics}>{publicCopy(data.announcement)}</p>
                  </>
                ) : null}
              </div>
            ) : null}
          </section>
        )
      })()}

      <div className={styles.actions}>
        <Link to="/calendar" className={styles.primaryAction}>
          {t('nav.calendar')}
        </Link>
        <Link to="/practice" className={styles.secondaryAction}>
          {t('home.hero.primaryCta')}
        </Link>
      </div>
    </PageSection>
  )
}
