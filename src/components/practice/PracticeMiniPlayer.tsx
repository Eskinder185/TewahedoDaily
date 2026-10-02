import {
  useEffect,
  useId,
  useRef,
  type ReactNode,
  type RefObject,
} from 'react'
import { createPortal } from 'react-dom'
import { formatChantTime } from './chantPracticeModel'
import styles from './PracticeMiniPlayer.module.css'

export type PracticeMiniPlayerProps = {
  title: string
  zemari?: string | null
  isPlaying: boolean
  currentTimeSec: number
  durationSec: number
  controlsDisabled: boolean
  expanded: boolean
  onExpandedChange: (next: boolean) => void
  onTogglePlay: () => void
  onSeek: (sec: number) => void
  onSkipBy: (delta: number) => void
  /** Expanded sheet body: loops, advanced, recording, extras */
  sheetBody: ReactNode
  /** Optional extras row in collapsed (desktop) */
  collapsedExtras?: ReactNode
}

/**
 * Viewport-fixed Hymn Practice mini-player + expandable bottom sheet.
 * Controls the same media instance owned by ChantPracticePlayer (no second player).
 */
export function PracticeMiniPlayer({
  title,
  zemari,
  isPlaying,
  currentTimeSec,
  durationSec,
  controlsDisabled,
  expanded,
  onExpandedChange,
  onTogglePlay,
  onSeek,
  onSkipBy,
  sheetBody,
  collapsedExtras,
}: PracticeMiniPlayerProps) {
  const titleId = useId()
  const sheetRef = useRef<HTMLDivElement>(null)
  const expandBtnRef = useRef<HTMLButtonElement>(null)
  const progressPct =
    durationSec > 0 ? Math.max(0, Math.min(100, (currentTimeSec / durationSec) * 100)) : 0

  useEffect(() => {
    const root = document.documentElement
    root.dataset.practiceMiniPlayer = 'true'
    return () => {
      delete root.dataset.practiceMiniPlayer
      root.style.removeProperty('--mini-player-height')
    }
  }, [])

  useEffect(() => {
    const dock = document.getElementById('practice-mini-dock')
    if (!dock || typeof ResizeObserver === 'undefined') return
    const apply = () => {
      const h = Math.ceil(dock.getBoundingClientRect().height)
      document.documentElement.style.setProperty('--mini-player-height', `${h}px`)
    }
    apply()
    const ro = new ResizeObserver(apply)
    ro.observe(dock)
    return () => ro.disconnect()
  }, [expanded])

  useEffect(() => {
    if (!expanded) return
    const prevOverflow = document.body.style.overflow
    document.body.style.overflow = 'hidden'
    const sheet = sheetRef.current
    const focusables = sheet?.querySelectorAll<HTMLElement>(
      'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])',
    )
    const first = focusables?.[0]
    first?.focus()
    const onKey = (event: KeyboardEvent) => {
      if (event.key === 'Escape') {
        event.preventDefault()
        onExpandedChange(false)
        return
      }
      if (event.key !== 'Tab' || !sheet || !focusables?.length) return
      const list = Array.from(focusables)
      const i = list.indexOf(document.activeElement as HTMLElement)
      if (event.shiftKey && (i <= 0 || document.activeElement === sheet)) {
        event.preventDefault()
        list[list.length - 1]?.focus()
      } else if (!event.shiftKey && i === list.length - 1) {
        event.preventDefault()
        list[0]?.focus()
      }
    }
    document.addEventListener('keydown', onKey)
    return () => {
      document.body.style.overflow = prevOverflow
      document.removeEventListener('keydown', onKey)
      expandBtnRef.current?.focus()
    }
  }, [expanded, onExpandedChange])

  if (typeof document === 'undefined') return null

  const dock = (
    <div
      id="practice-mini-dock"
      className={`${styles.dock} ${expanded ? styles.dockHidden : ''}`.trim()}
      role="region"
      aria-label="Playback controls"
      aria-hidden={expanded || undefined}
    >
      <div className={styles.dockMain}>
        <button
          type="button"
          className={styles.playBtn}
          onClick={onTogglePlay}
          disabled={controlsDisabled}
          aria-label={isPlaying ? 'Pause' : 'Play'}
        >
          {isPlaying ? '❚❚' : '▶'}
        </button>
        <div className={styles.meta} id={titleId}>
          <p className={styles.title}>{title || 'Mezmur'}</p>
          {zemari ? <p className={styles.zemari}>{zemari}</p> : null}
        </div>
        <button
          type="button"
          className={styles.iconBtn}
          onClick={() => onSkipBy(-10)}
          disabled={controlsDisabled}
          aria-label="Seek backward 10 seconds"
        >
          −10
        </button>
        <button
          type="button"
          className={styles.iconBtn}
          onClick={() => onSkipBy(10)}
          disabled={controlsDisabled}
          aria-label="Seek forward 10 seconds"
        >
          +10
        </button>
        <button
          ref={expandBtnRef}
          type="button"
          className={styles.expandBtn}
          aria-expanded={expanded}
          aria-controls="practice-player-sheet"
          aria-label="Expand player"
          onClick={() => onExpandedChange(true)}
        >
          ▴
        </button>
      </div>
      <div className={styles.progressRow}>
        <span className={styles.time}>{formatChantTime(currentTimeSec)}</span>
        <label className={styles.seekLabel}>
          <span className={styles.srOnly}>Seek</span>
          <input
            type="range"
            className={styles.seek}
            min={0}
            max={Math.max(1, durationSec)}
            step={0.1}
            value={Math.min(currentTimeSec, durationSec || 0)}
            disabled={controlsDisabled || durationSec <= 0}
            aria-valuemin={0}
            aria-valuemax={Math.max(0, durationSec)}
            aria-valuenow={currentTimeSec}
            aria-valuetext={`${formatChantTime(currentTimeSec)} of ${formatChantTime(durationSec)}`}
            onChange={(e) => onSeek(Number(e.target.value))}
            style={{ ['--progress' as string]: `${progressPct}%` }}
          />
        </label>
        <span className={styles.time}>{formatChantTime(durationSec)}</span>
      </div>
      {collapsedExtras ? <div className={styles.collapsedExtras}>{collapsedExtras}</div> : null}
    </div>
  )

  const sheet = expanded ? (
    <div
      className={styles.backdrop}
      role="presentation"
      onClick={(e) => {
        if (e.target === e.currentTarget) onExpandedChange(false)
      }}
    >
      <div
        id="practice-player-sheet"
        ref={sheetRef}
        className={styles.sheet}
        role="dialog"
        aria-modal="true"
        aria-labelledby={titleId}
        tabIndex={-1}
      >
        <div className={styles.handleRow}>
          <button
            type="button"
            className={styles.handle}
            aria-label="Collapse player"
            onClick={() => onExpandedChange(false)}
          >
            <span className={styles.handlePill} aria-hidden />
            <span className={styles.srOnly}>Collapse</span>
          </button>
        </div>
        <div className={styles.sheetHead}>
          <div className={styles.meta}>
            <p className={styles.sheetTitle}>{title || 'Mezmur'}</p>
            {zemari ? <p className={styles.zemari}>{zemari}</p> : null}
          </div>
          <button
            type="button"
            className={styles.collapseBtn}
            aria-label="Collapse player"
            onClick={() => onExpandedChange(false)}
          >
            Done
          </button>
        </div>
        <div className={styles.sheetTransport}>
          <button
            type="button"
            className={styles.iconBtn}
            onClick={() => onSkipBy(-10)}
            disabled={controlsDisabled}
            aria-label="Seek backward 10 seconds"
          >
            −10
          </button>
          <button
            type="button"
            className={styles.playBtnLarge}
            onClick={onTogglePlay}
            disabled={controlsDisabled}
            aria-label={isPlaying ? 'Pause' : 'Play'}
          >
            {isPlaying ? '❚❚' : '▶'}
          </button>
          <button
            type="button"
            className={styles.iconBtn}
            onClick={() => onSkipBy(10)}
            disabled={controlsDisabled}
            aria-label="Seek forward 10 seconds"
          >
            +10
          </button>
        </div>
        <div className={styles.progressRow}>
          <span className={styles.time}>{formatChantTime(currentTimeSec)}</span>
          <label className={styles.seekLabel}>
            <span className={styles.srOnly}>Seek</span>
            <input
              type="range"
              className={styles.seek}
              min={0}
              max={Math.max(1, durationSec)}
              step={0.1}
              value={Math.min(currentTimeSec, durationSec || 0)}
              disabled={controlsDisabled || durationSec <= 0}
              onChange={(e) => onSeek(Number(e.target.value))}
              style={{ ['--progress' as string]: `${progressPct}%` }}
            />
          </label>
          <span className={styles.time}>{formatChantTime(durationSec)}</span>
        </div>
        <div className={styles.sheetBody}>{sheetBody}</div>
      </div>
    </div>
  ) : null

  return createPortal(
    <>
      {dock}
      {sheet}
    </>,
    document.body,
  )
}

/** Keep TypeScript happy for optional forward-ref consumers. */
export type PracticeMiniPlayerHandle = RefObject<HTMLDivElement | null>
