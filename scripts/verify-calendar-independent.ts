import { gregorianToEthiopian, ethiopianToGregorian } from '../src/lib/calendar/ethiopianCalendarEngine'
import { computeBahireHasab } from '../src/lib/churchCalendar/bahireHasabEngine'

console.log('=================================================================')
console.log('INDEPENDENT CALENDAR ALGORITHMS & HISTORICAL BENCHMARKS AUDIT')
console.log('=================================================================')

let passed = 0
let failed = 0

function assert(cond: boolean, desc: string) {
  if (cond) {
    passed++
    console.log(`  ✓ ${desc}`)
  } else {
    failed++
    console.error(`  ✗ FAIL: ${desc}`)
  }
}

// 1. Historical & Benchmark Fixed Dates
const historicalFixtures = [
  // Ethiopian Millennium
  { g: { year: 2007, month: 9, day: 12 }, expected: { year: 2000, month: 1, day: 1 }, name: 'Ethiopian Millennium (Meskerem 1, 2000 E.C.)' },
  // Battle of Adwa (1 March 1896 = 23 Yekatit 1888)
  { g: { year: 1896, month: 3, day: 1 }, expected: { year: 1888, month: 6, day: 23 }, name: 'Battle of Adwa (Yekatit 23, 1888 E.C.)' },
  // Meskel 2017 E.C. (27 September 2024)
  { g: { year: 2024, month: 9, day: 27 }, expected: { year: 2017, month: 1, day: 17 }, name: 'Meskel 2017 E.C. (Meskerem 17, 2017 E.C.)' },
  // Genna 2017 E.C. (7 January 2025 = Tahsas 29, 2017)
  { g: { year: 2025, month: 1, day: 7 }, expected: { year: 2017, month: 4, day: 29 }, name: 'Genna 2017 E.C. (Tahsas 29, 2017 E.C.)' },
  // Timket 2017 E.C. (19 January 2025 = Tir 11, 2017)
  { g: { year: 2025, month: 1, day: 19 }, expected: { year: 2017, month: 5, day: 11 }, name: 'Timket 2017 E.C. (Tir 11, 2017 E.C.)' }
]

console.log('\n--- 1. HISTORICAL BENCHMARK VERIFICATIONS ---')
for (const fix of historicalFixtures) {
  const eth = gregorianToEthiopian(fix.g)
  assert(
    eth.year === fix.expected.year && eth.month === fix.expected.month && eth.day === fix.expected.day,
    `${fix.name} -> expected ${fix.expected.year}/${fix.expected.month}/${fix.expected.day}, got ${eth.year}/${eth.month}/${eth.day}`
  )

  // Verify reverse conversion
  const greg = ethiopianToGregorian(fix.expected)
  assert(
    greg.year === fix.g.year &&
    greg.month === fix.g.month &&
    greg.day === fix.g.day,
    `Reverse: ${fix.expected.year}/${fix.expected.month}/${fix.expected.day} -> expected ${fix.g.year}-${fix.g.month}-${fix.g.day}, got ${greg.year}-${greg.month}-${greg.day}`
  )
}

// 2. Bahire Hasab Movable Feasts against EOTC Synod Official Published Calendars
console.log('\n--- 2. BAHIRE HASAB COMPUTUS AGAINST OFFICIAL SYNOD GAZETTES ---')
const synodFixtures = [
  {
    year: 2015,
    evangelist: 'ሉቃስ',
    neneweMonth: 5, neneweDay: 29, // Tir 29
    abiyTsomMonth: 6, abiyTsomDay: 13, // Yekatit 13
    hosannaMonth: 8, hosannaDay: 1, // Miyazya 1
    sikletMonth: 8, sikletDay: 6, // Miyazya 6
    fasikaMonth: 8, fasikaDay: 8, // Miyazya 8
    ergetMonth: 9, ergetDay: 17, // Ginbot 17
    pentecostMonth: 9, pentecostDay: 27 // Ginbot 27
  },
  {
    year: 2016,
    evangelist: 'ዮሐንስ',
    neneweMonth: 6, neneweDay: 18, // Yekatit 18
    abiyTsomMonth: 7, abiyTsomDay: 2, // Megabit 2
    hosannaMonth: 8, hosannaDay: 20, // Miyazya 20
    sikletMonth: 8, sikletDay: 25, // Miyazya 25
    fasikaMonth: 8, fasikaDay: 27, // Miyazya 27
    ergetMonth: 10, ergetDay: 6, // Sene 6
    pentecostMonth: 10, pentecostDay: 16 // Sene 16
  },
  {
    year: 2017,
    evangelist: 'ማቴዎስ',
    neneweMonth: 6, neneweDay: 3, // Yekatit 3
    abiyTsomMonth: 6, abiyTsomDay: 17, // Yekatit 17
    hosannaMonth: 8, hosannaDay: 5, // Miyazya 5
    sikletMonth: 8, sikletDay: 10, // Miyazya 10
    fasikaMonth: 8, fasikaDay: 12, // Miyazya 12
    ergetMonth: 9, ergetDay: 21, // Ginbot 21
    pentecostMonth: 10, pentecostDay: 1 // Sene 1
  }
]

for (const fix of synodFixtures) {
  const c = computeBahireHasab(fix.year)
  console.log(`\nVerifying Year ${fix.year} E.C.:`)
  assert(c.evangelist === fix.evangelist, `Evangelist: expected ${fix.evangelist}, got ${c.evangelist}`)
  assert(c.nenewe.ethiopianDate.month === fix.neneweMonth && c.nenewe.ethiopianDate.day === fix.neneweDay, `Nenewe: expected ${fix.neneweMonth}/${fix.neneweDay}, got ${c.nenewe.ethiopianDate.month}/${c.nenewe.ethiopianDate.day}`)
  assert(c.abiyTsom.ethiopianDate.month === fix.abiyTsomMonth && c.abiyTsom.ethiopianDate.day === fix.abiyTsomDay, `Abiy Tsom: expected ${fix.abiyTsomMonth}/${fix.abiyTsomDay}, got ${c.abiyTsom.ethiopianDate.month}/${c.abiyTsom.ethiopianDate.day}`)
  assert(c.hosanna.ethiopianDate.month === fix.hosannaMonth && c.hosanna.ethiopianDate.day === fix.hosannaDay, `Hosanna: expected ${fix.hosannaMonth}/${fix.hosannaDay}, got ${c.hosanna.ethiopianDate.month}/${c.hosanna.ethiopianDate.day}`)
  assert(c.siklet.ethiopianDate.month === fix.sikletMonth && c.siklet.ethiopianDate.day === fix.sikletDay, `Siklet: expected ${fix.sikletMonth}/${fix.sikletDay}, got ${c.siklet.ethiopianDate.month}/${c.siklet.ethiopianDate.day}`)
  assert(c.fasika.ethiopianDate.month === fix.fasikaMonth && c.fasika.ethiopianDate.day === fix.fasikaDay, `Fasika: expected ${fix.fasikaMonth}/${fix.fasikaDay}, got ${c.fasika.ethiopianDate.month}/${c.fasika.ethiopianDate.day}`)
  assert(c.erget.ethiopianDate.month === fix.ergetMonth && c.erget.ethiopianDate.day === fix.ergetDay, `Erget: expected ${fix.ergetMonth}/${fix.ergetDay}, got ${c.erget.ethiopianDate.month}/${c.erget.ethiopianDate.day}`)
  assert(c.pentecost.ethiopianDate.month === fix.pentecostMonth && c.pentecost.ethiopianDate.day === fix.pentecostDay, `Pentecost: expected ${fix.pentecostMonth}/${fix.pentecostDay}, got ${c.pentecost.ethiopianDate.month}/${c.pentecost.ethiopianDate.day}`)
}

console.log(`\n=================================================================`)
console.log(`INDEPENDENT ALGORITHMIC AUDIT RESULT: ${passed} passed, ${failed} failed`)
console.log(`=================================================================`)
if (failed > 0) process.exit(1)
