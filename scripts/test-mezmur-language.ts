import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { MEZMUR_LANGUAGES, normalizeMezmurLanguage, isMezmurLanguageFilter } from '../src/lib/mezmur/mezmurLanguage.ts'

assert.deepEqual(MEZMUR_LANGUAGES.map((item) => item.code), ['am', 'ti', 'om', 'gez', 'en'])
assert.equal(normalizeMezmurLanguage('amharic'), 'am')
assert.equal(normalizeMezmurLanguage('Tigrinya'), 'ti')
assert.equal(normalizeMezmurLanguage('Afaan Oromoo'), 'om')
assert.equal(normalizeMezmurLanguage("Ge'ez"), 'gez')
assert.equal(normalizeMezmurLanguage('English'), 'en')
assert.equal(normalizeMezmurLanguage('bilingual'), null)
assert.equal(normalizeMezmurLanguage(''), null)
assert.equal(isMezmurLanguageFilter(null), false)
assert.equal(isMezmurLanguageFilter(undefined), false)
assert.equal(isMezmurLanguageFilter('all'), true)
assert.equal(isMezmurLanguageFilter('am'), true)
assert.equal(isMezmurLanguageFilter('ti'), true)
assert.equal(isMezmurLanguageFilter('om'), true)
assert.equal(isMezmurLanguageFilter('gez'), true)
assert.equal(isMezmurLanguageFilter('en'), true)

const migration = readFileSync(new URL('../supabase/migrations/20261024280000_mezmur_multilingual_management.sql', import.meta.url), 'utf8')
assert.match(migration, /status = 'draft'/)
assert.match(migration, /not in \('admin', 'super_admin'\)/)
assert.match(migration, /revoke all .* from public, anon/i)
assert.doesNotMatch(migration, /disable row level security/i)

const publicPage = readFileSync(new URL('../src/pages/PublicMezmurLibrary.tsx', import.meta.url), 'utf8')
assert.match(publicPage, /params\.get\('language'\)/)
assert.match(publicPage, /aria-pressed/)
assert.match(publicPage, /next\.delete\('language'\)/)

const evidenceMigration = readFileSync(new URL('../supabase/migrations/20261028140000_mezmur_language_fasting_browse.sql', import.meta.url), 'utf8')
assert.match(evidenceMigration, /create table if not exists public\.mezmur_fasting_suitability/i)
assert.match(evidenceMigration, /create or replace view public\.mezmur_fasting_suitability_public/i)
assert.match(evidenceMigration, /m\.deleted_at is null/i)
assert.match(evidenceMigration, /m\.import_id = c\.import_id/i)
assert.match(evidenceMigration, /lower\(trim\(coalesce\(m\.primary_language/i)
assert.doesNotMatch(evidenceMigration, /disable row level security/i)

console.log('Mezmur multilingual filters and guarded assignment checks passed.')
