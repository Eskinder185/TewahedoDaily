/**
 * TEWAHEDODAILY — THREE-WAY LYRICS DISPLAY
 *
 * Implements Original Ethiopic, Latin Transliteration, and Paired Side-by-Side lyrics presentation.
 * On mobile viewports, side-by-side seamlessly stacks into paired line blocks.
 */

import { useState, useMemo } from 'react'
import {
  parseStructuredLyrics,
  type ParsedHymnLyrics,
} from '../../lib/mezmur/structuredLyricsParser'
import { useLocale } from '../../lib/i18n/locale'
import styles from './ThreeWayLyricsDisplay.module.css'

export type DisplayMode = 'original' | 'latin' | 'side-by-side'
export type LyricsTheme = 'parchment' | 'ivory' | 'gold' | 'dark'

interface Props {
  originalLyrics: string | null | undefined
  transliterationLyrics?: string | null | undefined
  englishLyrics?: string | null | undefined
  hymnTitle: string
  singerName?: string | null
}

const UI_TEXT = {
  en: {
    original: 'Original (ግዕዝ/አማርኛ)',
    latin: 'Latin Transliteration',
    sideBySide: 'Side by Side (ሁለቱም)',
    noTranslit: 'Latin transliteration has not been transcribed yet for this hymn.',
    copy: 'Copy Lyrics',
    copied: 'Copied!',
    fontSize: 'Font size',
    theme: 'Theme',
    parchment: 'Parchment',
    ivory: 'Ivory',
    gold: 'Gold',
    dark: 'Dark',
  },
  am: {
    original: 'የመጀመሪያው (ግዕዝ/አማርኛ)',
    latin: 'በላቲን ፊደል',
    sideBySide: 'ጎን ለጎን (ሁለቱም)',
    noTranslit: 'የዚህ መዝሙር የላቲን ንባብ ገና አልተዘጋጀም።',
    copy: 'ግጥሙን ቅዳ',
    copied: 'ተቀድቷል!',
    fontSize: 'የፊደል መጠን',
    theme: 'ገጽታ',
    parchment: 'ብራና',
    ivory: 'ነጭ',
    gold: 'ወርቃማ',
    dark: 'ጨለማ',
  },
}

export function ThreeWayLyricsDisplay({
  originalLyrics,
  transliterationLyrics,
  englishLyrics,
  hymnTitle,
  singerName,
}: Props) {
  const { uiLocale } = useLocale()
  const t = UI_TEXT[uiLocale]

  const parsed: ParsedHymnLyrics = useMemo(
    () => parseStructuredLyrics(originalLyrics, transliterationLyrics, englishLyrics),
    [originalLyrics, transliterationLyrics, englishLyrics]
  )

  const [mode, setMode] = useState<DisplayMode>(() =>
    parsed.hasTransliteration ? 'side-by-side' : 'original'
  )
  const [theme, setTheme] = useState<LyricsTheme>('parchment')
  const [fontScale, setFontScale] = useState<number>(1)
  const [copied, setCopied] = useState(false)

  const handleCopy = async () => {
    let copyText = `${hymnTitle}\n`
    if (singerName) copyText += `${singerName}\n`
    copyText += `TewahedoDaily Hymn Library\n\n`

    parsed.sections.forEach((sec) => {
      copyText += `[${sec.label}]\n`
      sec.lines.forEach((line) => {
        if (mode === 'latin' && line.cleanTransliteration) {
          copyText += `${line.cleanTransliteration}${line.repetitionCount > 1 ? ` (${line.repetitionCount}×)` : ''}\n`
        } else if (mode === 'side-by-side' && line.cleanTransliteration) {
          copyText += `${line.cleanOriginal}\n${line.cleanTransliteration}\n`
        } else {
          copyText += `${line.cleanOriginal}${line.repetitionCount > 1 ? ` (${line.repetitionCount}×)` : ''}\n`
        }
      })
      copyText += '\n'
    })

    try {
      await navigator.clipboard.writeText(copyText.trim())
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch {}
  }

  const themeClass =
    theme === 'ivory'
      ? styles.themeIvory
      : theme === 'gold'
      ? styles.themeGold
      : theme === 'dark'
      ? styles.themeDark
      : styles.themeParchment

  return (
    <div className={`${styles.wrapper} ${themeClass}`}>
      {/* Top Toolbar */}
      <div className={styles.toolbar}>
        <div className={styles.modeSwitch} role="tablist" aria-label="Lyrics viewing modes">
          <button
            type="button"
            role="tab"
            aria-selected={mode === 'original'}
            className={`${styles.modeBtn} ${mode === 'original' ? styles.modeBtnActive : ''}`}
            onClick={() => setMode('original')}
          >
            {t.original}
          </button>
          <button
            type="button"
            role="tab"
            aria-selected={mode === 'latin'}
            className={`${styles.modeBtn} ${mode === 'latin' ? styles.modeBtnActive : ''}`}
            onClick={() => setMode('latin')}
            disabled={!parsed.hasTransliteration}
            title={!parsed.hasTransliteration ? t.noTranslit : undefined}
          >
            {t.latin}
          </button>
          <button
            type="button"
            role="tab"
            aria-selected={mode === 'side-by-side'}
            className={`${styles.modeBtn} ${mode === 'side-by-side' ? styles.modeBtnActive : ''}`}
            onClick={() => setMode('side-by-side')}
            disabled={!parsed.hasTransliteration}
            title={!parsed.hasTransliteration ? t.noTranslit : undefined}
          >
            {t.sideBySide}
          </button>
        </div>

        <div className={styles.actions}>
          {/* Font Controls */}
          <div className={styles.fontSizeControls} aria-label={t.fontSize}>
            <button
              type="button"
              className={styles.fontBtn}
              onClick={() => setFontScale((s) => Math.max(0.85, s - 0.1))}
              aria-label="Decrease font size"
            >
              A−
            </button>
            <button
              type="button"
              className={styles.fontBtn}
              onClick={() => setFontScale(1)}
              aria-label="Reset font size"
            >
              A
            </button>
            <button
              type="button"
              className={styles.fontBtn}
              onClick={() => setFontScale((s) => Math.min(1.4, s + 0.1))}
              aria-label="Increase font size"
            >
              A+
            </button>
          </div>

          {/* Theme Selector */}
          <select
            value={theme}
            onChange={(e) => setTheme(e.target.value as LyricsTheme)}
            className={styles.actionBtn}
            aria-label={t.theme}
          >
            <option value="parchment">{t.parchment}</option>
            <option value="ivory">{t.ivory}</option>
            <option value="gold">{t.gold}</option>
            <option value="dark">{t.dark}</option>
          </select>

          {/* Copy Button */}
          <button type="button" className={styles.actionBtn} onClick={handleCopy}>
            {copied ? `✓ ${t.copied}` : `📋 ${t.copy}`}
          </button>
        </div>
      </div>

      {/* Notice if Latin mode requested but unavailable */}
      {!parsed.hasTransliteration && (mode === 'latin' || mode === 'side-by-side') && (
        <div className={styles.noTranslitNotice} role="alert">
          {t.noTranslit}
        </div>
      )}

      {/* Lyrics Stanzas */}
      <div
        className={styles.lyricsContainer}
        style={{ fontSize: `${fontScale}rem` }}
      >
        {parsed.sections.map((section) => (
          <div key={section.id} className={styles.section}>
            <div className={styles.sectionHeading}>
              {uiLocale === 'am' ? section.labelAmharic : section.label}
            </div>

            {section.lines.map((line) => {
              if (mode === 'original' || !parsed.hasTransliteration) {
                return (
                  <p key={line.id} className={`${styles.singleLine} ${styles.ethiopicText}`}>
                    {line.cleanOriginal}
                    {line.repetitionCount > 1 && (
                      <span className={styles.repetitionBadge}>({line.repetitionCount}×)</span>
                    )}
                  </p>
                )
              }

              if (mode === 'latin') {
                return (
                  <p key={line.id} className={`${styles.singleLine} ${styles.latinText}`}>
                    {line.cleanTransliteration || line.cleanOriginal}
                    {line.repetitionCount > 1 && (
                      <span className={styles.repetitionBadge}>({line.repetitionCount}×)</span>
                    )}
                  </p>
                )
              }

              // Mode === 'side-by-side': Paired presentation
              return (
                <div key={line.id} className={styles.pairedRow}>
                  <span className={styles.pairedOriginal}>
                    {line.cleanOriginal}
                    {line.repetitionCount > 1 && (
                      <span className={styles.repetitionBadge}>({line.repetitionCount}×)</span>
                    )}
                  </span>
                  {line.cleanTransliteration && (
                    <span className={styles.pairedTranslit}>
                      {line.cleanTransliteration}
                    </span>
                  )}
                </div>
              )
            })}
          </div>
        ))}
      </div>
    </div>
  )
}
