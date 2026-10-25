export type ZemariCandidate = {
  id: string
  slug?: string | null
  name?: string | null
  nameAmharic?: string | null
  aliases?: string[]
}

export type ZemariMatch =
  | { state: 'linked'; zemariId: string; canonicalName: string; method: 'existing_uuid' }
  | { state: 'available'; zemariId: string; canonicalName: string; method: 'exact_name' | 'verified_alias' | 'normalized_name' | 'normalized_transliteration' }
  | { state: 'ambiguous'; candidates: Array<{ id: string; name: string }> }
  | { state: 'name_recorded' }
  | { state: 'not_recorded' }

export type ZemariMatchClassification =
  | 'already_linked'
  | 'safe_exact'
  | 'safe_normalized'
  | 'ambiguous'
  | 'not_found'

export function classifyZemariMatch(match: ZemariMatch): ZemariMatchClassification {
  if (match.state === 'linked') return 'already_linked'
  if (match.state === 'available') {
    if (match.method === 'exact_name' || match.method === 'verified_alias') {
      return 'safe_exact'
    }
    return 'safe_normalized'
  }
  if (match.state === 'ambiguous') return 'ambiguous'
  return 'not_found'
}

const HONORIFICS = [
  // Compound Amharic religious titles
  'ሊቀ መዘምራን',
  'ሊቀ መዘምራናት',
  'ሊቀ ልሣናት',
  'ሊቀ ልሳናት',
  'ሊቀ ዲያቆናት',
  'ሙሐዘ ስብሀት',
  'ሙሐዘ ስብሐት',
  'ሙሐዘ ስብሓት',
  'መልአከ ሰላም',
  'ርዕሰ መዘምራን',
  'ርእሰ መዘምራን',
  'ዘማሪ ቀሲስ',
  'ቀሲስ ዘማሪ',
  'ዘማሪ ዲያቆን',
  'ዲያቆን ዘማሪ',
  'ዘማሪት ሲስተር',
  'ሲስተር ዘማሪት',
  'ዘማሪ ቀሺ',
  'ቀሺ ዘማሪ',

  // Compound English religious titles
  'like mezemiran',
  'like mezemeran',
  'like mezemran',
  'liqe mezemiran',
  'liqe mezemeran',
  'liqe mezemran',
  'liq mezemiran',
  'liq mezemeran',
  'liq mezemran',
  'leqe mezemiran',
  'leqe mezemeran',
  'mezemiran',
  'mezemeran',
  'mezemran',
  'like lisanat',
  'liqe lisanat',
  'liq lisanat',
  'like diyakonat',
  'muhaze sibihat',
  'muhaze sibhat',
  'meliake selam',
  'melake selam',
  'riese mezemiran',
  'reese mezemiran',
  'zemari kesis',
  'kesis zemari',
  'zemari diyakon',
  'zemari deacon',
  'deacon zemari',
  'zemarit sisiter',
  'zemarit sister',
  'sister zemarit',
  'sisiter zemarit',
  'zemari keshi',
  'keshi zemari',

  // Single Amharic titles and abbreviations
  'መዘምራን',
  'መዘምራናት',
  'ዘማሪት',
  'ዘማሪ',
  'ዲያቆን',
  'ዲ ን',
  'ዲ/ን',
  'ዲ.ን',
  'ቀሲስ',
  'ቀ ስ',
  'ቀ/ስ',
  'ቀ.ስ',
  'ቀሺ',
  'ካህን',
  'መምህር',
  'አባ',
  'ሲስተር',

  // Single English titles and abbreviations
  'zemarit',
  'zemari',
  'deaconess',
  'deacon',
  'priest',
  'kesis',
  'keshi',
  'sister',
  'sisiter',
  'father',
  'memher',
  'memhir',
  'abba',
  'd n',
  'd/n',
  'dn.',
  'dn',
  'rev.',
  'rev',
  'fr.',
  'fr',
]

function escapeRegExp(value: string) {
  return value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
}

export function normalizeZemariName(value: unknown): string {
  let result = String(value ?? '').normalize('NFKC').toLocaleLowerCase().trim()
  result = result.replace(/[\u1361-\u1368.,;:()[\]{}'"‘’“”/_\-‐‑‒–—―]+/gu, ' ')
  let previous = ''
  while (result && result !== previous) {
    previous = result
    for (const title of HONORIFICS) {
      result = result.replace(new RegExp(`^${escapeRegExp(title)}(?:\\s+|$)`, 'iu'), '')
    }
    result = result.trim()
  }
  // Standardize common Ethiopian English transliterations (e.g. Yoseph -> Yosef)
  if (/^[a-z0-9 ]+$/i.test(result)) {
    result = result.replace(/ph/g, 'f')
  }
  return result.replace(/\s+/gu, ' ').trim()
}

export function exactName(value: unknown): string {
  return String(value ?? '')
    .normalize('NFKC')
    .toLocaleLowerCase()
    .replace(/[\u1361-\u1368]+/gu, ' ')
    .replace(/\s+/gu, ' ')
    .trim()
}

function displayName(candidate: ZemariCandidate) {
  return String(candidate.name || candidate.nameAmharic || candidate.slug || candidate.id).trim()
}

function unique(matches: ZemariCandidate[], method: Extract<ZemariMatch, { state: 'available' }>['method']): ZemariMatch | null {
  const byId = [...new Map(matches.map((candidate) => [candidate.id, candidate])).values()]
  if (byId.length === 1) return { state: 'available', zemariId: byId[0].id, canonicalName: displayName(byId[0]), method }
  if (byId.length > 1) return { state: 'ambiguous', candidates: byId.map((candidate) => ({ id: candidate.id, name: displayName(candidate) })) }
  return null
}

export function matchZemari(input: {
  singerName?: string | null
  singerSlug?: string | null
  zemariId?: string | null
}, candidates: ZemariCandidate[]): ZemariMatch {
  const existing = candidates.find((candidate) => candidate.id === input.zemariId)
  if (existing) return { state: 'linked', zemariId: existing.id, canonicalName: displayName(existing), method: 'existing_uuid' }
  const singerName = exactName(input.singerName)
  if (!singerName && !String(input.singerSlug || '').trim()) return { state: 'not_recorded' }

  // 1. Exact match on unique name or nameAmharic
  const exact = unique(
    candidates.filter((candidate) =>
      singerName && [candidate.name, candidate.nameAmharic].some((value) => exactName(value) === singerName)
    ),
    'exact_name'
  )
  if (exact) return exact

  // 2. Exact match on verified aliases
  const alias = unique(
    candidates.filter((candidate) =>
      (candidate.aliases || []).some((value) => exactName(value) === singerName)
    ),
    'verified_alias'
  )
  if (alias) return alias

  // 3. Safe normalized match (harmless prefixes stripped, Unicode normalized)
  const normalized = normalizeZemariName(input.singerName)
  if (normalized && normalized.length >= 2) {
    const normalizedMatch = unique(
      candidates.filter((candidate) =>
        [candidate.name, candidate.nameAmharic].some((value) => normalizeZemariName(value) === normalized)
      ),
      'normalized_name'
    )
    if (normalizedMatch) return normalizedMatch

    const normalizedAliasMatch = unique(
      candidates.filter((candidate) =>
        (candidate.aliases || []).some((value) => normalizeZemariName(value) === normalized)
      ),
      'verified_alias'
    )
    if (normalizedAliasMatch) return normalizedAliasMatch
  }

  // 4. Safe normalized transliteration match (slug or Latin name)
  const slugName = normalizeZemariName(String(input.singerSlug || '').replace(/[-_]+/g, ' '))
  if (slugName && /^[a-z0-9 ]+$/i.test(slugName) && slugName.length >= 2) {
    const transliteration = unique(
      candidates.filter((candidate) => {
        return [candidate.slug?.replace(/[-_]+/g, ' '), candidate.name]
          .some((value) => normalizeZemariName(value) === slugName)
      }),
      'normalized_transliteration'
    )
    if (transliteration) return transliteration
  }

  // 5. Safe transliteration match from normalized singerName to candidate slug
  if (normalized && /^[a-z0-9 ]+$/i.test(normalized) && normalized.length >= 2) {
    const translitFromName = unique(
      candidates.filter((candidate) => {
        return candidate.slug && normalizeZemariName(candidate.slug.replace(/[-_]+/g, ' ')) === normalized
      }),
      'normalized_transliteration'
    )
    if (translitFromName) return translitFromName
  }

  return input.singerName ? { state: 'name_recorded' } : { state: 'not_recorded' }
}
