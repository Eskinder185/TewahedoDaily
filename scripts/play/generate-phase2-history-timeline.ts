/**
 * Phase 2 Content Generator for History Quest (40 units: 30 questions + 10 events)
 * and Bible Timeline Challenge (10 new chains).
 * Fully validated with validateStudioDraft and question/timeline validators.
 */
import fs from 'node:fs'
import path from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const { validateStudioDraft } = await import('../../src/lib/play/contentStudio')
  const { buildTimelineBank } = await import('../../src/lib/play/bibleTimeline')
  const { previewQuestionImport } = await import('../../src/lib/play/questionLibrary')
  type PlayQuestion = import('../../src/lib/play/types').PlayQuestion
  type HistoryStudioEvent = import('../../src/lib/play/contentStudio').HistoryStudioEvent
  type TlChain = import('../../src/lib/play/bibleTimeline').TlChain

  const churchLib = (label: string, route: string) => ({ label, route, kind: 'church-library' as const })
  const bible = (label: string, route: string) => ({ label, route, kind: 'bible' as const })

  // =========================================================================
  // 1. HISTORY QUEST (30 QUESTIONS + 10 TIMELINE EVENTS = 40 UNITS)
  // =========================================================================
  // 30 questions with balanced keys: 7 a, 8 b, 8 c, 7 d
  const historyKeyPattern: Array<'a' | 'b' | 'c' | 'd'> = [
    'a', 'b', 'c', 'd', 'a', 'b', 'c', 'd', 'a', 'b', 'c', 'd',
    'a', 'b', 'c', 'd', 'a', 'b', 'c', 'd', 'a', 'b', 'c', 'd',
    'a', 'b', 'c', 'd', 'b', 'c'
  ]

  const historyPromptsRaw = [
    // 1-10: Early Church & Councils
    {
      id: 'hist-p2-polycarp',
      promptEn: 'Which apostolic father and bishop of Smyrna declared before martyrdom: "Eighty-six years I have served Christ, and He has done me no wrong"?',
      promptAm: 'ከመሰዋቱ በፊት "ለሰማንያ ስድስት ዓመታት ክርስቶስን አገለገልኩት፤ እርሱም ምንም አልበደለኝም" በማለት የመሰከረው የሰምርኔስ ኤጲስ ቆጶስ ማን ነው?',
      ansEn: 'Saint Polycarp of Smyrna',
      ansAm: 'ቅዱስ ፖሊካርፕ ዘሰምርኔስ',
      optEn: ['Saint Ignatius of Antioch', 'Saint Polycarp of Smyrna', 'Saint Clement of Rome', 'Saint Justin Martyr'],
      expEn: 'Saint Polycarp, a direct disciple of Saint John the Apostle, suffered martyrdom with great courage in the arena around AD 155.',
      ref: 'Early Church History — Martyrdom of Polycarp',
      route: '/library/history/polycarp'
    },
    {
      id: 'hist-p2-ignatius',
      promptEn: 'Which bishop of Antioch wrote seven letters on his journey to Rome, calling himself "the wheat of God to be ground by the teeth of wild beasts"?',
      promptAm: 'ወደ ሮም በሚጓዝበት ወቅት ሰባት መልእክታትን የጻፈውና "በአውሬዎች ጥርስ የምፈጭ የእግዚአብሔር ስንዴ ነኝ" ያለው የአንጾኪያ ኤጲስ ቆጶስ ማን ነው?',
      ansEn: 'Saint Ignatius of Antioch (Theophoros)',
      ansAm: 'ቅዱስ ኢግናጥዮስ ምጥው ለአንበሳ',
      optEn: ['Saint Irenaeus of Lyons', 'Saint Ignatius of Antioch (Theophoros)', 'Saint Justin Martyr', 'Saint Cyprian of Carthage'],
      expEn: 'Saint Ignatius bore witness to apostolic order, the real presence in the Eucharist, and eager martyr devotion on his way to the Colosseum.',
      ref: 'Early Church History — Letters of Ignatius',
      route: '/library/history/ignatius'
    },
    {
      id: 'hist-p2-irenaeus',
      promptEn: 'Which bishop of Lyons wrote "Against Heresies" around AD 180, defending the apostolic rule of faith and the fourfold Gospel?',
      promptAm: 'በ180 ዓ.ም. ገደማ "የኑፋቄዎች መቃወሚያ" (Against Heresies) የተሰኘውን መጽሐፍ ጽፎ የሐዋርያትን እምነት ያስጠበቀው የሊዮን ኤጲስ ቆጶስ ማን ነው?',
      ansEn: 'Saint Irenaeus of Lyons',
      ansAm: 'ቅዱስ ሄሬኔዎስ ዘሊዮን',
      optEn: ['Saint Clement of Alexandria', 'Saint Justin Martyr', 'Saint Irenaeus of Lyons', 'Tertullian of Carthage'],
      expEn: 'Saint Irenaeus linked the apostolic succession of churches to the true apostolic doctrine of the Incarnation.',
      ref: 'Patristics — Against Heresies',
      route: '/library/patristics/irenaeus'
    },
    {
      id: 'hist-p2-justin',
      promptEn: 'Which Christian philosopher wrote two First Apologies to the Roman Emperor Antoninus Pius and defended Christian worship and the Eucharist?',
      promptAm: 'ለሮማው ንጉሥ አንቶኒኑስ ፒዩስ የመጀመሪያውን የክርስትና መከላከያ መልእክት (Apology) የጻፈውና የቅዳሴን ሥርዓት የገለጸው ፈላስፋ ማን ነው?',
      ansEn: 'Saint Justin Martyr',
      ansAm: 'ቅዱስ ዩስጢኖስ ሰማዕት',
      optEn: ['Saint Athenagoras', 'Saint Aristides', 'Saint Melito of Sardis', 'Saint Justin Martyr'],
      expEn: 'Saint Justin taught philosophy in Rome before suffering martyrdom under Marcus Aurelius for refusing to sacrifice to idols.',
      ref: 'Apologetics — Justin’s First Apology',
      route: '/library/patristics/justin-martyr'
    },
    {
      id: 'hist-p2-perpetua',
      promptEn: 'Which young noblewoman and nursing mother was martyred in Carthage alongside her companion Felicity around AD 203?',
      promptAm: 'በ203 ዓ.ም. ገደማ በካርቴጅ ከጓደኛዋ ፊሊሲታስ ጋር ለእምነቷ ሰማዕት ሆና ያለፈችው ወጣት እናት ማን ነች?',
      ansEn: 'Saint Perpetua',
      ansAm: 'ቅድስት ፐርፔቱዋ',
      optEn: ['Saint Perpetua', 'Saint Agnes of Rome', 'Saint Cecilia', 'Saint Catherine of Alexandria'],
      expEn: 'Saint Perpetua recorded her prison diary and heavenly visions before facing beasts in the amphitheater with joyful serenity.',
      ref: 'Synaxarium — Passion of Perpetua and Felicity',
      route: '/library/history/perpetua'
    },
    {
      id: 'hist-p2-homoousios',
      promptEn: 'Which Greek theological term, meaning "of one essence / consubstantial with the Father", was formulated at the Council of Nicaea (AD 325) against Arius?',
      promptAm: 'በ325 ዓ.ም. በኒቂያ ጉባኤ ከአብ ጋር "በህልውና አንድ" (Consubstantial) መሆኑን ለመግለጽ በአርዮስ ላይ የተወሰነው የግሪክ ሥነ መለኮታዊ ቃል የትኛው ነው?',
      ansEn: 'Homoousios (ህላዌ አንድ)',
      ansAm: 'ሆሞኡሲዮስ (ህላዌ አንድ)',
      optEn: ['Homoiousios (ተመሳሳይ)', 'Homoousios (ህላዌ አንድ)', 'Hypostasis (አካል)', 'Theotokos (ወላዲተ አምላክ)'],
      expEn: 'The Council of Nicaea affirmed that the Son is Homoousios (of the same divine essence) with the Father, eternally begotten and not made.',
      ref: 'Council of Nicaea — Creed of the 318 Fathers',
      route: '/library/councils/nicaea-creed'
    },
    {
      id: 'hist-p2-constantinople',
      promptEn: 'The Council of Constantinople (AD 381) completed the Nicene Creed by affirming which doctrine regarding the Holy Spirit?',
      promptAm: 'በ381 ዓ.ም. የተካሄደው የቁስጥንጥንያ ጉባኤ ስለ መንፈስ ቅዱስ ምን በማለት የኒቂያን የሃይማኖት ጸሎት አሟላ?',
      ansEn: 'The Holy Spirit proceeds from the Father and is worshiped together with Father and Son',
      ansAm: 'መንፈስ ቅዱስ ከአብ ይሰርጻል፤ ከአብና ከወልድ ጋር በአንድነት ይሰገዳል',
      optEn: ['The Holy Spirit is created by the Son', 'The Holy Spirit is an impersonal energy', 'The Holy Spirit proceeds from the Father and is worshiped together with Father and Son', 'The Holy Spirit became incarnate'],
      expEn: 'The 150 Fathers condemned Macedonius and declared the Holy Spirit as the Lord and Giver of Life, proceeding eternally from the Father.',
      ref: 'Ecumenical Councils — First Council of Constantinople',
      route: '/library/councils/constantinople'
    },
    {
      id: 'hist-p2-cyril-ephesus',
      promptEn: 'Which Patriarch of Alexandria presided over the Council of Ephesus (AD 431) defending the title Theotokos (Mother of God) against Nestorius?',
      promptAm: 'በ431 ዓ.ም. በኤፌሶን ጉባኤ ላይ ድንግል ማርያም "ወላዲተ አምላክ" (ቴዎቶኮስ) መሆኗን በመከላከል ንስጥሮስን የኮነነው የእስክንድርያ ፓትርያርክ ማን ነው?',
      ansEn: 'Saint Cyril of Alexandria',
      ansAm: 'ቅዱስ ቄርሎስ ዓምደ ሃይማኖት',
      optEn: ['Saint Dioscorus', 'Saint Cyril of Alexandria', 'Saint Timothy Aelurus', 'Saint Peter Mongus'],
      expEn: 'Saint Cyril formulated the orthodox Christology of the hypostatic union: one incarnate nature of God the Word.',
      ref: 'Council of Ephesus — Twelve Anathemas of Cyril',
      route: '/library/patristics/cyril-alexandria'
    },
    {
      id: 'hist-p2-basil-great',
      promptEn: 'Which Cappadocian Father and bishop of Caesarea wrote the treatise "On the Holy Spirit" and organized monastic rules and hospitals for the poor?',
      promptAm: '"ስለ መንፈስ ቅዱስ" የተሰኘውን ድርሰት የጻፈውና ለድሆች ማዕከላትን ያቋቋመው የቂሣርያ ሊቀ ጳጳስ ማን ነው?',
      ansEn: 'Saint Basil the Great',
      ansAm: 'ቅዱስ ባስልዮስ ዘቂሣርያ',
      optEn: ['Saint Gregory of Nazianzus', 'Saint Gregory of Nyssa', 'Saint Basil the Great', 'Saint John Chrysostom'],
      expEn: 'Saint Basil, together with Gregory of Nazianzus and Gregory of Nyssa, decisively articulated Orthodox Trinitarian theology.',
      ref: 'Cappadocian Fathers — Saint Basil on the Spirit',
      route: '/library/patristics/basil-great'
    },
    {
      id: 'hist-p2-chrysostom',
      promptEn: 'Which Patriarch of Constantinople, famous for his eloquence, earned the title "Chrysostom" (Golden-mouthed) for his profound scriptural homilies?',
      promptAm: 'በቃሉ ጣፋጭነትና በወንጌል ስብከቱ ምክንያት "አፈ ወርቅ" (Chrysostom) የሚል ስያሜ የተሰጠው የቁስጥንጥንያ ፓትርያርክ ማን ነው?',
      ansEn: 'Saint John Chrysostom',
      ansAm: 'ቅዱስ ዮሐንስ አፈ ወርቅ',
      optEn: ['Saint Flavian of Constantinople', 'Saint Tarasios', 'Saint Photius', 'Saint John Chrysostom'],
      expEn: 'Saint John Chrysostom authored influential liturgies, commentaries, and fearlessly confronted imperial corruption.',
      ref: 'Patristics — Homilies of Saint John Chrysostom',
      route: '/library/patristics/chrysostom'
    },

    // 11-20: Ethiopian Church History & Ancient Saints
    {
      id: 'hist-p2-ezana-coins',
      promptEn: 'Which Axumite king first replaced pagan crescent-and-disk symbols on royal coins with the Christian Cross around AD 340?',
      promptAm: 'በ340 ዓ.ም. ገደማ በአክሱም ሳንቲሞች ላይ የነበረውን የጨረቃና ፀሐይ ምልክት በክርስቲያናዊው መስቀል የተካው ንጉሥ ማን ነው?',
      ansEn: 'King Ezana of Axum',
      ansAm: 'ንጉሥ ዔዛና',
      optEn: ['King Ezana of Axum', 'King Kaleb', 'King Armah', 'King Gebre Mesqel'],
      expEn: 'King Ezana embraced Christianity under Saint Frumentius (Abba Selama) and inscribed his faith in stone stele and gold coins.',
      ref: 'Axumite Inscriptions and Royal Coinage',
      route: '/library/history/ezana-inscriptions'
    },
    {
      id: 'hist-p2-nine-saints',
      promptEn: 'From which region did the Nine Saints migrate to the Kingdom of Axum around AD 480 to expand monasticism and translate Scriptures?',
      promptAm: 'በ480 ዓ.ም. ገደማ ወደ አክሱም መንግሥት በመምጣት ገዳማትን ያስፋፉትና መጻሕፍትን የተረጎሙት ተስዓቱ ቅዱሳን የመጡት ከየትኛው አካባቢ ነው?',
      ansEn: 'Syria and the Byzantine Mediterranean',
      ansAm: 'ከሶርያና ከምሥራቁ የሮም ግዛት',
      optEn: ['Armenia and Persia', 'Syria and the Byzantine Mediterranean', 'Southern Arabia and Yemen', 'Nubia and Alexandria'],
      expEn: 'The Nine Saints (Za-Mikael Aragawi, Pantalewon, Garima, Afse, Guba, Alef, Yemata, Liqanos, Sehma) strengthened Orthodox faith and translation.',
      ref: 'Synaxarium — The Nine Saints of Ethiopia',
      route: '/library/history/nine-saints'
    },
    {
      id: 'hist-p2-garima-gospels',
      promptEn: 'Which monastery founded by one of the Nine Saints preserves the ancient illuminated Geez Garima Gospels, carbon-dated between the 4th and 6th centuries?',
      promptAm: 'ከ4ኛ እስከ 6ኛ መቶ ክፍለ ዘመን የተጻፉትን ጥንታዊውን የግዕዝ ገሪማ ወንጌላትን የሚጠብቀው ገዳም የትኛው ነው?',
      ansEn: 'Abba Garima Monastery near Adwa',
      ansAm: 'የአባ ገሪማ ገዳም (አድዋ)',
      optEn: ['Debre Damo Monastery', 'Abba Garima Monastery near Adwa', 'Debre Libanos Monastery', 'Waldiba Monastery'],
      expEn: 'The Garima Gospels represent one of the world’s oldest surviving complete illuminated Christian gospel manuscripts.',
      ref: 'Ethiopian Manuscript Heritage — Garima Gospels',
      route: '/library/history/garima-gospels'
    },
    {
      id: 'hist-p2-kaleb-yemen',
      promptEn: 'Which 6th-century King of Axum launched an expedition across the Red Sea to defend persecuted Christians under Dhu Nuwas?',
      promptAm: 'በ6ኛው መቶ ክፍለ ዘመን በደቡብ ዓረቢያ የተጨፈጨፉ ክርስቲያኖችን ለመታደግ ቀይ ባሕርን ተሻግሮ የዘመተው የአክሱም ንጉሥ ማን ነው?',
      ansEn: 'King Saint Kaleb (Ella Asbeha)',
      ansAm: 'ንጉሥ ቅዱስ ካሌብ (እለ አጽብሐ)',
      optEn: ['King Ezana', 'King Gebre Mesqel', 'King Saint Kaleb (Ella Asbeha)', 'King Dil Na’od'],
      expEn: 'After his victorious campaign defending Najran’s martyrs, King Kaleb sent his crown to Jerusalem and retired into solitary monasticism.',
      ref: 'Synaxarium — King Kaleb of Axum',
      route: '/library/history/kaleb'
    },
    {
      id: 'hist-p2-gebre-mesqel-yared',
      promptEn: 'During the reign of which Axumite king did Saint Yared introduce his heavenly system of chant (Diggwa) and sacred notation?',
      promptAm: 'ቅዱስ ያሬድ የዜማና የድጓ ሥርዓቱን ያዘጋጀው በየትኛው የአክሱም ንጉሥ ዘመነ መንግሥት ነበር?',
      ansEn: 'King Gebre Mesqel',
      ansAm: 'ንጉሥ ገብረ መስቀል',
      optEn: ['King Ezana', 'King Gebre Mesqel', 'King Kaleb', 'King Lalibela'],
      expEn: 'Tradition relates that King Gebre Mesqel was so captivated listening to Yared’s divine melodies that he accidentally pierced Yared’s foot with his spear.',
      ref: 'Synaxarium — Ginbot 11 (Saint Yared)',
      route: '/library/hymns/yared-life'
    },
    {
      id: 'hist-p2-zagwe-dynasty',
      promptEn: 'Which royal dynasty ruled medieval Ethiopia from Roha and was renowned for piety, building rock-hewn monolithic churches?',
      promptAm: 'ከሮሃ (ላሊበላ) ሆነው ኢትዮጵያን የመሩትና ድንቅ የፈለፈሉ አብያተ ክርስቲያናትን ያነጹት ነገሥታት ሥርወ መንግሥት ምን ይባላል?',
      ansEn: 'The Zagwe Dynasty',
      ansAm: 'የዛጉዌ ሥርወ መንግሥት',
      optEn: ['The Zagwe Dynasty', 'The Solomonic Dynasty', 'The Gondar Dynasty', 'The Axumite Dynasty'],
      expEn: 'The Zagwe dynasty flourished from the 10th to the 13th century, producing canonized saint-kings: Yemrehana Krestos, Harbe, Lalibela, and Ne’akuto Le’ab.',
      ref: 'Church History — The Zagwe Kings and Monasteries',
      route: '/library/history/zagwe-dynasty'
    },
    {
      id: 'hist-p2-yemrehana',
      promptEn: 'Which rock church of the Zagwe era was constructed inside a vast natural cavern near Lalibela with alternating wood and stone layers?',
      promptAm: 'በላሊበላ አቅራቢያ በታላቅ ዋሻ ውስጥ በእንጨትና በድንጋይ ቅንብር የታነጸው የዛጉዌ ዘመን ድንቅ ቤተ ክርስቲያን የትኛው ነው?',
      ansEn: 'Yemrehana Krestos Cave Church',
      ansAm: 'ቤተ ይምርሐነ ክርስቶስ',
      optEn: ['Bete Giyorgis', 'Bete Medhane Alem', 'Yemrehana Krestos Cave Church', 'Bete Maryam'],
      expEn: 'King Yemrehana Krestos built this cavern sanctuary before Lalibela’s monolithic churches, featuring intricate wooden paneling and ancient tombs.',
      ref: 'Architectural Heritage — Yemrehana Krestos',
      route: '/library/history/yemrehana-krestos'
    },
    {
      id: 'hist-p2-zara-yaqob',
      promptEn: 'Which 15th-century Emperor composed theological works such as "Metsihafe Berhan" (Book of Light) and strengthened Marian and Sabbath observances?',
      promptAm: 'በ15ኛው መቶ ክፍለ ዘመን "መጽሐፈ ብርሃን" እና "መጽሐፈ ምሥጢር" የተሰኙ የነገረ መለኮት ድርሰቶችን ያዘጋጀው ታላቁ ንጉሥ ማን ነው?',
      ansEn: 'Emperor Zara Yaqob',
      ansAm: 'ዐፄ ዘርአ ያዕቆብ',
      optEn: ['Emperor Amda Seyon', 'Emperor Zara Yaqob', 'Emperor Fasilides', 'Emperor Galawdewos'],
      expEn: 'Zara Yaqob convened church councils, fostered literature, and established uniform liturgical practices across the empire.',
      ref: 'Ethiopian Patristic Literature — Metsihafe Berhan',
      route: '/library/patristics/zara-yaqob'
    },
    {
      id: 'hist-p2-fasilides',
      promptEn: 'Which Emperor expelled the Portuguese Jesuit missionaries in 1632 and restored the historic Orthodox faith as the empire’s sole confession?',
      promptAm: 'በ1632 (1624 ዓ.ም.) የሮም ካቶሊክ ጳጳሳትን በማስወጣት የቀደመችውን የተዋሕዶ ኦርቶዶክስ እምነት ወደ ቀድሞ ክብሯ የመለሰው ንጉሥ ማን ነው?',
      ansEn: 'Emperor Fasilides',
      ansAm: 'ዐፄ ፋሲለደስ',
      optEn: ['Emperor Susenyos', 'Emperor Fasilides', 'Emperor Iyasu I', 'Emperor Bakaffa'],
      expEn: 'Emperor Fasilides established Gondar as the permanent imperial capital, building iconic stone castles and restoring Orthodox worship.',
      ref: 'Church History of Ethiopia — Restoration of the Faith (1632)',
      route: '/library/history/fasilides-restoration'
    },
    {
      id: 'hist-p2-walatta-petros',
      promptEn: 'Which 17th-century holy woman and nun led courageous resistance against European religious imposition, founding seven monastic communities?',
      promptAm: 'በ17ኛው መቶ ክፍለ ዘመን የውጭ እምነት ተጽዕኖን በጽናት በመቃወም ሰባት ገዳማትን ያቋቋመችው ቅድስት እናት ማን ነች?',
      ansEn: 'Saint Walatta Petros',
      ansAm: 'ቅድስት ወለተ ጴጥሮስ',
      optEn: ['Saint Kristos Samra', 'Saint Walatta Petros', 'Queen Helena (Eleni)', 'Queen Mentewab'],
      expEn: 'Saint Walatta Petros endured exile and persecution for defending the Orthodox confession of Christ’s one divine-human nature.',
      ref: 'Synaxarium — Gadla Walatta Petros',
      route: '/library/saints/walatta-petros'
    },

    // 21-30: Scriptural, Manuscript & Modern Heritage
    {
      id: 'hist-p2-enoch-canon',
      promptEn: 'Which ancient apocalyptic book, preserved in its entirety solely in the classical Geez language, is part of the 81-book Ethiopian Orthodox Canon?',
      promptAm: 'በዓለም ሙሉ ቅጂው በግዕዝ ቋንቋ ብቻ ተጠብቆ የቆየውና በኢትዮጵያ 81 የቅዱሳት መጻሕፍት ቀኖና ውስጥ የሚገኘው ጥንታዊ መጽሐፍ የትኛው ነው?',
      ansEn: 'The Book of Enoch (1 Enoch / መጽሐፈ ሄኖክ)',
      ansAm: 'መጽሐፈ ሄኖክ',
      optEn: ['The Book of Enoch (1 Enoch / መጽሐፈ ሄኖክ)', 'The Book of Sirach', 'The Book of Tobit', 'The Apocalypse of Peter'],
      expEn: 'The Ethiopian Church alone preserved the complete text of 1 Enoch, revered for its messianic prophecies and angelic accounts.',
      ref: 'Ethiopian Biblical Canon — 1 Enoch',
      route: '/library/canon/enoch'
    },
    {
      id: 'hist-p2-jubilees',
      promptEn: 'Which ancient canonical book, known in Geez as "Metsihafe Kufale" (Book of Division), recounts sacred history from creation divided into 49-year jubilees?',
      promptAm: 'በግዕዝ "መጽሐፈ ኩፋሌ" በመባል የሚታወቀውና ታሪክን በ49 ዓመታት ኢዮቤልዩ ከፋፍሎ የሚገልጸው የቀኖና መጽሐፍ የትኛው ነው?',
      ansEn: 'The Book of Jubilees (መጽሐፈ ኩፋሌ)',
      ansAm: 'መጽሐፈ ኩፋሌ',
      optEn: ['The Book of Judith', 'The Book of Jubilees (መጽሐፈ ኩፋሌ)', 'The Shepherd of Hermas', 'The Book of Baruch'],
      expEn: 'Like Enoch, the complete text of Jubilees survived through Geez manuscripts treasured in Ethiopian monastic libraries.',
      ref: 'Ethiopian Biblical Canon — Jubilees',
      route: '/library/canon/jubilees'
    },
    {
      id: 'hist-p2-meqabyan',
      promptEn: 'The unique Ethiopian Orthodox canon contains three books of Meqabyan (Maccabees) that differ significantly from which western deuterocanonical books?',
      promptAm: 'የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ሦስቱ መጻሕፍተ መቃብያን ከየትኞቹ የምዕራባውያን መጻሕፍት የተለየ ይዘት አላቸው?',
      ansEn: 'Greek 1 and 2 Maccabees',
      ansAm: 'የግሪክ አንደኛና ሁለተኛ መቃብያን',
      optEn: ['Hebrew Chronicles', 'Greek 1 and 2 Maccabees', 'Latin Esdras', 'Syriac Baruch'],
      expEn: 'The Geez books of Meqabyan narrate the endurance of King Tsirutsaydan and Meqabis, unique to the 81-book Ethiopian canon.',
      ref: 'Ethiopian Biblical Canon — Books of Meqabyan',
      route: '/library/canon/meqabyan'
    },
    {
      id: 'hist-p2-anaphoras',
      promptEn: 'How many distinct official Anaphoras (Eucharistic liturgies) are traditionally celebrated in the Ethiopian Orthodox Tewahedo Church?',
      promptAm: 'በኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተ ክርስቲያን ሥርዓት ውስጥ በቅዳሴ ወቅት የሚፈራረቁ ስንት የተለያዩ ቅዳሴያት (አናፎራዎች) አሉ?',
      ansEn: 'Fourteen Official Anaphoras',
      ansAm: 'አሥራ አራት ይፋዊ ቅዳሴያት',
      optEn: ['Three Anaphoras', 'Seven Anaphoras', 'Fourteen Official Anaphoras', 'Twenty-four Anaphoras'],
      expEn: 'The liturgical tradition treasures 14 Anaphoras, including those of the Apostles, the Lord, Saint Mary, Saint John Chrysostom, and Saint Cyril.',
      ref: 'The Liturgy of the Ethiopian Orthodox Tewahedo Church',
      route: '/library/liturgy/anaphoras'
    },
    {
      id: 'hist-p2-alexandria-autocephaly',
      promptEn: 'In which year did the Ethiopian Church and the Coptic Patriarchate sign the formal agreement granting full autocephaly and the enthronement of the first Ethiopian Patriarch?',
      promptAm: 'የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተ ክርስቲያን ራስ ገዝነቷ (Autocephaly) ተረጋግጦ የመጀመሪያው ኢትዮጵያዊ ፓትርያርክ የተሾሙት በየትኛው ዓመት ነው?',
      ansEn: '1959 (1951 ዓ.ም.)',
      ansAm: '1959 እ.ኤ.አ. (1951 ዓ.ም.)',
      optEn: ['1930 (1922 ዓ.ም.)', '1959 (1951 ዓ.ም.)', '1974 (1966 ዓ.ም.)', '1991 (1983 ዓ.ም.)'],
      expEn: 'Patriarch Cyril VI of Alexandria consecrated Abuna Basilios as the first native Patriarch and Catholicos of Ethiopia in 1959.',
      ref: 'Modern History of the Ethiopian Patriarchate',
      route: '/library/history/autocephaly-1959'
    },
    {
      id: 'hist-p2-abuna-basilios',
      promptEn: 'Who served as the very first Ethiopian-born Patriarch of the Ethiopian Orthodox Tewahedo Church, enthroned in 1959?',
      promptAm: 'በ1951 ዓ.ም. (1959 እ.ኤ.አ.) የመጀመሪያው ተወላጅ የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተ ክርስቲያን ፓትርያርክ ሆነው የተሾሙት አባት ማን ናቸው?',
      ansEn: 'Abuna Basilios',
      ansAm: 'ብፁዕ ወቅዱስ አቡነ ባስልዮስ',
      optEn: ['Abuna Theophilos', 'Abuna Tekle Haymanot II', 'Abuna Basilios', 'Abuna Paulos'],
      expEn: 'Abuna Basilios led the church into its autocephalous era after sixteen centuries of Coptic episcopal appointment.',
      ref: 'Church History — Patriarchs of Ethiopia',
      route: '/library/history/abuna-basilios'
    },
    {
      id: 'hist-p2-debre-damos-rope',
      promptEn: 'What is the sole traditional means of ascending to the clifftop monastery of Debre Damo founded by Abba Aragawi?',
      promptAm: 'በአባ አረጋዊ የተመሠረተውን የደብረ ዳሞ ገዳም አቀበት ለመውጣት የሚያገለግለው ብቸኛ ባህላዊ መንገድ ምንድን ነው?',
      ansEn: 'A braided leather rope climbed up a 15-meter sheer cliff',
      ansAm: 'በ15 ሜትር ገደል ላይ የተንጠለጠለ የቆዳ ገመድ',
      optEn: ['A carved stone stairway', 'A wooden suspension bridge', 'A braided leather rope climbed up a 15-meter sheer cliff', 'A mechanical pulley basket'],
      expEn: 'Visitors and monks ascend the flat-topped amba using a thick leather rope (jende), preserving the sanctuary’s total isolation.',
      ref: 'Monastic Architecture — Debre Damo',
      route: '/library/monasteries/debre-damo'
    },
    {
      id: 'hist-p2-bete-giyorgis',
      promptEn: 'Which cross-shaped monolithic church in Lalibela, carved downward directly from a single bedrock trench, is dedicated to the victorious martyr Saint George?',
      promptAm: 'በላሊበላ ውስጥ ከመሬት በታች በመስቀል ቅርጽ ተፈልፍሎ የታነጸውና ለተራዳኢው ሰማዕት የተሰየመው ታዋቂው ቤተ ክርስቲያን የትኛው ነው?',
      ansEn: 'Bete Giyorgis (Church of Saint George)',
      ansAm: 'ቤተ ጊዮርጊስ',
      optEn: ['Bete Medhane Alem', 'Bete Giyorgis (Church of Saint George)', 'Bete Amanuel', 'Bete Golgotha'],
      expEn: 'Bete Giyorgis stands twelve meters tall inside an excavated trench, shaped like a free-standing Greek cross.',
      ref: 'Lalibela World Heritage — Bete Giyorgis',
      route: '/library/monasteries/bete-giyorgis'
    },
    {
      id: 'hist-p2-tselot-zeweter',
      promptEn: 'Which daily prayer office of the Ethiopian Orthodox Church includes the Lord’s Prayer, the Nicene Creed, and the Canticle of the Virgin Mary?',
      promptAm: 'የጌታን ጸሎት፣ የሃይማኖት ጸሎትንና የእመቤታችንን ምስጋና ያካተተው የዘወትር የጸሎት ክፍል ምን ይባላል?',
      ansEn: 'Zeweter Tselot (The Daily Prayer / የዘወትር ጸሎት)',
      ansAm: 'የዘወትር ጸሎት',
      optEn: ['Zeweter Tselot (The Daily Prayer / የዘወትር ጸሎት)', 'Meqabyan', 'Diggwa', 'Zikre Qiddusan'],
      expEn: 'Zeweter Tselot opens every prayer book and is recited daily by priests, monastics, and devout lay faithful.',
      ref: 'Prayer Book of the Ethiopian Church — Zeweter Tselot',
      route: '/library/prayers/zeweter'
    },
    {
      id: 'hist-p2-wudase-mariam',
      promptEn: 'Which revered 7-day Marian hymn collection, attributed to Saint Ephrem the Syrian and chanted each day of the week, is paired with the Praises of Mary?',
      promptAm: 'ለሳምንቱ ሰባት ቀናት የተከፋፈለና ከቅዱስ ኤፍሬም ጋር የተያያዘው የእመቤታችን ምስጋና ድርሰት ምን ይባላል?',
      ansEn: 'Wudase Mariam (Praises of Mary / ውዳሴ ማርያም)',
      ansAm: 'ውዳሴ ማርያም',
      optEn: ['Wudase Mariam (Praises of Mary / ውዳሴ ማርያም)', 'Anaphora of Dioscorus', 'Melkea Maryam', 'Kibre Negest'],
      expEn: 'Chanted alongside the Song of the Flower (Zemene Tsige) and daily prayer, Wudase Mariam is central to Ethiopian devotional life.',
      ref: 'Ethiopian Hymnography — Wudase Mariam',
      route: '/library/prayers/wudase-mariam'
    }
  ]

  const historyQuestions: PlayQuestion[] = []
  console.log('=== VALIDATING HISTORY QUEST PHASE 2 (30 QUESTIONS) ===')
  for (let i = 0; i < historyPromptsRaw.length; i++) {
    const raw = historyPromptsRaw[i]
    const correctKey = historyKeyPattern[i]

    const otherOpts = raw.optEn.filter(o => o !== raw.ansEn).slice(0, 3)
    const keys: Array<'a' | 'b' | 'c' | 'd'> = ['a', 'b', 'c', 'd']
    const wrongKeys = keys.filter(k => k !== correctKey)

    const optionsMap: Record<string, string> = {
      [correctKey]: raw.ansEn,
      [wrongKeys[0]]: otherOpts[0],
      [wrongKeys[1]]: otherOpts[1],
      [wrongKeys[2]]: otherOpts[2]
    }

    const question: PlayQuestion = {
      id: raw.id,
      game: 'history',
      category: 'church-history',
      difficulty: i < 10 ? 'beginner' : i < 22 ? 'growing' : 'challenge',
      prompt: {
        en: raw.promptEn,
        am: raw.promptAm
      },
      options: [
        { key: 'a', text: { en: optionsMap['a'] } },
        { key: 'b', text: { en: optionsMap['b'] } },
        { key: 'c', text: { en: optionsMap['c'] } },
        { key: 'd', text: { en: optionsMap['d'] } }
      ],
      correctKey,
      explanation: {
        en: raw.expEn
      },
      source: churchLib(raw.ref, raw.route),
      verifiedLocales: ['en']
    }

    const errors = validateStudioDraft({ game: 'history', content: question })
    if (errors.length > 0) {
      console.error(`Validation failed for history question ${question.id}:`, errors)
      process.exit(1)
    }

    historyQuestions.push(question)
  }

  // 10 new Chronological Timeline Events
  const historyTimelineEvents: HistoryStudioEvent[] = [
    {
      id: 'tl-p2-edict-milan',
      year: 313,
      label: { en: 'Edict of Milan grants tolerance to Christianity', am: 'የሚላን አዋጅ ለክርስትና ነፃነትን ሰጠ' },
      source: churchLib('Church History — Edict of Milan (AD 313)', '/library/history/edict-milan')
    },
    {
      id: 'tl-p2-axum-christianity',
      year: 330,
      label: { en: 'Axum adopts Christianity under King Ezana', am: 'የአክሱም መንግሥት ክርስትናን የመንግሥት ሃይማኖት አደረገ' },
      source: churchLib('Axumite Royal Inscriptions — King Ezana', '/library/history/ezana')
    },
    {
      id: 'tl-p2-frumentius-consecration',
      year: 340,
      label: { en: 'Frumentius consecrated first bishop of Axum by Athanasius', am: 'አባ ሰላማ ከሣቴ ብርሃን በአትናቴዎስ የመጀመሪያው ጳጳስ ሆነው ተሾሙ' },
      source: churchLib('Synaxarium — Hamle 26 (Abba Selama)', '/library/history/frumentius')
    },
    {
      id: 'tl-p2-nine-saints-arrival',
      year: 480,
      label: { en: 'Arrival of the Nine Saints in Axum', am: 'ተስዓቱ ቅዱሳን ወደ አክሱም ደረሱ' },
      source: churchLib('Synaxarium — The Nine Saints', '/library/history/nine-saints')
    },
    {
      id: 'tl-p2-yared-chant',
      year: 550,
      label: { en: 'Saint Yared introduces the three chant modes and Diggwa', am: 'ቅዱስ ያሬድ ሦስቱን የዜማ ስልቶችና ድጓን አዘጋጀ' },
      source: churchLib('Synaxarium — Ginbot 11 (Saint Yared)', '/library/hymns/yared')
    },
    {
      id: 'tl-p2-debre-damo-founded',
      year: 560,
      label: { en: 'Abba Aragawi establishes the clifftop monastery of Debre Damo', am: 'አባ አረጋዊ የደብረ ዳሞን ገዳም መሠረቱ' },
      source: churchLib('Synaxarium — Tikimt 14 (Abba Aragawi)', '/library/monasteries/debre-damo')
    },
    {
      id: 'tl-p2-lalibela-churches',
      year: 1200,
      label: { en: 'King Saint Lalibela carves the eleven monolithic churches of Roha', am: 'ንጉሥ ቅዱስ ላሊበላ አሥራ አንዱን ውቅር አብያተ ክርስቲያናት አንጸ' },
      source: churchLib('Synaxarium — Sene 12 (King Lalibela)', '/library/history/lalibela')
    },
    {
      id: 'tl-p2-tekle-haymanot-debre-libanos',
      year: 1284,
      label: { en: 'Abune Tekle Haymanot founds Debre Asbo (Debre Libanos)', am: 'አቡነ ተክለ ሃይማኖት ደብረ ሊባኖስን መሠረቱ' },
      source: churchLib('Synaxarium — Tahsas 24 (Abune Tekle Haymanot)', '/library/saints/tekle-haymanot')
    },
    {
      id: 'tl-p2-fasilides-gondar',
      year: 1632,
      label: { en: 'Emperor Fasilides restores the Orthodox faith and founds Gondar', am: 'ዐፄ ፋሲለደስ የቀደመችውን እምነት መለሱ፤ ጎንደርንም መሠረቱ' },
      source: churchLib('Church History of Ethiopia — Restoration (1632)', '/library/history/fasilides')
    },
    {
      id: 'tl-p2-autocephaly-ethiopia',
      year: 1959,
      label: { en: 'Ethiopian Church achieves full autocephaly under Patriarch Basilios', am: 'የኢትዮጵያ ቤተ ክርስቲያን ሙሉ ራስ ገዝነት አገኘች' },
      source: churchLib('Modern Patriarchate History — Autocephaly 1959', '/library/history/autocephaly')
    }
  ]

  // Validate History timeline events
  const tlDraftErrors = validateStudioDraft({ game: 'history', format: 'timeline', content: historyTimelineEvents })
  if (tlDraftErrors.length > 0) {
    console.error('Validation failed for history timeline events:', tlDraftErrors)
    process.exit(1)
  }

  // Save History artifacts
  const histDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-2', 'history')
  fs.mkdirSync(histDir, { recursive: true })
  fs.writeFileSync(path.join(histDir, 'questions.json'), JSON.stringify(historyQuestions, null, 2), 'utf8')
  fs.writeFileSync(path.join(histDir, 'timeline-events.json'), JSON.stringify(historyTimelineEvents, null, 2), 'utf8')

  const historyCmsDrafts = historyQuestions.map(q => ({
    stable_id: q.id,
    game_type: 'history' as const,
    category: q.category,
    difficulty: q.difficulty,
    payload: q,
    source_references: [q.source]
  }))
  fs.writeFileSync(path.join(histDir, 'cms-import.json'), JSON.stringify(historyCmsDrafts, null, 2), 'utf8')
  const historyImportPreview = previewQuestionImport(JSON.stringify(historyCmsDrafts), new Set())
  console.log(`History CMS Preview: ${historyImportPreview.items.length} items, ${historyImportPreview.errors.length} errors.`)

  fs.writeFileSync(path.join(histDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'history',
    phase: 2,
    acceptedQuestionsCount: historyQuestions.length,
    acceptedTimelineEventsCount: historyTimelineEvents.length,
    totalUnits: historyQuestions.length + historyTimelineEvents.length,
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')


  // =========================================================================
  // 2. BIBLE TIMELINE CHALLENGE (10 NEW CANONICAL CHAINS)
  // =========================================================================
  const timelineChains: TlChain[] = [
    // Chain 1: Primeval Beginnings (Creation to Enoch)
    {
      id: 'creation-to-enoch',
      title: { en: 'Creation to the Righteous Enoch', am: 'ከፍጥረት እስከ ጻድቁ ሄኖክ' },
      events: [
        { id: 'p2-tl-creation-light', title: { en: 'God speaks light into existence', am: 'እግዚአብሔር ብርሃንን በቃሉ ፈጠረ' }, ref: 'Genesis 1:3', route: '/bible/genesis/1', note: 'God said: Let there be light; and there was light on the first day.' },
        { id: 'p2-tl-garden-eden', title: { en: 'God plants the Garden of Eden', am: 'እግዚአብሔር የዔዴንን ገነት ተከለ' }, ref: 'Genesis 2:8', route: '/bible/genesis/2', note: 'The Lord God placed Adam in the garden to tend and keep it.' },
        { id: 'p2-tl-cain-abel-offering', title: { en: 'Abel offers a pleasing firstling sacrifice', am: 'አቤል የተወደደውን የበኵር መሥዋዕት አቀረበ' }, ref: 'Genesis 4:4', route: '/bible/genesis/4', note: 'The Lord respected Abel and his offering, while Cain grew jealous.' },
        { id: 'p2-tl-seth-born', title: { en: 'Seth is born to replace righteous Abel', am: 'ሴት በጻድቁ አቤል ምትክ ተወለደ' }, ref: 'Genesis 4:25', route: '/bible/genesis/4', note: 'Eve named him Seth, saying: God has appointed another seed for me.' },
        { id: 'p2-tl-enoch-walks', title: { en: 'Enoch walks with God and is taken without death', am: 'ሄኖክ አካሄዱን ከእግዚአብሔር ጋር አደረገ፤ አልተገኘምም' }, ref: 'Genesis 5:24', route: '/bible/genesis/5', note: 'Enoch walked with God three hundred years and was translated without seeing death.' }
      ]
    },

    // Chain 2: Life of Abraham
    {
      id: 'life-of-abraham',
      title: { en: 'The Journey of Abraham', am: 'የአባታችን አብርሃም ጉዞ' },
      events: [
        { id: 'p2-tl-abram-call-haran', title: { en: 'God calls Abram to leave Haran for Canaan', am: 'እግዚአብሔር አብራምን ከካራን ጠራው' }, ref: 'Genesis 12:1', route: '/bible/genesis/12', note: 'Get out of your country to a land that I will show you.' },
        { id: 'p2-tl-melchizedek-blessing', title: { en: 'Melchizedek king of Salem blesses Abram with bread and wine', am: 'የሳሌም ንጉሥ መልከ ጼዴቅ አብራምን ባረከው' }, ref: 'Genesis 14:18', route: '/bible/genesis/14', note: 'The priest of God Most High brought bread and wine, receiving tithes from Abram.' },
        { id: 'p2-tl-covenant-stars', title: { en: 'God counts Abram righteous and promises seed like the stars', am: 'እግዚአብሔር ዘሩን እንደ ከዋክብት እንደሚያበዛ ቃል ገባለት' }, ref: 'Genesis 15:6', route: '/bible/genesis/15', note: 'He believed in the Lord, and He accounted it to him for righteousness.' },
        { id: 'p2-tl-three-visitors-mamre', title: { en: 'Abraham welcomes three heavenly visitors by the oaks of Mamre', am: 'አብርሃም ሦስቱን እንግዶች በመምሬ ዛፍ ሥር አስተናገደ' }, ref: 'Genesis 18:2', route: '/bible/genesis/18', note: 'Abraham bowed to the ground and prepared fresh cakes and calf for them.' },
        { id: 'p2-tl-isaac-moriah', title: { en: 'Abraham binds Isaac upon the altar on Mount Moriah', am: 'አብርሃም ይስሐቅን በሞሪያ ተራራ ላይ አሰረው' }, ref: 'Genesis 22:9', route: '/bible/genesis/22', note: 'God provided a ram caught by its horns in a thicket in place of his son.' }
      ]
    },

    // Chain 3: Journey of Joseph
    {
      id: 'journey-of-joseph',
      title: { en: 'Joseph: From the Pit to Egypt’s Throne', am: 'ዮሴፍ፡ ከጉድጓድ እስከ ግብፅ ዙፋን' },
      events: [
        { id: 'p2-tl-joseph-dreams', title: { en: 'Joseph dreams of the sheaves and bowing stars', am: 'ዮሴፍ የነዶዎችንና የከዋክብትን ሕልም አየ' }, ref: 'Genesis 37:7', route: '/bible/genesis/37', note: 'His brothers hated him even more for his prophetic dreams.' },
        { id: 'p2-tl-joseph-pit-dothan', title: { en: 'Brothers cast Joseph into a pit at Dothan and sell him', am: 'ወንድሞቹ ዮሴፍን በዶታይን ጉድጓድ ጣሉት' }, ref: 'Genesis 37:24', route: '/bible/genesis/37', note: 'Sold to Ishmaelite merchants for twenty pieces of silver.' },
        { id: 'p2-tl-potiphar-house', title: { en: 'The Lord prospers Joseph in Potiphar’s household', am: 'እግዚአብሔር በጶጢፋር ቤት ከዮሴፍ ጋር ነበረ' }, ref: 'Genesis 39:2', route: '/bible/genesis/39', note: 'Potiphar made him overseer over his house and all that he owned.' },
        { id: 'p2-tl-pharaoh-dreams', title: { en: 'Joseph interprets Pharaoh’s dreams of seven fat and lean cows', am: 'ዮሴፍ የፈርዖንን የሰባቱ ላሞች ሕልም ፈታ' }, ref: 'Genesis 41:25', route: '/bible/genesis/41', note: 'Foreseeing seven years of abundance followed by seven years of famine.' },
        { id: 'p2-tl-joseph-reconciles', title: { en: 'Joseph reveals his identity and forgives his brothers', am: 'ዮሴፍ ማንነቱን ለወንድሞቹ ገለጠ፤ ይቅርም አላቸው' }, ref: 'Genesis 45:3', route: '/bible/genesis/45', note: 'You intended to harm me, but God intended it for good to save many people.' }
      ]
    },

    // Chain 4: The Wilderness Tabernacle
    {
      id: 'wilderness-tabernacle',
      title: { en: 'Moses and the Wilderness Sanctuary', am: 'ሙሴና የምድረ በዳው ማደሪያ' },
      events: [
        { id: 'p2-tl-red-sea-miracle', title: { en: 'Israel crosses the divided Red Sea safely', am: 'እስራኤል የተከፈለውን ቀይ ባሕር በሰላም ተሻገሩ' }, ref: 'Exodus 14:22', route: '/bible/exodus/14', note: 'The waters were a wall to them on their right hand and on their left.' },
        { id: 'p2-tl-sinai-covenant', title: { en: 'God delivers the Ten Commandments on Mount Sinai', am: 'እግዚአብሔር አሥርቱ ትእዛዛትን በደብረ ሲና ሰጠ' }, ref: 'Exodus 20:1', route: '/bible/exodus/20', note: 'Thunder, lightning, and a thick cloud covered the smoking mountain.' },
        { id: 'p2-tl-golden-calf-repentance', title: { en: 'Moses smashes the tablets and intercedes after the golden calf', am: 'ሙሴ ጽላቱን ሰብሮ ስለ ሕዝቡ ወደ እግዚአብሔር ማለደ' }, ref: 'Exodus 32:19', route: '/bible/exodus/32', note: 'Moses pleaded for the people and God renewed the covenant.' },
        { id: 'p2-tl-tabernacle-pattern', title: { en: 'Bezalel constructs the Tabernacle according to the divine pattern', am: 'ባስልኤል ማደሪያውን በታየው አምሳል ሠራ' }, ref: 'Exodus 36:1', route: '/bible/exodus/36', note: 'Filled with the Spirit of God in wisdom, understanding, and craftsmanship.' },
        { id: 'p2-tl-glory-cloud-fills', title: { en: 'The cloud covers the tent and God’s glory fills the Tabernacle', am: 'ደመናው ድንኳኑን ሸፈነው፤ የእግዚአብሔርም ክብር ሞላው' }, ref: 'Exodus 40:34', route: '/bible/exodus/40', note: 'The presence of the Lord guided Israel throughout all their journeys.' }
      ]
    },

    // Chain 5: Conquest and Judges
    {
      id: 'conquest-and-judges',
      title: { en: 'From Jordan Crossing to Samuel', am: 'ከዮርዳኖስ ማዶ እስከ ሳሙኤል' },
      events: [
        { id: 'p2-tl-jordan-stones', title: { en: 'Twelve memorial stones set up from the dry riverbed of the Jordan', am: 'ከዮርዳኖስ ወንዝ አሥራ ሁለት የመታሰቢያ ድንጋዮች ተነሡ' }, ref: 'Joshua 4:9', route: '/bible/joshua/4', note: 'A permanent memorial for generations that the waters of Jordan were cut off.' },
        { id: 'p2-tl-jericho-trumpets', title: { en: 'Priests blow ram’s horn trumpets and Jericho’s walls collapse', am: 'ካህናቱ ቀንደ መለከት ነፉ፤ የኢያሪኮም ቅጥር ወደቀ' }, ref: 'Joshua 6:20', route: '/bible/joshua/6', note: 'The people shouted with a great shout and the city wall fell flat.' },
        { id: 'p2-tl-deborah-song', title: { en: 'Deborah and Barak chant their hymn of victory after defeating Sisera', am: 'ዲቦራና ባራቅ የድል መዝሙራቸውን አቀረቡ' }, ref: 'Judges 5:1', route: '/bible/judges/5', note: 'Praising the Lord for the leaders in Israel who willingly offered themselves.' },
        { id: 'p2-tl-gideon-trumpets', title: { en: 'Gideon’s 300 break clay pitchers and blow trumpets at midnight', am: 'የጌዴዎን 300 ሰዎች ማሰሮዎችን ሰብረው መለከት ነፉ' }, ref: 'Judges 7:20', route: '/bible/judges/7', note: 'The sword of the Lord and of Gideon caused Midian to flee.' },
        { id: 'p2-tl-samuel-called-night', title: { en: 'Young Samuel hears God calling his name in the tabernacle of Shiloh', am: 'ብላቴናው ሳሙኤል በሴሎ የእግዚአብሔርን ጥሪ ሰማ' }, ref: '1 Samuel 3:10', route: '/bible/1-samuel/3', note: 'Speak, Lord, for your servant hears; Samuel was confirmed as prophet.' }
      ]
    },

    // Chain 6: Rise of King David
    {
      id: 'rise-of-david',
      title: { en: 'The Anointing and Reign of David', am: 'የንጉሥ ዳዊት ቅባትና መንግሥት' },
      events: [
        { id: 'p2-tl-david-anointed-bethlehem', title: { en: 'Samuel anoints the shepherd boy David in Bethlehem', am: 'ሳሙኤል እረኛውን ዳዊትን በቤተልሔም ቀባው' }, ref: '1 Samuel 16:13', route: '/bible/1-samuel/16', note: 'The Spirit of the Lord came upon David from that day forward.' },
        { id: 'p2-tl-david-goliath-slung', title: { en: 'David strikes Goliath in the forehead with a sling and stone', am: 'ዳዊት ጎልያድን በወንጭፍ ድንጋይ ግንባሩን መታው' }, ref: '1 Samuel 17:49', route: '/bible/1-samuel/17', note: 'The battle is the Lord’s; the giant fell upon his face to the ground.' },
        { id: 'p2-tl-david-crowned-hebron', title: { en: 'Elders of Israel crown David king over all Israel in Hebron', am: 'የእስራኤል ሽማግሌዎች ዳዊትን በኬብሮን አነገሡት' }, ref: '2 Samuel 5:3', route: '/bible/2-samuel/5', note: 'David was thirty years old when he became king, and he reigned forty years.' },
        { id: 'p2-tl-ark-brought-zion', title: { en: 'David brings the Ark of the Covenant to Mount Zion with dancing', am: 'ዳዊት ታቦቱን በደስታና በዝማሬ ወደ ጽዮን አመጣ' }, ref: '2 Samuel 6:14', route: '/bible/2-samuel/6', note: 'David danced before the Lord with all his might wearing a linen ephod.' },
        { id: 'p2-tl-david-covenant-throne', title: { en: 'God promises David an eternal throne through the prophet Nathan', am: 'እግዚአብሔር በነቢዩ ናታን አማካኝነት የዘላለም ዙፋን ቃል ገባለት' }, ref: '2 Samuel 7:16', route: '/bible/2-samuel/7', note: 'Your house and your kingdom shall be established forever before you.' }
      ]
    },

    // Chain 7: Elijah and Elisha
    {
      id: 'elijah-and-elisha',
      title: { en: 'The Ministries of Elijah and Elisha', am: 'የነቢያት ኤልያስና ኤልሳዕ ተጋድሎ' },
      events: [
        { id: 'p2-tl-carmel-fire-falls', title: { en: 'Fire consumes the sacrifice on Mount Carmel before all Israel', am: 'በደብረ ቀርሜሎስ መሥዋዕቱ በእሳት ተቃጠለ' }, ref: '1 Kings 18:38', route: '/bible/1-kings/18', note: 'The people fell on their faces crying: The Lord, He is God!' },
        { id: 'p2-tl-still-small-voice', title: { en: 'God speaks to Elijah in a still small voice at Mount Horeb', am: 'እግዚአብሔር ለኤልያስ በቀጭን ዝግታ ድምፅ ተናገረው' }, ref: '1 Kings 19:12', route: '/bible/1-kings/19', note: 'Not in the earthquake or fire, but in a gentle whispering breeze.' },
        { id: 'p2-tl-elijah-mantle-taken', title: { en: 'Elijah taken up in the whirlwind; his mantle falls upon Elisha', am: 'ኤልያስ በዐውሎ ነፋስ ዐረገ፤ መጎናጸፊያውም ለኤልሳዕ ወደቀች' }, ref: '2 Kings 2:13', route: '/bible/2-kings/2', note: 'Elisha struck the waters of the Jordan with the mantle and they parted.' },
        { id: 'p2-tl-shunammite-son-raised', title: { en: 'Elisha raises the Shunammite woman’s dead son to life', am: 'ኤልሳዕ የሱናማዊቷን ልጅ ከሞት አስነሣው' }, ref: '2 Kings 4:35', route: '/bible/2-kings/4', note: 'The boy sneezed seven times, opened his eyes, and was restored to his mother.' },
        { id: 'p2-tl-syrian-army-blinded', title: { en: 'God strikes the surrounding Syrian army with blindness at Dothan', am: 'እግዚአብሔር የሶርያን ሠራዊት በዕውርነት መታ' }, ref: '2 Kings 6:18', route: '/bible/2-kings/6', note: 'Those who are with us are more than those who are with them.' }
      ]
    },

    // Chain 8: Life of Christ (Galilee to Jerusalem)
    {
      id: 'christ-ministry-signs',
      title: { en: 'Signs in the Public Ministry of Christ', am: 'በክርስቶስ የማዳን አገልግሎት የተፈጸሙ ምልክቶች' },
      events: [
        { id: 'p2-tl-jordan-baptism-dove', title: { en: 'Christ is baptized; the Spirit descends as a dove', am: 'ክርስቶስ ተጠመቀ፤ መንፈስ ቅዱስም በርግብ አምሳል ወረደ' }, ref: 'Matthew 3:16', route: '/bible/matthew/3', note: 'This is my beloved Son, in whom I am well pleased.' },
        { id: 'p2-tl-cana-water-wine-sign', title: { en: 'Jesus performs His first sign turning water into wine at Cana', am: 'ኢየሱስ በቃና ዘገሊላ ውኃውን ወደ ወይን ለወጠ' }, ref: 'John 2:11', route: '/bible/john/2', note: 'He manifested His glory, and His disciples believed in Him.' },
        { id: 'p2-tl-five-thousand-fed-bread', title: { en: 'Jesus feeds five thousand with five loaves and two fish', am: 'ኢየሱስ አምስት ሺህ ሰዎችን በአምስት እንጀራ መገበ' }, ref: 'Matthew 14:19', route: '/bible/matthew/14', note: 'All ate and were filled; twelve baskets of leftovers remained.' },
        { id: 'p2-tl-tabor-transfiguration-glory', title: { en: 'The Transfiguration of Christ before Peter, James, and John', am: 'የክርስቶስ ክብር በደብረ ታቦር ተገለጠ' }, ref: 'Matthew 17:2', route: '/bible/matthew/17', note: 'His face shone like the sun and His garments became radiant light.' },
        { id: 'p2-tl-lazarus-raised-four-days', title: { en: 'Jesus raises Lazarus from the dead after four days in the tomb', am: 'ኢየሱስ አልዓዛርን ከአራት ቀናት መቃብር አስነሣው' }, ref: 'John 11:43', route: '/bible/john/11', note: 'I am the resurrection and the life; whoever believes in me shall never die.' }
      ]
    },

    // Chain 9: Holy Week and Pascha
    {
      id: 'holy-week-and-pascha',
      title: { en: 'Holy Passion Week to the Resurrection', am: 'ከሕማማት እስከ በዓለ ትንሣኤ' },
      events: [
        { id: 'p2-tl-hosanna-entry-colt', title: { en: 'Triumphant entry into Jerusalem on Palm Sunday', am: 'ሆሣዕና በኢየሩሳሌም በክብር መግባት' }, ref: 'Matthew 21:9', route: '/bible/matthew/21', note: 'Hosanna to the Son of David! Blessed is He who comes in the Lord’s name!' },
        { id: 'p2-tl-mystic-supper-bread-wine', title: { en: 'Christ institutes the Holy Eucharist at the Mystical Supper', am: 'ክርስቶስ በምሥጢራዊው እራት ቅዱስ ቍርባንን መሠረተ' }, ref: 'Matthew 26:26', route: '/bible/matthew/26', note: 'Take, eat; this is my body. Drink from it, all of you; this is my blood.' },
        { id: 'p2-tl-gethsemane-bloody-sweat', title: { en: 'Agony in the Garden of Gethsemane', am: 'በጌቴሴማኒ የአትክልት ስፍራ የጸሎት ተጋድሎ' }, ref: 'Luke 22:44', route: '/bible/luke/22', note: 'Not my will, but yours be done; His sweat was like great drops of blood.' },
        { id: 'p2-tl-golgotha-cross-finished', title: { en: 'Crucifixion and death of Christ on Golgotha on Good Friday', am: 'ስቅለተ ክርስቶስና ሞቱ በቀራንዮ' }, ref: 'John 19:30', route: '/bible/john/19', note: 'He bowed His head and gave up His spirit: It is finished!' },
        { id: 'p2-tl-pascha-empty-tomb-dawn', title: { en: 'The glorious Resurrection of Christ on the third day', am: 'የክርስቶስ ታላቅ ትንሣኤ በሦስተኛው ቀን' }, ref: 'Matthew 28:6', route: '/bible/matthew/28', note: 'He is not here; for He is risen, as He said. Come, see the place where the Lord lay.' }
      ]
    },

    // Chain 10: Early Church in Acts
    {
      id: 'early-church-witness',
      title: { en: 'Apostolic Witness in the Book of Acts', am: 'የሐዋርያት ምስክርነት በግብረ ሐዋርያት' },
      events: [
        { id: 'p2-tl-pentecost-tongues-fire', title: { en: 'Descent of the Holy Spirit in tongues of fire on Pentecost', am: 'በበዓለ ሃምሳ መንፈስ ቅዱስ በእሳት አምሳል ወረደ' }, ref: 'Acts 2:3', route: '/bible/acts/2', note: 'Divided tongues like fire rested upon each of them, filling them with the Spirit.' },
        { id: 'p2-tl-lame-man-beautiful-gate', title: { en: 'Peter heals the lame man at the Beautiful Gate of the Temple', am: 'ጴጥሮስ በቤተ መቅደስ ደጅ ሽባውን ሰው ፈወሰው' }, ref: 'Acts 3:6', route: '/bible/acts/3', note: 'In the name of Jesus Christ of Nazareth, rise up and walk!' },
        { id: 'p2-tl-stephen-martyrdom-stoned', title: { en: 'Stephen is stoned outside Jerusalem as the first martyr', am: 'እስጢፋኖስ የመጀመሪያው ሰማዕት ሆኖ ተወገረ' }, ref: 'Acts 7:59', route: '/bible/acts/7', note: 'Lord Jesus, receive my spirit; Lord, do not hold this sin against them.' },
        { id: 'p2-tl-ethiopian-eunuch-baptized', title: { en: 'Philip preaches to and baptizes the Ethiopian royal official', am: 'ፊልጶስ ኢትዮጵያዊውን ጃንደረባ አጠመቀው' }, ref: 'Acts 8:38', route: '/bible/acts/8', note: 'Both Philip and the eunuch went down into the water, and he baptized him.' },
        { id: 'p2-tl-paul-damascus-converted', title: { en: 'Saul blinded by heavenly light and converted on Damascus Road', am: 'ሳውል በደማስቆ መንገድ በሰማያዊ ብርሃን ተመለሰ' }, ref: 'Acts 9:4', route: '/bible/acts/9', note: 'Saul, Saul, why are you persecuting me? He arose, was baptized, and proclaimed Christ.' }
      ]
    }
  ]

  console.log('=== VALIDATING BIBLE TIMELINE CHALLENGE PHASE 2 (10 CHAINS) ===')
  for (const chain of timelineChains) {
    const errors = validateStudioDraft({ game: 'bible-timeline', content: chain })
    if (errors.length > 0) {
      console.error(`Validation failed for timeline chain ${chain.id}:`, errors)
      process.exit(1)
    }
  }

  // Simulate bank generation across easy, medium, and hard
  const easyRounds = buildTimelineBank('easy', 5, Math.random, timelineChains)
  const medRounds = buildTimelineBank('medium', 5, Math.random, timelineChains)
  const hardRounds = buildTimelineBank('hard', 5, Math.random, timelineChains)
  console.log(`Phase 2 timeline playable bank: Easy=${easyRounds.length}, Medium=${medRounds.length}, Hard=${hardRounds.length}`)

  // Save Timeline artifacts
  const tlDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-2', 'timeline')
  fs.mkdirSync(tlDir, { recursive: true })
  fs.writeFileSync(path.join(tlDir, 'chains.json'), JSON.stringify(timelineChains, null, 2), 'utf8')
  fs.writeFileSync(path.join(tlDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'bible-timeline',
    phase: 2,
    acceptedChainsCount: timelineChains.length,
    totalEventsCount: timelineChains.reduce((sum, c) => sum + c.events.length, 0),
    chainsSummary: timelineChains.map(c => ({ id: c.id, title: c.title.en, eventsCount: c.events.length })),
    bankSimulation: { easyRounds: easyRounds.length, mediumRounds: medRounds.length, hardRounds: hardRounds.length },
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')

  console.log('\n>>> Phase 2 History Quest and Bible Timeline Challenge generated and validated successfully! <<<')
}

run().catch(err => {
  console.error(err)
  process.exit(1)
})
