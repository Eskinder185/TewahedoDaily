import { useState } from 'react'
import type { PrayerGuideSection } from '../../lib/prayers/prayerGuides'
import {
  rememberFromSection,
  resolveSectionKind,
  type GuideLangMode,
} from '../../lib/prayers/learnHowToPrayModel'
import { GuideBilingualBody } from './GuideBilingualBody'
import { PrayerTextBlock } from './PrayerTextBlock'
import styles from './prayerGuideUi.module.css'

export function PrayerStepCard({
  section,
  index,
  total,
  lang,
  learned,
  onToggleLearned,
  onBack,
  onNext,
  isLast,
}: {
  section: PrayerGuideSection
  index: number
  total: number
  lang: GuideLangMode
  learned: boolean
  onToggleLearned: () => void
  onBack: () => void
  onNext: () => void
  isLast: boolean
}) {
  const [practiceMode, setPracticeMode] = useState(false)
  const kind = resolveSectionKind(section)
  const remember = rememberFromSection(section)
  const stepLabel = String(index + 1).padStart(2, '0')

  return (
    <article className={styles.lesson} id={section.slug} aria-labelledby={`${section.slug}-title`}>
      <p className={styles.lessonEyebrow}>
        Step {index + 1} of {total}
      </p>
      <p className={styles.lessonNum} aria-hidden="true">
        {stepLabel}
      </p>
      <h2 id={`${section.slug}-title`} className={styles.lessonTitle}>
        {section.title}
      </h2>
      {section.titleAmharic ? (
        <p className={styles.lessonTitleAm} lang="am">
          {section.titleAmharic}
        </p>
      ) : null}

      <div className={styles.lessonRule} aria-hidden="true" />

      {!practiceMode ? (
        <>
          {kind === 'prayer' ? (
            <PrayerTextBlock amharic={section.bodyAmharic} english={section.bodyEnglish} lang={lang} />
          ) : (
            <GuideBilingualBody amharic={section.bodyAmharic} english={section.bodyEnglish} lang={lang} />
          )}
          {remember && kind !== 'prayer' ? (
            <aside className={styles.remember}>
              <h3>Remember</h3>
              <p lang="en">{remember}</p>
            </aside>
          ) : null}
        </>
      ) : (
        <div className={styles.practiceFocus}>
          {kind === 'prayer' ? (
            <PrayerTextBlock amharic={section.bodyAmharic} english={section.bodyEnglish} lang={lang} />
          ) : (
            <GuideBilingualBody amharic={section.bodyAmharic} english={section.bodyEnglish} lang={lang} />
          )}
        </div>
      )}

      <div className={styles.lessonActions}>
        {kind === 'prayer' || practiceMode ? (
          <button
            type="button"
            className={styles.actionQuiet}
            onClick={() => setPracticeMode((value) => !value)}
          >
            {practiceMode ? 'Show teaching' : 'Practice'}
          </button>
        ) : (
          <button type="button" className={styles.actionQuiet} onClick={() => setPracticeMode(true)}>
            Practice
          </button>
        )}
        <button
          type="button"
          className={learned ? styles.markOn : styles.markBtn}
          aria-pressed={learned}
          onClick={onToggleLearned}
        >
          {learned ? 'Practiced ✓' : 'Mark as practiced'}
        </button>
      </div>

      <nav className={styles.lessonNav} aria-label="Step navigation">
        <button type="button" className={styles.navPrev} onClick={onBack} disabled={index === 0}>
          ← Previous
        </button>
        <span className={styles.navMeta}>
          Step {index + 1} of {total}
        </span>
        <button type="button" className={styles.navNext} onClick={onNext}>
          {isLast ? 'Finish' : 'Next →'}
        </button>
      </nav>
    </article>
  )
}
