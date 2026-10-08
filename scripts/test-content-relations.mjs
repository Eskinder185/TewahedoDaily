/**
 * Pure checks for CMS related_content normalization + merge.
 * Run: node --experimental-strip-types --no-warnings scripts/test-content-relations.mjs
 */
import assert from 'node:assert/strict'
import {
  encyclopediaTemplateKind,
  mergeResolvedRelations,
  normalizeRelatedList,
  relationTypeLabel,
} from '../src/lib/cms/contentRelations.ts'

assert.deepEqual(normalizeRelatedList(null), [])
assert.deepEqual(normalizeRelatedList('x'), [])

const cleaned = normalizeRelatedList([
  { type: 'saints', id: 'uuid-1', title: 'St George' },
  { type: 'saints', id: 'uuid-1', title: 'dup' },
  { type: 'bogus', id: 'x' },
  { type: 'bible', id: 'john:3', route: '/bible/john/3' },
  { type: 'bible', id: 'bad', route: '/not-bible' },
  { type: 'mezmur', id: '' },
  null,
  31,
])
assert.equal(cleaned.length, 2)
assert.equal(cleaned[0].type, 'saints')
assert.equal(cleaned[1].type, 'bible')
assert.equal(cleaned[1].route, '/bible/john/3')

const merged = mergeResolvedRelations(
  [
    { type: 'saints', id: 'a', title: 'Saint A' },
    { type: 'feasts', id: 'missing' },
    { type: 'bible', id: 'john:3', route: '/bible/john/3', title: 'John 3' },
    { type: 'articles', id: 'art-1', title: 'Draft title' },
    { type: 'mezmur', id: 'm1', title: 'Hymn' },
  ],
  [
    { type: 'saints', id: 'a', title: 'Saint A Published', slug: 'saint-a' },
    { type: 'articles', id: 'art-1', title: 'Teaching', slug: 'teaching-1' },
    // feasts missing → filtered
    // mezmur unpublished → filtered
  ],
)

assert.equal(merged.length, 3)
assert.equal(merged[0].route, '/content/saints/saint-a')
assert.equal(merged[1].type, 'bible')
assert.equal(merged[1].route, '/bible/john/3')
assert.equal(merged[2].route, '/content/articles/teaching-1')
assert.ok(!merged.some((r) => r.id === 'missing'))
assert.ok(!merged.some((r) => r.id === 'm1'))

assert.equal(relationTypeLabel('articles'), 'Teaching')
assert.equal(encyclopediaTemplateKind('The Seven Mysteries'), 'sacrament')
assert.equal(encyclopediaTemplateKind('Church history'), 'history')
assert.equal(encyclopediaTemplateKind('Bible study'), 'terminology')

console.log('test-content-relations: ok')
