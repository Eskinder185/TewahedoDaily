import type { GuideLangMode } from '../../lib/prayers/prayerLearning'
import { LanguageSwitcher } from './LanguageSwitcher'
import styles from './prayerLearning.module.css'

export function LearnHowToPrayControls({
  mode,
  lang,
  onModeChange,
  onLangChange,
}: {
  mode: 'guided' | 'learn'
  lang: GuideLangMode
  onModeChange: (mode: 'guided' | 'learn') => void
  onLangChange: (mode: GuideLangMode) => void
}) {
  return (
    <div className={styles.controlBar}>
      <div className={styles.modeSeg} role="tablist" aria-label="Learning mode">
        <button
          type="button"
          role="tab"
          aria-selected={mode === 'guided'}
          className={mode === 'guided' ? styles.modeOn : styles.modeBtn}
          onClick={() => onModeChange('guided')}
        >
          Guided Practice
        </button>
        <button
          type="button"
          role="tab"
          aria-selected={mode === 'learn'}
          className={mode === 'learn' ? styles.modeOn : styles.modeBtn}
          onClick={() => onModeChange('learn')}
        >
          Learn About Prayer
        </button>
      </div>
      <LanguageSwitcher value={lang} onChange={onLangChange} />
    </div>
  )
}
