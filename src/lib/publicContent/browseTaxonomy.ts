/**
 * Browse taxonomy for Hymns Practice — pure functions, no Supabase access.
 *
 * Live browse tree: public.mezmur_collections_import (groups) and
 * public.mezmur_sections_import (sections). This module holds the code-side
 * rules that connect those sections to the canonical taxonomy:
 *
 *  - COLLECTION_TAXONOMY_MAP: which category / occasion link slugs count toward
 *    each browse group (moved here unchanged from hymnBrowse.ts, then extended).
 *  - getCandidateTaxonomySlugs: which link slugs a section shows (moved here).
 *  - LINK_SLUG_EQUIVALENTS: legacy spellings of the same slug written by older
 *    importers (e.g. "new-year-enkutatash" for the live occasion "new-year").
 *  - CANONICAL_FALLBACK_SECTIONS: sections for canonical categories/occasions
 *    that have no row in the live mezmur_sections_import snapshot (2026-10-24).
 *    They are shown only when the database has no section for the same entity
 *    in that group, and only when they contain published Mezmurs. A matching
 *    INSERT is proposed in supabase/PROPOSED_HYMN_BROWSE_CANONICAL_SECTIONS.sql.
 *  - BROWSE_SHORTCUTS: browse-only values kept separate from the canonical
 *    theological taxonomy.
 *
 * Nothing here creates or renames database records.
 */
import { CATEGORY_ENTRIES, OCCASION_ENTRIES } from '../mezmur/taxonomyAliases'
import { MEZMUR_CLASSIFICATION_BROWSE_GROUPS } from './mezmurBrowseGroups'
import { canonicalizeCategory, canonicalizeOccasion } from './taxonomy'

/** Minimal section shape needed to resolve taxonomy slugs. */
export type BrowseSectionSource = {
  slug?: string
  collectionSlug?: string
  sourceEntityType?: string
  sourceEntitySlug?: string
}

// ---------------------------------------------------------------------------
// Equivalent link slugs
// ---------------------------------------------------------------------------

/**
 * Groups of slugs that name the same taxonomy entry. The first slug in each
 * group is the identifier that exists in the live database; the others were
 * produced by older importers (slugified labels) or legacy section sources.
 */
export const LINK_SLUG_EQUIVALENTS: readonly (readonly string[])[] = [
  ['new-year', 'new-year-enkutatash', 'enkutatash'],
  ['funeral', 'funeral-memorial', 'memorial'],
  ['general', 'general-anytime'],
  ['kidus-estifanos-saint-stephen', 'kidus-estifanos', 'saint-stephen'],
  ['yohannes-metmek-john-the-baptist', 'yohannes-metmek', 'john-the-baptist', 'saint-john-the-baptist'],
  ['kidus-giorgis', 'qedus-giorgis', 'saint-george'],
  ['kidus-uriel', 'qedus-urael', 'saint-uriel'],
  ['kidus-raphael', 'qedus-raphael', 'saint-raphael'],
  ['kidist-arsema', 'qedist-arsema', 'saint-arsema'],
  ['siklet', 'good-friday'],
  ['tinsae', 'easter', 'fasika'],
  ['gena', 'christmas'],
  ['timket', 'epiphany'],
  ['hosanna', 'palm-sunday'],
  ['abiy-tsom', 'lent', 'great-lent'],
  ['holy-week', 'himamat'],
  ['bisrate-gabriel', 'annunciation'],
]

const EQUIV_INDEX = new Map<string, readonly string[]>()
for (const group of LINK_SLUG_EQUIVALENTS) for (const slug of group) EQUIV_INDEX.set(slug, group)

/** Add every equivalent spelling of each slug (order preserved, no duplicates). */
export function expandLinkSlugs(slugs: Iterable<string>): string[] {
  const out = new Set<string>()
  for (const slug of slugs) {
    out.add(slug)
    for (const eq of EQUIV_INDEX.get(slug) || []) out.add(eq)
  }
  return [...out]
}

/** True when two link slugs name the same taxonomy entry. */
export function sameLinkSlug(a: string, b: string): boolean {
  return a === b || (EQUIV_INDEX.get(a)?.includes(b) ?? false)
}

/**
 * The link slug to write for a canonical label, matching the identifiers that
 * exist in the database (e.g. "New Year / Enkutatash" → "new-year",
 * "Funeral / Memorial" → "funeral"). Unknown labels return null.
 */
export function taxonomyLinkSlug(kind: 'category' | 'occasion', label: string | null | undefined): string | null {
  const canonical = kind === 'category' ? canonicalizeCategory(label) : canonicalizeOccasion(label)
  if (!canonical) return null
  const entries = kind === 'category' ? CATEGORY_ENTRIES : OCCASION_ENTRIES
  return entries.find((e) => e.canonical === canonical)?.slug || null
}

// ---------------------------------------------------------------------------
// Group → taxonomy map (moved from hymnBrowse.ts)
// ---------------------------------------------------------------------------

const LEGACY_COLLECTION_TAXONOMY_MAP: Record<
  string,
  {
    categories?: string[]
    occasions?: string[]
  }
> = {
  'holidays-feasts': {
    occasions: [
      'gena',
      'timket',
      'meskel',
      'hosanna',
      'siklet',
      'tinsae',
      'erget',
      'pentecost',
      'debre-tabor',
      'filseta',
      'kidane-mihret',
      'lideta-maryam',
      'new-year',
      'holy-week',
      'annunciation',
      'cross',
      'fasting',
      'abiy-tsom',
      'tsome-nineveh',
      'good-friday',
      'palm-sunday',
      'easter',
      'epiphany',
      'christmas',
    ],
    categories: ['cross', 'holidays-feasts'],
  },
  'angels-saints': {
    categories: [
      'angels-saints',
      'angels',
      'saints',
      'apostles',
      'martyrs',
      'prophets',
      'kidus-michael',
      'kidus-gabriel',
      'kidus-uriel',
      'kidus-raphael',
      'kidus-giorgis',
      'kidist-arsema',
      'abune-tekle-haymanot',
      'abune-gebre-menfes-kidus',
      'kidus-estifanos-saint-stephen',
      'kidus-yared',
      'yohannes-metmek-john-the-baptist',
      'saint-george',
      'saint-stephen',
      'saint-michael',
      'saint-gabriel',
      'saint-uriel',
      'saint-raphael',
      'saint-arsema',
      'holy-angels',
      'saints-general',
      'qedus-giorgis',
      'kirkos',
      'yared',
    ],
    // Annual feasts of saints and angels (canonical occasion with no other browse home)
    occasions: ['annual-saint-feast'],
  },
  'virgin-mary': {
    categories: ['virgin-mary', 'mariam'],
    occasions: ['filseta', 'kidane-mihret', 'lideta-maryam', 'mariam', 'virgin-mary', 'annunciation'],
  },
  'jesus-christ': {
    categories: ['jesus-christ', 'christ', 'salvation'],
    occasions: ['hosanna', 'siklet', 'tinsae', 'gena', 'timket', 'debre-tabor', 'good-friday', 'holy-week'],
  },
  'repentance-fasting': {
    categories: ['repentance-fasting', 'repentance'],
    occasions: ['abiy-tsom', 'tsome-nineveh', 'tsome-nebiyat', 'tsome-hawariat', 'fasting', 'holy-week'],
  },
  'sacraments-church-life': {
    categories: ['sacraments-church-life', 'sacraments', 'church-life'],
    occasions: ['wedding', 'communion', 'baptism', 'funeral'],
  },
  'praise-general': {
    categories: [
      'praise-general',
      'praise-worship',
      'general',
      'wereb',
      'holy-trinity',
      'holy-spirit',
      'prayer',
      'holy-cross',
    ],
    occasions: ['general'],
  },
  'english-mezmur': {
    categories: ['english-mezmur', 'english-language', 'bilingual-language'],
  },
}

/**
 * Canonical relationship-driven cards take precedence over legacy manual
 * collection mappings. Legacy entries remain available for existing URLs, but
 * the relationship-driven cards contain their declared primary taxonomy plus
 * any explicitly listed cross-dimension shortcuts (for example Marian feasts
 * under Virgin Mary). Occasions remain occasions; they are not duplicated as
 * theological categories.
 */
export const COLLECTION_TAXONOMY_MAP: Record<
  string,
  { categories?: string[]; occasions?: string[] }
> = {
  ...LEGACY_COLLECTION_TAXONOMY_MAP,
  ...Object.fromEntries(
    MEZMUR_CLASSIFICATION_BROWSE_GROUPS.map((group) => [
      group.slug,
      {
        categories: [
          ...(group.kind === 'category' ? group.taxonomySlugs : []),
          ...(group.shortcuts || []).filter((item) => item.kind === 'category').map((item) => item.slug),
        ],
        occasions: [
          ...(group.kind === 'occasion' ? group.taxonomySlugs : []),
          ...(group.shortcuts || []).filter((item) => item.kind === 'occasion').map((item) => item.slug),
        ],
      },
    ]),
  ),
}

// ---------------------------------------------------------------------------
// Section → candidate link slugs (moved from hymnBrowse.ts)
// ---------------------------------------------------------------------------

export function getCandidateTaxonomySlugs(
  sectionSlug: string,
  section?: BrowseSectionSource | null,
): { cats: string[]; occs: string[] } {
  const cats = new Set<string>()
  const occs = new Set<string>()

  if (section?.sourceEntityType === 'occasion' && section.sourceEntitySlug) {
    occs.add(section.sourceEntitySlug)
  }
  if (section?.sourceEntityType === 'category' && section.sourceEntitySlug) {
    cats.add(section.sourceEntitySlug)
  }
  // Manual sections name their entity in source_entity_slug (e.g. "holy-week", "general", "lent");
  // without this, sections like repentance-holy-week and general-mezmur show only hand-picked links.
  if (section?.sourceEntityType === 'manual' && section.sourceEntitySlug) {
    cats.add(section.sourceEntitySlug)
    occs.add(section.sourceEntitySlug)
  }
  if (sectionSlug) {
    occs.add(sectionSlug)
    cats.add(sectionSlug)
    const stripped = sectionSlug.replace(/^(holidays|virgin-mary|christ|saint|abune)-/, '')
    if (stripped !== sectionSlug) {
      occs.add(stripped)
      cats.add(stripped)
    }

    const aliasMap: Record<string, { cats?: string[]; occs?: string[] }> = {
      'saint-michael': { cats: ['kidus-michael', 'saint-michael', 'st-michael', 'michael'] },
      'kidus-michael': { cats: ['kidus-michael', 'saint-michael', 'st-michael', 'michael'] },
      'saint-gabriel': { cats: ['kidus-gabriel', 'saint-gabriel', 'st-gabriel', 'gabriel'] },
      'kidus-gabriel': { cats: ['kidus-gabriel', 'saint-gabriel', 'st-gabriel', 'gabriel'] },
      'saint-uriel': { cats: ['kidus-uriel', 'qedus-urael', 'saint-uriel', 'uriel'] },
      'kidus-uriel': { cats: ['kidus-uriel', 'qedus-urael', 'saint-uriel', 'uriel'] },
      'saint-raphael': { cats: ['kidus-raphael', 'qedus-raphael', 'saint-raphael', 'raphael'] },
      'kidus-raphael': { cats: ['kidus-raphael', 'qedus-raphael', 'saint-raphael', 'raphael'] },
      'saint-george': { cats: ['kidus-giorgis', 'qedus-giorgis', 'saint-george', 'george'] },
      'kidus-giorgis': { cats: ['kidus-giorgis', 'qedus-giorgis', 'saint-george', 'george'] },
      'saint-arsema': { cats: ['kidist-arsema', 'qedist-arsema', 'saint-arsema', 'arsema'] },
      'kidist-arsema': { cats: ['kidist-arsema', 'qedist-arsema', 'saint-arsema', 'arsema'] },
      'saint-stephen': { cats: ['kidus-estifanos-saint-stephen', 'saint-stephen', 'stephen'] },
      'saint-yared': { cats: ['kidus-yared', 'saint-yared', 'yared'] },
      'holy-angels': { cats: ['angels', 'holy-angels'] },
      'christ-hymns': { cats: ['jesus-christ', 'christ'] },
      'christ-gena': { occs: ['gena'] },
      'christ-timket': { occs: ['timket'] },
      'christ-hosanna': { occs: ['hosanna'] },
      'christ-tinsae': { occs: ['tinsae'] },
      'christ-debre-tabor': { occs: ['debre-tabor'] },
      'christ-passion-crucifixion': { occs: ['siklet', 'good-friday'] },
      'holidays-gena': { occs: ['gena'] },
      'holidays-timket': { occs: ['timket'] },
      'holidays-meskel': { occs: ['meskel', 'cross'], cats: ['cross'] },
      'holidays-hosanna': { occs: ['hosanna'] },
      'holidays-tinsae': { occs: ['tinsae', 'easter'] },
      'holidays-siklet': { occs: ['siklet', 'good-friday'] },
      'holidays-good-friday': { occs: ['siklet', 'good-friday'] },
      'holidays-filseta': { occs: ['filseta'] },
      'holidays-kidane-mihret': { occs: ['kidane-mihret'] },
      'holidays-lideta-maryam': { occs: ['lideta-maryam'] },
      'holidays-annunciation': { occs: ['annunciation'] },
      'holidays-pentecost': { occs: ['pentecost'] },
      'virgin-mary-hymns': { cats: ['virgin-mary', 'mariam'] },
      'virgin-mary-filseta': { occs: ['filseta'] },
      'virgin-mary-kidane-mihret': { occs: ['kidane-mihret'] },
      'virgin-mary-lideta': { occs: ['lideta-maryam'] },
      'virgin-mary-annunciation': { occs: ['annunciation'] },
      'general-fasting': { occs: ['abiy-tsom', 'tsome-nineveh', 'fasting'] },
      'repentance': { cats: ['repentance-fasting', 'repentance'], occs: ['repentance'] },
      'english-language': { cats: ['english-mezmur', 'english-language'] },
      'bilingual-language': { cats: ['english-mezmur', 'bilingual-language'] },
    }

    const match = aliasMap[sectionSlug] || aliasMap[stripped]
    if (match) {
      if (match.cats) for (const c of match.cats) cats.add(c)
      if (match.occs) for (const o of match.occs) occs.add(o)
    }
  }

  // Link rows written by older importers may use legacy spellings of the same slug.
  return { cats: expandLinkSlugs(cats), occs: expandLinkSlugs(occs) }
}


// ---------------------------------------------------------------------------
// Canonical fallback sections
// ---------------------------------------------------------------------------

export type CanonicalFallbackSection = {
  collectionSlug: string
  sectionSlug: string
  title: string
  titleAmharic: string
  entityType: 'category' | 'occasion'
  entitySlug: string
  sortOrder: number
}

/**
 * Canonical categories / occasions with no section in the live
 * mezmur_sections_import snapshot (2026-10-24). Existing group slugs only.
 */
export const CANONICAL_FALLBACK_SECTIONS: readonly CanonicalFallbackSection[] = [
  { collectionSlug: 'jesus-christ', sectionSlug: 'christ-salvation', title: 'Salvation', titleAmharic: 'ድኅነት', entityType: 'category', entitySlug: 'salvation', sortOrder: 90 },
  { collectionSlug: 'angels-saints', sectionSlug: 'saint-john-the-baptist', title: 'St. John the Baptist', titleAmharic: 'ቅዱስ ዮሐንስ መጥምቅ', entityType: 'category', entitySlug: 'yohannes-metmek-john-the-baptist', sortOrder: 85 },
  { collectionSlug: 'angels-saints', sectionSlug: 'prophets', title: 'Prophets', titleAmharic: 'ነቢያት', entityType: 'category', entitySlug: 'prophets', sortOrder: 75 },
  { collectionSlug: 'angels-saints', sectionSlug: 'annual-saint-feasts', title: 'Annual Saint Feasts', titleAmharic: 'የቅዱሳን ዓመታዊ በዓላት', entityType: 'occasion', entitySlug: 'annual-saint-feast', sortOrder: 95 },
  { collectionSlug: 'repentance-fasting', sectionSlug: 'tsome-nebiyat', title: 'Tsome Nebiyat / Fast of the Prophets', titleAmharic: 'ጾመ ነቢያት', entityType: 'occasion', entitySlug: 'tsome-nebiyat', sortOrder: 60 },
  { collectionSlug: 'repentance-fasting', sectionSlug: 'tsome-hawariat', title: 'Tsome Hawariat / Apostles Fast', titleAmharic: 'ጾመ ሐዋርያት', entityType: 'occasion', entitySlug: 'tsome-hawariat', sortOrder: 70 },
  { collectionSlug: 'holidays-feasts', sectionSlug: 'holidays-erget', title: 'Ascension / Erget', titleAmharic: 'ዕርገት', entityType: 'occasion', entitySlug: 'erget', sortOrder: 95 },
  { collectionSlug: 'sacraments-church-life', sectionSlug: 'baptism', title: 'Baptism', titleAmharic: 'ሥርዓተ ጥምቀት', entityType: 'occasion', entitySlug: 'baptism', sortOrder: 30 },
  { collectionSlug: 'sacraments-church-life', sectionSlug: 'funeral', title: 'Funeral / Memorial', titleAmharic: 'ፍትሐት / መታሰቢያ', entityType: 'occasion', entitySlug: 'funeral', sortOrder: 40 },
]

function entityCoveredBy(sections: readonly BrowseSectionSource[], fallback: CanonicalFallbackSection): boolean {
  return sections.some((s) => {
    if (s.slug === fallback.sectionSlug) return true
    const { cats, occs } = getCandidateTaxonomySlugs(s.slug || '', s)
    const pool = fallback.entityType === 'category' ? cats : occs
    return pool.some((slug) => sameLinkSlug(slug, fallback.entitySlug))
  })
}

/**
 * Fallback sections to add to a group: only those whose entity is not already
 * represented by a live section in the same group.
 */
export function fallbackSectionsForCollection(
  collectionSlug: string,
  liveSections: readonly BrowseSectionSource[],
): CanonicalFallbackSection[] {
  return CANONICAL_FALLBACK_SECTIONS.filter(
    (f) => f.collectionSlug === collectionSlug && !entityCoveredBy(liveSections, f),
  )
}

export function findFallbackSection(collectionSlug: string, sectionSlug: string): CanonicalFallbackSection | null {
  return CANONICAL_FALLBACK_SECTIONS.find((f) => f.collectionSlug === collectionSlug && f.sectionSlug === sectionSlug) || null
}

/** Row in the shape of public.mezmur_sections_import, for reuse by the section mapper. */
export function fallbackSectionRow(f: CanonicalFallbackSection): Record<string, unknown> {
  return {
    section_id: `canonical:${f.collectionSlug}:${f.sectionSlug}`,
    section_slug: f.sectionSlug,
    collection_slug: f.collectionSlug,
    parent_section_slug: null,
    title: f.title,
    title_amharic: f.titleAmharic,
    description: '',
    description_amharic: '',
    image_path: null,
    image_alt: f.title,
    section_type: f.entityType,
    source_entity_type: f.entityType,
    source_entity_slug: f.entitySlug,
    sort_order: f.sortOrder,
    is_featured: 'false',
    status: 'published',
  }
}

// ---------------------------------------------------------------------------
// Browse-only shortcuts (kept separate from the canonical taxonomy)
// ---------------------------------------------------------------------------

export type BrowseShortcutKind = 'canonical_occasion' | 'existing_category' | 'browse_only' | 'form_or_audience'

export type BrowseShortcut = {
  slug: string
  kind: BrowseShortcutKind
  /** Canonical entries the shortcut gathers, when it has any. */
  mapsTo: { kind: 'category' | 'occasion'; canonical: string }[]
  note: string
}

/**
 * Non-canonical values found in public.mezmur_occasions / browse sections.
 * They stay as shortcuts; none of them is (or becomes) a canonical taxonomy record.
 */
export const BROWSE_SHORTCUTS: readonly BrowseShortcut[] = [
  { slug: 'repentance', kind: 'existing_category', mapsTo: [{ kind: 'category', canonical: 'Repentance' }], note: 'Duplicates the Repentance category as an occasion row; browse through the category.' },
  { slug: 'praise', kind: 'existing_category', mapsTo: [{ kind: 'category', canonical: 'Praise / Worship' }], note: 'Duplicates the Praise / Worship category as an occasion row; browse through the category.' },
  { slug: 'bisrate-gabriel', kind: 'browse_only', mapsTo: [{ kind: 'category', canonical: 'Kidus Gabriel' }, { kind: 'category', canonical: 'Virgin Mary' }], note: 'Annunciation feast (Megabit 29). Live sections use source slug "annunciation". Proposed as a canonical occasion — not applied.' },
  { slug: 'general-fasting', kind: 'browse_only', mapsTo: [{ kind: 'occasion', canonical: 'Abiy Tsom' }, { kind: 'occasion', canonical: 'Tsome Nineveh' }, { kind: 'occasion', canonical: 'Tsome Nebiyat' }, { kind: 'occasion', canonical: 'Tsome Hawariat' }], note: 'Umbrella for the fasting seasons (live source slug "lent").' },
  { slug: 'wednesday-friday', kind: 'browse_only', mapsTo: [], note: 'Weekly fast (Tsome Gehad / Wednesday & Friday); not one of the 24 canonical occasions.' },
  { slug: 'marian-feasts', kind: 'browse_only', mapsTo: [{ kind: 'occasion', canonical: 'Filseta' }, { kind: 'occasion', canonical: 'Kidane Mihret' }, { kind: 'occasion', canonical: 'Lideta Maryam' }], note: 'Umbrella for Marian feasts.' },
  { slug: 'church-worship', kind: 'browse_only', mapsTo: [{ kind: 'occasion', canonical: 'Communion' }], note: 'Liturgy / parish worship umbrella.' },
  { slug: 'short-hymns', kind: 'form_or_audience', mapsTo: [], note: 'Length filter, not a theological subject.' },
  { slug: 'sunday-school', kind: 'form_or_audience', mapsTo: [], note: 'Audience filter (Sunday school).' },
  { slug: 'children-youth', kind: 'form_or_audience', mapsTo: [], note: 'Audience filter (live section "youth").' },
  { slug: 'holiday-wereb', kind: 'form_or_audience', mapsTo: [], note: 'Form filter (form = wereb) across feasts.' },
]
