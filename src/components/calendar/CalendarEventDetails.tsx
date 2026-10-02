import { useId, useState } from 'react'
import {
  buildDetailSections,
  type CalendarLocaleMode,
  type DetailSection,
  type EnrichedContentFields,
} from '../../lib/calendar/calendarEnrichedContent'
import styles from './CalendarEventDetails.module.css'

type Props = {
  fields: EnrichedContentFields
  lang: CalendarLocaleMode
  /** When true, open the first section by default. */
  defaultOpenFirst?: boolean
  className?: string
}

function SectionBody({
  section,
  lang,
}: {
  section: DetailSection
  lang: CalendarLocaleMode
}) {
  if (lang === 'am') {
    const text = section.amharic || section.english
    return text ? (
      <p className={styles.body} lang={section.amharic ? 'am' : undefined}>
        {text}
      </p>
    ) : null
  }
  if (lang === 'both') {
    return (
      <div className={styles.bilingual}>
        {section.amharic ? (
          <p className={styles.bodyAm} lang="am">
            {section.amharic}
          </p>
        ) : null}
        {section.english ? <p className={styles.body}>{section.english}</p> : null}
      </div>
    )
  }
  const text = section.english || section.amharic
  return text ? (
    <p className={styles.body} lang={!section.english && section.amharic ? 'am' : undefined}>
      {text}
    </p>
  ) : null
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

export function CalendarLangToggle({
  value,
  onChange,
  className,
}: {
  value: CalendarLocaleMode
  onChange: (mode: CalendarLocaleMode) => void
  className?: string
}) {
  const modes: Array<{ id: CalendarLocaleMode; label: string }> = [
    { id: 'en', label: 'English' },
    { id: 'am', label: 'Amharic' },
    { id: 'both', label: 'Both' },
  ]
  return (
    <div className={`${styles.langToggle} ${className || ''}`.trim()} role="group" aria-label="Language">
      {modes.map((m) => (
        <button
          key={m.id}
          type="button"
          className={`${styles.langBtn} ${value === m.id ? styles.langBtnActive : ''}`}
          aria-pressed={value === m.id}
          onClick={() => onChange(m.id)}
        >
          {m.label}
        </button>
      ))}
    </div>
  )
}
