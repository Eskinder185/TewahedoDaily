import { readFileSync } from 'node:fs'
import { performance } from 'node:perf_hooks'
import { rankPublicRows, type PublicMezmurRow } from '../src/lib/search/mezmurLyricSearch'

type Snapshot = { mezmur_data_import?: Array<Record<string, unknown>> }
const datasetPath = 'reports/mezmur-quality-audit/PUBLIC_MEZMUR_SNAPSHOT.json'
const snapshot = JSON.parse(readFileSync(datasetPath, 'utf8')) as Snapshot | Array<Record<string, unknown>>
const sourceRows = Array.isArray(snapshot) ? snapshot : (snapshot.mezmur_data_import || [])
const raw = sourceRows.filter((row) => !row.status || String(row.status).toLowerCase() === 'published')
const rows: PublicMezmurRow[] = raw.map((row) => ({
  mezmur_id: String(row.mezmur_id || ''),
  slug: String(row.slug || ''),
  status: String(row.status || ''),
  title: String(row.title || ''),
  title_amharic: String(row.title_amharic || ''),
  title_english: String(row.title_english || ''),
  primary_language: String(row.primary_language || ''),
  form: String(row.form || ''),
  singer_name: String(row.singer_name || ''),
  youtube_url: String(row.youtube_url || ''),
  audio_url: String(row.audio_url || ''),
  image_path: String(row.image_path || ''),
  legacy_thumbnail_url: String(row.legacy_thumbnail_url || ''),
  search_keywords: String(row.search_keywords || ''),
  lyrics_amharic: String(row.lyrics_amharic || ''),
  lyrics_geez: String(row.lyrics_geez || ''),
  lyrics_transliteration: String(row.lyrics_transliteration || ''),
  lyrics_english: String(row.lyrics_english || ''),
  lyrics_oromo: String(row.lyrics_oromo || ''),
}))

const exemplar = rows.find((row) => row.title && row.lyrics_amharic) || rows[0]
const lyricFragment = String(exemplar?.lyrics_amharic || exemplar?.lyrics_english || '').split(/\s+/).slice(0, 3).join(' ')
const queries = [String(exemplar?.title || ''), String(exemplar?.title_amharic || ''), lyricFragment].filter(Boolean)

function time(action: () => void, repeats = 5) {
  const start = performance.now()
  for (let index = 0; index < repeats; index += 1) action()
  return (performance.now() - start) / repeats
}

const beforeSearchMs = queries.map((query) => ({
  query,
  ms: time(() => { rankPublicRows(rows, query) }),
}))

// Models the rows returned to the browser after the ranked SQL filters first.
const candidateSets = queries.map((query) => {
  const terms = query.toLocaleLowerCase().split(/\s+/).filter(Boolean)
  return rows.filter((row) => {
    const text = [row.title, row.title_amharic, row.title_english, row.search_keywords, row.lyrics_amharic, row.lyrics_geez, row.lyrics_transliteration, row.lyrics_english, row.lyrics_oromo]
      .join(' ').toLocaleLowerCase()
    return terms.every((term) => text.includes(term))
  }).slice(0, 60)
})
const afterSearchMs = queries.map((query, index) => ({
  query,
  candidates: candidateSets[index].length,
  ms: time(() => { rankPublicRows(candidateSets[index], query).slice(0, 24) }),
}))

const legacyPayload = JSON.stringify(raw.map((row) => ({
  mezmur_id: row.mezmur_id, slug: row.slug, title: row.title, title_amharic: row.title_amharic,
  title_english: row.title_english, image_path: row.image_path, legacy_thumbnail_url: row.legacy_thumbnail_url,
  youtube_url: row.youtube_url, singer_name: row.singer_name, primary_language: row.primary_language,
  form: row.form, search_keywords: row.search_keywords, status: row.status,
})))
const pagePayload = JSON.stringify(raw.slice(0, 24).map((row) => ({
  mezmur_id: row.mezmur_id, slug: row.slug, title: row.title, title_amharic: row.title_amharic,
  title_english: row.title_english, primary_language: row.primary_language, form: row.form,
  singer_name: row.singer_name, youtube_url: row.youtube_url, audio_url: row.audio_url,
  image_path: row.image_path, legacy_thumbnail_url: row.legacy_thumbnail_url, match_field: 'title', total_count: raw.length,
})))

const imageRefs = raw.map((row) => String(row.image_path || row.legacy_thumbnail_url || '')).filter(Boolean)
const uniqueImageRefs = new Set(imageRefs)
const report = {
  environment: { runtime: process.version, dataset: datasetPath, publishedRows: rows.length },
  before: {
    catalogRequestsAt500Rows: Math.ceil(rows.length / 500),
    catalogResponseBytes: Buffer.byteLength(legacyPayload),
    searchCpuMs: beforeSearchMs,
  },
  after: {
    rankedPageRequests: 1,
    rankedPageResponseBytes: Buffer.byteLength(pagePayload),
    searchCpuMs: afterSearchMs,
  },
  images: { references: imageRefs.length, uniqueReferences: uniqueImageRefs.size, repeatedReferences: imageRefs.length - uniqueImageRefs.size },
  limitations: 'Local deterministic payload/CPU benchmark; it does not include live Supabase latency, browser paint, or image transfer bytes.',
}

console.log(JSON.stringify(report, null, 2))
