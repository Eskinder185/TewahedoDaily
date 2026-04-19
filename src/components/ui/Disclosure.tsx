import type { ReactNode } from 'react'
import styles from './Disclosure.module.css'

type DisclosureProps = {
  summary: string
  children: ReactNode
  defaultOpen?: boolean
}

/**
 * Lightweight progressive disclosure without JS state (native details).
 */
export function Disclosure({
  summary,
  children,
  defaultOpen = false,
}: DisclosureProps) {
  return (
    <details className={styles.details} open={defaultOpen}>
      <summary className={styles.summary}>{summary}</summary>
      <div className={styles.body}>{children}</div>
    </details>
  )
}
