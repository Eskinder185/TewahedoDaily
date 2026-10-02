import { useMemo, useState } from 'react'
import type { LearningContentRow } from '../../lib/prayers/prayerLearning'
import styles from './prayerLearning.module.css'

export function PrayerBlock({ rows }: { rows: LearningContentRow[] }) {
  const [textScale, setTextScale] = useState(1)
  const [copied, setCopied] = useState(false)

  const copyText = useMemo(
    () =>
      rows
        .map((row) => row.body.trim())
        .filter(Boolean)
        .join('\n\n'),
    [rows],
  )

  async function handleCopy() {
    try {
      await navigator.clipboard.writeText(copyText)
      setCopied(true)
      window.setTimeout(() => setCopied(false), 1600)
    } catch {
      setCopied(false)
    }
  }

  return (
    <div className={styles.prayerBlock}>
      <p className={styles.prayerLabel}>Prayer</p>
      <div className={styles.prayerToolbar} role="toolbar" aria-label="Prayer text controls">
        <button type="button" className={styles.toolQuiet} onClick={handleCopy}>
          {copied ? 'Copied' : 'Copy'}
        </button>
        <button
          type="button"
          className={styles.toolQuiet}
          onClick={() => setTextScale((value) => Math.max(0.9, Number((value - 0.1).toFixed(1))))}
          aria-label="Decrease text size"
        >
          A−
        </button>
        <button
          type="button"
          className={styles.toolQuiet}
          onClick={() => setTextScale((value) => Math.min(1.35, Number((value + 0.1).toFixed(1))))}
          aria-label="Increase text size"
        >
          A+
        </button>
      </div>
      <div className={styles.prayerText} style={{ fontSize: `${textScale}em` }}>
        {rows.length === 0 ? (
          <p className={styles.missing}>Prayer text not available yet.</p>
        ) : (
          rows.map((row) => (
            <p
              key={row.contentId}
              className={row.language === 'am' ? styles.prayerAm : styles.prayerEn}
              lang={row.language}
            >
              {row.body.trim() || 'Translation not available yet.'}
            </p>
          ))
        )}
      </div>
    </div>
  )
}
