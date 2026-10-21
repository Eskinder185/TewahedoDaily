/**
 * Search Buddy clipboard plain-text extraction.
 * Run: npx tsx scripts/test-search-buddy-copy-text.mjs
 */
import assert from 'node:assert/strict'
import {
  plainTextFromSearchBuddyMessage,
  plainTextFromSearchBuddyResponse,
} from '../src/lib/searchBuddy/copySearchBuddyText.ts'

assert.equal(plainTextFromSearchBuddyResponse(null), '')
assert.equal(plainTextFromSearchBuddyResponse(undefined), '')

const ai = plainTextFromSearchBuddyResponse({
  type: 'ai',
  answer: 'The Incarnation is the mystery of the Word made flesh.',
})
assert.equal(ai, 'The Incarnation is the mystery of the Word made flesh.')

assert.equal(
  plainTextFromSearchBuddyResponse({ type: 'ai', answer: '   ', message: 'Fallback note.' }),
  'Fallback note.',
)

const scriptureEnVerse =
  'Go, and make disciples of all nations, baptizing them in the name of the Father and of the Son and of the Holy Spirit,'
const scriptureAmVerse =
  '\u12A5\u1295\u130D\u12F2\u1205 \u1202\u12F1\u1293 \u12A0\u1215\u12DB\u1265\u1295 \u1201\u1201 \u1260\u12A0\u1265 \u1260\u12C8\u120D\u12F5\u1293 \u1260\u1218\u1295\u1348\u1235 \u1245\u12F1\u1235 \u1235\u121D'
const aiWithScripture = plainTextFromSearchBuddyResponse({
  type: 'ai',
  answer: 'An explanation of the Holy Trinity...',
  sources: [
    {
      reference: 'Matthew 28:19',
      edition: 'web',
      language: 'en',
      mystery: 'Trinity',
      verses: [{ verse_number: 19, text: scriptureEnVerse, covers_verse_range: null }],
    },
    {
      reference: 'Matthew 28:19-20',
      edition: 'am',
      language: 'am',
      mystery: 'Trinity',
      verses: [{ verse_number: 19, text: scriptureAmVerse, covers_verse_range: [19, 20] }],
    },
    {
      title: 'Church teaching',
      url: 'https://example.org/teaching',
      excerpt: 'Short excerpt',
    },
  ],
})
assert.match(aiWithScripture, /An explanation of the Holy Trinity/)
assert.match(aiWithScripture, /Supplied Scripture/)
assert.ok(aiWithScripture.includes(scriptureEnVerse))
assert.ok(aiWithScripture.includes(scriptureAmVerse))
assert.match(aiWithScripture, /Matthew 28:19-20/)
assert.match(aiWithScripture, /Church teaching/)
assert.match(aiWithScripture, /https:\/\/example\.org\/teaching/)

const bibleRef = plainTextFromSearchBuddyResponse({
  type: 'bible_reference',
  reference: 'John 3:16',
  text: null,
  text_amharic: null,
  verses: [{ verse: 16, text: 'For God so loved the world…' }],
})
assert.match(bibleRef, /John 3:16/)
assert.match(bibleRef, /16\. For God so loved/)

const bibleRefBody = plainTextFromSearchBuddyResponse({
  type: 'bible_reference',
  reference: 'John 3:16',
  text_english: 'For God so loved the world…',
  verses: [],
})
assert.equal(bibleRefBody, 'John 3:16\n\nFor God so loved the world…')

const amVerse = '\u12A5\u122D\u1231\u121D \u1260\u120C\u120A\u1275 \u12C8\u12F0 \u12A2\u12E8\u1231\u1235 \u1218\u1323\u1362'
const bibleChapter = plainTextFromSearchBuddyResponse({
  type: 'bible_chapter',
  reference: 'John 3',
  verses: [
    { verse: 1, text: 'There was a man of the Pharisees…' },
    { verse_number: 2, text_amharic: amVerse },
  ],
})
assert.match(bibleChapter, /John 3/)
assert.match(bibleChapter, /1\. There was a man/)
assert.ok(bibleChapter.includes(`2. ${amVerse}`))

const calendar = plainTextFromSearchBuddyResponse({
  type: 'calendar_today',
  ethiopian_date_english: 'Tekemt 5, 2019',
  primary_observance: 'Abune Gebre Menfes Kidus',
  summary: 'Great Feast observance.',
  fasting_status: null,
  active_fast: null,
})
assert.match(calendar, /Abune Gebre Menfes Kidus/)
assert.match(calendar, /Great Feast observance/)

const fasting = plainTextFromSearchBuddyResponse({
  type: 'fasting_today',
  title: null,
  primary_observance: null,
  ethiopian_label: 'Tekemt 5',
  fasting_status: 'Fasting day',
  active_fast: 'Tsige Fast',
})
assert.match(fasting, /Tekemt 5|Tsige Fast|Fasting day/)

const meskelAm = '\u1218\u1235\u1240\u120D'
const calendarSearch = plainTextFromSearchBuddyResponse({
  type: 'calendar_search',
  query: 'Meskel',
  results: [
    { title: 'Meskel', summary: 'Finding of the True Cross' },
    { title_amharic: meskelAm, preview: 'Feast of the Cross' },
  ],
})
assert.match(calendarSearch, /Meskel/)
assert.match(calendarSearch, /Finding of the True Cross/)
assert.ok(calendarSearch.includes(meskelAm))

const hymnAm = '\u12E8\u1235\u1219 \u1275\u122D\u1313\u121C'
const hymn = plainTextFromSearchBuddyResponse({
  type: 'hymn_search',
  results: [{ title_amharic: hymnAm, title: 'Yesimu Tirguame' }],
})
assert.ok(hymn.includes(hymnAm))

const prayer = plainTextFromSearchBuddyResponse({
  type: 'prayer_collection',
  title: 'Morning Prayers',
  prayers: [{ title: 'Our Father', preview: 'Our Father who art in heaven…' }],
})
assert.match(prayer, /Morning Prayers/)
assert.match(prayer, /Our Father/)

const synax = plainTextFromSearchBuddyResponse({
  type: 'synaxarium_today',
  display_date_english: 'Tikimt 5',
  commemorations: [{ title: 'Abba Paul', preview: 'Archbishop of Constantinople' }],
})
assert.match(synax, /Tikimt 5|Abba Paul/)

const unknown = plainTextFromSearchBuddyResponse({
  type: 'unknown',
  message: "I couldn't find a matching result yet.",
})
assert.match(unknown, /couldn't find/)

const msg = plainTextFromSearchBuddyMessage({
  id: 'a1',
  role: 'assistant',
  createdAt: 1,
  status: 'complete',
  text: 'Here is John 3:16.',
  response: {
    type: 'bible_reference',
    reference: 'John 3:16',
    text: 'For God so loved the world…',
  },
})
assert.match(msg, /Here is John 3:16/)
assert.match(msg, /For God so loved/)

const emptyFields = plainTextFromSearchBuddyResponse({
  type: 'bible_chapter',
  reference: '   ',
  verses: [{ verse: null, text: '   ' }],
})
assert.equal(emptyFields, '')

const bibleSearch = plainTextFromSearchBuddyResponse({
  type: 'bible_search',
  results: [
    {
      book_name: 'John',
      chapter: 3,
      verse: 16,
      text: 'For God so loved the world…',
    },
  ],
})
assert.match(bibleSearch, /John 3:16/)
assert.match(bibleSearch, /For God so loved/)

console.log('test-search-buddy-copy-text: ok')
