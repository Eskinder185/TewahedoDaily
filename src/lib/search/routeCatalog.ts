/**
 * Curated public route catalog for Search Buddy.
 * Only real App.tsx destinations — never invent URLs.
 */
import { QUERY_ALIASES } from './searchCore'
import type { SiteSearchResult } from './types'

export type RouteCatalogEntry = {
  id: string
  title: string
  titleAmharic?: string
  description: string
  route: string
  aliases: string[]
  sourceType: SiteSearchResult['sourceType']
  typeLabel: string
  priority: number
}

export const ROUTE_CATALOG: RouteCatalogEntry[] = [
  {
    id: 'page:home',
    title: 'Home',
    description: 'Tewahedo Daily home — today in the Church, hymns, and prayer.',
    route: '/',
    aliases: ['home', 'start', 'main'],
    sourceType: 'page',
    typeLabel: 'Page',
    priority: 10,
  },
  {
    id: 'page:hymns',
    title: 'Hymns',
    description: 'Browse and practice Ethiopian Orthodox Mezmurs.',
    route: '/practice',
    aliases: [
      'hymns',
      'hymns practice',
      'hymn practice',
      'practice mezmur',
      'chant practice',
      'መዝሙር',
      'መዝሙር ልምምድ',
    ],
    sourceType: 'page',
    typeLabel: 'Page',
    priority: 80,
  },
  {
    id: 'page:zemaris',
    title: 'Zemari Library',
    description: 'Browse singers and choirs with linked Mezmurs.',
    route: '/practice/zemaris',
    aliases: ['zemari', 'zemaris', 'singers', 'singer', 'choir', 'ዘማሪ', 'find a zemari'],
    sourceType: 'page',
    typeLabel: 'Page',
    priority: 90,
  },
  {
    id: 'page:pray',
    title: 'Pray',
    description: 'Prayer collections, psalms, liturgy, and guided learning.',
    route: '/pray',
    aliases: [
      'pray hub',
      'prayer hub',
      'tselot',
      'ጸሎት',
      'ጸሎቶች',
      'find a prayer',
      'find prayers',
      'find prayer',
      'prayers',
    ],
    sourceType: 'page',
    typeLabel: 'Page',
    priority: 92,
  },
  {
    id: 'page:learn-how-to-pray',
    title: 'Learn How to Pray',
    description: 'Guided introduction to Ethiopian Orthodox prayer.',
    route: '/pray/learn-how-to-pray',
    aliases: [
      'learn how to pray',
      'learn prayer',
      'how to pray',
      'prayer guide',
      'guided prayer',
      'learn to pray',
      'where can i learn how to pray',
    ],
    sourceType: 'guide',
    typeLabel: 'Guide',
    priority: 95,
  },
  {
    id: 'page:synaxarium',
    title: 'Synaxarium',
    titleAmharic: 'ስንክሳር',
    description: 'Browse published Synaxarium days and commemorations.',
    route: '/pray/synaxarium',
    aliases: [
      'synaxarium',
      'senkesar',
      'senkessar',
      'ስንክሳር',
      'synaxaria',
      'todays synaxarium',
      "today's synaxarium",
      'find synaxarium',
    ],
    sourceType: 'synaxarium',
    typeLabel: 'Synaxarium',
    priority: 100,
  },
  {
    id: 'page:calendar',
    title: 'Calendar',
    description: 'Ethiopian Orthodox feasts, fasts, and daily observances.',
    route: '/calendar',
    aliases: [
      'calendar',
      'church calendar',
      'orthodox calendar',
      'fasting calendar',
      'feast calendar',
      'ethiopian calendar',
      'take me to the calendar',
      'ቅዱስ ቀን',
    ],
    sourceType: 'calendar',
    typeLabel: 'Calendar',
    priority: 100,
  },
  {
    id: 'page:today',
    title: 'Today in the Church',
    description: 'See what the Church remembers today.',
    route: '/today',
    aliases: ['today', 'today in church', 'daily'],
    sourceType: 'page',
    typeLabel: 'Page',
    priority: 70,
  },
  {
    id: 'page:about',
    title: 'About',
    description: 'About Tewahedo Daily.',
    route: '/about',
    aliases: ['about', 'about us'],
    sourceType: 'page',
    typeLabel: 'Page',
    priority: 40,
  },
  {
    id: 'page:account',
    title: 'Account',
    description: 'Optional account for synced favorites and progress.',
    route: '/account',
    aliases: ['account', 'profile', 'sign in', 'login', 'my account'],
    sourceType: 'account',
    typeLabel: 'Account',
    priority: 50,
  },
  {
    id: 'page:favorites',
    title: 'Saved / Favorites',
    description: 'Your saved hymns and prayers (device or synced).',
    route: '/saved',
    aliases: ['favorites', 'saved', 'my favorites', 'show my favorites', 'bookmark', 'bookmarks'],
    sourceType: 'account',
    typeLabel: 'Account',
    priority: 60,
  },
  {
    id: 'page:english-mezmur',
    title: 'English Mezmur',
    description: 'Browse English-language Mezmur collection.',
    route: '/practice/browse/english-mezmur',
    aliases: ['english mezmur', 'english mezmurs', 'english hymns', 'show english mezmurs'],
    sourceType: 'hymn_collection',
    typeLabel: 'Collection',
    priority: 88,
  },
  {
    id: 'page:repentance-fasting',
    title: 'Repentance & Fasting',
    description: 'Mezmurs related to repentance and fasting.',
    route: '/practice/browse/repentance-fasting',
    aliases: ['repentance', 'fasting', 'fasting information', 'show me fasting information', 'ጾም'],
    sourceType: 'hymn_collection',
    typeLabel: 'Collection',
    priority: 88,
  },
  // Curated published feast sections (grounded in live browse tree)
  {
    id: 'section:meskel',
    title: 'Meskel / Holy Cross',
    description: 'Hymn section for Meskel — the Finding of the True Cross.',
    route: '/practice/browse/holidays-feasts/holidays-meskel',
    aliases: ['meskel', 'meskal', 'meskle', 'meskel hymns', 'find meskel hymns', 'መስቀል'],
    sourceType: 'hymn_section',
    typeLabel: 'Section',
    priority: 120,
  },
  {
    id: 'section:timkat',
    title: 'Timkat / Epiphany',
    description: 'Hymn section for Timkat (Epiphany).',
    route: '/practice/browse/holidays-feasts/holidays-timket',
    aliases: ['timkat', 'timket', 'epiphany', 'timkat hymns', 'find timkat'],
    sourceType: 'hymn_section',
    typeLabel: 'Section',
    priority: 120,
  },
  {
    id: 'section:gena',
    title: 'Gena / Christmas',
    description: 'Hymn section for Gena (Christmas).',
    route: '/practice/browse/holidays-feasts/holidays-gena',
    aliases: ['gena', 'christmas', 'gena hymns'],
    sourceType: 'hymn_section',
    typeLabel: 'Section',
    priority: 110,
  },
  {
    id: 'section:saint-michael',
    title: 'St. Michael',
    titleAmharic: 'ቅዱስ ሚካኤል',
    description: 'Hymn section for St Michael (Kidus Mikael).',
    route: '/practice/browse/angels-saints/saint-michael',
    aliases: [
      'st michael',
      'saint michael',
      'mikael',
      'michael',
      'kidus michael',
      'kidus mikael',
      'find st michael hymns',
      'st michael hymns',
      'ሚካኤል',
    ],
    sourceType: 'hymn_section',
    typeLabel: 'Section',
    priority: 120,
  },
]

export { QUERY_ALIASES }

/** Expand a user query with known feast / spelling aliases for indexing. */
export { expandSearchAliases } from './searchCore'

