import type { GuideLangMode, LearningCollection, LearningSection } from '../../lib/prayers/prayerLearning'
import { ContentRenderer } from './ContentRenderer'
import styles from './prayerLearning.module.css'

export function CollectionSection({
  collection,
  lang,
  openSlug,
  onToggle,
  onOpenSlug,
  nextBySlug,
}: {
  collection: LearningCollection
  lang: GuideLangMode
  openSlug: string | null
  onToggle: (slug: string) => void
  onOpenSlug: (slug: string) => void
  nextBySlug?: Map<string, LearningSection>
}) {
  return (
    <section className={styles.collection} id={`collection-${collection.collectionSlug}`}>
      <h3 className={styles.collectionTitle}>{collection.titleEnglish}</h3>
      {collection.descriptionEnglish ? (
        <p className={styles.collectionDesc}>{collection.descriptionEnglish}</p>
      ) : null}

      <div className={styles.sectionList}>
        {collection.sections.map((section) => (
          <SectionAccordion
            key={section.sectionSlug}
            section={section}
            lang={lang}
            open={openSlug === section.sectionSlug}
            onToggle={() => onToggle(section.sectionSlug)}
            onOpenSlug={onOpenSlug}
            nextSection={nextBySlug?.get(section.sectionSlug) || null}
          />
        ))}
      </div>
    </section>
  )
}

function SectionAccordion({
  section,
  lang,
  open,
  onToggle,
  onOpenSlug,
  nextSection,
}: {
  section: LearningSection
  lang: GuideLangMode
  open: boolean
  onToggle: () => void
  onOpenSlug: (slug: string) => void
  nextSection: LearningSection | null
}) {
  const panelId = `${section.sectionSlug}-panel`
  const buttonId = `${section.sectionSlug}-trigger`
  const summary =
    lang === 'en' ? section.summaryEnglish : section.summaryAmharic || section.summaryEnglish
  const isGroup = section.displayStyle === 'group_overview'

  return (
    <article className={open ? styles.sectionRowOpen : styles.sectionRow} id={section.sectionSlug}>
      <h4 className={styles.sectionNameWrap}>
        <button
          type="button"
          id={buttonId}
          className={styles.sectionTrigger}
          aria-expanded={open}
          aria-controls={panelId}
          onClick={onToggle}
        >
          <span className={styles.sectionHead}>
            <span className={styles.sectionName}>{section.titleEnglish}</span>
            {section.titleAmharic ? (
              <span className={styles.sectionAm} lang="am">
                {section.titleAmharic}
              </span>
            ) : null}
            {!open && summary ? <span className={styles.sectionSummary}>{summary}</span> : null}
          </span>
          <span className={styles.sectionChevron} aria-hidden="true">
            {open ? '▼' : '→'}
          </span>
        </button>
      </h4>
      <div id={panelId} role="region" aria-labelledby={buttonId} hidden={!open} className={styles.sectionPanel}>
        {summary && open ? <p className={styles.sectionSummaryOpen}>{summary}</p> : null}

        {isGroup && section.children.length > 0 ? (
          <ul className={styles.childList}>
            {section.children.map((child) => (
              <li key={child.sectionSlug}>
                <button type="button" className={styles.childLink} onClick={() => onOpenSlug(child.sectionSlug)}>
                  <span>{child.titleEnglish}</span>
                  {child.titleAmharic ? (
                    <span className={styles.childAm} lang="am">
                      {child.titleAmharic}
                    </span>
                  ) : null}
                </button>
              </li>
            ))}
          </ul>
        ) : null}

        <ContentRenderer section={section} lang={lang} />

        {isGroup
          ? section.children.map((child) => (
              <div key={`body-${child.sectionSlug}`} id={child.sectionSlug} className={styles.childBody}>
                <h5 className={styles.childTitle}>{child.titleEnglish}</h5>
                {child.titleAmharic ? (
                  <p className={styles.sectionAm} lang="am">
                    {child.titleAmharic}
                  </p>
                ) : null}
                <ContentRenderer section={child} lang={lang} />
              </div>
            ))
          : null}

        {nextSection ? (
          <p className={styles.continueLearning}>
            <span className={styles.continueLabel}>Continue Learning</span>
            <button type="button" className={styles.continueLink} onClick={() => onOpenSlug(nextSection.sectionSlug)}>
              Next: {nextSection.titleEnglish} →
            </button>
          </p>
        ) : null}
      </div>
    </article>
  )
}
