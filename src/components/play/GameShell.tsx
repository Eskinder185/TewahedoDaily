import type { ReactNode } from 'react'
import { Link } from 'react-router-dom'
import type { AppLocale } from '../../lib/i18n/locale'
import styles from './GameShell.module.css'

export function GameShell({ locale, title, subtitle, children }: { locale: AppLocale; title: string; subtitle: string; children: ReactNode }) {
  return (
    <div className={styles.page} lang={locale}>
      <header className={styles.header}>
        <Link to="/play" className={styles.back}>← {locale === 'am' ? 'ወደ ጨዋታ' : 'Tewahedo Play'}</Link>
        <p>{locale === 'am' ? 'በተገመገሙ ምንጮች የተዘጋጀ' : 'Built from reviewed sources'}</p>
        <h1>{title}</h1>
        <span>{subtitle}</span>
      </header>
      <main className={styles.stage}>{children}</main>
    </div>
  )
}

export function VerifiedFallback({ locale }: { locale: AppLocale }) {
  if (locale !== 'am') return null
  return <p className={styles.fallback} role="note">English verified content shown where an approved Amharic version is not yet available.</p>
}
