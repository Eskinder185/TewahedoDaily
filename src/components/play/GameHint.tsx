import type { ReactNode } from 'react'
import type { AppLocale } from '../../lib/i18n/locale'
import styles from './PlayComponents.module.css'

export function GameHint({
  locale,
  revealed,
  onReveal,
  children,
}: {
  locale: AppLocale
  revealed: boolean
  onReveal: () => void
  children: ReactNode
}) {
  const am = locale === 'am'
  return (
    <div className={styles.gameHint}>
      <button type="button" className={styles.gameHintButton} aria-expanded={revealed} onClick={onReveal}>
        <span aria-hidden="true">✦</span>
        {revealed ? (am ? 'ፍንጩ ታይቷል' : 'Hint revealed') : (am ? 'ፍንጭ ይግለጡ' : 'Reveal a hint')}
      </button>
      {revealed ? <p className={styles.gameHintText} role="status">{children}</p> : null}
    </div>
  )
}
