import { Link } from 'react-router-dom'
import { useMemo, useState } from 'react'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { MOVEMENT_LEARNING_VIDEOS } from '../../lib/practice'
import { parseYoutubeVideoId } from '../../data/utils/youtube'
import { PracticeMediaCard } from './PracticeMediaCard'
import styles from './InstrumentsSection.module.css'

export function InstrumentsSection() {
  const t = useUiLabel()
  const [selectedVideoId, setSelectedVideoId] = useState<string | null>(() =>
    MOVEMENT_LEARNING_VIDEOS[0]?.id ?? null,
  )

  const selectedVideo = useMemo(() => {
    if (!selectedVideoId) return null
    return MOVEMENT_LEARNING_VIDEOS.find((v) => v.id === selectedVideoId) ?? null
  }, [selectedVideoId])

  const selectedYoutubeId = useMemo(
    () => parseYoutubeVideoId(selectedVideo?.youtubeUrl),
    [selectedVideo],
  )

  const embedUrl = selectedYoutubeId
    ? `https://www.youtube-nocookie.com/embed/${selectedYoutubeId}?rel=0&modestbranding=1`
    : null

  return (
    <div className={styles.root}>
      <p className={styles.lead}>{t('practiceMovementLead')}</p>

      <section className={styles.track} aria-labelledby="movement-support-heading">
        <div className={styles.supportCluster}>
          <header className={styles.supportClusterHead}>
            <p id="movement-support-heading" className={styles.eyebrow}>
              {t('practiceMovementSupportEyebrow')}
            </p>
            <p className={styles.supportClusterDeck}>{t('practiceMovementSupportDeck')}</p>
          </header>
          <ul className={styles.videoGrid}>
            {MOVEMENT_LEARNING_VIDEOS.map((v) => (
              <li key={v.id}>
                <PracticeMediaCard
                  title={v.title}
                  imageUrl={v.thumbnailUrl}
                  onSelect={() => setSelectedVideoId(v.id)}
                  tag={t('practiceMovementVideoTag')}
                  subtitle={t('practiceMovementVideoSubtitle')}
                  teaserLine={v.description}
                />
              </li>
            ))}
          </ul>
          {selectedVideo ? (
            <section
              className={styles.playerSection}
              aria-labelledby="movement-player-heading"
            >
              <header className={styles.playerHead}>
                <p id="movement-player-heading" className={styles.playerEyebrow}>
                  {t('practiceMovementVideoTag')}
                </p>
                <h3 className={styles.playerTitle}>{selectedVideo.title}</h3>
                <p className={styles.playerDeck}>{selectedVideo.description}</p>
              </header>

              {embedUrl ? (
                <div className={styles.videoFrameWrap}>
                  <iframe
                    className={styles.videoFrame}
                    src={embedUrl}
                    title={selectedVideo.title}
                    loading="lazy"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    referrerPolicy="strict-origin-when-cross-origin"
                    allowFullScreen
                  />
                </div>
              ) : (
                <p className={styles.playerFallback}>
                  Video could not be embedded. Use the link below.
                </p>
              )}

              <a
                href={selectedVideo.youtubeUrl}
                target="_blank"
                rel="noopener noreferrer"
                className={styles.watchExternal}
              >
                {t('watch')} on YouTube
              </a>
            </section>
          ) : null}
        </div>
      </section>

      <div className={styles.tipRow}>
        <section
          className={styles.tipCard}
          aria-labelledby="mezmur-movement-tips-heading"
        >
          <h2 id="mezmur-movement-tips-heading" className={styles.tipTitle}>
            {t('practiceMovementMezmurTipsTitle')}
          </h2>
          <p className={styles.tipBody}>{t('practiceMovementMezmurTipsBody')}</p>
          <Link to="/practice#chants" className={styles.tipLink}>
            {t('practiceMovementOpenChants')} →
          </Link>
        </section>

        <section
          className={styles.tipCard}
          aria-labelledby="werb-movement-tips-heading"
        >
          <h2 id="werb-movement-tips-heading" className={styles.tipTitle}>
            {t('practiceMovementWerbTipsTitle')}
          </h2>
          <p className={styles.tipBody}>{t('practiceMovementWerbTipsBody')}</p>
          <Link to="/practice#chants" className={styles.tipLink}>
            {t('practiceMovementOpenChants')} →
          </Link>
        </section>
      </div>
    </div>
  )
}
