/**
 * Curated public route catalog for Search Buddy.
 * Only real App.tsx destinations — never invent URLs.
 */
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
    title: 'Hymns Practice',
    description: 'Browse and practice Ethiopian Orthodox Mezmurs.',
    route: '/practice',
    aliases: [
      'hymns',
      'hymn practice',
      'mezmur',
      'mezmurs',
      'songs',
      'practice mezmur',
      'chant',
      'መዝሙር',
      'መዝሙራት',
    ],
    sourceType: 'page',
    typeLabel: 'Page',
    priority: 100,
  },
  {
    id: 'page:zemaris',
    title: 'Zemari Library',
    description: 'Browse singers and choirs with linked Mezmurs.',
    route: '/practice/zemaris',
    aliases: ['zemari', 'zemaris', 'singers', 'singer', 'choir', 'ዘማሪ'],
    sourceType: 'page',
    typeLabel: 'Page',
    priority: 90,
  },
  {
    id: 'page:pray',
    title: 'Pray',
    description: 'Prayer collections, psalms, liturgy, and guided learning.',
    route: '/pray',
    aliases: ['pray', 'prayer', 'prayers', 'tselot', 'ጸሎት', 'ጸሎቶች'],
    sourceType: 'page',
    typeLabel: 'Page',
    priority: 100,
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
    ],
    sourceType: 'guide',
    typeLabel: 'Guide',
    priority: 95,
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
    aliases: ['favorites', 'saved', 'my favorites', 'bookmark', 'bookmarks'],
    sourceType: 'account',
    typeLabel: 'Account',
    priority: 60,
  },
  {
    id: 'page:occasions',
    title: 'Hymn Occasions',
    description: 'Browse Mezmurs by occasion.',
    route: '/practice/occasions',
    aliases: ['occasions', 'feast hymns', 'occasion hymns'],
    sourceType: 'page',
    typeLabel: 'Page',
    priority: 55,
  },
  {
    id: 'page:categories',
    title: 'Hymn Categories',
    description: 'Browse Mezmurs by category.',
    route: '/practice/categories',
    aliases: ['categories', 'hymn categories', 'subjects'],
    sourceType: 'page',
    typeLabel: 'Page',
    priority: 55,
  },
]

/** Alias expansions for feasts / common typos → catalog or content keywords. */
export const QUERY_ALIASES: Record<string, string[]> = {
  timket: ['timkat', 'timket', 'epiphany'],
  timkat: ['timkat', 'timket', 'epiphany'],
  meskel: ['meskel', 'meskal', 'መስቀል', 'finding of the true cross'],
  meskal: ['meskel', 'meskal', 'መስቀል'],
  michael: ['michael', 'st michael', 'saint michael', 'ሚካኤል'],
  'st michael': ['michael', 'st michael', 'saint michael', 'ሚካኤል'],
  zemary: ['zemari', 'singer'],
  zemari: ['zemari', 'singer'],
  fasting: ['fast', 'fasting', 'ጾም', 'tsom'],
  repentance: ['repentance', 'ንስሐ', 'nesha'],
}
