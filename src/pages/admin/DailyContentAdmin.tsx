import { useCallback, useState, useEffect, useRef } from 'react'
import { useBlocker } from 'react-router-dom'
import { useAsync } from '../../lib/cms/useAsync'
import {
  getDaily,
  saveDaily,
  todayInAddis,
  type DailyContent,
} from '../../lib/cms/dailyService'
import { lookupContent } from '../../lib/cms/contentService'
import { errorMessage } from '../../lib/cms/mezmurService'
import { AsyncNotice, Modal } from './AdminUi'
import s from './Admin.module.css'

export function DailyContentAdmin() {
  const [day, setDay] = useState(todayInAddis())
  const unsaved = useRef(false)
  const trackChanges = useCallback((value: boolean) => {
    unsaved.current = value
  }, [])
  const result = useAsync(useCallback(() => getDaily(day), [day]))
  return (
    <>
      <h1>Daily content</h1>
      <p>
        Schedule editorial selections by Gregorian date in Addis Ababa time.
        Publishing a schedule never publishes its selected content.
      </p>
      <label>
        Scheduled date
        <input
          type="date"
          value={day}
          onChange={(e) => {
            if (
              e.target.value &&
              (!unsaved.current ||
                window.confirm('Discard unsaved schedule changes?'))
            )
              setDay(e.target.value)
          }}
        />
      </label>
      <AsyncNotice {...result} retry={result.reload} />
      {!result.loading && !result.error && (
        <DailyForm
          key={day}
          onDirty={trackChanges}
          initial={
            result.data || {
              content_date: day,
              mezmur_id: null,
              saint_id: null,
              feast_id: null,
              announcement: '',
              summary: '',
              published: false,
            }
          }
        />
      )}
    </>
  )
}

function DailyForm({
  initial,
  onDirty,
}: {
  initial: DailyContent
  onDirty: (value: boolean) => void
}) {
  const [item, setItem] = useState(initial)
  const [baseline, setBaseline] = useState(JSON.stringify(initial))
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [message, setMessage] = useState('')
  const dirty = JSON.stringify(item) !== baseline
  const blocker = useBlocker(dirty || busy)
  useEffect(() => {
    onDirty(dirty || busy)
    return () => onDirty(false)
  }, [dirty, busy, onDirty])
  useEffect(() => {
    const fn = (e: BeforeUnloadEvent) => {
      if (dirty || busy) {
        e.preventDefault()
        e.returnValue = ''
      }
    }
    window.addEventListener('beforeunload', fn)
    return () => window.removeEventListener('beforeunload', fn)
  }, [dirty, busy])
  async function save() {
    setBusy(true)
    setError('')
    try {
      const saved = await saveDaily(item)
      setItem(saved)
      setBaseline(JSON.stringify(saved))
      setMessage(
        'Schedule saved. Only published selections will appear publicly.',
      )
    } catch (e) {
      setError(errorMessage(e))
    } finally {
      setBusy(false)
    }
  }
  return (
    <form
      onSubmit={(e) => {
        e.preventDefault()
        void save()
      }}
    >
      {error && (
        <p role="alert" className={s.error}>
          {error}
        </p>
      )}
      {message && (
        <p role="status" className={s.success}>
          {message}
        </p>
      )}
      <fieldset disabled={busy} className={s.fields}>
        {(
          [
            ['mezmur', 'mezmur_id'],
            ['saints', 'saint_id'],
            ['feasts', 'feast_id'],
          ] as const
        ).map(([kind, field]) => (
          <Selection
            key={field}
            kind={kind}
            value={item[field]}
            onChange={(value) => setItem({ ...item, [field]: value })}
          />
        ))}
        <label>
          Summary
          <textarea
            maxLength={2000}
            value={item.summary}
            onChange={(e) => setItem({ ...item, summary: e.target.value })}
          />
        </label>
        <label>
          Homepage announcement
          <textarea
            maxLength={3000}
            value={item.announcement}
            onChange={(e) => setItem({ ...item, announcement: e.target.value })}
          />
        </label>
        <label className={s.check}>
          <input
            type="checkbox"
            checked={item.published}
            onChange={(e) => setItem({ ...item, published: e.target.checked })}
          />
          Publish this schedule
        </label>
        <button>Save schedule</button>
      </fieldset>
      {blocker.state === 'blocked' && (
        <Modal title="Discard schedule changes?" close={() => blocker.reset()}>
          <button type="button" onClick={() => blocker.reset()}>
            Keep editing
          </button>
          <button type="button" onClick={() => blocker.proceed()}>
            Discard changes
          </button>
        </Modal>
      )}
    </form>
  )
}

function Selection({
  kind,
  value,
  onChange,
}: {
  kind: 'mezmur' | 'saints' | 'feasts'
  value: string | null
  onChange: (id: string | null) => void
}) {
  const [q, setQ] = useState('')
  const result = useAsync(useCallback(() => lookupContent(kind, q), [kind, q]))
  return (
    <div>
      <label>
        Find {kind}
        <input value={q} onChange={(e) => setQ(e.target.value)} />
      </label>
      <AsyncNotice {...result} retry={result.reload} />
      <label>
        Daily {kind}
        <select
          value={value || ''}
          onChange={(e) => onChange(e.target.value || null)}
        >
          <option value="">None</option>
          {value && !result.data?.some((r) => r.id === value) && (
            <option value={value}>Current selection (not in search)</option>
          )}
          {result.data?.map((r) => (
            <option key={r.id} value={r.id}>
              {r.title}
            </option>
          ))}
        </select>
      </label>
    </div>
  )
}
