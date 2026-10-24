import assert from 'node:assert/strict'
import {
  buildPrintableLyricsHtml,
  buildSlides,
  formatLyricsForCopy,
  normalizeVerifiedRelations,
  parseLyricSections,
  shareHymnLink,
} from '../src/lib/hymns/lyrics.ts'

const lyrics = 'Verse 1\nሰላም ለኪ\nእመቤታችን\n\nChorus\nእልል በሉ\nዘምሩ'
const sections = parseLyricSections(lyrics)
assert.equal(sections.length, 2)
assert.equal(sections[0].lines[0], 'ሰላም ለኪ')
assert.equal(sections[1].kind, 'chorus')
assert.deepEqual(buildSlides(sections, 2).map((slide) => slide.lines.length), [2, 2])
assert.match(formatLyricsForCopy({ title: 'ሰላም', sections, attribution: 'Community archive', includeAttribution: true }), /Source: Community archive/)
const pdfHtml = buildPrintableLyricsHtml({ title: 'ሰላም', sections, attribution: 'Licensed source' })
assert.match(pdfHtml, /charset="utf-8"/)
assert.match(pdfHtml, /Noto Sans Ethiopic/)
assert.match(pdfHtml, /ሰላም ለኪ/)
assert.deepEqual(normalizeVerifiedRelations([
  { target_type: 'prayer', label: 'Evening prayer', href: '/pray/evening', verified: true },
  { target_type: 'scripture', label: 'Unverified', href: '/bible/john/1', verified: false },
]), [{ type: 'prayer', label: 'Evening prayer', href: '/pray/evening' }])
let copied = ''
assert.equal(await shareHymnLink({
  share: undefined,
  clipboard: { writeText: async (value: string) => { copied = value } } as Clipboard,
}, { title: 'Hymn', text: 'Hymn', url: 'https://example.test/hymn' }), 'copied')
assert.equal(copied, 'https://example.test/hymn')
console.log('interactive hymn lyrics tests passed')
