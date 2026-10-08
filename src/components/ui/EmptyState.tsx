import type { ReactNode } from 'react'
import styles from './EmptyState.module.css'

type Props = {
  title: string
  children?: ReactNode
  /** Optional polite status region for screen readers */
  role?: 'status' | 'alert'
}

/**
 * Lightweight empty / not-found recovery block.
 * Prefer real recovery links as children (Calendar, libraries, etc.).
 */
export function EmptyState({ title, children, role = 'status' }: Props) {
  return (
    <div className={styles.root} role={role}>
      <h1 className={styles.title}>{title}</h1>
      {children ? <div className={styles.body}>{children}</div> : null}
    </div>
  )
}
