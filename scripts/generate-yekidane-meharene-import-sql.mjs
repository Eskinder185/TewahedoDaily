/**
 * Generate SQL to insert YeKidane / Meharene prayer bodies into public.prayers
 * from local backup content (does not invent text).
 *
 * Run: node scripts/generate-yekidane-meharene-import-sql.mjs
 * Then apply the generated migration via Supabase SQL editor / CLI.
 */
import { writeFileSync } from 'node:fs'
import { resolve } from 'node:path'
import { createRequire } from 'node:module'
import { pathToFileURL } from 'node:url'

// Load TS content via dynamic import after a tiny transpile-free JSON extraction:
// Prefer reading the built content by evaluating with tsx if available; else use a
// hand-maintained mapping file. Here we spawn nothing — parse from source strings
// is fragile. Instead import via node --experimental-strip-types if supported,
// falling back to reading .ts with a simple regex extract of section objects.

const require = createRequire(import.meta.url)

function sqlString(value) {
  if (value == null || value === '') return 'null'
  return `'${String(value).replace(/'/g, "''")}'`
}

const YEKIDANE_MAP = [
  ['opening-acclamations', 'opening-thrice-holy'],
  ['morning-offering-of-praise', 'morning-offering'],
  ['prayer-to-the-god-of-light', 'god-of-light'],
  ['praise-to-christ-the-deliverer', 'christ-the-deliverer'],
  ['grace-and-lifting-up-the-heart', 'grace-and-lifting-hearts'],
  ['prayer-to-the-father-giver-of-light', 'father-giver-of-light'],
  ['prayer-to-jesus-the-healer-and-light', 'jesus-healer'],
  ['holy-faith-and-reconciliation', 'holy-faith-and-reconciliation'],
  ['prayer-to-the-immortal-father', 'immortal-father'],
  ['unceasing-song-with-the-archangels', 'archangels-song'],
  ['life-for-the-humble-and-refuge-for-all', 'life-for-the-humble'],
]

async function loadYekidane() {
  // Prefer compiled JS path; else dynamic import of TS via strip-types.
  try {
    const mod = await import(
      pathToFileURL(resolve('src/lib/prayers/yekidaneTselotContent.ts')).href
    )
    return mod.YEKIDANE_TSELOT_CONTENT
  } catch {
    // Fallback: use tsx register if present
    try {
      require('tsx/cjs')
      const mod = require('../src/lib/prayers/yekidaneTselotContent.ts')
      return mod.YEKIDANE_TSELOT_CONTENT
    } catch (cause) {
      throw new Error(
        `Unable to load yekidaneTselotContent.ts (${cause}). Run with Node 22+ or install tsx.`,
      )
    }
  }
}

async function loadMeharene() {
  try {
    const mod = await import(
      pathToFileURL(resolve('src/lib/prayers/mehareneAbContent.ts')).href
    )
    return mod.MEHARENE_AB_CONTENT
  } catch {
    require('tsx/cjs')
    return require('../src/lib/prayers/mehareneAbContent.ts').MEHARENE_AB_CONTENT
  }
}

const yek = await loadYekidane()
const meh = await loadMeharene()
const byLocalId = Object.fromEntries(yek.sections.map((s) => [s.id, s]))

const lines = []
lines.push('-- Generated from local YeKidane / Meharene backup content.')
lines.push('-- Idempotent inserts: skip when slug already exists for the collection.')
lines.push('begin;')
lines.push('')
lines.push('-- YeKidane Tselot prayers (one per existing section)')
for (const [sectionSlug, localId] of YEKIDANE_MAP) {
  const section = byLocalId[localId]
  if (!section) {
    console.warn('Missing local section', localId)
    continue
  }
  const am = section.text?.amharic || ''
  const ge = section.text?.geez || ''
  const en = section.text?.english || ''
  lines.push(`
insert into public.prayers (
  slug, title, title_amharic, title_geez, title_english,
  text_amharic, text_geez, text_english,
  collection_id, section_id, collection_slug, section_slug,
  sort_order, status, published_at
)
select
  ${sqlString(sectionSlug)},
  ${sqlString(section.title)},
  null,
  null,
  ${sqlString(section.title)},
  ${sqlString(am)},
  ${sqlString(ge)},
  ${sqlString(en)},
  c.id,
  s.id,
  c.slug,
  s.slug,
  s.sort_order,
  'published',
  now()
from public.prayer_collections c
join public.prayer_sections s
  on s.collection_id = c.id and s.slug = ${sqlString(sectionSlug)}
where c.slug = 'yekidane-tselot'
  and not exists (
    select 1 from public.prayers p
    where p.collection_id = c.id and p.slug = ${sqlString(sectionSlug)}
  );`)
}

lines.push('')
lines.push('-- Meharene Ab full prayer')
lines.push(`
insert into public.prayers (
  slug, title, title_amharic, title_geez, title_english,
  text_amharic, text_geez, text_english, transliteration,
  collection_id, section_id, collection_slug, section_slug,
  sort_order, status, published_at
)
select
  'full-prayer',
  ${sqlString(meh.title)},
  ${sqlString(meh.title)},
  null,
  ${sqlString(meh.transliterationTitle)},
  ${sqlString(meh.text?.amharic || '')},
  ${sqlString(meh.text?.geez || '')},
  ${sqlString(meh.text?.english || '')},
  ${sqlString(meh.transliteration?.english || '')},
  c.id,
  s.id,
  c.slug,
  s.slug,
  coalesce(s.sort_order, 1),
  'published',
  now()
from public.prayer_collections c
left join public.prayer_sections s
  on s.collection_id = c.id and s.slug = 'meharene-ab-full-prayer'
where c.slug = 'meharene-ab'
  and not exists (
    select 1 from public.prayers p
    where p.collection_id = c.id and p.slug = 'full-prayer'
  );`)

lines.push('')
lines.push('commit;')

const out = resolve('supabase/migrations/20260930221000_pray_import_yekidane_meharene.sql')
writeFileSync(out, lines.join('\n'), 'utf8')
console.log('Wrote', out)
console.log('YeKidane sections mapped:', YEKIDANE_MAP.length)
console.log('Meharene included: yes')
