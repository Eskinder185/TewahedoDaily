import { LEARN_TOPIC_GROUPS, type GuideLangMode } from '../../lib/prayers/learnHowToPrayModel'
import type { PrayerGuideSection } from '../../lib/prayers/prayerGuides'
import styles from './prayerGuideUi.module.css'

export function PrayerGuideContents({
  guidedSteps,
  learnSections,
  lang,
  open,
  onClose,
  onNavigate,
  onOpen,
}: {
  guidedSteps: PrayerGuideSection[]
  learnSections: PrayerGuideSection[]
  lang: GuideLangMode
  open: boolean
  onClose: () => void
  onOpen: () => void
  onNavigate: (slug: string) => void
}) {
  const bySlug = new Map(learnSections.map((section) => [section.slug, section]))

  function labelFor(section: PrayerGuideSection) {
    if (lang === 'en') return section.title
    return section.titleAmharic || section.title
  }

  return (
    <>
      <button type="button" className={styles.contentsBtn} onClick={onOpen} aria-expanded={open}>
        <span aria-hidden="true">☰</span> Contents
      </button>

      <div
        className={styles.tocSheet}
        hidden={!open}
        role="dialog"
        aria-modal="true"
        aria-label="Contents"
      >
        <button type="button" className={styles.tocBackdrop} aria-label="Close contents" onClick={onClose} />
        <div className={styles.tocSheetPanel}>
          <div className={styles.tocSheetHead}>
            <h2>Contents</h2>
            <button type="button" className={styles.tocClose} onClick={onClose}>
              Close
            </button>
          </div>
          <nav className={styles.tocNav}>
            <p className={styles.tocGroup}>Guided Practice</p>
            <ol className={styles.tocList}>
              {guidedSteps.map((step, index) => (
                <li key={step.id}>
                  <button
                    type="button"
                    className={styles.tocLinkBtn}
                    onClick={() => {
                      onNavigate(step.slug)
                      onClose()
                    }}
                  >
                    {index + 1}. {labelFor(step)}
                  </button>
                </li>
              ))}
            </ol>
            <p className={styles.tocGroup}>Learn About Prayer</p>
            <ul className={styles.tocList}>
              {LEARN_TOPIC_GROUPS.map((group) => {
                const hasAny = group.slugs.some((slug) => bySlug.has(slug))
                if (!hasAny) return null
                return (
                  <li key={group.id}>
                    <button
                      type="button"
                      className={styles.tocLinkBtn}
                      onClick={() => {
                        const first = group.slugs.find((slug) => bySlug.has(slug))
                        if (first) onNavigate(first)
                        onClose()
                      }}
                    >
                      {group.label}
                    </button>
                  </li>
                )
              })}
            </ul>
          </nav>
        </div>
      </div>
    </>
  )
}
