import { normalizeForSearch } from '../language/index.ts'
import { CATEGORY_ENTRIES, OCCASION_ENTRIES } from './taxonomyAliases.ts'

export type EditorialRow = {
  importId: string; sourceId: string; slug: string; title: string; titleAmharic: string; titleEnglish: string
  lyrics: Record<string, string>; originalTextHash: string; currentCategory: string; currentOccasion: string
  reviewStatus: string; semanticReviewed: boolean; proposedCategorySlug: string; proposedCategory: string
  broadCategory: string; subcategory: string; specificSubject: string; reason: string
  competingCategories: string; confidence: string; modelCategorySlug: string; modelProvenance: string
  modelEvidence: string; modelUncertain: string; modelQualityFlags: string
  evidence: { text: string; field: string }[]; conflict: boolean; possibleDuplicate: boolean
}
export type EditorialCatalog = { schema: 'mezmur-editorial-catalog-v1'; sourceSha256: string; semanticCompleted: number; rows: EditorialRow[] }
export type ReviewKind = 'category' | 'occasion'
export type ReviewDecision = 'approve' | 'reject' | 'select' | 'defer' | 'rollback'
export type ReviewEvent = {
  id: string; sourceSha256: string; importId: string; sourceId: string; originalTextHash: string
  kind: ReviewKind; decision: ReviewDecision; proposedValue: string; previousValue: string; selectedValue: string
  reviewerId: string; reviewedAt: string; note: string; evidence: string[]; method: string; methodVersion: string
  reason: string
  groupId?: string; reverts?: string
}

const categorySlugs = new Set(CATEGORY_ENTRIES.map(entry => entry.slug))
const occasionSlugs = new Set(OCCASION_ENTRIES.map(entry => entry.slug))
const staffRoles = new Set(['editor', 'admin', 'super_admin'])
export const canReview = (role: string | null | undefined) => Boolean(role && staffRoles.has(role))

export function validateCatalog(input: unknown): EditorialCatalog {
  if (!input || typeof input !== 'object') throw new Error('Invalid editorial catalog.')
  const value = input as Partial<EditorialCatalog>
  if (value.schema !== 'mezmur-editorial-catalog-v1' || !/^[a-f0-9]{64}$/u.test(value.sourceSha256 || '')
    || !Array.isArray(value.rows) || value.rows.length !== 2531) throw new Error('Catalog schema or source count is invalid.')
  const ids = new Set<string>()
  let completed = 0
  for (const row of value.rows) {
    if (!row || typeof row.importId !== 'string' || ids.has(row.importId) || !/^[a-f0-9]{64}$/u.test(row.originalTextHash)
      || !row.lyrics || typeof row.lyrics !== 'object' || !Array.isArray(row.evidence)) throw new Error('Catalog contains an invalid or duplicate row.')
    ids.add(row.importId)
    if (row.semanticReviewed) completed++
    if (row.evidence.some(item => !item.text || !row.lyrics[item.field]?.includes(item.text))) throw new Error(`Evidence is not in original lyrics: ${row.importId}`)
  }
  if (completed !== value.semanticCompleted || completed < 25) throw new Error('Semantic progress does not match the catalog.')
  return value as EditorialCatalog
}

export function activeEvents(events: ReviewEvent[]): Map<string, ReviewEvent> {
  const reverted = new Set(events.filter(event => event.decision === 'rollback').map(event => event.reverts))
  const latest = new Map<string, ReviewEvent>()
  for (const event of events) {
    if (event.decision !== 'rollback' && !reverted.has(event.id)) latest.set(`${event.importId}:${event.kind}`, event)
  }
  return latest
}

export function validateAudit(input: unknown, catalog: EditorialCatalog): ReviewEvent[] {
  if (!input || typeof input !== 'object') throw new Error('Invalid audit export.')
  const audit = input as { schema?: string; sourceSha256?: string; events?: unknown }
  if (audit.schema !== 'mezmur-editorial-audit-v1' || audit.sourceSha256 !== catalog.sourceSha256 || !Array.isArray(audit.events))
    throw new Error('Audit source does not match the loaded catalog.')
  const rows = new Map(catalog.rows.map(row => [row.importId, row]))
  const ids = new Set<string>()
  for (const event of audit.events as ReviewEvent[]) {
    const row = rows.get(event?.importId)
    if (!event || typeof event.id !== 'string' || ids.has(event.id) || !row || event.sourceSha256 !== catalog.sourceSha256
      || event.originalTextHash !== row.originalTextHash || !['category', 'occasion'].includes(event.kind)
      || !['approve', 'reject', 'select', 'defer', 'rollback'].includes(event.decision)
      || !event.reviewerId || !event.reviewedAt || !event.methodVersion || typeof event.reason !== 'string'
      || (event.decision === 'approve' && (event.kind !== 'category' || !row.semanticReviewed
        || !row.evidence.length || event.selectedValue !== row.proposedCategorySlug))
      || (event.decision === 'select' && !(event.kind === 'category' ? categorySlugs : occasionSlugs).has(event.selectedValue)))
      throw new Error('Audit contains an invalid or mismatched decision.')
    ids.add(event.id)
  }
  return audit.events as ReviewEvent[]
}

export function reviewStatus(row: EditorialRow, events: Map<string, ReviewEvent>, kind: ReviewKind): string {
  return events.get(`${row.importId}:${kind}`)?.decision || 'unresolved'
}

export function catalogSummary(catalog: EditorialCatalog, events: ReviewEvent[]) {
  const latest = activeEvents(events)
  const rows = catalog.rows
  const classified = rows.filter(row => row.currentCategory.trim()).length
  const approved = rows.filter(row => reviewStatus(row, latest, 'category') === 'approve' || reviewStatus(row, latest, 'category') === 'select').length
  const occasionApproved = rows.filter(row => reviewStatus(row, latest, 'occasion') === 'approve' || reviewStatus(row, latest, 'occasion') === 'select').length
  return {
    total: rows.length, classified, unclassified: rows.length - classified,
    semanticProposals: rows.filter(row => row.semanticReviewed && row.proposedCategorySlug).length,
    modelProposals: rows.filter(row => row.modelCategorySlug).length,
    approved, occasionApproved, conflicts: rows.filter(row => row.conflict || (row.currentCategory && row.proposedCategory && row.currentCategory !== row.proposedCategory)).length,
    unresolvedOccasions: rows.filter(row => !row.currentOccasion).length,
    possibleDuplicates: rows.filter(row => row.possibleDuplicate).length,
    reviewed: new Set([...latest.values()].map(event => event.importId)).size,
  }
}

export function createEditorialSearchIndex(rows: EditorialRow[]): Map<string, string> {
  return new Map(rows.map(row => [row.importId, normalizeForSearch([
    row.importId, row.sourceId, row.title, row.titleAmharic, row.titleEnglish,
    row.currentCategory, row.proposedCategory, ...Object.values(row.lyrics),
  ].join(' '))]))
}

export function searchEditorialRows(rows: EditorialRow[], query: string, index?: Map<string, string>): EditorialRow[] {
  const needle = normalizeForSearch(query.trim())
  if (!needle) return rows
  return rows.filter(row => (index?.get(row.importId) || normalizeForSearch([
    row.importId, row.sourceId, row.title, row.titleAmharic, row.titleEnglish,
    row.currentCategory, row.proposedCategory, ...Object.values(row.lyrics),
  ].join(' '))).includes(needle))
}

export function makeReviewEvent(args: {
  catalog: EditorialCatalog; row: EditorialRow; events: ReviewEvent[]; role: string | null | undefined; reviewerId: string
  kind: ReviewKind; decision: Exclude<ReviewDecision, 'rollback'>; selectedValue?: string; note: string
  now?: string; id?: string; groupId?: string
}): ReviewEvent {
  const { catalog, row, events, kind, decision } = args
  if (!canReview(args.role) || !args.reviewerId) throw new Error('Editor access is required.')
  if (!catalog.rows.some(item => item.importId === row.importId && item.originalTextHash === row.originalTextHash)) throw new Error('Record is not in this source catalog.')
  const proposal = kind === 'category' ? row.proposedCategorySlug : ''
  const selected = decision === 'approve' ? proposal : args.selectedValue || ''
  const supported = kind === 'category' ? categorySlugs : occasionSlugs
  if ((decision === 'approve' || decision === 'select') && !supported.has(selected)) throw new Error('Select a supported taxonomy value.')
  if (decision === 'approve' && !proposal) throw new Error('No reviewed proposal is available to approve.')
  if (decision === 'approve' && kind === 'category' && (!row.semanticReviewed || !row.reason || !row.evidence.length)) throw new Error('A semantic proposal with literal evidence is required.')
  if (decision === 'select' && !args.note.trim()) throw new Error('Explain the selected category or occasion.')
  if (decision === 'reject' && !args.note.trim()) throw new Error('Explain the rejection.')
  if (row.evidence.some(item => !row.lyrics[item.field]?.includes(item.text))) throw new Error('Evidence no longer matches original lyrics.')
  const current = activeEvents(events).get(`${row.importId}:${kind}`)
  return {
    id: args.id || crypto.randomUUID(), sourceSha256: catalog.sourceSha256, importId: row.importId,
    sourceId: row.sourceId, originalTextHash: row.originalTextHash, kind, decision,
    proposedValue: proposal, previousValue: current?.selectedValue || (kind === 'category' ? row.currentCategory : row.currentOccasion),
    selectedValue: selected, reviewerId: args.reviewerId, reviewedAt: args.now || new Date().toISOString(),
    note: args.note.trim(), evidence: kind === 'category' ? row.evidence.map(item => item.text) : [],
    reason: args.note.trim() || (kind === 'category' ? row.reason : ''),
    method: kind === 'category' && row.semanticReviewed ? 'full_lyrics_reviewed' : 'editorial_selection',
    methodVersion: kind === 'category' && row.semanticReviewed ? 'batch-001' : 'local-v1', groupId: args.groupId,
  }
}

export function previewBulkCategory(catalog: EditorialCatalog, ids: string[], events: ReviewEvent[]) {
  const selected = new Set(ids)
  const latest = activeEvents(events)
  const rows = catalog.rows.filter(row => selected.has(row.importId))
  const warnings: string[] = []
  if (rows.length !== selected.size) warnings.push('Some selected IDs are missing from this catalog.')
  if (rows.length < 2) warnings.push('Select at least two records.')
  if (rows.some(row => !row.semanticReviewed || row.confidence !== 'high' || !row.reason || !row.evidence.length)) warnings.push('Every record needs a high-confidence semantic review and literal evidence.')
  if (rows.some(row => row.conflict || (row.currentCategory && row.currentCategory !== row.proposedCategory))) warnings.push('A category conflict needs individual review.')
  if (rows.some(row => latest.has(`${row.importId}:category`))) warnings.push('A selected record already has an editorial decision.')
  const slugs = new Set(rows.map(row => row.proposedCategorySlug))
  if (slugs.size !== 1 || !categorySlugs.has(rows[0]?.proposedCategorySlug)) warnings.push('Selected proposals must share one supported category.')
  return { rows, warnings, eligible: warnings.length === 0, category: rows[0]?.proposedCategory || '' }
}

export function rollbackGroup(catalog: EditorialCatalog, events: ReviewEvent[], groupId: string, reviewerId: string, role: string | null | undefined): ReviewEvent[] {
  if (!canReview(role) || !reviewerId) throw new Error('Editor access is required.')
  const group = events.filter(event => event.groupId === groupId && event.decision !== 'rollback' && event.sourceSha256 === catalog.sourceSha256)
  const reverted = new Set(events.filter(event => event.decision === 'rollback').map(event => event.reverts))
  if (!group.length || group.some(event => reverted.has(event.id))) throw new Error('Group is already rolled back or missing.')
  return group.map(event => ({ ...event, id: crypto.randomUUID(), decision: 'rollback', reviewedAt: new Date().toISOString(), reviewerId,
    previousValue: event.selectedValue, selectedValue: event.previousValue, note: 'Rollback of local bulk review',
    reason: 'Rollback of local bulk review', reverts: event.id }))
}
