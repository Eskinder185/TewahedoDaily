import assert from 'node:assert/strict'
import {
  MANDATORY_CSV_COLUMNS,
  applyExistingMezmurConflicts,
  buildStagedRowsFromCsvText,
  detectMezmurCsvInputFormat,
  parseCsvText,
  serializeStagedRowsToCsv,
  serializeValidCanonicalRows,
} from '../src/lib/cms/mezmurCsvImport'

const csvCell = (value: unknown) => {
  const text = String(value ?? '')
  return /[",\r\n]/.test(text) ? `"${text.replace(/"/g, '""')}"` : text
}

const base: Record<string, string> = {
  id: '',
  amharic_title: '  ሰላም፣ ለኪ  ',
  transliteration_title: 'Selam, Leki',
  slug: 'selam-leki',
  description: 'Quoted "source", faithfully preserved',
  amharic_lyrics: 'ሰላም ለኪ\n\nሁለተኛ ክፍል',
  transliteration_lyrics: 'Selam leki\n\nSecond stanza',
  english_lyrics: 'Peace to you\n\nSecond stanza',
  geez_lyrics: 'ሰላም ለኪ',
  oromo_lyrics: 'Nagaa siif',
  lyrics_status: 'available',
  youtube_url: 'https://www.youtube.com/watch?v=abcdefghijk',
  thumbnail_url: 'https://i.ytimg.com/vi/abcdefghijk/hqdefault.jpg',
  image_alt_text: 'ሰላም ለኪ',
  audio_url: 'https://example.org/audio/selam.mp3',
  language: 'bilingual',
  form: 'mezmur',
  category: 'Virgin Mary',
  primary_occasion: 'General / Anytime',
  zemari: 'Test Zemari',
  hymn_sections: 'virgin-mary|general-praise',
  additional_occasions: 'Annual Saint Feast',
  source_url: 'https://example.org/source/selam',
  classification_confidence: '0.90',
  review_required: 'false',
  status: 'draft',
  featured: 'false',
}

const record = (patch: Record<string, string> = {}) => {
  const row = { ...base, ...patch }
  return MANDATORY_CSV_COLUMNS.map((column) => csvCell(row[column])).join(',')
}

const csv = `\uFEFF${MANDATORY_CSV_COLUMNS.join(',')}\r\n${record()}\r\n${record({ slug: 'selam-leki', source_url: 'https://example.org/source/other', youtube_url: 'https://youtu.be/lmnopqrstuv' })}\r\n${record({ slug: 'bad row', id: 'not-a-uuid', source_url: 'notaurl', classification_confidence: '1.4' })}\r\n`
const parsed = parseCsvText(csv)
assert.equal(detectMezmurCsvInputFormat(parsed.headers), 'canonical')
assert.equal(parsed.rows[0].amharic_lyrics, base.amharic_lyrics)
assert.equal(parsed.rows[0].description, base.description)

const rows = buildStagedRowsFromCsvText(csv)
assert.equal(rows.length, 3)
assert.equal(rows[0].amharic_lyrics, base.amharic_lyrics)
assert.equal(rows[0].geez_lyrics, base.geez_lyrics)
assert.equal(rows[0].oromo_lyrics, base.oromo_lyrics)
assert.equal(rows[1].duplicateReason, 'duplicate_slug (selam-leki)')
assert.match(rows[2].validationErrors.join(' '), /Slug must|UUID|valid absolute URL|confidence/i)

const unsafeSource = buildStagedRowsFromCsvText(`\uFEFF${MANDATORY_CSV_COLUMNS.join(',')}\r\n${record({
  slug: 'unsafe-source',
  source_url: 'https://example.org/source/unsafe',
  youtube_url: 'https://youtu.be/zyxwvutsrqp',
  lyrics_status: 'unreviewed',
  form: 'chant',
  classification_confidence: 'probably',
  status: 'published',
  featured: 'true',
})}\r\n`)[0]
assert.match(unsafeSource.validationErrors.join(' '), /lyrics_status|Invalid form|number from 0 through 1|never publishes|Featured/i)
assert.equal(unsafeSource.importReady, false)

const conflicts = applyExistingMezmurConflicts(rows, [{
  mezmur_id: '11111111-1111-4111-8111-111111111111',
  slug: 'selam-leki',
  source_url: 'https://example.org/source/selam',
  youtube_url: base.youtube_url,
  title_amharic: 'ሰላም ለኪ',
  singer_name: 'Test Zemari',
}])
assert.match(conflicts[0].conflictWithExisting || '', /Conflicts with CMS record/)
assert.equal(conflicts[0].importReady, false)

const exportedAll = serializeStagedRowsToCsv(rows)
const roundTrip = buildStagedRowsFromCsvText(exportedAll)
assert.equal(roundTrip[0].amharic_lyrics, base.amharic_lyrics)
assert.equal(roundTrip[0].transliteration_title, base.transliteration_title)
assert.equal(roundTrip[0].oromo_lyrics, base.oromo_lyrics)

const validExport = serializeValidCanonicalRows(rows)
assert.equal(validExport.exportedCount, 1)
assert.equal(validExport.excluded.length, 2)
assert.equal(buildStagedRowsFromCsvText(validExport.csv).length, 1)

assert.throws(
  () => parseCsvText('title,lyrics\n"unclosed,field'),
  /ended inside a quoted field/,
)
assert.throws(
  () => buildStagedRowsFromCsvText('title,lyrics\nExample,Words'),
  /Unsupported Mezmur CSV structure/,
)

const auditHeaders = ['source_id', 'title_am', 'title_en', 'youtube_url', 'language', 'form']
const auditCsv = `${auditHeaders.join(',')}\nsource-1,መዝሙር,Mezmur,https://youtu.be/abcdefghijk,amharic,werb\n`
assert.equal(detectMezmurCsvInputFormat(parseCsvText(auditCsv).headers), 'eotcmedia-audit')
assert.equal(buildStagedRowsFromCsvText(auditCsv)[0].form, 'werb')

console.log('Mezmur converter: Unicode, multiline RFC 4180, round trip, duplicates, invalid rows, and conflicts passed')
