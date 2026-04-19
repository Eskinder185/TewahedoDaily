import type { ReactNode } from 'react'
import styles from './SectionHeading.module.css'

type SectionHeadingProps = {
  title: string
  eyebrow?: string
  subtitle?: ReactNode
  align?: 'start' | 'center'
}

export function SectionHeading({
  title,
  eyebrow,
  subtitle,
  align = 'start',
}: SectionHeadingProps) {
  return (
    <header
      className={`${styles.wrap} ${align === 'center' ? styles.center : ''}`}
    >
      {eyebrow ? <p className={styles.eyebrow}>{eyebrow}</p> : null}
      <h2 className={styles.title}>{title}</h2>
      {subtitle ? <div className={styles.subtitle}>{subtitle}</div> : null}
    </header>
  )
}
