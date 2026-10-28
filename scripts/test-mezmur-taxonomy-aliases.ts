/**
 * Regression tests for the multilingual Mezmur taxonomy alias dictionary,
 * alias-aware search resolution and the lyrics-only classifier.
 *
 * Run: npm run test:mezmur-aliases
 */
import assert from 'node:assert/strict'
import {
  CANONICAL_CATEGORIES,
  CANONICAL_OCCASIONS,
  canonicalizeCategory,
  canonicalizeOccasion,
  resolveTaxonomyQuery,
} from '../src/lib/publicContent/taxonomy'
import { CATEGORY_ENTRIES, OCCASION_ENTRIES, TAXONOMY_ALIASES } from '../src/lib/mezmur/taxonomyAliases'
import { normalizeEthiopicForMatch, textContainsVariant, searchVariantsFor } from '../src/lib/mezmur/aliasMatcher'
import { classifyMezmurLyrics, type LyricsClassificationResult } from '../src/lib/mezmur/lyricsTaxonomyClassifier'
import fs from 'node:fs'
import path from 'node:path'
import {
  BROWSE_SHORTCUTS,
  CANONICAL_FALLBACK_SECTIONS,
  COLLECTION_TAXONOMY_MAP,
  expandLinkSlugs,
  fallbackSectionsForCollection,
  getCandidateTaxonomySlugs,
  sameLinkSlug,
  taxonomyLinkSlug,
  type BrowseSectionSource,
} from '../src/lib/publicContent/browseTaxonomy'

let passed = 0
const failures: string[] = []
function test(name: string, fn: () => void) {
  try {
    fn()
    passed++
    console.log(`✓ ${name}`)
  } catch (e) {
    failures.push(name)
    console.log(`✗ ${name}\n    ${(e as Error).message.split('\n')[0]}`)
  }
}
const cats = (r: LyricsClassificationResult) => [r.primaryCategory, ...r.additionalCategories].filter(Boolean) as string[]
const occs = (r: LyricsClassificationResult) => [r.primaryOccasion, ...r.additionalOccasions]

// ---------------------------------------------------------------------------
console.log('\n# Dictionary integrity')
test('every canonical category and occasion has an entry', () => {
  assert.deepEqual(CATEGORY_ENTRIES.map((e) => e.canonical), [...CANONICAL_CATEGORIES])
  assert.deepEqual(OCCASION_ENTRIES.map((e) => e.canonical), [...CANONICAL_OCCASIONS])
})
test('every alias points to an existing canonical label', () => {
  for (const a of TAXONOMY_ALIASES) {
    const list = a.kind === 'category' ? (CANONICAL_CATEGORIES as readonly string[]) : (CANONICAL_OCCASIONS as readonly string[])
    assert.ok(list.includes(a.canonical), `${a.alias} → ${a.canonical}`)
    assert.ok(a.strength >= 1 && a.strength <= 5, `strength ${a.alias}`)
  }
})
test('slugs are unique per kind', () => {
  for (const list of [CATEGORY_ENTRIES, OCCASION_ENTRIES]) {
    assert.equal(new Set(list.map((e) => e.slug)).size, list.length)
  }
})
test('regex aliases compile', () => {
  for (const a of TAXONOMY_ALIASES) if (a.pattern) new RegExp(a.pattern, 'u')
})
test('regex aliases are written in normalized letters (they run on normalized text)', () => {
  for (const a of TAXONOMY_ALIASES) {
    if (!a.pattern) continue
    for (const ch of a.pattern.replace(/\\u[0-9A-Fa-f]{4}/g, '')) {
      if (/[\u1200-\u137F]/.test(ch)) assert.equal(normalizeEthiopicForMatch(ch), ch, `${a.label || a.alias}: use "${normalizeEthiopicForMatch(ch)}" instead of "${ch}"`)
    }
  }
})

// ---------------------------------------------------------------------------
console.log('\n# Search / filter alias resolution')
const resolves = (q: string, kind: 'category' | 'occasion', canonical: string) =>
  test(`"${q}" → ${canonical}`, () => {
    assert.ok(
      resolveTaxonomyQuery(q).some((m) => m.kind === kind && m.canonical === canonical),
      JSON.stringify(resolveTaxonomyQuery(q)),
    )
  })
for (const q of ['Kidus Michael', 'Kidus Mikael', 'Saint Michael', 'St. Michael', 'Archangel Michael', 'Archangel Mikael', 'Mikael', 'Michael', 'ቅዱስ ሚካኤል', 'ሚካኤል', 'ሊቀ መላእክት ሚካኤል', 'መልአኩ ሚካኤል']) resolves(q, 'category', 'Kidus Michael')
for (const q of ['Saint Gabriel', 'Gebriel', 'ገብርኤል', 'ቅዱስ ገብርኤል']) resolves(q, 'category', 'Kidus Gabriel')
for (const q of ['Saint Mary', 'St Mary', 'Maryam', 'እመቤታችን', 'ድንግል ማርያም', 'Theotokos']) resolves(q, 'category', 'Virgin Mary')
for (const q of ['Jesus', 'Emmanuel', 'Medhane Alem', 'መድኃኔዓለም', 'መድሃኔዓለም', 'ኢየሱስ ክርስቶስ']) resolves(q, 'category', 'Jesus Christ')
for (const q of ['Gena', 'Nativity', 'Christmas', 'ገና', 'Genna']) resolves(q, 'occasion', 'Gena')
for (const q of ['Timket', 'Timkat', 'Epiphany', 'ጥምቀት']) resolves(q, 'occasion', 'Timket')
for (const q of ['Tinsae', 'Easter', 'Fasika', 'ትንሣኤ', 'ትንሳኤ']) resolves(q, 'occasion', 'Tinsae')
resolves('Saint George', 'category', 'Kidus Giorgis')
resolves('ጊዮርጊስ', 'category', 'Kidus Giorgis')
resolves('John the Baptist', 'category', 'Yohannes Metmek / John the Baptist')
resolves('ዮሐንስ መጥምቅ', 'category', 'Yohannes Metmek / John the Baptist')
resolves('Abune Gebre Menfes Kidus', 'category', 'Abune Gebre Menfes Kidus')
resolves('Meskel', 'occasion', 'Meskel')
resolves('መስቀል', 'category', 'Cross')
test('canonicalizeCategory accepts Amharic and transliterated names', () => {
  assert.equal(canonicalizeCategory('ቅዱስ ሚካኤል'), 'Kidus Michael')
  assert.equal(canonicalizeCategory('Mikael'), 'Kidus Michael')
  assert.equal(canonicalizeCategory('እመቤታችን'), 'Virgin Mary')
  assert.equal(canonicalizeCategory('Kidus Michael'), 'Kidus Michael')
  assert.equal(canonicalizeCategory('Some random text'), null)
})
test('canonicalizeOccasion accepts Amharic and English feast names', () => {
  assert.equal(canonicalizeOccasion('ገና'), 'Gena')
  assert.equal(canonicalizeOccasion('Nativity'), 'Gena')
  assert.equal(canonicalizeOccasion('ፍልሰታ'), 'Filseta')
  assert.equal(canonicalizeOccasion('Palm Sunday'), 'Hosanna')
})
test('title search variants find Amharic and Latin titles', () => {
  const v = searchVariantsFor('category', 'Kidus Michael')
  assert.ok(textContainsVariant('ሊቀ መላእክት ቅዱስ ሚካኤል', v))
  assert.ok(textContainsVariant('Kidus Mikael Melake Selam', v))
  assert.ok(!textContainsVariant('Kidane Mihret', v))
})
test('alias matching is not a raw substring match', () => {
  const v = searchVariantsFor('occasion', 'Debre Tabor')
  assert.ok(!textContainsVariant('ታቦት', v), 'ታቦት (tabot) must not match ታቦር')
  const y = searchVariantsFor('category', 'Kidus Yared')
  assert.ok(!textContainsVariant('ያሬዳዊ ዜማ', y), 'ያሬዳዊ (Yaredic) must not match ያሬድ')
})

// ---------------------------------------------------------------------------
console.log('\n# Lyrics classification')

interface Gold {
  name: string
  lyrics: Partial<Record<'lyrics_amharic' | 'lyrics_english' | 'lyrics_geez', string>>
  primary?: string | null
  categories: string[]
  notCategories?: string[]
  occasions: string[]
  notOccasions?: string[]
  review?: boolean
  reviewReason?: string
}

const GOLD: Gold[] = [
  {
    name: 'Saint Michael hymn (ቅዱስ ሚካኤል / ሊቀ መላእክት ሚካኤል)',
    lyrics: { lyrics_amharic: 'ሊቀ መላእክት ቅዱስ ሚካኤል\nሚካኤል መልአከ ሰላም ፈጥነህ ተራዳን\nበክንፍህ ጥላ ጋርደን ሚካኤል\nመልአኩ ሚካኤል ከጠላት አድነን' },
    primary: 'Kidus Michael', categories: ['Kidus Michael'], notCategories: ['Angels'], occasions: ['General / Anytime'],
  },
  {
    name: 'Mary hymn with one passing mention of Michael',
    lyrics: { lyrics_amharic: 'እመቤቴ ማርያም እለምንሻለሁ\nድንግል ማርያም ስሚኝ ተማጽኛለሁ\nወላዲተ አምላክ እናታችን\nሚካኤል ሲያበስርሽ ሳይሆን ገብርኤል\nማርያም አማልጂኝ ከልጅሽ' },
    primary: 'Virgin Mary', categories: ['Virgin Mary'], notCategories: ['Kidus Michael'], occasions: ['General / Anytime'],
  },
  {
    name: 'Gabriel and the Annunciation',
    lyrics: { lyrics_amharic: 'ገብርኤል ገብርኤል ዜናዊ ሐዲስ\nየአምላክን መወለድ ሥጋ በመልበስ\nገብርኤል ሲያበስራት ድንግል ደነገጠች\nቅዱስ ገብርኤል መልአከ ብሥራት' },
    primary: 'Kidus Gabriel', categories: ['Kidus Gabriel'], occasions: ['General / Anytime'],
  },
  {
    name: 'Saint Mary / እመቤታችን',
    lyrics: { lyrics_amharic: 'እመቤታችን ቅድስት ድንግል\nእመ ብርሃን ማርያም ምርኩዛችን\nየአምላክ እናት ሆይ ደግፊኝ\nእመቤታችን አደራሽን' },
    primary: 'Virgin Mary', categories: ['Virgin Mary'], occasions: ['General / Anytime'],
  },
  {
    name: 'Jesus Christ / Emmanuel / መድኃኔዓለም',
    lyrics: { lyrics_amharic: 'መድኃኔዓለም አማኑኤል\nብሉ ብለህ ሥጋህንና ደምህን ሰጠኸን መድኃኔዓለም\nአማኑኤል ሕይወት ሆኖ አዳነን\nኢየሱስ ክርስቶስ ቤዛ ዓለም' },
    primary: 'Jesus Christ', categories: ['Jesus Christ'], occasions: ['Communion'],
  },
  {
    name: 'English Jesus hymn (Emmanuel)',
    lyrics: { lyrics_english: 'Emmanuel, God with us\nJesus Christ our Saviour\nThe Lamb of God who takes away\nGlory to the Son of God' },
    primary: 'Jesus Christ', categories: ['Jesus Christ'], occasions: ['General / Anytime'],
  },
  {
    name: 'Gena / Nativity (ቤተልሔም, ግርግም)',
    lyrics: { lyrics_amharic: 'ቤተልሔም ላይ ኮከብ ታየ\nክርስቶስ ተወለደ በግርግም ተኛ\nእረኞች ሰምተው መጡ\nሰብአ ሰገል ወርቅ እጣን ከርቤ አመጡ' },
    categories: ['Jesus Christ'], occasions: ['Gena'],
  },
  {
    name: 'Timket — baptism of Christ in the Jordan (not sacramental Baptism)',
    lyrics: { lyrics_amharic: 'ኢየሱስ ክርስቶስ በዮርዳኖስ ተጠመቀ\nዮሐንስ አጠመቀው በዮርዳኖስ ወንዝ\nየጥምቀት በዓል ደስ ይበለን\nሰማይ ተከፈተ መንፈስ ቅዱስ ወረደ' },
    categories: ['Jesus Christ'], notCategories: ['Holy Spirit'], occasions: ['Timket'], notOccasions: ['Baptism'],
  },
  {
    name: 'Sacramental Baptism / christening (not Timket)',
    lyrics: { lyrics_amharic: 'ዛሬ ክርስትና ተነሣ ሕፃኑ\nየልጅነት ጥምቀት ተቀበለ\nየክርስትና አባት ቆመው\nከውኃና ከመንፈስ ዳግም ተወለድን' },
    categories: [], occasions: ['Baptism'], notOccasions: ['Timket'],
  },
  {
    name: 'ጥምቀት mentioned with no context → neither, flagged',
    lyrics: { lyrics_amharic: 'ጥምቀት ደረሰ ልባችን ደስ አለው\nእናምራለን በአንድነት ሆነን\nደስ ይበለን ሁላችን\nእልል በሉ ወገኖች' },
    categories: [], occasions: ['General / Anytime'], notOccasions: ['Timket', 'Baptism'], review: true, reviewReason: 'baptism_ambiguous',
  },
  {
    name: 'Cross hymn without Meskel feast evidence → Cross, not Meskel',
    lyrics: { lyrics_amharic: 'መስቀል ኃይላችን ነው መስቀል ብርታታችን\nበመስቀሉ አዳነን ጌታችን\nመስቀል ቤዛችን ነው ለምናምነው\nየመስቀሉ ፍቅር ይግዛን' },
    primary: 'Cross', categories: ['Cross', 'Salvation'], occasions: ['General / Anytime'], notOccasions: ['Meskel'],
  },
  {
    name: 'Meskel feast (ንግሥት እሌኒ, ደመራ)',
    lyrics: { lyrics_amharic: 'ንግሥት እሌኒ መስቀሉን ፈለገች\nደመራ አብርታ ጢሱን ተከተለች\nአልቀረም ተቀብሮ ተገኘ መስቀሉ\nመስቀል አበባ ነህ ውብ አበባ' },
    primary: 'Cross', categories: ['Cross'], occasions: ['Meskel'],
  },
  {
    name: 'Tinsae / Resurrection (ክርስቶስ ተንሥአ)',
    lyrics: { lyrics_amharic: 'ክርስቶስ ተንሥአ እሙታን\nበዐቢይ ኃይል ወሥልጣን\nጌታ ተነሥቷል እልል በሉ\nመቃብሩ ባዶ ነው የምስራች' },
    categories: ['Jesus Christ'], occasions: ['Tinsae'],
  },
  {
    name: 'English resurrection hymn',
    lyrics: { lyrics_english: 'The Lord has risen let us all sing\nChrist is risen from the dead\nJesus Christ has conquered death\nThe empty tomb proclaims His glory' },
    categories: ['Jesus Christ'], occasions: ['Tinsae'],
  },
  {
    name: 'General resurrection of the dead (no Christ) → not Tinsae',
    lyrics: { lyrics_amharic: 'ሞቼ ስለማልቀር ትንሣኤ ስላለኝ\nወዳጅ ዘመዶቼ አታልቅሱ በቃኝ\nይልቅ ጸልዩልኝ ለነፍሴ እረፍት\nዓለም አታላይ ናት ዘላቂ አይደለች' },
    categories: [], occasions: ['Funeral / Memorial'], notOccasions: ['Tinsae'],
  },
  {
    name: 'ትንሣኤሽ (the Virgin) → Filseta, not Tinsae',
    lyrics: { lyrics_amharic: 'ድንግል ትንሣኤሽን እስከምናይ ድረስ\nአሟሟትሽ ድንግል ፍልሰታ ለማርያም\nሥጋሽ በምድር ላይ የታለ ድንግል\nማርያም ዐረገች ወደ ሰማይ' },
    primary: 'Virgin Mary', categories: ['Virgin Mary'], occasions: ['Filseta'], notOccasions: ['Tinsae'],
  },
  {
    name: 'Short, ambiguous hymn → review',
    lyrics: { lyrics_amharic: 'ወርዶ ከለላቸው ደመና ጸዓዳ' },
    categories: [], occasions: ['General / Anytime'], review: true,
  },
  {
    name: 'Multiple saints (Michael and Gabriel) → both categories',
    lyrics: { lyrics_amharic: 'ሚካኤል ገብርኤል ሊቃነ መላእክት\nሚካኤል ቆሞልናል ገብርኤል ቆሞልናል\nቅዱስ ሚካኤል ቅዱስ ገብርኤል\nሚካኤል ገብርኤል ጠብቁን' },
    categories: ['Kidus Michael', 'Kidus Gabriel'], occasions: ['General / Anytime'],
  },
  {
    name: "Ge'ez verse (ሰአሊ ለነ … ወላዲተ አምላክ)",
    lyrics: { lyrics_amharic: 'ሰአሊ ለነ ቅድስት ማርያም\nወላዲተ አምላክ ንጽሕት\nሰአሊ ለነ ኀበ ክርስቶስ ወልድኪ\nማርያም ድንግል ወላዲተ ቃል' },
    primary: 'Virgin Mary', categories: ['Virgin Mary'], occasions: ['General / Anytime'],
  },
  {
    name: 'Mixed Amharic / Latin transliteration',
    lyrics: { lyrics_english: 'Kidus Mikael melake selam\nMikael tebaqi yesemay\nArchangel Michael pray for us\nSaint Michael guard our souls' },
    primary: 'Kidus Michael', categories: ['Kidus Michael'], occasions: ['General / Anytime'],
  },
  {
    name: 'ገብረ መንፈስ ቅዱስ → saint, not Holy Spirit',
    lyrics: { lyrics_amharic: 'አቡነ ገብረ መንፈስ ቅዱስ\nአቦዬ ጸሎትህ ይጠብቀን\nገብረ መንፈስ ቅዱስ በዝቋላ\nአቦዬ በረከትህ ትደርብን' },
    primary: 'Abune Gebre Menfes Kidus', categories: ['Abune Gebre Menfes Kidus'], notCategories: ['Holy Spirit'], occasions: ['General / Anytime'],
  },
  {
    name: 'Trinitarian formula → Holy Trinity, not Holy Spirit',
    lyrics: { lyrics_amharic: 'አብ ወወልድ ወመንፈስ ቅዱስ\nአመሰግናለሁ በየዘመኑ\nሦስትነታቸውን በስም በአካል\nቅድስት ሥላሴ ይመስገኑ' },
    primary: 'Holy Trinity', categories: ['Holy Trinity', 'Praise / Worship'], notCategories: ['Holy Spirit'], occasions: ['General / Anytime'],
  },
  {
    name: '"ያሬዳዊ ዜማ" (Yaredic chant) does not make Kidus Yared',
    lyrics: { lyrics_amharic: 'እንደ አባቶቻችን እናቅርብ ምስጋና\nበሰዓታት በማኅሌት ያሬዳዊ ዜማ\nእንዘምር ሁላችን ድምጻችን ይሰማ\nምስጋና ለአምላካችን ይሁን' },
    primary: 'Praise / Worship', categories: ['Praise / Worship'], notCategories: ['Kidus Yared'], occasions: ['General / Anytime'],
  },
  {
    name: '"ከፍ አረገን" (lifted us up) is not Erget',
    lyrics: { lyrics_amharic: 'ድንግል ማርያም በትሕትና\nልጇ ከፍ አረገን ወሰደን ወደ ክብር\nማርያም ድንግል እናታችን\nድንግል ሆይ ስለ አንቺ እንዘምራለን' },
    primary: 'Virgin Mary', categories: ['Virgin Mary'], occasions: ['General / Anytime'], notOccasions: ['Erget'],
  },
  {
    name: '"ገና" meaning "yet / still" is not Gena',
    lyrics: { lyrics_amharic: 'ገና ብዙ ይቀረናል ጌታ ሆይ\nገና ነው ጉዞአችን በዚህ ዓለም\nአምላኬ አትተወኝ ጠብቀኝ\nእግዚአብሔር ጉልበቴ ነህ' },
    categories: ['Prayer'], occasions: ['General / Anytime'], notOccasions: ['Gena'],
  },
  {
    name: 'Wedding hymn',
    lyrics: { lyrics_amharic: 'በፊትህ ጋብቻን ይኸው ፈጽመዋል\nሙሽራውና ሙሽራይቱ ባርካቸው\nበተክሊል ተዋሕደዋል\nቃና ዘገሊላ እንደባረክህ' },
    categories: [], occasions: ['Wedding'],
  },
  {
    name: 'Several occasions allowed (Hosanna + Siklet)',
    lyrics: { lyrics_amharic: 'ሆሳዕና በአርያም እያሉ ዘመሩ\nበዘንባባ ተቀበሉት ኢየሱስን\nበዓርብ ግን ስቀለው ብለው ጮኹ\nየእሾህ አክሊል ደፍተው ተሰቀለ በጎልጎታ' },
    categories: ['Jesus Christ'], occasions: ['Hosanna', 'Siklet'],
  },
  {
    name: 'Repentance theme',
    lyrics: { lyrics_amharic: 'አቤቱ ማረኝ ይቅር በለኝ\nበደሌን አትቁጠርብኝ\nንስሐ ገብቼ ልመለስ\nኃጢአቴን አስወግድልኝ' },
    primary: 'Repentance', categories: ['Repentance'], occasions: ['General / Anytime'],
  },
  {
    name: 'Kidane Mihret repeated → Kidane Mihret occasion + Virgin Mary',
    lyrics: { lyrics_amharic: 'ኪዳነ ምሕረት እናቴ\nኪዳነ ምሕረት አንቺ ነሽ ተስፋዬ\nድንግል ማርያም ኪዳነ ምሕረት\nእመቤቴ አትለይኝ' },
    primary: 'Virgin Mary', categories: ['Virgin Mary'], occasions: ['Kidane Mihret'],
  },
  {
    name: '"አቡነ ዘበሰማያት" (Lord’s Prayer) is not a Saints hymn',
    lyrics: { lyrics_amharic: 'አቡነ ዘበሰማያት ይትቀደስ ስምከ\nትምጻእ መንግሥትከ\nጸሎት ናቀርባለን ስማን\nአቤቱ ጸሎታችንን ስማ' },
    primary: 'Prayer', categories: ['Prayer'], notCategories: ['Saints'], occasions: ['General / Anytime'],
  },
  {
    name: 'Debre Tabor (ታቦር, ሙሴና ኤልያስ) — not Prophets as subject',
    lyrics: { lyrics_amharic: 'በደብረ ታቦር ብርሃኑን ገለጠ\nሙሴና ኤልያስ ከጌታ ጋር ቆሙ\nኢየሱስ ክርስቶስ ተለወጠ\nቡሄ በሉ ልጆች' },
    categories: ['Jesus Christ'], occasions: ['Debre Tabor'],
  },
]


// ---------------------------------------------------------------------------
console.log('\n# Browse groups (live mezmur_sections_import snapshot + canonical fallbacks)')

type LiveSection = BrowseSectionSource & { title: string; status: string }
const snapshotPath = path.join(process.cwd(), 'mezmur-research/data/existing_tewahedodaily_snapshot.json')
const snapshot = JSON.parse(fs.readFileSync(snapshotPath, 'utf8')) as { mezmur_sections_import: Record<string, unknown>[] }
const LIVE: LiveSection[] = snapshot.mezmur_sections_import
  .filter((r) => String(r.status || '').toLowerCase() === 'published')
  .map((r) => ({
    slug: String(r.section_slug),
    collectionSlug: String(r.collection_slug),
    sourceEntityType: String(r.source_entity_type || ''),
    sourceEntitySlug: String(r.source_entity_slug || ''),
    title: String(r.title || ''),
    status: String(r.status),
  }))
const GROUPS = [...new Set(LIVE.map((s) => s.collectionSlug))]

/** Sections a visitor sees in each group: live rows + fallbacks the live rows don't already cover. */
function visibleSections(): LiveSection[] {
  const out: LiveSection[] = [...LIVE]
  for (const g of new Set([...GROUPS, ...CANONICAL_FALLBACK_SECTIONS.map((f) => f.collectionSlug)])) {
    for (const f of fallbackSectionsForCollection(g, LIVE.filter((s) => s.collectionSlug === g))) {
      out.push({ slug: f.sectionSlug, collectionSlug: f.collectionSlug, sourceEntityType: f.entityType, sourceEntitySlug: f.entitySlug, title: f.title, status: 'published' })
    }
  }
  return out
}
const VISIBLE = visibleSections()
const sectionsFor = (kind: 'category' | 'occasion', slug: string) =>
  VISIBLE.filter((s) => {
    const { cats, occs } = getCandidateTaxonomySlugs(s.slug || '', s)
    return (kind === 'category' ? cats : occs).some((x) => sameLinkSlug(x, slug))
  })

test(`live snapshot loaded (${LIVE.length} published sections in ${GROUPS.length} groups)`, () => {
  assert.ok(LIVE.length >= 50, `only ${LIVE.length} sections`)
})
for (const e of CATEGORY_ENTRIES) {
  test(`category discoverable: ${e.canonical}`, () => {
    const found = sectionsFor('category', e.slug)
    assert.ok(found.length > 0, 'no browse section resolves to this category')
    for (const g of e.browseSections) assert.ok(found.some((s) => s.collectionSlug === g), `dictionary says ${g}, but no section there`)
  })
}
for (const e of OCCASION_ENTRIES) {
  test(`occasion available: ${e.canonical}`, () => {
    const found = sectionsFor('occasion', e.slug)
    assert.ok(found.length > 0, 'no browse section resolves to this occasion')
    for (const g of e.browseSections) assert.ok(found.some((s) => s.collectionSlug === g), `dictionary says ${g}, but no section there`)
  })
}
test('requested placements: Holy Spirit/Prayer → praise-general, Salvation → jesus-christ, Yared/Gebre Menfes Kidus/John the Baptist → angels-saints', () => {
  const where = (slug: string) => sectionsFor('category', slug).map((s) => s.collectionSlug)
  assert.ok(where('holy-spirit').includes('praise-general'))
  assert.ok(where('prayer').includes('praise-general'))
  assert.ok(where('salvation').includes('jesus-christ'))
  for (const s of ['kidus-yared', 'abune-gebre-menfes-kidus', 'yohannes-metmek-john-the-baptist']) assert.ok(where(s).includes('angels-saints'), s)
})
test('requested placements: Tsome Nebiyat/Hawariat → repentance-fasting, Annual Saint Feast → angels-saints', () => {
  const where = (slug: string) => sectionsFor('occasion', slug).map((s) => s.collectionSlug)
  assert.ok(where('tsome-nebiyat').includes('repentance-fasting'))
  assert.ok(where('tsome-hawariat').includes('repentance-fasting'))
  assert.ok(where('annual-saint-feast').includes('angels-saints'))
})
test('group counts include the requested entries (COLLECTION_TAXONOMY_MAP)', () => {
  const has = (g: string, k: 'categories' | 'occasions', slug: string) => expandLinkSlugs(COLLECTION_TAXONOMY_MAP[g]?.[k] || []).includes(slug)
  assert.ok(has('jesus-christ', 'categories', 'salvation'))
  assert.ok(has('angels-saints', 'categories', 'yohannes-metmek-john-the-baptist'))
  assert.ok(has('angels-saints', 'occasions', 'annual-saint-feast'))
  assert.ok(has('repentance-fasting', 'occasions', 'tsome-nebiyat'))
  assert.ok(has('repentance-fasting', 'occasions', 'tsome-hawariat'))
  assert.ok(has('sacraments-church-life', 'occasions', 'funeral-memorial'), 'legacy funeral slug counts')
  assert.ok(has('holidays-feasts', 'occasions', 'new-year-enkutatash'), 'legacy new-year slug counts')
})

console.log('\n# Existing URLs and identifiers preserved')
const ORIGINAL_MAP = {"holidays-feasts":{"occasions":["gena","timket","meskel","hosanna","siklet","tinsae","erget","pentecost","debre-tabor","filseta","kidane-mihret","lideta-maryam","new-year","holy-week","annunciation","cross","fasting","abiy-tsom","tsome-nineveh","good-friday","palm-sunday","easter","epiphany","christmas"],"categories":["cross","holidays-feasts"]},"angels-saints":{"categories":["angels-saints","angels","saints","apostles","martyrs","prophets","kidus-michael","kidus-gabriel","kidus-uriel","kidus-raphael","kidus-giorgis","kidist-arsema","abune-tekle-haymanot","abune-gebre-menfes-kidus","kidus-estifanos-saint-stephen","kidus-yared","saint-george","saint-stephen","saint-michael","saint-gabriel","saint-uriel","saint-raphael","saint-arsema","holy-angels","saints-general","qedus-giorgis","kirkos","yared"]},"virgin-mary":{"categories":["virgin-mary","mariam"],"occasions":["filseta","kidane-mihret","lideta-maryam","mariam","virgin-mary","annunciation"]},"jesus-christ":{"categories":["jesus-christ","christ"],"occasions":["hosanna","siklet","tinsae","gena","timket","debre-tabor","good-friday","holy-week"]},"repentance-fasting":{"categories":["repentance-fasting","repentance"],"occasions":["abiy-tsom","tsome-nineveh","fasting","holy-week"]},"sacraments-church-life":{"categories":["sacraments-church-life","sacraments","church-life"],"occasions":["wedding","communion","baptism","funeral"]},"praise-general":{"categories":["praise-general","praise-worship","general","wereb","holy-trinity","holy-spirit","prayer","holy-cross"],"occasions":["general"]},"english-mezmur":{"categories":["english-mezmur","english-language","bilingual-language"]}} as Record<string, { categories?: string[]; occasions?: string[] }>
test('group map is a superset of the original (no slug removed, no group renamed)', () => {
  for (const [g, tax] of Object.entries(ORIGINAL_MAP)) {
    assert.ok(COLLECTION_TAXONOMY_MAP[g], `group ${g} missing`)
    for (const k of ['categories', 'occasions'] as const) for (const slug of tax[k] || []) assert.ok(COLLECTION_TAXONOMY_MAP[g][k]?.includes(slug), `${g}.${k} lost ${slug}`)
  }
})
test('every live section still resolves its own source slug (URLs /hymns/browse/<group>/<section> unchanged)', () => {
  for (const s of LIVE) {
    const { cats, occs } = getCandidateTaxonomySlugs(s.slug || '', s)
    if (s.sourceEntityType === 'category') assert.ok(cats.includes(s.sourceEntitySlug!), s.slug)
    if (s.sourceEntityType === 'occasion') assert.ok(occs.includes(s.sourceEntitySlug!), s.slug)
    assert.ok(cats.includes(s.slug!) && occs.includes(s.slug!), `section slug ${s.slug} no longer a candidate`)
  }
})
test('fallback sections never reuse a live section slug and only use existing groups', () => {
  for (const f of CANONICAL_FALLBACK_SECTIONS) {
    assert.ok(GROUPS.includes(f.collectionSlug), `${f.collectionSlug} is not an existing group`)
    assert.ok(!LIVE.some((s) => s.collectionSlug === f.collectionSlug && s.slug === f.sectionSlug), `${f.sectionSlug} collides with a live section`)
  }
})
test('a fallback disappears once the database has a section for the same entity', () => {
  const withRow: BrowseSectionSource[] = [...LIVE.filter((s) => s.collectionSlug === 'jesus-christ'), { slug: 'salvation-hymns', collectionSlug: 'jesus-christ', sourceEntityType: 'category', sourceEntitySlug: 'salvation' }]
  assert.ok(!fallbackSectionsForCollection('jesus-christ', withRow).some((f) => f.entitySlug === 'salvation'))
  assert.ok(fallbackSectionsForCollection('jesus-christ', LIVE.filter((s) => s.collectionSlug === 'jesus-christ')).some((f) => f.entitySlug === 'salvation'))
})

console.log('\n# Browse-only shortcuts')
test('shortcuts create no new categories or occasions (still 25 / 24)', () => {
  assert.equal(CATEGORY_ENTRIES.length, 25)
  assert.equal(OCCASION_ENTRIES.length, 24)
  const occSlugs = new Set(OCCASION_ENTRIES.map((e) => e.slug))
  for (const sc of BROWSE_SHORTCUTS) {
    assert.ok(!occSlugs.has(sc.slug), `${sc.slug} would duplicate a canonical occasion`)
    for (const m of sc.mapsTo) {
      const list = m.kind === 'category' ? (CANONICAL_CATEGORIES as readonly string[]) : (CANONICAL_OCCASIONS as readonly string[])
      assert.ok(list.includes(m.canonical), `${sc.slug} maps to unknown ${m.canonical}`)
    }
    if (sc.kind === 'existing_category') assert.ok(sc.mapsTo.some((m) => m.kind === 'category'))
  }
  assert.equal(new Set(BROWSE_SHORTCUTS.map((s) => s.slug)).size, BROWSE_SHORTCUTS.length)
})
test('all 11 audited browse values are classified', () => {
  for (const slug of ['short-hymns', 'sunday-school', 'repentance', 'praise', 'bisrate-gabriel', 'wednesday-friday', 'general-fasting', 'marian-feasts', 'church-worship', 'children-youth', 'holiday-wereb']) {
    assert.ok(BROWSE_SHORTCUTS.some((s) => s.slug === slug), slug)
  }
})
test('fallback sections only reference existing canonical slugs', () => {
  const slugs = new Set([...CATEGORY_ENTRIES, ...OCCASION_ENTRIES].map((e) => e.slug))
  for (const f of CANONICAL_FALLBACK_SECTIONS) assert.ok(slugs.has(f.entitySlug), f.entitySlug)
})

console.log('\n# Identifiers that exist in the database')
test('link slugs for canonical labels match live identifiers', () => {
  assert.equal(taxonomyLinkSlug('occasion', 'New Year / Enkutatash'), 'new-year')
  assert.equal(taxonomyLinkSlug('occasion', 'Funeral / Memorial'), 'funeral')
  assert.equal(taxonomyLinkSlug('occasion', 'General / Anytime'), 'general')
  assert.equal(taxonomyLinkSlug('category', 'Kidus Estifanos / Saint Stephen'), 'kidus-estifanos-saint-stephen')
  assert.equal(taxonomyLinkSlug('category', 'Praise / Worship'), 'praise-worship')
  assert.equal(taxonomyLinkSlug('category', 'Abune Gebre Menfes Kidus'), 'abune-gebre-menfes-kidus')
  assert.equal(taxonomyLinkSlug('category', 'Not a category'), null)
})
test('legacy spellings expand to the same entry', () => {
  assert.ok(expandLinkSlugs(['new-year']).includes('new-year-enkutatash'))
  assert.ok(expandLinkSlugs(['funeral']).includes('funeral-memorial'))
  assert.ok(sameLinkSlug('qedus-giorgis', 'kidus-giorgis'))
  assert.ok(!sameLinkSlug('gena', 'timket'))
})

console.log('\n# Saint names, titles and feast names (search)')
const searchCases: [string, 'category' | 'occasion', string][] = [
  ['Qidus Mikael', 'category', 'Kidus Michael'], ['Qeddus Mikael', 'category', 'Kidus Michael'], ['Kudus Michael', 'category', 'Kidus Michael'],
  ['Kidus Gebriel', 'category', 'Kidus Gabriel'], ['Bisrate Gabriel', 'category', 'Kidus Gabriel'], ['ብሥራተ ገብርኤል', 'category', 'Kidus Gabriel'], ['መልአከ ብሥራት', 'category', 'Kidus Gabriel'],
  ['Archangel Raphael', 'category', 'Kidus Raphael'], ['Archangel Uriel', 'category', 'Kidus Uriel'], ['ዑራኤል', 'category', 'Kidus Uriel'],
  ['ሊቀ ሰማዕታት', 'category', 'Kidus Giorgis'], ['Chief of Martyrs', 'category', 'Kidus Giorgis'], ['Giyorgis', 'category', 'Kidus Giorgis'],
  ['First Martyr', 'category', 'Kidus Estifanos / Saint Stephen'], ['Estifanos', 'category', 'Kidus Estifanos / Saint Stephen'],
  ['Abune Gebre Menfes Kidus', 'category', 'Abune Gebre Menfes Kidus'], ['ተክለ ሃይማኖት', 'category', 'Abune Tekle Haymanot'], ['Takla Haymanot', 'category', 'Abune Tekle Haymanot'],
  ['Qidus Yared', 'category', 'Kidus Yared'], ['John the Forerunner', 'category', 'Yohannes Metmek / John the Baptist'], ['መጥምቁ ዮሐንስ', 'category', 'Yohannes Metmek / John the Baptist'],
  ['Kidist Arsema', 'category', 'Martyrs'], ['Selassie', 'category', 'Holy Trinity'], ['Paraclete', 'category', 'Holy Spirit'],
  ['Fasika', 'occasion', 'Tinsae'], ['Palm Sunday', 'occasion', 'Hosanna'], ['ደመራ', 'occasion', 'Meskel'], ['Buhe', 'occasion', 'Debre Tabor'], ['ፍልሰታ', 'occasion', 'Filseta'],
  ['Hudade', 'occasion', 'Abiy Tsom'], ['ጾመ ነቢያት', 'occasion', 'Tsome Nebiyat'], ['Apostles Fast', 'occasion', 'Tsome Hawariat'], ['Enkutatash', 'occasion', 'New Year / Enkutatash'], ['Feast Day', 'occasion', 'Annual Saint Feast'],
]
for (const [q, kind, canonical] of searchCases) resolves(q, kind, canonical)
test('contextual clues and ambiguous words do not resolve as a category search', () => {
  for (const q of ['ጽዮን', 'ንዒ', 'ጻድቅ', 'ጥምቀት ቤት', 'glory', 'sin', 'ዮሐንስ']) {
    const r = resolveTaxonomyQuery(q).filter((m) => m.kind === 'category')
    assert.equal(r.length, 0, `${q} → ${JSON.stringify(r)}`)
  }
})
test('a single ambiguous keyword never classifies a hymn', () => {
  for (const lyric of ['ጽዮን ጽዮን ደስ ይበልሽ\nጽዮን ሆይ', 'ዮሐንስ ዮሐንስ\nዮሐንስ ወንጌላዊ', 'ሙሽራው ሙሽራው\nሙሽራዋ ደስ አላት', 'ተወለደ ተወለደ\nዛሬ ተወለደ']) {
    const r = classifyMezmurLyrics({ lyrics_amharic: lyric })
    assert.ok(!r.primaryCategory || r.primaryCategory === 'General', `${lyric.split('\n')[0]} → ${r.primaryCategory}`)
    assert.deepEqual(r.additionalOccasions, [])
    assert.equal(r.primaryOccasion, 'General / Anytime', `${lyric.split('\n')[0]} → ${r.primaryOccasion}`)
  }
})

console.log('\n# No lyrics or publication data modified')
test('classifier does not mutate its input', () => {
  const input = { import_id: 'x', lyrics_amharic: 'ሚካኤል መልአከ ሰላም\nሚካኤል ተራዳን', lyrics_english: 'Michael' }
  const before = JSON.stringify(input)
  classifyMezmurLyrics(input)
  assert.equal(JSON.stringify(input), before)
})
test('proposed browse SQL only inserts sections and never touches Mezmur rows', () => {
  const sqlPath = path.join(process.cwd(), 'supabase/PROPOSED_HYMN_BROWSE_CANONICAL_SECTIONS.sql')
  if (!fs.existsSync(sqlPath)) return
  const sql = fs.readFileSync(sqlPath, 'utf8').replace(/--.*$/gm, '')
  assert.ok(!/\b(update|delete|truncate|drop|alter)\b/i.test(sql), 'contains a destructive statement')
  assert.ok(!/mezmur_data_import|mezmur_public|lyrics_|\bstatus\s*=/i.test(sql.replace(/status\)\s*$/m, '')), 'touches Mezmur data')
  for (const m of sql.matchAll(/insert\s+into\s+([\w.]+)/gi)) assert.equal(m[1], 'public.mezmur_sections_import')
})

const metric = { cat: { tp: 0, fp: 0, fn: 0 }, occ: { tp: 0, fp: 0, fn: 0 } }
const falsePositives: string[] = []
for (const g of GOLD) {
  const r = classifyMezmurLyrics(g.lyrics)
  const gotCats = cats(r)
  const gotOccs = occs(r).filter((o) => o !== 'General / Anytime')
  const wantOccs = g.occasions.filter((o) => o !== 'General / Anytime')
  for (const c of gotCats.filter((c) => c !== 'General')) {
    if (g.categories.includes(c)) metric.cat.tp++
    else { metric.cat.fp++; falsePositives.push(`${g.name}: category ${c}`) }
  }
  for (const c of g.categories) if (!gotCats.includes(c)) metric.cat.fn++
  for (const o of gotOccs) {
    if (wantOccs.includes(o)) metric.occ.tp++
    else { metric.occ.fp++; falsePositives.push(`${g.name}: occasion ${o}`) }
  }
  for (const o of wantOccs) if (!gotOccs.includes(o)) metric.occ.fn++

  test(g.name, () => {
    const info = `got primary=${r.primaryCategory} cats=[${gotCats}] occ=[${occs(r)}] review=${r.reviewRequired} ${r.reviewReasons}`
    if (g.primary !== undefined) assert.equal(r.primaryCategory, g.primary, info)
    for (const c of g.categories) assert.ok(gotCats.includes(c), `missing category ${c}; ${info}`)
    for (const c of g.notCategories || []) assert.ok(!gotCats.includes(c), `unexpected category ${c}; ${info}`)
    for (const o of g.occasions) assert.ok(occs(r).includes(o as never), `missing occasion ${o}; ${info}`)
    for (const o of g.notOccasions || []) assert.ok(!occs(r).includes(o as never), `unexpected occasion ${o}; ${info}`)
    if (g.review !== undefined) assert.equal(r.reviewRequired, g.review, info)
    if (g.reviewReason) assert.ok(r.reviewReasons.includes(g.reviewReason), info)
    for (const ex of r.excerpts) {
      const src = Object.values(g.lyrics).join('\n')
      assert.ok(src.includes(ex), `excerpt not verbatim: ${ex}`)
    }
  })
}

test('no lyrics → review, no category', () => {
  const r = classifyMezmurLyrics({ lyrics_amharic: '' })
  assert.equal(r.primaryCategory, null)
  assert.equal(r.reviewRequired, true)
})
test('Tigrinya lyrics are flagged for review', () => {
  const r = classifyMezmurLyrics({ lyrics_amharic: 'ኣብ መስቀል ዝራእኽዎ ፍቕሪ\nንስሙ ክዝምር ናይ ጎይታ\nንሱ እዩ ኣምላኽና ካብ ሞት\nእቲ ኢየሱስ ክርስቶስ ኣነ ናብ ንሱ' })
  assert.ok(r.reviewReasons.includes('language_tigrinya'), r.reviewReasons.join(','))
})

const p = (m: { tp: number; fp: number; fn: number }) => ({
  precision: m.tp / Math.max(1, m.tp + m.fp),
  recall: m.tp / Math.max(1, m.tp + m.fn),
})
const cm = p(metric.cat)
const om = p(metric.occ)
console.log(`\n# Gold-set quality (${GOLD.length} hymns)`)
console.log(`categories: precision ${(cm.precision * 100).toFixed(1)}%  recall ${(cm.recall * 100).toFixed(1)}%  (tp ${metric.cat.tp}, false positives ${metric.cat.fp}, missed ${metric.cat.fn})`)
console.log(`occasions:  precision ${(om.precision * 100).toFixed(1)}%  recall ${(om.recall * 100).toFixed(1)}%  (tp ${metric.occ.tp}, false positives ${metric.occ.fp}, missed ${metric.occ.fn})`)
if (falsePositives.length) console.log('false positives:\n' + falsePositives.map((f) => `  - ${f}`).join('\n'))
test('gold-set category precision ≥ 90% and recall ≥ 90%', () => {
  assert.ok(cm.precision >= 0.9 && cm.recall >= 0.9, JSON.stringify(cm))
})
test('gold-set occasion precision ≥ 90% and recall ≥ 90%', () => {
  assert.ok(om.precision >= 0.9 && om.recall >= 0.9, JSON.stringify(om))
})

console.log(`\n${passed} passed, ${failures.length} failed`)
if (failures.length) {
  console.log(failures.map((f) => ` - ${f}`).join('\n'))
  process.exit(1)
}
