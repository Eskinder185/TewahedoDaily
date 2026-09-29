/**
 * Quick unit checks for keyword helpers (no test runner required).
 */
import {
  formatKeywordsForInput,
  normalizeKeywords,
  parseKeywordsFromDb,
  serializeKeywordsForDb,
} from '../src/lib/synaxarium/keywords.ts'

function assert(cond, msg) {
  if (!cond) throw new Error(msg)
}

assert(JSON.stringify(normalizeKeywords(['gabriel', 'angel'])) === JSON.stringify(['gabriel', 'angel']), 'array')
assert(JSON.stringify(normalizeKeywords('gabriel|angel')) === JSON.stringify(['gabriel', 'angel']), 'pipe')
assert(JSON.stringify(normalizeKeywords('gabriel, angel')) === JSON.stringify(['gabriel', 'angel']), 'comma')
assert(JSON.stringify(normalizeKeywords('')) === '[]', 'empty')
assert(JSON.stringify(normalizeKeywords(null)) === '[]', 'null')
assert(JSON.stringify(normalizeKeywords(undefined)) === '[]', 'undefined')
assert(JSON.stringify(normalizeKeywords('["a","b"]')) === JSON.stringify(['a', 'b']), 'json string')
assert(serializeKeywordsForDb(['gabriel', 'angel']) === 'gabriel|angel', 'serialize')
assert(serializeKeywordsForDb([]) === null, 'serialize empty')
assert(formatKeywordsForInput('gabriel|angel') === 'gabriel, angel', 'format input')
assert(JSON.stringify(parseKeywordsFromDb('a|b')) === JSON.stringify(['a', 'b']), 'parse')

console.log('keywords helpers: all assertions passed')
