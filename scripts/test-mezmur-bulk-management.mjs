import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'

const files = {
  migration: await readFile('supabase/migrations/20261024230000_mezmur_bulk_management.sql', 'utf8'),
  idempotencyMigration: await readFile('supabase/migrations/20261024250000_mezmur_bulk_job_idempotency.sql', 'utf8'),
  supabaseOperationsMigration: await readFile('supabase/migrations/20261024260000_mezmur_bulk_supabase_operations.sql', 'utf8'),
  schemaCompatibilityMigration: await readFile('supabase/migrations/20261024270000_mezmur_bulk_schema_compatibility.sql', 'utf8'),
  zemariMatchingMigration: await readFile('supabase/migrations/20261024290000_mezmur_zemari_matching.sql', 'utf8'),
  service: await readFile('src/lib/cms/mezmurBulkService.ts', 'utf8'),
  page: await readFile('src/pages/admin/MezmurBulkManagement.tsx', 'utf8'),
  backend: await readFile('backend/app/editorial/mezmur_bulk.py', 'utf8'),
  app: await readFile('src/App.tsx', 'utf8'),
}
for (const removed of ['structured_lyrics', 'lyrics_language', 'source_info', 'external_lyrics_url', 'last_verified_at', 'related_content']) {
  assert(!Object.values(files).some((text) => text.includes(removed)), `Removed field returned: ${removed}`)
}
assert.match(files.migration, /publish_mezmur_import\(v_m\.slug,v_m\.updated_at\)/)
assert.match(files.migration, /v_role <> 'super_admin'/)
assert.match(files.migration, /cardinality\(coalesce\(p_import_ids,'\{\}'\)\) > 100/)
assert.match(files.migration, /where import_id=v_s\.mezmur_import_id/)
assert.match(files.idempotencyMigration, /pg_advisory_xact_lock/)
assert.match(files.idempotencyMigration, /created_by = v_actor/)
assert.match(files.idempotencyMigration, /grant execute on function public\.create_mezmur_enrichment_job/)
assert.match(files.supabaseOperationsMigration, /bulk_add_mezmur_category/)
assert.match(files.schemaCompatibilityMigration, /bulk_add_mezmur_category/)
assert.doesNotMatch(files.schemaCompatibilityMigration, /coalesce\(status|where slug = v_category and[^\n]*status/)
assert.match(files.supabaseOperationsMigration, /where import_id = v_id/)
assert.match(files.supabaseOperationsMigration, /v_role not in \('admin', 'super_admin'\)/)
assert.doesNotMatch(files.backend, /self\.patch\("mezmur_data_import"/)
assert.match(files.backend, /range\(0, 1_000_000, page_size\)/)
assert.match(files.service, /from\('mezmur_data_import'/)
assert.match(files.service, /range\(from, to\)/)
assert.match(files.service, /title_amharic/)
assert.match(files.service, /review_status/)
assert.doesNotMatch(files.backend, /SequenceMatcher/)
assert.match(files.zemariMatchingMigration, /bulk_link_mezmur_zemaris/)
assert.doesNotMatch(files.zemariMatchingMigration, /insert into public\.zemaris/i)
assert.doesNotMatch(files.zemariMatchingMigration, /set singer_name/i)
assert.match(files.page, /Publish All Eligible/)
assert.match(files.page, /useState\('draft'\)/)
assert.match(files.page, /Select all matching Drafts/)
assert.match(files.page, /Select Drafts on page/)
assert.match(files.page, /published_missing_public/)
assert.doesNotMatch(files.page, /setSelectedRecords\(new Set\(filtered\.map/)
assert.match(files.page, /Zemari \/ Singer/)
assert.match(files.page, /Bulk Match Exact Names/)
assert.match(files.page, /window\.confirm/)
assert.match(files.app, /path="bulk"/)
console.log('PASS: Mezmur bulk workflow static regression checks')
