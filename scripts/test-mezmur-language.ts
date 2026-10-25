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
assert.equal(isMezmurLanguageFilter('all'), false)
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

console.log('Mezmur multilingual filters and guarded assignment checks passed.')
