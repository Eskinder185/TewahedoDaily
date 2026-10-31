import assert from 'node:assert/strict'
import { classifyMezmur } from '../src/lib/mezmur/mezmurClassification'
import { isMezmeu1Published } from '../src/lib/mezmur/mezmeu1BatchScope'

const batch = Array.from({ length: 460 }, (_, i) => ({
  slug: `mezmeu1-${String(i + 1).padStart(4, '0')}`,
  status: 'published',
}))
const old = [{ slug: 'older-published-mezmur', status: 'published' },
  { slug: 'mezmeu1-0461', status: 'draft' }]
assert.equal([...batch, ...old].filter(isMezmeu1Published).length, 460)

const lyrics = 'ድንግል ማርያም እመቤታችን ሰአሊ ለነ'
const one = classifyMezmur({ lyrics_amharic: lyrics })
const both = classifyMezmur({ lyrics_amharic: lyrics, lyrics_transliteration: 'Dingil Maryam Emebetachin Seali Lene' })
assert.deepEqual(one, both, 'Do not double-count an Ethiopic lyric and its transliteration')

const cross = classifyMezmur({ lyrics_amharic: 'ኢየሱስ ክርስቶስ በመስቀል ላይ ተሰቀለ ለኛ' })
assert.notEqual(cross.primaryOccasionSlug, 'meskel', 'A crucifixion hymn is not necessarily a Meskel feast hymn')
const meskel = classifyMezmur({ lyrics_amharic: 'ደመራ በዓለ መስቀል እናከብራለን' })
assert.equal(meskel.primaryOccasionSlug, 'meskel', 'Specific Meskel celebration evidence remains supported')

const repeated = classifyMezmur({ lyrics_amharic: Array(15).fill('ድንግል ማርያም').join('\n') })
assert.ok(repeated.confidence < 0.9, 'Repeated chorus alone must not drive near-certain confidence')
console.log('Mezmeu1 scoped classifier regression checks passed')
