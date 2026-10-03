/** Whole-corpus, read-only Bible source audit. Never edits scripture. */
import fs from 'node:fs/promises'
import path from 'node:path'
import { createHash } from 'node:crypto'
import { fileURLToPath } from 'node:url'
import { amharicSourceMap, canonicalBooks, webSourceMap } from './canonicalBookMap.mjs'

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../..')
const auditDir = path.join(root, 'artifacts/bible-audit')
const snapshot = path.join(auditDir, 'original-snapshot')
const amDir = path.join(root, 'data/bible/am')
const webFile = path.join(root, 'data/bible/EN/web.json')
const amMap = new Map(amharicSourceMap.map((row) => [row.sourceBookNumber, row]))
const webMap = new Map(webSourceMap.map((row) => [row.sourceBookNumber, row]))
const canon = new Map(canonicalBooks.map((row) => [row.key, row]))
const columns = ['edition', 'source_file', 'canonical_book', 'source_book', 'chapter', 'section',
  'source_position', 'verse_number', 'issue_type', 'severity', 'classification', 'original_text',
  'proposed_text', 'action_taken', 'confidence', 'evidence', 'notes']
const anomalies = []
const numbering = []
const blanks = []
const duplicateText = []
const unicode = []
const files = []
const chapterGroups = new Map()
const allVerses = []
const seenVerseObjects = new WeakSet()
const documentedWebOmissions = new Map([
  ['42:17:36', 'https://ebible.org/eng-web/LUK17.htm'],
  ['44:8:37', 'https://ebible.org/eng-web/ACT08.htm'],
  ['44:15:34', 'https://ebible.org/eng-web/ACT15.htm'],
  ['44:24:7', 'https://ebible.org/eng-web/ACT24.htm'],
  ['45:16:25', 'https://ebible.org/eng-web/ROM16.htm'],
])

function sha256(raw) { return createHash('sha256').update(raw).digest('hex') }
function issue(verse, type, severity, notes, evidence = 'Source JSON and neighboring positions only') {
  const row = {
    edition: verse.edition, source_file: verse.source_file, canonical_book: verse.canonical_book,
    source_book: verse.source_book, chapter: verse.chapter, section: verse.section,
    source_position: verse.source_position, verse_number: verse.verse_number,
    issue_type: type, severity, classification: 'REVIEW_ONLY', original_text: verse.text,
    proposed_text: '', action_taken: 'None', confidence: 'LOW', evidence, notes,
  }
  if (type === 'BLANK_TEXT' && verse.edition === 'web') {
    const officialPage = documentedWebOmissions.get(`${verse.source_book}:${verse.chapter}:${verse.verse_number}`)
    if (officialPage) {
      row.classification = 'NO_ISSUE'
      row.severity = 'INFO'
      row.confidence = 'HIGH'
      row.evidence = `Official WEB chapter page: ${officialPage}`
      row.notes = 'WEB prints this verse location as a textual-variant marker without main-text verse wording; retain the empty source slot.'
    }
  }
  if (type === 'MIXED_PUNCTUATION_CLUSTER' && verse.edition === 'web' && /\.\.\./u.test(verse.text)) {
    row.classification = 'NO_ISSUE'
    row.severity = 'INFO'
    row.confidence = 'HIGH'
    row.evidence = 'WEB source JSON contains an ordinary prose ellipsis; surrounding sentence remains intact.'
    row.notes = 'Intentional three-dot ellipsis, not malformed punctuation.'
  }
  anomalies.push(row)
  if (type === 'BLANK_TEXT') blanks.push(row)
  if (type.includes('DUPLICATE_TEXT') || type === 'REPEATED_TEXT_IN_CHAPTER' || type === 'IDENTICAL_NUMBER_AND_TEXT') duplicateText.push(row)
  if (['UNICODE_REPLACEMENT', 'CONTROL_CHARACTER', 'UNPAIRED_SURROGATE', 'NULL_BYTE', 'LITERAL_ESCAPE',
    'ASCII_ONLY_AMHARIC', 'LATIN_IN_AMHARIC', 'PUNCTUATION_RUN', 'MIXED_PUNCTUATION_CLUSTER'].includes(type)) unicode.push(row)
  return row
}
function csv(rows, fields = columns) {
  const q = (value) => `"${String(value ?? '').replaceAll('"', '""')}"`
  return '\uFEFF' + fields.map(q).join(',') + '\n' + rows.map((row) => fields.map((key) => q(row[key])).join(',')).join('\n') + (rows.length ? '\n' : '')
}
function addVerse(row, rawVerse, sourceOrder) {
  row.source_order = sourceOrder
  row.text = typeof rawVerse.text === 'string' ? rawVerse.text : String(rawVerse.text ?? '')
  row.verse_number = rawVerse.verse
  allVerses.push(row)
  if (seenVerseObjects.has(rawVerse)) issue(row, 'SHARED_OBJECT_REFERENCE', 'HIGH', 'The same in-memory verse object was encountered twice.')
  seenVerseObjects.add(rawVerse)
  if (!Number.isInteger(rawVerse.verse) || rawVerse.verse < 0) issue(row, 'INVALID_VERSE_LABEL', 'HIGH', 'Explicit verse label is not a nonnegative integer.')
  if (typeof rawVerse.text !== 'string') issue(row, 'INVALID_TEXT_TYPE', 'HIGH', 'Verse text is not a string in the source JSON.')
  if (!row.text.trim()) issue(row, 'BLANK_TEXT', 'HIGH', 'Text is empty or whitespace-only; do not fill without same-edition evidence.')
  if (row.text.includes('\uFFFD')) issue(row, 'UNICODE_REPLACEMENT', 'HIGH', 'Replacement character suggests damaged decoding.')
  if (row.text.includes('\0')) issue(row, 'NULL_BYTE', 'HIGH', 'Unexpected null byte in parsed verse text.')
  if (/[\u0001-\u0008\u000B\u000C\u000E-\u001F\u007F]/u.test(row.text)) issue(row, 'CONTROL_CHARACTER', 'HIGH', 'Nonprinting control character in parsed verse text.')
  if (/[\uD800-\uDBFF](?![\uDC00-\uDFFF])|(?<![\uD800-\uDBFF])[\uDC00-\uDFFF]/u.test(row.text)) issue(row, 'UNPAIRED_SURROGATE', 'HIGH', 'Malformed UTF-16 surrogate in parsed verse text.')
  if (/\\(?:u[0-9a-fA-F]{4}|n|r|t)/u.test(row.text)) issue(row, 'LITERAL_ESCAPE', 'MEDIUM', 'Literal escape sequence appears inside parsed text; inspect original serialization.')
  if (/([.!?።፤፣])\1{3,}/u.test(row.text)) issue(row, 'PUNCTUATION_RUN', 'LOW', 'Four or more identical punctuation marks; may be source style.')
  if (/[.;!?።፤፣፥]{3,}/u.test(row.text)) issue(row, 'MIXED_PUNCTUATION_CLUSTER', 'MEDIUM', 'Three or more adjacent punctuation marks; inspect original source for OCR corruption.')
  if (row.text.trim().length > (row.edition === 'am' ? 500 : 400)) issue(row, 'EXTREME_LENGTH', 'MEDIUM', `Verse has ${row.text.trim().length} characters; inspect for merged verses.`)
  if (row.text.trim().length > 0 && row.text.trim().length < 3) issue(row, 'EXTREME_SHORT', 'LOW', `Verse has ${row.text.trim().length} visible characters; may be a legitimate fragment.`)
  if (row.edition === 'am' && row.text.trim()) {
    if (!/[\u1200-\u137F\u1380-\u139F\u2D80-\u2DDF\uAB00-\uAB2F]/u.test(row.text)) issue(row, 'ASCII_ONLY_AMHARIC', 'MEDIUM', 'Amharic-edition verse has no Ethiopic script.')
    else if (/[A-Za-z]/u.test(row.text)) issue(row, 'LATIN_IN_AMHARIC', 'MEDIUM', 'Latin letter appears in Amharic verse; inspect for OCR or transcription corruption.')
  }
}
function inspectChapter(key, verses, meta) {
  let gaps = 0, repeats = 0, descents = 0, adjacentDuplicates = 0
  const seenLabels = new Set()
  const seenObjects = new Set()
  const seenTexts = new Map()
  const start = verses[0]?.verse_number ?? null
  if (start !== null && start > 1) issue(verses[0], 'CHAPTER_START_ABOVE_ONE', 'LOW', `First explicit label is ${start}; numbering traditions may differ.`)
  for (let i = 0; i < verses.length; i++) {
    const current = verses[i]
    const previous = verses[i - 1]
    if (seenLabels.has(current.verse_number)) {
      repeats++
      issue(current, 'REPEATED_VERSE_LABEL', 'MEDIUM', `Label ${current.verse_number} occurs more than once in this chapter; preserve source order.`)
    }
    seenLabels.add(current.verse_number)
    if (previous && Number.isInteger(current.verse_number) && Number.isInteger(previous.verse_number)) {
      if (current.verse_number > previous.verse_number + 1) {
        gaps++
        issue(current, 'NUMBERING_GAP', 'LOW', `Previous label ${previous.verse_number}; current label ${current.verse_number}. Do not infer missing text.`)
      } else if (current.verse_number < previous.verse_number) {
        descents++
        issue(current, 'NONMONOTONIC_LABEL', 'MEDIUM', `Previous label ${previous.verse_number}; current label ${current.verse_number}.`)
      }
      if (current.text.trim().length >= 8 && current.text.trim() === previous.text.trim()) {
        adjacentDuplicates++
        issue(current, 'ADJACENT_DUPLICATE_TEXT', 'MEDIUM', 'Same text as immediately preceding verse; may be a legitimate refrain.')
      }
    }
    const objectKey = JSON.stringify([current.verse_number, current.text])
    if (seenObjects.has(objectKey)) issue(current, 'IDENTICAL_NUMBER_AND_TEXT', 'MEDIUM', 'Identical explicit label and text already appeared in this chapter.')
    seenObjects.add(objectKey)
    const comparableText = current.text.trim()
    if (comparableText.length >= 15 && seenTexts.has(comparableText) && i - seenTexts.get(comparableText) > 1) {
      issue(current, 'REPEATED_TEXT_IN_CHAPTER', 'LOW', `Exact text also occurs at chapter position ${seenTexts.get(comparableText) + 1}; could be a legitimate refrain.`)
    }
    if (comparableText.length >= 15) seenTexts.set(comparableText, i)
  }
  numbering.push({ edition: meta.edition, source_file: meta.source_file, canonical_book: meta.canonical_book,
    source_book: meta.source_book, chapter: meta.chapter, verse_objects: verses.length,
    first_label: start, last_label: verses.at(-1)?.verse_number ?? null,
    gap_jumps: gaps, repeated_labels: repeats, descending_jumps: descents,
    adjacent_duplicate_texts: adjacentDuplicates })
}
function inspectAmFile(name, data, raw) {
  const number = Number(/^\d+/u.exec(name)?.[0])
  const mapping = amMap.get(number)
  const book = canon.get(mapping?.canonicalBookKey)
  const sourceFile = `data/bible/am/${name}`
  let verseCount = 0, sectionCount = 0
  const chapterNumbers = new Set()
  const fileStartIssues = anomalies.length
  for (const [chapterIndex, chapter] of (data.chapters || []).entries()) {
    const all = []
    if (chapterNumbers.has(chapter.chapter)) issue({ edition: 'am', source_file: sourceFile, canonical_book: book?.key,
      source_book: number, chapter: chapter.chapter, section: '', source_position: '', verse_number: '', text: '' },
    'REPEATED_CHAPTER_LABEL', 'HIGH', 'Explicit chapter number repeats in source file.')
    chapterNumbers.add(chapter.chapter)
    if (chapterIndex > 0 && chapter.chapter < data.chapters[chapterIndex - 1].chapter) issue({ edition: 'am', source_file: sourceFile,
      canonical_book: book?.key, source_book: number, chapter: chapter.chapter, section: '', source_position: '', verse_number: '', text: '' },
    'CHAPTER_ORDER_DESCENT', 'MEDIUM', 'Chapter number descends in source file.')
    for (const [sectionIndex, section] of (chapter.sections || []).entries()) {
      sectionCount++
      if (!section.verses?.length) issue({ edition: 'am', source_file: sourceFile, canonical_book: book?.key,
        source_book: number, chapter: chapter.chapter, section: sectionIndex + 1, source_position: '', verse_number: '', text: '' },
      'EMPTY_SECTION', 'LOW', 'Real source section contains no verse objects.')
      for (const [verseIndex, verse] of (section.verses || []).entries()) {
        verseCount++
        const row = { edition: 'am', source_file: sourceFile, canonical_book: book?.key || '',
          source_book: number, chapter: chapter.chapter, section: sectionIndex + 1,
          section_title: section.title ?? '', source_position: `${sectionIndex + 1}:${verseIndex + 1}` }
        addVerse(row, verse, verseIndex + 1)
        all.push(row)
      }
    }
    inspectChapter(`am:${number}:${chapter.chapter}`, all, { edition: 'am', source_file: sourceFile,
      canonical_book: book?.key || '', source_book: number, chapter: chapter.chapter })
    chapterGroups.set(`am:${number}:${chapter.chapter}`, all)
  }
  if (data.book_number !== number || !mapping || data.testament !== book?.collection) {
    issue({ edition: 'am', source_file: sourceFile, canonical_book: book?.key, source_book: number,
      chapter: '', section: '', source_position: '', verse_number: '', text: '' }, 'BOOK_IDENTITY_MISMATCH', 'HIGH',
    'File number, book_number, mapping, or testament does not agree.')
  }
  files.push({ edition: 'am', source_file: sourceFile, sha256: sha256(raw), source_book: number,
    canonical_book: book?.key || '', chapters: data.chapters?.length ?? 0, sections: sectionCount,
    verses: verseCount, flagged_signals: anomalies.length - fileStartIssues,
    provenance: 'No provenance field in source JSON' })
}

async function main() {
  const amNames = (await fs.readdir(amDir)).filter((name) => name.toLowerCase().endsWith('.json')).sort((a, b) => Number(/^\d+/u.exec(a)?.[0]) - Number(/^\d+/u.exec(b)?.[0]))
  if (amNames.length !== 83) throw new Error(`Expected 83 Amharic files, found ${amNames.length}`)
  for (const name of amNames) {
    const raw = await fs.readFile(path.join(amDir, name), 'utf8')
    const original = await fs.readFile(path.join(snapshot, 'am', name), 'utf8')
    if (sha256(raw) !== sha256(original)) throw new Error(`Source differs from pre-audit snapshot: ${name}`)
    inspectAmFile(name, JSON.parse(raw), raw)
  }
  const webRaw = await fs.readFile(webFile, 'utf8')
  if (sha256(webRaw) !== sha256(await fs.readFile(path.join(snapshot, 'EN', 'web.json'), 'utf8'))) {
    throw new Error('WEB source differs from pre-audit snapshot')
  }
  const web = JSON.parse(webRaw)
  const byChapter = new Map()
  const fileStartIssues = anomalies.length
  for (const [index, verse] of web.verses.entries()) {
    const mapping = webMap.get(verse.book)
    const key = `web:${verse.book}:${verse.chapter}`
    const group = byChapter.get(key) || []
    const row = { edition: 'web', source_file: 'data/bible/EN/web.json', canonical_book: mapping?.canonicalBookKey || '',
      source_book: verse.book, chapter: verse.chapter, section: '', source_position: group.length + 1,
      source_index: index + 1 }
    addVerse(row, verse, group.length + 1)
    if (!mapping || mapping.sourceName !== verse.book_name) issue(row, 'BOOK_IDENTITY_MISMATCH', 'HIGH', 'WEB book number/name does not match reviewed source map.')
    group.push(row)
    byChapter.set(key, group)
  }
  for (const [key, verses] of byChapter) {
    const first = verses[0]
    inspectChapter(key, verses, first)
    chapterGroups.set(key, verses)
  }
  files.push({ edition: 'web', source_file: 'data/bible/EN/web.json', sha256: sha256(webRaw), source_book: '1–66',
    canonical_book: '66 mapped volumes', chapters: byChapter.size, sections: 0, verses: web.verses.length,
    flagged_signals: anomalies.length - fileStartIssues,
    provenance: 'Metadata: World English Bible 2006; Digital Bible Society; imported from The Unbound Bible' })

  const cross = canonicalBooks.map((book) => {
    const amSources = amharicSourceMap.filter((source) => source.canonicalBookKey === book.key)
    const webSources = webSourceMap.filter((source) => source.canonicalBookKey === book.key)
    const amChapters = [...chapterGroups.keys()].filter((key) => amSources.some((source) => key.startsWith(`am:${source.sourceBookNumber}:`))).length
    const webChapters = [...chapterGroups.keys()].filter((key) => webSources.some((source) => key.startsWith(`web:${source.sourceBookNumber}:`))).length
    return { canonical_book: book.key, collection: book.collection, am_source_volumes: amSources.length,
      web_source_volumes: webSources.length, am_chapters: amChapters, web_chapters: webChapters,
      classification: amSources.length && webSources.length && amChapters !== webChapters ? 'REVIEW_ONLY' : 'NO_ISSUE',
      notes: book.key === 'proverbs' || book.key === 'tegsats'
        ? 'WEB Proverbs overlaps separately counted Amharic Proverbs/Tegsats; bilingual alignment is unverified.'
        : !amSources.length && !webSources.length ? 'Canonical slot has no imported source; no text was invented.'
          : 'Chapter counts are a comparison signal only; no verse alignment is asserted.' }
  })
  const signalCounts = new Map()
  const verseKey = (row) => `${row.edition}|${row.source_file}|${row.chapter}|${row.section}|${row.source_position}`
  for (const row of anomalies) signalCounts.set(verseKey(row), (signalCounts.get(verseKey(row)) || 0) + 1)
  const counts = {
    amharic_files: amNames.length, web_files: 1, amharic_verses: allVerses.filter((row) => row.edition === 'am').length,
    web_verses: allVerses.filter((row) => row.edition === 'web').length,
    total_verses: allVerses.length, chapters: numbering.length,
    signals: anomalies.length, unique_flagged_verses: signalCounts.size,
    by_type: Object.fromEntries([...new Set(anomalies.map((row) => row.issue_type))].sort().map((type) => [type, anomalies.filter((row) => row.issue_type === type).length])),
  }
  if (counts.amharic_verses !== 42139 || counts.web_verses !== 31103 || counts.total_verses !== 73242) {
    throw new Error(`Unexpected verse-object totals: ${JSON.stringify(counts)}`)
  }
  await fs.mkdir(auditDir, { recursive: true })
  const write = (name, content) => fs.writeFile(path.join(auditDir, name), content, 'utf8')
  const contexts = anomalies.map((row) => {
    const group = chapterGroups.get(`${row.edition}:${row.source_book}:${row.chapter}`) || []
    const position = group.findIndex((verse) => String(verse.source_position) === String(row.source_position))
    const neighbor = (verse) => verse ? `${verse.verse_number}: ${verse.text}` : ''
    return { ...row, previous_verse: neighbor(group[position - 1]), next_verse: neighbor(group[position + 1]) }
  })
  await Promise.all([
    write('02-all-anomalies.csv', csv(anomalies)),
    write('03-fixed-issues.csv', csv([], ['file', 'book', 'chapter', 'verse', 'source_position', 'issue', 'old_value', 'new_value', 'why_changed', 'evidence_source', 'confidence', 'fix_category'])),
    write('04-review-only.csv', csv(anomalies.filter((row) => row.classification === 'REVIEW_ONLY'))),
    write('05-verse-numbering-report.csv', csv(numbering, ['edition', 'source_file', 'canonical_book', 'source_book', 'chapter', 'verse_objects', 'first_label', 'last_label', 'gap_jumps', 'repeated_labels', 'descending_jumps', 'adjacent_duplicate_texts'])),
    write('06-blank-verses-report.csv', csv(blanks)),
    write('07-duplicate-text-report.csv', csv(duplicateText)),
    write('08-unicode-script-report.csv', csv(unicode)),
    write('09-cross-edition-review.csv', csv(cross, ['canonical_book', 'collection', 'am_source_volumes', 'web_source_volumes', 'am_chapters', 'web_chapters', 'classification', 'notes'])),
    write('10-file-level-report.csv', csv(files, ['edition', 'source_file', 'sha256', 'source_book', 'canonical_book', 'chapters', 'sections', 'verses', 'flagged_signals', 'provenance'])),
    write('14-anomaly-context.csv', csv(contexts, [...columns, 'previous_verse', 'next_verse'])),
    write('13-verse-scan-index.csv', csv(allVerses.map((verse) => ({
      edition: verse.edition, source_file: verse.source_file, canonical_book: verse.canonical_book,
      source_book: verse.source_book, chapter: verse.chapter, section: verse.section,
      source_position: verse.source_position, verse_number: verse.verse_number,
      text_sha256: sha256(verse.text), text_length: verse.text.length,
      signal_count: signalCounts.get(verseKey(verse)) || 0,
    })), ['edition', 'source_file', 'canonical_book', 'source_book', 'chapter', 'section', 'source_position', 'verse_number', 'text_sha256', 'text_length', 'signal_count'])),
    write('corrected-source-manifest.json', JSON.stringify({ generated_at: new Date().toISOString(), source_changes: 0,
      snapshot_directory: 'artifacts/bible-audit/original-snapshot', counts, files: files.map(({ edition, source_file, sha256, verses }) => ({ edition, source_file, original_sha256: sha256, current_sha256: sha256, verses })) }, null, 2) + '\n'),
  ])
  console.log(JSON.stringify(counts, null, 2))
}

await main()
