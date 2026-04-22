import { useEffect, useState } from 'react'
import type { SavedChantLoopSection } from '../../lib/practice/chantLoopStorage'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import styles from './ChantLoopControls.module.css'

export type AutoSplitSectionRange = { start: number; end: number }

type ChantLoopControlsProps = {
  disabled: boolean
  loopStart: number | null
  loopEnd: number | null
  loopPlaying: boolean
  loopError: string | null
  formatTime: (sec: number | null) => string
  onMarkStart: () => void
  onMarkEnd: () => void
  onPlayLoop: () => void
  onStopLoop: () => void
  onClearLoop: () => void
  savedSections: SavedChantLoopSection[]
  onSaveSection: () => void
  onPlaySavedSection: (section: SavedChantLoopSection) => void
  onLoadSavedSection: (section: SavedChantLoopSection) => void
  onDeleteSavedSection: (id: string) => void
  onRenameSavedSection: (id: string, label: string) => void
  /** Equal thirds of the video; null until user runs auto split. */
  autoSplitSections: AutoSplitSectionRange[] | null
  /**
   * Which practice-segment control is emphasized: full video, a numbered third,
   * or neutral (manual marks / saved loop — no auto-split pill active).
   */
  splitHighlight: 'full' | 1 | 2 | 3 | 'neutral'
  onSelectAutoSection: (section: 1 | 2 | 3) => void
}

function SectionLabelInput({
  section,
  onRename,
}: {
  section: SavedChantLoopSection
  onRename: (id: string, label: string) => void
}) {
  const t = useUiLabel()
  const [v, setV] = useState(section.label)
  useEffect(() => {
    setV(section.label)
  }, [section.id, section.label])

  return (
    <input
      type="text"
      className={styles.sectionLabelInput}
      value={v}
      onChange={(e) => setV(e.target.value)}
      onBlur={() => onRename(section.id, v)}
      onKeyDown={(e) => {
        if (e.key === 'Enter') (e.target as HTMLInputElement).blur()
      }}
      aria-label={t('loopSectionNameLabel')}
    />
  )
}

export function ChantLoopControls({
  disabled,
  loopStart,
  loopEnd,
  loopPlaying,
  loopError,
  formatTime,
  onMarkStart,
  onMarkEnd,
  onPlayLoop,
  onStopLoop,
  onClearLoop,
  savedSections,
  onSaveSection,
  onPlaySavedSection,
  onLoadSavedSection,
  onDeleteSavedSection,
  onRenameSavedSection,
  autoSplitSections,
  splitHighlight,
  onSelectAutoSection,
}: ChantLoopControlsProps) {
  const t = useUiLabel()
  const [advancedOpen, setAdvancedOpen] = useState(false)
  const canPlayLoop =
    loopStart !== null &&
    loopEnd !== null &&
    loopEnd > loopStart + 0.35

  const canSaveSection =
    canPlayLoop && savedSections.length < 30

  const sectionMainLabel = (n: 1 | 2 | 3) =>
    n === 1 ? t('loopSection1') : n === 2 ? t('loopSection2') : t('loopSection3')

  const renderSavedSections = () =>
    savedSections.length > 0 ? (
      <div className={styles.savedBlock}>
        <h3 className={styles.savedHeading}>{t('savedLoops')}</h3>
        <ul className={styles.savedList}>
          {savedSections.map((section) => (
            <li key={section.id} className={styles.savedRow}>
              <div className={styles.savedMain}>
                <SectionLabelInput
                  section={section}
                  onRename={onRenameSavedSection}
                />
                <span className={styles.savedRange}>
                  {formatTime(section.startSec)} – {formatTime(section.endSec)}
                </span>
              </div>
              <div className={styles.savedActions}>
                <button
                  type="button"
                  className={styles.btnMini}
                  onClick={() => onPlaySavedSection(section)}
                >
                  {t('loopPlay')}
                </button>
                <button
                  type="button"
                  className={styles.btnMini}
                  onClick={() => onLoadSavedSection(section)}
                >
                  {t('loopLoad')}
                </button>
                <button
                  type="button"
                  className={styles.btnMiniDanger}
                  onClick={() => onDeleteSavedSection(section.id)}
                  aria-label={`Delete ${section.label}`}
                >
                  {t('loopDelete')}
                </button>
              </div>
            </li>
          ))}
        </ul>
      </div>
    ) : (
      <p className={styles.savedEmpty}>
        No saved loops yet. Mark start and end, then use <strong>Save loop</strong>.
      </p>
    )

  return (
    <fieldset className={styles.root} disabled={disabled}>
      <legend className={styles.legend}>{t('loopLegend')}</legend>
      <div className={styles.splitBlock}>
        <h3 className={styles.primaryHeading}>{t('loopAutoSplitLegend')}</h3>
        <p className={styles.hint}>
          Auto split is the default practice flow. Choose a section and replay it.
        </p>
        <div className={styles.splitRow} role="group" aria-label={t('loopAutoSplitLegend')}>
          {([1, 2, 3] as const).map((n) => {
            const seg = autoSplitSections?.[n - 1]
            const label = sectionMainLabel(n)
            const range =
              seg != null ? `${formatTime(seg.start)}–${formatTime(seg.end)}` : 'Not ready'
            const on = splitHighlight === n
            return (
              <button
                key={n}
                type="button"
                className={`${styles.splitBtn} ${on ? styles.splitBtnOn : ''}`}
                disabled={!seg}
                onClick={() => onSelectAutoSection(n)}
                aria-pressed={on}
                title={seg != null ? `${label} (${range})` : label}
              >
                <span className={styles.splitBtnLabel}>{label}</span>
                <span className={styles.splitBtnRange}>{range}</span>
                <span className={styles.splitBtnAction}>Play section</span>
              </button>
            )
          })}
        </div>
      </div>

      {loopError ? <p className={styles.error}>{loopError}</p> : null}

      <details
        className={styles.advanced}
        open={advancedOpen}
        onToggle={(e) => setAdvancedOpen((e.target as HTMLDetailsElement).open)}
      >
        <summary className={styles.advancedSummary}>Advanced Loop Practice</summary>
        <div className={styles.advancedBody}>
          <div className={styles.times}>
            <div className={styles.timeRow}>
              <span className={styles.timeLabel}>{t('loopTimeStart')}</span>
              <span className={styles.timeValue}>{formatTime(loopStart)}</span>
            </div>
            <div className={styles.timeRow}>
              <span className={styles.timeLabel}>{t('loopTimeEnd')}</span>
              <span className={styles.timeValue}>{formatTime(loopEnd)}</span>
            </div>
          </div>

          <div className={styles.actions}>
            <button type="button" className={styles.btn} onClick={onMarkStart}>
              {t('markStart')}
            </button>
            <button type="button" className={styles.btn} onClick={onMarkEnd}>
              {t('markEnd')}
            </button>
          </div>
          <div className={styles.actions}>
            {loopPlaying ? (
              <button type="button" className={styles.btnWarn} onClick={onStopLoop}>
                {t('stopLoop')}
              </button>
            ) : (
              <button
                type="button"
                className={styles.btnPrimary}
                disabled={!canPlayLoop}
                onClick={onPlayLoop}
              >
                {t('playLoop')}
              </button>
            )}
            <button type="button" className={styles.btnGhost} onClick={onClearLoop}>
              {t('clearLoop')}
            </button>
            <button
              type="button"
              className={styles.btnSave}
              disabled={!canSaveSection}
              onClick={onSaveSection}
              title={
                !canPlayLoop
                  ? 'Mark start and end first'
                  : savedSections.length >= 30
                    ? 'Maximum 30 saved loops'
                    : 'Save this range as a new loop'
              }
            >
              {t('saveLoop')}
            </button>
          </div>
          {renderSavedSections()}
        </div>
      </details>
    </fieldset>
  )
}
