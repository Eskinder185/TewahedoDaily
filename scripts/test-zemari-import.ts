import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import {
  PRESET_ZEMARIS_WITH_LYRICS,
  buildPresetStagedZemarisWithLyrics,
  buildStagedZemarisFromCsvText,
  importSelectedStagedZemaris,
  summarizeZemariImportDryRun,
  validateStagedZemariRows,
  zemariNameSimilarity,
} from '../src/lib/cms/zemariCsvImport.ts'
import {
  assertZemariAssignmentSafe,
  type ZemariRow,
} from '../src/lib/cms/zemariAdminService.ts'

const sourceCsv = readFileSync(
  new URL('../mezmur-research/exports/zemaris_with_lyrics.csv', import.meta.url),
  'utf8',
)
const sourceRows = buildStagedZemarisFromCsvText(sourceCsv)
const presetRows = buildPresetStagedZemarisWithLyrics()

assert.equal(PRESET_ZEMARIS_WITH_LYRICS.length, 185)
assert.equal(sourceRows.length, 185)
assert.equal(new Set(presetRows.map((row) => row.slug)).size, 185)
assert.equal(new Set(presetRows.map((row) => row.name.toLowerCase())).size, 185)
assert.equal(presetRows.filter((row) => !row.name_amharic).length, 15)
assert.equal(presetRows.filter((row) => !/^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(row.slug)).length, 0)
assert.ok(presetRows.some((row) => row.name === 'Mahibere Kidusan'))
assert.deepEqual(
  presetRows.map((row) => [row.slug, row.name, row.name_amharic]),
  sourceRows.map((row) => [row.slug, row.name, row.name_amharic]),
)
assert.ok(sourceRows.every((row) => !row.name_amharic || /\p{Script=Ethiopic}/u.test(row.name_amharic)))

const presetSummary = summarizeZemariImportDryRun(presetRows, 'draft')
assert.equal(presetSummary.total, 185)
assert.equal(presetSummary.invalid, 0)
assert.equal(presetSummary.manualReview >= 15, true)
assert.equal(presetSummary.ready + presetSummary.manualReview >= 185, true)

assert.ok(zemariNameSimilarity('Zemari Dawit Tilahun', 'Dawit Tilahoun') >= 0.86)
const existing: ZemariRow = {
  id: 'existing-1',
  slug: 'zemari-dawit-tilahun',
  name: 'Zemari Dawit Tilahun',
  name_amharic: 'ዘማሪ ዳዊት ጥላሁን',
  bio: null,
  bio_amharic: null,
  image_path: null,
  image_alt: null,
  youtube_url: null,
  website_url: null,
  sort_order: 0,
  is_featured: false,
  status: 'draft',
  created_at: null,
  updated_at: null,
}
const fuzzy = buildStagedZemarisFromCsvText(
  'slug,name,name_amharic,status\nzemari-dawit-tilahoun,Zemari Dawit Tilahoun,ዘማሪ ዳዊት ጥላሁንን,draft',
  [existing],
)[0]
assert.equal(fuzzy.alreadyExists, false)
assert.equal(fuzzy.potentialDuplicate, true)
assert.equal(fuzzy.selected, false)

const conflict = buildStagedZemarisFromCsvText(
  'slug,name,name_amharic,status\nanother-dawit,Zemari Dawit Tilahun,ዘማሪ ዳዊት ሌላ,draft',
  [existing],
)[0]
assert.equal(conflict.alreadyExists, true)
assert.match(conflict.reviewWarnings.join(' '), /Amharic name differs/i)

const invalidStatus = buildStagedZemarisFromCsvText(
  'slug,name,name_amharic,status\nvalid-slug,Valid Name,ትክክለኛ,live',
)[0]
assert.match(invalidStatus.validationError || '', /Invalid source status/i)

const candidate = buildStagedZemarisFromCsvText(
  'slug,name,name_amharic,status\nfixture-new-zemari,Fixture New Zemari,የሙከራ ዘማሪ,draft',
)[0]
const stored = new Map<string, ZemariRow>()
const fakeSave = async (input: Partial<ZemariRow> & { name: string; slug: string }) => {
  const row: ZemariRow = {
    id: `id-${input.slug}`,
    slug: input.slug,
    name: input.name,
    name_amharic: input.name_amharic || null,
    bio: null,
    bio_amharic: null,
    image_path: null,
    image_alt: input.image_alt || null,
    youtube_url: null,
    website_url: null,
    sort_order: Number(input.sort_order) || 0,
    is_featured: false,
    status: input.status || 'draft',
    created_at: new Date(0).toISOString(),
    updated_at: new Date(0).toISOString(),
  }
  stored.set(row.slug, row)
  return row
}
const findStored = async (slug: string) => stored.get(slug) || null
const first = await importSelectedStagedZemaris([candidate], {
  targetStatus: 'draft',
  findExisting: findStored,
  save: fakeSave,
})
assert.deepEqual(first.imported, ['fixture-new-zemari'])
assert.equal(stored.get('fixture-new-zemari')?.name_amharic, 'የሙከራ ዘማሪ')
assert.equal(stored.get('fixture-new-zemari')?.status, 'draft')

const repeated = await importSelectedStagedZemaris([candidate], {
  targetStatus: 'draft',
  findExisting: findStored,
  save: fakeSave,
})
assert.equal(repeated.imported.length, 0)
assert.equal(repeated.skipped.length, 1)
assert.equal(stored.size, 1)

let attempts = 0
const transient = buildStagedZemarisFromCsvText(
  'slug,name,name_amharic,status\nretry-zemari,Retry Zemari,ድጋሚ ዘማሪ,draft',
)[0]
const retried = await importSelectedStagedZemaris([transient], {
  targetStatus: 'draft',
  maxRetries: 1,
  findExisting: async () => null,
  save: async (input) => {
    attempts += 1
    if (attempts === 1) throw new Error('429 rate limit')
    return fakeSave(input)
  },
})
assert.equal(attempts, 2)
assert.deepEqual(retried.imported, ['retry-zemari'])

const permanentFailure = await importSelectedStagedZemaris([transient], {
  targetStatus: 'draft',
  maxRetries: 2,
  findExisting: async () => null,
  save: async () => {
    throw new Error('Permission denied (42501) on table zemaris')
  },
})
assert.equal(permanentFailure.failed.length, 1)
assert.match(permanentFailure.failed[0].error, /42501.*zemaris/i)

const cancellation = new AbortController()
cancellation.abort()
let cancelledSaveCalled = false
const cancelled = await importSelectedStagedZemaris([transient], {
  targetStatus: 'draft',
  signal: cancellation.signal,
  findExisting: async () => null,
  save: async (input) => {
    cancelledSaveCalled = true
    return fakeSave(input)
  },
})
assert.equal(cancelled.cancelled, true)
assert.equal(cancelledSaveCalled, false)

assert.doesNotThrow(() => assertZemariAssignmentSafe(null, 'target'))
assert.doesNotThrow(() => assertZemariAssignmentSafe('target', 'target'))
assert.throws(() => assertZemariAssignmentSafe('other', 'target'), /already assigned/i)

const migration = readFileSync(
  new URL(
    '../supabase/migrations/20261024130000_zemari_import_validation_and_safe_public_mezmur.sql',
    import.meta.url,
  ),
  'utf8',
)
assert.match(migration, /create or replace function public\.validate_zemari_import_access/i)
assert.match(migration, /create view public\.mezmur_public/i)
assert.match(migration, /review_status[\s\S]*approved/i)
assert.match(migration, /publication_approved_at is not null/i)
assert.match(migration, /revoke select on public\.mezmur_data_import from anon/i)
assert.doesNotMatch(migration, /disable\s+row\s+level\s+security/i)

const revalidated = validateStagedZemariRows(presetRows)
assert.equal(revalidated.length, 185)

console.log(
  `Zemari import tests passed: 185 source rows, ${presetSummary.ready} immediately ready, ${presetSummary.manualReview} requiring review.`,
)
