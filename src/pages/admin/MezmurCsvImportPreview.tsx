import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { getTaxonomy, slugify } from '../../lib/cms/mezmurService'
import { listAllHymnSections } from '../../lib/cms/hymnBrowseAdminService'
import {
  buildStagedRowsFromCsvText,
  importSelectedStagedRowsAsDrafts,
  SAMPLE_MEZMUR_CSV_TEXT,
  serializeStagedRowsToCsv,
  summarizeStagedRows,
  validateAndRefreshStagedRows,
  type StagedMezmurCsvRow,
} from '../../lib/cms/mezmurCsvImport'
import { useAsync } from '../../lib/cms/useAsync'
import { CANONICAL_CATEGORIES, CANONICAL_OCCASIONS } from '../../lib/publicContent/taxonomy'
import { ADMIN_PATHS } from './adminPaths'
import { AsyncNotice, Modal } from './AdminUi'
import s from './Admin.module.css'

const DEFAULT_HYMN_SECTION_SLUGS = [
  'christ-general',
  'mary-general',
  'st-michael',
  'st-gabriel',
  'st-uriel',
  'st-raphael',
  'holy-angels',
  'st-george',
  'st-arsema',
  'martyrs',
  'apostles',
  'general-saints',
  'gena',
  'timkat',
  'hosanna',
  'good-friday',
  'tinsae',
  'ascension',
  'pentecost',
  'debre-tabor',
  'meskel',
  'enkutatash',
  'lideta-maryam',
  'filseta',
  'marian-feasts',
  'abiy-tsom',
  'nineveh',
  'holy-week',
  'passion',
  'repentance',
  'general-fasting',
  'wereb',
  'wedding',
  'communion',
  'funeral',
  'church-worship',
  'general-praise',
  'general-worship',
  'english',
  'bilingual',
]

const STORAGE_KEY = 'tewahedo_cms_staged_mezmur_csv_v1'
const PAGE_SIZE = 25

type ViewMode = 'all' | 'duplicates' | 'missing_lyrics' | 'attribution' | 'review_required'

export function MezmurCsvImportPreview() {
  const { profile } = useAuth()
  const admin = profile?.role === 'admin' || profile?.role === 'super_admin'
  const staff = admin || profile?.role === 'editor'

  const meta = useAsync(
    useCallback(async () => {
      const [taxonomy, sections] = await Promise.all([
        getTaxonomy(),
        listAllHymnSections().catch(() => []),
      ])
      return { taxonomy, sections }
    }, []),
  )

  const singers = useMemo(() => meta.data?.taxonomy.singers ?? [], [meta.data])
  const sectionOptions = useMemo(() => {
    const dbSections = meta.data?.sections ?? []
    if (dbSections.length > 0) {
      return dbSections.map((sec) => ({ slug: sec.slug, title: sec.title, id: sec.id }))
    }
    return DEFAULT_HYMN_SECTION_SLUGS.map((slug) => ({
      slug,
      title: slug.replace(/-/g, ' ').replace(/\b\w/g, (c) => c.toUpperCase()),
      id: slug,
    }))
  }, [meta.data])

  const knownSectionSlugs = useMemo(
    () => new Set(sectionOptions.map((sec) => sec.slug)),
    [sectionOptions],
  )

  const [rows, setRows] = useState<StagedMezmurCsvRow[]>(() => {
    try {
      const saved = sessionStorage.getItem(STORAGE_KEY)
      if (saved) {
        const parsed = JSON.parse(saved) as StagedMezmurCsvRow[]
        if (Array.isArray(parsed) && parsed.length > 0) return parsed
      }
    } catch {
      // ignore storage errors
    }
    return buildStagedRowsFromCsvText(SAMPLE_MEZMUR_CSV_TEXT)
  })

  const [fileName, setFileName] = useState<string>('Sample Staged Preview (3 rows)')
  const [viewMode, setViewMode] = useState<ViewMode>('all')
  const [search, setSearch] = useState('')
  const [categoryFilter, setCategoryFilter] = useState('')
  const [occasionFilter, setOccasionFilter] = useState('')
  const [lyricsFilter, setLyricsFilter] = useState('')
  const [zemariMatchFilter, setZemariMatchFilter] = useState('')
  const [selectedOnly, setSelectedOnly] = useState(false)
  const [page, setPage] = useState(1)

  const [editingRowId, setEditingRowId] = useState<string | null>(null)
  const [message, setMessage] = useState('')
  const [error, setError] = useState('')
  const [importing, setImporting] = useState(false)
  const [importProgress, setImportProgress] = useState('')

  // Re-validate when singer profiles finish loading
  useEffect(() => {
    if (!singers.length) return
    setRows((prev) => validateAndRefreshStagedRows(prev, singers, knownSectionSlugs))
  }, [singers, knownSectionSlugs])

  // Persist staging state up to 500 rows in sessionStorage
  useEffect(() => {
    try {
      if (rows.length <= 500) {
        sessionStorage.setItem(STORAGE_KEY, JSON.stringify(rows))
      }
    } catch {
      // ignore quota exceeded for large 2,000+ CSVs
    }
  }, [rows])

  const summary = useMemo(() => summarizeStagedRows(rows), [rows])

  const filteredRows = useMemo(() => {
    const q = search.trim().toLowerCase()
    return rows.filter((row) => {
      if (viewMode === 'duplicates' && !row.duplicateOfStagingId) return false
      if (viewMode === 'missing_lyrics' && row.lyrics_status === 'available') return false
      if (viewMode === 'review_required' && !row.review_required) return false
      if (viewMode === 'attribution' && !row.source_url && !row.youtube_url) return false

      if (selectedOnly && !row.selectedForImport) return false
      if (categoryFilter && row.category !== categoryFilter) return false
      if (occasionFilter && row.primary_occasion !== occasionFilter) return false
      if (lyricsFilter && row.lyrics_status !== lyricsFilter) return false
      if (zemariMatchFilter === 'matched' && !row.matched_zemari_id) return false
      if (zemariMatchFilter === 'unmatched' && (!row.zemari || row.matched_zemari_id)) return false
      if (zemariMatchFilter === 'empty' && row.zemari) return false

      if (q) {
        const hay = [
          row.amharic_title,
          row.transliteration_title,
          row.slug,
          row.zemari,
          row.category,
          row.primary_occasion,
          row.source_url,
          row.youtube_url,
        ]
          .join(' ')
          .toLowerCase()
        if (!hay.includes(q)) return false
      }
      return true
    })
  }, [
    rows,
    viewMode,
    selectedOnly,
    categoryFilter,
    occasionFilter,
    lyricsFilter,
    zemariMatchFilter,
    search,
  ])

  const totalPages = Math.max(1, Math.ceil(filteredRows.length / PAGE_SIZE))
  const currentPage = Math.min(page, totalPages)
  const pagedRows = useMemo(
    () => filteredRows.slice((currentPage - 1) * PAGE_SIZE, currentPage * PAGE_SIZE),
    [filteredRows, currentPage],
  )

  const editingRow = useMemo(
    () => rows.find((r) => r.stagingId === editingRowId) ?? null,
    [rows, editingRowId],
  )

  async function handleFileUpload(file: File | undefined) {
    if (!file) return
    setError('')
    setMessage('')
    try {
      const text = await file.text()
      const staged = buildStagedRowsFromCsvText(text, singers, knownSectionSlugs)
      if (!staged.length) {
        setError('Uploaded CSV file contained no data rows.')
        return
      }
      setRows(staged)
      setFileName(`${file.name} (${staged.length} rows)`)
      setPage(1)
      setMessage(
        `Loaded ${staged.length} rows from "${file.name}" into staging preview. No database records have been modified.`,
      )
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to parse CSV file.')
    }
  }

  function loadSampleRows() {
    const staged = buildStagedRowsFromCsvText(SAMPLE_MEZMUR_CSV_TEXT, singers, knownSectionSlugs)
    setRows(staged)
    setFileName('Sample Staged Preview (3 rows)')
    setPage(1)
    setError('')
    setMessage('Loaded sample staging rows.')
  }

  function updateRow(
    stagingId: string,
    patch: Partial<StagedMezmurCsvRow>,
  ) {
    setRows((prev) => {
      const next = prev.map((row) => (row.stagingId === stagingId ? { ...row, ...patch } : row))
      return validateAndRefreshStagedRows(next, singers, knownSectionSlugs)
    })
  }

  function toggleSelectAllFiltered(checked: boolean) {
    const filteredIds = new Set(
      filteredRows.filter((r) => r.importReady).map((r) => r.stagingId),
    )
    setRows((prev) =>
      prev.map((row) =>
        filteredIds.has(row.stagingId)
          ? { ...row, selectedForImport: checked }
          : row,
      ),
    )
  }

  function downloadEditedCsv() {
    const csvContent = serializeStagedRowsToCsv(rows)
    const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' })
    const url = URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = 'mezmurs_staged_edited.csv'
    a.click()
    URL.revokeObjectURL(url)
  }

  async function runDraftImport() {
    if (!staff) {
      setError('Only editor, admin, or super_admin roles can import staged drafts.')
      return
    }
    const selected = rows.filter((r) => r.selectedForImport && r.importReady)
    if (!selected.length) {
      setError('Select at least one import-ready row to import as draft.')
      return
    }
    if (
      !window.confirm(
        `Import ${selected.length} selected Mezmur row(s) as DRAFTS (status = "draft", featured = false)? Nothing will be published automatically.`,
      )
    ) {
      return
    }

    setImporting(true)
    setError('')
    setMessage('')
    try {
      const taxonomy = meta.data?.taxonomy ?? { categories: [], singers: [], tags: [] }
      const sections = meta.data?.sections ?? []
      const res = await importSelectedStagedRowsAsDrafts(selected, {
        taxonomy,
        sections,
        onProgress: (done, total, currentSlug) => {
          setImportProgress(
            currentSlug ? `Importing draft ${done + 1} of ${total} (${currentSlug})…` : '',
          )
        },
      })

      if (res.failed.length > 0) {
        setError(
          `Imported ${res.importedSlugs.length} draft(s); ${res.failed.length} failed: ${res.failed
            .slice(0, 3)
            .map((f) => `${f.slug} (${f.error})`)
            .join('; ')}`,
        )
      } else {
        setMessage(
          `Successfully imported ${res.importedSlugs.length} Mezmur record(s) as unpublished drafts (status = draft, featured = false).`,
        )
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Bulk draft import failed.')
    } finally {
      setImporting(false)
      setImportProgress('')
    }
  }

  return (
    <>
      <div className={s.heading}>
        <div>
          <p className={s.eyebrow}>STAGING &amp; BULK IMPORT PREVIEW</p>
          <h1>Mezmur CSV Import Preview</h1>
          <p className={s.muted}>
            Upload <code>mezmurs_2000.csv</code>, inspect and edit titles, taxonomy, hymn sections, and Zemari
            profiles, review duplicates and source attribution, and stage records for draft import.
            <strong> All records remain in staging until explicitly imported as drafts.</strong>
          </p>
        </div>
        <div className={s.actions}>
          <Link to={ADMIN_PATHS.hymnsMezmur}>← Mezmur Library</Link>
          <button type="button" onClick={downloadEditedCsv}>
            Export Staged CSV (UTF-8 BOM)
          </button>
        </div>
      </div>

      <AsyncNotice {...meta} retry={meta.reload} />

      {message && (
        <p role="status" className={s.success}>
          {message}
        </p>
      )}
      {error && (
        <p role="alert" className={s.error}>
          {error}
        </p>
      )}

      {/* Upload & Staging Controls */}
      <section className={s.card} style={{ marginBottom: 20 }}>
        <div className={s.twoColumns} style={{ alignItems: 'end' }}>
          <label>
            Upload Mezmur CSV file (UTF-8 / UTF-8 with BOM)
            <input
              type="file"
              accept=".csv,text/csv"
              aria-label="Upload Mezmur CSV file"
              onChange={(e) => {
                const file = e.target.files?.[0]
                e.target.value = ''
                void handleFileUpload(file)
              }}
            />
          </label>
          <div className={s.actions}>
            <span className={s.muted}>
              Active dataset: <strong>{fileName}</strong>
            </span>
            <button type="button" onClick={loadSampleRows}>
              Reset to Sample Rows
            </button>
          </div>
        </div>
      </section>

      {/* Summary Metrics */}
      <div className={s.stats}>
        <div className={s.card}>
          <span className={s.muted}>Total Staged Rows</span>
          <strong className={s.stat}>{summary.totalRows}</strong>
        </div>
        <div className={s.card}>
          <span className={s.muted}>Import-Ready (Draft)</span>
          <strong className={s.stat}>{summary.importReadyCount}</strong>
        </div>
        <div className={s.card}>
          <span className={s.muted}>Selected for Draft Import</span>
          <strong className={s.stat}>{summary.selectedCount}</strong>
        </div>
        <div className={s.card}>
          <span className={s.muted}>Duplicates Flagged</span>
          <strong className={s.stat}>{summary.duplicateCount}</strong>
        </div>
        <div className={s.card}>
          <span className={s.muted}>Missing / Rights-Review Lyrics</span>
          <strong className={s.stat}>
            {summary.missingLyricsCount + summary.rightsReviewLyricsCount}
          </strong>
        </div>
        <div className={s.card}>
          <span className={s.muted}>Review Required</span>
          <strong className={s.stat}>{summary.reviewRequiredCount}</strong>
        </div>
      </div>

      {/* View Mode Tabs */}
      <div className={s.pageTabs} role="tablist" aria-label="Import review views">
        {(
          [
            ['all', `All Staged (${summary.totalRows})`],
            ['duplicates', `Duplicates (${summary.duplicateCount})`],
            [
              'missing_lyrics',
              `Missing / Rights Lyrics (${summary.missingLyricsCount + summary.rightsReviewLyricsCount})`,
            ],
            ['attribution', 'Source Attribution'],
            ['review_required', `Review Required (${summary.reviewRequiredCount})`],
          ] as const
        ).map(([mode, labelText]) => (
          <button
            key={mode}
            type="button"
            role="tab"
            aria-selected={viewMode === mode}
            className={viewMode === mode ? s.pageTabActive : ''}
            onClick={() => {
              setViewMode(mode)
              setPage(1)
            }}
          >
            {labelText}
          </button>
        ))}
      </div>

      {/* Search & Filters */}
      <section className={s.card} style={{ marginBottom: 20 }}>
        <div className={s.filters}>
          <label>
            Search
            <input
              aria-label="Search staged rows"
              value={search}
              onChange={(e) => {
                setSearch(e.target.value)
                setPage(1)
              }}
              placeholder="Amharic title, transliteration, slug, Zemari, URL…"
            />
          </label>
          <label>
            Category
            <select
              aria-label="Filter by category"
              value={categoryFilter}
              onChange={(e) => {
                setCategoryFilter(e.target.value)
                setPage(1)
              }}
            >
              <option value="">All categories</option>
              {CANONICAL_CATEGORIES.map((cat) => (
                <option key={cat} value={cat}>
                  {cat}
                </option>
              ))}
            </select>
          </label>
          <label>
            Primary Occasion
            <select
              aria-label="Filter by occasion"
              value={occasionFilter}
              onChange={(e) => {
                setOccasionFilter(e.target.value)
                setPage(1)
              }}
            >
              <option value="">All occasions</option>
              {CANONICAL_OCCASIONS.map((occ) => (
                <option key={occ} value={occ}>
                  {occ}
                </option>
              ))}
            </select>
          </label>
          <label>
            Lyrics Status
            <select
              aria-label="Filter by lyrics status"
              value={lyricsFilter}
              onChange={(e) => {
                setLyricsFilter(e.target.value)
                setPage(1)
              }}
            >
              <option value="">All lyrics statuses</option>
              <option value="available">Available</option>
              <option value="missing">Missing</option>
              <option value="rights_review_required">Rights review required</option>
            </select>
          </label>
          <label>
            Zemari Profile Match
            <select
              aria-label="Filter by Zemari match"
              value={zemariMatchFilter}
              onChange={(e) => {
                setZemariMatchFilter(e.target.value)
                setPage(1)
              }}
            >
              <option value="">All</option>
              <option value="matched">Matched to Zemari profile ({summary.matchedZemariCount})</option>
              <option value="unmatched">Unmatched Zemari name ({summary.unmatchedZemariCount})</option>
              <option value="empty">No Zemari / Choir</option>
            </select>
          </label>
          <label className={s.check} style={{ alignSelf: 'end', paddingBottom: 10 }}>
            <input
              type="checkbox"
              checked={selectedOnly}
              onChange={(e) => {
                setSelectedOnly(e.target.checked)
                setPage(1)
              }}
            />
            Selected only
          </label>
        </div>

        <div className={s.actions} style={{ justifyContent: 'space-between' }}>
          <div className={s.actions}>
            <button
              type="button"
              onClick={() => toggleSelectAllFiltered(true)}
            >
              Select all import-ready in view ({filteredRows.filter((r) => r.importReady).length})
            </button>
            <button
              type="button"
              onClick={() => toggleSelectAllFiltered(false)}
            >
              Deselect in view
            </button>
            <button
              type="button"
              onClick={() => {
                setSearch('')
                setCategoryFilter('')
                setOccasionFilter('')
                setLyricsFilter('')
                setZemariMatchFilter('')
                setSelectedOnly(false)
                setViewMode('all')
                setPage(1)
              }}
            >
              Reset filters
            </button>
          </div>
          <div className={s.actions}>
            {importProgress && <span role="status">{importProgress}</span>}
            <button
              type="button"
              className={s.primary}
              disabled={!staff || importing || summary.selectedCount === 0}
              onClick={() => void runDraftImport()}
            >
              {importing
                ? 'Importing Drafts…'
                : `Import ${summary.selectedCount} Selected as Drafts`}
            </button>
          </div>
        </div>
      </section>

      {/* Staged Rows Table */}
      <p className={s.muted}>
        Showing {pagedRows.length} of {filteredRows.length} matching row(s) (Page {currentPage} of{' '}
        {totalPages})
      </p>

      {!pagedRows.length ? (
        <div className={s.card}>No staged rows match the current filter criteria.</div>
      ) : (
        <div className={s.tableWrap}>
          <table>
            <thead>
              <tr>
                <th scope="col">Select</th>
                <th scope="col">#</th>
                <th scope="col">Amharic Title</th>
                <th scope="col">Transliteration &amp; Slug</th>
                <th scope="col">Category</th>
                <th scope="col">Primary Occasion</th>
                <th scope="col">Hymn Sections</th>
                <th scope="col">Zemari &amp; Profile Match</th>
                <th scope="col">Lyrics &amp; Source</th>
                <th scope="col">Status / Validation</th>
                <th scope="col">Actions</th>
              </tr>
            </thead>
            <tbody>
              {pagedRows.map((row) => (
                <tr key={row.stagingId}>
                  <td>
                    <input
                      type="checkbox"
                      aria-label={`Select row ${row.rowNumber}`}
                      disabled={!row.importReady}
                      checked={row.selectedForImport}
                      onChange={(e) =>
                        updateRow(row.stagingId, { selectedForImport: e.target.checked })
                      }
                    />
                  </td>
                  <td>{row.rowNumber}</td>
                  <td style={{ minWidth: 190 }}>
                    <input
                      lang="am"
                      aria-label={`Amharic title row ${row.rowNumber}`}
                      value={row.amharic_title}
                      onChange={(e) =>
                        updateRow(row.stagingId, { amharic_title: e.target.value })
                      }
                    />
                  </td>
                  <td style={{ minWidth: 210 }}>
                    <input
                      aria-label={`Transliteration title row ${row.rowNumber}`}
                      value={row.transliteration_title}
                      onChange={(e) =>
                        updateRow(row.stagingId, { transliteration_title: e.target.value })
                      }
                    />
                    <small className={s.muted} style={{ display: 'block', marginTop: 4 }}>
                      <code>{row.slug}</code>
                    </small>
                  </td>
                  <td style={{ minWidth: 165 }}>
                    <select
                      aria-label={`Category row ${row.rowNumber}`}
                      value={row.category}
                      onChange={(e) => updateRow(row.stagingId, { category: e.target.value })}
                    >
                      {CANONICAL_CATEGORIES.map((cat) => (
                        <option key={cat} value={cat}>
                          {cat}
                        </option>
                      ))}
                      {!CANONICAL_CATEGORIES.includes(
                        row.category as (typeof CANONICAL_CATEGORIES)[number],
                      ) && <option value={row.category}>{row.category} (non-canonical)</option>}
                    </select>
                  </td>
                  <td style={{ minWidth: 165 }}>
                    <select
                      aria-label={`Occasion row ${row.rowNumber}`}
                      value={row.primary_occasion}
                      onChange={(e) =>
                        updateRow(row.stagingId, { primary_occasion: e.target.value })
                      }
                    >
                      {CANONICAL_OCCASIONS.map((occ) => (
                        <option key={occ} value={occ}>
                          {occ}
                        </option>
                      ))}
                      {row.primary_occasion &&
                        !CANONICAL_OCCASIONS.includes(
                          row.primary_occasion as (typeof CANONICAL_OCCASIONS)[number],
                        ) && (
                          <option value={row.primary_occasion}>
                            {row.primary_occasion} (non-canonical)
                          </option>
                        )}
                    </select>
                    {row.additional_occasions.length > 0 && (
                      <small className={s.muted} style={{ display: 'block', marginTop: 4 }}>
                        +{row.additional_occasions.join(', ')}
                      </small>
                    )}
                  </td>
                  <td style={{ minWidth: 170 }}>
                    <div style={{ display: 'flex', flexWrap: 'wrap', gap: 4 }}>
                      {row.hymn_sections.length ? (
                        row.hymn_sections.map((sec) => (
                          <span key={sec} className={s.badge}>
                            {sec}
                          </span>
                        ))
                      ) : (
                        <span className={s.muted}>None</span>
                      )}
                    </div>
                  </td>
                  <td style={{ minWidth: 190 }}>
                    <div style={{ fontSize: '0.82rem', marginBottom: 4 }} lang="am">
                      {row.zemari || <span className={s.muted}>Unidentified / Choir</span>}
                    </div>
                    <select
                      aria-label={`Zemari profile match row ${row.rowNumber}`}
                      value={row.matched_zemari_id || ''}
                      onChange={(e) =>
                        updateRow(row.stagingId, {
                          matched_zemari_id: e.target.value || null,
                        })
                      }
                    >
                      <option value="">No linked profile</option>
                      {singers.map((singer) => (
                        <option key={singer.id} value={singer.id}>
                          {singer.name}
                          {singer.name_amharic ? ` · ${singer.name_amharic}` : ''}
                        </option>
                      ))}
                    </select>
                  </td>
                  <td style={{ minWidth: 165 }}>
                    <span
                      className={s.badge}
                      data-status={
                        row.lyrics_status === 'available' ? 'published' : 'draft'
                      }
                    >
                      Lyrics: {row.lyrics_status.replace(/_/g, ' ')}
                    </span>
                    <div style={{ marginTop: 6, fontSize: '0.78rem' }}>
                      {row.source_url && (
                        <a href={row.source_url} target="_blank" rel="noreferrer">
                          Source ↗
                        </a>
                      )}
                      {row.source_url && row.youtube_url && ' · '}
                      {row.youtube_url && (
                        <a href={row.youtube_url} target="_blank" rel="noreferrer">
                          YouTube ↗
                        </a>
                      )}
                    </div>
                  </td>
                  <td style={{ minWidth: 175 }}>
                    {row.importReady ? (
                      <span className={s.badge} data-status="published">
                        Draft Ready ({Math.round(row.classification_confidence * 100)}%)
                      </span>
                    ) : (
                      <span className={s.badge} data-status="rejected">
                        Blocked
                      </span>
                    )}
                    {row.duplicateOfStagingId && (
                      <div className={s.error} style={{ padding: '4px 6px', margin: '4px 0 0', fontSize: '0.75rem' }}>
                        Duplicate of {row.duplicateOfStagingId} ({row.duplicateReason})
                      </div>
                    )}
                    {row.validationErrors.map((errText) => (
                      <div
                        key={errText}
                        className={s.error}
                        style={{ padding: '4px 6px', margin: '4px 0 0', fontSize: '0.75rem' }}
                      >
                        {errText}
                      </div>
                    ))}
                  </td>
                  <td>
                    <button type="button" onClick={() => setEditingRowId(row.stagingId)}>
                      Sections &amp; Details
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}

      {/* Pagination */}
      <div className={s.pagination}>
        <span>
          Page {currentPage} of {totalPages} ({filteredRows.length} rows)
        </span>
        <div className={s.actions}>
          <button
            type="button"
            disabled={currentPage <= 1}
            onClick={() => setPage((p) => Math.max(1, p - 1))}
          >
            Previous
          </button>
          <button
            type="button"
            disabled={currentPage >= totalPages}
            onClick={() => setPage((p) => Math.min(totalPages, p + 1))}
          >
            Next
          </button>
        </div>
      </div>

      {/* Detailed Row Modal for Hymn Sections, Multi-Occasions, Slug, Lyrics & Attribution */}
      {editingRow && (
        <Modal
          title={`Edit Staged Row #${editingRow.rowNumber} — ${editingRow.amharic_title || editingRow.transliteration_title}`}
          close={() => setEditingRowId(null)}
        >
          <div className={s.fields}>
            <div className={s.twoColumns}>
              <label>
                Amharic Title
                <input
                  lang="am"
                  value={editingRow.amharic_title}
                  onChange={(e) =>
                    updateRow(editingRow.stagingId, { amharic_title: e.target.value })
                  }
                />
              </label>
              <label>
                Transliteration Title *
                <input
                  value={editingRow.transliteration_title}
                  onChange={(e) =>
                    updateRow(editingRow.stagingId, { transliteration_title: e.target.value })
                  }
                />
              </label>
            </div>

            <div className={s.twoColumns}>
              <label>
                Slug *
                <input
                  value={editingRow.slug}
                  onChange={(e) => updateRow(editingRow.stagingId, { slug: e.target.value })}
                />
              </label>
              <div className={s.actions} style={{ alignSelf: 'end' }}>
                <button
                  type="button"
                  onClick={() =>
                    updateRow(editingRow.stagingId, {
                      slug: slugify(editingRow.transliteration_title || editingRow.amharic_title),
                    })
                  }
                >
                  Regenerate Slug from Title
                </button>
              </div>
            </div>

            <div className={s.twoColumns}>
              <label>
                Zemari Name (from source)
                <input
                  lang="am"
                  value={editingRow.zemari}
                  onChange={(e) => updateRow(editingRow.stagingId, { zemari: e.target.value })}
                />
              </label>
              <label>
                Matched Zemari Profile (public.zemaris)
                <select
                  value={editingRow.matched_zemari_id || ''}
                  onChange={(e) =>
                    updateRow(editingRow.stagingId, {
                      matched_zemari_id: e.target.value || null,
                    })
                  }
                >
                  <option value="">No linked Zemari profile</option>
                  {singers.map((singer) => (
                    <option key={singer.id} value={singer.id}>
                      {singer.name}
                      {singer.name_amharic ? ` · ${singer.name_amharic}` : ''}
                    </option>
                  ))}
                </select>
              </label>
            </div>

            <div className={s.twoColumns}>
              <label>
                Language
                <select
                  value={editingRow.language}
                  onChange={(e) => updateRow(editingRow.stagingId, { language: e.target.value })}
                >
                  <option value="amharic">Amharic</option>
                  <option value="geez">Ge&apos;ez</option>
                  <option value="english">English</option>
                  <option value="oromo">Oromo</option>
                  <option value="tigrinya">Tigrinya</option>
                  <option value="bilingual">Bilingual</option>
                </select>
              </label>
              <label>
                Form (Mezmur / Wereb)
                <select
                  value={editingRow.form}
                  onChange={(e) =>
                    updateRow(editingRow.stagingId, {
                      form: e.target.value === 'werb' ? 'werb' : 'mezmur',
                    })
                  }
                >
                  <option value="mezmur">Mezmur</option>
                  <option value="werb">Wereb</option>
                </select>
              </label>
            </div>

            <fieldset>
              <legend style={{ fontWeight: 600, marginBottom: 8 }}>
                Hymn Sections (multi-select)
              </legend>
              <div className={s.twoColumns}>
                {sectionOptions.map((sec) => {
                  const checked = editingRow.hymn_sections.includes(sec.slug)
                  return (
                    <label key={sec.slug} className={s.check}>
                      <input
                        type="checkbox"
                        checked={checked}
                        onChange={(e) => {
                          const next = e.target.checked
                            ? [...editingRow.hymn_sections, sec.slug]
                            : editingRow.hymn_sections.filter((sSlug) => sSlug !== sec.slug)
                          updateRow(editingRow.stagingId, { hymn_sections: next })
                        }}
                      />
                      {sec.title} <span className={s.muted}>({sec.slug})</span>
                    </label>
                  )
                })}
              </div>
            </fieldset>

            <fieldset>
              <legend style={{ fontWeight: 600, marginBottom: 8 }}>
                Additional Occasions (multi-select)
              </legend>
              <div className={s.twoColumns}>
                {CANONICAL_OCCASIONS.map((occ) => {
                  const checked = editingRow.additional_occasions.includes(occ)
                  return (
                    <label key={occ} className={s.check}>
                      <input
                        type="checkbox"
                        checked={checked}
                        onChange={(e) => {
                          const next = e.target.checked
                            ? [...editingRow.additional_occasions, occ]
                            : editingRow.additional_occasions.filter((o) => o !== occ)
                          updateRow(editingRow.stagingId, { additional_occasions: next })
                        }}
                      />
                      {occ}
                    </label>
                  )
                })}
              </div>
            </fieldset>

            <div className={s.twoColumns}>
              <label>
                Source URL (Attribution)
                <input
                  value={editingRow.source_url}
                  onChange={(e) =>
                    updateRow(editingRow.stagingId, { source_url: e.target.value })
                  }
                />
              </label>
              <label>
                YouTube URL
                <input
                  value={editingRow.youtube_url}
                  onChange={(e) =>
                    updateRow(editingRow.stagingId, { youtube_url: e.target.value })
                  }
                />
              </label>
            </div>

            <label>
              Amharic Lyrics (leave blank if unlicensed or unavailable)
              <textarea
                lang="am"
                value={editingRow.amharic_lyrics}
                onChange={(e) =>
                  updateRow(editingRow.stagingId, {
                    amharic_lyrics: e.target.value,
                    lyrics_status: e.target.value.trim() ? 'available' : editingRow.lyrics_status,
                  })
                }
              />
            </label>

            <label className={s.check}>
              <input
                type="checkbox"
                checked={editingRow.review_required}
                onChange={(e) =>
                  updateRow(editingRow.stagingId, { review_required: e.target.checked })
                }
              />
              Flagged for human editorial review
            </label>

            <div className={s.actions}>
              <button type="button" className={s.primary} onClick={() => setEditingRowId(null)}>
                Done
              </button>
            </div>
          </div>
        </Modal>
      )}
    </>
  )
}
