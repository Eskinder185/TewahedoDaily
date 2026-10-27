/**
 * TEWAHEDODAILY — BAHIRE HASAB (ባሕረ ሐሳብ) LITURGICAL COMPUTUS
 *
 * Implements the authoritative canonical Ethiopian Orthodox Tewahedo Church computus
 * for movable fasts, feasts, and seasons for any past, present, or future year.
 */

import {
  type EthiopianDate,
  addEthiopianDays,
  ethiopianToGregorian,
  type CivilDate,
} from '../calendar/ethiopianCalendarEngine'

export type Evangelist = 'ማቴዎስ' | 'ማርቆስ' | 'ሉቃስ' | 'ዮሐንስ'

export interface MovableFeastDate {
  id: string
  nameAmharic: string
  nameEnglish: string
  ethiopianDate: EthiopianDate
  gregorianDate: CivilDate
  kind: 'fast' | 'feast'
}

export interface BahireHasabResult {
  ethiopianYear: number
  ameteAlem: number
  evangelist: Evangelist
  isLeapYear: boolean
  medeb: number
  wenber: number
  abektie: number
  metqe: number
  bealeMetqe: EthiopianDate
  nenewe: MovableFeastDate
  abiyTsom: MovableFeastDate
  debreZeit: MovableFeastDate
  hosanna: MovableFeastDate
  semuneHimamat: MovableFeastDate
  siklet: MovableFeastDate
  fasika: MovableFeastDate
  damawiTensae: MovableFeastDate
  rikbeKahnat: MovableFeastDate
  erget: MovableFeastDate
  pentecost: MovableFeastDate
  tsomeHawaryat: MovableFeastDate
}

const EVANGELISTS: Evangelist[] = ['ዮሐንስ', 'ማቴዎስ', 'ማርቆስ', 'ሉቃስ']

/**
 * Tewsak table indexed by day of week where:
 * 0=Monday (ሰኞ), 1=Tuesday (ማክሰኞ), 2=Wednesday (ረቡዕ),
 * 3=Thursday (ሐሙስ), 4=Friday (ዓርብ), 5=Saturday (ቅዳሜ), 6=Sunday (እሑድ).
 *
 * Canonical Ethiopian Orthodox Tewsak:
 * እሑድ=7, ሰኞ=6, ማክሰኞ=5, ረቡዕ=4, ሐሙስ=3, ዓርብ=2, ቅዳሜ=8
 */
const TEWSAK_TABLE = [6, 5, 4, 3, 2, 8, 7]

export function computeBahireHasab(ethYear: number): BahireHasabResult {
  const ameteAlem = ethYear + 5500
  const evangelist = EVANGELISTS[ameteAlem % 4]
  const isLeapYear = ameteAlem % 4 === 3

  const meteeneRabiet = Math.floor(ameteAlem / 4)
  const tinteQemer = (ameteAlem + meteeneRabiet) % 7 // Meskerem 1 weekday

  const medeb = ameteAlem % 19
  const wenber = medeb === 0 ? 18 : medeb - 1
  const abektie = (wenber * 11) % 30
  const metqe = (wenber * 19) % 30

  // Determine Beale Metqe (Month: 1=Meskerem, 2=Tikimt)
  const bealeMetqeMonth = metqe > 14 ? 1 : 2
  const bealeMetqeDay = metqe
  const bealeMetqeDate: EthiopianDate = {
    year: ethYear,
    month: bealeMetqeMonth,
    day: bealeMetqeDay,
  }

  // Weekday of Beale Metqe
  const dayOffsetFromMeskerem1 =
    bealeMetqeMonth === 1 ? metqe - 1 : 30 + metqe - 1
  const bealeMetqeWeekday = (tinteQemer + dayOffsetFromMeskerem1) % 7
  const tewsak = TEWSAK_TABLE[bealeMetqeWeekday]

  // Fast of Nineveh (Tsom Nenewe)
  let neneweMonth = bealeMetqeMonth === 1 ? 5 : 6 // 5=Tir, 6=Yekatit
  let neneweDay = bealeMetqeDay + tewsak
  if (neneweMonth === 5 && neneweDay > 30) {
    neneweMonth = 6
    neneweDay -= 30
  }
  const neneweEthDate: EthiopianDate = {
    year: ethYear,
    month: neneweMonth,
    day: neneweDay,
  }

  const makeMovable = (
    id: string,
    nameAm: string,
    nameEn: string,
    daysFromNenewe: number,
    kind: 'fast' | 'feast'
  ): MovableFeastDate => {
    const ethDate = addEthiopianDays(neneweEthDate, daysFromNenewe)
    const gregDate = ethiopianToGregorian(ethDate)
    return {
      id,
      nameAmharic: nameAm,
      nameEnglish: nameEn,
      ethiopianDate: ethDate,
      gregorianDate: gregDate,
      kind,
    }
  }

  return {
    ethiopianYear: ethYear,
    ameteAlem,
    evangelist,
    isLeapYear,
    medeb,
    wenber,
    abektie,
    metqe,
    bealeMetqe: bealeMetqeDate,
    nenewe: makeMovable('nineveh-fast', 'ጾመ ነነዌ', 'Fast of Nineveh', 0, 'fast'),
    abiyTsom: makeMovable('abiy-tsom', 'ዐቢይ ጾም', 'Great Lent', 14, 'fast'),
    debreZeit: makeMovable('debre-zeit', 'ደብረ ዘይት', 'Mount of Olives', 41, 'feast'),
    hosanna: makeMovable('hosanna', 'ሆሣዕና', 'Palm Sunday (Hosanna)', 62, 'feast'),
    semuneHimamat: makeMovable('semune-himamat', 'ሰሙነ ሕማማት', 'Holy Week', 63, 'fast'),
    siklet: makeMovable('good-friday', 'ስቅለት', 'Good Friday (Siqlet)', 67, 'fast'),
    fasika: makeMovable('fasika', 'ትንሣኤ / ፋሲካ', 'Fasika (Resurrection Sunday)', 69, 'feast'),
    damawiTensae: makeMovable('damawi-tensae', 'ዳግም ትንሣኤ', 'Thomas Sunday (New Sunday)', 76, 'feast'),
    rikbeKahnat: makeMovable('rikbe-kahnat', 'ርክበ ካህናት', 'Rikbe Kahnat', 93, 'feast'),
    erget: makeMovable('ascension', 'ዕርገት', 'Ascension of Christ (Erget)', 108, 'feast'),
    pentecost: makeMovable('pentecost', 'ጰራቅሊጦስ / በዓለ ኀምሳ', 'Pentecost (Paraclete)', 118, 'feast'),
    tsomeHawaryat: makeMovable('tsome-hawaryat', 'ጾመ ሐዋርያት', "Apostles' Fast", 119, 'fast'),
  }
}
