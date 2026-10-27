import { readFile, writeFile } from 'node:fs/promises'
import { resolve } from 'node:path'

const dir = resolve('mezmur-cleanup-output')
const source = resolve(dir, 'mezmur_369_STILL_NO_youtube.csv')
const accepted = resolve(dir, 'mezmur_369_WITH_youtube_FOUND.csv')
const candidates = resolve(dir, 'mezmur_369_YOUTUBE_CANDIDATES.csv')

function parseCsv(text) {
  const rows = []
  let row = [], field = '', quoted = false
  for (let i = 0; i < text.length; i += 1) {
    const c = text[i]
    if (quoted) {
      if (c === '"' && text[i + 1] === '"') { field += '"'; i += 1 }
      else if (c === '"') quoted = false
      else field += c
    } else if (c === '"' && field === '') quoted = true
    else if (c === ',') { row.push(field); field = '' }
    else if (c === '\n') { row.push(field.replace(/\r$/, '')); rows.push(row); row = []; field = '' }
    else field += c
  }
  if (field || row.length) { row.push(field); rows.push(row) }
  return rows
}

function quote(value) {
  const s = String(value ?? '')
  return /[",\n\r]/.test(s) ? `"${s.replaceAll('"', '""')}"` : s
}

const sourceRows = parseCsv((await readFile(source, 'utf8')).replace(/^\uFEFF/, ''))
const acceptedRows = parseCsv((await readFile(accepted, 'utf8')).replace(/^\uFEFF/, ''))
const candidateRows = parseCsv((await readFile(candidates, 'utf8')).replace(/^\uFEFF/, ''))
const headers = sourceRows[0]
const acceptedHeaders = acceptedRows[0]
if (headers.length !== 25 || acceptedHeaders.length !== 25) throw new Error('Expected the established 25-column import schema')
if (sourceRows.length - 1 !== 368) throw new Error(`Expected 368 remaining records, found ${sourceRows.length - 1}`)

// Search-engine probes found accessible EOTC Media and Mezmur library pages,
// but no page exposed an exact, independently verifiable YouTube video ID for
// a remaining source row. Do not convert a general hymn page into a video URL.
const acceptedOut = resolve(dir, 'mezmur_369_WITH_youtube_FOUND_CONTINUED.csv')
const stillOut = resolve(dir, 'mezmur_369_STILL_NO_youtube_CONTINUED.csv')
const candidateOut = resolve(dir, 'mezmur_369_YOUTUBE_CANDIDATES_CONTINUED.csv')
const serializeRows = (rows, cols) => `\uFEFF${cols.join(',')}\r\n${rows.map((r) => cols.map((c, i) => quote(Array.isArray(r) ? r[i] : r[c])).join(',')).join('\r\n')}\r\n`

await writeFile(acceptedOut, serializeRows(acceptedRows.slice(1), acceptedHeaders))
await writeFile(stillOut, serializeRows(sourceRows.slice(1), headers))
await writeFile(candidateOut, serializeRows(candidateRows.slice(1), candidateRows[0]))

console.log(JSON.stringify({ sourceRemaining: 368, newVerifiedMatches: 0, acceptedTotal: acceptedRows.length - 1, candidatesTotal: candidateRows.length - 1, methods: ['no YouTube Data API credential', 'direct YouTube HTTPS unavailable', 'search-engine indexed pages accessible', 'EOTC Media pages accessible but no exact video IDs verified'] }, null, 2))
