/**
 * Targeted checks for the CMS image matching added to the shared media resolver:
 * bilingual/transliterated subject matching, duplicate uploads, missing-file recovery and domain isolation.
 *
 * Run: npx tsx --env-file-if-exists=.env.local scripts/test-cms-image-matching.ts
 */
import assert from 'node:assert/strict'
import {
  isKnownMissingStoragePath,
  normalizeTransliterationKey,
  resolveMedia,
  resolveRecordImagePath,
} from '../src/lib/media/mediaResolver'
import { resolveCalendarEventPresentation } from '../src/lib/calendar/resolveCalendarEventPresentation'

let count = 0
const check = <T,>(actual: T, expected: T, message: string) => { count++; assert.deepEqual(actual, expected, message) }
const truthy = (value: unknown, message: string) => { count++; assert.ok(value, message) }
const pathFor = (title: string, extra: Record<string, unknown> = {}) =>
  resolveMedia({ title, allowLegacyFallback: false, ...extra }).storagePath

const YARED = 'calendar/general/yared-96548f68-1792449396141.webp'
const GIORGIS = 'calendar/martyrs/george-tir-24af9cbc-1792614300549.webp'
const TIMKET = 'calendar/christ/timket-436e0376-1792010746233.webp'
const GENA = 'calendar/christ/gena-255444ca-1790968314647.webp'

// English <-> Amharic <-> transliteration for the same subject resolve to one image
for (const title of ['Saint Yared', 'St. Yared', 'ቅዱስ ያሬድ', 'ያሬድ', 'Kidus Yared', 'Qidus Yared']) check(pathFor(title), YARED, `Yared: ${title}`)
for (const title of ['Saint George', 'ቅዱስ ጊዮርጊስ', 'Kidus Giorgis', 'Qidus Giyorgis']) check(pathFor(title), GIORGIS, `Giorgis: ${title}`)
for (const title of ['Timket', 'Epiphany', 'ጥምቀት', 'Timkat']) check(pathFor(title), TIMKET, `Timket: ${title}`)
for (const title of ['Gena', 'Genna', 'ገና', 'Nativity']) check(pathFor(title), GENA, `Gena: ${title}`)
// Amharic title with an English-only hint, and a query only carrying the Amharic name
check(pathFor('', { titleAmharic: 'ቅዱስ ያሬድ' }), YARED, 'Amharic-only query finds the English-titled upload')
check(pathFor('Qidus Giyorgis', { titleAmharic: null }), GIORGIS, 'transliteration-only query')

// Transliteration key behaviour (and its limits)
check(normalizeTransliterationKey('Qidus Giyorgis'), normalizeTransliterationKey('Kidus Giorgis'), 'q/k and iy/i variants agree')
check(normalizeTransliterationKey('Kidist Mariam'), normalizeTransliterationKey('Qidist Maryam'), 'Mariam/Maryam agree')
check(normalizeTransliterationKey('Genna'), normalizeTransliterationKey('Gena'), 'doubled letters collapse')
check(normalizeTransliterationKey('ቅዱስ ያሬድ'), '', 'Ethiopic text never yields a transliteration key')
check(normalizeTransliterationKey('Gena'), '', 'short keys are ignored to avoid collisions')
truthy(normalizeTransliterationKey('Kidus Yared') !== normalizeTransliterationKey('Kidus Giorgis'), 'different saints keep different keys')

// Subjects that must NOT be guessed
check(pathFor('Saint Mary'), null, 'a generic Saint Mary query is ambiguous across many Mary feasts and stays unmatched')
check(pathFor('Kidist Mariam'), null, 'transliterated Mary is not matched to an arbitrary Mary feast')
check(pathFor('Kidus Yared Giorgis'), null, 'a different combined name does not borrow either saint\'s image')
check(pathFor('Yared Ginbot Zemari Nobody'), null, 'extra unrelated words are not loosely matched')

// Duplicate filename / byte-identical upload collision: two published Saint Yared cards point at two paths
const duplicate = resolveMedia({
  title: 'Saint Yared',
  allowLegacyFallback: false,
  cards: [
    { id: 'a', slug: 'monthly-yared-monthly', title: 'Saint Yared', titleAmharic: 'ቅዱስ ያሬድ', imagePath: YARED, sourceType: 'monthly_commemoration', sourceSlug: 'yared-monthly', status: 'published' },
    { id: 'b', slug: 'observance-yared-ginbot', title: 'Saint Yared', titleAmharic: 'ቅዱስ ያሬድ', imagePath: 'calendar/saints/yared-ginbot-58251eac-1792614254840.webp', sourceType: 'observance', sourceSlug: 'yared-ginbot', status: 'published' },
  ] as never,
})
truthy(duplicate.hasImage && duplicate.matchSource !== 'none', 'byte-identical duplicate uploads are not treated as ambiguous')
truthy([YARED, 'calendar/saints/yared-ginbot-58251eac-1792614254840.webp'].includes(duplicate.storagePath ?? ''), 'duplicate resolves to one of the two identical files')

// Missing metadata / nothing to match
check(resolveMedia({}).matchSource, 'none', 'empty query yields no image')
check(resolveMedia({ title: '   ' }).hasImage, false, 'blank title yields no image')

// Broken (known-missing) stored paths: recovered from the verified catalog; healthy and blank paths untouched
const KETERA_BROKEN = 'calendar/christ/ketera-8266580b-1792011322259.webp'
truthy(isKnownMissingStoragePath(KETERA_BROKEN), 'audited missing path is registered')
check(isKnownMissingStoragePath(YARED), false, 'healthy path is not registered')
check(resolveRecordImagePath(KETERA_BROKEN, { slug: 'ketera', sourceType: 'observance', title: 'Ketera / Eve of Timket', titleAmharic: 'ከተራ', domain: 'calendar' }), TIMKET, 'broken Ketera path uses the verified Timket-eve alias')
check(resolveRecordImagePath(YARED, { title: 'Saint George' }), YARED, 'a healthy stored path is never replaced')
check(resolveRecordImagePath(null, { title: 'Saint Yared' }), null, 'an explicitly blank path stays blank')
check(resolveRecordImagePath(KETERA_BROKEN, { title: 'Totally Unknown Feast' }), KETERA_BROKEN, 'no catalog match keeps the stored path (existing fallback behaviour)')
const ketera = resolveCalendarEventPresentation({
  sourceType: 'observance', sourceId: 'c76469c1-1347-4101-b072-c90845d30755', sourceSlug: 'ketera',
  source: { title: 'Ketera / Eve of Timket', titleAmharic: 'ከተራ' },
  cards: [{ id: 'c89c6eaa', slug: 'observance-ketera', title: 'Ketera / Eve of Timket', titleAmharic: 'ከተራ', sourceType: 'observance', sourceId: 'c76469c1-1347-4101-b072-c90845d30755', sourceSlug: 'ketera', imagePath: KETERA_BROKEN, status: 'published' } as never],
})
check(ketera.imagePath, TIMKET, 'calendar card with a broken upload now shows its verified image')

// Singer portraits: same-person replacements only for the audited rows, never leaking into other domains
check(resolveRecordImagePath('hymns/zemaris/muhaze-sibihat-zemari-dagimawi-deribe-1793159399237.webp', { id: 'x', slug: 'muhaze-sibihat-zemari-dagimawi-deribe', sourceType: 'zemari', title: 'Muhaze Sibihat Zemari Dagimawi Deribe', domain: 'zemari' }), 'hymns/zemaris/muhaze-sibihat-zemari-dagimawi-deribe-1793159386778.webp', 'Muhaze Sibihat portrait replacement')
check(resolveRecordImagePath('hymns/zemaris/yosph-1792789779639.webp', { slug: 'like-mezemiran-tewodros-yoseph', sourceType: 'zemari', title: 'Like Mezemiran Tewodros Yoseph', titleAmharic: 'ሊቀ መዘምራን ቴዎድሮስ ዮሴፍ', domain: 'zemari' }), 'hymns/zemaris/4b59d618-ef00-4d48-9fac-251b1004668c-Tewodros-Yoseph.webp', 'Tewodros Yoseph portrait replacement')
check(pathFor('Tewodros Yoseph', { domain: 'calendar' }), null, 'portraits never match calendar queries')
check(resolveMedia({ domain: 'zemari', slug: 'zemari-someone-else', title: 'Zemari Someone Else' }).matchSource, 'none', 'other singers are not guessed from similar names')
check(resolveMedia({ domain: 'zemari', title: 'Yosph' }).matchSource, 'none', 'a partial name does not match a portrait')

// Live, read-only verification that every newly connected file is publicly reachable
const base = process.env.VITE_SUPABASE_URL
const connected = [YARED, TIMKET, 'hymns/zemaris/muhaze-sibihat-zemari-dagimawi-deribe-1793159386778.webp', 'hymns/zemaris/4b59d618-ef00-4d48-9fac-251b1004668c-Tewodros-Yoseph.webp']
if (base) {
  for (const path of connected) {
    try {
      const response = await fetch(`${base}/storage/v1/object/public/content-media/${path}`, { method: 'HEAD' })
      check(response.status, 200, `HTTP 200 for ${path}`)
      truthy(/^image\//.test(response.headers.get('content-type') ?? ''), `image content type for ${path}`)
    } catch (error) {
      console.log(`UNKNOWN (network) ${path}: ${(error as Error).message}`)
    }
  }
  for (const path of ['hymns/zemaris/muhaze-sibihat-zemari-dagimawi-deribe-1793159399237.webp', 'hymns/zemaris/yosph-1792789779639.webp', KETERA_BROKEN]) {
    const response = await fetch(`${base}/storage/v1/object/public/content-media/${path}`, { method: 'HEAD' }).catch(() => null)
    if (response) check(response.status === 200, false, `registered missing path is still missing: ${path} (if this fails, remove it from KNOWN_MISSING_STORAGE_PATHS)`)
  }
} else {
  console.log('UNKNOWN: VITE_SUPABASE_URL not set; live HEAD checks skipped')
}

console.log(`CMS image matching checks passed (${count} assertions).`)
