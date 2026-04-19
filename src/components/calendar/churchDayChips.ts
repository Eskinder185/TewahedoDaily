import type { ChurchDaySnapshot } from '../../lib/churchCalendar'
import { formatEthiopianLong, type EthiopianDateParts } from '../../lib/ethiopianDate'

/**
 * Small UI chips for selected day — observance type, date formats, and liturgical classification.
 */
export function dayObservanceChips(snapshot: ChurchDaySnapshot): string[] {
  const chips: string[] = []
  
  // Ethiopian date chip
  const ethiopianDate: EthiopianDateParts = {
    year: snapshot.ethiopian.year,
    month: snapshot.ethiopian.month,
    day: snapshot.ethiopian.day
  }
  chips.push(`Ethiopian: ${formatEthiopianLong(ethiopianDate)}`)
  
  // Observance type classification
  const observanceTypes = snapshot.commemoration.observanceType || []
  if (observanceTypes.length > 0) {
    const typeLabels = observanceTypes.map(type => {
      switch (type) {
        case 'feast': return 'Feast Day'
        case 'fast': return 'Fast Day'
        case 'saint-commemoration': return 'Saint'
        case 'marian-observance': return 'Marian'
        case 'angel-commemoration': return 'Angel'
        case 'movable-feast': return 'Movable Feast'
        case 'seasonal-observance': return 'Season'
        case 'mixed-observance': return 'Mixed'
        default: return type
      }
    })
    chips.push(...typeLabels)
  }
  
  // Movable observance indicators
  if (snapshot.movableOnDay.length > 0) {
    snapshot.movableOnDay.forEach(movable => {
      chips.push(`Movable: ${movable.title}`)
    })
  }
  
  // Fast chip
  if (snapshot.fasting.combinedChip) {
    chips.push(`Fast: ${snapshot.fasting.combinedChip}`)
  }
  
  // Season chip
  if (snapshot.season.summary !== 'Church year') {
    chips.push(`Season: ${snapshot.season.summary}`)
  }
  
  // Additional legacy logic for classification
  const title = `${snapshot.commemoration.title} ${snapshot.commemoration.subtitle ?? ''}`.toLowerCase()

  if (/be.?la|monthly|በዓል.*ማርያም|ሚካኤል|ገብርኤል|ሥላሴ/i.test(title)) {
    chips.push('Monthly feast')
  }
  if (/feast|transfig|timkat|fasika|gena|meskel|peraklitos|ascension|filseta|lideta/i.test(title)) {
    chips.push('Great feast or feast')
  }
  if (snapshot.commemoration.subtitle?.trim()) {
    chips.push('Saint or synaxarium commemoration')
  }
  if (chips.length === 1) chips.push('Liturgical day') // Only Ethiopian date was added

  return [...new Set(chips)]
}
