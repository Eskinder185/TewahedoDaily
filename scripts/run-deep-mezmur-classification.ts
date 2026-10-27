import fs from 'node:fs'
import path from 'node:path'

const root = process.cwd()
const outDir = path.join(root, 'reports', 'mezmur-classification')
fs.mkdirSync(outDir, { recursive: true })
const snapshot = JSON.parse(fs.readFileSync(path.join(root, 'reports/mezmur-quality-audit/PUBLIC_MEZMUR_SNAPSHOT.json'), 'utf8')) as Record<string, unknown>[]
function parseCsv(input: string): Record<string, string>[] { const rows: string[][] = []; let row: string[] = []; let cell = ''; let quoted = false; for (let i = 0; i < input.length; i++) { const c = input[i]; if (quoted && c === '"' && input[i + 1] === '"') { cell += '"'; i++; continue } if (c === '"') { quoted = !quoted; continue } if (!quoted && c === ',') { row.push(cell); cell = ''; continue } if (!quoted && (c === '\n' || c === '\r')) { if (c === '\r' && input[i + 1] === '\n') i++; row.push(cell); if (row.some(Boolean)) rows.push(row); row = []; cell = ''; continue } cell += c } if (cell || row.length) { row.push(cell); rows.push(row) } const [header = [], ...body] = rows; return body.map((cells) => Object.fromEntries(header.map((h, i) => [h.replace(/^\uFEFF/, ''), cells[i] || ''])) as Record<string, string>) }
const csv = (value: unknown) => { const s = String(value ?? ''); return /[",\r\n]/.test(s) ? `"${s.replaceAll('"', '""')}"` : s }
const write = (file: string, columns: string[], rows: Record<string, unknown>[]) => fs.writeFileSync(path.join(outDir, file), `${columns.join(',')}\n${rows.map((r) => columns.map((c) => csv(r[c])).join(',')).join('\n')}\n`)
const text = (v: unknown) => String(v ?? '').normalize('NFKC').trim()
const allLyrics = (r: Record<string, unknown>) => ['lyrics_amharic', 'lyrics_geez', 'lyrics_english', 'lyrics_oromo', 'lyrics_transliteration'].map((k) => text(r[k])).filter(Boolean).join('\n')
const current = parseCsv(fs.readFileSync(path.join(root, 'mezmur-research/exports/mezmurs_with_full_lyrics.csv'), 'utf8'))
const currentBySlug = new Map(current.map((r) => [r.slug, r]))
const sections = parseCsv(fs.readFileSync(path.join(root, 'mezmur_sections_final.csv'), 'utf8'))
const ownerIndexPath = 'C:/Users/eskew/.codex/attachments/0baaa7a6-9d88-4753-aeec-daf8543e3f2a/Pasted text.txt'
const ownerIndexText = fs.existsSync(ownerIndexPath) ? fs.readFileSync(ownerIndexPath, 'utf8') : ''
const ownerSectionRules: { marker: string; occasion: string; category: string }[] = [
  { marker: 'የAውደ ዓመት', occasion: 'New Year / Enkutatash', category: 'Praise / Worship' },
  { marker: 'የወርኃ ጽጌ', occasion: 'Annual Saint Feast', category: 'General' },
  { marker: 'የኅዳር ጽዮን', occasion: 'Annual Saint Feast', category: 'Saints' },
  { marker: 'የልደት Eና የጥምቀት', occasion: 'Gena', category: 'Jesus Christ' },
  { marker: 'የAስተርEዮ ማርያም', occasion: 'Filseta', category: 'Virgin Mary' },
  { marker: 'የሠርግ', occasion: 'Wedding', category: 'General' },
  { marker: 'የንስሓ', occasion: 'Holy Week', category: 'Repentance' },
  { marker: 'የሆሣEና', occasion: 'Hosanna', category: 'Jesus Christ' },
  { marker: 'የትንሣኤ', occasion: 'Tinsae', category: 'Jesus Christ' },
  { marker: 'የEርገት Eና የጰራቅሊጦስ', occasion: 'Erget', category: 'Jesus Christ' },
  { marker: 'የመላEክት', occasion: 'General / Anytime', category: 'Angels' },
  { marker: 'የቅዱሳን ጻድቃን', occasion: 'Annual Saint Feast', category: 'Saints' },
  { marker: 'የሰማEታት', occasion: 'Annual Saint Feast', category: 'Martyrs' },
  { marker: 'ለቤተክርስቲያን', occasion: 'General / Anytime', category: 'General' },
  { marker: 'የምስጋና', occasion: 'General / Anytime', category: 'Praise / Worship' },
  { marker: 'የሕጻናት', occasion: 'General / Anytime', category: 'General' },
  { marker: 'የደብረ ታቦር', occasion: 'Debre Tabor', category: 'Jesus Christ' },
]
const ownerReferenceRows: Record<string, unknown>[] = []
let ownerSection: { title: string; occasion: string; category: string } | null = null
for (const rawLine of ownerIndexText.split(/\r?\n/)) {
  const line = rawLine.trim()
  const rule = ownerSectionRules.find((candidate) => line.includes(candidate.marker) && line.includes('መዝሙራት'))
  if (rule) { ownerSection = { title: line, occasion: rule.occasion, category: rule.category }; continue }
  const match = line.match(/^\s*(\d+)\.?\s+(.+?)\s*$/)
  if (!ownerSection || !match) continue
  const rawTitle = match[2].trim()
  if (!rawTitle || /^(?:ተክለሳዊሮስ|¾?SekM|[-–—])/.test(rawTitle)) continue
  const uncertain = /[�ÃÂ]|SekM|T>"|\u009d/.test(rawTitle)
  ownerReferenceRows.push({ reference_section: ownerSection.title, reference_number: match[1], raw_title: rawTitle, canonical_occasion: ownerSection.occasion, canonical_category: ownerSection.category, raw_quality: uncertain ? 'corrupted_or_uncertain' : 'usable_candidate', reference_status: 'owner_supplied_supporting_index' })
}
const normalizeTitleKey = (value: unknown) => text(value).toLocaleLowerCase().replace(/[\u0000-\u001f]/g, '').replace(/[\[\]{}()'".,:;!?/\\|_-]+/g, ' ').replace(/\s+/g, ' ').trim()
const ownerByTitle = new Map<string, Record<string, unknown>[]>()
for (const reference of ownerReferenceRows) {
  if (reference.raw_quality !== 'usable_candidate') continue
  const key = normalizeTitleKey(reference.raw_title)
  if (!key) continue
  const matches = ownerByTitle.get(key) || []
  matches.push(reference)
  ownerByTitle.set(key, matches)
}
const cueRules: { category: string; cues: RegExp[]; label: string }[] = [
  { category: 'Virgin Mary', cues: [/ማርያም/gi, /ቅድስት ድንግል/gi, /mariam|maryam|virgin mary|emebet/gi], label: 'repeated Marian terms' },
  { category: 'Jesus Christ', cues: [/ኢየሱስ|ክርስቶስ|መድኃኒዓለም/gi, /jesus|christ|medhanialem/gi], label: 'repeated Christological terms' },
  { category: 'Holy Trinity', cues: [/ሥላሴ/gi, /trinity|selassie/gi], label: 'Trinity terms' },
  { category: 'Holy Spirit', cues: [/መንፈስ ቅዱስ/gi, /holy spirit|menfes qidus/gi], label: 'Holy Spirit terms' },
  { category: 'Cross', cues: [/መስቀል/gi, /cross|meskel/gi], label: 'Cross terms' },
  { category: 'Repentance', cues: [/ንስሐ|ኃጢአት|ምሕረት/gi, /repent|sin|mercy|tesfa/gi], label: 'repentance/confession terms' },
  { category: 'Prayer', cues: [/ጸሎት|ለምነን/gi, /prayer|pray|please hear/gi], label: 'prayer terms' },
  { category: 'Praise / Worship', cues: [/ስብሐት|እናመስግን|አመሰግናለሁ/gi, /praise|worship|hallelujah/gi], label: 'praise/worship terms' },
  { category: 'Angels', cues: [/መላእክት|ሚካኤል|ገብርኤል/gi, /angel|michael|gabriel/gi], label: 'angel or archangel terms' },
  { category: 'Martyrs', cues: [/ሰማዕታት/gi, /martyr/gi], label: 'martyr terms' },
  { category: 'Saints', cues: [/ቅዱሳን/gi, /saint|qidus/gi], label: 'saint terms' },
]
const occasionRules: { occasion: string; cues: RegExp[]; label: string }[] = [
  { occasion: 'Meskel', cues: [/መስቀል/gi, /meskel|cross/gi], label: 'Meskel/Cross terms' },
  { occasion: 'Gena', cues: [/ልደት|ቤተልሔም/gi, /gena|christmas|nativity|bethlehem/gi], label: 'Nativity terms' },
  { occasion: 'Timket', cues: [/ጥምቀት/gi, /timket|epiphany|baptism/gi], label: 'Epiphany/Baptism terms' },
  { occasion: 'Tinsae', cues: [/ትንሣኤ|ትንሳኤ/gi, /resurrection|tinsae|pascha/gi], label: 'Resurrection terms' },
  { occasion: 'Hosanna', cues: [/ሆሳዕና/gi, /hosanna|palm sunday/gi], label: 'Hosanna terms' },
  { occasion: 'Erget', cues: [/ዕርገት/gi, /ascension|erget/gi], label: 'Ascension terms' },
  { occasion: 'Pentecost', cues: [/ጰንጠቆስጤ/gi, /pentecost/gi], label: 'Pentecost terms' },
  { occasion: 'Wedding', cues: [/ሰርግ|ጋብቻ/gi, /wedding|marriage/gi], label: 'Wedding terms' },
  { occasion: 'Kidane Mihret', cues: [/ኪዳነ ምሕረት/gi, /kidane mihret/gi], label: 'Kidane Mihret terms' },
]
const count = (source: string, rule: RegExp) => [...source.matchAll(new RegExp(rule.source, rule.flags.replace('g', '') + 'g'))].length
const proposals: Record<string, unknown>[] = []
for (const row of snapshot) {
  const lyrics = allLyrics(row)
  const currentRow = currentBySlug.get(text(row.slug))
  const categoryScores = cueRules.map((rule) => ({ ...rule, hits: rule.cues.reduce((n, cue) => n + count(lyrics, cue), 0) })).filter((x) => x.hits > 0).sort((a, b) => b.hits - a.hits)
  const occasionScores = occasionRules.map((rule) => ({ ...rule, hits: rule.cues.reduce((n, cue) => n + count(lyrics, cue), 0) })).filter((x) => x.hits > 0).sort((a, b) => b.hits - a.hits)
  const primary = categoryScores[0]
  const occasion = occasionScores[0]
  const complete = lyrics.length >= 120
  const confidence = primary && complete && primary.hits >= 3 ? 'medium' : primary && complete ? 'low' : 'low'
  const evidence = primary ? `${primary.label}; ${primary.hits} cue hits across all available lyric fields.` : 'No reliable canonical cue found in the available lyric fields.'
  proposals.push({ import_id: '', public_record_key: text(row.mezmur_id) || `slug:${text(row.slug)}`, title: text(row.title_amharic) || text(row.title), current_category: currentRow?.category || '', current_occasion: currentRow?.primary_occasion || '', proposed_primary_category: primary?.category || 'General', proposed_additional_categories: categoryScores.slice(1, 3).map((x) => x.category).join('|'), proposed_occasions: occasion?.occasion || 'General / Anytime', proposed_sections: '', lyrics_evidence: evidence, reference_index_evidence: ownerReferenceRows.length ? `Owner index parsed (${ownerReferenceRows.length} numbered entries); no exact identity match was asserted.` : 'No supplied traditional hymn-index attachment was available; existing section catalog only.', confidence, change_reason: 'Lyrics-based triage proposal; requires theological/editorial review.', review_status: 'identity_pending_and_manual_review', lyric_length: lyrics.length, status: text(row.status) })
}
const columns = ['import_id', 'public_record_key', 'title', 'current_category', 'current_occasion', 'proposed_primary_category', 'proposed_additional_categories', 'proposed_occasions', 'proposed_sections', 'lyrics_evidence', 'reference_index_evidence', 'confidence', 'change_reason', 'review_status', 'lyric_length', 'status']
write('MEZMUR_CLASSIFICATION_PROPOSALS.csv', columns, proposals)
write('HIGH_CONFIDENCE_CLASSIFICATIONS.csv', columns, [])
write('MANUAL_REVIEW_REQUIRED.csv', columns, proposals)
write('PROPOSED_NEW_SECTIONS.csv', ['section_slug', 'title', 'reason', 'status'], [])
write('REFERENCE_HYMN_SECTION_INDEX.csv', ['reference_section', 'reference_number', 'raw_title', 'canonical_occasion', 'canonical_category', 'raw_quality', 'reference_status'], ownerReferenceRows)
const audit = `# Deep Mezmur classification audit\n\n- Accessible public snapshot analyzed: **${snapshot.length}** records.\n- Records with non-empty lyrics across supported fields: **${proposals.filter((p) => Number(p.lyric_length) > 0).length}**.\n- Records with complete-length lyrics (>=120 normalized characters): **${proposals.filter((p) => Number(p.lyric_length) >= 120).length}**.\n- High-confidence database-ready classifications: **0**.\n- Medium/low triage proposals requiring review: **${proposals.length}**.\n- Immutable import_id available in the public projection: **0**; proposals are identity-pending and no SQL updates were generated.\n- Supplied owner hymn-index entries parsed: **${ownerReferenceRows.length}** (raw/corrupted entries retained; none treated as identity proof). Existing site section metadata contains **${sections.length}** rows.\n\nThe proposals inspect all available lyric fields and use repeated cue evidence only to prioritize human review. They do not claim theological verification, do not alter content, and do not treat title-only matches as sufficient.\n`
fs.writeFileSync(path.join(outDir, 'MEZMUR_CLASSIFICATION_AUDIT.md'), audit)
fs.writeFileSync(path.join(outDir, 'CLASSIFICATION_CHANGESET.sql'), `-- Review-only classification changeset. No executable changes are generated because import_id is not exposed by the public snapshot.\n-- The owner-supplied index is supporting evidence only; raw/corrupted titles are not identity matches.\n-- Obtain authorized import_id values, review every proposal, then use the existing UUID-safe classification RPC with exact current-value preconditions.\n-- This file intentionally contains no INSERT, UPDATE, DELETE, publication, or status changes.\n`)
fs.writeFileSync(path.join(outDir, 'CLASSIFICATION_VALIDATION_REPORT.md'), `# Classification validation\n\nRepresentative language and theme coverage was generated from all supported lyric fields. The owner-supplied index was parsed as supporting reference material (${ownerReferenceRows.length} numbered entries); raw/corrupted entries remain unchanged and no title-only identity match was asserted. Because no private import_id export was provided, no proposal is marked high-confidence or production-ready. Existing classification relationships, lyrics, titles, recordings, statuses, Zemari links, and calendar relationships were not changed.\n\nRun editorial sampling across Marian, Christological, saint, martyr, Cross, repentance, feast, English, Oromo, Geʽez, Amharic, and transliterated rows before approving any classification changes.\n`)
console.log(JSON.stringify({ analyzed: proposals.length, with_lyrics: proposals.filter((p) => Number(p.lyric_length) > 0).length, complete_lyrics: proposals.filter((p) => Number(p.lyric_length) >= 120).length, high_confidence: 0, manual_review: proposals.length }, null, 2))
