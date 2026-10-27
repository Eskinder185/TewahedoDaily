import assert from 'node:assert/strict'
import fs from 'node:fs'
import path from 'node:path'
import { CANONICAL_CATEGORIES, CANONICAL_OCCASIONS } from '../src/lib/publicContent/taxonomy.ts'

const dir = path.join(process.cwd(), 'reports', 'mezmur-classification')
const proposal = fs.readFileSync(path.join(dir, 'MEZMUR_CLASSIFICATION_PROPOSALS.csv'), 'utf8')
const changes = fs.readFileSync(path.join(dir, 'CLASSIFICATION_CHANGESET.sql'), 'utf8')
const reference = fs.readFileSync(path.join(dir, 'REFERENCE_HYMN_SECTION_INDEX.csv'), 'utf8')
assert.ok(proposal.includes('import_id'), 'proposals must expose the required immutable identity column')
assert.ok(proposal.includes('review_status'), 'proposals must carry review status')
assert.match(changes, /no executable changes/i)
assert.doesNotMatch(changes, /^\s*(insert|update|delete)\b/im, 'review-only changeset must not write data')
assert.match(reference, /New Year \/ Enkutatash/)
assert.match(reference, /owner_supplied_supporting_index/)
for (const category of CANONICAL_CATEGORIES) assert.ok(typeof category === 'string' && category.length > 0)
for (const occasion of CANONICAL_OCCASIONS) assert.ok(typeof occasion === 'string' && occasion.length > 0)
console.log('Deep Mezmur classification artifact checks passed.')
