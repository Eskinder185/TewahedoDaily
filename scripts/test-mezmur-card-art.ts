/**
 * Every Mezmur Library category/occasion card must resolve to artwork, and no two cards may share
 * the same image (a repeated image makes neighbouring cards look identical). Local files must exist.
 */
import assert from 'node:assert/strict'
import fs from 'node:fs'
import path from 'node:path'
import { MEZMUR_CATEGORY_BROWSE_GROUPS, MEZMUR_OCCASION_BROWSE_GROUPS } from '../src/lib/publicContent/mezmurBrowseGroups'
import { hymnCollectionArtFallback } from '../src/lib/publicContent/hymnCollectionArtFallbacks'

const groups = [...MEZMUR_CATEGORY_BROWSE_GROUPS, ...MEZMUR_OCCASION_BROWSE_GROUPS]
const seen = new Map<string, string>()

for (const group of groups) {
  const url = hymnCollectionArtFallback(group.slug)
  assert.ok(url, `${group.slug}: no artwork resolved`)
  const previous = seen.get(url)
  assert.equal(previous, undefined, `${group.slug} reuses the image of ${previous}`)
  seen.set(url, group.slug)
  if (url.startsWith('/')) {
    assert.ok(fs.existsSync(path.join('public', url)), `${group.slug}: local file missing: ${url}`)
  }
  console.log('ok  ', group.slug.padEnd(28), url.slice(0, 90))
}
console.log(`mezmur card art: ${groups.length} cards, all distinct`)
