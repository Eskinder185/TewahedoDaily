import fs from 'node:fs'
import path from 'node:path'

type Row = Record<string, string>

function parseCsv(input: string): Row[] {
  const matrix: string[][] = []
  let row: string[] = []
  let cell = ''
  let quoted = false
  const text = input.replace(/^\uFEFF/, '')
  for (let index = 0; index < text.length; index += 1) {
    const char = text[index]
    if (quoted) {
      if (char === '"' && text[index + 1] === '"') { cell += '"'; index += 1 }
      else if (char === '"') quoted = false
      else cell += char
    } else if (char === '"') quoted = true
    else if (char === ',') { row.push(cell); cell = '' }
    else if (char === '\n' || char === '\r') {
      if (char === '\r' && text[index + 1] === '\n') index += 1
      row.push(cell); matrix.push(row); row = []; cell = ''
    } else cell += char
  }
  if (cell || row.length) { row.push(cell); matrix.push(row) }
  const [headers = [], ...body] = matrix.filter((cells) => cells.some(Boolean))
  return body.map((cells) => Object.fromEntries(headers.map((header, index) => [header, cells[index] || ''])))
}

const readCsv = (file: string) => parseCsv(fs.readFileSync(path.resolve(file), 'utf8'))
const literal = (value: string) => `'${value.replaceAll("'", "''")}'`
const uuid = (value: string) => `${literal(value)}::uuid`
const splitList = (value: string) => value.split(';').map((part) => part.trim()).filter(Boolean)

const languageRows = readCsv('reports/mezmur-data-quality/mezmur_language_verification.csv')
  .filter((row) => row.import_id && row.verdict === 'mismatch_confirmed')

const classifications = readCsv('reports/mezmur-alias-classification/mezmur_alias_classification.csv')
const fastingOccasions = new Set(['Abiy Tsom', 'Tsome Nineveh', 'Tsome Nebiyat', 'Tsome Hawariat', 'Holy Week'])
const fastingOccasionSlug = new Map([
  ['Abiy Tsom', 'abiy-tsom'],
  ['Tsome Nineveh', 'tsome-nineveh'],
  ['Tsome Nebiyat', 'tsome-nebiyat'],
  ['Tsome Hawariat', 'tsome-hawariat'],
  ['Holy Week', 'holy-week'],
])
const suitabilityRows = classifications.filter((row) => {
  if (!row.import_id || row.classification_confidence !== 'HIGH' || row.review_required === 'true') return false
  const categories = [row.category, ...splitList(row.additional_categories)]
  const occasions = [row.primary_occasion, ...splitList(row.additional_occasions)]
  return categories.includes('Repentance') || occasions.some((value) => fastingOccasions.has(value))
})

const languageValues = languageRows.map((row) =>
  `    (${uuid(row.import_id)}, ${literal(row.labeled_language)}, ${literal(row.detected_language)})`,
).join(',\n')

const suitabilityValues = suitabilityRows.map((row) => {
  const occasions = [row.primary_occasion, ...splitList(row.additional_occasions)]
    .filter((value) => fastingOccasions.has(value))
    .map((value) => fastingOccasionSlug.get(value)!)
  const themes = ['repentance']
  if (/mercy|ምሕረት|መሐረነ|ይቅር/i.test(`${row.classification_reason} ${row.supporting_lyric_excerpt}`)) themes.push('mercy')
  if (/prayer|ጸሎት|ለምኝ/i.test(`${row.classification_reason} ${row.supporting_lyric_excerpt}`)) themes.push('prayer')
  const textArray = (values: string[]) => `array[${values.map(literal).join(', ')}]::text[]`
  return `    (${uuid(row.import_id)}, ${textArray(themes)}, ${textArray(occasions)}, 'high', ${literal(row.supporting_lyric_excerpt)}, ${literal(row.classification_reason)}, false, 'lyrics-alias-classifier-2026-10-28')`
}).join(',\n')

const sql = `-- Generated from reviewed local artifacts; safe to re-run.
-- This migration does not edit lyrics, titles, singers, statuses, or taxonomy.
-- Language updates are restricted to rows already marked mismatch_confirmed.
-- Fasting suitability is separate from canonical fasting-season occasions.

begin;

create table if not exists public.mezmur_fasting_suitability (
  mezmur_import_id uuid primary key,
  themes text[] not null default '{}',
  specific_occasion_slugs text[] not null default '{}',
  confidence text not null check (confidence in ('high', 'medium', 'low')),
  supporting_lyric_excerpt text not null default '',
  classification_explanation text not null default '',
  review_required boolean not null default true,
  evidence_source text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.mezmur_fasting_suitability enable row level security;
revoke all on table public.mezmur_fasting_suitability from public, anon;
grant select, insert, update, delete on table public.mezmur_fasting_suitability to authenticated;
grant all on table public.mezmur_fasting_suitability to service_role;

drop policy if exists mezmur_fasting_suitability_staff_all on public.mezmur_fasting_suitability;
create policy mezmur_fasting_suitability_staff_all
on public.mezmur_fasting_suitability for all to authenticated
using (public.is_staff()) with check (public.is_staff());

insert into public.mezmur_fasting_suitability (
  mezmur_import_id, themes, specific_occasion_slugs, confidence,
  supporting_lyric_excerpt, classification_explanation, review_required, evidence_source
)
values
${suitabilityValues}
on conflict (mezmur_import_id) do update set
  themes = excluded.themes,
  specific_occasion_slugs = excluded.specific_occasion_slugs,
  confidence = excluded.confidence,
  supporting_lyric_excerpt = excluded.supporting_lyric_excerpt,
  classification_explanation = excluded.classification_explanation,
  review_required = excluded.review_required,
  evidence_source = excluded.evidence_source,
  updated_at = now();

create or replace view public.mezmur_fasting_suitability_public
with (security_barrier = true)
as
select
  s.mezmur_import_id,
  m.slug as mezmur_slug,
  m.primary_language,
  s.themes,
  s.specific_occasion_slugs,
  s.confidence
from public.mezmur_fasting_suitability s
join public.mezmur_data_import m on m.import_id = s.mezmur_import_id
where lower(trim(coalesce(m.status, ''))) = 'published'
  and m.deleted_at is null
  and nullif(trim(coalesce(m.slug, '')), '') is not null
  and s.review_required = false
  and s.confidence = 'high';

revoke all on table public.mezmur_fasting_suitability_public from public;
grant select on table public.mezmur_fasting_suitability_public to anon, authenticated, service_role;

with corrections(import_id, expected_language, corrected_language) as (
  values
${languageValues}
)
update public.mezmur_data_import m
set primary_language = c.corrected_language,
    updated_at = now()
from corrections c
where m.import_id = c.import_id
  and lower(trim(coalesce(m.primary_language, ''))) = lower(trim(c.expected_language))
  and lower(trim(c.expected_language)) <> lower(trim(c.corrected_language))
  and m.deleted_at is null;

notify pgrst, 'reload schema';
commit;
`

const out = path.resolve('supabase/migrations/20261028140000_mezmur_language_fasting_browse.sql')
fs.writeFileSync(out, sql, 'utf8')

const summary = {
  confirmedLanguageCorrections: languageRows.length,
  tigrinyaCorrections: languageRows.filter((row) => row.detected_language === 'tigrinya').length,
  oromoCorrections: languageRows.filter((row) => row.detected_language === 'oromo').length,
  fastingSuitable: suitabilityRows.length,
  fastingSuitablePublished: suitabilityRows.filter((row) => row.status === 'published').length,
  specificFastingOccasionSupported: suitabilityRows.filter((row) =>
    [row.primary_occasion, ...splitList(row.additional_occasions)].some((value) => fastingOccasions.has(value)),
  ).length,
}
fs.writeFileSync(
  path.resolve('reports/mezmur-data-quality/mezmur_language_fasting_migration_summary.json'),
  `${JSON.stringify(summary, null, 2)}\n`,
  'utf8',
)
console.log(JSON.stringify(summary))
