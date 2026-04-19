import { useMemo } from 'react'
import { TabPanel } from '../ui/TabPanel'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { PrayerReadingText } from './PrayerReadingText'
import type { PrayerDocumentContent } from '../../lib/prayers/prayerDocumentContent'
import styles from './PrayerDocumentTabs.module.css'

type Props = {
  title: string
  content: PrayerDocumentContent
}

type LangKey = 'geez' | 'amharic' | 'english'

export function PrayerDocumentTabs({ title, content }: Props) {
  const t = useUiLabel()

  const tabs = useMemo(() => {
    const languages: { id: LangKey; label: string }[] = [
      { id: 'geez', label: t('prayerLangGeez') },
      { id: 'amharic', label: t('prayerLangAmharic') },
      { id: 'english', label: t('prayerLangEnglish') },
    ]

    return languages.map((lang) => ({
      id: lang.id,
      label: lang.label,
      content: (
        <div className={styles.sections}>
          {content.sections.map((section, index) => (
            <details
              key={section.id}
              className={styles.sectionCard}
              open={index === 0}
            >
              <summary className={styles.sectionSummary}>
                <div className={styles.sectionHead}>
                  <p className={styles.sectionEyebrow}>Section {index + 1}</p>
                  <h3 className={styles.sectionTitle}>{section.title}</h3>
                </div>
              </summary>
              <PrayerReadingText
                text={section.text[lang.id]}
                lang={lang.id}
                className={styles.reading}
                allowCollapse={false}
              />
            </details>
          ))}
        </div>
      ),
    }))
  }, [content.sections, t])

  return (
    <section className={styles.wrap} aria-labelledby="yekidane-text-title">
      <div className={styles.header}>
        <div>
          <p className={styles.eyebrow}>Prayer text</p>
          <h2 id="yekidane-text-title" className={styles.title}>
            {title}
          </h2>
          <p className={styles.summary} lang="am">
            {content.summary.amharic}
          </p>
          <p className={styles.summary}>{content.summary.english}</p>
        </div>
        <a
          className={styles.pdfLink}
          href={content.sourcePdfPath}
          target="_blank"
          rel="noreferrer"
        >
          View source PDF
        </a>
      </div>

      <TabPanel
        variant="compact"
        tablistAriaLabel={`${title} languages`}
        tabs={tabs}
        initialId="amharic"
      />
    </section>
  )
}
