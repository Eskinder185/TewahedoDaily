import type { ReactNode } from 'react'
import { Link } from 'react-router-dom'
import type { AppLocale } from '../../lib/i18n/locale'
import { handlePlayImageError, type PlayArt } from '../../lib/play/imageCatalog'
import styles from './GameShell.module.css'

export function GameShell({ locale, title, subtitle, art, kicker, children }: { locale: AppLocale; title: string; subtitle: string; art?: PlayArt; kicker?: string; children: ReactNode }) {
  const am = locale === 'am'
  return (
    <div className={styles.page} lang={locale}>
      <header className={styles.header}>
        {art?.src ? <img className={styles.headerArt} src={art.src} alt="" onError={(event) => handlePlayImageError(event, art.fallbackSrc)} style={art.focus ? { objectPosition: art.focus } : undefined} /> : null}
        <div className={styles.headerInner}>
          <Link to="/play" className={styles.back}>
            <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" strokeWidth="2.2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true"><path d="M19 12H5M11 18l-6-6 6-6" /></svg>
            {am ? 'ሁሉም ጨዋታዎች' : 'All games'}
          </Link>
          <p>{kicker ?? (am ? 'በተጠቀሱ ምንጮች የተዘጋጀ' : 'Built from cited sources')}</p>
          <h1>{title}</h1>
          <span>{subtitle}</span>
        </div>
      </header>
      <div className={styles.stage}>{children}</div>
    </div>
  )
}

export function VerifiedFallback({ locale }: { locale: AppLocale }) {
  if (locale !== 'am') return null
  return <p className={styles.fallback} role="note">English content shown where an approved Amharic version is not yet available.</p>
}

/**
 * Generated learning content has passed automated checks (format, Bible grounding, duplicate removal) but not human
 * review, and its Amharic text is unreviewed. Said once, calmly, on the games that include it.
 */
export function GeneratedContentNotice({ locale, generated }: { locale: AppLocale; generated: number }) {
  if (generated <= 0) return null
  const am = locale === 'am'
  return (
    <p className={styles.reviewNotice} role="note" data-generated-notice>
      {am
        ? `በዚህ ጨዋታ ውስጥ ያሉ ${generated} ንጥሎች በራስ-ሰር የተፈጠሩ የመማሪያ ይዘቶች ናቸው። አውቶማቲክ ፍተሻዎችን አልፈዋል፤ የሰው ግምገማ ይጠብቃሉ። የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተ ክርስቲያን ይፋዊ አቋም አይደሉም።`
        : `${generated} items in this game are generated learning content. They passed automated checks and are awaiting human review. They are not an official statement of the Ethiopian Orthodox Tewahedo Church.`}
    </p>
  )
}

export function PublishedQuestionsStatus({
  locale,
  state,
  onRetry,
}: {
  locale: AppLocale
  state: 'loading' | 'error'
  onRetry?: () => void
}) {
  const am = locale === 'am'
  if (state === 'loading') {
    return <p className={styles.contentStatus} role="status">{am ? 'የታተመ ይዘት በመፈለግ ላይ…' : 'Checking for published questions…'}</p>
  }
  return (
    <div className={`${styles.contentStatus} ${styles.contentStatusError}`} role="alert">
      <span>{am ? 'የታተመ ተጨማሪ ይዘት ሊጫን አልቻለም። ያለው የተረጋገጠ ይዘት እንደተጠበቀ ነው።' : 'Published questions could not be loaded. Available verified content is still ready to play.'}</span>
      {onRetry ? <button type="button" onClick={onRetry}>{am ? 'እንደገና ይሞክሩ' : 'Try again'}</button> : null}
    </div>
  )
}
