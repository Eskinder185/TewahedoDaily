import { writeFileSync, mkdirSync } from 'node:fs'
import { join } from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const { validateCardContent, cardQuestionDraft, mergeCardBank } = await import('../../src/lib/play/cardContent')
  const { validateStudioDraft } = await import('../../src/lib/play/contentStudio')
  const { validateQuestionDraft, previewQuestionImport } = await import('../../src/lib/play/questionLibrary')
  const { MATCH_PAIRS } = await import('../../src/lib/play/approvedContent')
  const typeImport = await import('../../src/lib/play/types')

  type MatchPair = import('../../src/lib/play/types').MatchPair

  const collections: { id: string; name: string; category: string; pairs: MatchPair[] }[] = [
    {
      id: 'covenants-and-signs',
      name: 'Covenants and Divine Signs',
      category: 'Covenants',
      pairs: [
        {
          id: 'match-cov-noah',
          category: 'Covenants',
          left: { en: 'Noah’s Covenant', am: 'የኖኅ ኪዳን' },
          right: { en: 'The rainbow set in the cloud as a token of peace', am: 'ቀስተ ደመና በደመና ውስጥ የሰላም ምልክት ሆነ' },
          explanation: {
            en: 'Genesis 9:13 records the rainbow given to Noah as the token of the covenant between God and the earth.',
            am: 'በዘፍጥረት 9፥13 ቀስተ ደመና በእግዚአብሔርና በምድር መካከል የኪዳን ምልክት ሆኖ ተሰጠ።',
          },
          source: { label: 'Genesis 9:13', route: '/bible/genesis/9', kind: 'bible' },
          verifiedLocales: ['en'],
        },
        {
          id: 'match-cov-abraham',
          category: 'Covenants',
          left: { en: 'Abraham’s Covenant', am: 'የአብርሃም ኪዳን' },
          right: { en: 'Circumcision and the promise of land and many nations', am: 'ግርዛትና የብዙ አሕዛብ እንዲሁም የርስቱ ተስፋ' },
          explanation: {
            en: 'Genesis 17:10 records circumcision as the token of the covenant with Abraham and his seed.',
            am: 'በዘፍጥረት 17፥10 ግርዛት ለአብርሃምና ለዘሩ የኪዳን ምልክት እንዲሆን ተሰጠ።',
          },
          source: { label: 'Genesis 17:10', route: '/bible/genesis/17', kind: 'bible' },
          verifiedLocales: ['en'],
        },
        {
          id: 'match-cov-sinai',
          category: 'Covenants',
          left: { en: 'Sinai Covenant', am: 'የሲና ኪዳን' },
          right: { en: 'Two stone tablets of the Law written with the finger of God', am: 'በእግዚአብሔር ጣት የተጻፉ ሁለት የድንጋይ ጽላቶች' },
          explanation: {
            en: 'Exodus 31:18 records the two tables of testimony, tables of stone, written with the finger of God.',
            am: 'በዘፀአት 31፥18 በእግዚአብሔር ጣት የተጻፉ የድንጋይ ጽላቶች ለሙሴ ተሰጡ።',
          },
          source: { label: 'Exodus 31:18', route: '/bible/exodus/31', kind: 'bible' },
          verifiedLocales: ['en'],
        },
        {
          id: 'match-cov-david',
          category: 'Covenants',
          left: { en: 'Davidic Covenant', am: 'የዳዊት ኪዳን' },
          right: { en: 'An enduring throne established forever through Christ', am: 'በክርስቶስ ለዘላለም የሚጸና የዘላለማዊ መንግሥት ዙፋን' },
          explanation: {
            en: '2 Samuel 7:16 promises that David’s house and kingdom shall be established forever.',
            am: 'በ2ኛ ሳሙኤል 7፥16 የዳዊት ቤትና መንግሥት ለዘላለም እንደሚጸና ቃል ተገባለት።',
          },
          source: { label: '2 Samuel 7:16', route: '/bible/2-samuel/7', kind: 'bible' },
          verifiedLocales: ['en'],
        },
        {
          id: 'match-cov-new',
          category: 'Covenants',
          left: { en: 'The New Covenant', am: 'ሐዲስ ኪዳን' },
          right: { en: 'The Blood of Christ shed on the Cross for the remission of sins', am: 'ስለ ኀጢአት ስርየት በመስቀል ላይ የፈሰሰው የክርስቶስ ክቡር ደም' },
          explanation: {
            en: 'Matthew 26:28 declares the Blood of the new covenant shed for many for the remission of sins.',
            am: 'በማቴዎስ 26፥28 ጌታችን ይህ ስለ ብዙዎች ለኀጢአት ስርየት የሚፈስ የሐዲስ ኪዳን ደሜ ነው አለ።',
          },
          source: { label: 'Matthew 26:28', route: '/bible/matthew/26', kind: 'bible' },
          verifiedLocales: ['en'],
        },
      ],
    },
    {
      id: 'prophets-and-visions',
      name: 'Holy Prophets and Prophetic Signs',
      category: 'Prophets',
      pairs: [
        {
          id: 'match-pro-elijah',
          category: 'Prophets',
          left: { en: 'Prophet Elijah', am: 'ነቢዩ ኤልያስ' },
          right: { en: 'Fire from heaven consuming the offering on Mount Carmel', am: 'በደብረ ቀርሜሎስ መሥዋዕቱ በእሳት ተበላ' },
          explanation: {
            en: '1 Kings 18:38 tells how the fire of the Lord fell and consumed the burnt sacrifice.',
            am: 'በ1ኛ ነገሥት 18፥38 የእግዚአብሔር እሳት ወርዳ የሚቃጠለውን መሥዋዕት በላች።',
          },
          source: { label: '1 Kings 18:38', route: '/bible/1-kings/18', kind: 'bible' },
          verifiedLocales: ['en'],
        },
        {
          id: 'match-pro-elisha',
          category: 'Prophets',
          left: { en: 'Prophet Elisha', am: 'ነቢዩ ኤልሳዕ' },
          right: { en: 'The iron axe head swimming upon the Jordan water', am: 'በዮርዳኖስ ውኃ ላይ የዋኘው የበረተው ምሳር' },
          explanation: {
            en: '2 Kings 6:6 records the miracle where the iron axe head did swim upon the Jordan.',
            am: 'በ2ኛ ነገሥት 6፥6 ወደ ውኃ የወደቀው የብረት ምሳር ተንሳፍፎ ዋኘ።',
          },
          source: { label: '2 Kings 6:6', route: '/bible/2-kings/6', kind: 'bible' },
          verifiedLocales: ['en'],
        },
        {
          id: 'match-pro-isaiah',
          category: 'Prophets',
          left: { en: 'Prophet Isaiah', am: 'ነቢዩ ኢሳይያስ' },
          right: { en: 'Vision of the Seraphim chanting Thrice-Holy in the Temple', am: 'ሱራፌል በቤተ መቅደስ ቅዱስ ቅዱስ ቅዱስ ሲሉ ያየው ራእይ' },
          explanation: {
            en: 'Isaiah 6:3 records the Seraphim crying “Holy, holy, holy is the LORD of hosts.”',
            am: 'በኢሳይያስ 6፥3 ሱራፌል “ቅዱስ፥ ቅዱስ፥ ቅዱስ የሠራዊት ጌታ እግዚአብሔር” ሲሉ አየ።',
          },
          source: { label: 'Isaiah 6:3', route: '/bible/isaiah/6', kind: 'bible' },
          verifiedLocales: ['en'],
        },
        {
          id: 'match-pro-jeremiah',
          category: 'Prophets',
          left: { en: 'Prophet Jeremiah', am: 'ነቢዩ ኤርምያስ' },
          right: { en: 'The vision of the almond rod and the seething pot', am: 'የለውዝ በትርና የሚፈላ ምንቸት ራእይ' },
          explanation: {
            en: 'Jeremiah 1:11–13 records the rod of an almond tree and the seething pot facing from the north.',
            am: 'በኤርምያስ 1፥11-13 የለውዝ በትርንና ከሰሜን አቅጣጫ የሚፈላውን ምንቸት አየ።',
          },
          source: { label: 'Jeremiah 1:11', route: '/bible/jeremiah/1', kind: 'bible' },
          verifiedLocales: ['en'],
        },
        {
          id: 'match-pro-ezekiel',
          category: 'Prophets',
          left: { en: 'Prophet Ezekiel', am: 'ነቢዩ ሕዝቅኤል' },
          right: { en: 'The vision of dry bones rising up to life by the breath of God', am: 'በእግዚአብሔር እስትንፋስ ሕያው ሆነው የተነሡ የደረቁ አጥንቶች ራእይ' },
          explanation: {
            en: 'Ezekiel 37:10 describes breath entering into the dry bones and they lived and stood up.',
            am: 'በሕዝቅኤል 37፥10 እስትንፋስ በደረቁ አጥንቶች ውስጥ ገባ፥ ሕያዋንም ሆነው በእግራቸው ቆሙ።',
          },
          source: { label: 'Ezekiel 37:10', route: '/bible/ezekiel/37', kind: 'bible' },
          verifiedLocales: ['en'],
        },
      ],
    },
    {
      id: 'apostles-and-callings',
      name: 'Holy Apostles and Their Callings',
      category: 'Apostles',
      pairs: [
        {
          id: 'match-apo-peter',
          category: 'Apostles',
          left: { en: 'Apostle Peter', am: 'ቅዱስ ጴጥሮስ' },
          right: { en: 'Preached at Pentecost and received the keys of the Kingdom', am: 'በበዓለ ኀምሳ ሰበከ፤ የመንግሥተ ሰማያትንም መክፈቻ ተቀበለ' },
          explanation: {
            en: 'Matthew 16:19 records Christ giving Peter the keys of the kingdom of heaven.',
            am: 'በማቴዎስ 16፥19 ጌታችን ለጴጥሮስ የመንግሥተ ሰማያትን መክፈቻ እንደሰጠው ተመዝግቧል።',
          },
          source: { label: 'Matthew 16:19', route: '/bible/matthew/16', kind: 'bible' },
          verifiedLocales: ['en'],
        },
        {
          id: 'match-apo-john',
          category: 'Apostles',
          left: { en: 'Apostle John', am: 'ቅዱስ ዮሐንስ' },
          right: { en: 'Leaned on the Lord’s bosom and received the Revelation on Patmos', am: 'በጌታችን ደረት ተደገፈ፤ በፍጥሞ ደሴትም ራእይን ተመለከተ' },
          explanation: {
            en: 'John 13:23 and Revelation 1:9 record the beloved disciple’s closeness and vision on Patmos.',
            am: 'በዮሐንስ 13፥23 እና በራእይ 1፥9 የተወደደው ደቀ መዝሙር በደረት መደገፉና ራእይ ማየቱ ተጽፏል።',
          },
          source: { label: 'John 13:23', route: '/bible/john/13', kind: 'bible' },
          verifiedLocales: ['en'],
        },
        {
          id: 'match-apo-paul',
          category: 'Apostles',
          left: { en: 'Apostle Paul', am: 'ቅዱስ ጳውሎስ' },
          right: { en: 'Saw the heavenly light near Damascus and wrote fourteen epistles', am: 'በደማስቆ ሰማያዊ ብርሃን አየ፤ አሥራ አራት መልእክታትንም ጻፈ' },
          explanation: {
            en: 'Acts 9:3 records the light from heaven shining round about him on the way to Damascus.',
            am: 'በሐዋርያት ሥራ 9፥3 ወደ ደማስቆ ሲሄድ ድንገት ከሰማይ ብርሃን በዙሪያው አበራ።',
          },
          source: { label: 'Acts 9:3', route: '/bible/acts/9', kind: 'bible' },
          verifiedLocales: ['en'],
        },
        {
          id: 'match-apo-matthew',
          category: 'Apostles',
          left: { en: 'Apostle Matthew', am: 'ቅዱስ ማቴዎስ' },
          right: { en: 'Left the tax booth at Capernaum to write the first Gospel', am: 'በቅፍርናሆም የቀረጥ መሰብሰቢያውን ትቶ የመጀመሪያውን ወንጌል ጻፈ' },
          explanation: {
            en: 'Matthew 9:9 records Jesus seeing Matthew sitting at the receipt of custom and calling him.',
            am: 'በማቴዎስ 9፥9 ጌታችን ማቴዎስን በቀረጥ መቀበያው ተቀምጦ አይቶ ተከተለኝ አለው።',
          },
          source: { label: 'Matthew 9:9', route: '/bible/matthew/9', kind: 'bible' },
          verifiedLocales: ['en'],
        },
        {
          id: 'match-apo-james',
          category: 'Apostles',
          left: { en: 'Apostle James', am: 'ቅዱስ ያዕቆብ' },
          right: { en: 'First among the twelve apostles to suffer martyrdom by the sword', am: 'ከአሥራ ሁለቱ ሐዋርያት በሰይፍ ተመቶ የመጀመሪያው ሰማዕት ሆነ' },
          explanation: {
            en: 'Acts 12:2 records Herod killing James the brother of John with the sword.',
            am: 'በሐዋርያት ሥራ 12፥2 ሄሮድስ የዮሐንስን ወንድም ያዕቆብን በሰይፍ እንዳስገደለው ይናገራል።',
          },
          source: { label: 'Acts 12:2', route: '/bible/acts/12', kind: 'bible' },
          verifiedLocales: ['en'],
        },
      ],
    },
    {
      id: 'feasts-and-meanings',
      name: 'Orthodox Feasts and Holy Events',
      category: 'Feasts',
      pairs: [
        {
          id: 'match-fst-lidet',
          category: 'Feasts',
          left: { en: 'Lidet (Nativity of Christ)', am: 'ልደት (ገና)' },
          right: { en: 'The birth of our Lord in the flesh in a Bethlehem manger', am: 'የጌታችን በሥጋ በቤተልሔም በግርግም መወለድ' },
          explanation: {
            en: 'Luke 2:7 records Mary bringing forth her firstborn Son and wrapping Him in swaddling clothes.',
            am: 'በሉቃስ 2፥7 ድንግል ማርያም በቤተልሔም በግርግም የወለደችውን ጌታ በጨርቅ ጠቀለለችው።',
          },
          source: { label: 'Luke 2:7', route: '/bible/luke/2', kind: 'bible' },
          verifiedLocales: ['en'],
        },
        {
          id: 'match-fst-timket',
          category: 'Feasts',
          left: { en: 'Timket (Epiphany)', am: 'ጥምቀት' },
          right: { en: 'The baptism of Christ in Jordan revealing the Holy Trinity', am: 'ቅድስት ሥላሴ የተገለጡበት የጌታችን በዮርዳኖስ መጠመቅ' },
          explanation: {
            en: 'Matthew 3:16–17 records the heavens opening, the Spirit descending like a dove, and the Father’s voice.',
            am: 'በማቴዎስ 3፥16-17 መንፈስ ቅዱስ በርግብ አምሳል ሲወርድ የአብ ድምፅ ተሰማ።',
          },
          source: { label: 'Matthew 3:16', route: '/bible/matthew/3', kind: 'bible' },
          verifiedLocales: ['en'],
        },
        {
          id: 'match-fst-tabor',
          category: 'Feasts',
          left: { en: 'Debre Tabor (Transfiguration)', am: 'ደብረ ታቦር' },
          right: { en: 'Christ manifested His divine glory before Moses and Elijah', am: 'ክርስቶስ መለኮታዊ ክብሩን በሙሴና በኤልያስ ፊት የገለጠበት' },
          explanation: {
            en: 'Matthew 17:2 records His face shining as the sun and His raiment white as the light on the mount.',
            am: 'በማቴዎስ 17፥2 ፊቱ እንደ ፀሐይ በራ፥ ልብሱም እንደ ብርሃን ነጭ ሆነ።',
          },
          source: { label: 'Matthew 17:2', route: '/bible/matthew/17', kind: 'bible' },
          verifiedLocales: ['en'],
        },
        {
          id: 'match-fst-hosanna',
          category: 'Feasts',
          left: { en: 'Hosanna (Palm Sunday)', am: 'ሆሣዕና' },
          right: { en: 'Triumphal entry into Jerusalem with palm branches and praise', am: 'በዘንባባ ዝንጣፊና በምስጋና ወደ ቅድስት ከተማ በድል መግባት' },
          explanation: {
            en: 'John 12:13 records taking branches of palm trees and going forth to meet Him, crying “Hosanna”.',
            am: 'በዮሐንስ 12፥13 የዘንባባ ዛፍ ዝንጣፊ ይዘው “ሆሣዕና... የተባረከ ነው” እያሉ ሊቀበሉት ወጡ።',
          },
          source: { label: 'John 12:13', route: '/bible/john/12', kind: 'bible' },
          verifiedLocales: ['en'],
        },
        {
          id: 'match-fst-tensae',
          category: 'Feasts',
          left: { en: 'Tensae (Holy Resurrection)', am: 'ትንሣኤ' },
          right: { en: 'The third-day victory of Christ overcoming death and Hades', am: 'ክርስቶስ በሦስተኛው ቀን ሞትንና ሲኦልን ድል አድርጎ መነሣቱ' },
          explanation: {
            en: '1 Corinthians 15:20 proclaims: “Now is Christ risen from the dead, and become the firstfruits of them that slept.”',
            am: 'በ1ኛ ቆሮንቶስ 15፥20 “አሁን ግን ክርስቶስ ላንቀላፉት በኵራት ሆኖ ከሙታን ተነሥቷል” ተብሎ ተጽፏል።',
          },
          source: { label: '1 Corinthians 15:20', route: '/bible/1-corinthians/15', kind: 'bible' },
          verifiedLocales: ['en'],
        },
      ],
    },
  ]

  const allPairs: MatchPair[] = collections.flatMap(c => c.pairs)
  console.log(`=== VALIDATING MATCH PILOT (${collections.length} COLLECTIONS, ${allPairs.length} PAIRS) ===`)

  // 1. Validate each collection as a studio matching board
  for (const c of collections) {
    const studioErrors = validateStudioDraft({ game: 'match', content: c.pairs })
    if (studioErrors.length > 0) {
      throw new Error(`Collection ${c.name} studio validation failed: ${studioErrors.join('; ')}`)
    }
  }

  // 2. Validate individual pairs through card validators and build question drafts
  const questionDrafts: Array<import('../../src/lib/play/questionLibrary').QuestionDraft> = []
  for (const [index, pair] of allPairs.entries()) {
    const cardErrors = validateCardContent('match', pair)
    if (cardErrors.length > 0) {
      throw new Error(`Pair ${index + 1} (${pair.id}) card validation failed: ${cardErrors.join('; ')}`)
    }

    const qDraft = cardQuestionDraft('match', pair)
    const draftErrors = validateQuestionDraft(qDraft)
    if (draftErrors.length > 0) {
      throw new Error(`Pair ${index + 1} (${pair.id}) question draft validation failed: ${draftErrors.join('; ')}`)
    }

    questionDrafts.push(qDraft)
  }

  // 3. Verify non-conflict with existing cards in mergeCardBank
  const mergedBank = mergeCardBank('match', MATCH_PAIRS, allPairs)
  console.log(`Bank merge checked: ${MATCH_PAIRS.length} fallback + ${allPairs.length} new = ${mergedBank.length} merged pairs.`)
  if (mergedBank.length !== MATCH_PAIRS.length + allPairs.length) {
    throw new Error('Some new pairs conflicted with existing pairs in mergeCardBank!')
  }

  // 4. Preview import check
  const preview = previewQuestionImport(JSON.stringify(questionDrafts), new Set(MATCH_PAIRS.map(p => p.id)))
  console.log(`CMS Import preview: ${preview.items.length} items, ${preview.errors.length} errors.`)
  if (preview.errors.length > 0) {
    throw new Error(`CMS import preview errors: ${preview.errors.join('; ')}`)
  }

  // Write artifacts
  const outDir = join(process.cwd(), 'artifacts/faith-challenges/match')
  mkdirSync(outDir, { recursive: true })

  writeFileSync(join(outDir, 'collections.json'), `${JSON.stringify(collections, null, 2)}\n`, 'utf8')
  writeFileSync(join(outDir, 'pairs.json'), `${JSON.stringify(allPairs, null, 2)}\n`, 'utf8')
  writeFileSync(join(outDir, 'cms-import.json'), `${JSON.stringify(questionDrafts, null, 2)}\n`, 'utf8')
  writeFileSync(join(outDir, 'report.json'), `${JSON.stringify({
    game: 'match',
    batch: 'pilot-001',
    totalCollections: collections.length,
    totalPairs: allPairs.length,
    collections: collections.map(c => ({ id: c.id, name: c.name, pairsCount: c.pairs.length })),
    validation: {
      validateCardContent: 'PASS',
      validateStudioDraftCollections: 'PASS',
      validateQuestionDraft: 'PASS',
      previewQuestionImport: 'PASS',
      mergeCardBank: 'PASS',
    },
    generatedAt: new Date().toISOString(),
  }, null, 2)}\n`, 'utf8')

  console.log('Match & Discover pilot batch successfully generated, validated, and saved to artifacts/faith-challenges/match!')
}

run().catch((err) => {
  console.error(err)
  process.exit(1)
})

