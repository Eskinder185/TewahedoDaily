import { useEffect, useMemo, useRef, useState } from 'react'
import {
  loadLyricsFontSize,
  loadLyricsMode,
  lyricsFontPx,
  lyricsLineHeight,
  LYRICS_FONT_SIZES,
  saveLyricsFontSize,
  saveLyricsMode,
  type LyricsFontSizePx,
  type LyricsScriptMode,
} from '../../lib/practice/practicePrefs'
import { MemoryAidPanel } from './MemoryAidPanel'
import { splitLyricsLines } from '../../lib/practice/splitLyricsForStudy'
import styles from './ChantLyricsLearningPanel.module.css'

type Props = {
  entryId: string
  lyricsGez: string
  transliterationLyrics: string
  lyricsEnglish?: string
  currentTimeSec?: number
  durationSec?: number
  isPlaying?: boolean
  showMemorizationTipsCallout?: boolean
}

export function ChantLyricsLearningPanel({
  entryId,
  lyricsGez,
  transliterationLyrics,
  lyricsEnglish = '',
}: Props) {
  const hasLyrics = lyricsGez.trim().length > 0
  const hasTrans = transliterationLyrics.trim().length > 0
  const hasEnglish = lyricsEnglish.trim().length > 0
  const [scriptMode, setScriptMode] = useState<LyricsScriptMode>(() => {
    const saved = loadLyricsMode()
    if (saved === 'english' && !hasEnglish) return hasLyrics ? 'lyrics' : 'transliteration'
    if (saved === 'transliteration' && !hasTrans) return 'lyrics'
    if (saved === 'both' && !hasTrans) return 'lyrics'
    return saved
  })
  const [fontSize, setFontSize] = useState<LyricsFontSizePx>(() => loadLyricsFontSize())
  const [focusMode, setFocusMode] = useState(false)
  const [memorize, setMemorize] = useState(false)
  const [revealed, setRevealed] = useState(1)
  const [displayOpen, setDisplayOpen] = useState(false)
  const scrollRef = useRef<HTMLDivElement>(null)

  const modes = useMemo(() => {
    const list: { id: LyricsScriptMode; label: string }[] = []
    if (hasLyrics) list.push({ id: 'lyrics', label: 'Amharic' })
    if (hasTrans) list.push({ id: 'transliteration', label: 'Transliteration' })
    if (hasLyrics && hasTrans) list.push({ id: 'both', label: 'Both' })
    if (hasEnglish) list.push({ id: 'english', label: 'English' })
    return list
  }, [hasLyrics, hasTrans, hasEnglish])

  const fontPx = lyricsFontPx(fontSize)
  const lineHeight = lyricsLineHeight(fontSize)

  useEffect(() => {
    saveLyricsMode(scriptMode)
  }, [scriptMode])

  useEffect(() => {
    saveLyricsFontSize(fontSize)
  }, [fontSize])

  useEffect(() => {
    setRevealed(1)
    setMemorize(false)
  }, [entryId])

  useEffect(() => {
    if (!focusMode) return
    const onKey = (event: KeyboardEvent) => {
      if (event.key === 'Escape') setFocusMode(false)
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [focusMode])

  const primaryText =
    scriptMode === 'transliteration'
      ? transliterationLyrics
      : scriptMode === 'english'
        ? lyricsEnglish
        : lyricsGez
  const lines = useMemo(() => splitLyricsLines(primaryText), [primaryText])

  const bumpFont = (dir: -1 | 1) => {
    const idx = LYRICS_FONT_SIZES.indexOf(fontSize)
    const safeIdx = idx < 0 ? LYRICS_FONT_SIZES.indexOf(20) : idx
    const next = LYRICS_FONT_SIZES[Math.max(0, Math.min(LYRICS_FONT_SIZES.length - 1, safeIdx + dir))]
    setFontSize(next)
  }

  const enterFocus = () => {
    setFocusMode(true)
  }

  const exitFocus = async () => {
    setFocusMode(false)
    if (document.fullscreenElement) {
      try {
        await document.exitFullscreen()
      } catch {
        /* ignore */
      }
    }
  }

  const lyricsStyle = {
    ['--lyrics-font-size' as string]: `${fontPx}px`,
    ['--lyrics-line-height' as string]: String(lineHeight),
  }

  const lyricsBody = (
    <div className={styles.scroll} ref={scrollRef} tabIndex={0} style={lyricsStyle}>
      {scriptMode === 'both' && hasTrans ? (
        <div className={styles.bothStack}>
          {hasLyrics ? (
            <div className={styles.block}>
              <h3 className={styles.blockLabel}>Amharic</h3>
              <p className={styles.text} lang="am">
                {lyricsGez}
              </p>
            </div>
          ) : null}
          <div className={styles.block}>
            <h3 className={styles.blockLabel}>Transliteration</h3>
            <p className={styles.textTrans}>{transliterationLyrics}</p>
          </div>
          {!hasLyrics ? (
            <p className={styles.textTrans} role="status">
              Amharic lyrics are not available for this Mezmur.
            </p>
          ) : null}
        </div>
      ) : memorize ? (
        <div className={styles.lines}>
          {lines.slice(0, revealed).map((line, index) => (
            <button
              key={`${index}-${line.slice(0, 12)}`}
              type="button"
              className={styles.linePick}
              onClick={() => setRevealed((n) => Math.min(lines.length, n + 1))}
            >
              <span className={styles.lineNum}>{index + 1}</span>
              <span className={styles.text} lang={scriptMode === 'lyrics' ? 'am' : undefined}>
                {line}
              </span>
            </button>
          ))}
          {revealed < lines.length ? (
            <button
              type="button"
              className={styles.modeBtn}
              onClick={() => setRevealed((n) => Math.min(lines.length, n + 1))}
            >
              Reveal next line
            </button>
          ) : null}
        </div>
      ) : (
        <p
          className={scriptMode === 'lyrics' ? styles.text : styles.textTrans}
          lang={scriptMode === 'lyrics' ? 'am' : undefined}
        >
          {primaryText || '—'}
        </p>
      )}
    </div>
  )

  return (
    <section className={`${styles.root} ${focusMode ? styles.focusRoot : ''}`} aria-labelledby="chant-lyrics-h">
      <div className={styles.head}>
        <h2 id="chant-lyrics-h" className={styles.title}>
          Lyrics
        </h2>
      </div>

      <div className={styles.modeScroller} role="group" aria-label="Reading script (not site language)">
        <div className={styles.modeGroup}>
          {modes.map((mode) => (
            <button
              key={mode.id}
              type="button"
              className={`${styles.modeBtn} ${scriptMode === mode.id ? styles.modeOn : ''}`}
              onClick={() => setScriptMode(mode.id)}
              aria-pressed={scriptMode === mode.id}
            >
              {mode.label}
            </button>
          ))}
        </div>
      </div>

      <div className={styles.primaryTools} role="toolbar" aria-label="Reading text size">
        <div className={styles.fontControls}>
          <button type="button" className={styles.toolBtn} aria-label="Decrease reading text size" onClick={() => bumpFont(-1)}>
            A−
          </button>
          <span className={styles.toolLabel} aria-live="polite">
            {fontPx}px
          </span>
          <button type="button" className={styles.toolBtn} aria-label="Increase reading text size" onClick={() => bumpFont(1)}>
            A+
          </button>
        </div>

        <button type="button" className={styles.toolBtn} onClick={() => (focusMode ? exitFocus() : enterFocus())}>
          {focusMode ? 'Exit focus' : 'Focus reading'}
        </button>
      </div>

      {lyricsBody}

      <details
        className={styles.displayDetails}
        open={displayOpen}
        onToggle={(event) => setDisplayOpen((event.target as HTMLDetailsElement).open)}
      >
        <summary className={styles.displaySummary}>Display settings</summary>
        <div className={styles.displayBody}>
          <button
            type="button"
            className={`${styles.toolBtn} ${memorize ? styles.modeOn : ''}`}
            aria-pressed={memorize}
            onClick={() => {
              setMemorize((v) => !v)
              setRevealed(1)
            }}
          >
            Memorize
          </button>
        </div>
      </details>

      {memorize ? (
        <MemoryAidPanel
          entryId={entryId}
          activeLine={Math.max(0, revealed - 1)}
          lineCount={lines.length}
          progressiveCount={revealed}
          onProgressiveNext={() => setRevealed((n) => Math.min(n + 1, lines.length))}
          onProgressiveReset={() => setRevealed(1)}
          firstLetter={false}
          onToggleFirstLetter={() => undefined}
          focusMode={false}
          onToggleFocus={() => undefined}
          onRepeatLine={() => undefined}
        />
      ) : null}

      {focusMode ? (
        <div className={styles.focusChrome}>
          <button type="button" className={styles.toolBtn} onClick={exitFocus}>
            Exit focus mode
          </button>
        </div>
      ) : null}
    </section>
  )
}
