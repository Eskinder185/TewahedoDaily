import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'
import { parseBibleImport } from '../src/lib/bible/bibleImport.ts'

const csv = `edition_code,book_slug,chapter,verse,text,source_name
am,genesis,1,1,"በመጀመሪያ፣ እግዚአብሔር",ኦሪት ዘፍጥረት
am,genesis,1,2,ምድርም ባዶ ነበረች,ኦሪት ዘፍጥረት`
const csvPreview = parseBibleImport(csv, 'csv')
assert.equal(csvPreview.chapters.length, 1)
assert.equal(csvPreview.verseCount, 2)
assert.equal(csvPreview.chapters[0].verses[0].text, 'በመጀመሪያ፣ እግዚአብሔር')
assert.equal(csvPreview.issues.length, 0)

const jsonPreview = parseBibleImport(JSON.stringify({ verses: [
  { edition_code: 'web', book_slug: 'john', chapter: 3, verse: 16, text: 'For God so loved the world.' },
  { edition_code: 'web', book_slug: 'john', chapter: 3, verse: 18, text: 'Whoever believes is not condemned.' },
] }), 'json')
assert.equal(jsonPreview.chapters.length, 1)
assert.ok(jsonPreview.issues.some((issue) => issue.severity === 'warning' && issue.message.includes('missing verse')))

const usfmPreview = parseBibleImport('\\id GEN\n\\c 1\n\\v 1 ቀዳሚ ግዕዝ\n\\v 2-3 የተዋሐደ ቁጥር', 'usfm', { editionCode: 'gez-liturgical', bookSlug: 'genesis' })
assert.equal(usfmPreview.chapters[0].editionCode, 'gez-liturgical')
assert.equal(usfmPreview.chapters[0].verses.length, 2)
assert.ok(usfmPreview.issues.some((issue) => issue.severity === 'warning' && issue.message.includes('bridge')))

const duplicate = parseBibleImport('edition_code,book_slug,chapter,verse,text\nweb,john,1,1,One\nweb,john,1,1,Duplicate', 'csv')
assert.ok(duplicate.issues.some((issue) => issue.severity === 'error' && issue.message.includes('Duplicate verse')))

const migration = readFileSync(resolve('supabase/migrations/20261024210000_bible_cms_management.sql'), 'utf8')
for (const expected of [
  'create or replace function public.save_bible_chapter_draft',
  'create or replace function public.publish_bible_chapter_draft',
  'create or replace function public.restore_bible_chapter_revision',
  "v_role not in ('editor', 'admin', 'super_admin')",
  "rights_status not in ('owned', 'licensed', 'public_domain', 'permission_granted')",
  'alter table public.bible_chapter_drafts enable row level security',
  'revoke all on public.bible_chapter_drafts',
]) assert.ok(migration.includes(expected), `migration missing: ${expected}`)
assert.ok(!migration.includes('disable row level security'))

console.log('Bible CMS parser, rights gate, role gate, revision RPC, and draft RLS checks passed.')
