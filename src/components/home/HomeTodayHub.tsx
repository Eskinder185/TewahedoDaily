import { lazy, Suspense } from 'react'
import { Link } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import { getHomeDayLabels } from '../../lib/home/homeDayLabels'
import { HomeContinueStrip } from './HomeContinueStrip'
import styles from './HomeTodayHub.module.css'

const HomeTodayInChurchPreview = lazy(() =>
  import('./HomeTodayInChurchPreview').then((m) => ({
    default: m.HomeTodayInChurchPreview,
  })),
)

/**
 * First-viewport “Today” hub: date + actions paint immediately; heavy calendar
 * cards load in a nested Suspense so they do not block the companion chrome.
 */
export function HomeTodayHub() {
  const t = useTranslation()
  const labels = getHomeDayLabels()

  return (
    <div className={styles.root}>
      <section className={styles.hub} aria-labelledby="home-today-heading">
        <p className={styles.eyebrow}>{t('home.today.eyebrow')}</p>
        <h1 id="home-today-heading" className={styles.title}>
          {t('home.todayHub.heading')}
        </h1>
        <p className={styles.dateLine}>
          <span>{labels.ethiopianLabel}</span>
          <span aria-hidden className={styles.dot}>
            ·
          </span>
          <span>{labels.gregorianLabel}</span>
        </p>
        <p className={styles.deck}>{t('home.todayHub.deck')}</p>
        <div className={styles.actions}>
          <Link className={styles.primary} to="/calendar">
            {t('home.today.cta')}
          </Link>
          <Link className={styles.secondary} to="/pray">
            {t('home.todayHub.prayCta')}
          </Link>
          <Link className={styles.secondary} to="/bible">
            {t('home.todayHub.bibleCta')}
          </Link>
        </div>
      </section>

      <HomeContinueStrip />

      <Suspense
        fallback={
          <div className={styles.cardsSkeleton} aria-busy="true" aria-label={t('home.todayLoading')}>
            <div className={styles.skelBlock} />
            <div className={styles.skelBlockShort} />
          </div>
        }
      >
        <HomeTodayInChurchPreview />
      </Suspense>
    </div>
  )
}
