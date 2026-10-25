import { useCallback, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import {
  listHymnTrash,
  permanentlyDeleteHymnContent,
  reassignAndDeleteZemari,
  restoreHymnContent,
  type HymnTrashItem,
} from '../../lib/cms/contentTrashService'
import { listZemaris } from '../../lib/cms/zemariAdminService'
import { useAsync } from '../../lib/cms/useAsync'
import { AsyncNotice } from './AdminUi'
import s from './Admin.module.css'

const typeLabels: Record<HymnTrashItem['type'], string> = {
  mezmur: 'Mezmur',
  zemari: 'Zemari',
  collection: 'Collection',
  section: 'Hymn section',
}

export function HymnTrashAdmin() {
  const { profile } = useAuth()
  const isAdmin = profile?.role === 'admin' || profile?.role === 'super_admin'
  const isSuperAdmin = profile?.role === 'super_admin'
  const result = useAsync(useCallback(() => listHymnTrash(), []))
  const zemaris = useAsync(useCallback(() => listZemaris({ status: 'all' }), []))
  const [message, setMessage] = useState('')
  const [error, setError] = useState('')
  const [busyKey, setBusyKey] = useState('')
  const [replacementBySource, setReplacementBySource] = useState<Record<string, string>>({})
  const availableTargets = useMemo(
    () => (zemaris.data || []).filter((row) => !row.deleted_at),
    [zemaris.data],
  )

  async function run(item: HymnTrashItem, action: 'restore' | 'delete' | 'reassign') {
    if (!isAdmin) {
      setError('You do not have permission to manage Trash.')
      return
    }
    if (action === 'delete') {
      const confirmed = window.confirm(
        `Permanently delete “${item.title}”? This cannot be undone. Type-level relationships belonging only to this record will also be removed.`,
      )
      if (!confirmed) return
    }
    const replacement = replacementBySource[item.key]
    if (action === 'reassign' && !replacement) {
      setError('Choose a replacement Zemari before reassigning Mezmurs.')
      return
    }
    if (action === 'reassign') {
      const target = availableTargets.find((row) => row.id === replacement)
      const confirmed = window.confirm(
        `Reassign ${item.associatedMezmurCount} Mezmur${item.associatedMezmurCount === 1 ? '' : 's'} from “${item.title}” to “${target?.name || 'the selected Zemari'}”, then permanently delete “${item.title}”? This cannot be undone.`,
      )
      if (!confirmed) return
    }
    setBusyKey(`${item.type}:${item.key}`)
    setMessage('')
    setError('')
    try {
      if (action === 'restore') {
        await restoreHymnContent(item.type, item.key)
        setMessage(`${item.title} was restored as a draft.`)
      } else if (action === 'reassign') {
        await reassignAndDeleteZemari(item.key, replacement)
        setMessage(`${item.title} was permanently deleted after its Mezmurs were reassigned.`)
      } else {
        await permanentlyDeleteHymnContent(item.type, item.key)
        setMessage(`${item.title} was permanently deleted.`)
      }
      result.reload()
      zemaris.reload()
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Unable to complete the Trash operation.')
    } finally {
      setBusyKey('')
    }
  }

  return (
    <>
      <div className={s.heading}>
        <div>
          <p className={s.eyebrow}>CONTENT RECOVERY</p>
          <h1>Trash</h1>
          <p className={s.muted}>የተሰረዙ ይዘቶች · Restore content or permanently delete it with Super Admin authorization.</p>
        </div>
        <Link to="/admin/hymns/mezmur">← Mezmur library</Link>
      </div>

      {!isAdmin ? <p role="alert" className={s.error}>An admin or super admin role is required to manage Trash.</p> : null}
      {message ? <p role="status" className={s.success}>{message}</p> : null}
      {error ? <p role="alert" className={s.error}>{error}</p> : null}
      <AsyncNotice {...result} retry={result.reload} />
      <AsyncNotice {...zemaris} retry={zemaris.reload} />

      {result.data && result.data.length === 0 ? (
        <div className={s.card}>Trash is empty.</div>
      ) : null}

      <div className={s.stack}>
        {result.data?.map((item) => {
          const operationKey = `${item.type}:${item.key}`
          const busy = busyKey === operationKey
          const zemariHasLinks = item.type === 'zemari' && item.associatedMezmurCount > 0
          return (
            <article className={s.card} key={operationKey}>
              <div className={s.heading} style={{ marginBottom: 12 }}>
                <div>
                  <p className={s.eyebrow}>{typeLabels[item.type]}</p>
                  <h2>{item.title}</h2>
                  <p className={s.muted}>
                    {item.slug ? <><code>{item.slug}</code> · </> : null}
                    Previous status: {item.previousStatus || 'unknown'} · Deleted {new Date(item.deletedAt).toLocaleString()}
                    {item.deletedBy ? ` · By ${item.deletedBy}` : ''}
                  </p>
                  {item.type === 'zemari' ? (
                    <p className={zemariHasLinks ? s.warn : s.muted}>
                      {item.title} has {item.associatedMezmurCount} associated Mezmur{item.associatedMezmurCount === 1 ? '' : 's'}.
                    </p>
                  ) : null}
                </div>
                <div className={s.actions}>
                  {isAdmin ? (
                    <button type="button" disabled={Boolean(busyKey)} onClick={() => void run(item, 'restore')}>
                      {busy ? 'Working…' : 'Restore as Draft'}
                    </button>
                  ) : null}
                  {isSuperAdmin && !zemariHasLinks ? (
                    <button type="button" className={s.danger} disabled={Boolean(busyKey)} onClick={() => void run(item, 'delete')}>
                      Delete Permanently
                    </button>
                  ) : null}
                </div>
              </div>

              {isSuperAdmin && zemariHasLinks ? (
                <div className={s.inlineFields}>
                  <label>
                    Reassign associated Mezmurs
                    <select
                      aria-label={`Replacement Zemari for ${item.title}`}
                      value={replacementBySource[item.key] || ''}
                      onChange={(event) => setReplacementBySource((current) => ({
                        ...current,
                        [item.key]: event.target.value,
                      }))}
                    >
                      <option value="">Choose a verified active Zemari…</option>
                      {availableTargets
                        .filter((target) => target.id !== item.key)
                        .map((target) => <option value={target.id} key={target.id}>{target.name}</option>)}
                    </select>
                  </label>
                  <div className={s.actions}>
                    <button
                      type="button"
                      className={s.danger}
                      disabled={Boolean(busyKey) || !replacementBySource[item.key]}
                      onClick={() => void run(item, 'reassign')}
                    >
                      Reassign and Delete Permanently
                    </button>
                  </div>
                </div>
              ) : null}
            </article>
          )
        })}
      </div>
    </>
  )
}
