import { useCallback, useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { listMezmur, errorMessage, type Mezmur } from '../../lib/cms/mezmurService'
import { listSubmissions } from '../../lib/cms/submissionService'
import {
  fetchReviewsForContent,
  getReviewNote,
  resolveReviewStatus,
  type AdminContentReviewRecord,
} from '../../lib/cms/adminContentReviewService'
import { useAsync } from '../../lib/cms/useAsync'
import { AdminContentReviewTag } from '../../components/admin/AdminContentReviewTag'
import { ADMIN_PATHS } from './adminPaths'
import { AsyncNotice, Status } from './AdminUi'
import s from './Admin.module.css'

export function HymnsReviewQueue() {
  const { profile } = useAuth()
  const staff = profile?.role === 'editor' || profile?.role === 'admin' || profile?.role === 'super_admin'
  const [reviewsMap, setReviewsMap] = useState<Map<string, AdminContentReviewRecord>>(new Map())

  const drafts = useAsync(
    useCallback(() => listMezmur({ status: 'draft', page: 1 }), []),
  )
  const submissions = useAsync(
    useCallback(() => listSubmissions('', '', 'mezmur', 1), []),
  )

  useEffect(() => {
    const rows = drafts.data?.rows || []
    if (!rows.length) return
    const ids = rows.map((row) => row.import_id)
    const aliases = new Map(rows.map((row) => [row.import_id, [row.id, row.mezmur_id, row.slug]]))
    fetchReviewsForContent('mezmur', ids, aliases)
      .then(setReviewsMap)
      .catch(() => undefined)
  }, [drafts.data?.rows])

  useEffect(() => {
    const onUpdate = (event: Event) => {
      const custom = event as CustomEvent<AdminContentReviewRecord>
      if (custom.detail?.content_type === 'mezmur') {
        setReviewsMap((prev) => {
          const next = new Map(prev)
          next.set(custom.detail.content_id, custom.detail)
          return next
        })
      }
    }
    window.addEventListener('td:admin-review-updated', onUpdate)
    return () => window.removeEventListener('td:admin-review-updated', onUpdate)
  }, [])

  const draftRows: Mezmur[] = drafts.data?.rows || []
  const pendingSubmissions = (submissions.data?.rows || []).filter(
    (item) => item.status === 'submitted' || item.status === 'under_review' || item.status === 'needs_changes',
  )

  return (
    <div className={s.stack}>
      <div className={s.heading}>
        <div>
          <p className={s.eyebrow}>HYMNS PRACTICE · REVIEW</p>
          <h1>Review Queue</h1>
          <p className={s.muted}>
            Review unpublished Mezmur drafts and community Mezmur submissions before publishing.
          </p>
        </div>
        <div className={s.actions}>
          <button
            type="button"
            onClick={() => {
              drafts.reload()
              submissions.reload()
            }}
          >
            Refresh
          </button>
          <Link to={`${ADMIN_PATHS.hymnsMezmur}/new`} className={s.primary}>
            + Add Mezmur
          </Link>
        </div>
      </div>

      <section className={s.card}>
        <div className={s.sectionHeading}>
          <div>
            <h2>Unpublished Mezmur drafts</h2>
            <span className={s.muted}>{drafts.data ? `${drafts.data.count} total` : '…'}</span>
          </div>
          <p>Draft hymns stay private until reviewed and published.</p>
        </div>
        <AsyncNotice {...drafts} retry={drafts.reload} />
        {drafts.data ? (
          draftRows.length ? (
            <div className={s.tableWrap} style={{ marginTop: 12 }}>
              <table>
                <thead>
                  <tr>
                    <th>Title</th>
                    <th>Language</th>
                    <th>Status</th>
                    <th>Editorial Review</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  {draftRows.slice(0, 15).map((row) => {
                    return (
                      <tr key={row.id}>
                        <td>
                          <strong>{row.transliteration_title || row.title}</strong>
                          {row.title_amharic ? <div lang="am" className={s.muted}>{row.title_amharic}</div> : null}
                        </td>
                        <td>{row.language || '—'}</td>
                        <td><Status value={row.status} /></td>
                        <td>
                          <AdminContentReviewTag
                            contentType="mezmur"
                            contentId={row.id}
                            currentStatus={resolveReviewStatus(row.import_id, reviewsMap)}
                            currentNote={getReviewNote(row.import_id, reviewsMap)}
                            onStatusChange={(newStatus, newNote) => {
                              setReviewsMap((prev) => {
                                const next = new Map(prev)
                                next.set(row.import_id, {
                                  content_type: 'mezmur',
                                  content_id: row.import_id,
                                  review_status: newStatus,
                                  review_note: newNote,
                                  created_at: '',
                                  updated_at: '',
                                })
                                return next
                              })
                            }}
                          />
                        </td>
                        <td>
                          <Link to={`${ADMIN_PATHS.hymnsMezmur}/${row.id}/edit`}>Edit &amp; review</Link>
                        </td>
                      </tr>
                    )
                  })}
                </tbody>
              </table>
            </div>
          ) : (
            <p className={s.muted} style={{ marginTop: 12 }}>No unpublished Mezmur drafts right now.</p>
          )
        ) : null}
        {drafts.data && drafts.data.count > 15 ? (
          <p style={{ marginTop: 12 }}>
            <Link to={`${ADMIN_PATHS.hymnsMezmur}?status=draft`}>
              View all {drafts.data.count} draft Mezmurs →
            </Link>
          </p>
        ) : null}
      </section>

      <section className={s.card}>
        <div className={s.sectionHeading}>
          <div>
            <h2>Community Mezmur submissions</h2>
            <span className={s.muted}>{pendingSubmissions.length} pending</span>
          </div>
          <p>Verify community-submitted lyrics and attribution before creating a draft.</p>
        </div>
        <AsyncNotice {...submissions} retry={submissions.reload} />
        {submissions.data ? (
          pendingSubmissions.length ? (
            <div className={s.tableWrap} style={{ marginTop: 12 }}>
              <table>
                <thead>
                  <tr>
                    <th>Date</th>
                    <th>Title</th>
                    <th>Contributor</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  {pendingSubmissions.map((item) => (
                    <tr key={item.id}>
                      <td>{new Date(item.created_at).toLocaleDateString()}</td>
                      <td>{item.title}</td>
                      <td>{item.contributor_name}</td>
                      <td><Status value={item.status} /></td>
                      <td>
                        <Link to={`/admin/submissions/${item.id}`}>Review submission</Link>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          ) : (
            <p className={s.muted} style={{ marginTop: 12 }}>
              No pending community Mezmur submissions.{' '}
              <Link to={`${ADMIN_PATHS.submissions}?type=mezmur`}>View submission history →</Link>
            </p>
          )
        ) : null}
        {submissions.error ? (
          <p className={s.muted}>{errorMessage(submissions.error)}</p>
        ) : null}
      </section>

      {staff ? (
        <details className={s.advanced}>
          <summary>
            Advanced batch audit tools <span>Offline JSON batches</span>
          </summary>
          <div className={s.advancedBody}>
            <p className={s.muted}>
              For reviewers working with exported catalog or duplicate-detection batch files.
            </p>
            <div className={s.actions}>
              <Link to="/admin/hymns/mezmur/editorial">Batch Editorial Audit</Link>
              <Link to="/admin/hymns/mezmur/versions">Version &amp; Duplicate Audit</Link>
            </div>
          </div>
        </details>
      ) : null}
    </div>
  )
}
