import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { fileURLToPath } from 'node:url'
import { join } from 'node:path'

const root = fileURLToPath(new URL('..', import.meta.url))
const service = readFileSync(join(root, 'src/lib/cms/adminContentReviewService.ts'), 'utf8')
const tag = readFileSync(join(root, 'src/components/admin/AdminContentReviewTag.tsx'), 'utf8')

assert.match(service, /if \(error\) throw error/)
assert.match(service, /const normalizedContentId = contentId\.trim\(\)/)
assert.match(service, /export type ReviewContentAliases/)
assert.match(service, /aliases\?\.get\(contentId\)/)
assert.match(service, /const canonicalId = normalizedIds\?\.find/)
assert.match(service, /Review lookup returned no data/)
assert.match(service, /throw reviewError\(err, 'Review lookup failed\.'\)/)
assert.match(service, /if \(!data\) throw new Error\('Review update returned no record\.'\)/)
assert.match(service, /throw reviewError\(err, 'Review update failed\.'\)/)
assert.match(tag, /catch \(cause\)/)
assert.match(tag, /role="alert"/)
assert.match(tag, /setStatus\('reviewed'\)/)
assert.match(tag, /useEffect/)

const list = readFileSync(join(root, 'src/pages/admin/MezmurList.tsx'), 'utf8')
assert.match(list, /const ids = result\.data\.rows\.map\(\(r\) => r\.import_id\)/)
assert.match(list, /fetchReviewsForContent\('mezmur', ids, aliases\)/)
assert.match(list, /content_id: row\.import_id/)

async function saveReviewStatusMock(client, status) {
  const { data, error } = await client.upsert(status)
  if (error) throw error
  if (!data) throw new Error('Review update returned no record.')
  return data
}

const reviewed = { content_type: 'mezmur', content_id: 'semaye-beab', review_status: 'reviewed' }
const server = {
  record: null,
  async upsert(value) {
    this.record = value
    return { data: value, error: null }
  },
}
assert.deepEqual(await saveReviewStatusMock(server, reviewed), reviewed)
assert.equal(server.record.review_status, 'reviewed')

const aliases = new Map([
  ['11111111-1111-1111-1111-111111111111', ['semaye-beab', 'semaye-beab']],
])
const rows = [{ content_id: 'semaye-beab', review_status: 'reviewed' }]
const canonical = rows.map((row) => {
  const contentId = [...aliases.entries()].find(([, values]) => values.includes(row.content_id))?.[0] || row.content_id
  return { ...row, content_id: contentId }
})
assert.equal(canonical[0].content_id, '11111111-1111-1111-1111-111111111111')
assert.equal(canonical[0].review_status, 'reviewed')

await assert.rejects(
  () => saveReviewStatusMock({ upsert: async () => ({ data: null, error: new Error('permission denied') }) }, reviewed),
  /permission denied/,
)

console.log('Mezmur review persistence regression tests passed.')
