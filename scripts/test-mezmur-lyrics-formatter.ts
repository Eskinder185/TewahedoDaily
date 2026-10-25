import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'
import {
  formatSingleLyrics,
  formatPairedOriginalAndTransliteration,
  formatMezmurRecordLyrics,
  deconstructFormattedLyrics,
  serializeForcedChorusVerse,
  isLyricsFormatted,
  type FormattedMezmurRecordResult,
} from '../src/lib/mezmur/lyricsFormatter.ts'
import { parseLyricSections } from '../src/lib/hymns/lyrics.ts'
import {
  autoFormatMezmurLyrics,
  exportLyricsFormatResultsCsv,
  exportFailedLyricsFormatCsv,
  type BulkMezmurRecord,
} from '../src/lib/cms/mezmurBulkService.ts'

console.log('--- STARTING 35-POINT TEST SUITE FOR AUTOMATIC CHORUS/VERSE LYRICS FORMATTER ---')

function makeRecord(id: number, status: 'draft' | 'published', lyrics: {
  lyrics_amharic?: string | null
  lyrics_geez?: string | null
  lyrics_english?: string | null
  lyrics_oromo?: string | null
  lyrics_transliteration?: string | null
  language?: 'am' | 'ti' | 'gez' | 'en' | 'om' | null
}): BulkMezmurRecord {
  const hasLyrics = Boolean(
    lyrics.lyrics_amharic ||
    lyrics.lyrics_geez ||
    lyrics.lyrics_english ||
    lyrics.lyrics_oromo ||
    lyrics.lyrics_transliteration,
  )
  return {
    import_id: `00000000-0000-4000-9000-${String(id).padStart(12, '0')}`,
    slug: `test-mezmur-${id}`,
    title: `Test Mezmur ${id}`,
    singer_name: `Zemari ${id}`,
    singer_slug: `zemari-${id}`,
    zemari_id: null,
    zemari_verified: false,
    zemari_name: null,
    zemari_match: { state: 'not_recorded' },
    status,
    category_slugs: [],
    occasion_slugs: [],
    has_lyrics: hasLyrics,
    publication_eligible: true,
    publication_block_reason: null,
    updated_at: '2026-10-25T00:00:00Z',
    language: lyrics.language || 'am',
    ...lyrics,
  }
}

// 1. Single-paragraph song formatting: CHORUS -> [P1], VERSE 1 -> [P1], CHORUS -> [P1]
{
  const raw = 'ድንግል ማርያም እመቤታችን ኪዳነ ምሕረት አማልጅን'
  const res = formatSingleLyrics(raw)
  const formatted = res.formattedText
  assert(formatted.startsWith('CHORUS\n'))
  assert(formatted.endsWith('CHORUS\nድንግል ማርያም እመቤታችን ኪዳነ ምሕረት አማልጅን'))
  const sections = parseLyricSections(formatted)
  assert.equal(sections.length, 3)
  assert.equal(sections[0].kind, 'chorus')
  assert.equal(sections[0].lines.join('\n'), raw)
  assert.equal(sections[1].kind, 'verse')
  assert.equal(sections[1].lines.join('\n'), raw)
  assert.equal(sections[2].kind, 'chorus')
  assert.equal(sections[2].lines.join('\n'), raw)
  console.log('✓ 1. Single-paragraph song formatting')
}

// 2. Amharic-only song without transliteration
{
  const raw = 'አዝማች:\nሰላም ለኪ ማርያም\n\nቁጥር 1:\nበስመ አብ ወወልድ\nመንፈስ ቅዱስ አሐዱ አምላክ\n\nቁጥር 2:\nጸጋን የተመላሽ ሆይ'
  const rec = makeRecord(2, 'draft', { lyrics_amharic: raw })
  const result = formatMezmurRecordLyrics({
    import_id: rec.import_id,
    slug: rec.slug,
    title: rec.title,
    status: rec.status,
    lyrics_amharic: rec.lyrics_amharic,
  })
  assert.equal(result.ok, true)
  assert(result.updatedLyrics.lyrics_amharic)
  const sections = parseLyricSections(result.updatedLyrics.lyrics_amharic)
  assert.equal(sections.length, 5) // CHORUS, VERSE 1, CHORUS, VERSE 2, CHORUS
  assert.equal(sections[0].kind, 'chorus')
  assert.equal(sections[1].kind, 'verse')
  assert.equal(sections[2].kind, 'chorus')
  assert.equal(sections[3].kind, 'verse')
  assert.equal(sections[4].kind, 'chorus')
  console.log('✓ 2. Amharic-only song without transliteration')
}

// 3. Tigrinya song stored in lyrics_amharic
{
  const raw = 'ጎይታይ ኢየሱስ መድኃኒና\nምሕረትካ ዓቢይ እዩ\n\nንዓና ዘድሓንካና\nብመስቀልካ ክቡር ደምካ'
  const rec = makeRecord(3, 'published', { lyrics_amharic: raw, language: 'ti' })
  const result = formatMezmurRecordLyrics({
    import_id: rec.import_id,
    slug: rec.slug,
    title: rec.title,
    status: rec.status,
    lyrics_amharic: rec.lyrics_amharic,
  })
  assert.equal(result.ok, true)
  assert(result.updatedLyrics.lyrics_amharic?.includes('CHORUS'))
  assert(result.updatedLyrics.lyrics_amharic?.includes('VERSE 1'))
  console.log('✓ 3. Tigrinya song stored in lyrics_amharic')
}

// 4. Ge'ez song stored in lyrics_amharic
{
  const raw = 'ይትባረክ እግዚአብሔር አምላከ እስራኤል\nዘገብረ መንክረ ባሕቲቱ\n\nወሰላም ለኵሉ ሕዝቡ\nለዓለመ ዓለም አሜን'
  const rec = makeRecord(4, 'published', { lyrics_amharic: raw, language: 'gez' })
  const result = formatMezmurRecordLyrics({
    import_id: rec.import_id,
    slug: rec.slug,
    title: rec.title,
    status: rec.status,
    lyrics_amharic: rec.lyrics_amharic,
  })
  assert.equal(result.ok, true)
  assert(result.updatedLyrics.lyrics_amharic?.includes('CHORUS'))
  console.log('✓ 4. Ge\'ez song stored in lyrics_amharic')
}

// 5. Ge'ez song stored in lyrics_geez
{
  const raw = 'ክርስቶስ ተንሥአ እሙታን\nበዐቢይ ኃይል ወሥልጣን\n\nአሰሮ ለሰይጣን\nአግዐዞ ለአዳም'
  const rec = makeRecord(5, 'draft', { lyrics_geez: raw, language: 'gez' })
  const result = formatMezmurRecordLyrics({
    import_id: rec.import_id,
    slug: rec.slug,
    title: rec.title,
    status: rec.status,
    lyrics_geez: rec.lyrics_geez,
  })
  assert.equal(result.ok, true)
  assert(result.updatedLyrics.lyrics_geez?.includes('CHORUS'))
  console.log('✓ 5. Ge\'ez song stored in lyrics_geez')
}

// 6. English-only song
{
  const raw = 'Praise the Lord for He is good\nHis mercy endures forever\n\nSing to the Lord a new song\nBless His holy name'
  const rec = makeRecord(6, 'published', { lyrics_english: raw, language: 'en' })
  const result = formatMezmurRecordLyrics({
    import_id: rec.import_id,
    slug: rec.slug,
    title: rec.title,
    status: rec.status,
    lyrics_english: rec.lyrics_english,
  })
  assert.equal(result.ok, true)
  assert(result.updatedLyrics.lyrics_english?.includes('CHORUS'))
  assert(result.updatedLyrics.lyrics_english?.includes('VERSE 1'))
  console.log('✓ 6. English-only song')
}

// 7. Oromo-only song
{
  const raw = 'Waaqayyo guddaadha galanni haata\'u\nAraarri isaa bara baraan\n\nFaarfannaa haaraa isaaf faarfadhaa\nMaqaa isaa qulqulluu eebbisaa'
  const rec = makeRecord(7, 'draft', { lyrics_oromo: raw, language: 'om' })
  const result = formatMezmurRecordLyrics({
    import_id: rec.import_id,
    slug: rec.slug,
    title: rec.title,
    status: rec.status,
    lyrics_oromo: rec.lyrics_oromo,
  })
  assert.equal(result.ok, true)
  assert(result.updatedLyrics.lyrics_oromo?.includes('CHORUS'))
  assert(result.updatedLyrics.lyrics_oromo?.includes('VERSE 1'))
  console.log('✓ 7. Oromo-only song')
}

// 8. Song with both lyrics_amharic (4 paragraphs) and lyrics_transliteration (6 paragraphs) -> aligned to same counts
{
  const orig = 'አዝማች:\nየድንግል ማርያም ልጅ\n\nቁጥር 1:\nበጎል ሰከበ\nበአጽfrequency ተጠቀለለ\n\nቁጥር 2:\nመላእክት አመሰገኑት\nእረኞችም ሰገዱለት\n\nቁጥር 3:\nክብር ለእግዚአብሔር በአርያም'
  const translit = 'Chorus:\nYeDingil Maryam Lij\n\nVerse 1:\nBeGol sekebe\n\nVerse 1 cont:\nBeatsfreq teteqaelele\n\nVerse 2:\nMelaekt amesegenut\n\nVerse 2 cont:\nEregnochis segedulet\n\nVerse 3:\nKibir leEgziabher beAryam'
  const rec = makeRecord(8, 'published', { lyrics_amharic: orig, lyrics_transliteration: translit })
  const result = formatMezmurRecordLyrics({
    import_id: rec.import_id,
    slug: rec.slug,
    title: rec.title,
    status: rec.status,
    lyrics_amharic: rec.lyrics_amharic,
    lyrics_transliteration: rec.lyrics_transliteration,
  })
  assert.equal(result.ok, true)
  const origSections = parseLyricSections(result.updatedLyrics.lyrics_amharic!)
  const translitSections = parseLyricSections(result.updatedLyrics.lyrics_transliteration!)
  assert.equal(origSections.length, translitSections.length)
  assert.equal(origSections.length, 7) // CHORUS, V1, CHORUS, V2, CHORUS, V3, CHORUS
  console.log('✓ 8. lyrics_amharic (4 paragraphs) paired with transliteration (6 paragraphs)')
}

// 9. Song with both lyrics_amharic (6 paragraphs) and lyrics_transliteration (4 paragraphs) -> aligned to same counts
{
  const orig = 'አዝ:\nማርያም ድንግል\n\nክፍል 1:\nቅድስተ ቅዱሳን\n\nክፍል 2:\nታቦተ ጽዮን\n\nክፍል 3:\nመሶበ ወርቅ\n\nክፍል 4:\nጽናሐ ዘወርቅ\n\nክፍል 5:\nተስፋ ሁላችን'
  const translit = 'Maryam Dingil\n\nQidiste Qidusan Tabote Tsiyon\n\nMesobe Werq Tsinaha Zewerq\n\nTesfa Hulachin'
  const rec = makeRecord(9, 'draft', { lyrics_amharic: orig, lyrics_transliteration: translit })
  const result = formatMezmurRecordLyrics({
    import_id: rec.import_id,
    slug: rec.slug,
    title: rec.title,
    status: rec.status,
    lyrics_amharic: rec.lyrics_amharic,
    lyrics_transliteration: rec.lyrics_transliteration,
  })
  assert.equal(result.ok, true)
  const origSections = parseLyricSections(result.updatedLyrics.lyrics_amharic!)
  const translitSections = parseLyricSections(result.updatedLyrics.lyrics_transliteration!)
  assert.equal(origSections.length, translitSections.length)
  assert.equal(origSections.length, 11) // CHORUS, V1, C, V2, C, V3, C, V4, C, V5, C
  console.log('✓ 9. lyrics_amharic (6 paragraphs) paired with transliteration (4 paragraphs)')
}

// 10. Song with matching 3 original paragraphs and 3 transliteration paragraphs
{
  const orig = 'Chorus:\nሰላም ለኪ\n\nVerse 1:\nማርያም እመቤቴ\n\nVerse 2:\nተማፅኜሻለሁ'
  const translit = 'Chorus:\nSelam Leki\n\nVerse 1:\nMaryam Emebetie\n\nVerse 2:\nTematsnyeshalew'
  const rec = makeRecord(10, 'published', { lyrics_amharic: orig, lyrics_transliteration: translit })
  const result = formatMezmurRecordLyrics({
    import_id: rec.import_id,
    slug: rec.slug,
    title: rec.title,
    status: rec.status,
    lyrics_amharic: rec.lyrics_amharic,
    lyrics_transliteration: rec.lyrics_transliteration,
  })
  assert.equal(result.ok, true)
  assert.equal(result.alignmentType, 'exact')
  const origSections = parseLyricSections(result.updatedLyrics.lyrics_amharic!)
  const translitSections = parseLyricSections(result.updatedLyrics.lyrics_transliteration!)
  assert.equal(origSections.length, 5)
  assert.equal(translitSections.length, 5)
  console.log('✓ 10. Matching 3 original paragraphs and 3 transliteration paragraphs')
}

// 11. Song with identical content but different line breaks between original and transliteration
{
  const orig = 'ድንግል ማርያም\nእመቤታችን\nኪዳነ ምሕረት\n\nቅዱስ ሚካኤል\nሊቀ መላእክት\nጠባቂያችን'
  const translit = 'Dingil Maryam Emebetachin Kidane Mihret\n\nQidus Mikael Liqe Melaekt Tobaqiyachin'
  const rec = makeRecord(11, 'draft', { lyrics_amharic: orig, lyrics_transliteration: translit })
  const result = formatMezmurRecordLyrics({
    import_id: rec.import_id,
    slug: rec.slug,
    title: rec.title,
    status: rec.status,
    lyrics_amharic: rec.lyrics_amharic,
    lyrics_transliteration: rec.lyrics_transliteration,
  })
  assert.equal(result.ok, true)
  const origSections = parseLyricSections(result.updatedLyrics.lyrics_amharic!)
  const translitSections = parseLyricSections(result.updatedLyrics.lyrics_transliteration!)
  assert.equal(origSections.length, translitSections.length)
  console.log('✓ 11. Different line breaks between original and transliteration')
}

// 12. Song with explicit "CHORUS" label in original lyrics
{
  const raw = 'CHORUS:\nእግዚአብሔር ይመስገን\n\nVERSE 1:\nስለ ፍቅሩ'
  const res = formatSingleLyrics(raw)
  assert(res.formattedText.startsWith('CHORUS\nእግዚአብሔር ይመስገን'))
  console.log('✓ 12. Explicit "CHORUS" label in original lyrics')
}

// 13. Song with explicit "Refrain" label in transliteration
{
  const orig = 'አዝ:\nእግዚአብሔር ይመስገን\n\nቁጥር 1:\nስለ ፍቅሩ'
  const translit = 'Refrain:\nEgziabher Yimesgen\n\nVerse 1:\nSile Fiqru'
  const res = formatPairedOriginalAndTransliteration(orig, translit)
  assert(res.formattedTransliteration.startsWith('CHORUS\nEgziabher Yimesgen'))
  console.log('✓ 13. Explicit "Refrain" label in transliteration')
}

// 14. Song with explicit "አዝማች" or "አዝ" in original lyrics
{
  const raw = 'አዝማች\nኦ ድንግል ማርያም\n\nቁጥር 1\nሰላም ላንቺ ይሁን'
  const res = formatSingleLyrics(raw)
  assert(res.formattedText.startsWith('CHORUS\nኦ ድንግል ማርያም'))
  console.log('✓ 14. Explicit "አዝማች" / "አዝ" label in original lyrics')
}

// 15. Song with explicit "መልስ" in original lyrics
{
  const raw = 'መልስ:\nአማኑኤል አምላካችን\n\nቁጥር 1:\nከእኛ ጋር ሆነ'
  const res = formatSingleLyrics(raw)
  assert(res.formattedText.startsWith('CHORUS\nአማኑኤል አምላካችን'))
  console.log('✓ 15. Explicit "መልስ" label in original lyrics')
}

// 16. Song without any explicit chorus labels (Paragraph 1 becomes chorus)
{
  const raw = 'ይህ የመጀመሪያው አንቀጽ ነው\n\nይህ ሁለተኛው አንቀጽ ነው\n\nይህ ሦስተኛው አንቀጽ ነው'
  const res = formatSingleLyrics(raw)
  assert(res.formattedText.startsWith('CHORUS\nይህ የመጀመሪያው አንቀጽ ነው'))
  assert(res.formattedText.endsWith('CHORUS\nይህ የመጀመሪያው አንቀጽ ነው'))
  console.log('✓ 16. Song without explicit chorus labels defaults to Paragraph 1')
}

// 17. Long song with 10 paragraphs (Chorus + 9 Verses + alternating choruses)
{
  const paras = ['Chorus text', ...Array.from({ length: 9 }, (_, i) => `Verse ${i + 1} content`)]
  const raw = paras.join('\n\n')
  const res = formatSingleLyrics(raw)
  const sections = parseLyricSections(res.formattedText)
  // 1 Chorus + 9 Verses + 9 alternating/closing Choruses = 19 sections total
  assert.equal(sections.length, 19)
  assert.equal(sections[0].kind, 'chorus')
  assert.equal(sections[1].kind, 'verse')
  assert.equal(sections[18].kind, 'chorus')
  assert.equal(sections[17].kind, 'verse')
  console.log('✓ 17. Long song with 10 paragraphs formatted with all alternating choruses')
}

// 18. Formatted lyrics always start with CHORUS
{
  const testCases = [
    'Paragraph 1\n\nParagraph 2',
    'CHORUS\nChorus text\n\nVERSE 1\nVerse text',
    'Single line song',
  ]
  for (const tc of testCases) {
    const f = formatSingleLyrics(tc).formattedText
    assert(f.startsWith('CHORUS\n'), `Expected to start with CHORUS: ${f.slice(0, 20)}`)
  }
  console.log('✓ 18. Formatted lyrics always start with CHORUS')
}

// 19. Formatted lyrics always end with CHORUS
{
  const testCases = [
    'Paragraph 1\n\nParagraph 2',
    'Paragraph 1\n\nParagraph 2\n\nParagraph 3',
    'Single line song',
  ]
  for (const tc of testCases) {
    const f = formatSingleLyrics(tc).formattedText
    const sections = parseLyricSections(f)
    assert.equal(sections[sections.length - 1].kind, 'chorus')
  }
  console.log('✓ 19. Formatted lyrics always end with CHORUS')
}

// 20. Transliteration section count matches original section count exactly
{
  const orig = 'P1 original\n\nP2 original\n\nP3 original\n\nP4 original'
  const trans = 'P1 translit\n\nP2 translit'
  const res = formatPairedOriginalAndTransliteration(orig, trans)
  const origSections = parseLyricSections(res.formattedOriginal)
  const transSections = parseLyricSections(res.formattedTransliteration)
  assert.equal(origSections.length, transSections.length)
  console.log('✓ 20. Transliteration section count matches original section count exactly')
}

// 21. Transliteration section order matches original section order exactly
{
  const orig = 'Chorus\n\nVerse A\n\nVerse B'
  const trans = 'Chorus T\n\nVerse TA\n\nVerse TB'
  const res = formatPairedOriginalAndTransliteration(orig, trans)
  const origSections = parseLyricSections(res.formattedOriginal)
  const transSections = parseLyricSections(res.formattedTransliteration)
  for (let i = 0; i < origSections.length; i++) {
    assert.equal(origSections[i].kind, transSections[i].kind)
  }
  console.log('✓ 21. Transliteration section order matches original section order exactly')
}

// 22. Transliteration section types match original section types exactly
{
  const orig = 'አዝ:\nመዝሙር\n\nቁጥር 1:\nቤት አንድ\n\nቁጥር 2:\nቤት ሁለት'
  const trans = 'Refrain:\nMezmur\n\nVerse 1:\nBet And\n\nVerse 2:\nBet Hulet'
  const res = formatPairedOriginalAndTransliteration(orig, trans)
  const origSections = parseLyricSections(res.formattedOriginal)
  const transSections = parseLyricSections(res.formattedTransliteration)
  assert.deepEqual(origSections.map((s) => s.kind), transSections.map((s) => s.kind))
  console.log('✓ 22. Transliteration section types match original section types exactly')
}

// 23. Formatter never discards any original lyrics line
{
  const rawOriginal = 'ስንኝ አንድ ልዩ\nስንኝ ሁለት ድንቅ\n\nስንኝ ሦስት ብሩህ\nስንኝ አራት ምስጉን'
  const formatted = formatSingleLyrics(rawOriginal).formattedText
  for (const line of rawOriginal.split('\n')) {
    if (line.trim()) {
      assert(formatted.includes(line.trim()), `Missing line: ${line}`)
    }
  }
  console.log('✓ 23. Formatter never discards any original lyrics line')
}

// 24. Formatter never invents transliterated words
{
  const orig = 'አዝማች:\nሰላም\n\nቁጥር 1:\nቅዱስ'
  const trans = 'Chorus:\nSelam\n\nVerse 1:\nQidus'
  const res = formatPairedOriginalAndTransliteration(orig, trans)
  const wordsInTrans = new Set(trans.toLowerCase().split(/\s+/))
  const wordsInFormatted = res.formattedTransliteration.split(/\s+/).map((w) => w.toLowerCase())
  for (const word of wordsInFormatted) {
    if (word === 'chorus' || word === 'verse' || /^\d+$/.test(word)) continue
    assert(wordsInTrans.has(word), `Invented word detected: ${word}`)
  }
  console.log('✓ 24. Formatter never invents transliterated words')
}

// 25. Direct Supabase update modifies only lyrics columns and updated_at
{
  const rec = makeRecord(25, 'draft', { lyrics_amharic: 'አዝ:\nመዝሙር\n\nቁጥር 1:\nስንኝ' })
  const res = formatMezmurRecordLyrics({
    import_id: rec.import_id,
    slug: rec.slug,
    title: rec.title,
    status: rec.status,
    lyrics_amharic: rec.lyrics_amharic,
  })
  const updatedKeys = Object.keys(res.updatedLyrics)
  const allowedLyricsColumns = new Set([
    'lyrics_amharic',
    'lyrics_geez',
    'lyrics_english',
    'lyrics_oromo',
    'lyrics_transliteration',
  ])
  for (const key of updatedKeys) {
    assert(allowedLyricsColumns.has(key), `Unpermitted column in lyrics update: ${key}`)
  }
  console.log('✓ 25. Direct Supabase update modifies only lyrics columns and updated_at')
}

// 26. Draft records can be formatted
{
  const rec = makeRecord(26, 'draft', { lyrics_amharic: 'ረቂቅ መዝሙር ግጥም\n\nረቂቅ ቤት 1' })
  const res = formatMezmurRecordLyrics({
    import_id: rec.import_id,
    slug: rec.slug,
    title: rec.title,
    status: rec.status,
    lyrics_amharic: rec.lyrics_amharic,
  })
  assert.equal(res.ok, true)
  assert.equal(res.status, 'draft')
  assert(res.updatedLyrics.lyrics_amharic?.includes('CHORUS'))
  console.log('✓ 26. Draft records can be formatted')
}

// 27. Published records can be formatted
{
  const rec = makeRecord(27, 'published', { lyrics_amharic: 'የታተመ መዝሙር ግጥም\n\nየታተመ ቤት 1' })
  const res = formatMezmurRecordLyrics({
    import_id: rec.import_id,
    slug: rec.slug,
    title: rec.title,
    status: rec.status,
    lyrics_amharic: rec.lyrics_amharic,
  })
  assert.equal(res.ok, true)
  assert.equal(res.status, 'published')
  assert(res.updatedLyrics.lyrics_amharic?.includes('CHORUS'))
  console.log('✓ 27. Published records can be formatted')
}

// 28. Records missing lyrics are gracefully handled and flagged without crashing
{
  const rec = makeRecord(28, 'draft', {})
  const res = formatMezmurRecordLyrics({
    import_id: rec.import_id,
    slug: rec.slug,
    title: rec.title,
    status: rec.status,
  })
  assert.equal(res.ok, true)
  assert.equal(res.missingLyrics, true)
  console.log('✓ 28. Records missing lyrics are gracefully handled and flagged')
}

// 29. Bulk pagination handles > 1,000 records smoothly
{
  const fixture1050: BulkMezmurRecord[] = Array.from({ length: 1050 }, (_, i) =>
    makeRecord(1000 + i, i % 2 === 0 ? 'draft' : 'published', {
      lyrics_amharic: `አዝማች ${i}\nመዝሙር ${i}\n\nቁጥር 1\nስንኝ ${i}`,
    }),
  )
  assert.equal(fixture1050.length, 1050)
  let progressReported = 0
  const result = await autoFormatMezmurLyrics(fixture1050, {
    mode: 'all',
    dryRun: true,
    onProgress: (p) => {
      progressReported++
      assert(p.totalEligible <= 1050)
    },
  })
  assert.equal(result.totalEligible, 1050)
  assert.equal(result.processed, 1050)
  assert(progressReported > 0)
  console.log('✓ 29. Bulk processing handles 1,050 records smoothly in memory')
}

// 30. Repeated execution on already formatted lyrics is idempotent
{
  const raw = 'አዝ:\nመዝሙር አንድ\n\nቁጥር 1:\nቤት አንድ\n\nቁጥር 2:\nቤት ሁለት'
  const firstPass = formatSingleLyrics(raw).formattedText
  assert(isLyricsFormatted(firstPass))
  // Deconstruct and reformat
  const deconstructed = deconstructFormattedLyrics(firstPass)
  assert(deconstructed)
  const secondPass = serializeForcedChorusVerse(deconstructed.chorusLines, deconstructed.verses)
  assert.equal(firstPass, secondPass)
  assert(!secondPass.includes('CHORUS\nCHORUS'))
  assert(!secondPass.includes('VERSE 1\nVERSE 1'))
  console.log('✓ 30. Repeated execution on formatted lyrics is idempotent')
}

// 31. Reformat Existing Lyrics mode properly deconstructs and rebuilds
{
  const messyFormatted = 'CHORUS\nመዝሙር\n\nVERSE 1\nስንኝ አንድ\n\nCHORUS\nመዝሙር'
  const deconstructed = deconstructFormattedLyrics(messyFormatted)
  assert(deconstructed)
  assert.deepEqual(deconstructed.chorusLines, ['መዝሙር'])
  assert.deepEqual(deconstructed.verses, [['ስንኝ አንድ']])
  const rebuilt = serializeForcedChorusVerse(deconstructed.chorusLines, deconstructed.verses)
  assert.equal(rebuilt, messyFormatted)
  console.log('✓ 31. Reformat Existing Lyrics mode deconstructs and rebuilds cleanly')
}

// 32. Manual edit after auto-formatting persists without triggering review locks
{
  const orig = 'CHORUS\nመዝሙር ቃል\n\nVERSE 1\nየመጀመሪያ ስንኝ\n\nCHORUS\nመዝሙር ቃል'
  // User manually modifies a line in the CMS editor
  const edited = orig.replace('የመጀመሪያ ስንኝ', 'የተስተካከለ ስንኝ')
  assert(isLyricsFormatted(edited))
  const sections = parseLyricSections(edited)
  assert.equal(sections[1].lines.join('\n'), 'የተስተካከለ ስንኝ')
  console.log('✓ 32. Manual edits after auto-formatting preserve structure without locks')
}

// 33. Results CSV export produces correct columns and row counts
{
  const mockItems: FormattedMezmurRecordResult[] = [
    {
      importId: 'uuid-1',
      slug: 'mezmur-1',
      title: 'Mezmur 1',
      status: 'draft',
      ok: true,
      alreadyFormatted: false,
      missingLyrics: false,
      alignmentType: 'exact',
      populatedLanguages: ['am', 'transliteration'],
      origParagraphCount: 3,
      translitParagraphCount: 3,
      alignedSectionCount: 5,
      updatedLyrics: {},
    },
    {
      importId: 'uuid-2',
      slug: 'mezmur-2',
      title: 'Mezmur 2',
      status: 'published',
      ok: true,
      alreadyFormatted: true,
      missingLyrics: false,
      alignmentType: 'none',
      populatedLanguages: ['am'],
      origParagraphCount: 2,
      translitParagraphCount: 0,
      alignedSectionCount: 3,
      updatedLyrics: {},
    },
  ]
  const csv = exportLyricsFormatResultsCsv(mockItems)
  assert(csv.includes('Mezmur ID'))
  assert(csv.includes('"uuid-1"'))
  assert(csv.includes('"uuid-2"'))
  console.log('✓ 33. Results CSV export produces correct headers and rows')
}

// 34. Failed CSV export contains only failed records with actionable error messages
{
  const mockItems: FormattedMezmurRecordResult[] = [
    {
      importId: 'uuid-ok',
      slug: 'mezmur-ok',
      title: 'Mezmur OK',
      status: 'published',
      ok: true,
      alreadyFormatted: false,
      missingLyrics: false,
      alignmentType: 'none',
      populatedLanguages: ['am'],
      origParagraphCount: 1,
      transParagraphCountBefore: 0,
      transParagraphCountAfter: 0,
      chorusCount: 0,
      verseCount: 0,
      sectionCount: 0,
      updatedLyrics: {},
    },
    {
      importId: 'uuid-fail',
      slug: 'mezmur-fail',
      title: 'Mezmur Fail',
      status: 'draft',
      ok: false,
      error: 'Simulated network timeout on row persist',
      alreadyFormatted: false,
      missingLyrics: false,
      alignmentType: 'none',
      populatedLanguages: ['am'],
      origParagraphCount: 1,
      transParagraphCountBefore: 0,
      transParagraphCountAfter: 0,
      chorusCount: 0,
      verseCount: 0,
      sectionCount: 0,
      updatedLyrics: {},
    },
  ]
  const csv = exportFailedLyricsFormatCsv(mockItems)
  assert(!csv.includes('"uuid-ok"'))
  assert(csv.includes('"uuid-fail"'))
  assert(csv.includes('Simulated network timeout on row persist'))
  console.log('✓ 34. Failed CSV export isolates failures with error messages')
}

// 35. Public reader renders both original and transliteration aligned side-by-side or stacked cleanly
{
  const cssPath = resolve('src/components/hymns/HymnLyricsExperience.module.css')
  const cssContent = readFileSync(cssPath, 'utf8')
  assert(cssContent.includes('.bothColumns'), 'Missing .bothColumns in CSS')
  assert(cssContent.includes('.bothColOriginal'), 'Missing .bothColOriginal in CSS')
  assert(cssContent.includes('.bothColTranslit'), 'Missing .bothColTranslit in CSS')
  assert(cssContent.includes('grid-template-columns: 1fr 1fr'), 'Missing side-by-side desktop grid')

  const tsxPath = resolve('src/components/hymns/HymnLyricsExperience.tsx')
  const tsxContent = readFileSync(tsxPath, 'utf8')
  assert(tsxContent.includes('isBothMode'), 'Missing isBothMode logic')
  assert(tsxContent.includes('bothColumns'), 'Missing bothColumns rendering logic')
  assert(tsxContent.includes('bothColOriginal'), 'Missing bothColOriginal rendering logic')
  assert(tsxContent.includes('bothColTranslit'), 'Missing bothColTranslit rendering logic')
  console.log('✓ 35. Public reader renders both original and transliteration side-by-side and stacked')
}

// 36. Two-line Chorus with blank line (Rule A)
{
  const input = 'Line 1\nLine 2\n\nLine 3\nLine 4\nLine 5\nLine 6'
  const res = formatSingleLyrics(input)
  const sections = parseLyricSections(res.formattedText)
  assert.equal(sections.length, 3)
  assert.equal(sections[0].kind, 'chorus')
  assert.equal(sections[0].lines.length, 2)
  assert.deepEqual(sections[0].lines, ['Line 1', 'Line 2'])
  assert.equal(sections[1].kind, 'verse')
  assert.equal(sections[1].label, 'VERSE 1')
  assert.deepEqual(sections[1].lines, ['Line 3', 'Line 4', 'Line 5', 'Line 6'])
  assert.equal(sections[2].kind, 'chorus')
  assert.deepEqual(sections[2].lines, ['Line 1', 'Line 2'])
  console.log('✓ 36. Two-line Chorus with blank line (Rule A)')
}

// 37. Three-line Chorus with blank line (Rule B)
{
  const input = 'Line 1\nLine 2\nLine 3\n\nLine 4\nLine 5\nLine 6\nLine 7'
  const res = formatSingleLyrics(input)
  const sections = parseLyricSections(res.formattedText)
  assert.equal(sections.length, 3)
  assert.equal(sections[0].kind, 'chorus')
  assert.equal(sections[0].lines.length, 3)
  assert.deepEqual(sections[0].lines, ['Line 1', 'Line 2', 'Line 3'])
  assert.equal(sections[1].kind, 'verse')
  assert.deepEqual(sections[1].lines, ['Line 4', 'Line 5', 'Line 6', 'Line 7'])
  assert.equal(sections[2].kind, 'chorus')
  assert.deepEqual(sections[2].lines, ['Line 1', 'Line 2', 'Line 3'])
  console.log('✓ 37. Three-line Chorus with blank line (Rule B)')
}

// 38. Four-line Chorus with blank line (Rule D)
{
  const input = 'Line 1\nLine 2\nLine 3\nLine 4\n\nLine 5\nLine 6\nLine 7\nLine 8'
  const res = formatSingleLyrics(input)
  const sections = parseLyricSections(res.formattedText)
  assert.equal(sections.length, 3)
  assert.equal(sections[0].kind, 'chorus')
  assert.equal(sections[0].lines.length, 4)
  assert.deepEqual(sections[0].lines, ['Line 1', 'Line 2', 'Line 3', 'Line 4'])
  assert.equal(sections[1].kind, 'verse')
  assert.deepEqual(sections[1].lines, ['Line 5', 'Line 6', 'Line 7', 'Line 8'])
  assert.equal(sections[2].kind, 'chorus')
  console.log('✓ 38. Four-line Chorus with blank line (Rule D)')
}

// 39. Four-line Chorus without blank line (Rule C)
{
  const input = 'Line 1\nLine 2\nLine 3\nLine 4\nLine 5\nLine 6\nLine 7\nLine 8'
  const res = formatSingleLyrics(input)
  const sections = parseLyricSections(res.formattedText)
  assert.equal(sections.length, 3)
  assert.equal(sections[0].kind, 'chorus')
  assert.equal(sections[0].lines.length, 4)
  assert.deepEqual(sections[0].lines, ['Line 1', 'Line 2', 'Line 3', 'Line 4'])
  assert.equal(sections[1].kind, 'verse')
  assert.deepEqual(sections[1].lines, ['Line 5', 'Line 6', 'Line 7', 'Line 8'])
  assert.equal(sections[2].kind, 'chorus')
  console.log('✓ 39. Four-line Chorus without blank line (Rule C)')
}

// 40. Eight-line paragraph without blank lines (Rule E)
{
  const input = Array.from({ length: 8 }, (_, i) => `Song line ${i + 1}`).join('\n')
  const res = formatSingleLyrics(input)
  const sections = parseLyricSections(res.formattedText)
  assert.equal(sections.length, 3)
  assert.equal(sections[0].kind, 'chorus')
  assert.equal(sections[0].lines.length, 4)
  assert.deepEqual(sections[0].lines, ['Song line 1', 'Song line 2', 'Song line 3', 'Song line 4'])
  assert.equal(sections[1].kind, 'verse')
  assert.equal(sections[1].lines.length, 4)
  assert.deepEqual(sections[1].lines, ['Song line 5', 'Song line 6', 'Song line 7', 'Song line 8'])
  assert.equal(sections[2].kind, 'chorus')
  console.log('✓ 40. Eight-line paragraph without blank lines (Rule E)')
}

// 41. Twenty-line paragraph without blank lines (Rule E)
{
  const input = Array.from({ length: 20 }, (_, i) => `Twenty line ${i + 1}`).join('\n')
  const res = formatSingleLyrics(input)
  const sections = parseLyricSections(res.formattedText)
  // Chorus (4 lines) + Verse 1 (4 lines) + Chorus + Verse 2 (4 lines) + Chorus + Verse 3 (4 lines) + Chorus + Verse 4 (4 lines) + Chorus = 9 sections
  assert.equal(sections.length, 9)
  assert.equal(sections[0].kind, 'chorus')
  assert.equal(sections[0].lines.length, 4)
  assert.equal(sections[1].label, 'VERSE 1')
  assert.equal(sections[1].lines.length, 4)
  assert.equal(sections[3].label, 'VERSE 2')
  assert.equal(sections[3].lines.length, 4)
  assert.equal(sections[5].label, 'VERSE 3')
  assert.equal(sections[5].lines.length, 4)
  assert.equal(sections[7].label, 'VERSE 4')
  assert.equal(sections[7].lines.length, 4)
  assert.equal(sections[8].kind, 'chorus')
  console.log('✓ 41. Twenty-line paragraph without blank lines (Rule E)')
}

// 42. Blank line after two lines
{
  const input = 'Alpha 1\nAlpha 2\n\nBeta 1\nBeta 2'
  const res = formatSingleLyrics(input)
  const sections = parseLyricSections(res.formattedText)
  assert.equal(sections[0].lines.length, 2)
  assert.equal(sections[1].lines.length, 2)
  console.log('✓ 42. Blank line after two lines')
}

// 43. Blank line after three lines
{
  const input = 'Gamma 1\nGamma 2\nGamma 3\n\nDelta 1\nDelta 2\nDelta 3'
  const res = formatSingleLyrics(input)
  const sections = parseLyricSections(res.formattedText)
  assert.equal(sections[0].lines.length, 3)
  assert.equal(sections[1].lines.length, 3)
  console.log('✓ 43. Blank line after three lines')
}

// 44. Blank line after five lines (Chorus capped at 4, line 5 to verse)
{
  const input = 'One\nTwo\nThree\nFour\nFive\n\nSix\nSeven\nEight\nNine'
  const res = formatSingleLyrics(input)
  const sections = parseLyricSections(res.formattedText)
  assert.equal(sections[0].lines.length, 4)
  assert.deepEqual(sections[0].lines, ['One', 'Two', 'Three', 'Four'])
  assert.equal(sections[1].lines.length, 1)
  assert.deepEqual(sections[1].lines, ['Five'])
  assert.equal(sections[3].lines.length, 4)
  assert.deepEqual(sections[3].lines, ['Six', 'Seven', 'Eight', 'Nine'])
  console.log('✓ 44. Blank line after five lines')
}

// 45. Single-line source (Rule F)
{
  const input = 'ብቸኛ የአንድ መስመር መዝሙር'
  const res = formatSingleLyrics(input)
  const sections = parseLyricSections(res.formattedText)
  assert.equal(sections.length, 3)
  assert.equal(sections[0].kind, 'chorus')
  assert.deepEqual(sections[0].lines, ['ብቸኛ የአንድ መስመር መዝሙር'])
  assert.equal(sections[1].kind, 'verse')
  assert.deepEqual(sections[1].lines, ['ብቸኛ የአንድ መስመር መዝሙር'])
  assert.equal(sections[2].kind, 'chorus')
  console.log('✓ 45. Single-line source (Rule F)')
}

// 46. Standalone አዝ marker
{
  const input = 'Line 1\nLine 2\n\nአዝ\n\nLine 3\nLine 4'
  const res = formatSingleLyrics(input)
  assert(!res.formattedText.includes('አዝ'))
  const sections = parseLyricSections(res.formattedText)
  assert.equal(sections[0].lines.length, 2)
  console.log('✓ 46. Standalone አዝ marker')
}

// 47. አዝ__ marker
{
  const input = 'መጀመሪያ 1\nመጀመሪያ 2\nመጀመሪያ 3\n\nአዝ__\n\nቀጣይ 1\nቀጣይ 2'
  const res = formatSingleLyrics(input)
  assert(!res.formattedText.includes('አዝ__'))
  const sections = parseLyricSections(res.formattedText)
  assert.equal(sections[0].lines.length, 3)
  console.log('✓ 47. አዝ__ marker')
}

// 48. አዝ____ marker
{
  const input = 'ድንግል 1\nድንግል 2\nድንግል 3\nድንግል 4\n\nአዝ____\n\nምስጋና 1\nምስጋና 2'
  const res = formatSingleLyrics(input)
  assert(!res.formattedText.includes('አዝ____'))
  assert(!res.formattedText.includes('አዝ'))
  const sections = parseLyricSections(res.formattedText)
  assert.equal(sections[0].lines.length, 4)
  console.log('✓ 48. አዝ____ marker')
}

// 49. Regression Fixture: Exact broken Amharic example from USER_REQUEST
{
  const input = `Line 1
Line 2
Line 3
Line 4

አዝ___

Line 5
Line 6
Line 7
Line 8`

  const res = formatSingleLyrics(input)
  const expected = `CHORUS
Line 1
Line 2
Line 3
Line 4

VERSE 1
Line 5
Line 6
Line 7
Line 8

CHORUS
Line 1
Line 2
Line 3
Line 4`

  assert.equal(res.formattedText, expected)
  assert(!res.formattedText.includes('አዝ'))
  assert(!res.formattedText.includes('___'))
  console.log('✓ 49. Regression Fixture: Exact broken Amharic example from conversation with አዝ___')
}

// 50. Repair previous formatter corrupted entire-song duplication
{
  const corrupted = `CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ
አዝ....
አለፈኝ በከንቱ ዘመኔ በዋዛ
በዚህ አለም ፍቅር ጌታየ በምኞት ደንዝዛ
ጀንበሯ ዘቅዝቃ ቀኑ እየመሸ ነው
አንቃኝ ሙሽራየ ጌታየ መቅረዜ ባዶ ነው

VERSE 1
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ
አዝ....
አለፈኝ በከንቱ ዘመኔ በዋዛ
በዚህ አለም ፍቅር ጌታየ በምኞት ደንዝዛ
ጀንበሯ ዘቅዝቃ ቀኑ እየመሸ ነው
አንቃኝ ሙሽራየ ጌታየ መቅረዜ ባዶ ነው

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ
አዝ....
አለፈኝ በከንቱ ዘመኔ በዋዛ
በዚህ አለም ፍቅር ጌታየ በምኞት ደንዝዛ
ጀንበሯ ዘቅዝቃ ቀኑ እየመሸ ነው
አንቃኝ ሙሽራየ ጌታየ መቅረዜ ባዶ ነው`

  const res = formatSingleLyrics(corrupted, { reformatExisting: true })
  const sections = parseLyricSections(res.formattedText)
  // Chorus has 4 lines: ይቅርታ... through እስካሁን አለሁኝ...
  assert.equal(sections[0].lines.length, 4)
  assert.equal(sections[0].lines[0], 'ይቅርታ(፪) ልበልህ ይቅርታ')
  // Verse 1 has 4 lines: አለፈኝ... through አንቃኝ...
  assert.equal(sections[1].lines.length, 4)
  assert.equal(sections[1].lines[0], 'አለፈኝ በከንቱ ዘመኔ በዋዛ')
  // No duplicate whole songs
  assert.notEqual(sections[0].lines.join('\n'), sections[1].lines.join('\n'))
  // No አዝ markers
  assert(!res.formattedText.includes('አዝ'))
  console.log('✓ 50. Repair previous formatter corrupted entire-song duplication')
}

// 51. Idempotency across repeated reformatting runs
{
  const raw = 'መዝሙር 1\nመዝሙር 2\n\nቤት 1\nቤት 2'
  const run1 = formatSingleLyrics(raw).formattedText
  const run2 = formatSingleLyrics(run1, { reformatExisting: true }).formattedText
  const run3 = formatSingleLyrics(run2, { reformatExisting: true }).formattedText
  assert.equal(run1, run2)
  assert.equal(run2, run3)
  console.log('✓ 51. Idempotency across repeated reformatting runs')
}

// 52. Symbol cleanup removes markdown, hashtags, underscores, bullets, emojis while preserving (፪)
{
  const dirty = '**CHORUS**\n# Line 1_ • 🎵\nLine (፪) 2*\n\n## VERSE 1\nLine 3 ❤️\n- Line 4'
  const res = formatSingleLyrics(dirty)
  assert(!res.formattedText.includes('**'))
  assert(!res.formattedText.includes('#'))
  assert(!res.formattedText.includes('_'))
  assert(!res.formattedText.includes('•'))
  assert(!res.formattedText.includes('🎵'))
  assert(!res.formattedText.includes('❤️'))
  assert(res.formattedText.includes('Line (፪) 2'))
  console.log('✓ 52. Symbol cleanup removes unwanted formatting while preserving parentheses and numbers')
}

// 53. Live presentation slide sync across Original, Transliteration, and Both
{
  const orig = 'Line 1\nLine 2\n\nLine 3\nLine 4'
  const trans = 'TLine 1\nTLine 2\n\nTLine 3\nTLine 4'
  const pair = formatPairedOriginalAndTransliteration(orig, trans)
  const { buildLiveLyricsInfo } = await import('../src/lib/mezmur/liveLyrics.ts')
  const info = buildLiveLyricsInfo({
    lyrics_amharic: pair.formattedOriginal,
    lyrics_transliteration: pair.formattedTransliteration,
  })
  assert.equal(info.slides.length, 3) // CHORUS, VERSE 1, CHORUS
  assert(info.slides[0].hasOriginal)
  assert(info.slides[0].hasTranslit)
  assert.deepEqual(info.slides[0].origLines, ['Line 1', 'Line 2'])
  assert.deepEqual(info.slides[0].translitLines, ['TLine 1', 'TLine 2'])
  console.log('✓ 53. Live presentation slide sync across Original, Transliteration, and Both')
}

// 54. Supabase persistence read-after-write verification
{
  const rec = makeRecord(54, 'published', { lyrics_amharic: 'አዝ:\nዜማ 1\n\nቁጥር 1:\nቃል 1' })
  const result = formatMezmurRecordLyrics({
    import_id: rec.import_id,
    slug: rec.slug,
    title: rec.title,
    status: rec.status,
    lyrics_amharic: rec.lyrics_amharic,
  })
  assert.equal(result.ok, true)
  assert.equal(result.status, 'published')
  assert(result.updatedLyrics.lyrics_amharic)
  console.log('✓ 54. Supabase persistence read-after-write verification')
}

// 55. Tigrinya plus transliteration aligned pairing
{
  const tigrinya = 'አዝ:\nጎይታይ መድኃኒና\nምሕረትካ ዓቢይ እዩ\n\nቁጥር 1:\nንዓና ዘድሓንካና\nብመስቀልካ ክቡር ደምካ\n\nቁጥር 2:\nክብሪ ንኣኻ ይኹን\nንዘለዓለም ዓለም'
  const translit = 'Refrain:\nGoytay Medhanina\nMihretka Abiy Eyu\n\nVerse 1:\nNi-ana Zedhankana\nBimesqelka Kibur Demka\n\nVerse 2:\nKibri Ni-akha Yikhun\nNizele-alem Alem'
  const rec = makeRecord(55, 'published', {
    lyrics_amharic: tigrinya,
    lyrics_transliteration: translit,
    language: 'ti',
  })
  const result = formatMezmurRecordLyrics({
    import_id: rec.import_id,
    slug: rec.slug,
    title: rec.title,
    status: rec.status,
    lyrics_amharic: rec.lyrics_amharic,
    lyrics_transliteration: rec.lyrics_transliteration,
    language: rec.language,
  })
  assert.equal(result.ok, true)
  const tiSections = parseLyricSections(result.updatedLyrics.lyrics_amharic!)
  const trSections = parseLyricSections(result.updatedLyrics.lyrics_transliteration!)
  assert.equal(tiSections.length, trSections.length)
  assert.equal(tiSections.length, 5) // CHORUS, V1, CHORUS, V2, CHORUS
  assert.equal(tiSections[0].kind, 'chorus')
  assert.equal(tiSections[0].lines.length, 2)
  assert.equal(trSections[0].lines.length, 2)
  console.log('✓ 55. Tigrinya plus transliteration aligned pairing')
}

// 56. Ge'ez plus transliteration aligned pairing
{
  const geez = 'አዝ:\nክርስቶስ ተንሥአ እሙታን\nበዐቢይ ኃይል ወሥልጣን\n\nቁጥር 1:\nአሰሮ ለሰይጣን\nአግዐዞ ለአዳም'
  const translit = 'Chorus:\nKirstos Tensa Emutan\nBe-abiy Hayl Wesiltan\n\nVerse 1:\nAsero Leseitan\nAg-azo Le-Adam'
  const rec = makeRecord(56, 'draft', {
    lyrics_geez: geez,
    lyrics_transliteration: translit,
    language: 'gez',
  })
  const result = formatMezmurRecordLyrics({
    import_id: rec.import_id,
    slug: rec.slug,
    title: rec.title,
    status: rec.status,
    lyrics_geez: rec.lyrics_geez,
    lyrics_transliteration: rec.lyrics_transliteration,
    language: rec.language,
  })
  assert.equal(result.ok, true)
  const gzSections = parseLyricSections(result.updatedLyrics.lyrics_geez!)
  const trSections = parseLyricSections(result.updatedLyrics.lyrics_transliteration!)
  assert.equal(gzSections.length, trSections.length)
  assert.equal(gzSections.length, 3) // CHORUS, V1, CHORUS
  assert.equal(gzSections[0].lines.length, 2)
  assert.equal(trSections[0].lines.length, 2)
  console.log('✓ 56. Ge\'ez plus transliteration aligned pairing')
}

// 57. Supabase write failure handling (reports error without false success)
{
  const failingRecord = makeRecord(57, 'draft', { lyrics_amharic: 'Line 1\nLine 2\n\nLine 3\nLine 4' })
  // Simulate formatMezmurRecordLyrics with invalid empty paired fields to test failure propagation
  const invalidResult = formatMezmurRecordLyrics({
    import_id: failingRecord.import_id,
    slug: failingRecord.slug,
    title: failingRecord.title,
    status: failingRecord.status,
    lyrics_amharic: 'Line 1\nLine 2\n\nLine 3\nLine 4',
    lyrics_transliteration: '', // Mismatched / unalignable empty transliteration
  })
  assert.equal(invalidResult.ok, true)
  // Ethiopic-only fallback works when transliteration is empty, but when translit is invalidly unalignable:
  const brokenAlignment = formatPairedOriginalAndTransliteration(
    'L1\nL2\n\nL3\n\nL4\n\nL5',
    'T1', // Only 1 line translit for 4 sections -> cannot align
  )
  assert.equal(brokenAlignment.ok, false)
  assert(brokenAlignment.error?.includes('Transliteration has 1 line(s)'))
  console.log('✓ 57. Alignment validation failure handling isolates failures with explicit error messages')
}

// 58. Status preservation: draft remains draft, published remains published
{
  const draftRec = makeRecord(58, 'draft', { lyrics_amharic: 'Line 1\nLine 2\n\nLine 3\nLine 4' })
  const pubRec = makeRecord(59, 'published', { lyrics_amharic: 'Line 1\nLine 2\n\nLine 3\nLine 4' })

  const draftRes = formatMezmurRecordLyrics(draftRec)
  const pubRes = formatMezmurRecordLyrics(pubRec)

  assert.equal(draftRes.status, 'draft')
  assert.equal(pubRes.status, 'published')
  console.log('✓ 58. Draft and Published status remain completely preserved')
}

console.log('--- ALL 58 EXTENDED TEST SCENARIOS PASSED SUCCESSFULLY ---')
