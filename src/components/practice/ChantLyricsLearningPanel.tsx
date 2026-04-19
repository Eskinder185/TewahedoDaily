import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import {
  firstLetterHint,
  splitLyricsLines,
  splitLyricsStanzas,
} from '../../lib/practice/splitLyricsForStudy'
import { MemoryAidPanel } from './MemoryAidPanel'
import { MemorizationTipsCallout } from './MemorizationTipsCallout'
import styles from './ChantLyricsLearningPanel.module.css'

export type ScriptMode = 'lyrics' | 'transliteration' | 'both'
export type StudyLayout = 'full' | 'line' | 'stanza'

type Props = {
  entryId: string
  lyricsGez: string
  transliterationLyrics: string
  /** When false, omit the general memorization tips (e.g. when shown in a separate Tips tab). */
  showMemorizationTipsCallout?: boolean
}

export function ChantLyricsLearningPanel({
  entryId,
  lyricsGez,
  transliterationLyrics,
  showMemorizationTipsCallout = true,
}: Props) {
  const t = useUiLabel()
  const hasTrans = transliterationLyrics.trim().length > 0
  const [scriptMode, setScriptMode] = useState<ScriptMode>('lyrics')
  const [studyLayout, setStudyLayout] = useState<StudyLayout>('full')
  const [activeLine, setActiveLine] = useState(0)
  const [progressiveCount, setProgressiveCount] = useState(1)
  const [firstLetter, setFirstLetter] = useState(false)
  const [focusMode, setFocusMode] = useState(false)
  const lineRefs = useRef<(HTMLDivElement | null)[]>([])

  const primaryText = useMemo(() => {
    if (scriptMode === 'transliteration') return transliterationLyrics
    return lyricsGez
  }, [scriptMode, lyricsGez, transliterationLyrics])

  const lines = useMemo(() => splitLyricsLines(primaryText), [primaryText])
  const stanzas = useMemo(() => splitLyricsStanzas(primaryText), [primaryText])

  const effectiveLines = useMemo(() => {
    if (studyLayout === 'stanza') {
      return stanzas.length > 0 ? stanzas : lines
    }
    return lines
  }, [studyLayout, stanzas, lines])

  const lineCount = effectiveLines.length

  useEffect(() => {
    setActiveLine(0)
    setProgressiveCount(studyLayout === 'full' ? lineCount : 1)
  }, [entryId, studyLayout, scriptMode, primaryText, lineCount])

  useEffect(() => {
    if (activeLine >= lineCount) setActiveLine(Math.max(0, lineCount - 1))
  }, [activeLine, lineCount])

  const visibleCount =
    studyLayout === 'full'
      ? lineCount
      : Math.min(progressiveCount, lineCount)

  const repeatLine = useCallback(() => {
    const el = lineRefs.current[activeLine]
    el?.scrollIntoView({ behavior: 'smooth', block: 'center' })
  }, [activeLine])

  const studyToolsActive = studyLayout !== 'full' && scriptMode !== 'both'

  return (
    <section className={styles.root} aria-labelledby="chant-lyrics-h">
      <div className={styles.head}>
        <h2 id="chant-lyrics-h" className={styles.title}>
          {t('lyricsTextHeading')}
        </h2>
        <div className={styles.modeGroup} role="group" aria-label="Lyrics display">
          <button
            type="button"
            className={`${styles.modeBtn} ${scriptMode === 'lyrics' ? styles.modeOn : ''}`}
            onClick={() => setScriptMode('lyrics')}
          >
            {t('lyricsLyrics')}
          </button>
          <button
            type="button"
            disabled={!hasTrans}
            className={`${styles.modeBtn} ${scriptMode === 'transliteration' ? styles.modeOn : ''}`}
            onClick={() => setScriptMode('transliteration')}
            title={!hasTrans ? 'No transliteration in data' : undefined}
          >
            {t('lyricsTransliteration')}
          </button>
          <button
            type="button"
            disabled={!hasTrans}
            className={`${styles.modeBtn} ${scriptMode === 'both' ? styles.modeOn : ''}`}
            onClick={() => setScriptMode('both')}
            title={!hasTrans ? 'No transliteration in data' : undefined}
          >
            {t('lyricsBoth')}
          </button>
        </div>
      </div>

      <div className={styles.studyModes} role="group" aria-label="Study layout">
        <span className={styles.studyLabel}>Study layout</span>
        {(['full', 'line', 'stanza'] as const).map((m) => (
          <button
            key={m}
            type="button"
            className={`${styles.studyBtn} ${studyLayout === m ? styles.studyOn : ''}`}
            onClick={() => setStudyLayout(m)}
            disabled={scriptMode === 'both'}
          >
            {m === 'full' ? 'Full text' : m === 'line' ? 'Line by line' : 'Stanzas'}
          </button>
        ))}
      </div>
      {scriptMode === 'both' ? (
        <p className={styles.hint}>
          Switch to Ge’ez or transliteration only for line-by-line study tools.
        </p>
      ) : null}

      <div className={styles.scroll}>
        {scriptMode === 'both' && hasTrans ? (
          <>
            <div className={styles.block}>
              <h3 className={styles.blockLabel}>{t('lyricsLyrics')}</h3>
              <p className={styles.text} lang="am">
                {lyricsGez || '—'}
              </p>
            </div>
            <div className={styles.block}>
              <h3 className={styles.blockLabel}>{t('lyricsTransliteration')}</h3>
              <p className={styles.textTrans}>{transliterationLyrics}</p>
            </div>
          </>
        ) : studyLayout === 'full' ? (
          <div className={styles.block}>
            <p
              className={scriptMode === 'lyrics' ? styles.text : styles.textTrans}
              lang={scriptMode === 'lyrics' ? 'am' : undefined}
            >
              {primaryText || '—'}
            </p>
          </div>
        ) : (
          <div className={styles.lines}>
            {effectiveLines.slice(0, visibleCount).map((line, i) => {
              const isActive = i === activeLine
              const dim = focusMode && !isActive
              const hint =
                firstLetter && (scriptMode === 'transliteration' || scriptMode === 'lyrics')
                  ? firstLetterHint(line)
                  : null
              return (
                <div
                  key={i}
                  ref={(el) => {
                    lineRefs.current[i] = el
                  }}
                  className={`${styles.lineRow} ${isActive ? styles.lineActive : ''} ${dim ? styles.lineDim : ''}`}
                >
                  <button
                    type="button"
                    className={styles.linePick}
                    onClick={() => setActiveLine(i)}
                    aria-current={isActive ? 'true' : undefined}
                  >
                    <span className={styles.lineNum}>{i + 1}</span>
                    <span
                      className={
                        scriptMode === 'lyrics' ? styles.text : styles.textTrans
                      }
                      lang={scriptMode === 'lyrics' ? 'am' : undefined}
                    >
                      {line}
                    </span>
                  </button>
                  {firstLetter && hint ? (
                    <p className={styles.hintLine}>{hint}</p>
                  ) : null}
                </div>
              )
            })}
          </div>
        )}
        {(scriptMode === 'transliteration' || scriptMode === 'both') && !hasTrans ? (
          <p className={styles.muted}>{t('lyricsNoTrans')}</p>
        ) : null}
      </div>

      {studyToolsActive && lineCount > 0 ? (
        <MemoryAidPanel
          entryId={entryId}
          activeLine={activeLine}
          lineCount={lineCount}
          progressiveCount={progressiveCount}
          onProgressiveNext={() =>
            setProgressiveCount((c) => Math.min(c + 1, lineCount))
          }
          onProgressiveReset={() => setProgressiveCount(1)}
          firstLetter={firstLetter}
          onToggleFirstLetter={() => setFirstLetter((v) => !v)}
          focusMode={focusMode}
          onToggleFocus={() => setFocusMode((v) => !v)}
          onRepeatLine={repeatLine}
        />
      ) : null}

      {showMemorizationTipsCallout ? <MemorizationTipsCallout /> : null}
    </section>
  )
}
