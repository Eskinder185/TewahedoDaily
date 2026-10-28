/**
 * Converts the completed lyrics-classification CSV into UUID-keyed,
 * relationship-only reconciliation artifacts. It never connects to Supabase.
 *
 * Run: npx tsx scripts/prepare-mezmur-classification-integration.ts
 */
import fs from 'node:fs'
import path from 'node:path'
import { CATEGORY_ENTRIES, OCCASION_ENTRIES } from '../src/lib/mezmur/taxonomyAliases'

type Row = Record<string, string>

const root = process.cwd()
const reportDir = path.join(root, 'reports', 'mezmur-alias-classification')
const classificationPath = path.join(reportDir, 'mezmur_alias_classification.csv')
const identityPath = path.join(root, 'reports', 'mezmur-classification', 'SOURCE_IDENTITY_EXPORT.csv')

function parseCsv(input: string): Row[] {
  const rows: string[][] = []
  let row: string[] = []
  let cell = ''
  let quoted = false
  const text = input.replace(/^\uFEFF/, '')
  for (let i = 0; i < text.length; i += 1) {
    const char = text[i]
    if (quoted) {
      if (char === '"' && text[i + 1] === '"') { cell += '"'; i += 1 }
      else if (char === '"') quoted = false
      else cell += char
      continue
    }
    if (char === '"') { quoted = true; continue }
    if (char === ',') { row.push(cell); cell = ''; continue }
    if (char === '\n' || char === '\r') {
      if (char === '\r' && text[i + 1] === '\n') i += 1
      row.push(cell); rows.push(row); row = []; cell = ''
      continue
    }
    cell += char
  }
  if (cell || row.length) { row.push(cell); rows.push(row) }
  const nonempty = rows.filter((cells) => cells.some((value) => value !== ''))
  const [header = [], ...body] = nonempty
  return body.map((cells) => Object.fromEntries(header.map((name, index) => [name, cells[index] ?? ''])))
}

function csvCell(value: unknown): string {
  const text = String(value ?? '')
  return /[",\r\n]/.test(text) ? `"${text.replaceAll('"', '""')}"` : text
}

function writeCsv(name: string, columns: string[], rows: Row[]): void {
  const content = [columns.join(','), ...rows.map((row) => columns.map((column) => csvCell(row[column])).join(','))].join('\n')
  fs.writeFileSync(path.join(reportDir, name), `${content}\n`, 'utf8')
}

function splitList(value: string): string[] {
  return [...new Set(value.split(';').map((item) => item.trim()).filter(Boolean))]
}

function validUuid(value: string): boolean {
  return /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i.test(value)
}

function normalizedTimestamp(value: string): number | null {
  const millis = Date.parse(value)
  return Number.isFinite(millis) ? millis : null
}

function sqlLiteral(value: string): string {
  return `'${value.replaceAll("'", "''")}'`
}

const classifications = parseCsv(fs.readFileSync(classificationPath, 'utf8'))
const identities = parseCsv(fs.readFileSync(identityPath, 'utf8'))
if (classifications.length !== 2092) throw new Error(`Expected 2,092 classifications; found ${classifications.length}`)

const identityByImportId = new Map<string, Row[]>()
for (const row of identities) {
  const id = row.import_id.trim().toLowerCase()
  if (!id) continue
  identityByImportId.set(id, [...(identityByImportId.get(id) || []), row])
}

const classificationIdCounts = new Map<string, number>()
for (const row of classifications) {
  const id = row.import_id.trim().toLowerCase()
  classificationIdCounts.set(id, (classificationIdCounts.get(id) || 0) + 1)
}

const categoryByLabel = new Map(CATEGORY_ENTRIES.map((entry) => [entry.canonical, entry]))
const occasionByLabel = new Map(OCCASION_ENTRIES.map((entry) => [entry.canonical, entry]))

const reconciliation: Row[] = []
const categoryChanges: Row[] = []
const occasionChanges: Row[] = []
const manualReview: Row[] = []
type Eligible = { row: Row; identity: Row; categorySlugs: string[]; occasionSlugs: string[] }
const eligible: Eligible[] = []

for (const row of classifications) {
  const importId = row.import_id.trim().toLowerCase()
  const matches = identityByImportId.get(importId) || []
  const proposedCategories = [...new Set([row.category.trim(), ...splitList(row.additional_categories)])]
    .filter(Boolean)
  const proposedOccasions = [...new Set([row.primary_occasion.trim(), ...splitList(row.additional_occasions)])]
    .filter(Boolean)
  const categoryEntries = proposedCategories.map((label) => categoryByLabel.get(label))
  const occasionEntries = proposedOccasions.map((label) => occasionByLabel.get(label))
  const invalidTaxonomy = [
    ...proposedCategories.filter((_, index) => !categoryEntries[index]),
    ...proposedOccasions.filter((_, index) => !occasionEntries[index]),
  ]
  const identity = matches[0]
  let matchStatus = 'exact_import_id_match'
  const conflicts: string[] = []
  if (!validUuid(importId)) { matchStatus = 'missing_or_invalid_import_id'; conflicts.push(matchStatus) }
  else if ((classificationIdCounts.get(importId) || 0) > 1) { matchStatus = 'duplicate_import_id_in_classification'; conflicts.push(matchStatus) }
  else if (matches.length === 0) { matchStatus = 'missing_from_identity_export'; conflicts.push(matchStatus) }
  else if (matches.length > 1) { matchStatus = 'ambiguous_import_id_in_identity_export'; conflicts.push(matchStatus) }
  else {
    if (identity.slug.trim() !== row.slug.trim()) conflicts.push('slug_changed_since_classification')
    const expectedTime = normalizedTimestamp(row.updated_at)
    const currentTime = normalizedTimestamp(identity.updated_at)
    if (expectedTime !== null && currentTime !== null && expectedTime !== currentTime) conflicts.push('updated_at_changed_since_classification')
    if (identity.deleted_at?.trim()) conflicts.push('record_is_soft_deleted')
  }
  if (invalidTaxonomy.length) conflicts.push(`invalid_taxonomy:${invalidTaxonomy.join('|')}`)

  const unclassified = proposedCategories.length === 0
  const lowConfidence = row.classification_confidence.trim().toUpperCase() === 'LOW'
  const classifierReview = row.review_required.trim().toLowerCase() === 'true'
  if (unclassified) conflicts.push('unclassified')
  if (lowConfidence) conflicts.push('low_confidence_not_auto_applied')
  if (classifierReview && !lowConfidence && !unclassified) conflicts.push('classifier_requires_expert_review')

  const ready = matchStatus === 'exact_import_id_match' && conflicts.length === 0
  const categorySlugs = categoryEntries.filter(Boolean).map((entry) => entry!.slug)
  const occasionSlugs = occasionEntries.filter(Boolean).map((entry) => entry!.slug)

  reconciliation.push({
    import_id: importId,
    mezmur_id: identity?.mezmur_id || row.mezmur_id,
    slug: row.slug,
    title: row.title,
    source_status: identity?.status || row.status,
    source_updated_at: identity?.updated_at || '',
    classification_updated_at: row.updated_at,
    match_status: matchStatus,
    current_categories: 'DATABASE_RELATIONSHIP_EXPORT_REQUIRED',
    proposed_categories: categorySlugs.join('; '),
    current_occasions: 'DATABASE_RELATIONSHIP_EXPORT_REQUIRED',
    proposed_occasions: occasionSlugs.join('; '),
    confidence: row.classification_confidence,
    integration_status: ready ? 'ready_for_add_only_reconciliation' : 'manual_review',
    conflicts: conflicts.join('; '),
  })

  if (ready && identity) {
    eligible.push({ row, identity, categorySlugs, occasionSlugs })
    categorySlugs.forEach((slug, index) => categoryChanges.push({
      import_id: importId,
      mezmur_slug: row.slug,
      category_slug: slug,
      classification_rank: String(index + 1),
      is_primary: index === 0 ? 'true' : 'false',
      current_relationship: 'DATABASE_CHECK_REQUIRED',
      proposed_action: 'add_if_missing',
      removal_proposed: 'false',
      confidence: row.classification_confidence,
    }))
    occasionSlugs.forEach((slug, index) => occasionChanges.push({
      import_id: importId,
      mezmur_slug: row.slug,
      occasion_slug: slug,
      classification_rank: String(index + 1),
      is_primary: index === 0 ? 'true' : 'false',
      current_relationship: 'DATABASE_CHECK_REQUIRED',
      proposed_action: 'add_if_missing',
      removal_proposed: 'false',
      confidence: row.classification_confidence,
    }))
  } else {
    manualReview.push({
      import_id: importId,
      slug: row.slug,
      title: row.title,
      title_amharic: row.title_amharic,
      confidence: row.classification_confidence,
      review_required: row.review_required,
      review_reasons: row.review_reasons,
      proposed_categories: categorySlugs.join('; '),
      proposed_occasions: occasionSlugs.join('; '),
      integration_blockers: conflicts.join('; '),
      classification_reason: row.classification_reason,
    })
  }
}

writeCsv('classification_database_reconciliation.csv', [
  'import_id', 'mezmur_id', 'slug', 'title', 'source_status', 'source_updated_at',
  'classification_updated_at', 'match_status', 'current_categories', 'proposed_categories',
  'current_occasions', 'proposed_occasions', 'confidence', 'integration_status', 'conflicts',
], reconciliation)
writeCsv('category_relationship_changes.csv', [
  'import_id', 'mezmur_slug', 'category_slug', 'classification_rank', 'is_primary',
  'current_relationship', 'proposed_action', 'removal_proposed', 'confidence',
], categoryChanges)
writeCsv('occasion_relationship_changes.csv', [
  'import_id', 'mezmur_slug', 'occasion_slug', 'classification_rank', 'is_primary',
  'current_relationship', 'proposed_action', 'removal_proposed', 'confidence',
], occasionChanges)
writeCsv('classification_manual_review.csv', [
  'import_id', 'slug', 'title', 'title_amharic', 'confidence', 'review_required',
  'review_reasons', 'proposed_categories', 'proposed_occasions', 'integration_blockers',
  'classification_reason',
], manualReview)

const stageRows: string[] = []
for (const item of eligible) {
  const expectedUpdatedAt = item.identity.updated_at.trim()
  item.categorySlugs.forEach((slug, index) => stageRows.push(
    `(${sqlLiteral(item.row.import_id)},${sqlLiteral(item.row.slug)},${sqlLiteral(expectedUpdatedAt)},'category',${sqlLiteral(slug)},${index + 1},${sqlLiteral(item.row.classification_confidence)})`,
  ))
  item.occasionSlugs.forEach((slug, index) => stageRows.push(
    `(${sqlLiteral(item.row.import_id)},${sqlLiteral(item.row.slug)},${sqlLiteral(expectedUpdatedAt)},'occasion',${sqlLiteral(slug)},${index + 1},${sqlLiteral(item.row.classification_confidence)})`,
  ))
}

const sql = `-- Generated from the completed 2,092-row classification output.
-- ADD-ONLY: existing manual/category/occasion relationships are never deleted.
-- DEFAULT IS ROLLBACK. Do not change to COMMIT without explicit owner approval.
begin;
set local lock_timeout = '5s';
set local statement_timeout = '120s';

create temporary table classification_stage(
  import_id uuid not null,
  expected_slug text not null,
  expected_updated_at timestamptz not null,
  relationship_kind text not null check (relationship_kind in ('category','occasion')),
  taxonomy_slug text not null,
  classification_rank integer not null check (classification_rank > 0),
  confidence text not null
) on commit drop;

insert into classification_stage values
${stageRows.join(',\n')};

do $$
declare
  v_category_view_columns text[];
  v_occasion_view_columns text[];
begin
  if to_regclass('public.mezmur_category_links_import') is null
     or to_regclass('public.mezmur_occasion_links_import') is null then
    raise exception 'Canonical Mezmur relationship tables are missing' using errcode='42P01';
  end if;
  if to_regclass('public.mezmur_category_links_public') is null
     or to_regclass('public.mezmur_occasion_links_public') is null then
    raise exception 'Public Mezmur relationship views are missing' using errcode='42P01';
  end if;
  select array_agg(a.attname::text order by a.attnum) into v_category_view_columns
  from pg_attribute a
  where a.attrelid='public.mezmur_category_links_public'::regclass
    and a.attnum>0 and not a.attisdropped;
  select array_agg(a.attname::text order by a.attnum) into v_occasion_view_columns
  from pg_attribute a
  where a.attrelid='public.mezmur_occasion_links_public'::regclass
    and a.attnum>0 and not a.attisdropped;
  if v_category_view_columns is distinct from array['mezmur_import_id','mezmur_id','mezmur_slug','category_slug']::text[]
     or v_occasion_view_columns is distinct from array['mezmur_import_id','mezmur_id','mezmur_slug','occasion_slug']::text[] then
    raise exception 'Refusing to replace unexpected public relationship view contracts' using errcode='55000';
  end if;
  if exists (
    select 1 from (select import_id from classification_stage group by import_id) s
    left join public.mezmur_data_import m on m.import_id=s.import_id
    where m.import_id is null or m.deleted_at is not null
  ) then
    raise exception 'A staged import_id is missing or soft-deleted; no classifications were retained' using errcode='P0002';
  end if;
  if exists (
    select 1 from classification_stage s
    join public.mezmur_data_import m on m.import_id=s.import_id
    where m.slug is distinct from s.expected_slug
       or m.updated_at is distinct from s.expected_updated_at
  ) then
    raise exception 'Slug or updated_at precondition failed; refresh the read-only reconciliation first' using errcode='40001';
  end if;
  if exists (
    select 1 from classification_stage s
    where s.relationship_kind='category'
      and not exists(select 1 from public.categories c where c.slug=s.taxonomy_slug and not coalesce(c.is_archived,false))
  ) then
    raise exception 'A proposed category is not an active canonical taxonomy value' using errcode='23503';
  end if;
  if exists (
    select 1 from classification_stage s
    where s.relationship_kind='occasion'
      and not exists(select 1 from public.mezmur_occasions o where o.slug=s.taxonomy_slug and o.status<>'archived')
  ) then
    raise exception 'A proposed occasion is not an active canonical taxonomy value' using errcode='23503';
  end if;

  -- Keep identity and timestamp preconditions stable for the rest of the
  -- transaction. This does not lock or rewrite unrelated Mezmurs.
  perform 1
  from public.mezmur_data_import m
  join (select distinct import_id from classification_stage) s using (import_id)
  for update of m;
end $$;

-- Keep the existing four-column contracts while making the public projection
-- work for legacy rows whose mezmur_id is null. The UUID remains the link
-- identity. A slug fallback is accepted only when exactly one public row has
-- that normalized slug, so duplicate slugs cannot leak another record's links.
create or replace view public.mezmur_category_links_public
with (security_barrier=true) as
select distinct l.mezmur_import_id,m.mezmur_id,m.slug as mezmur_slug,l.category_slug
from public.mezmur_category_links_import l
join public.mezmur_data_import m on m.import_id=l.mezmur_import_id
where l.mezmur_import_id is not null
  and m.deleted_at is null
  and lower(trim(coalesce(m.status,'')))='published'
  and exists (
    select 1 from public.mezmur_public p
    where (m.mezmur_id is not null and p.mezmur_id=m.mezmur_id)
       or (m.mezmur_id is null
           and lower(trim(p.slug))=lower(trim(m.slug))
           and (select count(*) from public.mezmur_public px
                where lower(trim(px.slug))=lower(trim(m.slug)))=1)
  );

create or replace view public.mezmur_occasion_links_public
with (security_barrier=true) as
select distinct l.mezmur_import_id,m.mezmur_id,m.slug as mezmur_slug,l.occasion_slug
from public.mezmur_occasion_links_import l
join public.mezmur_data_import m on m.import_id=l.mezmur_import_id
where l.mezmur_import_id is not null
  and m.deleted_at is null
  and lower(trim(coalesce(m.status,'')))='published'
  and exists (
    select 1 from public.mezmur_public p
    where (m.mezmur_id is not null and p.mezmur_id=m.mezmur_id)
       or (m.mezmur_id is null
           and lower(trim(p.slug))=lower(trim(m.slug))
           and (select count(*) from public.mezmur_public px
                where lower(trim(px.slug))=lower(trim(m.slug)))=1)
  );

-- Authoritative read-only reconciliation against current relationships.
select s.import_id,s.expected_slug,s.relationship_kind,s.taxonomy_slug,s.classification_rank,
       case when s.relationship_kind='category' then exists(
         select 1 from public.mezmur_category_links_import l
         where l.mezmur_import_id=s.import_id and l.category_slug=s.taxonomy_slug
       ) else exists(
         select 1 from public.mezmur_occasion_links_import l
         where l.mezmur_import_id=s.import_id and l.occasion_slug=s.taxonomy_slug
       ) end as already_present
from classification_stage s
order by s.import_id,s.relationship_kind,s.classification_rank;

-- Apply inside this rollback-default transaction. Primary ordering is recorded
-- using the existing source_category/source_occasion metadata; no new content
-- columns are introduced.
insert into public.mezmur_category_links_import
  (mezmur_import_id,mezmur_slug,category_slug,source_category,confidence)
select s.import_id,s.expected_slug,s.taxonomy_slug,
       case when s.classification_rank=1 then 'lyrics-classifier-primary' else 'lyrics-classifier-secondary' end,
       lower(s.confidence)
from classification_stage s
where s.relationship_kind='category'
on conflict (mezmur_import_id,category_slug) do nothing;

insert into public.mezmur_occasion_links_import
  (mezmur_import_id,mezmur_slug,occasion_slug,source_occasion)
select s.import_id,s.expected_slug,s.taxonomy_slug,
       case when s.classification_rank=1 then 'lyrics-classifier-primary' else 'lyrics-classifier-secondary' end
from classification_stage s
where s.relationship_kind='occasion'
on conflict (mezmur_import_id,occasion_slug) do nothing;

do $$
begin
  if exists (
    select 1 from classification_stage s
    where (s.relationship_kind='category' and not exists(
      select 1 from public.mezmur_category_links_import l
      where l.mezmur_import_id=s.import_id and l.category_slug=s.taxonomy_slug
    )) or (s.relationship_kind='occasion' and not exists(
      select 1 from public.mezmur_occasion_links_import l
      where l.mezmur_import_id=s.import_id and l.occasion_slug=s.taxonomy_slug
    ))
  ) then
    raise exception 'Relationship read-after-write verification failed; transaction will roll back' using errcode='P0001';
  end if;
end $$;

select 'dry_run_complete' result,
       count(distinct import_id) staged_mezmurs,
       count(*) filter(where relationship_kind='category') category_relationships,
       count(*) filter(where relationship_kind='occasion') occasion_relationships
from classification_stage;

rollback;
-- After reviewing the reconciliation output and receiving explicit approval,
-- execute a separately reviewed copy with only the final ROLLBACK changed to COMMIT.
`
fs.writeFileSync(path.join(reportDir, 'safe_classification_import.sql'), sql, 'utf8')

const counts = {
  rows: classifications.length,
  identityMatches: reconciliation.filter((row) => row.match_status === 'exact_import_id_match').length,
  ready: eligible.length,
  manual: manualReview.length,
  low: classifications.filter((row) => row.classification_confidence.toUpperCase() === 'LOW').length,
  unclassified: classifications.filter((row) => !row.category.trim()).length,
  categoryRelationships: categoryChanges.length,
  occasionRelationships: occasionChanges.length,
  missingIdentity: reconciliation.filter((row) => row.match_status === 'missing_from_identity_export').length,
  slugChanged: reconciliation.filter((row) => row.conflicts.includes('slug_changed_since_classification')).length,
  timestampChanged: reconciliation.filter((row) => row.conflicts.includes('updated_at_changed_since_classification')).length,
  expertReview: reconciliation.filter((row) => row.conflicts.includes('classifier_requires_expert_review')).length,
  readyMissingMezmurId: reconciliation.filter((row) => row.integration_status === 'ready_for_add_only_reconciliation' && !row.mezmur_id).length,
}

const report = `# Mezmur classification integration report

Generated from the existing completed classification results; the classifier was not rerun.

## Outcome

- Classification rows verified: **${counts.rows.toLocaleString()}**
- Exact immutable-identity matches in the latest authorized source export: **${counts.identityMatches.toLocaleString()}**
- Rows eligible for add-only relationship reconciliation: **${counts.ready.toLocaleString()}**
- Rows held for manual review: **${counts.manual.toLocaleString()}**
- Low-confidence rows excluded from automatic integration: **${counts.low.toLocaleString()}**
- Unclassified rows left unchanged: **${counts.unclassified.toLocaleString()}**
- Proposed category relationships: **${counts.categoryRelationships.toLocaleString()}**
- Proposed occasion relationships: **${counts.occasionRelationships.toLocaleString()}**
- Proposed removals: **0**

## Reconciliation blockers

- UUIDs absent from the available authorized identity export: **${counts.missingIdentity.toLocaleString()}**
- Slugs changed after that export/classification snapshot diverged: **${counts.slugChanged.toLocaleString()}**
- Timestamps changed after that export/classification snapshot diverged: **${counts.timestampChanged.toLocaleString()}**
- Non-low-confidence rows explicitly requiring expert review: **${counts.expertReview.toLocaleString()}**
- Safely stageable rows lacking legacy 'mezmur_id': **${counts.readyMissingMezmurId.toLocaleString()}**

These blocker counts overlap. They explain why only the fully current, uniquely matched subset is staged; they are not theological rejections and do not modify any records.

## Identity and schema

Every eligible proposal is keyed by 'public.mezmur_data_import.import_id' and has exact slug and 'updated_at' preconditions from 'reports/mezmur-classification/SOURCE_IDENTITY_EXPORT.csv'. Slugs are descriptive preconditions only and are never mutation keys.

The integration targets the existing private relationship tables:

- 'public.mezmur_category_links_import(mezmur_import_id, mezmur_slug, category_slug, source_category, confidence)'
- 'public.mezmur_occasion_links_import(mezmur_import_id, mezmur_slug, occasion_slug, source_occasion)'

The generated rollback-only SQL also preserves the existing four-column public relationship-view contracts while making their identity resolution UUID-safe. Existing views join through legacy 'mezmur_id', but ${counts.readyMissingMezmurId.toLocaleString()} safely stageable records lack that value. The corrected view definitions use 'import_id' for the relationship join and allow a public slug fallback only when that normalized public slug is unique. This lets committed additions flow to Hymns browsing for published, nondeleted Mezmurs without changing Mezmur records.

## Current-assignment limitation

No authorized export of the current private category/occasion relationship rows is present in the workspace. The CSV reports therefore mark current relationships as 'DATABASE_CHECK_REQUIRED' instead of guessing. The generated SQL performs the authoritative current-state comparison before any insert and uses 'ON CONFLICT DO NOTHING'; existing assignments are preserved. No removals are proposed.

## Primary ordering

The primary proposal is emitted first and tagged using existing relationship metadata as 'lyrics-classifier-primary'; later proposals use 'lyrics-classifier-secondary'. No classification fields are added to 'mezmur_data_import'.

## Safety

- The SQL begins a transaction and ends with **ROLLBACK**.
- Missing, deleted, stale, or slug-changed records abort the entire transaction.
- Invalid or archived taxonomy values abort the entire transaction.
- Read-after-write verification must succeed before the rollback point.
- Lyrics, titles, URLs, publication state, RLS policies, and Mezmur rows are never updated.
- Low-confidence, unclassified, and other review-required proposals are excluded.

Production activation requires a fresh authorized dry run, review of its current-state output, and explicit approval before producing a COMMIT copy.
`
fs.writeFileSync(path.join(reportDir, 'CLASSIFICATION_INTEGRATION_REPORT.md'), report, 'utf8')

console.log(JSON.stringify(counts, null, 2))
