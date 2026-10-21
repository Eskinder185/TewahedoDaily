/**
 * Safety tests for calendar card reconciliation patches.
 * Run: npx tsx scripts/test-calendar-card-sync-safety.mjs
 */
import assert from 'node:assert/strict'
import {
  NEVER_NULL_CARD_FIELDS,
  CLEARABLE_PLACEHOLDER_FIELDS,
  buildCardRepairPatch,
  resolveCreateCardTitle,
  validateCreateCardPayload,
  placeholderCardPayload,
} from '../src/lib/calendar/calendarCardReconciliation.ts'

// --- NOT NULL / clearable policy ---
assert.ok(NEVER_NULL_CARD_FIELDS.has('title'))
assert.ok(!CLEARABLE_PLACEHOLDER_FIELDS.includes('title'))
assert.ok(CLEARABLE_PLACEHOLDER_FIELDS.includes('summary'))
assert.ok(CLEARABLE_PLACEHOLDER_FIELDS.includes('description'))

// --- Link repair without wiping title/image ---
{
  const built = buildCardRepairPatch([
    {
      kind: 'repair_source_id',
      cardId: 'c1',
      from: 'old',
      to: 'new-id',
    },
    {
      kind: 'repair_source_slug',
      cardId: 'c1',
      from: 'old-slug',
      to: 'observance-gena',
    },
  ])
  assert.equal(built.patch.source_id, 'new-id')
  assert.equal(built.patch.source_slug, 'observance-gena')
  assert.equal(built.linkFieldUpdates, 2)
  assert.equal(built.placeholderClears, 0)
  assert.equal('title' in built.patch, false)
  assert.equal('image_path' in built.patch, false)
  assert.equal('show_on_home' in built.patch, false)
}

// --- Clearing title is skipped (NOT NULL) ---
{
  const built = buildCardRepairPatch([
    {
      kind: 'clear_placeholder_field',
      cardId: 'c1',
      field: 'title',
      from: 'Gena',
      to: null,
    },
    {
      kind: 'clear_placeholder_field',
      cardId: 'c1',
      field: 'summary',
      from: 'Same as source',
      to: null,
    },
  ])
  assert.equal('title' in built.patch, false)
  assert.equal(built.patch.summary, null)
  assert.equal(built.placeholderClears, 1)
  assert.equal(built.skippedUnsafe.length, 1)
  assert.equal(built.skippedUnsafe[0].field, 'title')
}

// --- Existing card with image: image fields never in patch ---
{
  const built = buildCardRepairPatch([
    {
      kind: 'normalize_source_type',
      cardId: 'c-img',
      from: 'Observance',
      to: 'observance',
    },
    {
      kind: 'clear_placeholder_field',
      cardId: 'c-img',
      field: 'description',
      from: 'dup',
      to: null,
    },
  ])
  assert.equal(built.patch.source_type, 'observance')
  assert.equal(built.patch.description, null)
  assert.equal('image_path' in built.patch, false)
  assert.equal('image_alt' in built.patch, false)
  assert.equal('image_position' in built.patch, false)
}

// --- Manually edited title: clear not scheduled for title; fill only when blank ---
{
  const built = buildCardRepairPatch([
    {
      kind: 'fill_missing_title',
      cardId: 'c2',
      field: 'title',
      from: '',
      to: 'Holy Week Wednesday',
    },
  ])
  assert.equal(built.patch.title, 'Holy Week Wednesday')
  assert.equal(built.linkFieldUpdates, 1)
}

{
  const built = buildCardRepairPatch([
    {
      kind: 'fill_missing_title',
      cardId: 'c2',
      field: 'title',
      from: '',
      to: '   ',
    },
  ])
  assert.equal('title' in built.patch, false)
  assert.equal(built.skippedUnsafe.length, 1)
}

// --- Missing source title ---
assert.equal(resolveCreateCardTitle({ title: null, sourceSlug: 'observance-gena' }), 'observance-gena')
assert.equal(resolveCreateCardTitle({ title: '  Gena  ', sourceSlug: 'x' }), 'Gena')
assert.equal(resolveCreateCardTitle({ title: null, sourceSlug: null }), null)
assert.equal(resolveCreateCardTitle({ title: '', sourceSlug: '' }), null)

{
  const err = validateCreateCardPayload({
    title: null,
    slug: 'observance-gena',
  })
  assert.match(err || '', /title/i)
}

{
  const err = validateCreateCardPayload({
    title: 'Gena',
    slug: 'observance-gena',
  })
  assert.equal(err, null)
}

// --- Missing season / observance card create payload ---
{
  const payload = placeholderCardPayload({
    sourceType: 'observance',
    sourceId: 'uuid-gena',
    sourceSlug: 'observance-gena',
    title: 'Gena',
    titleAmharic: '',
    category: 'Feast',
    cardType: 'feast',
    description: '',
    ethiopianMonthNumber: 4,
    ethiopianDay: 29,
    isMonthly: false,
    isMovable: false,
    paschaOffsetDays: null,
    rangeLabel: 'Tahsas 29',
    summary: '',
    summaryAmharic: '',
    whatIsIt: '',
    whatIsItAmharic: '',
    whyCelebrated: '',
    whyCelebratedAmharic: '',
    importantInformation: '',
    importantInformationAmharic: '',
    scriptureReferences: '',
    fastingNotes: '',
    fastingNotesAmharic: '',
    seasonNotes: '',
    seasonNotesAmharic: '',
    imagePath: null,
    imageAlt: '',
    synaxariumDayId: null,
    synaxariumDaySlug: null,
  })
  assert.equal(payload.title, 'Gena')
  assert.notEqual(payload.title, null)
  assert.equal(payload.image_path, null)
  assert.equal(payload.show_on_home, false)
  assert.equal(payload.source_slug, 'observance-gena')
  assert.equal(validateCreateCardPayload(payload), null)
}

// --- Missing source title blocks inventing ---
{
  const payload = placeholderCardPayload({
    sourceType: 'season',
    sourceId: 'uuid-x',
    sourceSlug: '',
    title: '',
    titleAmharic: '',
    category: 'Season',
    cardType: 'other',
    description: '',
    ethiopianMonthNumber: null,
    ethiopianDay: null,
    isMonthly: false,
    isMovable: true,
    paschaOffsetDays: 0,
    rangeLabel: '',
    summary: '',
    summaryAmharic: '',
    whatIsIt: '',
    whatIsItAmharic: '',
    whyCelebrated: '',
    whyCelebratedAmharic: '',
    importantInformation: '',
    importantInformationAmharic: '',
    scriptureReferences: '',
    fastingNotes: '',
    fastingNotesAmharic: '',
    seasonNotes: '',
    seasonNotesAmharic: '',
    imagePath: null,
    imageAlt: '',
    synaxariumDayId: null,
    synaxariumDaySlug: null,
  })
  assert.equal(payload.title, null)
  assert.match(validateCreateCardPayload(payload) || '', /title/i)
}

// --- Idempotent patch: empty repairs → empty patch ---
{
  const built = buildCardRepairPatch([])
  assert.deepEqual(built.patch, {})
  assert.equal(built.linkFieldUpdates, 0)
  assert.equal(built.placeholderClears, 0)
}

// --- Concurrent-style: two link repairs + clear stay partial and safe ---
{
  const a = buildCardRepairPatch([
    { kind: 'repair_source_slug', cardId: 'a', to: 'observance-filseta' },
  ])
  const b = buildCardRepairPatch([
    { kind: 'clear_placeholder_field', cardId: 'a', field: 'title', from: 'Filseta', to: null },
    { kind: 'clear_placeholder_field', cardId: 'a', field: 'summary', from: 'x', to: null },
  ])
  assert.equal(a.patch.source_slug, 'observance-filseta')
  assert.equal('title' in b.patch, false)
  assert.equal(b.patch.summary, null)
  // Combined apply would merge without nulling title
  const merged = { ...a.patch, ...b.patch }
  assert.equal(merged.source_slug, 'observance-filseta')
  assert.equal('title' in merged, false)
  assert.equal(merged.summary, null)
}

console.log('test-calendar-card-sync-safety: ok')
