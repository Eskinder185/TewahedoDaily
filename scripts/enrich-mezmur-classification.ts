import fs from 'node:fs'
import path from 'node:path'

const root = process.cwd()
const dir = path.join(root, 'reports', 'mezmur-classification')
const snapshot = JSON.parse(fs.readFileSync(path.join(root, 'reports/mezmur-quality-audit/PUBLIC_MEZMUR_SNAPSHOT.json'), 'utf8')) as Record<string, unknown>[]
const parseCsv = (input: string) => {
  const rows: string[][] = []; let row: string[] = []; let cell = ''; let quoted = false
  for (let i = 0; i < input.length; i++) { const c = input[i]; if (quoted && c === '"' && input[i + 1] === '"') { cell += '"'; i++; continue } if (c === '"') { quoted = !quoted; continue } if (!quoted && c === ',') { row.push(cell); cell = ''; continue } if (!quoted && (c === '\n' || c === '\r')) { if (c === '\r' && input[i + 1] === '\n') i++; row.push(cell); if (row.some(Boolean)) rows.push(row); row = []; cell = ''; continue } cell += c } if (cell || row.length) { row.push(cell); rows.push(row) }
  const [header = [], ...body] = rows; return body.map((cells) => Object.fromEntries(header.map((h, i) => [h.replace(/^\uFEFF/, ''), cells[i] || '']))) as Record<string, string>[]
}
const csv = (v: unknown) => { const s = String(v ?? ''); return /[",\r\n]/.test(s) ? `"${s.replaceAll('"', '""')}"` : s }
const source = parseCsv(fs.readFileSync(path.join(dir, 'MEZMUR_CLASSIFICATION_PROPOSALS.csv'), 'utf8'))
const write = (name: string, rows: Record<string, unknown>[]) => { const columns = [...new Set(rows.flatMap((r) => Object.keys(r)))]; fs.writeFileSync(path.join(dir, name), `${columns.join(',')}\n${rows.map((r) => columns.map((c) => csv(r[c])).join(',')).join('\n')}\n`) }
const normalized = (r: Record<string, unknown>) => ['lyrics_amharic', 'lyrics_geez', 'lyrics_english', 'lyrics_oromo', 'lyrics_transliteration'].map((k) => String(r[k] ?? '').normalize('NFKC').trim()).filter(Boolean).join('\n')
const categoryCues: [string, RegExp[]][] = [
  ['Jesus Christ', [/ኢየሱስ|ክርስቶስ|መድኃኒዓለም/gi, /jesus|christ|medhanialem/gi]],
  ['Virgin Mary', [/ማርያም|ቅድስት ድንግል/gi, /mariam|maryam|virgin mary/gi]],
  ['Holy Trinity', [/ሥላሴ/gi, /trinity|selassie/gi]],
  ['Holy Spirit', [/መንፈስ ቅዱስ/gi, /holy spirit|menfes qidus/gi]],
  ['Cross', [/መስቀል/gi, /cross|meskel/gi]],
  ['Angels', [/መላእክት|ሚካኤል|ገብርኤል/gi, /angel|michael|gabriel/gi]],
  ['Martyrs', [/ሰማዕታት/gi, /martyr/gi]],
  ['Saints', [/ቅዱሳን/gi, /saint|qidus/gi]],
  ['Repentance', [/ንስሐ|ኃጢአት|ምሕረት/gi, /repent|sin|mercy/gi]],
  ['Praise / Worship', [/ስብሐት|እናመስግን|አመሰግናለሁ/gi, /praise|worship|hallelujah/gi]],
]
const occasionCues: [string, RegExp[]][] = [
  ['Meskel', [/መስቀል/gi, /meskel|cross/gi]], ['Gena', [/ልደት|ቤተልሔም/gi, /gena|christmas|nativity/gi]], ['Timket', [/ጥምቀት/gi, /timket|epiphany|baptism/gi]], ['Tinsae', [/ትንሣኤ|ትንሳኤ/gi, /resurrection|tinsae|pascha/gi]], ['Hosanna', [/ሆሳዕና/gi, /hosanna|palm sunday/gi]], ['Erget', [/ዕርገት/gi, /ascension|erget/gi]], ['Pentecost', [/ጰንጠቆስጤ/gi, /pentecost/gi]], ['Wedding', [/ሰርግ|ጋብቻ/gi, /wedding|marriage/gi]],
]
const count = (s: string, r: RegExp) => (s.match(new RegExp(r.source, r.flags.replace('g', '') + 'g')) || []).length
const byKey = new Map(snapshot.map((r) => [String(r.mezmur_id || r.slug || ''), r]))
const enriched = source.map((proposal) => {
  const row = byKey.get(proposal.public_record_key) || {}
  const lyrics = normalized(row); const length = Number(proposal.lyric_length || lyrics.length)
  const scores = categoryCues.map(([category, cues]) => [category, cues.reduce((n, cue) => n + count(lyrics, cue), 0)] as const).filter(([, hits]) => hits > 0).sort((a, b) => b[1] - a[1])
  const occasionScores = occasionCues.map(([occasion, cues]) => [occasion, cues.reduce((n, cue) => n + count(lyrics, cue), 0)] as const).filter(([, hits]) => hits > 0).sort((a, b) => b[1] - a[1])
  const top = scores[0]; const second = scores[1]?.[1] || 0; const strong = Boolean(top && length >= 120 && top[1] >= 3 && top[1] - second >= 2)
  const sufficient = length >= 120
  const group = !sufficient ? 'insufficient_content' : strong ? 'classification_ready_identity_unresolved' : 'classification_requires_expert_review'
  const proposedAdditional = scores.slice(1, 3).filter(([, hits]) => hits >= 2 && hits >= (top?.[1] || 0) - 1).map(([category]) => category).join('|')
  const occasion = occasionScores[0]; const occasionSupported = Boolean(occasion && length >= 120 && occasion[1] >= 2 && occasion[1] - (occasionScores[1]?.[1] || 0) >= 1)
  return { ...proposal, proposed_primary_category: top?.[0] || 'General', proposed_additional_categories: proposedAdditional, proposed_occasions: occasionSupported ? occasion[0] : '', proposed_subcategory: '', classification_group: group, confidence: strong ? 'medium' : sufficient ? 'low' : 'insufficient', evidence_conflict: '', change_reason: group === 'classification_ready_identity_unresolved' ? 'Supported lyric evidence; immutable production identity still requires authorized export.' : group === 'insufficient_content' ? 'Lyrics are absent or too short for safe classification.' : 'Lyrics are ambiguous or conflicting; requires theological/editorial review.', review_status: group === 'classification_ready_identity_unresolved' ? 'classification_supported_identity_pending' : group }
})
write('MEZMUR_CLASSIFICATION_PROPOSALS.csv', enriched)
write('CLASSIFICATION_READY_IDENTITY_UNRESOLVED.csv', enriched.filter((r) => r.classification_group === 'classification_ready_identity_unresolved'))
write('MANUAL_REVIEW_REQUIRED.csv', enriched.filter((r) => r.classification_group === 'classification_requires_expert_review'))
write('INSUFFICIENT_CONTENT.csv', enriched.filter((r) => r.classification_group === 'insufficient_content'))
const supportedOccasions = enriched.filter((r) => String(r.proposed_occasions || '')).length
const supportedCategories = enriched.filter((r) => String(r.proposed_primary_category || '') !== 'General').length
const ready = enriched.filter((r) => r.classification_group === 'classification_ready_identity_unresolved').length
const insufficient = enriched.filter((r) => r.classification_group === 'insufficient_content').length
const expert = enriched.length - ready - insufficient
fs.writeFileSync(path.join(dir, 'CLASSIFICATION_RESULTS.md'), `# Classification results\n\n- Total analyzed: **${enriched.length}**\n- Supported primary categories (lyrics evidence): **${supportedCategories}**\n- Supported occasions (direct cue evidence): **${supportedOccasions}**\n- Supported subcategories: **0** (the deployed taxonomy exposes categories/occasions, not a separate subcategory field)\n- Unique production identities available in the public snapshot: **0**\n- Classification-ready but identity unresolved: **${ready}**\n- Genuine expert-review cases: **${expert}**\n- Insufficient content: **${insufficient}**\n- Verified production updates: **0** (no immutable import_id export has been loaded)\n\nA supported classification is a triage result from complete lyrics with a dominant canonical cue; it is not theological approval. Direct occasion cues are retained separately and are not inferred from general theological similarity.\n`)
fs.writeFileSync(path.join(dir, 'MEZMUR_CLASSIFICATION_AUDIT.md'), `# Deep Mezmur classification audit\n\n- Accessible public snapshot analyzed: **${enriched.length}** records.\n- Records with non-empty lyrics: **${enriched.filter((r) => Number(r.lyric_length) > 0).length}**.\n- Records with complete-length lyrics (>=120 normalized characters): **${enriched.filter((r) => Number(r.lyric_length) >= 120).length}**.\n- Supported primary categories from dominant lyric cues: **${supportedCategories}**.\n- Directly supported occasions: **${supportedOccasions}**.\n- Classification-ready but identity unresolved: **${ready}**.\n- Genuine theological/editorial review: **${expert}**.\n- Insufficient content: **${insufficient}**.\n- Verified production updates: **0**; public projection exposes no immutable import_id.\n\nThe first pass placed all rows in review because it conflated missing database identity with theological uncertainty. This pass separates those concerns. Identity remains unresolved until the authorized private export is supplied. Lyrics-only cues are evidence triage, not theological approval; title-only matches and corrupted index entries are never sufficient.\n`)
const sampleCategories = ['Jesus Christ', 'Virgin Mary', 'Holy Trinity', 'Holy Spirit', 'Cross', 'Angels', 'Saints', 'Martyrs', 'Repentance']
const sampleLines = sampleCategories.map((category) => {
  const rows = enriched.filter((r) => r.proposed_primary_category === category && r.classification_group === 'classification_ready_identity_unresolved').slice(0, 3)
  return `## ${category}\n\n- Evidence-supported rows: **${enriched.filter((r) => r.proposed_primary_category === category && r.classification_group === 'classification_ready_identity_unresolved').length}**\n- Samples: ${rows.length ? rows.map((r) => `${r.title} (${r.lyric_length} chars)`).join('; ') : 'none'}\n`
}).join('\n')
fs.writeFileSync(path.join(dir, 'CLASSIFICATION_SAMPLE_EVALUATION.md'), `# Representative classifier evaluation\n\nThe samples below are evidence triage only. They are not expert theological approval and do not authorize database writes.\n\n${sampleLines}`)
console.log(JSON.stringify({ analyzed: enriched.length, supported_categories: supportedCategories, supported_occasions: supportedOccasions, ready_identity_unresolved: ready, expert_review: expert, insufficient_content: insufficient }, null, 2))
