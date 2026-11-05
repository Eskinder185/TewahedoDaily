/** Read-only CSV version audit. No Supabase client, API key, or model dependency. */
import assert from 'node:assert/strict'
import { createHash } from 'node:crypto'
import { mkdir, readFile, writeFile } from 'node:fs/promises'
import { resolve, join } from 'node:path'
import { parseCsvText } from '../src/lib/cms/mezmurCsvImport.ts'
import {
  VERSION_DETECTOR_REVISION, LYRIC_KEYS, prepareVersions, buildCandidateIndex,
  compareVersions, proposedFamilies, type VersionInput, type VersionProposal,
} from '../src/lib/mezmur/versionDetection.ts'

const sourcePath = resolve(process.argv[2] || 'reports/mezmur-lyric-cleanup/mezmur_cleaned_classified.csv')
const outputBase = resolve(process.argv[3] || 'artifacts/mezmur-version-audit')
const batchSize = 200
const sha = (text: string | Buffer) => createHash('sha256').update(text).digest('hex')
const sourceBytes = await readFile(sourcePath)
const sourceSha256 = sha(sourceBytes)
const outputDir = join(outputBase, sourceSha256.slice(0, 12))
const { headers, rows: csvRows } = parseCsvText(sourceBytes.toString('utf8'))
for (const field of ['import_id', 'slug', 'title', ...LYRIC_KEYS]) {
  assert.ok(headers.includes(field), `Missing required CSV column: ${field}`)
}
const rows = csvRows as VersionInput[]
const ids = rows.map((row) => row.import_id)
assert.ok(ids.every(Boolean) && new Set(ids).size === rows.length, 'import_id must be populated and unique for every row')
assert.equal(rows.length, 2531, 'The current retained library export must contain all 2,531 rows')
const prepared = prepareVersions(rows)
const candidates = buildCandidateIndex(prepared)
await mkdir(outputDir, { recursive: true })

const manifest = {
  schema: 'mezmur-version-source-v1', detectorRevision: VERSION_DETECTOR_REVISION,
  sourcePath: sourcePath.replaceAll('\\', '/'), sourceSha256, rowCount: rows.length,
  records: rows.map((row) => ({
    importId: row.import_id, mezmurId: row.mezmur_id || null, slug: row.slug,
    lyricHashes: Object.fromEntries(LYRIC_KEYS.map((key) => [key, row[key] ? sha(row[key]!) : null])),
  })),
}
await writeFile(join(outputDir, 'source-manifest.json'), JSON.stringify(manifest, null, 2) + '\n')

type AuditPair = VersionProposal & {
  id: string
  left: VersionInput
  right: VersionInput
  originalLyricHashes: { left: string | null; right: string | null }
}
const all: AuditPair[] = []
let resumed = 0
for (let start = 0; start < prepared.length; start += batchSize) {
  const end = Math.min(prepared.length, start + batchSize)
  const name = `batch-${String(start / batchSize + 1).padStart(3, '0')}.json`
  const path = join(outputDir, name)
  let batch: { schema: string; detectorRevision: string; sourceSha256: string; start: number; end: number; proposals: AuditPair[] } | null = null
  try {
    const existing = JSON.parse(await readFile(path, 'utf8')) as typeof batch
    if (existing?.schema === 'mezmur-version-batch-v1' && existing.detectorRevision === VERSION_DETECTOR_REVISION && existing.sourceSha256 === sourceSha256 && existing.start === start && existing.end === end && Array.isArray(existing.proposals)) {
      batch = existing
      resumed += 1
    }
  } catch { /* first run or invalid batch: recompute */ }
  if (!batch) {
    const proposals: AuditPair[] = []
    for (let i = start; i < end; i++) {
      for (const j of [...candidates.pairs[i]].sort((a, b) => a - b)) {
        const proposal = compareVersions(prepared[i], prepared[j], candidates.documentFrequency)
        if (!proposal) continue
        proposals.push({
          ...proposal, id: sha(`${proposal.leftImportId}:${proposal.rightImportId}`).slice(0, 20),
          left: rows[i], right: rows[j],
          originalLyricHashes: {
            left: prepared[i].lyric ? sha(prepared[i].lyric) : null,
            right: prepared[j].lyric ? sha(prepared[j].lyric) : null,
          },
        })
      }
    }
    batch = { schema: 'mezmur-version-batch-v1', detectorRevision: VERSION_DETECTOR_REVISION, sourceSha256, start, end, proposals }
    await writeFile(path, JSON.stringify(batch, null, 2) + '\n')
  }
  all.push(...batch.proposals)
  console.log(`${name}: ${batch.proposals.length} proposals${resumed && batch.start < resumed * batchSize ? ' (resumed)' : ''}`)
}

const proposals = all.map(({ left: _left, right: _right, originalLyricHashes: _hashes, id, ...proposal }) => ({ id, ...proposal }))
const families = proposedFamilies(ids, all)
const counts = Object.fromEntries([...new Set(all.map((proposal) => proposal.relationship))].sort().map((kind) => [kind, all.filter((proposal) => proposal.relationship === kind).length]))
const index = {
  schema: 'mezmur-version-index-v1', detectorRevision: VERSION_DETECTOR_REVISION, sourceSha256,
  rowCount: rows.length, candidatePairs: candidates.pairCount, proposalCount: all.length,
  counts, families, proposals,
}
await writeFile(join(outputDir, 'audit-index.json'), JSON.stringify(index, null, 2) + '\n')
const report = [
  '# Mezmur version audit', '',
  `Source: \`${sourcePath.replaceAll('\\', '/')}\``,
  `Source SHA-256: \`${sourceSha256}\``,
  `Rows retained: ${rows.length}; unique import IDs: ${new Set(ids).size}.`,
  `Candidate pairs compared: ${candidates.pairCount}; proposals: ${all.length}; proposed families: ${families.length}.`,
  `Resumed batches: ${resumed} of ${Math.ceil(rows.length / batchSize)}.`, '',
  '## Proposed relationships', '',
  ...Object.entries(counts).map(([kind, count]) => `- ${kind}: ${count}`), '',
  'These are offline proposals, not approved relationships. No records were merged, deleted, published, or changed.',
  'Upload an individual batch JSON in the staff Version Review page to inspect original lyrics and export decisions.',
  'The immutable CSV remains the recovery source; source-manifest.json records every import ID and SHA-256 of each lyric field.',
  'Exact duplicate means identical original lyric text in the same language field. Short/common refrains alone cannot establish a family.',
].join('\n') + '\n'
await writeFile(join(outputDir, 'audit-report.md'), report)
console.log(`Audit written to ${outputDir}`)
