/**
 * Present Mezmur: slide segmentation, language switching, line limits,
 * navigation helpers, preferences and the editable PowerPoint export.
 *
 * Fixtures are short synthetic lyrics (no production Mezmur text).
 * Run: npm run test:mezmur-presentation
 */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import JSZip from 'jszip'
import {
  buildPresentationSlides,
  buildPresentationSource,
  clampSlideIndex,
  flattenSlideText,
  mapSlideIndex,
  resolveLanguage,
  splitLyricSections,
  autoLinesCapacity,
  type PresentationSourceInput,
} from '../src/lib/mezmur/presentationSlides'
import { sanitizePresentationPrefs, DEFAULT_PRESENTATION_PREFS } from '../src/lib/mezmur/presentationPrefs'
import { buildPptx, fitFontSizePt, estimateSlideHeightPt, pxToPt, SLIDE_H } from '../src/lib/mezmur/pptxExport'
import { currentMezmurUrl } from '../src/lib/hymns/shareLink'

let passed = 0
const failures: string[] = []
async function test(name: string, fn: () => void | Promise<void>) {
  try {
    await fn()
    passed++
    console.log(`✓ ${name}`)
  } catch (error) {
    failures.push(name)
    console.log(`✗ ${name}\n    ${(error as Error).message.split('\n').slice(0, 3).join('\n    ')}`)
  }
}

const AM = [
  'CHORUS',
  'ሃሌ ሉያ ሃሌ ሉያ',
  'ስብሐት ለእግዚአብሔር (2x)',
  '',
  'VERSE 1',
  'ቀዳማይ መስመር',
  'ዳግማይ መስመር',
  'ሣልሳይ መስመር',
  'ራብዓይ መስመር',
  'ኃምሳይ መስመር',
  '',
  'CHORUS',
  'ሃሌ ሉያ ሃሌ ሉያ',
  'ስብሐት ለእግዚአብሔር (2x)',
].join('\n')
const TR = [
  'CHORUS',
  'Hale luya hale luya',
  'Sibhat le-Egziabher (2x)',
  '',
  'VERSE 1',
  'Qedamay mesmer',
  'Dagmay mesmer',
  'Salsay mesmer',
  'Rabay mesmer',
  'Hamsay mesmer',
  '',
  'CHORUS',
  'Hale luya hale luya',
  'Sibhat le-Egziabher (2x)',
].join('\n')
const EN = 'Hallelujah, hallelujah\nGlory to God\n\nThe first line\nThe second line'

const full: PresentationSourceInput = {
  title: 'Hale Luya',
  title_amharic: 'ሃሌ ሉያ',
  transliteration_title: 'Hale Luya',
  singer_name: 'Test Zemari',
  language: 'amharic',
  lyrics_amharic: AM,
  lyrics_transliteration: TR,
  lyrics_english: EN,
  source: 'Synthetic test fixture',
}
const amharicOnly: PresentationSourceInput = { title: 'Only', title_amharic: 'ብቻ', language: 'amharic', lyrics_amharic: 'አንድ\nሁለት\nሦስት' }
const englishOnly: PresentationSourceInput = { title: 'Our Father', language: 'english', lyrics_english: 'Our Father in heaven\nHallowed be your name' }
const englishInAmharicColumn: PresentationSourceInput = { title: 'Mislabelled', language: 'amharic', lyrics_amharic: 'Holy holy holy\nLord God almighty' }
const mismatched: PresentationSourceInput = {
  title: 'Mismatch', language: 'amharic',
  lyrics_amharic: 'አንድ\nሁለት\n\nሦስት\nአራት\n\nአምስት',
  lyrics_transliteration: 'And\nHulet\nSost\nArat',
}
const sectionAligned: PresentationSourceInput = {
  title: 'Sections', language: 'amharic',
  lyrics_amharic: 'አንድ\nሁለት\nሦስት\n\nአራት\nአምስት',
  lyrics_transliteration: 'And hulet\nSost\n\nArat\nAmist',
}
const oneLineVerses: PresentationSourceInput = { title: 'One', language: 'amharic', lyrics_amharic: 'አንድ\n\nሁለት\n\nሦስት', lyrics_transliteration: 'And\n\nHulet\n\nSost' }
const longSong: PresentationSourceInput = {
  title: 'Long', language: 'amharic',
  lyrics_amharic: Array.from({ length: 12 }, (_, s) => Array.from({ length: 6 }, (_, l) => `ቁጥር${s + 1} መስመር${l + 1}`).join('\n')).join('\n\n'),
}

const orig = (input: PresentationSourceInput) => splitLyricSections(input.lyrics_amharic).flatMap((s) => s.lines)

await test('sections: headings become labels, every sung line kept verbatim and in order', () => {
  const sections = splitLyricSections(AM)
  assert.deepEqual(sections.map((s) => s.label), ['CHORUS', 'VERSE 1', 'CHORUS'])
  assert.deepEqual(sections.map((s) => s.kind), ['chorus', 'verse', 'chorus'])
  assert.equal(sections[0].lines[1], 'ስብሐት ለእግዚአብሔር (2x)') // repeat marker preserved
})

await test('original-language slides contain exactly the original lines (no invention, no loss)', () => {
  const source = buildPresentationSource(full)
  for (const lines of [1, 2, 3, 4, 6] as const) {
    const slides = buildPresentationSlides(source, { language: 'original', linesPerSlide: lines })
    assert.deepEqual(flattenSlideText(slides), orig(full), `lines=${lines}`)
    assert.ok(slides.every((s) => s.lines.length <= lines && s.lines.length > 0), `limit ${lines}`)
  }
})

await test('lines-per-slide: refrain/verse boundaries are respected when grouping is on', () => {
  const source = buildPresentationSource(full)
  const slides = buildPresentationSlides(source, { language: 'original', linesPerSlide: 4 })
  assert.deepEqual(slides.map((s) => s.lines.length), [2, 4, 1, 2])
  assert.deepEqual(slides.map((s) => s.label), ['CHORUS', 'VERSE 1', 'VERSE 1', 'CHORUS'])
  const flowing = buildPresentationSlides(source, { language: 'original', linesPerSlide: 4, groupBySection: false })
  assert.deepEqual(flowing.map((s) => s.lines.length), [4, 4, 1])
  assert.deepEqual(flattenSlideText(flowing), orig(full))
})

await test('repeated refrains appear each time they are written (not de-duplicated, not added)', () => {
  const slides = buildPresentationSlides(buildPresentationSource(full), { language: 'original', linesPerSlide: 6 })
  assert.equal(slides.filter((s) => s.kind === 'chorus').length, 2)
})

await test('Auto lines balances long sections and honours capacity', () => {
  const source = buildPresentationSource(longSong)
  const slides = buildPresentationSlides(source, { language: 'original', linesPerSlide: 'auto', autoCapacity: 4 })
  assert.equal(slides.length, 24) // 12 sections × 6 lines → 3+3 each
  assert.ok(slides.every((s) => s.lines.length === 3))
  assert.deepEqual(flattenSlideText(slides), orig(longSong))
  assert.equal(autoLinesCapacity(64, false), 8)
  assert.ok(autoLinesCapacity(128, true) < autoLinesCapacity(64, true))
})

await test('one-line verses give one slide each', () => {
  const slides = buildPresentationSlides(buildPresentationSource(oneLineVerses), { language: 'original', linesPerSlide: 4 })
  assert.deepEqual(slides.map((s) => s.lines.length), [1, 1, 1])
})

await test('language options: Amharic, Transliteration, English, Both — available only when real text exists', () => {
  const src = buildPresentationSource(full)
  assert.deepEqual(src.languages.map((l) => [l.id, l.available]), [['original', true], ['transliteration', true], ['english', true], ['both', true]])
  assert.equal(src.original?.labelEn, 'Amharic')
  const only = buildPresentationSource(amharicOnly)
  assert.deepEqual(only.languages.filter((l) => l.available).map((l) => l.id), ['original'])
  assert.ok(only.languages.find((l) => l.id === 'both')?.reason)
  assert.deepEqual(buildPresentationSlides(only, { language: 'transliteration', linesPerSlide: 4 }).flatMap((s) => s.lines.map((l) => l.text)), ['አንድ', 'ሁለት', 'ሦስት'], 'unavailable language falls back to the original, never blank or invented')
})

await test('English-only songs: original is English; no duplicate English option', () => {
  const src = buildPresentationSource(englishOnly)
  assert.equal(src.original?.code, 'en')
  assert.equal(src.languages.find((l) => l.id === 'english')?.available, false)
  assert.equal(src.defaultLanguage, 'original')
  const mis = buildPresentationSource(englishInAmharicColumn)
  assert.equal(mis.original?.code, 'en')
  assert.equal(mis.original?.isEthiopic, false)
})

await test('language switching keeps each language’s own text', () => {
  const src = buildPresentationSource(full)
  const tr = buildPresentationSlides(src, { language: 'transliteration', linesPerSlide: 2 })
  assert.deepEqual(flattenSlideText(tr), splitLyricSections(TR).flatMap((s) => s.lines))
  assert.ok(tr.every((s) => !s.isEthiopic))
  const en = buildPresentationSlides(src, { language: 'english', linesPerSlide: 6 })
  assert.deepEqual(flattenSlideText(en), ['Hallelujah, hallelujah', 'Glory to God', 'The first line', 'The second line'])
})

await test('Both: line-for-line pairing when line counts match', () => {
  const slides = buildPresentationSlides(buildPresentationSource(full), { language: 'both', linesPerSlide: 2 })
  const first = slides[0].lines[0]
  assert.equal(first.text, 'ሃሌ ሉያ ሃሌ ሉያ')
  assert.equal(first.secondary, 'Hale luya hale luya')
  const all = slides.flatMap((s) => s.lines)
  assert.deepEqual(all.map((l) => l.secondary), splitLyricSections(TR).flatMap((s) => s.lines))
  const hidden = buildPresentationSlides(buildPresentationSource(full), { language: 'both', linesPerSlide: 2, showTransliteration: false })
  assert.ok(hidden.every((s) => s.lines.every((l) => !l.secondary)))
})

await test('Both: section-level alignment keeps transliteration inside its own verse', () => {
  const src = buildPresentationSource(sectionAligned)
  assert.equal(src.bothAlignment, 'sections')
  const slides = buildPresentationSlides(src, { language: 'both', linesPerSlide: 6 })
  assert.equal(slides.length, 2)
  assert.deepEqual(slides[0].lines.map((l) => l.secondary ?? ''), ['And hulet', 'Sost', ''])
  assert.deepEqual(slides[1].lines.map((l) => l.secondary), ['Arat', 'Amist'])
})

await test('Both is disabled (not faked) when transliteration cannot be aligned', () => {
  const src = buildPresentationSource(mismatched)
  assert.equal(src.bothAlignment, 'none')
  assert.equal(src.languages.find((l) => l.id === 'both')?.available, false)
  assert.equal(resolveLanguage(src, 'both'), 'original')
})

await test('title slide is separate and optional; lyrics never include the title', () => {
  const src = buildPresentationSource(full)
  const withTitle = buildPresentationSlides(src, { language: 'original', linesPerSlide: 4, includeTitleSlide: true })
  assert.equal(withTitle[0].type, 'title')
  assert.equal(withTitle[0].title, 'ሃሌ ሉያ')
  assert.equal(withTitle[0].subtitle, 'Hale Luya')
  assert.equal(withTitle[0].singer, 'Test Zemari')
  assert.ok(!flattenSlideText(withTitle).includes('ሃሌ ሉያ') || orig(full).includes('ሃሌ ሉያ'))
  const without = buildPresentationSlides(src, { language: 'original', linesPerSlide: 4, includeTitleSlide: false })
  assert.equal(without.length, withTitle.length - 1)
})

await test('Unicode is preserved byte-for-byte (Ethiopic, Geʽez punctuation)', () => {
  const text = 'ሰአሊ ለነ ቅድስት፤\nወላዲተ አምላክ።'
  const slides = buildPresentationSlides(buildPresentationSource({ title: 'x', lyrics_amharic: text }), { language: 'original', linesPerSlide: 2 })
  assert.equal(flattenSlideText(slides).join('\n'), text)
})

await test('navigation helpers: clamp and keep position across rebuilds', () => {
  assert.equal(clampSlideIndex(-3, 5), 0)
  assert.equal(clampSlideIndex(9, 5), 4)
  assert.equal(clampSlideIndex(2, 0), 0)
  const src = buildPresentationSource(full)
  const one = buildPresentationSlides(src, { language: 'original', linesPerSlide: 1 })
  const four = buildPresentationSlides(src, { language: 'original', linesPerSlide: 4 })
  // line 6 (index 5, "ራብዓይ መስመር") on the 1-line deck → the slide containing it on the 4-line deck
  const mapped = mapSlideIndex(one, four, 5)
  assert.ok(four[mapped].lines.some((l) => l.text === one[5].lines[0].text))
})

await test('preferences are sanitised (only safe presentation settings are stored)', () => {
  assert.deepEqual(sanitizePresentationPrefs(null), DEFAULT_PRESENTATION_PREFS)
  const p = sanitizePresentationPrefs({ fontSize: 9999, linesPerSlide: 5, theme: 'pink', align: 'right', language: 'klingon', lyrics: 'should not be kept' })
  assert.equal(p.fontSize, 128)
  assert.equal(p.linesPerSlide, 'auto')
  assert.equal(p.theme, 'navy')
  assert.equal(p.align, 'center')
  assert.equal(p.language, null)
  assert.ok(!('lyrics' in p))
})

await test('Copy Link uses the exact current Mezmur page URL (no hash, not the home page)', () => {
  assert.equal(
    currentMezmurUrl({ origin: 'https://tewahedodaily.pages.dev', pathname: '/practice/mezmur/zeawredke-mena', search: '' }),
    'https://tewahedodaily.pages.dev/practice/mezmur/zeawredke-mena',
  )
  assert.equal(
    currentMezmurUrl({ origin: 'https://x.dev', pathname: '/hymns/mezmur/a', search: '?language=am' }),
    'https://x.dev/hymns/mezmur/a?language=am',
  )
})

await test('PPTX fit: font size is reduced only when the estimate would overflow', () => {
  const src = buildPresentationSource(longSong)
  const [slide] = buildPresentationSlides(src, { language: 'original', linesPerSlide: 6 })
  assert.equal(pxToPt(64), 32)
  assert.equal(fitFontSizePt(slide, 32), 32)
  const huge = fitFontSizePt(slide, 80)
  assert.ok(huge < 80)
  assert.ok(estimateSlideHeightPt(slide, huge) <= (SLIDE_H - 1.7) * 72)
})

async function inspectPptx(input: PresentationSourceInput, language: 'original' | 'both' | 'transliteration', linesPerSlide: 1 | 2 | 3 | 4 | 6, includeTitle: boolean) {
  const src = buildPresentationSource(input)
  const slides = buildPresentationSlides(src, { language, linesPerSlide, includeTitleSlide: includeTitle })
  const { pptx, report, fileName } = await buildPptx({
    slides, title: src.title, fontSize: 72, theme: 'navy', align: 'center', attribution: src.attribution, includeAttribution: true,
  })
  const buffer = (await pptx.write({ outputType: 'nodebuffer' })) as Buffer
  const zip = await JSZip.loadAsync(buffer)
  const slideFiles = Object.keys(zip.files).filter((n) => /^ppt\/slides\/slide\d+\.xml$/.test(n))
    .sort((a, b) => Number(a.match(/\d+/)![0]) - Number(b.match(/\d+/)![0]))
  const xml = await Promise.all(slideFiles.map((n) => zip.file(n)!.async('string')))
  const presentation = await zip.file('ppt/presentation.xml')!.async('string')
  return { src, slides, xml, presentation, report, fileName, buffer, zip }
}

const decode = (s: string) => s.replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(/&quot;/g, '"').replace(/&apos;/g, "'").replace(/&amp;/g, '&')
const texts = (xml: string) => [...xml.matchAll(/<a:t>([^<]*)<\/a:t>/g)].map((m) => decode(m[1]))

await test('PPTX: one slide per lyric segment (+ title), 16:9, real editable text, Unicode intact', async () => {
  const { slides, xml, presentation, fileName, zip } = await inspectPptx(full, 'original', 4, true)
  assert.equal(xml.length, slides.length)
  assert.match(presentation, /<p:sldSz cx="12192000" cy="6858000"/) // 13.333in × 7.5in = 16:9
  assert.equal(fileName, 'ሃሌ ሉያ.pptx')
  assert.ok(texts(xml[0]).includes('ሃሌ ሉያ'), 'title slide text')
  for (let i = 1; i < slides.length; i++) {
    const t = texts(xml[i])
    for (const line of slides[i].lines) assert.ok(t.includes(line.text), `slide ${i + 1} missing "${line.text}"`)
  }
  assert.deepEqual(
    xml.slice(1).flatMap((x, i) => texts(x).filter((s) => slides[i + 1].lines.some((l) => l.text === s))),
    orig(full),
    'every lyric line exported once, in order',
  )
  const media = Object.keys(zip.files).filter((n) => n.startsWith('ppt/media/') && !zip.files[n].dir)
  assert.deepEqual(media, [], 'no images — text only')
  assert.ok(xml.every((x) => !/<p:pic>/.test(x)))
})

await test('PPTX: line breaks preserved, both-mode carries transliteration, attribution on last slide', async () => {
  const { slides, xml } = await inspectPptx(full, 'both', 2, false)
  const firstLyric = xml[0]
  assert.ok((firstLyric.match(/<a:p>/g) || []).length >= slides[0].lines.length * 2, 'one paragraph per line')
  assert.ok(texts(firstLyric).includes('Hale luya hale luya'))
  assert.ok(texts(xml[xml.length - 1]).some((t) => t.includes('Synthetic test fixture')))
})

await test('PPTX: lines-per-slide setting changes slide count; font sizes stay within the slide', async () => {
  const one = await inspectPptx(longSong, 'original', 1, false)
  const six = await inspectPptx(longSong, 'original', 6, false)
  assert.equal(one.xml.length, 72)
  assert.equal(six.xml.length, 12)
  for (const r of six.report) assert.ok(r.usedPt <= r.requestedPt)
  const sz = [...six.xml[0].matchAll(/sz="(\d+)"/g)].map((m) => Number(m[1]) / 100)
  assert.ok(Math.max(...sz) <= 36, `largest font ${Math.max(...sz)}pt`)
})

await test('Present Mezmur UI: lazy-loaded presentation and PowerPoint generator', () => {
  const reader = readFileSync('src/components/hymns/HymnLyricsExperience.tsx', 'utf8')
  assert.match(reader, /lazy\(loadPresentation\)/)
  assert.match(reader, /import\('\.\/presentation\/MezmurPresentation'\)/)
  assert.doesNotMatch(reader, /from 'pptxgenjs'/)
  assert.doesNotMatch(reader, /^import .*pptxExport/m)
  assert.match(reader, /data-testid="present-mezmur"/)
  assert.doesNotMatch(reader, />\s*\{t\.(pdf|slides|live)\}\s*</, 'PDF / Slides / Live buttons removed from the toolbar')
  const pres = readFileSync('src/components/hymns/presentation/MezmurPresentation.tsx', 'utf8')
  assert.match(pres, /requestFullscreen/)
  assert.match(pres, /import\('\.\.\/\.\.\/\.\.\/lib\/mezmur\/pptxExport'\)/)
  assert.doesNotMatch(pres, /^import .*pptxgenjs/m)
})

console.log(`\n${passed} passed, ${failures.length} failed`)
if (failures.length) process.exit(1)
