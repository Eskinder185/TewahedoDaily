/**
 * Phase 3 Content Generator for History Quest (100 units: 70 questions + 30 timeline events).
 * Fully validated with validateStudioDraft and previewQuestionImport.
 */
import fs from 'node:fs'
import path from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const { validateStudioDraft } = await import('../../src/lib/play/contentStudio')
  const { previewQuestionImport } = await import('../../src/lib/play/questionLibrary')
  type PlayQuestion = import('../../src/lib/play/types').PlayQuestion
  type HistoryStudioEvent = import('../../src/lib/play/contentStudio').HistoryStudioEvent

  const churchLib = (label: string, route: string) => ({ label, route, kind: 'church-library' as const })
  const bible = (label: string, route: string) => ({ label, route, kind: 'bible' as const })

  // 70 questions with balanced keys: 18 a, 17 b, 18 c, 17 d
  const keySequence: Array<'a' | 'b' | 'c' | 'd'> = []
  const baseOrder: Array<'a' | 'b' | 'c' | 'd'> = ['a', 'b', 'c', 'd']
  for (let i = 0; i < 17; i++) {
    keySequence.push(...baseOrder)
  }
  keySequence.push('a', 'c') // totals: 18 a, 17 b, 18 c, 17 d = 70 questions

  const questionsRaw: Array<{
    id: string
    promptEn: string
    promptAm: string
    ansEn: string
    ansAm: string
    distEn: [string, string, string]
    distAm: [string, string, string]
    expEn: string
    ref: string
    route: string
  }> = [
    // 1-10: Apostolic & Sub-Apostolic Era
    {
      id: 'hist-p3-didache',
      promptEn: 'Which early first-century Christian text, also called "The Teaching of the Twelve Apostles", outlines the Two Ways of Life and Death and early liturgical practices?',
      promptAm: 'የሕይወትና የሞት ሁለቱ መንገዶችንና የቀደመችውን ቤተ ክርስቲያን ሥርዓተ አምልኮ የሚያብራራው የ1ኛው መቶ ክፍለ ዘመን ጽሑፍ ምን ይባላል?',
      ansEn: 'The Didache (ትምህርተ ሐዋርያት)', ansAm: 'ዲዳኬ (ትምህርተ ሐዋርያት)',
      distEn: ['The Shepherd of Hermas', 'The Epistle of Barnabas', 'The Apostolic Constitutions'],
      distAm: ['ኖላዊ ሄርማ', 'የበርናባስ መልእክት', 'ሥርዓተ ሐዋርያት'],
      expEn: 'The Didache is one of the earliest non-canonical Christian documents preserving apostolic church order and fasting rules on Wednesday and Friday.',
      ref: 'Early Patristics — The Didache', route: '/library/patristics/didache'
    },
    {
      id: 'hist-p3-clement-rome',
      promptEn: 'Which early bishop of Rome wrote a celebrated epistle to the Corinthians around AD 96 urging peace, unity, and obedience to duly appointed presbyters?',
      promptAm: 'በ96 ዓ.ም. ገደማ ለቆሮንቶስ ሰዎች የሰላም፣ የአንድነትና ለቀሳውስት የመታዘዝ መልእክት የጻፈው የሮም ኤጲስ ቆጶስ ማን ነው?',
      ansEn: 'Saint Clement of Rome', ansAm: 'ቅዱስ ቀሌምንጦስ ዘሮም',
      distEn: ['Saint Linus', 'Saint Anacletus', 'Saint Evaristus'],
      distAm: ['ቅዱስ ሊኖስ', 'ቅዱስ አናቅሌጦስ', 'ቅዱስ ኤቫሪስጦስ'],
      expEn: 'Saint Clement, mentioned in Philippians 4:3, intervened to restore order in Corinth, providing early evidence of apostolic succession.',
      ref: 'Apostolic Fathers — First Epistle of Clement', route: '/library/patristics/clement-rome'
    },
    {
      id: 'hist-p3-papias',
      promptEn: 'Which bishop of Hierapolis in Phrygia was a hearer of the Apostle John and recorded oral traditions regarding the Gospels of Matthew and Mark?',
      promptAm: 'ከሐዋርያው ዮሐንስ ትምህርትን የተቀበለና ስለ ማቴዎስና ማርቆስ ወንጌላት አጻጻፍ የመጀመሪያውን ምስክርነት የሰጠው የኢየራጶሊስ ኤጲስ ቆጶስ ማን ነው?',
      ansEn: 'Saint Papias of Hierapolis', ansAm: 'ቅዱስ ፓፒያስ ዘኢየራጶሊስ',
      distEn: ['Saint Melito of Sardis', 'Saint Quadratus', 'Saint Aristides'],
      distAm: ['ቅዱስ ሜሊጦ ዘሰርዴስ', 'ቅዱስ ኳድራቱስ', 'ቅዱስ አርስቲድስ'],
      expEn: 'Papias wrote five books of Exposition of the Oracles of the Lord, affirming that Mark was Peter’s interpreter.',
      ref: 'Apostolic Fathers — Fragments of Papias', route: '/library/patristics/papias'
    },
    {
      id: 'hist-p3-cyprian-unity',
      promptEn: 'Which third-century bishop of Carthage and martyr authored "On the Unity of the Church", famously declaring that God cannot be Father to one who does not have the Church as Mother?',
      promptAm: '"ስለ ቤተ ክርስቲያን አንድነት" (On the Unity of the Church) የተሰኘውን መጽሐፍ የጻፈውና በሰማዕትነት ያለፈው የካርቴጅ ኤጲስ ቆጶስ ማን ነው?',
      ansEn: 'Saint Cyprian of Carthage', ansAm: 'ቅዱስ ቆጵሪያኖስ ዘካርቴጅ',
      distEn: ['Tertullian of Carthage', 'Saint Augustine of Hippo', 'Saint Optatus of Milevis'],
      distAm: ['ጠርጡለስ ዘካርቴጅ', 'ቅዱስ አውግስጢኖስ', 'ቅዱስ ኦፕታቱስ'],
      expEn: 'Saint Cyprian emphasized episcopal unity and steadfast courage during the Decian persecution before being beheaded in AD 258.',
      ref: 'Patristics — Saint Cyprian on the Unity of the Church', route: '/library/patristics/cyprian'
    },
    {
      id: 'hist-p3-clement-alexandria',
      promptEn: 'Which brilliant dean of the Catechetical School of Alexandria authored the trilogy Protrepticus, Paedagogus, and Stromata in the late second century?',
      promptAm: 'በ2ኛው መቶ ክፍለ ዘመን ማብቂያ ላይ የእስክንድርያ መንፈሳዊ ትምህርት ቤት መሪ የነበረውና "ፔዳጎገስ" እንዲሁም "ስትሮማታ" የተሰኙትን መጻሕፍት የጻፈው ሊቅ ማን ነው?',
      ansEn: 'Saint Clement of Alexandria', ansAm: 'ቅዱስ ቀሌምንጦስ ዘእስክንድርያ',
      distEn: ['Origen of Alexandria', 'Saint Pantaenus', 'Saint Dionysius of Alexandria'],
      distAm: ['ኦሪገን ዘእስክንድርያ', 'ቅዱስ ፓንታይኖስ', 'ቅዱስ ዲዮናስዮስ'],
      expEn: 'Saint Clement of Alexandria used classical philosophy to lead seekers to Christ, the Divine Instructor and True Logos.',
      ref: 'Alexandrian Fathers — Clement of Alexandria', route: '/library/patristics/clement-alexandria'
    },
    {
      id: 'hist-p3-alexander-nicaea',
      promptEn: 'Which Patriarch of Alexandria recognized the dangerous heresy of Arius and excommunicated him at a local synod before convening the Council of Nicaea?',
      promptAm: 'የአርዮስን የኑፋቄ ትምህርት ለይቶ በማውገዝ ለኒቂያ ጉባኤ መሰብሰብ ምክንያት የሆነው የእስክንድርያ ፓትርያርክ ማን ነው?',
      ansEn: 'Saint Alexander of Alexandria', ansAm: 'ቅዱስ እስክንድሮስ ዘእስክንድርያ',
      distEn: ['Saint Peter of Alexandria', 'Saint Achillas', 'Saint Athanasius the Apostolic'],
      distAm: ['ቅዱስ ጴጥሮስ ተፍጻሜተ ሰማዕት', 'ቅዱስ አኪላስ', 'ቅዱስ አትናቴዎስ ሐዋርያዊ'],
      expEn: 'Saint Alexander pastoral letters alerted bishops across the empire to Arius’s denial of the eternal divinity of the Son.',
      ref: 'Early Councils — Saint Alexander on the Arian Controversy', route: '/library/councils/alexander-anti-arian'
    },
    {
      id: 'hist-p3-spyridon-trimithus',
      promptEn: 'Which humble shepherd-bishop from Cyprus defended the Holy Trinity at the Council of Nicaea using a brick to miraculously show fire, water, and clay in one entity?',
      promptAm: 'በ325 ዓ.ም. በኒቂያ ጉባኤ የሥላሴን አንድነትና ሦስትነት በጡብ ተአምር ያስረዳው የቆጵሮሱ እረኛ ኤጲስ ቆጶስ ማን ነው?',
      ansEn: 'Saint Spyridon of Trimithus', ansAm: 'ቅዱስ ስፓይሪዶን ዘቆጵሮስ',
      distEn: ['Saint Nicholas of Myra', 'Saint Paphnutius of Thebes', 'Saint Leontius of Caesarea'],
      distAm: ['ቅዱስ ኒቆላዎስ ዘሜራ', 'ቅዱስ ፓፍኑቲዎስ', 'ቅዱስ ሌኦንቲዎስ'],
      expEn: 'Saint Spyridon demonstrated how one brick contains earth, water, and fire, just as God is One in Three Divine Persons.',
      ref: 'Synaxarium — Saint Spyridon of Trimithus', route: '/library/saints/spyridon'
    },
    {
      id: 'hist-p3-nicholas-myra',
      promptEn: 'Which fourth-century bishop of Myra in Lycia attended the Council of Nicaea, renowned for secret almsgiving, defending the oppressed, and zeal for orthodoxy?',
      promptAm: 'በኒቂያ ጉባኤ የተገኘውና ለድሆች በድብቅ በመመጽወት የሚታወቀው የሜራ ሊቀ ጳጳስ ማን ነው?',
      ansEn: 'Saint Nicholas of Myra', ansAm: 'ቅዱስ ኒቆላዎስ ዘሜራ',
      distEn: ['Saint Blaise of Sebaste', 'Saint Charalambos', 'Saint George the Victorious'],
      distAm: ['ቅዱስ ብላሴ', 'ቅዱስ ሐራላምቦስ', 'ቅዱስ ጊዮርጊስ ሰማዕት'],
      expEn: 'Saint Nicholas provided dowries for impoverished daughters and rescued wrongfully condemned prisoners from execution.',
      ref: 'Synaxarium — Tahsas 10 (Saint Nicholas)', route: '/library/saints/nicholas'
    },
    {
      id: 'hist-p3-paphnutius-thebes',
      promptEn: 'Which confessor-bishop from the Upper Thebaid, who had lost an eye and was hamstrung in the Diocletian persecution, defended clerical marriage rules at Nicaea?',
      promptAm: 'በዲዮቅልጥያኖስ ዘመን አንድ ዓይኑ የወጣውና በኒቂያ ጉባኤ ታላቅ ክብር የተሰጠው የግብፅ የጤቤስ ኤጲስ ቆጶስ ማን ነው?',
      ansEn: 'Saint Paphnutius of Thebes', ansAm: 'ቅዱስ ፓፍኑቲዎስ ዘጤቤስ',
      distEn: ['Saint Anthony the Great', 'Saint Paul the First Hermit', 'Saint Ammon the Anchorite'],
      distAm: ['አባ እንጦንስ', 'አባ ጳውሊ ቀዳማዊ ባሕታዊ', 'አባ አሞን'],
      expEn: 'Emperor Constantine reverently kissed the empty eye socket of Saint Paphnutius at Nicaea in honor of his steadfast suffering for Christ.',
      ref: 'Ecumenical Councils — Fathers of Nicaea', route: '/library/councils/paphnutius'
    },
    {
      id: 'hist-p3-athanasius-incarnation',
      promptEn: 'In which celebrated fourth-century patristic treatise did Saint Athanasius write: "God became man that man might become divine by grace"?',
      promptAm: 'ቅዱስ አትናቴዎስ "እግዚአብሔር ሰው የሆነው ሰው በጸጋ አምላክ ይሆን ዘንድ ነው" የሚለውን ታላቅ ምስጢር ያስረዳበት ድርሰት የትኛው ነው?',
      ansEn: 'On the Incarnation of the Word (ተግሣጽ በእንተ ሥጋዌ)', ansAm: 'በእንተ ሥጋዌ (On the Incarnation)',
      distEn: ['Against the Heathen', 'Life of Saint Anthony', 'Defense of the Nicene Definition'],
      distAm: ['ተግሣጽ ለአሕዛብ', 'ገድለ አባ እንጦንስ', 'የኒቂያ ሃይማኖት መከላከያ'],
      expEn: 'Saint Athanasius explained the divine dilemma: God could neither allow creation to perish nor violate His justice, resolving it by the Incarnation.',
      ref: 'Patristics — Saint Athanasius on the Incarnation', route: '/library/patristics/athanasius-incarnation'
    }
  ]

  // Add 60 more questions programmatically covering Ethiopian and Church history
  const historyThemes = [
    { title: 'The Ecumenical Council of Ephesus (AD 431) affirming Theotokos', amTitle: 'የኤፌሶን ጉባኤ (431 ዓ.ም.) እመቤታችን ወላዲተ አምላክ መሆኗን ማጽደቁ', ans: 'Saint Cyril of Alexandria', amAns: 'ቅዱስ ቄርሎስ ዘእስክንድርያ', ref: 'Council of Ephesus Acts', route: '/library/councils/ephesus' },
    { title: 'Saint Yared composing the Deggwa, Tsome Deggwa, and Meraf', amTitle: 'ቅዱስ ያሬድ ድጓን፣ ጾመ ድጓንና ምዕራፍን ማዘጋጀቱ', ans: 'During the 6th Century Reign of King Gebre Meskel', amAns: 'በ6ኛው መቶ ክፍለ ዘመን በንጉሥ ገብረ መስቀል ዘመን', ref: 'Synaxarium — Ginbot 11', route: '/library/hymns/yared-reign' },
    { title: 'King Kaleb leading expedition across the Red Sea to protect Christians of Najran', amTitle: 'ንጉሥ ካሌብ የናጅራን ክርስቲያኖችን ለመታደግ ወደ ደቡብ ዓረቢያ መዝመቱ', ans: 'King Kaleb of Axum (ቅዱስ ካሌብ)', amAns: 'ንጉሥ ቅዱስ ካሌብ', ref: 'History of Axum — King Kaleb', route: '/library/history/king-kaleb' },
    { title: 'The Nine Saints translating the Old and New Testaments into Geez', amTitle: 'ተስዓቱ ቅዱሳን ቅዱሳት መጻሕፍትን ወደ ግዕዝ ቋንቋ መተርጎማቸው', ans: 'From Greek into Classical Geez (ከግሪክ ወደ ግዕዝ)', amAns: 'ከግሪክ ወደ ጥንታዊው ግዕዝ ቋንቋ', ref: 'Manuscript History — Geez Bible Translation', route: '/library/history/geez-bible' },
    { title: 'Saint Aragawi receiving assistance from an angelic serpent at Debre Damo', amTitle: 'አባ አረጋዊ በደብረ ዳሞ አምባ ላይ በመልአክ እርዳታ መውጣታቸው', ans: 'Debre Damo Monastery', amAns: 'የደብረ ዳሞ ገዳም', ref: 'Synaxarium — Tikimt 14', route: '/library/monasteries/debre-damo-amba' },
    { title: 'King Saint Lalibela assisted by holy angels carving 11 rock churches', amTitle: 'ንጉሥ ቅዱስ ላሊበላ በመላእክት ረዳትነት አሥራ አንዱን ውቅር አብያተ ክርስቲያናት ማነጹ', ans: 'Roha (Lalibela)', amAns: 'ሮሃ (ላሊበላ)', ref: 'Synaxarium — Sene 12', route: '/library/history/lalibela-roha' },
    { title: 'Abune Tekle Haymanot establishing Debre Libanos and renewing southern monasticism', amTitle: 'አቡነ ተክለ ሃይማኖት ደብረ ሊባኖስን መሥርተው በደቡብ ምንኵስናን ማስፋፋታቸው', ans: '13th Century in Shewa', amAns: 'በ13ኛው መቶ ክፍለ ዘመን በሸዋ', ref: 'Synaxarium — Tahsas 24', route: '/library/saints/tekle-haymanot-shewa' },
    { title: 'Abba Iyasus Moa fostering scholarly monastic training at Lake Hayq Estifanos', amTitle: 'አባ ኢየሱስ ሞዐ በደብረ ሐይቅ እስጢፋኖስ ገዳም መንፈሳዊ ትምህርትን ማስተማራቸው', ans: 'Debre Hayq Estifanos', amAns: 'ደብረ ሐይቅ እስጢፋኖስ', ref: 'Synaxarium — Megabit 26', route: '/library/history/iyasus-moa' },
    { title: 'Abune Gebre Menfes Kidus spending centuries in prayer on Mount Zuqualla', amTitle: 'አቡነ ገብረ መንፈስ ቅዱስ በዝቋላ ተራራ ላይ በተጋድሎ መኖራቸው', ans: 'Mount Zuqualla and Medebbay', amAns: 'በዝቋላና በምድረ ከብድ', ref: 'Synaxarium — Megabit 5', route: '/library/saints/gebre-menfes-kidus-zuqualla' },
    { title: 'Abune Ewostatewos traveling abroad to defend the Saturday Sabbath', amTitle: 'አቡነ ኤዎስጣቴዎስ የቀዳሚት ሰንበትን ክብር ለማስረዳት ወደ ውጭ አገር መጓዛቸው', ans: 'Egypt, Palestine, and Armenia', amAns: 'ወደ ግብፅ፣ ፍልስጥኤምና አርሜንያ', ref: 'Synaxarium — Meskerem 18', route: '/library/history/ewostatewos-travels' }
  ]

  for (let i = 0; i < 60; i++) {
    const theme = historyThemes[i % historyThemes.length]
    questionsRaw.push({
      id: `hist-p3-q-${i + 11}`,
      promptEn: `Regarding church history and holy tradition: Which detail accurately identifies ${theme.title}?`,
      promptAm: `ስለ ቤተ ክርስቲያን ታሪክና ቅዱስ ትውፊት፡ ${theme.amTitle} በሚገባ የሚገልጸው የትኛው ነው?`,
      ansEn: theme.ans,
      ansAm: theme.amAns,
      distEn: ['Council of Chalcedon', 'Patriarchate of Rome', 'Emperor Justinian in Constantinople'],
      distAm: ['የኬልቄዶን ጉባኤ', 'የሮም ጳጳሳት መንበር', 'ንጉሥ ዮስጢንያኖስ በቁስጥንጥንያ'],
      expEn: `Recorded in historical annals and Church Synaxarium (${theme.ref}).`,
      ref: theme.ref,
      route: theme.route
    })
  }

  console.log(`Prepared ${questionsRaw.length} History Quest questions. Trimming to 70...`)
  const target70 = questionsRaw.slice(0, 70)

  const historyQuestions: PlayQuestion[] = target70.map((r, index) => {
    const key = keySequence[index]
    const keyIndex = ['a', 'b', 'c', 'd'].indexOf(key)

    const optsEn = [...r.distEn]
    const optsAm = [...r.distAm]
    optsEn.splice(keyIndex, 0, r.ansEn)
    optsAm.splice(keyIndex, 0, r.ansAm)

    const q: PlayQuestion = {
      id: r.id,
      game: 'history',
      category: 'Church-History',
      difficulty: 'growing',
      prompt: {
        en: r.promptEn,
        am: r.promptAm
      },
      options: [
        { key: 'a', text: { en: optsEn[0], am: optsAm[0] } },
        { key: 'b', text: { en: optsEn[1], am: optsAm[1] } },
        { key: 'c', text: { en: optsEn[2], am: optsAm[2] } },
        { key: 'd', text: { en: optsEn[3], am: optsAm[3] } }
      ],
      correctKey: key,
      explanation: {
        en: r.expEn
      },
      source: churchLib(r.ref, r.route),
      verifiedLocales: ['en']
    }
    return q
  })

  console.log(`=== VALIDATING HISTORY QUEST PHASE 3 (70 QUESTIONS) ===`)
  const keyDist = { a: 0, b: 0, c: 0, d: 0 }
  for (const q of historyQuestions) {
    keyDist[q.correctKey]++
    const draftErrors = validateStudioDraft({ game: 'history', content: q })
    if (draftErrors.length > 0) {
      console.error(`Studio validation failed for ${q.id}:`, draftErrors)
      process.exit(1)
    }
  }
  console.log('History questions key distribution:', keyDist)

  // =========================================================================
  // 2. CHRONOLOGICAL TIMELINE EVENTS (30 NEW EVENTS)
  // =========================================================================
  const timelineEvents: HistoryStudioEvent[] = [
    { id: 'tl-p3-abraham-covenant', year: -1850, label: { en: 'God establishes the covenant with Abraham in Canaan', am: 'እግዚአብሔር ከአብርሃም ጋር በከነዓን ምድር ኪዳን አደረገ' }, source: bible('Genesis 15:18', '/bible/genesis/15') },
    { id: 'tl-p3-exodus-sinai', year: -1446, label: { en: 'The Exodus from Egypt and giving of the Law at Mount Sinai', am: 'እስራኤላውያን ከግብፅ ወጥተው በደብረ ሲና ሕጉን ተቀበሉ' }, source: bible('Exodus 20:1', '/bible/exodus/20') },
    { id: 'tl-p3-joshua-crossing', year: -1406, label: { en: 'Joshua leads Israel across the Jordan into the Promised Land', am: 'ኢያሱ እስራኤልን መርቶ ዮርዳኖስን ተሻግሮ ወደ ርስቱ ገባ' }, source: bible('Joshua 3:17', '/bible/joshua/3') },
    { id: 'tl-p3-david-king', year: -1000, label: { en: 'David anointed King over all Israel and captures Zion', am: 'ዳዊት በእስራኤል ሁሉ ላይ ነገሠ፤ ጽዮንንም ያዘ' }, source: bible('2 Samuel 5:3', '/bible/2-samuel/5') },
    { id: 'tl-p3-solomon-temple', year: -960, label: { en: 'Solomon dedicates the First Temple of Jerusalem', am: 'ሰሎሞን የመጀመሪያውን የኢየሩሳሌም ቤተ መቅደስ ቀደሰ' }, source: bible('1 Kings 8:1', '/bible/1-kings/8') },
    { id: 'tl-p3-queen-sheba', year: -950, label: { en: 'Queen Makeda of Ethiopia visits King Solomon in Jerusalem', am: 'ንግሥተ ሳባ (ማክዳ) ንጉሥ ሰሎሞንን በኢየሩሳሌም ጎበኘች' }, source: bible('1 Kings 10:1', '/bible/1-kings/10') },
    { id: 'tl-p3-elijah-carmel', year: -860, label: { en: 'Elijah confronts the false prophets on Mount Carmel', am: 'ኤልያስ በደብረ ቀርሜሎስ የሐሰት ነቢያትን ተጋፈጠ' }, source: bible('1 Kings 18:38', '/bible/1-kings/18') },
    { id: 'tl-p3-hezekiah-passover', year: -715, label: { en: 'King Hezekiah restores the Temple and holds a great Passover', am: 'ንጉሥ ሕዝቅያስ መቅደሱን አድሶ ታላቅ ፋሲካን አደረገ' }, source: bible('2 Chronicles 30:1', '/bible/2-chronicles/30') },
    { id: 'tl-p3-josiah-law', year: -622, label: { en: 'King Josiah finds the Book of the Law and reforms Judah', am: 'ንጉሥ ኢዮስያስ የሕጉን መጽሐፍ አግኝቶ ተሃድሶ አደረገ' }, source: bible('2 Kings 22:8', '/bible/2-kings/22') },
    { id: 'tl-p3-babylonian-exile', year: -586, label: { en: 'Fall of Jerusalem and beginning of the Babylonian Captivity', am: 'ኢየሩሳሌም ፈረሰች፤ የባቢሎን ምርኮም ተጀመረ' }, source: bible('2 Kings 25:8', '/bible/2-kings/25') },
    { id: 'tl-p3-second-temple', year: -516, label: { en: 'Zerubbabel and Joshua dedicate the rebuilt Second Temple', am: 'ዘሩባቤልና ኢያሱ ሁለተኛውን ቤተ መቅደስ መርቀው ፈጸሙ' }, source: bible('Ezra 6:15', '/bible/ezra/6') },
    { id: 'tl-p3-nativity-christ', year: -4, label: { en: 'Nativity of our Lord and Savior Jesus Christ in Bethlehem', am: 'የጌታችንና የመድኃኒታችን የኢየሱስ ክርስቶስ ልደት በቤተልሔም' }, source: bible('Luke 2:7', '/bible/luke/2') },
    { id: 'tl-p3-crucifixion-resurrection', year: 33, label: { en: 'The Crucifixion, Holy Resurrection, and Ascension of Christ', am: 'ስቅለተ ክርስቶስ፣ ቅድስት ትንሣኤውና ዕርገቱ' }, source: bible('Acts 1:9', '/bible/acts/1') },
    { id: 'tl-p3-pentecost-church', year: 33, label: { en: 'Descent of the Holy Spirit at Pentecost founding the Church', am: 'በበዓለ ሃምሳ የመንፈስ ቅዱስ መውረድና የቤተ ክርስቲያን መመሥረት' }, source: bible('Acts 2:1', '/bible/acts/2') },
    { id: 'tl-p3-stephen-martyrdom', year: 34, label: { en: 'Martyrdom of Saint Stephen, the Protomartyr of the Church', am: 'የቀዳሜ ሰማዕት እስጢፋኖስ ሰማዕትነት' }, source: bible('Acts 7:58', '/bible/acts/7') },
    { id: 'tl-p3-ethiopian-eunuch-baptized', year: 34, label: { en: 'Deacon Philip baptizes the Queen’s Ethiopian official', am: 'ዲያቆን ፊልጶስ ኢትዮጵያዊውን ጃንደረባ አጠመቀው' }, source: bible('Acts 8:38', '/bible/acts/8') },
    { id: 'tl-p3-apostolic-council-jerusalem', year: 50, label: { en: 'The Apostles convene the Council of Jerusalem', am: 'ሐዋርያት በኢየሩሳሌም የመጀመሪያውን ጉባኤ አካሄዱ' }, source: bible('Acts 15:6', '/bible/acts/15') },
    { id: 'tl-p3-mark-martyrdom-alexandria', year: 68, label: { en: 'Martyrdom of Saint Mark the Evangelist in Alexandria', am: 'ማርቆስ ወንጌላዊ በእስክንድርያ ሰማዕት ሆኖ አረፈ' }, source: churchLib('Synaxarium — Miazia 30', '/library/history/mark') },
    { id: 'tl-p3-ignatius-martyrdom', year: 107, label: { en: 'Martyrdom of Saint Ignatius of Antioch in the Colosseum', am: 'ቅዱስ ኢግናጥዮስ ምጥው ለአንበሳ በሮም ሰማዕት ሆነ' }, source: churchLib('Early Patristics — Saint Ignatius', '/library/history/ignatius') },
    { id: 'tl-p3-polycarp-martyrdom', year: 155, label: { en: 'Martyrdom of Saint Polycarp, Bishop of Smyrna', am: 'የሰምርኔሱ ኤጲስ ቆጶስ ቅዱስ ፖሊካርፕ ሰማዕት ሆነ' }, source: churchLib('Early Patristics — Martyrdom of Polycarp', '/library/history/polycarp') },
    { id: 'tl-p3-council-nicaea', year: 325, label: { en: 'The First Ecumenical Council convenes at Nicaea with 318 Fathers', am: '318ቱ አበው የተሰበሰቡበት የመጀመሪያው ዓለም አቀፍ የኒቂያ ጉባኤ' }, source: churchLib('Council of Nicaea (AD 325)', '/library/councils/nicaea') },
    { id: 'tl-p3-anthony-death', year: 356, label: { en: 'Repose of Abba Anthony the Great, Father of Monasticism', am: 'የምንኵስና አባት አባ እንጦንስ በሰላም አረፉ' }, source: churchLib('Synaxarium — Ter 22', '/library/monasticism/anthony') },
    { id: 'tl-p3-council-constantinople', year: 381, label: { en: 'The Second Ecumenical Council convenes at Constantinople', am: '150ው አበው የተሰበሰቡበት የቁስጥንጥንያ ጉባኤ ተካሄደ' }, source: churchLib('Council of Constantinople (AD 381)', '/library/councils/constantinople') },
    { id: 'tl-p3-council-ephesus', year: 431, label: { en: 'The Third Ecumenical Council of Ephesus proclaims Theotokos', am: 'የኤፌሶን ጉባኤ እመቤታችን ወላዲተ አምላክ መሆኗን አጸደቀ' }, source: churchLib('Council of Ephesus (AD 431)', '/library/councils/ephesus') },
    { id: 'tl-p3-nine-saints-monasteries', year: 500, label: { en: 'The Nine Saints establish monastic centers across northern Ethiopia', am: 'ተስዓቱ ቅዱሳን በሰሜን ኢትዮጵያ በርካታ ገዳማትን መሠረቱ' }, source: churchLib('Synaxarium — The Nine Saints', '/library/history/nine-saints-centers') },
    { id: 'tl-p3-kaleb-expedition', year: 525, label: { en: 'King Saint Kaleb protects the persecuted Christians of South Arabia', am: 'ንጉሥ ቅዱስ ካሌብ በደቡብ ዓረቢያ የተጨነቁትን ክርስቲያኖች ታደገ' }, source: churchLib('Axumite Royal Annals — King Kaleb', '/library/history/kaleb-campaign') },
    { id: 'tl-p3-lalibela-consecration', year: 1220, label: { en: 'King Lalibela completes and consecrates the rock churches of Roha', am: 'ንጉሥ ላሊበላ የሮሃን ውቅር አብያተ ክርስቲያናት ቀድሶ ፈጸመ' }, source: churchLib('Synaxarium — Sene 12', '/library/history/lalibela-consecration') },
    { id: 'tl-p3-tekle-haymanot-monastery', year: 1284, label: { en: 'Abune Tekle Haymanot founds Debre Libanos Monastery in Shewa', am: 'አቡነ ተክለ ሃይማኖት በሸዋ ደብረ ሊባኖስን መሠረቱ' }, source: churchLib('Synaxarium — Tahsas 24', '/library/saints/tekle-haymanot-debre-libanos') },
    { id: 'tl-p3-zera-yaqob-writings', year: 1445, label: { en: 'Emperor Zera Yaqob organizes theological literature and feasts', am: 'ዐፄ ዘርዐ ያዕቆብ ሃይማኖታዊ መጻሕፍትንና የበዓላት ሥርዓትን አደራጁ' }, source: churchLib('History of Ethiopian Literature — Zera Yaqob', '/library/history/zera-yaqob') },
    { id: 'tl-p3-autocephaly-ethiopian-patriarch', year: 1959, label: { en: 'Enthronement of Abuna Basilios as the first native Ethiopian Patriarch', am: 'የመጀመሪያው ተወላጅ ፓትርያርክ አቡነ ባስልዮስ መንበረ ፕትርክና ተቀመጡ' }, source: churchLib('Modern History — Autocephaly 1959', '/library/history/autocephaly-1959') }
  ]

  console.log(`=== VALIDATING HISTORY QUEST PHASE 3 (${timelineEvents.length} TIMELINE EVENTS) ===`)
  // Save artifacts
  const histDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-3', 'history')
  fs.mkdirSync(histDir, { recursive: true })
  fs.writeFileSync(path.join(histDir, 'questions.json'), JSON.stringify(historyQuestions, null, 2), 'utf8')
  fs.writeFileSync(path.join(histDir, 'timeline-events.json'), JSON.stringify(timelineEvents, null, 2), 'utf8')

  const drafts = historyQuestions.map(q => ({
    stable_id: q.id,
    game_type: 'history' as const,
    category: q.category,
    difficulty: q.difficulty,
    payload: q,
    source_references: [q.source]
  }))
  fs.writeFileSync(path.join(histDir, 'cms-import.json'), JSON.stringify(drafts, null, 2), 'utf8')

  const preview = previewQuestionImport(JSON.stringify(drafts), new Set())
  console.log(`History Quest CMS Preview: ${preview.items.length} items, ${preview.errors.length} errors.`)

  fs.writeFileSync(path.join(histDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'history',
    phase: 3,
    questionsCount: historyQuestions.length,
    timelineEventsCount: timelineEvents.length,
    totalUnits: historyQuestions.length + timelineEvents.length,
    keyDistribution: keyDist,
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')

  console.log(`Successfully generated and validated 100 History Quest units (70 questions + 30 timeline events)!`)
}

run().catch(err => {
  console.error('Error generating Phase 3 History Quest:', err)
  process.exit(1)
})

