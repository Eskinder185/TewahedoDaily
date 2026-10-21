import type { GenericTypedResponse } from '../../../lib/searchBuddy/apiTypes.ts'
import { useTranslation } from '../../../i18n'
import { textOrNull } from './resultHelpers.ts'
import styles from './ResultCard.module.css'

const LABEL_KEYS: Record<string, string> = {
  liturgy_search: 'searchBuddy.fallback.liturgy',
  teaching_search: 'searchBuddy.fallback.teaching',
  unknown: 'searchBuddy.fallback.result',
}

function collectSafeFields(
  data: GenericTypedResponse,
  yes: string,
  no: string,
): Array<{ label: string; value: string }> {
  const skip = new Set(['type', 'originalType', 'raw', 'results', 'message'])
  const rows: Array<{ label: string; value: string }> = []
  for (const [key, value] of Object.entries(data)) {
    if (skip.has(key)) continue
    if (typeof value === 'string' && value.trim()) {
      rows.push({ label: key.replace(/_/g, ' '), value: value.trim() })
    } else if (typeof value === 'number' && Number.isFinite(value)) {
      rows.push({ label: key.replace(/_/g, ' '), value: String(value) })
    } else if (typeof value === 'boolean') {
      rows.push({ label: key.replace(/_/g, ' '), value: value ? yes : no })
    }
    if (rows.length >= 8) break
  }
  return rows
}

export function GenericTypedResult({ data }: { data: GenericTypedResponse }) {
  const t = useTranslation()
  const type = String(data.originalType || data.type || 'unknown')
  const label = LABEL_KEYS[type] ? t(LABEL_KEYS[type]) : type.replace(/_/g, ' ')
  const message = textOrNull(data.message)
  const resultsCount = Array.isArray(data.results) ? data.results.length : null
  const fields = collectSafeFields(data, t('searchBuddy.fallback.yes'), t('searchBuddy.fallback.no'))
  const isDev = Boolean(import.meta.env.DEV)

  return (
    <article className={styles.card} aria-label={`${label} result`}>
      <p className={styles.eyebrow}>{label}</p>
      {message ? <p className={styles.preview}>{message}</p> : null}
      {fields.length ? (
        <div className={styles.factList}>
          {fields.map((row) => (
            <p key={row.label} className={styles.factRow}>
              <span className={styles.factLabel}>{row.label}</span>
              <span className={styles.factValue}>{row.value}</span>
            </p>
          ))}
        </div>
      ) : null}
      {resultsCount !== null ? (
        <p className={styles.meta}>
          {resultsCount === 0
            ? t('searchBuddy.fallback.noItems')
            : t(
                resultsCount === 1
                  ? 'searchBuddy.fallback.itemsOne'
                  : 'searchBuddy.fallback.itemsOther',
                { count: resultsCount },
              )}
        </p>
      ) : null}
      {!message && !fields.length && resultsCount === null ? (
        <p className={styles.preview}>
          {t('searchBuddy.fallback.safeStructured')}
        </p>
      ) : null}
      {isDev ? (
        <p className={styles.meta} aria-hidden="true">
          dev type: {type}
        </p>
      ) : null}
    </article>
  )
}
