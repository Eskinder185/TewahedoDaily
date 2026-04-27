import { useEffect, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { PrayerTextTabs } from '../components/prayers/PrayerTextTabs'
import { PageSection } from '../components/ui/PageSection'
import { findCollectionPrayer, findPrayerByLegacySlug } from '../lib/prayers/prayerCollections'
import { prayerShareUrl } from '../lib/prayers/prayerSlug'
import styles from './PrayerDetailPage.module.css'

function youtubeEmbedUrl(youtubeId?: string, youtubeUrl?: string): string {
  if (youtubeId) return `https://www.youtube.com/embed/${youtubeId}`
  if (!youtubeUrl) return ''
  const match = youtubeUrl.match(/(?:v=|youtu\.be\/|embed\/)([A-Za-z0-9_-]{6,})/)
  return match?.[1] ? `https://www.youtube.com/embed/${match[1]}` : ''
}

export function PrayerDetailPage() {
  const { collectionSlug, prayerSlug, slug } = useParams()
  const prayer = prayerSlug
    ? findCollectionPrayer(collectionSlug, prayerSlug)
    : findPrayerByLegacySlug(slug)
  const [copied, setCopied] = useState(false)

  useEffect(() => {
    const title = prayer?.transliterationTitle || prayer?.title
    document.title = title ? `Tewahedo Daily | ${title}` : 'Tewahedo Daily | Prayer not found'
  }, [prayer])

  const copyLink = async () => {
    if (!prayer) return
    const url = prayerShareUrl(prayer.slug, prayer.collectionSlug)
    try {
      await navigator.clipboard.writeText(url)
      setCopied(true)
      window.setTimeout(() => setCopied(false), 1800)
    } catch {
      window.prompt('Copy prayer link', url)
    }
  }

  if (!prayer) {
    return (
      <PageSection variant="tint">
        <div className={styles.notFound}>
          <Link className={styles.backLink} to="/pray">
            Back to Prayer collections
          </Link>
          <h1>Prayer not found</h1>
          <p>The prayer link may be outdated or incomplete.</p>
          <Link className={styles.primaryLink} to="/pray">
            Browse prayers
          </Link>
        </div>
      </PageSection>
    )
  }

  const summaries = [
    prayer.summary.english.trim() ? { label: 'English', text: prayer.summary.english } : null,
    prayer.summary.amharic.trim() ? { label: 'Amharic', text: prayer.summary.amharic } : null,
  ].filter(Boolean) as { label: string; text: string }[]
  const embedUrl = youtubeEmbedUrl(prayer.youtubeId, prayer.youtubeUrl)

  return (
    <PageSection variant="tint">
      <article className={styles.shell}>
        <nav className={styles.topNav} aria-label="Prayer navigation">
          <Link className={styles.backLink} to="/pray">
            Back to Prayer collections
          </Link>
          <Link className={styles.backLink} to={`/pray/${prayer.collectionSlug}`}>
            Back to {prayer.collection}
          </Link>
          <button className={styles.shareBtn} type="button" onClick={copyLink}>
            Share
          </button>
          {copied ? (
            <span className={styles.copied} role="status">
              Link copied
            </span>
          ) : null}
        </nav>

        <header className={styles.header}>
          <div className={styles.badges}>
            <span>{prayer.collection}</span>
            {prayer.chapter ? <span>{prayer.chapter}</span> : null}
          </div>
          <h1 className={styles.title} lang="am">
            {prayer.title}
          </h1>
          {prayer.transliterationTitle ? (
            <p className={styles.subtitle}>{prayer.transliterationTitle}</p>
          ) : null}
        </header>

        {summaries.length > 0 ? (
          <section className={styles.summary} aria-label="Prayer summary">
            {summaries.map((summary) => (
              <div key={summary.label} className={styles.summaryBlock}>
                <h2>{summary.label}</h2>
                <p lang={summary.label === 'Amharic' ? 'am' : undefined}>{summary.text}</p>
              </div>
            ))}
          </section>
        ) : null}

        {(embedUrl || prayer.youtubeUrl) ? (
          <section className={styles.video} aria-label="Prayer video">
            <div className={styles.videoHead}>
              <h2>Watch / Listen</h2>
              {prayer.youtubeUrl ? (
                <a href={prayer.youtubeUrl} target="_blank" rel="noreferrer">
                  Watch / Listen on YouTube
                </a>
              ) : null}
            </div>
            {embedUrl ? (
              <div className={styles.videoFrame}>
                <iframe
                  src={embedUrl}
                  title={`${prayer.transliterationTitle || prayer.title} on YouTube`}
                  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                  allowFullScreen
                />
              </div>
            ) : null}
          </section>
        ) : null}

        <section className={styles.reader} aria-label="Prayer text">
          <PrayerTextTabs text={prayer.text} />
        </section>

        {(prayer.source.bookTitle || prayer.source.fullTextLink || prayer.source.audioUrl) ? (
          <footer className={styles.source}>
            <h2>Source</h2>
            {prayer.source.bookTitle ? <p>{prayer.source.bookTitle}</p> : null}
            <div className={styles.sourceLinks}>
              {prayer.source.fullTextLink ? (
                <a href={prayer.source.fullTextLink} target="_blank" rel="noreferrer">
                  Full text
                </a>
              ) : null}
              {prayer.source.audioUrl ? (
                <a href={prayer.source.audioUrl} target="_blank" rel="noreferrer">
                  Audio
                </a>
              ) : null}
            </div>
          </footer>
        ) : null}
      </article>
    </PageSection>
  )
}
