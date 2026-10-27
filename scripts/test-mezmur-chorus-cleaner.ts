import assert from 'node:assert/strict'
import { cleanMezmurLyrics } from '../src/lib/mezmur/mezmurChorusCleaner.ts'

console.log('=== RUNNING MEZMUR CHORUS CLEANER TEST SUITE ===\n')

// -----------------------------------------------------------------------------
// Test 1: Standard Ethiopian Mezmur (Amharic CVCVCVC)
// -----------------------------------------------------------------------------
{
  const input = `CHORUS
በዝምታ መልስ አለ ከጌታ (6)
ለእግዚአብሔር ነግሮ ለሰው ዝም የሚል
ተሸክሞ ኖሮ እርጥቡን መስቀል

VERSE 1
ይሻገራል ገደል ይወጣል ተራራ
እወቁልኝ ብሎ ስሙኝ ስሙኝ ያለ

CHORUS
በዝምታ መልስ አለ ከጌታ (6)
ለእግዚአብሔር ነግሮ ለሰው ዝም የሚል
ተሸክሞ ኖሮ እርጥቡን መስቀል

VERSE 2
ከሰማይ ካልሆነ ምስክር የታል
ዳንኤል ዝም አለ ፍርድን ሲቀበል

CHORUS
በዝምታ መልስ አለ ከጌታ (6)
ለእግዚአብሔር ነግሮ ለሰው ዝም የሚል
ተሸክሞ ኖሮ እርጥቡን መስቀል`

  const expected = `በዝምታ መልስ አለ ከጌታ (6)
ለእግዚአብሔር ነግሮ ለሰው ዝም የሚል
ተሸክሞ ኖሮ እርጥቡን መስቀል

VERSE 1
ይሻገራል ገደል ይወጣል ተራራ
እወቁልኝ ብሎ ስሙኝ ስሙኝ ያለ

VERSE 2
ከሰማይ ካልሆነ ምስክር የታል
ዳንኤል ዝም አለ ፍርድን ሲቀበል`

  const res1 = cleanMezmurLyrics(input)
  assert.equal(res1.hasChorus, true, 'Test 1: Detected chorus')
  assert.equal(res1.removedChorusCount, 2, 'Test 1: Removed 2 repeated choruses')
  assert.equal(res1.preservedVerseCount, 2, 'Test 1: Preserved 2 verses')
  assert.equal(res1.cleanedText, expected, 'Test 1: Cleaned text matches expected')

  // Test idempotence
  const res2 = cleanMezmurLyrics(res1.cleanedText)
  assert.equal(res2.cleanedText, res1.cleanedText, 'Test 1: Idempotent - running twice produces identical text')
  console.log('✓ PASS: Test 1 - Standard Amharic CVCVCVC deduplication and idempotence')
}

// -----------------------------------------------------------------------------
// Test 2: Ethiopic heading (አዝማች)
// -----------------------------------------------------------------------------
{
  const input = `አዝማች
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና

ቁጥር ፩
የአማኑኤል እናት የተዋህዶ አክሊል
አትጥፊ ከመሃል እንድትሆኝን ሃይል

አዝማች
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና

ቁጥር ፪
በጨለማው ጉዞ በጭንቁ ዘመን
አደራሽን ድንግል እንዳታሳፍሪን`

  const expected = `አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና

ቁጥር ፩
የአማኑኤል እናት የተዋህዶ አክሊል
አትጥፊ ከመሃል እንድትሆኝን ሃይል

ቁጥር ፪
በጨለማው ጉዞ በጭንቁ ዘመን
አደራሽን ድንግል እንዳታሳፍሪን`

  const res = cleanMezmurLyrics(input)
  assert.equal(res.cleanedText, expected, 'Test 2: Ethiopic headings cleaned')
  console.log('✓ PASS: Test 2 - Ethiopic headings (አዝማች / ቁጥር ፩)')
}

// -----------------------------------------------------------------------------
// Test 3: Latin Transliteration
// -----------------------------------------------------------------------------
{
  const input = `CHORUS
Bezimita mels ale keGeta (6)
LeEgziabher negiro lesew zim yemil

VERSE 1
Yishageral gedel yiwetal terara
Ewekulign bilo simugn simugn yale

CHORUS
Bezimita mels ale keGeta (6)
LeEgziabher negiro lesew zim yemil`

  const expected = `Bezimita mels ale keGeta (6)
LeEgziabher negiro lesew zim yemil

VERSE 1
Yishageral gedel yiwetal terara
Ewekulign bilo simugn simugn yale`

  const res = cleanMezmurLyrics(input)
  assert.equal(res.cleanedText, expected, 'Test 3: Transliteration cleaned')
  console.log('✓ PASS: Test 3 - Latin transliteration deduplication')
}

// -----------------------------------------------------------------------------
// Test 4: Hymn with NO Chorus (Rule 7)
// -----------------------------------------------------------------------------
{
  const input = `Bebego fekadu hulu bersu hone
Neger hulu bersu tekenawene`

  const res = cleanMezmurLyrics(input)
  assert.equal(res.hasChorus, false, 'Test 4: No chorus detected')
  assert.equal(res.isChanged, false, 'Test 4: Text unchanged')
  assert.equal(res.cleanedText, input, 'Test 4: Preserves exact text')
  console.log('✓ PASS: Test 4 - Hymn with no chorus left unchanged')
}

// -----------------------------------------------------------------------------
// Test 5: "chorus" or "አዝማች" in actual lyric sentence (NOT a heading)
// -----------------------------------------------------------------------------
{
  const input = `CHORUS
የአዝማች መሪ ሆነው ዘመሩ (2)
በአንድ ቃል ሁነው አመሰገኑ

VERSE 1
መላእክት በሰማይ ሆነው
ይህን አዝማች ደገሙት

CHORUS
የአዝማች መሪ ሆነው ዘመሩ (2)
በአንድ ቃል ሁነው አመሰገኑ`

  const expected = `የአዝማች መሪ ሆነው ዘመሩ (2)
በአንድ ቃል ሁነው አመሰገኑ

VERSE 1
መላእክት በሰማይ ሆነው
ይህን አዝማች ደገሙት`

  const res = cleanMezmurLyrics(input)
  assert.equal(res.cleanedText, expected, 'Test 5: Preserves word inside lyric lines')
  assert.ok(res.cleanedText.includes('የአዝማች መሪ'), 'Preserved in chorus line')
  assert.ok(res.cleanedText.includes('ይህን አዝማች ደገሙት'), 'Preserved in verse line')
  console.log('✓ PASS: Test 5 - Preserves structural words when inside actual lyric lines')
}

// -----------------------------------------------------------------------------
// Test 6: Chorus variation with different lyrics (Rule 8)
// -----------------------------------------------------------------------------
{
  const input = `CHORUS 1
ኪዳነ ምሕረት እመቤቴ (2)
የልቤን አውቃለሁ ያንቺን ቸርነት

VERSE 1
በጭንቄ ቀን የደረስሽልኝ
አንቺ ነሽ እመቤቴ የረዳሽኝ

CHORUS 2
ድንግል ማርያም የፍቅር እናት (2)
አትለይኝ በዘመኔ ሁሉ

VERSE 2
ስምሽን ጠርቼ መቼ አፍራለሁ
አንቺን ይዤ መቼ እወድቃለሁ

CHORUS 1
ኪዳነ ምሕረት እመቤቴ (2)
የልቤን አውቃለሁ ያንቺን ቸርነት`

  const expected = `ኪዳነ ምሕረት እመቤቴ (2)
የልቤን አውቃለሁ ያንቺን ቸርነት

VERSE 1
በጭንቄ ቀን የደረስሽልኝ
አንቺ ነሽ እመቤቴ የረዳሽኝ

ድንግል ማርያም የፍቅር እናት (2)
አትለይኝ በዘመኔ ሁሉ

VERSE 2
ስምሽን ጠርቼ መቼ አፍራለሁ
አንቺን ይዤ መቼ እወድቃለሁ`

  const res = cleanMezmurLyrics(input)
  assert.equal(res.cleanedText, expected, 'Test 6: Chorus variation preserved')
  assert.equal(res.removedChorusCount, 1, 'Only duplicate Chorus 1 removed')
  console.log('✓ PASS: Test 6 - Chorus variations with unique lyrics preserved')
}

// -----------------------------------------------------------------------------
// Test 7: Hymn ending with Chorus (CVC)
// -----------------------------------------------------------------------------
{
  const input = `CHORUS
አሐደ ለከ ወአሐደ ለሙሴ (2)
ወአሐደ ለኤልያስ ንግበር ማኅደረ (4)

VERSE 1
ደብረ ታቦር ላይ ክብሩን አሳየ
ሙሴና ኤልያስ አብረው ታዩ

CHORUS
አሐደ ለከ ወአሐደ ለሙሴ (2)
ወአሐደ ለኤልያስ ንግበር ማኅደረ (4)`

  const expected = `አሐደ ለከ ወአሐደ ለሙሴ (2)
ወአሐደ ለኤልያስ ንግበር ማኅደረ (4)

VERSE 1
ደብረ ታቦር ላይ ክብሩን አሳየ
ሙሴና ኤልያስ አብረው ታዩ`

  const res = cleanMezmurLyrics(input)
  assert.equal(res.cleanedText, expected, 'Test 7: Ending chorus removed')
  console.log('✓ PASS: Test 7 - Trailing duplicate chorus removed')
}

console.log('\n=== ALL UNIT TESTS PASSED SUCCESSFULLY ===\n')
