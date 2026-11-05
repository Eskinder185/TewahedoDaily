import assert from 'node:assert/strict'
import { createHash } from 'node:crypto'
import { readFile } from 'node:fs/promises'
import { resolve, join } from 'node:path'
import { parseCsvText } from '../src/lib/cms/mezmurCsvImport.ts'
import { LYRIC_KEYS } from '../src/lib/mezmur/versionDetection.ts'

const sourcePath = resolve('reports/mezmur-lyric-cleanup/mezmur_cleaned_classified.csv')
const source = await readFile(sourcePath)
const sha = (value: string | Buffer) => createHash('sha256').update(value).digest('hex')
const sourceSha256 = sha(source)
const folder = resolve('artifacts/mezmur-version-audit', sourceSha256.slice(0, 12))
const manifest = JSON.parse(await readFile(join(folder, 'source-manifest.json'), 'utf8')) as {
  sourceSha256: string; rowCount: number; records: Array<{ importId: string; slug: string; lyricHashes: Record<string, string | null> }>
}
const index = JSON.parse(await readFile(join(folder, 'audit-index.json'), 'utf8')) as { sourceSha256: string; rowCount: number; proposalCount: number }
const { rows } = parseCsvText(source.toString('utf8'))
assert.equal(sourceSha256, manifest.sourceSha256)
assert.equal(index.sourceSha256, sourceSha256)
assert.equal(rows.length, manifest.rowCount)
assert.equal(rows.length, index.rowCount)
assert.equal(rows.length, 2531)
const byId = new Map(rows.map((row) => [row.import_id, row]))
assert.equal(byId.size, rows.length)
for (const record of manifest.records) {
  const sourceRow = byId.get(record.importId)
  assert.ok(sourceRow)
  assert.equal(record.slug, sourceRow.slug)
  for (const field of LYRIC_KEYS) assert.equal(record.lyricHashes[field], sourceRow[field] ? sha(sourceRow[field]) : null)
}
assert.equal(manifest.records.length, rows.length, 'all rows retain original field hashes')
let proposals = 0
for (let start = 0; start < rows.length; start += 200) {
  const name = `batch-${String(start / 200 + 1).padStart(3, '0')}.json`
  const batch = JSON.parse(await readFile(join(folder, name), 'utf8')) as {
    sourceSha256: string; start: number; end: number;
    proposals: Array<{ left: Record<string, string>; right: Record<string, string> }>
  }
  assert.equal(batch.sourceSha256, sourceSha256)
  assert.equal(batch.start, start)
  assert.equal(batch.end, Math.min(rows.length, start + 200))
  proposals += batch.proposals.length
  for (const pair of batch.proposals) {
    assert.deepEqual(pair.left, byId.get(pair.left.import_id), 'left original row preserved verbatim')
    assert.deepEqual(pair.right, byId.get(pair.right.import_id), 'right original row preserved verbatim')
  }
}
assert.equal(proposals, index.proposalCount)
console.log(`Version audit integrity passed: ${rows.length} original rows and lyric hashes, ${proposals} preserved proposal pairs, source SHA-256 ${sourceSha256}.`)
