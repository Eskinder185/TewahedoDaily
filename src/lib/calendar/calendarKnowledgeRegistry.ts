/**
 * TEWAHEDODAILY — CANONICAL ORTHODOX CALENDAR KNOWLEDGE REGISTRY
 *
 * Exhaustive, bilingual, authoritative knowledge base covering:
 * - All 30 Recurring Monthly Commemorations (Days 1–30)
 * - Major Christological Feasts (በዓላተ እግዚእ)
 * - Major Marian Feasts (በዓላተ እግዝእትነ ማርያም)
 * - Major Angelic, Apostolic, Martyr & Monastic Feasts
 * - Canonical Fasts & Liturgical Seasons
 *
 * Each record provides the complete 11-section educational structure:
 * 1. What is this? (whatIsIt / whatIsItAmharic)
 * 2. Historical background / The story (historicalBackground / historicalBackgroundAmharic)
 * 3. Why the Church commemorates it (whyCelebrated / whyCelebratedAmharic)
 * 4. Theological meaning (theologicalMeaning / theologicalMeaningAmharic)
 * 5. Traditions and practices (traditionsPractices / traditionsPracticesAmharic)
 * 6. Important information (importantInformation / importantInformationAmharic)
 * 7. Fasting rules & context (fastingNotes / fastingNotesAmharic)
 * 8. Bible connections (scriptureReferences)
 * 9. Related Mezmurs (relatedMezmurs / relatedMezmursAmharic)
 * 10. Related prayers & Church documents (relatedPrayers / relatedPrayersAmharic)
 * 11. Authoritative sources & citations (sources / sourcesAmharic)
 */

import { CHRIST_AND_CROSS_ARTICLES } from './knowledge/christFeasts'
import { MARIAN_FEAST_ARTICLES } from './knowledge/marianFeasts'
import { ANGELIC_AND_SAINTS_ARTICLES } from './knowledge/angelicAndSaints'
import { LENT_AND_HOLY_WEEK_ARTICLES } from './knowledge/lentAndHolyWeek'
import { FASTS_AND_SEASONS_ARTICLES } from './knowledge/fastsAndSeasons'

export interface CalendarKnowledgeArticle {
  slug: string
  title: string
  titleAmharic: string
  category: 'christ' | 'marian' | 'angel' | 'saint' | 'fast' | 'season' | 'cross' | 'apostle' | 'prophet' | 'patriarch'
  ethiopianMonthNumber?: number | null
  ethiopianDay?: number | null
  isMonthly?: boolean
  isMajor?: boolean
  isMovable?: boolean

  summary: string
  summaryAmharic: string

  whatIsIt: string
  whatIsItAmharic: string

  historicalBackground: string
  historicalBackgroundAmharic: string

  whyCelebrated: string
  whyCelebratedAmharic: string

  theologicalMeaning: string
  theologicalMeaningAmharic: string

  traditionsPractices: string
  traditionsPracticesAmharic: string

  importantInformation: string
  importantInformationAmharic: string

  fastingNotes?: string | null
  fastingNotesAmharic?: string | null

  scriptureReferences: string
  relatedMezmurs?: string | null
  relatedPrayers?: string | null
  sources: string
  sourcesAmharic: string

  researchStatus: 'source_verified' | 'approved' | 'published'
}

/**
 * Registry of Canonical Monthly Commemorations (Days 1 to 30)
 */
export const MONTHLY_COMMEMORATION_ARTICLES: Record<number, CalendarKnowledgeArticle> = {
  1: {
    slug: 'monthly-day-01-lideta-raguel-elias',
    title: 'Lideta Maryam, Archangel Raguel & Prophet Elijah',
    titleAmharic: 'ልደታ ለማርያም፣ ቅዱስ ራጉኤል እና ነቢዩ ኤልያስ',
    category: 'marian',
    ethiopianDay: 1,
    isMonthly: true,
    summary: 'The first day of every Ethiopian month honors the Nativity of the Theotokos (Lideta), the Archangel Raguel (the angel of light), and the righteous Prophet Elijah.',
    summaryAmharic: 'የእያንዳንዱ የኢትዮጵያ ወር የመጀመሪያ ቀን የእመቤታችን የድንግል ማርያም ልደት (ልደታ)፣ የብርሃናት አለቃ ቅዱስ ራጉኤል እና የነቢዩ ኤልያስ መታሰቢያ ሆኖ በታላቅ ክብር ይታሰባል።',
    whatIsIt: 'Day 1 of the Ethiopian month is dedicated primarily to Lideta le-Maryam (the Nativity of the Blessed Virgin Mary), alongside the Archangel Raguel and the Holy Prophet Elijah (Elias Zelotes). It marks the dawn of renewal in the monthly liturgical rhythm.',
    whatIsItAmharic: 'በኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተክርስቲያን የወሩ መጀመሪያ (፩) ቀን የእመቤታችን የቅድስት ድንግል ማርያም የልደት መታሰቢያ፣ የመላእክት አለቃ የቅዱስ ራጉኤል እንዲሁም የእሳተ ነቢዩ የኤልያስ ዝክር ነው።',
    historicalBackground: 'According to Holy Tradition recorded in the Synaxarium and the Book of the Nativity of Mary (Metsihafe Lideta), righteous Joachim and Hanna prayed for decades in fasting and tears. God answered their supplication through the conception and birth of Mary, the Rod of Jesse. Saint Elijah is remembered for his zeal on Mount Carmel and his bodily assumption into heaven, while Raguel is named in the Book of Enoch (Metsihafe Henok) as the archangel overseeing the luminaries and divine justice.',
    historicalBackgroundAmharic: 'በቤተክርስቲያን ትውፊትና በስንክሳር እንደተመዘገበው ጻድቃኑ ኢያቄምና ሐና ለብዙ ዓመታት በመካንነት አዝነው ሲጸልዩ ቆይተው እግዚአብሔር ጸሎታቸውን ሰምቶ ድንግል ማርያምን ሰጣቸው። ነቢዩ ኤልያስ በቀርሜሎስ ተራራ በእውነተኛ አምልኮት ቀናተኛ ሆኖ በእሳት ሰረገላ ወደ ሰማይ የተነጠቀ ታላቅ ነቢይ ሲሆን፣ ቅዱስ ራጉኤል ደግሞ በመጽሐፈ ሄኖክ እንደተገለጠው የብርሃናት አለቃ ነው።',
    whyCelebrated: 'The Church celebrates Lideta because Mary’s birth is the harbinger of salvation: through her was born Jesus Christ, the Sun of Righteousness. Commemorating Elijah and Raguel inspires the faithful toward spiritual courage and purity of prayer.',
    whyCelebratedAmharic: 'ድንግል ማርያም የድኅነታችን መጀመሪያ፣ የጠፋውን ዓለም የሚያድን የጽድቅ ፀሐይ ክርስቶስ የተገኘባት በመሆኗ ልደቷ በየወሩ በደስታ ይከበራል። የነቢዩ ኤልያስ ጽናትና የቅዱስ ራጉኤል ተራዳኢነትም ለምእመናን ታላቅ ብርታት ይሰጣል።',
    theologicalMeaning: 'The Nativity of the Theotokos represents the turning point of salvation history—the restoration of human nature freed from sorrow. In Geʽez hymnody, Mary is called the "New Heaven" (Semay Hadis) and the "Ark of the Covenant" (Tabot).',
    theologicalMeaningAmharic: 'የእመቤታችን መወለድ የሰው ልጅ ከኀዘን ወደ ደስታ የተሸጋገረበት የድኅነት መጀመሪያ ነው። በያሬዳዊ ዜማ "ሐዲስ ሰማይ" ተብላ ትጠራለች፤ በእርሷም የአብ ቃል ሥጋ ለብሷል።',
    traditionsPractices: 'Believers gather for the Divine Liturgy (Qiddase), chant the Deggwa and Mahlet of Lideta, prepare communal loaves of bread (hibist/dabbo) blessed in memory of Hanna and Joachim, and beseech the intercession of Saint Mary.',
    traditionsPracticesAmharic: 'በዚህ ዕለት በቤተክርስቲያን ማኅሌተ ጽጌና ቅዳሴ ይሰረዛል፤ ምእመናን በሐናና ኢያቄም ስም እንጀራና ኅብስት አዘጋጅተው ለድሆች ይመግባሉ፤ ጸሎተ ማርያምንም ያደርሳሉ።',
    importantInformation: 'The major annual feast of Lideta is celebrated on Ginbot 1 (May 9). The monthly remembrance on the 1st of each month is an unbroken renewal of this joy.',
    importantInformationAmharic: 'ዋነኛው የልደታ ዓመታዊ በዓል ግንቦት ፩ ቀን በድምቀት ይከበራል። በየወሩ የሚከበረው ግን ያንኑ ዓመታዊ በረከት የምናስብበት ቀጣይነት ያለው መታሰቢያ ነው።',
    fastingNotes: 'Observed under the seasonal rules of the current month. Regular Wednesday and Friday fasts remain in full effect unless coinciding with the Fifty Paschal Days (Filsata).',
    fastingNotesAmharic: 'እንደ ወሩ ወቅት ሥርዓት ይጾማል። ረቡዕ ወይም ዓርብ ከዋለ መደበኛ የጾም ሕግ ይከበራል።',
    scriptureReferences: 'Isaiah 11:1-10; Luke 1:26-38; Galatians 4:1-7; Psalm 45:10-17',
    relatedMezmurs: 'Lideta Maryam Emebetachen; Awqewalehu Dejishin',
    relatedPrayers: 'Widdase Maryam (Praise of Mary - Sunday/Monday); Melka Maryam',
    sources: 'Ethiopian Synaxarium (Meskerem 1 & Ginbot 1); Metsihafe Henok; Metsihafe Lideta; Mahibere Kidusan Publications',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (መስከረም ፩ እና ግንቦት ፩)፤ መጽሐፈ ሄኖክ፤ መጽሐፈ ልደታ፤ የማኅበረ ቅዱሳን ድረ-ገጽ',
    researchStatus: 'published'
  },
  2: {
    slug: 'monthly-day-02-thaddeus-apostle',
    title: 'Apostle Thaddeus (Addai)',
    titleAmharic: 'ቅዱስ ታዴዎስ ሐዋርያ',
    category: 'apostle',
    ethiopianDay: 2,
    isMonthly: true,
    summary: 'Day 2 of each month commemorates Saint Thaddeus (Jude/Addai), one of the Twelve Apostles who preached the Gospel in Mesopotamia and Syria.',
    summaryAmharic: 'የወሩ ሁለተኛ ቀን ከዐሥራ ሁለቱ ሐዋርያት አንዱ የሆነውና በሜሶጶጣሚያና በሶርያ ወንጌልን የሰበከው የቅዱስ ታዴዎስ ሐዋርያ መታሰቢያ ነው።',
    whatIsIt: 'The monthly commemoration of Saint Thaddeus, apostle of Christ and preacher of the Kingdom of God, martyred for his unwavering testimony.',
    whatIsItAmharic: 'ከጌታችን ከኢየሱስ ክርስቶስ ዐሥራ ሁለት ሐዋርያት አንዱ የሆነውና ክብርና ሕይወቱን ለወንጌል የሰጠው የቅዱስ ታዴዎስ ሐዋርያ ወርሃዊ ዝክር ነው።',
    historicalBackground: 'Saint Thaddeus (also known as Lebbaeus and Jude, brother of James) evangelized Edessa, healing King Abgar and establishing the Church across northern Mesopotamia before sealing his mission with martyrdom.',
    historicalBackgroundAmharic: 'ቅዱስ ታዴዎስ ንጉሥ አብጋርን በማጥመቅና ፈውሶችን በማድረግ በኤዴሳና በፋርስ ምድር ወንጌልን አስፋፍቶ በመጨረሻም በሰማዕትነት አርፏል።',
    whyCelebrated: 'To honor the apostolic foundation of the Church and draw courage from the steadfastness of the eyewitnesses of the Lord.',
    whyCelebratedAmharic: 'የቤተክርስቲያንን ሐዋርያዊ መሠረት ለማሰብና የክርስቶስን የትንሣኤ ምስክሮች ተጋድሎ ምሳሌ ለማድረግ ይከበራል።',
    theologicalMeaning: 'The Church is built upon the foundation of the apostles and prophets, Jesus Christ Himself being the chief cornerstone (Ephesians 2:20).',
    theologicalMeaningAmharic: 'ቤተክርስቲያን በሐዋርያትና በነቢያት መሠረት ላይ የታነጸች፣ የማዕዘኑም ራስ ራሱ ኢየሱስ ክርስቶስ እንደ ሆነ እናምናለን (ኤፌ ፪፥፳)።',
    traditionsPractices: 'Priestly remembrance in the Liturgy, reading from the Epistles of the Apostles, and prayers for steadfastness in the Orthodox faith.',
    traditionsPracticesAmharic: 'በቅዳሴ ጊዜ ሐዋርያት ይታሰባሉ፤ መልእክተ ሐዋርያት ይነበባል፤ ምእመናንም በሃይማኖት እንዲጸኑ ይጸልያሉ።',
    importantInformation: 'Often distinguished from Thaddeus of the Seventy disciples; the Ethiopian Church reveres him among the Twelve.',
    importantInformationAmharic: 'ከሰባ ሁለቱ አርድእት ከሚቆጠረው ታዴዎስ ጋር እንዳይቀላቀል ይጠነቀቃል፤ ይህኛው ከዐሥራ ሁለቱ ሐዋርያት አንዱ ነው።',
    scriptureReferences: 'Matthew 10:1-4; Jude 1:1-25; Acts 1:12-14',
    sources: 'Ethiopian Synaxarium (Sene 2); Eusebius Ecclesiastical History; Fetha Negest',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (ሰኔ ፪)፤ የቤተክርስቲያን ታሪክ (አውሳብዮስ)፤ ፍትሐ ነገሥት',
    researchStatus: 'published'
  },
  3: {
    slug: 'monthly-day-03-baata-maryam-phanuel',
    title: 'Ba’ata Maryam (Presentation) & Archangel Phanuel',
    titleAmharic: 'በዓታ ለማርያም እና ቅዱስ ፋኑኤል',
    category: 'marian',
    ethiopianDay: 3,
    isMonthly: true,
    summary: 'Day 3 celebrates the Entry of the Virgin Mary into the Temple at age three (Ba’ata) and the intercession of the Archangel Phanuel who fed her heavenly manna.',
    summaryAmharic: 'የወሩ ፫ኛ ቀን እመቤታችን በሦስት ዓመቷ ወደ ቤተ መቅደስ የገባችበት (በዓታ) እና በዚያም በሰማያዊ ኅብስት የመገባት የቅዱስ ፋኑኤል መታሰቢያ ነው።',
    whatIsIt: 'The monthly feast commemorating the Entrance of the Three-Year-Old Theotokos into the Holy of Holies in Jerusalem, where she dwelt for twelve years in prayer, purity, and contemplation.',
    whatIsItAmharic: 'እመቤታችን ቅድስት ድንግል ማርያም በሦስት ዓመቷ በእግዚአብሔር ቤተ መቅደስ የገባችበትና እስከ አሥራ ሁለት ዓመቷ በቅድስና ያደገችበት፣ መልአኩ ቅዱስ ፋኑኤልም ያገለገላት ታላቅ በዓል ነው።',
    historicalBackground: 'Righteous Joachim and Hanna fulfilled their vow to dedicate their only child to the Lord. At the temple gates, the high priest Zechariah received the young maiden and led her into the sanctuary, where the Archangel Phanuel ministered to her with heavenly food.',
    historicalBackgroundAmharic: 'ኢያቄምና ሐና ስእለታቸውን ለመፈጸም ሕፃኗን ማርያምን ይዘው ወደ ቤተ መቅደስ ወሰዷት፤ ሊቀ ካህናቱ ዘካርያስም ተቀብሎ ወደ ቅድስተ ቅዱሳን አገባት፤ ቅዱስ ፋኑኤልም ሰማያዊ ምግብ ይመግባት ነበር።',
    whyCelebrated: 'To honor the spiritual vessel chosen before all ages to become the dwelling place of the Uncontainable God, teaching the faithful dedicated purity and monastic retirement.',
    whyCelebratedAmharic: 'የማይወሰነው አምላክ ማደሪያ ትሆን ዘንድ በንጽሕና ያደገችበትን ምሥጢር ለማክበርና ምእመናን ሕይወታቸውን ለእግዚአብሔር ቤተ መቅደስ እንዲቀድሱ ለማስተማር ነው።',
    theologicalMeaning: 'Mary is the true Ark who superseded the earthly tabernacle. In her, the temple rituals found their fulfillment, as she herself became the living temple of the Incarnate Logos.',
    theologicalMeaningAmharic: 'እመቤታችን በታቦተ ጽዮን የተመሰለች እውነተኛ የእግዚአብሔር ማደሪያ ናት። በቤተ መቅደስ ያሳለፈችው ሕይወት ለድኅነት ዓለም የተዘጋጀችበት ምሥጢር ነው።',
    traditionsPractices: 'Hymns from Mahlete Tsige and Deggwa; reading of the narrative of Ba’ata; children and mothers seek special blessings for their spiritual growth.',
    traditionsPracticesAmharic: 'የበዓታ ማኅሌትና ቅዳሴ ይቆማል፤ ምእመናን ልጆቻቸውን ለቤተክርስቲያን አገልግሎት እንዲሰጡ ስእለት ያደርጋሉ።',
    importantInformation: 'The major annual feast of Ba’ata is Tahsas 3 (December 12). The monthly feast on the 3rd renews this devotion every month.',
    importantInformationAmharic: 'ዋነኛው ዓመታዊ የበዓታ በዓል ታኅሣሥ ፫ ቀን በታላቅ ክብር ይከበራል።',
    scriptureReferences: 'Psalm 45:9-17; Luke 1:39-56; 1 Samuel 1:21-28',
    sources: 'Ethiopian Synaxarium (Tahsas 3); Protoevangelium of James; Metsihafe Qiddase',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (ታኅሣሥ ፫)፤ ትውፊተ ቤተክርስቲያን፤ መጽሐፈ ቅዳሴ',
    researchStatus: 'published'
  },
  4: {
    slug: 'monthly-day-04-john-son-of-thunder-andrew',
    title: 'Saint John the Evangelist & Apostle Andrew',
    titleAmharic: 'ቅዱስ ዮሐንስ ወልደ ነጎድጓድ እና ቅዱስ እንድርያስ',
    category: 'apostle',
    ethiopianDay: 4,
    isMonthly: true,
    summary: 'Day 4 honors Saint John the Beloved (Son of Thunder), author of the Fourth Gospel and Revelation, alongside the First-Called Apostle Andrew.',
    summaryAmharic: 'የወሩ አራተኛ ቀን ጌታን ደረቱ ላይ የተደገፈው ባለራእዩ ቅዱስ ዮሐንስ ወልደ ነጎድጓድ እና መጀመሪያ የተጠራው ሐዋርያው ቅዱስ እንድርያስ መታሰቢያ ነው።',
    whatIsIt: 'The monthly commemoration of Saint John the Apostle, Evangelist, and Theologian, and Saint Andrew the First-Called Apostle.',
    whatIsItAmharic: 'የፍቅር ሐዋርያና ባለራእይ የሆነው የቅዱስ ዮሐንስ ወንጌላዊ እንዲሁም የቅዱስ እንድርያስ ሐዋርያ ወርሃዊ በዓል ነው።',
    historicalBackground: 'John stood faithfully at the foot of the Cross, where Jesus entrusted the Blessed Virgin Mary to his care. Exiled to Patmos, he received the Apocalypse. Andrew preached throughout Byzantium, the Black Sea regions, and Greece, suffering martyrdom on an X-shaped cross.',
    historicalBackgroundAmharic: 'ቅዱስ ዮሐንስ በመስቀሉ ሥር ተገኝቶ እመቤታችንን በአደራ የተቀበለ ታማኝ ደቀ መዝሙር ሲሆን በጳጥሞስ ደሴት ራእይን ተመልክቷል። ቅዱስ እንድርያስም በግሪክና በጥቁር ባሕር አካባቢ ወንጌልን ሰብኮ በመስቀል ላይ ሰማዕት ሆኗል።',
    whyCelebrated: 'To remember the proclamation of divine love ("God is love") and the courageous missionary zeal that planted the Church among the nations.',
    whyCelebratedAmharic: 'እግዚአብሔር ፍቅር መሆኑን ያስተማረውን ሐዋርያ ፍቅር ለማሰብና በቅንዓት ወንጌልን የማዳረስ ኃላፊነትን ለማስታወስ ነው።',
    theologicalMeaning: 'John is called the Theologian (Nebbebe Melekot) because his Gospel ascends directly to the eternal divinity of the Word: "In the beginning was the Word, and the Word was with God, and the Word was God."',
    theologicalMeaningAmharic: 'ዮሐንስ "በመጀመሪያ ቃል ነበረ" በማለት የክርስቶስን የዘላለም አምላክነት በጥልቀት በመመስከሩ "ነባቢ መለኮት" ተብሎ ይጠራል።',
    traditionsPractices: 'Reading the Gospel and Epistles of John; prayers for love, unity, and divine revelation.',
    traditionsPracticesAmharic: 'የዮሐንስ ወንጌልና መልእክታት ይነበባሉ፤ በፍቅርና በሰላም ለመኖር ጸሎት ይደረጋል።',
    importantInformation: 'The annual repose of Saint John is celebrated on Tir 4; his translation on Ginbot 4. Andrew’s annual feast is Tahsas 4.',
    importantInformationAmharic: 'የቅዱስ ዮሐንስ ዕረፍት ጥር ፬ ቀን፣ የቅዱስ እንድርያስ ዓመታዊ ሰማዕትነት ታኅሣሥ ፬ ቀን ይከበራል።',
    scriptureReferences: 'John 1:1-14; John 19:25-27; 1 John 4:7-21; Revelation 1:1-20',
    sources: 'Ethiopian Synaxarium (Tir 4, Tahsas 4, Ginbot 4); Eusebius',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (ጥር ፬፣ ታኅሣሥ ፬፣ ግንቦት ፬)፤ የቤተክርስቲያን ታሪክ',
    researchStatus: 'published'
  },
  5: {
    slug: 'monthly-day-05-gebre-menfes-kidus-peter-paul',
    title: 'Abune Gebre Menfes Kidus, Peter & Paul',
    titleAmharic: 'አቡነ ገብረ መንፈስ ቅዱስ፣ ቅዱስ ጴጥሮስ እና ቅዱስ ጳውሎስ',
    category: 'saint',
    ethiopianDay: 5,
    isMonthly: true,
    summary: 'Day 5 celebrates the Egyptian-born Ethiopian desert father Abune Gebre Menfes Kidus (Abo) and the chiefs of the Apostles, Saints Peter and Paul.',
    summaryAmharic: 'የወሩ አምስተኛ ቀን ታላቁ ጻድቅ አቡነ ገብረ መንፈስ ቅዱስ (አቦ) እንዲሁም የሐዋርያት አለቆች የቅዱስ ጴጥሮስና ቅዱስ ጳውሎስ መታሰቢያ ነው።',
    whatIsIt: 'The monthly feast commemorating the ascetic struggles of Abune Gebre Menfes Kidus who lived in the wilderness of Mount Ziquala prayerfully interceding for Ethiopia, alongside the Apostles Peter and Paul.',
    whatIsItAmharic: 'በዝቋላ ተራራና በምድረ ከብድ ለኢትዮጵያና ለዓለም በብርቱ ተጋድሎ የጸለዩት የጻድቁ አቡነ ገብረ መንፈስ ቅዱስ እና የሐዋርያት አለቆች የጴጥሮስና ጳውሎስ ወርሃዊ በዓል ነው።',
    historicalBackground: 'Born in Nihisa, Egypt, Abune Gebre Menfes Kidus walked in absolute detachment from worldly desires, clothed only in his hair. He traveled to Ethiopia, dwelling among wild beasts on Mount Ziquala, praying for 100 years until God granted him the covenant that those who call upon his name shall be pardoned. Peter and Paul were martyred in Rome under Nero.',
    historicalBackgroundAmharic: 'አቡነ ገብረ መንፈስ ቅዱስ ከግብፅ ተነሥተው ወደ ኢትዮጵያ በመምጣት በዝቋላ ተራራ ላይ አናብስትና አናምርት እየተከተሏቸው በጸሎት ተጋድለዋል። እግዚአብሔርም ስማቸውን ለሚጠሩ የይቅርታ ቃልኪዳን ሰጥቷቸዋል።',
    whyCelebrated: 'To seek the intercession of the righteous hermit whose prayers preserve the land, and to venerate the pillars of the apostolic mission.',
    whyCelebratedAmharic: 'የጻድቁን የቃልኪዳን በረከት ለመካፈል፣ አገራችንን በጸሎታቸው እንዲጠብቁ ለመማፀንና የሐዋርያትን መሠረት ለማሰብ ነው።',
    theologicalMeaning: 'The monastic life in the Ethiopian Orthodox tradition represents the angelic life (Tsiwate Melakt) on earth, a witness to total surrender to Christ through fasting, ceaseless prayer, and cross-bearing.',
    theologicalMeaningAmharic: 'የምንኵስና ሕይወት በመላእክታዊ አምሳል የተመሠረተ ፍጹም የእግዚአብሔር አገልግሎትና የመስቀል ተጋድሎ ምስክርነት ነው።',
    traditionsPractices: 'Pilgrimage to Ziquala monastery; chanting of "Gedle Gebre Menfes Kidus"; distribution of blessed boiled grains (nifro) and bread.',
    traditionsPracticesAmharic: 'ወደ ዝቋላና ወደ ደብረ ከብድ መሄድ፤ ንፍሮና ኅብስት በማዘጋጀት መመገብ፤ ገድላቸውን በማንበብ መዘከር።',
    importantInformation: 'The annual feasts are Tikimt 5 (arrival in Ethiopia) and Megabit 5 (repose). Monthly Day 5 brings thousands of pilgrims to Abo churches.',
    importantInformationAmharic: 'ዓመታዊ በዓሎቻቸው ጥቅምት ፭ (ወደ ኢትዮጵያ የመጡበት) እና መጋቢት ፭ (ዕረፍታቸው) ናቸው።',
    scriptureReferences: 'Hebrews 11:32-40; Matthew 16:13-19; 2 Timothy 4:6-8',
    sources: 'Gedle Gebre Menfes Kidus; Ethiopian Synaxarium (Megabit 5 & Tikimt 5); Mahibere Kidusan',
    sourcesAmharic: 'ገድለ ገብረ መንፈስ ቅዱስ፤ መጽሐፈ ስንክሳር (መጋቢት ፭ እና ጥቅምት ፭)',
    researchStatus: 'published'
  },
  6: {
    slug: 'monthly-day-06-qusquam-eyesus-arsema',
    title: 'Debre Qusquam, Eyesus & Saint Arsema',
    titleAmharic: 'ደብረ ቍስቋም፣ ኢየሱስ እና ቅድስት አርሴማ',
    category: 'christ',
    ethiopianDay: 6,
    isMonthly: true,
    summary: 'Day 6 commemorates the Holy Family’s refuge at Mount Qusquam in Upper Egypt, the saving Name of Jesus (Eyesus), and the heroic martyr Saint Arsema (Rhipsime).',
    summaryAmharic: 'የወሩ ስድስተኛ ቀን ቅዱስ ቤተሰብ በስደት ያረፉበት የደብረ ቍስቋም፣ የጌታችን የኢየሱስ እና የሰማዕቷ የቅድስት አርሴማ መታሰቢያ ነው።',
    whatIsIt: 'The monthly feast celebrating the resting place of the Infant Christ and the Virgin Mary at Mount Qusquam, the sacred humanity of Jesus, and the purity and steadfast martyrdom of Saint Arsema.',
    whatIsItAmharic: 'እመቤታችን ከልጇ ከወዳጇ ጋር በስደት ተንከራታ ያረፈችበት የደብረ ቍስቋም በረከት፣ የክርስቶስ ቅዱስ ስም እና የሰማዕቷ የአርሴማ ወርሃዊ መታሰቢያ ነው።',
    historicalBackground: 'Escaping Herod’s massacre, the Holy Family fled to Egypt, dwelling for six months at Mount Qusquam where a church was later consecrated by Christ Himself. Saint Arsema was a consecrated virgin who refused marriage to Emperor Diocletian and King Tiridates of Armenia, enduring excruciating tortures rather than compromise her bridal fidelity to Christ.',
    historicalBackgroundAmharic: 'ከሄሮድስ ሰይፍ ሸሽተው ወደ ግብፅ የተሰደዱት እመቤታችንና ልጇ በደብረ ቍስቋም ተቀምጠዋል። ቅድስት አርሴማም ለክርስቶስ ያላትን ድንግልና ለመጠበቅ በዲዮቅልጥያኖስና በድርጣድስ ፊት ጸንታ ሰማዕት ሆናለች።',
    whyCelebrated: 'To give thanks for the divine protection of the Incarnate God during His holy exile, and to be inspired by Arsema’s unyielding martyrdom.',
    whyCelebratedAmharic: 'የጌታችንን የስደቱን መከራና የሰጠንን ሰላም ለማሰብ፤ እንዲሁም የሰማዕታትን ንጽሕናና ጽናት አርዓያ ለማድረግ ይከበራል።',
    theologicalMeaning: 'The exile to Egypt fulfills Hosea 11:1 ("Out of Egypt I called My Son"). Christ sanctified exile and suffering, showing that kingship in His Kingdom is made perfect through humility.',
    theologicalMeaningAmharic: '"ልጄን ከግብፅ ጠራሁት" የተባለው የትንቢት ቃል ተፈጽሟል። ክርስቶስ በስደቱ መከራንና ድህነትን ቀድሶልናል።',
    traditionsPractices: 'Special Qusquam hymns (Mahlete Tsige); carrying icons of Saint Arsema; recitation of the Psalter and supplications for healing.',
    traditionsPracticesAmharic: 'የማኅሌተ ጽጌ ዝማሬ፤ የቅድስት አርሴማ ጸበል መከበርና ጸሎተ ምሕላ ማድረስ።',
    importantInformation: 'The annual culmination of the fast of Tsige falls on Hidar 6 (Qusquam). Saint Arsema’s major feast is Meskerem 29 and Tir 6.',
    importantInformationAmharic: 'የጽጌ ጾም ማጠቃለያ የሚከበረው ኅዳር ፮ (ቍስቋም) ቀን ነው። የቅድስት አርሴማ ዓመታዊ በዓል መስከረም ፳፱ ቀን ነው።',
    scriptureReferences: 'Matthew 2:13-23; Hosea 11:1; Revelation 12:1-6',
    sources: 'Ethiopian Synaxarium (Hidar 6 & Meskerem 29); Tebeka Qusquam; Gedle Arsema',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (ኅዳር ፮ እና መስከረም ፳፱)፤ ገድለ አርሴማ፤ መጽሐፈ ቍስቋም',
    researchStatus: 'published'
  },
  7: {
    slug: 'monthly-day-07-holy-trinity-selassie',
    title: 'Holy Trinity (Selassie)',
    titleAmharic: 'ቅድስት ሥላሴ',
    category: 'christ',
    ethiopianDay: 7,
    isMonthly: true,
    isMajor: true,
    summary: 'Day 7 is dedicated to the Holy Trinity (Qiddist Selassie)—Father, Son, and Holy Spirit—one God in three distinct Persons, equal in power, majesty, and eternity.',
    summaryAmharic: 'የወሩ ሰባተኛ ቀን የአብ፣ የወልድና የመንፈስ ቅዱስ የአንድነታቸውና የሦስትነታቸው የቅድስት ሥላሴ ታላቅ ወርሃዊ መታሰቢያ ነው።',
    whatIsIt: 'The monthly celebration of the Triune God: Father, Son, and Holy Spirit. It is one of the most prominent monthly feasts across all Ethiopian Orthodox dioceses and parishes.',
    whatIsItAmharic: 'በሦስት አካላት አንድ አምላክ ተብለው የሚመለኩት የቅድስት ሥላሴ ወርሃዊ በዓል ነው። በኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ምእመናን ዘንድ እጅግ የተከበረ ነው።',
    historicalBackground: 'God revealed His triune nature in Genesis at the creation of man ("Let Us make man in Our image"), visited Abraham under the Oak of Mamre in the likeness of three travelers (Genesis 18), and manifested clearly at Christ’s baptism at the Jordan River.',
    historicalBackgroundAmharic: 'እግዚአብሔር በኦሪት ዘፍጥረት "ሰውን በመልካችን እንፍጠር" በማለት ሦስትነቱን ገልጧል፤ ለአብርሃምም በመምሬ ዛፍ ሥር በሦስት ሰዎች አምሳል ተገልጦለታል፤ በዮርዳኖስም በግልጽ ታይቷል።',
    whyCelebrated: 'To worship the Creator of all visible and invisible reality and confess orthodox faith in the undivided, co-equal Trinity.',
    whyCelebratedAmharic: 'ፍጥረታትን ሁሉ ፈጥሮ ለሚገዛው፣ ለሚመግበውና ለሚያድነው አንድ አምላክ ለሥላሴ ምስጋናና ስግደት ለማቅረብ ነው።',
    theologicalMeaning: 'The foundational dogma of the Ethiopian Orthodox Tewahedo Church: One in Essence (Ba-Bahriy Ahid), Three in Persons (Ba-Akal Selist). The Father is the Begetter, the Son is the Begotten, and the Holy Spirit proceeds from the Father.',
    theologicalMeaningAmharic: 'በአካል፣ በስም፣ በግብር ሦስት፤ በባሕርይ፣ በህልውና፣ በፈቃድ፣ በመንግሥት አንድ አምላክ ብሎ ማመን የሃይማኖታችን መሠረት ነው።',
    traditionsPractices: 'Solemn Divine Liturgy using Anaphora of the Apostles or Saint Athanasius; communal feast (Senbete/Maheber); sharing of bread and water.',
    traditionsPracticesAmharic: 'የሥላሴ ማኅበር ይደረጋል፤ ኅብስት ተባርኮ ይበላል፤ ቅዳሴ ይቀደሳል፤ ምእመናን በሥላሴ ስም ችግረኞችን ይረዳሉ።',
    importantInformation: 'Annual feasts of the Holy Trinity fall on Tahsas 7 (Abraham’s visitation) and Ginbot 7 (Commemoration of the Holy Trinity).',
    importantInformationAmharic: 'ዓመታዊ የሥላሴ በዓላት ታኅሣሥ ፯ እና ግንቦት ፯ ቀን በታላቅ ሥርዓት ይከበራሉ።',
    scriptureReferences: 'Genesis 1:26; Genesis 18:1-15; Matthew 28:19; 1 John 5:7; 2 Corinthians 13:14',
    relatedMezmurs: 'Kidus Selassie; Be-Semike Ab We-Weld We-Menfes Kidus',
    relatedPrayers: 'Seyfe Selassie (Sword of the Trinity); Melka Selassie',
    sources: 'Metsihafe Senkessar (Tahsas 7, Ginbot 7); Haymanote Abew; Metsihafe Qiddase',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (ታኅሣሥ ፯፣ ግንቦት ፯)፤ ሃይማኖተ አበው፤ መጽሐፈ ቅዳሴ',
    researchStatus: 'published'
  },
  8: {
    slug: 'monthly-day-08-four-living-creatures-matthias',
    title: 'Four Incorporeal Creatures (Arba’etu Ensisa) & Matthias',
    titleAmharic: 'አርባዕቱ እንስሳ እና ቅዱስ ማትያስ ሐዋርያ',
    category: 'angel',
    ethiopianDay: 8,
    isMonthly: true,
    summary: 'Day 8 commemorates the Four Incorporeal Living Creatures who bear the Divine Chariot before God’s throne, and Apostle Matthias who completed the Twelve.',
    summaryAmharic: 'የወሩ ስምንተኛ ቀን የሥላሴን ዙፋን የሚሸከሙት የአርባዕቱ እንስሳ እና በአስቆሮቱ ይሁዳ ምትክ የተመረጠው የሐዋርያው ቅዱስ ማትያስ መታሰቢያ ነው።',
    whatIsIt: 'The monthly commemoration of the Four Living Beings (Cherubic Chariot) seen in the visions of Ezekiel and Saint John the Theologian, and Apostle Matthias.',
    whatIsItAmharic: 'በነቢዩ ሕዝቅኤልና በዮሐንስ ራእይ የታዩት መንፈሳውያን ኪሩቤል (አርባዕቱ እንስሳ) እና የሐዋርያው ማትያስ ወርሃዊ ዝክር ነው።',
    historicalBackground: 'The Book of Revelation (4:6-8) and Ezekiel (1:5-14) describe the four living creatures: like a lion, like an ox, with the face of a man, and like a flying eagle. Saint Matthias was chosen by lot after Pentecost to take the place of Judas Iscariot.',
    historicalBackgroundAmharic: 'በራእይ ፬፥፮ እና በሕዝቅኤል ፩ የተገለጡት እነዚህ ፍጡራን አምሳላቸው እንደ አንበሳ፣ ላም፣ ሰው እና ንስር ሆኖ ሳያቋርጡ "ቅዱስ ቅዱስ ቅዱስ" እያሉ ያመሰግናሉ። ቅዱስ ማትያስም በዕጣ ሐዋርያ ሆኖ ተመርጧል።',
    whyCelebrated: 'They intercede day and night before God for mankind, the beasts, domestic cattle, and the birds of the heavens.',
    whyCelebratedAmharic: 'የሰው ፊት ያለው ለሰው ልጅ፣ የአንበሳው ለአራዊት፣ የበሬው ለእንስሳት፣ የንስሩ ለአእዋፍ ዘወትር በእግዚአብሔር ፊት ስለሚማልዱ ክብራቸውን ለማሰብ ነው።',
    theologicalMeaning: 'The Four Creatures also symbolize the four Evangelists: Matthew (the man - Christ’s genealogy), Mark (the lion - crying in the wilderness), Luke (the ox - sacrifice in the temple), and John (the eagle - soaring theology of the Word).',
    theologicalMeaningAmharic: 'አርባዕቱ እንስሳ የአራቱ ወንጌላውያን ምሳሌ ናቸው፦ ማቴዎስ በሰው፣ ማርቆስ በአንበሳ፣ ሉቃስ በበሬ፣ ዮሐንስ በንስር ይመሰላሉ።',
    traditionsPractices: 'Prayers for harvest, livestock, and preservation from famine; reading from Ezekiel and Revelation.',
    traditionsPracticesAmharic: 'ስለ ሰው ዘር፣ ስለ እንስሳትና አዝርእት ምሕረት እንዲወርድ ጸሎት ይደረጋል፤ የሕዝቅኤል ትንቢት ይነበባል።',
    importantInformation: 'The annual feast of the Four Living Creatures falls on Hidar 8.',
    importantInformationAmharic: 'ዓመታዊ በዓላቸው ኅዳር ፰ ቀን በታላቅ ክብር ይከበራል።',
    scriptureReferences: 'Ezekiel 1:5-14; Revelation 4:6-9; Acts 1:21-26',
    sources: 'Ethiopian Synaxarium (Hidar 8); Commentary on Revelation; Metsihafe Qiddase',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (ኅዳር ፰)፤ የዮሐንስ ራእይ አንድምታ፤ መጽሐፈ ቅዳሴ',
    researchStatus: 'published'
  },
  9: {
    slug: 'monthly-day-09-thomas-apostle-318-fathers',
    title: 'Apostle Thomas & 318 Fathers of Nicaea',
    titleAmharic: 'ቅዱስ ቶማስ ሐዋርያ እና ፫፻፲፰ቱ የኒቂያ ሊቃውንት',
    category: 'apostle',
    ethiopianDay: 9,
    isMonthly: true,
    summary: 'Day 9 commemorates the Holy Apostle Thomas (Didymus) who touched the wounds of the Risen Lord and preached in India, alongside the 318 Orthodox Fathers of the Council of Nicaea.',
    summaryAmharic: 'የወሩ ዘጠነኛ ቀን የጌታን የጎኑን ቁስል የዳሰሰውና በሕንድ ወንጌልን የሰበከው የቅዱስ ቶማስ ሐዋርያ እና የ፫፻፲፰ቱ የኒቂያ ሊቃውንት መታሰቢያ ነው።',
    whatIsIt: 'The monthly feast commemorating the confession of Saint Thomas ("My Lord and my God!") and the champions of Orthodoxy who formulated the Nicene Creed against the Arian heresy.',
    whatIsItAmharic: '"ጌታዬና አምላኬ" ብሎ የክርስቶስን አምላክነት የመሰከረው የቅዱስ ቶማስ እና የሃይማኖት ጸሎትን ያረቀቁት የ፫፻፲፰ቱ ቅዱሳን አበው ወርሃዊ ዝክር ነው።',
    historicalBackground: 'Thomas proclaimed the Gospel in Parthia and India, suffering martyrdom by spears. In 325 AD, 318 holy bishops gathered in Nicaea under Constantine to defend the consubstantiality (Homoousios) of the Son with the Father.',
    historicalBackgroundAmharic: 'ቅዱስ ቶማስ በሕንድ ምድር ወንጌልን ሰብኮ በጦር ተወግቶ አርፏል። በ፫፻፳፭ ዓ.ም. በኒቂያ የተሰበሰቡት ፫፻፲፰ቱ አባቶች የአርዮስን ክህደት አውግዘው እውነተኛውን የሃይማኖት ጸሎት አጽድቀዋል።',
    whyCelebrated: 'To reaffirm unyielding faith in the Resurrection and steadfast adherence to the Orthodox Nicene faith.',
    whyCelebratedAmharic: 'በትንሣኤው ምስክርነት ለመጽናትና በኒቂያ የተመሠረተውን የቀናች ሃይማኖት ጠብቆ ለመኖር ነው።',
    theologicalMeaning: 'The doubt of Thomas was turned by divine providence into unshakeable evidence of the physical, bodily Resurrection of Christ.',
    theologicalMeaningAmharic: 'የቶማስ መጠራጠር ለዓለም ሁሉ የክርስቶስ አካላዊ ትንሣኤ እውነተኛ ማረጋገጫ ሆኖ ተገልጧል።',
    traditionsPractices: 'Chanting the Nicene Creed (Tselote Haymanot); reading from the Book of the Fathers (Haymanote Abew).',
    traditionsPracticesAmharic: 'የሃይማኖት ጸሎት በኅብረት ይደገማል፤ ሃይማኖተ አበው ይነበባል፤ ለሃይማኖት ጽናት ይጸለያል።',
    importantInformation: 'The annual commemoration of the 318 Fathers of Nicaea is celebrated on Hidar 9.',
    importantInformationAmharic: 'ዓመታዊ የኒቂያ አበው በዓል ኅዳር ፱ ቀን ይከበራል።',
    scriptureReferences: 'John 20:24-29; Jude 1:3; 1 Timothy 3:16',
    sources: 'Ethiopian Synaxarium (Hidar 9 & Ginbot 26); Haymanote Abew; Council of Nicaea Acts',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (ኅዳር ፱ እና ግንቦት ፳፮)፤ ሃይማኖተ አበው፤ የታሪክ ድርሳናት',
    researchStatus: 'published'
  },
  10: {
    slug: 'monthly-day-10-meskel-cross-tsedenya',
    title: 'Feast of the Holy Cross (Meskel) & Tsedenya Maryam',
    titleAmharic: 'በዓለ መስቀል እና ጼዴንያ ማርያም',
    category: 'cross',
    ethiopianDay: 10,
    isMonthly: true,
    summary: 'Day 10 honors the Holy Cross of Christ (Meskel)—the weapon of peace and tree of salvation—and the miraculous icon of the Virgin Mary of Tsedenya.',
    summaryAmharic: 'የወሩ አሥረኛ ቀን የድኅነታችን ምልክትና የክርስቲያኖች ኃይል የሆነው የቅዱስ መስቀል እና የተአምረኛዋ የጼዴንያ ማርያም መታሰቢያ ነው።',
    whatIsIt: 'The monthly veneration of the True Cross upon which Jesus Christ redeemed humanity, alongside the miraculous icon of the Mother of God at Tsedenya monastery.',
    whatIsItAmharic: 'ጌታችን የተሰቀለበት ሕይወት ሰጪ መስቀል ወርሃዊ መታሰቢያ እና በጼዴንያ ገዳም ድንቅ ተአምር ያደረገችው የእመቤታችን ምስል ዝክር ነው።',
    historicalBackground: 'After Christ’s resurrection, the Jews threw the Cross into a rubbish heap where it was covered for three centuries until Empress Helena discovered it in Jerusalem following the sign of smoke. The Tsedenya icon in Damascus is famous in Church history for sweating fragrant healing oil.',
    historicalBackgroundAmharic: 'አይሁድ መስቀሉን በቆሻሻ መጣያ ሥር ለ፫፻ ዓመታት ደብቀውት የነበረ ሲሆን ንግሥት ዕሌኒ በእጣን ጢስ ምልክት ፈልጋ አግኝታዋለች። የጼዴንያ ሥዕልም ቅዱስ ቅባት እያመነጨች ድውያንን የፈወሰች ድንቅ ሥዕል ናት።',
    whyCelebrated: 'To boast in nothing except the Cross of our Lord Jesus Christ (Galatians 6:14) through which death was vanquished.',
    whyCelebratedAmharic: '"እኛ ግን በተሰቀለው በክርስቶስ መስቀል እንመካለን" በማለት የክርስቶስን የድኅነት ሥራ ለማመስገን ነው።',
    theologicalMeaning: 'The Cross is not an instrument of defeat, but the throne of victory, the key to paradise, and the invincible shield of Christians against demonic powers.',
    theologicalMeaningAmharic: 'መስቀል የኃይላችን መገለጫ፣ የዲያብሎስ ድል መንሻ፣ የገነት መክፈቻና የሰላም ዓርማ ነው።',
    traditionsPractices: 'Blessing with the handheld hand-cross by the clergy; singing "Meskel Berhanu Le-Alem"; veneration of cross pendants.',
    traditionsPracticesAmharic: 'ካህናት በመስቀል ሕዝቡን ይባርካሉ፤ "መስቀል ብርሃን ለኵሉ ዓለም" እየተባለ ይዘመራል፤ መስቀል ይሳለማሉ።',
    importantInformation: 'The great annual Meskel festival is Meskerem 17 (preceded by Demera on the 16th), with a secondary feast on Megabit 10.',
    importantInformationAmharic: 'ዋነኛው የመስቀል በዓል መስከረም ፲፯ (ደመራ ፲፮) እንዲሁም መጋቢት ፲ ቀን በታላቅ ድምቀት ይከበራል።',
    scriptureReferences: '1 Corinthians 1:18-25; Galatians 6:14; Colossians 2:14-15; John 19:17-30',
    relatedMezmurs: 'Meskel Berhanu; Yohannes Ante Metsene',
    relatedPrayers: 'Tselote Meskel; Melka Meskel',
    sources: 'Ethiopian Synaxarium (Meskerem 17 & Megabit 10); Ta’amire Maryam; Didascalia',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (መስከረም ፲፯ እና መጋቢት ፲)፤ ተአምረ ማርያም፤ ፍትሐ ነገሥት',
    researchStatus: 'published'
  },
  11: {
    slug: 'monthly-day-11-hanna-joachim-yared',
    title: 'Saints Hanna & Joachim, Saint Yared',
    titleAmharic: 'ቅድስት ሐና፣ ጻድቁ ኢያቄም እና ቅዱስ ያሬድ',
    category: 'saint',
    ethiopianDay: 11,
    isMonthly: true,
    summary: 'Day 11 commemorates Saint Hanna and Saint Joachim (ancestors of God), and Saint Yared the father of Ethiopian Church sacred music and hymnody.',
    summaryAmharic: 'የወሩ ዐሥራ አንደኛው ቀን የእመቤታችን ቅድስት ድንግል ማርያም ወላጆች የሐናና ኢያቄም፣ እንዲሁም የኢትዮጵያ የዜማ አባት የቅዱስ ያሬድ መታሰቢያ ነው።',
    whatIsIt: 'The monthly commemoration of the righteous parents of the Virgin Mary, and Saint Yared who was caught up to heavenly Jerusalem and brought down the three sacred chants: Geʽez, Ezel, and Araray.',
    whatIsItAmharic: 'የእመቤታችን ቅዱሳን ወላጆች የሐናና ኢያቄም በረከት፣ እንዲሁም በሰማይ የተመሰከረለትን ያሬዳዊ ዜማ (ግዕዝ፣ ዕዝል፣ አራራይ) ለቤተክርስቲያን ያበረከተው የቅዱስ ያሬድ ወርሃዊ ዝክር ነው።',
    historicalBackground: 'Hanna and Joachim lived blameless lives of faith, and from their righteous root sprang the Theotokos. Saint Yared (6th century, Axum) struggled with learning as a boy, took inspiration from a resilient caterpillar climbing a tree, and was granted divine wisdom to compose the entire liturgical chant book (Deggwa) inspired by the Holy Spirit.',
    historicalBackgroundAmharic: 'ሐናና ኢያቄም በእምነት የጸኑ ንጹሐን ነበሩ። ቅዱስ ያሬድም በትምህርት ተስፋ ቆርጦ ሳለ የትልን ጽናት ተመልክቶ በጸሎት ተግቶ በመንፈስ ቅዱስ ተመርቶ መላውን የቤተክርስቲያን ዜማ ደርሷል።',
    whyCelebrated: 'To honor parental piety and celebrate the heavenly gift of sacred Ethiopian chant that has sanctified generations of worship.',
    whyCelebratedAmharic: 'የቅዱሳን ወላጆችን ምሳሌነት ለማክበርና የኢትዮጵያን ኦርቶዶክስ ተዋሕዶ መንፈሳዊ መለያ የሆነውን የያሬድን ዜማ ለማመስገን ነው።',
    theologicalMeaning: 'Christian marriage and parenthood can become holy ground for God’s saving plan. Sacred music is not mere entertainment, but sung theology, lifting earth to heaven.',
    theologicalMeaningAmharic: 'ቅዱስ ጋብቻ ለእግዚአብሔር ክብር የሚሆን ፍሬ እንደሚያፈራ ያስተምራል። የያሬድ ዜማም የሰማያውያን መላእክት ምስጋና ምድራዊ መገለጫ ነው።',
    traditionsPractices: 'Singing from the Deggwa, Tsome Deggwa, and Me’eraf; students of sacred music pray to Saint Yared for wisdom and vocal clarity.',
    traditionsPracticesAmharic: 'የድጓና የምዕራፍ ዜማዎች ይዘመራሉ፤ የዜማ ተማሪዎች ጥበብንና ማስተዋልን እንዲያገኙ በያሬድ ስም ይጸልያሉ።',
    importantInformation: 'Saint Yared’s annual feast is celebrated on Ginbot 11 (his hidden ascension in Semien mountains).',
    importantInformationAmharic: 'የቅዱስ ያሬድ ዓመታዊ በዓል ግንቦት ፲፩ ቀን በደብረ ሐዊ ይከበራል።',
    scriptureReferences: 'Psalm 150:1-6; Colossians 3:16; Luke 1:5-17',
    sources: 'Ethiopian Synaxarium (Ginbot 11 & Hidar 11); Gedle Yared; Deggwa Introduction',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (ግንቦት ፲፩ እና ኅዳር ፲፩)፤ ገድለ ያሬድ፤ የድጓ መቅድም',
    researchStatus: 'published'
  },
  12: {
    slug: 'monthly-day-12-archangel-michael-matthew',
    title: 'Archangel Michael (Kidus Mikael) & Apostle Matthew',
    titleAmharic: 'ቅዱስ ሚካኤል ሊቀ መላእክት እና ቅዱስ ማቴዎስ ወንጌላዊ',
    category: 'angel',
    ethiopianDay: 12,
    isMonthly: true,
    isMajor: true,
    summary: 'Day 12 is dedicated to the Great Archangel Michael, commander of the heavenly armies and protector of the faithful, and Apostle Matthew.',
    summaryAmharic: 'የወሩ ዐሥራ ሁለተኛ ቀን የሰማያውያን ሠራዊት አለቃ፣ የክርስቲያኖች ሁሉ ጠባቂና ተራዳኢ የቅዱስ ሚካኤል እና የቅዱስ ማቴዎስ ታላቅ ወርሃዊ በዓል ነው።',
    whatIsIt: 'The monthly commemoration of Saint Michael the Archangel, prince of angels and intercessor before the throne of God. It is celebrated with great reverence in every church in Ethiopia.',
    whatIsItAmharic: 'ከዐሥራ ሁለቱ የመላእክት አለቆች ዋነኛው፣ ሕዝበ እግዚአብሔርን ከክፉ የሚጠብቀው የቅዱስ ሚካኤል እና የማቴዎስ ወንጌላዊ ወርሃዊ ዝክር ነው።',
    historicalBackground: 'Michael cast down Lucifer and his rebellious angels from heaven, crying "Who is like God?" (Mika-El). He led the Israelites out of Egypt by a pillar of fire, appeared to Joshua, and defended the body of Moses. Apostle Matthew was called from the tax booth to write the first Gospel.',
    historicalBackgroundAmharic: 'ቅዱስ ሚካኤል ዲያብሎስ በትዕቢት በወደቀ ጊዜ "በእግዚአብሔር ያለ አምላክ ማን ነው?" ብሎ ድል የነሣው ታላቅ መልአክ ነው። እስራኤልን በበረሃ መርቷል፤ ኢያሱንም ረድቷል። ማቴዎስም ከቀራጭነት ተጠርቶ ወንጌልን ጽፏል።',
    whyCelebrated: 'To seek the powerful protection of Saint Michael against visible and invisible adversaries, and to praise God for His holy angels.',
    whyCelebratedAmharic: 'ከዲያብሎስ ፈተናና ከክፉ ነገር ሁሉ እንዲጠብቀን፣ ጸሎታችንንም ወደ እግዚአብሔር ዙፋን እንዲያሳርግልን በመተማመን ይከበራል።',
    theologicalMeaning: 'Angels are ministering spirits sent to serve those who inherit salvation (Hebrews 1:14). Michael stands as the eternal herald of God’s supreme sovereignty.',
    theologicalMeaningAmharic: 'መላእክት የሚድኑትን ለማገልገል የሚላኩ አገልጋይ መናፍስት ናቸው (ዕብ ፩፥፲፬)። ሚካኤል የእግዚአብሔርን አዳኝነት ያበስራል።',
    traditionsPractices: 'Grand procession with the Tabot of Saint Michael; baking of Senbete bread; sharing meals with neighbors and the destitute; singing Mahlete Mikael.',
    traditionsPracticesAmharic: 'ታቦተ ሕጉ ወጥቶ ይከበራል፤ ምእመናን ማኅበር ሠርተው ኅብስትና ጸበል ያዘጋጃሉ፤ የተቸገሩትን ይመግባሉ።',
    importantInformation: 'The two major annual feasts of Saint Michael are Hidar 12 (November 21) and Sene 12 (June 19).',
    importantInformationAmharic: 'ዋናዎቹ ዓመታዊ በዓላት ኅዳር ፲፪ እና ሰኔ ፲፪ ቀን በታላቅ ግርማ ይከበራሉ።',
    scriptureReferences: 'Daniel 10:13-21; Daniel 12:1; Revelation 12:7-9; Jude 1:9; Matthew 9:9-13',
    relatedMezmurs: 'Mikael Aleqa; Mikael Melake Mihret',
    relatedPrayers: 'Dersana Mikael; Melka Mikael',
    sources: 'Dersana Mikael; Ethiopian Synaxarium (Hidar 12 & Sene 12); Book of Daniel',
    sourcesAmharic: 'ድርሳነ ሚካኤል፤ መጽሐፈ ስንክሳር (ኅዳር ፲፪ እና ሰኔ ፲፪)፤ ትንቢተ ዳንኤል',
    researchStatus: 'published'
  },
  13: {
    slug: 'monthly-day-13-egziabher-ab-raphael',
    title: 'Egziabher Ab (God the Father) & Archangel Raphael',
    titleAmharic: 'እግዚአብሔር አብ እና ቅዱስ ሩፋኤል ሊቀ መላእክት',
    category: 'angel',
    ethiopianDay: 13,
    isMonthly: true,
    summary: 'Day 13 commemorates God the Eternal Father (Egziabher Ab) and the Archangel Raphael, the angel of healing and joy who guided Tobias.',
    summaryAmharic: 'የወሩ ዐሥራ ሦስተኛ ቀን የፈጣሪያችን የእግዚአብሔር አብ እና የፈዋሹ መልአክ የቅዱስ ሩፋኤል ሊቀ መላእክት መታሰቢያ ነው።',
    whatIsIt: 'The monthly feast honoring God the Father, the unbegotten fountainhead of the Holy Trinity, and Archangel Raphael, the patron of physicians, travelers, and joyful weddings.',
    whatIsItAmharic: 'የዓለማት ሁሉ ፈጣሪ የሆነው የአብ፣ እንዲሁም ድውያንን የሚፈውሰውና ተጓዦችን የሚመራው የቅዱስ ሩፋኤል ወርሃዊ ዝክር ነው።',
    historicalBackground: 'The Book of Tobit records how Archangel Raphael accompanied young Tobias on his journey, protected him from the demon Asmodeus, healed blind Tobit’s eyes, and revealed his identity as one of the seven holy angels who present the prayers of the saints.',
    historicalBackgroundAmharic: 'በመጽሐፈ ጦቢት እንደተገለጠው ቅዱስ ሩፋኤል ጦቢያን በመንገዱ ረድቶታል፤ ሳራን ከአስሞዲዮስ አድኗል፤ የአባቱንም የጦቢትን ዐይን ፈውሶ ራሱን ከሰባቱ ሊቃነ መላእክት አንዱ እንደ ሆነ ገልጧል።',
    whyCelebrated: 'To glorify God the Father for His providential care and to pray for physical and spiritual healing through Saint Raphael.',
    whyCelebratedAmharic: 'የእግዚአብሔር አብን መጋቢነት ለማመስገንና በቅዱስ ሩፋኤል አማላጅነት ከሕመም፣ ከጭንቀትና ከመንገድ አደጋ ለመጠበቅ ነው።',
    theologicalMeaning: 'God is Jehovah-Rapha, the Lord who heals (Exodus 15:26). Archangel Raphael manifests divine compassion in human vulnerability.',
    theologicalMeaningAmharic: 'እግዚአብሔር ፈዋሽ አምላክ ነው። ቅዱስ ሩፋኤል የፈጣሪን ቸርነትና ምሕረት ለሰዎች የሚያደርስ መላከ ሰላም ነው።',
    traditionsPractices: 'Blessing of holy water (Tsebel); prayers for sick hospital patients; reading from Dersana Rufael and the Book of Tobit.',
    traditionsPracticesAmharic: 'ጸበል መጠመቅ፤ በሽተኞችን መጠየቅና መጸለይ፤ ድርሳነ ሩፋኤልና መጽሐፈ ጦቢትን ማንበብ።',
    importantInformation: 'The annual feast of Archangel Raphael is celebrated on Paguemen 3 (September 8) and Ter 13.',
    importantInformationAmharic: 'ዓመታዊ በዓሉ ጳጉሜን ፫ እና ጥር ፲፫ ቀን ይከበራል።',
    scriptureReferences: 'Tobit 12:1-22; Matthew 6:9-13; James 5:14-16',
    sources: 'Dersana Rufael; Book of Tobit (Orthodox Canon); Ethiopian Synaxarium (Paguemen 3)',
    sourcesAmharic: 'ድርሳነ ሩፋኤል፤ መጽሐፈ ጦቢት፤ መጽሐፈ ስንክሳር (ጳጉሜን ፫)',
    researchStatus: 'published'
  },
  14: {
    slug: 'monthly-day-14-abune-aregawi-gebre-kristos',
    title: 'Abune Aregawi & Saint Gebre Kristos',
    titleAmharic: 'አቡነ አረጋዊ (ዘደብረ ዳሞ) እና ቅዱስ ገብረ ክርስቶስ',
    category: 'saint',
    ethiopianDay: 14,
    isMonthly: true,
    summary: 'Day 14 commemorates Abune Aregawi (Zemikael), leader of the Nine Saints who founded Debre Damo monastery, and Saint Gebre Kristos the humble pilgrim.',
    summaryAmharic: 'የወሩ ዐሥራ አራተኛ ቀን ከተስዓቱ ቅዱሳን ዋነኛውና የደብረ ዳሞ ገዳም መሥራች አቡነ አረጋዊ፣ እንዲሁም ጻድቁ ገብረ ክርስቶስ መታሰቢያ ነው።',
    whatIsIt: 'The monthly feast commemorating Abune Aregawi, who scaled the sheer rock cliff of Debre Damo assisted by a serpent through divine command, establishing one of the earliest monasteries in Christendom.',
    whatIsItAmharic: 'በእግዚአብሔር ፈቃድ በዘንዶ ተጠቅልለው ወደ ደብረ ዳሞ አምባ በመውጣት ጥንታዊውን ገዳም የመሠረቱት የአቡነ አረጋዊና የቅዱስ ገብረ ክርስቶስ ወርሃዊ በዓል ነው።',
    historicalBackground: 'The Nine Saints arrived from the Roman-Byzantine Empire in the 5th century during the reign of King Ella Amida II, translating Scripture into Geʽez and establishing monasticism throughout Tigray. Gebre Kristos abandoned his royal palace to live as an impoverished servant of God outside his father’s gate.',
    historicalBackgroundAmharic: 'ተስዓቱ ቅዱሳን በ፭ኛው መቶ ክፍለ ዘመን ወደ ኢትዮጵያ መጥተው መጻሕፍትን ወደ ግዕዝ ተርጉመዋል፤ ገዳማትንም አቅንተዋል። ገብረ ክርስቶስም ንግሥናውን ትቶ በድህነት እግዚአብሔርን ያገለገለ ጻድቅ ነው።',
    whyCelebrated: 'To honor the saintly fathers who laid the scholastic and monastic foundations of Ethiopian Orthodox Christianity.',
    whyCelebratedAmharic: 'ለኢትዮጵያ ሃይማኖትና ሥነ ጽሑፍ መሠረት የጣሉትን አበው ለማመስገንና የትሕትና ሕይወታቸውን ለመከተል ነው።',
    theologicalMeaning: 'Ascending the rock of Debre Damo symbolizes the soul’s ascent to heaven, detached from worldly attachments through contemplation and prayer.',
    theologicalMeaningAmharic: 'ወደ ገዳሙ መውጣት ዓለምንና ምኞቷን ትቶ በጸሎት ወደ እግዚአብሔር የመቅረብ መንፈሳዊ ምሳሌ ነው።',
    traditionsPractices: 'Monastic prayers; chanting from Gedle Aregawi; sharing of bread blessed in the name of the Nine Saints.',
    traditionsPracticesAmharic: 'ገድለ አረጋዊን ማንበብ፤ የደብረ ዳሞ ገዳምን ማሰብ፤ በስማቸው የተዘጋጀውን ኅብስት መባረክ።',
    importantInformation: 'The annual feast of Abune Aregawi is celebrated on Tikimt 14 (repose/translation).',
    importantInformationAmharic: 'ዓመታዊ በዓላቸው ጥቅምት ፲፬ ቀን በደብረ ዳሞ ገዳም በታላቅ ክብር ይከበራል።',
    scriptureReferences: 'Psalm 91:1-16; Matthew 19:27-30; Hebrews 11:37-40',
    sources: 'Gedle Aregawi; Ethiopian Synaxarium (Tikimt 14); Church History of Ethiopia',
    sourcesAmharic: 'ገድለ አረጋዊ፤ መጽሐፈ ስንክሳር (ጥቅምት ፲፬)፤ የኢትዮጵያ ቤተክርስቲያን ታሪክ',
    researchStatus: 'published'
  },
  15: {
    slug: 'monthly-day-15-cyriacus-julitta-qirqos',
    title: 'Saints Cyriacus & Julitta (Qirqos we-Iyeluta)',
    titleAmharic: 'ቅዱስ ቂርቆስ እና እናቱ ቅድስት ኢየሉጣ',
    category: 'saint',
    ethiopianDay: 15,
    isMonthly: true,
    summary: 'Day 15 commemorates the three-year-old martyr Saint Cyriacus (Qirqos) and his mother Saint Julitta (Iyeluta), who courageously confessed Christ under Roman persecution.',
    summaryAmharic: 'የወሩ ዐሥራ አምስተኛ ቀን የሦስት ዓመቱ ሕፃን ሰማዕት ቅዱስ ቂርቆስና እናቱ ቅድስት ኢየሉጣ በሮም አደባባይ ክርስቶስን መስክረው ሰማዕት የሆኑበት መታሰቢያ ነው።',
    whatIsIt: 'The monthly commemoration of Child-Martyr Saint Cyriacus and his faithful mother, beloved across Ethiopia for their miracles and unwavering bravery.',
    whatIsItAmharic: 'በሮማውያን መኮንኖች ፊት "እኔ ክርስቲያን ነኝ" ብሎ የመሰከረው የሕፃኑ የቅዱስ ቂርቆስና የቅድስት ኢየሉጣ ወርሃዊ ዝክር ነው።',
    historicalBackground: 'During Diocletian’s persecution in Tarsus (circa 304 AD), Julitta refused to offer sacrifice to idols. Her three-year-old son Cyriacus proclaimed Christ before the judge Alexander. Thrown into a boiling cauldron of pitch and lead, God sent His angel to cool the flames before they received the crown of martyrdom.',
    historicalBackgroundAmharic: 'በዲዮቅልጥያኖስ ዘመን መኮንኑ በፈላ ጋን ውስጥ ሲጥላቸው መልአከ እግዚአብሔር እሳቱን አብርዶላቸዋል፤ በሰይፍ ተከልለው ሰማዕትነትን በክብር ተቀብለዋል።',
    whyCelebrated: 'To demonstrate that God’s grace empowers even the youngest children to conquer tyrants and witness to the Truth.',
    whyCelebratedAmharic: 'ሕፃናትም ጭምር በክርስቶስ ፍቅር አሸናፊዎች እንደሚሆኑ ለማሳየትና በአማላጅነታቸው መጽናናትን ለማግኘት ነው።',
    theologicalMeaning: '"Out of the mouth of babes and nursing infants You have ordained strength" (Psalm 8:2). Cyriacus shows that the Spirit of God speaks through the pure of heart.',
    theologicalMeaningAmharic: '"ከሕፃናትና ከሚጠቡት አፍ ምስጋናን አዘጋጀህ" የተባለው ቃል በቅዱስ ቂርቆስ ተፈጽሟል።',
    traditionsPractices: 'Parents bring infants and children to church for special blessings; reading from Dersana Qirqos; boiling wheat/barley for agape feast.',
    traditionsPracticesAmharic: 'ሕፃናትን ይዘው መባረክ፤ ድርሳነ ቂርቆስን ማንበብ፤ ንፍሮ ቀቅሎ ማደል።',
    importantInformation: 'The annual feasts fall on Tir 15 (entry into the boiling cauldron) and Hamle 19 (martyrdom).',
    importantInformationAmharic: 'ዓመታዊ በዓላቸው ጥር ፲፭ እና ሐምሌ ፲፱ ቀን በታላቅ ክብር ይከበራል።',
    scriptureReferences: 'Psalm 8:1-2; Matthew 18:1-6; 1 Corinthians 1:26-31',
    sources: 'Dersana Qirqos; Ethiopian Synaxarium (Tir 15 & Hamle 19)',
    sourcesAmharic: 'ድርሳነ ቂርቆስ፤ መጽሐፈ ስንክሳር (ጥር ፲፭ እና ሐምሌ ፲፱)',
    researchStatus: 'published'
  },
  16: {
    slug: 'monthly-day-16-kidane-mihret',
    title: 'Kidane Mihret (Covenant of Mercy)',
    titleAmharic: 'ኪዳነ ምሕረት (የምሕረት ቃልኪዳን)',
    category: 'marian',
    ethiopianDay: 16,
    isMonthly: true,
    isMajor: true,
    summary: 'Day 16 is dedicated to Kidane Mihret (Our Lady of the Covenant of Mercy), commemorating God’s promise to the Virgin Mary that He will grant mercy to all who seek her intercession.',
    summaryAmharic: 'የወሩ ዐሥራ ስድስተኛ ቀን እግዚአብሔር ለእመቤታችን በስሟ ለሚማጸኑ፣ ለተራቡት ለሚያበሉና ለተጨነቁት ይቅርታን እንደሚያደርግ የገባላትን የኪዳነ ምሕረት ታላቅ በዓል ነው።',
    whatIsIt: 'The monthly feast celebrating the Covenant of Mercy granted to the Mother of God by her Divine Son on Mount Golgotha.',
    whatIsItAmharic: 'በጎልጎታ ተራራ ላይ ጌታችን ለድንግል ማርያም የሰጣትን የማይታበል የምሕረት ቃልኪዳን የምናስብበት ወርሃዊ ታላቅ በዓል ነው።',
    historicalBackground: 'According to Church tradition recorded in the Synaxarium, the Virgin Mary stood weeping at Golgotha, praying for sinners. Christ appeared and said: "Whosoever makes commemoration in thy name, or feeds the hungry, or clothes the naked, or visits the sick, or writes the history of thy departure—I will forgive his sins and grant him the kingdom of heaven."',
    historicalBackgroundAmharic: 'እመቤታችን በጎልጎታ ስለ ኃጢአተኞች ስታለቅስ ጌታችን ተገልጦ "መታሰቢያሽን ያደረገውን፣ በስምሽ የጸለየውን፣ ለተራበ ያበላውን፣ የታረዘውን ያለበሰውን፣ ገድልሽን የጻፈውን ኃጢአቱን ይቅር እልልሃለሁ፤ መንግሥተ ሰማያትንም አወርሰዋለሁ" ብሎ ቃል ኪዳን ገብቶላታል።',
    whyCelebrated: 'To place trust in God’s unfathomable mercy mediated through the prayers of the Theotokos, the Mother of Compassion.',
    whyCelebratedAmharic: 'በእመቤታችን አማላጅነት የሚገኘውን የእግዚአብሔርን ይቅርታና ምሕረት ለማመስገንና በጸሎቷ ለመጠለል ነው።',
    theologicalMeaning: 'The Covenant of Mercy is grounded in Christ’s supreme sacrifice. Mary’s intercession is not independent of Christ, but flows from her maternal intimacy with the Redeemer.',
    theologicalMeaningAmharic: 'የኪዳነ ምሕረት መሠረት የክርስቶስ ቤዛነት ነው። የእመቤታችን ምልጃ ከክርስቶስ ጸጋ የሚመነጭ ዘላለማዊ ረድኤት ነው።',
    traditionsPractices: 'Chanting of Kidane Mihret Deggwa; reading of the Covenant of Mercy; distribution of food to prisoners and the homeless.',
    traditionsPracticesAmharic: 'የኪዳነ ምሕረት ማኅሌትና ቅዳሴ ይቆማል፤ ምእመናን ለድሆች ምጽዋት ይሰጣሉ፤ የታረዙትን ያለብሳሉ።',
    importantInformation: 'The principal annual feast of Kidane Mihret is celebrated on Yekatit 16 (February 23).',
    importantInformationAmharic: 'ዋነኛው ዓመታዊ የኪዳነ ምሕረት በዓል የካቲት ፲፮ ቀን በታላቅ ክብር ይከበራል።',
    scriptureReferences: 'Luke 1:46-55; John 2:1-11; 1 Kings 2:19-20; Psalm 89:1-4',
    relatedMezmurs: 'Kidane Mihret Emebet; Yeqal Kidanesh Nitsihna',
    relatedPrayers: 'Widdase Maryam; Tselote Kidane Mihret; Se’atat',
    sources: 'Ethiopian Synaxarium (Yekatit 16); Metsihafe Kidane Mihret; Mahibere Kidusan',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (የካቲት ፲፮)፤ መጽሐፈ ኪዳነ ምሕረት፤ የማኅበረ ቅዱሳን ድረ-ገጽ',
    researchStatus: 'published'
  },
  17: {
    slug: 'monthly-day-17-stephen-protomartyr-james',
    title: 'Saint Stephen the Protomartyr & Apostle James',
    titleAmharic: 'ቅዱስ እስጢፋኖስ ቀዳሜ ሰማዕታት እና ያዕቆብ ሐዋርያ',
    category: 'saint',
    ethiopianDay: 17,
    isMonthly: true,
    summary: 'Day 17 commemorates Saint Stephen, the first Christian deacon and protomartyr who saw heaven opened, and Apostle James the son of Zebedee.',
    summaryAmharic: 'የወሩ ዐሥራ ሰባተኛ ቀን የመጀመሪያው ሰማዕትና ዲያቆን የቅዱስ እስጢፋኖስ እንዲሁም የዘብዴዎስ ልጅ የሐዋርያው ቅዱስ ያዕቆብ መታሰቢያ ነው።',
    whatIsIt: 'The monthly feast commemorating Saint Stephen, full of faith and the Holy Spirit, who prayed for his executioners while being stoned outside Jerusalem.',
    whatIsItAmharic: 'በኢየሩሳሌም አደባባይ በድንጋይ ተወግሮ ሲገደል "ጌታ ሆይ ይህን ኃጢአት አትቁጠርባቸው" ብሎ የጸለየው የቀዳሜ ሰማዕት እስጢፋኖስ ወርሃዊ ዝክር ነው።',
    historicalBackground: 'Recorded in Acts 6–7, Stephen was appointed chief of the seven deacons. Facing the Sanhedrin with an angelic countenance, he bore witness to salvation history and gazed into heaven, seeing the Son of Man standing at the right hand of God. James was the first apostle to be martyred, beheaded by Herod Agrippa I.',
    historicalBackgroundAmharic: 'በሐዋርያት ሥራ እንደተጻፈው እስጢፋኖስ በሰባቱ ዲያቆናት ላይ አለቃ ሆኖ ተሾሟል። በሸንጎው ፊት ፊቱ እንደ መልአክ ፊት ሆኖ እያበራ የሰማይ መከፈትንና ክርስቶስ በአብ ቀኝ ቆሞ አየ። ያዕቆብም በሄሮድስ ሰይፍ አንገቱ ተቆርጧል።',
    whyCelebrated: 'To teach supreme Christian forgiveness—praying for enemies even in the face of death—and to honor deaconate ministry.',
    whyCelebratedAmharic: 'ለጠላቶች ሳይቀር ይቅርታ የማድረግን የፍቅር መንገድ ለማስተማርና ዲያቆናት አገልግሎታቸውን በቅድስና እንዲፈጽሙ ለማነሳሳት ነው።',
    theologicalMeaning: 'Stephen’s martyrdom mirrors Christ’s Passion: "Lord Jesus, receive my spirit" and "Lord, do not charge them with this sin."',
    theologicalMeaningAmharic: 'የእስጢፋኖስ ሰማዕትነት የክርስቶስን የመስቀል መከራና የይቅርታ ምሳሌነት ያንጸባርቃል።',
    traditionsPractices: 'Special prayers by deacons; reading of Stephen’s defense from Acts 7; deacons wear their ceremonial vestments (Aksimar/Moata).',
    traditionsPracticesAmharic: 'ዲያቆናት በልዩ ሥርዓት ያከብራሉ፤ የሐዋርያት ሥራ ምዕራፍ ፯ ይነበባል፤ ለዲያቆናት በረከት ይጸለያል።',
    importantInformation: 'Annual feasts: Tir 1 (finding of relics) and Meskerem 17 (Tobiya commemoration).',
    importantInformationAmharic: 'ዓመታዊ በዓሉ ጥር ፩ ቀን (የአጽሙ መገኘት) እና መስከረም ፲፯ ቀን ይከበራል።',
    scriptureReferences: 'Acts 6:1-15; Acts 7:51-60; Acts 12:1-2',
    sources: 'Acts of the Apostles; Ethiopian Synaxarium (Tir 1); Homilies of John Chrysostom',
    sourcesAmharic: 'የሐዋርያት ሥራ ምዕራፍ ፮ እና ፯፤ መጽሐፈ ስንክሳር (ጥር ፩)',
    researchStatus: 'published'
  },
  18: {
    slug: 'monthly-day-18-philip-apostle-ewostatewos',
    title: 'Apostle Philip & Abune Ewostatewos',
    titleAmharic: 'ቅዱስ ፊልጶስ ሐዋርያ እና አቡነ ኤዎስጣቴዎስ',
    category: 'apostle',
    ethiopianDay: 18,
    isMonthly: true,
    summary: 'Day 18 honors Saint Philip of Bethsaida, one of the Twelve Apostles, and Abune Ewostatewos, champion of the Sabbath in Ethiopian monastic history.',
    summaryAmharic: 'የወሩ ዐሥራ ስምንተኛ ቀን ከዐሥራ ሁለቱ ሐዋርያት አንዱ የሆነው የቅዱስ ፊልጶስ እና የቀዳሚት ሰንበት ተሟጋች የሆኑት የአቡነ ኤዎስጣቴዎስ መታሰቢያ ነው።',
    whatIsIt: 'The monthly commemoration of Saint Philip who led Nathanael to Christ ("Come and see"), and Abune Ewostatewos (1273–1352), founder of the Ewostathian monastic order.',
    whatIsItAmharic: '"ናና እይ" ብሎ ናትናኤልን ወደ ክርስቶስ የመራው የፊልጶስ ሐዋርያ እና የኢትዮጵያ ታላቅ ገዳማዊ አባት የአቡነ ኤዎስጣቴዎስ ወርሃዊ በዓል ነው።',
    historicalBackground: 'Philip preached in Phrygia and was crucified upside down at Hierapolis. Abune Ewostatewos defended the observance of both the Saturday Sabbath and Sunday Resurrection Sabbath, traveling through Jerusalem, Cyprus, and Armenia where he rested in the Lord.',
    historicalBackgroundAmharic: 'ፊልጶስ በትንሿ እስያ ወንጌልን ሰብኮ በሰማዕትነት አርፏል። አቡነ ኤዎስጣቴዎስም ሁለቱን ሰንበታት (ቀዳሚትና እሑድ) በቅድስና እንዲጠበቁ አስተምረው እስከ አርሜንያ ተጉዘው አርፈዋል።',
    whyCelebrated: 'To honor missionary initiative and steadfast defense of Ethiopian Orthodox liturgical tradition.',
    whyCelebratedAmharic: 'ሐዋርያዊ ትጋትንና የቤተክርስቲያንን ቀኖናዊ ሥርዓት ጠብቆ የመኖርን ጽናት ለማክበር ነው።',
    theologicalMeaning: 'The Sabbath points to the eternal rest (Seb’at) of God’s people in Christ, while Sunday proclaims the dawn of the New Creation.',
    theologicalMeaningAmharic: 'ሰንበት በእግዚአብሔር መንግሥት የሚገኘውን ዘላለማዊ ዕረፍት ስታስብ፣ እሑድ ደግሞ የትንሣኤን ብርሃን ትመሰክራለች።',
    traditionsPractices: 'Monastic commemorations; reading of Gedle Ewostatewos; Sabbath reflections.',
    traditionsPracticesAmharic: 'ገድለ ኤዎስጣቴዎስን ማንበብ፤ ስለ ሰንበታት ክብር መማማር።',
    importantInformation: 'The annual feast of Abune Ewostatewos falls on Meskerem 18 (repose in Armenia).',
    importantInformationAmharic: 'ዓመታዊ የዕረፍት በዓላቸው መስከረም ፲፰ ቀን ይከበራል።',
    scriptureReferences: 'John 1:43-51; John 14:8-14; Hebrews 4:1-11',
    sources: 'Gedle Ewostatewos; Ethiopian Synaxarium (Meskerem 18 & Hidar 18)',
    sourcesAmharic: 'ገድለ ኤዎስጣቴዎስ፤ መጽሐፈ ስንክሳር (መስከረም ፲፰ እና ኅዳር ፲፰)',
    researchStatus: 'published'
  },
  19: {
    slug: 'monthly-day-19-archangel-gabriel',
    title: 'Archangel Gabriel (Kidus Gebriel)',
    titleAmharic: 'ቅዱስ ገብርኤል ሊቀ መላእክት',
    category: 'angel',
    ethiopianDay: 19,
    isMonthly: true,
    isMajor: true,
    summary: 'Day 19 is dedicated to Saint Gabriel the Archangel, the herald of good tidings who announced the Incarnation and rescued the Three Holy Youths from the fiery furnace.',
    summaryAmharic: 'የወሩ ዐሥራ ዘጠነኛ ቀን የብሥራት መልአክ፣ ሠለስቱ ደቂቅን ከነደደው እሳት ያዳነ የቅዱስ ገብርኤል ሊቀ መላእክት ታላቅ ወርሃዊ በዓል ነው።',
    whatIsIt: 'The monthly commemoration of Archangel Gabriel, the angel of joy, mercy, and glad tidings who stands in the presence of God.',
    whatIsItAmharic: 'በእግዚአብሔር ፊት የሚቆመውና የምሥራችን ለሰው ልጆች የሚያበስረው የቅዱስ ገብርኤል ወርሃዊ ዝክር ነው።',
    historicalBackground: 'Gabriel appeared to Daniel to interpret the vision of the seventy weeks, to Zechariah to announce the birth of John the Baptist, and to the Blessed Virgin Mary in Nazareth with the Annunciation (Luke 1:26-38). He also protected Hananiah, Azariah, and Mishael in Babylon.',
    historicalBackgroundAmharic: 'ቅዱስ ገብርኤል ለዳንኤል የ፸ውን ሱባኤ ገልጧል፤ ለዘካርያስ የመጥምቁ ዮሐንስን ልደት አብስሯል፤ ለድንግል ማርያምም የክርስቶስን መወለድ አብሥሯል። በባቢሎን ነበልባል ውስጥም ሠለስቱ ደቂቅን ጠብቋል።',
    whyCelebrated: 'To give thanks for the joyful news of salvation and seek Gabriel’s protection from spiritual and physical fires.',
    whyCelebratedAmharic: 'የድኅነት ምሥራች የተሰበከበትን ደስታ ለማሰብና ከሚቃጠል የመከራ እሳት በመልአኩ አማላጅነት ለመዳን ነው።',
    theologicalMeaning: 'Gabriel means "God is my strength" or "Hero of God". He reveals that God’s might is perfected in bringing life out of barrenness and virginity.',
    theologicalMeaningAmharic: 'ገብርኤል ማለት "የእግዚአብሔር ኃይል" ወይም "እግዚአብሔር ብርታቴ ነው" ማለት ነው። የእግዚአብሔርን ኃይል ያበስራል።',
    traditionsPractices: 'Pilgrimage to Kulubi Gabriel; distribution of blessed gifts; lighting of candles; singing from Dersana Gebriel.',
    traditionsPracticesAmharic: 'ወደ ቁልቢ ገብርኤል መሄድ፤ ሻማ ማብራት፤ በስሙ ምጽዋት መስጠት፤ ድርሳነ ገብርኤልን በዜማ ማንበብ።',
    importantInformation: 'The two major annual feasts of Saint Gabriel are Tahsas 19 (miracle of the Three Youths) and Hamle 19 (Saint Cyriacus & Gabriel).',
    importantInformationAmharic: 'ዋናዎቹ ዓመታዊ በዓላት ታኅሣሥ ፲፱ እና ሐምሌ ፲፱ ቀን በቁልቢና በመላው አገር በታላቅ ግርማ ይከበራሉ።',
    scriptureReferences: 'Daniel 3:19-28; Luke 1:11-20; Luke 1:26-38',
    relatedMezmurs: 'Gebriel Melake Selam; Biserate Gebriel',
    relatedPrayers: 'Dersana Gebriel; Melka Gebriel',
    sources: 'Dersana Gebriel; Ethiopian Synaxarium (Tahsas 19 & Hamle 19); Gospel of Luke',
    sourcesAmharic: 'ድርሳነ ገብርኤል፤ መጽሐፈ ስንክሳር (ታኅሣሥ ፲፱ እና ሐምሌ ፲፱)፤ የሉቃስ ወንጌል',
    researchStatus: 'published'
  },
  20: {
    slug: 'monthly-day-20-hentsata-maryam',
    title: 'Hentsata le-Maryam (Building of the First Church)',
    titleAmharic: 'ሕንፀተ ቤተክርስቲያን ለማርያም',
    category: 'marian',
    ethiopianDay: 20,
    isMonthly: true,
    summary: 'Day 20 commemorates Hentsata le-Maryam, the dedication and miraculous founding of the first church consecrated in the name of the Virgin Mary in Philippi.',
    summaryAmharic: 'የወሩ ሀያኛ ቀን በፊልጵስዩስ በእመቤታችን በቅድስት ድንግል ማርያም ስም የመጀመሪያዋ ቤተክርስቲያን የተሠራችበት (ሕንፀተ ቤተክርስቲያን) መታሰቢያ ነው።',
    whatIsIt: 'The monthly feast commemorating the foundation of the very first church dedicated to the Mother of God, established by the Apostles.',
    whatIsItAmharic: 'በሐዋርያት ዘመን በእመቤታችን ስም ለመጀመሪያ ጊዜ የታነጸችውን ቤተክርስቲያን የምናስብበት ወርሃዊ በዓል ነው።',
    historicalBackground: 'After Pentecost, the Apostles prayed for guidance on how to honor the Theotokos. Christ appeared and commanded them to build a church in Philippi, providing divine measurements and sanctifying its stones. The building stood as a perpetual refuge of prayer and apostolic healing.',
    historicalBackgroundAmharic: 'ሐዋርያት በእመቤታችን ስም ቤተ መቅደስ ለመሥራት በጸለዩ ጊዜ ጌታችን ተገልጦ መሠረቱንና መጠኑን ባርኮ ሰጥቷቸዋል፤ በፊልጵስዩስም የመጀመሪያዋ ቤተክርስቲያን ተገንብታ ተቀድሳለች።',
    whyCelebrated: 'To celebrate the sanctity of consecrated church temples as the dwelling place of God and places of refuge for believers.',
    whyCelebratedAmharic: 'የቤተክርስቲያን ሕንፃ በእግዚአብሔር ስም ሲቀደስ የምእመናን የጸሎትና የሕይወት መሸሸጊያ እንደሚሆን ለማመስገን ነው።',
    theologicalMeaning: 'The stone church is an icon of the heavenly Jerusalem and reflects the Virgin Mary herself, who was the first living sanctuary to carry God in the flesh.',
    theologicalMeaningAmharic: 'የተሠራችው ቤተክርስቲያን የአማናዊቷ ማደሪያ የድንግል ማርያም ምሳሌ ናት። እርሷ የእግዚአብሔር ቤተ መቅደስ ሆናለችና።',
    traditionsPractices: 'Blessing of church buildings; giving donations for church construction and restoration; special Eucharistic liturgy.',
    traditionsPracticesAmharic: 'ለቤተክርስቲያን ሕንፃ ግንባታ አስተዋጽኦ ማድረግ፤ የሕንፀተ ማርያም ድርሳንን ማንበብ።',
    importantInformation: 'The annual feast of Hentsata Maryam is celebrated on Sene 20 (June 27).',
    importantInformationAmharic: 'ዋነኛው ዓመታዊ በዓል ሰኔ ፳ ቀን በታላቅ ሥርዓት ይከበራል።',
    scriptureReferences: 'Psalm 132:1-18; 1 Kings 8:22-30; 1 Peter 2:4-10',
    sources: 'Ethiopian Synaxarium (Sene 20); Ta’amire Maryam; History of the Alexandrian Patriarchs',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (ሰኔ ፳)፤ ተአምረ ማርያም፤ የቤተክርስቲያን ታሪክ',
    researchStatus: 'published'
  },
  21: {
    slug: 'monthly-day-21-virgin-mary-astereyo',
    title: 'Virgin Mary (Qiddist Maryam / Aster’eyo)',
    titleAmharic: 'ቅድስት ድንግል ማርያም (ዕረፍተ ድንግል / አስተርእዮ)',
    category: 'marian',
    ethiopianDay: 21,
    isMonthly: true,
    isMajor: true,
    summary: 'Day 21 is the universal monthly feast of the Blessed Virgin Mary (Aster’eyo), commemorating her holy repose, motherly love, and perpetual intercession.',
    summaryAmharic: 'የወሩ ፳፩ኛ ቀን የእመቤታችን የቅድስት ድንግል ማርያም ወርሃዊ መታሰቢያ (ዕረፍቷ/አስተርእዮ) ሲሆን በመላው ዓለም በሚገኙ አብያተ ክርስቲያናት በታላቅ መንፈሳዊ ደስታ ይከበራል።',
    whatIsIt: 'The chief monthly Marian feast of the Ethiopian Orthodox Tewahedo Church. Day 21 in any month is celebrated by every faithful believer with fasting, liturgy, and praise.',
    whatIsItAmharic: 'በኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተክርስቲያን ከወርሃዊ በዓላት ሁሉ እጅግ ታላቅና ተወዳጅ የሆነው የድንግል ማርያም ወርሃዊ በዓል ነው።',
    historicalBackground: 'After living in the house of Saint John the Apostle, Mary received the call to her heavenly rest at age 64. The Apostles were miraculously gathered from around the world on clouds to Jerusalem to witness her dormition (Tir 21) and burial in Gethsemane.',
    historicalBackgroundAmharic: 'እመቤታችን በዮሐንስ ቤት ለዓመታት ከኖረች በኋላ በ፷፬ ዓመቷ ጥር ፳፩ ቀን አረፈች፤ ሐዋርያትም ከዓለም ዳርቻ በደመና ተጭነው በኢየሩሳሌም ተሰብስበው በክብር ቀብረዋታል።',
    whyCelebrated: 'To honor the Mother of God whose obedience reversed Eve’s curse, and whose maternal prayers continually guard humanity.',
    whyCelebratedAmharic: 'በሔዋን ምክንያት የመጣውን እርግማን በታዛዥነቷ ያስወገደችውን እናታችንን ለማመስገንና በምልጃዋ ለመታመን ነው።',
    theologicalMeaning: 'Theotokos (Wladite Amlak): Mary truly gave birth to God the Word in the flesh. She remained a virgin before, during, and after childbirth (Dingil be-Helina, Dingil be-Siga).',
    theologicalMeaningAmharic: 'እመቤታችን በሐሳብም በሥጋም ዘላለማዊ ድንግል ናት፤ አምላክን የወለደች እውነተኛ ወላዲተ አምላክ ናት። ሞቷም ወደ ሕይወት የተሸጋገረበት ዕረፍት ነው።',
    traditionsPractices: 'Singing the complete Widdase Maryam and Anqetse Berhan; preparation of communal agape meals; recitation of Melka Maryam.',
    traditionsPracticesAmharic: 'ውዳሴ ማርያምና አንቀጸ ብርሃን በዜማ ይደርሳል፤ ምእመናን በስማቸው ማኅበር ሠርተው ኅብስትና ጸበል ይካፈላሉ፤ ድሆችን ይመግባሉ።',
    importantInformation: 'Major annual feasts: Tir 21 (Dormition / Aster’eyo) and Ginbot 21 (Debre Mitmaq). Day 21 in any month is universally referred to as "Maryam".',
    importantInformationAmharic: 'ዋናዎቹ ዓመታዊ በዓላት ጥር ፳፩ (ዕረፍቷ/አስተርእዮ) እና ግንቦት ፳፩ (ደብረ ምጥማቅ) ናቸው። በየወሩ ፳፩ "ማርያም" ተብሎ ይከበራል።',
    scriptureReferences: 'Luke 1:26-56; John 19:25-27; Psalm 45:9-17; Revelation 12:1-6',
    relatedMezmurs: 'Mariam Fidel Nat; Selam Leki Maryam; Enate Maryam',
    relatedPrayers: 'Widdase Maryam; Anqetse Berhan; Yewedisewa Mela’ikt',
    sources: 'Ethiopian Synaxarium (Tir 21 & Ginbot 21); Metsihafe Filseta; Patristic Commentaries',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (ጥር ፳፩ እና ግንቦት ፳፩)፤ መጽሐፈ ፍልሰታ፤ ውዳሴ ማርያም አንድምታ',
    researchStatus: 'published'
  },
  22: {
    slug: 'monthly-day-22-archangel-uriel-annunciation-luke',
    title: 'Archangel Uriel, Annunciation & Saint Luke',
    titleAmharic: 'ቅዱስ ዑራኤል ሊቀ መላእክት፣ ብሥራተ ገብርኤል እና ቅዱስ ሉቃስ',
    category: 'angel',
    ethiopianDay: 22,
    isMonthly: true,
    summary: 'Day 22 commemorates Archangel Uriel, the angel of divine wisdom and repentance, the mystery of the Annunciation (Bisrat), and Saint Luke the Evangelist.',
    summaryAmharic: 'የወሩ ፳፪ኛ ቀን የምሥጢር መጋቢ የሆነው የቅዱስ ዑራኤል፣ የብሥራተ ገብርኤል እና የወንጌላዊው ቅዱስ ሉቃስ መታሰቢያ ነው።',
    whatIsIt: 'The monthly feast celebrating Archangel Uriel who guided Ezra and brought the drops of Christ’s blood to bless Ethiopia, the Annunciation, and Saint Luke the physician and iconographer.',
    whatIsItAmharic: 'ለነቢዩ ዕዝራ ምሥጢርን የገለጠው፣ የክርስቶስን ደም በጽዋ ይዞ ኢትዮጵያን የረጨው የቅዱስ ዑራኤል እና የቅዱስ ሉቃስ ወርሃዊ በዓል ነው።',
    historicalBackground: 'The 4th Book of Ezra recounts how Archangel Uriel instructed Ezra in divine wisdom. Church tradition holds that Uriel caught Christ’s life-giving blood from the Cross in a golden chalice and sprinkled it across Ethiopia, sanctifying its soil. Saint Luke was the faithful physician who recorded the Nativity and painted the first icon of Mary.',
    historicalBackgroundAmharic: 'በዕዝራ ሱቱኤል እንደተጻፈው ቅዱስ ዑራኤል ለዕዝራ ምሥጢራትን ገልጦለታል። በኢትዮጵያ ትውፊትም የክርስቶስን ክቡር ደም በጽዋ ተቀብሎ አገራችንን የቀደሰ ታላቅ መልአክ ነው። ሉቃስም ወንጌልን ጽፎ የእመቤታችንን ሥዕል አስቀድሞ ስሏል።',
    whyCelebrated: 'To pray for knowledge, repentance, and intellectual illumination, thanking God for the blood of Christ that purifies the earth.',
    whyCelebratedAmharic: 'ጥበብንና ማስተዋልን ለማግኘት፣ ከድንቁርናና ከኃጢአት ጨለማ ለመውጣት እንዲሁም በአገራችን ላይ የፈሰሰውን የክርስቶስን ደም በረከት ለማሰብ ነው።',
    theologicalMeaning: 'Uriel means "Fire of God" or "Light of God". He illuminates human understanding so that believers may grasp the mysteries of salvation.',
    theologicalMeaningAmharic: 'ዑራኤል ማለት "የእግዚአብሔር ብርሃን" ማለት ነው። የሰውን ልቡና በእግዚአብሔር እውቀት ያበራል።',
    traditionsPractices: 'Pilgrimage to Uriel churches; reading Dersana Uriel; prayers for students taking academic examinations.',
    traditionsPracticesAmharic: 'ድርሳነ ዑራኤልን ማንበብ፤ ተማሪዎች በትምህርታቸው እንዲሳካላቸው መጸለይ፤ ጸበል መጠመቅ።',
    importantInformation: 'The annual feasts fall on Hamle 22 (consecration of church) and Tir 22 (revelation to Ezra).',
    importantInformationAmharic: 'ዓመታዊ በዓላቱ ሐምሌ ፳፪ እና ጥር ፳፪ ቀን ይከበራሉ።',
    scriptureReferences: '2 Esdras (4 Ezra) 4:1-12; Luke 1:1-4; Colossians 4:14',
    sources: 'Dersana Uriel; 4 Ezra (Orthodox Canon); Ethiopian Synaxarium (Hamle 22 & Tir 22)',
    sourcesAmharic: 'ድርሳነ ዑራኤል፤ ዕዝራ ሱቱኤል፤ መጽሐፈ ስንክሳር (ሐምሌ ፳፪ እና ጥር ፳፪)',
    researchStatus: 'published'
  },
  23: {
    slug: 'monthly-day-23-saint-george-giorgis',
    title: 'Saint George the Great Martyr (Kidus Giorgis)',
    titleAmharic: 'ቅዱስ ጊዮርጊስ ሊቀ ሰማዕታት',
    category: 'saint',
    ethiopianDay: 23,
    isMonthly: true,
    isMajor: true,
    summary: 'Day 23 is dedicated to Saint George of Lydda (Kidus Giorgis), the "Prince of Martyrs", celebrated throughout Ethiopia for his heroic witness and victory over the dragon.',
    summaryAmharic: 'የወሩ ፳፫ኛ ቀን የሰማዕታት አለቃ፣ አምላኩን በጽናት የመሰከረውና ደራጎንን ድል የነሣው የቅዱስ ጊዮርጊስ ታላቅ ወርሃዊ በዓል ነው።',
    whatIsIt: 'The monthly commemoration of Saint George the Trophy-Bearer (Meqawim), patron of soldiers, horsemen, and spiritual warriors.',
    whatIsItAmharic: 'በኢትዮጵያ እጅግ ተወዳጅ የሆነው፣ መከራን በትዕግሥት አሸንፎ አክሊል የተቀዳጀው የቅዱስ ጊዮርጊስ ወርሃዊ በዓል ነው።',
    historicalBackground: 'Born in Cappadocia and serving as an officer in the Roman army, George boldly distributed his wealth to the poor and confronted Emperor Diocletian for persecuting Christians. Enduring seven years of unspeakable torture, died and was raised three times by Christ, and converted thousands (including Empress Alexandra) before his beheading on Miyazya 23.',
    historicalBackgroundAmharic: 'በቀጰዶቅያ የተወለደው ቅዱስ ጊዮርጊስ የሮም የጦር መኮንን ሳለ ክርስቲያን መሆኑን በዲዮቅልጥያኖስ ፊት መሰከረ። ለ፯ ዓመታት ታላላቅ ሥቃዮችን ታግሦ ሦስት ጊዜ ሞቶ በክርስቶስ ኃይል ተነሥቷል፤ ንግሥት አሌክሳንድራንም ጨምሮ ብዙዎችን አሳምኖ በሚያዝያ ፳፫ ቀን በሰማዕትነት አርፏል።',
    whyCelebrated: 'To draw courage against temptation and tyrannical persecution, asking Saint George’s swift assistance in distress.',
    whyCelebratedAmharic: 'በመንፈሳዊ ተጋድሎ ዲያብሎስንና ፈተናዎችን ድል ለመንሳት እንዲሁም በአማላጅነቱ ከችግር ለመውጣት ይከበራል።',
    theologicalMeaning: 'The slaying of the dragon is a spiritual allegory of Christ’s victory over Satan through His saints. George shows that worldly power cannot quench love for Christ.',
    theologicalMeaningAmharic: 'ዘንዶውን መግደሉ ቅዱሳን በክርስቶስ ኃይል ሰይጣንን ድል የማድረጋቸው ምሳሌ ነው። ለክርስቶስ ፍቅር ሕይወትን መስጠት እውነተኛ ድል ነው።',
    traditionsPractices: 'Solemn Tabot processions; equestrian honors; reading of Gedle Giorgis; blessing of holy water and communal bread.',
    traditionsPracticesAmharic: 'ታቦቱ በክብር ወጥቶ ይዞራል፤ ፈረሰኞች ያጅባሉ፤ ገድለ ጊዮርጊስ ይነበባል፤ ኅብስትና ጸበል ይካፈላሉ።',
    importantInformation: 'Major annual feasts: Miyazya 23 (Martyrdom / Beheading) and Hidar 23 (Consecration of his church in Lydda).',
    importantInformationAmharic: 'ዋናዎቹ ዓመታዊ በዓላቱ በሚያዝያ ፳፫ (ዕረፍቱ) እና ኅዳር ፳፫ (ሕንፀተ ቤተክርስቲያን) ይከበራሉ።',
    scriptureReferences: 'Ephesians 6:10-18; 2 Timothy 2:1-5; Revelation 12:11; Psalm 34:15-22',
    relatedMezmurs: 'Giorgis Hayal; Semait Giorgis; Be-Feres Tegilto',
    relatedPrayers: 'Gedle Giorgis; Melka Giorgis; Se’atat',
    sources: 'Gedle Giorgis; Ethiopian Synaxarium (Miyazya 23 & Hidar 23); Eusebius',
    sourcesAmharic: 'ገድለ ጊዮርጊስ፤ መጽሐፈ ስንክሳር (ሚያዝያ ፳፫ እና ኅዳር ፳፫)',
    researchStatus: 'published'
  },
  24: {
    slug: 'monthly-day-24-tekle-haymanot-24-heavenly-priests',
    title: 'Abune Tekle Haymanot & Twenty-Four Heavenly Priests',
    titleAmharic: 'አቡነ ተክለ ሃይማኖት እና ፳፬ቱ ካህናተ ሰማይ',
    category: 'saint',
    ethiopianDay: 24,
    isMonthly: true,
    isMajor: true,
    summary: 'Day 24 honors Abune Tekle Haymanot, the great Ethiopian monastic father and apostle who restored unity to the Church, and the 24 Heavenly Priests.',
    summaryAmharic: 'የወሩ ፳፬ኛ ቀን የኢትዮጵያ ፀሐይ፣ ታላቁ ሐዋርያና ጻድቅ አቡነ ተክለ ሃይማኖት እንዲሁም የ፳፬ቱ ካህናተ ሰማይ ታላቅ ወርሃዊ በዓል ነው።',
    whatIsIt: 'The monthly feast commemorating Abune Tekle Haymanot of Debre Libanos, who prayed standing on one leg for decades after his other leg severed, and the 24 Heavenly Presbyters who offer golden bowls of incense.',
    whatIsItAmharic: 'አንዲት እግራቸው እስክትሰበር ድረስ ለ፳፪ ዓመታት ቆመው የጸለዩት የኢትዮጵያ አባት የአቡነ ተክለ ሃይማኖት እና በእግዚአብሔር ዙፋን ፊት እጣን የሚያጥኑት የ፳፬ቱ ካህናተ ሰማይ ወርሃዊ ዝክር ነው።',
    historicalBackground: 'Born in Zorare (Shewa) in the 13th century, Tekle Haymanot revived the Ethiopian Church, evangelized Damot and Wolamo, converted King Motilami, and founded the monastic order of Debre Libanos. He was granted six angelic wings and spent his final years standing in prayer in a narrow cell surrounded by spears.',
    historicalBackgroundAmharic: 'በሸዋ ዞራሬ የተወለዱት አቡነ ተክለ ሃይማኖት ደሞትንና ወላይታን አስተምረው ሞተለሚን አጥምቀዋል፤ ደብረ ሊባኖስ ገዳምን መሥርተዋል፤ ስድስት ክንፍም ተሰጥቷቸዋል። እግራቸው ተሰብሮ በጸሎት ጸንተዋል።',
    whyCelebrated: 'To honor the native father of the Ethiopian Church whose prayers delivered the nation and who brought monastic reform.',
    whyCelebratedAmharic: 'የአገራችንን ሐዋርያና መንፈሳዊ መሪ ለማክበር፣ የጸሎታቸውን ቃልኪዳን ለመካፈልና በገዳማዊ ተጋድሏቸው ለመባረክ ነው።',
    theologicalMeaning: 'Tekle Haymanot ("Plant of Faith") proves that the grace of Christ blossoms equally on African soil. The 24 Priests demonstrate eternal heavenly worship mirroring earthly liturgy.',
    theologicalMeaningAmharic: 'ተክለ ሃይማኖት ማለት "የሃይማኖት ተክል" ማለት ነው። በኢትዮጵያ ምድር ያፈሩት መንፈሳዊ ፍሬ ክርስትና የሥርዓትና የተጋድሎ ሕይወት መሆኑን ይመሰክራል።',
    traditionsPractices: 'Grand pilgrimage to Debre Libanos; reading of Gedle Tekle Haymanot; offering incense in remembrance of the 24 Priests.',
    traditionsPracticesAmharic: 'ወደ ደብረ ሊባኖስ መጓዝ፤ ገድላቸውን ማንበብ፤ ማኅበር ሠርቶ መዘከር፤ እጣን ማጠን።',
    importantInformation: 'Annual feasts: Nehase 24 (repose), Tahsas 24 (birth), Ginbot 12 (translation of relics), Hidar 24 (receiving of wings).',
    importantInformationAmharic: 'ዋናዎቹ ዓመታዊ በዓላት ነሐሴ ፳፬ (ዕረፍታቸው)፣ ታኅሣሥ ፳፬ (ልደታቸው) እና ግንቦት ፲፪ (ፍልሰተ አጽማቸው) ናቸው።',
    scriptureReferences: 'Revelation 4:4-10; Revelation 5:8; Matthew 10:37-42; Psalm 92:12-15',
    relatedMezmurs: 'Tekle Haymanot Tsedk; Abune Tekle Haymanot',
    relatedPrayers: 'Gedle Tekle Haymanot; Melka Tekle Haymanot',
    sources: 'Gedle Tekle Haymanot; Ethiopian Synaxarium (Nehase 24 & Tahsas 24); Tadesse Tamrat Church History',
    sourcesAmharic: 'ገድለ ተክለ ሃይማኖት፤ መጽሐፈ ስንክሳር (ነሐሴ ፳፬ እና ታኅሣሥ ፳፬)',
    researchStatus: 'published'
  },
  25: {
    slug: 'monthly-day-25-mercurius-merqorewos',
    title: 'Saint Mercurius the Great Martyr (Merqorewos)',
    titleAmharic: 'ቅዱስ መርቆሬዎስ ሰማዕት',
    category: 'saint',
    ethiopianDay: 25,
    isMonthly: true,
    summary: 'Day 25 commemorates Saint Mercurius (Abu Seifein - the Bearer of Two Swords), the Roman officer who slew the apostate emperor Julian through divine intervention.',
    summaryAmharic: 'የወሩ ፳፭ኛ ቀን ባለ ሁለት ሰይፉ ጀግና ሰማዕት የቅዱስ መርቆሬዎስ መታሰቢያ ነው።',
    whatIsIt: 'The monthly feast commemorating Saint Mercurius, granted two swords by an angel of God to defend the faithful.',
    whatIsItAmharic: 'መልአከ እግዚአብሔር ሁለት ሰይፍ ሰጥቶት አረማውያንን ድል የነሣውና ለክርስቶስ አንገቱን የሰጠው የቅዱስ መርቆሬዎስ ወርሃዊ በዓል ነው።',
    historicalBackground: 'Born in Cappadocia, Philopater (Mercurius) received a heavenly sword from Archangel Michael to defeat the barbarian invaders. Refusing to sacrifice to Artemis under Decius, he was tortured and beheaded in Caesarea. Decades later, Saint Basil the Great saw a vision of Mercurius sent from heaven to pierce Julian the Apostate who was persecuting the Church.',
    historicalBackgroundAmharic: 'ቅዱስ መርቆሬዎስ በሮም ወታደር ሳለ መልአኩ ሰይፍ ሰጥቶት ድል አድርጓል። በኋላ ግን ክርስቲያን መሆኑ ታውቆ በሰማዕትነት አርፏል። ቅዱስ ባስልዮስም በራእይ ከሰማይ ተልኮ ከሓዲውን ዑልያኖስን ሲወጋው አይቷል።',
    whyCelebrated: 'To pray for spiritual victory over apostasy and injustice, trusting in God’s heavenly defense of His Church.',
    whyCelebratedAmharic: 'በሃይማኖት ጸንቶ ክህደትን ድል ለማድረግና የእግዚአብሔርን ቅዱሳን ተራዳኢነት ለማሰብ ነው።',
    theologicalMeaning: 'The two swords signify the material sword of justice and the spiritual sword of the Spirit, which is the Word of God (Ephesians 6:17).',
    theologicalMeaningAmharic: 'ሁለቱ ሰይፎች የመንፈስ ቅዱስ ሰይፍ የሆነውን የእግዚአብሔርን ቃልና የጽድቅን ድል ያመለክታሉ።',
    traditionsPractices: 'Reading of Gedle Merqorewos; veneration of his icon depicted on horseback with two swords.',
    traditionsPracticesAmharic: 'ገድለ መርቆሬዎስን ማንበብ፤ በፈረስ ላይ ባለ ሁለት ሰይፍ ሆኖ የተሣለውን ሥዕሉን መሳለም።',
    importantInformation: 'The annual feast falls on Hidar 25 (martyrdom) and Ba’ale Wold eve.',
    importantInformationAmharic: 'ዓመታዊ በዓሉ ኅዳር ፳፭ ቀን በታላቅ ክብር ይከበራል።',
    scriptureReferences: 'Ephesians 6:10-18; 2 Timothy 4:7-8; Psalm 20:1-9',
    sources: 'Gedle Merqorewos; Ethiopian Synaxarium (Hidar 25); History of the Church',
    sourcesAmharic: 'ገድለ መርቆሬዎስ፤ መጽሐፈ ስንክሳር (ኅዳር ፳፭)',
    researchStatus: 'published'
  },
  26: {
    slug: 'monthly-day-26-saint-joseph-abba-salama',
    title: 'Saint Joseph the Betrothed & Abba Salama Kesate Birhan',
    titleAmharic: 'ጻድቁ ዮሴፍ እና አባ ሰላማ ከሣቴ ብርሃን',
    category: 'saint',
    ethiopianDay: 26,
    isMonthly: true,
    summary: 'Day 26 honors Righteous Joseph the Betrothed, protector of the Holy Family, and Abba Salama Kesate Birhan (Saint Frumentius), the first bishop of Ethiopia.',
    summaryAmharic: 'የወሩ ፳፮ኛ ቀን ቅዱስ ቤተሰብን በስደት ያገለገለው ጻድቁ ዮሴፍ እና የመጀመሪያው የኢትዮጵያ ጳጳስ አባ ሰላማ ከሣቴ ብርሃን መታሰቢያ ነው።',
    whatIsIt: 'The monthly commemoration of Righteous Joseph who shielded Mary and the Christ child, and Saint Frumentius who brought the light of the Gospel to the Kingdom of Axum in the 4th century.',
    whatIsItAmharic: 'እመቤታችንን በቅድስና የጠበቃት አረጋዊው ዮሴፍ እንዲሁም በ፬ኛው መቶ ክፍለ ዘመን በዐክሱም ክርስትናን ያስፋፋው አባ ሰላማ ከሣቴ ብርሃን ወርሃዊ ዝክር ነው።',
    historicalBackground: 'Joseph obediently followed the angel’s instructions, guiding the Holy Family into Egypt and returning to Nazareth. Frumentius, shipwrecked on the Red Sea coast, served in the royal court of Axum, converted King Ezana, and was consecrated Bishop of Axum by Saint Athanasius of Alexandria.',
    historicalBackgroundAmharic: 'ጻድቁ ዮሴፍ የእግዚአብሔርን መልአክ ቃል አምኖ ቅዱስ ቤተሰብን አገልግሏል። አባ ሰላማም ወደ ዐክሱም ገብቶ ንጉሡን ዔዛናን አጥምቆ በአትናቴዎስ እጅ ጳጳስ ሆኖ ተሹሟል።',
    whyCelebrated: 'To honor humble obedience to God’s guidance and celebrate the illumination of Ethiopia with the Orthodox Christian faith.',
    whyCelebratedAmharic: 'የትሕትናን አገልግሎት ለማሰብና አገራችን በወንጌል ብርሃን የተጎበኘችበትን ታሪክ ለማመስገን ነው።',
    theologicalMeaning: 'Abba Salama ("Father of Peace, Revealer of Light") fulfilled the prophetic promise: "Ethiopia shall stretch out her hands to God" (Psalm 68:31).',
    theologicalMeaningAmharic: 'አባ ሰላማ "ከሣቴ ብርሃን" ተብሏል፤ ምክንያቱም "ኢትዮጵያ እጆቿን ወደ እግዚአብሔር ትዘረጋለች" የተባለው ትንቢት በእርሱ አገልግሎት ተፈጽሟል።',
    traditionsPractices: 'Prayers for families, fathers, and national peace; remembering the spiritual lineage of the Patriarchate of Ethiopia.',
    traditionsPracticesAmharic: 'ስለ አባቶችና ቤተሰብ ጸሎት ማድረግ፤ የኢትዮጵያ ጵጵስና ታሪክን ማስተማር።',
    importantInformation: 'The annual feast of Abba Salama falls on Hamle 26; Saint Joseph is remembered during the Nativity cycle.',
    importantInformationAmharic: 'የአባ ሰላማ ዓመታዊ በዓል ሐምሌ ፳፮ ቀን ይከበራል።',
    scriptureReferences: 'Matthew 1:18-25; Matthew 2:13-23; Psalm 68:31; Acts 8:26-40',
    sources: 'Ethiopian Synaxarium (Hamle 26); Rufinus Ecclesiastical History; Tadesse Tamrat',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (ሐምሌ ፳፮)፤ የቤተክርስቲያን ታሪክ፤ ሩፊኖስ',
    researchStatus: 'published'
  },
  27: {
    slug: 'monthly-day-27-medhane-alem',
    title: 'Medhane Alem (Saviour of the World)',
    titleAmharic: 'መድኃኔ ዓለም (የዓለም አዳኝ)',
    category: 'christ',
    ethiopianDay: 27,
    isMonthly: true,
    isMajor: true,
    summary: 'Day 27 is dedicated to Medhane Alem (Christ, the Saviour of the World), celebrating His redeeming Passion, death, and resurrection for the salvation of all creation.',
    summaryAmharic: 'የወሩ ፳፯ኛ ቀን የዓለም መድኃኒት የሆነው የጌታችን የኢየሱስ ክርስቶስ የማዳን ሥራና ቤዛነት የሚታሰብበት ታላቁ የመድኃኔ ዓለም ወርሃዊ በዓል ነው።',
    whatIsIt: 'The monthly celebration of our Lord and God Jesus Christ under His supreme title "Medhane Alem"—the Saviour of the World who healed Adam’s wound on the Cross.',
    whatIsItAmharic: 'በመስቀል ላይ ተሰቅሎ ዓለምን ከኃጢአት ባርነት ያዳነውን የጌታችን የመድኃኔ ዓለምን ታላቅ የምሕረት ሥራ የምናመሰግንበት ወርሃዊ በዓል ነው።',
    historicalBackground: 'Christ, the Eternal Word of the Father, took flesh from the Virgin Mary, walked the earth healing every sickness and preaching the Kingdom, and offered Himself on Calvary on Megabit 27 (the historical day of the Crucifixion in EOTC tradition).',
    historicalBackgroundAmharic: 'ጌታችን ዓለምን ለማዳን በመስቀል ላይ የዋለበት እውነተኛው ዕለት መጋቢት ፳፯ ቀን ሲሆን በየወሩ በ፳፯ኛው ቀን ይህ ታላቅ የቤዛነት ሥራ ይታሰባል።',
    whyCelebrated: 'To confess Christ as the sole Redeemer of the universe, prostrating before His saving Cross and partaking of His Holy Mysteries.',
    whyCelebratedAmharic: 'የዘላለም ሕይወትን ስለ ሰጠን፣ ከሞት ወደ ሕይወት ስላሸጋገረንና ፍጹም ፍቅሩን ስለ ገለጠልን ዘወትር ልናመሰግነው ይገባል።',
    theologicalMeaning: 'The core of Tewahedo soteriology: Christ united divinity and humanity without confusion, division, or alteration, triumphing over death through death.',
    theologicalMeaningAmharic: 'ተዋሕዶ የድኅነታችን ምሥጢር ነው። መለኮትና ትስብእት ያለ መቀላቀልና ያለ መለየት አንድ ሆነው ክርስቶስ በሞቱ ሞትን ድል አድርጓል።',
    traditionsPractices: 'Grand Eucharistic Liturgies in all Medhane Alem cathedrals; fasting and prostrations; sharing of communion bread; singing "Medhane Alem Adhanen".',
    traditionsPracticesAmharic: 'በመድኃኔ ዓለም አብያተ ክርስቲያናት ታቦቱ በታላቅ ክብር ይወጣል፤ ምእመናን ስግደት ይሰግዳሉ፤ ኅብስትና ጸበል ይካፈላሉ።',
    importantInformation: 'The two great annual feasts of Medhane Alem are Megabit 27 (Good Friday Crucifixion memorial) and Tikimt 27 (commemoration of the Covenant of the Cross).',
    importantInformationAmharic: 'ዋናዎቹ ዓመታዊ በዓላት መጋቢት ፳፯ (የስቅለቱ መታሰቢያ) እና ጥቅምት ፳፯ ቀን ይከበራሉ።',
    scriptureReferences: 'John 3:16-17; John 12:32; Isaiah 53:1-12; Philippians 2:5-11; 1 Peter 2:24',
    relatedMezmurs: 'Medhane Alem Adhanen; Medhane Alem Kibre Nahe; Be-Mesqelu',
    relatedPrayers: 'Metsihafe Qiddase; Melka Medhane Alem; Liturgy of Saint Dioscorus',
    sources: 'Ethiopian Synaxarium (Megabit 27 & Tikimt 27); Haymanote Abew; Deggwa',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (መጋቢት ፳፯ እና ጥቅምት ፳፯)፤ ሃይማኖተ አበው፤ መጽሐፈ ቅዳሴ',
    researchStatus: 'published'
  },
  28: {
    slug: 'monthly-day-28-emmanuel',
    title: 'Emmanuel (God With Us)',
    titleAmharic: 'አማኑኤል (እግዚአብሔር ከእኛ ጋር)',
    category: 'christ',
    ethiopianDay: 28,
    isMonthly: true,
    summary: 'Day 28 celebrates Christ under the prophetic title Emmanuel ("God with us"), rejoicing in the mystery of the Incarnation and divine companionship.',
    summaryAmharic: 'የወሩ ፳፰ኛ ቀን "እግዚአብሔር ከእኛ ጋር ሆነ" ተብሎ ትንቢት የተነገረለት የጌታችን የአማኑኤል ወርሃዊ መታሰቢያ ነው።',
    whatIsIt: 'The monthly commemoration of Christ as Emmanuel, the fulfillment of Isaiah’s prophecy that the Virgin shall conceive and bear a Son.',
    whatIsItAmharic: 'ነቢዩ ኢሳይያስ "ድንግል ትፀንሳለች ወንድ ልጅም ትወልዳለች ስሙንም አማኑኤል ትለዋለች" ያለውን የፈጸመውን የጌታችን የአማኑኤል ወርሃዊ በዓል ነው።',
    historicalBackground: 'Isaiah 7:14 foretold the sign of the Virgin birth. In the fullness of time, Gabriel announced to Mary that the Holy Spirit would overshadow her, and the Word became flesh, dwelling among us.',
    historicalBackgroundAmharic: 'ኢሳይያስ በትንቢት ያየው ምሥጢር በድንግል ማርያም ተፈጽሞ አምላክ ከሰማያት ወርዶ ከድንግል ተወልዶ በመካከላችን አድሯል።',
    whyCelebrated: 'To confess that God has not abandoned fallen humanity, but has pitched His tent among us as our brother and Lord.',
    whyCelebratedAmharic: 'እግዚአብሔር ሰውን ብቻውን እንዳልተወው፣ ሰው ሆኖ እንዳዳነንና ዘወትር ከእኛ ጋር መሆኑን ለማመስገን ነው።',
    theologicalMeaning: 'The Incarnation is the foundation of all Christian hope. God did not send an angel or a delegate, but Himself entered human history to redeem us.',
    theologicalMeaningAmharic: 'የሰው ልጅ ድኅነት የተረጋገጠው አምላክ ራሱ ፍጹም ሰው በመሆኑ ነው። አማኑኤል መባሉ የማይመረመረውን የማዳን ምሥጢር ይገልጣል።',
    traditionsPractices: 'Eucharistic liturgy; singing hymns of the Incarnation; praying for peace and reconciliation in families.',
    traditionsPracticesAmharic: 'የቅዳሴ ጸሎት፤ የአማኑኤል ማኅበር ማክበር፤ በሰላምና በፍቅር ለመኖር ጸሎት ማድረግ።',
    importantInformation: 'Closely associated with the Nativity cycle and celebrated universally on Day 28 of every month.',
    importantInformationAmharic: 'ከገና (የልደት) በዓል ጋር የተቆራኘ ሲሆን በየወሩ ፳፰ ቀን በታላቅ ደስታ ይከበራል።',
    scriptureReferences: 'Isaiah 7:14; Matthew 1:21-23; John 1:14; Colossians 1:15-20',
    relatedMezmurs: 'Emmanuel Amlakachen; Emmanuel Ante Nehe',
    relatedPrayers: 'Metsihafe Qiddase (Anaphora of Saint John Chrysostom); Melka Emmanuel',
    sources: 'Ethiopian Synaxarium; Commentary on Matthew; Haymanote Abew',
    sourcesAmharic: 'መጽሐፈ ስንክሳር፤ የማቴዎስ ወንጌል አንድምታ፤ ሃይማኖተ አበው',
    researchStatus: 'published'
  },
  29: {
    slug: 'monthly-day-29-baale-wold-lalibela',
    title: 'Ba’ale Wold (Feast of God the Son) & Saint Lalibela',
    titleAmharic: 'በዓለ ወልድ እና ጻድቁ ንጉሥ ቅዱስ ላሊበላ',
    category: 'christ',
    ethiopianDay: 29,
    isMonthly: true,
    isMajor: true,
    summary: 'Day 29 commemorates Ba’ale Wold (the Nativity and Incarnation of God the Son) and the holy King Saint Lalibela who carved the rock-hewn churches of Roha.',
    summaryAmharic: 'የወሩ ፳፱ኛ ቀን የእግዚአብሔር ልጅ የኢየሱስ ክርስቶስ የልደቱ (በዓለ ወልድ) እና የድንቅ አብያተ ክርስቲያናት አንጻጺ የጻድቁ ንጉሥ ላሊበላ መታሰቢያ ነው።',
    whatIsIt: 'The monthly feast commemorating the Birth of Christ (celebrated every 29th, recalling Tahsas 29 Gena) and Saint Lalibela (Gebra Mesqel), king and saint.',
    whatIsItAmharic: 'የጌታችን የልደቱ ወርሃዊ በዓል (በዓለ ወልድ) እና በሮሃ ድንቅ ድንቅ ውቅር አብያተ ክርስቲያናትን ያነጸው የጻድቁ ንጉሥ የቅዱስ ላሊበላ ወርሃዊ ዝክር ነው።',
    historicalBackground: 'Christ was born in Bethlehem of Judea on Tahsas 29 (Tahsas 28 in leap years). King Lalibela of the Zagwe dynasty was caught up to heaven by angels and shown the heavenly Jerusalem, commanded to carve eleven monolithic churches out of living rock in Roha.',
    historicalBackgroundAmharic: 'ጌታችን በቤተልሔም በግርግም ተወልዷል። ጻድቁ ንጉሥ ላሊበላም በመላእክት ታግዞ በሮሃ ተራራ ላይ ፲፩ዱን ድንቅ ውቅር አብያተ ክርስቲያናት አንጾ ለክርስቶስ ክብር አበርክቷል።',
    whyCelebrated: 'To continuously rejoice in the Holy Nativity and honor righteous governance dedicated to God’s glory.',
    whyCelebratedAmharic: 'የክርስቶስን መወለድ በየወሩ ለማሰብና ሃይማኖታዊ ንግሥና ምን እንደሚመስል ከቅዱስ ላሊበላ ሕይወት ለመማር ነው።',
    theologicalMeaning: 'The Monolithic churches of Lalibela represent the New Jerusalem on Ethiopian soil, while the Nativity reveals the boundless humility of the Almighty.',
    theologicalMeaningAmharic: 'የላሊበላ ውቅር አብያተ ክርስቲያናት የሰማያዊቷ ኢየሩሳሌም ምሳሌዎች ናቸው። የክርስቶስ ልደትም የፈጣሪን ፍጹም ትሕትና ያሳያል።',
    traditionsPractices: 'Festive processions; singing hymns of the Nativity and Saint Lalibela; reciting the Anaphora of the Son.',
    traditionsPracticesAmharic: 'የበዓለ ወልድ ማኅሌትና ቅዳሴ ይቆማል፤ የላሊበላ ገድል ይነበባል፤ ኅብስት ተባርኮ ይካፈላል።',
    importantInformation: 'The annual Nativity of Christ (Gena) is celebrated on Tahsas 29 (or 28). Saint Lalibela’s annual feast is Sene 12.',
    importantInformationAmharic: 'ዋነኛው የገና በዓል ታኅሣሥ ፳፱ (በዘመነ ዮሐንስ ፳፰) ቀን ይከበራል። የላሊበላ ዕረፍት ሰኔ ፲፪ ቀን ነው።',
    scriptureReferences: 'Luke 2:1-20; Matthew 2:1-12; 1 Chronicles 29:10-19',
    relatedMezmurs: 'Lalibela Tsedku; Be-Bethlehem Tewelede',
    relatedPrayers: 'Gedle Lalibela; Anaphora of our Lord Jesus Christ; Melka Wold',
    sources: 'Gedle Lalibela; Ethiopian Synaxarium (Tahsas 29 & Sene 12); Tadesse Tamrat',
    sourcesAmharic: 'ገድለ ላሊበላ፤ መጽሐፈ ስንክሳር (ታኅሣሥ ፳፱ እና ሰኔ ፲፪)',
    researchStatus: 'published'
  },
  30: {
    slug: 'monthly-day-30-john-baptist-mark-evangelist',
    title: 'Saint John the Baptist & Saint Mark the Evangelist',
    titleAmharic: 'ቅዱስ ዮሐንስ መጥምቅ እና ቅዱስ ማርቆስ ወንጌላዊ',
    category: 'saint',
    ethiopianDay: 30,
    isMonthly: true,
    summary: 'Day 30 commemorates Saint John the Baptist (the Forerunner and greatest born of women) and Saint Mark the Evangelist, founder of the See of Alexandria.',
    summaryAmharic: 'የወሩ ፴ኛ ቀን ከሴቶች ከተወለዱት ሁሉ የሚበልጠው የመጥምቁ ዮሐንስ እና የአፍሪካ ወንጌላዊ የቅዱስ ማርቆስ መታሰቢያ ነው።',
    whatIsIt: 'The monthly feast commemorating Saint John the Baptist, who baptized the Lord in the Jordan and was beheaded by Herod, alongside Saint Mark the Evangelist.',
    whatIsItAmharic: 'በዮርዳኖስ ጌታችንን ያጠመቀው የነቢያት ማኅተም የመጥምቁ ዮሐንስ እና የኢትዮጵያ ቤተክርስቲያን መንፈሳዊ እናት የሆነችው የእስክንድርያ መንበር መሥራች የቅዱስ ማርቆስ ወርሃዊ ዝክር ነው።',
    historicalBackground: 'John preached repentance in the wilderness and pointed to Jesus: "Behold, the Lamb of God who takes away the sin of the world!" (John 1:29). He was beheaded for confronting Herod Antipas. Mark wrote the second Gospel and carried the faith to Alexandria and Egypt.',
    historicalBackgroundAmharic: 'መጥምቁ ዮሐንስ በበረሃ ንስሐን አስተምሮ ክርስቶስን አጥምቋል፤ ሄሮድስንም ስለ እውነት ገሥጾ በሰማዕትነት አንገቱን ተቆርጧል። ማርቆስም ወንጌልን ጽፎ ወደ እስክንድርያ ወንጌልን ይዞ ገብቷል።',
    whyCelebrated: 'To heed the call to genuine repentance and honor the fearless martyrdom of those who spoke truth to power.',
    whyCelebratedAmharic: 'የንስሐን መንገድ ለመከተል፣ ለእውነት በድፍረት ለመቆምና የሐዋርያዊ አገልግሎትን ፍሬ ለማሰብ ነው።',
    theologicalMeaning: 'John is the bridge between the Old and New Testaments—the voice crying in the wilderness. He prepared the way of the Lord through water and repentance.',
    theologicalMeaningAmharic: 'ዮሐንስ የብሉይና የሐዲስ ኪዳን መገናኛ ድልድይ ነው። የጌታን መንገድ ጠርጓል፤ የጽድቅንም ምስክር ሆኗል።',
    traditionsPractices: 'Prayers for national and personal repentance; reading of the martyrdom of John the Baptist; blessing of water.',
    traditionsPracticesAmharic: 'የንስሐ ጸሎት ማድረግ፤ ድርሳነ ዮሐንስን ማንበብ፤ የቅዱስ ማርቆስን ወንጌል መዘከር።',
    importantInformation: 'Annual feasts: Meskerem 1 (Repose/Beheading), Yekatit 30 (finding of John’s head), Sene 30 (Birth of John), Miyazya 30 (Martyrdom of Mark).',
    importantInformationAmharic: 'ዓመታዊ በዓላት፦ መስከረም ፩፣ የካቲት ፴ (የራሱ መገኘት)፣ ሰኔ ፴ (ልደቱ) እና ሚያዝያ ፴ (የማርቆስ ዕረፍት) ናቸው።',
    scriptureReferences: 'Matthew 3:1-12; Matthew 14:1-12; Mark 1:1-15; John 1:19-34',
    relatedMezmurs: 'Yohannes Metmiq; Markos Wengelawi',
    relatedPrayers: 'Gedle Yohannes Metmiq; Anaphora of Saint Mark (Saint Cyril)',
    sources: 'Ethiopian Synaxarium (Meskerem 1, Yekatit 30, Sene 30, Miyazya 30); Gospel of Mark',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (መስከረም ፩፣ የካቲት ፴፣ ሰኔ ፴፣ ሚያዝያ ፴)፤ የማርቆስ ወንጌል',
    researchStatus: 'published'
  }
}

/**
 * Registry of Canonical Annual & Movable Feasts, Fasts, and Seasons
 */
export const ANNUAL_AND_MOVABLE_FEAST_ARTICLES: Record<string, CalendarKnowledgeArticle> = {
  ...CHRIST_AND_CROSS_ARTICLES,
  ...MARIAN_FEAST_ARTICLES,
  ...ANGELIC_AND_SAINTS_ARTICLES,
  ...LENT_AND_HOLY_WEEK_ARTICLES,
  ...FASTS_AND_SEASONS_ARTICLES,
}

/**
 * Universal lookup helper for any calendar event, observance, fast, season, or commemoration.
 */
export function getKnowledgeArticle(key: string | number | null | undefined): CalendarKnowledgeArticle | null {
  if (key == null) return null
  if (typeof key === 'number') {
    return MONTHLY_COMMEMORATION_ARTICLES[key] || null
  }
  const cleanKey = String(key).toLowerCase().trim()
  if (!cleanKey) return null

  // 1. Direct match in annual/movable registry
  if (ANNUAL_AND_MOVABLE_FEAST_ARTICLES[cleanKey]) {
    return ANNUAL_AND_MOVABLE_FEAST_ARTICLES[cleanKey]
  }

  // 2. Direct match in monthly commemorations if string is a number '1'-'30'
  const asNum = parseInt(cleanKey, 10)
  if (!isNaN(asNum) && asNum >= 1 && asNum <= 30 && String(asNum) === cleanKey) {
    return MONTHLY_COMMEMORATION_ARTICLES[asNum] || null
  }

  // 3. Search by slug match
  for (const article of Object.values(ANNUAL_AND_MOVABLE_FEAST_ARTICLES)) {
    if (article.slug === cleanKey) return article
  }

  // 4. Search by normalized slug containing key or vice versa
  for (const article of Object.values(ANNUAL_AND_MOVABLE_FEAST_ARTICLES)) {
    if (cleanKey.includes(article.slug) || article.slug.includes(cleanKey)) {
      return article
    }
  }

  // 5. Check monthly commemorations by slug or title match
  for (const article of Object.values(MONTHLY_COMMEMORATION_ARTICLES)) {
    if (article.slug === cleanKey || cleanKey.includes(article.slug) || article.slug.includes(cleanKey)) {
      return article
    }
  }

  return null
}

