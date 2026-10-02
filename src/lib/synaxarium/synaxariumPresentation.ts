/**
 * Public Synaxarium presentation helpers.
 * Titles/summaries come from structured fields or careful source-grounded cleanup.
 * Never invent theological/historical facts.
 */

export type SynaxariumReviewStatus = 'ok' | 'needs_review' | 'omit_public'

export type SynaxariumPresentationItem = {
  id: string
  slug: string
  title: string
  titleAmharic: string
  summary: string
  summaryAmharic: string
  category: string
  categoryLabel: string
  body: string
  bodyAmharic: string
  sortOrder: number
  reviewStatus: SynaxariumReviewStatus
  /** True when summary was derived from body (not staff-authored). */
  summaryDerived: boolean
  featured: boolean
  imagePath: string | null
  imageAlt: string
  scriptureReferences: string
}

type RawInput = {
  id: string
  slug?: string | null
  title?: string | null
  titleAmharic?: string | null
  title_amharic?: string | null
  summary?: string | null
  summaryAmharic?: string | null
  summary_amharic?: string | null
  commemorationType?: string | null
  commemoration_type?: string | null
  bodyEnglish?: string | null
  body_english?: string | null
  bodyAmharic?: string | null
  body_amharic?: string | null
  sortOrder?: number | null
  sort_order?: number | null
  featured?: boolean | null
  imagePath?: string | null
  image_path?: string | null
  imageAlt?: string | null
  image_alt?: string | null
  scriptureReferences?: string | null
  scripture_references?: string | null
  contentReviewStatus?: string | null
  content_review_status?: string | null
}

const ETH_MONTH =
  /^(Meskerem|Maskaram|Tikimt|Tekemt|Teqemt|Hidar|Hedar|Tahsas|Tahisas|Tir|Ter|Yekatit|Yakatit|Megabit|Magabit|Miazia|Miyazya|Miyazia|Ginbot|Genbot|Sene|Senne|Sane|Hamle|Nehase|Nehasse|Nahasse|Pagumen|Paguemen)\b/i

const GREG_PAREN =
  /\(\s*(January|February|March|April|May|June|July|August|September|October|November|December)\b/i

const FRAGMENT_START =
  /^(is |are |was |were |and |also |on this day is |on this day also is |salutation to |concerning whom |who was |who were )/i

function trim(value?: string | null): string {
  return (value || '').replace(/\s+/g, ' ').trim()
}

function collapseLines(value?: string | null): string {
  return (value || '').replace(/\r\n/g, '\n').replace(/\n+/g, ' ').replace(/\s+/g, ' ').trim()
}

/** Date / day-header rows incorrectly imported as commemorations. */
export function isSynaxariumDateHeading(title?: string | null, body?: string | null): boolean {
  const t = collapseLines(title)
  const b = collapseLines(body)
  if (!t) return false
  if (/^THE FIRST MONTH\b/i.test(t)) return true
  if (ETH_MONTH.test(t) && (GREG_PAREN.test(t) || /^\S+\s+\d{1,2}\b/.test(t))) {
    // "Meskerem 22 (October 02)" or nearly identical body
    if (!b || b === t || b.length < 40) return true
    if (b.length <= t.length + 8) return true
  }
  if (
    /^\S+\s+\d{1,2}\s*\n?\s*\((?:October|September|November|December|January|February|March|April|May|June|July|August)\b/i.test(
      (title || '').trim(),
    )
  ) {
    return true
  }
  return false
}

/** Mid-sentence / parser-fragment titles that must not stand alone. */
export function isSynaxariumFragmentTitle(title?: string | null): boolean {
  const t = collapseLines(title)
  if (!t) return true
  if (FRAGMENT_START.test(t)) return true
  if (/^[a-z]/.test(t) && t.length < 80) return true
  if (/^[a-z]/.test(t) && /^(the |a |an )/i.test(t) === false && !/^saints?\b/i.test(t)) {
    // lowercase narrative opener
    if (/\bbecame\b|\bis commemorated\b|\bdied\b/i.test(t)) return true
  }
  // Truncated mid-phrase imports
  if (/\bwashed in the$/i.test(t) || /\bwho was one o$/i.test(t)) return true
  if (t.endsWith(',') && t.length < 50) return true
  return false
}

export function formatSynaxariumCategoryLabel(raw?: string | null, textHint = ''): string {
  const value = trim(raw).toLowerCase().replace(/[\s-]+/g, '_')
  const blob = `${value} ${textHint}`.toLowerCase()
  if (value === 'martyr' || /\bmartyr/.test(blob)) {
    return /\bmartyrs\b/.test(blob) || /\band\b.+\bmartyr/.test(blob) ? 'MARTYRS' : 'MARTYR'
  }
  if (value === 'apostle' || /\bapostle/.test(blob)) return 'APOSTLE'
  if (value === 'prophet' || /\bprophet/.test(blob)) return 'PROPHET'
  if (value === 'bishop' || value === 'patriarch' || /\bbishop|patriarch|archbishop/.test(blob)) {
    return 'BISHOP'
  }
  if (value === 'monk' || /\bmonk|abba|abune|anchorite|ascetic/.test(blob)) return 'MONK'
  if (value === 'virgin' || /\bvirgin\b/.test(blob)) return 'VIRGIN'
  if (value === 'feast' || /\bfeast|festival|consecration/.test(blob)) return 'FEAST'
  if (value === 'saint' || /\bsaint\b/.test(blob)) return 'SAINT'
  if (value === 'angel' || /\barchangel|angel\b/.test(blob)) return 'ANGEL'
  if (value === 'other' || !value) return 'COMMEMORATION'
  if (value === 'commemoration') return 'COMMEMORATION'
  // Unknown internal tokens → friendly fallback
  return 'COMMEMORATION'
}

/**
 * Prefer a proper name heading over a full narrative sentence used as title.
 */
export function cleanSynaxariumTitle(rawTitle?: string | null, body?: string | null): string {
  let title = collapseLines(rawTitle)
  const source = collapseLines(body)

  if (!title) {
    title = extractNameFromNarrative(source) || ''
  }

  // Narrative sentence stored as title: "the Saints X became martyrs."
  const became = /^(?:on this day(?: also)?\s+)?(?:the\s+)?(.+?)\s+became\s+(?:a\s+)?martyrs?\.?$/i.exec(
    title,
  )
  if (became) {
    title = became[1].trim()
  }

  const commemorated = /^(?:on this day(?: also)?\s+)?(?:is|are)\s+commemorated\s+(.+?)\.?$/i.exec(
    title,
  )
  if (commemorated) {
    title = commemorated[1].trim()
  }

  title = title
    .replace(/^(?:on this day(?: also)?\s+)/i, '')
    .replace(/^the repose of\s+/i, '')
    .replace(/^the martyrdom of\s+/i, '')
    .replace(/\s+/g, ' ')
    .trim()

  // Drop trailing narrative clause if still present
  title = title.replace(/\s+became\s+(?:a\s+)?martyrs?\.?$/i, '').trim()
  title = title.replace(/\.$/, '').trim()

  // Parenthetical transliterations: keep primary form short
  // "Kotolos (Cotylus)" stays; strip noisy multi-clause tails
  if (title.length > 72 && /,/.test(title)) {
    const first = title.split(',')[0]?.trim()
    if (first && first.length >= 8) title = first
  }

  if (!title && source) {
    title = extractNameFromNarrative(source) || ''
  }

  return capitalizeHeading(title)
}

function extractNameFromNarrative(body: string): string | null {
  if (!body) return null
  const patterns = [
    /^On this day(?: also)?\s+(?:the\s+)?(?:holy\s+)?(Saints?\s+.+?)\s+became\s+(?:a\s+)?martyrs?/i,
    /^On this day(?: also)?\s+(Saint\s+.+?)\s+became\s+(?:a\s+)?martyr/i,
    /^On this day(?: also)?\s+(?:is|are)\s+commemorated\s+(.+?)(?:\.|$)/i,
    /^On this day(?: also)?\s+(?:died|reposed)\s+(.+?)(?:\.|$)/i,
    /^salutation to\s+(.+?)\.?$/i,
  ]
  for (const re of patterns) {
    const m = re.exec(body)
    if (m?.[1]) {
      let name = m[1].trim().replace(/\.$/, '')
      name = name.replace(/\s+became\s+(?:a\s+)?martyrs?$/i, '').trim()
      if (name.length >= 3 && name.length <= 100) return name
    }
  }
  return null
}

function capitalizeHeading(value: string): string {
  const t = trim(value)
  if (!t) return ''
  // Keep all-caps month banners out
  if (t === t.toUpperCase() && t.length > 12) {
    return t.charAt(0) + t.slice(1).toLowerCase()
  }
  if (/^[a-z]/.test(t)) return t.charAt(0).toUpperCase() + t.slice(1)
  return t
}

/**
 * Staff summary first; otherwise one short sentence grounded in the body.
 */
export function deriveSynaxariumSummary(options: {
  summary?: string | null
  body?: string | null
  title?: string | null
  categoryLabel?: string
}): { summary: string; derived: boolean; needsReview: boolean } {
  const authored = trim(options.summary)
  if (authored) {
    return { summary: clampSummary(authored), derived: false, needsReview: false }
  }

  const body = collapseLines(options.body)
  if (!body) {
    return { summary: '', derived: false, needsReview: true }
  }

  // Salutation-only stubs
  if (/^salutation to\b/i.test(body)) {
    const who = body.replace(/^salutation to\s+/i, '').replace(/\.$/, '').trim()
    if (who && options.title && who.toLowerCase().includes(options.title.toLowerCase().slice(0, 12))) {
      return {
        summary: clampSummary(`Salutation to ${who}.`),
        derived: true,
        needsReview: true,
      }
    }
    return { summary: '', derived: false, needsReview: true }
  }

  let sentence = firstSentences(body, 2)
  sentence = sentence
    .replace(/^On this day(?: also)?\s+/i, '')
    .replace(/^In this day(?: also)?\s+/i, '')
    .trim()

  // Prefer a short factual restatement from opening pattern without inventing facts
  const martyrOpen =
    /^(?:the\s+)?(Saints?\s+.+?)\s+became\s+(?:a\s+)?martyrs?/i.exec(sentence) ||
    /^(Saint\s+.+?)\s+became\s+(?:a\s+)?martyr/i.exec(sentence)
  if (martyrOpen) {
    const names = martyrOpen[1].trim().replace(/\.$/, '')
    const plural = /saints\b/i.test(names) || /\band\b/i.test(names)
    return {
      summary: clampSummary(
        plural
          ? `${names} are remembered for their martyrdom.`
          : `${names} is remembered for martyrdom.`,
      ),
      derived: true,
      needsReview: false,
    }
  }

  const commemorated = /^(?:is|are)\s+commemorated\s+(.+?)(?:\.|$)/i.exec(sentence)
  if (commemorated) {
    const who = commemorated[1].trim()
    return {
      summary: clampSummary(`${capitalizeHeading(who)} is commemorated on this day.`),
      derived: true,
      needsReview: false,
    }
  }

  // Generic: use cleaned opening sentence if short enough and not a fragment
  if (sentence.length >= 24 && sentence.length <= 220 && !FRAGMENT_START.test(sentence)) {
    return { summary: clampSummary(ensurePeriod(sentence)), derived: true, needsReview: false }
  }

  return { summary: '', derived: false, needsReview: true }
}

function firstSentences(text: string, max: number): string {
  const parts = text
    .split(/(?<=[.!?])\s+/)
    .map((p) => p.trim())
    .filter(Boolean)
  return parts.slice(0, max).join(' ')
}

function ensurePeriod(text: string): string {
  const t = trim(text)
  if (!t) return ''
  return /[.!?]$/.test(t) ? t : `${t}.`
}

function clampSummary(text: string, max = 180): string {
  const t = ensurePeriod(trim(text))
  if (t.length <= max) return t
  const cut = t.slice(0, max - 1)
  const at = Math.max(cut.lastIndexOf('. '), cut.lastIndexOf(' '))
  const sliced = (at > 40 ? cut.slice(0, at + 1) : cut).trim()
  return /[.!?]$/.test(sliced) ? sliced : `${sliced}…`
}

function readReviewStatus(raw?: string | null): SynaxariumReviewStatus | null {
  const v = trim(raw).toLowerCase()
  if (v === 'needs_review' || v === 'review') return 'needs_review'
  if (v === 'omit_public' || v === 'omit' || v === 'hidden') return 'omit_public'
  if (v === 'ok' || v === 'approved') return 'ok'
  return null
}

export function presentSynaxariumCommemoration(raw: RawInput): SynaxariumPresentationItem {
  const titleRaw = raw.title
  const body = collapseLines(raw.bodyEnglish || raw.body_english)
  const bodyAmharic = collapseLines(raw.bodyAmharic || raw.body_amharic)
  const authoredSummary = trim(raw.summary)
  const summaryAmharic = trim(raw.summaryAmharic || raw.summary_amharic)
  const typeRaw = raw.commemorationType || raw.commemoration_type || ''
  const forced = readReviewStatus(raw.contentReviewStatus || raw.content_review_status)

  let reviewStatus: SynaxariumReviewStatus = forced || 'ok'

  if (isSynaxariumDateHeading(titleRaw, body || titleRaw)) {
    reviewStatus = 'omit_public'
  } else if (isSynaxariumFragmentTitle(titleRaw) && !authoredSummary) {
    reviewStatus = forced || 'needs_review'
  }

  const cleanedTitle = cleanSynaxariumTitle(titleRaw, body)
  const categoryLabel = formatSynaxariumCategoryLabel(
    typeRaw,
    `${cleanedTitle} ${body} ${authoredSummary}`,
  )

  const derived = deriveSynaxariumSummary({
    summary: authoredSummary,
    body,
    title: cleanedTitle,
    categoryLabel,
  })

  // Successful cleanup of a narrative/import title → treat as displayable.
  if (
    reviewStatus === 'needs_review' &&
    cleanedTitle &&
    !isSynaxariumFragmentTitle(cleanedTitle) &&
    (authoredSummary || derived.summary)
  ) {
    reviewStatus = forced || 'ok'
  }

  if (!cleanedTitle && reviewStatus === 'ok') {
    reviewStatus = 'needs_review'
  }
  if (derived.needsReview && reviewStatus === 'ok' && !authoredSummary && !derived.summary) {
    reviewStatus = 'needs_review'
  }

  // Fragments without a salvageable title: omit from compact public list
  if (
    (forced === 'omit_public' || reviewStatus === 'needs_review') &&
    isSynaxariumFragmentTitle(titleRaw) &&
    (!cleanedTitle || isSynaxariumFragmentTitle(cleanedTitle))
  ) {
    reviewStatus = forced === 'omit_public' || forced === 'needs_review' ? forced : 'omit_public'
  }
  if (forced === 'omit_public') reviewStatus = 'omit_public'

  return {
    id: raw.id,
    slug: trim(raw.slug) || raw.id,
    title: cleanedTitle || capitalizeHeading(collapseLines(titleRaw)),
    titleAmharic: trim(raw.titleAmharic || raw.title_amharic),
    summary: derived.summary,
    summaryAmharic,
    category: trim(typeRaw) || 'commemoration',
    categoryLabel,
    body,
    bodyAmharic,
    sortOrder: Number(raw.sortOrder ?? raw.sort_order ?? 0) || 0,
    reviewStatus,
    summaryDerived: derived.derived,
    featured: Boolean(raw.featured),
    imagePath: trim(raw.imagePath || raw.image_path) || null,
    imageAlt: trim(raw.imageAlt || raw.image_alt) || cleanedTitle,
    scriptureReferences: trim(raw.scriptureReferences || raw.scripture_references),
  }
}

/**
 * Order-preserving public list for Calendar compact panel.
 * Omits date headers and irreparable fragments; does not invent content.
 */
export function presentSynaxariumForDay(rows: RawInput[]): SynaxariumPresentationItem[] {
  const presented = rows
    .map(presentSynaxariumCommemoration)
    .sort((a, b) => a.sortOrder - b.sortOrder || a.title.localeCompare(b.title))

  const out: SynaxariumPresentationItem[] = []
  for (const item of presented) {
    if (item.reviewStatus === 'omit_public') continue
    // needs_review with title but no summary: still show title-only
    out.push(item)
  }
  return out
}
