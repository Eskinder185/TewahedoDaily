import type { ReactNode } from 'react'
import styles from './Card.module.css'

type CardProps = {
  children: ReactNode
  className?: string
  as?: 'article' | 'div' | 'section'
  variant?: 'default' | 'quiet' | 'accent'
}

export function Card({
  children,
  className = '',
  as: Tag = 'div',
  variant = 'default',
}: CardProps) {
  return (
    <Tag
      className={`${styles.card} ${styles[variant]} ${className}`.trim()}
    >
      {children}
    </Tag>
  )
}
