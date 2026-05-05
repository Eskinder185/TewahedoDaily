import { Link, Navigate, useParams } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import {
  findPrayerByLegacySlug,
  getCollectionPrayers,
  getPrayerCollection,
} from '../lib/prayers/prayerCollections'
import { useTranslation } from '../i18n'
import { MEHARENE_AB_ENTRY, YEKIDANE_TSELOT_ENTRY } from '../lib/prayers/mediaPrayerEntries'
import { prayerCollectionPath, prayerDetailPath } from '../lib/prayers/prayerSlug'
import styles from './PrayerCollectionPage.module.css'

function collectionMedia(collectionId: string) {
  if (collectionId === 'yekidane-tselot') return YEKIDANE_TSELOT_ENTRY
  if (collectionId === 'meharene-ab') return MEHARENE_AB_ENTRY
  return null
}

export function PrayerCollectionPage() {
  const tr = useTranslation()
  const { collectionSlug } = useParams()
  const collection = getPrayerCollection(collectionSlug)
  const legacyPrayer = findPrayerByLegacySlug(collectionSlug)

  if (!collection && legacyPrayer) {
    return (
      <Navigate
        to={prayerDetailPath(legacyPrayer.slug, legacyPrayer.collectionSlug)}
        replace
      />
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

  const prayers = getCollectionPrayers(collection.id)
  const media = collectionMedia(collection.id)

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
          <p className={styles.count}>
            {prayers.length === 1
              ? tr('prayers.collection.sectionsCountOne', { count: prayers.length })
              : tr('prayers.collection.sectionsCountOther', { count: prayers.length })}
          </p>
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

        <ul className={styles.list}>
          {prayers.map((prayer) => (
            <li key={`${prayer.collectionSlug}-${prayer.slug}`}>
              <Link
                className={styles.item}
                to={prayerDetailPath(prayer.slug, prayer.collectionSlug)}
              >
                <span className={styles.order}>{String(prayer.order).padStart(2, '0')}</span>
                <span className={styles.itemText}>
                  <strong lang="am">{prayer.title}</strong>
                  {prayer.transliterationTitle ? <span>{prayer.transliterationTitle}</span> : null}
                  {prayer.chapter || prayer.section ? (
                    <small>
                      {[prayer.chapter, prayer.section].filter(Boolean).join(' / ')}
                    </small>
                  ) : null}
                </span>
                <span className={styles.action}>{tr('prayers.collection.open')}</span>
              </Link>
            </li>
          ))}
        </ul>

        <p className={styles.canonical}>
          {tr('prayers.collection.urlLabel')}: <Link to={prayerCollectionPath(collection.id)}>{prayerCollectionPath(collection.id)}</Link>
        </p>
      </div>
    </PageSection>
  )
}
