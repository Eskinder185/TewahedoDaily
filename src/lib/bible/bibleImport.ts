import type { BibleDraftVerse } from './bibleTypes'
import type { StagedBibleChapter } from '../cms/bibleAdminService'

export type BibleImportFormat = 'csv' | 'json' | 'usfm'
export type BibleImportIssue = { severity: 'error' | 'warning'; row?: number; message: string }
export type BibleImportPreview = { chapters: StagedBibleChapter[]; issues: BibleImportIssue[]; verseCount: number }

type FlatVerse = {
  editionCode: string
  bookSlug: string
  chapterNumber: number
  verseNumber: number
  text: string
  sourceName?: string
}

function csvRows(text: string): string[][] {
  const rows: string[][] = []
  let row: string[] = []
  let cell = ''
  let quoted = false
  for (let index = 0; index < text.length; index += 1) {
    const char = text[index]
    if (char === '"') {
      if (quoted && text[index + 1] === '"') { cell += '"'; index += 1 } else quoted = !quoted
    } else if (char === ',' && !quoted) { row.push(cell); cell = '' }
    else if ((char === '\n' || char === '\r') && !quoted) {
      if (char === '\r' && text[index + 1] === '\n') index += 1
      row.push(cell); cell = ''; if (row.some((value) => value.trim())) rows.push(row); row = []
    } else cell += char
  }
  row.push(cell); if (row.some((value) => value.trim())) rows.push(row)
  return rows
}

function parseCsv(text: string, issues: BibleImportIssue[]): FlatVerse[] {
  const rows = csvRows(text)
  if (!rows.length) return []
  const headers = rows[0].map((value) => value.trim().toLowerCase().replaceAll(' ', '_'))
  const required = ['edition_code', 'book_slug', 'chapter', 'verse', 'text']
  for (const header of required) if (!headers.includes(header)) issues.push({ severity: 'error', row: 1, message: `Missing CSV column: ${header}` })
  if (issues.some((issue) => issue.severity === 'error')) return []
  return rows.slice(1).flatMap((values, index) => {
    const get = (name: string) => (values[headers.indexOf(name)] || '').trim()
    const chapterNumber = Number(get('chapter'))
    const verseNumber = Number(get('verse'))
    if (!get('edition_code') || !get('book_slug') || !Number.isInteger(chapterNumber) || !Number.isInteger(verseNumber) || !get('text')) {
      issues.push({ severity: 'error', row: index + 2, message: 'Edition, book, integer chapter/verse, and text are required.' })
      return []
    }
    return [{ editionCode: get('edition_code').toLowerCase(), bookSlug: get('book_slug').toLowerCase(), chapterNumber, verseNumber, text: get('text'), sourceName: get('source_name') || undefined }]
  })
}

function parseJson(text: string, issues: BibleImportIssue[]): FlatVerse[] {
  let value: unknown
  try { value = JSON.parse(text) } catch { issues.push({ severity: 'error', message: 'The JSON file is not valid JSON.' }); return [] }
  const rows = Array.isArray(value) ? value : (value && typeof value === 'object' && Array.isArray((value as { verses?: unknown }).verses) ? (value as { verses: unknown[] }).verses : [])
  if (!rows.length) { issues.push({ severity: 'error', message: 'JSON must be an array of verse objects, or an object with a verses array.' }); return [] }
  return rows.flatMap((item, index) => {
    if (!item || typeof item !== 'object') { issues.push({ severity: 'error', row: index + 1, message: 'Verse entry must be an object.' }); return [] }
    const row = item as Record<string, unknown>
    const chapterNumber = Number(row.chapter ?? row.chapter_number)
    const verseNumber = Number(row.verse ?? row.verse_number)
    const editionCode = String(row.edition_code ?? row.editionCode ?? '').trim().toLowerCase()
    const bookSlug = String(row.book_slug ?? row.bookSlug ?? '').trim().toLowerCase()
    const verseText = String(row.text ?? '').trim()
    if (!editionCode || !bookSlug || !Number.isInteger(chapterNumber) || !Number.isInteger(verseNumber) || !verseText) {
      issues.push({ severity: 'error', row: index + 1, message: 'Edition, book, integer chapter/verse, and text are required.' }); return []
    }
    return [{ editionCode, bookSlug, chapterNumber, verseNumber, text: verseText, sourceName: row.source_name ? String(row.source_name) : undefined }]
  })
}

function parseUsfm(text: string, issues: BibleImportIssue[], defaults: { editionCode?: string; bookSlug?: string }): FlatVerse[] {
  let bookSlug = defaults.bookSlug?.trim().toLowerCase() || ''
  let chapter = -1
  const result: FlatVerse[] = []
  for (const [index, raw] of text.split(/\r?\n/).entries()) {
    const line = raw.trim()
    const id = /^\\id\s+([^\s]+)/i.exec(line)
    if (id && !bookSlug) bookSlug = id[1].toLowerCase()
    const chapterMatch = /^\\c\s+(\d+)/.exec(line)
    if (chapterMatch) { chapter = Number(chapterMatch[1]); continue }
    const verse = /^\\v\s+(\d+)(?:[-–](\d+))?\s+(.+)/u.exec(line)
    if (!verse) continue
    if (!bookSlug || chapter < 0 || !defaults.editionCode) {
      issues.push({ severity: 'error', row: index + 1, message: 'USFM requires an edition code, book mapping, and chapter marker before verses.' }); continue
    }
    result.push({ editionCode: defaults.editionCode.toLowerCase(), bookSlug, chapterNumber: chapter, verseNumber: Number(verse[1]), text: verse[3].trim() })
    if (verse[2]) issues.push({ severity: 'warning', row: index + 1, message: `Verse bridge ${verse[1]}-${verse[2]} is preserved under its starting number.` })
  }
  return result
}

export function parseBibleImport(
  text: string,
  format: BibleImportFormat,
  defaults: { editionCode?: string; bookSlug?: string } = {},
): BibleImportPreview {
  const issues: BibleImportIssue[] = []
  const flat = format === 'csv' ? parseCsv(text, issues) : format === 'json' ? parseJson(text, issues) : parseUsfm(text, issues, defaults)
  const groups = new Map<string, FlatVerse[]>()
  flat.forEach((verse) => {
    const key = `${verse.editionCode}|${verse.bookSlug}|${verse.chapterNumber}`
    groups.set(key, [...(groups.get(key) || []), verse])
  })
  const chapters: StagedBibleChapter[] = []
  for (const verses of groups.values()) {
    const seen = new Set<number>()
    verses.forEach((verse) => {
      if (seen.has(verse.verseNumber)) issues.push({ severity: 'error', message: `Duplicate verse ${verse.bookSlug} ${verse.chapterNumber}:${verse.verseNumber}.` })
      seen.add(verse.verseNumber)
    })
    verses.sort((a, b) => a.verseNumber - b.verseNumber)
    for (let index = 1; index < verses.length; index += 1) {
      if (verses[index].verseNumber > verses[index - 1].verseNumber + 1) issues.push({ severity: 'warning', message: `Possible missing verse between ${verses[index - 1].verseNumber} and ${verses[index].verseNumber} in ${verses[index].bookSlug} ${verses[index].chapterNumber}.` })
    }
    chapters.push({
      editionCode: verses[0].editionCode,
      bookSlug: verses[0].bookSlug,
      chapterNumber: verses[0].chapterNumber,
      sourceName: verses[0].sourceName,
      verses: verses.map((verse, index): BibleDraftVerse => ({ section_id: null, source_order: index + 1, verse_number: verse.verseNumber, text: verse.text })),
    })
  }
  chapters.sort((a, b) => a.bookSlug.localeCompare(b.bookSlug) || a.chapterNumber - b.chapterNumber)
  return { chapters, issues, verseCount: flat.length }
}
