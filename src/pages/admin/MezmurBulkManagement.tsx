import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { formatErrorMessage } from '../../lib/cms/errorMessage'
import { MEZMUR_LANGUAGES, mezmurLanguageLabel, type MezmurLanguageCode } from '../../lib/mezmur/mezmurLanguage'
import { classifyZemariMatch, type ZemariCandidate } from '../../lib/mezmur/zemariMatching'
import { Modal } from './AdminUi'
import {
  applyMezmurSuggestions, assignCategoryToMezmurs, assignLanguageToMezmurs,
  autoCategorizeMezmurs, autoFormatMezmurLyrics, cancelMezmurEnrichmentJob, checkMezmurAiAvailability, linkMezmursToZemaris,
  createMezmurEnrichmentJob, exportClassificationResultsCsv, exportFailedClassificationsCsv,
  exportFailedLyricsFormatCsv, exportLyricsFormatResultsCsv,
  exportPublicationResultsCsv, exportSuggestionsCsv,
  formatRecordedDate, getMezmurEnrichmentJob, getSupabaseMezmurBulkSnapshot,
  listMezmurSuggestions, publishEligibleMezmurs, resumeMezmurEnrichmentJob, auditPublishedMezmurVisibility,
  type AutoCategorizeMode, type AutoCategorizeResult, type AutoFormatLyricsMode,
  type AutoFormatLyricsProgress, type AutoFormatLyricsResult,
  type BulkDashboard, type BulkJobMode,
  type BulkMezmurRecord, type BulkPublishResult, type ClassificationRunProgress, type PublicVisibilityAudit,
  type EnrichmentJob, type EnrichmentSuggestion,
} from '../../lib/cms/mezmurBulkService'
import s from './Admin.module.css'
import b from './MezmurBulkManagement.module.css'

const PAGE_SIZE = 50
const EMPTY: BulkDashboard = {
  drafts: 0, with_lyrics: 0, missing_lyrics: 0, matched_zemaris: 0, unmatched_zemaris: 0,
  categorized: 0, missing_categories: 0, missing_occasions: 0, needs_review: 0,
  eligible: 0, blocked: 0, published: 0, failed: 0, failed_jobs: 0,
}
const METRICS: Array<[keyof BulkDashboard, string, string]> = [
  ['drafts', 'Draft Mezmurs', 'ረቂቅ መዝሙሮች'], ['with_lyrics', 'With lyrics', 'ግጥም ያላቸው'],
  ['missing_lyrics', 'Missing lyrics', 'ግጥም የሌላቸው'], ['matched_zemaris', 'Linked Zemaris', 'ዘማሪ የተዛመዱ'],
  ['unmatched_zemaris', 'Zemari links needed', 'የዘማሪ ትስስር የሚፈልጉ'], ['categorized', 'Categorized', 'የተመደቡ'],
  ['missing_categories', 'Missing categories', 'ምድብ የሌላቸው'], ['missing_occasions', 'Missing occasions', 'አጋጣሚ የሌላቸው'],
  ['needs_review', 'Pending review', 'ምርመራ የሚፈልጉ'], ['eligible', 'Eligible to publish', 'ለማተም ዝግጁ'],
  ['blocked', 'Blocked', 'የታገዱ'], ['published', 'Published', 'የታተሙ'], ['failed_jobs', 'Failed jobs', 'ያልተሳኩ ሥራዎች'],
]

function pct(value: number | null) { return value == null ? '—' : `${Math.round(Number(value) * 100)}%` }
function causeText(cause: unknown) { return formatErrorMessage(cause) }

export function MezmurBulkManagement() {
  const { profile } = useAuth()
  const [dashboard, setDashboard] = useState(EMPTY)
  const [records, setRecords] = useState<BulkMezmurRecord[]>([])
  const [categories, setCategories] = useState<string[]>([])
  const [singers, setSingers] = useState<ZemariCandidate[]>([])
  const [jobs, setJobs] = useState<EnrichmentJob[]>([])
  const [job, setJob] = useState<EnrichmentJob | null>(null)
  const [suggestions, setSuggestions] = useState<EnrichmentSuggestion[]>([])
  const [selectedSuggestions, setSelectedSuggestions] = useState<Set<string>>(new Set())
  const [selectedRecords, setSelectedRecords] = useState<Set<string>>(new Set())
  const [search, setSearch] = useState('')
  const [statusFilter, setStatusFilter] = useState('draft')
  const [categoryFilter, setCategoryFilter] = useState('')
  const [singerFilter, setSingerFilter] = useState('')
  const [lyricsFilter, setLyricsFilter] = useState('')
  const [eligibilityFilter, setEligibilityFilter] = useState('')
  const [languageFilter, setLanguageFilter] = useState('')
  const [manualCategory, setManualCategory] = useState('')
  const [manualLanguage, setManualLanguage] = useState<MezmurLanguageCode | ''>('')
  const [page, setPage] = useState(1)
  const [busy, setBusy] = useState<string | null>(null)
  const [notice, setNotice] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [aiError, setAiError] = useState<string | null>(null)
  const [loading, setLoading] = useState(true)
  const [publicationResult, setPublicationResult] = useState<BulkPublishResult | null>(null)
  const [visibilityAudit, setVisibilityAudit] = useState<PublicVisibilityAudit | null>(null)
  const [showAutoLinkModal, setShowAutoLinkModal] = useState(false)
  const [categorizeModalMode, setCategorizeModalMode] = useState<AutoCategorizeMode | null>(null)
  const [categorizeOverwrite, setCategorizeOverwrite] = useState(false)
  const [categorizeProgress, setCategorizeProgress] = useState<ClassificationRunProgress | null>(null)
  const [categorizeResult, setCategorizeResult] = useState<AutoCategorizeResult | null>(null)
  const [formatModalMode, setFormatModalMode] = useState<AutoFormatLyricsMode | null>(null)
  const [formatProgress, setFormatProgress] = useState<AutoFormatLyricsProgress | null>(null)
  const [formatResult, setFormatResult] = useState<AutoFormatLyricsResult | null>(null)
  const abortRef = useRef<AbortController | null>(null)
  const formatAbortRef = useRef<AbortController | null>(null)
  const initialLoadStarted = useRef(false)
  const aiCheckStarted = useRef(false)
  const superAdmin = profile?.role === 'super_admin'
  const canApply = profile?.role === 'admin' || superAdmin

  const refresh = useCallback(async (jobId?: string) => {
    const snapshot = await getSupabaseMezmurBulkSnapshot()
    setDashboard(snapshot.dashboard); setRecords(snapshot.records); setJobs(snapshot.jobs)
    setCategories(snapshot.categorySlugs); setSingers(snapshot.singers)
    const target = jobId || snapshot.jobs[0]?.id
    if (target) {
      const [current, rows] = await Promise.all([getMezmurEnrichmentJob(target), listMezmurSuggestions(target)])
      setJob(current); setSuggestions(rows)
    } else { setJob(null); setSuggestions([]) }
  }, [])

  useEffect(() => {
    if (initialLoadStarted.current) return
    initialLoadStarted.current = true
    void refresh().catch((cause) => setError(causeText(cause))).finally(() => setLoading(false))
  }, [refresh])

  useEffect(() => {
    if (aiCheckStarted.current) return
    aiCheckStarted.current = true
    void checkMezmurAiAvailability().catch((cause) => setAiError(causeText(cause)))
  }, [])

  useEffect(() => {
    if (!job || !['queued', 'running', 'cancel_requested'].includes(job.status)) return
    const timer = window.setInterval(() => void refresh(job.id).catch((cause) => setError(causeText(cause))), 3000)
    return () => window.clearInterval(timer)
  }, [job, refresh])

  const filtered = useMemo(() => {
    const needle = search.trim().toLocaleLowerCase()
    return records.filter((row) => {
      if (statusFilter && row.status !== statusFilter) return false
      if (categoryFilter === '__missing__' && row.category_slugs.length) return false
      if (categoryFilter && categoryFilter !== '__missing__' && !row.category_slugs.includes(categoryFilter)) return false
      if (singerFilter === '__linked__' && !row.zemari_verified) return false
      if (singerFilter === '__unlinked__' && row.zemari_verified) return false
      if (singerFilter === '__matchable__' && row.zemari_match.state !== 'available') return false
      if (singerFilter === '__ambiguous__' && row.zemari_match.state !== 'ambiguous') return false
      if (singerFilter === '__missing__' && row.zemari_match.state !== 'not_recorded') return false
      if (singerFilter && !singerFilter.startsWith('__') && row.zemari_id !== singerFilter) return false
      if (lyricsFilter === 'with' && !row.has_lyrics) return false
      if (lyricsFilter === 'missing' && row.has_lyrics) return false
      if (eligibilityFilter === 'eligible' && !row.publication_eligible) return false
      if (eligibilityFilter === 'blocked' && row.publication_eligible) return false
      if (languageFilter === '__missing__' && row.language) return false
      if (languageFilter && languageFilter !== '__missing__' && row.language !== languageFilter) return false
      return !needle || `${row.title} ${row.title_amharic || ''} ${row.slug} ${row.import_id} ${row.singer_name || ''} ${row.zemari_name || ''}`.toLocaleLowerCase().includes(needle)
    })
  }, [records, search, statusFilter, categoryFilter, singerFilter, lyricsFilter, eligibilityFilter, languageFilter])
  const pages = Math.max(1, Math.ceil(filtered.length / PAGE_SIZE))
  const visible = filtered.slice((Math.min(page, pages) - 1) * PAGE_SIZE, Math.min(page, pages) * PAGE_SIZE)
  const filteredDrafts = filtered.filter((row) => row.status === 'draft')
  const filteredTotal = filtered.length
  const filteredMissingCategories = useMemo(
    () => filtered.filter((row) => row.category_slugs.length === 0).length,
    [filtered],
  )
  const filteredMissingOccasions = useMemo(
    () => filtered.filter((row) => row.occasion_slugs.length === 0).length,
    [filtered],
  )
  const selectedRows = useMemo(
    () => records.filter((row) => selectedRecords.has(row.import_id)),
    [records, selectedRecords],
  )
  const selectedDrafts = useMemo(
    () => selectedRows.filter((row) => row.status === 'draft'),
    [selectedRows],
  )
  const selectedEligible = useMemo(
    () => selectedDrafts.filter((row) => row.publication_eligible),
    [selectedDrafts],
  )
  const allEligible = useMemo(
    () => filteredDrafts.filter((row) => row.publication_eligible),
    [filteredDrafts],
  )
  const recordById = useMemo(() => new Map(records.map((row) => [row.import_id, row])), [records])

  const categorizeTargets = useMemo(() => {
    if (!categorizeModalMode) return []
    if (categorizeModalMode === 'all') return filtered
    if (categorizeModalMode === 'missing_categories') return filtered.filter((r) => r.category_slugs.length === 0)
    if (categorizeModalMode === 'missing_occasions') return filtered.filter((r) => r.occasion_slugs.length === 0)
    if (categorizeModalMode === 'selected') return selectedRows
    return []
  }, [categorizeModalMode, filtered, selectedRows])

  const totalMezmurs = records.length
  const totalDraftsCount = useMemo(() => records.filter((r) => r.status === 'draft').length, [records])
  const totalPublishedCount = useMemo(() => records.filter((r) => r.status === 'published').length, [records])
  const totalWithLyrics = useMemo(() => records.filter((r) => r.has_lyrics).length, [records])

  const formatModalTargetsCount = useMemo(() => {
    if (!formatModalMode) return 0
    switch (formatModalMode) {
      case 'all': return records.length
      case 'draft': return totalDraftsCount
      case 'published': return totalPublishedCount
      case 'selected': return selectedRecords.size
      case 'unformatted_only': return totalWithLyrics
      case 'reformat_existing': return totalWithLyrics
      default: return 0
    }
  }, [formatModalMode, records.length, totalDraftsCount, totalPublishedCount, selectedRecords.size, totalWithLyrics])

  const autoLinkBreakdown = useMemo(() => {
    const alreadyLinked: BulkMezmurRecord[] = []
    const safeExact: BulkMezmurRecord[] = []
    const safeNormalized: BulkMezmurRecord[] = []
    const ambiguous: BulkMezmurRecord[] = []
    const notFound: BulkMezmurRecord[] = []

    for (const row of filteredDrafts) {
      if (row.zemari_verified) {
        alreadyLinked.push(row)
        continue
      }
      const classification = classifyZemariMatch(row.zemari_match)
      if (classification === 'already_linked') {
        alreadyLinked.push(row)
      } else if (classification === 'safe_exact') {
        safeExact.push(row)
      } else if (classification === 'safe_normalized') {
        safeNormalized.push(row)
      } else if (classification === 'ambiguous') {
        ambiguous.push(row)
      } else {
        notFound.push(row)
      }
    }

    const safeMatches = [...safeExact, ...safeNormalized]
    return {
      alreadyLinked,
      safeExact,
      safeNormalized,
      ambiguous,
      notFound,
      safeMatches,
      totalAffected: safeMatches.length,
      totalDrafts: filteredDrafts.length,
    }
  }, [filteredDrafts])

  useEffect(() => { setPage(1) }, [search, statusFilter, categoryFilter, singerFilter, lyricsFilter, eligibilityFilter, languageFilter])

  async function applyManualLanguage() {
    if (!manualLanguage || !selectedRows.length || !canApply) return
    const existing = selectedRows.filter((row) => row.language)
    if (!window.confirm(`Assign ${mezmurLanguageLabel(manualLanguage)} to ${selectedRows.length} selected Draft Mezmur(s)?${existing.length ? ` This replaces ${existing.length} existing language assignment(s).` : ''}`)) return
    setBusy('language'); setError(null)
    try {
      const results = await assignLanguageToMezmurs(selectedRows, manualLanguage, existing.length > 0)
      const failed = results.filter((item) => !item.ok)
      setNotice(`${results.length - failed.length} language assignment(s) applied; ${failed.length} failed.`)
      if (failed.length) setError(failed.map((item) => `${item.importId}: ${item.error}`).join(' · '))
      await refresh(job?.id)
    } catch (cause) { setError(causeText(cause)) } finally { setBusy(null) }
  }

  async function confirmAutoLink() {
    if (!autoLinkBreakdown.safeMatches.length || !canApply) return
    setBusy('zemari-match')
    setError(null)
    setShowAutoLinkModal(false)
    try {
      const payload = autoLinkBreakdown.safeMatches.map((row) => ({
        importId: row.import_id,
        zemariId: row.zemari_match.state === 'available' ? row.zemari_match.zemariId : '',
      }))
      const results = await linkMezmursToZemaris(payload, false)
      const failed = results.filter((item) => !item.ok)
      const succeeded = results.length - failed.length
      setNotice(`Auto-linked ${succeeded} Mezmur(s) to existing Zemaris; ${failed.length} failed or skipped. Original singer text preserved.`)
      if (failed.length) setError(failed.map((item) => `${item.importId}: ${item.error || item.outcome}`).join(' · '))
      await refresh(job?.id)
    } catch (cause) { setError(causeText(cause)) } finally { setBusy(null) }
  }

  async function manualLink(row: BulkMezmurRecord, zemariId: string) {
    if (!zemariId || !canApply) return
    const target = singers.find((zemari) => zemari.id === zemariId)
    if (!window.confirm(`Link “${row.title}” to Zemari “${target?.name || target?.nameAmharic || zemariId}”? Original singer text will be preserved.`)) return
    setBusy(`link-${row.import_id}`); setError(null)
    try {
      const [result] = await linkMezmursToZemaris([{ importId: row.import_id, zemariId }], Boolean(row.zemari_id))
      if (!result?.ok) throw new Error(result?.error || 'The Zemari relationship was not linked.')
      setNotice(`Linked “${row.title}” to the selected Zemari.`)
      await refresh(job?.id)
    } catch (cause) { setError(causeText(cause)) } finally { setBusy(null) }
  }

  function relationshipLabel(row: BulkMezmurRecord) {
    if (row.zemari_verified || row.zemari_match.state === 'linked') return 'Linked'
    if (row.zemari_match.state === 'available') {
      if (row.zemari_match.method === 'exact_name') return 'Ready to link (Exact)'
      if (row.zemari_match.method === 'verified_alias') return 'Ready to link (Alias)'
      return 'Ready to link (Normalized)'
    }
    if (row.zemari_match.state === 'ambiguous') return 'Needs review'
    if (row.zemari_match.state === 'not_recorded') return 'Not recorded'
    return 'Name recorded'
  }

  async function run(mode: BulkJobMode, importIds: string[] = []) {
    setBusy(mode); setError(null); setAiError(null); setNotice(null)
    try {
      const ids = mode === 'selected' ? importIds : []
      if (mode === 'selected' && !ids.length) throw new Error('Select at least one Draft Mezmur.')
      const created = await createMezmurEnrichmentJob(mode, ids)
      setJob(created); setSuggestions([]); setSelectedSuggestions(new Set())
      setNotice('AI processing started. Supabase will retain progress if you leave this page.')
      await refresh(created.id)
    } catch (cause) { setAiError(causeText(cause)) } finally { setBusy(null) }
  }

  async function applySelectedSuggestions() {
    const ids = [...selectedSuggestions]
    if (!ids.length || !job) return
    setBusy('apply'); setError(null)
    try {
      const result = await applyMezmurSuggestions(job.id, ids)
      const failed = result.filter((item) => !item.ok)
      setNotice(`${result.length - failed.length} suggestion(s) applied; ${failed.length} failed.`)
      if (failed.length) setError(failed.map((item) => item.error).filter(Boolean).join(' · '))
      setSelectedSuggestions(new Set()); await refresh(job.id)
    } catch (cause) { setError(causeText(cause)) } finally { setBusy(null) }
  }

  async function applyManualCategory() {
    if (!manualCategory || !selectedRows.length || !canApply) return
    if (!window.confirm(`Add category “${manualCategory}” to ${selectedRows.length} selected Draft Mezmur(s)? Existing categories and occasions will be preserved.`)) return
    setBusy('category'); setError(null)
    try {
      const results = await assignCategoryToMezmurs(selectedRows, manualCategory)
      const failed = results.filter((item) => !item.ok)
      setNotice(`${results.length - failed.length} classification(s) applied; ${failed.length} failed.`)
      if (failed.length) setError(failed.map((item) => `${item.importId}: ${item.error}`).join(' · '))
      await refresh(job?.id)
    } catch (cause) { setError(causeText(cause)) } finally { setBusy(null) }
  }

  async function publishRows(rows: BulkMezmurRecord[], label: string) {
    if (!superAdmin || !rows.length) return
    const eligible = rows.filter((row) => row.publication_eligible)
    const blocked = rows.length - eligible.length
    if (!window.confirm(`${label}: publish ${eligible.length} eligible Mezmur(s); leave ${blocked} blocked record(s) as Draft? Database eligibility and permissions will be checked again.`)) return
    setBusy('publish'); setError(null); setPublicationResult(null)
    try {
      const result = await publishEligibleMezmurs(eligible.map((row) => row.import_id))
      setPublicationResult(result)
      setNotice(`Published ${result.published}; ${result.published_missing_public} published but missing from mezmur_public; skipped ${result.skipped}; failed ${result.failed}.`)
      if (result.failed || result.published_missing_public) setError(result.results.filter((item) => item.outcome === 'failed' || item.outcome === 'published_missing_public').map((item) => item.reason).filter(Boolean).join(' · '))
      const retryIds = new Set(result.results.filter((item) => item.outcome === 'failed' || item.outcome === 'published_missing_public').map((item) => item.import_id))
      setSelectedRecords(retryIds); await refresh(job?.id)
    } catch (cause) { setError(causeText(cause)) } finally { setBusy(null) }
  }

  function selectDraftsOnCurrentPage() {
    setSelectedRecords((current) => new Set([...current, ...visible.filter((row) => row.status === 'draft').map((row) => row.import_id)]))
  }

  function selectAllMatchingDrafts() {
    const matchingDrafts = filtered.filter((row) => row.status === 'draft')
    if (!matchingDrafts.length) return
    if (!window.confirm(`Select all ${matchingDrafts.length} matching Draft Mezmurs across every page?`)) return
    setSelectedRecords((current) => new Set([...current, ...matchingDrafts.map((row) => row.import_id)]))
  }

  async function repairMissingPublicMezmurs() {
    if (!superAdmin) return
    setBusy('visibility-audit'); setError(null); setVisibilityAudit(null)
    try {
      const result = await auditPublishedMezmurVisibility(records)
      setVisibilityAudit(result)
      setNotice(`Public visibility audit: ${result.visible} visible, ${result.missing} missing from mezmur_public. No unsafe status toggles were performed.`)
      if (result.missing) setError(result.missingRecords.map((row) => `${row.title || row.slug}: ${row.reason}`).join(' · '))
    } catch (cause) { setError(causeText(cause)) } finally { setBusy(null) }
  }

  async function runCategorization() {
    if (!categorizeModalMode) return
    const mode = categorizeModalMode
    setCategorizeModalMode(null)
    setBusy('categorize')
    setError(null)
    setCategorizeResult(null)
    const ac = new AbortController()
    abortRef.current = ac

    try {
      const result = await autoCategorizeMezmurs(categorizeTargets, {
        mode,
        selectedIds: selectedRecords,
        overwrite: categorizeOverwrite,
        onProgress: (p) => setCategorizeProgress(p),
        signal: ac.signal,
      })
      setCategorizeResult(result)
      setNotice(
        `Auto-categorization complete: ${result.analyzed} analyzed (${result.draftCount} Draft, ${result.publishedCount} Published), ${result.saved} database-verified. Categories: ${result.categoriesInserted} inserted and ${result.categoriesAlreadyPresent} already present. Occasions: ${result.occasionsInserted} inserted and ${result.occasionsAlreadyPresent} already present. ${result.manualRelationshipsPreserved} manual relationships preserved; ${result.failed} failed; ${result.skipped} unchanged.`,
      )
      await refresh(job?.id)
    } catch (cause) {
      setError(causeText(cause))
    } finally {
      setBusy(null)
      abortRef.current = null
    }
  }

  async function runLyricsFormatting() {
    if (!formatModalMode) return
    const mode = formatModalMode
    setFormatModalMode(null)
    setBusy('lyrics-format')
    setError(null)
    setFormatResult(null)
    const ac = new AbortController()
    formatAbortRef.current = ac

    try {
      const result = await autoFormatMezmurLyrics(records, {
        mode,
        selectedIds: selectedRecords,
        onProgress: (p) => setFormatProgress(p),
        signal: ac.signal,
      })
      setFormatResult(result)
      setNotice(
        `Auto-format lyrics complete: ${result.total} analyzed (${result.draftCount} Draft, ${result.publishedCount} Published), ${result.formatted} formatted & saved, ${result.pairedAligned} pairs aligned, ${result.paragraphsAligned} sections aligned, ${result.alreadyFormatted} already formatted, ${result.missingLyrics} missing lyrics, ${result.failed} failed.`,
      )
      await refresh(job?.id)
    } catch (cause) {
      setError(causeText(cause))
    } finally {
      setBusy(null)
      formatAbortRef.current = null
    }
  }

  async function changeJobState(action: 'cancel' | 'resume') {
    if (!job) return
    setBusy(action); setAiError(null)
    try {
      if (action === 'cancel') await cancelMezmurEnrichmentJob(job.id); else await resumeMezmurEnrichmentJob(job.id)
      await refresh(job.id)
    } catch (cause) { setAiError(causeText(cause)) } finally { setBusy(null) }
  }

  return <div className={b.page}>
    <header className={b.header}><div><p className={s.eyebrow}>MEZMUR CMS · የመዝሙር አስተዳደር</p><h1>Bulk Management</h1>
      <p className={s.muted}>Supabase is the system of record. AI enrichment is optional and never publishes automatically.</p></div>
      <button type="button" onClick={() => void refresh(job?.id).catch((cause) => setError(causeText(cause)))} disabled={Boolean(busy)}>Check Eligibility / Refresh</button></header>
    {error ? <p className={s.error} role="alert">{error}</p> : null}
    {aiError ? <p className={s.notice} role="status">{aiError}</p> : null}
    {notice ? <p className={s.success} role="status">{notice}</p> : null}
    {loading ? <p className={s.notice} role="status">Scanning canonical Supabase Mezmurs in paginated batches…</p> : null}
    {busy === 'categorize' && categorizeProgress ? (
      <div className={s.card} style={{ borderLeft: '4px solid var(--color-accent)' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          <strong>Auto-Categorizing Mezmurs: {categorizeProgress.phase}…</strong>
          <button type="button" className={s.danger} onClick={() => abortRef.current?.abort()}>Stop / Cancel</button>
        </div>
        <div className={b.progress} style={{ margin: '0.75rem 0' }}>
          <progress max={Math.max(categorizeProgress.totalEligible, 1)} value={categorizeProgress.analyzed} />
          <span>{categorizeProgress.analyzed} / {categorizeProgress.totalEligible}</span>
        </div>
        <p style={{ margin: 0, fontSize: '0.85rem' }}>
          {categorizeProgress.currentTitle ? `Analyzing: ${categorizeProgress.currentTitle}` : 'Working…'} ·{' '}
          {categorizeProgress.draftCount} Draft · {categorizeProgress.publishedCount} Published ·{' '}
          {categorizeProgress.saved} saved · {categorizeProgress.categoriesAssigned} categories · {categorizeProgress.occasionsAssigned} occasions ·{' '}
          {categorizeProgress.generalFallback} general fallback · {categorizeProgress.skipped} preserved ·{' '}
          {categorizeProgress.failed} failed · {categorizeProgress.remaining} remaining
        </p>
      </div>
    ) : null}
    {busy === 'lyrics-format' && formatProgress ? (
      <div className={s.card} style={{ borderLeft: '4px solid var(--color-accent)' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          <strong>Auto-Formatting Lyrics: {formatProgress.currentTitle || 'Working…'}</strong>
          <button type="button" className={s.danger} onClick={() => formatAbortRef.current?.abort()}>Stop / Cancel</button>
        </div>
        <div className={b.progress} style={{ margin: '0.75rem 0' }}>
          <progress
            max={Math.max(formatProgress.total, 1)}
            value={formatProgress.formatted + formatProgress.alreadyFormatted + formatProgress.missingLyrics + formatProgress.failed}
          />
          <span>{formatProgress.formatted + formatProgress.alreadyFormatted + formatProgress.missingLyrics + formatProgress.failed} / {formatProgress.total}</span>
        </div>
        <p style={{ margin: 0, fontSize: '0.85rem' }}>
          {formatProgress.draftCount} Draft · {formatProgress.publishedCount} Published ·{' '}
          {formatProgress.formatted} formatted · {formatProgress.pairedAligned} pairs aligned ·{' '}
          {formatProgress.paragraphsAligned} sections aligned · {formatProgress.alreadyFormatted} already formatted ·{' '}
          {formatProgress.missingLyrics} missing lyrics · {formatProgress.failed} failed · {formatProgress.remaining} remaining
        </p>
      </div>
    ) : null}

    <section className={b.metrics} aria-label="Mezmur bulk status">{METRICS.map(([key, en, am]) => <article className={s.card} key={key}><strong>{dashboard[key]}</strong><span>{en}</span><small lang="am">{am}</small></article>)}</section>

    <section className={`${s.card} ${b.inventory}`}>
      <div className={b.sectionHead}><div><h2>1. Imported Supabase Mezmurs</h2><p>{filtered.length} matching records · page {Math.min(page, pages)} of {pages} · source: mezmur_data_import</p></div>
        <div className={s.actions}><button type="button" onClick={selectDraftsOnCurrentPage}>Select Drafts on page</button><button type="button" onClick={selectAllMatchingDrafts}>Select all matching Drafts ({filteredDrafts.length})</button><button type="button" onClick={() => setSelectedRecords(new Set())}>Clear selection</button></div></div>
      <div className={s.filters}>
        <label>Search<input value={search} onChange={(event) => setSearch(event.target.value)} placeholder="Title, Amharic title, slug, or import ID" /></label>
        <label>Status<select value={statusFilter} onChange={(event) => setStatusFilter(event.target.value)}><option value="">All</option><option value="draft">Draft</option><option value="published">Published</option></select></label>
        <label>Category<select value={categoryFilter} onChange={(event) => setCategoryFilter(event.target.value)}><option value="">All</option><option value="__missing__">Missing category</option>{categories.map((value) => <option key={value}>{value}</option>)}</select></label>
        <label>Zemari relationship<select value={singerFilter} onChange={(event) => setSingerFilter(event.target.value)}><option value="">All</option><option value="__linked__">Linked</option><option value="__matchable__">Ready to auto-link</option><option value="__unlinked__">Not linked</option><option value="__ambiguous__">Needs review</option><option value="__missing__">Singer name missing</option>{singers.map((value) => <option key={value.id} value={value.id}>{value.name || value.nameAmharic || value.slug}</option>)}</select></label>
        <label>Lyrics<select value={lyricsFilter} onChange={(event) => setLyricsFilter(event.target.value)}><option value="">All</option><option value="with">With lyrics</option><option value="missing">Missing lyrics</option></select></label>
        <label>Publication<select value={eligibilityFilter} onChange={(event) => setEligibilityFilter(event.target.value)}><option value="">All</option><option value="eligible">Eligible</option><option value="blocked">Blocked</option></select></label>
        <label>Language<select value={languageFilter} onChange={(event) => setLanguageFilter(event.target.value)}><option value="">All</option><option value="__missing__">Missing / unknown</option>{MEZMUR_LANGUAGES.map((value) => <option key={value.code} value={value.code}>{value.label} / {value.nativeLabel}</option>)}</select></label>
      </div>
      <div className={s.actions}>
        <button
          type="button"
          className={s.primary}
          disabled={!canApply || filteredTotal === 0 || Boolean(busy)}
          onClick={() => { setCategorizeModalMode('all'); setCategorizeOverwrite(false); }}
          title="Auto-categorize all matching Mezmurs using authentic lyrics"
        >
          Auto-Categorize All ({filteredTotal})
        </button>
        <button
          type="button"
          disabled={!canApply || filteredMissingCategories === 0 || Boolean(busy)}
          onClick={() => { setCategorizeModalMode('missing_categories'); setCategorizeOverwrite(false); }}
          title="Auto-categorize only matching Mezmurs missing categories"
        >
          Categorize Missing Only ({filteredMissingCategories})
        </button>
        <button
          type="button"
          disabled={!canApply || !selectedRows.length || Boolean(busy)}
          onClick={() => { setCategorizeModalMode('selected'); setCategorizeOverwrite(false); }}
          title="Auto-categorize currently selected Mezmurs"
        >
          Categorize Selected ({selectedRows.length})
        </button>
        <button
          type="button"
          disabled={!canApply || filteredMissingOccasions === 0 || Boolean(busy)}
          onClick={() => { setCategorizeModalMode('missing_occasions'); setCategorizeOverwrite(false); }}
          title="Reanalyze lyrics to populate missing liturgical occasions"
        >
          Reanalyze Missing Occasions ({filteredMissingOccasions})
        </button>
      </div>
      <div className={s.actions}>
        <button type="button" disabled={!selectedRows.length || Boolean(busy)} onClick={() => void run('selected', selectedRows.map((row) => row.import_id))}>Analyze Selected ({selectedRows.length})</button>
        <select aria-label="Manual category" value={manualCategory} onChange={(event) => setManualCategory(event.target.value)}><option value="">Choose existing category…</option>{categories.map((value) => <option key={value}>{value}</option>)}</select>
        <button type="button" disabled={!canApply || !manualCategory || !selectedRows.length || Boolean(busy)} onClick={() => void applyManualCategory()}>Add Category to Selected</button>
        <select aria-label="Bulk language" value={manualLanguage} onChange={(event) => setManualLanguage(event.target.value as MezmurLanguageCode | '')}><option value="">Choose language…</option>{MEZMUR_LANGUAGES.map((value) => <option key={value.code} value={value.code}>{value.label} / {value.nativeLabel}</option>)}</select>
        <button type="button" disabled={!canApply || !manualLanguage || !selectedRows.length || Boolean(busy)} onClick={() => void applyManualLanguage()}>Assign Language ({selectedRows.length})</button>
        <button type="button" disabled={!canApply || autoLinkBreakdown.totalAffected === 0 || Boolean(busy)} title="Bulk Match Exact Names and Normalized Titles" onClick={() => setShowAutoLinkModal(true)}>Auto-Link Existing Zemaris ({autoLinkBreakdown.totalAffected})</button>
        <button type="button" disabled={!superAdmin || !selectedEligible.length || Boolean(busy)} onClick={() => void publishRows(selectedRows, 'Publish Selected')}>Publish Selected ({selectedEligible.length})</button>
        <button type="button" className={s.primary} disabled={!superAdmin || !allEligible.length || Boolean(busy)} onClick={() => void publishRows(filteredDrafts, 'Publish All Eligible')}>Publish All Eligible ({allEligible.length})</button>
        <button type="button" disabled={!superAdmin || Boolean(busy)} onClick={() => void repairMissingPublicMezmurs()}>Repair Missing Public Mezmurs</button>
        {publicationResult?.results.length ? <button type="button" onClick={() => exportPublicationResultsCsv(publicationResult.results)}>Download publication report</button> : null}
      </div>
      {visibilityAudit ? <p className={s.notice} role="status">Published: {visibilityAudit.published} · Publicly visible: {visibilityAudit.visible} · Missing: {visibilityAudit.missing}. Diagnostic-only; no content or status changes were made.</p> : null}
      <div className={s.tableWrap}><table><thead><tr><th>Select</th><th>Mezmur</th><th>Import ID</th><th>Language</th><th>Zemari / Singer</th><th>Category</th><th>Occasion</th><th>Lyrics</th><th>Status</th><th>Review</th><th>Eligibility</th><th>Updated</th></tr></thead><tbody>
        {visible.map((row) => <tr key={row.import_id}><td><input type="checkbox" aria-label={`Select ${row.title}`} checked={selectedRecords.has(row.import_id)} disabled={Boolean(busy)} onChange={(event) => setSelectedRecords((current) => { const next = new Set(current); if (event.target.checked) next.add(row.import_id); else next.delete(row.import_id); return next })} /></td>
          <td><strong>{row.title}</strong>{row.title_amharic ? <small className={b.block}>{row.title_amharic}</small> : null}<small className={b.block}><Link to={`/admin/hymns/mezmur/${row.slug}/edit`}>{row.slug}</Link></small></td><td><code>{row.import_id}</code></td><td>{mezmurLanguageLabel(row.language)}</td><td><span>{row.singer_name || '—'}</span>{row.zemari_name && row.zemari_name !== row.singer_name ? <small className={b.block}>Zemari: {row.zemari_name}</small> : null}<small className={b.block}>{relationshipLabel(row)}</small>{row.zemari_match.state === 'ambiguous' ? <small className={b.block}>{row.zemari_match.candidates.map((value) => value.name).join(', ')}</small> : null}{canApply && row.status === 'draft' ? <select aria-label={`Link Zemari for ${row.title}`} value="" disabled={Boolean(busy)} onChange={(event) => void manualLink(row, event.target.value)}><option value="">Manual Link…</option>{singers.map((value) => <option key={value.id} value={value.id}>{value.name || value.nameAmharic || value.slug}</option>)}</select> : null}</td>
          <td>{row.category_slugs.join(', ') || '—'}</td><td>{row.occasion_slugs.join(', ') || '—'}</td><td>{row.has_lyrics ? 'Available' : 'Missing'}</td><td>{row.status === 'published' ? 'Published' : 'Draft'}</td><td>{row.review_status || '—'}</td>
          <td>{row.status === 'published' ? 'Already published' : row.publication_eligible ? 'Eligible' : row.publication_block_reason}</td><td>{formatRecordedDate(row.updated_at)}</td></tr>)}
        {!visible.length ? <tr><td colSpan={12}>No Mezmurs match these filters.</td></tr> : null}
      </tbody></table></div>
      <div className={s.pagination}><button type="button" disabled={page <= 1} onClick={() => setPage((value) => value - 1)}>Previous</button><span>Page {Math.min(page, pages)} of {pages}</span><button type="button" disabled={page >= pages} onClick={() => setPage((value) => value + 1)}>Next</button></div>
    </section>

    <section className={`${s.card} ${b.workflow}`}>
      <div className={b.sectionHead}>
        <div>
          <h2>2. Auto-Format Lyrics (Chorus/Verse) · የዜማ ግጥም ማስተካከያ</h2>
          <p>
            Enforces standard alternating Chorus/Verse structure across all Mezmurs. Aligns Ethiopic original lyrics and Latin transliteration paragraph-by-paragraph and section-by-section without losing text or inventing words. Works on Draft and Published records alike.
          </p>
        </div>
      </div>
      <div className={s.actions}>
        <button
          type="button"
          className={s.primary}
          disabled={!canApply || totalMezmurs === 0 || Boolean(busy)}
          onClick={() => setFormatModalMode('all')}
          title="Format all Mezmurs in database"
        >
          Format All Mezmurs ({totalMezmurs})
        </button>
        <button
          type="button"
          disabled={!canApply || totalDraftsCount === 0 || Boolean(busy)}
          onClick={() => setFormatModalMode('draft')}
          title="Format Draft Mezmurs only"
        >
          Format Draft Mezmurs ({totalDraftsCount})
        </button>
        <button
          type="button"
          disabled={!canApply || totalPublishedCount === 0 || Boolean(busy)}
          onClick={() => setFormatModalMode('published')}
          title="Format Published Mezmurs only"
        >
          Format Published Mezmurs ({totalPublishedCount})
        </button>
        <button
          type="button"
          disabled={!canApply || selectedRecords.size === 0 || Boolean(busy)}
          onClick={() => setFormatModalMode('selected')}
          title="Format currently selected Mezmurs"
        >
          Format Selected Mezmurs ({selectedRecords.size})
        </button>
        <button
          type="button"
          disabled={!canApply || totalWithLyrics === 0 || Boolean(busy)}
          onClick={() => setFormatModalMode('unformatted_only')}
          title="Format only Mezmurs whose lyrics do not yet follow standard Chorus/Verse structure"
        >
          Format Unformatted Only ({totalWithLyrics})
        </button>
        <button
          type="button"
          disabled={!canApply || totalWithLyrics === 0 || Boolean(busy)}
          onClick={() => setFormatModalMode('reformat_existing')}
          title="Deconstruct and reformat all existing lyrics to standard structure"
        >
          Reformat Existing Lyrics ({totalWithLyrics})
        </button>
      </div>
    </section>

    <section className={`${s.card} ${b.workflow}`}><div><h2>3. Optional AI enrichment</h2><p>Uses actual lyrics and existing taxonomy. If unavailable, the Supabase inventory and publishing controls above continue to work.</p></div>
      <div className={s.actions}><button type="button" onClick={() => void run('zemari')} disabled={Boolean(busy)}>AI Zemari Analysis</button><button type="button" onClick={() => void run('classification')} disabled={Boolean(busy)}>Analyze Lyrics</button><button type="button" onClick={() => void run('missing_categories')} disabled={Boolean(busy)}>Analyze Missing Categories</button><button type="button" onClick={() => void run('missing_occasions')} disabled={Boolean(busy)}>Analyze Missing Occasions</button><button type="button" onClick={() => void run('retry_failed')} disabled={Boolean(busy)}>Retry Failed</button>
        {job && ['queued', 'running'].includes(job.status) ? <button type="button" className={s.danger} onClick={() => void changeJobState('cancel')}>Cancel</button> : null}{job && ['cancelled', 'failed'].includes(job.status) ? <button type="button" onClick={() => void changeJobState('resume')}>Resume</button> : null}</div>
      {job ? <div className={b.progress}><strong>{job.status.split('_').join(' ')}</strong><progress max={Math.max(job.total_count, 1)} value={job.processed_count} /><span>{job.processed_count} / {job.total_count} · {job.review_count} review · {job.failed_count} failed</span>{job.error_message ? <small className={s.error}>{job.error_message}</small> : null}</div> : null}
      {jobs.length ? <label>Recent job<select value={job?.id || ''} onChange={(event) => void refresh(event.target.value).catch((cause) => setError(causeText(cause)))}>{jobs.map((item) => <option key={item.id} value={item.id}>{new Date(item.created_at).toLocaleString()} · {item.mode} · {item.status}</option>)}</select></label> : <p className={s.muted}>No persisted enrichment jobs are available.</p>}
    </section>

    <section className={`${s.card} ${b.review}`}><div className={b.sectionHead}><div><h2>4. Review saved suggestions</h2><p>Existing manual classifications remain visible and are not replaced automatically.</p></div><div className={s.actions}><button type="button" disabled={!suggestions.length} onClick={() => exportSuggestionsCsv(suggestions)}>Export CSV</button><button type="button" className={s.primary} disabled={!canApply || !selectedSuggestions.size || Boolean(busy)} onClick={() => void applySelectedSuggestions()}>Apply Selected ({selectedSuggestions.size})</button></div></div>
      <div className={s.tableWrap}><table><thead><tr><th>Select</th><th>Mezmur</th><th>Existing categories</th><th>Suggested categories</th><th>Existing occasions</th><th>Suggested occasions</th><th>Confidence</th><th>Evidence / review</th></tr></thead><tbody>
        {suggestions.map((row) => { const current = recordById.get(row.mezmur_import_id); return <tr key={row.id}><td><input type="checkbox" aria-label={`Select ${row.mezmur?.title || row.mezmur_import_id}`} checked={selectedSuggestions.has(row.id)} disabled={row.status !== 'suggested'} onChange={(event) => setSelectedSuggestions((values) => { const next = new Set(values); if (event.target.checked) next.add(row.id); else next.delete(row.id); return next })} /></td><td>{row.mezmur?.title || current?.title || row.mezmur_import_id}</td><td>{current?.category_slugs.join(', ') || '—'}</td><td>{row.category_slugs.join(', ') || '—'}</td><td>{current?.occasion_slugs.join(', ') || '—'}</td><td>{row.occasion_slugs.join(', ') || '—'}</td><td>{pct(row.classification_confidence)}</td><td>{row.evidence?.map((value) => typeof value === 'string' ? value : JSON.stringify(value)).join(' · ') || row.explanation || (row.requires_review ? 'Review required' : 'Ready')}</td></tr> })}
        {!suggestions.length ? <tr><td colSpan={8}>No saved suggestions for this job.</td></tr> : null}
      </tbody></table></div>
    </section>

    {showAutoLinkModal ? (
      <Modal title="Auto-Link Existing Zemaris" close={() => setShowAutoLinkModal(false)} wide>
        <div>
          <p>
            Review safe Zemari matches before linking. Only one-to-one exact and normalized matches will be linked to existing Supabase Zemari UUIDs using the protected RPC. Original singer names are strictly preserved.
          </p>

          <div className={b.previewGrid}>
            <div className={b.previewCard}>
              <strong>{autoLinkBreakdown.alreadyLinked.length}</strong>
              <span>Already linked</span>
              <small>Manual or previously linked</small>
            </div>
            <div className={b.previewCard}>
              <strong>{autoLinkBreakdown.safeExact.length}</strong>
              <span>Safe exact matches</span>
              <small>Exact title or verified alias</small>
            </div>
            <div className={b.previewCard}>
              <strong>{autoLinkBreakdown.safeNormalized.length}</strong>
              <span>Safe normalized matches</span>
              <small>Normalized title honorifics</small>
            </div>
            <div className={b.previewCard}>
              <strong>{autoLinkBreakdown.ambiguous.length}</strong>
              <span>Ambiguous names</span>
              <small>Multiple candidate matches</small>
            </div>
            <div className={b.previewCard}>
              <strong>{autoLinkBreakdown.notFound.length}</strong>
              <span>Not found</span>
              <small>No matching Zemari in database</small>
            </div>
            <div className={`${b.previewCard} ${b.previewCardAffected}`}>
              <strong>{autoLinkBreakdown.totalAffected}</strong>
              <span>Total Mezmurs affected</span>
              <small>Ready to link safely</small>
            </div>
          </div>

          {autoLinkBreakdown.totalAffected > 0 ? (
            <>
              <h3>Safe Matches Preview ({autoLinkBreakdown.totalAffected})</h3>
              <div className={b.previewTableWrap}>
                <table className={b.previewTable}>
                  <thead>
                    <tr>
                      <th>Mezmur Title</th>
                      <th>Imported Singer</th>
                      <th>Target Zemari</th>
                      <th>Match Method</th>
                    </tr>
                  </thead>
                  <tbody>
                    {autoLinkBreakdown.safeMatches.slice(0, 100).map((row) => (
                      <tr key={row.import_id}>
                        <td><strong>{row.title}</strong></td>
                        <td>{row.singer_name || '—'}</td>
                        <td>
                          {row.zemari_match.state === 'available'
                            ? row.zemari_match.canonicalName
                            : '—'}
                        </td>
                        <td>
                          <span className={`${b.badge} ${
                            row.zemari_match.state === 'available' && row.zemari_match.method === 'exact_name'
                              ? b.badgeExact
                              : row.zemari_match.state === 'available' && row.zemari_match.method === 'verified_alias'
                              ? b.badgeAlias
                              : b.badgeNormalized
                          }`}>
                            {row.zemari_match.state === 'available' ? row.zemari_match.method.replace('_', ' ') : '—'}
                          </span>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              {autoLinkBreakdown.totalAffected > 100 ? (
                <p className={s.muted}>Showing first 100 of {autoLinkBreakdown.totalAffected} safe matches.</p>
              ) : null}
            </>
          ) : (
            <p className={s.notice}>No unlinked Mezmurs currently match existing Zemari records.</p>
          )}

          {autoLinkBreakdown.ambiguous.length > 0 ? (
            <details>
              <summary>
                <strong>Ambiguous Names Requiring Review ({autoLinkBreakdown.ambiguous.length})</strong>
              </summary>
              <div className={b.previewTableWrap}>
                <table className={b.previewTable}>
                  <thead>
                    <tr>
                      <th>Mezmur Title</th>
                      <th>Imported Singer</th>
                      <th>Candidate Zemaris (Will NOT be auto-linked)</th>
                    </tr>
                  </thead>
                  <tbody>
                    {autoLinkBreakdown.ambiguous.slice(0, 50).map((row) => (
                      <tr key={row.import_id}>
                        <td>{row.title}</td>
                        <td>{row.singer_name}</td>
                        <td>
                          {row.zemari_match.state === 'ambiguous'
                            ? row.zemari_match.candidates.map((c) => c.name).join(', ')
                            : '—'}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </details>
          ) : null}

          <div className={s.actions} style={{ marginTop: '1rem' }}>
            <button
              type="button"
              className={s.primary}
              disabled={autoLinkBreakdown.totalAffected === 0 || Boolean(busy)}
              onClick={() => void confirmAutoLink()}
            >
              {busy === 'zemari-match' ? 'Linking…' : `Confirm & Link ${autoLinkBreakdown.totalAffected} Mezmurs`}
            </button>
            <button
              type="button"
              disabled={Boolean(busy)}
              onClick={() => setShowAutoLinkModal(false)}
            >
              Cancel
            </button>
          </div>
        </div>
      </Modal>
    ) : null}

    {categorizeModalMode ? (
      <Modal
        title={`Auto-Categorize Mezmurs: ${
          categorizeModalMode === 'all'
            ? statusFilter === 'draft'
              ? 'All Draft Mezmurs'
              : statusFilter === 'published'
                ? 'All Published Mezmurs'
                : 'All Matching Mezmurs'
            : categorizeModalMode === 'missing_categories'
              ? 'Mezmurs Missing Categories'
              : categorizeModalMode === 'missing_occasions'
                ? 'Mezmurs Missing Occasions'
                : 'Selected Mezmurs'
        }`}
        close={() => setCategorizeModalMode(null)}
        wide
      >
        <div>
          <p>
            This action analyzes authentic original-language lyrics (Amharic, Ge'ez, Tigrinya, Oromo, English)
            and deterministically assigns primary theological categories (Jesus Christ, Virgin Mary, Angels &amp; Saints, Repentance &amp; Fasting, Praise &amp; General, Sacraments)
            and liturgical occasions directly to Supabase. Publication status and rights metadata remain strictly preserved.
          </p>
          <div className={b.previewGrid}>
            <div className={b.previewCard}>
              <strong>{categorizeTargets.length}</strong>
              <span>Target records</span>
              <small>Scope: {statusFilter === 'draft' ? 'Draft only' : statusFilter === 'published' ? 'Published only' : 'Draft & Published'}</small>
            </div>
            <div className={b.previewCard}>
              <strong>{categorizeTargets.filter((r) => r.status === 'draft').length}</strong>
              <span>Draft</span>
              <small>Draft Mezmurs in scope</small>
            </div>
            <div className={b.previewCard}>
              <strong>{categorizeTargets.filter((r) => r.status === 'published').length}</strong>
              <span>Published</span>
              <small>Published Mezmurs in scope</small>
            </div>
            <div className={b.previewCard}>
              <strong>{categorizeTargets.filter((r) => r.has_lyrics).length}</strong>
              <span>With lyrics</span>
              <small>Deterministic lyrics match</small>
            </div>
            <div className={b.previewCard}>
              <strong>{categorizeTargets.filter((r) => !r.has_lyrics).length}</strong>
              <span>Missing lyrics</span>
              <small>Fallback to General</small>
            </div>
          </div>

          <label style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', margin: '1rem 0', cursor: 'pointer' }}>
            <input
              type="checkbox"
              checked={categorizeOverwrite}
              onChange={(e) => setCategorizeOverwrite(e.target.checked)}
            />
            <span><strong>Overwrite existing classifications</strong> (leave unchecked to preserve manually assigned categories and occasions)</span>
          </label>

          <div className={s.actions} style={{ marginTop: '1rem' }}>
            <button
              type="button"
              className={s.primary}
              disabled={categorizeTargets.length === 0 || Boolean(busy)}
              onClick={() => void runCategorization()}
            >
              Start Auto-Categorization ({categorizeTargets.length})
            </button>
            <button
              type="button"
              onClick={() => setCategorizeModalMode(null)}
            >
              Cancel
            </button>
          </div>
        </div>
      </Modal>
    ) : null}

    {categorizeResult ? (
      <Modal title="Auto-Categorization Results" close={() => setCategorizeResult(null)} wide>
        <div>
          <p>
            Deterministic classification run complete. Classifications have been persisted directly to Supabase.
          </p>
          <div className={b.previewGrid}>
            <div className={b.previewCard}>
              <strong>{categorizeResult.analyzed}</strong>
              <span>Analyzed</span>
              <small>{categorizeResult.draftCount} Draft · {categorizeResult.publishedCount} Published</small>
            </div>
            <div className={`${b.previewCard} ${b.previewCardAffected}`}>
              <strong>{categorizeResult.saved}</strong>
              <span>Successfully saved</span>
              <small>Persisted to Supabase</small>
            </div>
            <div className={`${b.previewCard} ${b.previewCardAffected}`}>
              <strong>{categorizeResult.categoriesAssigned}</strong>
              <span>Categories verified</span>
              <small>{categorizeResult.categoriesInserted} inserted · {categorizeResult.categoriesAlreadyPresent} already present</small>
            </div>
            <div className={`${b.previewCard} ${b.previewCardAffected}`}>
              <strong>{categorizeResult.occasionsAssigned}</strong>
              <span>Occasions verified</span>
              <small>{categorizeResult.occasionsInserted} inserted · {categorizeResult.occasionsAlreadyPresent} already present</small>
            </div>
            <div className={b.previewCard}>
              <strong>{categorizeResult.generalFallback}</strong>
              <span>General fallback</span>
              <small>No specific subject found</small>
            </div>
            <div className={b.previewCard}>
              <strong>{categorizeResult.skipped}</strong>
              <span>Preserved</span>
              <small>{categorizeResult.manualRelationshipsPreserved} manual relationships retained</small>
            </div>
            <div className={b.previewCard}>
              <strong style={{ color: categorizeResult.failed ? '#c5221f' : undefined }}>
                {categorizeResult.failed}
              </strong>
              <span>Failed</span>
              <small>Errors encountered</small>
            </div>
          </div>

          <div className={s.actions} style={{ marginTop: '1.25rem' }}>
            <button
              type="button"
              className={s.primary}
              onClick={() => exportClassificationResultsCsv(categorizeResult.items)}
            >
              Download Full Report (CSV)
            </button>
            {categorizeResult.failed > 0 ? (
              <button
                type="button"
                onClick={() => exportFailedClassificationsCsv(categorizeResult.items)}
              >
                Download Failed Records (CSV)
              </button>
            ) : null}
            <button type="button" onClick={() => setCategorizeResult(null)}>
              Close
            </button>
          </div>
        </div>
      </Modal>
    ) : null}

    {formatModalMode ? (
      <Modal
        title={`Auto-Format Chorus/Verse Lyrics: ${
          formatModalMode === 'all'
            ? 'All Mezmurs'
            : formatModalMode === 'draft'
            ? 'Draft Mezmurs Only'
            : formatModalMode === 'published'
            ? 'Published Mezmurs Only'
            : formatModalMode === 'selected'
            ? `Selected Mezmurs (${selectedRecords.size})`
            : formatModalMode === 'unformatted_only'
            ? 'Unformatted Only'
            : 'Reformat Existing Lyrics'
        }`}
        close={() => setFormatModalMode(null)}
      >
        <div>
          <p>
            This operation will format lyrics according to the standard Tewahedo Hymn Chorus/Verse structure:
          </p>
          <ul style={{ paddingLeft: '1.25rem', fontSize: '0.9rem', lineHeight: '1.6' }}>
            <li>Alternating structure: <strong>CHORUS</strong> → <strong>VERSE 1</strong> → <strong>CHORUS</strong> → <strong>VERSE 2</strong> … ending with <strong>CHORUS</strong>.</li>
            <li>Single-paragraph hymns: <strong>CHORUS</strong> → <strong>VERSE 1</strong> → <strong>CHORUS</strong>.</li>
            <li>Paired Ethiopic (Amharic, Tigrinya, Geʽez) and Latin transliteration are matched section-by-section with identical paragraph and section counts.</li>
            <li>No original lyrics will be discarded, and no transliteration will be invented.</li>
            <li>Works on both <strong>Draft</strong> and <strong>Published</strong> records in Supabase.</li>
            <li>All formatted lyrics remain fully editable in the Mezmur Editor without review locks.</li>
          </ul>

          <div className={b.previewGrid} style={{ margin: '1rem 0' }}>
            <div className={`${b.previewCard} ${b.previewCardAffected}`}>
              <strong>{formatModalTargetsCount}</strong>
              <span>Targeted Mezmurs</span>
              <small>Mode: {formatModalMode.replace('_', ' ')}</small>
            </div>
            <div className={b.previewCard}>
              <strong>{totalDraftsCount}</strong>
              <span>Total Drafts</span>
              <small>in database</small>
            </div>
            <div className={b.previewCard}>
              <strong>{totalPublishedCount}</strong>
              <span>Total Published</span>
              <small>in database</small>
            </div>
            <div className={b.previewCard}>
              <strong>{totalWithLyrics}</strong>
              <span>With Lyrics</span>
              <small>ready for formatting</small>
            </div>
          </div>

          <div className={s.actions} style={{ marginTop: '1.25rem' }}>
            <button
              type="button"
              className={s.primary}
              disabled={formatModalTargetsCount === 0 || Boolean(busy)}
              onClick={() => void runLyricsFormatting()}
            >
              Start Lyrics Formatting ({formatModalTargetsCount})
            </button>
            <button
              type="button"
              onClick={() => setFormatModalMode(null)}
            >
              Cancel
            </button>
          </div>
        </div>
      </Modal>
    ) : null}

    {formatResult ? (
      <Modal title="Lyrics Auto-Formatting Results" close={() => setFormatResult(null)} wide>
        <div>
          <p>
            Chorus/Verse formatting complete. All modified records have been saved directly to Supabase.
          </p>

          <div className={b.previewGrid}>
            <div className={b.previewCard}>
              <strong>{formatResult.total}</strong>
              <span>Total Analyzed</span>
              <small>{formatResult.draftCount} Draft · {formatResult.publishedCount} Published</small>
            </div>
            <div className={`${b.previewCard} ${b.previewCardAffected}`}>
              <strong>{formatResult.formatted}</strong>
              <span>Formatted & Saved</span>
              <small>Standard structure applied</small>
            </div>
            <div className={`${b.previewCard} ${b.previewCardAffected}`}>
              <strong>{formatResult.pairedAligned}</strong>
              <span>Pairs Aligned</span>
              <small>Ethiopic + Translit matched</small>
            </div>
            <div className={`${b.previewCard} ${b.previewCardAffected}`}>
              <strong>{formatResult.paragraphsAligned}</strong>
              <span>Sections Aligned</span>
              <small>Total verse/chorus stanzas</small>
            </div>
            <div className={b.previewCard}>
              <strong>{formatResult.alreadyFormatted}</strong>
              <span>Already Formatted</span>
              <small>Met standard already</small>
            </div>
            <div className={b.previewCard}>
              <strong>{formatResult.missingLyrics}</strong>
              <span>Missing Lyrics</span>
              <small>No lyrics to format</small>
            </div>
            <div className={b.previewCard}>
              <strong style={{ color: formatResult.failed ? '#c5221f' : undefined }}>
                {formatResult.failed}
              </strong>
              <span>Failed</span>
              <small>Errors encountered</small>
            </div>
          </div>

          <div className={s.actions} style={{ marginTop: '1.25rem' }}>
            <button
              type="button"
              className={s.primary}
              onClick={() => exportLyricsFormatResultsCsv(formatResult.items)}
            >
              Download Full Report (CSV)
            </button>
            {formatResult.failed > 0 ? (
              <button
                type="button"
                onClick={() => exportFailedLyricsFormatCsv(formatResult.items)}
              >
                Download Failed Records (CSV)
              </button>
            ) : null}
            <button type="button" onClick={() => setFormatResult(null)}>
              Close
            </button>
          </div>
        </div>
      </Modal>
    ) : null}
  </div>
}
