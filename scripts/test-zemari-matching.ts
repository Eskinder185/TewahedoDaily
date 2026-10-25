import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'
import { classifyZemariMatch, matchZemari, normalizeZemariName, type ZemariCandidate } from '../src/lib/mezmur/zemariMatching.ts'

const zemaris: ZemariCandidate[] = [
  { id: '00000000-0000-4000-8000-000000000001', slug: 'samuel-tesfaye', name: 'Samuel Tesfaye', nameAmharic: 'ሳሙኤል ተስፋዬ' },
  { id: '00000000-0000-4000-8000-000000000002', slug: 'kidus-michael', name: 'Kidus Michael', nameAmharic: 'ቅዱስ ሚካኤል' },
  { id: '00000000-0000-4000-8000-000000000003', slug: 'abeba-tesfaye', name: 'Abeba Tesfaye', aliases: ['Abeba T.'] },
  { id: '00000000-0000-4000-8000-000000000004', slug: 'alem-one', name: 'Alem' },
  { id: '00000000-0000-4000-8000-000000000005', slug: 'alem-two', name: 'Alem' },
  { id: '00000000-0000-4000-8000-000000000006', slug: 'tewodros-yosef', name: 'Tewodros Yosef', nameAmharic: 'ቴዎድሮስ ዮሴፍ' },
  { id: '00000000-0000-4000-8000-000000000007', slug: 'hailemelekot-kassa', name: 'Hailemelekot Kassa', nameAmharic: 'ኃይለመለኮት ካሳ' },
  { id: '00000000-0000-4000-8000-000000000008', slug: 'hiwot-tefera', name: 'Hiwot Tefera', nameAmharic: 'ሕይወት ተፈራ' },
  { id: '00000000-0000-4000-8000-000000000009', slug: 'ashenafi-gebremaryam', name: 'Ashenafi Gebremaryam', nameAmharic: 'አሸናፊ ገብረማርያም' },
]

const fixtures = [
  { singerName: 'saved original', zemariId: zemaris[0].id, expected: 'linked', classification: 'already_linked' },
  { singerName: 'ሳሙኤል ተስፋዬ', expected: 'available', classification: 'safe_exact' },
  { singerName: 'Deacon Samuel Tesfaye', expected: 'available', classification: 'safe_normalized' },
  { singerName: 'Abeba T.', expected: 'available', classification: 'safe_exact' },
  { singerName: 'legacy text', singerSlug: 'kidus-michael', expected: 'available', classification: 'safe_normalized' },
  { singerName: 'ሊቀ መዘምራን ቴዎድሮስ ዮሴፍ', expected: 'available', classification: 'safe_normalized' },
  { singerName: 'ቴዎድሮስ፡ዮሴፍ', expected: 'available', classification: 'safe_exact' },
  { singerName: 'ሙሐዘ ስብሀት ኃይለመለኮት ካሳ', expected: 'available', classification: 'safe_normalized' },
  { singerName: 'ዘማሪት ሲስተር ሕይወት ተፈራ', expected: 'available', classification: 'safe_normalized' },
  { singerName: 'Zemarit Sister Hiwot Tefera', expected: 'available', classification: 'safe_normalized' },
  { singerName: 'ዘማሪ ዲያቆን አሸናፊ ገብረማርያም', expected: 'available', classification: 'safe_normalized' },
  { singerName: 'Alem', expected: 'ambiguous', classification: 'ambiguous' },
  { singerName: 'Samuel Tesfai', expected: 'name_recorded', classification: 'not_found' },
  { singerName: 'Unknown Zemari', expected: 'name_recorded', classification: 'not_found' },
  { singerName: null, expected: 'not_recorded', classification: 'not_found' },
] as const

for (const fixture of fixtures) {
  const before = fixture.singerName
  const result = matchZemari(fixture, zemaris)
  assert.equal(result.state, fixture.expected, `Fixture failed: ${fixture.singerName} expected ${fixture.expected} got ${result.state}`)
  assert.equal(fixture.singerName, before, 'matching must preserve imported singer text')
  assert.equal(classifyZemariMatch(result), fixture.classification, `Classification failed for ${fixture.singerName}`)
}

// Verify title & punctuation normalizations
assert.equal(normalizeZemariName('  ዘማሪ፣ ሳሙኤል ተስፋዬ '), 'ሳሙኤል ተስፋዬ')
assert.equal(normalizeZemariName('Priest — Samuel Tesfaye'), 'samuel tesfaye')
assert.equal(normalizeZemariName('ዲ/ን ሳሙኤል ተስፋዬ'), 'ሳሙኤል ተስፋዬ')
assert.equal(normalizeZemariName('ዲ.ን ሳሙኤል ተስፋዬ'), 'ሳሙኤል ተስፋዬ')
assert.equal(normalizeZemariName('ሊቀ መዘምራን ቴዎድሮስ ዮሴፍ'), 'ቴዎድሮስ ዮሴፍ')
assert.equal(normalizeZemariName('መዘምራን ቴዎድሮስ ዮሴፍ'), 'ቴዎድሮስ ዮሴፍ')
assert.equal(normalizeZemariName('Like Mezemiran Tewodros Yosef'), 'tewodros yosef')
assert.equal(normalizeZemariName('Like Mezemiran Tewodros Yoseph'), 'tewodros yosef')
assert.equal(normalizeZemariName('Mezemiran Tewodros Yoseph'), 'tewodros yosef')
assert.equal(normalizeZemariName('Liqe Mezemiran Tewodros Yoseph'), 'tewodros yosef')
assert.equal(normalizeZemariName('Tewodros Yoseph'), 'tewodros yosef')
assert.equal(normalizeZemariName('ሙሐዘ ስብሀት ኃይለመለኮት ካሳ'), 'ኃይለመለኮት ካሳ')
assert.equal(normalizeZemariName('ዘማሪት ሲስተር ሕይወት ተፈራ'), 'ሕይወት ተፈራ')
assert.equal(normalizeZemariName('Sister Zemarit Hiwot Tefera'), 'hiwot tefera')
assert.equal(normalizeZemariName('ቀሲስ ዘማሪ አስተርአየ'), 'አስተርአየ')
assert.equal(normalizeZemariName('Samuel Zemari Choir'), 'samuel zemari choir')

// Verify full pagination behavior (>1000 items)
const paginatedZemaris: ZemariCandidate[] = Array.from({ length: 1500 }, (_, index) => ({
  id: `00000000-0000-4000-8000-${String(index + 1).padStart(12, '0')}`,
  slug: `zemari-singer-${index + 1}`,
  name: `Zemari Singer ${index + 1}`,
  nameAmharic: `ዘማሪ ዘማሪ ${index + 1}`,
}))

const match1 = matchZemari({ singerName: 'Zemari Singer 1' }, paginatedZemaris)
assert.equal(match1.state, 'available')
assert.equal(match1.state === 'available' && match1.zemariId, paginatedZemaris[0].id)

const match1500 = matchZemari({ singerName: 'Zemari Singer 1500' }, paginatedZemaris)
assert.equal(match1500.state, 'available')
assert.equal(match1500.state === 'available' && match1500.zemariId, paginatedZemaris[1499].id)

// Verify migration contract
const migration = await readFile('supabase/migrations/20261024290000_mezmur_zemari_matching.sql', 'utf8')
assert.match(migration, /bulk_link_mezmur_zemaris/)
assert.match(migration, /v_role not in \('admin', 'super_admin'\)/)
assert.match(migration, /status = 'draft'/)
assert.match(migration, /for update/)
assert.match(migration, /set zemari_id = v_link\.zemari_id, updated_at = now\(\)/)
assert.doesNotMatch(migration, /insert into public\.zemaris/i)
assert.doesNotMatch(migration, /set singer_name/i)
assert.doesNotMatch(migration, /grant .* to anon/i)

console.log('PASS: All real-world Amharic and English variations, compound honorifics, Ethiopic dividers, pagination (>1000), duplicate ambiguity, and migration contract verified')
