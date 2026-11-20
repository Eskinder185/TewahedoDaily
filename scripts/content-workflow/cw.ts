/**
 * Church content workflow CLI. Run: npm run cw -- <command> [options]   (see README.md in this folder)
 *
 * Received → Processed → Needs review → Approved → Published. This tool prepares and tracks; it never sends, posts or
 * publishes anything. "mark-published" only records that a person published an approved version somewhere.
 */
import { spawnSync } from 'node:child_process'
import fs from 'node:fs'
import path from 'node:path'
import {
  DRAFT_TYPES, Store, applyGlossary, approvalBlockers, buildReviewRows, computeStatus, draftHash, findReferences, mergeChunks, now, openRows,
  paragraphsToSegments, parseDraft, renderChannelText, renderPreviewHtml, renderReviewHtml, scriptureMatches, segmentLabel, sha256, signalFlags, slugId, timeLabel,
  validateDraft, type Approval, type Decisions, type DraftType, type DraftVersion, type GlossaryEntry, type Item, type Kind, type PermissionStatus, type Publication,
  type ReviewRow, type ScriptureCheck, type SegmentVersion,
} from './lib.ts'

const HERE = path.dirname(new URL(import.meta.url).pathname.replace(/^\/([A-Za-z]:)/, '$1'))
const ROOT = path.resolve(process.env.CONTENT_WORKFLOW_DATA || 'content-workflow-data')
const GLOSSARY = process.env.CONTENT_WORKFLOW_GLOSSARY || path.join(HERE, 'glossary.json')
const PYTHON = process.env.CONTENT_WORKFLOW_PYTHON || 'C:/Users/eskew/github/tanscibe/.venv/Scripts/python.exe'
const store = new Store(ROOT)

/* ------------------------------------------------------------------ arguments */
const [command = 'help', ...rest] = process.argv.slice(2)
const flags: Record<string, string> = {}
const positional: string[] = []
for (let i = 0; i < rest.length; i++) {
  if (rest[i].startsWith('--')) { const key = rest[i].slice(2); const value = rest[i + 1] && !rest[i + 1].startsWith('--') ? rest[++i] : 'true'; flags[key] = value } else positional.push(rest[i])
}
const need = (name: string) => { if (!flags[name] || flags[name] === 'true') fail(`Missing --${name}`); return flags[name] }
function fail(message: string): never { console.error(`error: ${message}`); process.exit(1) }
const itemId = () => positional[0] ?? fail('Give the item id (see: status)')

const loadGlossary = (): GlossaryEntry[] => (fs.existsSync(GLOSSARY) ? (JSON.parse(fs.readFileSync(GLOSSARY, 'utf8')).entries as GlossaryEntry[]) : [])
const sourceArtifact = (item: Item) => (item.kind === 'recording' ? 'transcript' : 'text')
const latestSource = (id: string, item: Item) => store.latest<SegmentVersion>(id, sourceArtifact(item))
const latestDrafts = (id: string) => DRAFT_TYPES.map(type => store.latest<DraftVersion>(id, `draft.${type}`)).filter((draft): draft is DraftVersion => Boolean(draft))
const statusOf = (id: string) => {
  const item = store.item(id)
  return computeStatus({
    hasProcessed: Boolean(latestSource(id, item)), hasReview: fs.existsSync(path.join(store.dir(id), 'review', 'rows.json')), drafts: latestDrafts(id),
    approvals: store.readJson<Approval[]>(id, 'approvals.json', []), publications: store.readJson<Publication[]>(id, 'publications.json', []),
  })
}

/* ------------------------------------------------------------------ scripture (site Bible, read-only) */
async function verifyReference(reference: string): Promise<ScriptureCheck['editions']> {
  if (!process.env.VITE_SUPABASE_URL) fail('Scripture checks read the site Bible. Run with the site environment: npm run cw -- … (it loads .env.local)')
  const { searchBibleReference } = await import('../../src/lib/bible/bibleSearch.ts')
  const { parseBibleReference } = await import('../../src/lib/bible/parseBibleReference.ts')
  const parsed = parseBibleReference(reference)
  const editions: ScriptureCheck['editions'] = []
  for (const [edition, language] of [['web', 'en'], ['am', 'am']] as const) {
    try {
      const result = await searchBibleReference(parsed, { language })
      const verses = result.results.filter(row => row.sourceType === 'bible-verse' && String(row.route).includes(`edition=${edition}`))
      if (verses.length) editions.push({ edition, found: true, title: verses.length > 1 ? `${verses[0].title}–${String(verses[verses.length - 1].title).split(':').pop()}` : String(verses[0].title), text: verses.map(row => row.excerpt ?? '').join(' '), route: String(verses[0].route), message: '' })
      else editions.push({ edition, found: false, title: '', text: '', route: '', message: result.intentMessage || 'no verse found for this reference' })
    } catch (error) {
      editions.push({ edition, found: false, title: '', text: '', route: '', message: `lookup failed: ${error instanceof Error ? error.message : String(error)}` })
    }
  }
  return editions
}

/* ------------------------------------------------------------------ commands */
const commands: Record<string, () => Promise<void> | void> = {
  help() {
    console.log(fs.readFileSync(path.join(HERE, 'README.md'), 'utf8').split('## Commands')[1]?.split('\n## ')[0] ?? 'See scripts/content-workflow/README.md')
  },

  intake() {
    const kind = need('kind') as Kind
    if (!['recording', 'teaching', 'event', 'notice', 'bilingual'].includes(kind)) fail('--kind must be recording, teaching, event, notice or bilingual')
    const file = path.resolve(need('file'))
    if (!fs.existsSync(file)) fail(`No file at ${file}`)
    const permission = (flags.permission || 'unconfirmed') as PermissionStatus
    if (!['confirmed', 'unconfirmed', 'denied'].includes(permission)) fail('--permission must be confirmed, unconfirmed or denied')
    if (permission === 'confirmed' && (!flags['permission-note'] || !flags['recorded-by'])) fail('A confirmed permission needs --permission-note (who allowed what) and --recorded-by (who is recording this)')
    const language = (flags.language || 'am') as Item['source']['language']
    if (!['am', 'en', 'am+en'].includes(language)) fail('--language must be am, en or am+en')
    const title = need('title')
    const id = slugId(title, flags.date || null, candidate => store.exists(candidate))
    const bytes = fs.statSync(file).size
    const item: Item = {
      id, kind, title, sample: flags.sample === 'true',
      source: {
        path: file, sha256: sha256(fs.readFileSync(file)), bytes, speaker: flags.speaker || null, date: flags.date || null, audience: flags.audience || null, language,
        permission: { status: permission, note: flags['permission-note'] || '', recordedBy: flags['recorded-by'] || null, recordedAt: now() },
        channels: (flags.channels || '').split(',').map(channel => channel.trim().toLowerCase()).filter(Boolean),
      },
      createdAt: now(),
    }
    store.writeJson(id, 'item.json', item)
    store.log(id, 'received', { kind, file: path.basename(file), bytes, permission, sample: item.sample })
    console.log(`Received: ${id}\n  state: received · permission: ${permission} · channels: ${item.source.channels.join(', ') || 'none recorded'}`)
    console.log(kind === 'recording' ? `  next: npm run cw -- transcribe ${id} --translate` : `  next: npm run cw -- extract ${id}`)
  },

  extract() {
    const id = itemId(); const item = store.item(id)
    if (item.kind === 'recording') fail('This item is a recording. Use: transcribe')
    if (!/\.(txt|md)$/i.test(item.source.path || '')) fail('Written sources must be plain text or Markdown (.txt, .md). Convert other formats first.')
    const segments = paragraphsToSegments(fs.readFileSync(item.source.path!, 'utf8'))
    if (!segments.length) fail('The source file has no text')
    const version = store.addVersion(id, 'text', { basedOn: null, createdBy: 'extract', note: 'paragraphs of the source file, unchanged', segments, corrections: [] })
    store.log(id, 'processed', { artifact: 'text', version, segments: segments.length })
    console.log(`Extracted ${segments.length} passages (text v${version}). next: npm run cw -- scripture ${id}`)
  },

  transcribe() {
    const id = itemId(); const item = store.item(id)
    if (item.kind !== 'recording') fail('Only recordings are transcribed. Use: extract')
    if (item.source.permission.status === 'denied') fail('Permission for this recording is recorded as denied; it will not be processed.')
    if (!fs.existsSync(item.source.path!)) fail(`The recording is no longer at ${item.source.path}`)
    if (!fs.existsSync(PYTHON)) fail(`No Python with faster-whisper at ${PYTHON}. Set CONTENT_WORKFLOW_PYTHON (see README).`)
    const out = path.join(store.dir(id), 'speech')
    const args = [path.join(HERE, 'transcribe.py'), '--audio', item.source.path!, '--out', out, '--model', flags.model || 'large-v3', '--chunk-seconds', flags['chunk-seconds'] || '300', '--language', item.source.language === 'en' ? 'en' : 'am']
    if (flags.translate === 'true' && item.source.language !== 'en') args.push('--translate')
    if (flags['max-chunks']) args.push('--max-chunks', flags['max-chunks'])
    store.log(id, 'transcribe-started', { model: flags.model || 'large-v3' })
    const run = spawnSync(PYTHON, args, { stdio: 'inherit', env: { ...process.env, PYTHONIOENCODING: 'utf-8' } })
    if (run.status === 3) { store.log(id, 'transcribe-paused', {}); console.log(`Paused. Run the same command again to continue: npm run cw -- transcribe ${id}${flags.translate ? ' --translate' : ''}`); return }
    if (run.status !== 0) { store.log(id, 'transcribe-failed', { exit: run.status }); fail(`Transcription stopped (exit ${run.status}). Completed chunks are kept; run the same command again to resume.`) }
    const meta = JSON.parse(fs.readFileSync(path.join(out, 'meta.json'), 'utf8'))
    const chunks = fs.readdirSync(out).filter(name => /^chunk-\d+\.json$/.test(name)).map(name => JSON.parse(fs.readFileSync(path.join(out, name), 'utf8')))
    if (chunks.length !== meta.chunks) fail(`Only ${chunks.length} of ${meta.chunks} chunks are complete. Run the command again to resume.`)
    const merged = mergeChunks(chunks)
    const tool = `faster-whisper ${meta.model} (${meta.device}), local`
    const version = store.addVersion(id, 'transcript', { basedOn: null, createdBy: tool, note: 'raw machine transcript; nothing edited', segments: merged.transcript, corrections: [] })
    if (merged.translation.length) store.addVersion(id, 'translation', { basedOn: version, createdBy: `${tool}, Whisper translate pass`, note: 'machine translation, unreviewed', segments: merged.translation, corrections: [] })
    store.log(id, 'processed', { artifact: 'transcript', version, segments: merged.transcript.length, translated: merged.translation.length, durationSeconds: meta.durationSeconds, translationErrors: merged.translationErrors })
    const flagged = merged.transcript.filter(segment => signalFlags(segment.signals).length).length
    console.log(`Transcript v${version}: ${merged.transcript.length} segments over ${timeLabel(meta.durationSeconds)}; ${flagged} flagged to listen again; ${merged.translation.length} machine-translated segments.`)
    if (merged.translationErrors.length) console.log(`Translation failed for: ${merged.translationErrors.join('; ')}`)
    console.log(`next: npm run cw -- glossary-apply ${id}   then: npm run cw -- packet ${id}`)
  },

  'glossary-apply'() {
    const id = itemId(); const item = store.item(id)
    const current = latestSource(id, item) ?? fail('Nothing to correct yet. Transcribe or extract first.')
    const result = applyGlossary(current.segments, loadGlossary(), 'approved glossary')
    if (!result.corrections.length) { console.log('No approved glossary entry matched. Nothing changed.'); return }
    const version = store.addVersion(id, sourceArtifact(item), { basedOn: current.version, createdBy: 'glossary-apply', note: `${result.corrections.length} glossary correction(s)`, segments: result.segments, corrections: [...current.corrections, ...result.corrections] })
    console.log(`${sourceArtifact(item)} v${version}: ${result.corrections.length} correction(s), each traceable to its segment:`)
    for (const correction of result.corrections) console.log(`  ${correction.segment}: "${correction.from}" → "${correction.to}" (${correction.reason})`)
  },

  correct() {
    const id = itemId(); const item = store.item(id)
    const current = latestSource(id, item) ?? fail('Nothing to correct yet.')
    const segment = current.segments.find(row => row.id === need('segment')) ?? fail(`No segment ${flags.segment}`)
    const text = need('text'); const by = need('by')
    if (text === segment.text) fail('The text is unchanged')
    const version = store.addVersion(id, sourceArtifact(item), {
      basedOn: current.version, createdBy: by, note: flags.note || `manual correction of ${segment.id}`,
      segments: current.segments.map(row => (row.id === segment.id ? { ...row, text } : row)),
      corrections: [...current.corrections, { segment: segment.id, from: segment.text, to: text, reason: flags.note || 'manual correction', by }],
    })
    console.log(`${sourceArtifact(item)} v${version}: ${segmentLabel(segment)} corrected by ${by}. The earlier version is kept.`)
  },

  async scripture() {
    const id = itemId(); const item = store.item(id)
    const source = latestSource(id, item)
    const translation = store.latest<SegmentVersion>(id, 'translation')
    const places: Array<[string, string]> = []
    for (const segment of source?.segments ?? []) for (const reference of findReferences(segment.text)) places.push([reference, segmentLabel(segment)])
    for (const segment of translation?.segments ?? []) for (const reference of findReferences(segment.text)) places.push([reference, `translation ${segmentLabel(segment)}`])
    for (const draft of latestDrafts(id)) for (const block of draft.blocks) {
      if (block.kind === 'scripture' && block.scripture) places.push([block.scripture.replace(/\s*\[.*\]$/, ''), `${draft.type} draft block ${block.index}`])
      else for (const reference of findReferences(block.text)) places.push([reference, `${draft.type} draft block ${block.index}`])
    }
    for (const extra of (flags.add || '').split(';').map(value => value.trim()).filter(Boolean)) places.push([extra, 'added by reviewer'])
    const unique = new Map<string, string[]>()
    for (const [reference, where] of places) unique.set(reference, [...(unique.get(reference) ?? []), where])
    const checks: ScriptureCheck[] = []
    for (const [reference, where] of unique) checks.push({ reference, where: [...new Set(where)].join('; '), editions: await verifyReference(reference) })
    store.writeJson(id, 'scripture.json', { checkedAt: now(), against: 'site Bible: English WEB and Amharic editions (read-only lookup)', checks })
    store.log(id, 'scripture-checked', { references: checks.length, notFound: checks.filter(check => check.editions.some(edition => !edition.found)).length })
    console.log(`${checks.length} written reference(s) checked against the site Bible (WEB, Amharic). Spoken-out references are not detected; add them with --add "John 3:16; Psalm 23:1".`)
    for (const check of checks) console.log(`  ${check.reference}: ${check.editions.map(edition => `${edition.edition} ${edition.found ? 'found' : `NOT FOUND (${edition.message})`}`).join(' · ')}`)
  },

  packet() {
    const id = itemId(); const item = store.item(id)
    const source = latestSource(id, item) ?? fail('Transcribe or extract first.')
    const translation = store.latest<SegmentVersion>(id, 'translation')
    const lines = [
      `# Drafting packet: ${item.title}`, '',
      item.sample ? '**SAMPLE CONTENT — demonstration only.**\n' : '',
      `Source: ${item.kind} · language ${item.source.language} · speaker ${item.source.speaker ?? 'not recorded'} · date ${item.source.date ?? 'not recorded'} · audience ${item.source.audience ?? 'not recorded'}`,
      `Permission: ${item.source.permission.status}${item.source.permission.note ? ` — ${item.source.permission.note}` : ''} · channels: ${item.source.channels.join(', ') || 'none recorded'}`, '',
      '## Rules for whoever writes a draft (person or model)', '',
      '- Use only what is in the source below. Do not add Scripture, teachings, saint accounts, miracles, event details or words attributed to anyone.',
      '- Every block states what it is: `::quote`, `::paraphrase`, `::translation`, `::scripture`, `::detail`, `::generated`, `::heading` (format: README.md).',
      '- `::quote` must be word for word from the cited segment, in the source language. `::scripture` must be the exact text of the named edition.',
      '- Where the audio is flagged or the meaning is unsure, do not smooth it over: leave it out or say it is unclear.', '',
      `## Source (${sourceArtifact(item)} v${source.version})`, '',
      ...source.segments.map(segment => {
        const flagsFor = signalFlags(segment.signals)
        return `- **${segmentLabel(segment)}** ${segment.text}${flagsFor.length ? `  \n  ⚠ ${flagsFor.join('; ')}` : ''}`
      }),
    ]
    if (translation) lines.push('', `## Machine translation v${translation.version} (unreviewed; times are approximate matches to the source)`, '', ...translation.segments.map(segment => `- **${segmentLabel(segment)}** ${segment.text}`))
    const file = path.join(store.dir(id), 'packet.md')
    fs.writeFileSync(file, `${lines.join('\n')}\n`, 'utf8')
    console.log(`Drafting packet written: ${file}\nWrite each draft as a file in the block format, then: npm run cw -- draft ${id} --type summary --file <draft.md> --generator "<who wrote it>"`)
  },

  async draft() {
    const id = itemId(); const item = store.item(id)
    const type = need('type') as DraftType
    if (!DRAFT_TYPES.includes(type)) fail(`--type must be one of: ${DRAFT_TYPES.join(', ')}`)
    if ((type === 'announcement' || type === 'event-page') && !['event', 'notice'].includes(item.kind) && flags['allow-type'] !== 'true') fail(`A ${type} suits an event or notice source, not a ${item.kind}. Add --allow-type if the source really announces something.`)
    const source = latestSource(id, item) ?? fail('Transcribe or extract first.')
    const content = fs.readFileSync(path.resolve(need('file')), 'utf8')
    const parsed = parseDraft(content)
    const errors = [...parsed.errors, ...validateDraft(parsed.blocks, source.segments, item.source.language)]
    for (const block of parsed.blocks.filter(row => row.kind === 'scripture' && row.scripture)) {
      const reference = block.scripture!.replace(/\s*\[.*\]$/, '')
      const edition = /\[(\w+)\]$/.exec(block.scripture!)?.[1] === 'am' ? 'am' : 'web'
      const found = (await verifyReference(reference)).find(row => row.edition === edition)
      if (!found?.found) errors.push(`block ${block.index} (scripture): ${reference} was not found in the ${edition} edition (${found?.message ?? 'no result'}); flag the reference instead of quoting it`)
      else if (!scriptureMatches(block.text, found.text)) errors.push(`block ${block.index} (scripture): the text is not exactly ${reference} in the ${edition} edition, which reads: "${found.text}"`)
    }
    if (errors.length) { store.log(id, 'draft-rejected', { type, errors }); fail(`The draft was not accepted:\n  - ${errors.join('\n  - ')}`) }
    const version = store.addVersion(id, `draft.${type}`, { type, generator: need('generator'), note: flags.note || '', title: parsed.title, content, blocks: parsed.blocks })
    const status = statusOf(id)
    for (const note of status.notes) console.log(`note: ${note}`)
    console.log(`${type} draft v${version} recorded (${parsed.blocks.length} blocks; quotations and Scripture matched their sources). next: npm run cw -- review ${id}`)
  },

  review() {
    const id = itemId(); const item = store.item(id)
    const rows = buildReviewRows({
      item, transcript: latestSource(id, item), translation: store.latest<SegmentVersion>(id, 'translation'), drafts: latestDrafts(id),
      scripture: store.readJson<{ checks: ScriptureCheck[] }>(id, 'scripture.json', { checks: [] }).checks,
    })
    const decisions = store.readJson<Decisions>(id, 'review/decisions.json', {})
    store.writeJson(id, 'review/rows.json', rows)
    fs.writeFileSync(path.join(store.dir(id), 'review', 'review.html'), renderReviewHtml(item, rows, decisions), 'utf8')
    const markdown = [`# Review: ${item.title}`, '', `${rows.length} rows · ${openRows(rows, decisions).length} still open`, '', '| # | Group | Source | Proposed wording | Question | Decision | Correction |', '|---|---|---|---|---|---|---|',
      ...rows.map((row, index) => `| ${index + 1} | ${row.group}${row.needsQualifiedReviewer ? ' ⚑' : ''} | ${cell(row.source)} | ${cell(row.proposed)} | ${cell(row.question)} | ${decisions[row.id]?.decision ?? ''} | ${cell(decisions[row.id]?.correction ?? '')} |`),
      '', '⚑ = needs a qualified reviewer (doctrine, unverified Scripture, or translation).']
    fs.writeFileSync(path.join(store.dir(id), 'review', 'review.md'), `${markdown.join('\n')}\n`, 'utf8')
    store.log(id, 'review-built', { rows: rows.length, open: openRows(rows, decisions).length })
    console.log(`Review ready: ${rows.length} rows, ${openRows(rows, decisions).length} open, ${rows.filter(row => row.needsQualifiedReviewer).length} need a qualified reviewer.`)
    console.log(`  open in a browser: ${path.join(store.dir(id), 'review', 'review.html')}\n  after review: npm run cw -- decisions ${id} --file <decisions-file.json>`)
  },

  decisions() {
    const id = itemId(); store.item(id)
    const rows = store.readJson<ReviewRow[]>(id, 'review/rows.json', [])
    if (!rows.length) fail('Build the review first: review')
    const file = JSON.parse(fs.readFileSync(path.resolve(need('file')), 'utf8')) as { item?: string; reviewer?: string; role?: string; rows?: Record<string, { decision: string; correction?: string }> }
    if (file.item && file.item !== id) fail(`This decisions file is for "${file.item}", not "${id}"`)
    const reviewer = flags.reviewer || file.reviewer || ''; const role = flags.role || file.role || ''
    if (!reviewer || !role) fail('Decisions need a reviewer name and role (in the file, or --reviewer and --role)')
    const known = new Set(rows.map(row => row.id))
    const decisions = store.readJson<Decisions>(id, 'review/decisions.json', {})
    let recorded = 0, stale = 0
    for (const [rowId, entry] of Object.entries(file.rows ?? {})) {
      if (!known.has(rowId)) { stale++; continue } // the wording changed since the reviewer saw it
      if (!['accept', 'correct', 'reject', 'needs-clergy'].includes(entry.decision)) continue
      if (entry.decision === 'correct' && !entry.correction?.trim()) fail(`Row ${rowId} is marked "correct" but gives no correction`)
      decisions[rowId] = { decision: entry.decision as Decisions[string]['decision'], correction: entry.correction ?? '', reviewer, role, at: now() }
      recorded++
    }
    store.writeJson(id, 'review/decisions.json', decisions)
    store.log(id, 'decisions-recorded', { reviewer, role, recorded, stale })
    const open = openRows(rows, decisions)
    console.log(`${recorded} decision(s) recorded for ${reviewer} (${role}).${stale ? ` ${stale} ignored: that wording has changed since.` : ''} ${open.length} row(s) still open.`)
    for (const row of open.filter(entry => decisions[entry.id]).slice(0, 20)) console.log(`  ${decisions[row.id].decision}: ${row.group} · ${row.source}${decisions[row.id].correction ? ` → ${decisions[row.id].correction}` : ''}`)
  },

  approve() {
    const id = itemId(); const item = store.item(id)
    const type = need('draft') as DraftType
    const draft = store.latest<DraftVersion>(id, `draft.${type}`) ?? fail(`No ${type} draft`)
    const by = need('by'); const role = need('role'); const evidence = need('evidence')
    const rows = store.readJson<ReviewRow[]>(id, 'review/rows.json', [])
    if (!rows.some(row => row.group === `draft: ${type} v${draft.version}`)) fail(`The review does not cover ${type} v${draft.version}. Run: review`)
    const blockers = approvalBlockers(item, draft, rows, store.readJson<Decisions>(id, 'review/decisions.json', {}))
    if (blockers.length) { store.log(id, 'approval-refused', { type, version: draft.version, blockers }); fail(`Cannot approve ${type} v${draft.version}:\n  - ${blockers.join('\n  - ')}`) }
    const approval: Approval = { draft: type, version: draft.version, sha256: draftHash(draft), by, role, evidence, at: now() }
    store.writeJson(id, 'approvals.json', [...store.readJson<Approval[]>(id, 'approvals.json', []), approval])
    store.log(id, 'approved', approval)
    console.log(`Approved: ${type} v${draft.version} by ${by} (${role}). The approval covers exactly this version; any change needs a new review and approval.`)
  },

  'mark-published'() {
    const id = itemId(); const item = store.item(id)
    const type = need('draft') as DraftType; const channel = need('channel').toLowerCase()
    const entry = statusOf(id).drafts.find(row => row.type === type) ?? fail(`No ${type} draft`)
    if (!entry.approved) fail(`${type} v${entry.version} is not approved. Only an approved version can be recorded as published.`)
    if (!item.source.channels.includes(channel)) fail(`"${channel}" is not a channel this source may be published to (${item.source.channels.join(', ') || 'none recorded'})`)
    const publication: Publication = { draft: type, version: entry.version, sha256: entry.sha256, channel, url: need('url'), by: need('by'), at: now() }
    store.writeJson(id, 'publications.json', [...store.readJson<Publication[]>(id, 'publications.json', []), publication])
    store.log(id, 'published-recorded', publication)
    console.log(`Recorded: ${by(publication)} published ${type} v${entry.version} to ${channel} at ${publication.url}. (This tool did not publish it.)`)
  },

  export() {
    const id = itemId(); const item = store.item(id)
    const status = statusOf(id); const drafts = latestDrafts(id)
    const source = latestSource(id, item)?.segments ?? []
    const out = path.join(store.dir(id), 'export')
    fs.mkdirSync(path.join(out, 'channels'), { recursive: true })
    fs.writeFileSync(path.join(out, 'preview.html'), renderPreviewHtml(item, status, drafts, source), 'utf8')
    const written: string[] = ['preview.html']
    for (const draft of drafts) {
      const approved = Boolean(status.drafts.find(row => row.type === draft.type)?.approved)
      for (const channel of item.source.channels) for (const lang of ['en', 'am'] as const) {
        if (!draft.blocks.some(block => block.lang === lang)) continue
        const name = `channels/${channel}.${draft.type}.${lang}${approved ? '' : '.DRAFT'}.txt`
        fs.writeFileSync(path.join(out, name), `${approved ? '' : '[DRAFT — NOT APPROVED — DO NOT SEND]\n\n'}${renderChannelText(draft, lang)}`, 'utf8')
        written.push(name)
      }
    }
    store.writeJson(id, 'export/cms-export.json', {
      exportedAt: now(), item: { id: item.id, kind: item.kind, title: item.title, sample: item.sample, speaker: item.source.speaker, date: item.source.date, language: item.source.language, permission: item.source.permission.status, channels: item.source.channels },
      state: status.state,
      drafts: drafts.map(draft => ({ type: draft.type, version: draft.version, sha256: draftHash(draft), approved: status.drafts.find(row => row.type === draft.type)?.approved ?? null, title: draft.title, blocks: draft.blocks })),
    })
    written.push('cms-export.json')
    store.log(id, 'exported', { files: written, state: status.state })
    console.log(`Exported to ${out}:\n  ${written.join('\n  ')}\nState: ${status.state}. Unapproved drafts are marked DRAFT in every file.`)
  },

  status() {
    const ids = positional.length ? [itemId()] : store.list()
    if (!ids.length) { console.log(`No items yet in ${ROOT}. Start with: npm run cw -- intake --help`); return }
    for (const id of ids) {
      const item = store.item(id); const status = statusOf(id)
      const rows = store.readJson<ReviewRow[]>(id, 'review/rows.json', []); const decisions = store.readJson<Decisions>(id, 'review/decisions.json', {})
      console.log(`${id}${item.sample ? '  [SAMPLE]' : ''}\n  ${item.kind} · "${item.title}" · state: ${status.state.toUpperCase()} · permission: ${item.source.permission.status}`)
      const source = latestSource(id, item)
      if (source) console.log(`  ${sourceArtifact(item)} v${source.version}: ${source.segments.length} segments, ${source.corrections.length} correction(s)`)
      for (const draft of status.drafts) console.log(`  draft ${draft.type} v${draft.version}: ${draft.approved ? `approved by ${draft.approved.by} (${draft.approved.role})` : 'not approved'}${draft.published.length ? ` · published record: ${draft.published.map(row => row.channel).join(', ')}` : ''}`)
      if (rows.length) console.log(`  review: ${rows.length} rows, ${openRows(rows, decisions).length} open`)
      for (const note of status.notes) console.log(`  ! ${note}`)
      if (flags.log === 'true') for (const entry of store.logEntries(id)) console.log(`    ${entry.at} ${entry.event}`)
    }
  },
}
const cell = (value: string) => value.replace(/\|/g, '\\|').replace(/\s+/g, ' ').slice(0, 300)
const by = (publication: Publication) => publication.by

const handler = commands[command] ?? fail(`Unknown command "${command}". Try: help`)
try { await handler() } catch (error) { console.error(`error: ${error instanceof Error ? error.message : String(error)}`); process.exit(1) }
