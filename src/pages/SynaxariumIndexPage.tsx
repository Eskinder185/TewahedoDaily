import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { PageLoadingFallback } from '../components/ui/PageLoadingFallback'
import { getSynaxariumDays } from '../lib/prayers/synaxariumSupabase'
import type { SynaxariumDay } from '../lib/prayers/prayerLibraryTypes'
import { useTranslation } from '../i18n'
import styles from './PrayerCollectionPage.module.css'

export function SynaxariumIndexPage() {
  const tr = useTranslation()
  const [days, setDays] = useState<SynaxariumDay[] | null>()
  const [error, setError] = useState<string>()
  const [reloadTick, setReloadTick] = useState(0)

  useEffect(() => {
    let active = true
    setDays(undefined)
    setError(undefined)
    void getSynaxariumDays()
      .then((rows) => {
        if (active) setDays(rows)
      })
      .catch((cause) => {
        if (!active) return
        const message =
          cause && typeof cause === 'object' && 'message' in cause
            ? String((cause as { message?: unknown }).message)
            : "We couldn't load the Synaxarium."
        if (import.meta.env.DEV) console.error('[synaxarium] index', cause)
        setError(import.meta.env.DEV ? message : "We couldn't load the Synaxarium.")
        setDays(null)
      })
    return () => {
      active = false
    }
  }, [reloadTick])

  const months = useMemo(() => {
    const map = new Map<string, SynaxariumDay[]>()
    for (const day of days ?? []) {
      const key = day.ethiopianMonth
      const list = map.get(key) ?? []
      list.push(day)
      map.set(key, list)
    }
    return [...map.entries()]
  }, [days])

  // undefined = follow default (first month); null = user collapsed all.
  const [openMonth, setOpenMonth] = useState<string | null | undefined>(undefined)
  const activeMonth = openMonth === undefined ? (months[0]?.[0] ?? null) : openMonth

  if (days === undefined && !error) return <PageLoadingFallback />

  if (error) {
    return (
      <PageSection variant="tint">
        <div className={styles.notFound}>
          <Link className={styles.backLink} to="/pray">
            {tr('prayers.navigation.backToCollections')}
          </Link>
          <h1>{error}</h1>
          <button type="button" className={styles.openLink} onClick={() => setReloadTick((n) => n + 1)}>
            Try again
          </button>
        </div>
      </PageSection>
    )
  }

  return (
    <PageSection variant="tint">
      <div className={styles.shell}>
        <nav className={styles.nav} aria-label={tr('prayers.navigation.aria')}>
          <Link className={styles.backLink} to="/pray">
            {tr('prayers.navigation.backToCollections')}
          </Link>
        </nav>

        <header className={styles.head}>
          <p className={styles.eyebrow}>{tr('prayers.collection.label')}</p>
          <h1>Synaxarium</h1>
          <p className={styles.amharic} lang="am">
            ስንክሳር
          </p>
          <p className={styles.deck}>
            Daily Ethiopian Orthodox commemorations, saints, feasts, and church history.
          </p>
          <p className={styles.count}>
            {(days?.length ?? 0) === 1
              ? tr('prayers.collection.daysCountOne', { count: days?.length ?? 0 })
              : tr('prayers.collection.daysCountOther', { count: days?.length ?? 0 })}
          </p>
        </header>

        {months.map(([month, monthDays]) => {
          const expanded = activeMonth === month
          return (
            <details
              key={month}
              className={styles.sectionBlock}
              open={expanded}
              onToggle={(event) => {
                const nextOpen = event.currentTarget.open
                setOpenMonth(nextOpen ? month : null)
              }}
            >
              <summary className={styles.sectionTitle}>
                {month}
                <span className={styles.count}>
                  {monthDays.length === 1
                    ? tr('prayers.collection.daysCountOne', { count: monthDays.length })
                    : tr('prayers.collection.daysCountOther', { count: monthDays.length })}
                </span>
              </summary>
              <ul className={styles.list}>
                {monthDays.map((day) => (
                  <li key={day.id}>
                    <Link className={styles.item} to={`/pray/synaxarium/${day.slug}`}>
                      <span className={styles.order}>{String(day.ethiopianDay).padStart(2, '0')}</span>
                      <span className={styles.itemText}>
                        <strong>{day.displayDateEnglish}</strong>
                        {day.displayDateAmharic ? <span lang="am">{day.displayDateAmharic}</span> : null}
                        {day.summary ? <small>{day.summary}</small> : null}
                      </span>
                      <span className={styles.action}>{tr('prayers.collection.open')}</span>
                    </Link>
                  </li>
                ))}
              </ul>
            </details>
          )
        })}
      </div>
    </PageSection>
  )
}
