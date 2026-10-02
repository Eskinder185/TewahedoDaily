/**
 * Pure-function checks for Calendar Card reconciliation, date rules, and image identity.
 * Run: npm run test:calendar-cards
 */
import assert from 'node:assert/strict'

function trim(value) {
  return (value || '').trim()
}

function normalizeSourceType(raw) {
  const value = trim(raw).toLowerCase().replace(/[\s-]+/g, '_')
  const known = new Set([
    'manual',
    'observance',
    'fast',
    'season',
    'monthly_commemoration',
    'synaxarium_day',
    'synaxarium_commemoration',
  ])
  if (!value) return 'manual'
  if (known.has(value)) return value
  switch (value) {
    case 'monthly':
    case 'monthly_commemorations':
    case 'monthlycommemoration':
      return 'monthly_commemoration'
    case 'observances':
      return 'observance'
    case 'fasts':
      return 'fast'
    case 'seasons':
      return 'season'
    default:
      return 'manual'
  }
}

function inheritField(override, inherited) {
  const o = trim(override)
  const i = trim(inherited)
  if (!o) return i
  if (i && o === i) return i
  return o
}

const ETHIOPIAN_MONTH_NAMES = [
  'Meskerem',
  'Tikimt',
  'Hidar',
  'Tahsas',
  'Tir',
  'Yekatit',
  'Megabit',
  'Miazia',
  'Ginbot',
  'Sene',
  'Hamle',
  'Nehase',
  'Pagumen',
]

function monthName(number) {
  if (number == null || number < 1 || number > 13) return ''
  return ETHIOPIAN_MONTH_NAMES[number - 1] || `Month ${number}`
}

function fixedDayLabel(month, day) {
  if (day != null && day > 0 && month != null && month > 0) {
    return `${monthName(month)} ${day}`
  }
  if (day != null && day > 0 && (month == null || month <= 0)) {
    return `Day ${day} each month`
  }
  return null
}

/** Mirrors formatCalendarSourceRule — never invent Meskerem 1. */
function formatCalendarSourceRule(sourceType, source) {
  const type = normalizeSourceType(sourceType)
  if (!source) {
    if (type === 'manual') return 'Manual date on card'
    return 'Needs review'
  }

  if (
    source.isMovable ||
    (source.paschaOffsetDays != null && source.isMovable !== false && type !== 'monthly_commemoration')
  ) {
    if (source.paschaOffsetDays != null) {
      const offset = source.paschaOffsetDays
      const offsetLabel =
        offset === 0
          ? 'Pascha'
          : offset > 0
            ? `Pascha + ${offset} days`
            : `Pascha − ${Math.abs(offset)} days`
      if (type === 'fast') return `Movable fast · ${offsetLabel}`
      if (type === 'season') return `Movable season · ${offsetLabel}`
      return `Movable · ${offsetLabel}`
    }
    if (trim(source.rangeLabel)) return trim(source.rangeLabel)
    return 'Movable · calculated from Pascha'
  }

  if (type === 'monthly_commemoration' || source.isMonthly) {
    const day = source.ethiopianDay
    if (day != null && day > 0) return `Monthly · Day ${day}`
    if (trim(source.rangeLabel)) return trim(source.rangeLabel)
    return 'Needs review'
  }

  if (type === 'fast' || type === 'season') {
    if (trim(source.rangeLabel)) return trim(source.rangeLabel)
    const start = fixedDayLabel(source.ethiopianMonthNumber, source.ethiopianDay)
    if (start) return start
    return 'Needs review'
  }

  const fixed = fixedDayLabel(source.ethiopianMonthNumber, source.ethiopianDay)
  if (fixed) return fixed
  if (trim(source.rangeLabel)) return trim(source.rangeLabel)
  return 'Needs review'
}

function formatCardDateRuleDisplay(options) {
  const type = normalizeSourceType(options.sourceType)
  if (type !== 'manual' && options.linked) {
    return formatCalendarSourceRule(type, options.linked)
  }
  if (type !== 'manual' && !options.linked) {
    return 'Needs review'
  }
  const month = options.cardMonth
  const day = options.cardDay
  if (options.isMonthly && day != null && day > 0) {
    return `Monthly · Day ${day}`
  }
  const fixed = fixedDayLabel(month, day)
  if (fixed) return fixed
  return 'Needs review'
}

/** Strict source+card match — never fall back to first row. */
function findCardForSource(cards, sourceType, sourceId, sourceSlug) {
  return resolveCalendarCardForSource(cards, sourceType, sourceId, sourceSlug)
}

function presentationIntentScore(card) {
  let score = 0
  if (trim(card.imagePath) || trim(card.imageUrl)) score += 8
  if (trim(card.imageAlt)) score += 2
  if (trim(card.imagePosition) && trim(card.imagePosition) !== 'center') score += 1
  if (trim(card.title)) score += 1
  if (trim(card.titleAmharic)) score += 1
  if (trim(card.summary)) score += 1
  if (card.showOnHome) score += 1
  if (card.homeFeatured) score += 1
  if (card.featured) score += 1
  return score
}

function pickCanonicalCalendarCard(candidates) {
  if (!candidates.length) return null
  if (candidates.length === 1) return candidates[0]
  return [...candidates].sort((a, b) => {
    const aIdLinked = trim(a.sourceId) ? 1 : 0
    const bIdLinked = trim(b.sourceId) ? 1 : 0
    if (bIdLinked !== aIdLinked) return bIdLinked - aIdLinked
    const aImg = trim(a.imagePath) || trim(a.imageUrl) ? 1 : 0
    const bImg = trim(b.imagePath) || trim(b.imageUrl) ? 1 : 0
    if (bImg !== aImg) return bImg - aImg
    const intent = presentationIntentScore(b) - presentationIntentScore(a)
    if (intent !== 0) return intent
    const aSort = Number.isFinite(Number(a.sortOrder)) ? Number(a.sortOrder) : 9999
    const bSort = Number.isFinite(Number(b.sortOrder)) ? Number(b.sortOrder) : 9999
    if (aSort !== bSort) return aSort - bSort
    const aUpdated = trim(a.updatedAt)
    const bUpdated = trim(b.updatedAt)
    if (aUpdated !== bUpdated) return bUpdated.localeCompare(aUpdated)
    return a.id.localeCompare(b.id)
  })[0]
}

/**
 * Shared Calendar / Homepage resolver.
 * 1) source_type + source_id  2) source_type + source_slug  3) canonical among duplicates
 */
function resolveCalendarCardForSource(cards, sourceType, sourceId, sourceSlug) {
  const type = normalizeSourceType(sourceType)
  const id = trim(sourceId)
  const slug = trim(sourceSlug)
  if (!id && !slug) return null
  const ofType = cards.filter((c) => normalizeSourceType(c.sourceType) === type)
  const byId = id ? ofType.filter((c) => trim(c.sourceId) === id) : []
  if (byId.length) return pickCanonicalCalendarCard(byId)
  if (!slug) return null
  const bySlug = ofType.filter((c) => trim(c.sourceSlug) === slug)
  return pickCanonicalCalendarCard(bySlug)
}

function resolveImage(sourcePath, card) {
  const cardPath = trim(card?.imagePath)
  const cardUrl = trim(card?.imageUrl)
  if (cardUrl) return { url: cardUrl, hasImage: true }
  if (cardPath) return { url: `resolved:${cardPath}`, hasImage: true }
  if (trim(sourcePath)) return { url: `resolved:${sourcePath}`, hasImage: true }
  return { url: null, hasImage: false }
}

function normalizePresentable(source, card) {
  return {
    cardId: card?.id || null,
    sourceType: 'monthly_commemoration',
    sourceId: source.id,
    sourceSlug: source.slug,
    imagePath: card?.imagePath || null,
    title: inheritField(card?.title, source.title) || source.title,
  }
}

function cacheKey(sourceType, sourceId) {
  return `${normalizeSourceType(sourceType)}:${trim(sourceId)}`
}

// --- normalize / inherit ---
assert.equal(normalizeSourceType('monthly'), 'monthly_commemoration')
assert.equal(normalizeSourceType('monthly-commemoration'), 'monthly_commemoration')
assert.equal(normalizeSourceType('observances'), 'observance')
assert.equal(normalizeSourceType('fasts'), 'fast')
assert.equal(normalizeSourceType('seasons'), 'season')
assert.equal(normalizeSourceType('observance'), 'observance')

assert.equal(inheritField('', 'Source Title'), 'Source Title')
assert.equal(inheritField('Source Title', 'Source Title'), 'Source Title')
assert.equal(inheritField('Custom', 'Source Title'), 'Custom')
assert.equal(inheritField('Old Copy', 'New Source'), 'Old Copy')

// --- date rules: never invent Meskerem 1 ---
assert.equal(
  formatCalendarSourceRule('observance', {
    ethiopianMonthNumber: 1,
    ethiopianDay: 1,
    isMovable: false,
  }),
  'Meskerem 1',
)
assert.equal(
  formatCalendarSourceRule('observance', {
    ethiopianMonthNumber: 1,
    ethiopianDay: 17,
    isMovable: false,
  }),
  'Meskerem 17',
)
assert.equal(
  formatCalendarSourceRule('observance', {
    ethiopianMonthNumber: 4,
    ethiopianDay: 29,
    isMovable: false,
  }),
  'Tahsas 29',
)
assert.equal(
  formatCalendarSourceRule('observance', {
    ethiopianMonthNumber: null,
    ethiopianDay: null,
    isMovable: false,
  }),
  'Needs review',
)
assert.equal(
  formatCalendarSourceRule('monthly_commemoration', {
    ethiopianDay: 22,
    isMonthly: true,
  }),
  'Monthly · Day 22',
)
assert.equal(
  formatCalendarSourceRule('monthly_commemoration', {
    ethiopianDay: 12,
    isMonthly: true,
  }),
  'Monthly · Day 12',
)
assert.equal(
  formatCalendarSourceRule('fast', {
    isMovable: true,
    paschaOffsetDays: -48,
  }),
  'Movable fast · Pascha − 48 days',
)
assert.equal(
  formatCardDateRuleDisplay({
    sourceType: 'observance',
    linked: null,
    cardMonth: 1,
    cardDay: 1,
  }),
  'Needs review',
)
assert.equal(
  formatCardDateRuleDisplay({
    sourceType: 'observance',
    linked: { ethiopianMonthNumber: 1, ethiopianDay: 17 },
    cardMonth: 1,
    cardDay: 1,
  }),
  'Meskerem 17',
)

// --- source resolution identity ---
const cards = [
  {
    id: 'card-meskel',
    sourceType: 'observance',
    sourceId: 'obs-meskel',
    sourceSlug: 'meskel',
    imagePath: 'calendar/cross/meskel.webp',
    imageUrl: 'https://cdn/meskel.webp',
  },
  {
    id: 'card-gena',
    sourceType: 'observance',
    sourceId: 'obs-gena',
    sourceSlug: 'gena',
    imagePath: 'calendar/christ/gena.webp',
    imageUrl: 'https://cdn/gena.webp',
  },
  {
    id: 'card-uri',
    sourceType: 'monthly_commemoration',
    sourceId: 'mon-uri',
    sourceSlug: 'archangel-uriel',
    imagePath: 'calendar/angels/uriel.webp',
    imageUrl: 'https://cdn/uriel.webp',
  },
  {
    id: 'card-fast',
    sourceType: 'fast',
    sourceId: 'fast-dihnet',
    sourceSlug: 'tsome-dihnet',
    imagePath: null,
    imageUrl: '',
  },
]

assert.equal(findCardForSource(cards, 'observance', 'obs-gena', 'gena')?.id, 'card-gena')
assert.equal(findCardForSource(cards, 'observance', 'obs-meskel', null)?.id, 'card-meskel')
assert.equal(findCardForSource(cards, 'observance', null, 'meskel')?.id, 'card-meskel')
assert.equal(findCardForSource(cards, 'observance', 'missing', 'missing'), null)
assert.equal(findCardForSource(cards, 'observance', '', '') , null)
// Must NOT return first observance when id/slug missing
assert.notEqual(findCardForSource(cards, 'observance', '', '')?.id, 'card-meskel')

// --- Bisrate-style shared resolution: prefer image-bearing duplicate ---
const bisrateSource = {
  id: 'a44e761a-e40c-4ea4-9a4d-7dddf5acfa44',
  slug: 'annunciation-monthly',
  title: 'Annunciation / Bisrate Gabriel',
}
const duplicateCards = [
  {
    id: 'card-bisrate-stale',
    sourceType: 'monthly_commemoration',
    sourceId: bisrateSource.id,
    sourceSlug: 'annunciation-monthly',
    imagePath: null,
    imageUrl: '',
    sortOrder: 1,
    updatedAt: '2026-10-01T00:00:00Z',
  },
  {
    id: 'card-bisrate-canonical',
    sourceType: 'monthly_commemoration',
    sourceId: bisrateSource.id,
    sourceSlug: 'annunciation-monthly',
    imagePath: 'calendar/angels/bisrate-gabriel-20261002.webp',
    imageUrl: 'https://cdn/bisrate-new.webp',
    imageAlt: 'QA Bisrate Gabriel test',
    sortOrder: 40,
    updatedAt: '2026-10-02T12:00:00Z',
  },
]
const resolvedBisrate = resolveCalendarCardForSource(
  duplicateCards,
  'monthly_commemoration',
  bisrateSource.id,
  bisrateSource.slug,
)
assert.equal(resolvedBisrate?.id, 'card-bisrate-canonical')
assert.equal(resolvedBisrate?.imagePath, 'calendar/angels/bisrate-gabriel-20261002.webp')

const normalized = normalizePresentable(bisrateSource, resolvedBisrate)
assert.equal(normalized.cardId, 'card-bisrate-canonical')
assert.equal(normalized.imagePath, 'calendar/angels/bisrate-gabriel-20261002.webp')
assert.equal(normalized.sourceId, bisrateSource.id)
assert.equal(normalized.sourceSlug, 'annunciation-monthly')

// Slug-only repair path still picks the imaged card
const slugOnlyDupes = [
  {
    id: 'card-slug-empty',
    sourceType: 'monthly_commemoration',
    sourceId: null,
    sourceSlug: 'annunciation-monthly',
    imagePath: null,
  },
  {
    id: 'card-slug-imaged',
    sourceType: 'monthly_commemoration',
    sourceId: null,
    sourceSlug: 'annunciation-monthly',
    imagePath: 'calendar/angels/image-new.webp',
  },
]
assert.equal(
  resolveCalendarCardForSource(slugOnlyDupes, 'monthly_commemoration', '', 'annunciation-monthly')
    ?.imagePath,
  'calendar/angels/image-new.webp',
)

// Exact source_id wins over a different card that only shares the day context
assert.equal(
  resolveCalendarCardForSource(
    [...duplicateCards, cards[2]],
    'monthly_commemoration',
    bisrateSource.id,
    'annunciation-monthly',
  )?.id,
  'card-bisrate-canonical',
)

// --- image resolution: no cross-card borrow ---
const genaImg = resolveImage(null, findCardForSource(cards, 'observance', 'obs-gena', 'gena'))
const meskelImg = resolveImage(null, findCardForSource(cards, 'observance', 'obs-meskel', 'meskel'))
const fastImg = resolveImage(null, findCardForSource(cards, 'fast', 'fast-dihnet', 'tsome-dihnet'))
const uriImg = resolveImage(null, findCardForSource(cards, 'monthly_commemoration', 'mon-uri', 'archangel-uriel'))

assert.equal(genaImg.url, 'https://cdn/gena.webp')
assert.equal(meskelImg.url, 'https://cdn/meskel.webp')
assert.equal(uriImg.url, 'https://cdn/uriel.webp')
assert.equal(fastImg.url, null)
assert.equal(fastImg.hasImage, false)
assert.notEqual(genaImg.url, meskelImg.url)
assert.notEqual(uriImg.url, genaImg.url)

// Missing card → null, not another event's image
const orphanImg = resolveImage(null, null)
assert.equal(orphanImg.url, null)

// --- cache key identity ---
assert.equal(cacheKey('observance', 'obs-gena'), 'observance:obs-gena')
assert.notEqual(cacheKey('observance', 'obs-gena'), cacheKey('observance', 'obs-meskel'))
assert.notEqual(cacheKey('observance', 'x'), cacheKey('fast', 'x'))

// --- image merge never clears ---
function mergeNeverClearsImage(survivor, loser) {
  const next = { ...survivor }
  if (!trim(survivor.image_path) && trim(loser.image_path)) {
    next.image_path = loser.image_path
  }
  if (trim(survivor.image_path)) next.image_path = survivor.image_path
  return next
}

const kept = mergeNeverClearsImage(
  { image_path: 'calendar/angels/gabriel.webp' },
  { image_path: null },
)
assert.equal(kept.image_path, 'calendar/angels/gabriel.webp')

const gained = mergeNeverClearsImage(
  { image_path: null },
  { image_path: 'calendar/angels/gabriel.webp' },
)
assert.equal(gained.image_path, 'calendar/angels/gabriel.webp')

console.log('calendar-card-reconciliation pure checks: ok')
