import { createHash } from 'node:crypto'
import fs from 'node:fs'
import path from 'node:path'
import {
  applySafeFormatting,
  auditFormatting,
  lyricText,
  normalizedLyric,
  normalizedText,
  recordingKey,
  text,
  titlePhoneticKey,
  tokenSimilarity,
  type QualityMezmur,
} from '../src/lib/mezmur/qualityAudit.ts'

const root = process.cwd()
const output = path.join(root, 'reports', 'mezmur-quality-audit')
fs.mkdirSync(output, { recursive: true })

type Row = QualityMezmur & Record<string, unknown>
type CsvRow = Record<string, unknown>

function loadEnv(file: string) {
  if (!fs.existsSync(file)) return {}
  return Object.fromEntries(fs.readFileSync(file, 'utf8').split(/\r?\n/).flatMap((line) => {
    if (!/^[A-Za-z_][A-Za-z0-9_]*=/.test(line)) return []
    const split = line.indexOf('=')
    return [[line.slice(0, split), line.slice(split + 1).trim()]]
  }))
}

function csv(value: unknown) {
  const string = String(value ?? '')
  return /[",\r\n]/.test(string) ? `"${string.replaceAll('"', '""')}"` : string
}

function writeCsv(name: string, headers: string[], rows: CsvRow[]) {
  const content = [headers.join(','), ...rows.map((row) => headers.map((header) => csv(row[header])).join(','))].join('\n') + '\n'
  fs.writeFileSync(path.join(output, name), content, 'utf8')
}

function recordId(row: Row) {
  return text(row.mezmur_id) || `public_slug:${text(row.slug)}`
}

function normalizedSlug(value: unknown) {
  return text(value).normalize('NFKC').toLocaleLowerCase('und')
}

function titleOf(row: Row) {
  return text(row.title_amharic) || text(row.title) || text(row.slug)
}

function pairKey(left: Row, right: Row) {
  return [recordId(left), recordId(right)].sort().join('|')
}

function pairs(rows: Row[]) {
  const result: Array<[Row, Row]> = []
  for (let left = 0; left < rows.length; left++) for (let right = left + 1; right < rows.length; right++) result.push([rows[left], rows[right]])
  return result
}

function distinct<T>(values: T[]) { return [...new Set(values)] }

function localImportIds() {
  const backup = path.join(root, 'audit', 'mezmur-complete-repair', 'ORIGINAL_BACKUP.jsonl')
  if (!fs.existsSync(backup)) return new Map<string, string>()
  const groups = new Map<string, string[]>()
  for (const line of fs.readFileSync(backup, 'utf8').split(/\r?\n/)) {
    if (!line.trim()) continue
    const row = JSON.parse(line) as Row
    const key = normalizedSlug(row.slug)
    if (!key || !text(row.import_id)) continue
    groups.set(key, [...(groups.get(key) || []), text(row.import_id)])
  }
  return new Map([...groups].flatMap(([slug, ids]) => distinct(ids).length === 1 ? [[slug, ids[0]]] : []))
}

async function fetchPublicRows(): Promise<{ rows: Row[]; selectedColumns: string[] }> {
  const fileEnv = loadEnv(path.join(root, '.env'))
  const url = process.env.VITE_SUPABASE_URL || fileEnv.VITE_SUPABASE_URL
  const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY || process.env.VITE_SUPABASE_ANON_KEY || fileEnv.VITE_SUPABASE_PUBLISHABLE_KEY || fileEnv.VITE_SUPABASE_ANON_KEY
  if (!url || !key) throw new Error('A Supabase URL and publishable key are required for the read-only public audit.')
  let columns = [
    'mezmur_id', 'slug', 'title', 'title_amharic', 'title_english', 'description', 'description_amharic',
    'lyrics_amharic', 'lyrics_transliteration', 'lyrics_english', 'lyrics_geez', 'lyrics_oromo',
    'primary_language', 'form', 'singer_id', 'singer_slug', 'singer_name', 'zemari_id', 'youtube_url',
    'audio_url', 'image_path', 'image_alt', 'legacy_thumbnail_url', 'search_keywords', 'status',
    'review_status', 'source_url', 'created_at', 'updated_at', 'rights_status', 'has_stored_lyrics',
  ]
  const rows: Row[] = []
  for (let offset = 0; offset < 10_000; offset += 500) {
    const response = await fetch(`${url}/rest/v1/mezmur_public?select=${encodeURIComponent(columns.join(','))}&order=slug.asc&limit=500&offset=${offset}`, {
      headers: { apikey: key, Authorization: `Bearer ${key}` },
    })
    if (!response.ok) {
      const body = await response.text()
      const missing = body.match(/column mezmur_public\.([a-z_]+) does not exist/i)?.[1]
      if (response.status === 400 && missing && columns.includes(missing)) {
        columns = columns.filter((column) => column !== missing)
        offset -= 500
        continue
      }
      throw new Error(`Public Mezmur audit request failed: ${response.status} ${body}`)
    }
    const page = await response.json() as Row[]
    rows.push(...page)
    if (page.length < 500) return { rows, selectedColumns: columns }
  }
  throw new Error('Public Mezmur audit exceeded the 10,000-row safety limit.')
}

function collectDuplicates(rows: Row[]) {
  const confirmed: CsvRow[] = []
  const possible: CsvRow[] = []
  const seen = new Set<string>()
  const add = (target: CsvRow[], left: Row, right: Row, classification: string, confidence: number, evidence: string) => {
    const key = `${classification}|${pairKey(left, right)}`
    if (seen.has(key)) return
    seen.add(key)
    target.push({
      import_id_a: '', import_id_b: '', historical_import_id_a: text(left.historical_import_id), historical_import_id_b: text(right.historical_import_id),
      record_id_a: recordId(left), record_id_b: recordId(right), slug_a: text(left.slug), slug_b: text(right.slug),
      title_a: titleOf(left), title_b: titleOf(right), classification, confidence: confidence.toFixed(2), evidence,
      youtube_a: text(left.youtube_url), youtube_b: text(right.youtube_url),
    })
  }
  const byLyrics = new Map<string, Row[]>()
  const byTitle = new Map<string, Row[]>()
  const byPhoneticTitle = new Map<string, Row[]>()
  const byRecording = new Map<string, Row[]>()
  for (const row of rows) {
    const lyrics = normalizedLyric(lyricText(row))
    if (lyrics.length >= 40) byLyrics.set(lyrics, [...(byLyrics.get(lyrics) || []), row])
    const title = normalizedText(titleOf(row))
    if (title) byTitle.set(title, [...(byTitle.get(title) || []), row])
    const phonetic = titlePhoneticKey(text(row.title) || text(row.title_english))
    if (phonetic.length >= 4) byPhoneticTitle.set(phonetic, [...(byPhoneticTitle.get(phonetic) || []), row])
    const recording = recordingKey(row.youtube_url)
    if (recording) byRecording.set(recording, [...(byRecording.get(recording) || []), row])
  }
  for (const [lyrics, group] of byLyrics) if (group.length > 1) for (const [left, right] of pairs(group)) {
    const sameRecording = recordingKey(left.youtube_url) && recordingKey(left.youtube_url) === recordingKey(right.youtube_url)
    const publicIdentityAmbiguous = recordId(left) === recordId(right)
    if (sameRecording && normalizedText(titleOf(left)) === normalizedText(titleOf(right))) {
      if (publicIdentityAmbiguous) {
        add(possible, left, right, 'ambiguous public-projection duplicate — private identity review required', 0.5, `Identical normalized lyric text (${lyrics.length} characters), title, and YouTube recording, but the public view does not distinguish the two rows with an immutable identifier.`)
      } else {
        add(confirmed, left, right, 'confirmed duplicate', 0.99, `Identical normalized lyric text (${lyrics.length} characters), title, and YouTube recording.`)
      }
    } else {
      add(possible, left, right, 'same hymn, different recording or catalog entry', 0.98, `Identical normalized lyric text (${lyrics.length} characters); recording/title differs or is missing.`)
    }
  }
  for (const [title, group] of byTitle) if (group.length > 1) for (const [left, right] of pairs(group)) {
    const similarity = tokenSimilarity(lyricText(left), lyricText(right))
    if (similarity >= 0.88 && normalizedLyric(lyricText(left)) !== normalizedLyric(lyricText(right))) {
      add(possible, left, right, 'probable duplicate', similarity, `Same normalized title “${title}”; lyric token similarity ${similarity.toFixed(2)}.`)
    } else if (similarity < 0.35 && lyricText(left) && lyricText(right)) {
      add(possible, left, right, 'same title, different hymn', 1, `Same normalized title “${title}”; lyric token similarity ${similarity.toFixed(2)} indicates different text.`)
    }
  }
  for (const [phonetic, group] of byPhoneticTitle) if (group.length > 1) for (const [left, right] of pairs(group)) {
    if (normalizedText(titleOf(left)) === normalizedText(titleOf(right))) continue
    const similarity = tokenSimilarity(lyricText(left), lyricText(right))
    const sameRecording = recordingKey(left.youtube_url) && recordingKey(left.youtube_url) === recordingKey(right.youtube_url)
    if (sameRecording || similarity >= 0.9) add(possible, left, right, 'transliteration/title variant — manual review', Math.max(similarity, sameRecording ? 0.9 : 0), `Same phonetic title key “${phonetic}”; ${sameRecording ? 'same YouTube recording.' : `lyric token similarity ${similarity.toFixed(2)}.`}`)
  }
  return { confirmed, possible, byRecording }
}

async function main() {
  const { rows, selectedColumns } = await fetchPublicRows()
  const localIds = localImportIds()
  for (const row of rows) row.historical_import_id = localIds.get(normalizedSlug(row.slug)) || null
  const snapshot = JSON.stringify(rows, null, 2)
  fs.writeFileSync(path.join(output, 'PUBLIC_MEZMUR_SNAPSHOT.json'), snapshot, 'utf8')
  fs.writeFileSync(path.join(output, 'SNAPSHOT_MANIFEST.json'), JSON.stringify({
    retrieved_at: new Date().toISOString(), source: 'public.mezmur_public via publishable-key read-only request',
    row_count: rows.length, sha256: createHash('sha256').update(snapshot).digest('hex'),
    selected_public_columns: selectedColumns,
    historical_import_id_coverage: rows.filter((row) => text(row.historical_import_id)).length,
    limitation: 'mezmur_public does not expose import_id. Historical IDs are retained only as historical evidence and are not represented as current immutable IDs.',
  }, null, 2) + '\n')

  const { confirmed, possible, byRecording } = collectDuplicates(rows)
  const baseHeaders = ['import_id', 'historical_import_id', 'record_id', 'slug', 'title', 'field', 'original_value', 'suggested_value', 'classification', 'confidence', 'explanation', 'supporting_source']
  const titleIssues: CsvRow[] = []
  const formatting: CsvRow[] = []
  const encoding: CsvRow[] = []
  const proposed: CsvRow[] = []
  const zemari: CsvRow[] = []

  for (const row of rows) {
    const id = recordId(row)
    for (const field of ['title', 'title_amharic', 'title_english'] as const) {
      const value = text(row[field])
      if (/\uFFFD|[ÃÂ]/.test(value) || /<\/?[a-z][^>]*>/i.test(value)) titleIssues.push({
        import_id: '', historical_import_id: text(row.historical_import_id), record_id: id, slug: text(row.slug), title: titleOf(row), field,
        original_value: value, suggested_value: '', classification: 'unverified title/encoding anomaly', confidence: '0.00',
        explanation: 'Potential encoding or markup corruption. No replacement proposed without a verified source.', supporting_source: 'public.mezmur_public',
      })
    }
    for (const field of ['lyrics_amharic', 'lyrics_geez', 'lyrics_english', 'lyrics_oromo', 'lyrics_transliteration'] as const) {
      const value = row[field]
      for (const issue of auditFormatting(value, field)) {
        const item = {
          import_id: '', historical_import_id: text(row.historical_import_id), record_id: id, slug: text(row.slug), title: titleOf(row), field,
          original_value: String(value ?? ''), suggested_value: issue.severity === 'safe' ? applySafeFormatting(value) : '',
          classification: issue.kind, confidence: issue.severity === 'safe' ? '1.00' : '0.00', explanation: issue.explanation,
          supporting_source: 'public.mezmur_public',
        }
        formatting.push(item)
        if (issue.kind === 'replacement_character' || issue.kind === 'control_character') encoding.push(item)
        if (issue.severity === 'safe' && item.original_value !== item.suggested_value) proposed.push(item)
      }
    }
  }
  for (const [video, group] of byRecording) if (group.length > 1) {
    const singers = distinct(group.map((row) => normalizedText(row.singer_name)).filter(Boolean))
    if (singers.length > 1) for (const row of group) zemari.push({
      import_id: '', historical_import_id: text(row.historical_import_id), record_id: recordId(row), slug: text(row.slug), title: titleOf(row), field: 'singer_name',
      original_value: text(row.singer_name), suggested_value: '', classification: 'shared recording with conflicting singer attribution', confidence: '0.70',
      explanation: `The same YouTube video (${video}) is assigned to multiple singer names: ${singers.join(' | ')}. Preserve existing data pending verification.`, supporting_source: text(row.youtube_url),
    })
  }

  writeCsv('CONFIRMED_DUPLICATES.csv', ['import_id_a', 'import_id_b', 'historical_import_id_a', 'historical_import_id_b', 'record_id_a', 'record_id_b', 'slug_a', 'slug_b', 'title_a', 'title_b', 'classification', 'confidence', 'evidence', 'youtube_a', 'youtube_b'], confirmed)
  writeCsv('POSSIBLE_DUPLICATES.csv', ['import_id_a', 'import_id_b', 'historical_import_id_a', 'historical_import_id_b', 'record_id_a', 'record_id_b', 'slug_a', 'slug_b', 'title_a', 'title_b', 'classification', 'confidence', 'evidence', 'youtube_a', 'youtube_b'], possible)
  writeCsv('INCORRECT_OR_UNVERIFIED_TITLES.csv', baseHeaders, titleIssues)
  writeCsv('LYRICS_FORMATTING_ISSUES.csv', baseHeaders, formatting)
  writeCsv('ENCODING_ERRORS.csv', baseHeaders, encoding)
  writeCsv('ZEMARI_ATTRIBUTION_REVIEW.csv', baseHeaders, zemari)
  writeCsv('THEOLOGICAL_REVIEW.csv', baseHeaders, [])
  writeCsv('CATEGORY_OCCASION_REVIEW.csv', baseHeaders, [])
  writeCsv('PROPOSED_CORRECTIONS.csv', baseHeaders, proposed)

  const slugGroups = new Map<string, Row[]>()
  for (const row of rows) {
    const slug = normalizedSlug(row.slug)
    if (slug) slugGroups.set(slug, [...(slugGroups.get(slug) || []), row])
  }
  const duplicateSlugs = [...slugGroups.values()].filter((group) => group.length > 1)
  const withLyrics = rows.filter((row) => Boolean(normalizedLyric(lyricText(row)))).length
  const duplicateSlugRows = duplicateSlugs.reduce((sum, group) => sum + group.length, 0)
  const missingLyrics = rows.length - withLyrics
  const missingYoutube = rows.filter((row) => !text(row.youtube_url)).length
  const missingMezmurId = rows.filter((row) => !text(row.mezmur_id)).length
  const report = `# Mezmur quality audit\n\nGenerated: ${new Date().toISOString()}\n\n## Coverage\n\n- Current public rows audited: **${rows.length}**\n- Public rows with at least one exposed lyrics field: **${withLyrics}**\n- Public rows with a uniquely matching **historical** local import ID: **${rows.filter((row) => text(row.historical_import_id)).length}**\n- Current private import-table, draft, taxonomy, occasion, and staff-only Zemari fields: **not read**. The public view intentionally does not expose them, and this audit did not bypass RLS.\n\nThe backup is [PUBLIC_MEZMUR_SNAPSHOT.json](PUBLIC_MEZMUR_SNAPSHOT.json); its SHA-256 and retrieval details are in [SNAPSHOT_MANIFEST.json](SNAPSHOT_MANIFEST.json). The public view does not expose current immutable \`import_id\` values, so report rows leave that field blank rather than guessing; \`historical_import_id\` is evidence from an older local snapshot only.\n\n## Findings\n\n| Check | Count | Interpretation |\n| --- | ---: | --- |\n| Confirmed exact duplicates | ${confirmed.length} | Same normalized title, lyrics, and YouTube recording only. |\n| Possible duplicates / variants | ${possible.length} | Heuristic candidates; no merge or deletion is justified. |\n| Duplicate normalized public slugs | ${duplicateSlugs.length} groups / ${duplicateSlugRows} rows | Public route ambiguity candidates. |\n| Public rows with no exposed lyrics | ${missingLyrics} | Publicly visible media/catalog stubs. |\n| Public rows with no YouTube URL | ${missingYoutube} | Not necessarily incorrect; no video association is stored. |\n| Public rows with no mezmur_id | ${missingMezmurId} | Must use identity-safe unique-slug fallback for visibility reporting. |\n| Title/encoding anomalies | ${titleIssues.length} | No title was auto-corrected. |\n| Lyric formatting findings | ${formatting.length} | Safe whitespace candidates and review-only anomalies are separated. |\n| Encoding errors | ${encoding.length} | Replacement/control characters; never reconstructed automatically. |\n| Zemari attribution conflicts | ${zemari.length} | Same recording associated with differing singer names. |\n| Safe proposed changes | ${proposed.length} | Only CR/LF, literal-newline, and trailing-whitespace normalizations. |\n\n## Accuracy boundaries\n\nThis automated review does **not** assert theological correctness, Church approval, authorship, title correction, Zemari attribution, category/occasion correctness, or a recovered Geʽez/Amharic reading without an authoritative source. The public projection does not expose category and occasion relationships, and the audit therefore leaves their CSV review queue empty rather than inventing findings.\n\n\`/2/\`, \`/3/\`, and similar markers are reported only as review items because they may be intentional repetition notation. No chorus, stanza, line, title, slug, video link, status, or relationship was changed.\n\n## Recommended review order\n\n1. Resolve entries in \`ENCODING_ERRORS.csv\` against an authoritative source.\n2. Review \`CONFIRMED_DUPLICATES.csv\` and \`POSSIBLE_DUPLICATES.csv\`; preserve legitimate alternate recordings and language variants.\n3. Verify shared-video singer conflicts in \`ZEMARI_ATTRIBUTION_REVIEW.csv\`.\n4. Run a staff-authorized, read-only private-table audit before reviewing drafts, taxonomy, occasions, or full immutable \`import_id\` coverage.\n\n`
  fs.writeFileSync(path.join(output, 'MEZMUR_QUALITY_REPORT.md'), report, 'utf8')
  console.log(JSON.stringify({ audited_public_rows: rows.length, confirmed_duplicates: confirmed.length, possible_duplicates: possible.length, formatting_issues: formatting.length, encoding_errors: encoding.length, proposed_safe_corrections: proposed.length }, null, 2))
}

main().catch((error) => {
  console.error(error instanceof Error ? error.message : error)
  process.exitCode = 1
})
