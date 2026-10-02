import { readFileSync, writeFileSync, mkdirSync, copyFileSync } from 'fs'

function parseCsv(text) {
  const rows = []
  let row = []
  let cell = ''
  let i = 0
  let inQuotes = false
  const src = text.replace(/^\uFEFF/, '')
  while (i < src.length) {
    const ch = src[i]
    if (inQuotes) {
      if (ch === '"') {
        if (src[i + 1] === '"') {
          cell += '"'
          i += 2
          continue
        }
        inQuotes = false
        i += 1
        continue
      }
      cell += ch
      i += 1
      continue
    }
    if (ch === '"') {
      inQuotes = true
      i += 1
      continue
    }
    if (ch === ',') {
      row.push(cell)
      cell = ''
      i += 1
      continue
    }
    if (ch === '\n' || (ch === '\r' && src[i + 1] === '\n')) {
      row.push(cell)
      rows.push(row)
      row = []
      cell = ''
      i += ch === '\r' ? 2 : 1
      continue
    }
    if (ch === '\r') {
      row.push(cell)
      rows.push(row)
      row = []
      cell = ''
      i += 1
      continue
    }
    cell += ch
    i += 1
  }
  if (cell.length || row.length) {
    row.push(cell)
    rows.push(row)
  }
  const header = rows[0]
  return rows
    .slice(1)
    .filter((r) => r.some((v) => String(v).trim()))
    .map((r) => Object.fromEntries(header.map((h, idx) => [h, r[idx] ?? ''])))
}

const srcDir = 'C:/Users/eskew/Documents/Codex/2026-10-01/cr/outputs'
const dataDir = new URL('../data/prayer-learning/', import.meta.url)
mkdirSync(dataDir, { recursive: true })
for (const name of [
  'prayer_learning_collections.csv',
  'prayer_learning_sections.csv',
  'prayer_learning_content.csv',
]) {
  copyFileSync(`${srcDir}/${name}`, new URL(name, dataDir))
}

const collections = parseCsv(readFileSync(new URL('prayer_learning_collections.csv', dataDir), 'utf8'))
const sections = parseCsv(readFileSync(new URL('prayer_learning_sections.csv', dataDir), 'utf8'))
const content = parseCsv(readFileSync(new URL('prayer_learning_content.csv', dataDir), 'utf8'))

const seed = {
  collections: collections.map((r) => ({
    collection_slug: r.collection_slug,
    title_english: r.title_english,
    title_amharic: r.title_amharic || '',
    description_english: r.description_english || '',
    description_amharic: r.description_amharic || '',
    sort_order: Number(r.sort_order) || 0,
    display_style: r.display_style || '',
    status: 'published',
  })),
  sections: sections.map((r) => ({
    section_slug: r.section_slug,
    collection_slug: r.collection_slug,
    parent_section_slug: r.parent_section_slug || '',
    sort_order: Number(r.sort_order) || 0,
    title_english: r.title_english,
    title_amharic: r.title_amharic || '',
    summary_english: r.summary_english || '',
    summary_amharic: r.summary_amharic || '',
    content_type: r.content_type || '',
    display_style: r.display_style || '',
    show_in_contents: String(r.show_in_contents).toLowerCase() !== 'false',
    step_number: r.step_number ? Number(r.step_number) : null,
    is_expandable: String(r.is_expandable).toLowerCase() === 'true',
    status: 'published',
  })),
  content: content.map((r) => ({
    content_id: r.content_id,
    section_slug: r.section_slug,
    content_order: Number(r.content_order) || 0,
    content_kind: r.content_kind || 'body',
    language: r.language,
    heading: r.heading || '',
    body: r.body || '',
    source_reference: r.source_reference || '',
    status: 'published',
  })),
}

writeFileSync(
  new URL('../src/lib/prayers/prayerLearningSeed.json', import.meta.url),
  JSON.stringify(seed),
)
console.log(
  JSON.stringify(
    {
      collections: seed.collections.length,
      sections: seed.sections.length,
      content: seed.content.length,
      styles: Object.fromEntries(
        [...new Set(seed.sections.map((s) => s.display_style))].map((k) => [
          k,
          seed.sections.filter((s) => s.display_style === k).length,
        ]),
      ),
      parents: seed.sections
        .filter((s) => s.parent_section_slug)
        .map((s) => `${s.section_slug}->${s.parent_section_slug}`),
      kinds: Object.fromEntries(
        [...new Set(seed.content.map((c) => c.content_kind))].map((k) => [
          k,
          seed.content.filter((c) => c.content_kind === k).length,
        ]),
      ),
    },
    null,
    2,
  ),
)
