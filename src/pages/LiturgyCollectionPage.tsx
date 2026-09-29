import { useEffect, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { PageLoadingFallback } from '../components/ui/PageLoadingFallback'
import {
  getLiturgyCollectionBySlug,
  getLiturgySections,
} from '../lib/prayers/liturgySupabase'
import { isGenericProvenanceText } from '../lib/prayers/liturgyPresentation'
import type { LiturgyCollection, LiturgySection } from '../lib/prayers/prayerLibraryTypes'
import { useTranslation } from '../i18n'
import styles from './PrayerCollectionPage.module.css'

export function LiturgyCollectionPage() {
  const tr = useTranslation()
  const { collectionSlug = 'divine-liturgy' } = useParams()
  const [collection, setCollection] = useState<LiturgyCollection | null>()
  const [sections, setSections] = useState<LiturgySection[]>([])
  const [error, setError] = useState<string>()
  const [reloadTick, setReloadTick] = useState(0)

  useEffect(() => {
    let active = true
    setCollection(undefined)
    setError(undefined)
    void (async () => {
      try {
        const col = await getLiturgyCollectionBySlug(collectionSlug)
        if (!active) return
        if (!col) {
          setCollection(null)
          return
        }
        const nextSections = await getLiturgySections(col.id)
        if (!active) return
        setCollection(col)
        setSections(nextSections)
      } catch (cause) {
        if (!active) return
        const message =
          cause && typeof cause === 'object' && 'message' in cause
            ? String((cause as { message?: unknown }).message)
            : "We couldn't load the Divine Liturgy."
        if (import.meta.env.DEV) console.error('[liturgy] collection', cause)
        setError(import.meta.env.DEV ? message : "We couldn't load the Divine Liturgy.")
        setCollection(null)
      }
    })()
    return () => {
      active = false
    }
  }, [collectionSlug, reloadTick])

  if (collection === undefined && !error) return <PageLoadingFallback />

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

  if (!collection) {
    return (
      <PageSection variant="tint">
        <div className={styles.notFound}>
          <Link className={styles.backLink} to="/pray">
            {tr('prayers.navigation.backToCollections')}
          </Link>
          <h1>{tr('prayers.collection.notFoundTitle')}</h1>
          <p>{tr('prayers.collection.notFoundDescription')}</p>
        </div>
      </PageSection>
    )
  }

  const collectionDescription = isGenericProvenanceText(collection.description)
    ? ''
    : collection.description.trim()

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
          <h1>{collection.title}</h1>
          {collection.titleAmharic ? (
            <p className={styles.amharic} lang="am">
              {collection.titleAmharic}
            </p>
          ) : null}
          {collectionDescription ? <p className={styles.deck}>{collectionDescription}</p> : null}
          <p className={styles.count}>
            {sections.length === 1
              ? tr('prayers.collection.sectionsCountOne', { count: sections.length })
              : tr('prayers.collection.sectionsCountOther', { count: sections.length })}
          </p>
        </header>

        <ul className={styles.list}>
          {sections.map((section, index) => {
            const description =
              section.description && !isGenericProvenanceText(section.description)
                ? section.description.trim()
                : ''
            return (
              <li key={section.id}>
                <Link className={styles.item} to={`/pray/${collection.slug}/${section.slug}`}>
                  <span className={styles.order}>{String(index + 1).padStart(2, '0')}</span>
                  <span className={styles.itemText}>
                    <strong>{section.title}</strong>
                    {section.titleAmharic ? <span lang="am">{section.titleAmharic}</span> : null}
                    {description ? <small>{description}</small> : null}
                  </span>
                  <span className={styles.action}>{tr('prayers.collection.open')}</span>
                </Link>
              </li>
            )
          })}
        </ul>
      </div>
    </PageSection>
  )
}
