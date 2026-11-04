import { writeFileSync, mkdirSync } from 'node:fs'
import { join } from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const { validateCardContent, cardQuestionDraft, mergeCardBank } = await import('../../src/lib/play/cardContent')
  const { validateStudioDraft } = await import('../../src/lib/play/contentStudio')
  const { validateQuestionDraft, previewQuestionImport } = await import('../../src/lib/play/questionLibrary')
  const { WHO_AM_I_CARDS } = await import('../../src/lib/play/approvedContent')
  const typeImport = await import('../../src/lib/play/types')

  const whoAmICards: Array<import('../../src/lib/play/types').WhoAmICard> = [
    {
      id: 'who-abraham',
      category: 'biblical-people',
      answer: { en: 'Abraham the Patriarch', am: 'አብርሃም አበ ብዙኃን' },
      explanation: {
        en: 'I was called out of Ur of the Chaldees, believed God’s promise of an heir, and became the father of many nations.',
        am: 'ከከለዳውያን ዑር ተጠርቼ ወጣሁ፤ የእግዚአብሔርን የተስፋ ቃል አመንሁ፤ የብዙ አሕዛብም አባት ተባልሁ።',
      },
      source: { label: 'Genesis 15:6', route: '/bible/genesis/15', kind: 'bible' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-sarah',
      category: 'biblical-people',
      answer: { en: 'Sarah', am: 'ሣራ' },
      explanation: {
        en: 'I was the wife of Abraham who received strength to conceive Isaac in my old age according to God’s faithful promise.',
        am: 'የአብርሃም ሚስት ነኝ፤ በእርጅናዬ ወራት በእግዚአብሔር ታማኝ ተስፋ ይስሐቅን በፀነሰ ጊዜ በደስታ ሳቅሁ።',
      },
      source: { label: 'Genesis 21:2', route: '/bible/genesis/21', kind: 'bible' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-elijah',
      category: 'biblical-people',
      answer: { en: 'Elijah the Tishbite', am: 'ነቢዩ ኤልያስ' },
      explanation: {
        en: 'I confronted the prophets of Baal on Mount Carmel, prayed for fire from heaven, and was taken up in a chariot of fire.',
        am: 'በቀርሜሎስ ተራራ የሐሰት ነቢያትን ተጋፈጥሁ፤ እሳት ከሰማይ በጸሎት አወረድሁ፤ በእሳት ሰረገላም ወደ ሰማይ ዐረግሁ።',
      },
      source: { label: '1 Kings 18:38', route: '/bible/1-kings/18', kind: 'bible' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-elisha',
      category: 'biblical-people',
      answer: { en: 'Elisha the Prophet', am: 'ነቢዩ ኤልሳዕ' },
      explanation: {
        en: 'I took up the mantle of Elijah, asked for a double portion of his spirit, and healed Naaman of leprosy in the Jordan.',
        am: 'የኤልያስን ካባ ወረስሁ፤ የመንፈሱን ሁለት ዕጥፍ ተቀበልሁ፤ ሶርያዊውን ንዕማንን በዮርዳኖስ ውኃ ፈወስሁ።',
      },
      source: { label: '2 Kings 2:9', route: '/bible/2-kings/2', kind: 'bible' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-ruth',
      category: 'biblical-people',
      answer: { en: 'Ruth the Moabitess', am: 'ሞዓባዊቷ ሩት' },
      explanation: {
        en: 'I clave to Naomi saying “Thy God shall be my God”, gleaned in the fields of Bethlehem, and became ancestor to King David.',
        am: 'ኑኃሚንን “አምላክሽ አምላኬ ይሆናል” ብዬ ተከተልኋት፤ በቦዔዝ እርሻ ቃረምሁ፤ የንጉሥ ዳዊትም ቅድመ አያት ሆንሁ።',
      },
      source: { label: 'Ruth 1:16', route: '/bible/ruth/1', kind: 'bible' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-esther',
      category: 'biblical-people',
      answer: { en: 'Queen Esther', am: 'ንግሥት አስቴር' },
      explanation: {
        en: 'Raised by Mordecai in Shushan, I fasted for three days and risked my life before King Ahasuerus to save my people.',
        am: 'በሱሳ በመርዶክዮስ እጅ አደግሁ፤ ለሦስት ቀን ጾም አወጅሁ፤ “ከጠፋሁም ልጥፋ” ብዬ ሕዝቤን ከመጥፋት አዳንሁ።',
      },
      source: { label: 'Esther 4:16', route: '/bible/esther/4', kind: 'bible' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-samuel',
      category: 'biblical-people',
      answer: { en: 'Samuel the Prophet', am: 'ነቢዩ ሳሙኤል' },
      explanation: {
        en: 'Dedicated to God by Hannah at Shiloh, I answered God’s midnight call and later anointed Saul and David as kings.',
        am: 'እናቴ ሐና በሴሎ ለእግዚአብሔር ሰጠችኝ፤ በሌሊት “እነሆኝ ተናገር” ብዬ መለስሁ፤ ሳኦልንና ዳዊትን በንጉሥነት ቀባሁ።',
      },
      source: { label: '1 Samuel 3:10', route: '/bible/1-samuel/3', kind: 'bible' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-joshua',
      category: 'biblical-people',
      answer: { en: 'Joshua son of Nun', am: 'ኢያሱ ወልደ ነዌ' },
      explanation: {
        en: 'I succeeded Moses, led the twelve tribes across the Jordan behind the Ark of the Covenant, and took Jericho.',
        am: 'ሙሴን ተክቼ ሕዝቡን መራሁ፤ በቃል ኪዳኑ ታቦት ፊት ዮርዳኖስን አሻገርሁ፤ የኢያሪኮንም ቅጥር አፈረስሁ።',
      },
      source: { label: 'Joshua 3:17', route: '/bible/joshua/3', kind: 'bible' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-joseph',
      category: 'biblical-people',
      answer: { en: 'Joseph the Patriarch', am: 'ዮሴፍ ጻድቅ' },
      explanation: {
        en: 'Sold by my brothers into Egypt, I interpreted Pharaoh’s dreams of seven kine and preserved life during the famine.',
        am: 'በወንድሞቼ ወደ ግብፅ ተሸጥሁ፤ የፈርዖንን ሕልም ፈታሁ፤ በራብ ዘመን ቤተሰቦቼንና ዓለምን በምግብ አዳንሁ።',
      },
      source: { label: 'Genesis 45:5', route: '/bible/genesis/45', kind: 'bible' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-solomon',
      category: 'biblical-people',
      answer: { en: 'King Solomon', am: 'ንጉሥ ሰሎሞን' },
      explanation: {
        en: 'I prayed for wisdom rather than riches, ruled over Israel at its golden peak, and built the holy Temple in Jerusalem.',
        am: 'ከሀብትና ከክብር ይልቅ ጥበብን ለመንሁ፤ እስራኤልን በሰላም መራሁ፤ በኢየሩሳሌምም የመጀመሪያውን ቤተ መቅደስ ሠራሁ።',
      },
      source: { label: '1 Kings 3:9', route: '/bible/1-kings/3', kind: 'bible' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-peter',
      category: 'biblical-people',
      answer: { en: 'Saint Peter the Apostle', am: 'ቅዱስ ጴጥሮስ ሐዋርያ' },
      explanation: {
        en: 'Called from casting nets in Galilee, I confessed Christ as the Son of the living God and preached at Pentecost.',
        am: 'ከገሊላ ዓሣ አጥማጅነት ተጠራሁ፤ “አንተ ክርስቶስ የሕያው እግዚአብሔር ልጅ ነህ” አልሁ፤ በበዓለ ኀምሳ ሦስት ሺህ አሳመንሁ።',
      },
      source: { label: 'Matthew 16:16', route: '/bible/matthew/16', kind: 'bible' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-paul',
      category: 'biblical-people',
      answer: { en: 'Saint Paul the Apostle', am: 'ቅዱስ ጳውሎስ ሐዋርያ' },
      explanation: {
        en: 'Struck down by heavenly light on the road to Damascus, I became the Apostle to the Gentiles and penned fourteen epistles.',
        am: 'ወደ ደማስቆ ስጓዝ በሰማያዊ ብርሃን ወደቅሁ፤ የአሕዛብ ሐዋርያ ሆንሁ፤ አሥራ አራት መልእክታትንም ጻፍሁ።',
      },
      source: { label: 'Acts 9:4', route: '/bible/acts/9', kind: 'bible' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-john-baptist',
      category: 'biblical-people',
      answer: { en: 'Saint John the Baptist', am: 'ቅዱስ ዮሐንስ መጥምቅ' },
      explanation: {
        en: 'I wore camel’s hair, cried in the wilderness to prepare the way of the Lord, and baptized Christ in the Jordan.',
        am: 'የግመል ጠጕር ለበስሁ፤ በምድረ በዳ የጌታን መንገድ ጠረግሁ፤ ጌታችን ኢየሱስ ክርስቶስን በዮርዳኖስ አጠመቅሁ።',
      },
      source: { label: 'Matthew 3:13', route: '/bible/matthew/3', kind: 'bible' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-stephen',
      category: 'saints',
      answer: { en: 'Saint Stephen the Protomartyr', am: 'ቅዱስ እስጢፋኖስ ቀዳሜ ሰማዕት' },
      explanation: {
        en: 'Chosen as first of seven deacons, I saw the heavens opened and the Son of Man standing at the right hand of God.',
        am: 'ከሰባቱ ዲያቆናት የመጀመሪያው ሆንሁ፤ ሰማያት ተከፍተው የሰው ልጅ በእግዚአብሔር ቀኝ ቆሞ አየሁ፤ በድንጋይ ተወግሬ ሰማዕት ሆንሁ።',
      },
      source: { label: 'Acts 7:55', route: '/bible/acts/7', kind: 'bible' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-saint-george',
      category: 'saints',
      answer: { en: 'Saint George the Martyr', am: 'ቅዱስ ጊዮርጊስ ሰማዕት' },
      explanation: {
        en: 'A brave soldier of Cappadocia, I confessed Christ before seventy pagan rulers and endured seven years of heroic witness.',
        am: 'የቀጰዶቅያ ወታደር ነበርሁ፤ በሰባ ከሐዲያን ነገሥታት ፊት ስለ ክርስቶስ ሰባት ዓመት መከራን ታገሥሁ።',
      },
      source: { label: 'TewahedoDaily Calendar — Saint George', route: '/calendar', kind: 'calendar' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-saint-tekle-haymanot',
      category: 'saints',
      answer: { en: 'Saint Tekle Haymanot', am: 'አቡነ ተክለ ሃይማኖት' },
      explanation: {
        en: 'I founded Debre Libanos monastery, stood in prayer until my leg broke, and renewed monastic life in medieval Ethiopia.',
        am: 'ደብረ ሊባኖስን ገዳም መሠረትሁ፤ በአንድ እግሬ ለዓመታት ጸለይሁ፤ በኢትዮጵያም መንፈሳዊ ተጋድሎን አበራሁ።',
      },
      source: { label: 'TewahedoDaily Calendar — Abune Tekle Haymanot', route: '/calendar', kind: 'calendar' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-bethlehem',
      category: 'biblical-locations',
      answer: { en: 'Bethlehem of Judea', am: 'ቤተልሔም ኤፍራታ' },
      explanation: {
        en: 'City of David and setting of Ruth, Micah prophesied that out of me would come forth the Ruler of Israel, born in the flesh.',
        am: 'የዳዊት ከተማ ነኝ፤ ሚክያስ አለቃ እንደሚወጣብኝ ተነበየ፤ መድኃኒታችን ኢየሱስ ክርስቶስ በሥጋ የተወለደብኝ ቅድስት ስፍራ ነኝ።',
      },
      source: { label: 'Luke 2:4', route: '/bible/luke/2', kind: 'bible' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-jerusalem',
      category: 'biblical-locations',
      answer: { en: 'Holy City of Jerusalem', am: 'ቅድስት ከተማ ኢየሩሳሌም' },
      explanation: {
        en: 'Encompassed by mountains, home to Mount Zion and the holy Temple, where Christ entered with palms and achieved our redemption.',
        am: 'በተራሮች የተከበብሁ የሰላም ከተማ ነኝ፤ ሰሎሞን መቅደሱን ሠራብኝ፤ ጌታችን በሆሣዕና ገብቶ በጎልጎታ የመስቀል ድነት ፈጸመብኝ።',
      },
      source: { label: 'Psalm 122:3', route: '/bible/psalms/122', kind: 'bible' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-mount-sinai',
      category: 'biblical-locations',
      answer: { en: 'Mount Sinai (Horeb)', am: 'ደብረ ሲና (ኮሬብ)' },
      explanation: {
        en: 'I trembled with smoke and lightning as God descended, Moses spoke face-to-face, and the stone tablets of the Law were given.',
        am: 'እግዚአብሔር በእሳት ሲወርድ በጭስና በመብረቅ ተናወጥሁ፤ ሙሴ አርባ ቀን ቆየብኝ፤ አሥርቱ ትእዛዛት የተጻፉባቸው ጽላቶች ተሰጡብኝ።',
      },
      source: { label: 'Exodus 19:18', route: '/bible/exodus/19', kind: 'bible' },
      verifiedLocales: ['en'],
    },
    {
      id: 'who-ark-of-the-covenant',
      category: 'holy-objects',
      answer: { en: 'Ark of the Covenant', am: 'የቃል ኪዳኑ ታቦት' },
      explanation: {
        en: 'Crafted from acacia overlaid with pure gold, crowned by cherubim of glory, carrying the two stone tablets of the Ten Commandments.',
        am: 'ከግራር ዕንጨት ተሠርቼ በወርቅ ተለበጥሁ፤ የኪሩቤል ክንፍ ጋርዶኛል፤ አሥርቱ ትእዛዛት የተቀረጹባቸውን የድንጋይ ጽላቶች በውስጤ ያዝሁ።',
      },
      source: { label: 'Exodus 25:10', route: '/bible/exodus/25', kind: 'bible' },
      verifiedLocales: ['en'],
    },
  ]

  console.log(`=== VALIDATING WHO AM I PILOT (${whoAmICards.length} CARDS) ===`)
  const questionDrafts: Array<import('../../src/lib/play/questionLibrary').QuestionDraft> = []

  for (const [index, card] of whoAmICards.entries()) {
    const cardErrors = validateCardContent('who-am-i', card)
    if (cardErrors.length > 0) {
      throw new Error(`Card ${index + 1} (${card.id}) card validation failed: ${cardErrors.join('; ')}`)
    }

    const studioErrors = validateStudioDraft({ game: 'who-am-i', content: card })
    if (studioErrors.length > 0) {
      throw new Error(`Card ${index + 1} (${card.id}) studio draft validation failed: ${studioErrors.join('; ')}`)
    }

    const qDraft = cardQuestionDraft('who-am-i', card)
    const draftErrors = validateQuestionDraft(qDraft)
    if (draftErrors.length > 0) {
      throw new Error(`Card ${index + 1} (${card.id}) question draft validation failed: ${draftErrors.join('; ')}`)
    }

    questionDrafts.push(qDraft)
  }

  // Verify non-conflict with existing cards in mergeCardBank
  const mergedBank = mergeCardBank('who-am-i', WHO_AM_I_CARDS, whoAmICards)
  console.log(`Bank merge checked: ${WHO_AM_I_CARDS.length} fallback + ${whoAmICards.length} new = ${mergedBank.length} merged cards.`)
  if (mergedBank.length !== WHO_AM_I_CARDS.length + whoAmICards.length) {
    throw new Error('Some new cards conflicted with existing cards in mergeCardBank!')
  }

  // Preview import check
  const preview = previewQuestionImport(JSON.stringify(questionDrafts), new Set(WHO_AM_I_CARDS.map(c => c.id)))
  console.log(`CMS Import preview: ${preview.items.length} items, ${preview.errors.length} errors.`)
  if (preview.errors.length > 0) {
    throw new Error(`CMS import preview errors: ${preview.errors.join('; ')}`)
  }

  // Write artifacts
  const outDir = join(process.cwd(), 'artifacts/faith-challenges/who-am-i')
  mkdirSync(outDir, { recursive: true })

  writeFileSync(join(outDir, 'cards.json'), `${JSON.stringify(whoAmICards, null, 2)}\n`, 'utf8')
  writeFileSync(join(outDir, 'cms-import.json'), `${JSON.stringify(questionDrafts, null, 2)}\n`, 'utf8')
  writeFileSync(join(outDir, 'report.json'), `${JSON.stringify({
    game: 'who-am-i',
    batch: 'pilot-001',
    count: whoAmICards.length,
    categories: {
      'biblical-people': whoAmICards.filter(c => c.category === 'biblical-people').length,
      'saints': whoAmICards.filter(c => c.category === 'saints').length,
      'biblical-locations': whoAmICards.filter(c => c.category === 'biblical-locations').length,
      'holy-objects': whoAmICards.filter(c => c.category === 'holy-objects').length,
    },
    validation: {
      validateCardContent: 'PASS',
      validateStudioDraft: 'PASS',
      validateQuestionDraft: 'PASS',
      previewQuestionImport: 'PASS',
      mergeCardBank: 'PASS',
    },
    generatedAt: new Date().toISOString(),
  }, null, 2)}\n`, 'utf8')

  console.log('Who Am I pilot batch successfully generated, validated, and saved to artifacts/faith-challenges/who-am-i!')
}

run().catch((err) => {
  console.error(err)
  process.exit(1)
})

