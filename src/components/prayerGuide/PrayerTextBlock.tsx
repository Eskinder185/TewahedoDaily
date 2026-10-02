import { useMemo, useState } from 'react'
import type { GuideLangMode } from '../../lib/prayers/learnHowToPrayModel'
import styles from './prayerGuideUi.module.css'

export function PrayerTextBlock({
  amharic,
  english,
  lang,
}: {
  amharic: string
  english: string
  lang: GuideLangMode
}) {
  const [textScale, setTextScale] = useState(1)
  const [copied, setCopied] = useState(false)

  const displayAm = lang === 'am' || lang === 'both'
  const displayEn = lang === 'en' || lang === 'both'

  const copyText = useMemo(() => {
    const parts: string[] = []
    if (displayAm && amharic.trim()) parts.push(amharic.trim())
    if (displayEn && english.trim()) parts.push(english.trim())
    return parts.join('\n\n')
  }, [amharic, english, displayAm, displayEn])

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
        {displayAm ? (
          <p className={styles.prayerAm} lang="am">
            {amharic.trim() || 'Translation not available yet.'}
          </p>
        ) : null}
        {displayEn ? (
          <p className={styles.prayerEn} lang="en">
            {english.trim() || 'Translation not available yet.'}
          </p>
        ) : null}
      </div>
    </div>
  )
}
