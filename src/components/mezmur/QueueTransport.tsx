import type { ReactNode } from 'react'
import { useTranslation } from '../../i18n'
import styles from './QueueTransport.module.css'

export type TransportRepeat = 'off' | 'all' | 'one'

export type QueueTransportProps = {
  shuffle: boolean
  repeat: TransportRepeat
  isPlaying: boolean
  canPrevious: boolean
  canNext: boolean
  playDisabled?: boolean
  /** Explains why Previous/Next are unavailable (shown as the disabled buttons' tooltip). */
  unavailableHint?: string
  onShuffle: () => void
  onPrevious: () => void
  onTogglePlay: () => void
  onNext: () => void
  onRepeat: () => void
}

const icon = {
  shuffle: <path d="M16 3h5v5M4 20 21 3M21 16v5h-5M15 15l6 6M4 4l5 5" />,
  previous: <><path d="M19 20 9 12l10-8v16Z" /><path d="M5 19V5" /></>,
  next: <><path d="m5 4 10 8-10 8V4Z" /><path d="M19 5v14" /></>,
  play: <path d="m7 4 13 8-13 8V4Z" />,
  pause: <><path d="M7 4h3.5v16H7zM13.5 4H17v16h-3.5z" /></>,
  repeat: <><path d="m17 2 4 4-4 4" /><path d="M3 11v-1a4 4 0 0 1 4-4h14" /><path d="m7 22-4-4 4-4" /><path d="M21 13v1a4 4 0 0 1-4 4H3" /></>,
}

function Svg({ children }: { children: ReactNode }) {
  return (
    <svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" focusable="false">
      {children}
    </svg>
  )
}

/** Shuffle | Previous | Play/Pause | Next | Repeat — shared by the Mezmur players. */
export function QueueTransport(props: QueueTransportProps) {
  const t = useTranslation()
  const { shuffle, repeat, isPlaying, canPrevious, canNext, playDisabled, unavailableHint } = props
  const repeatLabel = repeat === 'off' ? t('mezmurPractice.player.repeatOff') : repeat === 'all' ? t('mezmurPractice.player.repeatAll') : t('mezmurPractice.player.repeatOne')
  const prevTip = canPrevious ? t('mezmurPractice.player.previous') : unavailableHint || t('mezmurPractice.player.noPrevious')
  const nextTip = canNext ? t('mezmurPractice.player.next') : unavailableHint || t('mezmurPractice.player.noNext')
  return (
    <div className={styles.transport} role="group" aria-label={t('mezmurPractice.player.controls')}>
      <button type="button" className={`${styles.btn} ${shuffle ? styles.active : ''}`} onClick={props.onShuffle}
        aria-pressed={shuffle} aria-label={shuffle ? t('mezmurPractice.player.shuffleOn') : t('mezmurPractice.player.shuffleOff')} title={t('mezmurPractice.player.shuffle')}>
        <Svg>{icon.shuffle}</Svg>
      </button>
      <button type="button" className={styles.btn} onClick={props.onPrevious} disabled={!canPrevious}
        aria-label={t('mezmurPractice.player.previous')} title={prevTip}>
        <Svg>{icon.previous}</Svg>
      </button>
      <button type="button" className={`${styles.btn} ${styles.play}`} onClick={props.onTogglePlay} disabled={playDisabled}
        aria-label={isPlaying ? t('mezmurPractice.player.pause') : t('mezmurPractice.player.play')} title={isPlaying ? t('mezmurPractice.player.pause') : t('mezmurPractice.player.play')}>
        <Svg>{isPlaying ? icon.pause : icon.play}</Svg>
      </button>
      <button type="button" className={styles.btn} onClick={props.onNext} disabled={!canNext}
        aria-label={t('mezmurPractice.player.next')} title={nextTip}>
        <Svg>{icon.next}</Svg>
      </button>
      <button type="button" className={`${styles.btn} ${repeat !== 'off' ? styles.active : ''}`} onClick={props.onRepeat}
        aria-label={repeatLabel} title={`${repeatLabel} (tap to change)`}>
        <Svg>{icon.repeat}</Svg>
        {repeat === 'one' ? <span className={styles.badge} aria-hidden="true">1</span> : null}
      </button>
    </div>
  )
}
