import type { PrayerGuideSection } from '../../lib/prayers/prayerGuides'
import {
  extractQuotedFormula,
  parsePostureChecklist,
  parseSevenHoursFromText,
  type GuideLangMode,
} from '../../lib/prayers/learnHowToPrayModel'
import styles from './prayerGuideUi.module.css'

export function SectionVisualAids({
  section,
  lang,
  onOpenSlug,
}: {
  section: PrayerGuideSection
  lang: GuideLangMode
  onOpenSlug: (slug: string) => void
}) {
  if (section.slug === 'canonical-hours') {
    const hours = parseSevenHoursFromText(section.bodyEnglish)
    if (hours.length === 0) return null
    return (
      <ol className={styles.hoursTimeline} aria-label="Seven hours of prayer">
        {hours.map((hour, index) => (
          <li key={hour}>
            <span>{hour}</span>
            {index < hours.length - 1 ? (
              <span className={styles.hoursPipe} aria-hidden="true">
                │
              </span>
            ) : null}
          </li>
        ))}
      </ol>
    )
  }

  if (section.slug === 'kinds-of-prayer') {
    const cards = [
      { slug: 'private-prayer', title: 'Private', hint: 'Personal prayer offered alone' },
      { slug: 'family-prayer', title: 'Family', hint: 'Prayer offered together at home' },
      { slug: 'public-prayer', title: 'Public', hint: 'Prayer of the gathered Church' },
    ]
    return (
      <div className={styles.kindLinks}>
        {cards.map((card) => (
          <button
            key={card.slug}
            type="button"
            className={styles.kindLink}
            onClick={() => onOpenSlug(card.slug)}
          >
            <span className={styles.kindLinkTitle}>{card.title}</span>
            <span className={styles.kindLinkHint}>{card.hint}</span>
          </button>
        ))}
      </div>
    )
  }

  if (section.slug === 'prayer-posture') {
    const items = parsePostureChecklist(section.bodyEnglish)
    if (items.length === 0) return null
    return (
      <ul className={styles.postureList} aria-label="Practices during prayer">
        {items.map((item) => (
          <li key={item}>
            <span className={styles.postureCheck} aria-hidden="true">
              ○
            </span>
            <span lang="en">{item}</span>
          </li>
        ))}
      </ul>
    )
  }

  if (section.slug === 'sign-of-cross' && lang !== 'am') {
    const parts = extractQuotedFormula(section.bodyEnglish)
    if (!parts) return null
    return (
      <div className={styles.signCard}>
        <p className={styles.signLabel}>Spoken formula</p>
        <blockquote className={styles.signFormula} lang="en">
          {parts.formula}
        </blockquote>
      </div>
    )
  }

  return null
}
