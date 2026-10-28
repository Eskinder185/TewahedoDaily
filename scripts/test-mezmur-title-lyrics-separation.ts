import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { validateMezmurTitleLyrics } from '../src/lib/mezmur/titleLyricsValidation.ts'

const valid = validateMezmurTitleLyrics({
  import_id: 'b9f6d6b4-1ef3-47bd-bce0-07f2e4d90d40',
  title_amharic: 'እግዚአብሔር ይመስገን',
  transliteration_title: 'Egziabher Yimesgen',
  lyrics_amharic: 'እግዚአብሔር ይመስገን\nለዘለዓለም',
  lyrics_transliteration: 'Egziabher yimesgen\nLezelealem',
})
assert.equal(valid.filter((issue) => issue.severity === 'error').length, 0)

const swapped = validateMezmurTitleLyrics({
  title_amharic: 'Egziabher Yimesgen',
  transliteration_title: 'እግዚአብሔር ይመስገን',
  lyrics_amharic: 'Egziabher yimesgen',
  lyrics_transliteration: 'እግዚአብሔር ይመስገን',
})
assert.ok(swapped.some((issue) => issue.field === 'title_amharic' && issue.severity === 'error'))
assert.ok(swapped.some((issue) => issue.field === 'transliteration_title' && issue.severity === 'error'))
assert.ok(swapped.some((issue) => issue.field === 'lyrics_amharic' && issue.severity === 'error'))
assert.ok(swapped.some((issue) => issue.field === 'lyrics_transliteration' && issue.severity === 'error'))

const service = readFileSync('src/lib/publicContent/service.ts', 'utf8')
assert.match(service, /transliterationTitle: item\.transliteration_title\?\.trim\(\) \|\| item\.title/)
assert.doesNotMatch(service, /!lyricsGez && transliterationLyrics/)

const csv = readFileSync('src/lib/cms/mezmurCsvImport.ts', 'utf8')
assert.match(csv, /transliteration_title: row\.transliteration_title\.trim\(\) \|\| null/)
assert.match(csv, /lyrics_amharic: row\.amharic_lyrics\.trim\(\) \|\| null/)
assert.match(csv, /transliteration: row\.transliteration_lyrics\.trim\(\) \|\| null/)

const editor = readFileSync('src/pages/admin/MezmurEditor.tsx', 'utf8')
assert.match(editor, /textField\('transliteration_title', 'Transliterated title'/)
assert.match(editor, /\{ key: 'transliteration', label: 'Transliteration/)

console.log('Mezmur title/lyrics separation checks passed.')
