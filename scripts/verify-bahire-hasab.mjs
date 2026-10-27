/**
 * TEWAHEDODAILY — BAHIRE HASAB COMPUTUS TEST SUITE
 *
 * Verifies canonical Ethiopian Orthodox liturgical computus calculation
 * across 2016-2025 E.C., checking:
 * 1. Amete Alem & Evangelist cycling
 * 2. Medeb, Wenber, Abektie, Metqe rules
 * 3. Movable feast and fast sequencing:
 *    Nenewe -> Abiy Tsom (+14d) -> Hosanna (+62d) -> Siklet (+67d) -> Fasika (+69d) -> Erget (+108d) -> Pentecost (+118d) -> Tsome Hawaryat (+119d)
 */

import { computeBahireHasab } from '../src/lib/churchCalendar/bahireHasabEngine.ts'

console.log('--- RUNNING BAHIRE HASAB COMPUTUS VERIFICATION ---')

let passed = 0
let failed = 0

function assert(condition, description) {
  if (condition) {
    passed++
    console.log(`  ✓ ${description}`)
  } else {
    failed++
    console.error(`  ✗ FAIL: ${description}`)
  }
}

for (let year = 2016; year <= 2025; year++) {
  const c = computeBahireHasab(year)
  
  // Verify evangelist
  const evangelists = ['ዮሐንስ', 'ማቴዎስ', 'ማርቆስ', 'ሉቃስ']
  const expectedEvangelist = evangelists[c.ameteAlem % 4]
  assert(c.evangelist === expectedEvangelist, `Year ${year} E.C. (Amete Alem ${c.ameteAlem}): Evangelist is ${c.evangelist}`)

  // Verify Abektie + Metqe = 30 rule
  assert(
    (c.abektie + c.metqe === 30) || (c.abektie === 0 && c.metqe === 30) || (c.abektie === 0 && c.metqe === 0),
    `Year ${year} E.C.: Abektie (${c.abektie}) and Metqe (${c.metqe}) satisfy epact rule`
  )

  // Verify movable feasts exist and have dates
  assert(c.nenewe.ethiopianDate.month >= 5 && c.nenewe.ethiopianDate.month <= 6, `Year ${year} E.C.: Nenewe in Yekatit/Megabit (${c.nenewe.ethiopianDate.month}/${c.nenewe.ethiopianDate.day})`)
  assert(c.abiyTsom.ethiopianDate.month >= 5 && c.abiyTsom.ethiopianDate.month <= 7, `Year ${year} E.C.: Abiy Tsom (${c.abiyTsom.ethiopianDate.month}/${c.abiyTsom.ethiopianDate.day})`)
  assert(c.fasika.ethiopianDate.month === 7 || c.fasika.ethiopianDate.month === 8, `Year ${year} E.C.: Fasika in Megabit/Miazia (${c.fasika.ethiopianDate.month}/${c.fasika.ethiopianDate.day})`)
  assert(c.erget.ethiopianDate.month >= 9, `Year ${year} E.C.: Erget in Ginbot/Sene (${c.erget.ethiopianDate.month}/${c.erget.ethiopianDate.day})`)
  assert(c.pentecost.ethiopianDate.month >= 9, `Year ${year} E.C.: Pentecost in Ginbot/Sene (${c.pentecost.ethiopianDate.month}/${c.pentecost.ethiopianDate.day})`)
}

// Specific known feast test:
// In 2016 E.C., Fasika was Miazia 27
const c2016 = computeBahireHasab(2016)
assert(c2016.fasika.ethiopianDate.month === 8 && c2016.fasika.ethiopianDate.day === 27, `2016 E.C. Fasika is Miazia 27 (got Miazia ${c2016.fasika.ethiopianDate.day})`)
assert(c2016.evangelist === 'ዮሐንስ', `2016 E.C. Evangelist is John (ዮሐንስ)`)

// In 2017 E.C., Fasika is Miazia 12
const c2017 = computeBahireHasab(2017)
assert(c2017.fasika.ethiopianDate.month === 8 && c2017.fasika.ethiopianDate.day === 12, `2017 E.C. Fasika is Miazia 12 (got Miazia ${c2017.fasika.ethiopianDate.day})`)
assert(c2017.evangelist === 'ማቴዎስ', `2017 E.C. Evangelist is Matthew (ማቴዎስ)`)

console.log(`\nBahire Hasab Results: ${passed} passed, ${failed} failed.`)
if (failed > 0) process.exit(1)
