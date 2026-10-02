import { useMemo, useState } from 'react'
import type { LearningContentRow } from '../../lib/prayers/prayerLearning'
import styles from './prayerLearning.module.css'

export function PrayerBlock({ rows }: { rows: LearningContentRow[] }) {
  const [textScale, setTextScale] = useState(1)
  const [copied, setCopied] = useState(false)

  const amharicRows = useMemo(
    () => rows.filter((row) => row.language === 'am' && row.body.trim()),
    [rows],
  )
  const englishRows = useMemo(
    () => rows.filter((row) => row.language === 'en' && row.body.trim()),
    [rows],
  )
  const otherRows = useMemo(
    () => rows.filter((row) => row.language !== 'am' && row.language !== 'en'),
    [rows],
  )

  const copyText = useMemo(
    () =>
      [...amharicRows, ...englishRows, ...otherRows]
        .map((row) => row.body.trim())
        .filter(Boolean)
        .join('\n\n'),
    [amharicRows, englishRows, otherRows],
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

  const hasContent = amharicRows.length + englishRows.length + otherRows.length > 0

  return (
    <div className={styles.prayerBlock}>
      <div className={styles.prayerBlockTop}>
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
      </div>

      <div className={styles.prayerText} style={{ fontSize: `${textScale}em` }}>
        {!hasContent ? (
          <p className={styles.missing}>Prayer text not available yet.</p>
        ) : (
          <>
            {amharicRows.length > 0 ? (
              <div className={styles.prayerSub}>
                {englishRows.length > 0 ? (
                  <p className={styles.prayerSubLabel} lang="am">
                    አማርኛ
                  </p>
                ) : null}
                {amharicRows.map((row) => (
                  <p key={row.contentId} className={styles.prayerAm} lang="am">
                    {row.body.trim()}
                  </p>
                ))}
              </div>
            ) : null}

            {englishRows.length > 0 ? (
              <div className={styles.prayerSub}>
                {amharicRows.length > 0 ? (
                  <p className={styles.prayerSubLabel}>English</p>
                ) : null}
                {englishRows.map((row) => (
                  <p key={row.contentId} className={styles.prayerEn} lang="en">
                    {row.body.trim()}
                  </p>
                ))}
              </div>
            ) : null}

            {otherRows.map((row) => (
              <p
                key={row.contentId}
                className={styles.prayerEn}
                lang={row.language}
              >
                {row.body.trim() || 'Translation not available yet.'}
              </p>
            ))}
          </>
        )}
      </div>
    </div>
  )
}
