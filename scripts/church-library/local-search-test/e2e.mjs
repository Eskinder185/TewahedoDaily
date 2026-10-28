// End-to-end test against local Postgres + PostgREST replicating the Church Library schema.
import { execFileSync } from 'node:child_process'
import { writeFileSync } from 'node:fs'
import { dirname, resolve } from 'node:path'
import { fileURLToPath } from 'node:url'
import { createClient } from '@supabase/supabase-js'
import { jwt } from './jwt.mjs'

// Local-only harness: Postgres (PGHOST/PGPORT/PGUSER/PGDATABASE) + PostgREST behind proxy.mjs.
const HERE = dirname(fileURLToPath(import.meta.url))
const URL_ = process.env.LOCAL_REST_URL ?? 'http://localhost:54321'
const REPO = process.env.REPO_ROOT ?? resolve(HERE, '../../..')
const OUT = process.env.REPORT_DIR ?? HERE
const anon = createClient(URL_, jwt('anon'), { auth: { persistSession: false } })
const psql = (sql) => execFileSync('psql', ['-At', '-v', 'ON_ERROR_STOP=1', '-c', sql], { encoding: 'utf8' }).trim()
const runImport = (extra = []) => {
  try {
    return { ok: true, out: execFileSync('node', [`${REPO}/scripts/import-church-library-passages.mjs`,
      '--jsonl', `${REPO}/data/church-library/faith-and-order/church_faith_and_order_search.jsonl`,
      '--sections', `${REPO}/data/church-library/faith-and-order/church_faith_and_order_sections.json`,
      '--manifest', `${REPO}/data/church-library/faith-and-order/church_faith_and_order_manifest.json`, ...extra],
    { encoding: 'utf8', env: { ...process.env, SUPABASE_URL: URL_, SUPABASE_SERVICE_ROLE_KEY: jwt('service_role') }, cwd: REPO }) }
  } catch (e) { return { ok: false, out: String(e.stdout) + String(e.stderr) } }
}

export const QUERIES = [
  { q: 'What does the Ethiopian Orthodox Church teach about the Holy Trinity?', expect: [/Holy Trinity/] },
  { q: 'What is the mystery of the Incarnation?', expect: [/Incarnation/] },
  { q: 'What does the Church teach about Baptism?', expect: [/Baptism/] },
  { q: 'What is Holy Communion?', expect: [/Holy Communion/] },
  { q: 'What are the seven sacraments?', expect: [/Introduction to Church Sacraments/] },
  { q: 'ሥላሴ ምንድን ነው?', expect: [/Holy Trinity/], lang: 'am' },
  { q: 'ቁርባን ምንድን ነው?', expect: [/Holy Communion/], lang: 'am' },
  { q: 'ሥጋዌ ምን ማለት ነው?', expect: [/Incarnation/], lang: 'am' },
  // additional coverage
  { q: 'ስላሴ', expect: [/Holy Trinity/], lang: 'am', note: 'homophone spelling ስ for ሥ' },
  { q: 'ስለ ጥምቀት አስረዳኝ', expect: [/Baptism/], lang: 'am' },
  { q: 'ንስሐ ምንድን ነው?', expect: [/Penance/], lang: 'am' },
  { q: 'ትንሳኤ ሙታን', expect: [/Resurrection/], lang: 'am', note: 'homophone spelling ሳ for ሣ' },
  { q: 'What is Kidist Selassie?', expect: [/Holy Trinity/] },
  { q: 'Why does the church baptize infants after 40 and 80 days?', expect: [/Baptism/] },
  { q: 'Who has the right to perform the sacraments?', expect: [/Church Sacraments|Holy Orders/] },
  { q: 'Is the Holy Communion a sacrifice?', expect: [/Holy Communion/] },
  { q: 'one incarnate nature Chalcedon', expect: [/Incarnation/] },
  { q: 'What is the unction of the sick?', expect: [/Unction/] },
  // negative controls: the book does not cover these
  { q: 'Who won the 2022 World Cup?', expect: null },
  { q: 'What does the Church teach about cryptocurrency investing?', expect: null },
  { q: 'Tell me about Saint Yared and his hymns', expect: null },
]

async function search(q, lang) {
  const { data, error } = await anon.rpc('search_church_library', { search_query: q, result_limit: 8, search_language: lang ?? null })
  if (error) throw new Error(`${q}: ${error.message}`)
  return data
}

async function runQueries(label) {
  const results = []
  for (const t of QUERIES) {
    const started = performance.now()
    const rows = await search(t.q, t.lang)
    const ms = performance.now() - started
    const top = rows[0]
    let pass
    if (t.expect === null) pass = rows.length === 0
    else pass = !!top && t.expect.some((rx) => rx.test(top.chapter_reference || ''))
    // verify the hit is a real indexed passage
    let grounded = true
    for (const r of rows.slice(0, 3)) {
      const n = psql(`select count(*) from church_library_passages where id='${r.passage_id}' and position(${dollar(r.excerpt.split(' … ')[0].slice(0, 120))} in content) > 0`)
      if (n !== '1') grounded = false
    }
    results.push({ label, ...t, expect: t.expect ? t.expect.map(String) : null, count: rows.length, ms: Math.round(ms),
      pass, grounded, top: rows.slice(0, 3).map((r) => ({ chapter: r.chapter_reference, section: r.locator_label,
        pages: [r.page_start, r.page_end], rank: Number(r.keyword_rank.toFixed(3)), excerpt: r.excerpt.slice(0, 160) })) })
  }
  return results
}
const dollar = (s) => `$q$${s.replace(/\$q\$/g, '')}$q$`

async function main() {
  const report = { steps: [] }
  const sha = JSON.parse(execFileSync('cat', [`${REPO}/data/church-library/faith-and-order/church_faith_and_order_manifest.json`], { encoding: 'utf8' })).source.sha256
  // Admin has created the book and uploaded the DOCX (simulated as staff would through the admin UI).
  const bookId = psql(`insert into church_library_books (title, language, access_level, rights_status) values ('The Faith And Order Of The Church','en','private','unknown') returning id`).split('\n')[0]
  const versionId = psql(`insert into church_library_book_versions (book_id, version_number, original_file_name, source_storage_path, mime_type, byte_size, sha256)
    values ('${bookId}', 1, 'The Faith And Order Of The Church (2)(4).docx', 'books/${bookId}/v1.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 106993, '${sha}') returning id`).split('\n')[0]
  psql(`update church_library_books set current_version_id='${versionId}' where id='${bookId}'`)

  // 1. sha mismatch guard
  psql(`update church_library_book_versions set sha256='deadbeef' where id='${versionId}'`)
  const mismatch = runImport(['--book-id', bookId, '--apply'])
  report.steps.push({ step: 'sha256 mismatch is refused', pass: !mismatch.ok && /does not match/.test(mismatch.out), out: mismatch.out.trim() })
  psql(`update church_library_book_versions set sha256='${sha}' where id='${versionId}'`)

  // 2. anon key cannot import
  const anonImport = (() => { try { execFileSync('node', [`${REPO}/scripts/import-church-library-passages.mjs`, '--book-id', bookId, '--apply'], { cwd: REPO, encoding: 'utf8', env: { ...process.env, SUPABASE_URL: URL_, SUPABASE_SERVICE_ROLE_KEY: jwt('anon') } }); return true } catch { return false } })()
  report.steps.push({ step: 'anonymous key cannot import (RLS)', pass: anonImport === false, passages_after: psql(`select count(*) from church_library_passages where book_id='${bookId}'`) })

  // 3. import twice (idempotent replace)
  const first = runImport(['--book-id', bookId, '--apply', '--emit-resolved-csv', `${OUT}/resolved.csv`])
  const second = runImport(['--book-id', bookId, '--apply'])
  const counts = psql(`select count(*), count(distinct passage_order), count(section_id), sum(case when review_status='needs_attention' then 1 else 0 end) from church_library_passages where book_id='${bookId}'`)
  const sections = psql(`select count(*) from church_library_sections where book_id='${bookId}'`)
  const book = psql(`select processing_status, public_retrieval_enabled, search_enabled, extraction_quality from church_library_books where id='${bookId}'`)
  report.steps.push({ step: 'import applied twice; replaced not duplicated', pass: first.ok && second.ok && counts.startsWith('47|47|47|'), counts, sections, book, out: second.out.trim() })
  const tsv = psql(`select count(*) from church_library_passages where book_id='${bookId}' and search_document is not null`)
  report.steps.push({ step: 'search_document populated by trigger', pass: tsv === '47', tsv })

  // 4. before reviewer approval: invisible to the public
  const hidden = await search('Holy Trinity')
  const { data: directRows } = await anon.from('church_library_passages').select('id').limit(5)
  report.steps.push({ step: 'unreviewed book is not publicly searchable or readable', pass: hidden.length === 0 && (directRows ?? []).length === 0 })

  // 5. reviewer enables retrieval (would be done in Admin UI after review)
  psql(`update church_library_books set access_level='public_search', approved_for_ingestion=true, allow_search_quotes=true, rights_status='permission_granted', public_retrieval_enabled=true where id='${bookId}'`)
  report.bookId = bookId
  report.baseline = await runQueries('baseline (current production RPC)')
  
  // 6. proposed migration + alias seed (pending), then approval
  execFileSync('psql', ['-q', '-v', 'ON_ERROR_STOP=1', '-f', `${REPO}/supabase/church-library/PROPOSED_20261028_church_library_multilingual_search.sql`], { stdio: 'ignore' })
  execFileSync('psql', ['-q', '-v', 'ON_ERROR_STOP=1', '-f', `${REPO}/supabase/church-library/PROPOSED_20261028_church_library_search_aliases_seed.sql`], { stdio: 'ignore' })
  await new Promise((r) => setTimeout(r, 300))
  report.pendingAliases = await runQueries('proposed RPC, aliases pending')
  psql(`update church_library_search_aliases set review_status='approved', reviewed_at=now() where review_status='pending'`)
  report.approved = await runQueries('proposed RPC, aliases approved')
  const { error: aliasReadErr, data: aliasRows } = await anon.from('church_library_search_aliases').select('alias').limit(1)
  report.steps.push({ step: 'alias table not readable by anonymous visitors', pass: !!aliasReadErr || (aliasRows ?? []).length === 0, detail: aliasReadErr?.message ?? `${(aliasRows ?? []).length} rows` })

  // 7. unpublish -> search returns nothing again
  psql(`update church_library_books set public_retrieval_enabled=false where id='${bookId}'`)
  const after = await search('Holy Trinity')
  report.steps.push({ step: 'disabling public retrieval hides passages immediately', pass: after.length === 0 })
  psql(`update church_library_books set public_retrieval_enabled=true where id='${bookId}'`)

  // 8. query plan uses the GIN index
  psql(`set enable_seqscan = off; select 1`)
  report.plan = execFileSync('psql', ['-At', '-c',
    `set enable_seqscan=off; explain select id from church_library_passages where search_document @@ ('''trinity'':* | ''godhead'':*')::tsquery`], { encoding: 'utf8' })
  writeFileSync(`${OUT}/report.json`, JSON.stringify(report, null, 2))
  const summary = (rs) => `${rs.filter((r) => r.pass).length}/${rs.length} pass, grounded ${rs.filter((r) => r.grounded).length}/${rs.length}`
  console.log('steps', report.steps.map((s) => `${s.pass ? 'PASS' : 'FAIL'} ${s.step}`).join('\n      '))
  console.log('baseline', summary(report.baseline))
  console.log('pending ', summary(report.pendingAliases))
  console.log('approved', summary(report.approved))
}
main().catch((e) => { console.error(e); process.exit(1) })
