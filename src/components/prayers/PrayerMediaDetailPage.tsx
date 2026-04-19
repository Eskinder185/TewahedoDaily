import type { ReactNode } from 'react'
import { Link } from 'react-router-dom'
import { PageSection } from '../ui/PageSection'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import type { PrayerMediaEntry } from '../../lib/prayers/mediaPrayerEntries'
import { PrayerMediaPlayer } from './PrayerMediaPlayer'
import styles from './PrayerMediaDetailPage.module.css'

type RelatedPrayerLink = {
  to: string
  title: string
  transliteration: string
}

type Props = {
  prayer: PrayerMediaEntry
  noteTitle?: string
  noteAmharic?: string
  noteEnglish?: string
  relatedPrayers?: RelatedPrayerLink[]
  afterMedia?: ReactNode
}

export function PrayerMediaDetailPage({
  prayer,
  noteTitle = 'Prayer note',
  noteAmharic = 'ይህ ገጽ ለተደጋጋሚ ማዳመጥ እና ለመለማመድ የተዘጋጀ ነው። ግጥሙ ሲዘጋጅ በዚህ ገጽ ላይ ይጨመራል።',
  noteEnglish = 'Keep this page nearby for repeated listening, slower review, and returning to key timestamps while learning the zema.',
  relatedPrayers = [],
  afterMedia,
}: Props) {
  const t = useUiLabel()

  return (
    <PageSection>
      <nav className={styles.nav} aria-label="Breadcrumb">
        <Link className={styles.crumb} to="/prayers">
          {t('navPrayers')}
        </Link>
        <span className={styles.crumbSep} aria-hidden>
          /
        </span>
        <span className={styles.crumbCurrent}>{prayer.title}</span>
      </nav>

      <section className={styles.headCard}>
        <div className={styles.headTitles}>
          <div>
            <p className={styles.pageEyebrow}>Prayer media</p>
            <span className={styles.badge}>{prayer.badge}</span>
            <h1 className={styles.pageTitle} lang="am">
              {prayer.title}
            </h1>
            <p className={styles.transliteration}>{prayer.transliteration}</p>
            <p className={styles.heroNote}>{prayer.noteEnglish}</p>
          </div>
          <div className={styles.headActions}>
            <a
              className={styles.youtubeLink}
              href={prayer.youtubeUrl}
              target="_blank"
              rel="noreferrer"
            >
              Open on YouTube
            </a>
          </div>
        </div>

        <div className={styles.sectionChips} aria-label="Prayer page sections">
          <a href="#prayer-media" className={styles.sectionChip}>
            Listen
          </a>
          <a href="#prayer-reading" className={styles.sectionChip}>
            Read
          </a>
          <a href="#prayer-notes" className={styles.sectionChip}>
            Notes
          </a>
          {relatedPrayers.length > 0 ? (
            <a href="#prayer-related" className={styles.sectionChip}>
              Related
            </a>
          ) : null}
        </div>

        <div className={styles.statusBlock}>
          <p className={styles.statusAm} lang="am">
            {prayer.noteAmharic}
          </p>
          <p className={styles.statusEn}>{prayer.noteEnglish}</p>
        </div>
      </section>

      <div className={styles.layout}>
        <div className={styles.mainColumn} id="prayer-media">
          <PrayerMediaPlayer
            title={prayer.title}
            youtubeId={prayer.youtubeId}
            marksStorageKey={prayer.marksStorageKey}
            settingsStorageKey={prayer.settingsStorageKey}
          />
        </div>

        <aside className={styles.sideColumn} id="prayer-notes">
          <section className={styles.sideCard}>
            <h2 className={styles.sideTitle}>{noteTitle}</h2>
            <p className={styles.sideBody} lang="am">
              {noteAmharic}
            </p>
            <p className={styles.sideBody}>{noteEnglish}</p>
          </section>

          <details className={styles.sideCard}>
            <summary className={styles.summaryToggle}>Lyrics placeholder</summary>
            <div className={styles.summaryBody}>
              <p className={styles.sideBody} lang="am">
                ግጥም በቅርብ ይጨመራል።
              </p>
              <p className={styles.sideBody}>
                Lyrics will be added soon. For now, this page includes the zema video only.
              </p>
            </div>
          </details>

          {relatedPrayers.length > 0 ? (
            <section className={styles.sideCard} id="prayer-related">
              <h2 className={styles.sideTitle}>Related prayers</h2>
              <div className={styles.relatedList}>
                {relatedPrayers.map((item) => (
                  <Link key={item.to} className={styles.relatedCard} to={item.to}>
                    <span className={styles.relatedTitle} lang="am">
                      {item.title}
                    </span>
                    <span className={styles.relatedSub}>{item.transliteration}</span>
                  </Link>
                ))}
              </div>
            </section>
          ) : null}
        </aside>
      </div>

      {afterMedia ? <div id="prayer-reading">{afterMedia}</div> : null}
    </PageSection>
  )
}
