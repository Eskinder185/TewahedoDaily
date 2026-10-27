import assert from 'node:assert/strict'
import fs from 'node:fs'
import { resolveMezmurPublicVisibility } from '../src/lib/cms/mezmurVisibility.ts'

const source = (overrides: Record<string, unknown> = {}) => ({
  import_id: 'a', mezmur_id: null, slug: 'same-slug', title: 'Same title', status: 'published', deleted_at: null,
  ...overrides,
})
const publicRow = (overrides: Record<string, unknown> = {}) => ({ mezmur_id: null, slug: 'same-slug', title: 'Same title', status: 'published', ...overrides })

assert.deepEqual(
  resolveMezmurPublicVisibility(source(), [source()], [publicRow()]),
  { visible: true, reason: null },
  'NULL mezmur_id must use a uniqueness-checked slug fallback',
)
assert.equal(
  resolveMezmurPublicVisibility(source({ mezmur_id: 'id-1' }), [source({ mezmur_id: 'id-1' })], [publicRow({ mezmur_id: 'id-1' })]).visible,
  true,
  'non-null mezmur_id must match exactly',
)
assert.match(
  resolveMezmurPublicVisibility(source(), [source(), source({ import_id: 'b' })], [publicRow()]).reason || '',
  /duplicate normalized slug/i,
)
assert.match(
  resolveMezmurPublicVisibility(source(), [source()], [publicRow(), publicRow({ title: 'other' })]).reason || '',
  /duplicate normalized slug/i,
)
assert.match(
  resolveMezmurPublicVisibility(source(), [source()], []).reason || '',
  /absent/i,
)
assert.equal(
  resolveMezmurPublicVisibility(source({ status: 'draft' }), [source({ status: 'draft' })], [publicRow()]).visible,
  false,
)

assert.equal(
  resolveMezmurPublicVisibility(source({ mezmur_id: 'id-english' }), [source({ mezmur_id: 'id-english' })], [publicRow({ mezmur_id: 'id-english' })]).visible,
  true,
  'visibility identity must not require a particular lyrics language',
)

const migration = fs.readFileSync(new URL('../supabase/migrations/20261027130000_mezmur_publication_visibility_identity.sql', import.meta.url), 'utf8')
assert.match(migration, /mezmur_import_public_visibility/)
assert.match(migration, /v_source_slug_count/)
assert.match(migration, /v_public_slug_count/)
assert.match(migration, /cardinality\(coalesce\(p_import_ids, '\{\}'::uuid\[\]\)\) > 100/)
assert.match(migration, /security definer/i)
assert.match(migration, /mezmur_import_public_visibility\(uuid\) from public, anon, authenticated/i)
assert.match(migration, /at least one supported lyrics field or YouTube URL/i)
assert.doesNotMatch(migration, /Title, slug, and Amharic lyrics are required/i)
assert.match(migration, /v_published := v_published \+ 1;/)
assert.doesNotMatch(migration, /set\s+mezmur_id\s*=/i)
console.log('PASS: publication visibility identity checks')
