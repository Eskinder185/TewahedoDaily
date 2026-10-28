import { useCallback, useEffect, useRef, useState } from 'react'
import { Link, useBlocker, useLocation, useNavigate, useParams } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import {
  editable,
  emptyMezmur,
  errorMessage,
  getMezmur,
  getTagIds,
  getTaxonomy,
  getVersions,
  mezmurStatusLabel,
  parseVersion,
  saveMezmur,
  slugify,
  type Mezmur,
  type MezmurInput,
  type MezmurStatus,
  type Version,
} from '../../lib/cms/mezmurService'
import {
  canPublishMezmur,
} from '../../lib/cms/mezmurPublicationRules'
import {
  listAllHymnSections,
  listMezmurSectionLinks,
  setMezmurSectionLinks,
} from '../../lib/cms/hymnBrowseAdminService'
import { uploadMezmurFile, validateFile } from '../../lib/cms/mediaService'
import { normalizeMezmurLanguage } from '../../lib/mezmur/mezmurLanguage'
import { MediaPicker } from '../../components/admin/MediaPicker'
import { SearchableMultiSelect } from '../../components/admin/SearchableMultiSelect'
import { useAsync } from '../../lib/cms/useAsync'
import { CANONICAL_OCCASIONS } from '../../lib/publicContent/taxonomy'
import {
  humanizeTaxonomySlug,
  listDerivedOccasions,
  listMezmurCategoryLinks,
  listMezmurOccasionLinks,
  setMezmurClassificationLinks,
} from '../../lib/cms/hymnTaxonomyImport'
import { ADMIN_PATHS } from './adminPaths'
import { AsyncNotice, Media, MezmurPreview, Modal, Status } from './AdminUi'
import { validateMezmurTitleLyrics } from '../../lib/mezmur/titleLyricsValidation'
import s from './Admin.module.css'

type FieldErrors = Partial<
  Record<'transliteration_title' | 'title_amharic' | 'slug' | 'lyrics_amharic' | 'transliteration', string>
>

type EditorData = {
  row?: Mezmur | null
  tags: string[]
  sectionIds: string[]
  categorySlugs: string[]
  occasionSlugs: string[]
  occasions: Awaited<ReturnType<typeof listDerivedOccasions>>
  sections: Awaited<ReturnType<typeof listAllHymnSections>>
  taxonomy: Awaited<ReturnType<typeof getTaxonomy>>
}

function validatePublishFields(input: MezmurInput): { blocking: string; errors: FieldErrors } {
  const errors: FieldErrors = {}
  if (!input.transliteration_title?.trim()) errors.transliteration_title = 'Transliterated title is required to publish.'
  if (!/^[a-z0-9]+(-[a-z0-9]+)*$/.test(input.slug)) {
    errors.slug = 'Slug is required and must contain lowercase English letters, numbers, and single hyphens.'
  }
  if (!input.lyrics_amharic?.trim()) errors.lyrics_amharic = 'Amharic lyrics are required to publish.'
  if (!input.title_amharic?.trim()) errors.title_amharic = 'Amharic title is required to publish.'
  if (!input.transliteration?.trim()) {
    errors.transliteration = 'Transliteration lyrics are strongly recommended before publishing.'
  }

  const blocking =
    errors.transliteration_title || errors.slug || errors.lyrics_amharic || errors.title_amharic
      ? [errors.transliteration_title, errors.slug, errors.lyrics_amharic, errors.title_amharic].filter(Boolean).join(' ')
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

function sameSelection(left: string[], right: string[]) {
  const normalize = (values: string[]) => [...new Set(values.map((value) => value.trim()).filter(Boolean))].sort()
  return JSON.stringify(normalize(left)) === JSON.stringify(normalize(right))
}

export function MezmurEditor() {
  const { id } = useParams()
  const result = useAsync(
    useCallback(async (): Promise<EditorData> => {
      const taxonomy = await getTaxonomy()
      const [sections, occasions] = await Promise.all([
        listAllHymnSections().catch(() => []),
        listDerivedOccasions().catch(() => []),
      ])
      if (!id) return { taxonomy, row: undefined, tags: [], sectionIds: [], categorySlugs: [], occasionSlugs: [], sections, occasions }
      const row = await getMezmur(id)
      const tags = row ? await getTagIds(row.id) : []
      const sectionIds = row
        ? (await listMezmurSectionLinks(row.id).catch(() => [])).map((l) => l.section_id)
        : []
      const [categorySlugs, occasionSlugs] = row
        ? await Promise.all([
            listMezmurCategoryLinks(row.import_id).catch(() => []),
            listMezmurOccasionLinks(row.import_id).catch(() => []),
          ])
        : [[], []]
      if (import.meta.env.DEV) {
        console.debug('[MezmurEditor] load', {
          routeId: id,
          loadedDatabaseId: row?.id ?? null,
          updated_at: row?.updated_at ?? null,
        })
      }
      return { taxonomy, row, tags, sectionIds, categorySlugs, occasionSlugs, sections, occasions }
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
  const staff = canPublishMezmur(profile?.role)
  const [row, setRow] = useState<Mezmur | undefined>(initial.row ?? undefined)
  const [input, setInput] = useState<MezmurInput>(() => (initial.row ? editable(initial.row) : emptyMezmur()))
  const [tags, setTags] = useState(initial.tags)
  const [sectionIds, setSectionIds] = useState(initial.sectionIds)
  const [categorySlugs, setCategorySlugs] = useState(initial.categorySlugs)
  const [occasionSlugs, setOccasionSlugs] = useState(initial.occasionSlugs)
  const [baseline, setBaseline] = useState(() =>
    JSON.stringify({
      input: initial.row ? editable(initial.row) : emptyMezmur(),
      tags: initial.tags,
      sectionIds: initial.sectionIds,
      categorySlugs: initial.categorySlugs,
      occasionSlugs: initial.occasionSlugs,
    }),
  )
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [fieldErrors, setFieldErrors] = useState<FieldErrors>({})
  const [success, setSuccess] = useState(
    location.state?.saved && initial.row
      ? initial.row.status === 'published'
        ? 'Mezmur published successfully.'
        : 'Mezmur saved as draft.'
      : '',
  )
  const [preview, setPreview] = useState(false)
  const [historyRevision, setHistoryRevision] = useState(0)
  const navigate = useNavigate()
  const bypass = useRef(false)
  const dirty = JSON.stringify({ input, tags, sectionIds, categorySlugs, occasionSlugs }) !== baseline
  const canEdit = staff || !row || (row.created_by === profile?.id && row.status === 'draft')
  const blocker = useBlocker(() => !bypass.current && (dirty || busy))
  const currentStatus: MezmurStatus = (row?.status || input.status) === 'published' ? 'published' : 'draft'

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

  async function save(status: MezmurStatus) {
    const mediaError = validateMedia(input, row)
    if (mediaError) {
      setError(mediaError)
      return
    }

    if (status === 'published') {
      if (!staff) {
        setError('An editor, admin, or super admin role is required to publish.')
        return
      }
      const { blocking, errors } = validatePublishFields(input)
      for (const issue of validateMezmurTitleLyrics({
        title_amharic: input.title_amharic,
        transliteration_title: input.transliteration_title,
        lyrics_amharic: input.lyrics_amharic,
        lyrics_transliteration: input.transliteration,
      })) {
        if (issue.severity === 'error' && issue.field in errors) {
          errors[issue.field as keyof FieldErrors] = issue.message
        }
      }
      setFieldErrors(errors)
      const titleLyricsBlocking = Object.values(errors).filter(Boolean).join(' ')
      if (blocking || titleLyricsBlocking) {
        setError(titleLyricsBlocking || blocking)
        return
      }
    } else if (!input.transliteration_title?.trim()) {
      setFieldErrors({ transliteration_title: 'Transliterated title is required.' })
      setError('Transliterated title is required.')
      return
    } else if (input.slug && !/^[a-z0-9]+(-[a-z0-9]+)*$/.test(input.slug)) {
      setFieldErrors({ slug: 'Slug must contain lowercase English letters, numbers, and single hyphens.' })
      setError('Slug must contain lowercase English letters, numbers, and single hyphens.')
      return
    } else {
      setFieldErrors({})
    }

    const wasCreate = !row
    setBusy(true)
    setError('')
    setSuccess('')
    try {
      const primaryCategorySlug = categorySlugs[0] || null
      const selectedCategory = initial.taxonomy.categories.find((c) => c.slug === primaryCategorySlug)
      const primaryOccasionSlug = occasionSlugs[0] || null
      const payload: MezmurInput = {
        ...input,
        status,
        // Keep legacy primary fields in sync while normalized links remain authoritative.
        category_id: primaryCategorySlug,
        category: selectedCategory?.name || input.category || null,
        occasion: primaryOccasionSlug ? humanizeTaxonomySlug(primaryOccasionSlug) : null,
      }
      const saved = await saveMezmur(payload, tags, row)
      const secondaryWarnings: string[] = []
      const slugChanged = Boolean(row && row.slug !== saved.slug)
      if (wasCreate || slugChanged || !sameSelection(sectionIds, initial.sectionIds)) {
        try {
          await setMezmurSectionLinks(saved.id, sectionIds, row?.slug)
        } catch (sectionErr) {
          if (import.meta.env.DEV) console.warn('[MezmurEditor] section links', sectionErr)
          secondaryWarnings.push('hymn-section links were not updated')
        }
      }
      if (
        wasCreate ||
        slugChanged ||
        !sameSelection(categorySlugs, initial.categorySlugs) ||
        !sameSelection(occasionSlugs, initial.occasionSlugs)
      ) {
        try {
          await setMezmurClassificationLinks(saved.import_id, categorySlugs, occasionSlugs)
        } catch (classificationErr) {
          if (import.meta.env.DEV) console.warn('[MezmurEditor] classification links', classificationErr)
          secondaryWarnings.push('category/occasion links were not updated')
        }
      }
      setRow(saved)
      const savedInput = { ...editable(saved), category_id: primaryCategorySlug, category: payload.category, occasion: payload.occasion }
      setInput(savedInput)
      setBaseline(JSON.stringify({ input: savedInput, tags, sectionIds, categorySlugs, occasionSlugs }))
      setHistoryRevision((n) => n + 1)
      setFieldErrors({})
      const baseSuccess =
        saved.status === 'published'
          ? 'Mezmur published successfully.'
          : 'Mezmur saved as draft.'
      setSuccess(
        secondaryWarnings.length
          ? `${baseSuccess} However, ${secondaryWarnings.join(' and ')}; please retry saving the category, occasion, or section selections.`
          : baseSuccess,
      )
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
          void save('draft')
        }}
      >
        <fieldset disabled={busy || !canEdit}>
          <div className={s.formGrid}>
            <div className={s.stack}>
              <section className={`${s.card} ${s.fields}`}>
                <div className={s.sectionHeading}>
                  <div><span className={s.step}>1</span><h2>Basic information</h2></div>
                  <p>Names and a short description used throughout the site.</p>
                </div>
                {textField('transliteration_title', 'Transliterated title', false, undefined, true)}
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
                  <button type="button" onClick={() => set('slug', slugify(input.transliteration_title || ''))}>
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
                <div className={s.sectionHeading}>
                  <div><span className={s.step}>2</span><h2>Lyrics</h2></div>
                  <p>Write comfortably, switch languages, or open a distraction-free editor.</p>
                </div>
                <LyricsWorkspace input={input} fieldErrors={fieldErrors} onChange={set} />
              </section>

              <section className={`${s.card} ${s.fields}`}>
                <div className={s.sectionHeading}>
                  <div><span className={s.step}>4</span><h2>Media</h2></div>
                  <p>Optional audio, video, and artwork.</p>
                </div>
                {textField('youtube_url', 'YouTube URL')}
                {textField('source_url', 'Source / external link')}
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
                    className={s.fileInput}
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
                <div className={s.sectionHeading}>
                  <div><span className={s.step}>3</span><h2>Classification</h2></div>
                  <p>Choose every place this Mezmur belongs. The first selection stays primary for older views.</p>
                </div>
                <p className={s.muted} style={{ marginTop: 0, fontSize: '0.85rem' }}>
                  Browse groups are derived from these taxonomy fields — you do not assign browse
                  groups on each Mezmur.
                </p>
                <label>
                  Language
                  <select
                    aria-label="Language"
                    value={normalizeMezmurLanguage(input.language) || ''}
                    onChange={(event) => set('language', event.target.value)}
                  >
                    <option value="">Unknown / not recorded</option>
                    <option value="am">Amharic / አማርኛ</option>
                    <option value="ti">Tigrinya / ትግርኛ</option>
                    <option value="om">Oromo / Afaan Oromoo</option>
                    <option value="gez">Geʽez / ግዕዝ</option>
                    <option value="en">English</option>
                  </select>
                </label>
                <label>
                  Form (Mezmur / Wereb)
                  <select
                    aria-label="Form"
                    value={input.form || 'mezmur'}
                    onChange={(event) => set('form', event.target.value as MezmurInput['form'])}
                  >
                    <option value="mezmur">Mezmur</option>
                    <option value="werb">Wereb</option>
                  </select>
                </label>
                <SearchableMultiSelect
                  label="Categories"
                  selected={categorySlugs}
                  onChange={setCategorySlugs}
                  options={initial.taxonomy.categories
                    .filter((item) => item.type === 'mezmur' && !item.is_archived)
                    .map((item) => ({ id: item.slug, label: item.name }))}
                  placeholder="Search categories…"
                  helpText="Select one or more. The first selected category is primary."
                />
                <SearchableMultiSelect
                  label="Occasions"
                  selected={occasionSlugs}
                  onChange={setOccasionSlugs}
                  options={[
                    ...new Map<string, { id: string; label: string; count?: number }>([
                      ...CANONICAL_OCCASIONS.map((name): [string, { id: string; label: string }] => [slugify(name), { id: slugify(name), label: name }]),
                      ...initial.occasions.map((item): [string, { id: string; label: string; count: number }] => [item.slug, { id: item.slug, label: item.name, count: item.mezmur_count }]),
                    ]).values(),
                  ]}
                  placeholder="Search occasions…"
                  helpText="Existing normalized links are preserved until you save."
                />
                <label>
                  Zemari
                  <select
                    aria-label="Zemari"
                    value={input.zemari_id || input.singer_id || ''}
                    onChange={(event) => {
                      const next = event.target.value || null
                      set('zemari_id', next)
                      set('singer_id', next)
                    }}
                  >
                    <option value="">No Zemari</option>
                    {initial.taxonomy.singers
                      .filter((item) => !item.is_archived || item.id === (input.zemari_id || input.singer_id))
                      .map((item) => (
                        <option key={item.id} value={item.id}>
                          {item.name}
                          {item.name_amharic ? ` · ${item.name_amharic}` : ''}
                          {item.is_archived ? ' (archived)' : ''}
                        </option>
                      ))}
                  </select>
                </label>
                <p className={s.muted} style={{ marginTop: -8, fontSize: '0.85rem' }}>
                  Manage profiles under{' '}
                  <Link to={ADMIN_PATHS.hymnsZemaris}>Hymns · Zemaris</Link>.
                </p>
                <details className={s.advanced}>
                  <summary>Advanced: hymn sections <span>{sectionIds.length} selected</span></summary>
                  <div className={s.advancedBody}>
                    <SearchableMultiSelect
                      label="Hymn sections"
                      selected={sectionIds}
                      onChange={setSectionIds}
                      options={initial.sections.map((section) => ({
                        id: section.id,
                        label: section.title,
                        detail: section.slug,
                      }))}
                      placeholder="Search sections…"
                      helpText="Sections are independent from categories and occasions."
                    />
                  </div>
                </details>
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
                <div className={s.sectionHeading}>
                  <div><span className={s.step}>5</span><h2>Preview &amp; publication</h2></div>
                  <p>Review the unsaved form exactly as it stands, then save a draft or publish.</p>
                </div>
                <button type="button" onClick={() => setPreview(true)}>Open live preview</button>
                <p className={s.muted}>
                  CMS role: {profile?.role || 'none'} · Status: {mezmurStatusLabel(currentStatus)}
                </p>
                <p className={s.muted}>
                  Drafts are private. Publishing requires both titles, a slug, and hymn content.
                </p>
              </section>
            </aside>
          </div>
          {canEdit && (
            <div className={s.footer}>
              <button type="button" onClick={() => void save('draft')}>
                {currentStatus === 'published' ? 'Return to Draft' : 'Save Draft'}
              </button>
              {staff && (
                <button
                  className={s.primary}
                  type="button"
                  onClick={() => void save('published')}
                  disabled={busy}
                >
                  Publish
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

type LyricsKey = 'lyrics_amharic' | 'lyrics_geez' | 'lyrics_english' | 'lyrics_oromo' | 'transliteration'

const LYRIC_TABS: { key: LyricsKey; label: string; lang: string }[] = [
  { key: 'lyrics_amharic', label: 'Amharic (አማርኛ)', lang: 'am' },
  { key: 'lyrics_geez', label: 'Geʽez (ግዕዝ)', lang: 'gez' },
  { key: 'lyrics_english', label: 'English', lang: 'en' },
  { key: 'lyrics_oromo', label: 'Oromo (Afaan Oromoo)', lang: 'om' },
  { key: 'transliteration', label: 'Transliteration (በላቲን ፊደል)', lang: 'en' },
]

function LyricsWorkspace({
  input,
  fieldErrors,
  onChange,
}: {
  input: MezmurInput
  fieldErrors: FieldErrors
  onChange: <K extends keyof MezmurInput>(key: K, value: MezmurInput[K]) => void
}) {
  const [active, setActive] = useState<LyricsKey>('lyrics_amharic')
  const [expanded, setExpanded] = useState(false)
  const [draft, setDraft] = useState('')
  const current = LYRIC_TABS.find((tab) => tab.key === active) || LYRIC_TABS[0]

  function openExpanded() {
    setDraft(String(input[active] || ''))
    setExpanded(true)
  }

  return (
    <div className={s.lyricsWorkspace}>
      <div className={s.lyricsTabs} role="tablist" aria-label="Lyrics language">
        {LYRIC_TABS.map((tab) => (
          <button
            key={tab.key}
            type="button"
            role="tab"
            aria-selected={active === tab.key}
            aria-controls="lyrics-editor-panel"
            className={active === tab.key ? s.lyricsTabActive : ''}
            onClick={() => setActive(tab.key)}
            onKeyDown={(event) => {
              if (event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') return
              event.preventDefault()
              const index = LYRIC_TABS.findIndex((item) => item.key === active)
              const direction = event.key === 'ArrowRight' ? 1 : -1
              const next = LYRIC_TABS[(index + direction + LYRIC_TABS.length) % LYRIC_TABS.length]
              setActive(next.key)
              const tabs = event.currentTarget.parentElement?.querySelectorAll<HTMLButtonElement>('[role="tab"]')
              tabs?.[(index + direction + LYRIC_TABS.length) % LYRIC_TABS.length]?.focus()
            }}
          >
            {tab.label}
            {input[tab.key]?.trim() ? <span aria-label="has content"> •</span> : null}
          </button>
        ))}
      </div>
      <div id="lyrics-editor-panel" role="tabpanel" className={s.lyricsPanel}>
        <div className={s.lyricsToolbar}>
          <label htmlFor={`lyrics-${active}`}>{current.label} lyrics{active !== 'lyrics_english' ? ' *' : ''}</label>
          <button type="button" onClick={openExpanded}>Expand editor</button>
        </div>
        <textarea
          id={`lyrics-${active}`}
          className={s.lyricsTextarea}
          lang={current.lang}
          value={String(input[active] || '')}
          onChange={(event) => onChange(active, event.target.value)}
          aria-invalid={Boolean(fieldErrors[active as keyof FieldErrors])}
        />
        {fieldErrors[active as keyof FieldErrors] && (
          <small className={active === 'lyrics_amharic' ? s.error : s.muted} role="alert">
            {fieldErrors[active as keyof FieldErrors]}
          </small>
        )}
      </div>
      {expanded && (
        <Modal title={`Edit ${current.label} lyrics`} close={() => setExpanded(false)} wide>
          <p className={s.muted}>Changes in this window are applied to the form only when you choose “Apply lyrics.”</p>
          <textarea
            className={s.expandedLyrics}
            lang={current.lang}
            value={draft}
            autoFocus
            onChange={(event) => setDraft(event.target.value)}
          />
          <div className={s.actions}>
            <button type="button" onClick={() => setExpanded(false)}>Cancel</button>
            <button
              type="button"
              className={s.primary}
              onClick={() => {
                onChange(active, draft)
                setExpanded(false)
              }}
            >
              Apply lyrics
            </button>
          </div>
        </Modal>
      )}
    </div>
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
              · {previous?.input.status ? mezmurStatusLabel(previous.input.status) : 'Saved state'}
            </summary>
            {previous && (
              <div className={s.stack} style={{ marginTop: 8 }}>
                <p><strong>Transliterated title:</strong> {previous.input.transliteration_title || '—'}</p>
                {previous.input.title_amharic && <p lang="am"><strong>Amharic title:</strong> {previous.input.title_amharic}</p>}
                <p><strong>Status:</strong> {mezmurStatusLabel(previous.input.status)}</p>
              </div>
            )}
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
