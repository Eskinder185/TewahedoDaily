import { writeFileSync, mkdirSync } from 'node:fs'
import { join } from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const { validateStudioDraft, toQuestionDraft } = await import('../../src/lib/play/contentStudio')
  const { validateQuestionDraft, previewQuestionImport } = await import('../../src/lib/play/questionLibrary')
  const { APPROVED_QUESTIONS } = await import('../../src/lib/play/approvedContent')
  const typeImport = await import('../../src/lib/play/types')

  type PlayQuestion = import('../../src/lib/play/types').PlayQuestion
  type HistoryStudioEvent = import('../../src/lib/play/contentStudio').HistoryStudioEvent

  const historyQuestions: PlayQuestion[] = [
    // 0: history-aksum-ezana -> a
    {
      id: 'history-aksum-ezana',
      game: 'history',
      category: 'Ethiopian Church history',
      difficulty: 'beginner',
      prompt: {
        en: 'Which Aksumite monarch formally embraced Christianity as the state religion in the 4th century?',
        am: 'በ4ኛው መቶ ክፍለ ዘመን ክርስትናን የመንግሥት ሃይማኖት አድርጎ የተቀበለው የትኛው የአክሱም ንጉሥ ነበረ?',
      },
      options: [
        { key: 'a', text: { en: 'King Ezana', am: 'ንጉሥ ዔዛና' } },
        { key: 'b', text: { en: 'King Kaleb', am: 'ንጉሥ ካሌብ' } },
        { key: 'c', text: { en: 'King Lalibela', am: 'ንጉሥ ላሊበላ' } },
        { key: 'd', text: { en: 'King Armah', am: 'ንጉሥ አርማሕ' } },
      ],
      correctKey: 'a',
      explanation: {
        en: 'King Ezana accepted Christianity through Saint Frumentius (Abba Selama) around AD 330, as evidenced by his inscribed stone stelae and coins.',
        am: 'ንጉሥ ዔዛና በአባ ሰላማ ከሣቴ ብርሃን አማካኝነት በ330 ዓ.ም አካባቢ ክርስትናን ተቀበለ፤ ይህም በድንጋይ ጽሑፎቹና በመሐለቆቹ ይመሰከራል።',
      },
      source: { label: 'Ethiopia Church History — Chapter One', route: '/library/read/church-history-ethiopia', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 1: history-nine-saints -> b
    {
      id: 'history-nine-saints',
      game: 'history',
      category: 'Ethiopian Church history',
      difficulty: 'growing',
      prompt: {
        en: 'Which group of holy fathers arrived in Ethiopia in the late 5th century to expand monasticism and translate the Scriptures into Geʽez?',
        am: 'በ5ኛው መቶ ክፍለ ዘመን ማብቂያ ላይ ገዳማዊ ሕይወትን ለማስፋፋትና ቅዱሳት መጻሕፍትን ወደ ግዕዝ ለመተርጎም ወደ ኢትዮጵያ የገቡት ቅዱሳን እነማን ናቸው?',
      },
      options: [
        { key: 'a', text: { en: 'The Seventy Disciples', am: 'ሰባው አርድዕት' } },
        { key: 'b', text: { en: 'The Nine Saints', am: 'ተስዓቱ ቅዱሳን (ዘጠኙ ቅዱሳን)' } },
        { key: 'c', text: { en: 'The Desert Fathers', am: 'የበርሃ አባቶች' } },
        { key: 'd', text: { en: 'The Three Cappadocians', am: 'ሦስቱ የቆጵሮስ አባቶች' } },
      ],
      correctKey: 'b',
      hints: [
        { en: 'They founded historic monasteries including Debre Damo and Abba Garima.', am: 'ደብረ ዳሞንና አባ ገሪማን ጨምሮ ታላላቅ ገዳማትን መሠረቱ።' },
        { en: 'They included Abba Aregawi, Abba Pantelewon, and Abba Garima.', am: 'አባ አረጋዊ፥ አባ ጰንጠሌዎንና አባ ገሪማ ከመካከላቸው ይጠቀሳሉ።' },
        { en: 'Read Ethiopia Church History.', am: 'የኢትዮጵያ ቤተ ክርስቲያን ታሪክን ያንብቡ።' },
      ],
      explanation: {
        en: 'The Nine Saints came to the Aksumite Empire around AD 480, founding monastic centers and translating Scripture into Geʽez.',
        am: 'ተስዓቱ ቅዱሳን በ480 ዓ.ም አካባቢ ወደ አክሱም መጥተው ገዳማትን አቋቋሙ፤ መጽሐፍ ቅዱስንም ወደ ግዕዝ ቋንቋ ተረጎሙ።',
      },
      source: { label: 'Ethiopia Church History — Chapter Two', route: '/library/read/church-history-ethiopia', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 2: history-garima-gospels -> c
    {
      id: 'history-garima-gospels',
      game: 'history',
      category: 'Ethiopian Church history',
      difficulty: 'challenge',
      prompt: {
        en: 'Which ancient monastery in Tigray preserves what is recognized among the oldest surviving illuminated Christian Gospel manuscripts in the world?',
        am: 'በዓለም ላይ ከታወቁት እጅግ ጥንታዊ ባለሥዕል የወንጌል ቅጂዎች አንዱ የሆነው ጥንታዊ ወንጌል የተጠበቀው በየትኛው ገዳም ነው?',
      },
      options: [
        { key: 'a', text: { en: 'Debre Libanos', am: 'ደብረ ሊባኖስ' } },
        { key: 'b', text: { en: 'Debre Bizen', am: 'ደብረ ቢዘን' } },
        { key: 'c', text: { en: 'Abba Garima Monastery', am: 'የአባ ገሪማ ገዳም' } },
        { key: 'd', text: { en: 'Debre Abbay', am: 'ደብረ አባይ' } },
      ],
      correctKey: 'c',
      explanation: {
        en: 'The Garima Gospels at Abba Garima Monastery near Adwa date to the Aksumite period and contain early illuminated Geʽez texts.',
        am: 'በአድዋ አቅራቢያ በሚገኘው የአባ ገሪማ ገዳም የሚገኙት የገሪማ ወንጌላት ከአክሱም ዘመን ጀምሮ የተጠበቁ ጥንታዊ የብራና ቅርሶች ናቸው።',
      },
      source: { label: 'Ethiopia Church History — Monasteries and Manuscripts', route: '/library/read/church-history-ethiopia', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 3: history-saint-yared-hymnody -> d
    {
      id: 'history-saint-yared-hymnody',
      game: 'history',
      category: 'Ethiopian Church history',
      difficulty: 'beginner',
      prompt: {
        en: 'Who is revered as the father of Ethiopian Church music and hymnody, author of the Deggwa in the 6th century?',
        am: 'በ6ኛው መቶ ክፍለ ዘመን ድጓን ያዘጋጀውና የኢትዮጵያ ቤተ ክርስቲያን ዜማ አባት ተብሎ የሚጠራው ቅዱስ ማን ነው?',
      },
      options: [
        { key: 'a', text: { en: 'Abba Samuel', am: 'አባ ሳሙኤል' } },
        { key: 'b', text: { en: 'Abune Tekle Haymanot', am: 'አቡነ ተክለ ሃይማኖት' } },
        { key: 'c', text: { en: 'Abba Giyorgis of Gasicha', am: 'አባ ጊዮርጊስ ዘጋስጫ' } },
        { key: 'd', text: { en: 'Saint Yared', am: 'ቅዱስ ያሬድ' } },
      ],
      correctKey: 'd',
      hints: [
        { en: 'He was inspired by three heavenly birds singing in praise.', am: 'በሦስት ሰማያውያን አዕዋፍ ዜማ መንፈሳዊ ምሥጢር ተገለጠለት።' },
        { en: 'He arranged the three modes of chant: Geʽez, Ezel, and Araray.', am: 'ሦስቱን የዜማ ስልቶች፦ ግዕዝ፥ ዕዝልና አራራይን አዘጋጀ።' },
        { en: 'Read Church History.', am: 'የቤተ ክርስቲያን ታሪክን ያንብቡ።' },
      ],
      explanation: {
        en: 'Saint Yared composed the Ethiopian hymnody in the reign of Emperor Gebre Meskel, instituting Geʽez, Ezel, and Araray chants.',
        am: 'ቅዱስ ያሬድ በዐፄ ገብረ መስቀል ዘመን መጽሐፈ ድጓን በማዘጋጀት ሦስቱን የዜማ ስልቶች ግዕዝ፥ ዕዝልና አራራይን ደነገገ።',
      },
      source: { label: 'Ethiopia Church History — Saint Yared', route: '/library/read/church-history-ethiopia', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 4: history-king-kaleb-arabia -> a
    {
      id: 'history-king-kaleb-arabia',
      game: 'history',
      category: 'Ethiopian Church history',
      difficulty: 'growing',
      prompt: {
        en: 'Which renowned Aksumite king led an expedition across the Red Sea in the 6th century to deliver persecuted Christians in Najran?',
        am: 'በ6ኛው መቶ ክፍለ ዘመን በናጅራን ይሰቃዩ የነበሩ ክርስቲያኖችን ለመታደግ ቀይ ባሕርን ተሻግሮ የዘመተው ታዋቂው የአክሱም ንጉሥ ማን ነው?',
      },
      options: [
        { key: 'a', text: { en: 'King Kaleb (Saint Elesbaan)', am: 'ንጉሥ ካሌብ' } },
        { key: 'b', text: { en: 'King Dil Na’od', am: 'ንጉሥ ድል ነዖድ' } },
        { key: 'c', text: { en: 'King Yekuno Amlak', am: 'ንጉሥ ይኩኖ አምላክ' } },
        { key: 'd', text: { en: 'King Susenyos', am: 'ንጉሥ ሱስንዮስ' } },
      ],
      correctKey: 'a',
      explanation: {
        en: 'King Kaleb defended the Christians of Najran and subsequently abdicated his throne to spend his remaining years in a monastery.',
        am: 'ንጉሥ ካሌብ የናጅራን ክርስቲያኖችን ከታደገ በኋላ መንግሥቱን ትቶ ገዳም በመግባት በጸሎት ኖረ።',
      },
      source: { label: 'Ethiopia Church History — Chapter Three', route: '/library/read/church-history-ethiopia', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 5: history-lalibela-churches -> b
    {
      id: 'history-lalibela-churches',
      game: 'history',
      category: 'Ethiopian Church history',
      difficulty: 'beginner',
      prompt: {
        en: 'Which holy Zagwe king is renowned for carving the eleven monolithic rock-hewn churches of Roha in the 12th–13th century?',
        am: 'በ12ኛውና 13ኛው መቶ ክፍለ ዘመን አሥራ አንዱን የሮሐ ድንቅ ውቅር አብያተ ክርስቲያናትን ያነጸው ቅዱስ የዛግዌ ንጉሥ ማን ነው?',
      },
      options: [
        { key: 'a', text: { en: 'King Mara Takla Haymanot', am: 'ንጉሥ ማራ ተክለ ሃይማኖት' } },
        { key: 'b', text: { en: 'King Saint Lalibela (Gebra Masqal)', am: 'ቅዱስ ላሊበላ' } },
        { key: 'c', text: { en: 'King Na’akueto La’ab', am: 'ንጉሥ ነዓኵቶ ለአብ' } },
        { key: 'd', text: { en: 'King Harbe', am: 'ንጉሥ ሀርቤ' } },
      ],
      correctKey: 'b',
      hints: [
        { en: 'The churches include Bete Giyorgis and Bete Medhane Alem.', am: 'አብያተ ክርስቲያናቱ ቤተ ጊዮርጊስንና ቤተ መድኃኔ ዓለምን ያካትታሉ።' },
        { en: 'He sought to recreate a new Jerusalem in the mountains of Lasta.', am: 'በላስታ ተራሮች አዲሲቱን ኢየሩሳሌም ለመገንባት ዐሰበ።' },
        { en: 'Read Ethiopia Church History.', am: 'የኢትዮጵያ ቤተ ክርስቲያን ታሪክን ያንብቡ።' },
      ],
      explanation: {
        en: 'Saint Lalibela directed the carving of the monolithic rock churches of Roha, assisted according to tradition by holy angels.',
        am: 'ቅዱስ ላሊበላ በመላእክት ረዳትነት አሥራ አንዱን ፍጹም የዐለት ውቅር አብያተ ክርስቲያናት በላስታ አነጸ።',
      },
      source: { label: 'Ethiopia Church History — Zagwe Dynasty', route: '/library/read/church-history-ethiopia', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 6: history-debre-damo-aregawi -> c
    {
      id: 'history-debre-damo-aregawi',
      game: 'history',
      category: 'Ethiopian Church history',
      difficulty: 'growing',
      prompt: {
        en: 'Which of the Nine Saints established the mountain monastery of Debre Damo, accessible only by climbing a leather rope?',
        am: 'ከተስዓቱ ቅዱሳን መካከል በገመድ (በማዕበል) ብቻ ወደሚወጣበት ገደላማ ደብር ደብረ ዳሞን የመሠረተው አባት ማን ነው?',
      },
      options: [
        { key: 'a', text: { en: 'Abba Pantelewon', am: 'አባ ጰንጠሌዎን' } },
        { key: 'b', text: { en: 'Abba Liqanos', am: 'አባ ሊቃኖስ' } },
        { key: 'c', text: { en: 'Abba Aregawi (Zemikael)', am: 'አባ አረጋዊ (ዘሚካኤል)' } },
        { key: 'd', text: { en: 'Abba Afse', am: 'አባ አፍጼ' } },
      ],
      correctKey: 'c',
      explanation: {
        en: 'Abba Aregawi scaled the flat-topped cliff of Debre Damo aided by a serpent as God willed, founding Ethiopia’s oldest surviving monastic community.',
        am: 'አባ አረጋዊ በእግዚአብሔር ፈቃድ ወደ ደብረ ዳሞ አምባ ወጥተው ጥንታዊውን ገዳም መሠረቱ።',
      },
      source: { label: 'Ethiopia Church History — Debre Damo', route: '/library/read/church-history-ethiopia', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 7: history-tekle-haymanot-shewa -> d
    {
      id: 'history-tekle-haymanot-shewa',
      game: 'history',
      category: 'Ethiopian Church history',
      difficulty: 'beginner',
      prompt: {
        en: 'Which great 13th-century saint founded the premier monastic seat of Debre Libanos in Shewa and sent evangelists throughout the land?',
        am: 'በ13ኛው መቶ ክፍለ ዘመን በሸዋ ታላቁን የደብረ ሊባኖስ ገዳም የመሠረተውና ወንጌላውያንን በየአቅጣጫው የላከው ታላቁ ጻድቅ ማን ነው?',
      },
      options: [
        { key: 'a', text: { en: 'Abba Gebre Menfes Qiddus', am: 'አቡነ ገብረ መንፈስ ቅዱስ' } },
        { key: 'b', text: { en: 'Abba Estifanos', am: 'አባ እስጢፋኖስ' } },
        { key: 'c', text: { en: 'Abba Samuel of Waldebba', am: 'አባ ሳሙኤል ዘዋልድባ' } },
        { key: 'd', text: { en: 'Abune Tekle Haymanot', am: 'አቡነ ተክለ ሃይማኖት' } },
      ],
      correctKey: 'd',
      hints: [
        { en: 'His mother was Saint Sarah and his father was Priest Tsega Ze’ab.', am: 'እናቱ ቅድስት ሣራ፥ አባቱ ጸጋ ዘአብ ይባላሉ።' },
        { en: 'He lived at Debre Damo and Hayq before founding Debre Asbo (Debre Libanos).', am: 'ደብረ ሊባኖስን ከመመሥረቱ በፊት በደብረ ዳሞና በሐይቅ እስጢፋኖስ ቆይቷል።' },
        { en: 'Read Church History.', am: 'የቤተ ክርስቲያን ታሪክን ያንብቡ።' },
      ],
      explanation: {
        en: 'Abune Tekle Haymanot founded Debre Libanos in Shewa around AD 1284, becoming a spiritual pillar of the Ethiopian Church.',
        am: 'አቡነ ተክለ ሃይማኖት በ1284 ዓ.ም ደብረ ሊባኖስን መሥርተው የኢትዮጵያ ቤተ ክርስቲያን ታላቅ መሪና ሐዋርያ ሆኑ።',
      },
      source: { label: 'Ethiopia Church History — Monasticism in Shewa', route: '/library/read/church-history-ethiopia', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 8: history-ewostatewos-reform -> a
    {
      id: 'history-ewostatewos-reform',
      game: 'history',
      category: 'Ethiopian Church history',
      difficulty: 'challenge',
      prompt: {
        en: 'Which 14th-century monastic leader vigorously defended the observance of the Saturday Sabbath alongside Sunday in northern Ethiopia?',
        am: 'በ14ኛው መቶ ክፍለ ዘመን ከእሑድ ጋር ቀዳሚት ሰንበትም እንድትከበር በጽናት የተሟገተውና ገዳማትን ያቋቋመው አባት ማን ነው?',
      },
      options: [
        { key: 'a', text: { en: 'Abba Ewostatewos', am: 'አባ ኤዎስጣቴዎስ' } },
        { key: 'b', text: { en: 'Abba Iyasus Mo’a', am: 'አባ ኢየሱስ ሞዐ' } },
        { key: 'c', text: { en: 'Abba Sinoda', am: 'አባ ሲኖዳ' } },
        { key: 'd', text: { en: 'Abba Daniel', am: 'አባ ዳንኤል' } },
      ],
      correctKey: 'a',
      explanation: {
        en: 'Abba Ewostatewos defended the biblical two Sabbaths (Saturday and Sunday), travelling as far as Armenia and Jerusalem in witness.',
        am: 'አባ ኤዎስጣቴዎስ ሁለቱ ሰንበታት እንዲከበሩ አስተማሩ፤ እስከ እየሩሳሌምና አርመንያም ድረስ ተጉዘው መሰከሩ።',
      },
      source: { label: 'Ethiopia Church History — The Ewostathian Movement', route: '/library/read/church-history-ethiopia', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 9: history-zera-yaqob-writings -> b
    {
      id: 'history-zera-yaqob-writings',
      game: 'history',
      category: 'Ethiopian Church history',
      difficulty: 'growing',
      prompt: {
        en: 'Which 15th-century Ethiopian emperor was a noted theologian and author of religious books including Metsihafe Berhan and Metsihafe Milad?',
        am: 'በ15ኛው መቶ ክፍለ ዘመን መጽሐፈ ብርሃንንና መጽሐፈ ምዕላድን ጨምሮ በርካታ የሃይማኖት መጻሕፍትን ያዘጋጀው ታዋቂው ንጉሥ ማን ነው?',
      },
      options: [
        { key: 'a', text: { en: 'Emperor Dawit I', am: 'ዐፄ ዳዊት ቀዳማዊ' } },
        { key: 'b', text: { en: 'Emperor Zera Yaqob', am: 'ዐፄ ዘርዐ ያዕቆብ' } },
        { key: 'c', text: { en: 'Emperor Baeda Maryam', am: 'ዐፄ በእደ ማርያም' } },
        { key: 'd', text: { en: 'Emperor Lebna Dengel', am: 'ዐፄ ልብነ ድንግል' } },
      ],
      correctKey: 'b',
      explanation: {
        en: 'Emperor Zera Yaqob (1434–1468) composed fundamental liturgical and theological treatises and standardized Church feasts.',
        am: 'ዐፄ ዘርዐ ያዕቆብ (1434-1468) መጽሐፈ ብርሃንን በማዘጋጀትና የበዓላትን ሥርዐት በማጽናት የቤተ ክርስቲያን ትምህርትን አጠናከሩ።',
      },
      source: { label: 'Ethiopia Church History — Reign of Zera Yaqob', route: '/library/read/church-history-ethiopia', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 10: history-council-jerusalem-acts -> c
    {
      id: 'history-council-jerusalem-acts',
      game: 'history',
      category: 'World Church history',
      difficulty: 'growing',
      prompt: {
        en: 'According to Acts 15, which historic apostolic gathering resolved that Gentile believers were not bound to circumcision?',
        am: 'በሐዋርያት ሥራ 15 መሠረት ከአሕዛብ ያመኑ ክርስቲያኖች በኦሪት ግርዛት እንዳይገደዱ የወሰነው የመጀመሪያው የሐዋርያት ጉባኤ የትኛው ነው?',
      },
      options: [
        { key: 'a', text: { en: 'The Council of Antioch', am: 'የአንጾኪያ ጉባኤ' } },
        { key: 'b', text: { en: 'The Council of Rome', am: 'የሮም ጉባኤ' } },
        { key: 'c', text: { en: 'The Apostolic Council of Jerusalem', am: 'የኢየሩሳሌም የሐዋርያት ጉባኤ' } },
        { key: 'd', text: { en: 'The Council of Corinth', am: 'የቆሮንቶስ ጉባኤ' } },
      ],
      correctKey: 'c',
      explanation: {
        en: 'The Council of Jerusalem held around AD 50 by the Apostles established freedom from Mosaic ceremonial burdens for Gentile converts.',
        am: 'በ50 ዓ.ም አካባቢ በኢየሩሳሌም የተሰበሰበው የሐዋርያት ጉባኤ አሕዛብ በጸጋ እንዲድኑና በግርዛት እንዳይገደዱ ወሰነ።',
      },
      source: { label: 'Acts 15:6', route: '/bible/acts/15', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 11: history-council-nicaea-athanasius -> d
    {
      id: 'history-council-nicaea-athanasius',
      game: 'history',
      category: 'World Church history',
      difficulty: 'beginner',
      prompt: {
        en: 'Which young deacon of Alexandria championed the true divinity of Christ against Arius at the First Ecumenical Council of Nicaea (AD 325)?',
        am: 'በ325 ዓ.ም በኒቂያ የመጀመሪያው ዓለም አቀፍ ጉባኤ ላይ የአርዮስን ክህደት ተከራክሮ የክርስቶስን እውነተኛ አምላክነት የመሰከረው ወጣት የእስክንድርያ ዲያቆን ማን ነበር?',
      },
      options: [
        { key: 'a', text: { en: 'Saint Gregory the Theologian', am: 'ቅዱስ ጎርጎርዮስ ዘነዚናንዙ' } },
        { key: 'b', text: { en: 'Saint Basil the Great', am: 'ቅዱስ ባስልዮስ ዘቂሣርያ' } },
        { key: 'c', text: { en: 'Saint John Chrysostom', am: 'ቅዱስ ዮሐንስ አፈወርቅ' } },
        { key: 'd', text: { en: 'Saint Athanasius the Apostolic', am: 'ቅዱስ አትናቴዎስ ሐዋርያዊ' } },
      ],
      correctKey: 'd',
      hints: [
        { en: 'He defended the Creed: “Begotten, not made, being of one essence with the Father.”', am: '“የተወለደ እንጂ ያልተፈጠረ፥ በባሕርዩ ከአብ ጋር አንድ የሆነ” የሚለውን የሃይማኖት ጸሎት አረጋገጠ።' },
        { en: 'He later became Patriarch of Alexandria and consecrated Saint Frumentius for Ethiopia.', am: 'በኋላም የእስክንድርያ ፓትርያርክ ሆኖ አባ ሰላማን ለኢትዮጵያ ሾመ።' },
        { en: 'Read World Church History.', am: 'የዓለም አብያተ ክርስቲያናት ታሪክን ያንብቡ።' },
      ],
      explanation: {
        en: 'Saint Athanasius defended the Nicene faith that the Son is consubstantial (Homooúsios) with the Father, defeating the heresy of Arius.',
        am: 'ቅዱስ አትናቴዎስ በኒቂያ ጉባኤ ወልድ ከአብ ጋር በባሕርይ አንድ እንደ ሆነ በጽናት አስረድቶ የአርዮስን ትምህርት አወገዘ።',
      },
      source: { label: 'World Church History — Council of Nicaea', route: '/library/read/church-history-worldwide', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 12: history-council-constantinople-spirit -> a
    {
      id: 'history-council-constantinople-spirit',
      game: 'history',
      category: 'World Church history',
      difficulty: 'growing',
      prompt: {
        en: 'Which Ecumenical Council convened in AD 381 to condemn Macedonius and complete the Creed regarding the divinity of the Holy Spirit?',
        am: 'በ381 ዓ.ም የመቄዶንዮስን ክህደት አውግዞ የመንፈስ ቅዱስን አምላክነት በጸሎተ ሃይማኖት ያረጋገጠው ሁለተኛው ዓለም አቀፍ ጉባኤ የትኛው ነው?',
      },
      options: [
        { key: 'a', text: { en: 'Council of Constantinople', am: 'የቍስጥንጥንያ ጉባኤ' } },
        { key: 'b', text: { en: 'Council of Ephesus', am: 'የኤፌሶን ጉባኤ' } },
        { key: 'c', text: { en: 'Council of Chalcedon', am: 'የኬልቄዶን ጉባኤ' } },
        { key: 'd', text: { en: 'Council of Carthage', am: 'የካርቴጅ ጉባኤ' } },
      ],
      correctKey: 'a',
      explanation: {
        en: 'The Council of Constantinople (150 fathers) affirmed: “And in the Holy Spirit, the Lord and Giver of Life, who proceedeth from the Father.”',
        am: 'የቍስጥንጥንያ 150 አበው ጉባኤ “በመንፈስ ቅዱስም እናምናለን፤ እርሱም ጌታ ሕይወትን የሚሰጥ ከአብ የሠረጸ” በማለት ጸሎተ ሃይማኖትን አጠናቀቀ።',
      },
      source: { label: 'World Church History — Council of Constantinople', route: '/library/read/church-history-worldwide', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 13: history-council-ephesus-theotokos -> b
    {
      id: 'history-council-ephesus-theotokos',
      game: 'history',
      category: 'World Church history',
      difficulty: 'beginner',
      prompt: {
        en: 'Which Ecumenical Council gathered in AD 431 under Saint Cyril of Alexandria to uphold the title Theotokos (Bearer of God) against Nestorius?',
        am: 'በ431 ዓ.ም በቅዱስ ቄርሎስ መሪነት ተሰብስቦ የንስጥሮስን ክህደት በማውገዝ እመቤታችንን ወላዲተ አምላክ (ቴዎቶኮስ) ብሎ ያጸደቀው ሦስተኛው ጉባኤ የትኛው ነው?',
      },
      options: [
        { key: 'a', text: { en: 'Council of Nicaea', am: 'የኒቂያ ጉባኤ' } },
        { key: 'b', text: { en: 'Council of Ephesus', am: 'የኤፌሶን ጉባኤ' } },
        { key: 'c', text: { en: 'Council of Antioch', am: 'የአንጾኪያ ጉባኤ' } },
        { key: 'd', text: { en: 'Council of Alexandria', am: 'የእስክንድርያ ጉባኤ' } },
      ],
      correctKey: 'b',
      hints: [
        { en: 'The council had two hundred holy bishops presided over by Saint Cyril.', am: 'በቅዱስ ቄርሎስ ሊቀ መንበርነት ሁለት መቶ ኤጲስ ቆጶሳት ተሰበሰቡ።' },
        { en: 'It affirmed that Christ is one Incarnate Person, truly God and truly man.', am: 'ክርስቶስ ፍጹም አምላክና ፍጹም ሰው የሆነ አንድ አካል አንድ ባሕርይ መሆኑን አረጋገጠ።' },
        { en: 'Read World Church History.', am: 'የዓለም አብያተ ክርስቲያናት ታሪክን ያንብቡ።' },
      ],
      explanation: {
        en: 'The Council of Ephesus confessed that the Word became flesh, so that the Holy Virgin Mary is truly Theotokos (Yeweledat Amlak).',
        am: 'የኤፌሶን ጉባኤ ቃል ሥጋ ሆነ ብሎ በማመን ድንግል ማርያም በእውነት ወላዲተ አምላክ መሆኗን አጸና።',
      },
      source: { label: 'World Church History — Council of Ephesus', route: '/library/read/church-history-worldwide', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 14: history-cyril-alexandria-miaphysite -> c
    {
      id: 'history-cyril-alexandria-miaphysite',
      game: 'history',
      category: 'World Church history',
      difficulty: 'challenge',
      prompt: {
        en: 'Which venerable Patriarch of Alexandria formulated the Christological definition “One Nature of the Incarnate God the Word”?',
        am: '“ተዋሕዶ” ተብሎ ለሚታወቀው የኦርቶዶክስ ተዋሕዶ እምነት “አንድ ባሕርይ ዘቃል ሥጉው” የሚለውን ትምህርት ያረጋገጠው የእስክንድርያ ፓትርያርክ ማን ነው?',
      },
      options: [
        { key: 'a', text: { en: 'Saint Clement of Alexandria', am: 'ቅዱስ ቀሌምንጦስ ዘእስክንድርያ' } },
        { key: 'b', text: { en: 'Saint Peter the Martyr', am: 'ቅዱስ ጴጥሮስ ተፍጻሜተ ሰማዕት' } },
        { key: 'c', text: { en: 'Saint Cyril of Alexandria', am: 'ቅዱስ ቄርሎስ ዓምደ ሃይማኖት' } },
        { key: 'd', text: { en: 'Saint Timothy Aelurus', am: 'ቅዱስ ጢሞቴዎስ' } },
      ],
      correctKey: 'c',
      explanation: {
        en: 'Saint Cyril, called Pillar of the Faith (Amde Haymanot), established the unconfused and undivided unity of deity and humanity in Christ.',
        am: 'ቅዱስ ቄርሎስ ዓምደ ሃይማኖት የመለኮትና የትስብእትን ያለመቀላቀልና ያለመለያየት መዋሐድ በምሥጢረ ተዋሕዶ አስተማረ።',
      },
      source: { label: 'World Church History — Chapter Six', route: '/library/read/church-history-worldwide', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 15: history-mark-alexandria-see -> d
    {
      id: 'history-mark-alexandria-see',
      game: 'history',
      category: 'World Church history',
      difficulty: 'beginner',
      prompt: {
        en: 'Which Evangelist preached the Gospel in Alexandria and established the Apostolic See from which Ethiopia historically received its Abunas?',
        am: 'በእስክንድርያ ወንጌልን ሰብኮ ቤተ ክርስቲያንን የመሠረተውና ኢትዮጵያም በታሪክ ጳጳሳቷን ትቀበልበት የነበረው ወንጌላዊ ማን ነው?',
      },
      options: [
        { key: 'a', text: { en: 'Saint Luke the Physician', am: 'ቅዱስ ሉቃስ ሐኪም' } },
        { key: 'b', text: { en: 'Saint Matthew the Apostle', am: 'ቅዱስ ማቴዎስ ሐዋርያ' } },
        { key: 'c', text: { en: 'Saint John the Theologian', am: 'ቅዱስ ዮሐንስ ወንጌላዊ' } },
        { key: 'd', text: { en: 'Saint Mark the Evangelist', am: 'ቅዱስ ማርቆስ ወንጌላዊ' } },
      ],
      correctKey: 'd',
      hints: [
        { en: 'He was martyred at Alexandria and wrote the second Gospel.', am: 'በእስክንድርያ በሰማዕትነት ዐረፈ፤ ሁለተኛውን ወንጌልም ጻፈ።' },
        { en: 'His mother’s house in Jerusalem was the upper room of the Last Supper.', am: 'የእናቱ የማርያም ቤት በኢየሩሳሌም የመጨረሻው ራት የተከናወነበት ሰገነት ነበር።' },
        { en: 'Read Church History.', am: 'የቤተ ክርስቲያን ታሪክን ያንብቡ።' },
      ],
      explanation: {
        en: 'Saint Mark the Apostle and Evangelist brought the Gospel to Egypt and founded the Patriarchate of Alexandria.',
        am: 'ቅዱስ ማርቆስ ወንጌላዊ በእስክንድርያ ክርስትናን በመስበክ ጥንታዊውን መንበር መሠረተ።',
      },
      source: { label: 'World Church History — The Apostolic Sees', route: '/library/read/church-history-worldwide', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 16: history-anthony-monasticism -> a
    {
      id: 'history-anthony-monasticism',
      game: 'history',
      category: 'World Church history',
      difficulty: 'beginner',
      prompt: {
        en: 'Who is venerated across Christendom as the father of all Christian monks, having retreated into the Egyptian desert in the 3rd century?',
        am: 'በ3ኛው መቶ ክፍለ ዘመን ወደ ግብፅ ምድረ በዳ በመግባት ለመላው ክርስቲያን ገዳማውያን አባት ተብሎ የሚታወቀው ቅዱስ ማን ነው?',
      },
      options: [
        { key: 'a', text: { en: 'Saint Anthony the Great', am: 'አባ እንጦንስ ታላቁ' } },
        { key: 'b', text: { en: 'Saint Macarius the Great', am: 'አባ መቃርስ ታላቁ' } },
        { key: 'c', text: { en: 'Saint Arsenius', am: 'አባ አርሳኒ' } },
        { key: 'd', text: { en: 'Saint Paul the Hermit', am: 'አባ ጳውሊ' } },
      ],
      correctKey: 'a',
      explanation: {
        en: 'Saint Anthony the Great answered Christ’s counsel “sell that thou hast and give to the poor” and initiated monastic solitary life.',
        am: 'አባ እንጦንስ የክርስቶስን “ያለህን ሽጠህ ለድሆች ስጥ” የሚለውን ቃል ሰምቶ ወደ ምድረ በዳ በመግባት የገዳማዊ ሕይወት መሪ ሆነ።',
      },
      source: { label: 'World Church History — Monastic Pioneers', route: '/library/read/church-history-worldwide', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 17: history-pachomius-koinonia -> b
    {
      id: 'history-pachomius-koinonia',
      game: 'history',
      category: 'World Church history',
      difficulty: 'growing',
      prompt: {
        en: 'Which desert father structured communal (cenobitic) monasticism with a common rule, work, and prayer in Upper Egypt?',
        am: 'በላይኛው ግብፅ የጋራ ሕይወትን፥ የጋራ ጸሎትንና ሥራን ደንግጎ ማኅበራዊ (ማኅበር) ገዳማዊ ሥርዐትን ያቋቋመው አባት ማን ነው?',
      },
      options: [
        { key: 'a', text: { en: 'Saint Hilarion', am: 'ቅዱስ ሂላሪዮን' } },
        { key: 'b', text: { en: 'Saint Pachomius', am: 'አባ ጳኵሚስ' } },
        { key: 'c', text: { en: 'Saint Ephrem the Syrian', am: 'ቅዱስ ኤፍሬም ሶርያዊ' } },
        { key: 'd', text: { en: 'Saint Moses the Black', am: 'አባ ሙሴ ጸሊም' } },
      ],
      correctKey: 'b',
      explanation: {
        en: 'Saint Pachomius established the first cenobitic monastic rule at Tabennisi, which influenced monasteries throughout Ethiopia and the East.',
        am: 'አባ ጳኵሚስ በታቤኒሲ ማኅበራዊ ገዳማዊ ሕግን በመደንገግ ለመነኮሳት የጋራ ሕይወትን ሥርዐት ሠራ።',
      },
      source: { label: 'World Church History — Monastic Rules', route: '/library/read/church-history-worldwide', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 18: history-salama-consecration -> c
    {
      id: 'history-salama-consecration',
      game: 'history',
      category: 'Ethiopian Church history',
      difficulty: 'growing',
      prompt: {
        en: 'By whom was Saint Frumentius (Abba Selama) consecrated as the first Bishop of Axum and Ethiopia?',
        am: 'አባ ሰላማ ከሣቴ ብርሃን የመጀመሪያው የአክሱምና የኢትዮጵያ ጳጳስ ሆነው የተሾሙት በማን እጅ ነበር?',
      },
      options: [
        { key: 'a', text: { en: 'Saint Alexander of Alexandria', am: 'ቅዱስ እስክንድሮስ' } },
        { key: 'b', text: { en: 'Saint Cyril of Jerusalem', am: 'ቅዱስ ቄርሎስ ዘኢየሩሳሌም' } },
        { key: 'c', text: { en: 'Saint Athanasius the Apostolic', am: 'ቅዱስ አትናቴዎስ ሐዋርያዊ' } },
        { key: 'd', text: { en: 'Saint Dioscorus', am: 'ቅዱስ ዲዮስቆሮስ' } },
      ],
      correctKey: 'c',
      explanation: {
        en: 'Saint Athanasius the Great recognized Frumentius’ divine calling and consecrated him Bishop of the See of Saint Mark for Ethiopia.',
        am: 'ቅዱስ አትናቴዎስ ሐዋርያዊ የአባ ሰላማን መንፈሳዊ ብቃት አይቶ የመጀመሪያው የኢትዮጵያ ጳጳስ አድርጎ ሾማቸው።',
      },
      source: { label: 'Ethiopia Church History — Consecration of Abba Selama', route: '/library/read/church-history-ethiopia', kind: 'church-library' },
      verifiedLocales: ['en'],
    },

    // 19: history-giyorgis-sagla-mestir -> d
    {
      id: 'history-giyorgis-sagla-mestir',
      game: 'history',
      category: 'Ethiopian Church history',
      difficulty: 'challenge',
      prompt: {
        en: 'Which brilliant 14th–15th century Ethiopian theologian and scholar authored the monumental theological work Metsihafe Mestir (Book of Mystery)?',
        am: 'በ14ኛውና 15ኛው መቶ ክፍለ ዘመን ታላቁን የነገረ መለኮት ድርሰት “መጽሐፈ ምሥጢር”ን ያዘጋጀው ታላቁ የኢትዮጵያ ሊቅ ማን ነው?',
      },
      options: [
        { key: 'a', text: { en: 'Abba Bahrey', am: 'አባ ባሕርይ' } },
        { key: 'b', text: { en: 'Abune Habte Maryam', am: 'አቡነ ሀብተ ማርያም' } },
        { key: 'c', text: { en: 'Abba Yohannes Kama', am: 'አባ ዮሐንስ ካማ' } },
        { key: 'd', text: { en: 'Abba Giyorgis of Gasicha (Sagla)', am: 'አባ ጊዮርጊስ ዘጋስጫ (ዘሣግላ)' } },
      ],
      correctKey: 'd',
      hints: [
        { en: 'He was an educator of royal princes at the court of Emperor Dawit I.', am: 'በዐፄ ዳዊት ቤተ መንግሥት የልዑላን አስተማሪና መምህር ነበር።' },
        { en: 'His book contains refutations of thirty heresies arranged according to Church feasts.', am: 'መጽሐፉ በበዓላት የተከፋፈሉ የሠላሳ የኑፋቄ ትምህርቶች መልሶችን ይዟል።' },
        { en: 'Read Ethiopia Church History.', am: 'የኢትዮጵያ ቤተ ክርስቲያን ታሪክን ያንብቡ።' },
      ],
      explanation: {
        en: 'Abba Giyorgis of Gasicha completed Metsihafe Mestir in 1424, providing a masterwork of Orthodox Christology and defense of the faith.',
        am: 'አባ ጊዮርጊስ ዘጋስጫ በ1424 ዓ.ም መጽሐፈ ምሥጢርን በማጠናቀቅ ጥልቅ የሆነውን የተዋሕዶ ሃይማኖት ትምህርት አብራራ።',
      },
      source: { label: 'Ethiopia Church History — Abba Giyorgis of Gasicha', route: '/library/read/church-history-ethiopia', kind: 'church-library' },
      verifiedLocales: ['en'],
    },
  ]

  // Verified chronological events in strict AD year order (1 to 3000)
  const historyTimelineEvents: HistoryStudioEvent[] = [
    {
      id: 'hist-ad-34-stephen',
      year: 34,
      label: { en: 'Martyrdom of Saint Stephen and Council of Jerusalem', am: 'የቅዱስ እስጢፋኖስ ሰማዕትነትና የኢየሩሳሌም ጉባኤ' },
      source: { label: 'Acts 7:59', route: '/bible/acts/7', kind: 'bible' },
    },
    {
      id: 'hist-ad-325-nicaea',
      year: 325,
      label: { en: 'First Ecumenical Council of Nicaea convenes 318 fathers', am: '318ቱ ሊቃውንት የተሰበሰቡበት የመጀመሪያው የኒቂያ ጉባኤ' },
      source: { label: 'World Church History — Council of Nicaea', route: '/library/read/church-history-worldwide', kind: 'church-library' },
    },
    {
      id: 'hist-ad-330-aksum-christianity',
      year: 330,
      label: { en: 'Establishment of Christianity in Aksum under King Ezana and Saint Frumentius', am: 'በንጉሥ ዔዛና እና በአባ ሰላማ አማካኝነት ክርስትና በአክሱም ጸና' },
      source: { label: 'Ethiopia Church History — Chapter One', route: '/library/read/church-history-ethiopia', kind: 'church-library' },
    },
    {
      id: 'hist-ad-381-constantinople',
      year: 381,
      label: { en: 'Second Ecumenical Council of Constantinople confirms the divinity of the Holy Spirit', am: 'የመንፈስ ቅዱስ አምላክነት የተረጋገጠበት የቍስጥንጥንያ ጉባኤ' },
      source: { label: 'World Church History — Council of Constantinople', route: '/library/read/church-history-worldwide', kind: 'church-library' },
    },
    {
      id: 'hist-ad-431-ephesus',
      year: 431,
      label: { en: 'Third Ecumenical Council of Ephesus proclaims the Virgin Mary as Theotokos', am: 'ድንግል ማርያም ወላዲተ አምላክ መሆኗ የታወጀበት የኤፌሶን ጉባኤ' },
      source: { label: 'World Church History — Council of Ephesus', route: '/library/read/church-history-worldwide', kind: 'church-library' },
    },
    {
      id: 'hist-ad-480-nine-saints',
      year: 480,
      label: { en: 'Arrival of the Nine Saints in Ethiopia expanding monastic foundations and Geʽez translations', am: 'ተስዓቱ ቅዱሳን ወደ ኢትዮጵያ ገብተው ገዳማትን አቋቋሙ' },
      source: { label: 'Ethiopia Church History — Chapter Two', route: '/library/read/church-history-ethiopia', kind: 'church-library' },
    },
    {
      id: 'hist-ad-550-saint-yared',
      year: 550,
      label: { en: 'Saint Yared arranges the sacred chant Deggwa during the reign of Emperor Gebre Meskel', am: 'ቅዱስ ያሬድ በዐፄ ገብረ መስቀል ዘመን ድጓን አዘጋጀ' },
      source: { label: 'Ethiopia Church History — Saint Yared', route: '/library/read/church-history-ethiopia', kind: 'church-library' },
    },
    {
      id: 'hist-ad-1200-lalibela-churches',
      year: 1200,
      label: { en: 'King Saint Lalibela carves the eleven monolithic rock-hewn churches of Roha', am: 'ቅዱስ ላሊበላ አሥራ አንዱን የሮሐ ውቅር አብያተ ክርስቲያናት አነጸ' },
      source: { label: 'Ethiopia Church History — Zagwe Dynasty', route: '/library/read/church-history-ethiopia', kind: 'church-library' },
    },
    {
      id: 'hist-ad-1284-debre-libanos',
      year: 1284,
      label: { en: 'Abune Tekle Haymanot establishes Debre Libanos Monastery in Shewa', am: 'አቡነ ተክለ ሃይማኖት በሸዋ ደብረ ሊባኖስን ገዳም መሠረቱ' },
      source: { label: 'Ethiopia Church History — Monasticism in Shewa', route: '/library/read/church-history-ethiopia', kind: 'church-library' },
    },
  ]

  console.log(`=== VALIDATING HISTORY QUEST PILOT (20 QUESTIONS + 9 TIMELINE EVENTS) ===`)

  // 1. Check questions key balance
  const counts: Record<string, number> = { a: 0, b: 0, c: 0, d: 0 }
  for (const q of historyQuestions) {
    counts[q.correctKey]++
  }
  console.log('History key distribution:', counts)
  if (counts.a !== 5 || counts.b !== 5 || counts.c !== 5 || counts.d !== 5) {
    throw new Error('History keys are not balanced (need 5 of each)!')
  }

  // 2. Validate individual questions
  const questionDrafts: Array<import('../../src/lib/play/questionLibrary').QuestionDraft> = []
  for (const [index, q] of historyQuestions.entries()) {
    const studioErrors = validateStudioDraft({ game: 'history', content: q })
    if (studioErrors.length > 0) {
      throw new Error(`Question ${index + 1} (${q.id}) studio draft validation failed: ${studioErrors.join('; ')}`)
    }

    const qDraft = toQuestionDraft({ game: 'history', content: q })
    const draftErrors = validateQuestionDraft(qDraft)
    if (draftErrors.length > 0) {
      throw new Error(`Question ${index + 1} (${q.id}) question draft validation failed: ${draftErrors.join('; ')}`)
    }

    questionDrafts.push(qDraft)
  }

  // 3. Validate History Timeline Chronology
  const timelineDraftErrors = validateStudioDraft({
    game: 'history',
    format: 'timeline',
    content: historyTimelineEvents,
  })
  console.log('History timeline draft errors:', timelineDraftErrors)
  if (timelineDraftErrors.length > 0) {
    throw new Error(`History timeline validation failed: ${timelineDraftErrors.join('; ')}`)
  }

  // 4. Preview import check for questions
  const preview = previewQuestionImport(JSON.stringify(questionDrafts), new Set(APPROVED_QUESTIONS.map(q => q.id)))
  console.log(`CMS Import preview: ${preview.items.length} items, ${preview.errors.length} errors.`)
  if (preview.errors.length > 0) {
    throw new Error(`CMS import preview errors: ${preview.errors.join('; ')}`)
  }

  // Write artifacts
  const outDir = join(process.cwd(), 'artifacts/faith-challenges/history')
  mkdirSync(outDir, { recursive: true })

  writeFileSync(join(outDir, 'questions.json'), `${JSON.stringify(historyQuestions, null, 2)}\n`, 'utf8')
  writeFileSync(join(outDir, 'chronology.json'), `${JSON.stringify(historyTimelineEvents, null, 2)}\n`, 'utf8')
  writeFileSync(join(outDir, 'cms-import.json'), `${JSON.stringify(questionDrafts, null, 2)}\n`, 'utf8')
  writeFileSync(join(outDir, 'report.json'), `${JSON.stringify({
    game: 'history',
    batch: 'pilot-001',
    totalQuestions: historyQuestions.length,
    keyDistribution: counts,
    chronologyEvents: historyTimelineEvents.length,
    categories: {
      'Ethiopian Church history': historyQuestions.filter(q => q.category === 'Ethiopian Church history').length,
      'World Church history': historyQuestions.filter(q => q.category === 'World Church history').length,
    },
    validation: {
      validateStudioDraftQuestions: 'PASS',
      validateStudioDraftChronology: 'PASS',
      validateQuestionDraft: 'PASS',
      previewQuestionImport: 'PASS',
      keyBalance: 'PASS',
    },
    generatedAt: new Date().toISOString(),
  }, null, 2)}\n`, 'utf8')

  console.log('History Quest pilot batch successfully generated, validated, and saved to artifacts/faith-challenges/history!')
}

run().catch((err) => {
  console.error(err)
  process.exit(1)
})

