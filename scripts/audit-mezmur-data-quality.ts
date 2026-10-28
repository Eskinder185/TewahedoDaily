/**
 * Read-only data-quality audit for a Mezmur table export (mezmur_data_import).
 *
 * Usage:
 *   npx tsx scripts/audit-mezmur-data-quality.ts <export.csv> [outDir]
 *
 * Reports issues by immutable identifiers (import_id, mezmur_id). It never
 * rewrites lyrics, titles, languages or publication status — every finding is
 * a suggestion for a human editor.
 *
 * Outputs (default outDir: reports/mezmur-data-quality):
 *   mezmur_data_quality_issues.csv       one row per (Mezmur, issue)
 *   mezmur_language_verification.csv     language evidence for every Mezmur
 *   data_quality_summary.json            counts for the report
 */
import fs from 'node:fs'
import path from 'node:path'

function parseCsv(input: string): Record<string, string>[] {
  const rows: string[][] = []
  let row: string[] = []
  let cell = ''
  let quoted = false
  const text = input.replace(/^\uFEFF/, '')
  for (let i = 0; i < text.length; i++) {
    const c = text[i]
    if (quoted) {
      if (c === '"' && text[i + 1] === '"') { cell += '"'; i++ }
      else if (c === '"') quoted = false
      else cell += c
      continue
    }
    if (c === '"') { quoted = true; continue }
    if (c === ',') { row.push(cell); cell = ''; continue }
    if (c === '\n' || c === '\r') {
      if (c === '\r' && text[i + 1] === '\n') i++
      row.push(cell); rows.push(row); row = []; cell = ''
      continue
    }
    cell += c
  }
  if (cell || row.length) { row.push(cell); rows.push(row) }
  const [header = [], ...body] = rows.filter((r) => r.some((v) => v !== ''))
  return body.map((cells) => Object.fromEntries(header.map((h, i) => [h, cells[i] ?? ''])))
}
const esc = (v: unknown) => {
  const s = String(v ?? '')
  return /[",\r\n]/.test(s) ? `"${s.replaceAll('"', '""')}"` : s
}
function writeCsv(file: string, columns: string[], rows: Record<string, unknown>[]) {
  fs.writeFileSync(file, `${columns.join(',')}\n${rows.map((r) => columns.map((c) => esc(r[c])).join(',')).join('\n')}\n`, 'utf8')
}

// ---------------------------------------------------------------------------
// Language evidence
// ---------------------------------------------------------------------------

const ETH = /[\u1200-\u137F]/
const tok = (text: string) => text.split(/[\s፡።፣፤፥፦፧/()[\]{}"'“”‘’!?.,;:|*+=\-–—0-9]+/).filter(Boolean)

/** Words that occur in Tigrinya hymns but not (or hardly) in Amharic. */
const TIGRINYA_WORDS = new Set([
  'ኣብ', 'ናይ', 'ናብ', 'ንሱ', 'ንሳ', 'እቲ', 'እታ', 'ኣነ', 'ካብ', 'ኢኻ', 'ኢኺ', 'ኢና', 'ኢዩ', 'እዩ', 'እያ', 'እዮም', 'ብዘይ', 'ይኹን', 'ንዑ',
  'ኣምላኽ', 'ኣምላኸይ', 'ጎይታ', 'ጎይታይ', 'ብኣኻ', 'ንዓና', 'ንዓኻ', 'ንዓይ', 'ኣሎ', 'ኣለኹ', 'ዘሎ', 'የለን', 'እንታይ', 'ከመይ', 'ሕጂ', 'ደጊም',
  'ምስ', 'ከም', 'ብዙሕ', 'ፍቕሪ', 'ፍቕርኻ', 'ሓጢኣት', 'ሓጥያት', 'ኣደ', 'ኣደይ', 'ንስኻ', 'ንሕና', 'ኣይ', 'ዘይ', 'ብሓቂ', 'ኣዝዩ',
])
/** Characters specific to Tigrinya orthography (ቐ-row) and frequent ኣ / ኸ use. */
const TIGRINYA_CHARS = /[ቐ-ቖቘቚ-ቝ]/g
/** Amharic function words / endings uncommon in Tigrinya. */
const AMHARIC_WORDS = new Set(['ነው', 'ናቸው', 'ነበር', 'ይሁን', 'የለም', 'ምን', 'እንዴት', 'ጋር', 'ሆይ', 'እኛ', 'እኔ', 'አንተ', 'ኣንተ', 'አንቺ', 'እርሱ', 'እሷ', 'ሁሉ', 'ዛሬ', 'ደግሞ', 'እንጂ', 'ብቻ', 'አለ', 'ኣለ', 'አሉ', 'ሆነ', 'ናት',
  'ጌታ', 'ጌታዬ', 'ጌታችን', 'አምላኬ', 'ኣምላኬ', 'ወደ', 'ላይ', 'ውስጥ', 'መች', 'ማን', 'እንደ', 'የኔ', 'ለኔ'])
const AMHARIC_ENDINGS = /(?:ችን|ችሁ|ኛል|ናል|ዋል|ለሁ|ለው|ነህ|ነሽ|ችኋል|ኸኝ|ሽኝ|ልኝ|ልን|ውን|ዋን|ቸው)$/
/** Ge'ez liturgical function words. */
const GEEZ_WORDS = new Set(['ውእቱ', 'ይእቲ', 'ለነ', 'ኀበ', 'እግዚኦ', 'ወይቤ', 'ይቤ', 'ዘ', 'አምላክነ', 'ንሴብሖ', 'ስብሐት', 'ይትባረክ', 'መሐረነ', 'ተፈሥሒ', 'ሰላም ለኪ', 'ወልድኪ', 'እስመ', 'ኩሎ', 'ዮም', 'እምነ', 'አሜን'])
/** Afaan Oromo (Latin and Ethiopic spellings). */
const OROMO_WORDS = new Set(['waaqayyo', 'waaqayyoo', 'gooftaa', 'yesuus', 'kan', 'fi', 'isaa', 'ani', 'keessa', 'yaa', 'hin', 'nuuf', 'galata', 'galatoomi', 'faarfannaa', 'jireenya', 'ati', 'ishee', 'maariyaam', 'dhugaa', 'jedhe', 'jira',
  'ፈኖ', 'ዋቀዮ', 'ኬኛ', 'ኢፋ', 'ጎፍታ', 'ዋቃ', 'ኒማቲ', 'ጀዋማ', 'ሁንዳ', 'ሀንጋፋ', 'ኢሳ'])
const ENGLISH_WORDS = new Set(['the', 'and', 'of', 'to', 'you', 'your', 'is', 'in', 'my', 'our', 'we', 'lord', 'god', 'for', 'with', 'all', 'be', 'his', 'her', 'are', 'have', 'who'])

type LangScores = { amharic: number; tigrinya: number; geez: number; oromo: number; english: number }
function languageEvidence(text: string): { scores: LangScores; evidence: string[] } {
  const words = tok(text)
  const scores: LangScores = { amharic: 0, tigrinya: 0, geez: 0, oromo: 0, english: 0 }
  const hits = new Map<string, number>()
  const hit = (lang: string, w: string) => hits.set(`${lang}:${w}`, (hits.get(`${lang}:${w}`) || 0) + 1)
  for (const raw of words) {
    const w = raw.toLowerCase()
    if (TIGRINYA_WORDS.has(raw)) { scores.tigrinya += 2; hit('ti', raw) }
    if (AMHARIC_WORDS.has(raw)) { scores.amharic += 2; hit('am', raw) }
    else if (ETH.test(raw) && raw.length >= 3 && AMHARIC_ENDINGS.test(raw)) { scores.amharic += 1 }
    if (GEEZ_WORDS.has(raw)) { scores.geez += 2; hit('gez', raw) }
    if (OROMO_WORDS.has(w)) { scores.oromo += ETH.test(raw) ? 3 : 2; hit('om', raw) }
    if (ENGLISH_WORDS.has(w)) { scores.english += 1; hit('en', w) }
  }
  const tigChars = (text.match(TIGRINYA_CHARS) || []).length
  scores.tigrinya += Math.min(tigChars, 20) * 0.5
  if (tigChars) hits.set(`ti:ቐ-row letters`, tigChars)
  // ኣ is also used in Eritrean-style spelling of Amharic: weak evidence, counted only beside Tigrinya words
  const aa = (text.match(/ኣ/g) || []).length
  if (scores.tigrinya >= 4) scores.tigrinya += Math.min(aa, 10) * 0.2
  if (aa) hits.set('ti:ኣ', aa)
  const evidence = [...hits.entries()].sort((a, b) => b[1] - a[1]).slice(0, 8).map(([k, n]) => `${k}×${n}`)
  return { scores, evidence }
}

const LABEL: Record<string, keyof LangScores> = { am: 'amharic', amharic: 'amharic', ti: 'tigrinya', tigrinya: 'tigrinya', geez: 'geez', gez: 'geez', om: 'oromo', oromo: 'oromo', en: 'english', english: 'english' }

function verifyLanguage(labelRaw: string, text: string, secondary = '') {
  const label = LABEL[labelRaw.trim().toLowerCase()] || (labelRaw.trim().toLowerCase() as keyof LangScores)
  const { scores, evidence } = languageEvidence(text)
  const ranked = (Object.entries(scores) as [keyof LangScores, number][]).sort((a, b) => b[1] - a[1])
  const [topLang, top] = ranked[0]
  const labelScore = scores[label] ?? 0
  let detected: string = top >= 4 ? topLang : 'undetermined'
  // Amharic hymns routinely quote Ge'ez: treat Ge'ez + Amharic labels as compatible.
  const compatible = (a: string, b: string) => a === b || (['amharic', 'geez'].includes(a) && ['amharic', 'geez'].includes(b))
  let verdict: 'ok' | 'mismatch_confirmed' | 'mismatch_likely' | 'mixed' | 'undetermined'
  const secondaryScores = secondary ? languageEvidence(secondary).scores : null
  if (detected === 'undetermined') verdict = 'undetermined'
  else if (compatible(detected, label)) verdict = 'ok'
  // e.g. labeled English, sung text Amharic, with a full English translation alongside
  else if (secondaryScores && (secondaryScores[label] ?? 0) >= 8) { verdict = 'mixed'; detected = `${topLang}+${label}` }
  else if (top >= 8 && top >= 3 * Math.max(labelScore, 1)) verdict = 'mismatch_confirmed'
  else if (top >= 5 && top >= 1.8 * Math.max(labelScore, 1)) verdict = 'mismatch_likely'
  else { verdict = 'mixed'; detected = `${topLang}+${label}` }
  return { label, detected, verdict, scores, evidence }
}

// ---------------------------------------------------------------------------
// Text checks
// ---------------------------------------------------------------------------

const OTHER_SCRIPTS = /[\p{Script=Arabic}\p{Script=Cyrillic}\p{Script=Han}\p{Script=Hebrew}\p{Script=Devanagari}]/gu
const MOJIBAKE = /Ã.|â€|Â|\uFFFD|ï¿½/g
// eslint-disable-next-line no-control-regex -- intentionally detects control characters in imported text
const CONTROL = /[\u0000-\u0008\u000B\u000C\u000E-\u001F\u007F]/g
const OCR_WORDS: [RegExp, string][] = [
  [/አግዚአብሔር/g, 'አግዚአብሔር → እግዚአብሔር'], [/አመቤታችን|አመቤቴ/g, 'አመቤ… → እመቤ…'], [/ብርፃን/g, 'ብርፃን → ብርሃን'],
  [/አየሱስ/g, 'አየሱስ → ኢየሱስ'], [/(?<![\u1200-\u137F])አኔ(?![\u1200-\u137F])/g, 'አኔ → እኔ'], [/(?<![\u1200-\u137F])አንደ(?=\s)/g, 'አንደ → እንደ'],
  [/[\u1200-\u137F]\d+[\u1200-\u137F]|\d+(?=[\u1200-\u137F])/g, 'digit inside an Ethiopic word'],
  [/^\s*\d{1,3}\s*[.\])]\s*\S/gm, 'booklet line/hymn number'],
  [/\/\s*[ቄሪቁ]\s*\/?/g, 'corrupted repeat marker (/ቄ, /ሪ)'], [/[‹›«»]/g, 'stray guillemets'],
]
const IPA = /[\u00E4\u00EB\u00EF\u00F6\u00FC\u0259\u01DD\u010D\u0161\u017E\u00F1\u1E6D\u1E63\u1E0D\u1E25\u02BE\u02BF]|\u0308/g

function lineCount(t: string) {
  return t.split(/\r?\n/).filter((l) => l.trim()).length
}

// ---------------------------------------------------------------------------

const [input, outArg] = process.argv.slice(2)
if (!input) {
  console.error('Usage: npx tsx scripts/audit-mezmur-data-quality.ts <export.csv> [outDir]')
  process.exit(1)
}
const outDir = outArg || path.join(process.cwd(), 'reports', 'mezmur-data-quality')
fs.mkdirSync(outDir, { recursive: true })
const rows = parseCsv(fs.readFileSync(input, 'utf8'))

const issues: Record<string, unknown>[] = []
const langRows: Record<string, unknown>[] = []
const add = (r: Record<string, string>, issue: string, severity: 'high' | 'medium' | 'low', evidence: string, action: string) =>
  issues.push({
    import_id: r.import_id, mezmur_id: r.mezmur_id, slug: r.slug, title: r.title, title_amharic: r.title_amharic,
    status: r.status, deleted: r.deleted_at ? 'yes' : '', primary_language: r.primary_language,
    issue, severity, evidence: evidence.slice(0, 300), suggested_action: action,
  })

for (const r of rows) {
  const lyr = {
    amharic: r.lyrics_amharic || '', geez: r.lyrics_geez || '', english: r.lyrics_english || '', oromo: r.lyrics_oromo || '',
  }
  const all = Object.values(lyr).join('\n')
  const compact = all.replace(/\s+/g, '')
  const ethiopicLyrics = ETH.test(lyr.amharic + lyr.geez)

  // missing / insufficient
  if (!compact) {
    add(r, 'missing_lyrics', r.status === 'published' ? 'high' : 'medium', 'No text in lyrics_amharic, lyrics_geez, lyrics_english or lyrics_oromo.', 'Add lyrics from a verified source, or keep the record media-only.')
  } else if (compact.length < 60 || lineCount(all) < 3) {
    add(r, 'insufficient_lyrics', 'medium', `${lineCount(all)} line(s), ${compact.length} characters: "${all.trim().replace(/\s+/g, ' ').slice(0, 120)}"`, 'Check whether the lyrics were truncated or split from a longer hymn.')
  }

  // corrupted text
  const other = all.match(OTHER_SCRIPTS) || []
  const moj = all.match(MOJIBAKE) || []
  const ctl = all.match(CONTROL) || []
  if (other.length >= 3 || moj.length || ctl.length) {
    const parts = []
    if (other.length) parts.push(`${other.length} characters from another script (e.g. "${[...new Set(other)].slice(0, 6).join('')}")`)
    if (moj.length) parts.push(`${moj.length} encoding artefacts`)
    if (ctl.length) parts.push(`${ctl.length} control characters`)
    const share = other.length / Math.max(1, compact.length)
    add(r, 'corrupted_text', share > 0.3 || moj.length > 5 ? 'high' : 'medium', parts.join('; '), 'Re-import the lyrics from the original source; do not publish the corrupted text.')
  }

  // OCR / scan errors
  const ocr: string[] = []
  for (const [re, label] of OCR_WORDS) {
    const n = (all.match(re) || []).length
    if (n) ocr.push(`${label} ×${n}`)
  }
  if (ocr.length) {
    const weight = ocr.reduce((n, s) => n + Number(s.split('×').pop()), 0)
    add(r, 'scan_ocr_errors', weight >= 6 ? 'medium' : 'low', ocr.join('; '), 'Proof-read against the source booklet; correct only confirmed misreadings.')
  }
  const labels = (all.match(/^\s*(?:VERSE|CHORUS)\s*\d*\s*$/gim) || []).length
  if (labels) {
    add(r, 'generated_section_labels', 'low', `${labels} "VERSE n" / "CHORUS" label line(s) inside the lyrics`, 'Remove generated labels (they are not sung) or move them to display markup.')
  }
  if (/ት?ርጉም\s*[፡፣:\-–]/.test(lyr.amharic)) {
    const n = (lyr.amharic.match(/ት?ርጉም\s*[፡፣:\-–]/g) || []).length
    add(r, 'translation_mixed_into_lyrics', 'low', `${n} "ትርጉም፡-" (translation) line(s) inside lyrics_amharic`, 'Move Amharic translations of Ge\'ez verses to a separate field, or confirm they belong in the sung text.')
  }

  // transliteration readability
  const tr = r.lyrics_transliteration || ''
  if (ethiopicLyrics) {
    if (!tr.trim()) {
      add(r, 'transliteration_missing', 'low', 'Ethiopic lyrics have no transliteration.', 'Generate a transliteration using the project standard (MEZMUR_TRANSLITERATION_STANDARD.md).')
    } else {
      const eth = (tr.match(/[\u1200-\u137F]/g) || []).length
      const ipa = (tr.match(IPA) || []).length
      const ratio = lineCount(tr) / Math.max(1, lineCount(lyr.amharic + '\n' + lyr.geez))
      const probs: string[] = []
      if (eth) probs.push(`${eth} Ethiopic characters left in the transliteration`)
      if (ipa) probs.push(`${ipa} non-ASCII phonetic characters (ä ə č …)`)
      if (ratio < 0.5) probs.push(`covers ${Math.round(ratio * 100)}% of the lyric lines`)
      if (probs.length) add(r, 'transliteration_unreadable', eth > 20 || ratio < 0.3 ? 'medium' : 'low', probs.join('; '), 'Regenerate the transliteration from lyrics_amharic.')
    }
  }

  // language verification — on the sung text (Ethiopic lyrics when present); translations scored separately
  const sung = ethiopicLyrics ? `${lyr.amharic}\n${lyr.geez}` : `${lyr.english}\n${lyr.oromo}\n${lyr.amharic}`
  const translations = ethiopicLyrics ? `${lyr.english}\n${lyr.oromo}` : ''
  const lang = verifyLanguage(r.primary_language || '', sung, translations)
  langRows.push({
    import_id: r.import_id, mezmur_id: r.mezmur_id, slug: r.slug, title: r.title, status: r.status,
    labeled_language: r.primary_language, detected_language: lang.detected, verdict: lang.verdict,
    amharic_score: lang.scores.amharic, tigrinya_score: lang.scores.tigrinya, geez_score: lang.scores.geez,
    oromo_score: lang.scores.oromo, english_score: lang.scores.english, evidence: lang.evidence.join('; '),
    lyrics_start: all.trim().replace(/\s+/g, ' ').slice(0, 140),
  })
  if (compact && (lang.verdict === 'mismatch_confirmed' || lang.verdict === 'mismatch_likely')) {
    add(r, 'language_mismatch', lang.verdict === 'mismatch_confirmed' ? 'medium' : 'low',
      `labeled ${r.primary_language || '(blank)'}, lyrics read as ${lang.detected} (${lang.evidence.slice(0, 5).join(', ')})`,
      `Confirm with a reader of ${lang.detected}, then set primary_language accordingly (and move text to lyrics_oromo if Oromo).`)
  }
}

const issueCols = ['import_id', 'mezmur_id', 'slug', 'title', 'title_amharic', 'status', 'deleted', 'primary_language', 'issue', 'severity', 'evidence', 'suggested_action']
writeCsv(path.join(outDir, 'mezmur_data_quality_issues.csv'), issueCols, issues)
writeCsv(path.join(outDir, 'mezmur_language_verification.csv'),
  ['import_id', 'mezmur_id', 'slug', 'title', 'status', 'labeled_language', 'detected_language', 'verdict', 'amharic_score', 'tigrinya_score', 'geez_score', 'oromo_score', 'english_score', 'evidence', 'lyrics_start'],
  langRows)

const count = (list: Record<string, unknown>[], key: string) => {
  const m: Record<string, number> = {}
  for (const r of list) m[String(r[key])] = (m[String(r[key])] || 0) + 1
  return Object.fromEntries(Object.entries(m).sort((a, b) => b[1] - a[1]))
}
const byIssueSeverity: Record<string, Record<string, number>> = {}
for (const i of issues) {
  const k = String(i.issue)
  byIssueSeverity[k] ||= {}
  byIssueSeverity[k][String(i.severity)] = (byIssueSeverity[k][String(i.severity)] || 0) + 1
}
const summary = {
  input: path.basename(input),
  rows: rows.length,
  rowsWithIssues: new Set(issues.map((i) => i.import_id)).size,
  issues: count(issues, 'issue'),
  bySeverity: byIssueSeverity,
  languageVerdicts: count(langRows, 'verdict'),
  mismatchPairs: count(langRows.filter((r) => String(r.verdict).startsWith('mismatch')).map((r) => ({ k: `${r.labeled_language} → ${r.detected_language}` })), 'k'),
}
fs.writeFileSync(path.join(outDir, 'data_quality_summary.json'), JSON.stringify(summary, null, 2))
console.log(JSON.stringify(summary, null, 2))
