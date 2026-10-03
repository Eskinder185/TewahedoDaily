import { useId, useState } from 'react'
import {
  buildDetailSections,
  type CalendarLocaleMode,
  type DetailSection,
  type EnrichedContentFields,
} from '../../lib/calendar/calendarEnrichedContent'
import { BilingualText } from '../i18n/BilingualText'
import styles from './CalendarEventDetails.module.css'

type Props = {
  fields: EnrichedContentFields
  lang?: CalendarLocaleMode
  /** When true, open the first section by default. */
  defaultOpenFirst?: boolean
  className?: string
}

function SectionBody({
  section,
  lang,
}: {
  section: DetailSection
  lang?: CalendarLocaleMode
}) {
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
  defaultOpenFirst = false,
  className,
}: Props) {
  const baseId = useId()
  const sections = buildDetailSections(fields)
  const [openId, setOpenId] = useState<string | null>(
    defaultOpenFirst && sections[0] ? sections[0].id : null,
  )

  if (sections.length === 0) return null

  return (
    <div className={`${styles.root} ${className || ''}`.trim()}>
      {sections.map((section) => {
        const panelId = `${baseId}-${section.id}`
        const open = openId === section.id
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
              <span className={styles.title}>{section.title}</span>
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
                <SectionBody section={section} lang={lang} />
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
