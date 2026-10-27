import { useId, useState } from 'react'
import { useTranslation } from '../../i18n'
import {
  buildDetailSections,
  type CalendarLocaleMode,
  type DetailSection,
  type EnrichedContentFields,
} from '../../lib/calendar/calendarEnrichedContent'
import { BilingualText } from '../i18n/BilingualText'
import { ScriptureCitationList } from './ScriptureCitationList'
import { CalendarRelatedMezmurs } from './CalendarRelatedMezmurs'
import { getMezmursForCalendarCardSlug } from '../../lib/recommendations/calendarMezmursData'
import styles from './CalendarEventDetails.module.css'

const SECTION_TITLE_KEYS: Record<string, string> = {
  what: 'calendar.page.whatIsThisHeading',
  history: 'calendar.page.historyHeading',
  why: 'calendar.page.whyHeading',
  theology: 'calendar.page.theologyHeading',
  traditions: 'calendar.page.traditionsHeading',
  important: 'calendar.page.importantHeading',
  fasting: 'calendar.page.fastingHeading',
  season: 'calendar.page.seasonHeading',
  scripture: 'calendar.page.scriptureHeading',
  mezmurs: 'calendar.page.mezmursHeading',
  prayers: 'calendar.page.prayersHeading',
  sources: 'calendar.page.sourcesHeading',
}

type Props = {
  fields: EnrichedContentFields
  lang?: CalendarLocaleMode
  /** Card slug to look up verified related Mezmurs */
  cardSlug?: string
  /** When true, open the first section by default. */
  defaultOpenFirst?: boolean
  className?: string
}

function SectionBody({
  section,
  cardSlug,
  lang,
}: {
  section: DetailSection
  cardSlug?: string
  lang?: CalendarLocaleMode
}) {
  if (section.id === 'scripture') {
    return <ScriptureCitationList raw={section.english || section.amharic} />
  }
  if (section.id === 'mezmurs') {
    return (
      <CalendarRelatedMezmurs
        cardSlug={cardSlug}
        fallbackRaw={section.english || section.amharic}
        lang={lang}
      />
    )
  }
  return (
    <BilingualText
      english={section.english}
      amharic={section.amharic}
      mode={lang}
      className={styles.body}
      showLabels
    />
  )
}

export function CalendarEventDetails({
  fields,
  lang,
  cardSlug,
  defaultOpenFirst = false,
  className,
}: Props) {
  const t = useTranslation()
  const baseId = useId()
  const baseSections = buildDetailSections(fields)
  const sections = [...baseSections]

  // Add Mezmurs section if card has verified hymns but enriched content lacked explicit text
  if (
    cardSlug &&
    !sections.some((s) => s.id === 'mezmurs') &&
    getMezmursForCalendarCardSlug(cardSlug).length > 0
  ) {
    sections.push({
      id: 'mezmurs',
      title: 'Recommended Mezmurs',
      english: '',
      amharic: '',
    })
  }

  const [openId, setOpenId] = useState<string | null>(
    defaultOpenFirst && sections[0] ? sections[0].id : null,
  )

  if (sections.length === 0) return null

  return (
    <div className={`${styles.root} ${className || ''}`.trim()}>
      {sections.map((section) => {
        const panelId = `${baseId}-${section.id}`
        const open = openId === section.id
        const titleKey = SECTION_TITLE_KEYS[section.id]
        const title = titleKey ? t(titleKey) : section.title
        return (
          <div key={section.id} className={`${styles.item} ${open ? styles.itemOpen : ''}`}>
            <button
              type="button"
              className={styles.head}
              aria-expanded={open}
              aria-controls={panelId}
              id={`${panelId}-btn`}
              onClick={() => setOpenId(open ? null : section.id)}
            >
              <span className={styles.title}>{title}</span>
              <span className={styles.chevron} aria-hidden>
                {open ? '−' : '+'}
              </span>
            </button>
            {open ? (
              <div
                id={panelId}
                role="region"
                aria-labelledby={`${panelId}-btn`}
                className={styles.panel}
              >
                <SectionBody section={section} cardSlug={cardSlug} lang={lang} />
              </div>
            ) : null}
          </div>
        )
      })}
    </div>
  )
}

/** @deprecated Use global LanguageToggle in the site header / menu. */
export function CalendarLangToggle(_unused?: {
  value?: CalendarLocaleMode
  onChange?: (mode: CalendarLocaleMode) => void
  className?: string
}) {
  void _unused
  return null
}
