/**
 * Resolve a Mezmure Dawit number request against the loaded psalms.
 * A missing number is never replaced with another psalm, and no numbering
 * system is inferred (for example, Psalm 15 is not rewritten as Psalm 1).
 */

export const PSALM_NUMBER_MIN = 1
export const PSALM_NUMBER_MAX = 150

export type PsalmReadingStatus = 'match' | 'missing' | 'browse'

export type PsalmReading<T> = {
  status: PsalmReadingStatus
  requestedNumber: number | null
  match: T | null
  missingNumber: number | null
  display: T | null
  displayRole: 'match' | 'previous' | 'browse' | 'none'
}

/** Parse a pure psalm-number query. Non-numeric text is not a number search. */
export function parseRequestedPsalmNumber(raw: string | null | undefined): number | null {
  const trimmed = (raw ?? '').trim()
  if (!/^\d+$/.test(trimmed)) return null
  const number = Number.parseInt(trimmed, 10)
  if (!Number.isFinite(number) || number < PSALM_NUMBER_MIN || number > PSALM_NUMBER_MAX) {
    return null
  }
  return number
}

export function resolvePsalmReading<T extends { number: number }>(
  psalms: readonly T[],
  requestedRaw: string | null | undefined,
  previous: T | null,
): PsalmReading<T> {
  const requestedNumber = parseRequestedPsalmNumber(requestedRaw)
  if (requestedNumber == null) {
    const display = previous ?? psalms[0] ?? null
    return {
      status: 'browse',
      requestedNumber: null,
      match: null,
      missingNumber: null,
      display,
      displayRole: display ? 'browse' : 'none',
    }
  }

  const match = psalms.find((psalm) => psalm.number === requestedNumber) ?? null
  if (match) {
    return {
      status: 'match',
      requestedNumber,
      match,
      missingNumber: null,
      display: match,
      displayRole: 'match',
    }
  }

  const keepPrevious = previous && previous.number !== requestedNumber ? previous : null
  return {
    status: 'missing',
    requestedNumber,
    match: null,
    missingNumber: requestedNumber,
    display: keepPrevious,
    displayRole: keepPrevious ? 'previous' : 'none',
  }
}

/**
 * A browse default (usually Psalm 1) is not a previous reading.
 * Only a psalm the reader actually opened may stay on screen.
 */
export function retainedPsalmReading<T>(reading: PsalmReading<T> | null): T | null {
  if (!reading) return null
  if (reading.displayRole === 'match' || reading.displayRole === 'previous') {
    return reading.display
  }
  return null
}
