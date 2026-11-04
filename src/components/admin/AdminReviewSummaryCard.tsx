import { useCallback } from 'react'
import { Link } from 'react-router-dom'
import { getReviewSummary } from '../../lib/cms/adminContentReviewService'
import { useAsync } from '../../lib/cms/useAsync'
import styles from './AdminReviewSummaryCard.module.css'

/** Counts are read from current RLS-visible rows. There is no fabricated sample queue. */
export function AdminReviewSummaryCard() {
  const result = useAsync(useCallback(() => getReviewSummary(), []))
  if (result.loading && !result.data) return <div className={styles.card} role="status">Loading editorial review summary…</div>
  if (result.error || !result.data) return <div className={styles.card} role="alert">Editorial review counts are unavailable. <button type="button" onClick={result.reload}>Retry</button></div>
  const summary = result.data
  const totalItems = summary.mezmursTotal + summary.calendarTotal
  const reviewed = summary.mezmursReviewed + summary.calendarReviewed
  return <section className={styles.card} aria-label="Editorial content review tracker">
    <div className={styles.header}><div className={styles.titleGroup}><h2 className={styles.title}>Editorial content review tracker</h2><p className={styles.subtitle}>Counts from accessible Mezmur, calendar, and review records.</p></div><button type="button" className={styles.shortcutLink} onClick={result.reload}>Refresh</button></div>
    <div className={styles.progressContainer}><div className={styles.progressMeta}><span>Estimated review progress</span><strong>{reviewed} of {totalItems} tagged reviewed ({summary.overallProgressPct}%)</strong></div><div className={styles.progressBarTrack}><div className={styles.progressBarFill} style={{ width: `${summary.overallProgressPct}%` }} /></div></div>
    <div className={styles.statsGrid}>
      <div className={styles.statItem}><strong className={styles.statNumber}>{summary.mezmursTotal}</strong><span className={styles.statLabel}>Visible Mezmurs</span></div>
      <div className={styles.statItem}><strong className={styles.statNumber}>{summary.mezmursReviewed}</strong><span className={styles.statLabel}>Mezmurs reviewed</span></div>
      <div className={styles.statItem}><strong className={styles.statNumber}>{summary.mezmursNeedsReview}</strong><span className={styles.statLabel}>Mezmurs needing review (est.)</span></div>
      <div className={styles.statItem}><strong className={styles.statNumber}>{summary.calendarTotal}</strong><span className={styles.statLabel}>Calendar cards</span></div>
      <div className={styles.statItem}><strong className={styles.statNumber}>{summary.calendarReviewed}</strong><span className={styles.statLabel}>Cards reviewed</span></div>
      <div className={styles.statItem}><strong className={styles.statNumber}>{summary.calendarNeedsReview}</strong><span className={styles.statLabel}>Cards needing review (est.)</span></div>
    </div>
    <p className={styles.subtitle}>Review tags may include records that are no longer visible. Confirm exact work in each review queue.</p>
    <div className={styles.shortcutsRow}><Link to="/admin/hymns/mezmur?review=needs_review" className={styles.shortcutLink}>Review Mezmurs</Link><Link to="/admin/calendar/cards?review=needs_review" className={styles.shortcutLink}>Review calendar cards</Link><Link to="/admin/calendar/mezmurs" className={styles.shortcutLink}>Calendar–hymn links</Link></div>
  </section>
}
