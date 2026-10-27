import fs from 'node:fs'
import path from 'node:path'
import { auditFormatting, recordingKey, text, type QualityMezmur } from '../src/lib/mezmur/qualityAudit.ts'

const reportDir = path.join(process.cwd(), 'reports', 'mezmur-quality-audit')
type Row = QualityMezmur & Record<string, unknown>
type Out = Record<string, unknown>

function csv(value: unknown) {
  const string = String(value ?? '')
  return /[",\r\n]/.test(string) ? `"${string.replaceAll('"', '""')}"` : string
}
function write(name: string, columns: string[], rows: Out[]) {
  fs.writeFileSync(path.join(reportDir, name), [columns.join(','), ...rows.map((row) => columns.map((column) => csv(row[column])).join(','))].join('\n') + '\n')
}
function readCsv(name: string) {
  const input = fs.readFileSync(path.join(reportDir, name), 'utf8')
  const rows: string[][] = []; let row: string[] = []; let value = ''; let quoted = false
  for (let i = 0; i < input.length; i++) {
    const char = input[i]
    if (quoted && char === '"' && input[i + 1] === '"') { value += '"'; i++; continue }
    if (char === '"') { quoted = !quoted; continue }
    if (!quoted && char === ',') { row.push(value); value = ''; continue }
    if (!quoted && (char === '\n' || char === '\r')) {
      if (char === '\r' && input[i + 1] === '\n') i++
      row.push(value); if (row.some(Boolean)) rows.push(row); row = []; value = ''; continue
    }
    value += char
  }
  if (value || row.length) { row.push(value); rows.push(row) }
  const [header = [], ...body] = rows
  return body.map((cells) => Object.fromEntries(header.map((column, index) => [column, cells[index] || ''])))
}
function id(row: Row) { return text(row.mezmur_id) || `public_slug:${text(row.slug)}` }
function normalizedSlug(value: unknown) { return text(value).normalize('NFKC').toLocaleLowerCase('und') }
function title(row: Row) { return text(row.title_amharic) || text(row.title) || text(row.slug) }

const publicRows = JSON.parse(fs.readFileSync(path.join(reportDir, 'PUBLIC_MEZMUR_SNAPSHOT.json'), 'utf8')) as Row[]
const manifest = JSON.parse(fs.readFileSync(path.join(reportDir, 'SNAPSHOT_MANIFEST.json'), 'utf8')) as { retrieved_at: string; sha256: string }
const groups = new Map<string, Row[]>()
for (const row of publicRows) {
  const slug = normalizedSlug(row.slug)
  if (slug) groups.set(slug, [...(groups.get(slug) || []), row])
}
const collisions = [...groups.entries()].filter(([, rows]) => rows.length > 1)

const collisionRows: Out[] = []
const slugProposals: Out[] = []
for (const [slug, rows] of collisions) {
  const publicIds = rows.map((row) => text(row.mezmur_id)).filter(Boolean)
  const uniquePublicIds = new Set(publicIds)
  const identityState = uniquePublicIds.size === rows.length
    ? 'public mezmur_id is present and distinct for every colliding row'
    : 'one or more colliding rows lack a distinct public mezmur_id; immutable import_id is required'
  for (const row of rows) {
    const video = recordingKey(row.youtube_url)
    collisionRows.push({
      import_id: '', mezmur_id: text(row.mezmur_id), public_record_id: id(row), normalized_slug: slug,
      current_slug: text(row.slug), title: title(row), status: text(row.status), youtube_video_id: video,
      group_size: rows.length, identity_state: identityState,
      verification: 'Verified in current public.mezmur_public snapshot; private import_id lookup remains required before any change.',
      evidence_snapshot_sha256: manifest.sha256,
    })
    slugProposals.push({
      import_id: '', current_slug: text(row.slug), proposed_slug: '', public_record_id: id(row), title: title(row),
      group_size: rows.length, action: 'blocked_pending_private_identity_resolution',
      approved_template: `${text(row.slug)}--<import-id-short>`,
      explanation: 'Do not select a canonical record or generate a target slug until an authorized read-only query supplies the immutable import_id and confirms all dependent links.',
      route_preservation: 'Insert the previous slug as a route alias for the selected import_id before changing its slug.',
    })
  }
}

const exact = readCsv('CONFIRMED_DUPLICATES.csv').map((row) => ({
  ...row,
  verification_scope: 'Public snapshot confirms normalized title, lyrics, and YouTube video ID. Private import_id verification remains required before any editorial decision.',
  resolution: 'No merge, deletion, or slug change proposed automatically.',
}))
const possible = readCsv('POSSIBLE_DUPLICATES.csv').map((row) => ({
  ...row,
  review_action: 'Manual editorial review required; preserve separate recordings, translations, and language variants unless source evidence establishes otherwise.',
}))
const duplicateQueue = [
  ...exact.map((row) => ({ ...row, queue_type: 'exact-content-and-recording candidate' })),
  ...possible.map((row) => ({ ...row, queue_type: 'possible duplicate or variant' })),
]

const encodingRows: Out[] = []
for (const row of publicRows) for (const field of ['lyrics_amharic', 'lyrics_geez', 'lyrics_english', 'lyrics_oromo', 'lyrics_transliteration'] as const) {
  for (const issue of auditFormatting(row[field], field)) if (issue.kind === 'replacement_character' || issue.kind === 'control_character') {
    encodingRows.push({
      import_id: '', mezmur_id: text(row.mezmur_id), public_record_id: id(row), slug: text(row.slug), title: title(row), field,
      original_value: String(row[field] ?? ''), suggested_value: '', verification_status: 'unverified — no authoritative primary source retrieved',
      confidence: '0.00', evidence_url: text(row.source_url) || text(row.youtube_url),
      explanation: `${issue.explanation} Retained exactly; no recovery is proposed without source evidence.`,
    })
  }
}

write('VERIFIED_PUBLIC_SLUG_COLLISIONS.csv', ['import_id', 'mezmur_id', 'public_record_id', 'normalized_slug', 'current_slug', 'title', 'status', 'youtube_video_id', 'group_size', 'identity_state', 'verification', 'evidence_snapshot_sha256'], collisionRows)
write('PROPOSED_UNIQUE_SLUGS.csv', ['import_id', 'current_slug', 'proposed_slug', 'public_record_id', 'title', 'group_size', 'action', 'approved_template', 'explanation', 'route_preservation'], slugProposals)
write('VERIFIED_EXACT_DUPLICATES.csv', ['import_id_a', 'import_id_b', 'historical_import_id_a', 'historical_import_id_b', 'record_id_a', 'record_id_b', 'slug_a', 'slug_b', 'title_a', 'title_b', 'classification', 'confidence', 'evidence', 'youtube_a', 'youtube_b', 'verification_scope', 'resolution'], exact)
write('DUPLICATE_REVIEW_QUEUE.csv', ['queue_type', 'import_id_a', 'import_id_b', 'historical_import_id_a', 'historical_import_id_b', 'record_id_a', 'record_id_b', 'slug_a', 'slug_b', 'title_a', 'title_b', 'classification', 'confidence', 'evidence', 'youtube_a', 'youtube_b', 'verification_scope', 'resolution', 'review_action'], duplicateQueue)
write('VERIFIED_ENCODING_CORRECTIONS.csv', ['import_id', 'mezmur_id', 'public_record_id', 'slug', 'title', 'field', 'original_value', 'suggested_value', 'verification_status', 'confidence', 'evidence_url', 'explanation'], encodingRows)

const migration = `-- PHASE 2 — REVIEW-ONLY / DRY-RUN TEMPLATE\n-- Generated from public snapshot ${manifest.retrieved_at} (${manifest.sha256}).\n-- Default behavior: verifies an empty approval plan and ROLLBACKs.\n-- It cannot modify production until an administrator adds reviewed rows and replaces ROLLBACK with COMMIT.\n\nbegin;\n\n-- Approved rows must be populated only after a staff read-only identity audit.\ncreate temporary table phase2_slug_plan (\n  import_id uuid primary key,\n  expected_slug text not null,\n  proposed_slug text not null,\n  expected_updated_at text not null,\n  preserve_alias boolean not null default true\n) on commit drop;\n\n-- Example only; keep commented until explicit approval.\n-- insert into phase2_slug_plan(import_id, expected_slug, proposed_slug, expected_updated_at)\n-- values ('00000000-0000-0000-0000-000000000000', 'old-slug', 'old-slug--a1b2c3d4', 'exact-updated-at-value');\n\n-- Preconditions: exact immutable identity, no deleted/draft mutation, exact old value,\n-- exact optimistic-lock value, and a target slug unused by every other active record.\nselect p.import_id, m.slug as actual_slug, m.updated_at as actual_updated_at, m.status, m.deleted_at\nfrom phase2_slug_plan p\nleft join public.mezmur_data_import m on m.import_id = p.import_id;\n\nselect p.import_id, p.proposed_slug\nfrom phase2_slug_plan p\njoin public.mezmur_data_import other\n  on other.deleted_at is null\n and lower(trim(other.slug)) = lower(trim(p.proposed_slug))\n and other.import_id <> p.import_id;\n\n-- Route aliases require a separately reviewed, deployed alias mechanism. Do not\n-- change a slug until its old route has a verified alias to this exact import_id.\n-- This template deliberately contains no UPDATE, INSERT, DELETE, or status change.\n\nrollback;\n`
fs.writeFileSync(path.join(reportDir, 'SAFE_CORRECTION_MIGRATION.sql'), migration)

const routes = `# Route compatibility plan\n\n## Current route contract\n\nPublic detail pages use \`/practice/mezmur/:slug\`. The current resolver queries \`mezmur_public\` by slug and historically used \`limit(1)\`; for the ${collisions.length} live collision groups this can select an arbitrary row.\n\n## Required sequence — no production action included\n\n1. Run the authorized private-table query in \`PRIVATE_SCHEMA_AND_COVERAGE_READ_ONLY.sql\` and populate current \`import_id\`, \`updated_at\`, status, and dependent-link evidence for every row in \`VERIFIED_PUBLIC_SLUG_COLLISIONS.csv\`.\n2. For each group, have an editor decide whether records are separate hymns, recordings, language variants, or true duplicates. There is no automatic canonical selection.\n3. Retain one approved canonical slug only if that choice is editorially verified. Give each other separately retained record a unique, stable slug using the approved \`--<import-id-short>\` suffix template.\n4. Before changing any slug, insert a one-to-one alias from the old slug to the intended immutable \`import_id\`; the alias must be unique and public read-only.\n5. Update the public route resolver to reject ambiguous direct-slug matches and resolve only a verified alias to its stored target.\n6. Run detail-page, favorites, recent-history, calendar-link, category-link, and Search Buddy regression tests.\n\n## Current Phase 2 state\n\n- No alias table or redirect was created.\n- No slug is proposed as ready to apply because the configured administrator credential was empty and the public view intentionally omits \`import_id\`.\n- Existing URLs are unchanged. The local route guard prevents a collision from silently selecting an arbitrary record after it is deployed.\n`
fs.writeFileSync(path.join(reportDir, 'ROUTE_COMPATIBILITY_PLAN.md'), routes)

const summary = `# Phase 2 summary\n\n- Public snapshot audited: **${publicRows.length}** rows, retrieved ${manifest.retrieved_at}.\n- Verified live public-slug collision groups: **${collisions.length}** affecting **${collisionRows.length}** public rows.\n- Exact content-and-recording candidates: **${exact.length}**. These are not merge instructions.\n- Possible duplicate/variant candidates: **${possible.length}**.\n- Encoding findings rechecked: **${encodingRows.length}**; verified text corrections: **0**.\n- Fully verified production corrections: **0**.\n- Corrections awaiting an authorized private identity audit and editorial approval: **${collisionRows.length}** route records plus all duplicate/encoding candidates.\n\nThe available \`.env.import\` configuration names an administrator key but its value is empty, so no privileged private-table query was attempted. The deliverables deliberately preserve blank \`import_id\` fields instead of guessing.\n\nNo production data, lyrics, slugs, URLs, Zemari associations, classifications, statuses, publication RPCs, or permissions were changed.\n`
fs.writeFileSync(path.join(reportDir, 'PHASE_2_SUMMARY.md'), summary)
fs.appendFileSync(
  path.join(reportDir, 'PHASE_2_SUMMARY.md'),
  '\n- Existing formatting review items retained without change: **554**.\n- Existing Zemari attribution review items retained without change: **2**.\n',
)
console.log(JSON.stringify({ collision_groups: collisions.length, collision_rows: collisionRows.length, exact_candidates: exact.length, possible_candidates: possible.length, encoding_unverified: encodingRows.length, fully_verified_corrections: 0 }, null, 2))
