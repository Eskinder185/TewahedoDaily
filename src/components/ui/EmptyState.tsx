import type { ElementType, ReactNode } from 'react'
import styles from './EmptyState.module.css'

type Props = {
  title: string
  children?: ReactNode
  /** Optional polite status region for screen readers */
  role?: 'status' | 'alert'
  /** Prefer h2 when the page already has an h1 (libraries, detail shells). */
  headingLevel?: 'h1' | 'h2'
}

/**
 * Lightweight empty / not-found recovery block.
 * Prefer real recovery links as children (Calendar, libraries, etc.).
 */
export function EmptyState({ title, children, role = 'status', headingLevel = 'h2' }: Props) {
  const Heading: ElementType = headingLevel
  return (
    <div className={styles.root} role={role}>
      <Heading className={styles.title}>{title}</Heading>
      {children ? <div className={styles.body}>{children}</div> : null}
    </div>
  )
}
