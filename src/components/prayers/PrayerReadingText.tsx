import { useId, useMemo, useState } from 'react'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import type { PrayerLang } from './prayerLang'
import styles from './PrayerReadingText.module.css'

const COLLAPSE_CHARS = 2600
const PREVIEW_CHARS = 1400

type Props = {
  text: string
  lang: PrayerLang
  className?: string
  allowCollapse?: boolean
}

/** Split a single line into optional verse marker + body (English digits or Ethiopic numerals). */
function splitVersePrefix(line: string, lang: PrayerLang): { mark: string; rest: string } | null {
  const t = line.trim()
  if (!t) return null
  if (lang === 'english') {
    const m = /^(\d{1,3})\s+(.*)$/.exec(t)
    if (m) return { mark: m[1], rest: m[2] }
    return { mark: '', rest: t }
  }
  const eth = /^([\u1369-\u137C]+[\.፤፡]?\s+)([\s\S]*)$/.exec(t)
  if (eth) {
    return { mark: eth[1].trim(), rest: eth[2] ?? '' }
  }
  return { mark: '', rest: t }
}

export function PrayerReadingText({
  text,
  lang,
  className = '',
  allowCollapse = true,
}: Props) {
  const t = useUiLabel()
  const bodyId = useId()
  const [open, setOpen] = useState(false)
  const long = allowCollapse && text.length > COLLAPSE_CHARS
  const display = useMemo(() => {
    if (!long || open) return text
    return text.slice(0, PREVIEW_CHARS).trimEnd() + '…'
  }, [long, open, text])

  const blocks = useMemo(() => {
    const raw = display.split(/\n\n+/)
    return raw.map((para) => {
      const lines = para.split('\n').filter((l) => l.trim().length > 0)
      return lines.map((line) => splitVersePrefix(line, lang))
    })
  }, [display, lang])

  return (
    <div className={`${styles.wrap} ${className}`.trim()}>
      <div
        className={styles.prose}
        id={bodyId}
        lang={lang === 'english' ? 'en' : 'am'}
      >
        {blocks.map((para, pi) => (
          <p key={pi} className={styles.para}>
            {para.map((row, ri) => {
              if (!row) return null
              const { mark, rest } = row
              return (
                <span key={ri} className={styles.line}>
                  {mark ? (
                    <>
                      <span className={styles.verseMark}>{mark}</span>
                      <span className={styles.verseRest}>{rest}</span>
                    </>
                  ) : (
                    <span className={styles.verseRest}>{rest}</span>
                  )}
                  {ri < para.length - 1 ? <br /> : null}
                </span>
              )
            })}
          </p>
        ))}
      </div>
      {long ? (
        <div className={styles.expandRow}>
          <button
            type="button"
            className={styles.expandBtn}
            onClick={() => setOpen((o) => !o)}
            aria-expanded={open}
            aria-controls={bodyId}
          >
            {open ? t('prayerShowLess') : t('prayerShowFull')}
          </button>
        </div>
      ) : null}
    </div>
  )
}
