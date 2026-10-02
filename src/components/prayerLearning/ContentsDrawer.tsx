import type { GuideLangMode, LearningCollection, LearningSection } from '../../lib/prayers/prayerLearning'
import { guidedSteps } from '../../lib/prayers/prayerLearning'
import styles from './prayerLearning.module.css'

export function ContentsDrawer({
  guided,
  learnCollections,
  lang,
  open,
  onOpen,
  onClose,
  onNavigate,
}: {
  guided: LearningCollection | null
  learnCollections: LearningCollection[]
  lang: GuideLangMode
  open: boolean
  onOpen: () => void
  onClose: () => void
  onNavigate: (slug: string) => void
}) {
  const steps = guidedSteps(guided)

  function label(section: LearningSection) {
    return lang === 'en' ? section.titleEnglish : section.titleAmharic || section.titleEnglish
  }

  function go(slug: string) {
    onNavigate(slug)
    onClose()
  }

  return (
    <>
      <button type="button" className={styles.contentsBtn} onClick={onOpen} aria-expanded={open}>
        Contents
      </button>

      <div className={styles.tocSheet} hidden={!open} role="dialog" aria-modal="true" aria-label="Contents">
        <button type="button" className={styles.tocBackdrop} aria-label="Close contents" onClick={onClose} />
        <div className={styles.tocPanel}>
          <div className={styles.tocHead}>
            <h2>Contents</h2>
            <button type="button" className={styles.tocClose} onClick={onClose}>
              Close
            </button>
          </div>
          <nav>
            {guided ? (
              <>
                <p className={styles.tocGroup}>Guided Practice</p>
                <ol className={styles.tocList}>
                  {steps.map((step, index) => (
                    <li key={step.sectionSlug}>
                      <button type="button" className={styles.tocLink} onClick={() => go(step.sectionSlug)}>
                        {index + 1}. {label(step)}
                      </button>
                    </li>
                  ))}
                </ol>
              </>
            ) : null}

            {learnCollections.map((collection) => (
              <div key={collection.collectionSlug}>
                <p className={styles.tocGroup}>{collection.titleEnglish}</p>
                <ul className={styles.tocList}>
                  {collection.sections
                    .filter((section) => section.showInContents || section.children.length > 0)
                    .map((section) => (
                      <li key={section.sectionSlug}>
                        <button type="button" className={styles.tocLink} onClick={() => go(section.sectionSlug)}>
                          {label(section)}
                        </button>
                        {section.children.length > 0 ? (
                          <ul className={styles.tocList}>
                            {section.children.map((child) => (
                              <li key={child.sectionSlug}>
                                <button
                                  type="button"
                                  className={styles.tocLink}
                                  style={{ paddingInlineStart: '0.85rem' }}
                                  onClick={() => go(child.sectionSlug)}
                                >
                                  {label(child)}
                                </button>
                              </li>
                            ))}
                          </ul>
                        ) : null}
                      </li>
                    ))}
                </ul>
              </div>
            ))}
          </nav>
        </div>
      </div>
    </>
  )
}
