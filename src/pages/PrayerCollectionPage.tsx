import { Link, Navigate, useParams } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import {
  findPrayerByLegacySlug,
  getCollectionPrayers,
  getPrayerCollection,
} from '../lib/prayers/prayerCollections'
import { MEHARENE_AB_ENTRY, YEKIDANE_TSELOT_ENTRY } from '../lib/prayers/mediaPrayerEntries'
import { prayerCollectionPath, prayerDetailPath } from '../lib/prayers/prayerSlug'
import styles from './PrayerCollectionPage.module.css'

function collectionMedia(collectionId: string) {
  if (collectionId === 'yekidane-tselot') return YEKIDANE_TSELOT_ENTRY
  if (collectionId === 'meharene-ab') return MEHARENE_AB_ENTRY
  return null
}

export function PrayerCollectionPage() {
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
            Back to Prayer collections
          </Link>
          <h1>Prayer collection not found</h1>
          <p>The collection link may be outdated or incomplete.</p>
        </div>
      </PageSection>
    )
  }

  const prayers = getCollectionPrayers(collection.id)
  const media = collectionMedia(collection.id)

  return (
    <PageSection variant="tint">
      <div className={styles.shell}>
        <nav className={styles.nav} aria-label="Prayer navigation">
          <Link className={styles.backLink} to="/pray">
            Back to Prayer collections
          </Link>
        </nav>

        <header className={styles.head}>
          <p className={styles.eyebrow}>Prayer collection</p>
          <h1>{collection.title}</h1>
          <p className={styles.amharic} lang="am">
            {collection.amharicTitle}
          </p>
          <p className={styles.deck}>{collection.description}</p>
          <p className={styles.count}>
            {prayers.length} {prayers.length === 1 ? 'section' : 'sections'}
          </p>
        </header>

        {media ? (
          <section className={styles.media} aria-label={`${collection.title} video`}>
            <div className={styles.mediaHead}>
              <h2>Watch / Listen</h2>
              <a href={media.youtubeUrl} target="_blank" rel="noreferrer">
                Watch / Listen on YouTube
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
                <span className={styles.action}>Open</span>
              </Link>
            </li>
          ))}
        </ul>

        <p className={styles.canonical}>
          Collection URL: <Link to={prayerCollectionPath(collection.id)}>{prayerCollectionPath(collection.id)}</Link>
        </p>
      </div>
    </PageSection>
  )
}
