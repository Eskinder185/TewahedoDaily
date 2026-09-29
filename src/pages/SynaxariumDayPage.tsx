import { useEffect, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { PageLoadingFallback } from '../components/ui/PageLoadingFallback'
import {
  getSynaxariumCommemorationsForDay,
  getSynaxariumDayBySlug,
} from '../lib/prayers/synaxariumSupabase'
import type { SynaxariumCommemoration, SynaxariumDay } from '../lib/prayers/prayerLibraryTypes'
import { useTranslation } from '../i18n'
import styles from './PrayerDetailPage.module.css'

export function SynaxariumDayPage() {
  const tr = useTranslation()
  const { daySlug, prayerSlug } = useParams()
  const resolvedDaySlug = daySlug || prayerSlug
  const [day, setDay] = useState<SynaxariumDay | null>()
  const [items, setItems] = useState<SynaxariumCommemoration[]>([])
  const [error, setError] = useState<string>()
  const [reloadTick, setReloadTick] = useState(0)

  useEffect(() => {
    let active = true
    setDay(undefined)
    setError(undefined)
    void (async () => {
      try {
        const nextDay = await getSynaxariumDayBySlug(resolvedDaySlug)
        if (!active) return
        if (!nextDay) {
          setDay(null)
          return
        }
        const nextItems = await getSynaxariumCommemorationsForDay(nextDay.id)
        if (!active) return
        setDay(nextDay)
        setItems(nextItems)
      } catch (cause) {
        if (!active) return
        const message =
          cause && typeof cause === 'object' && 'message' in cause
            ? String((cause as { message?: unknown }).message)
            : "We couldn't load this Synaxarium day."
        if (import.meta.env.DEV) console.error('[synaxarium] day', cause)
        setError(import.meta.env.DEV ? message : "We couldn't load this Synaxarium day.")
        setDay(null)
      }
    })()
    return () => {
      active = false
    }
  }, [resolvedDaySlug, reloadTick])

  if (day === undefined && !error) return <PageLoadingFallback />

  if (error) {
    return (
      <PageSection variant="tint">
        <div className={styles.notFound}>
          <Link className={styles.backLink} to="/pray/synaxarium">
            Back to Synaxarium
          </Link>
          <h1>{error}</h1>
          <button type="button" className={styles.primaryLink} onClick={() => setReloadTick((n) => n + 1)}>
            Try again
          </button>
        </div>
      </PageSection>
    )
  }

  if (!day) {
    return (
      <PageSection variant="tint">
        <div className={styles.notFound}>
          <Link className={styles.backLink} to="/pray/synaxarium">
            Back to Synaxarium
          </Link>
          <h1>{tr('prayers.detail.notFoundTitle')}</h1>
        </div>
      </PageSection>
    )
  }

  return (
    <PageSection variant="tint">
      <article className={styles.shell}>
        <nav className={styles.topNav} aria-label={tr('prayers.navigation.aria')}>
          <Link className={styles.backLink} to="/pray">
            {tr('prayers.navigation.backToCollections')}
          </Link>
          <Link className={styles.backLink} to="/pray/synaxarium">
            Back to Synaxarium
          </Link>
        </nav>

        <header className={styles.header}>
          <div className={styles.badges}>
            <span>Synaxarium</span>
            <span>{day.ethiopianMonth}</span>
          </div>
          <h1 className={styles.title}>{day.displayDateEnglish}</h1>
          {day.displayDateAmharic ? (
            <p className={styles.subtitle} lang="am">
              {day.displayDateAmharic}
            </p>
          ) : null}
        </header>

        <section className={styles.summary} aria-label="Commemorations">
          {items.length === 0 ? <p>No commemorations published for this day.</p> : null}
          {items.map((item) => (
            <article key={item.id} className={styles.summaryBlock}>
              {item.commemorationType && item.commemorationType !== 'other' ? (
                <h2>{item.commemorationType.replace(/[-_]+/g, ' ')}</h2>
              ) : null}
              <p>
                <strong lang={item.titleAmharic ? undefined : undefined}>{item.title}</strong>
              </p>
              {item.titleAmharic ? (
                <p lang="am">
                  <strong>{item.titleAmharic}</strong>
                </p>
              ) : null}
              {item.summary ? <p>{item.summary}</p> : null}
              {item.bodyAmharic ? (
                <p lang="am" style={{ whiteSpace: 'pre-wrap' }}>
                  {item.bodyAmharic}
                </p>
              ) : null}
              {item.bodyEnglish ? <p style={{ whiteSpace: 'pre-wrap' }}>{item.bodyEnglish}</p> : null}
              {item.scriptureReferences ? <p>{item.scriptureReferences}</p> : null}
            </article>
          ))}
        </section>
      </article>
    </PageSection>
  )
}
