import { useEffect, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { PageLoadingFallback } from '../components/ui/PageLoadingFallback'
import type { CollectionPrayer } from '../lib/prayers/prayerCollections'
import {
  loadPrayerCollection,
  type PrayerCollectionBundle,
} from '../lib/prayers/prayerSupabase'
import { useTranslation } from '../i18n'
import { MEHARENE_AB_ENTRY, YEKIDANE_TSELOT_ENTRY } from '../lib/prayers/mediaPrayerEntries'
import { prayerDetailPath } from '../lib/prayers/prayerSlug'
import styles from './PrayerCollectionPage.module.css'

function collectionMedia(collectionId: string) {
  if (collectionId === 'yekidane-tselot') return YEKIDANE_TSELOT_ENTRY
  if (collectionId === 'meharene-ab') return MEHARENE_AB_ENTRY
  return null
}

function countLabel(
  collection: PrayerCollectionBundle['collection'],
  tr: (key: string, vars?: Record<string, string | number>) => string,
) {
  const count =
    collection.countLabel === 'sections'
      ? collection.sectionCount || collection.prayerCount
      : collection.prayerCount
  if (collection.countLabel === 'psalms') {
    return count === 1
      ? tr('prayers.collection.psalmsCountOne', { count })
      : tr('prayers.collection.psalmsCountOther', { count })
  }
  if (collection.countLabel === 'prayers') {
    return count === 1
      ? tr('prayers.collection.prayersCountOne', { count })
      : tr('prayers.collection.prayersCountOther', { count })
  }
  return count === 1
    ? tr('prayers.collection.sectionsCountOne', { count })
    : tr('prayers.collection.sectionsCountOther', { count })
}

function PrayerLink({
  prayer,
  collectionSlug,
  openLabel,
}: {
  prayer: CollectionPrayer
  collectionSlug: string
  openLabel: string
}) {
  const isPsalm = collectionSlug === 'mezmure-dawit'
  const psalmNumber = prayer.psalmNumber
  const orderLabel = isPsalm && psalmNumber
    ? String(psalmNumber).padStart(2, '0')
    : String(prayer.order).padStart(2, '0')
  const primaryTitle =
    isPsalm && psalmNumber
      ? `Psalm ${psalmNumber}`
      : prayer.title
  const secondary =
    isPsalm && psalmNumber
      ? prayer.titles?.amharic || prayer.title
      : prayer.transliterationTitle

  return (
    <Link className={styles.item} to={prayerDetailPath(prayer.slug, collectionSlug)}>
      <span className={styles.order}>{orderLabel}</span>
      <span className={styles.itemText}>
        <strong lang={isPsalm ? undefined : 'am'}>{primaryTitle}</strong>
        {secondary && secondary !== primaryTitle ? (
          <span lang="am">{secondary}</span>
        ) : null}
        {!isPsalm && (prayer.chapter || prayer.section) ? (
          <small>
            {[prayer.chapter, prayer.section]
              .map((part) => (part || '').trim())
              .filter(Boolean)
              .filter((part, index, all) => all.findIndex((p) => p.toLowerCase() === part.toLowerCase()) === index)
              .join(' / ')}
          </small>
        ) : null}
      </span>
      <span className={styles.action}>{openLabel}</span>
    </Link>
  )
}

export function PrayerCollectionPage() {
  const tr = useTranslation()
  const { collectionSlug } = useParams()
  const [bundle, setBundle] = useState<PrayerCollectionBundle | null>()
  const [error, setError] = useState<string>()
  const [reloadTick, setReloadTick] = useState(0)

  useEffect(() => {
    let active = true
    queueMicrotask(() => {
      if (!active) return
      setBundle(undefined)
      setError(undefined)
    })
    void loadPrayerCollection(collectionSlug)
      .then((result) => {
        if (!active) return
        setBundle(result)
      })
      .catch((cause) => {
        if (!active) return
        const message =
          cause && typeof cause === 'object' && 'message' in cause
            ? String((cause as { message?: unknown }).message)
            : "We couldn't load the prayer collection."
        if (import.meta.env.DEV) console.error('[prayers] collection', cause)
        setError(import.meta.env.DEV ? message : "We couldn't load the prayer collection.")
        setBundle(null)
      })
    return () => {
      active = false
    }
  }, [collectionSlug, reloadTick])

  if (bundle === undefined && !error) return <PageLoadingFallback />

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

  if (!bundle) {
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

  const { collection, sections, prayers } = bundle
  const media = collectionMedia(collection.id)
  const useSections = sections.length > 0 && sections.some((section) => section.prayers.length > 0)
  const emptyPublished =
    prayers.length === 0 && sections.every((section) => section.prayers.length === 0)

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
          <p className={styles.amharic} lang="am">
            {collection.amharicTitle}
          </p>
          <p className={styles.deck}>{collection.description}</p>
          <p className={styles.count}>{countLabel(collection, tr)}</p>
        </header>

        {media ? (
          <section className={styles.media} aria-label={`${collection.title} ${tr('prayers.detail.videoAriaSuffix')}`}>
            <div className={styles.mediaHead}>
              <h2>{tr('prayers.detail.watchListen')}</h2>
              <a href={media.youtubeUrl} target="_blank" rel="noreferrer">
                {tr('prayers.detail.watchListenOnYoutube')}
              </a>
            </div>
            <div className={styles.mediaFrame}>
              <iframe
                src={`https://www.youtube.com/embed/${media.youtubeId}`}
                title={`${collection.title} on YouTube`}
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                allowFullScreen
              />
            </div>
          </section>
        ) : null}

        {emptyPublished ? (
          <p className={styles.deck} role="status">
            Prayer text for this collection is not published in Supabase yet. Sections may exist in
            the CMS without prayer rows.
          </p>
        ) : null}

        {useSections ? (
          sections.map((section) => (
            <section key={section.id} className={styles.sectionBlock} aria-label={section.title}>
              <h2 className={styles.sectionTitle}>{section.title}</h2>
              {section.description ? <p className={styles.deck}>{section.description}</p> : null}
              <ul className={styles.list}>
                {section.prayers.map((prayer) => (
                  <li key={`${prayer.collectionSlug}-${prayer.slug}`}>
                    <PrayerLink
                      prayer={prayer}
                      collectionSlug={collection.id}
                      openLabel={tr('prayers.collection.open')}
                    />
                  </li>
                ))}
              </ul>
            </section>
          ))
        ) : (
          <ul className={styles.list}>
            {prayers.map((prayer) => (
              <li key={`${prayer.collectionSlug}-${prayer.slug}`}>
                <PrayerLink
                  prayer={prayer}
                  collectionSlug={collection.id}
                  openLabel={tr('prayers.collection.open')}
                />
              </li>
            ))}
          </ul>
        )}

      </div>
    </PageSection>
  )
}
