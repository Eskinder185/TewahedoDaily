import { groupLearnSections, type GuideLangMode } from '../../lib/prayers/learnHowToPrayModel'
import type { PrayerGuideSection } from '../../lib/prayers/prayerGuides'
import { PrayerTopicAccordion } from './PrayerTopicAccordion'
import styles from './prayerGuideUi.module.css'

export function PrayerLearningSection({
  sections,
  lang,
  openSlug,
  onOpenSlug,
  onToggleSlug,
}: {
  sections: PrayerGuideSection[]
  lang: GuideLangMode
  openSlug: string | null
  onOpenSlug: (slug: string) => void
  onToggleSlug: (slug: string) => void
}) {
  const groups = groupLearnSections(sections)

  return (
    <section className={styles.learnSection} id="learn-about-prayer" aria-labelledby="learn-heading">
      <header className={styles.learnHeader}>
        <h2 id="learn-heading" className={styles.sectionHeading}>
          Learn More About Prayer
        </h2>
        <p className={styles.learnAmHeading} lang="am">
          የጸሎት ትምህርት
        </p>
        <p className={styles.learnDeck}>
          Explore foundations, ways of prayer, liturgy, and the prayers of the Church. Open a topic
          to read the full bilingual teaching.
        </p>
      </header>

      <div className={styles.learnGroups}>
        {groups.map((group) => (
          <section key={group.id} className={styles.topicGroup} aria-labelledby={`group-${group.id}`}>
            <h3 id={`group-${group.id}`} className={styles.groupLabel}>
              {group.label}
            </h3>
            <div className={styles.topicList}>
              {group.sections.map((section) => (
                <PrayerTopicAccordion
                  key={section.id}
                  section={section}
                  lang={lang}
                  open={openSlug === section.slug}
                  onToggle={() => onToggleSlug(section.slug)}
                  onOpenSlug={onOpenSlug}
                />
              ))}
            </div>
          </section>
        ))}
      </div>
    </section>
  )
}
