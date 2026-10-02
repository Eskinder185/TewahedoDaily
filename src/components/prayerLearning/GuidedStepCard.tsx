import type { GuideLangMode, LearningSection } from '../../lib/prayers/prayerLearning'
import { ContentRenderer } from './ContentRenderer'
import styles from './prayerLearning.module.css'

export function GuidedStepCard({
  section,
  index,
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
  const stepLabel = String(index + 1).padStart(2, '0')
  const summary =
    lang === 'en'
      ? section.summaryEnglish
      : lang === 'am'
        ? section.summaryAmharic || section.summaryEnglish
        : section.summaryAmharic || section.summaryEnglish

  return (
    <article className={styles.lesson} id={section.sectionSlug} aria-labelledby={`${section.sectionSlug}-title`}>
      <p className={styles.lessonNum} aria-hidden="true">
        {stepLabel}
      </p>
      <h2 id={`${section.sectionSlug}-title`} className={styles.lessonTitle}>
        {section.titleEnglish}
      </h2>
      {section.titleAmharic ? (
        <p className={styles.lessonTitleAm} lang="am">
          {section.titleAmharic}
        </p>
      ) : null}
      {summary ? <p className={styles.lessonSummary}>{summary}</p> : null}
      <div className={styles.lessonRule} aria-hidden="true" />

      <ContentRenderer section={section} lang={lang} />

      <div className={styles.lessonActions}>
        <button
          type="button"
          className={learned ? styles.markOn : styles.markBtn}
          aria-pressed={learned}
          onClick={onToggleLearned}
        >
          {learned ? 'Practiced' : 'Mark as practiced'}
        </button>
      </div>

      <nav className={styles.lessonNav} aria-label="Step navigation">
        <button type="button" className={styles.navPrev} onClick={onBack} disabled={index === 0}>
          Previous
        </button>
        <button type="button" className={styles.navNext} onClick={onNext}>
          {isLast ? 'Finish' : 'Next Step'}
        </button>
      </nav>
    </article>
  )
}
