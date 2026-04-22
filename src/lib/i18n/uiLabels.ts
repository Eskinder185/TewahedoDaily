import { useCallback } from 'react'
import type { AppLocale } from './locale'
import { useLocale } from './locale'

/**
 * Bilingual UI strings — expand keys as you translate more of the app.
 * Prefer `useUiLabel()` in components under `LocaleProvider`.
 */
export const UI_LABELS = {
  // Navigation
  navHome: { en: 'Home', am: 'መነሻ' },
  navPractice: { en: 'Hymns Practice', am: 'የመዝሙር ልምምድ' },
  navCalendar: { en: 'Calendar', am: 'ቀን መቁጠሪያ' },
  navAbout: { en: 'About', am: 'ስለ ዚህ' },
  navPrayers: { en: 'Prayers', am: 'ጸሎቶች' },
  navLearn: { en: 'Learn', am: 'ይማሩ' },
  navPray: { en: 'Pray', am: 'ይጸልዩ' },
  navKeepDay: { en: 'Calendar', am: 'ቀን መቁጠሪያ' },
  navTodayPath: { en: 'Today in the Church', am: 'ዛሬ በቤተ ክርስቲያን' },
  navModeLearnDesc: { en: 'Practice chants and movement', am: 'መዝሙርና እንቅስቃሴ ይለማመዱ' },
  navModePrayDesc: { en: 'Read daily prayers and sacred texts', am: 'የዕለት ጸሎቶችን እና ቅዱስ ንባብን ያንብቡ' },
  navModeKeepDayDesc: { en: 'Follow the season, feast, and observance', am: 'ወቅቱን፣ በዓሉን እና ማስታወሻውን ይከታተሉ' },
  navPrimaryNav: { en: 'Primary navigation', am: 'ዋና አሻራ' },
  navDrawerTitle: { en: 'Menu', am: 'ምናሌ' },
  navMenuOpen: { en: 'Open menu', am: 'ምናሌ ክፈት' },
  navMenuClose: { en: 'Close menu', am: 'ምናሌ ዝጋ' },
  dialogClose: { en: 'Close', am: 'ዝጋ' },

  langToggleGroup: { en: 'Language', am: 'ቋንቋ' },
  langEnglishButton: { en: 'English', am: 'English' },
  langAmharicButton: { en: 'Amharic', am: 'አማርኛ' },

  calPrevMonth: { en: 'Previous month', am: 'ያለፈው ወር' },
  calNextMonth: { en: 'Next month', am: 'ቀጣይ ወር' },
  calendarGridRegion: { en: 'Month', am: 'ወር' },
  calendarDayMarkersLegend: {
    en: 'Legend for calendar day markers',
    am: 'የቀን ምልክቶች መግለጫ',
  },
  calendarDaySelectedSuffix: { en: 'Selected.', am: 'ተመርጧል።' },
  calendarSelectionAnnounce: {
    en: 'Liturgical day updated',
    am: 'የቤተክርስቲያን ቀን ተሻሽሏል',
  },
  calendarQuickContextAria: {
    en: 'Liturgical context for this day',
    am: 'ለዚህ ቀን የቤተክርስቲያን ዝርዝር',
  },
  calendarObservanceTagsAria: {
    en: 'Observance tags for this day',
    am: 'ለዚህ ቀን የአከባበር ምልክቶች',
  },
  calendarPreviousDay: { en: 'Previous day', am: 'ያለፈው ቀን' },
  calendarNextDay: { en: 'Next day', am: 'ቀጣይ ቀን' },
  /** Shown above the primary feast/saint title on the mobile calendar day panel */
  calendarPanelCommemorationEyebrow: {
    en: 'The Church remembers',
    am: 'ቤተክርስቲያን የምታስበው',
  },
  calendarPanelConnectionHeading: {
    en: 'How it connects',
    am: 'ከምን ጋር ይገናኛል',
  },
  calendarPanelAlsoOnDayHeading: {
    en: 'Also on this day',
    am: 'በዚህ ቀን ደግሞ',
  },
  calendarPanelSecondaryExpandHint: {
    en: 'Show grouped list',
    am: 'ቡድን ዝርዝር አሳይ',
  },
  calendarPanelMetaObservance: { en: 'Observance', am: 'አከባበር' },
  calendarPanelMetaCategory: { en: 'Category', am: 'ምድብ' },
  calendarPanelCommonPractices: {
    en: 'Common practices',
    am: 'ተለመዱ ልምዶች',
  },
  calendarPanelObservanceMoreSummary: {
    en: 'Tone, category, and context',
    am: 'ድምፅ፣ ምድብና አውድ',
  },
  /** Group headings for additional EOTC rows (same tier shown together). */
  calendarPanelGroupTier1: { en: 'Major feasts', am: 'ትላልቅ በዓላት' },
  calendarPanelGroupTier2: { en: 'Major fasts', am: 'ትላልቅ ጾሞች' },
  calendarPanelGroupTier3: { en: 'Marian days', am: 'የማርያም ቀናት' },
  calendarPanelGroupTier4: { en: 'Saints, angels, and apostles', am: 'ቅዱሳን፣ መላእክትና ሐዋርያት' },
  calendarPanelGroupTier5: { en: 'Other feasts and fixed days', am: 'ሌሎች በዓላትና ቋሚ ቀናት' },
  calendarPanelGroupTier6: { en: 'Monthly commemorations', am: 'ወርሃዊ መታሰቢያዎች' },
  calendarPanelGroupTier7: { en: 'Weekly rhythm', am: 'ሳምንታዊ ልምድ' },
  calendarPanelGroupTier8: { en: 'Season context', am: 'የወቅት አውድ' },
  calendarOverviewEotcTabLead: {
    en: 'The panel above carries the main story for this civil day. Below is a compact reference for every dataset row.',
    am: 'ለዚህ ሲቪል ቀን ዋናው ታሪክ ከላይ በፓነል ቀርቧል። ከታች ለሁሉም ረድፎች አጠቃላይ ማጣቀሻ ነው።',
  },
  calendarOverviewEotcRefSummary: {
    en: 'All liturgical entries (reference)',
    am: 'ሁሉም የቅዳሴ ግቤቶች (ማጣቀሻ)',
  },
  calendarMeaningMoreFromGuide: {
    en: 'More from the daily church guide',
    am: 'ከዕለታዊ የቤተክርስቲያን መመሪያ ተጨማሪ',
  },

  calendarEotcLookupSummary: {
    en: 'Search liturgical observances',
    am: 'የቅዳሴ መታሰቢያዎችን ፈልግ',
  },
  calendarEotcLookupPlaceholder: {
    en: 'Title, English, transliteration, or keyword',
    am: 'ርዕስ፣ እንግሊዝኛ፣ ድምፅ ወይም ቁልፍ ቃል',
  },
  calendarEotcLookupHint: {
    en: 'Matches the calendar JSON: combine words (all must match) or pick a category filter.',
    am: 'ከቀን መቁጠሪያ JSON ጋር ይዛመዳል፦ ቃላትን ያጣምሩ (ሁሉም ይገናኙ) ወይም የምድብ ማጣሪያ ይምረጡ።',
  },
  calendarEotcLookupNoResults: {
    en: 'No entries match. Try fewer words or a different filter.',
    am: 'የሚዛመድ ግቤት የለም። ያነሱ ቃሎች ወይም ሌላ ማጣሪያ ይሞክሩ።',
  },
  calendarEotcLookupIdle: {
    en: 'Type a search or choose a category to see matching observances.',
    am: 'ለማየት ፍለጋ ይተይቡ ወይም ምድብ ይምረጡ።',
  },
  calendarEotcLookupResultsAria: {
    en: 'Search results',
    am: 'የፍለጋ ውጤቶች',
  },
  calendarEotcLookupFiltersAria: {
    en: 'Category filters',
    am: 'የምድብ ማጣሪያዎች',
  },
  calendarEotcFilterMajorFeast: { en: 'Major feasts', am: 'ትላልቅ በዓላት' },
  calendarEotcFilterFast: { en: 'Fasts', am: 'ጾሞች' },
  calendarEotcFilterMary: { en: 'Marian', am: 'ማርያም' },
  calendarEotcFilterAngel: { en: 'Angels', am: 'መላእክት' },
  calendarEotcFilterSaint: { en: 'Saints & martyrs', am: 'ቅዱሳን' },
  calendarEotcFilterSeason: { en: 'Seasons', am: 'ወቅቶች' },
  calendarEotcFilterWeeklyObservance: { en: 'Weekly', am: 'ሳምንታዊ' },
  calendarEotcLookupCollection: {
    en: 'Collection',
    am: 'ስብስብ',
  },

  calendarGalleryTitle: {
    en: 'Browse the liturgical year',
    am: 'የቤተክርስቲያን ዓመት ያስሱ',
  },
  calendarGalleryDeck: {
    en:
      'Every feast, fast, and commemoration from the Ethiopian Orthodox calendar dataset — open any card for full detail, or jump to its next day on the calendar.',
    am: 'ከኢ.ኦ.ክ. የቀን መቁጠሪያ ውሂብ የተወሰኑ በዓላት፣ ጾሞች እና ማስታወሻዎች — ለሙሉ ዝርዝር ካርድ ይክፈቱ ወይም ወደ ቀኑ በቀን መቁጠሪያ ይዝለሉ።',
  },
  calendarGallerySearchPlaceholder: {
    en: 'Search by title, English, transliteration, keyword…',
    am: 'በርዕስ፣ እንግሊዝኛ፣ ድምፅ ወይም ቁልፍ ቃል ይፈልጉ…',
  },
  calendarGalleryFilterAria: {
    en: 'Filter observances by category',
    am: 'በምድብ መታሰቢያዎችን ያጣሩ',
  },
  calendarGalleryFilterAll: { en: 'All types', am: 'ሁሉም አይነቶች' },
  calendarGallerySectionFeatured: {
    en: 'Featured holy days',
    am: 'የተመረጡ ቅድስት ቀኖች',
  },
  calendarGalleryViewAll: { en: 'View all in category', am: 'ሁሉን በምድብ ይመልከቱ' },
  calendarGalleryLoadMore: { en: 'Load more', am: 'ተጨማሪ ጫን' },
  calendarGalleryEmpty: {
    en: 'No observances match. Try clearing filters or fewer search words.',
    am: 'የሚዛመድ መታሰቢያ የለም። ማጣሪያዎችን ያጥፉ ወይም የፍለጋ ቃላትን ይቀንሱ።',
  },
  calendarGalleryShowing: { en: 'Showing', am: 'በማሳየት ላይ' },
  calendarGalleryBucketMajorFeast: { en: 'Major feasts', am: 'ትላልቅ በዓላት' },
  calendarGalleryBucketMinorFeast: { en: 'Minor feasts', am: 'አነስተኛ በዓላት' },
  calendarGalleryBucketMovable: { en: 'Movable (Paschal)', am: 'አንቀሳቃሽ (ፋሲካ)' },
  calendarGalleryBucketFast: { en: 'Fasts', am: 'ጾሞች' },
  calendarGalleryBucketMary: { en: 'Saint Mary', am: 'ኅይወት ማርያም' },
  calendarGalleryBucketAngel: { en: 'Angels', am: 'መላእክት' },
  calendarGalleryBucketApostle: { en: 'Apostles', am: 'ሐዋርያት' },
  calendarGalleryBucketMartyr: { en: 'Martyrs', am: 'ሰማዕታት' },
  calendarGalleryBucketProphet: { en: 'Prophets', am: 'ነቢያት' },
  calendarGalleryBucketSaint: { en: 'Saints', am: 'ቅዱሳን' },
  calendarGalleryBucketWeeklyObservance: {
    en: 'Weekly observances',
    am: 'ሳምንታዊ መታሰቢያዎች',
  },
  calendarGalleryBucketSeason: { en: 'Seasons', am: 'ወቅቶች' },
  calendarGalleryDetailWhy: { en: 'Why it matters', am: 'ለምን እንደሚያስፈልግ' },
  calendarGalleryDetailConnection: {
    en: 'Connection to the Church',
    am: 'ከቤተ ክርስቲያን ጋር ግንኙነት',
  },
  calendarGalleryDetailMore: { en: 'Read more', am: 'ተጨማሪ ያንብቡ' },
  calendarGalleryDetailPractices: {
    en: 'Common practices',
    am: 'ተለመዱ ልምዶች',
  },
  calendarGalleryDetailNotes: { en: 'Notes', am: 'ማስታወሻዎች' },
  calendarGalleryDetailRelated: { en: 'Related observances', am: 'የተያያዙ መታሰቢያዎች' },
  calendarGalleryShowOnCalendar: {
    en: 'Show next on calendar',
    am: 'ቀጣዩን በቀን መቁጠሪያ ላይ አሳይ',
  },
  calendarGalleryNoResolvedDay: {
    en: 'No computable civil day in the next window — still keep this observance in prayer with your parish books.',
    am: 'በቀጣዩ መስኮት ውስጥ የሚታሰብ ክሪሎስ ቀን የለም — ከቤተክርስቲያን መጽሐፍት ጋር በጸሎት ይያዙ።',
  },

  chantSkipBack: { en: 'Rewind 5 seconds', am: '5 ሰከንድ ወደ ኋላ' },
  chantSkipForward: { en: 'Forward 5 seconds', am: '5 ሰከንድ ወደ ፊት' },

  themeSwitcherGroup: { en: 'Theme', am: 'መልክ' },
  themeSegLight: { en: 'Light', am: 'ብርሃን' },
  themeSegDark: { en: 'Dark', am: 'ጨለማ' },
  themeSegSystem: { en: 'System', am: 'ስርተም' },
  themeLightTitle: { en: 'Use light theme', am: 'የብርሃን መልክ ይጠቀሙ' },
  themeDarkTitle: { en: 'Use dark theme', am: 'የጨለማ መልክ ይጠቀሙ' },
  themeSystemTitle: { en: 'Match system appearance', am: 'ከስርተም ጋር ያዛምዱ' },

  homeGatewayEyebrow: { en: 'Three ways in', am: 'ሶስት መንገዶች' },
  homeGatewayTitle: { en: 'Enter through learning, prayer, or the day itself.', am: 'በትምህርት፣ በጸሎት ወይም በቀኑ ይግቡ።' },
  homeGatewayDeck: {
    en: 'After the hero, the product should quickly orient you. Choose the mode that matches what you need now.',
    am: 'ከመነሻው በኋላ ገጹ ፈጣን መመሪያ ይስጥ። አሁን የሚያስፈልግዎትን መንገድ ይምረጡ።',
  },

  // Prayer hub & readers
  prayerHubEyebrow: { en: 'Prayer', am: 'ጸሎት' },
  prayerHubTitle: { en: 'Sacred reading', am: 'ቅዱስ ንባብ' },
  prayerHubIntro: {
    en: 'Choose a quiet place. Read slowly. The texts below are presented for devotion — language, typography, and layout are tuned for clarity and reverence.',
    am: 'የተረገመ ቦታ ይምረጡ። በዝግታ ያንብቡ። ከታች ያሉ ጽሑፎች ለመዝሙርና ለጸሎት ተብለው የቀረቡ ናቸው።',
  },
  prayerHubHeroDeck: {
    en: 'Still your heart. Begin with the daily round—then rest where love draws you.',
    am: 'ልብዎን ያስረሱ። በዕለቱ ዙር ይጀመሩ—ከዚያ በእግዚአብሔር ፍቅር በሚሳብዎት ቦታ ይዘነቡ።',
  },
  prayerHubPrimaryStart: { en: "Start today's prayer", am: 'የዛሬን ጸሎት ይጀመሩ' },
  prayerHubDailyPath: { en: 'Daily path', am: 'የዕለት መንገድ' },
  prayerHubQuickContinue: { en: 'Continue', am: 'ይቀጥሉ' },
  prayerHubQuickBrowse: { en: 'Browse all', am: 'ሁሉን ይመልከቱ' },
  prayerHubQuickSaved: { en: 'Saved', am: 'የተቀመጡ' },
  prayerHubContinueHint: { en: 'Return to where you left off', am: 'የከተሉበትን ይመልሱ' },
  prayerHubRecentLabel: { en: 'Last opened', am: 'በመጨረሻ የተከፈቱ' },
  prayerHubSavedHeading: { en: 'Saved prayers', am: 'የተቀመጡ ጸሎቶች' },
  prayerHubSavedEmpty: {
    en: 'Nothing saved yet. When you keep a prayer from its page, it will rest here.',
    am: 'እስካሁን የተቀመጠ የለም። ከጸሎት ገጽ ሲጠብቁ እዚህ ይቆያል።',
  },
  prayerHubSectionStart: { en: 'Start here', am: 'እዚህ ይጀመሩ' },
  prayerHubSectionStartLead: {
    en: 'The recurring round that orders each day—your first and faithful step.',
    am: 'የዕለቱን የሚዘጋጀው ድግግሞሽ ዙር—የመጀመሪያው እና የታመነ እርምጃ።',
  },
  prayerHubSectionDevotional: { en: 'Daily & devotional', am: 'የዕለትና የመዝሙር' },
  prayerHubSectionDevotionalLead: {
    en: 'Mary’s praises through the week, and the Psalms for slow, spacious reading.',
    am: 'በሳምንቱ የማርያም ምስጋና፣ እና ለዝግታ ንባብ መዝሙራት።',
  },
  prayerHubSectionZema: { en: 'With zema & full text', am: 'በዜማና በሙሉ ጽሑፍ' },
  prayerHubSectionZemaLead: {
    en: 'Hear and hold the text together—long prayers borne by melody.',
    am: 'ድምጽንና ጽሑፍን አንድ ላይ ታሙ—በዜማ የሚሰማ ረጅም ጸሎት።',
  },
  prayerHubFeaturedFoundation: {
    en: 'Praise and petition in their daily round—the quiet spine of prayer at home.',
    am: 'በዕለቱ ዙር ውስጥ ምስጋናና ልመና—በቤት የጸሎት ጸጋዕ መስመር።',
  },
  prayerHubCtaZeweter: { en: "Begin today's prayer", am: 'የዛሬን ጸሎት ይጀመሩ' },
  prayerHubCtaWudase: { en: 'Enter Marian devotion', am: 'ወደ የማርያም ምስጋና ይግቡ' },
  prayerHubCtaMezmur: { en: 'Read the Psalms', am: 'መዝሙራትን ያንብቡ' },
  prayerHubCtaYekidane: { en: 'Enter the covenant prayer', am: 'የኪዳን ጸሎት ይግቡ' },
  prayerHubCtaMeharene: { en: 'Enter this supplication', am: 'ወደዚህ ልመና ይግቡ' },
  prayerHubMetaText: { en: 'Text', am: 'ጽሑፍ' },
  prayerHubMetaTextAudio: { en: 'Text & audio', am: 'ጽሑፍ እና ድምጽ' },
  prayerHubEstZeweter: { en: '~15–30 min', am: '~15–30 ደቂቃ' },
  prayerHubEstWudase: { en: '~10–20 min', am: '~10–20 ደቂቃ' },
  prayerHubEstMezmur: { en: 'As long as you need', am: 'ስላስፈለገዎት' },
  prayerHubEstZema: { en: '~25–45 min', am: '~25–45 ደቂቃ' },
  prayerHubZeweterTitle: { en: 'Zeweter Tselot', am: 'ዘወትር ጸሎት' },
  prayerHubZeweterDesc: {
    en: 'The steady cycle of daily prayer—praise, petition, and peace in the household of faith.',
    am: 'የዕለት ጸሎት ያለቀላለጥ ዙር—ምስጋና፣ ልመና እና ሰላም በሃይማኖት ቤት።',
  },
  prayerHubWudaseTitle: { en: 'Wudase Mariam', am: 'ውዳሴ ማርያም' },
  prayerHubWudaseDesc: {
    en: 'The Mother of God’s praises—one day at a time, one luminous reading in a liturgical week.',
    am: 'የእመቤታችን ምስጋና—በአንድ ቀን በአንድ፣ በሥርዓተ ቤተክርስቲያን በሳምንቱ።',
  },
  prayerHubMezmurTitle: { en: 'Mezmure Dawit', am: 'መዝሙር ዳዊት' },
  prayerHubMezmurDesc: {
    en: 'The Psalms given room to breathe—long lines for deep listening and unhurried prayer.',
    am: 'መዝሙራት የሚተነፍሱበት ቦታ—ለጥልቅ ማድመጫና ለዘፈቀደ ጸሎት ረጅም መስመር።',
  },
  prayerHubYekidaneTitle: { en: 'Yekidane Tselot', am: 'የኪዳን ጸሎት' },
  prayerHubYekidaneDesc: {
    en: 'The Covenant prayer set to zema—text, melody, and listening marks faithful to the source.',
    am: 'የኪዳን ጸሎት በዜማ—ጽሑፍ፣ ዜማ እና ምንጭን የሚሰማ የማድመጫ ምልክት።',
  },
  prayerHubMehareneTitle: { en: 'Meharene Ab', am: 'መሐረነ አብ' },
  prayerHubMehareneDesc: {
    en: '“Have mercy on us, Father”—a full supplication to the Father, carried by zema in sustained prayer.',
    am: '«መሐረነ አብ»—ወደ አብ ሙሉ ልመና፣ በዜማ በረጅም ጸሎት የሚሰማ።',
  },
  prayerHubOpen: { en: 'Open', am: 'ክፈት' },

  prayerLangAmharic: { en: 'Amharic', am: 'አማርኛ' },
  prayerLangGeez: { en: "Ge'ez", am: 'ግዕዝ' },
  prayerLangEnglish: { en: 'English', am: 'እንግሊዝኛ' },
  prayerShowFull: { en: 'Show full prayer', am: 'ሙሉ ጸሎት አሳይ' },
  prayerShowLess: { en: 'Show less', am: 'ያነሱ አሳይ' },

  prayerZeweterEyebrow: { en: 'Daily prayer', am: 'የዕለት ጸሎት' },
  prayerZeweterTitle: { en: 'Zeweter Tselot', am: 'ዘወትር ጸሎት' },
  prayerZeweterIntro: {
    en: 'The recurring prayers of the faithful — move through the list, then dwell in the full text. Nothing is rushed here.',
    am: 'የሃይማኖተኞች ድግግሞሽ ጸሎቶች — በዝርዝሩ ይንቀሳቀሱ፣ በሙሉ ጽሑፍ ይዘነቡ።',
  },
  prayerZeweterNav: { en: 'Prayers', am: 'ጸሎቶች' },
  prayerZeweterReading: { en: 'Reading', am: 'ንባብ' },

  prayerWudaseEyebrow: { en: 'Marian devotion', am: 'የማርያም ምስጋና' },
  prayerWudaseTitle: { en: 'Wudase Mariam', am: 'ውዳሴ ማርያም' },
  prayerWudaseIntro: {
    en: 'Seven days, seven praises — select the day, receive the prayer. The rhythm of the week becomes a small liturgy.',
    am: 'ሰባት ቀናት ሰባት ምስጋናዎች — ቀኑን ይምረጡ።',
  },
  prayerWudaseDays: { en: 'Days of the week', am: 'የሳምንቱ ቀናት' },

  prayerMezmurEyebrow: { en: 'Scripture', am: 'መጽሐፍ' },
  prayerMezmurTitle: { en: 'Mezmure Dawit', am: 'መዝሙር ዳዊት' },
  prayerMezmurIntro: {
    en: 'The Psalms in three languages — search by number, browse the index, and read with room to breathe.',
    am: 'መዝሙራት በሦስት ቋንቋ — በቁጥር ይፈልጉ፣ ዝርዝሩን ይመልከቱ።',
  },
  prayerMezmurSearch: { en: 'Psalm number', am: 'የመዝሙር ቁጥር' },
  prayerMezmurIndex: { en: 'Psalms in this volume', am: 'በዚህ ክፍል ያሉ መዝሙራት' },
  prayerMezmurPrev: { en: 'Previous', am: 'ቀዳሚ' },
  prayerMezmurNext: { en: 'Next', am: 'ቀጣይ' },

  prayerDayMon: { en: 'Mon', am: 'ሰኞ' },
  prayerDayTue: { en: 'Tue', am: 'ማክሰኞ' },
  prayerDayWed: { en: 'Wed', am: 'ረቡዕ' },
  prayerDayThu: { en: 'Thu', am: 'ሐሙስ' },
  prayerDayFri: { en: 'Fri', am: 'ዓርብ' },
  prayerDaySat: { en: 'Sat', am: 'ቅዳሜ' },
  prayerDaySun: { en: 'Sun', am: 'እሁድ' },
  tabChants: { en: 'Chants', am: 'መዝሙር' },
  tabHymnsPractice: { en: 'Hymns Practice', am: 'የመዝሙር ልምምድ' },
  tabTselot: { en: 'Tselot', am: 'ጸሎት' },
  practiceHeadTitle: {
    en: 'Hymns Practice',
    am: 'የመዝሙር ልምምድ',
  },
  practiceHeadDeck: {
    en:
      'Mezmur, werb, and liturgical hymns — focused practice. For prayer texts and tselot, use Daily Prayers.',
    am: 'መዝሙር፣ ወርብ እና የቤተክርስቲያን መዝሙር። ለጸሎት ጽሑፎች ለዕለታዊ ጸሎቶች ይሂዱ።',
  },
  practiceGoToPrayers: {
    en: 'Go to Daily Prayers',
    am: 'ወደ ዕለታዊ ጸሎቶች ይሂዱ',
  },
  practiceJourneyEyebrow: {
    en: 'Sacred study',
    am: 'ቅዱስ ትምህርት',
  },
  practiceJourneyTitle: {
    en: 'A guided path through mezmur and werb',
    am: 'በመዝሙርና በወርብ የሚመራ መንገድ',
  },
  practiceJourneySubtitle: {
    en:
      'Each step below is woven through this page — open a chant when you are ready, and learn at the pace of the Church.',
    am: 'ከታች ያሉ ደረጃዎች በዚህ ገጽ ይዋሃዳሉ — ዝግጁ ሲሆኑ መዝሙር ይክፈቱ፣ በቤተክርስቲያን ፍጥነት ይማሩ።',
  },
  practiceJourneyStep1Title: { en: 'Learn the words', am: 'ቃላችን ይማሩ' },
  practiceJourneyStep1Body: {
    en:
      'Quick meaning, transliteration, and theme — then study lyrics line by line or by stanza. Use memorization tools: progressive reveal, first-letter hints, focus on one line, and mark learned or review later.',
    am: 'ፍለጋ፣ ስም እና ርዕስ — በናይት ወይም በቁምፃ ተማሩ። ለማስታወስ፣ ደረጃ ደረጃ መግለጫ፣ የመጀመሪያ ፊደል፣ አንድ መስመር መርጨት።',
  },
  practiceJourneyStep2Title: { en: 'Learn the rhythm', am: 'የዜማ ልምምድ' },
  practiceJourneyStep2Body: {
    en:
      'Follow the suggested order, then in the player use slower speed and loops so the melody and drum teach your breath without haste.',
    am: 'የተጠቆሙትን ቅደር ይከተሉ፣ በፕሌየር ደግሞ ዝግታ እና ዙር ለዜማና ለቁርጥም ይጠቀሙ።',
  },
  practiceJourneyStep3Title: {
    en: 'Practice with intention',
    am: 'በቲመታ ይለማመዱ',
  },
  practiceJourneyStep3Body: {
    en:
      'Use the practice tools: loop sections, adjust speed, and record yourself. Focus on one hymn through the week — repetition builds devotion.',
    am: 'የልምምድ መሳሪያዎት ይጠቀሙ፦ መባዝናት፣ ፍጅነት አቀል፣ የራስዎትን ቅብጽ።',
  },
  practiceJourneyStep4Title: {
    en: 'Build your repertoire',
    am: 'የመዝሙር ቅንቅን ልምድ',
  },
  practiceJourneyStep4Body: {
    en:
      'Once comfortable with one hymn, explore different categories: mezmur, werb, Marian hymns, and feast day selections. Build a personal prayer repertoire.',
    am: 'ከአንድ መዝሙር ጋር በጽነት በኋላ፣ የተለያያትን ክፍሎች ይጠኔጡ፦ መዝሙር፣ ወርብ፣ የማሪያም መዝሙሬች።',
  },
  practiceJourneyFoot: {
    en: ' — for scripture prayers, tselot, and holy reading beyond this practice space.',
    am: ' — ለመጽሐፍ ጸሎት፣ ጸሎትና ቅዱስ ንባብ ከዚህ ልምምድ ውጭ።',
  },
  practiceHymnsHelper: {
    en:
      'Choose a hymn to open the player: memorization tools and recording beside the video.',
    am: 'መዝሙር ይምረጡ — በቪዲዮ አጠገብ የማስታወስ መሳሪያዎች እና ቅጂ።',
  },
  practiceTabRegionLabel: {
    en: 'Step into practice',
    am: 'ወደ ልምምድ ይግቡ',
  },
  practiceMobileGuideSummary: {
    en: 'Quick orientation',
    am: 'አጭር መመሪያ',
  },
  practiceHubTabsAria: {
    en: 'Practice areas',
    am: 'የልምምድ ክፍፍሎች',
  },
  practiceChantPlayerTabsAria: {
    en: 'Chant learning sections',
    am: 'የመዝሙር ትምህርት ክፍሎች',
  },
  practiceChantTabMemorize: { en: 'Memorize', am: 'አስታውስ' },
  practiceChantNowPlaying: {
    en: 'Now practicing',
    am: 'አሁን በልምምድ',
  },
  practicePlayerRegionAria: {
    en: 'Video and playback',
    am: 'ቪዲዮ እና ማጫወቻ',
  },
  practiceChantVideoLandmark: {
    en: 'Video player',
    am: 'የቪዲዮ ማጫወቻ',
  },

  prayerReaderTabsAria: {
    en: 'Prayer reading: language, summary, and notes',
    am: 'የጸሎት ክፍሎች',
  },
  prayerTabSummary: { en: 'Summary', am: 'ማጠቃለያ' },
  prayerTabNotes: { en: 'Notes', am: 'ማስታወሻ' },
  prayerTabSummaryEmpty: {
    en: 'No summary is provided for this selection in the data yet.',
    am: 'ለዚህ ምርጫ ገና ማጠቃለያ አይገኝም።',
  },
  prayerTabNotesTransliteration: {
    en: 'Transliteration',
    am: 'ፊደላት',
  },

  calendarMovableOnDaySummary: {
    en: 'Also on this day — movable (Paschal cycle)',
    am: 'በዚህ ቀን ደግሞ — የሚንቀሳቀስ (የፋሲካ ዑደት)',
  },
  calendarMovableRuleLabel: {
    en: 'Rule',
    am: 'ሥርዓት',
  },
  calendarMovablePrayerLabel: {
    en: 'Prayer',
    am: 'ጸሎት',
  },
  calendarMovableChantLabel: {
    en: 'Hymn',
    am: 'መዝሙር',
  },
  calendarDayTabsAria: {
    en: 'Day details',
    am: 'የቀን ዝርዝሮች',
  },
  calendarDayTabOverview: { en: 'Overview', am: 'አጠቃላይ' },
  calendarDayTabMeaning: { en: 'Meaning', am: 'ምክንያት' },
  calendarDayTabObservance: { en: 'Observance', am: 'አከባበር' },
  calendarDayTabPrayer: { en: 'Prayer', am: 'ጸሎት' },
  calendarDayTabChant: { en: 'Chant', am: 'መዝሙር' },
  calendarDayTabPractice: { en: 'Pray & chant', am: 'ጸሎትና መዝሙር' },
  calendarDayTabNotes: { en: 'Notes', am: 'ማስታወሻ' },
  calendarWhyMatters: { en: 'Why this day matters', am: 'ይህ ቀን ለምን ይጠቃላል' },
  calendarAtHome: { en: 'At home', am: 'በቤት' },
  calendarInParish: { en: 'In the parish', am: 'በቤተክርስቲያን' },
  calendarDayPrayerLead: {
    en: 'Continue with the Church’s daily prayer and psalmody.',
    am: 'የቤተክርስቲያን ዕለታዊ ጸሎትና መዝሙር ይቀጥሉ።',
  },
  calendarDayChantLead: {
    en: 'Open hymn practice when you are ready to sing with care.',
    am: 'በሙድ ትኩረት ለመዘምር ዝግጁ ሲሆኑ ይዘጉ።',
  },

  todayDashboardTabsAria: {
    en: 'Calendar dashboard sections',
    am: 'የቀን መቁጠሪያ ክፍሎች',
  },
  todayTabAtAGlance: { en: 'Today', am: 'ዛሬ' },
  todayTabSeason: { en: 'Season & fast', am: 'ወቅትና ጾም' },
  todayTabPastoral: { en: 'Reflection', am: 'የልብ ቃል' },
  commemorationCardTabsAria: {
    en: 'Commemoration details',
    am: 'የመታሰቢያ ዝርዝሮች',
  },
  seasonCardTabsAria: {
    en: 'Season details',
    am: 'የወቅት ዝርዝሮች',
  },

  // Common CTAs
  seeMore: { en: 'See more', am: 'ተጨማሪ ይመልከቱ' },
  browseAll: { en: 'Browse all chants', am: 'ሁሉንም ይመልከቱ' },
  backToFeatured: { en: '← Back to featured', am: '← ወደ ምርጫ ይመለሱ' },
  open: { en: 'Open', am: 'ክፈት' },
  start: { en: 'Start', am: 'ጀምር' },
  learnMore: { en: 'Learn more', am: 'የበለጠ ይወቁ' },
  watch: { en: 'Watch', am: 'ይመልከቱ' },
  opensInNewTab: {
    en: 'opens in a new tab',
    am: 'አዲስ ክፍት በመክፈት ይከፈታል',
  },
  listen: { en: 'Listen', am: 'ያዳምጡ' },
  read: { en: 'Read', am: 'ያንብቡ' },
  prayNow: { en: 'Pray now', am: 'አሁን ጸልዩ' },
  practiceVerb: { en: 'Practice', am: 'ተለማመዱ' },

  // Today / calendar (home & snapshots)
  todayInChurch: { en: 'Today in Church', am: 'ዛሬ በቤተ ክርስቲያን' },
  currentSeason: { en: 'Current season', am: 'ያለው ወቅት' },
  upcomingHolyDays: { en: 'Upcoming holy days', am: 'የሚመጡ በዓላት' },

  // Filters
  filterAll: { en: 'All', am: 'ሁሉም' },
  chantTypeMezmur: { en: 'Mezmur', am: 'መዝሙር' },
  chantTypeWerb: { en: 'Werb', am: 'ወርብ' },
  filterMarian: { en: 'Marian', am: 'የማርያም' },
  filterSaints: { en: 'Saints', am: 'ቅዱሳን' },
  filterFeastDays: { en: 'Feast Days', am: 'በዓላት' },
  filterEnglishMezmur: {
    en: 'English mezmur',
    am: 'እንግሊዝኛ መዝሙር',
  },

  // Practice helper text
  practiceChantsHelper: {
    en: 'Browse Ethiopian Orthodox hymns and practice with lyrics, videos, and learning tools.',
    am: 'የኢትዮጵያ ኦርቶዶክስ መዝሙሮችን ተመልከቱ እና በግጥሞች፣ ቪዲዮዎች እና የመማሪያ መሳሪያዎች ይለማመዱ።',
  },

  // Chants browse
  searchChants: { en: 'Search chants', am: 'መዝሙር ይፈልጉ' },
  chantSearchPlaceholder: {
    en: 'Search mezmur or werb…',
    am: 'መዝሙር ወይም ወርብ ይፈልጉ…',
  },
  chantSearchResults: {
    en: '{n} results',
    am: '{n} ውጤቶች',
  },
  chantSearchClear: { en: 'Clear search', am: 'ፍለጋ አጽዳ' },
  chantRecentSearches: {
    en: 'Recent',
    am: 'የቅርብ ጊዜ',
  },
  chantLibraryNote: {
    en: 'chants in the library — filters and search appear when you browse all.',
    am: 'መዝሙሮች በመዝገብ — ሁሉን ሲመልከቱ ፍለጋ ከማጣሪያው ጋር ይታያል።',
  },
  noMatches: {
    en: 'No matches — try another filter or fewer letters.',
    am: 'ውጤት የለም — ሌላ ማጣሪያ ወይም አነስተኛ ፊደል ይሞክሩ።',
  },
  practiceChantNoMatchTitle: {
    en: "Can’t find your mezmur?",
    am: 'መዝሙርዎን አላገኙም?',
  },
  practiceChantNoMatchDeck: {
    en:
      'Nothing in the library matched this search. You can still open the same practice tools with a YouTube link.',
    am: 'በዚህ ፍለጋ ከመዝገብ ውስጥ የተገኘ የለም። ከዩቲዩብ አገናኝ ጋር ተመሳሳይ ልምምድ ማድረግ ይችላሉ።',
  },
  practiceCustomSearchHint: {
    en: "Can’t find your mezmur?",
    am: 'መዝሙርዎን አላገኙም?',
  },
  practiceCustomOpenDrawer: {
    en: 'Practice a custom chant',
    am: 'በራስዎ መዝሙር ይለማመዱ',
  },
  practiceCustomPasteYoutubeCta: {
    en: 'Paste a YouTube link',
    am: 'የዩቲዩብ አገናኝ ይጣሉ',
  },
  practiceCustomDrawerEyebrow: {
    en: 'Outside the library',
    am: 'ከመዝገብ ውጭ',
  },
  practiceCustomDrawerTitle: {
    en: 'Custom practice from YouTube',
    am: 'በዩቲዩብ ብቻ ልምምድ',
  },
  practiceCustomDrawerDeck: {
    en:
      'Paste one video link. Lyrics, loops, and recording work the same as for library chants — optional fields below only help the learning panel.',
    am: 'አንድ የቪዲዮ አገናኝ ይጣሉ። ግጥም፣ ዙርና ቅጂ እንደ መዝገብ መዝሙር ይሰራል — ከታች ያሉት አማራጮች ለትምህርት ክፍል ብቻ ናቸው።',
  },
  practiceCustomDrawerClose: { en: 'Close', am: 'ዝጋ' },
  practiceCustomFormLabel: { en: 'Custom practice', am: 'ልምምድ ከዩቲዩብ' },
  practiceCustomLearnTab: {
    en: 'Practice with lyrics',
    am: 'ከግጥም ጋር ይለማመዱ',
  },
  practiceCustomVoiceTab: {
    en: 'Record & playback',
    am: 'ቅጂና ማጫወት',
  },
  practiceCustomUrlLabel: {
    en: 'YouTube link',
    am: 'የዩቲዩብ አገናኝ',
  },
  practiceCustomUrlPlaceholder: {
    en: 'https://www.youtube.com/watch?v=…',
    am: 'https://www.youtube.com/watch?v=…',
  },
  practiceCustomTitleOpt: { en: 'Title (optional)', am: 'ርዕስ (አማራጭ)' },
  practiceCustomTitlePlaceholder: {
    en: 'e.g. Mezmur title',
    am: 'ለምሳሌ የመዝሙር ርዕስ',
  },
  practiceCustomLyricsOpt: { en: 'Lyrics (optional)', am: 'ግጥም (አማራጭ)' },
  practiceCustomLyricsPlaceholder: {
    en: 'Ge’ez or primary script — paste if you have them.',
    am: 'ግዕዝ ወይም ዋና ጽሑፍ — ካለዎት ይጣሉ።',
  },
  practiceCustomTranslitOpt: {
    en: 'Transliteration (optional)',
    am: 'ፊደላት (አማራጭ)',
  },
  practiceCustomTranslitPlaceholder: {
    en: 'Latin letters to sing along.',
    am: 'ለመዘምር በላቲን ፊደላት።',
  },
  practiceCustomNotesOpt: {
    en: 'Short notes (optional)',
    am: 'አጭር ማስታወሻ (አማራጭ)',
  },
  practiceCustomNotesPlaceholder: {
    en: 'Context, feast day, or reminders for the learning panel.',
    am: 'ለትምህርት ክፍል አጋዥ ማስታወሻ።',
  },
  practiceCustomOptionalDetails: {
    en: 'Title, lyrics, transliteration, notes (optional)',
    am: 'ርዕስ፣ ግጥም፣ ፊደላት፣ ማስታወሻ (አማራጭ)',
  },
  practiceCustomLoadVideo: { en: 'Load video', am: 'ቪዲዮ ጫን' },
  practiceCustomErrMissing: {
    en: 'Paste a YouTube link or video ID to begin.',
    am: 'ለመጀመር የዩቲዩብ አገናኝ ወይም የቪዲዮ መለያ ይጣሉ።',
  },
  practiceCustomErrInvalid: {
    en:
      'That link does not look like a valid YouTube video. Try a watch URL, youtu.be link, Shorts, embed, or the 11-character video ID.',
    am: 'ይህ አገናኝ የዩቲዩብ ቪዲዮ አይመስልም። watch፣ youtu.be፣ Shorts፣ embed ወይም 11 ፊደል መለያ ይሞክሩ።',
  },

  // Chants section imagery (compact captions)
  captionMezmurLearning: { en: 'Mezmur', am: 'መዝሙር' },
  captionWerbLearning: { en: 'Werb', am: 'ወርብ' },

  // Player & lyrics
  playerBack: { en: '← Chants library', am: '← ወደ መዝሙር ዝርዝር' },
  lyricsTextHeading: { en: 'Text', am: 'ጽሑፍ' },
  lyricsLyrics: { en: 'Lyrics', am: 'ግጥም' },
  lyricsTransliteration: { en: 'Transliteration', am: 'ፊደላት' },
  lyricsBoth: { en: 'Both', am: 'ሁለቱም' },
  lyricsNoTrans: {
    en: 'Transliteration is not available for this chant.',
    am: 'ለዚህ መዝሙር ፊደላት አይገኙም።',
  },

  volume: { en: 'Volume', am: 'ድምጽ' },
  speed: { en: 'Speed', am: 'ፍጥነት' },
  play: { en: 'Play', am: 'አጫውት' },
  pause: { en: 'Pause', am: 'ያቆም' },

  // Loop practice
  loopLegend: { en: 'Loop practice', am: 'የዙር ልምምድ' },
  loopSectionNameLabel: { en: 'Saved loop name', am: 'የተቀመጠ ዙር ስም' },
  markStart: { en: 'Mark start', am: 'መጀመሪያ ምልክት አድርግ' },
  markEnd: { en: 'Mark end', am: 'መጨረሻ ምልክት አድርግ' },
  playLoop: { en: 'Play loop', am: 'ዙር አጫውት' },
  stopLoop: { en: 'Stop loop', am: 'ዙር ያስቆሙ' },
  clearLoop: { en: 'Clear marks', am: 'ዙሩን አጥፋ' },
  saveLoop: { en: 'Save loop', am: 'ዙር አስቀምጥ' },
  savedLoops: { en: 'Saved loops', am: 'የተቀመጡ ዙሮች' },
  loopPlay: { en: 'Play', am: 'አጫውት' },
  loopLoad: { en: 'Load', am: 'ጫን' },
  loopDelete: { en: 'Delete', am: 'ሰርዝ' },
  loopTimeStart: { en: 'Start', am: 'መጀመሪያ' },
  loopTimeEnd: { en: 'End', am: 'መጨረሻ' },
  loopFullVideo: { en: 'Full video', am: 'ሙሉ ቪዲዮ' },
  loopAutoSplit: { en: 'Auto split into 3', am: 'ወደ 3 ክፍሎች ይከፍሉ' },
  loopSection1: { en: 'Section 1', am: 'ክፍል 1' },
  loopSection2: { en: 'Section 2', am: 'ክፍል 2' },
  loopSection3: { en: 'Section 3', am: 'ክፍል 3' },
  loopAutoSplitLegend: {
    en: 'Practice sections',
    am: 'የልምምድ ክፍሎች',
  },

  // Instruments / dialogs
  openGuide: { en: 'Open guide', am: 'መመሪያ ክፈት' },

  // Tselot filters
  tselotAll: { en: 'All', am: 'ሁሉም' },

} as const

export type UiLabelKey = keyof typeof UI_LABELS

export function labelForLocale(
  locale: AppLocale,
  key: UiLabelKey,
): string {
  const row = UI_LABELS[key]
  return locale === 'am' ? row.am : row.en
}

/** Hook: `const t = useUiLabel(); t('navHome')` */
export function useUiLabel() {
  const { locale } = useLocale()
  return useCallback(
    (key: UiLabelKey) => labelForLocale(locale, key),
    [locale],
  )
}
