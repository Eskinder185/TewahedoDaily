import { useCallback, useEffect, useState } from 'react'
import {
  getChantProgress,
  setChantProgress,
  type ChantProgress,
} from '../../lib/practice/chantLearningStorage'
import { useTranslation } from '../../i18n'
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
  const t = useTranslation()
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
    <div className={styles.root} role="group" aria-label={t('mezmurPractice.memory.tools')}>
      <p className={styles.legend}>{t('mezmurPractice.memory.title')}</p>
      <div className={styles.row}>
        <button
          type="button"
          className={styles.btn}
          onClick={onProgressiveNext}
          disabled={lineCount === 0 || progressiveCount >= lineCount}
        >
          {t('mezmurPractice.memory.revealNext')}
        </button>
        <button
          type="button"
          className={styles.btn}
          onClick={onProgressiveReset}
          disabled={lineCount === 0}
        >
          {t('mezmurPractice.memory.resetReveal')}
        </button>
        <button
          type="button"
          className={`${styles.btn} ${firstLetter ? styles.btnOn : ''}`}
          onClick={onToggleFirstLetter}
        >
          {t('mezmurPractice.memory.firstLetter')}
        </button>
        <button
          type="button"
          className={`${styles.btn} ${focusMode ? styles.btnOn : ''}`}
          onClick={onToggleFocus}
        >
          {t('mezmurPractice.memory.focusLine')}
        </button>
        <button type="button" className={styles.btn} onClick={onRepeatLine}>
          {t('mezmurPractice.memory.centerLine', { n: lineCount ? activeLine + 1 : 0 })}
        </button>
      </div>
      <div className={styles.row}>
        <span className={styles.markLabel}>{t('mezmurPractice.memory.progress')}</span>
        <button
          type="button"
          className={`${styles.mark} ${progress === 'learned' ? styles.markOn : ''}`}
          onClick={() => setProgress(progress === 'learned' ? null : 'learned')}
        >
          {t('mezmurPractice.memory.markLearned')}
        </button>
        <button
          type="button"
          className={`${styles.mark} ${progress === 'review' ? styles.markOn : ''}`}
          onClick={() => setProgress(progress === 'review' ? null : 'review')}
        >
          {t('mezmurPractice.memory.reviewLater')}
        </button>
      </div>
    </div>
  )
}
