import { useCallback } from 'react'
import type { AppLocale } from '../lib/i18n/locale'
import { useLocale } from '../lib/i18n/locale'
import en from '../locales/en.json'
import am from '../locales/am.json'

type TranslationTree = typeof en
type TranslationParams = Record<string, string | number>

const DICTIONARIES: Record<AppLocale, TranslationTree> = {
  en,
  am: am as TranslationTree,
}

const LEGACY_KEY_ALIASES: Record<string, string> = {
  navHome: 'nav.home',
  navPractice: 'nav.practice',
  navCalendar: 'nav.calendar',
  navAbout: 'nav.about',
  navPrayers: 'nav.prayers',
  navPray: 'nav.pray',
  navKeepDay: 'nav.keepDay',
  navTodayPath: 'nav.todayPath',
  navModeLearnDesc: 'nav.modeLearnDesc',
  navModePrayDesc: 'nav.modePrayDesc',
  navModeKeepDayDesc: 'nav.modeKeepDayDesc',
  navPrimaryNav: 'nav.primaryNav',
  navDrawerTitle: 'nav.drawerTitle',
  navMenuOpen: 'nav.menuOpen',
  navMenuClose: 'nav.menuClose',
  dialogClose: 'common.dialogClose',
  langToggleGroup: 'language.group',
  langEnglishButton: 'language.english',
  langAmharicButton: 'language.amharic',
  themeDayLabel: 'theme.dayLabel',
  themeNightLabel: 'theme.nightLabel',
  themeDayTitle: 'theme.dayTitle',
  themeNightTitle: 'theme.nightTitle',
  homeGatewayEyebrow: 'home.gateway.eyebrow',
  homeGatewayTitle: 'home.gateway.title',
  homeGatewayDeck: 'home.gateway.deck',
  tabHymnsPractice: 'mezmurPractice.title',
  practiceHeadTitle: 'mezmurPractice.title',
  practiceHeadDeck: 'mezmurPractice.hero.description',
  practiceTabRegionLabel: 'mezmurPractice.intro.enter',
  practiceMobileGuideSummary: 'mezmurPractice.intro.quickOrientation',
  practiceChantsHelper: 'mezmurPractice.library.helper',
  searchChants: 'mezmurPractice.library.searchLabel',
  chantSearchPlaceholder: 'mezmurPractice.library.searchPlaceholder',
  practiceCustomSearchHint: 'mezmurPractice.library.cantFind',
  practiceCustomOpenDrawer: 'mezmurPractice.library.customPractice',
  chantRecentSearches: 'mezmurPractice.library.recent',
  filterAll: 'mezmurPractice.library.all',
  chantTypeMezmur: 'mezmurPractice.library.mezmur',
  chantTypeWerb: 'mezmurPractice.library.werb',
  filterMarian: 'mezmurPractice.library.marian',
  filterSaints: 'mezmurPractice.library.saints',
  filterFeastDays: 'mezmurPractice.library.feastDays',
  chantSearchResults: 'mezmurPractice.library.results',
  chantSearchClear: 'mezmurPractice.library.clearSearch',
  browseAll: 'mezmurPractice.library.browseAll',
  seeMore: 'mezmurPractice.library.seeMore',
  backToFeatured: 'mezmurPractice.library.backToFeatured',
  chantLibraryNote: 'mezmurPractice.library.libraryNote',
  practiceChantNoMatchTitle: 'mezmurPractice.library.noMatchTitle',
  practiceChantNoMatchDeck: 'mezmurPractice.library.noMatchDeck',
  practiceCustomPasteYoutubeCta: 'mezmurPractice.library.pasteYoutube',
  open: 'mezmurPractice.library.open',
  watch: 'mezmurPractice.library.watch',
  opensInNewTab: 'mezmurPractice.library.opensInNewTab',
  practiceCustomDrawerEyebrow: 'mezmurPractice.custom.drawerEyebrow',
  practiceCustomDrawerTitle: 'mezmurPractice.custom.drawerTitle',
  practiceCustomDrawerDeck: 'mezmurPractice.custom.drawerDeck',
  practiceCustomDrawerClose: 'mezmurPractice.custom.drawerClose',
  practiceCustomFormLabel: 'mezmurPractice.custom.formLabel',
  practiceCustomLearnTab: 'mezmurPractice.custom.learnTab',
  practiceCustomVoiceTab: 'mezmurPractice.custom.voiceTab',
  practiceCustomUrlLabel: 'mezmurPractice.custom.urlLabel',
  practiceCustomUrlPlaceholder: 'mezmurPractice.custom.urlPlaceholder',
  practiceCustomTitleOpt: 'mezmurPractice.custom.titleOpt',
  practiceCustomTitlePlaceholder: 'mezmurPractice.custom.titlePlaceholder',
  practiceCustomLyricsOpt: 'mezmurPractice.custom.lyricsOpt',
  practiceCustomLyricsPlaceholder: 'mezmurPractice.custom.lyricsPlaceholder',
  practiceCustomTranslitOpt: 'mezmurPractice.custom.translitOpt',
  practiceCustomTranslitPlaceholder: 'mezmurPractice.custom.translitPlaceholder',
  practiceCustomNotesOpt: 'mezmurPractice.custom.notesOpt',
  practiceCustomNotesPlaceholder: 'mezmurPractice.custom.notesPlaceholder',
  practiceCustomOptionalDetails: 'mezmurPractice.custom.optionalDetails',
  practiceCustomLoadVideo: 'mezmurPractice.custom.loadVideo',
  practiceCustomErrMissing: 'mezmurPractice.custom.errMissing',
  practiceCustomErrInvalid: 'mezmurPractice.custom.errInvalid',
  practiceChantPlayerTabsAria: 'mezmurPractice.player.tabsAria',
  practiceChantTabMemorize: 'mezmurPractice.tabs.memorize',
  practiceChantNowPlaying: 'mezmurPractice.player.nowPlaying',
  practicePlayerRegionAria: 'mezmurPractice.player.regionAria',
  practiceChantVideoLandmark: 'mezmurPractice.player.videoLandmark',
  playerBack: 'mezmurPractice.player.back',
  lyricsTextHeading: 'mezmurPractice.tabs.text',
  lyricsLyrics: 'mezmurPractice.tabs.lyrics',
  lyricsTransliteration: 'mezmurPractice.tabs.transliteration',
  lyricsBoth: 'mezmurPractice.tabs.both',
  lyricsNoTrans: 'mezmurPractice.tabs.noTransliteration',
  chantSkipBack: 'mezmurPractice.player.skipBack',
  chantSkipForward: 'mezmurPractice.player.skipForward',
  volume: 'mezmurPractice.player.volume',
  speed: 'mezmurPractice.player.speed',
  play: 'mezmurPractice.player.play',
  pause: 'mezmurPractice.player.pause',
  loopLegend: 'mezmurPractice.loop.title',
  loopSectionNameLabel: 'mezmurPractice.loop.savedLoopName',
  loopAutoSplitLegend: 'mezmurPractice.loop.sections',
  loopSection1: 'mezmurPractice.loop.section1',
  loopSection2: 'mezmurPractice.loop.section2',
  loopSection3: 'mezmurPractice.loop.section3',
  loopTimeStart: 'mezmurPractice.loop.start',
  loopTimeEnd: 'mezmurPractice.loop.end',
  markStart: 'mezmurPractice.loop.markStart',
  markEnd: 'mezmurPractice.loop.markEnd',
  playLoop: 'mezmurPractice.loop.playLoop',
  stopLoop: 'mezmurPractice.loop.stopLoop',
  clearLoop: 'mezmurPractice.loop.clearMarks',
  saveLoop: 'mezmurPractice.loop.saveLoop',
  savedLoops: 'mezmurPractice.loop.savedLoops',
  loopPlay: 'mezmurPractice.loop.play',
  loopLoad: 'mezmurPractice.loop.load',
  loopDelete: 'mezmurPractice.loop.delete',
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null
}

function resolvePath(dictionary: TranslationTree, key: string): string | undefined {
  const path = LEGACY_KEY_ALIASES[key] ?? key
  let current: unknown = dictionary

  for (const part of path.split('.')) {
    if (!isRecord(current)) return undefined
    current = current[part]
  }

  return typeof current === 'string' ? current : undefined
}

function interpolate(value: string, params?: TranslationParams): string {
  if (!params) return value
  return value.replace(/\{(\w+)\}/g, (match, name: string) => {
    const replacement = params[name]
    return replacement === undefined ? match : String(replacement)
  })
}

function warnMissing(locale: AppLocale, key: string) {
  if (import.meta.env.DEV) {
    console.warn(`[i18n] Missing translation for "${key}" in "${locale}"`)
  }
}

export function translate(
  locale: AppLocale,
  key: string,
  params?: TranslationParams,
): string {
  const localized = resolvePath(DICTIONARIES[locale], key)
  if (localized) return interpolate(localized, params)

  const fallback = resolvePath(DICTIONARIES.en, key)
  if (fallback) {
    warnMissing(locale, key)
    return interpolate(fallback, params)
  }

  warnMissing(locale, key)
  return key
}

export function findTranslation(
  locale: AppLocale,
  key: string,
  params?: TranslationParams,
): string | undefined {
  const localized = resolvePath(DICTIONARIES[locale], key)
  if (localized) return interpolate(localized, params)

  const fallback = resolvePath(DICTIONARIES.en, key)
  return fallback ? interpolate(fallback, params) : undefined
}

export function useTranslation() {
  const { locale } = useLocale()
  return useCallback(
    (key: string, params?: TranslationParams) => translate(locale, key, params),
    [locale],
  )
}
