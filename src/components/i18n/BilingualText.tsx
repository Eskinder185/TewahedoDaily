import { bilingualLines, type BilingualStrings } from '../../lib/i18n/bilingualContent'
import type { AppLocale } from '../../lib/i18n/localeHelpers'
import { useLocale } from '../../lib/i18n/locale'
import styles from './BilingualText.module.css'

type Props = {
  english?: string | null
  amharic?: string | null
  /** Override global preference (tests / rare nests). */
  mode?: AppLocale
  className?: string
  /** Show language tags when stacking or when falling back. */
  showLabels?: boolean
  as?: 'p' | 'div' | 'span'
}

/**
 * Renders reviewed EN/AM content per global language preference.
 * Does not machine-translate; missing side is omitted or shown with a language tag.
 */
export function BilingualText({
  english,
  amharic,
  mode,
  className,
  showLabels,
  as: Tag = 'div',
}: Props) {
  const { contentLocale } = useLocale()
  const locale = mode ?? contentLocale
  const block: BilingualStrings = { english, amharic }
  const lines = bilingualLines(block, locale)
  if (!lines.length) return null

  const labelMode = showLabels ?? lines.some((l) => l.isFallback)

  if (lines.length === 1 && !labelMode) {
    const line = lines[0]
    return (
      <Tag className={`${styles.single} ${className || ''}`.trim()} lang={line.lang}>
        {line.text}
      </Tag>
    )
  }

  return (
    <Tag className={`${styles.stack} ${className || ''}`.trim()}>
      {lines.map((line) => (
        <p key={`${line.lang}:${line.text.slice(0, 24)}`} className={styles.line} lang={line.lang}>
          {labelMode ? (
            <span className={styles.langTag} aria-hidden>
              {line.label}
              {line.isFallback ? ' · available' : ''}
            </span>
          ) : null}
          <span className={styles.body}>{line.text}</span>
        </p>
      ))}
    </Tag>
  )
}
