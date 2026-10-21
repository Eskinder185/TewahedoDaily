import { useMemo } from 'react'
import { TabPanel } from '../ui/TabPanel'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { PrayerReadingText } from './PrayerReadingText'
import type { PrayerLang } from './prayerLang'
import { PRAYER_LANGS } from './prayerLang'
import { hasPrayerText } from '../../lib/prayers/prayerLanguage'
import { useReaderLanguage } from '../../lib/prayers/useReaderLanguage'
import type { PrayerDocumentContent } from '../../lib/prayers/prayerDocumentContent'
import styles from './PrayerDocumentTabs.module.css'

type Props = {
  title: string
  content: PrayerDocumentContent
}

const LANG_LABEL_KEYS: Record<PrayerLang, 'prayerLangAmharic' | 'prayerLangGeez' | 'prayerLangEnglish'> = {
  amharic: 'prayerLangAmharic',
  geez: 'prayerLangGeez',
  english: 'prayerLangEnglish',
}

function fill(template: string, values: Record<string, string | number>) {
  return template.replace(/\{(\w+)\}/g, (match, key: string) =>
    values[key] == null ? match : String(values[key]),
  )
}

export function PrayerDocumentTabs({ title, content }: Props) {
  const t = useUiLabel()
  const aggregate = useMemo(
    () => ({
      geez: content.sections.map((section) => section.text.geez).join('\n'),
      amharic: content.sections.map((section) => section.text.amharic).join('\n'),
      english: content.sections.map((section) => section.text.english).join('\n'),
    }),
    [content.sections],
  )
  const { readerLanguage, setReaderLanguage } = useReaderLanguage(aggregate)

  const tabs = useMemo(() => {
    return PRAYER_LANGS.map((lang) => {
      const anyText = content.sections.some((section) => hasPrayerText(section.text[lang]))
      const label = anyText
        ? t(LANG_LABEL_KEYS[lang])
        : `${t(LANG_LABEL_KEYS[lang])} — ${t('prayerLangUnavailableShort')}`
      return {
        id: lang,
        label,
        content: (
          <div className={styles.sections}>
            {content.sections.map((section, index) => {
              const body = section.text[lang]
              const available = hasPrayerText(body)
              return (
                <details key={section.id} className={styles.sectionCard} open={index === 0}>
                  <summary className={styles.sectionSummary}>
                    <div className={styles.sectionHead}>
                      <p className={styles.sectionEyebrow}>
                        {fill(t('prayerDocumentSection'), { number: index + 1 })}
                      </p>
                      <h3 className={styles.sectionTitle}>{section.title}</h3>
                    </div>
                  </summary>
                  {available ? (
                    <PrayerReadingText
                      text={body}
                      lang={lang}
                      className={styles.reading}
                      allowCollapse={false}
                    />
                  ) : (
                    <p className={styles.unavailable} role="status">
                      {lang === 'geez'
                        ? t('prayerGeezUnavailable')
                        : t('prayerTranslationUnavailable')}
                    </p>
                  )}
                </details>
              )
            })}
          </div>
        ),
      }
    })
  }, [content.sections, t])

  return (
    <section className={styles.wrap} aria-labelledby="yekidane-text-title">
      <div className={styles.header}>
        <div>
          <p className={styles.eyebrow}>{t('prayerDocumentEyebrow')}</p>
          <h2 id="yekidane-text-title" className={styles.title}>
            {title}
          </h2>
          {content.summary.amharic.trim() ? (
            <p className={styles.summary} lang="am">
              {content.summary.amharic}
            </p>
          ) : null}
          {content.summary.english.trim() ? (
            <p className={styles.summary} lang="en">
              {content.summary.english}
            </p>
          ) : null}
        </div>
        <a className={styles.pdfLink} href={content.sourcePdfPath} target="_blank" rel="noreferrer">
          {t('prayerDocumentPdf')}
        </a>
      </div>

      <TabPanel
        variant="compact"
        compactWrap
        tablistAriaLabel={fill(t('prayerDocumentTabsAria'), { title })}
        tabs={tabs}
        initialId={readerLanguage}
        selectedId={readerLanguage}
        onSelectedIdChange={(id) => {
          if (id === 'amharic' || id === 'geez' || id === 'english') setReaderLanguage(id)
        }}
      />
    </section>
  )
}
