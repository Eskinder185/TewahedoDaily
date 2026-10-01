import { useCallback, useEffect, useRef, useState } from 'react'
import { Link, useBlocker, useLocation, useNavigate, useParams } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import type { ContentStatus } from '../../lib/supabase/cms.types'
import {
  editable,
  emptyMezmur,
  errorMessage,
  getMezmur,
  getTagIds,
  getTaxonomy,
  getVersions,
  label,
  parseVersion,
  saveMezmur,
  slugify,
  type Mezmur,
  type MezmurInput,
  type Version,
} from '../../lib/cms/mezmurService'
import { uploadMezmurFile, validateFile } from '../../lib/cms/mediaService'
import { MediaPicker } from '../../components/admin/MediaPicker'
import { useAsync } from '../../lib/cms/useAsync'
import { ADMIN_PATHS } from './adminPaths'
import { AsyncNotice, Media, MezmurPreview, Modal, Status } from './AdminUi'
import s from './Admin.module.css'

type FieldErrors = Partial<
  Record<'title' | 'title_amharic' | 'slug' | 'lyrics_amharic' | 'transliteration', string>
>

type EditorData = { row?: Mezmur | null; tags: string[]; taxonomy: Awaited<ReturnType<typeof getTaxonomy>> }

function validatePublishFields(input: MezmurInput): { blocking: string; errors: FieldErrors } {
  const errors: FieldErrors = {}
  if (!input.title.trim()) errors.title = 'Transliteration title is required to publish.'
  if (!/^[a-z0-9]+(-[a-z0-9]+)*$/.test(input.slug)) {
    errors.slug = 'Slug is required and must contain lowercase English letters, numbers, and single hyphens.'
  }
  if (!input.lyrics_amharic?.trim()) errors.lyrics_amharic = 'Amharic lyrics are required to publish.'
  if (!input.title_amharic?.trim()) errors.title_amharic = 'Amharic title is strongly recommended before publishing.'
  if (!input.transliteration?.trim()) {
    errors.transliteration = 'Transliteration lyrics are strongly recommended before publishing.'
  }

  const blocking =
    errors.title || errors.slug || errors.lyrics_amharic
      ? [errors.title, errors.slug, errors.lyrics_amharic].filter(Boolean).join(' ')
      : ''
  return { blocking, errors }
}

function validateMedia(input: MezmurInput, row?: Mezmur): string {
  if (input.youtube_url) {
    try {
      const url = new URL(input.youtube_url)
      if (
        url.protocol !== 'https:' ||
        !['youtube.com', 'www.youtube.com', 'm.youtube.com', 'youtu.be'].includes(url.hostname)
      ) {
        return 'Enter an HTTPS YouTube or youtu.be URL.'
      }
    } catch {
      return 'Enter a valid YouTube URL.'
    }
  }
  for (const [value, bucket] of [
    [input.audio_url, 'mezmur-audio'],
    [input.thumbnail_url, 'mezmur-images'],
  ] as const) {
    if (
      value?.startsWith('storage://') &&
      (!row || !value.startsWith(`storage://${bucket}/mezmur/${row.id}/`) || !value.split('/').at(-1))
    ) {
      return 'Use a file uploaded to this mezmur, or an HTTPS media URL.'
    }
    if (value && !value.startsWith('storage://')) {
      try {
        if (new URL(value).protocol !== 'https:') return 'Media links must use HTTPS.'
      } catch {
        return 'Enter a valid media URL.'
      }
    }
  }
  return ''
}

export function MezmurEditor() {
  const { id } = useParams()
  const result = useAsync(
    useCallback(async (): Promise<EditorData> => {
      const taxonomy = await getTaxonomy()
      if (!id) return { taxonomy, row: undefined, tags: [] }
      const row = await getMezmur(id)
      const tags = row ? await getTagIds(row.id) : []
      if (import.meta.env.DEV) {
        console.debug('[MezmurEditor] load', {
          routeId: id,
          loadedDatabaseId: row?.id ?? null,
          updated_at: row?.updated_at ?? null,
        })
      }
      return { taxonomy, row, tags }
    }, [id]),
  )

  if (!result.loading && !result.error && id && result.data && !result.data.row) {
    return (
      <div className={s.heading}>
        <div>
          <h1>Mezmur not found</h1>
          <p className={s.muted}>This Mezmur no longer exists. Return to the library or create a new draft.</p>
          <p>
            <Link to={ADMIN_PATHS.hymnsMezmur}>Back to Mezmur Library</Link>
            {' · '}
            <Link to={`${ADMIN_PATHS.hymnsMezmur}/new`}>Create New</Link>
          </p>
        </div>
      </div>
    )
  }

  return (
    <>
      <AsyncNotice {...result} retry={result.reload} />
      {result.data && (result.data.row || !id) && (
        <EditorForm key={result.data.row?.id || id || 'new'} initial={result.data} />
      )}
    </>
  )
}

function EditorForm({ initial }: { initial: EditorData }) {
  const location = useLocation()
  const { profile } = useAuth()
  const admin = profile?.role === 'admin' || profile?.role === 'super_admin'
  const staff = admin || profile?.role === 'editor'
  const [row, setRow] = useState<Mezmur | undefined>(initial.row ?? undefined)
  const [input, setInput] = useState<MezmurInput>(() => (initial.row ? editable(initial.row) : emptyMezmur()))
  const [tags, setTags] = useState(initial.tags)
  const [baseline, setBaseline] = useState(() =>
    JSON.stringify({ input: initial.row ? editable(initial.row) : emptyMezmur(), tags: initial.tags }),
  )
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [fieldErrors, setFieldErrors] = useState<FieldErrors>({})
  const [success, setSuccess] = useState(
    location.state?.saved && initial.row ? `Mezmur saved as ${label(initial.row.status)}.` : '',
  )
  const [preview, setPreview] = useState(false)
  const [historyRevision, setHistoryRevision] = useState(0)
  const navigate = useNavigate()
  const bypass = useRef(false)
  const dirty = JSON.stringify({ input, tags }) !== baseline
  const canEdit = staff || !row || (row.created_by === profile?.id && row.status === 'draft')
  const blocker = useBlocker(() => !bypass.current && (dirty || busy))

  useEffect(() => {
    const prevent = (event: BeforeUnloadEvent) => {
      if (dirty || busy) {
        event.preventDefault()
        event.returnValue = ''
      }
    }
    window.addEventListener('beforeunload', prevent)
    return () => window.removeEventListener('beforeunload', prevent)
  }, [dirty, busy])

  function set<K extends keyof MezmurInput>(key: K, value: MezmurInput[K]) {
    setInput((previous) => ({ ...previous, [key]: value }))
    setSuccess('')
    if (key in fieldErrors) {
      setFieldErrors((current) => {
        const next = { ...current }
        delete next[key as keyof FieldErrors]
        return next
      })
    }
  }

  async function save(status: ContentStatus) {
    const mediaError = validateMedia(input, row)
    if (mediaError) {
      setError(mediaError)
      return
    }

    if (status === 'published') {
      const { blocking, errors } = validatePublishFields(input)
      setFieldErrors(errors)
      if (blocking) {
        setError(blocking)
        return
      }
    } else if (!input.title.trim()) {
      setFieldErrors({ title: 'Transliteration title is required.' })
      setError('Transliteration title is required.')
      return
    } else if (input.slug && !/^[a-z0-9]+(-[a-z0-9]+)*$/.test(input.slug)) {
      setFieldErrors({ slug: 'Slug must contain lowercase English letters, numbers, and single hyphens.' })
      setError('Slug must contain lowercase English letters, numbers, and single hyphens.')
      return
    } else {
      setFieldErrors({})
    }

    if (row?.status === 'published' && status !== 'published' && !window.confirm(`Change published content to ${label(status)}? It will no longer be public.`)) {
      return
    }
    if (['archived', 'rejected'].includes(status) && row?.status !== status && !window.confirm(`${label(status)} this mezmur?`)) {
      return
    }

    const wasCreate = !row
    setBusy(true)
    setError('')
    setSuccess('')
    try {
      const saved = await saveMezmur({ ...input, status }, tags, row)
      setRow(saved)
      setInput(editable(saved))
      setBaseline(JSON.stringify({ input: editable(saved), tags }))
      setHistoryRevision((n) => n + 1)
      setFieldErrors({})
      setSuccess(`Mezmur saved as ${label(saved.status)}.`)
      if (wasCreate) {
        bypass.current = true
        navigate(`${ADMIN_PATHS.hymnsMezmur}/${saved.id}/edit`, { replace: true, state: { saved: true } })
      }
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  async function upload(file: File | undefined, kind: 'image' | 'audio') {
    if (!file || !row) return
    setError('')
    setSuccess('')
    try {
      validateFile(file, kind)
      setBusy(true)
      const reference = await uploadMezmurFile(row.id, file, kind)
      set(kind === 'image' ? 'thumbnail_url' : 'audio_url', reference)
      setSuccess('Upload complete. Save the mezmur to attach this file.')
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  function restore(version: Version) {
    const previous = parseVersion(version)
    if (!previous) {
      setError('This version cannot be restored.')
      return
    }
    if (
      !window.confirm(
        'Load this version as a draft? Unsaved form changes will be replaced. Review it, then save to apply the restoration.',
      )
    ) {
      return
    }
    setInput({ ...previous.input, status: 'draft' })
    if (previous.tags) setTags(previous.tags)
    setSuccess('Previous version loaded as a draft. Review the fields and save to apply.')
  }

  const allowedStatuses: ContentStatus[] = staff
    ? [
        'draft',
        'pending_review',
        'rejected',
        'archived',
        ...((admin && !row?.source_submission_id) || row?.status === 'pending_review' || row?.status === 'published'
          ? (['published'] as const)
          : []),
      ]
    : ['draft', 'pending_review']

  const textField = (
    key: Exclude<keyof MezmurInput, 'featured' | 'status' | 'form'>,
    title: string,
    multiline = false,
    lang?: string,
    requiredMark = false,
  ) => (
    <label key={key}>
      {title}
      {requiredMark ? ' *' : ''}
      {multiline ? (
        <textarea lang={lang} value={(input[key] as string) || ''} onChange={(e) => set(key, e.target.value)} />
      ) : (
        <input lang={lang} value={(input[key] as string) || ''} onChange={(e) => set(key, e.target.value)} />
      )}
      {fieldErrors[key as keyof FieldErrors] ? (
        <small className={key === 'title_amharic' || key === 'transliteration' ? s.muted : s.error} role="alert">
          {fieldErrors[key as keyof FieldErrors]}
        </small>
      ) : null}
    </label>
  )

  return (
    <>
      <div className={s.heading}>
        <div>
          <Link to={ADMIN_PATHS.hymnsMezmur}>← Mezmur library</Link>
          <h1>{row ? 'Edit Mezmur' : 'Add Mezmur'}</h1>
          <p className={s.muted}>
            {dirty ? 'Unsaved changes' : row ? 'All changes saved' : 'Not saved yet'}{' '}
            {row && (
              <>
                · <Status value={row.status} />
              </>
            )}
          </p>
        </div>
        <button type="button" onClick={() => setPreview(true)}>
          Preview
        </button>
      </div>
      {row?.source_submission_id && (
        <p className={s.notice}>
          Created from a community submission. Verify this draft, select official taxonomy, and submit it for final
          review before publishing. <Link to={'/admin/submissions/' + row.source_submission_id}>View submission</Link>
        </p>
      )}
      {!canEdit && (
        <p role="status" className={s.notice}>
          This content is read-only for your role. Contributors can edit only their own drafts.
        </p>
      )}
      {error && (
        <p role="alert" className={s.error}>
          {error}
        </p>
      )}
      {success && (
        <p role="status" className={s.success}>
          {success}
        </p>
      )}
      <form
        onSubmit={(event) => {
          event.preventDefault()
          void save(input.status)
        }}
      >
        <fieldset disabled={busy || !canEdit}>
          <div className={s.formGrid}>
            <div className={s.stack}>
              <section className={`${s.card} ${s.fields}`}>
                <h2>Mezmur details</h2>
                {textField('title', 'Transliteration title', false, undefined, true)}
                {textField('title_amharic', 'Amharic title', false, 'am', true)}
                <label>
                  Slug *
                  <input
                    value={input.slug}
                    onChange={(event) => set('slug', event.target.value)}
                    aria-describedby="slug-help"
                  />
                </label>
                <div className={s.actions}>
                  <small id="slug-help">Lowercase English letters, numbers, and hyphens.</small>
                  <button type="button" onClick={() => set('slug', slugify(input.title))}>
                    Generate from title
                  </button>
                </div>
                {fieldErrors.slug ? (
                  <small className={s.error} role="alert">
                    {fieldErrors.slug}
                  </small>
                ) : null}
                {textField('description', 'Description', true)}
              </section>

              <section className={`${s.card} ${s.fields}`}>
                <h2>Lyrics</h2>
                {textField('lyrics_amharic', 'Amharic lyrics', true, 'am', true)}
                {textField('transliteration', 'Transliteration lyrics', true, undefined, true)}
                {textField('lyrics_english', 'English lyrics', true, 'en')}
              </section>

              <section className={`${s.card} ${s.fields}`}>
                <h2>Media</h2>
                {textField('youtube_url', 'YouTube URL')}
                <MediaPicker
                  label="Thumbnail"
                  folder="mezmur"
                  value={input.thumbnail_path || input.thumbnail_url}
                  altText={input.image_alt}
                  onChange={({ storagePath, altText }) => {
                    set('thumbnail_path', storagePath)
                    set('image_alt', altText)
                    if (storagePath) set('thumbnail_url', storagePath)
                  }}
                />
                <label>
                  Legacy audio upload (MP3, M4A, Ogg, WAV · 50 MiB)
                  <input
                    type="file"
                    accept="audio/mpeg,audio/mp4,audio/ogg,audio/wav"
                    disabled={!row}
                    onChange={(event) => {
                      const file = event.target.files?.[0]
                      event.target.value = ''
                      void upload(file, 'audio')
                    }}
                  />
                </label>
                {!row && <p className={s.notice}>Save a draft first to enable private-bucket audio uploads.</p>}
                {input.audio_url?.startsWith('storage://') ? (
                  <p className={s.muted}>Uploaded audio attached. Choose another file to replace it.</p>
                ) : (
                  textField('audio_url', 'Audio URL')
                )}
                {input.audio_url && (
                  <div className={s.actions}>
                    <Media reference={input.audio_url} audio />
                    <button type="button" onClick={() => set('audio_url', '')}>
                      Remove audio
                    </button>
                  </div>
                )}
              </section>
            </div>

            <aside className={s.stack}>
              <section className={`${s.card} ${s.fields}`}>
                <h2>Classification</h2>
                <label>
                  Language
                  <select
                    aria-label="Language"
                    value={input.language || 'amharic'}
                    onChange={(event) => set('language', event.target.value)}
                  >
                    <option value="amharic">Amharic</option>
                    <option value="geez">Ge&apos;ez</option>
                    <option value="english">English</option>
                    <option value="oromo">Oromo</option>
                  </select>
                </label>
                <label>
                  Form
                  <select
                    aria-label="Form"
                    value={input.form || 'mezmur'}
                    onChange={(event) => set('form', event.target.value as MezmurInput['form'])}
                  >
                    <option value="mezmur">Mezmur</option>
                    <option value="werb">Werb</option>
                  </select>
                </label>
                <label>
                  Category
                  <select
                    aria-label="Category"
                    value={input.category_id || ''}
                    onChange={(event) => set('category_id', event.target.value || null)}
                  >
                    <option value="">No category</option>
                    {initial.taxonomy.categories
                      .filter((item) => (item.type === 'mezmur' && !item.is_archived) || item.id === input.category_id)
                      .map((item) => (
                        <option key={item.id} value={item.id}>
                          {item.name}
                          {item.is_archived ? ' (archived)' : ''}
                        </option>
                      ))}
                  </select>
                </label>
                <label>
                  Occasion
                  <input
                    value={input.occasion || ''}
                    onChange={(event) => set('occasion', event.target.value || null)}
                    placeholder="e.g. Fasika, Timket"
                  />
                </label>
                <label>
                  Singer
                  <select
                    aria-label="Singer"
                    value={input.singer_id || ''}
                    onChange={(event) => set('singer_id', event.target.value || null)}
                  >
                    <option value="">No singer</option>
                    {initial.taxonomy.singers
                      .filter((item) => !item.is_archived || item.id === input.singer_id)
                      .map((item) => (
                        <option key={item.id} value={item.id}>
                          {item.name}
                          {item.is_archived ? ' (archived)' : ''}
                        </option>
                      ))}
                  </select>
                </label>
                <fieldset>
                  <legend>Tags</legend>
                  {!initial.taxonomy.tags.length && <p className={s.muted}>No tags available.</p>}
                  {initial.taxonomy.tags.map((tag) => (
                    <label className={s.check} key={tag.id}>
                      <input
                        type="checkbox"
                        checked={tags.includes(tag.id)}
                        onChange={(event) =>
                          setTags((previous) =>
                            event.target.checked ? [...previous, tag.id] : previous.filter((id) => id !== tag.id),
                          )
                        }
                      />
                      {tag.name}
                    </label>
                  ))}
                </fieldset>
                {admin && <Link to="/admin/tags">Manage tags →</Link>}
              </section>

              <section className={`${s.card} ${s.fields}`}>
                <h2>Publication</h2>
                <label>
                  Status
                  <select
                    aria-label="Status"
                    value={input.status}
                    onChange={(event) => set('status', event.target.value as ContentStatus)}
                  >
                    {!allowedStatuses.includes(input.status) && (
                      <option value={input.status}>{label(input.status)}</option>
                    )}
                    {allowedStatuses.map((status) => (
                      <option key={status} value={status}>
                        {label(status)}
                      </option>
                    ))}
                  </select>
                </label>
                {staff && (
                  <label className={s.check}>
                    <input
                      type="checkbox"
                      checked={input.featured}
                      onChange={(event) => set('featured', event.target.checked)}
                    />
                    Featured
                  </label>
                )}
                {profile?.role === 'editor' && row?.status !== 'pending_review' && row?.status !== 'published' && (
                  <p className={s.muted}>Submit for review before publishing.</p>
                )}
                <p className={s.muted}>
                  Drafts may be incomplete. Publishing requires transliteration title, slug, and Amharic lyrics.
                </p>
              </section>
            </aside>
          </div>
          {canEdit && (
            <div className={s.footer}>
              <button type="button" onClick={() => void save('draft')}>
                Save Draft
              </button>
              <button type="button" onClick={() => void save('pending_review')}>
                Submit for Review
              </button>
              <button type="submit">Save changes</button>
              {staff &&
                ((admin && !row?.source_submission_id) ||
                  row?.status === 'pending_review' ||
                  row?.status === 'published') && (
                  <button className={s.primary} type="button" onClick={() => void save('published')}>
                    Publish
                  </button>
                )}
              {staff && row?.status === 'pending_review' && (
                <button type="button" onClick={() => void save('rejected')}>
                  Reject
                </button>
              )}
              {busy && <span role="status">Saving or uploading…</span>}
            </div>
          )}
        </fieldset>
      </form>
      {row && staff && (
        <VersionHistory key={`${row.id}-${historyRevision}`} id={row.id} restore={admin && canEdit && !busy ? restore : undefined} />
      )}
      {preview && (
        <Modal title="Mezmur preview" close={() => setPreview(false)}>
          <MezmurPreview item={input} />
        </Modal>
      )}
      {blocker.state === 'blocked' && (
        <Modal title="Leave without saving?" close={() => blocker.reset()}>
          <p>
            {busy
              ? 'An operation is still in progress. Wait until it finishes before leaving.'
              : 'Your unsaved changes will be lost.'}
          </p>
          <div className={s.actions}>
            <button onClick={() => blocker.reset()}>Keep editing</button>
            <button disabled={busy} onClick={() => blocker.proceed()}>
              Discard changes
            </button>
          </div>
        </Modal>
      )}
    </>
  )
}

function VersionHistory({ id, restore }: { id: string; restore?: (version: Version) => void }) {
  const result = useAsync(useCallback(() => getVersions(id), [id]))
  return (
    <section className={s.card} style={{ marginTop: 24 }}>
      <h2>Version History</h2>
      <p className={s.muted}>Latest 50 saved states. Restoration loads a draft for review before saving.</p>
      <AsyncNotice {...result} retry={result.reload} />
      {result.data?.versions.map((version) => {
        const previous = parseVersion(version)
        return (
          <details className={s.version} key={version.id}>
            <summary>
              {new Date(version.created_at).toLocaleString()} ·{' '}
              {result.data?.authors.find((author) => author.id === version.changed_by)?.display_name ||
                version.changed_by ||
                'System'}{' '}
              · {previous?.input.status ? label(previous.input.status) : 'Saved state'}
            </summary>
            <pre>{JSON.stringify(version.snapshot, null, 2)}</pre>
            {restore && previous && (
              <button type="button" onClick={() => restore(version)}>
                Restore as draft
              </button>
            )}
          </details>
        )
      })}
      {result.data && !result.data.versions.length && <p>No previous versions.</p>}
    </section>
  )
}
