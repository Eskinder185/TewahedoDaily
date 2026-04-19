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
  navPractice: { en: 'Practice', am: 'ተለማመዱ' },
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
  tabTselot: { en: 'Tselot', am: 'ጸሎት' },
  tabMovement: { en: 'Movement', am: 'እንቅስቃሴ' },
  practiceHeadTitle: {
    en: 'Chants & movement',
    am: 'መዝሙር እና እንቅስቃሴ',
  },
  practiceHeadDeck: {
    en:
      'Mezmur, werb, and instruments — focused practice. For prayer texts and tselot, use Daily Prayers.',
    am: 'መዝሙር፣ ወርብ እና እንቅስቃሴ። ለጸሎት ጽሑፎች ለዕለታዊ ጸሎቶች ይሂዱ።',
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
  practiceJourneyStep3Title: { en: 'Learn the movement', am: 'እንቅስቃሴ ይማሩ' },
  practiceJourneyStep3Body: {
    en:
      'Movement tips beside the lyrics; reverent posture for werb, unity with the choir for mezmur. The Movement tab adds rhythm clips and context.',
    am: 'ከጽሑፍ ጋር የእንቅስቃሴ ምክሮች፤ ለወርብ ትኩረት፣ ለመዝሙር ከመዘመራ ጋር አንድነት። እንቅስቃሴ ትር የዜማ ቅጂዎችን ያክላል።',
  },
  practiceJourneyStep4Title: {
    en: 'Practice with confidence',
    am: 'በታማኝነት ይለማመዱ',
  },
  practiceJourneyStep4Body: {
    en:
      'Return to the same chant through the week — repetition is a small asceticism. What you memorize becomes prayer in the nave.',
    am: 'በሳምንቱ ወደዚያው መዝሙር ይመለሱ — ድግግሞሽ ትንሽ ጾም ነው። የሚተረጉሙት ጸሎት ይሆናል።',
  },
  practiceJourneyFoot: {
    en: ' — for scripture prayers, tselot, and holy reading beyond this practice space.',
    am: ' — ለመጽሐፍ ጸሎት፣ ጸሎትና ቅዱስ ንባብ ከዚህ ልምምድ ውጭ።',
  },
  practiceChantsHelper: {
    en:
      'Choose a chant to open the player: memorization tools and recording beside the video.',
    am: 'መዝሙር ይምረጡ — በቪዲዮ አጠገብ የማስታወስ መሳሪያዎች እና ቅጂ።',
  },
  practiceMovementLead: {
    en:
      'Rhythm clips and chant-specific movement notes — a calm path beside the Chants tab.',
    am: 'የዜማ ቅጂዎች እና የመዝሙር እንቅስቃሴ ምክሮች — ከመዝሙር ትር ጋር የሚረዳ መንገድ።',
  },
  practiceMovementSupportEyebrow: {
    en: 'Rhythm & movement support',
    am: 'የዜማና እንቅስቃሴ ድጋፍ',
  },
  practiceMovementSupportDeck: {
    en:
      'Short videos for timing and coordination. They support your practice; they do not replace parish guidance or liturgical leadership.',
    am: 'ለጊዜና ለአቻፈርም አጭር ቪዲዮዎች። የአካባቢ መመሪያ አይተካም።',
  },
  practiceMovementVideoTag: {
    en: 'Learning video',
    am: 'የትምህርት ቪዲዮ',
  },
  practiceMovementVideoSubtitle: {
    en: 'Rhythm & movement',
    am: 'ዜማና እንቅስቃሴ',
  },
  practiceMovementMezmurTipsTitle: {
    en: 'Mezmur movement tips',
    am: 'የመዝሙር እንቅስቃሴ ምክሮች',
  },
  practiceMovementMezmurTipsBody: {
    en:
      'In the chant library, open any mezmur and use the Movement tab for posture, sway, and ensemble habits — modesty before spectacle.',
    am:
      'በመዝሙር ዝርዝር ማንኛውንም መዝሙር ክፈቱ፣ የእንቅስቃሴ ክፍል ለአቋምና ለጋራ ዜማ ይጠቀሙ።',
  },
  practiceMovementWerbTipsTitle: {
    en: 'Werb movement tips',
    am: 'የወርብ እንቅስቃሴ ምክሮች',
  },
  practiceMovementWerbTipsBody: {
    en:
      'For werb, open a piece and read Movement steps: feet, spine, and attention stay with the Word. Stillness and clarity come first.',
    am:
      'ለወርብ ዕቃ ክፈቱ እና የእንቅስቃሴ እርምጃዎችን ያንብቡ። ቃሉ በቅድሚያ ነው።',
  },
  practiceMovementOpenChants: {
    en: 'Open the chant library',
    am: 'የመዝሙር ዝርዝር ይክፈቱ',
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

  prayerReaderTabsAria: {
    en: 'Prayer text sections',
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
    en: 'Chant',
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
    en: 'Open chant practice when you are ready to sing with care.',
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
  filterEnglishMezmur: {
    en: 'English mezmur',
    am: 'እንግሊዝኛ መዝሙር',
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
