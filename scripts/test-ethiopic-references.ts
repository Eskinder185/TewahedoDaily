/** Ethiopic numerals and references. Run: npx tsx scripts/test-ethiopic-references.ts */
import assert from 'node:assert/strict'
import { ethiopicNumeralsToDigits, parseEthiopicNumeral, toEthiopicNumeral } from '../src/lib/search/ethiopicNumerals.ts'
import { parseBibleReference } from '../src/lib/bible/parseBibleReference.ts'

const cases: Array<[string, number]> = [['፩', 1], ['፲፮', 16], ['፻', 100], ['፻፳፫', 123], ['፪፻', 200], ['፼', 10000], ['፲፭', 15], ['፻፫', 103]]
for (const [text, value] of cases) assert.equal(parseEthiopicNumeral(text), value, text)
for (let n = 1; n <= 9999; n += 7) assert.equal(parseEthiopicNumeral(toEthiopicNumeral(n)), n, String(n))
assert.equal(parseEthiopicNumeral('abc'), null)
assert.equal(ethiopicNumeralsToDigits('ዮሐንስ ፫'), 'ዮሐንስ 3')

// Search-representation only: the input string is never mutated.
const raw = 'ዮሐንስ ፫፥፲፮'
const parsed = parseBibleReference(raw)
assert.equal(parsed.raw, raw)
assert.equal(parsed.chapter, 3)
assert.equal(parsed.verseStart, 16)
assert.equal(parsed.isReference, true)

const range = parseBibleReference('ማቴዎስ ፭፥፩-፲፪')
assert.equal(range.chapter, 5); assert.equal(range.verseStart, 1); assert.equal(range.verseEnd, 12)

const words = parseBibleReference('ዮሐንስ ምዕራፍ ፫ ቁጥር ፲፮')
assert.equal(words.chapter, 3); assert.equal(words.verseStart, 16)

const ascii = parseBibleReference('John 3:16')
assert.equal(ascii.chapter, 3); assert.equal(ascii.verseStart, 16)
const spoken = parseBibleReference('john chapter three verse sixteen')
assert.equal(spoken.chapter, 3); assert.equal(spoken.verseStart, 16)
const prose = parseBibleReference('what is love')
assert.equal(prose.isReference, false)
console.log('test-ethiopic-references: ok')
