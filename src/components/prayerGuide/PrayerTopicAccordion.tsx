import type { PrayerGuideSection } from '../../lib/prayers/prayerGuides'
import type { GuideLangMode } from '../../lib/prayers/learnHowToPrayModel'
import { GuideBilingualBody } from './GuideBilingualBody'
import { SectionVisualAids } from './SectionVisualAids'
import styles from './prayerGuideUi.module.css'

export function PrayerTopicAccordion({
  section,
  lang,
  open,
  onToggle,
  onOpenSlug,
}: {
  section: PrayerGuideSection
  lang: GuideLangMode
  open: boolean
  onToggle: () => void
  onOpenSlug: (slug: string) => void
}) {
  const panelId = `${section.slug}-panel`
  const buttonId = `${section.slug}-trigger`
  const title = lang === 'en' ? section.title : section.titleAmharic || section.title
  const subtitle = lang === 'en' ? section.titleAmharic : section.titleAmharic ? section.title : ''

  return (
    <article className={open ? styles.topicRowOpen : styles.topicRow} id={section.slug}>
      <h3 className={styles.topicTitle}>
        <button
          type="button"
          id={buttonId}
          className={styles.topicTrigger}
          aria-expanded={open}
          aria-controls={panelId}
          onClick={onToggle}
        >
          <span className={styles.topicHead}>
            <span className={styles.topicName}>{title}</span>
            {subtitle ? (
              <span className={styles.topicAm} lang={lang === 'en' ? 'am' : 'en'}>
                {subtitle}
              </span>
            ) : null}
          </span>
          <span className={styles.topicChevron} aria-hidden="true">
            {open ? '−' : '→'}
          </span>
        </button>
      </h3>
      <div
        id={panelId}
        role="region"
        aria-labelledby={buttonId}
        hidden={!open}
        className={styles.topicPanel}
      >
        <SectionVisualAids section={section} lang={lang} onOpenSlug={onOpenSlug} />
        <GuideBilingualBody amharic={section.bodyAmharic} english={section.bodyEnglish} lang={lang} />
      </div>
    </article>
  )
}
