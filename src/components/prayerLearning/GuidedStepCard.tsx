import type { GuideLangMode, LearningSection } from '../../lib/prayers/prayerLearning'
import { ContentRenderer } from './ContentRenderer'
import styles from './prayerLearning.module.css'

export function GuidedStepCard({
  section,
  index,
  total: _total,
  lang,
  learned,
  onToggleLearned,
  onBack,
  onNext,
  isLast,
}: {
  section: LearningSection
  index: number
  total: number
  lang: GuideLangMode
  learned: boolean
  onToggleLearned: () => void
  onBack: () => void
  onNext: () => void
  isLast: boolean
}) {
  void _total
  const summary =
    lang === 'en'
      ? section.summaryEnglish
      : lang === 'am'
        ? section.summaryAmharic || section.summaryEnglish
        : section.summaryAmharic || section.summaryEnglish

  return (
    <article
      className={styles.stepCard}
      id={section.sectionSlug}
      aria-labelledby={`${section.sectionSlug}-title`}
    >
      <header className={styles.stepCardHead}>
        <span className={styles.stepBadge} aria-hidden="true">
          {index + 1}
        </span>
        <div className={styles.stepCardTitles}>
          <h2 id={`${section.sectionSlug}-title`} className={styles.lessonTitle}>
            {section.titleEnglish}
          </h2>
          {section.titleAmharic ? (
            <p className={styles.lessonTitleAm} lang="am">
              {section.titleAmharic}
            </p>
          ) : null}
        </div>
      </header>

      {summary ? <p className={styles.lessonSummary}>{summary}</p> : null}

      <div className={styles.stepCardBody}>
        <ContentRenderer section={section} lang={lang} />
      </div>

      <nav className={styles.stepActions} aria-label="Step actions">
        <button type="button" className={styles.navPrev} onClick={onBack} disabled={index === 0}>
          Previous
        </button>
        <button
          type="button"
          className={learned ? styles.markOn : styles.markBtn}
          aria-pressed={learned}
          onClick={onToggleLearned}
        >
          {learned ? 'Practiced ✓' : 'Mark as practiced'}
        </button>
        <button type="button" className={styles.navNext} onClick={onNext}>
          {isLast ? 'Finish' : 'Next'}
        </button>
      </nav>
    </article>
  )
}
