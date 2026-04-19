import { Link } from 'react-router-dom'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { MOVEMENT_LEARNING_VIDEOS } from '../../lib/practice'
import { PracticeMediaCard } from './PracticeMediaCard'
import styles from './InstrumentsSection.module.css'

export function InstrumentsSection() {
  const t = useUiLabel()

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
                  externalHref={v.youtubeUrl}
                  tag={t('practiceMovementVideoTag')}
                  subtitle={t('practiceMovementVideoSubtitle')}
                  teaserLine={v.description}
                />
              </li>
            ))}
          </ul>
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
