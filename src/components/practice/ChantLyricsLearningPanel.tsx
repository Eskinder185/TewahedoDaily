import { useEffect, useMemo, useRef, useState } from 'react'
import {
  loadAutoScroll,
  loadLyricsFontSize,
  loadLyricsMode,
  loadScrollIntroSec,
  loadScrollOutroSec,
  lyricsFontPx,
  lyricsLineHeight,
  LYRICS_FONT_SIZES,
  saveAutoScroll,
  saveLyricsFontSize,
  saveLyricsMode,
  saveScrollIntroSec,
  saveScrollOutroSec,
  type AutoScrollSpeed,
  type LyricsFontSizePx,
  type LyricsScriptMode,
} from '../../lib/practice/practicePrefs'
import { useLyricsAutoScroll } from '../../hooks/useLyricsAutoScroll'
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
  currentTimeSec = 0,
  durationSec = 0,
  isPlaying = false,
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
  const [autoScroll, setAutoScroll] = useState<AutoScrollSpeed>(() => loadAutoScroll())
  const [introSec, setIntroSec] = useState<number | null>(() => loadScrollIntroSec())
  const [outroSec, setOutroSec] = useState<number | null>(() => loadScrollOutroSec())
  const [showTiming, setShowTiming] = useState(false)
  const [focusMode, setFocusMode] = useState(false)
  const [memorize, setMemorize] = useState(false)
  const [revealed, setRevealed] = useState(1)
  const scrollRef = useRef<HTMLDivElement>(null)

  const modes = useMemo(() => {
    const list: { id: LyricsScriptMode; label: string }[] = []
    if (hasLyrics) list.push({ id: 'lyrics', label: 'Amharic' })
    if (hasTrans) list.push({ id: 'transliteration', label: 'Transliteration' })
    if (hasEnglish) list.push({ id: 'english', label: 'English' })
    if (hasLyrics && hasTrans) list.push({ id: 'both', label: 'Both' })
    return list
  }, [hasLyrics, hasTrans, hasEnglish])

  const fontPx = lyricsFontPx(fontSize)
  const lineHeight = lyricsLineHeight(fontSize)
  const layoutKey = `${entryId}:${scriptMode}:${fontPx}:${focusMode}:${memorize}:${revealed}`

  const autoScrollOn = autoScroll !== 'off'
  const { showResume, resumeAutoScroll, onScroll: onManualScroll, lyricsWindow } = useLyricsAutoScroll({
    enabled: autoScrollOn,
    isPlaying,
    currentTimeSec,
    durationSec,
    pace: autoScroll,
    preferredIntroSec: introSec,
    preferredOutroSec: outroSec,
    layoutKey,
    scrollRef,
  })

  useEffect(() => {
    saveLyricsMode(scriptMode)
  }, [scriptMode])

  useEffect(() => {
    saveLyricsFontSize(fontSize)
  }, [fontSize])

  useEffect(() => {
    saveAutoScroll(autoScroll)
  }, [autoScroll])

  useEffect(() => {
    if (introSec != null) saveScrollIntroSec(introSec)
  }, [introSec])

  useEffect(() => {
    if (outroSec != null) saveScrollOutroSec(outroSec)
  }, [outroSec])

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

  const nudgeTiming = (which: 'intro' | 'outro', delta: number) => {
    if (which === 'intro') {
      const base = introSec ?? Math.round(lyricsWindow.introSec)
      setIntroSec(Math.max(0, Math.min(120, base + delta)))
    } else {
      const base = outroSec ?? Math.round(lyricsWindow.outroSec)
      setOutroSec(Math.max(0, Math.min(120, base + delta)))
    }
  }

  const displayIntro = introSec ?? Math.round(lyricsWindow.introSec)
  const displayOutro = outroSec ?? Math.round(lyricsWindow.outroSec)

  const enterFocus = async () => {
    setFocusMode(true)
    try {
      await scrollRef.current?.requestFullscreen?.()
    } catch {
      /* CSS focus mode still works */
    }
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
    <div
      className={styles.scroll}
      ref={scrollRef}
      tabIndex={0}
      onScroll={autoScrollOn ? onManualScroll : undefined}
      style={lyricsStyle}
    >
      {scriptMode === 'both' && hasTrans ? (
        <div className={styles.bothGrid}>
          <div className={styles.block}>
            <h3 className={styles.blockLabel}>Amharic</h3>
            <p className={styles.text} lang="am">
              {lyricsGez || '—'}
            </p>
          </div>
          <div className={styles.block}>
            <h3 className={styles.blockLabel}>Transliteration</h3>
            <p className={styles.textTrans}>{transliterationLyrics}</p>
          </div>
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
        <div className={styles.modeGroup} role="group" aria-label="Lyrics display">
          {modes.map((mode) => (
            <button
              key={mode.id}
              type="button"
              className={`${styles.modeBtn} ${scriptMode === mode.id ? styles.modeOn : ''}`}
              onClick={() => setScriptMode(mode.id)}
            >
              {mode.label}
            </button>
          ))}
        </div>
      </div>

      <div className={styles.toolRow} role="toolbar" aria-label="Lyrics tools">
        <div className={styles.fontControls}>
          <button type="button" className={styles.modeBtn} aria-label="Decrease text size" onClick={() => bumpFont(-1)}>
            A−
          </button>
          <span className={styles.toolLabel} aria-live="polite">
            {fontPx}px
          </span>
          <button type="button" className={styles.modeBtn} aria-label="Increase text size" onClick={() => bumpFont(1)}>
            A+
          </button>
        </div>
        <label className={styles.scrollSelect}>
          <span className={styles.toolLabel}>Scroll pace</span>
          <select
            value={autoScroll}
            onChange={(e) => setAutoScroll(e.target.value as AutoScrollSpeed)}
            aria-label="Auto scroll pace"
          >
            <option value="off">Off</option>
            <option value="slow">Slow</option>
            <option value="medium">Normal</option>
            <option value="fast">Fast</option>
          </select>
        </label>
        <button
          type="button"
          className={`${styles.modeBtn} ${showTiming ? styles.modeOn : ''}`}
          aria-expanded={showTiming}
          onClick={() => setShowTiming((v) => !v)}
        >
          Timing
        </button>
        <button
          type="button"
          className={`${styles.modeBtn} ${memorize ? styles.modeOn : ''}`}
          aria-pressed={memorize}
          onClick={() => {
            setMemorize((v) => !v)
            setRevealed(1)
          }}
        >
          Memorize
        </button>
        <button type="button" className={styles.modeBtn} onClick={() => (focusMode ? exitFocus() : enterFocus())}>
          {focusMode ? 'Exit focus' : 'Focus lyrics'}
        </button>
        {showResume ? (
          <button type="button" className={`${styles.modeBtn} ${styles.modeOn}`} onClick={resumeAutoScroll}>
            Resume auto scroll
          </button>
        ) : null}
      </div>

      {showTiming ? (
        <div className={styles.timingRow} role="group" aria-label="Auto scroll timing">
          <div className={styles.timingGroup}>
            <span className={styles.toolLabel}>Intro</span>
            <button type="button" className={styles.modeBtn} aria-label="Decrease intro" onClick={() => nudgeTiming('intro', -5)}>
              −5
            </button>
            <span className={styles.timingValue}>{displayIntro}s</span>
            <button type="button" className={styles.modeBtn} aria-label="Increase intro" onClick={() => nudgeTiming('intro', 5)}>
              +5
            </button>
          </div>
          <div className={styles.timingGroup}>
            <span className={styles.toolLabel}>Outro</span>
            <button type="button" className={styles.modeBtn} aria-label="Decrease outro" onClick={() => nudgeTiming('outro', -5)}>
              −5
            </button>
            <span className={styles.timingValue}>{displayOutro}s</span>
            <button type="button" className={styles.modeBtn} aria-label="Increase outro" onClick={() => nudgeTiming('outro', 5)}>
              +5
            </button>
          </div>
        </div>
      ) : null}

      {lyricsBody}

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
          <button type="button" className={styles.modeBtn} onClick={exitFocus}>
            Exit focus mode
          </button>
        </div>
      ) : null}
    </section>
  )
}
