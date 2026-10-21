import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import { useHomeToday } from '../../hooks/useHomeToday'
import type { DayChurchContext } from '../../services/dayChurchContext'
import styles from './ChurchDayBand.module.css'

/**
 * Compact day summary for surfaces that are not the full Today page.
 * Uses loadDayChurchContext — the same published day resolver as Today.
 */
export function ChurchDayBand() {
  const t = useTranslation()
  const { now } = useHomeToday()
  const [context, setContext] = useState<DayChurchContext | null>(null)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    let active = true
    setContext(null)
    setError(null)
    void import('../../services/dayChurchContext')
      .then((mod) => mod.loadDayChurchContext(now))
      .then((next) => {
        if (active) setContext(next)
      })
      .catch((cause) => {
        if (import.meta.env.DEV) console.error('[pray] day context', cause)
        if (active) setError(t('calendar.page.dayLoadError'))
      })
    return () => {
      active = false
    }
  }, [now, t])

  const none = t('calendar.page.noneListed')
  const observances = context
    ? [context.primaryObservance, ...context.observances.filter((item) => item.id !== context.primaryObservance?.id)]
        .filter((item): item is NonNullable<typeof item> => Boolean(item))
        .map((item) => item.title)
    : []
  const shownObservances = observances.slice(0, 3)
  const monthly = context?.monthlyCommemorations.map((item) => item.title) ?? []
  const synaxarium = context?.synaxarium.map((item) => item.title) ?? []
  const hymns = context?.mezmurRecommendations ?? []

  return (
    <section className={styles.band} aria-labelledby="pray-day-heading">
      <div className={styles.head}>
        <h2 id="pray-day-heading" className={styles.title}>
          {t('today.section.eyebrow')}
        </h2>
        <p className={styles.note}>{t('calendar.page.bandSelection')}</p>
      </div>

      {error ? <p className={styles.body}>{error}</p> : null}
      {!context && !error ? (
        <p className={styles.body} role="status">
          {t('calendar.page.loadingDay')}
        </p>
      ) : null}

      {context ? (
        <dl className={styles.list}>
          <div>
            <dt>{t('calendar.page.seasonLabel')}</dt>
            <dd>{context.season?.title || none}</dd>
          </div>
          <div>
            <dt>{t('calendar.page.fastHeading')}</dt>
            <dd>{context.activeFast?.name || context.fastingStatus.label || none}</dd>
          </div>
          <div>
            <dt>{t('calendar.page.observancesLabel')}</dt>
            <dd>{shownObservances.length ? shownObservances.join(' · ') : none}</dd>
          </div>
          <div>
            <dt>{t('calendar.page.monthlyLabel')}</dt>
            <dd>{monthly.length ? monthly.join(' · ') : none}</dd>
          </div>
          <div>
            <dt>{t('calendar.page.synaxariumHeading')}</dt>
            <dd>
              {synaxarium.length ? (
                context.synaxariumDaySlug ? (
                  <Link className={styles.inlineLink} to={`/pray/synaxarium/${context.synaxariumDaySlug}`}>
                    {synaxarium.join(' · ')}
                  </Link>
                ) : (
                  synaxarium.join(' · ')
                )
              ) : (
                t('calendar.page.synaxariumMissing')
              )}
            </dd>
          </div>
          <div>
            <dt>{t('calendar.page.hymnsHeading')}</dt>
            <dd>
              {hymns.length
                ? hymns.map((item) => (
                    <Link key={item.id} className={styles.inlineLink} to={item.practiceHref}>
                      {item.title}
                    </Link>
                  ))
                : t('calendar.page.relatedMissing')}
            </dd>
          </div>
        </dl>
      ) : null}

      <Link className={styles.seeAll} to="/today">
        {t('home.today.seeAll')}
      </Link>
    </section>
  )
}
