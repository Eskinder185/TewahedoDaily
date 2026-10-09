/**
 * Presentation model for Learn How to Pray — grouping and safe parsing only.
 * Never invents religious content; derives visuals from existing section text/slugs.
 */
import type { PrayerGuideSection } from './prayerGuides'

export type GuideLangMode = 'am' | 'en'
export type GuideSectionKind = 'instruction' | 'prayer' | 'article'

export type LearnTopicGroup = {
  id: string
  label: string
  slugs: readonly string[]
}

/** Educational topic groups keyed by existing section slugs. */
export const LEARN_TOPIC_GROUPS: readonly LearnTopicGroup[] = [
  {
    id: 'foundations',
    label: 'Foundations',
    slugs: ['order-introduction', 'canonical-hours', 'kinds-of-prayer'],
  },
  {
    id: 'ways-we-pray',
    label: 'Ways We Pray',
    slugs: ['private-prayer', 'family-prayer', 'public-prayer', 'saatat-and-hymns'],
  },
  {
    id: 'liturgy',
    label: 'Liturgy',
    slugs: ['priestly-prayers', 'parts-of-liturgy', 'fourteen-anaphoras'],
  },
  {
    id: 'how-to-pray',
    label: 'How to Pray',
    slugs: ['prayer-posture', 'sign-of-cross', 'attention-in-prayer'],
  },
  {
    id: 'prayers-of-the-church',
    label: 'Prayers of the Church',
    slugs: ['litany', 'prayer-for-the-dead', 'commemoration', 'other-intercessions'],
  },
] as const

const PRAYER_SLUGS = new Set(['church-greeting', 'thanksgiving', 'supplication'])

/** Liturgical hour labels present in the Seven Hours source text (not clock times). */
export const SEVEN_HOURS_LABELS = [
  'Morning',
  'Third Hour',
  'Noon',
  'Ninth Hour',
  'Evening',
  'Before Bed',
  'Midnight',
] as const

export function resolveSectionKind(section: PrayerGuideSection): GuideSectionKind {
  const raw = section.contentType?.trim().toLowerCase()
  if (raw === 'instruction' || raw === 'prayer' || raw === 'article') return raw
  if (PRAYER_SLUGS.has(section.slug)) return 'prayer'
  if (section.sortOrder <= 7) return 'instruction'
  return 'article'
}

/** First N sections by sort_order are the guided practice journey. */
export function splitGuideSections(sections: PrayerGuideSection[], guidedCount = 7) {
  const ordered = [...sections].sort((a, b) => a.sortOrder - b.sortOrder || a.slug.localeCompare(b.slug))
  return {
    guidedSteps: ordered.slice(0, guidedCount),
    learnSections: ordered.slice(guidedCount),
  }
}

export function groupLearnSections(sections: PrayerGuideSection[]) {
  const bySlug = new Map(sections.map((section) => [section.slug, section]))
  const used = new Set<string>()
  const groups = LEARN_TOPIC_GROUPS.map((group) => {
    const items = group.slugs
      .map((slug) => bySlug.get(slug))
      .filter((section): section is PrayerGuideSection => Boolean(section))
    for (const item of items) used.add(item.slug)
    return { ...group, sections: items }
  }).filter((group) => group.sections.length > 0)

  const remainder = sections.filter((section) => !used.has(section.slug))
  if (remainder.length > 0) {
    groups.push({
      id: 'more',
      label: 'More',
      slugs: remainder.map((section) => section.slug),
      sections: remainder,
    })
  }
  return groups
}

/** Concise takeaway from existing English body — first sentence only. */
export function rememberFromSection(section: PrayerGuideSection): string {
  const text = section.bodyEnglish
    .replace(/\[[^\]]*]/g, '')
    .replace(/\s+/g, ' ')
    .trim()
  if (!text) return ''
  const match = text.match(/^(.+?[.!?])(?:\s|$)/)
  return (match?.[1] || text).trim()
}

export function parseSevenHoursFromText(bodyEnglish: string): string[] {
  const lower = bodyEnglish.toLowerCase()
  const found: string[] = []
  const checks: { label: (typeof SEVEN_HOURS_LABELS)[number]; patterns: RegExp[] }[] = [
    { label: 'Morning', patterns: [/in the morning/, /morning/] },
    { label: 'Third Hour', patterns: [/third hour/] },
    { label: 'Noon', patterns: [/at noon/, /\bnoon\b/] },
    { label: 'Ninth Hour', patterns: [/ninth hour/] },
    { label: 'Evening', patterns: [/sunset/, /evening/] },
    { label: 'Before Bed', patterns: [/bedtime/, /before bed/] },
    { label: 'Midnight', patterns: [/midnight/] },
  ]
  for (const check of checks) {
    if (check.patterns.some((pattern) => pattern.test(lower))) found.push(check.label)
  }
  return found.length === SEVEN_HOURS_LABELS.length ? [...SEVEN_HOURS_LABELS] : found
}

export function parsePostureChecklist(bodyEnglish: string): string[] {
  const parts = bodyEnglish
    .split(/\(\d+\)\s*/)
    .map((part) => part.trim())
    .filter(Boolean)
  if (parts.length <= 1) return []
  // Drop preamble before first (1)
  const items = bodyEnglish.match(/\(\d+\)\s*[^;]+/g)
  if (!items) return []
  return items.map((item) => item.replace(/^\(\d+\)\s*/, '').replace(/[.;]\s*$/, '').trim()).filter(Boolean)
}

/** Spoken formula quoted in Sign of the Cross source text. */
export function extractQuotedFormula(bodyEnglish: string): { before: string; formula: string; after: string } | null {
  const match = bodyEnglish.match(/[“"]([^”"]+)[”"]/)
  if (!match || match.index == null) return null
  const formula = match[1].trim()
  const before = bodyEnglish.slice(0, match.index).trim()
  const after = bodyEnglish.slice(match.index + match[0].length).trim()
  return { before, formula, after }
}

export const GUIDE_LANG_STORAGE_KEY = 'td-prayer-guide-lang-v1'

export function loadGuideLang(): GuideLangMode {
  if (typeof window === 'undefined') return 'am'
  try {
    const raw = window.localStorage.getItem(GUIDE_LANG_STORAGE_KEY)
    if (raw === 'am' || raw === 'en') return raw
    // Legacy both → English (interface languages are EN/AM only)
    if (raw === 'both') return 'en'
  } catch {
    /* ignore */
  }
  return 'am'
}

export function saveGuideLang(mode: GuideLangMode) {
  if (typeof window === 'undefined') return
  try {
    window.localStorage.setItem(GUIDE_LANG_STORAGE_KEY, mode)
  } catch {
    /* ignore */
  }
}
