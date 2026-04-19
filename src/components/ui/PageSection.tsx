import type { ReactNode } from 'react'
import styles from './PageSection.module.css'

type PageSectionProps = {
  children: ReactNode
  id?: string
  variant?: 'default' | 'tint'
  className?: string
}

export function PageSection({
  children,
  id,
  variant = 'default',
  className = '',
}: PageSectionProps) {
  return (
    <section
      id={id}
      className={`${styles.section} ${variant === 'tint' ? styles.tint : ''} ${className}`.trim()}
    >
      <div className={styles.inner}>{children}</div>
    </section>
  )
}
