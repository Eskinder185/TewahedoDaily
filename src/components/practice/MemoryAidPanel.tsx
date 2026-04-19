import { useCallback, useEffect, useState } from 'react'
import {
  getChantProgress,
  setChantProgress,
  type ChantProgress,
} from '../../lib/practice/chantLearningStorage'
import styles from './MemoryAidPanel.module.css'

type Props = {
  entryId: string
  activeLine: number
  lineCount: number
  progressiveCount: number
  onProgressiveNext: () => void
  onProgressiveReset: () => void
  firstLetter: boolean
  onToggleFirstLetter: () => void
  focusMode: boolean
  onToggleFocus: () => void
  onRepeatLine: () => void
}

export function MemoryAidPanel({
  entryId,
  activeLine,
  lineCount,
  progressiveCount,
  onProgressiveNext,
  onProgressiveReset,
  firstLetter,
  onToggleFirstLetter,
  focusMode,
  onToggleFocus,
  onRepeatLine,
}: Props) {
  const [progress, setProgressState] = useState<ChantProgress | null>(() =>
    getChantProgress(entryId),
  )

  useEffect(() => {
    setProgressState(getChantProgress(entryId))
  }, [entryId])

  const setProgress = useCallback(
    (p: ChantProgress | null) => {
      setChantProgress(entryId, p)
      setProgressState(p)
    },
    [entryId],
  )

  return (
    <div className={styles.root} role="group" aria-label="Memorization tools">
      <p className={styles.legend}>Memorization</p>
      <div className={styles.row}>
        <button
          type="button"
          className={styles.btn}
          onClick={onProgressiveNext}
          disabled={lineCount === 0 || progressiveCount >= lineCount}
        >
          Reveal next line
        </button>
        <button
          type="button"
          className={styles.btn}
          onClick={onProgressiveReset}
          disabled={lineCount === 0}
        >
          Reset reveal
        </button>
        <button
          type="button"
          className={`${styles.btn} ${firstLetter ? styles.btnOn : ''}`}
          onClick={onToggleFirstLetter}
        >
          First-letter hints
        </button>
        <button
          type="button"
          className={`${styles.btn} ${focusMode ? styles.btnOn : ''}`}
          onClick={onToggleFocus}
        >
          Focus line
        </button>
        <button type="button" className={styles.btn} onClick={onRepeatLine}>
          Center line {lineCount ? activeLine + 1 : 0}
        </button>
      </div>
      <div className={styles.row}>
        <span className={styles.markLabel}>Your progress</span>
        <button
          type="button"
          className={`${styles.mark} ${progress === 'learned' ? styles.markOn : ''}`}
          onClick={() => setProgress(progress === 'learned' ? null : 'learned')}
        >
          Mark learned
        </button>
        <button
          type="button"
          className={`${styles.mark} ${progress === 'review' ? styles.markOn : ''}`}
          onClick={() => setProgress(progress === 'review' ? null : 'review')}
        >
          Review later
        </button>
      </div>
    </div>
  )
}
