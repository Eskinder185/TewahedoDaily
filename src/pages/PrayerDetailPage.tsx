import { useEffect, useMemo, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { PrayerReader } from '../components/prayers/PrayerReader'
import { PageSection } from '../components/ui/PageSection'
import { PageLoadingFallback } from '../components/ui/PageLoadingFallback'
import { FavoriteButton } from '../components/publicContent/FavoriteButton'
import type { CollectionPrayer } from '../lib/prayers/prayerCollections'
import { loadPrayer } from '../lib/prayers/prayerSupabase'
import { useTranslation } from '../i18n'
import { prayerDetailPath, prayerShareUrl } from '../lib/prayers/prayerSlug'
import { useReadingProgressTracker } from '../lib/userContent/useReadingProgressTracker'
import styles from './PrayerDetailPage.module.css'

function youtubeEmbedUrl(youtubeId?: string, youtubeUrl?: string): string {
  if (youtubeId) return `https://www.youtube.com/embed/${youtubeId}`
  if (!youtubeUrl) return ''
  const match = youtubeUrl.match(/(?:v=|youtu\.be\/|embed\/)([A-Za-z0-9_-]{6,})/)
  return match?.[1] ? `https://www.youtube.com/embed/${match[1]}` : ''
}

export function PrayerDetailPage() {
  const tr = useTranslation()
  const { collectionSlug, prayerSlug, slug } = useParams()
  const [prayer, setPrayer] = useState<CollectionPrayer | null>()
  const [error, setError] = useState<string>()
  const [copied, setCopied] = useState(false)
  const [reloadTick, setReloadTick] = useState(0)

  useEffect(() => {
    let active = true
    queueMicrotask(() => {
      if (!active) return
      setPrayer(undefined)
      setError(undefined)
    })
    void loadPrayer(collectionSlug, prayerSlug ?? slug)
      .then((row) => {
        if (active) setPrayer(row ?? null)
      })
      .catch((cause) => {
        if (!active) return
        const message =
          cause && typeof cause === 'object' && 'message' in cause
            ? String((cause as { message?: unknown }).message)
            : "We couldn't load this prayer."
        if (import.meta.env.DEV) console.error('[prayers] detail', cause)
        setError(import.meta.env.DEV ? message : "We couldn't load this prayer.")
        setPrayer(null)
      })
    return () => {
      active = false
    }
  }, [collectionSlug, prayerSlug, slug, reloadTick])

  useEffect(() => {
    const title = prayer?.transliterationTitle || prayer?.title
    document.title = title
      ? `Tewahedo Daily | ${title}`
      : `Tewahedo Daily | ${tr('prayers.detail.notFoundTitle')}`
  }, [prayer, tr])

  const progressIdentity = useMemo(() => {
    if (!prayer) return null
    return {
      contentType: (prayer.psalmNumber ? 'psalm' : 'prayer') as 'psalm' | 'prayer',
      contentId: prayer.id || null,
      contentSlug: prayer.slug,
      collectionSlug: prayer.collectionSlug,
      sectionSlug: prayer.section || null,
      title: prayer.transliterationTitle || prayer.title,
      route: prayerDetailPath(prayer.slug, prayer.collectionSlug),
    }
  }, [prayer])

  useReadingProgressTracker(progressIdentity)

  const copyLink = async () => {
    if (!prayer) return
    const url = prayerShareUrl(prayer.slug, prayer.collectionSlug)
    try {
      await navigator.clipboard.writeText(url)
      setCopied(true)
      window.setTimeout(() => setCopied(false), 1800)
    } catch {
      window.prompt(tr('prayers.detail.copyPrompt'), url)
    }
  }

  if (prayer === undefined && !error) return <PageLoadingFallback />

  if (error) {
    return (
      <PageSection variant="tint">
        <div className={styles.notFound}>
          <Link className={styles.backLink} to="/pray">
            {tr('prayers.navigation.backToCollections')}
          </Link>
          <h1>{error}</h1>
          <button type="button" className={styles.primaryLink} onClick={() => setReloadTick((n) => n + 1)}>
            Try again
          </button>
        </div>
      </PageSection>
    )
  }

  if (!prayer) {
    return (
      <PageSection variant="tint">
        <div className={styles.notFound}>
          <Link className={styles.backLink} to="/pray">
            {tr('prayers.navigation.backToCollections')}
          </Link>
          <h1>{tr('prayers.detail.notFoundTitle')}</h1>
          <p>{tr('prayers.detail.notFoundDescription')}</p>
          <Link className={styles.primaryLink} to="/pray">
            {tr('prayers.detail.browsePrayers')}
          </Link>
        </div>
      </PageSection>
    )
  }

  const summaries = [
    prayer.summary.english.trim() ? { label: tr('prayers.languages.english'), text: prayer.summary.english } : null,
    prayer.summary.amharic.trim() ? { label: tr('prayers.languages.amharic'), text: prayer.summary.amharic } : null,
  ].filter(Boolean) as { label: string; text: string }[]
  const embedUrl = youtubeEmbedUrl(prayer.youtubeId, prayer.youtubeUrl)

  return (
    <PageSection variant="tint">
      <article className={styles.shell}>
        <nav className={styles.topNav} aria-label={tr('prayers.navigation.aria')}>
          <Link className={styles.backLink} to="/pray">
            {tr('prayers.navigation.backToCollections')}
          </Link>
          <Link className={styles.backLink} to={`/pray/${prayer.collectionSlug}`}>
            {tr('prayers.navigation.backToCollection', { collection: prayer.collection })}
          </Link>
          <button className={styles.shareBtn} type="button" onClick={copyLink}>
            {tr('prayers.detail.share')}
          </button>
          {copied ? (
            <span className={styles.copied} role="status">
              {tr('prayers.detail.linkCopied')}
            </span>
          ) : null}
          <FavoriteButton
            id={prayer.id}
            contentType={prayer.psalmNumber ? 'psalm' : 'prayer'}
            contentSlug={prayer.slug}
            collectionSlug={prayer.collectionSlug}
            title={prayer.transliterationTitle || prayer.title}
            route={prayerDetailPath(prayer.slug, prayer.collectionSlug)}
          />
        </nav>

        <header className={styles.header}>
          <div className={styles.badges}>
            <span>{prayer.collection}</span>
            {prayer.psalmNumber ? <span>{`Psalm ${prayer.psalmNumber}`}</span> : null}
            {!prayer.psalmNumber && prayer.chapter ? <span>{prayer.chapter}</span> : null}
          </div>
          <h1 className={styles.title} lang="am">
            {prayer.titles?.amharic || prayer.title}
          </h1>
          {prayer.titles?.english && prayer.titles.english !== prayer.title ? (
            <p className={styles.subtitle}>{prayer.titles.english}</p>
          ) : prayer.transliterationTitle && prayer.transliterationTitle !== prayer.title ? (
            <p className={styles.subtitle}>{prayer.transliterationTitle}</p>
          ) : null}
        </header>

        {summaries.length > 0 ? (
          <section className={styles.summary} aria-label={tr('prayers.detail.summaryAria')}>
            {summaries.map((summary) => (
              <div key={summary.label} className={styles.summaryBlock}>
                <h2>{summary.label}</h2>
                <p lang={summary.label === tr('prayers.languages.amharic') ? 'am' : undefined}>{summary.text}</p>
              </div>
            ))}
          </section>
        ) : null}

        {embedUrl || prayer.youtubeUrl ? (
          <section className={styles.video} aria-label={tr('prayers.detail.videoAria')}>
            <div className={styles.videoHead}>
              <h2>{tr('prayers.detail.watchListen')}</h2>
              {prayer.youtubeUrl ? (
                <a href={prayer.youtubeUrl} target="_blank" rel="noreferrer">
                  {tr('prayers.detail.watchListenOnYoutube')}
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

        <section className={styles.reader} aria-label={tr('prayers.detail.textAria')}>
          <PrayerReader text={prayer.text} titles={prayer.titles} showTitle />
        </section>

        {prayer.source.bookTitle || prayer.source.fullTextLink || prayer.source.audioUrl ? (
          <footer className={styles.source}>
            <h2>{tr('prayers.detail.sourceTitle')}</h2>
            {prayer.source.bookTitle ? <p>{prayer.source.bookTitle}</p> : null}
            <div className={styles.sourceLinks}>
              {prayer.source.fullTextLink ? (
                <a href={prayer.source.fullTextLink} target="_blank" rel="noreferrer">
                  {tr('prayers.detail.fullText')}
                </a>
              ) : null}
              {prayer.source.audioUrl ? (
                <a href={prayer.source.audioUrl} target="_blank" rel="noreferrer">
                  {tr('prayers.detail.audio')}
                </a>
              ) : null}
            </div>
          </footer>
        ) : null}
      </article>
    </PageSection>
  )
}
