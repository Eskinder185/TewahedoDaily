import { createHash } from 'node:crypto'
import { mkdir, readFile, writeFile } from 'node:fs/promises'
import path from 'node:path'

import {
  buildImportPreview,
  contentHash,
  type ImportBookMeta,
  type ImportPassage,
  type ImportPayload,
  type ImportSection,
} from '../src/lib/churchLibrary/structuredImport.ts'

const ROOT = path.resolve(process.cwd())
const OUTPUT = path.join(ROOT, 'reports', 'church-library-direct-import')
const FIVE_PILLARS = 'C:\\Users\\eskew\\Downloads\\five_pillars_bilingual.md'
const BAPTISM_AM = 'C:\\Users\\eskew\\Downloads\\01-baptism.md'
const BAPTISM_EN = 'C:\\Users\\eskew\\Downloads\\01-baptism_1.md'

type FivePillarsBlock = {
  id: string
  type: string
  am: string
  en: string
}

function sha256(text: string): string {
  return createHash('sha256').update(text, 'utf8').digest('hex').toUpperCase()
}

function sqlLiteral(value: string): string {
  return `'${value.replaceAll("'", "''")}'`
}

function unwrapQuoteBlock(value: string): string {
  return value
    .replace(/^\s+|\s+$/g, '')
    .split('\n')
    .map((line) => line.replace(/^> ?/, ''))
    .join('\n')
    .trim()
}

function extractReferences(content: string): string | null {
  const englishBooks = '(?:[1-3]\\s*)?(?:Genesis|Exodus|Leviticus|Numbers|Deuteronomy|Joshua|Judges|Ruth|Samuel|Kings|Chronicles|Ezra|Nehemiah|Esther|Job|Psalms?|Proverbs|Ecclesiastes|Isaiah|Jeremiah|Lamentations|Ezekiel|Daniel|Hosea|Joel|Amos|Obadiah|Jonah|Micah|Nahum|Habakkuk|Zephaniah|Haggai|Zechariah|Malachi|Matthew|Mark|Luke|John|Acts|Romans|Corinthians|Galatians|Ephesians|Philippians|Colossians|Thessalonians|Timothy|Titus|Philemon|Hebrews|James|Peter|Jude|Revelation)'
  const english = new RegExp(`\\b${englishBooks}\\s+\\d+:\\d+(?:[-–]\\d+)?`, 'gi')
  const ethiopic = /(?:[1-3]?\s*[ሀ-፿]{2,})\s*\d+\s*[፥:]\s*\d+(?:[-–፦]\d+)?/gu
  const refs = [...(content.match(english) ?? []), ...(content.match(ethiopic) ?? [])]
  return refs.length ? [...new Set(refs.map((ref) => ref.trim()))].join('; ') : null
}

function parseFivePillars(text: string): FivePillarsBlock[] {
  const normalized = text.replace(/\r\n?/g, '\n')
  const chunks = normalized.split(/^---\s*$/m).slice(1)
  const blocks: FivePillarsBlock[] = []
  for (const chunk of chunks) {
    const id = /\*\*Section ID:\*\*\s*([^\n]+?)\s*$/m.exec(chunk)?.[1]?.trim()
    const type = /\*\*Block type:\*\*\s*([^\n]+?)\s*$/m.exec(chunk)?.[1]?.trim()
    const language = /\*\*Amharic:\*\*\s*\n([\s\S]*?)\n\s*\*\*English:\*\*\s*\n([\s\S]*)$/m.exec(chunk)
    if (!id && !type && !language) continue
    if (!id || !type || !language) throw new Error(`Malformed Five Pillars block near ${id ?? '(missing ID)'}`)
    const am = unwrapQuoteBlock(language[1])
    const en = unwrapQuoteBlock(language[2])
    if (!am || !en) throw new Error(`Five Pillars block ${id} is missing one language`)
    blocks.push({ id, type, am, en })
  }
  return blocks
}

function fivePillarsEdition(
  blocks: FivePillarsBlock[],
  language: 'am' | 'en',
  sourceHash: string,
): ImportPayload {
  const sections: ImportSection[] = []
  const passages: Array<ImportPassage & { chapter_reference?: string | null; locator_label?: string }> = []
  const sectionKeys = new Set<string>()

  const addSection = (key: string, parent: string | null, level: number, title: string | null) => {
    if (sectionKeys.has(key)) return
    sections.push({ key, parent_key: parent, level, title, source_heading: title, page_start: null, page_end: null })
    sectionKeys.add(key)
  }

  for (const block of blocks) {
    const content = block[language]
    if (block.type === 'document-title' || block.type === 'chapter-title') {
      addSection(block.id, null, 1, content)
      continue
    }
    if (block.type === 'section-title') {
      const chapter = /^((?:FP)-\d{3})-S\d{3}$/.exec(block.id)?.[1]
      if (!chapter || !sectionKeys.has(chapter)) throw new Error(`Section ${block.id} has no preceding chapter`)
      addSection(block.id, chapter, 2, content)
      continue
    }
    const match = /^(FP-\d{3})-(S\d{3})-P\d{3}$/.exec(block.id)
    if (!match) throw new Error(`Passage ID ${block.id} does not follow FP-ccc-Sxxx-Pxxx`)
    const chapter = match[1]
    const section = `${chapter}-${match[2]}`
    if (!sectionKeys.has(chapter)) throw new Error(`Passage ${block.id} has no preceding chapter`)
    addSection(section, chapter, 2, null)
    const blockType = block.type === 'list-item' ? 'list_item' : block.type === 'subheading' ? 'heading' : 'paragraph'
    passages.push({
      key: block.id,
      section_key: section,
      block_type: blockType,
      content,
      content_hash: contentHash(content),
      page_start: null,
      page_end: null,
      review_notes: [],
      chapter_reference: extractReferences(content),
      locator_label: block.id,
    })
  }

  const book: ImportBookMeta = {
    slug: `five-pillars-of-mystery-${language}`,
    title: language === 'am' ? 'አምስቱ አእማደ ምሥጢር' : 'The Five Pillars of Mystery',
    title_amharic: 'አምስቱ አእማደ ምሥጢር',
    title_english: 'The Five Pillars of Mystery',
    title_geez: null,
    language,
    collection_key: 'five-pillars-of-mystery',
    source_document_name: 'five_pillars_bilingual.md',
    source_document_sha256: sourceHash,
    author: null,
    category: 'Ethiopian Orthodox doctrine',
    description: 'Bilingual educational edition aligned by stable FP-* identifiers. Revision 2, 2026-10-28.',
    document_type: 'book',
  }
  return { book, sections, passages }
}

function overrideBaptismPayload(payload: ImportPayload, sourceName: string, sourceHash: string): ImportPayload {
  const am = payload.book.language === 'am'
  return {
    ...payload,
    book: {
      ...payload.book,
      slug: `seven-sacraments-baptism-${payload.book.language}`,
      title: am ? 'ሰባቱ ምሥጢራት — ምሥጢረ ጥምቀት' : 'Seven Sacraments — Baptism',
      title_amharic: 'ሰባቱ ምሥጢራት — ምሥጢረ ጥምቀት',
      title_english: 'Seven Sacraments — Baptism',
      collection_key: 'seven-sacraments-baptism',
      source_document_name: sourceName,
      source_document_sha256: sourceHash,
      category: 'Sacraments',
      description: 'Partial Seven Sacraments collection: the Baptism chapter only.',
      document_type: 'chapter_collection',
    },
    passages: payload.passages.map((passage) => ({
      ...passage,
      chapter_reference: extractReferences(passage.content),
      locator_label: passage.key,
    })) as ImportPassage[],
  }
}

function exactKeySet(values: Array<{ key: string }>): string {
  return values.map((value) => value.key).sort().join('\n')
}

function validatePayloads(payloads: ImportPayload[]) {
  const errors: string[] = []
  const slugs = new Set<string>()
  for (const payload of payloads) {
    if (slugs.has(payload.book.slug)) errors.push(`Duplicate slug in import: ${payload.book.slug}`)
    slugs.add(payload.book.slug)
    if (!payload.passages.length) errors.push(`${payload.book.slug} has no passages`)
    if (payload.passages.some((passage) => !passage.content.trim())) errors.push(`${payload.book.slug} has an empty passage`)
    if (new Set(payload.sections.map((section) => section.key)).size !== payload.sections.length) errors.push(`${payload.book.slug} has duplicate section IDs`)
    if (new Set(payload.passages.map((passage) => passage.key)).size !== payload.passages.length) errors.push(`${payload.book.slug} has duplicate passage IDs`)
  }
  const bySlug = new Map(payloads.map((payload) => [payload.book.slug, payload]))
  const pairs = [
    ['five-pillars-of-mystery-am', 'five-pillars-of-mystery-en'],
    ['seven-sacraments-baptism-am', 'seven-sacraments-baptism-en'],
  ]
  for (const [amSlug, enSlug] of pairs) {
    const am = bySlug.get(amSlug)
    const en = bySlug.get(enSlug)
    if (!am || !en) errors.push(`Missing bilingual pair ${amSlug}/${enSlug}`)
    else {
      if (exactKeySet(am.sections) !== exactKeySet(en.sections)) errors.push(`${amSlug}/${enSlug} section IDs do not align`)
      if (exactKeySet(am.passages) !== exactKeySet(en.passages)) errors.push(`${amSlug}/${enSlug} passage IDs do not align`)
    }
  }
  if (errors.length) throw new Error(errors.join('\n'))
}

function buildImportSql(payloads: ImportPayload[]): string {
  const payloadRows = payloads.map((payload) => `  (${sqlLiteral(JSON.stringify(payload))}::jsonb)`).join(',\n')
  return `-- Generated by scripts/prepare-bilingual-church-library-import.ts
-- Requires supabase/migrations/20261029120000_church_library_structured_collections.sql.
-- Run in Supabase SQL Editor as the database administrator. Inserts drafts only.
begin;

do $preflight$
declare
  staff_id uuid;
begin
  if to_regclass('public.church_library_sections') is null
     or to_regprocedure('public.church_library_import_structured(jsonb)') is null then
    raise exception 'Structured Church Library migration 20261029120000 is not installed';
  end if;
  select id into staff_id
    from public.profiles
   where role in ('admin', 'super_admin')
   order by case role when 'super_admin' then 0 else 1 end, id
   limit 1;
  if staff_id is null then
    raise exception 'No admin or super_admin profile exists for the authenticated import audit';
  end if;
  perform set_config(
    'request.jwt.claims',
    jsonb_build_object('sub', staff_id, 'role', 'authenticated')::text,
    true
  );
  if not public.is_staff() then
    raise exception 'The selected administrator profile does not satisfy public.is_staff()';
  end if;
end
$preflight$;

create temporary table church_library_import_payloads(payload jsonb) on commit drop;
insert into church_library_import_payloads(payload) values
${payloadRows};

-- Strict duplicate preflight. Existing records are never overwritten.
do $duplicates$
declare
  p jsonb;
  conflict_count integer;
begin
  for p in select payload from church_library_import_payloads loop
    select count(*) into conflict_count
      from public.church_library_books b
     where b.slug = p #>> '{book,slug}'
        or (b.collection_key = p #>> '{book,collection_key}' and b.language = p #>> '{book,language}')
        or (b.source_document_sha256 = p #>> '{book,source_document_sha256}' and b.language = p #>> '{book,language}');
    if conflict_count <> 0 then
      raise exception 'Duplicate Church Library identity for % (% matching rows)', p #>> '{book,slug}', conflict_count
        using errcode = '23505';
    end if;
  end loop;
end
$duplicates$;

create temporary table church_library_import_results(result jsonb) on commit drop;
do $import$
declare
  p jsonb;
begin
  for p in select payload from church_library_import_payloads loop
    insert into church_library_import_results(result)
    values (public.church_library_import_structured(p));
  end loop;
end
$import$;

-- Any mismatch aborts all four editions.
do $verify$
declare
  expected_books integer := (select count(*) from church_library_import_payloads);
  actual_books integer := (select count(*) from church_library_import_results);
  expected_sections integer := (select sum(jsonb_array_length(payload -> 'sections')) from church_library_import_payloads);
  actual_sections integer := (select sum((result ->> 'sections')::integer) from church_library_import_results);
  expected_passages integer := (select sum(jsonb_array_length(payload -> 'passages')) from church_library_import_payloads);
  actual_passages integer := (select sum((result ->> 'passages')::integer) from church_library_import_results);
begin
  if (expected_books, expected_sections, expected_passages) is distinct from
     (actual_books, actual_sections, actual_passages) then
    raise exception 'Import count mismatch: expected books/sections/passages %/%/%, got %/%/%',
      expected_books, expected_sections, expected_passages, actual_books, actual_sections, actual_passages;
  end if;
  if exists (
    select 1 from church_library_import_results r
    join public.church_library_books b on b.id = (r.result ->> 'book_id')::uuid
    where b.publication_status <> 'draft'
       or b.access_level <> 'private'
       or b.approved_for_ingestion
       or b.allow_search_quotes
       or b.public_retrieval_enabled
  ) then
    raise exception 'Draft/private publication gate verification failed';
  end if;
end
$verify$;

select result from church_library_import_results order by result ->> 'slug';
commit;
notify pgrst, 'reload schema';
`
}

function buildVerificationSql(payloads: ImportPayload[]): string {
  const slugs = payloads.map((payload) => sqlLiteral(payload.book.slug)).join(', ')
  return `-- Read-back verification after import (database administrator session)
with expected(slug, expected_sections, expected_passages) as (
  values
${payloads.map((p) => `    (${sqlLiteral(p.book.slug)}, ${p.sections.length}, ${p.passages.length})`).join(',\n')}
), actual as (
  select b.id, b.slug, b.language, b.collection_key, b.publication_status, b.access_level,
         b.source_document_sha256,
         (select count(*) from public.church_library_sections s where s.book_id = b.id) as section_count,
         (select count(*) from public.church_library_passages p where p.book_id = b.id) as passage_count
    from public.church_library_books b
   where b.slug in (${slugs})
)
select e.*, a.*,
       a.section_count = e.expected_sections as sections_match,
       a.passage_count = e.expected_passages as passages_match
  from expected e left join actual a using (slug)
 order by e.slug;

-- Public/anonymous clients must see zero rows while these editions are Draft.
-- Run this second query through the application's anonymous Supabase client:
-- select=slug&slug=in.(${payloads.map((p) => p.book.slug).join(',')})
`
}

async function main() {
  const [fiveText, baptismAmText, baptismEnText] = await Promise.all([
    readFile(FIVE_PILLARS, 'utf8'),
    readFile(BAPTISM_AM, 'utf8'),
    readFile(BAPTISM_EN, 'utf8'),
  ])
  const fiveHash = sha256(fiveText)
  const baptismAmHash = sha256(baptismAmText)
  const baptismEnHash = sha256(baptismEnText)
  const fiveBlocks = parseFivePillars(fiveText)
  const baptism = buildImportPreview([
    { name: path.basename(BAPTISM_AM), text: baptismAmText },
    { name: path.basename(BAPTISM_EN), text: baptismEnText },
  ])
  const blocking = baptism.issues.filter((issue) => issue.level === 'error')
  if (blocking.length) throw new Error(blocking.map((issue) => issue.message).join('\n'))
  const baptismPayloads = baptism.payloads.map((payload) => overrideBaptismPayload(
    payload,
    payload.book.language === 'am' ? path.basename(BAPTISM_AM) : path.basename(BAPTISM_EN),
    payload.book.language === 'am' ? baptismAmHash : baptismEnHash,
  ))
  const payloads = [
    fivePillarsEdition(fiveBlocks, 'am', fiveHash),
    fivePillarsEdition(fiveBlocks, 'en', fiveHash),
    ...baptismPayloads,
  ].sort((a, b) => a.book.slug.localeCompare(b.book.slug))
  validatePayloads(payloads)

  await mkdir(OUTPUT, { recursive: true })
  await Promise.all(payloads.map((payload) => writeFile(
    path.join(OUTPUT, `${payload.book.slug}.json`),
    `${JSON.stringify(payload, null, 2)}\n`,
    'utf8',
  )))
  await writeFile(path.join(OUTPUT, 'IMPORT_DRAFTS.sql'), buildImportSql(payloads), 'utf8')
  await writeFile(path.join(OUTPUT, 'VERIFY_IMPORT.sql'), buildVerificationSql(payloads), 'utf8')

  const rows = payloads.map((payload) => ({
    slug: payload.book.slug,
    language: payload.book.language,
    chapters: payload.sections.filter((section) => section.level === 1).length,
    sections: payload.sections.length,
    paragraphs: payload.passages.length,
    source_sha256: payload.book.source_document_sha256,
  }))
  const report = `# Bilingual Church Library direct import — local dry run

Generated: ${new Date().toISOString()}

## Result

- Blocking validation errors: **0**
- Editions prepared: **${payloads.length}**
- Total chapters: **${rows.reduce((n, row) => n + row.chapters, 0)}**
- Total sections (chapters included): **${rows.reduce((n, row) => n + row.sections, 0)}**
- Total paragraphs/passages: **${rows.reduce((n, row) => n + row.paragraphs, 0)}**
- All editions are forced by the database import RPC to **Draft / private / not search-enabled**.
- The Baptism editions are labeled as a partial Seven Sacraments collection.
- Amharic and English stable section/passage ID sets match exactly within each bilingual collection.

## Editions

| Slug | Language | Chapters | Sections | Paragraphs | Source SHA-256 |
|---|---:|---:|---:|---:|---|
${rows.map((row) => `| ${row.slug} | ${row.language} | ${row.chapters} | ${row.sections} | ${row.paragraphs} | ${row.source_sha256} |`).join('\n')}

## Source preservation

- Five Pillars structured blocks parsed: **${fiveBlocks.length}** (${fiveBlocks.filter((b) => ['document-title', 'chapter-title', 'section-title'].includes(b.type)).length} heading blocks; ${fiveBlocks.filter((b) => !['document-title', 'chapter-title', 'section-title'].includes(b.type)).length} passage blocks per language).
- Five Pillars retired ID \`FP-004-S005-P004\` present: **${fiveBlocks.some((block) => block.id === 'FP-004-S005-P004') ? 'yes (error)' : 'no'}**.
- Baptism parser issues: ${baptism.issues.length}; blocking: 0. Informational duplicate text is retained rather than removed.
- No translation, summarization, spelling correction, title substitution, or paragraph deduplication is performed.
`
  await writeFile(path.join(OUTPUT, 'DRY_RUN_REPORT.md'), report, 'utf8')
  console.log(JSON.stringify({ output: OUTPUT, editions: rows, fivePillarsBlocks: fiveBlocks.length, baptismIssues: baptism.issues.length }, null, 2))
}

await main()
