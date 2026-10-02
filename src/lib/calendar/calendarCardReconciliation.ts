/**
 * Calendar Cards ↔ structured sources reconciliation.
 * Audit / dry-run / apply — never clobber images or intentional presentation.
 */
import { supabase } from '../supabase/client'
import { slugify } from '../cms/mezmurService'
import type { CalendarCardRow } from '../cms/calendarAdminService'
import { invalidateCalendarCardsCache } from './getCalendarEventsForDate'
import {
  isLinkedSourceType,
  normalizeSourceType,
  type CalendarCardSourceType,
  type LinkedCalendarSource,
} from './resolveCalendarCard'
import {
  fetchLinkedSource,
  linkedSourceFromFast,
  linkedSourceFromMonthly,
  linkedSourceFromObservance,
  linkedSourceFromSeason,
} from './calendarCardSources'
import type {
  LiturgicalFastRow,
  LiturgicalSeasonRow,
  MonthlyCommemorationRow,
  OrthodoxObservanceRow,
} from './orthodoxCalendarTypes'

export type AuditStatus =
  | 'OK'
  | 'SOURCE_ID_MISMATCH'
  | 'SOURCE_SLUG_MISMATCH'
  | 'SOURCE_NOT_FOUND'
  | 'DUPLICATE_CARD'
  | 'MISSING_CARD'
  | 'MANUAL_CARD'
  | 'AMBIGUOUS_MATCH'
  | 'NEEDS_PLACEHOLDER_CLEAR'

export type RepairKind =
  | 'normalize_source_type'
  | 'repair_source_id'
  | 'repair_source_slug'
  | 'clear_placeholder_field'
  | 'create_missing_card'
  | 'merge_duplicate'
  | 'archive_duplicate'

export type RepairAction = {
  kind: RepairKind
  cardId?: string
  field?: string
  from?: string | null
  to?: string | null
  note?: string
}

export type CardAuditResult = {
  cardId: string
  cardSlug: string
  sourceType: CalendarCardSourceType
  sourceId: string | null
  sourceSlug: string | null
  linkedSourceFound: boolean
  sourceIdMatches: boolean
  sourceSlugMatches: boolean
  titleMatches: boolean | null
  imagePath: string | null
  hasImage: boolean
  status: AuditStatus
  repairs: RepairAction[]
  needsReview: boolean
}

export type SourceCoverage = {
  sourceType: CalendarCardSourceType
  sources: number
  linkedCards: number
  missing: number
}

export type ReconciliationPlan = {
  auditedAt: string
  cards: CardAuditResult[]
  repairs: RepairAction[]
  duplicates: Array<{ key: string; survivorId: string; loserIds: string[] }>
  missingSources: Array<{
    sourceType: CalendarCardSourceType
    sourceId: string
    sourceSlug: string
    title: string
  }>
  coverage: SourceCoverage[]
  summary: {
    sourcesChecked: number
    cardsLinked: number
    linksToRepair: number
    missingCardsToCreate: number
    duplicatesFound: number
    orphansFound: number
    cardsWithImages: number
    needsManualReview: number
    placeholderFieldsToClear: number
  }
}

export type ReconciliationApplyResult = {
  appliedAt: string
  linksRepaired: number
  missingCardsCreated: number
  duplicatesMerged: number
  placeholdersCleared: number
  imagesPreserved: number
  errors: string[]
  plan: ReconciliationPlan
}

const TEXT_FIELDS = [
  'title',
  'title_amharic',
  'summary',
  'summary_amharic',
  'description',
  'what_is_it',
  'what_is_it_amharic',
  'why_celebrated',
  'why_celebrated_amharic',
  'important_information',
  'important_information_amharic',
  'scripture_references',
  'fasting_notes',
  'fasting_notes_amharic',
  'season_notes',
  'season_notes_amharic',
] as const

type TextField = (typeof TEXT_FIELDS)[number]

function trim(value?: string | null): string {
  return (value || '').trim()
}

function sourceFieldValue(linked: LinkedCalendarSource, field: TextField): string {
  switch (field) {
    case 'title':
      return linked.title
    case 'title_amharic':
      return linked.titleAmharic
    case 'summary':
      return linked.summary || linked.description
    case 'summary_amharic':
      return linked.summaryAmharic
    case 'description':
      return linked.description
    case 'what_is_it':
      return linked.whatIsIt
    case 'what_is_it_amharic':
      return linked.whatIsItAmharic
    case 'why_celebrated':
      return linked.whyCelebrated
    case 'why_celebrated_amharic':
      return linked.whyCelebratedAmharic
    case 'important_information':
      return linked.importantInformation
    case 'important_information_amharic':
      return linked.importantInformationAmharic
    case 'scripture_references':
      return linked.scriptureReferences
    case 'fasting_notes':
      return linked.fastingNotes
    case 'fasting_notes_amharic':
      return linked.fastingNotesAmharic
    case 'season_notes':
      return linked.seasonNotes
    case 'season_notes_amharic':
      return linked.seasonNotesAmharic
    default:
      return ''
  }
}

function cardFieldValue(card: CalendarCardRow, field: TextField): string {
  return trim((card as Record<string, unknown>)[field] as string | null | undefined)
}

function hasPresentationValue(card: CalendarCardRow): boolean {
  return Boolean(
    trim(card.image_path) ||
      trim(card.image_alt) ||
      card.show_on_home ||
      card.home_featured ||
      card.home_sort_order != null ||
      (card.image_position && card.image_position !== 'center'),
  )
}

function cardScore(card: CalendarCardRow): number {
  let score = 0
  if (trim(card.image_path)) score += 100
  if (trim(card.image_alt)) score += 10
  if (card.show_on_home) score += 20
  if (card.home_featured) score += 15
  if (card.featured) score += 5
  if (card.status === 'published') score += 5
  if (hasPresentationValue(card)) score += 8
  // Prefer older stable cards when tied
  score += Math.max(0, 5 - Math.floor((Date.now() - Date.parse(card.created_at || '')) / 86400000 / 365))
  return score
}

async function loadAllCards(): Promise<CalendarCardRow[]> {
  if (!supabase) return []
  const { data, error } = await supabase
    .from('calendar_cards' as never)
    .select('*')
    .neq('status', 'archived')
    .order('created_at', { ascending: true })
  if (error) throw error
  return (data || []) as unknown as CalendarCardRow[]
}

async function loadPublishedSources(): Promise<{
  observances: OrthodoxObservanceRow[]
  monthlies: MonthlyCommemorationRow[]
  fasts: LiturgicalFastRow[]
  seasons: LiturgicalSeasonRow[]
}> {
  if (!supabase) {
    return { observances: [], monthlies: [], fasts: [], seasons: [] }
  }
  const [observances, monthlies, fasts, seasons] = await Promise.all([
    supabase.from('orthodox_observances' as never).select('*').eq('status', 'published'),
    supabase.from('monthly_commemorations' as never).select('*').eq('status', 'published'),
    supabase.from('liturgical_fasts' as never).select('*').eq('status', 'published'),
    supabase.from('liturgical_seasons' as never).select('*').eq('status', 'published'),
  ])
  if (observances.error) throw observances.error
  if (monthlies.error) throw monthlies.error
  if (fasts.error) throw fasts.error
  if (seasons.error) throw seasons.error
  return {
    observances: (observances.data || []) as unknown as OrthodoxObservanceRow[],
    monthlies: (monthlies.data || []) as unknown as MonthlyCommemorationRow[],
    fasts: (fasts.data || []) as unknown as LiturgicalFastRow[],
    seasons: (seasons.data || []) as unknown as LiturgicalSeasonRow[],
  }
}

function linkedFromPublished(
  type: CalendarCardSourceType,
  row: OrthodoxObservanceRow | MonthlyCommemorationRow | LiturgicalFastRow | LiturgicalSeasonRow,
): LinkedCalendarSource {
  switch (type) {
    case 'observance':
      return linkedSourceFromObservance(row as OrthodoxObservanceRow)
    case 'monthly_commemoration':
      return linkedSourceFromMonthly(row as MonthlyCommemorationRow)
    case 'fast':
      return linkedSourceFromFast(row as LiturgicalFastRow)
    case 'season':
      return linkedSourceFromSeason(row as LiturgicalSeasonRow)
    default:
      throw new Error(`Unsupported source type ${type}`)
  }
}

export async function auditCard(
  card: CalendarCardRow,
): Promise<{ audit: CardAuditResult; linked: LinkedCalendarSource | null }> {
  const rawType = card.source_type
  const sourceType = normalizeSourceType(rawType)
  const repairs: RepairAction[] = []

  if (trim(rawType) && normalizeSourceType(rawType) !== trim(rawType).toLowerCase()) {
    repairs.push({
      kind: 'normalize_source_type',
      cardId: card.id,
      from: rawType,
      to: sourceType,
    })
  } else if (trim(rawType) && trim(rawType) !== sourceType) {
    // already handled by normalize variants like monthly → monthly_commemoration
    if (trim(rawType).toLowerCase() !== sourceType) {
      repairs.push({
        kind: 'normalize_source_type',
        cardId: card.id,
        from: rawType,
        to: sourceType,
      })
    }
  }

  if (!isLinkedSourceType(sourceType)) {
    return {
      audit: {
        cardId: card.id,
        cardSlug: card.slug,
        sourceType,
        sourceId: card.source_id,
        sourceSlug: card.source_slug,
        linkedSourceFound: false,
        sourceIdMatches: false,
        sourceSlugMatches: false,
        titleMatches: null,
        imagePath: card.image_path,
        hasImage: Boolean(trim(card.image_path)),
        status: 'MANUAL_CARD',
        repairs,
        needsReview: false,
      },
      linked: null,
    }
  }

  const byId = card.source_id
    ? await fetchLinkedSource(sourceType, card.source_id, null)
    : null
  const bySlug = card.source_slug
    ? await fetchLinkedSource(sourceType, null, card.source_slug)
    : null

  let linked: LinkedCalendarSource | null = byId || bySlug
  let status: AuditStatus = 'OK'
  let sourceIdMatches = false
  let sourceSlugMatches = false

  if (byId && bySlug && byId.sourceId !== bySlug.sourceId) {
    status = 'AMBIGUOUS_MATCH'
    linked = byId
  } else if (byId) {
    sourceIdMatches = true
    sourceSlugMatches = !card.source_slug || byId.sourceSlug === trim(card.source_slug)
    if (!sourceSlugMatches) {
      status = 'SOURCE_SLUG_MISMATCH'
      repairs.push({
        kind: 'repair_source_slug',
        cardId: card.id,
        from: card.source_slug,
        to: byId.sourceSlug,
      })
    }
  } else if (bySlug) {
    sourceSlugMatches = true
    sourceIdMatches = !card.source_id || bySlug.sourceId === trim(card.source_id)
    if (!sourceIdMatches) {
      status = 'SOURCE_ID_MISMATCH'
      repairs.push({
        kind: 'repair_source_id',
        cardId: card.id,
        from: card.source_id,
        to: bySlug.sourceId,
      })
    }
    linked = bySlug
  } else {
    status = 'SOURCE_NOT_FOUND'
  }

  let ambiguousLegacyOverride = false
  if (linked) {
    for (const field of TEXT_FIELDS) {
      const cardValue = cardFieldValue(card, field)
      const sourceValue = trim(sourceFieldValue(linked, field))
      if (cardValue && sourceValue && cardValue === sourceValue) {
        repairs.push({
          kind: 'clear_placeholder_field',
          cardId: card.id,
          field,
          from: cardValue,
          to: null,
          note: 'Identical to source — treat as inheritance, not override',
        })
      } else if (cardValue && sourceValue && cardValue !== sourceValue) {
        // Diverged from current source — may be intentional override OR stale placeholder.
        ambiguousLegacyOverride = true
      } else if (cardValue && !sourceValue) {
        // Card has text the source lacks — keep, but flag for human confirmation.
        ambiguousLegacyOverride = true
      }
    }
  }

  const titleMatches =
    linked && trim(card.title)
      ? trim(card.title) === trim(linked.title)
      : linked
        ? !trim(card.title)
        : null

  const needsReview =
    status === 'SOURCE_NOT_FOUND' || status === 'AMBIGUOUS_MATCH' || ambiguousLegacyOverride
  if (repairs.some((r) => r.kind === 'clear_placeholder_field') && status === 'OK') {
    status = 'NEEDS_PLACEHOLDER_CLEAR'
  }

  return {
    audit: {
      cardId: card.id,
      cardSlug: card.slug,
      sourceType,
      sourceId: card.source_id,
      sourceSlug: card.source_slug,
      linkedSourceFound: Boolean(linked),
      sourceIdMatches,
      sourceSlugMatches,
      titleMatches,
      imagePath: card.image_path,
      hasImage: Boolean(trim(card.image_path)),
      status,
      repairs,
      needsReview,
    },
    linked,
  }
}

/** Build a full dry-run reconciliation plan without mutating the database. */
export async function buildCalendarCardReconciliationPlan(): Promise<ReconciliationPlan> {
  const [cards, sources] = await Promise.all([loadAllCards(), loadPublishedSources()])
  const audits: CardAuditResult[] = []
  const repairs: RepairAction[] = []

  for (const card of cards) {
    const { audit } = await auditCard(card)
    audits.push(audit)
    repairs.push(...audit.repairs)
  }

  // Duplicate detection by source_type + source_id (and by slug when id missing)
  const byKey = new Map<string, CalendarCardRow[]>()
  for (const card of cards) {
    const type = normalizeSourceType(card.source_type)
    if (!isLinkedSourceType(type)) continue
    const idKey = card.source_id ? `${type}:id:${card.source_id}` : null
    const slugKey = card.source_slug ? `${type}:slug:${card.source_slug}` : null
    if (idKey) {
      const list = byKey.get(idKey) || []
      list.push(card)
      byKey.set(idKey, list)
    }
    if (slugKey) {
      const list = byKey.get(slugKey) || []
      if (!list.some((c) => c.id === card.id)) list.push(card)
      byKey.set(slugKey, list)
    }
  }

  const duplicates: ReconciliationPlan['duplicates'] = []
  const seenLoser = new Set<string>()
  for (const [key, group] of byKey) {
    if (group.length < 2) continue
    const ranked = [...group].sort((a, b) => cardScore(b) - cardScore(a))
    const survivor = ranked[0]
    const losers = ranked.slice(1).filter((c) => !seenLoser.has(c.id))
    if (!losers.length) continue
    losers.forEach((c) => seenLoser.add(c.id))
    duplicates.push({
      key,
      survivorId: survivor.id,
      loserIds: losers.map((c) => c.id),
    })
    for (const loser of losers) {
      repairs.push({
        kind: 'merge_duplicate',
        cardId: survivor.id,
        from: loser.id,
        note: `Merge presentation from ${loser.slug} into ${survivor.slug}`,
      })
      repairs.push({
        kind: 'archive_duplicate',
        cardId: loser.id,
        to: survivor.id,
      })
      const audit = audits.find((a) => a.cardId === loser.id)
      if (audit) audit.status = 'DUPLICATE_CARD'
    }
  }

  const linkedKeys = new Set<string>()
  for (const card of cards) {
    const type = normalizeSourceType(card.source_type)
    if (!isLinkedSourceType(type)) continue
    if (card.source_id) linkedKeys.add(`${type}:id:${card.source_id}`)
    if (card.source_slug) linkedKeys.add(`${type}:slug:${card.source_slug}`)
  }

  const missingSources: ReconciliationPlan['missingSources'] = []
  const pushMissing = (
    type: CalendarCardSourceType,
    id: string,
    slug: string,
    title: string,
  ) => {
    if (linkedKeys.has(`${type}:id:${id}`) || linkedKeys.has(`${type}:slug:${slug}`)) return
    missingSources.push({ sourceType: type, sourceId: id, sourceSlug: slug, title })
    repairs.push({
      kind: 'create_missing_card',
      to: `${type}:${slug}`,
      note: title,
    })
  }

  for (const row of sources.observances) {
    pushMissing('observance', row.id, row.slug, row.title)
  }
  for (const row of sources.monthlies) {
    pushMissing('monthly_commemoration', row.id, row.slug, row.title)
  }
  for (const row of sources.fasts) {
    pushMissing('fast', row.id, row.slug, row.name)
  }
  for (const row of sources.seasons) {
    pushMissing('season', row.id, row.slug, row.title)
  }

  const coverage: SourceCoverage[] = [
    {
      sourceType: 'observance',
      sources: sources.observances.length,
      linkedCards: cards.filter((c) => normalizeSourceType(c.source_type) === 'observance').length,
      missing: missingSources.filter((m) => m.sourceType === 'observance').length,
    },
    {
      sourceType: 'monthly_commemoration',
      sources: sources.monthlies.length,
      linkedCards: cards.filter(
        (c) => normalizeSourceType(c.source_type) === 'monthly_commemoration',
      ).length,
      missing: missingSources.filter((m) => m.sourceType === 'monthly_commemoration').length,
    },
    {
      sourceType: 'fast',
      sources: sources.fasts.length,
      linkedCards: cards.filter((c) => normalizeSourceType(c.source_type) === 'fast').length,
      missing: missingSources.filter((m) => m.sourceType === 'fast').length,
    },
    {
      sourceType: 'season',
      sources: sources.seasons.length,
      linkedCards: cards.filter((c) => normalizeSourceType(c.source_type) === 'season').length,
      missing: missingSources.filter((m) => m.sourceType === 'season').length,
    },
  ]

  const cardsWithImages = cards.filter((c) => trim(c.image_path)).length
  const orphansFound = audits.filter((a) => a.status === 'SOURCE_NOT_FOUND').length
  const needsManualReview = audits.filter((a) => a.needsReview).length

  return {
    auditedAt: new Date().toISOString(),
    cards: audits,
    repairs,
    duplicates,
    missingSources,
    coverage,
    summary: {
      sourcesChecked:
        sources.observances.length +
        sources.monthlies.length +
        sources.fasts.length +
        sources.seasons.length,
      cardsLinked: audits.filter((a) => isLinkedSourceType(a.sourceType)).length,
      linksToRepair: repairs.filter(
        (r) =>
          r.kind === 'repair_source_id' ||
          r.kind === 'repair_source_slug' ||
          r.kind === 'normalize_source_type',
      ).length,
      missingCardsToCreate: missingSources.length,
      duplicatesFound: duplicates.length,
      orphansFound,
      cardsWithImages,
      needsManualReview,
      placeholderFieldsToClear: repairs.filter((r) => r.kind === 'clear_placeholder_field').length,
    },
  }
}

function placeholderCardPayload(linked: LinkedCalendarSource) {
  const isMonthly = Boolean(linked.isMonthly || linked.sourceType === 'monthly_commemoration')
  const isMovable = Boolean(linked.isMovable)
  let month: number | null = null
  let day: number | null = null

  if (isMonthly) {
    // Recurring day only — never invent Meskerem as the month.
    day = linked.ethiopianDay != null && linked.ethiopianDay > 0 ? linked.ethiopianDay : null
  } else if (isMovable) {
    // Movable: leave eth fields null; Admin/public use Pascha rule from source.
    month = null
    day = null
  } else if (
    linked.ethiopianMonthNumber != null &&
    linked.ethiopianMonthNumber > 0 &&
    linked.ethiopianDay != null &&
    linked.ethiopianDay > 0
  ) {
    month = linked.ethiopianMonthNumber
    day = linked.ethiopianDay
  }

  return {
    slug: slugify(linked.sourceSlug || linked.title || 'calendar-card'),
    title: linked.title || linked.sourceSlug || 'Calendar card',
    title_amharic: null,
    category: linked.category || null,
    card_type: linked.cardType || 'other',
    description: null,
    summary: null,
    summary_amharic: null,
    what_is_it: null,
    what_is_it_amharic: null,
    why_celebrated: null,
    why_celebrated_amharic: null,
    important_information: null,
    important_information_amharic: null,
    scripture_references: null,
    fasting_notes: null,
    fasting_notes_amharic: null,
    season_notes: null,
    season_notes_amharic: null,
    short_label: null,
    learn_more_label: null,
    image_path: null,
    image_alt: null,
    image_position: 'center',
    ethiopian_month_number: month,
    ethiopian_day: day,
    is_monthly: isMonthly,
    source_type: linked.sourceType,
    source_id: linked.sourceId,
    source_slug: linked.sourceSlug,
    featured: true,
    show_on_home: false,
    home_featured: false,
    home_sort_order: null,
    status: 'published',
    updated_at: new Date().toISOString(),
  }
}

/** Apply a previously built plan. Images and homepage settings are preserved. */
export async function applyCalendarCardReconciliation(
  plan?: ReconciliationPlan,
): Promise<ReconciliationApplyResult> {
  if (!supabase) {
    throw new Error('Supabase is not configured.')
  }
  const activePlan = plan || (await buildCalendarCardReconciliationPlan())
  const errors: string[] = []
  let linksRepaired = 0
  let missingCardsCreated = 0
  let duplicatesMerged = 0
  let placeholdersCleared = 0
  const imagesPreserved = activePlan.summary.cardsWithImages

  const cards = await loadAllCards()
  const byId = new Map(cards.map((c) => [c.id, c]))

  // 1) Link repairs + placeholder clears (per card)
  for (const audit of activePlan.cards) {
    const card = byId.get(audit.cardId)
    if (!card) continue
    const patch: Record<string, unknown> = {}
    let touched = false

    for (const repair of audit.repairs) {
      if (repair.kind === 'normalize_source_type' && repair.to) {
        patch.source_type = repair.to
        touched = true
      }
      if (repair.kind === 'repair_source_id' && repair.to) {
        patch.source_id = repair.to
        touched = true
      }
      if (repair.kind === 'repair_source_slug' && repair.to) {
        patch.source_slug = repair.to
        touched = true
      }
      if (repair.kind === 'clear_placeholder_field' && repair.field) {
        patch[repair.field] = null
        placeholdersCleared += 1
        touched = true
      }
    }

    // Never touch image fields
    delete patch.image_path
    delete patch.image_alt
    delete patch.image_position

    if (!touched) continue
    patch.updated_at = new Date().toISOString()
    const { error } = await supabase
      .from('calendar_cards' as never)
      .update(patch as never)
      .eq('id', audit.cardId)
    if (error) {
      errors.push(`Repair ${audit.cardSlug}: ${error.message}`)
    } else {
      linksRepaired += 1
    }
  }

  // 2) Duplicate merges — copy presentation into survivor, archive loser
  for (const dup of activePlan.duplicates) {
    const survivor = byId.get(dup.survivorId)
    if (!survivor) continue
    for (const loserId of dup.loserIds) {
      const loser = byId.get(loserId)
      if (!loser) continue
      const mergePatch: Record<string, unknown> = { updated_at: new Date().toISOString() }
      if (!trim(survivor.image_path) && trim(loser.image_path)) {
        mergePatch.image_path = loser.image_path
        mergePatch.image_alt = loser.image_alt || survivor.image_alt
        mergePatch.image_position = loser.image_position || survivor.image_position
      }
      if (!survivor.show_on_home && loser.show_on_home) {
        mergePatch.show_on_home = true
        mergePatch.home_featured = loser.home_featured || survivor.home_featured
        mergePatch.home_sort_order = loser.home_sort_order ?? survivor.home_sort_order
      }
      if (Object.keys(mergePatch).length > 1) {
        const { error } = await supabase
          .from('calendar_cards' as never)
          .update(mergePatch as never)
          .eq('id', survivor.id)
        if (error) errors.push(`Merge into ${survivor.slug}: ${error.message}`)
      }
      const { error: archiveError } = await supabase
        .from('calendar_cards' as never)
        .update({
          status: 'archived',
          featured: false,
          show_on_home: false,
          home_featured: false,
          updated_at: new Date().toISOString(),
        } as never)
        .eq('id', loser.id)
      if (archiveError) errors.push(`Archive ${loser.slug}: ${archiveError.message}`)
      else duplicatesMerged += 1
    }
  }

  // 3) Create missing cards
  const sources = await loadPublishedSources()
  const sourceIndex = new Map<string, LinkedCalendarSource>()
  for (const row of sources.observances) {
    const linked = linkedFromPublished('observance', row)
    sourceIndex.set(`observance:${linked.sourceId}`, linked)
  }
  for (const row of sources.monthlies) {
    const linked = linkedFromPublished('monthly_commemoration', row)
    sourceIndex.set(`monthly_commemoration:${linked.sourceId}`, linked)
  }
  for (const row of sources.fasts) {
    const linked = linkedFromPublished('fast', row)
    sourceIndex.set(`fast:${linked.sourceId}`, linked)
  }
  for (const row of sources.seasons) {
    const linked = linkedFromPublished('season', row)
    sourceIndex.set(`season:${linked.sourceId}`, linked)
  }

  for (const missing of activePlan.missingSources) {
    const linked = sourceIndex.get(`${missing.sourceType}:${missing.sourceId}`)
    if (!linked) continue
    let payload = placeholderCardPayload(linked)
    // Ensure unique slug
    let attempt = 0
    while (attempt < 5) {
      const { error } = await supabase.from('calendar_cards' as never).insert(payload as never)
      if (!error) {
        missingCardsCreated += 1
        break
      }
      if (/duplicate|unique/i.test(error.message)) {
        attempt += 1
        payload = {
          ...payload,
          slug: `${slugify(linked.sourceSlug)}-${attempt + 1}`,
        }
        continue
      }
      // Title null may fail if migration not applied — fallback to source title once
      if (/title/i.test(error.message) && payload.title == null) {
        payload = { ...payload, title: linked.title }
        continue
      }
      errors.push(`Create ${missing.sourceSlug}: ${error.message}`)
      break
    }
  }

  invalidateCalendarCardsCache()

  return {
    appliedAt: new Date().toISOString(),
    linksRepaired,
    missingCardsCreated,
    duplicatesMerged,
    placeholdersCleared,
    imagesPreserved,
    errors,
    plan: activePlan,
  }
}
