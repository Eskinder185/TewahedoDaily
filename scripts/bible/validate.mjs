import fs from 'node:fs/promises'
import path from 'node:path'
import process from 'node:process'
import { fileURLToPath } from 'node:url'
import { amharicSourceMap, canonicalBooks, webSourceMap } from './canonicalBookMap.mjs'

export const projectRoot = process.env.BIBLE_PROJECT_ROOT
  ? path.resolve(process.env.BIBLE_PROJECT_ROOT)
  : path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../..')

function fail(errors, message) { errors.push(message) }
function isNumber(value) { return Number.isInteger(value) && value >= 0 }

export async function validateBibleSources() {
  const errors = []
  const warnings = []
  const booksByKey = new Map(canonicalBooks.map((book) => [book.key, book]))
  const amMap = new Map()
  const webMap = new Map()

  for (const book of canonicalBooks) {
    if (!['old', 'new'].includes(book.collection)) fail(errors, `Invalid collection: ${book.key}`)
    if (book.canonicalNumber < 1) fail(errors, `Invalid canonical number: ${book.key}`)
  }
  if (booksByKey.size !== 81 || canonicalBooks.length !== 81) fail(errors, 'Canonical catalog must have 81 unique keys.')
  for (const [collection, target] of [['old', 46], ['new', 35]]) {
    const subset = canonicalBooks.filter((book) => book.collection === collection)
    if (subset.length !== target || subset.some((book, index) => book.canonicalNumber !== index + 1)) {
      fail(errors, `${collection} must have ${target} consecutive canonical slots.`)
    }
  }

  for (const entry of amharicSourceMap) {
    if (amMap.has(entry.sourceBookNumber)) fail(errors, `Amharic source ${entry.sourceBookNumber} mapped twice.`)
    if (!booksByKey.has(entry.canonicalBookKey)) fail(errors, `Unknown canonical key ${entry.canonicalBookKey}.`)
    amMap.set(entry.sourceBookNumber, entry)
  }
  for (const entry of webSourceMap) {
    if (webMap.has(entry.sourceBookNumber)) fail(errors, `WEB source ${entry.sourceBookNumber} mapped twice.`)
    if (!booksByKey.has(entry.canonicalBookKey)) fail(errors, `Unknown WEB canonical key ${entry.canonicalBookKey}.`)
    webMap.set(entry.sourceBookNumber, entry)
  }

  const amDir = path.join(projectRoot, 'data', 'bible', 'am')
  const amFiles = (await fs.readdir(amDir)).filter((file) => file.toLowerCase().endsWith('.json'))
  const amSources = []
  let amChapterCount = 0
  let amSectionCount = 0
  let amVerseCount = 0
  let blankVerses = 0
  let repeatedVerseLabels = 0
  for (const file of amFiles) {
    const match = /^(\d+)-.+\.json$/i.exec(file)
    if (!match) { fail(errors, `Unnumbered Amharic JSON file: ${file}`); continue }
    const sourceBookNumber = Number(match[1])
    const mapping = amMap.get(sourceBookNumber)
    if (!mapping) { fail(errors, `No explicit mapping for ${file}`); continue }
    const sourceFile = path.posix.join('data/bible/am', file)
    const raw = await fs.readFile(path.join(amDir, file), 'utf8')
    let data
    try { data = JSON.parse(raw) } catch (error) { fail(errors, `${file}: invalid JSON: ${error.message}`); continue }
    if (data.book_number !== sourceBookNumber) fail(errors, `${file}: book_number differs from mapped source number.`)
    if (data.testament !== booksByKey.get(mapping.canonicalBookKey).collection) {
      fail(errors, `${file}: testament conflicts with canonical collection.`)
    }
    if (!Array.isArray(data.chapters)) { fail(errors, `${file}: chapters must be an array.`); continue }
    const chapterLabels = new Set()
    for (const [chapterIndex, chapter] of data.chapters.entries()) {
      amChapterCount++
      if (!isNumber(chapter.chapter)) fail(errors, `${file}: chapter ${chapterIndex + 1} lacks an explicit number.`)
      if (chapterLabels.has(chapter.chapter)) fail(errors, `${file}: repeated chapter number ${chapter.chapter}.`)
      chapterLabels.add(chapter.chapter)
      if (!Array.isArray(chapter.sections)) { fail(errors, `${file}: chapter ${chapter.chapter} lacks sections.`); continue }
      const verseLabels = new Set()
      for (const [sectionIndex, section] of chapter.sections.entries()) {
        amSectionCount++
        if (section.title !== null && section.title !== undefined && typeof section.title !== 'string') {
          fail(errors, `${file}: chapter ${chapter.chapter}, section ${sectionIndex + 1} has an invalid title.`)
        }
        if (!Array.isArray(section.verses)) { fail(errors, `${file}: chapter ${chapter.chapter}, section ${sectionIndex + 1} lacks verses.`); continue }
        for (const [verseIndex, verse] of section.verses.entries()) {
          amVerseCount++
          if (!isNumber(verse.verse)) fail(errors, `${file}: chapter ${chapter.chapter}, verse ${verseIndex + 1} lacks an explicit number.`)
          if (verseLabels.has(verse.verse)) repeatedVerseLabels++
          verseLabels.add(verse.verse)
          if (typeof verse.text !== 'string') fail(errors, `${file}: chapter ${chapter.chapter}, verse ${verseIndex + 1} lacks text.`)
          else if (!verse.text.trim()) blankVerses++
        }
      }
    }
    amSources.push({ mapping, sourceFile, data, raw })
  }
  const foundNumbers = new Set(amSources.map((source) => source.mapping.sourceBookNumber))
  for (const sourceBookNumber of amMap.keys()) {
    if (!foundNumbers.has(sourceBookNumber)) fail(errors, `Mapped Amharic source ${sourceBookNumber} has no file.`)
  }

  const webFile = path.join(projectRoot, 'data', 'bible', 'EN', 'web.json')
  const webRaw = await fs.readFile(webFile, 'utf8')
  const webData = JSON.parse(webRaw)
  if (!Array.isArray(webData.verses)) fail(errors, 'WEB verses must be an array.')
  const webVolumes = new Map()
  let webBlankVerses = 0
  for (const [index, verse] of (webData.verses ?? []).entries()) {
    if (!isNumber(verse.book) || !isNumber(verse.chapter) || !isNumber(verse.verse)) {
      fail(errors, `WEB verse ${index + 1} lacks an explicit book/chapter/verse number.`)
      continue
    }
    if (typeof verse.text !== 'string') fail(errors, `WEB verse ${index + 1} lacks text.`)
    else if (!verse.text.trim()) webBlankVerses++
    const mapping = webMap.get(verse.book)
    if (!mapping) { fail(errors, `WEB book ${verse.book} has no explicit mapping.`); continue }
    if (verse.book_name !== mapping.sourceName) {
      fail(errors, `WEB book ${verse.book} is ${JSON.stringify(verse.book_name)}; expected ${JSON.stringify(mapping.sourceName)}.`)
    }
    if (!webVolumes.has(verse.book)) webVolumes.set(verse.book, { mapping, name: verse.book_name, verses: [] })
    const volume = webVolumes.get(verse.book)
    if (volume.name !== verse.book_name) fail(errors, `WEB book ${verse.book} has conflicting names.`)
    volume.verses.push(verse)
  }
  for (const sourceBookNumber of webMap.keys()) {
    if (!webVolumes.has(sourceBookNumber)) fail(errors, `Mapped WEB source ${sourceBookNumber} has no verses.`)
  }

  const represented = new Set(amSources.map((source) => source.mapping.canonicalBookKey))
  const missing = canonicalBooks.filter((book) => !represented.has(book.key))
  if (amSources.length !== 83) fail(errors, `Expected 83 Amharic source files; found ${amSources.length}.`)
  if (represented.size !== 74) fail(errors, `Expected 74 represented canonical books; found ${represented.size}.`)
  if (missing.length !== 7) fail(errors, `Expected 7 canonical books without source; found ${missing.length}.`)
  if (webVolumes.size !== 66) fail(errors, `Expected 66 WEB source books; found ${webVolumes.size}.`)
  if (repeatedVerseLabels) warnings.push(`${repeatedVerseLabels} repeated Amharic verse labels are preserved in source order.`)
  if (blankVerses || webBlankVerses) warnings.push(`${blankVerses} Amharic and ${webBlankVerses} WEB blank verse texts require editorial review.`)
  warnings.push('WEB Proverbs chapter alignment with Amharic Proverbs/Tegsats requires review before publication.')

  return {
    errors, warnings, canonicalBooks, amSources, webVolumes, webData, webRaw, missing,
    summary: {
      amharicSourceFiles: amSources.length,
      amharicChapters: amChapterCount,
      amharicSections: amSectionCount,
      amharicVerses: amVerseCount,
      canonicalBooksRepresented: represented.size,
      canonicalBooksIntended: canonicalBooks.length,
      canonicalBooksWithoutSource: missing.length,
      webSourceBooks: webVolumes.size,
      webVerses: webData.verses?.length ?? 0,
    },
  }
}

if (process.argv[1] && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  const report = await validateBibleSources()
  console.log(JSON.stringify({
    ...report.summary,
    missing: report.missing.map(({ collection, canonicalNumber, key, nameEn }) => ({ collection, canonicalNumber, key, nameEn })),
    warnings: report.warnings,
    errors: report.errors,
  }, null, 2))
  if (report.errors.length) process.exitCode = 1
}
