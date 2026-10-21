import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import { parseScriptureReferences } from '../../lib/calendar/calendarCardCategories'
import {
  resolveScriptureCitation,
  type ScriptureCitation,
} from '../../lib/bible/scriptureCitation'
import { useLocale } from '../../lib/i18n/locale'
import styles from './ScriptureCitationList.module.css'

type Props = {
  raw: string
}

/**
 * Scripture lines from calendar content.
 * Links open a catalog-confirmed chapter or verse. Other lines stay text.
 */
export function ScriptureCitationList({ raw }: Props) {
  const t = useTranslation()
  const { uiLocale } = useLocale()
  const labels = parseScriptureReferences(raw)
  const [items, setItems] = useState<ScriptureCitation[]>(() =>
    labels.map((label) => ({ label, href: null })),
  )

  useEffect(() => {
    let active = true
    const nextLabels = parseScriptureReferences(raw)
    const language = uiLocale === 'am' ? 'am' : 'en'
    setItems(nextLabels.map((label) => ({ label, href: null })))
    void Promise.all(nextLabels.map((label) => resolveScriptureCitation(label, language))).then(
      (next) => {
        if (active) setItems(next.filter((item) => item.label))
      },
    )
    return () => {
      active = false
    }
  }, [raw, uiLocale])

  if (!labels.length) return null

  return (
    <div className={styles.root}>
      <p className={styles.note}>{t('calendar.page.scriptureNote')}</p>
      <ul className={styles.list}>
        {items.map((item) => (
          <li key={item.label}>
            {item.href ? (
              <Link to={item.href}>{item.label}</Link>
            ) : (
              <span>{item.label}</span>
            )}
          </li>
        ))}
      </ul>
    </div>
  )
}
