import type { LiturgyEntry } from './prayerLibraryTypes'

const PROVENANCE_DESCRIPTION =
  /^(extracted|imported|generated)\s+from\s+(pdf|source|csv|json)\.?$/i

const MEANINGLESS_TITLE = /^(untitled|null|undefined|n\/a|na|-|—|–)$/i

const FRONT_MATTER_HINT =
  /\b(translated by|translation|published|reprinted|edition|copyright|kingston|jamaica|marcos daoud|marsie hazen|forward all comments|introduction\s*\.{3}|responsibility for errors|ethiopian orthodox church|table of contents|contents\b)\b/i

const TOC_DOTTED = /\.{5,}/

export type LiturgyLangMode = 'amharic' | 'english' | 'transliteration' | 'both'

export type LiturgyRenderBlock =
  | { kind: 'frontMatter'; id: string; lines: string[]; entryIds: string[] }
  | { kind: 'group'; id: string; speaker: string; contentType: string; entries: LiturgyEntry[] }
  | { kind: 'entry'; entry: LiturgyEntry }

export function isGenericProvenanceText(value: string | null | undefined): boolean {
  return PROVENANCE_DESCRIPTION.test((value || '').trim())
}

export function meaningfulTitle(value: string | null | undefined, sectionTitle?: string): string {
  const title = (value || '').trim()
  if (!title || MEANINGLESS_TITLE.test(title)) return ''
  if (sectionTitle && title.toLowerCase() === sectionTitle.trim().toLowerCase()) return ''
  return title
}

export function publicSpeakerLabel(speaker: string | null | undefined): string {
  const value = (speaker || '').trim().toLowerCase()
  if (!value || value === 'unknown' || value === 'instruction' || value === 'n/a' || value === 'rubric') {
    return ''
  }
  return value.replace(/[-_]+/g, ' ').replace(/\b\w/g, (c) => c.toUpperCase())
}

export function normalizeContentType(entry: LiturgyEntry): string {
  const type = entry.contentType.trim().toLowerCase()
  if (type === 'front_matter' || type === 'front-matter' || type === 'metadata') return 'front-matter'
  if (type) return type
  const speaker = entry.speaker.trim().toLowerCase()
  if (speaker === 'instruction') return 'instruction'
  return 'unknown'
}

function entryPlainText(entry: LiturgyEntry): string {
  return [entry.title, entry.titleAmharic, entry.textEnglish, entry.textAmharic, entry.transliteration]
    .map((part) => (part || '').trim())
    .filter(Boolean)
    .join('\n')
}

function isFrontMatterCandidate(entry: LiturgyEntry, index: number): boolean {
  if (index > 30) return false
  const type = normalizeContentType(entry)
  if (type === 'front-matter' || type === 'metadata') return true
  const speaker = entry.speaker.trim().toLowerCase()
  const text = entryPlainText(entry)
  if (!text) return false

  const softType =
    type === 'rubric' ||
    type === 'instruction' ||
    type === 'unknown' ||
    type === '' ||
    speaker === 'instruction' ||
    speaker === 'unknown' ||
    !speaker

  if (!softType) return false
  if (FRONT_MATTER_HINT.test(text)) return true
  if (TOC_DOTTED.test(text) && text.length < 280) return true
  if (/^published\b/i.test(text) || /^reprinted\b/i.test(text) || /^translated\b/i.test(text)) return true
  return false
}

function groupKey(entry: LiturgyEntry): string {
  const type = normalizeContentType(entry)
  if (type === 'rubric' || type === 'instruction') return `rubric:${entry.id}`
  const speaker = publicSpeakerLabel(entry.speaker) || 'none'
  return `${speaker}::${type}`
}

function canMergeConsecutive(a: LiturgyEntry, b: LiturgyEntry): boolean {
  const typeA = normalizeContentType(a)
  const typeB = normalizeContentType(b)
  if (typeA === 'rubric' || typeA === 'instruction' || typeB === 'rubric' || typeB === 'instruction') {
    return false
  }
  return groupKey(a) === groupKey(b)
}

/** Separate early source/edition lines, then group consecutive liturgical lines. */
export function groupLiturgyEntriesForDisplay(entries: LiturgyEntry[]): LiturgyRenderBlock[] {
  const blocks: LiturgyRenderBlock[] = []
  let i = 0

  // Front matter at the start only
  if (entries.length && isFrontMatterCandidate(entries[0], 0)) {
    const group: LiturgyEntry[] = []
    while (i < entries.length && isFrontMatterCandidate(entries[i], i) && group.length < 24) {
      group.push(entries[i])
      i += 1
    }
    if (group.length) {
      blocks.push({
        kind: 'frontMatter',
        id: `front-matter-${group[0].id}`,
        entryIds: group.map((entry) => entry.id),
        lines: group
          .map((entry) => entryPlainText(entry).replace(/\s+/g, ' ').trim())
          .filter(Boolean),
      })
    }
  }

  while (i < entries.length) {
    const start = entries[i]
    if (isFrontMatterCandidate(start, i) && i < 8) {
      // stray mid-section metadata — fold into a compact front-matter chip
      const stray: LiturgyEntry[] = [start]
      i += 1
      while (i < entries.length && isFrontMatterCandidate(entries[i], i) && stray.length < 6) {
        stray.push(entries[i])
        i += 1
      }
      blocks.push({
        kind: 'frontMatter',
        id: `front-matter-${stray[0].id}`,
        entryIds: stray.map((entry) => entry.id),
        lines: stray
          .map((entry) => entryPlainText(entry).replace(/\s+/g, ' ').trim())
          .filter(Boolean),
      })
      continue
    }

    const group: LiturgyEntry[] = [start]
    i += 1
    while (i < entries.length && canMergeConsecutive(group[group.length - 1], entries[i])) {
      group.push(entries[i])
      i += 1
      if (group.length >= 40) break
    }

    if (group.length === 1) {
      blocks.push({ kind: 'entry', entry: group[0] })
    } else {
      blocks.push({
        kind: 'group',
        id: `group-${group[0].id}`,
        speaker: publicSpeakerLabel(group[0].speaker),
        contentType: normalizeContentType(group[0]),
        entries: group,
      })
    }
  }

  return blocks
}

export function availableLangModes(entries: LiturgyEntry[]): LiturgyLangMode[] {
  const hasAm = entries.some((entry) => entry.textAmharic.trim() || entry.titleAmharic.trim())
  const hasEn = entries.some((entry) => entry.textEnglish.trim() || entry.title.trim())
  const hasTr = entries.some((entry) => entry.transliteration.trim())
  const modes: LiturgyLangMode[] = []
  if (hasAm) modes.push('amharic')
  if (hasEn) modes.push('english')
  if (hasTr) modes.push('transliteration')
  if ((hasAm && hasEn) || (hasAm && hasTr) || (hasEn && hasTr)) modes.push('both')
  return modes
}

export function defaultLangMode(modes: LiturgyLangMode[]): LiturgyLangMode | null {
  if (!modes.length) return null
  if (modes.includes('english')) return 'english'
  if (modes.includes('amharic')) return 'amharic'
  return modes[0]
}
