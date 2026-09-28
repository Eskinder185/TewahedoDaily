import assert from 'node:assert/strict'
import { writeFile } from 'node:fs/promises'
import { buildPlan } from './lib/mezmur-import-plan.mjs'
const plan = await buildPlan(new URL('../src/data/chants/', import.meta.url))
assert.ok(plan.items.length > 200)
assert.equal(new Set(plan.items.map((row) => row.slug)).size, plan.items.length)
assert.equal(
  new Set(plan.items.map((row) => row.legacy_key)).size,
  plan.items.length,
)
const videos = plan.items.map((row) => row.youtube_url).filter(Boolean)
assert.equal(new Set(videos).size, videos.length)
assert.ok(
  plan.items.every(
    (row) =>
      row.title &&
      row.category.slug &&
      (row.lyrics_amharic || row.lyrics_english || row.youtube_url),
  ),
)
assert.ok(plan.items.every((row) => !row.category.name_amharic?.includes('?')))
assert.ok(
  plan.items.some((row) => row.language_codes.includes('am')) &&
    plan.items.some((row) => row.language_codes.includes('en')),
)
assert.ok(
  plan.items.every((row) => row.singer_name === null),
  'current sources have no known singers',
)
assert.equal(
  plan.items.find((row) => row.legacy_key === 'mezmur:dink-adirgolignyal')
    ?.slug,
  'dink-adirgolignal',
)
assert.ok(plan.issues.some((issue) => issue.code === 'duplicate_source_id'))
assert.ok(plan.issues.some((issue) => issue.code === 'duplicate_video'))
const arg = process.argv.indexOf('--emit-sql')
if (arg >= 0) {
  const quote = (value) =>
    "'" + JSON.stringify(value).replaceAll("'", "''") + "'::jsonb"
  const statements = [
    '\\set ON_ERROR_STOP on',
    'begin;',
    "create function pg_temp.assert_true(value boolean,label text) returns void language plpgsql as $$begin if value is distinct from true then raise exception 'FAIL: %',label; end if;end$$;",
    'set local role service_role;',
  ]
  for (const item of plan.items)
    statements.push(
      `select pg_temp.assert_true(public.import_legacy_mezmur(${quote(item)},true)->>'status'='inserted','insert ${item.slug}');`,
    )
  for (const item of plan.items)
    statements.push(
      `select pg_temp.assert_true(public.import_legacy_mezmur(${quote({ ...item, title: 'DO NOT OVERWRITE' })},true)->>'status'='skipped_existing','idempotent ${item.slug}');`,
    )
  statements.push('reset role;')
  for (const item of plan.items)
    statements.push(
      `select pg_temp.assert_true(exists(select 1 from public.mezmur where legacy_key=${"'" + item.legacy_key.replaceAll("'", "''") + "'"} and title=${"'" + item.title.replaceAll("'", "''") + "'"} and status='published'),'content preserved');`,
    )
  statements.push(
    'set local role anon;',
    `select pg_temp.assert_true((public.discover_mezmur()->>'total')::int=${plan.items.length},'all imported publications searchable');`,
    `select pg_temp.assert_true(jsonb_array_length(public.discover_mezmur()->'items')=24,'pagination bounded');`,
    'rollback;',
    '\\echo Full import and idempotency assertions passed.',
  )
  await writeFile(process.argv[arg + 1], statements.join('\n'), 'utf8')
}
console.log(
  `Import plan passed: ${plan.items.length} eligible records; no duplicate keys, slugs, or video IDs.`,
)
