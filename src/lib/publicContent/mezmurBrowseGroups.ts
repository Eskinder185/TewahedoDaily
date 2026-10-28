import { CATEGORY_ENTRIES, OCCASION_ENTRIES } from '../mezmur/taxonomyAliases'

export type MezmurBrowseGroupKind = 'category' | 'occasion'

export type MezmurBrowseGroup = {
  slug: string
  title: string
  titleAmharic: string
  description: string
  descriptionAmharic: string
  kind: MezmurBrowseGroupKind
  taxonomySlugs: readonly string[]
  shortcuts?: readonly MezmurBrowseShortcut[]
  sortOrder: number
}

export type MezmurBrowseShortcut = {
  kind: MezmurBrowseGroupKind
  slug: string
  title: string
  titleAmharic: string
}

const categoryShortcut = (canonical: string, title = canonical): MezmurBrowseShortcut => {
  const entry = CATEGORY_ENTRIES.find((item) => item.canonical === canonical)
  if (!entry) throw new Error(`Unknown canonical Mezmur category: ${canonical}`)
  return { kind: 'category', slug: entry.slug, title, titleAmharic: entry.amharic }
}

const occasionShortcut = (canonical: string): MezmurBrowseShortcut => {
  const entry = OCCASION_ENTRIES.find((item) => item.canonical === canonical)
  if (!entry) throw new Error(`Unknown canonical Mezmur occasion: ${canonical}`)
  return { kind: 'occasion', slug: entry.slug, title: canonical, titleAmharic: entry.amharic }
}

const categorySlug = (canonical: string): string => {
  const entry = CATEGORY_ENTRIES.find((item) => item.canonical === canonical)
  if (!entry) throw new Error(`Unknown canonical Mezmur category: ${canonical}`)
  return entry.slug
}

const occasionSlug = (canonical: string): string => {
  const entry = OCCASION_ENTRIES.find((item) => item.canonical === canonical)
  if (!entry) throw new Error(`Unknown canonical Mezmur occasion: ${canonical}`)
  return entry.slug
}

export const MEZMUR_CATEGORY_BROWSE_GROUPS: readonly MezmurBrowseGroup[] = [
  {
    slug: 'jesus-christ-salvation',
    title: 'Jesus Christ & Salvation',
    titleAmharic: 'ኢየሱስ ክርስቶስ እና ድኅነት',
    description: 'Mezmurs about Jesus Christ, the Cross, and salvation.',
    descriptionAmharic: 'ስለ ኢየሱስ ክርስቶስ፣ መስቀል እና ድኅነት የሚዘመሩ መዝሙራት።',
    kind: 'category',
    taxonomySlugs: ['Jesus Christ', 'Cross', 'Salvation'].map(categorySlug),
    shortcuts: [
      categoryShortcut('Jesus Christ'), categoryShortcut('Salvation'), categoryShortcut('Cross'),
      ...['Hosanna', 'Gena', 'Timket', 'Siklet', 'Tinsae', 'Debre Tabor', 'Meskel'].map(occasionShortcut),
    ],
    sortOrder: 10,
  },
  {
    slug: 'category-virgin-mary',
    title: 'Virgin Mary',
    titleAmharic: 'እመቤታችን ቅድስት ድንግል ማርያም',
    description: 'Mezmurs honoring the Virgin Mary.',
    descriptionAmharic: 'ለእመቤታችን የሚቀርቡ መዝሙራት።',
    kind: 'category',
    taxonomySlugs: ['Virgin Mary'].map(categorySlug),
    shortcuts: [
      categoryShortcut('Virgin Mary'),
      ...['Kidane Mihret', 'Filseta', 'Lideta Maryam'].map(occasionShortcut),
    ],
    sortOrder: 20,
  },
  {
    slug: 'holy-trinity-holy-spirit',
    title: 'Holy Trinity & Holy Spirit',
    titleAmharic: 'ቅድስት ሥላሴ እና መንፈስ ቅዱስ',
    description: 'Mezmurs about the Holy Trinity and the Holy Spirit.',
    descriptionAmharic: 'ስለ ቅድስት ሥላሴ እና መንፈስ ቅዱስ የሚዘመሩ መዝሙራት።',
    kind: 'category',
    taxonomySlugs: ['Holy Trinity', 'Holy Spirit'].map(categorySlug),
    shortcuts: ['Holy Trinity', 'Holy Spirit'].map((name) => categoryShortcut(name)),
    sortOrder: 30,
  },
  {
    slug: 'category-angels-saints',
    title: 'Angels & Saints',
    titleAmharic: 'መላእክት እና ቅዱሳን',
    description: 'Mezmurs for angels, apostles, martyrs, prophets, and saints.',
    descriptionAmharic: 'የመላእክት፣ ሐዋርያት፣ ሰማዕታት፣ ነቢያት እና ቅዱሳን መዝሙራት።',
    kind: 'category',
    taxonomySlugs: [
      'Kidus Michael', 'Kidus Gabriel', 'Kidus Raphael', 'Kidus Uriel', 'Kidus Giorgis',
      'Abune Tekle Haymanot', 'Abune Gebre Menfes Kidus', 'Kidus Yared',
      'Yohannes Metmek / John the Baptist', 'Kidus Estifanos / Saint Stephen',
      'Apostles', 'Martyrs', 'Saints', 'Angels', 'Prophets',
    ].map(categorySlug),
    shortcuts: [
      'Angels', 'Apostles', 'Martyrs', 'Prophets', 'Saints',
      'Kidus Michael', 'Kidus Gabriel', 'Kidus Raphael', 'Kidus Uriel', 'Kidus Giorgis',
    ].map((name) => categoryShortcut(name)),
    sortOrder: 40,
  },
  {
    slug: 'prayer-worship',
    title: 'Prayer & Worship',
    titleAmharic: 'ጸሎት እና አምልኮ',
    description: 'Prayer, praise, worship, repentance, fasting, and general Mezmurs.',
    descriptionAmharic: 'የጸሎት፣ ምስጋና፣ አምልኮ፣ ንስሐ፣ ጾም እና አጠቃላይ መዝሙራት።',
    kind: 'category',
    taxonomySlugs: ['Prayer', 'Praise / Worship', 'General', 'Repentance'].map(categorySlug),
    shortcuts: [
      categoryShortcut('Prayer'), categoryShortcut('Praise / Worship'), categoryShortcut('General'),
      categoryShortcut('Repentance', 'Repentance & Fasting'),
      { kind: 'category', slug: 'fasting-suitable', title: 'All suitable for fasting', titleAmharic: 'ለጾም የሚስማሙ ሁሉ' },
      ...['Abiy Tsom', 'Tsome Nineveh', 'Tsome Nebiyat', 'Tsome Hawariat', 'Holy Week'].map(occasionShortcut),
    ],
    sortOrder: 50,
  },
]

export const MEZMUR_OCCASION_BROWSE_GROUPS: readonly MezmurBrowseGroup[] = [
  {
    slug: 'occasion-holidays-feasts',
    title: 'Holidays & Feasts',
    titleAmharic: 'በዓላት',
    description: 'Mezmurs for major feasts and holy days.',
    descriptionAmharic: 'የዋና ዋና በዓላት መዝሙራት።',
    kind: 'occasion',
    taxonomySlugs: [
      'Gena', 'Timket', 'Meskel', 'Hosanna', 'Siklet', 'Tinsae', 'Erget', 'Pentecost',
      'Debre Tabor', 'Filseta', 'Kidane Mihret', 'Lideta Maryam', 'New Year / Enkutatash',
      'Annual Saint Feast',
    ].map(occasionSlug),
    sortOrder: 70,
  },
  {
    slug: 'fasting-seasons',
    title: 'Fasting Seasons',
    titleAmharic: 'የጾም ወቅቶች',
    description: 'Mezmurs assigned to canonical fasting seasons.',
    descriptionAmharic: 'ለተወሰኑ የጾም ወቅቶች የተመደቡ መዝሙራት።',
    kind: 'occasion',
    taxonomySlugs: ['Abiy Tsom', 'Tsome Nineveh', 'Tsome Nebiyat', 'Tsome Hawariat', 'Holy Week'].map(occasionSlug),
    sortOrder: 80,
  },
  {
    slug: 'church-life-sacraments',
    title: 'Church Life & Sacraments',
    titleAmharic: 'የቤተ ክርስቲያን ሕይወት እና ምሥጢራት',
    description: 'Wedding, baptism, memorial, and communion Mezmurs.',
    descriptionAmharic: 'የሰርግ፣ ጥምቀት፣ ፍትሐት እና ቁርባን መዝሙራት።',
    kind: 'occasion',
    taxonomySlugs: ['Wedding', 'Baptism', 'Funeral / Memorial', 'Communion'].map(occasionSlug),
    sortOrder: 90,
  },
  {
    slug: 'anytime-mezmurs',
    title: 'Anytime Mezmurs',
    titleAmharic: 'የማንኛውም ጊዜ መዝሙራት',
    description: 'General Mezmurs without a specific feast assignment.',
    descriptionAmharic: 'ለአንድ የተወሰነ በዓል ያልተመደቡ አጠቃላይ መዝሙራት።',
    kind: 'occasion',
    taxonomySlugs: ['General / Anytime'].map(occasionSlug),
    sortOrder: 100,
  },
]

export const MEZMUR_CLASSIFICATION_BROWSE_GROUPS: readonly MezmurBrowseGroup[] = [
  ...MEZMUR_CATEGORY_BROWSE_GROUPS,
  ...MEZMUR_OCCASION_BROWSE_GROUPS,
]

export const MEZMUR_BROWSE_GROUP_BY_SLUG = new Map(
  MEZMUR_CLASSIFICATION_BROWSE_GROUPS.map((group) => [group.slug, group]),
)

