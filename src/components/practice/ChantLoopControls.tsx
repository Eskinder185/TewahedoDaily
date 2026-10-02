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
  const [editingPart, setEditingPart] = useState<QuickLoopId | null>(null)
  const canPlayLoop =
    loopStart !== null && loopEnd !== null && loopEnd > loopStart + 0.35
  const loopSpan =
    canPlayLoop && loopStart != null && loopEnd != null ? loopEnd - loopStart : 0
  const rangeHint =
    loopStart != null && loopEnd != null && !canPlayLoop
      ? 'End must be after start. Set End later in the track, or nudge the times.'
      : null

  const advancedBody = (
    <div className={styles.advancedBody}>
      <p className={styles.advancedLead}>
        I choose where my loop starts and ends — mark the current playback time, then loop that
        section.
      </p>

      <div className={styles.abRange} aria-live="polite">
        <div className={styles.abPoint}>
          <span className={styles.timeLabel}>Start</span>
          <span className={styles.timeValue}>{formatTime(loopStart) || '—'}</span>
          <button
            type="button"
            className={styles.btnSetCurrent}
            disabled={disabled}
            onClick={onMarkStart}
          >
            Set current
          </button>
        </div>
        <div className={styles.abPoint}>
          <span className={styles.timeLabel}>End</span>
          <span className={styles.timeValue}>{formatTime(loopEnd) || '—'}</span>
          <button
            type="button"
            className={styles.btnSetCurrent}
            disabled={disabled}
            onClick={onMarkEnd}
          >
            Set current
          </button>
        </div>
      </div>

      <p className={styles.selectedRange}>
        Selected range:{' '}
        <strong>
          {formatTime(loopStart) || '—'} → {formatTime(loopEnd) || '—'}
          {canPlayLoop ? ` (${formatTime(loopSpan)})` : ''}
        </strong>
      </p>
      {rangeHint ? (
        <p className={styles.error} role="alert">
          {rangeHint}
        </p>
      ) : null}

      <div className={styles.abPrimary}>
        {loopPlaying ? (
          <button type="button" className={styles.btnWarn} onClick={onStopLoop}>
            Stop looping
          </button>
        ) : (
          <button
            type="button"
            className={styles.btnPrimary}
            disabled={!canPlayLoop || disabled}
            onClick={onPlayLoop}
          >
            Loop this section
          </button>
        )}
        <button type="button" className={styles.btnGhost} disabled={disabled} onClick={onClearLoop}>
          Clear
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

      {loopPlaying && loopLimit !== 'infinite' ? (
        <p className={styles.hint}>
          Repeat {Math.min(loopRepeatIndex, loopLimit)} of {loopLimit}
        </p>
      ) : null}

      <details className={styles.nudgeDetails}>
        <summary className={styles.nudgeSummary}>Fine-tune (±1s)</summary>
        <div className={styles.nudgeRow}>
          <span className={styles.timeLabel}>Start</span>
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
          <span className={styles.timeLabel}>End</span>
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
      </details>

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

      {autoSplitSections?.length ? (
        <div className={styles.splitBlock}>
          <h3 className={styles.savedHeading}>Auto sections</h3>
          <p className={styles.hint}>Optional splits from track length.</p>
          <div className={styles.splitRow} role="list">
            {autoSplitSections.map((seg, index) => {
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
          </div>
        </div>
      ) : null}

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
      <h3 className={styles.primaryHeading}>Parts</h3>
      <p className={styles.hint}>
        Three practice parts from the track. Tap a part to loop it. Edit marks only when you need
        to.
      </p>

      <div className={styles.partGrid} role="list">
        {QUICK_LOOP_IDS.map((id) => {
          const slot = quickLoops[`loop${id}` as const]
          const active = activeQuickLoop === id
          const ready = slotIsConfigured(slot)
          const err = quickLoopErrors[id]
          const editing = editingPart === id
          const rangeLabel =
            slot.startTime != null && slot.endTime != null
              ? `${formatTime(slot.startTime)} – ${formatTime(slot.endTime)}`
              : slot.startTime != null
                ? `${formatTime(slot.startTime)} – —`
                : 'Waiting for duration…'

          return (
            <div
              key={id}
              className={`${styles.partCard} ${active ? styles.partCardActive : ''} ${
                ready ? '' : styles.partCardEmpty
              }`.trim()}
              role="listitem"
            >
              <button
                type="button"
                className={styles.partMain}
                disabled={disabled || !ready}
                aria-pressed={active}
                aria-label={
                  active
                    ? `Stop Part ${id}`
                    : `Loop Part ${id}, ${rangeLabel}`
                }
                onClick={() => (active ? onStopQuickLoop() : onPracticeQuickLoop(id))}
              >
                <span className={styles.partTitle}>Part {id}</span>
                <span className={styles.partRange}>{rangeLabel}</span>
                <span className={styles.partAction}>{active ? 'Stop' : 'Loop'}</span>
              </button>
              {err ? (
                <p className={styles.quickError} role="alert">
                  {err}
                </p>
              ) : null}
              <div className={styles.partTools}>
                <button
                  type="button"
                  className={styles.partToolBtn}
                  disabled={disabled}
                  aria-expanded={editing}
                  onClick={() => setEditingPart((prev) => (prev === id ? null : id))}
                >
                  {editing ? 'Hide marks' : 'Edit marks'}
                </button>
                {editing ? (
                  <>
                    <button
                      type="button"
                      className={styles.partToolBtn}
                      disabled={disabled}
                      aria-label={`Set Part ${id} start to current time`}
                      onClick={() => onSetQuickStart(id)}
                    >
                      Set start
                    </button>
                    <button
                      type="button"
                      className={styles.partToolBtn}
                      disabled={disabled}
                      aria-label={`Set Part ${id} end to current time`}
                      onClick={() => onSetQuickEnd(id)}
                    >
                      Set end
                    </button>
                    <button
                      type="button"
                      className={styles.partToolBtn}
                      disabled={disabled}
                      aria-label={`Clear Part ${id}`}
                      onClick={() => onClearQuickLoop(id)}
                    >
                      Clear
                    </button>
                  </>
                ) : null}
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
        Reset all parts
      </button>

      {loopError ? <p className={styles.error}>{loopError}</p> : null}

      <details
        className={styles.advanced}
        open={advancedOpen}
        onToggle={(e) => setAdvancedOpen((e.target as HTMLDetailsElement).open)}
      >
        <summary className={styles.advancedSummary}>
          Advanced Loop — choose start and end yourself
        </summary>
        {advancedBody}
      </details>
    </section>
  )
}
