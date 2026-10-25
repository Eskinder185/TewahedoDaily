import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'
import { buildBulkSnapshot, formatRecordedDate, parseBulkPublishResult, validRecordedTimestamp } from '../src/lib/cms/mezmurBulkService.ts'
import { errorMessage, formatErrorMessage } from '../src/lib/cms/errorMessage.ts'

const postgrestMessage = formatErrorMessage({
  code: '42703', message: 'column categories.status does not exist', details: null, hint: null,
}, { operation: 'Load public.categories rows 1-500' })
assert.match(postgrestMessage, /Load public\.categories rows 1-500 failed \(42703\)/)
assert.match(postgrestMessage, /categories\.status does not exist/)
assert.doesNotMatch(postgrestMessage, /\[object Object\]/)
assert.match(formatErrorMessage({ code: '42501', message: 'permission denied for table mezmur_data_import' }), /42501/)
assert.match(formatErrorMessage({ code: 'PGRST202', message: 'Could not find the function public.bulk_add_mezmur_category' }), /PGRST202/)
assert.match(formatErrorMessage({ name: 'AuthApiError', status: 401, message: 'Invalid JWT' }), /401.*Invalid JWT/)
assert.match(formatErrorMessage({ name: 'StorageApiError', statusCode: 403, message: 'Access denied' }), /403.*Access denied/)
assert.equal(formatErrorMessage(new TypeError('Failed to fetch')), 'Failed to fetch')
assert.equal(formatErrorMessage({ unexpected: { nested: true } }), 'Something went wrong. Please try again.')
assert.equal(formatErrorMessage(null), 'Something went wrong. Please try again.')
assert.doesNotMatch(errorMessage({ unexpected: true }), /\[object Object\]/)
assert.doesNotMatch(formatErrorMessage({ message: 'Bearer abc.def.ghi access_token=secret-value' }), /abc\.def|secret-value/)
assert.deepEqual(parseBulkPublishResult({
  published: 1, skipped: 2, failed: 1,
  results: [
    { import_id: '10000000-0000-4000-8000-000000000001', outcome: 'published' },
    { import_id: '10000000-0000-4000-8000-000000000002', outcome: 'failed', sqlstate: '23514', reason: 'Blocked' },
  ],
}), {
  published: 1, skipped: 2, failed: 1,
  results: [
    { import_id: '10000000-0000-4000-8000-000000000001', outcome: 'published' },
    { import_id: '10000000-0000-4000-8000-000000000002', outcome: 'failed', sqlstate: '23514', reason: 'Blocked' },
  ],
})
assert.throws(() => parseBulkPublishResult(null), /invalid response/)

const mezmurs = Array.from({ length: 886 }, (_, index) => ({
  import_id: `00000000-0000-4000-8000-${String(index).padStart(12, '0')}`,
  slug: `mezmur-${index}`,
  title: `Mezmur ${index}`,
  singer_name: index % 3 === 0 ? 'Known Zemari' : `Imported singer ${index}`,
  zemari_id: index % 3 === 0 ? '10000000-0000-4000-8000-000000000001' : null,
  status: 'draft',
  lyrics_amharic: index % 10 === 0 ? null : 'ግጥም',
  lyrics_geez: null,
  lyrics_english: null,
  lyrics_oromo: null,
  lyrics_transliteration: null,
  rights_status: 'unknown',
  publication_approved_at: null,
  publication_approved_by: null,
  youtube_url: index % 10 === 0 ? null : 'https://youtu.be/example',
  source_url: null,
  updated_at: index === 0 ? null : index === 1 ? '0' : '2026-10-24T12:00:00Z',
  deleted_at: null,
}))
const categoryLinks = mezmurs.filter((_, index) => index % 2 === 0).map((row) => ({ mezmur_slug: row.slug, category_slug: 'praise' }))
const occasionLinks = mezmurs.filter((_, index) => index % 4 === 0).map((row) => ({ mezmur_slug: row.slug, occasion_slug: 'general' }))
const snapshot = buildBulkSnapshot({
  mezmurs, categoryLinks, occasionLinks,
  zemaris: [{ id: '10000000-0000-4000-8000-000000000001', name: 'Known Zemari', name_amharic: null }],
  jobs: [], suggestions: [],
})

assert.equal(snapshot.records.length, 886)
assert.equal(new Set(snapshot.records.map((row) => row.import_id)).size, 886)
assert.equal(snapshot.dashboard.drafts, 886)
assert.equal(snapshot.dashboard.with_lyrics, 797)
assert.equal(snapshot.dashboard.missing_lyrics, 89)
assert.equal(snapshot.dashboard.categorized, 443)
assert.equal(snapshot.dashboard.missing_categories, 443)
assert.equal(snapshot.dashboard.matched_zemaris, 296)
assert.equal(snapshot.dashboard.unmatched_zemaris, 590)
assert.equal(snapshot.dashboard.eligible, snapshot.records.filter((r) => r.publication_eligible).length)
assert.equal(snapshot.dashboard.blocked, snapshot.records.filter((r) => !r.publication_eligible).length)
assert.equal(validRecordedTimestamp(null), null)
assert.equal(validRecordedTimestamp('0'), null)
assert.equal(formatRecordedDate(null), 'Not recorded')
assert.notEqual(formatRecordedDate(null), '12/31/1969')

const service = await readFile('src/lib/cms/mezmurBulkService.ts', 'utf8')
const page = await readFile('src/pages/admin/MezmurBulkManagement.tsx', 'utf8')
const mezmurService = await readFile('src/lib/cms/mezmurService.ts', 'utf8')
const mezmurList = await readFile('src/pages/admin/MezmurList.tsx', 'utf8')
const publicMigration = await readFile('supabase/migrations/20261024180000_mezmur_two_state_publication_final.sql', 'utf8')
assert.match(page, /getSupabaseMezmurBulkSnapshot/)
assert.match(page, /formatErrorMessage\(cause\)/)
assert.doesNotMatch(page, /String\(cause\)/)
assert.match(service, /Automatic AI analysis is unavailable because no public AI API URL is configured/)
assert.match(service, /bulk_link_mezmur_zemaris/)
assert.match(page, /Zemari \/ Singer/)
assert.match(page, /Bulk Match Exact Names/)
assert.doesNotMatch(page, />Unmatched</)
assert.match(service, /rpc\('bulk_publish_mezmur_imports'/)
assert.match(service, /rpc\('apply_mezmur_enrichment_suggestion'/)
assert.doesNotMatch(service, /backendRequest<BulkDashboard>/)
assert.match(service, /select\('slug'\)\.order\('slug'\)/)
assert.doesNotMatch(service, /select\('slug,status'\)/)
assert.match(mezmurService, /from\('mezmur_category_links_import'/)
assert.doesNotMatch(mezmurService, /new Date\(0\)\.toISOString\(\)/)
assert.match(mezmurList, /formatRecordedDate\(row\.updated_at\)/)
assert.match(publicMigration, /then lyrics_amharic else null end as lyrics_amharic/i)
assert.match(publicMigration, /grant select on public\.mezmur_public to anon, authenticated/i)

console.log('PASS: 886-record Supabase-only bulk inventory, counts, eligibility, and missing timestamp regressions')
