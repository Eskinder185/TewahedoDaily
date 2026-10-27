import fs from 'node:fs'
import assert from 'node:assert/strict'

const migration = fs.readFileSync(new URL('../supabase/migrations/20261027090000_mezmur_publication_uuid_identity.sql', import.meta.url), 'utf8')
assert.match(migration, /publish_mezmur_import\(\s*p_import_id uuid/i)
assert.match(migration, /where import_id = p_import_id and deleted_at is null/i)
assert.match(migration, /Expected one Mezmur for slug %/i)
assert.match(migration, /where import_id = p_import_id and deleted_at is null[\s\S]*?for update/i)
assert.match(migration, /publish_mezmur_import\(v_id, v_m\.updated_at\)/i)
assert.doesNotMatch(migration, /return public\.publish_mezmur_import\(v_slug/i)
assert.match(migration, /already_published_public/i)
assert.match(migration, /published_missing_public/i)
assert.match(migration, /published_missing_public/i)
assert.match(migration, /public_visible/i)
assert.match(migration, /create or replace function public\.guard_mezmur_import_publication/i)
assert.doesNotMatch(migration, /Editorial approval is required|unverified lyrics cannot be displayed|restricted-lyrics Mezmur/i)
assert.doesNotMatch(migration, /set rights_status\s*=/i)
assert.doesNotMatch(migration, /drop table|truncate table/i)
console.log('PASS: UUID publication identity and duplicate-slug guards are present')
