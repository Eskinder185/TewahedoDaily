import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { fileURLToPath } from 'node:url'
import { join } from 'node:path'

const root = fileURLToPath(new URL('..', import.meta.url))
const service = readFileSync(join(root, 'src/lib/cms/mezmurService.ts'), 'utf8')

assert.match(service, /if \(isMezmurUuid\(needle\)\)/)
assert.match(service, /\.eq\('import_id', needle\)/)
assert.match(service, /\.eq\('mezmur_id', needle\)/)
assert.match(service, /\.eq\('slug', needle\)/)
assert.match(service, /This Mezmur slug is ambiguous/)

const uuid = '11111111-1111-4111-8111-111111111111'
const isUuid = (value) => /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i.test(value.trim())
const lookup = (identifier, rows) => {
  const needle = identifier.trim()
  const matches = isUuid(needle)
    ? rows.filter((row) => row.import_id === needle)
    : []
  if (matches[0]) return matches[0]
  const legacy = rows.filter((row) => row.mezmur_id === needle)
  if (legacy.length > 1) throw new Error('legacy identifier ambiguous')
  if (legacy[0]) return legacy[0]
  const slugs = rows.filter((row) => row.slug === needle)
  if (slugs.length > 1) throw new Error('This Mezmur slug is ambiguous.')
  return slugs[0] || null
}

const rows = [
  { import_id: uuid, mezmur_id: 'semaye-beab', slug: 'semaye-beab', title: 'First' },
  { import_id: '22222222-2222-4222-8222-222222222222', mezmur_id: 'another-mezmur', slug: 'another-mezmur', title: 'Second' },
]
assert.equal(lookup(uuid, rows).title, 'First')
assert.equal(lookup('semaye-beab', rows).title, 'First')
assert.equal(lookup('another-mezmur', rows).title, 'Second')
assert.equal(lookup('not-a-real-mezmur', rows), null)

assert.throws(
  () => lookup('duplicate', [...rows, { import_id: '33333333-3333-4333-8333-333333333333', mezmur_id: 'third', slug: 'duplicate' }, { import_id: '44444444-4444-4444-8444-444444444444', mezmur_id: 'fourth', slug: 'duplicate' }]),
  /ambiguous/,
)

console.log('Mezmur identifier regression tests passed.')
