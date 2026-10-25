import { useCallback, useMemo, useRef, useState, type ChangeEvent, type CSSProperties } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import {
  assignMezmurToZemari,
  getZemari,
  listMezmursForZemari,
  listZemaris,
  moveZemariToTrash,
  removeMezmurFromZemari,
  saveZemari,
  searchMezmursToLink,
  slugifyZemari,
  validateZemariImportAccess,
  zemariImagePreviewUrl,
  type ZemariImportAccessCheck,
  type ZemariListFilters,
  type ZemariMezmurLink,
  type ZemariRow,
} from '../../lib/cms/zemariAdminService'
import {
  buildPresetStagedZemarisWithLyrics,
  buildStagedZemarisFromCsvText,
  importSelectedStagedZemaris,
  PRESET_ZEMARIS_WITH_LYRICS,
  summarizeZemariImportDryRun,
  validateStagedZemariRows,
  type ZemariImportDryRunSummary,
  type StagedZemariCsvRow,
} from '../../lib/cms/zemariCsvImport'
import { MediaPicker } from '../../components/admin/MediaPicker'
import { useAsync } from '../../lib/cms/useAsync'
import { useAuth } from '../../lib/auth/useAuth'
import { ADMIN_PATHS } from './adminPaths'
import { AsyncNotice } from './AdminUi'
import { validateZemariSocialUrl } from '../../lib/publicContent/zemariSocialLinks'
import s from './Admin.module.css'

const thumbStyle: CSSProperties = {
  width: '100%',
  maxWidth: 280,
  aspectRatio: '4 / 3',
  objectFit: 'cover',
  borderRadius: 12,
  background: 'var(--color-bg-soft, #f3eee4)',
  display: 'block',
}

function Thumb({ path, alt }: { path?: string | null; alt?: string | null }) {
  const url = zemariImagePreviewUrl(path)
  if (!url) return <div style={thumbStyle} aria-hidden />
  return <img src={url} alt={alt || ''} style={thumbStyle} loading="lazy" />
}

export function ZemarisList() {
  const { profile } = useAuth()
  const canTrash = profile?.role === 'admin' || profile?.role === 'super_admin'
  const [search, setSearch] = useState('')
  const [status, setStatus] = useState<ZemariListFilters['status']>('all')
  const [featured, setFeatured] = useState(false)
  const [hasMezmurs, setHasMezmurs] = useState<ZemariListFilters['hasMezmurs']>('all')
  const [showImportPanel, setShowImportPanel] = useState(false)
  const [message, setMessage] = useState('')
  const [error, setError] = useState('')
  const [busyId, setBusyId] = useState('')

  const filters = useMemo(
    () => ({ search, status, featured: featured || undefined, hasMezmurs }),
    [search, status, featured, hasMezmurs],
  )

  const result = useAsync(useCallback(() => listZemaris(filters), [filters]))
  const allZemarisResult = useAsync(useCallback(() => listZemaris(), []))

  async function moveToTrash(row: ZemariRow) {
    const count = row.mezmur_count || 0
    if (!window.confirm(`Move “${row.name}” to Trash? ${count} associated Mezmur${count === 1 ? '' : 's'} will remain intact.`)) return
    setBusyId(row.id)
    setMessage('')
    setError('')
    try {
      await moveZemariToTrash(row)
      setMessage(`${row.name} was moved to Trash. Its ${count} associated Mezmur${count === 1 ? '' : 's'} were not deleted.`)
      result.reload()
      allZemarisResult.reload()
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Unable to move this Zemari to Trash.')
    } finally {
      setBusyId('')
    }
  }

  return (
    <>
      <div className={s.heading}>
        <div>
          <p className={s.eyebrow}>HYMNS PRACTICE</p>
          <h1>Zemari Library</h1>
          <p className={s.muted}>Manage singers and the Mezmurs associated with them.</p>
        </div>
        <div className={s.actions}>
          <button
            type="button"
            onClick={() => setShowImportPanel((prev) => !prev)}
          >
            {showImportPanel ? 'Close Bulk Import' : 'Bulk Import Zemaris CSV'}
          </button>
          <Link className={s.primary} to={`${ADMIN_PATHS.hymnsZemaris}/new`}>
            + Add Zemari
          </Link>
          <Link to="/admin/hymns/trash">Trash</Link>
        </div>
      </div>

      {showImportPanel ? (
        <ZemariCsvImportPanel
          existingZemaris={allZemarisResult.data || result.data || []}
          onImported={() => {
            result.reload()
            allZemarisResult.reload()
          }}
        />
      ) : null}

      <div className={s.fields} style={{ marginBottom: '1rem' }}>
        <label>
          Search
          <input
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            placeholder="Name, Amharic, or slug"
          />
        </label>
        <label>
          Status
          <select
            value={status}
            onChange={(e) => setStatus(e.target.value as ZemariListFilters['status'])}
          >
            <option value="all">All statuses</option>
            <option value="published">Published</option>
            <option value="draft">Draft</option>
            <option value="archived">Archived</option>
          </select>
        </label>
        <label>
          Mezmurs
          <select
            value={hasMezmurs}
            onChange={(e) => setHasMezmurs(e.target.value as ZemariListFilters['hasMezmurs'])}
          >
            <option value="all">All</option>
            <option value="yes">Has Mezmurs</option>
            <option value="no">No Mezmurs</option>
          </select>
        </label>
        <label className={s.check}>
          <input
            type="checkbox"
            checked={featured}
            onChange={(e) => setFeatured(e.target.checked)}
          />
          Featured only
        </label>
      </div>

      <AsyncNotice {...result} retry={result.reload} />
      {message ? <p role="status" className={s.success}>{message}</p> : null}
      {error ? <p role="alert" className={s.error}>{error}</p> : null}

      {result.data && !result.data.length ? (
        <div className={s.card}>
          <p>No Zemaris yet.</p>
          <p className={s.muted}>Add your first Zemari to begin organizing hymns.</p>
          <Link className={s.primary} to={`${ADMIN_PATHS.hymnsZemaris}/new`}>
            + Add Zemari
          </Link>
        </div>
      ) : null}

      {result.data?.length ? (
        <div className={s.stack}>
          {result.data.map((row) => (
            <article key={row.id} className={s.card}>
              <div
                style={{
                  display: 'grid',
                  gridTemplateColumns: 'minmax(100px, 160px) minmax(0, 1fr)',
                  gap: '1rem',
                  alignItems: 'start',
                }}
              >
                <Thumb path={row.image_path} alt={row.image_alt || row.name} />
                <div>
                  <strong>{row.name}</strong>
                  {row.name_amharic ? (
                    <div lang="am" className={s.muted}>
                      {row.name_amharic}
                    </div>
                  ) : null}
                  <div className={s.muted}>
                    <code>{row.slug}</code> · {row.mezmur_count ?? 0} Mezmurs · {row.status}
                    {row.is_featured ? ' · Featured' : ''}
                    {row.updated_at
                      ? ` · Updated ${new Date(row.updated_at).toLocaleDateString()}`
                      : ''}
                  </div>
                  <div className={s.actions} style={{ marginTop: '0.75rem' }}>
                    <Link to={`${ADMIN_PATHS.hymnsZemaris}/${row.id}/edit`}>Edit</Link>
                    <Link to={`${ADMIN_PATHS.hymnsZemaris}/${row.id}/edit#mezmurs`}>
                      View Mezmurs
                    </Link>
                    <Link to={`/practice/zemari/${row.slug}`} target="_blank" rel="noreferrer">
                      Public
                    </Link>
                    {canTrash ? (
                      <button
                        type="button"
                        className={s.danger}
                        disabled={Boolean(busyId)}
                        onClick={() => void moveToTrash(row)}
                      >
                        {busyId === row.id ? 'Moving…' : 'Move to Trash'}
                      </button>
                    ) : null}
                  </div>
                </div>
              </div>
            </article>
          ))}
        </div>
      ) : null}
    </>
  )
}

function ZemariCsvImportPanel({
  existingZemaris,
  onImported,
}: {
  existingZemaris: ZemariRow[]
  onImported: () => void
}) {
  const [rows, setRows] = useState<StagedZemariCsvRow[]>(() =>
    buildPresetStagedZemarisWithLyrics(existingZemaris),
  )
  const [sourceLabel, setSourceLabel] = useState(
    `Preset: ${PRESET_ZEMARIS_WITH_LYRICS.length} source-derived Zemari candidates`,
  )
  const [filterSearch, setFilterSearch] = useState('')
  const [onlyNew, setOnlyNew] = useState(false)
  const [importStatus, setImportStatus] = useState<'published' | 'draft'>('draft')
  const [busy, setBusy] = useState(false)
  const [progressText, setProgressText] = useState('')
  const [summaryMessage, setSummaryMessage] = useState('')
  const [errorMessage, setErrorMessage] = useState('')
  const [dryRun, setDryRun] = useState<ZemariImportDryRunSummary | null>(null)
  const [accessCheck, setAccessCheck] = useState<ZemariImportAccessCheck | null>(null)
  const [importLog, setImportLog] = useState<string[]>([])
  const cancelRef = useRef<AbortController | null>(null)

  const validatedRows = useMemo(
    () => validateStagedZemariRows(rows, existingZemaris),
    [rows, existingZemaris],
  )

  const filteredRows = useMemo(() => {
    const q = filterSearch.trim().toLowerCase()
    return validatedRows.filter((r) => {
      if (onlyNew && r.alreadyExists) return false
      if (!q) return true
      return (
        r.name.toLowerCase().includes(q) ||
        r.name_amharic.toLowerCase().includes(q) ||
        r.slug.toLowerCase().includes(q)
      )
    })
  }, [validatedRows, filterSearch, onlyNew])

  const selectedReadyCount = useMemo(
    () =>
      validatedRows.filter(
        (r) =>
          r.selected &&
          !r.alreadyExists &&
          !r.potentialDuplicate &&
          !r.validationError &&
          r.reviewWarnings.length === 0,
      ).length,
    [validatedRows],
  )

  const alreadyExistingCount = useMemo(
    () => validatedRows.filter((r) => r.alreadyExists).length,
    [validatedRows],
  )

  async function handleFileChange(e: ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    if (!file) return
    setErrorMessage('')
    setSummaryMessage('')
    try {
      const text = await file.text()
      const staged = buildStagedZemarisFromCsvText(text, existingZemaris)
      if (!staged.length) {
        setErrorMessage('No valid individual Zemari rows found in the uploaded CSV.')
        return
      }
      setRows(staged)
      setDryRun(null)
      setAccessCheck(null)
      setSourceLabel(`Uploaded CSV: ${file.name} (${staged.length} Zemaris)`)
    } catch (err) {
      setErrorMessage(err instanceof Error ? err.message : 'Failed to parse CSV file.')
    }
  }

  function loadPresetWithLyrics() {
    setErrorMessage('')
    setSummaryMessage('')
    const staged = buildPresetStagedZemarisWithLyrics(existingZemaris)
    setRows(staged)
    setSourceLabel(
      `Preset: ${PRESET_ZEMARIS_WITH_LYRICS.length} source-derived Zemari candidates`,
    )
    setDryRun(null)
    setAccessCheck(null)
  }

  function updateRow(rowNumber: number, patch: Partial<StagedZemariCsvRow>) {
    setDryRun(null)
    setRows((prev) =>
      prev.map((row) => (row.rowNumber === rowNumber ? { ...row, ...patch } : row)),
    )
  }

  function selectAllNew(selected: boolean) {
    const existingSlugs = new Set(existingZemaris.map((z) => z.slug.toLowerCase()))
    const existingAmharic = new Set(
      existingZemaris.map((z) => (z.name_amharic || '').trim()).filter(Boolean),
    )
    setRows((prev) =>
      prev.map((r) => {
        const exists =
          existingSlugs.has(r.slug.toLowerCase()) ||
          Boolean(r.name_amharic && existingAmharic.has(r.name_amharic.trim()))
        return {
          ...r,
          selected:
            exists || r.potentialDuplicate || Boolean(r.validationError) || r.reviewWarnings.length > 0
              ? false
              : selected,
        }
      }),
    )
  }

  async function runDryRunValidation() {
    setBusy(true)
    setErrorMessage('')
    setSummaryMessage('')
    setProgressText('Validating staff access and database readiness…')
    try {
      const access = await validateZemariImportAccess()
      const checked = validateStagedZemariRows(rows, existingZemaris)
      const summary = summarizeZemariImportDryRun(checked, importStatus)
      setRows(checked)
      setAccessCheck(access)
      setDryRun(summary)
      if (access.canInsertZemaris === false || !access.isStaff) {
        setErrorMessage('Your account can review this import, but it cannot create Zemari profiles.')
      } else {
        setSummaryMessage(
          `Validation complete: ${summary.ready} ready, ${summary.alreadyInDatabase} already present, ${summary.potentialDuplicates} possible duplicates, ${summary.invalid} invalid. No records were created.`,
        )
      }
    } catch (err) {
      setAccessCheck(null)
      setDryRun(null)
      setErrorMessage(err instanceof Error ? err.message : 'Import validation failed.')
    } finally {
      setProgressText('')
      setBusy(false)
    }
  }

  async function runBulkImport(retryFailedOnly = false) {
    if (!dryRun || !accessCheck) {
      setErrorMessage('Run Validate Import before creating any profiles.')
      return
    }
    setBusy(true)
    setErrorMessage('')
    setSummaryMessage('')
    setProgressText('Starting Zemari import…')
    const controller = new AbortController()
    cancelRef.current = controller
    try {
      const toImport = validatedRows.filter(
        (r) =>
          (retryFailedOnly ? r.importState === 'failed' : r.selected) &&
          !r.alreadyExists &&
          !r.potentialDuplicate &&
          !r.validationError &&
          r.reviewWarnings.length === 0,
      )
      const outcome = await importSelectedStagedZemaris(toImport, {
        targetStatus: importStatus,
        signal: controller.signal,
        onProgress: (completed, total, currentName, state, progressRow) => {
          setProgressText(
            `Importing Zemaris (${completed} / ${total})${currentName ? ` · ${currentName}` : ''}…`,
          )
          setRows((current) =>
            current.map((row) =>
              row.stagingId === progressRow.stagingId
                ? {
                    ...row,
                    importState: state,
                    importError: state === 'failed' ? row.importError : null,
                  }
                : row,
            ),
          )
        },
      })
      setProgressText('')
      setRows((current) =>
        current.map((row) => {
          if (outcome.imported.includes(row.slug)) {
            return {
              ...row,
              selected: false,
              alreadyExists: true,
              importState: 'imported',
              importError: null,
            }
          }
          const failure = outcome.failed.find((item) => item.slug === row.slug)
          if (failure) return { ...row, importState: 'failed', importError: failure.error }
          return row
        }),
      )
      setImportLog((current) => [
        `${new Date().toLocaleTimeString()}: ${outcome.imported.length} created, ${outcome.skipped.length} skipped, ${outcome.failed.length} failed${outcome.cancelled ? ', cancelled' : ''}.`,
        ...outcome.failed.map((item) => `${item.name}: ${item.error}`),
        ...current,
      ].slice(0, 30))
      if (outcome.failed.length > 0) {
        setErrorMessage(
          `Imported ${outcome.imported.length} Zemaris; ${outcome.failed.length} failed (${outcome.failed[0].name}: ${outcome.failed[0].error}).`,
        )
      } else if (outcome.cancelled) {
        setSummaryMessage(`Import stopped safely after creating ${outcome.imported.length} profiles.`)
      } else {
        setSummaryMessage(`Successfully imported ${outcome.imported.length} Zemaris as ${importStatus}.`)
      }
      onImported()
    } catch (err) {
      setProgressText('')
      setErrorMessage(err instanceof Error ? err.message : 'Bulk import failed.')
    } finally {
      cancelRef.current = null
      setBusy(false)
    }
  }

  return (
    <section className={s.card} style={{ marginBottom: '1.5rem' }}>
      <h2>Bulk Import Zemaris</h2>
      <p className={s.muted}>
        Review 185 source-derived Zemari candidates whose Mezmurs have lyrics, or upload{' '}
        <code>zemaris_with_lyrics.csv</code> / <code>zemaris.csv</code>. The source proves that the
        names occur in the imported catalog; it does not independently verify every identity.
        Validate first, review possible duplicates, then import selected profiles.
      </p>

      <div className={s.fields} style={{ marginTop: '0.75rem', marginBottom: '0.75rem' }}>
        <label>
          Upload Zemaris CSV (optional)
          <input
            type="file"
            accept=".csv,text/csv"
            aria-label="Upload Zemaris CSV"
            onChange={(e) => void handleFileChange(e)}
          />
        </label>
        <label>
          Filter list
          <input
            value={filterSearch}
            onChange={(e) => setFilterSearch(e.target.value)}
            placeholder="Filter by Amharic, English, or slug"
          />
        </label>
        <label>
          Import status
          <select
            value={importStatus}
            onChange={(e) => {
              setImportStatus(e.target.value as 'published' | 'draft')
              setDryRun(null)
            }}
          >
            <option value="draft">Draft — recommended</option>
            <option value="published">Published — editorially confirmed profiles only</option>
          </select>
        </label>
        <label className={s.check}>
          <input
            type="checkbox"
            checked={onlyNew}
            onChange={(e) => setOnlyNew(e.target.checked)}
          />
          Hide already-existing Zemaris ({alreadyExistingCount})
        </label>
      </div>

      <div className={s.actions} style={{ marginBottom: '0.75rem', flexWrap: 'wrap' }}>
        <button type="button" onClick={loadPresetWithLyrics} disabled={busy}>
          Load 185 Zemaris (With Lyrics)
        </button>
        <button type="button" onClick={() => selectAllNew(true)} disabled={busy}>
          Select All New
        </button>
        <button type="button" onClick={() => selectAllNew(false)} disabled={busy}>
          Clear Selection
        </button>
        <button type="button" onClick={() => void runDryRunValidation()} disabled={busy}>
          {busy && progressText.startsWith('Validating') ? 'Validating…' : 'Validate Import'}
        </button>
        <button
          type="button"
          className={s.primary}
          disabled={
            busy ||
            selectedReadyCount === 0 ||
            !dryRun ||
            accessCheck?.canInsertZemaris === false
          }
          onClick={() => void runBulkImport(false)}
        >
          {busy
            ? progressText || 'Importing…'
            : `Import ${selectedReadyCount} Selected Zemaris`}
        </button>
        {busy && cancelRef.current ? (
          <button type="button" onClick={() => cancelRef.current?.abort()}>
            Stop safely
          </button>
        ) : null}
        {!busy && validatedRows.some((row) => row.importState === 'failed') ? (
          <button type="button" onClick={() => void runBulkImport(true)}>
            Retry failed only
          </button>
        ) : null}
      </div>

      {dryRun ? (
        <div
          className={s.card}
          aria-label="Import validation summary"
          style={{ marginBottom: '0.75rem' }}
        >
          <strong>Validation summary — no database writes</strong>
          <div className={s.actions} style={{ marginTop: '0.5rem', flexWrap: 'wrap' }}>
            <span>Total: {dryRun.total}</span>
            <span>Valid: {dryRun.valid}</span>
            <span>Already present: {dryRun.alreadyInDatabase}</span>
            <span>Possible duplicates: {dryRun.potentialDuplicates}</span>
            <span>Needs review: {dryRun.manualReview}</span>
            <span>Invalid: {dryRun.invalid}</span>
            <strong>Ready: {dryRun.ready}</strong>
          </div>
          <p className={s.muted} style={{ marginBottom: 0 }}>
            Signed in as {accessCheck?.profileRole || 'unknown role'}.
            {accessCheck?.warning
              ? ` ${accessCheck.warning}`
              : ' Staff and INSERT capability checks passed.'}
          </p>
        </div>
      ) : null}

      <p className={s.muted} style={{ marginBottom: '0.75rem' }}>
        Source: <strong>{sourceLabel}</strong> · Showing {filteredRows.length} of{' '}
        {validatedRows.length} · <strong>{selectedReadyCount}</strong> selected &amp; ready to
        import · {alreadyExistingCount} already in database
      </p>

      {errorMessage ? (
        <p role="alert" className={s.error}>
          {errorMessage}
        </p>
      ) : null}
      {summaryMessage ? (
        <p role="status" className={s.success}>
          {summaryMessage}
        </p>
      ) : null}

      <div
        style={{
          maxHeight: 420,
          overflowY: 'auto',
          border: '1px solid var(--color-border, #e2d9c8)',
          borderRadius: 8,
          padding: '0.5rem',
        }}
      >
        <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: '0.9rem' }}>
          <thead>
            <tr style={{ textAlign: 'left', borderBottom: '1px solid var(--color-border, #e2d9c8)' }}>
              <th style={{ padding: '0.4rem' }}>Import</th>
              <th style={{ padding: '0.4rem' }}>#</th>
              <th style={{ padding: '0.4rem' }}>Amharic Name (name_amharic)</th>
              <th style={{ padding: '0.4rem' }}>English / Transliterated Name (name)</th>
              <th style={{ padding: '0.4rem' }}>Slug</th>
              <th style={{ padding: '0.4rem' }}>Mezmurs w/ Lyrics</th>
              <th style={{ padding: '0.4rem' }}>State</th>
            </tr>
          </thead>
          <tbody>
            {filteredRows.map((row) => (
              <tr
                key={row.rowNumber}
                style={{
                  borderBottom: '1px solid var(--color-border, #eee6d8)',
                  opacity: row.alreadyExists ? 0.65 : 1,
                }}
              >
                <td style={{ padding: '0.4rem' }}>
                  <input
                    type="checkbox"
                    checked={row.selected && !row.alreadyExists}
                    disabled={
                      busy ||
                      row.alreadyExists ||
                      row.potentialDuplicate ||
                      Boolean(row.validationError) ||
                      row.reviewWarnings.length > 0
                    }
                    aria-label={`Select Zemari row ${row.rowNumber}`}
                    onChange={(e) => updateRow(row.rowNumber, { selected: e.target.checked })}
                  />
                </td>
                <td style={{ padding: '0.4rem' }}>{row.rowNumber}</td>
                <td style={{ padding: '0.4rem' }}>
                  <input
                    lang="am"
                    value={row.name_amharic}
                    disabled={busy || row.alreadyExists}
                    aria-label={`Amharic name Zemari row ${row.rowNumber}`}
                    onChange={(e) => updateRow(row.rowNumber, { name_amharic: e.target.value })}
                    style={{ width: '100%' }}
                  />
                </td>
                <td style={{ padding: '0.4rem' }}>
                  <input
                    value={row.name}
                    disabled={busy || row.alreadyExists}
                    aria-label={`English name Zemari row ${row.rowNumber}`}
                    onChange={(e) => {
                      const nextName = e.target.value
                      updateRow(row.rowNumber, {
                        name: nextName,
                        slug: slugifyZemari(nextName) || row.slug,
                      })
                    }}
                    style={{ width: '100%' }}
                  />
                </td>
                <td style={{ padding: '0.4rem' }}>
                  <input
                    value={row.slug}
                    disabled={busy || row.alreadyExists}
                    aria-label={`Slug Zemari row ${row.rowNumber}`}
                    onChange={(e) =>
                      updateRow(row.rowNumber, { slug: slugifyZemari(e.target.value) })
                    }
                    style={{ width: '100%', fontFamily: 'monospace' }}
                  />
                </td>
                <td style={{ padding: '0.4rem' }}>
                  {row.mezmurs_with_lyrics_count} / {row.mezmur_count}
                </td>
                <td style={{ padding: '0.4rem' }}>
                  {row.alreadyExists ? (
                    <span className={s.muted}>Already in DB</span>
                  ) : row.potentialDuplicate ? (
                    <span className={s.error} title={row.duplicateMatches.join('\n')}>
                      Possible duplicate — review
                    </span>
                  ) : row.validationError ? (
                    <span className={s.error}>{row.validationError}</span>
                  ) : row.reviewWarnings.length ? (
                    <span className={s.error} title={row.reviewWarnings.join('\n')}>Needs review</span>
                  ) : row.importState === 'imported' ? (
                    <span>Imported</span>
                  ) : row.importState === 'failed' ? (
                    <span className={s.error} title={row.importError || ''}>Failed</span>
                  ) : (
                    <span>Ready</span>
                  )}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
      {importLog.length ? (
        <details style={{ marginTop: '0.75rem' }}>
          <summary>Import activity ({importLog.length})</summary>
          <ul>{importLog.map((entry, index) => <li key={`${entry}-${index}`}>{entry}</li>)}</ul>
        </details>
      ) : null}
    </section>
  )
}

export function ZemariEditor() {
  const { id } = useParams()
  const isNew = !id || id === 'new'
  const navigate = useNavigate()
  const result = useAsync(
    useCallback(async () => {
      if (isNew) return { zemari: null as ZemariRow | null, mezmurs: [] as ZemariMezmurLink[] }
      const zemari = await getZemari(id!)
      const mezmurs = await listMezmursForZemari(zemari.id)
      return { zemari, mezmurs }
    }, [id, isNew]),
  )

  if (!isNew && result.loading && !result.data) {
    return <AsyncNotice {...result} retry={result.reload} />
  }

  return (
    <ZemariEditorForm
      key={result.data?.zemari?.id || 'new'}
      existing={result.data?.zemari || null}
      initialMezmurs={result.data?.mezmurs || []}
      loadError={result.error}
      onReload={result.reload}
      onCreated={(saved) => navigate(`${ADMIN_PATHS.hymnsZemaris}/${saved.id}/edit`, { replace: true })}
    />
  )
}

function ZemariEditorForm({
  existing,
  initialMezmurs,
  loadError,
  onReload,
  onCreated,
}: {
  existing: ZemariRow | null
  initialMezmurs: ZemariMezmurLink[]
  loadError?: string | null
  onReload: () => void
  onCreated: (row: ZemariRow) => void
}) {
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [mezmurs, setMezmurs] = useState(initialMezmurs)
  const [linkQuery, setLinkQuery] = useState('')
  const [linkResults, setLinkResults] = useState<ZemariMezmurLink[]>([])
  const [youtubeTouched, setYoutubeTouched] = useState(false)
  const [form, setForm] = useState({
    name: existing?.name || '',
    name_amharic: existing?.name_amharic || '',
    slug: existing?.slug || '',
    bio: existing?.bio || '',
    bio_amharic: existing?.bio_amharic || '',
    image_path: existing?.image_path || '',
    image_alt: existing?.image_alt || '',
    youtube_url: existing?.youtube_url || '',
    website_url: existing?.website_url || '',
    sort_order: existing?.sort_order ?? 0,
    is_featured: existing?.is_featured ?? false,
    status: (existing?.status || 'published') as ZemariRow['status'],
  })

  async function save() {
    setBusy(true)
    setError('')
    setSuccess('')
    try {
      const slug = form.slug.trim() || slugifyZemari(form.name)
      if (!form.name.trim()) throw new Error('Name is required.')
      if (!slug) throw new Error('Slug is required.')
      const youtube = validateZemariSocialUrl('youtube', form.youtube_url)
      if (youtube.error) {
        setYoutubeTouched(true)
        throw new Error(`YouTube URL: ${youtube.error}`)
      }
      const saved = await saveZemari(
        {
          ...form,
          slug,
          image_path: form.image_path || null,
          image_alt: form.image_alt || null,
          name_amharic: form.name_amharic || null,
          bio: form.bio || null,
          bio_amharic: form.bio_amharic || null,
          youtube_url: youtube.url,
          website_url: form.website_url || null,
        },
        existing?.id,
      )
      setForm({
        name: saved.name,
        name_amharic: saved.name_amharic || '',
        slug: saved.slug,
        bio: saved.bio || '',
        bio_amharic: saved.bio_amharic || '',
        image_path: saved.image_path || '',
        image_alt: saved.image_alt || '',
        youtube_url: saved.youtube_url || '',
        website_url: saved.website_url || '',
        sort_order: saved.sort_order ?? 0,
        is_featured: saved.is_featured ?? false,
        status: saved.status || 'published',
      })
      setSuccess(`Saved “${saved.name}”.`)
      if (!existing) onCreated(saved)
      else onReload()
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Could not save Zemari.')
    } finally {
      setBusy(false)
    }
  }

  async function runLinkSearch() {
    try {
      const rows = await searchMezmursToLink(linkQuery, 25)
      setLinkResults(rows.filter((r) => r.zemari_id !== existing?.id))
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Search failed.')
    }
  }

  async function linkMezmur(row: ZemariMezmurLink) {
    if (!existing) {
      setError('Save the Zemari first, then assign Mezmurs.')
      return
    }
    setBusy(true)
    setError('')
    try {
      await assignMezmurToZemari(existing, { mezmur_id: row.mezmur_id, slug: row.slug })
      const next = await listMezmursForZemari(existing.id)
      await getZemari(existing.id)
      setMezmurs(next)
      setSuccess(`Linked “${row.title}”.`)
      setLinkResults((prev) => prev.filter((r) => r.slug !== row.slug))
      onReload()
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Could not link Mezmur.')
    } finally {
      setBusy(false)
    }
  }

  async function unlinkMezmur(row: ZemariMezmurLink) {
    if (!existing) return
    setBusy(true)
    setError('')
    try {
      await removeMezmurFromZemari({ mezmur_id: row.mezmur_id, slug: row.slug })
      const next = await listMezmursForZemari(existing.id)
      setMezmurs(next)
      setSuccess(`Removed “${row.title}”.`)
      onReload()
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Could not remove Mezmur.')
    } finally {
      setBusy(false)
    }
  }

  return (
    <>
      <div className={s.heading}>
        <div>
          <Link to={ADMIN_PATHS.hymnsZemaris}>← Zemari Library</Link>
          <h1>{existing ? 'Edit Zemari' : 'Add Zemari'}</h1>
        </div>
        <button type="button" className={s.primary} disabled={busy} onClick={() => void save()}>
          {busy ? 'Saving…' : 'Save'}
        </button>
      </div>
      {loadError ? (
        <p role="alert" className={s.error}>
          {loadError}
        </p>
      ) : null}
      {error ? (
        <p role="alert" className={s.error}>
          {error}
        </p>
      ) : null}
      {success ? (
        <p role="status" className={s.success}>
          {success}
        </p>
      ) : null}

      <div className={s.formGrid}>
        <section className={s.card}>
          <h2>Profile</h2>
          <div className={s.fields}>
            <label>
              Name *
              <input
                value={form.name}
                onChange={(e) => {
                  const name = e.target.value
                  setForm((prev) => ({
                    ...prev,
                    name,
                    slug: existing ? prev.slug : slugifyZemari(name),
                  }))
                }}
              />
            </label>
            <label>
              Amharic name
              <input
                lang="am"
                value={form.name_amharic}
                onChange={(e) => setForm((prev) => ({ ...prev, name_amharic: e.target.value }))}
              />
            </label>
            <label>
              Slug *
              <input
                value={form.slug}
                onChange={(e) => setForm((prev) => ({ ...prev, slug: slugifyZemari(e.target.value) }))}
              />
            </label>
            <label>
              Bio
              <textarea
                rows={4}
                value={form.bio}
                onChange={(e) => setForm((prev) => ({ ...prev, bio: e.target.value }))}
              />
            </label>
            <label>
              Amharic bio
              <textarea
                lang="am"
                rows={4}
                value={form.bio_amharic}
                onChange={(e) => setForm((prev) => ({ ...prev, bio_amharic: e.target.value }))}
              />
            </label>
            <label htmlFor="zemari-youtube-url">
              Official YouTube channel or profile
              <input
                id="zemari-youtube-url"
                type="url"
                inputMode="url"
                autoComplete="url"
                value={form.youtube_url}
                onChange={(e) => setForm((prev) => ({ ...prev, youtube_url: e.target.value }))}
                onBlur={() => setYoutubeTouched(true)}
                placeholder="https://www.youtube.com/@channelname"
                aria-describedby="zemari-youtube-help zemari-youtube-error"
                aria-invalid={
                  youtubeTouched && Boolean(validateZemariSocialUrl('youtube', form.youtube_url).error)
                }
              />
              <span id="zemari-youtube-help" className={s.muted}>
                Example: https://www.youtube.com/@channelname. Use the singer&rsquo;s official channel,
                not an individual video. Clear this field to remove the link.
              </span>
              {youtubeTouched && validateZemariSocialUrl('youtube', form.youtube_url).error ? (
                <span id="zemari-youtube-error" className={s.error} role="alert">
                  {validateZemariSocialUrl('youtube', form.youtube_url).error}
                </span>
              ) : (
                <span id="zemari-youtube-error" />
              )}
            </label>
            <label>
              Website URL
              <input
                value={form.website_url}
                onChange={(e) => setForm((prev) => ({ ...prev, website_url: e.target.value }))}
              />
            </label>
            <label>
              Sort order
              <input
                type="number"
                value={form.sort_order}
                onChange={(e) =>
                  setForm((prev) => ({ ...prev, sort_order: Number(e.target.value) || 0 }))
                }
              />
            </label>
            <label>
              Status
              <select
                value={form.status}
                onChange={(e) =>
                  setForm((prev) => ({ ...prev, status: e.target.value as ZemariRow['status'] }))
                }
              >
                <option value="published">published</option>
                <option value="draft">draft</option>
                <option value="archived">archived</option>
              </select>
            </label>
            <label className={s.check}>
              <input
                type="checkbox"
                checked={form.is_featured}
                onChange={(e) => setForm((prev) => ({ ...prev, is_featured: e.target.checked }))}
              />
              Featured
            </label>
          </div>
        </section>

        <section className={s.card}>
          <h2>Image</h2>
          <p className={s.muted}>4:3 preview matches public Zemari cards.</p>
          <div style={{ marginBottom: '0.75rem' }}>
            <Thumb path={form.image_path} alt={form.image_alt || form.name} />
          </div>
          <MediaPicker
            label="Change image"
            folder="hymns/zemaris"
            value={form.image_path || ''}
            altText={form.image_alt}
            previewAspect="4/3"
            suggestedPath={form.slug ? `hymns/zemaris/${form.slug}.webp` : undefined}
            onChange={(next) =>
              setForm((prev) => ({
                ...prev,
                image_path: next.storagePath,
                image_alt: next.altText || prev.image_alt,
              }))
            }
          />
          <label style={{ display: 'block', marginTop: '0.75rem' }}>
            Image alt text
            <input
              value={form.image_alt}
              onChange={(e) => setForm((prev) => ({ ...prev, image_alt: e.target.value }))}
            />
          </label>
        </section>
      </div>

      <section className={s.card} style={{ marginTop: '1.5rem' }} id="mezmurs">
        <h2>Associated Mezmurs</h2>
        <p className={s.muted}>
          Sets <code>mezmur_data_import.zemari_id</code>. Does not duplicate hymn rows. Published
          Zemaris with at least one visible Mezmur appear under Hymn Practice → Zemari / Singers.
        </p>
        {!existing ? (
          <p className={s.muted}>Save the Zemari first, then assign Mezmurs.</p>
        ) : (
          <>
            <div className={s.actions} style={{ marginBottom: '0.75rem' }}>
              <input
                value={linkQuery}
                onChange={(e) => setLinkQuery(e.target.value)}
                placeholder="Search Mezmurs to add"
                style={{ minWidth: 220 }}
              />
              <button type="button" disabled={busy} onClick={() => void runLinkSearch()}>
                + Add existing Mezmur
              </button>
            </div>
            {linkResults.length ? (
              <ul className={s.stack}>
                {linkResults.map((row) => (
                  <li key={row.slug} className={s.card}>
                    <strong>{row.title}</strong>
                    {row.title_amharic ? (
                      <div lang="am" className={s.muted}>
                        {row.title_amharic}
                      </div>
                    ) : null}
                    <div className={s.muted}>
                      <code>{row.slug}</code>
                      {row.zemari_id ? ' · already linked to another Zemari' : ''}
                    </div>
                    <button type="button" disabled={busy} onClick={() => void linkMezmur(row)}>
                      Assign
                    </button>
                  </li>
                ))}
              </ul>
            ) : null}
            <div className={s.stack} style={{ marginTop: '1rem' }}>
              {mezmurs.map((row) => (
                <article key={row.slug} className={s.card}>
                  <strong>{row.title}</strong>
                  {row.title_amharic ? (
                    <div lang="am" className={s.muted}>
                      {row.title_amharic}
                    </div>
                  ) : null}
                  <div className={s.muted}>
                    <code>{row.slug}</code> · {row.status || '—'}
                  </div>
                  <div className={s.actions}>
                    <Link to={`${ADMIN_PATHS.hymnsMezmur}/${row.mezmur_id || row.slug}/edit`}>
                      Edit Mezmur
                    </Link>
                    <button type="button" disabled={busy} onClick={() => void unlinkMezmur(row)}>
                      Remove relationship
                    </button>
                  </div>
                </article>
              ))}
              {!mezmurs.length ? <p className={s.muted}>No Mezmurs linked yet.</p> : null}
            </div>
          </>
        )}
      </section>
    </>
  )
}
