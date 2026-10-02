import { useEffect, useState } from 'react'
import type { SavedChantLoopSection } from '../../lib/practice/chantLoopStorage'
import type { PracticeSectionRange } from '../../lib/practice/autoSplit'
import {
  QUICK_LOOP_IDS,
  slotIsConfigured,
  type QuickLoopId,
  type QuickLoopsState,
} from '../../lib/practice/practiceQuickLoops'
import { useTranslation } from '../../i18n'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import styles from './ChantLoopControls.module.css'

export type AutoSplitSectionRange = PracticeSectionRange

type ChantLoopControlsProps = {
  disabled: boolean
  formatTime: (sec: number | null) => string
  /** Quick Loop 1 / 2 / 3 */
  quickLoops: QuickLoopsState
  activeQuickLoop: QuickLoopId | null
  quickLoopErrors: Partial<Record<QuickLoopId, string>>
  onSetQuickStart: (id: QuickLoopId) => void
  onSetQuickEnd: (id: QuickLoopId) => void
  onPracticeQuickLoop: (id: QuickLoopId) => void
  onStopQuickLoop: () => void
  onClearQuickLoop: (id: QuickLoopId) => void
  onClearAllQuickLoops: () => void
  /** Advanced (A/B) loop */
  loopStart: number | null
  loopEnd: number | null
  loopPlaying: boolean
  loopError: string | null
  onMarkStart: () => void
  onMarkEnd: () => void
  onNudgeStart: (delta: number) => void
  onNudgeEnd: (delta: number) => void
  onPlayLoop: () => void
  onStopLoop: () => void
  onClearLoop: () => void
  loopLimit: number | 'infinite'
  onLoopLimitChange: (value: number | 'infinite') => void
  loopGapSec: number
  onLoopGapChange: (value: number) => void
  loopRepeatIndex: number
  savedSections: SavedChantLoopSection[]
  onSaveSection: () => void
  onPlaySavedSection: (section: SavedChantLoopSection) => void
  onLoadSavedSection: (section: SavedChantLoopSection) => void
  onDeleteSavedSection: (id: string) => void
  onRenameSavedSection: (id: string, label: string) => void
  autoSplitSections: AutoSplitSectionRange[] | null
  activeSectionIndex: number | null
  onPlaySection: (index: number, loop: boolean) => void
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
  formatTime,
  quickLoops,
  activeQuickLoop,
  quickLoopErrors,
  onSetQuickStart,
  onSetQuickEnd,
  onPracticeQuickLoop,
  onStopQuickLoop,
  onClearQuickLoop,
  onClearAllQuickLoops,
  loopStart,
  loopEnd,
  loopPlaying,
  loopError,
  onMarkStart,
  onMarkEnd,
  onNudgeStart,
  onNudgeEnd,
  onPlayLoop,
  onStopLoop,
  onClearLoop,
  loopLimit,
  onLoopLimitChange,
  loopGapSec,
  onLoopGapChange,
  loopRepeatIndex,
  savedSections,
  onSaveSection,
  onPlaySavedSection,
  onLoadSavedSection,
  onDeleteSavedSection,
  onRenameSavedSection,
  autoSplitSections,
  activeSectionIndex,
  onPlaySection,
}: ChantLoopControlsProps) {
  const t = useUiLabel()
  const tt = useTranslation()
  const [advancedOpen, setAdvancedOpen] = useState(false)
  const canPlayLoop =
    loopStart !== null && loopEnd !== null && loopEnd > loopStart + 0.35
  const loopSpan =
    canPlayLoop && loopStart != null && loopEnd != null ? loopEnd - loopStart : 0

  const sectionsBlock = (
    <div className={styles.splitBlock}>
      <h3 className={styles.primaryHeading}>Practice Sections</h3>
      <p className={styles.hint}>Tap Play once, or Loop to repeat a section.</p>
      <div className={styles.splitRow} role="list">
        {(autoSplitSections || []).map((seg, index) => {
          const on = activeSectionIndex === index
          return (
            <div
              key={`${seg.start}-${index}`}
              className={`${styles.splitCard} ${on ? styles.splitCardOn : ''}`}
              role="listitem"
            >
              <p className={styles.splitBtnLabel}>Section {index + 1}</p>
              <p className={styles.splitBtnRange}>
                {formatTime(seg.start)} – {formatTime(seg.end)}
              </p>
              <div className={styles.splitActions}>
                <button
                  type="button"
                  className={styles.btnMini}
                  disabled={disabled}
                  onClick={() => onPlaySection(index, false)}
                >
                  Play
                </button>
                <button
                  type="button"
                  className={styles.btnMini}
                  disabled={disabled}
                  onClick={() => onPlaySection(index, true)}
                >
                  Loop
                </button>
              </div>
            </div>
          )
        })}
        {!autoSplitSections?.length ? (
          <p className={styles.hint}>{tt('mezmurPractice.loop.notReady')}</p>
        ) : null}
      </div>
    </div>
  )

  const advancedBody = (
    <div className={styles.advancedBody}>
      {sectionsBlock}
      <div className={styles.times}>
        <div className={styles.timeRow}>
          <span className={styles.timeLabel}>Start</span>
          <span className={styles.timeValue}>{formatTime(loopStart)}</span>
          <button
            type="button"
            className={styles.btnMini}
            disabled={disabled || loopStart == null}
            onClick={() => onNudgeStart(-1)}
          >
            −1s
          </button>
          <button
            type="button"
            className={styles.btnMini}
            disabled={disabled || loopStart == null}
            onClick={() => onNudgeStart(1)}
          >
            +1s
          </button>
        </div>
        <div className={styles.timeRow}>
          <span className={styles.timeLabel}>End</span>
          <span className={styles.timeValue}>{formatTime(loopEnd)}</span>
          <button
            type="button"
            className={styles.btnMini}
            disabled={disabled || loopEnd == null}
            onClick={() => onNudgeEnd(-1)}
          >
            −1s
          </button>
          <button
            type="button"
            className={styles.btnMini}
            disabled={disabled || loopEnd == null}
            onClick={() => onNudgeEnd(1)}
          >
            +1s
          </button>
        </div>
        {canPlayLoop ? <p className={styles.hint}>Loop length: {formatTime(loopSpan)}</p> : null}
        {loopPlaying && loopLimit !== 'infinite' ? (
          <p className={styles.hint}>
            Repeat {Math.min(loopRepeatIndex, loopLimit)} of {loopLimit}
          </p>
        ) : null}
      </div>

      <div className={styles.actions}>
        <button type="button" className={styles.btn} disabled={disabled} onClick={onMarkStart}>
          Set loop start
        </button>
        <button type="button" className={styles.btn} disabled={disabled} onClick={onMarkEnd}>
          Set loop end
        </button>
        {loopPlaying ? (
          <button type="button" className={styles.btnWarn} onClick={onStopLoop}>
            Stop loop
          </button>
        ) : (
          <button
            type="button"
            className={styles.btnPrimary}
            disabled={!canPlayLoop || disabled}
            onClick={onPlayLoop}
          >
            Start loop
          </button>
        )}
        <button type="button" className={styles.btnGhost} disabled={disabled} onClick={onClearLoop}>
          Clear loop
        </button>
        <button
          type="button"
          className={styles.btnSave}
          disabled={!canPlayLoop || disabled || savedSections.length >= 30}
          onClick={onSaveSection}
        >
          Save
        </button>
      </div>

      <div className={styles.loopOptions}>
        <label>
          Loop count
          <select
            value={loopLimit === 'infinite' ? 'infinite' : String(loopLimit)}
            disabled={disabled}
            onChange={(e) => {
              const v = e.target.value
              onLoopLimitChange(v === 'infinite' ? 'infinite' : Number(v))
            }}
          >
            <option value="infinite">Infinite</option>
            <option value="3">3×</option>
            <option value="5">5×</option>
            <option value="10">10×</option>
          </select>
        </label>
        <label>
          Pause between loops
          <select
            value={String(loopGapSec)}
            disabled={disabled}
            onChange={(e) => onLoopGapChange(Number(e.target.value))}
          >
            <option value="0">None</option>
            <option value="1">1 sec</option>
            <option value="2">2 sec</option>
            <option value="3">3 sec</option>
            <option value="5">5 sec</option>
          </select>
        </label>
      </div>

      {savedSections.length > 0 ? (
        <div className={styles.savedBlock}>
          <h3 className={styles.savedHeading}>{t('savedLoops')}</h3>
          <ul className={styles.savedList}>
            {savedSections.map((section) => (
              <li key={section.id} className={styles.savedRow}>
                <div className={styles.savedMain}>
                  <SectionLabelInput section={section} onRename={onRenameSavedSection} />
                  <span className={styles.savedRange}>
                    {formatTime(section.startSec)}–{formatTime(section.endSec)}
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
                    aria-label={`${tt('mezmurPractice.loop.delete')} ${section.label}`}
                  >
                    {t('loopDelete')}
                  </button>
                </div>
              </li>
            ))}
          </ul>
        </div>
      ) : (
        <p className={styles.savedEmpty}>{tt('mezmurPractice.loop.empty')}</p>
      )}
    </div>
  )

  return (
    <section className={styles.root} aria-disabled={disabled || undefined}>
      <div className={styles.quickGrid}>
        {QUICK_LOOP_IDS.map((id) => {
          const slot = quickLoops[`loop${id}` as const]
          const active = activeQuickLoop === id
          const ready = slotIsConfigured(slot)
          const err = quickLoopErrors[id]
          const rangeLabel =
            slot.startTime != null && slot.endTime != null
              ? `${formatTime(slot.startTime)} → ${formatTime(slot.endTime)}`
              : slot.startTime != null
                ? `${formatTime(slot.startTime)} → —`
                : 'Not configured'

          return (
            <div
              key={id}
              className={`${styles.quickSlot} ${active ? styles.quickSlotActive : ''}`.trim()}
            >
              <div className={styles.quickHead}>
                <p className={styles.quickTitle}>Loop {id}</p>
                {active ? <span className={styles.activeBadge}>● ACTIVE</span> : null}
              </div>
              <p className={styles.quickRange}>{rangeLabel}</p>
              {err ? (
                <p className={styles.quickError} role="alert">
                  {err}
                </p>
              ) : null}
              <div className={styles.quickActions}>
                <button
                  type="button"
                  className={styles.quickBtn}
                  disabled={disabled}
                  aria-label={`Set Loop ${id} start`}
                  onClick={() => onSetQuickStart(id)}
                >
                  Set Start
                </button>
                <button
                  type="button"
                  className={styles.quickBtn}
                  disabled={disabled}
                  aria-label={`Set Loop ${id} end`}
                  onClick={() => onSetQuickEnd(id)}
                >
                  Set End
                </button>
                {active ? (
                  <button
                    type="button"
                    className={`${styles.quickBtn} ${styles.quickBtnWarn}`}
                    aria-label={`Stop Loop ${id}`}
                    onClick={onStopQuickLoop}
                  >
                    Stop Loop
                  </button>
                ) : (
                  <button
                    type="button"
                    className={`${styles.quickBtn} ${styles.quickBtnPrimary}`}
                    disabled={disabled || !ready}
                    aria-label={`Practice Loop ${id}`}
                    onClick={() => onPracticeQuickLoop(id)}
                  >
                    Practice
                  </button>
                )}
                <button
                  type="button"
                  className={styles.quickBtnGhost}
                  disabled={disabled}
                  aria-label={`Clear Loop ${id}`}
                  onClick={() => onClearQuickLoop(id)}
                >
                  Clear
                </button>
              </div>
            </div>
          )
        })}
      </div>

      <button
        type="button"
        className={styles.clearAll}
        disabled={disabled}
        onClick={onClearAllQuickLoops}
      >
        Clear All Loops
      </button>

      {loopError ? <p className={styles.error}>{loopError}</p> : null}

      <details
        className={styles.advanced}
        open={advancedOpen}
        onToggle={(e) => setAdvancedOpen((e.target as HTMLDetailsElement).open)}
      >
        <summary className={styles.advancedSummary}>Advanced Loop</summary>
        {advancedBody}
      </details>
    </section>
  )
}
