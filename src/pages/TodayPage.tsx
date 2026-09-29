import { useCallback, useMemo } from 'react'
import { Link } from 'react-router-dom'
import { useTranslation } from '../i18n'
import { PageSection } from '../components/ui/PageSection'
import { CalendarImage } from '../components/calendar/CalendarImage'
import { LiturgyContextCard } from '../components/calendar/LiturgyContextCard'
import { Artwork, Notice } from '../components/publicContent/PublicUi'
import { useHomeToday } from '../hooks/useHomeToday'
import { publicDaily, todayInAddis } from '../lib/cms/dailyService'
import { useAsync } from '../lib/cms/useAsync'
import { resolveCalendarDayDetail } from '../lib/calendarDayDetails'
import { getEntriesForDate } from '../lib/eotcCalendar'
import { supabase } from '../lib/supabase/client'
import {
  calendarImageManifest,
  resolveEventImageById,
  resolveEventImagePresentation,
} from '../content/calendarImageManifest'
import publicStyles from '../components/publicContent/PublicContent.module.css'
import styles from './TodayPage.module.css'

function fastLine(weekly: string | null, seasonal: string | null) {
  const parts = [weekly, seasonal].filter(Boolean)
  return parts.length ? parts.join(' · ') : null
}

/**
 * Full “Today in Church” experience — homepage only shows a compact preview.
 */
export function TodayPage() {
  const t = useTranslation()
  const { now, snapshot } = useHomeToday()
  const day = todayInAddis()
  const editorial = useAsync(
    useCallback(
      () => (supabase ? publicDaily(day) : Promise.resolve(null)),
      [day],
    ),
  )

  const entries = useMemo(() => getEntriesForDate(now), [now])
  const detail = useMemo(
    () => resolveCalendarDayDetail(now, entries),
    [now, entries],
  )
  const primary = entries[0]
  const imagePresentation = resolveEventImagePresentation(primary?.entry.id, {
    objectFit: 'cover',
    objectPosition: '50% 32%',
  })
  const heroImage =
    (primary ? resolveEventImageById(primary.entry.id) : null) ||
    calendarImageManifest.anchors.todayInChurch
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
        <CalendarImage
          src={heroImage}
          fallbackSrc={calendarImageManifest.anchors.todayInChurch}
          alt={t('calendar.page.observanceImage', {
            title: detail?.title || snapshot.commemoration.title,
          })}
          className={styles.heroImg}
          objectFit={imagePresentation.objectFit}
          objectPosition={imagePresentation.objectPosition}
          fetchPriority="high"
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

      <section className={styles.block} aria-label="Editorial selections for today">
        <h2 className={styles.blockTitle}>Today’s selections</h2>
        <Notice {...editorial} retry={editorial.reload} />
        {editorial.data ? (
          <>
            {editorial.data.announcement ? (
              <p className={styles.summary}>{editorial.data.announcement}</p>
            ) : null}
            <div className={`${publicStyles.grid} ${styles.selectionGrid}`}>
              {(['mezmur', 'saint', 'feast'] as const).map((kind, i) => {
                const item = editorial.data![kind]
                return (
                  <article className={publicStyles.card} key={kind}>
                    <h3>
                      {
                        [
                          'Mezmur of the Day',
                          'Saint of the Day',
                          'Feast of the Day',
                        ][i]
                      }
                    </h3>
                    {item ? (
                      <>
                        <Artwork reference={item.thumbnail_url} />
                        <Link
                          to={
                            kind === 'mezmur'
                              ? `/practice/mezmur/${item.slug}`
                              : `/content/${kind === 'saint' ? 'saints' : 'feasts'}/${item.slug}`
                          }
                        >
                          {item.title}
                        </Link>
                      </>
                    ) : (
                      <p className={publicStyles.muted}>No selection for today.</p>
                    )}
                  </article>
                )
              })}
            </div>
            {(editorial.data.summary || editorial.data.announcement) && (
              <div className={publicStyles.card}>
                {editorial.data.summary ? (
                  <>
                    <h3>Today’s note</h3>
                    <p>{editorial.data.summary}</p>
                  </>
                ) : null}
                {editorial.data.announcement ? (
                  <>
                    <h3>Announcement</h3>
                    <p className={publicStyles.lyrics}>
                      {editorial.data.announcement}
                    </p>
                  </>
                ) : null}
              </div>
            )}
          </>
        ) : (
          !editorial.loading &&
          !editorial.error && (
            <p className={publicStyles.muted}>
              Editorial selections for today will appear here when published.
            </p>
          )
        )}
      </section>

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
