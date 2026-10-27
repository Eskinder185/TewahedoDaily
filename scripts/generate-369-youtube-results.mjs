import { readFile, copyFile, writeFile } from 'node:fs/promises'
import { resolve } from 'node:path'

const source = resolve('mezmur-cleanup-output/mezmur_import_ready_without_youtube_CORRECTED.csv')
const outputDir = resolve('mezmur-cleanup-output')
const backup = `${source}.backup-20261027`
const foundPath = resolve(outputDir, 'mezmur_369_WITH_youtube_FOUND.csv')
const stillPath = resolve(outputDir, 'mezmur_369_STILL_NO_youtube.csv')
const candidatesPath = resolve(outputDir, 'mezmur_369_YOUTUBE_CANDIDATES.csv')

function parseCsv(text) {
  const rows = []
  let row = [], field = '', quoted = false
  for (let i = 0; i < text.length; i += 1) {
    const char = text[i]
    if (quoted) {
      if (char === '"' && text[i + 1] === '"') { field += '"'; i += 1 }
      else if (char === '"') quoted = false
      else field += char
    } else if (char === '"' && field === '') quoted = true
    else if (char === ',') { row.push(field); field = '' }
    else if (char === '\n') { row.push(field.replace(/\r$/, '')); rows.push(row); row = []; field = '' }
    else field += char
  }
  if (field || row.length) { row.push(field); rows.push(row) }
  return rows
}

function quote(value) {
  const text = String(value ?? '')
  return /[",\n\r]/.test(text) ? `"${text.replaceAll('"', '""')}"` : text
}

const text = await readFile(source, 'utf8')
await copyFile(source, backup)
const rows = parseCsv(text.replace(/^\uFEFF/, ''))
const [headers, ...values] = rows
if (headers.length !== 25) throw new Error(`Expected 25 columns, found ${headers.length}`)
const records = values.map((values) => Object.fromEntries(headers.map((header, index) => [header, values[index] ?? ''])))

// Only a directly corroborated match is populated. Search evidence was recorded
// manually from publicly indexed results; uncertain candidates remain blank.
const verified = new Map([
  ['tsega-ne-ene', {
    url: 'https://www.youtube.com/watch?v=Q2lWt4A_bT8',
    title: 'ጸጋ ነሣእነ | ዘማሪ ቀሲስ ወንድወሰን በላይ እና ዘማሪት ሲስተር ፋሲካ መኮንን',
    channel: 'ማኅቶት ቲዩብ - Mahtot Tube',
    score: 96,
    evidence: 'Exact Amharic title; indexed description identifies an Ethiopian Orthodox Tewahedo song and names Sister Fasika Mekonnen; title and lyrics context corroborate the source record.',
  }],
])
const possible = {
  'tsega-ne-ene': {
    url: 'https://www.youtube.com/watch?v=8xcK5xX6F0s',
    title: 'ከኃጢያተኛው ድንኳን || ለማርያም || ጸጋ ነሣእነ',
    channel: 'አቴርሳታ ሚዲያ',
    score: 78,
    evidence: 'Indexed Telegram result includes the exact title, but the result appears to be a multi-item/new release post and does not independently establish the full recording identity.',
    status: 'possible-not-accepted',
    rejection: 'A second recording with the same hymn title; retained for human review because the indexed evidence is not sufficient to prefer it over the corroborated Mahtot Tube result.',
  },
}

const found = records.filter((record) => verified.has(record.slug)).map((record) => ({ ...record, youtube_url: verified.get(record.slug).url }))
const still = records.filter((record) => !verified.has(record.slug))
const candidateRows = []
for (const [slug, match] of Object.entries(possible)) {
  const record = records.find((item) => item.slug === slug)
  if (record) candidateRows.push({ mezmur_slug: slug, original_title: record.amharic_title, candidate_youtube_url: match.url, actual_video_title: match.title, channel_name: match.channel, match_evidence: match.evidence, confidence_score: match.score, verification_status: match.status, rejection_reason: match.rejection })
}
for (const [slug, match] of verified) {
  const record = records.find((item) => item.slug === slug)
  candidateRows.push({ mezmur_slug: slug, original_title: record.amharic_title, candidate_youtube_url: match.url, actual_video_title: match.title, channel_name: match.channel, match_evidence: match.evidence, confidence_score: match.score, verification_status: 'verified-accepted', rejection_reason: '' })
}

const serialize = (items, columns = headers) => `\uFEFF${columns.join(',')}\r\n${items.map((item) => columns.map((column) => quote(item[column])).join(',')).join('\r\n')}\r\n`
await writeFile(foundPath, serialize(found), 'utf8')
await writeFile(stillPath, serialize(still), 'utf8')
await writeFile(candidatesPath, serialize(candidateRows, ['mezmur_slug', 'original_title', 'candidate_youtube_url', 'actual_video_title', 'channel_name', 'match_evidence', 'confidence_score', 'verification_status', 'rejection_reason']), 'utf8')

console.log(JSON.stringify({ source: records.length, found: found.length, still: still.length, candidates: candidateRows.length, backup }, null, 2))
