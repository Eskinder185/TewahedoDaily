import { useCallback, useMemo, useState } from 'react'
import { Link, useNavigate, useParams, useSearchParams } from 'react-router-dom'
import { useAsync } from '../../lib/cms/useAsync'
import {
  GUIDE_REVIEW_STATUSES,
  deletePrayerGuideSection,
  emptyGuideInput,
  emptySectionInput,
  errorMessage,
  getPrayerGuideAdmin,
  guideToInput,
  importBundledPrayerGuidesSeed,
  listPrayerGuidesAdmin,
  savePrayerGuide,
  savePrayerGuideSection,
  sectionToInput,
  slugify,
  statuses,
  type PrayerGuideInput,
  type PrayerGuideReviewStatus,
  type PrayerGuideSectionInput,
} from '../../lib/cms/prayerGuideAdminService'
import { prayerGuidePath } from '../../lib/prayers/prayerGuides'
import { AsyncNotice, Status } from './AdminUi'
import s from './Admin.module.css'

function formatUpdated(iso: string) {
  try {
    return new Date(iso).toLocaleString(undefined, {
      dateStyle: 'medium',
      timeStyle: 'short',
    })
  } catch {
    return iso
  }
}

export function PrayerGuidesAdmin() {
  const result = useAsync(useCallback(() => listPrayerGuidesAdmin(), []))
  const [importBusy, setImportBusy] = useState(false)
  const [importMessage, setImportMessage] = useState('')
  const [importError, setImportError] = useState('')

  async function runImport() {
    setImportBusy(true)
    setImportError('')
    setImportMessage('')
    try {
      const imported = await importBundledPrayerGuidesSeed()
      setImportMessage(
        `Imported ${imported.guides} guide(s) and ${imported.sections} section(s) from the bundled CSV seed.`,
      )
      result.reload()
    } catch (cause) {
      setImportError(errorMessage(cause))
    } finally {
      setImportBusy(false)
    }
  }

  return (
    <>
      <div className={s.heading}>
        <div>
          <p className={s.eyebrow}>EDITING: PRAY</p>
          <h1>Learning / Guides</h1>
          <p className={s.muted}>
            Educational Pray guides (not prayer books). English translations may remain marked for
            review while published.
          </p>
        </div>
        <div className={s.rowActions}>
          <button type="button" className={s.secondary} disabled={importBusy} onClick={() => void runImport()}>
            {importBusy ? 'Importing…' : 'Import CSV seed'}
          </button>
          <Link className={s.primary} to="/admin/pray/guides/new">
            + New Guide
          </Link>
        </div>
      </div>

      {importError ? (
        <p role="alert" className={s.error}>
          {importError}
        </p>
      ) : null}
      {importMessage ? (
        <p role="status" className={s.success}>
          {importMessage}
        </p>
      ) : null}

      <AsyncNotice {...result} retry={result.reload} />

      {result.data ? (
        <div className={s.tableWrap}>
          <table className={s.table}>
            <thead>
              <tr>
                <th>Title</th>
                <th>Status</th>
                <th>Sections</th>
                <th>Review issues</th>
                <th>Last updated</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {result.data.length === 0 ? (
                <tr>
                  <td colSpan={6} className={s.muted}>
                    No guides yet. Import the CSV or create one.
                  </td>
                </tr>
              ) : (
                result.data.map((guide) => (
                  <tr key={guide.id}>
                    <td>
                      <strong>{guide.title}</strong>
                      {guide.titleAmharic ? (
                        <div className={s.muted} lang="am">
                          {guide.titleAmharic}
                        </div>
                      ) : null}
                      <div className={s.muted}>{guide.slug}</div>
                    </td>
                    <td>
                      <Status value={guide.status} />
                    </td>
                    <td>{guide.sectionCount}</td>
                    <td>
                      {guide.reviewIssueCount > 0 ? (
                        <span className={s.warn}>{guide.reviewIssueCount} need review</span>
                      ) : (
                        <span className={s.muted}>0</span>
                      )}
                    </td>
                    <td>{formatUpdated(guide.updatedAt)}</td>
                    <td className={s.rowActions}>
                      <Link to={`/admin/pray/guides/${guide.id}/edit`}>Edit</Link>
                      {guide.status === 'published' ? (
                        <a href={prayerGuidePath(guide.slug)} target="_blank" rel="noreferrer">
                          Preview
                        </a>
                      ) : (
                        <span className={s.muted}>Draft</span>
                      )}
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      ) : null}
    </>
  )
}

export function PrayerGuideEditor() {
  const { id } = useParams()
  const navigate = useNavigate()
  const isNew = !id || id === 'new'
  const [params, setParams] = useSearchParams()
  const reviewFilter = (params.get('review') || 'all') as
    | 'all'
    | 'needs_review'
    | 'reviewed'
    | 'draft'
  const [message, setMessage] = useState('')
  const [error, setError] = useState('')
  const [busy, setBusy] = useState(false)
  const [guideForm, setGuideForm] = useState<PrayerGuideInput>(emptyGuideInput())
  const [guideId, setGuideId] = useState<string | null>(isNew ? null : id)
  const [editingSectionId, setEditingSectionId] = useState<string | null>(null)
  const [sectionForm, setSectionForm] = useState<PrayerGuideSectionInput>(emptySectionInput())

  const result = useAsync(
    useCallback(async () => {
      if (isNew) return null
      const guide = await getPrayerGuideAdmin(id!)
      if (!guide) throw new Error('Guide not found.')
      setGuideId(guide.id)
      setGuideForm(guideToInput(guide))
      return guide
    }, [id, isNew]),
  )

  const sections = useMemo(() => {
    const list = result.data?.sections || []
    if (reviewFilter === 'all') return list
    return list.filter((section) => section.reviewStatus === reviewFilter)
  }, [result.data, reviewFilter])

  async function saveGuide() {
    setBusy(true)
    setError('')
    setMessage('')
    try {
      const saved = await savePrayerGuide(guideId, {
        ...guideForm,
        slug: guideForm.slug || slugify(guideForm.title),
      })
      setGuideId(saved.id)
      setGuideForm(guideToInput(saved))
      setMessage('Guide saved.')
      if (isNew) navigate(`/admin/pray/guides/${saved.id}/edit`, { replace: true })
      else result.reload()
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  function startNewSection() {
    const nextOrder = (result.data?.sections.length || 0) + 1
    setEditingSectionId('new')
    setSectionForm(emptySectionInput(nextOrder))
  }

  function startEditSection(sectionId: string) {
    const section = result.data?.sections.find((item) => item.id === sectionId)
    if (!section) return
    setEditingSectionId(section.id)
    setSectionForm(sectionToInput(section))
  }

  async function saveSection() {
    if (!guideId) {
      setError('Save the guide first, then add sections.')
      return
    }
    setBusy(true)
    setError('')
    setMessage('')
    try {
      await savePrayerGuideSection(
        guideId,
        editingSectionId === 'new' ? null : editingSectionId,
        {
          ...sectionForm,
          slug: sectionForm.slug || slugify(sectionForm.title),
        },
      )
      setEditingSectionId(null)
      setMessage('Section saved.')
      result.reload()
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  async function removeSection(sectionId: string) {
    if (!window.confirm('Delete this section?')) return
    setBusy(true)
    setError('')
    try {
      await deletePrayerGuideSection(sectionId)
      setMessage('Section deleted.')
      if (editingSectionId === sectionId) setEditingSectionId(null)
      result.reload()
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  return (
    <>
      <div className={s.heading}>
        <div>
          <p className={s.eyebrow}>EDITING: PRAY · GUIDES</p>
          <h1>{isNew ? 'New guide' : guideForm.title || 'Edit guide'}</h1>
          <p className={s.muted}>
            <Link to="/admin/pray/guides">← All guides</Link>
            {guideId && guideForm.status === 'published' ? (
              <>
                {' · '}
                <a href={prayerGuidePath(guideForm.slug)} target="_blank" rel="noreferrer">
                  Public preview
                </a>
              </>
            ) : null}
          </p>
        </div>
      </div>

      <AsyncNotice {...result} retry={result.reload} />
      {error ? (
        <p role="alert" className={s.error}>
          {error}
        </p>
      ) : null}
      {message ? (
        <p role="status" className={s.success}>
          {message}
        </p>
      ) : null}

      <form
        className={s.fields}
        onSubmit={(event) => {
          event.preventDefault()
          void saveGuide()
        }}
      >
        <fieldset disabled={busy}>
          <label>
            Title (English)
            <input
              value={guideForm.title}
              onChange={(e) => {
                const title = e.target.value
                setGuideForm((prev) => ({
                  ...prev,
                  title,
                  slug: prev.slug || slugify(title),
                }))
              }}
              required
            />
          </label>
          <label>
            Title (Amharic)
            <input
              lang="am"
              value={guideForm.title_amharic}
              onChange={(e) => setGuideForm((prev) => ({ ...prev, title_amharic: e.target.value }))}
            />
          </label>
          <label>
            Slug
            <input
              value={guideForm.slug}
              onChange={(e) =>
                setGuideForm((prev) => ({ ...prev, slug: slugify(e.target.value) || e.target.value }))
              }
              required
            />
          </label>
          <label>
            Summary (English)
            <textarea
              rows={3}
              value={guideForm.summary}
              onChange={(e) => setGuideForm((prev) => ({ ...prev, summary: e.target.value }))}
            />
          </label>
          <label>
            Summary (Amharic)
            <textarea
              lang="am"
              rows={3}
              value={guideForm.summary_amharic}
              onChange={(e) =>
                setGuideForm((prev) => ({ ...prev, summary_amharic: e.target.value }))
              }
            />
          </label>
          <label>
            Source
            <input
              value={guideForm.source_title}
              onChange={(e) => setGuideForm((prev) => ({ ...prev, source_title: e.target.value }))}
            />
          </label>
          <label>
            Source reference
            <input
              value={guideForm.source_reference}
              onChange={(e) =>
                setGuideForm((prev) => ({ ...prev, source_reference: e.target.value }))
              }
            />
          </label>
          <div className={s.inlineFields}>
            <label>
              Status
              <select
                value={guideForm.status}
                onChange={(e) =>
                  setGuideForm((prev) => ({
                    ...prev,
                    status: e.target.value as PrayerGuideInput['status'],
                  }))
                }
              >
                {statuses.map((status) => (
                  <option key={status} value={status}>
                    {status}
                  </option>
                ))}
              </select>
            </label>
            <label>
              Review status
              <select
                value={guideForm.review_status}
                onChange={(e) =>
                  setGuideForm((prev) => ({
                    ...prev,
                    review_status: e.target.value as PrayerGuideReviewStatus,
                  }))
                }
              >
                {GUIDE_REVIEW_STATUSES.map((status) => (
                  <option key={status} value={status}>
                    {status}
                  </option>
                ))}
              </select>
            </label>
            <label>
              Sort order
              <input
                type="number"
                value={guideForm.sort_order}
                onChange={(e) =>
                  setGuideForm((prev) => ({
                    ...prev,
                    sort_order: Number(e.target.value) || 0,
                  }))
                }
              />
            </label>
          </div>
          <button className={s.primary} type="submit" disabled={busy}>
            {busy ? 'Saving…' : 'Save guide'}
          </button>
        </fieldset>
      </form>

      {!isNew && guideId ? (
        <section className={s.panel} style={{ marginTop: '1.5rem' }}>
          <div className={s.heading}>
            <div>
              <h2>Sections</h2>
              <p className={s.muted}>Ordered reading sections. Filter by translation review state.</p>
            </div>
            <button type="button" className={s.primary} onClick={startNewSection} disabled={busy}>
              + Section
            </button>
          </div>

          <div className={s.filters}>
            {(['all', 'needs_review', 'reviewed', 'draft'] as const).map((value) => (
              <button
                key={value}
                type="button"
                className={reviewFilter === value ? s.primary : s.secondary}
                onClick={() => setParams(value === 'all' ? {} : { review: value })}
              >
                {value === 'all' ? 'All' : value === 'needs_review' ? 'Needs Review' : value === 'reviewed' ? 'Reviewed' : 'Draft'}
              </button>
            ))}
          </div>

          <ul className={s.list}>
            {sections.map((section) => (
              <li key={section.id} className={s.listItem}>
                <div>
                  <strong>
                    {section.sortOrder}. {section.title}
                  </strong>
                  {section.titleAmharic ? (
                    <div className={s.muted} lang="am">
                      {section.titleAmharic}
                    </div>
                  ) : null}
                  <div className={s.muted}>
                    slug: {section.slug} · review: {section.reviewStatus}
                    {section.reviewNotes ? ` · ${section.reviewNotes}` : ''}
                  </div>
                </div>
                <div className={s.rowActions}>
                  <button type="button" onClick={() => startEditSection(section.id)}>
                    Edit
                  </button>
                  <button type="button" onClick={() => void removeSection(section.id)}>
                    Delete
                  </button>
                </div>
              </li>
            ))}
            {sections.length === 0 ? (
              <li className={s.muted}>No sections in this filter.</li>
            ) : null}
          </ul>

          {editingSectionId ? (
            <form
              className={s.fields}
              onSubmit={(event) => {
                event.preventDefault()
                void saveSection()
              }}
            >
              <h3>{editingSectionId === 'new' ? 'New section' : 'Edit section'}</h3>
              <fieldset disabled={busy}>
                <label>
                  English title
                  <input
                    value={sectionForm.title}
                    onChange={(e) => {
                      const title = e.target.value
                      setSectionForm((prev) => ({
                        ...prev,
                        title,
                        slug: prev.slug || slugify(title),
                      }))
                    }}
                    required
                  />
                </label>
                <label>
                  Amharic title
                  <input
                    lang="am"
                    value={sectionForm.title_amharic}
                    onChange={(e) =>
                      setSectionForm((prev) => ({ ...prev, title_amharic: e.target.value }))
                    }
                  />
                </label>
                <label>
                  Slug (CSV section_key)
                  <input
                    value={sectionForm.slug}
                    onChange={(e) =>
                      setSectionForm((prev) => ({
                        ...prev,
                        slug: slugify(e.target.value) || e.target.value,
                      }))
                    }
                    required
                  />
                </label>
                <label>
                  English body
                  <textarea
                    rows={8}
                    value={sectionForm.body_english}
                    onChange={(e) =>
                      setSectionForm((prev) => ({ ...prev, body_english: e.target.value }))
                    }
                  />
                </label>
                <label>
                  Amharic body
                  <textarea
                    lang="am"
                    rows={8}
                    value={sectionForm.body_amharic}
                    onChange={(e) =>
                      setSectionForm((prev) => ({ ...prev, body_amharic: e.target.value }))
                    }
                  />
                </label>
                <div className={s.inlineFields}>
                  <label>
                    Sort order
                    <input
                      type="number"
                      value={sectionForm.sort_order}
                      onChange={(e) =>
                        setSectionForm((prev) => ({
                          ...prev,
                          sort_order: Number(e.target.value) || 0,
                        }))
                      }
                    />
                  </label>
                  <label>
                    Review status
                    <select
                      value={sectionForm.review_status}
                      onChange={(e) =>
                        setSectionForm((prev) => ({
                          ...prev,
                          review_status: e.target.value as PrayerGuideReviewStatus,
                        }))
                      }
                    >
                      {GUIDE_REVIEW_STATUSES.map((status) => (
                        <option key={status} value={status}>
                          {status}
                        </option>
                      ))}
                    </select>
                  </label>
                </div>
                <label>
                  Source / reference
                  <input
                    value={sectionForm.source_reference}
                    onChange={(e) =>
                      setSectionForm((prev) => ({ ...prev, source_reference: e.target.value }))
                    }
                  />
                </label>
                <label>
                  Review notes
                  <textarea
                    rows={3}
                    value={sectionForm.review_notes}
                    onChange={(e) =>
                      setSectionForm((prev) => ({ ...prev, review_notes: e.target.value }))
                    }
                  />
                </label>
                <div className={s.rowActions}>
                  <button className={s.primary} type="submit" disabled={busy}>
                    Save section
                  </button>
                  <button type="button" onClick={() => setEditingSectionId(null)}>
                    Cancel
                  </button>
                </div>
              </fieldset>
            </form>
          ) : null}
        </section>
      ) : null}
    </>
  )
}
