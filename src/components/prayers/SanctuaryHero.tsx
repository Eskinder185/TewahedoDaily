import type { ReactNode } from 'react'
import styles from './SanctuaryHero.module.css'

type Props = {
  eyebrow: string
  title: string
  children?: ReactNode
  className?: string
}

export function SanctuaryHero({ eyebrow, title, children, className = '' }: Props) {
  return (
    <header className={`${styles.hero} ${className}`.trim()}>
      <div className={styles.glow} aria-hidden />
      <div className={styles.inner}>
        <p className={styles.eyebrow}>{eyebrow}</p>
        <h1 className={styles.title}>{title}</h1>
        {children ? <div className={styles.deck}>{children}</div> : null}
      </div>
    </header>
  )
}
