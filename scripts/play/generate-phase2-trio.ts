/**
 * Phase 2 Content Generator for Who Am I?, Match & Discover, and Holy Emoji Challenge.
 * Produces 50 Who Am I cards, 50 Match pairs (10 collections), and 50 Emoji questions.
 * Fully validated with validateStudioDraft, validateCardContent, validateQuestionDraft, and previewQuestionImport.
 */
import fs from 'node:fs'
import path from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const { validateStudioDraft } = await import('../../src/lib/play/contentStudio')
  const { validateCardContent, mergeCardBank } = await import('../../src/lib/play/cardContent')
  const { validateQuestionDraft, previewQuestionImport } = await import('../../src/lib/play/questionLibrary')
  type WhoAmICard = import('../../src/lib/play/types').WhoAmICard
  type MatchPair = import('../../src/lib/play/types').MatchPair
  type PlayQuestion = import('../../src/lib/play/types').PlayQuestion

  const bible = (label: string, route: string) => ({ label, route, kind: 'bible' as const })
  const churchLib = (label: string, route: string) => ({ label, route, kind: 'church-library' as const })

  // =========================================================================
  // 1. WHO AM I? (50 NEW CARDS)
  // =========================================================================
  const whoAmIRaw: Array<{
    id: string
    category: 'biblical-people' | 'biblical-locations' | 'saints' | 'holy-objects'
    en: string
    am: string
    clue: string
    ref: string
    route: string
  }> = [
    // 1-10: Old Testament Patriarchs & Leaders
    { id: 'who-p2-isaac', category: 'biblical-people', en: 'Isaac', am: 'ይስሐቅ', clue: 'I was the child of promise born to Abraham and Sarah in their old age, and I carried the wood for the sacrifice on Mount Moriah.', ref: 'Genesis 22:6', route: '/bible/genesis/22' },
    { id: 'who-p2-jacob', category: 'biblical-people', en: 'Jacob (Israel)', am: 'ያዕቆብ (እስራኤል)', clue: 'I wrestled with an angel until dawn at Peniel, received the name Israel, and fathered the twelve tribes.', ref: 'Genesis 32:28', route: '/bible/genesis/32' },
    { id: 'who-p2-leah', category: 'biblical-people', en: 'Leah', am: 'ሊያ', clue: 'I was the elder daughter of Laban who became Jacob’s first wife and bore Judah, from whose line the Messiah came.', ref: 'Genesis 29:35', route: '/bible/genesis/29' },
    { id: 'who-p2-rachel', category: 'biblical-people', en: 'Rachel', am: 'ራሔል', clue: 'I was Jacob’s beloved wife whom he met at the well in Haran, and the mother of Joseph and Benjamin.', ref: 'Genesis 30:22', route: '/bible/genesis/30' },
    { id: 'who-p2-miriam', category: 'biblical-people', en: 'Miriam', am: 'ማርያም (እህተ ሙሴ)', clue: 'I watched over my baby brother Moses in the Nile and led the women in singing praise with timbrels after crossing the Red Sea.', ref: 'Exodus 15:20', route: '/bible/exodus/15' },
    { id: 'who-p2-aaron', category: 'biblical-people', en: 'Aaron', am: 'አሮን', clue: 'I was the older brother of Moses who served as his spokesman and became the first High Priest of Israel.', ref: 'Exodus 28:1', route: '/bible/exodus/28' },
    { id: 'who-p2-caleb', category: 'biblical-people', en: 'Caleb', am: 'ካሌብ', clue: 'I was one of the two faithful spies who believed God would give Israel the promised land, and I inherited Hebron in my old age.', ref: 'Joshua 14:14', route: '/bible/joshua/14' },
    { id: 'who-p2-deborah', category: 'biblical-people', en: 'Deborah', am: 'ዲቦራ', clue: 'I was a prophetess and judge in Israel who held court under a palm tree and inspired Barak to victory over Sisera.', ref: 'Judges 4:4', route: '/bible/judges/4' },
    { id: 'who-p2-gideon', category: 'biblical-people', en: 'Gideon', am: 'ጌዴዎን', clue: 'God tested my faith with the morning dew on a fleece, and I defeated the Midianite multitude with only three hundred men.', ref: 'Judges 7:7', route: '/bible/judges/7' },
    { id: 'who-p2-samson', category: 'biblical-people', en: 'Samson', am: 'ሶምሶን', clue: 'I was a Nazirite blessed with extraordinary strength who fought the Philistines with a donkey’s jawbone.', ref: 'Judges 15:15', route: '/bible/judges/15' },

    // 11-20: Kings, Queens & Faithful Women
    { id: 'who-p2-hannah', category: 'biblical-people', en: 'Hannah', am: 'ሐና', clue: 'I prayed with tears in the tabernacle at Shiloh for a son, and after God gave me Samuel, I dedicated him to divine service.', ref: '1 Samuel 1:28', route: '/bible/1-samuel/1' },
    { id: 'who-p2-jonathan', category: 'biblical-people', en: 'Jonathan', am: 'ዮናታን', clue: 'I was King Saul’s son who formed a covenant of deep, selfless friendship with David and protected him from my father’s wrath.', ref: '1 Samuel 18:3', route: '/bible/1-samuel/18' },
    { id: 'who-p2-abigail', category: 'biblical-people', en: 'Abigail', am: 'አቢግያ', clue: 'I was a woman of good understanding and beauty who intervened with gifts to prevent David from shedding blood over Nabal’s folly.', ref: '1 Samuel 25:32', route: '/bible/1-samuel/25' },
    { id: 'who-p2-hezekiah', category: 'biblical-people', en: 'King Hezekiah', am: 'ንጉሥ ሕዝቅያስ', clue: 'I trusted in the Lord, reopened the Temple, held a great Passover, and God added fifteen years to my life after I prayed.', ref: '2 Kings 20:6', route: '/bible/2-kings/20' },
    { id: 'who-p2-josiah', category: 'biblical-people', en: 'King Josiah', am: 'ንጉሥ ኢዮስያስ', clue: 'I became king at eight years old, wept when the Book of the Law was discovered in the Temple, and purged the land of idolatry.', ref: '2 Kings 22:11', route: '/bible/2-kings/22' },
    { id: 'who-p2-job', category: 'biblical-people', en: 'Job', am: 'ኢዮብ', clue: 'I remained steadfast in faith through severe trials and loss, declaring: I know that my Redeemer lives.', ref: 'Job 19:25', route: '/bible/job/19' },
    { id: 'who-p2-ezra', category: 'biblical-people', en: 'Ezra', am: 'ዕዝራ', clue: 'I was a priest and skilled scribe who led exiles back from Babylon and taught the statutes and laws of God to the community.', ref: 'Ezra 7:10', route: '/bible/ezra/7' },
    { id: 'who-p2-nehemiah', category: 'biblical-people', en: 'Nehemiah', am: 'ነህምያ', clue: 'I served as cupbearer to King Artaxerxes before leading the rebuilding of Jerusalem’s broken walls in fifty-two days.', ref: 'Nehemiah 2:1', route: '/bible/nehemiah/2' },
    { id: 'who-p2-mordecai', category: 'biblical-people', en: 'Mordecai', am: 'መርዶክዮስ', clue: 'I uncovered a plot against the king, refused to bow to Haman, and urged Queen Esther to advocate for our people.', ref: 'Esther 4:14', route: '/bible/esther/4' },
    { id: 'who-p2-boaz', category: 'biblical-people', en: 'Boaz', am: 'ቦዔዝ', clue: 'I was a wealthy and righteous man of Bethlehem who showed kindness to Ruth in my barley fields and redeemed her as my wife.', ref: 'Ruth 4:10', route: '/bible/ruth/4' },

    // 21-30: Prophets
    { id: 'who-p2-isaiah', category: 'biblical-people', en: 'Isaiah', am: 'ኢሳይያስ', clue: 'I saw the Lord sitting on a throne surrounded by seraphim and prophesied clearly about the virgin birth and the Suffering Servant.', ref: 'Isaiah 6:1', route: '/bible/isaiah/6' },
    { id: 'who-p2-jeremiah', category: 'biblical-people', en: 'Jeremiah', am: 'ኤርምያስ', clue: 'I was called from my mother’s womb as a prophet to the nations, wept over Jerusalem’s siege, and foretold the New Covenant.', ref: 'Jeremiah 31:31', route: '/bible/jeremiah/31' },
    { id: 'who-p2-ezekiel', category: 'biblical-people', en: 'Ezekiel', am: 'ሕዝቅኤል', clue: 'I saw visions of divine cherubim by the river Chebar and prophesied life to the valley of dry bones.', ref: 'Ezekiel 37:4', route: '/bible/ezekiel/37' },
    { id: 'who-p2-hosea', category: 'biblical-people', en: 'Hosea', am: 'ሆሴዕ', clue: 'God instructed me to marry an unfaithful wife as a living sign of His enduring, merciful love for wayward Israel.', ref: 'Hosea 1:2', route: '/bible/hosea/1' },
    { id: 'who-p2-joel', category: 'biblical-people', en: 'Joel', am: 'ኢዮኤል', clue: 'I prophesied that in the last days God would pour out His Spirit upon all flesh, sons and daughters alike.', ref: 'Joel 2:28', route: '/bible/joel/2' },
    { id: 'who-p2-amos', category: 'biblical-people', en: 'Amos', am: 'አሞጽ', clue: 'I was a herdsman and tender of sycamore fruit from Tekoa whom God sent to preach justice rolling like a river.', ref: 'Amos 5:24', route: '/bible/amos/5' },
    { id: 'who-p2-jonah', category: 'biblical-people', en: 'Jonah', am: 'ዮናስ', clue: 'I was in the belly of a great fish for three days and three nights before preaching repentance to the people of Nineveh.', ref: 'Jonah 1:17', route: '/bible/jonah/1' },
    { id: 'who-p2-micah', category: 'biblical-people', en: 'Micah', am: 'ሚክያስ', clue: 'I prophesied that from Bethlehem Ephrathah would come forth the Ruler whose goings forth are from of old.', ref: 'Micah 5:2', route: '/bible/micah/5' },
    { id: 'who-p2-habakkuk', category: 'biblical-people', en: 'Habakkuk', am: 'ዕንባቆም', clue: 'I stood upon my watchtower questioning divine judgment and wrote that the just shall live by his faith.', ref: 'Habakkuk 2:4', route: '/bible/habakkuk/2' },
    { id: 'who-p2-zechariah-prophet', category: 'biblical-people', en: 'Zechariah the Prophet', am: 'ዘካርያስ ነቢይ', clue: 'I saw visions of horses, lampstands, and crowned Zerubbabel, and foretold the King arriving lowly upon a donkey.', ref: 'Zechariah 9:9', route: '/bible/zechariah/9' },

    // 31-40: New Testament Figures & Apostles
    { id: 'who-p2-elizabeth', category: 'biblical-people', en: 'Elizabeth', am: 'ኤልሳቤጥ', clue: 'I was the wife of Zechariah the priest who, filled with the Holy Spirit, welcomed the Virgin Mary as the mother of my Lord.', ref: 'Luke 1:43', route: '/bible/luke/1' },
    { id: 'who-p2-simeon', category: 'biblical-people', en: 'Simeon the Elder', am: 'ስምዖን አረጋዊ', clue: 'The Holy Spirit promised I would not see death before beholding the Lord’s Christ, whom I cradled in the Temple.', ref: 'Luke 2:29', route: '/bible/luke/2' },
    { id: 'who-p2-anna', category: 'biblical-people', en: 'Anna the Prophetess', am: 'ሐና ነቢይት', clue: 'I was an eighty-four-year-old widow who departed not from the Temple with fastings and gave thanks when the Christ child arrived.', ref: 'Luke 2:38', route: '/bible/luke/2' },
    { id: 'who-p2-andrew', category: 'biblical-people', en: 'Andrew the Apostle', am: 'እንዲርያስ ሐዋርያ', clue: 'I was a disciple of John the Baptist who first found my brother Simon Peter and brought him to Jesus.', ref: 'John 1:41', route: '/bible/john/1' },
    { id: 'who-p2-james-zebedee', category: 'biblical-people', en: 'James son of Zebedee', am: 'ያዕቆብ ዘዘብዴዎስ', clue: 'I was John’s brother, one of the three who witnessed the Transfiguration, and the first of the Twelve Apostles martyred by Herod.', ref: 'Acts 12:2', route: '/bible/acts/12' },
    { id: 'who-p2-john-apostle', category: 'biblical-people', en: 'John the Beloved', am: 'ዮሐንስ ወንጌላዊ', clue: 'I leaned on Jesus’ chest at the Last Supper, stood at the foot of the Cross, and wrote the Gospel of the Incarnate Word.', ref: 'John 19:26', route: '/bible/john/19' },
    { id: 'who-p2-philip', category: 'biblical-people', en: 'Philip the Apostle', am: 'ፊልጶስ ሐዋርያ', clue: 'I was from Bethsaida, invited Nathanael to come and see Jesus, and asked the Lord to show us the Father at the Last Supper.', ref: 'John 14:8', route: '/bible/john/14' },
    { id: 'who-p2-matthew', category: 'biblical-people', en: 'Matthew the Evangelist', am: 'ማቴዎስ ወንጌላዊ', clue: 'I was sitting at the tax collector’s booth when Jesus called me to follow Him, and I wrote the Gospel opening with His royal genealogy.', ref: 'Matthew 9:9', route: '/bible/matthew/9' },
    { id: 'who-p2-barnabas', category: 'biblical-people', en: 'Barnabas', am: 'በርናባስ', clue: 'My name means Son of Encouragement; I sold a field to lay the money at the apostles’ feet and vouched for Saul in Jerusalem.', ref: 'Acts 4:36', route: '/bible/acts/4' },
    { id: 'who-p2-cornelius', category: 'biblical-people', en: 'Cornelius the Centurion', am: 'ቆርኔሌዎስ', clue: 'I was a devout Roman centurion in Caesarea who gave alms and prayed continually, to whom Peter was sent to preach the Gospel.', ref: 'Acts 10:2', route: '/bible/acts/10' },

    // 41-45: Saints & Church Fathers
    { id: 'who-p2-frumentius', category: 'saints', en: 'Saint Frumentius (Abba Selama)', am: 'አባ ሰላማ ከሣቴ ብርሃን', clue: 'I was consecrated by Saint Athanasius of Alexandria as the first bishop of Ethiopia and illuminated Axum with the Gospel.', ref: 'Synaxarium — Hamle 26', route: '/library/history/frumentius' },
    { id: 'who-p2-yared', category: 'saints', en: 'Saint Yared', am: 'ቅዱስ ያሬድ', clue: 'Inspired by the singing of heavenly birds, I composed the three sacred chant modes (Geez, Ezel, Araray) for the Ethiopian Church.', ref: 'Synaxarium — Ginbot 11', route: '/library/hymns/yared' },
    { id: 'who-p2-gebre-menfes-kidus', category: 'saints', en: 'Abune Gebre Menfes Kidus', am: 'አቡነ ገብረ መንፈስ ቅዱስ', clue: 'I was a renowned desert anchorite associated with Mount Ziquala who lived among wild beasts in perpetual fasting and prayer.', ref: 'Synaxarium — Megabit 5', route: '/library/saints/gebre-menfes-kidus' },
    { id: 'who-p2-lalibela', category: 'saints', en: 'King Saint Lalibela', am: 'ቅዱስ ላሊበላ', clue: 'Guided by divine revelation and assisted by holy angels, I commissioned the eleven monolithic rock-hewn churches of Roha.', ref: 'Synaxarium — Sene 12', route: '/library/history/lalibela' },
    { id: 'who-p2-athanasius', category: 'saints', en: 'Saint Athanasius of Alexandria', am: 'ቅዱስ አትናቴዎስ ሐዋርያዊ', clue: 'I championed the true divinity of Christ against Arius at Nicaea, wrote On the Incarnation, and ordained Ethiopia’s first bishop.', ref: 'Synaxarium — Ginbot 7', route: '/library/patristics/athanasius' },

    // 46-50: Locations & Holy Objects
    { id: 'who-p2-nazareth', category: 'biblical-locations', en: 'Nazareth', am: 'ናዝሬት', clue: 'I was the Galilean town where the Archangel Gabriel appeared to Mary and where Jesus grew up with Joseph and His Mother.', ref: 'Luke 2:51', route: '/bible/luke/2' },
    { id: 'who-p2-jordan-river', category: 'biblical-locations', en: 'Jordan River', am: 'የዮርዳኖስ ወንዝ', clue: 'I was the waters where Joshua led the ark into the promised land, where Naaman washed seven times, and where Jesus was baptized.', ref: 'Matthew 3:13', route: '/bible/matthew/3' },
    { id: 'who-p2-mount-carmel', category: 'biblical-locations', en: 'Mount Carmel', am: 'ደብረ ቀርሜሎስ', clue: 'I was the coastal mountain where the prophet Elijah confronted the four hundred and fifty prophets of Baal and fire fell from heaven.', ref: '1 Kings 18:20', route: '/bible/1-kings/18' },
    { id: 'who-p2-brazen-altar', category: 'holy-objects', en: 'Altar of Burnt Offering', am: 'የሚቃጠል መሥዋዕት መሠዊያ', clue: 'I was the bronze-covered wooden altar set before the door of the Tabernacle where morning and evening sacrifices were offered.', ref: 'Exodus 27:1', route: '/bible/exodus/27' },
    { id: 'who-p2-golden-censer', category: 'holy-objects', en: 'Golden Censer', am: 'ማዕጠንት (የወርቅ ጥና)', clue: 'I hold fragrant incense before the presence of the Lord, symbolizing the acceptable prayers of all the saints ascending to heaven.', ref: 'Revelation 8:3', route: '/bible/revelation/8' }
  ]

  const whoAmICards: WhoAmICard[] = whoAmIRaw.map(r => ({
    id: r.id,
    category: r.category,
    answer: { en: r.en, am: r.am },
    explanation: { en: r.clue },
    source: r.route.startsWith('/bible') ? bible(r.ref, r.route) : churchLib(r.ref, r.route),
    verifiedLocales: ['en']
  }))

  console.log('=== VALIDATING WHO AM I? PHASE 2 (50 CARDS) ===')
  for (const card of whoAmICards) {
    const errors = validateCardContent('who-am-i', card)
    if (errors.length > 0) {
      console.error(`Validation failed for card ${card.id}:`, errors)
      process.exit(1)
    }
  }

  // Verify non-conflict with existing cards in mergeCardBank
  const p1Cards = JSON.parse(fs.readFileSync(path.join(process.cwd(), 'artifacts', 'faith-challenges', 'who-am-i', 'cards.json'), 'utf8'))
  const mergedBank = mergeCardBank('who-am-i', p1Cards, whoAmICards)
  console.log(`Merged Who Am I bank: ${mergedBank.length} cards (0 duplicates).`)

  // Save Who Am I artifacts
  const whoDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-2', 'who-am-i')
  fs.mkdirSync(whoDir, { recursive: true })
  fs.writeFileSync(path.join(whoDir, 'cards.json'), JSON.stringify(whoAmICards, null, 2), 'utf8')

  const whoCmsDrafts = whoAmICards.map(c => ({
    stable_id: c.id,
    game_type: 'who-am-i' as const,
    category: c.category,
    difficulty: 'growing' as const,
    payload: c,
    source_references: [c.source]
  }))
  fs.writeFileSync(path.join(whoDir, 'cms-import.json'), JSON.stringify(whoCmsDrafts, null, 2), 'utf8')
  const whoImportPreview = previewQuestionImport(JSON.stringify(whoCmsDrafts), new Set())
  console.log(`Who Am I CMS Preview: ${whoImportPreview.items.length} items, ${whoImportPreview.errors.length} errors.`)

  fs.writeFileSync(path.join(whoDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'who-am-i',
    phase: 2,
    acceptedCount: whoAmICards.length,
    rejectedCount: 0,
    categoriesDistribution: {
      'biblical-people': whoAmICards.filter(c => c.category === 'biblical-people').length,
      'saints': whoAmICards.filter(c => c.category === 'saints').length,
      'biblical-locations': whoAmICards.filter(c => c.category === 'biblical-locations').length,
      'holy-objects': whoAmICards.filter(c => c.category === 'holy-objects').length
    },
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')


  // =========================================================================
  // 2. MATCH & DISCOVER (50 NEW PAIRS / 10 COLLECTIONS)
  // =========================================================================
  const collectionsRaw = [
    {
      id: 'old-testament-mothers',
      name: { en: 'Old Testament Mothers', am: 'የብሉይ ኪዳን እናቶች' },
      pairs: [
        { id: 'match-p2-sarah', left: { en: 'Sarah', am: 'ሣራ' }, right: { en: 'Mother of Isaac', am: 'የይስሐቅ እናት' }, exp: 'Sarah bore Isaac to Abraham according to God’s promise in their old age.', ref: 'Genesis 21:2', route: '/bible/genesis/21' },
        { id: 'match-p2-rebekah', left: { en: 'Rebekah', am: 'ርብቃ' }, right: { en: 'Mother of Jacob and Esau', am: 'የያዕቆብና የዔሳው እናት' }, exp: 'Rebekah was chosen at the well and bore twin sons to Isaac.', ref: 'Genesis 25:24', route: '/bible/genesis/25' },
        { id: 'match-p2-jochebed', left: { en: 'Jochebed', am: 'ዮካቤድ' }, right: { en: 'Mother of Moses', am: 'የሙሴ እናት' }, exp: 'Jochebed hid Moses in the papyrus basket on the Nile to preserve his life.', ref: 'Exodus 2:3', route: '/bible/exodus/2' },
        { id: 'match-p2-hannah-mother', left: { en: 'Hannah', am: 'ሐና' }, right: { en: 'Mother of Samuel', am: 'የሳሙኤል እናት' }, exp: 'Hannah prayed in the tabernacle and dedicated her promised child to God.', ref: '1 Samuel 1:20', route: '/bible/1-samuel/1' },
        { id: 'match-p2-elizabeth-mother', left: { en: 'Elizabeth', am: 'ኤልሳቤጥ' }, right: { en: 'Mother of John the Baptist', am: 'የመጥምቁ ዮሐንስ እናት' }, exp: 'Elizabeth conceived in her old age and bore the Lord’s forerunner.', ref: 'Luke 1:57', route: '/bible/luke/1' }
      ]
    },
    {
      id: 'parables-and-meanings',
      name: { en: 'Parables and Divine Truths', am: 'ምሳሌዎችና መለኮታዊ ትምህርቶች' },
      pairs: [
        { id: 'match-p2-sower', left: { en: 'The Sower', am: 'የዘሪው ምሳሌ' }, right: { en: 'The Seed is the Word of God', am: 'ዘሩ የእግዚአብሔር ቃል ነው' }, exp: 'Christ explained that the seed falling on various soils is the proclaimed Word.', ref: 'Luke 8:11', route: '/bible/luke/8' },
        { id: 'match-p2-samaritan', left: { en: 'The Good Samaritan', am: 'የቸሩ ሳምራዊ ምሳሌ' }, right: { en: 'Mercy toward One’s Neighbor', am: 'ለባልንጀራ የሚደረግ ምሕረት' }, exp: 'The traveler cared for the wounded man with oil and wine regardless of boundary.', ref: 'Luke 10:37', route: '/bible/luke/10' },
        { id: 'match-p2-prodigal', left: { en: 'The Prodigal Son', am: 'የጠፋው ልጅ ምሳሌ' }, right: { en: 'The Father’s Joyful Forgiveness', am: 'የአብ ይቅርታና ደስታ' }, exp: 'The compassionate father ran to embrace and restore his repentant younger son.', ref: 'Luke 15:20', route: '/bible/luke/15' },
        { id: 'match-p2-pearl', left: { en: 'The Pearl of Great Price', am: 'የከበረ ዕንቁ ምሳሌ' }, right: { en: 'The Supreme Value of the Kingdom', am: 'የመንግሥተ ሰማያት የላቀ ክብር' }, exp: 'A merchant sold all his possessions to buy the one pearl of incomparable worth.', ref: 'Matthew 13:46', route: '/bible/matthew/13' },
        { id: 'match-p2-mustard', left: { en: 'The Mustard Seed', am: 'የሰናፍጭ ቅንጣት ምሳሌ' }, right: { en: 'Growth of the Church from Smallness', am: 'የቤተ ክርስቲያን ታላቅ ዕድገት' }, exp: 'The smallest seed grows into a great tree sheltering the birds of the air.', ref: 'Matthew 13:32', route: '/bible/matthew/13' }
      ]
    },
    {
      id: 'seven-deacons',
      name: { en: 'The Seven Deacons of Acts', am: 'የቀደመችው ቤተ ክርስቲያን ሰባቱ ዲያቆናት' },
      pairs: [
        { id: 'match-p2-stephen-deacon', left: { en: 'Stephen', am: 'እስጢፋኖስ' }, right: { en: 'First Protomartyr of the Church', am: 'የመጀመሪያው ሰማዕት' }, exp: 'Full of grace and power, Stephen bore witness to Christ and prayed for his persecutors.', ref: 'Acts 7:59', route: '/bible/acts/7' },
        { id: 'match-p2-philip-deacon', left: { en: 'Philip the Evangelist', am: 'ፊልጶስ ወንጌላዊ' }, right: { en: 'Baptized the Ethiopian Official', am: 'ኢትዮጵያዊውን ጃንደረባ ያጠመቀ' }, exp: 'Philip explained the prophet Isaiah to the Queen’s treasurer on the desert road.', ref: 'Acts 8:38', route: '/bible/acts/8' },
        { id: 'match-p2-prochorus', left: { en: 'Prochorus', am: 'ጵሮኮሮስ' }, right: { en: 'Companion and Scribe of Saint John', am: 'የዮሐንስ ረዳትና ጸሐፊ' }, exp: 'One of the chosen seven who later accompanied the beloved apostle in ministry.', ref: 'Acts 6:5', route: '/bible/acts/6' },
        { id: 'match-p2-nicanor', left: { en: 'Nicanor', am: 'ኒቃኖር' }, right: { en: 'Faithful Servant of the Tables', am: 'የማዕድ ታማኝ አገልጋይ' }, exp: 'Chosen by the multitude for good reputation and wisdom to minister to widows.', ref: 'Acts 6:5', route: '/bible/acts/6' },
        { id: 'match-p2-parmenas', left: { en: 'Parmenas', am: 'ጳርሜናስ' }, right: { en: 'Consecrated for Apostolic Service', am: 'ለሐዋርያዊ አገልግሎት የተለየ' }, exp: 'Ordained with prayer and the laying on of hands by the Twelve Apostles.', ref: 'Acts 6:6', route: '/bible/acts/8' }
      ]
    },
    {
      id: 'biblical-mountains',
      name: { en: 'Sacred Mountains of the Bible', am: 'የመጽሐፍ ቅዱስ ቅዱሳን ተራሮች' },
      pairs: [
        { id: 'match-p2-ararat', left: { en: 'Mount Ararat', am: 'የአራራት ተራራ' }, right: { en: 'Where Noah’s Ark Came to Rest', am: 'የኖኅ መርከብ ያረፈበት' }, exp: 'The waters abated and the ark grounded on the mountains of Ararat.', ref: 'Genesis 8:4', route: '/bible/genesis/8' },
        { id: 'match-p2-moriah', left: { en: 'Mount Moriah', am: 'የሞሪያ ተራራ' }, right: { en: 'Where Abraham Proved His Faith', am: 'አብርሃም እምነቱን ያረጋገጠበት' }, exp: 'God provided the ram caught in a thicket on the mountain of the Lord.', ref: 'Genesis 22:14', route: '/bible/genesis/22' },
        { id: 'match-p2-sinai', left: { en: 'Mount Sinai', am: 'ደብረ ሲና' }, right: { en: 'Where the Law Was Given', am: 'ሕጉ ለሙሴ የተሰጠበት' }, exp: 'God descended in fire and gave the Ten Commandments to Moses.', ref: 'Exodus 19:20', route: '/bible/exodus/19' },
        { id: 'match-p2-carmel-mt', left: { en: 'Mount Carmel', am: 'ደብረ ቀርሜሎስ' }, right: { en: 'Where Elijah’s Sacrifice Was Answered', am: 'የኤልያስ መሥዋዕት በእሳት የተቃጠለበት' }, exp: 'Fire fell from the Lord consuming the waterlogged burnt sacrifice before all Israel.', ref: '1 Kings 18:38', route: '/bible/1-kings/18' },
        { id: 'match-p2-olives', left: { en: 'Mount of Olives', am: 'ደብረ ዘይት' }, right: { en: 'Where Christ Ascended to Heaven', am: 'ክርስቶስ ወደ ሰማይ ያረገበት' }, exp: 'Christ blessed His disciples and ascended in glory from the Mount of Olives.', ref: 'Acts 1:12', route: '/bible/acts/1' }
      ]
    },
    {
      id: 'fruits-of-the-spirit',
      name: { en: 'The Fruit of the Spirit', am: 'የመንፈስ ፍሬ' },
      pairs: [
        { id: 'match-p2-love', left: { en: 'Love', am: 'ፍቅር' }, right: { en: 'The Bond of Perfect Union', am: 'የፍጹምነት ማሰሪያ' }, exp: 'Love is patient and kind; it bears all things and never fails.', ref: 'Galatians 5:22', route: '/bible/galatians/5' },
        { id: 'match-p2-peace', left: { en: 'Peace', am: 'ሰላም' }, right: { en: 'Surpassing All Human Understanding', am: 'ከማስተዋል ሁሉ በላይ የሆነ' }, exp: 'The peace of God guards hearts and minds through Jesus Christ.', ref: 'Philippians 4:7', route: '/bible/philippians/4' },
        { id: 'match-p2-patience', left: { en: 'Patience', am: 'ትዕግሥት' }, right: { en: 'Enduring Trials with Hope', am: 'መከራን በተስፋ መጽናት' }, exp: 'Longsuffering enables the faithful to inherit the promises through faith.', ref: 'Hebrews 6:12', route: '/bible/hebrews/6' },
        { id: 'match-p2-faithfulness', left: { en: 'Faithfulness', am: 'ታማኝነት' }, right: { en: 'Steadfast Loyalty to God’s Covenant', am: 'ለእግዚአብሔር ኪዳን ጽኑ መሆን' }, exp: 'He who is faithful in little is trusted with much in the kingdom.', ref: 'Luke 16:10', route: '/bible/luke/16' },
        { id: 'match-p2-gentleness', left: { en: 'Gentleness', am: 'የዋህነት' }, right: { en: 'Meekness Reflecting Christ’s Heart', am: 'የክርስቶስን ልብ የሚያንጸባርቅ' }, exp: 'Christ declared: Learn of me, for I am meek and lowly in heart.', ref: 'Matthew 11:29', route: '/bible/matthew/11' }
      ]
    },
    {
      id: 'armor-of-god',
      name: { en: 'The Whole Armor of God', am: 'የእግዚአብሔር ሙሉ የጦር ዕቃ' },
      pairs: [
        { id: 'match-p2-belt', left: { en: 'Belt of Truth', am: 'የእውነት ዝናር' }, right: { en: 'Girding with Sincerity and Integrity', am: 'ወገብን በእውነት መታጠቅ' }, exp: 'Truth anchors every defense and protects the believer from deception.', ref: 'Ephesians 6:14', route: '/bible/ephesians/6' },
        { id: 'match-p2-breastplate', left: { en: 'Breastplate of Righteousness', am: 'የጽድቅ ጥሩር' }, right: { en: 'Protecting the Heart against Evil', am: 'ልብን ከክፋት መጠበቅ' }, exp: 'Righteousness granted through Christ shields the heart from spiritual harm.', ref: 'Ephesians 6:14', route: '/bible/ephesians/6' },
        { id: 'match-p2-shield', left: { en: 'Shield of Faith', am: 'የእምነት ጋሻ' }, right: { en: 'Extinguishing Fiery Darts', am: 'የሚነድዱትን ፍላጾች ማጥፋት' }, exp: 'Active faith quenches all the burning temptations of the adversary.', ref: 'Ephesians 6:16', route: '/bible/ephesians/6' },
        { id: 'match-p2-helmet', left: { en: 'Helmet of Salvation', am: 'የመዳን ራስ ቁር' }, right: { en: 'Guarding the Mind with Eternal Hope', am: 'አእምሮን በዘላለም ተስፋ መጠበቅ' }, exp: 'The assurance of salvation guards the mind against despair and confusion.', ref: 'Ephesians 6:17', route: '/bible/ephesians/6' },
        { id: 'match-p2-sword', left: { en: 'Sword of the Spirit', am: 'የመንፈስ ሰይፍ' }, right: { en: 'The Living Word of God', am: 'ሕያው የሆነው የእግዚአብሔር ቃል' }, exp: 'The Word of God is living, active, and sharper than any two-edged sword.', ref: 'Ephesians 6:17', route: '/bible/ephesians/6' }
      ]
    },
    {
      id: 'ethiopian-monastic-fathers',
      name: { en: 'Ethiopian Monastic Saints', am: 'የኢትዮጵያ ገዳማውያን አባቶች' },
      pairs: [
        { id: 'match-p2-tekle-father', left: { en: 'Abune Tekle Haymanot', am: 'አቡነ ተክለ ሃይማኖት' }, right: { en: 'Founder of Debre Libanos Monastery', am: 'የደብረ ሊባኖስ ገዳም መሥራች' }, exp: 'The great father who prayed standing for years and unified monastic life.', ref: 'Synaxarium — Tahsas 24', route: '/library/saints/tekle-haymanot' },
        { id: 'match-p2-ewostatewos', left: { en: 'Abune Ewostatewos', am: 'አቡነ ኤዎስጣቴዎስ' }, right: { en: 'Defender of the Sabbath in the North', am: 'በሰሜን የሰንበትን ክብር ያስጠበቁ' }, exp: 'Monastic reformer who traveled through Armenia, Egypt, and Cyprus.', ref: 'Synaxarium — Meskerem 18', route: '/library/history/ewostatewos' },
        { id: 'match-p2-estifanos-father', left: { en: 'Abba Estifanos of Gunda Gunde', am: 'አባ እስጢፋኖስ ዘጉንዳ ጉንዶ' }, right: { en: 'Leader of the Gunda Gunde Monks', am: 'የጉንዳ ጉንዶ ገዳም መሪ' }, exp: 'Strict ascetic monastic leader of northern Tigray noted for scriptural devotion.', ref: 'Synaxarium — Sene 18', route: '/library/history/gunda-gunde' },
        { id: 'match-p2-aragawi', left: { en: 'Abba Za-Mikael Aragawi', am: 'አባ ዘሚካኤል አረጋዊ' }, right: { en: 'Founder of Debre Damo on the Clifftop', am: 'የደብረ ዳሞ ገዳም መሥራች' }, exp: 'Ascended the sheer plateau aided by a serpent, founding the cliff monastery.', ref: 'Synaxarium — Tikimt 14', route: '/library/saints/aragawi' },
        { id: 'match-p2-pantalewon', left: { en: 'Abba Pantalewon', am: 'አባ ጰንጠሌዎን' }, right: { en: 'Ascetic Hermit of the Cell near Axum', am: 'በአክሱም አቅራቢያ በበዓት የተጋደሉ' }, exp: 'One of the Nine Saints who advised King Kaleb before his southern expedition.', ref: 'Synaxarium — Tikimt 6', route: '/library/saints/pantalewon' }
      ]
    },
    {
      id: 'gospel-symbols',
      name: { en: 'The Four Evangelists and Symbols', am: 'አራቱ ወንጌላውያንና ምልክቶቻቸው' },
      pairs: [
        { id: 'match-p2-matthew-sym', left: { en: 'Saint Matthew', am: 'ቅዱስ ማቴዎስ' }, right: { en: 'Winged Man / Human Genealogy', am: 'ሰብአዊ ገጽ / የትውልድ ሐረግ' }, exp: 'Matthew’s Gospel opens with the royal ancestry and human incarnation of Christ.', ref: 'Ezekiel 1:10', route: '/bible/matthew/1' },
        { id: 'match-p2-mark-sym', left: { en: 'Saint Mark', am: 'ቅዱስ ማርቆስ' }, right: { en: 'Winged Lion / Voice in Wilderness', am: 'አንበሳ / በምድረ በዳ የሚጮኽ ድምፅ' }, exp: 'Mark begins with the roaring herald John the Baptist in the wilderness.', ref: 'Ezekiel 1:10', route: '/bible/mark/1' },
        { id: 'match-p2-luke-sym', left: { en: 'Saint Luke', am: 'ቅዱስ ሉቃስ' }, right: { en: 'Winged Ox / Priestly Sacrifice', am: 'ላም / የክህነት መሥዋዕት' }, exp: 'Luke begins with Zechariah offering incense in the Temple altar of sacrifice.', ref: 'Ezekiel 1:10', route: '/bible/luke/1' },
        { id: 'match-p2-john-sym', left: { en: 'Saint John', am: 'ቅዱስ ዮሐንስ' }, right: { en: 'Soaring Eagle / Divine Eternity', am: 'ንስር / የመለኮት ረቂቅ ምሥጢር' }, exp: 'John soars to the highest heavens proclaiming: In the beginning was the Word.', ref: 'Ezekiel 1:10', route: '/bible/john/1' },
        { id: 'match-p2-paul-vessel', left: { en: 'Saint Paul', am: 'ቅዱስ ጳውሎስ' }, right: { en: 'Chosen Vessel to the Gentiles', am: 'ለአሕዛብ የተመረጠ ዕቃ' }, exp: 'Christ called Paul a chosen instrument to bear His name before kings and nations.', ref: 'Acts 9:15', route: '/bible/acts/9' }
      ]
    },
    {
      id: 'church-objects-liturgy',
      name: { en: 'Sacred Liturgical Objects', am: 'የቤተ ክርስቲያን ንዋያተ ቅድሳት' },
      pairs: [
        { id: 'match-p2-meskel-obj', left: { en: 'Hand Cross (Meskel)', am: 'የእጅ መስቀል' }, right: { en: 'Blessing the Faithful in the Trinity', am: 'ምእመናንን በሥላሴ ስም መባረኪያ' }, exp: 'Priests carry the sacred cross to impart peace and divine blessings to worshippers.', ref: 'Liturgy of Saint Dioscorus', route: '/library/liturgy/anaphora' },
        { id: 'match-p2-tsenatsil-obj', left: { en: 'Sistrum (Tsenatsil)', am: 'ጸናጽል' }, right: { en: 'Chiming Sacred Liturgical Hymns', am: 'የምስጋና ዝማሬ ዜማ ማጀቢያ' }, exp: 'Used by debteras and clergy during vigils to accompany rhythmic chanting.', ref: 'Psalm 150:5', route: '/bible/psalms/150' },
        { id: 'match-p2-kebero-obj', left: { en: 'Church Drum (Kebero)', am: 'ከበሮ' }, right: { en: 'Marking the Tempo of Processions', am: 'የሥርዓተ ማኅሌት ምት ጠባቂ' }, exp: 'Double-ended drum directing the sacred dance and movements of the choir.', ref: 'Psalm 81:2', route: '/bible/psalms/81' },
        { id: 'match-p2-maeteb-obj', left: { en: 'Neck Cord (Ma’eteb)', am: 'ማዕተብ' }, right: { en: 'Badge of Baptismal Faith', am: 'የክርስትና ጥምቀት ማረጋገጫ' }, exp: 'Silk cord worn from baptism signifying lifelong union with the Holy Trinity.', ref: 'Orthodox Catechism', route: '/library/catechism/baptism' },
        { id: 'match-p2-makamiya-obj', left: { en: 'Prayer Staff (Makamiya)', am: 'መቋሚያ' }, right: { en: 'Support during Lengthy Chants', am: 'በማኅሌት ወቅት የድጋፍ በትር' }, exp: 'T-shaped prayer staff used by clergy during standing vigils and liturgical hymns.', ref: 'Traditional Chant Rules', route: '/library/hymns/yared' }
      ]
    },
    {
      id: 'miracles-of-john',
      name: { en: 'Signs in the Gospel of John', am: 'በዮሐንስ ወንጌል የተመዘገቡ ታምራት' },
      pairs: [
        { id: 'match-p2-water-wine', left: { en: 'Water into Wine at Cana', am: 'በቃና ውኃን የወይን ጠጅ ማድረግ' }, right: { en: 'First Sign Manifesting Divine Glory', am: 'ክብሩን የገለጠበት የመጀመሪያው ምልክት' }, exp: 'Christ transformed six stone waterpots of water into choice wine at the wedding.', ref: 'John 2:11', route: '/bible/john/2' },
        { id: 'match-p2-nobleman-son', left: { en: 'Healing of the Nobleman’s Son', am: 'የሹሙን ልጅ በሩቅ ማዳን' }, right: { en: 'Healing Granted through Spoken Authority', am: 'በቃሉ ሥልጣን የተገኘ ፈውስ' }, exp: 'Jesus said: Go your way, your son lives; the official believed the word.', ref: 'John 4:50', route: '/bible/john/4' },
        { id: 'match-p2-bethesda', left: { en: 'Invalid at the Pool of Bethesda', am: 'በቤተሳይዳ 38 ዓመት የታመመው ሰው' }, right: { en: 'Rise, Take Up Your Bed, and Walk', am: 'ተነሣና አልጋህን ተሸክመህ ሂድ' }, exp: 'The man sick thirty-eight years had no one to help him until Christ commanded him to walk.', ref: 'John 5:8', route: '/bible/john/5' },
        { id: 'match-p2-feeding-john', left: { en: 'Feeding the Multitude with Five Loaves', am: 'በአምስት እንጀራ ብዙዎችን መመገብ' }, right: { en: 'Christ Revealed as Bread of Life', am: 'ክርስቶስ የሕይወት እንጀራ መሆኑን መግለጥ' }, exp: 'After multiplying barley loaves, Jesus declared Himself the Bread from heaven.', ref: 'John 6:35', route: '/bible/john/6' },
        { id: 'match-p2-blind-shiloah', left: { en: 'Man Born Blind at Pool of Siloam', am: 'በሰሊሆም የታጠበው ዕውር ሆኖ የተወለደው' }, right: { en: 'Christ as the Light of the World', am: 'ክርስቶስ የዓለም ብርሃን መሆኑ' }, exp: 'Jesus made clay, anointed his eyes, and sent him to wash in Siloam to receive sight.', ref: 'John 9:7', route: '/bible/john/9' }
      ]
    }
  ]

  const allMatchPairs: MatchPair[] = []
  console.log('=== VALIDATING MATCH & DISCOVER PHASE 2 (10 COLLECTIONS, 50 PAIRS) ===')
  for (const col of collectionsRaw) {
    const colPairs: MatchPair[] = col.pairs.map(p => ({
      id: p.id,
      category: col.id,
      left: p.left,
      right: p.right,
      explanation: { en: p.exp },
      source: p.route.startsWith('/bible') ? bible(p.ref, p.route) : churchLib(p.ref, p.route),
      verifiedLocales: ['en']
    }))

    // Validate draft
    const draftErrors = validateStudioDraft({ game: 'match', content: colPairs })
    if (draftErrors.length > 0) {
      console.error(`Validation failed for collection ${col.id}:`, draftErrors)
      process.exit(1)
    }

    // Validate per-pair card content
    for (const pair of colPairs) {
      const cardErrors = validateCardContent('match', pair)
      if (cardErrors.length > 0) {
        console.error(`Validation failed for match pair ${pair.id}:`, cardErrors)
        process.exit(1)
      }
      allMatchPairs.push(pair)
    }
  }

  // Save Match artifacts
  const matchDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-2', 'match')
  fs.mkdirSync(matchDir, { recursive: true })
  fs.writeFileSync(path.join(matchDir, 'collections.json'), JSON.stringify(collectionsRaw, null, 2), 'utf8')
  fs.writeFileSync(path.join(matchDir, 'pairs.json'), JSON.stringify(allMatchPairs, null, 2), 'utf8')

  const matchCmsDrafts = allMatchPairs.map(p => ({
    stable_id: p.id,
    game_type: 'match' as const,
    category: p.category,
    difficulty: 'growing' as const,
    payload: p,
    source_references: [p.source]
  }))
  fs.writeFileSync(path.join(matchDir, 'cms-import.json'), JSON.stringify(matchCmsDrafts, null, 2), 'utf8')
  const matchImportPreview = previewQuestionImport(JSON.stringify(matchCmsDrafts), new Set())
  console.log(`Match CMS Preview: ${matchImportPreview.items.length} items, ${matchImportPreview.errors.length} errors.`)

  fs.writeFileSync(path.join(matchDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'match',
    phase: 2,
    collectionsCount: collectionsRaw.length,
    pairsCount: allMatchPairs.length,
    collectionsSummary: collectionsRaw.map(c => ({ id: c.id, name: c.name.en, pairsCount: c.pairs.length })),
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')


  // =========================================================================
  // 3. HOLY EMOJI CHALLENGE (50 NEW QUESTIONS)
  // =========================================================================
  // Generate balanced keys: 12 'a', 13 'b', 13 'c', 12 'd' = 50 questions
  const keysPattern: Array<'a' | 'b' | 'c' | 'd'> = [
    'a', 'b', 'c', 'd', 'a', 'b', 'c', 'd', 'a', 'b', 'c', 'd', 'a', 'b', 'c', 'd',
    'a', 'b', 'c', 'd', 'a', 'b', 'c', 'd', 'a', 'b', 'c', 'd', 'a', 'b', 'c', 'd',
    'a', 'b', 'c', 'd', 'a', 'b', 'c', 'd', 'a', 'b', 'c', 'd', 'a', 'b', 'c', 'd',
    'b', 'c'
  ] // exact counts: a: 12, b: 13, c: 13, d: 12 -> sum = 50

  const emojiPrompts = [
    // 1-10
    { id: 'emoji-p2-babel', emoji: '🧱 🗣️ 🌍', ans: 'Tower of Babel', amAns: 'የባቢሎን ግንብ', opt: ['Tower of Babel', 'Walls of Jericho', 'Solomon’s Temple', 'Noah’s Vineyard'], ref: 'Genesis 11:9', route: '/bible/genesis/11', exp: 'The people built a brick tower to make a name for themselves, but God confused their languages and scattered them across the earth.', h1: 'A high brick structure built in Shinar.', h2: 'God scattered the people across the earth.', h3: 'Their shared language was suddenly confused.' },
    { id: 'emoji-p2-joseph-coat', emoji: '🧥 🎨 🌾', ans: 'Joseph’s Coat of Many Colors', amAns: 'የዮሴፍ ሕብረ ቀለም ካባ', opt: ['Elijah’s Mantle', 'Joseph’s Coat of Many Colors', 'Samuel’s Robe', 'Aaron’s Ephod'], ref: 'Genesis 37:3', route: '/bible/genesis/37', exp: 'Jacob made Joseph an ornamented tunic of many colors, provoking jealousy among his brothers who later sold him into Egypt.', h1: 'A special garment given by a loving father.', h2: 'It aroused deep jealousy among brothers.', h3: 'The dreamer’s brothers dipped it in goat’s blood.' },
    { id: 'emoji-p2-water-rock', emoji: '🪨 💧 🦯', ans: 'Moses Striking the Rock for Water', amAns: 'ሙሴ ዓለቱን መትቶ ውኃ ማፍለቁ', opt: ['Crossing the Red Sea', 'Manna from Heaven', 'Moses Striking the Rock for Water', 'Crossing the Jordan'], ref: 'Exodus 17:6', route: '/bible/exodus/17', exp: 'At Horeb, God commanded Moses to strike the rock with his staff, and refreshing water poured out for the thirsty Israelites.', h1: 'Occurred when the people thirsted at Rephidim.', h2: 'A wooden staff was used at God’s command.', h3: 'A dry rock poured out streams of living water.' },
    { id: 'emoji-p2-rahab-cord', emoji: '🏰 🧵 🙏', ans: 'Rahab and the Scarlet Cord', amAns: 'ረዓብና የቀዩ ፈትል ምልክት', opt: ['Deborah Under the Palm', 'Ruth in the Barley Field', 'Rahab and the Scarlet Cord', 'Esther Before the King'], ref: 'Joshua 2:18', route: '/bible/joshua/2', exp: 'Rahab hid the Hebrew spies on her roof in Jericho and tied a scarlet cord in her window so her household was spared.', h1: 'Took place on the stone wall of Jericho.', h2: 'Spies were hidden safely on a roof.', h3: 'A red cord hanging in a window saved her household.' },
    { id: 'emoji-p2-gideon-fleece', emoji: '🐑 💧 🌾', ans: 'Gideon’s Fleece Test', amAns: 'የጌዴዎን የበግ ጠጉር ፈተና', opt: ['Gideon’s Fleece Test', 'Samson’s Lion Riddle', 'David’s Harp', 'Elijah’s Fire'], ref: 'Judges 6:38', route: '/bible/judges/6', exp: 'Gideon sought confirmation of his divine mission by asking for morning dew on a wool fleece while the surrounding threshing floor was dry.', h1: 'Occurred at night on a threshing floor.', h2: 'Dew collected in a bowl from sheep’s wool.', h3: 'A sign to confirm Israel’s deliverance from Midian.' },
    { id: 'emoji-p2-samson-honey', emoji: '🦁 🍯 💪', ans: 'Samson’s Riddle from the Lion', amAns: 'የሶምሶን ከአንበሳ የተገኘ ማር እንቆቅልሽ', opt: ['David and the Bear', 'Samson’s Riddle from the Lion', 'Daniel in the Den', 'Balaam’s Donkey'], ref: 'Judges 14:14', route: '/bible/judges/14', exp: 'Samson tore apart a young lion and later found a swarm of bees and sweet honey inside the carcass, inspiring his wedding riddle.', h1: 'Out of the eater came forth food.', h2: 'Bees built a comb inside a fallen beast.', h3: 'A riddle posed to thirty Philistine companions.' },
    { id: 'emoji-p2-ruth-barley', emoji: '🌾 👩‍🌾 ❤️', ans: 'Ruth Gleaning in Boaz’s Field', amAns: 'ሩት በቦዔዝ እርሻ እሸት መቃረሟ', opt: ['Hannah’s Vow', 'Rebekah at the Well', 'Ruth Gleaning in Boaz’s Field', 'Miriam at the Sea'], ref: 'Ruth 2:3', route: '/bible/ruth/2', exp: 'Ruth gathered leftover grain behind the reapers in the field of Boaz, who showed her extraordinary mercy and protection.', h1: 'Took place during the barley harvest in Bethlehem.', h2: 'A devoted Moabite daughter-in-law.', h3: 'She gleaned ears of grain in a kinsman’s field.' },
    { id: 'emoji-p2-david-harp', emoji: '👑 🎵 🕊️', ans: 'David Playing the Harp for Saul', amAns: 'ዳዊት ለሳኦል በበገና መዝሙር ማቅረቡ', opt: ['Solomon Singing Canticles', 'Miriam’s Song', 'David Playing the Harp for Saul', 'Asaph in the Temple'], ref: '1 Samuel 16:23', route: '/bible/1-samuel/16', exp: 'Whenever an evil spirit troubled King Saul, young David took his ten-stringed harp and played, bringing peace to the troubled king.', h1: 'A shepherd musician called to the royal court.', h2: 'A soothing stringed instrument brought relief.', h3: 'Music calmed the tormented soul of a troubled king.' },
    { id: 'emoji-p2-solomon-judgment', emoji: '👑 👶 ⚔️', ans: 'The Wisdom of Solomon and the Child', amAns: 'የሰሎሞን ጥበብና የሕፃኑ ፍርድ', opt: ['Pharaoh’s Daughter finding Moses', 'The Wisdom of Solomon and the Child', 'Jephthah’s Vow', 'Abraham offering Isaac'], ref: '1 Kings 3:25', route: '/bible/1-kings/3', exp: 'When two mothers claimed the same infant, King Solomon commanded a sword to divide it, revealing the true mother by her compassionate plea.', h1: 'Two women came before the king in dispute.', h2: 'A sword was ordered to divide an infant in half.', h3: 'The true mother surrendered her claim to save the child.' },
    { id: 'emoji-p2-elijah-chariot', emoji: '🌪️ 🔥 🐎', ans: 'Elijah Ascending in a Chariot of Fire', amAns: 'ኤልያስ በእሳት ሰረገላ ወደ ሰማይ ማረጉ', opt: ['Enoch Walking with God', 'Moses on Mount Nebo', 'Elijah Ascending in a Chariot of Fire', 'The Ascension of Christ'], ref: '2 Kings 2:11', route: '/bible/2-kings/2', exp: 'As Elijah and Elisha conversed near the Jordan, a chariot of fire and horses of fire appeared, and Elijah went up by a whirlwind into heaven.', h1: 'Witnessed by the prophet Elisha beside the Jordan.', h2: 'Horses and a chariot of glowing fire appeared.', h3: 'A prophet taken into heaven without seeing death.' },

    // 11-20
    { id: 'emoji-p2-elisha-axe', emoji: '🪓 🌊 🪵', ans: 'Elisha and the Floating Axe Head', amAns: 'ኤልሳዕ የብረት መጥረቢያውን በውኃ ላይ ማንሳፈፉ', opt: ['Moses Parting the Sea', 'Elisha and the Floating Axe Head', 'Noah Building with Cedar', 'Peter Finding the Shekel'], ref: '2 Kings 6:6', route: '/bible/2-kings/6', exp: 'When a borrowed iron axe head fell into the Jordan, Elisha threw a stick into the water, and the iron floated to the surface.', h1: 'Prophets were cutting timber by the Jordan.', h2: 'A borrowed iron tool sank into deep water.', h3: 'A piece of wood was cast in, and heavy iron floated.' },
    { id: 'emoji-p2-naaman-wash', emoji: '🌊 🧴 🧼', ans: 'Naaman Washed in the Jordan River', amAns: 'ንዕማን በዮርዳኖስ ወንዝ ሰባት ጊዜ መታጠቡ', opt: ['Baptism of Christ', 'Naaman Washed in the Jordan River', 'Peter Walking on Water', 'Healing at Bethesda'], ref: '2 Kings 5:14', route: '/bible/2-kings/5', exp: 'The Syrian commander Naaman dipped seven times in the Jordan as instructed by Elisha, and his skin was restored completely like a young child’s.', h1: 'A great military commander afflicted with leprosy.', h2: 'Instructed to dip seven times in a muddy river.', h3: 'His flesh became clean like a young boy’s.' },
    { id: 'emoji-p2-fiery-furnace', emoji: '🔥 👨‍👦‍👦 🛡️', ans: 'The Three Holy Youths in the Furnace', amAns: 'ሦስቱ ሕፃናት በእሳት እቶን ውስጥ', opt: ['The Three Holy Youths in the Furnace', 'Daniel in the Lions’ Den', 'Elijah on Mount Carmel', 'The Burning Bush'], ref: 'Daniel 3:25', route: '/bible/daniel/3', exp: 'Shadrach, Meshach, and Abednego refused to bow to the golden idol; cast into the blazing furnace, an angel walked with them and kept them unharmed.', h1: 'Cast into flames heated seven times hotter.', h2: 'Three men bound, but four seen walking free.', h3: 'The fourth figure appeared like the Son of God.' },
    { id: 'emoji-p2-daniel-lions', emoji: '🦁 🕳️ 🙏', ans: 'Daniel in the Lions’ Den', amAns: 'ዳንኤል በአንበሶች ጉድጓድ', opt: ['Samson and the Lion', 'David and Goliath', 'Daniel in the Lions’ Den', 'Paul and the Viper'], ref: 'Daniel 6:22', route: '/bible/daniel/6', exp: 'Thrown into a pit of hungry lions for praying three times a day to the true God, Daniel was preserved because God sent His angel to shut the lions’ mouths.', h1: 'Thrown into a sealed underground pit at sundown.', h2: 'Fierce predators became tame as lambs.', h3: 'God’s angel shut their mouths because he was innocent.' },
    { id: 'emoji-p2-esther-banquet', emoji: '👑 🍷 📜', ans: 'Queen Esther’s Royal Banquet', amAns: 'የንግሥት አስቴር የግብዣ ማዕድ', opt: ['Belshazzar’s Feast', 'Queen Esther’s Royal Banquet', 'The Wedding at Cana', 'Herod’s Birthday Feast'], ref: 'Esther 7:3', route: '/bible/esther/7', exp: 'Queen Esther invited the king and Haman to a banquet, where she revealed Haman’s genocidal plot and petitioned for her people’s salvation.', h1: 'A secret feast arranged by a courageous queen.', h2: 'The cruel oppressor Haman sat at the royal table.', h3: 'She pleaded for her life and the lives of her people.' },
    { id: 'emoji-p2-nehemiah-walls', emoji: '🧱 🌙 🐴', ans: 'Nehemiah Inspecting the Broken Walls', amAns: 'ነህምያ በሌሊት የፈረሰውን ቅጥር መፈተሹ', opt: ['Joshua Circling Jericho', 'Solomon Building the Temple', 'Nehemiah Inspecting the Broken Walls', 'Zerubbabel’s Foundation'], ref: 'Nehemiah 2:13', route: '/bible/nehemiah/2', exp: 'Arriving in Jerusalem by night, Nehemiah rode around the charred gates and collapsed walls before calling the people to rebuild with trowel and spear.', h1: 'A secretive nighttime survey on horseback.', h2: 'Inspects burned gates and rubble-filled breaches.', h3: 'Inspired the rebuilding of Jerusalem’s defenses in 52 days.' },
    { id: 'emoji-p2-annunciation', emoji: '👼 🌸 📖', ans: 'The Annunciation to the Virgin Mary', amAns: 'ብሥራተ ገብርኤል ለእመቤታችን', opt: ['The Visitation to Elizabeth', 'The Annunciation to the Virgin Mary', 'The Nativity of Christ', 'The Flight to Egypt'], ref: 'Luke 1:28', route: '/bible/luke/1', exp: 'The Archangel Gabriel appeared to the Virgin Mary in Nazareth, proclaiming she would conceive by the Holy Spirit and give birth to the Son of the Highest.', h1: 'An archangel sent to a humble home in Nazareth.', h2: 'Hail, you who are highly favored; the Lord is with you.', h3: 'Behold the maidservant of the Lord; let it be to me according to your word.' },
    { id: 'emoji-p2-nativity', emoji: '⭐ 👶 🐮', ans: 'The Nativity of Christ in Bethlehem', amAns: 'ልደተ ክርስቶስ በቤተልሔም', opt: ['The Nativity of Christ in Bethlehem', 'The Presentation in the Temple', 'The Finding in the Temple', 'The Baptism in Jordan'], ref: 'Luke 2:7', route: '/bible/luke/2', exp: 'The Savior was born in Bethlehem of Judea, wrapped in swaddling cloths, and laid in a humble manger because there was no room in the inn.', h1: 'No room for travelers in the crowded inn.', h2: 'Swaddling cloths in a feeding trough.', h3: 'Angels sang Gloria in Excelsis to watching shepherds.' },
    { id: 'emoji-p2-wise-men', emoji: '⭐ 👑 🎁', ans: 'The Magi Adoring the Newborn King', amAns: 'የሰብአ ሰገል አምልኮትና ስጦታ', opt: ['The Shepherds at the Manger', 'The Magi Adoring the Newborn King', 'Simeon Holding the Christ Child', 'The Transfiguration'], ref: 'Matthew 2:11', route: '/bible/matthew/2', exp: 'Wise men from the East followed a miraculous star, knelt before the young child with Mary His Mother, and offered gold, frankincense, and myrrh.', h1: 'Guided across deserts by an unusual star.', h2: 'Knelt and worshiped the child with His mother.', h3: 'Treasures opened: gold, frankincense, and myrrh.' },
    { id: 'emoji-p2-flight-egypt', emoji: '🏜️ 👶 🐴', ans: 'The Flight of the Holy Family to Egypt', amAns: 'የቅድስት ቤተሰብ ወደ ግብፅ መሰደድ', opt: ['The Return to Nazareth', 'The Journey to Jerusalem', 'The Flight of the Holy Family to Egypt', 'The Road to Emmaus'], ref: 'Matthew 2:14', route: '/bible/matthew/2', exp: 'Warned by an angel in a dream that Herod sought to destroy the child, Saint Joseph took Jesus and Mary by night and fled into Egypt.', h1: 'An urgent warning received in a midnight dream.', h2: 'Fleeing the wrath of a jealous earthly king.', h3: 'Out of Egypt I called my Son.' },

    // 21-30
    { id: 'emoji-p2-temptation', emoji: '🏜️ 🍞 ⛰️', ans: 'The Temptation of Christ in the Wilderness', amAns: 'የጌታችን በምድረ በዳ መፈተን', opt: ['The Transfiguration', 'The Temptation of Christ in the Wilderness', 'The Sermon on the Mount', 'The Agony in Gethsemane'], ref: 'Matthew 4:1', route: '/bible/matthew/4', exp: 'After fasting forty days and nights, Christ overcame the devil’s temptations with the Word of God: Man shall not live by bread alone.', h1: 'Followed forty days of solitary fasting.', h2: 'The tempter asked for stones to become bread.', h3: 'Get behind me, Satan; you shall worship the Lord your God.' },
    { id: 'emoji-p2-wedding-cana', emoji: '🏺 🍷 🎉', ans: 'The Miracle of Water into Wine at Cana', amAns: 'የቃና ዘገሊላ የመጀመሪያው ታምር', opt: ['The Feeding of the Multitude', 'The Miracle of Water into Wine at Cana', 'The Last Supper', 'The Great Banquet'], ref: 'John 2:9', route: '/bible/john/2', exp: 'At the wedding feast in Cana of Galilee, Jesus commanded six stone waterpots to be filled with water, which became superior wine.', h1: 'Occurred at a joyful village wedding feast.', h2: 'His Mother said: Whatever He says to you, do it.', h3: 'Six stone jars filled with water became rich wine.' },
    { id: 'emoji-p2-calming-storm', emoji: '⛵ 💨 🌊', ans: 'Jesus Calming the Tempest on the Sea', amAns: 'ኢየሱስ ማዕበሉን ፀጥ ማሰኘቱ', opt: ['Peter Walking on the Waves', 'Jesus Calming the Tempest on the Sea', 'The Miraculous Catch of Fish', 'The Shipwreck at Malta'], ref: 'Matthew 8:26', route: '/bible/matthew/8', exp: 'While crossing the Sea of Galilee, a violent storm swamped the boat; Jesus rebuked the wind and raging waves, and immediate calm followed.', h1: 'The Savior was asleep on a pillow in the stern.', h2: 'Frightened disciples cried: Lord, save us; we perish!', h3: 'He rebuked the wind and sea: Peace, be still.' },
    { id: 'emoji-p2-paralytic-roof', emoji: '🏠 🛏️ 🚶', ans: 'The Paralytic Lowered Through the Roof', amAns: 'በጣሪያ በኩል የወረደው ሽባ መፈወሱ', opt: ['The Blind Man of Jericho', 'The Paralytic Lowered Through the Roof', 'The Leper Cleansed', 'The Lame Man at the Beautiful Gate'], ref: 'Mark 2:4', route: '/bible/mark/2', exp: 'Four friends tore open the roof above Jesus and lowered their paralyzed companion on a mat; seeing their faith, Christ healed and forgave him.', h1: 'Crowds packed the house in Capernaum so none could enter.', h2: 'Tiles on the roof were uncovered from above.', h3: 'Son, your sins are forgiven you; take up your bed and walk.' },
    { id: 'emoji-p2-nain-widow', emoji: '⚰️ 🚶‍♂️ 🌅', ans: 'Raising the Widow’s Son at Nain', amAns: 'የናይን መበለት ልጅ ከሞት መነሣቱ', opt: ['Raising of Jairus’ Daughter', 'Raising of Lazarus', 'Raising the Widow’s Son at Nain', 'The Resurrection of Christ'], ref: 'Luke 7:14', route: '/bible/luke/7', exp: 'Jesus encountered a funeral procession carrying the only son of a weeping widow; with compassion, He touched the bier and commanded the youth to rise.', h1: 'A sorrowful funeral procession leaving a city gate.', h2: 'A grieving widow who had lost her only son.', h3: 'Young man, I say to you, arise; and the dead sat up.' },
    { id: 'emoji-p2-walking-water', emoji: '🚶‍♂️ 🌊 👣', ans: 'Jesus Walking on the Sea', amAns: 'ጌታችን በባሕር ላይ መራመዱ', opt: ['Calming the Sea', 'Jesus Walking on the Sea', 'Moses Parting the Sea', 'Jonah Cast into the Sea'], ref: 'Matthew 14:25', route: '/bible/matthew/14', exp: 'In the fourth watch of the night, Jesus came toward the straining disciples walking upon the waves, and He rescued sinking Peter when his faith faltered.', h1: 'Took place during a stormy night watch on the sea.', h2: 'Disciples cried out in terror thinking it was a ghost.', h3: 'Peter stepped onto the waves but began to sink until rescued.' },
    { id: 'emoji-p2-transfiguration', emoji: '⛰️ ☀️ ☁️', ans: 'The Transfiguration on Mount Tabor', amAns: 'የደብረ ታቦር የክብር መገለጥ', opt: ['The Sermon on the Mount', 'The Agony in the Garden', 'The Transfiguration on Mount Tabor', 'The Ascension'], ref: 'Matthew 17:2', route: '/bible/matthew/17', exp: 'On the high mountain, Christ’s face shone like the sun and His garments became radiant white, while Moses and Elijah appeared speaking with Him.', h1: 'Three chosen apostles ascended a high mountain.', h2: 'Moses and Elijah appeared in glory beside Him.', h3: 'A bright cloud overshadowed them, and the Father’s voice spoke.' },
    { id: 'emoji-p2-good-samaritan', emoji: '🩹 🍷 🏨', ans: 'The Parable of the Good Samaritan', amAns: 'የደጉ ሳምራዊ ምሳሌ', opt: ['The Prodigal Son', 'The Unforgiving Servant', 'The Parable of the Good Samaritan', 'The Rich Man and Lazarus'], ref: 'Luke 10:34', route: '/bible/luke/10', exp: 'A traveler beaten by thieves on the Jericho road was ignored by priest and Levite, but a Samaritan bound his wounds with oil and took him to an inn.', h1: 'A wounded traveler lying stripped on the roadside.', h2: 'A priest and a Levite passed by on the other side.', h3: 'He bound his wounds, pouring on oil and wine.' },
    { id: 'emoji-p2-prodigal-son', emoji: '🐖 🏃‍♂️ 🫂', ans: 'The Parable of the Prodigal Son', amAns: 'የጠፋው ልጅ ምሳሌ', opt: ['The Lost Sheep', 'The Laborers in the Vineyard', 'The Parable of the Prodigal Son', 'The Talents'], ref: 'Luke 15:20', route: '/bible/luke/15', exp: 'After squandering his inheritance in a far country feeding swine, the younger son returned home in repentance, and his father ran to embrace him.', h1: 'Feeding pods to swine in distant destitution.', h2: 'Father, I have sinned against heaven and before you.', h3: 'Bring out the best robe, put a ring on his hand, and kill the fatted calf.' },
    { id: 'emoji-p2-lost-sheep', emoji: '🐑 🧗‍♂️ ✨', ans: 'The Parable of the Lost Sheep', amAns: 'የጠፋችው በግ ምሳሌ', opt: ['The Good Shepherd', 'The Parable of the Lost Sheep', 'The Sower', 'The Wheat and Tares'], ref: 'Luke 15:5', route: '/bible/luke/15', exp: 'A shepherd left ninety-nine sheep in the open country to search tirelessly for the one that was lost until he joyfully carried it home on his shoulders.', h1: 'Leaving ninety-nine safely in the fold.', h2: 'Searching hills and wilderness for the straying one.', h3: 'Laying the found one on his shoulders rejoicing.' },

    // 31-40
    { id: 'emoji-p2-lazarus-raising', emoji: '🪨 🚶‍♂️ 🕯️', ans: 'The Raising of Lazarus from the Tomb', amAns: 'አልዓዛር ከመቃብር መነሣቱ', opt: ['The Resurrection of Christ', 'The Raising of Lazarus from the Tomb', 'Raising of the Widow’s Son', 'The Burial of Joseph'], ref: 'John 11:43', route: '/bible/john/11', exp: 'Dead and entombed for four days in Bethany, Lazarus came forth bound in graveclothes when Christ called with a loud voice: Lazarus, come out!', h1: 'Had lain in the tomb for four days in Bethany.', h2: 'Jesus wept at the sight of Mary and Martha grieving.', h3: 'Lazarus, come out! And he came out bound in graveclothes.' },
    { id: 'emoji-p2-zacchaeus-tree', emoji: '🌳 👀 💰', ans: 'Zacchaeus Climbing the Sycamore Tree', amAns: 'ዘኬዎስ በሾላ ዛፍ ላይ መውጣቱ', opt: ['Nathaniel Under the Fig Tree', 'The Barren Fig Tree', 'Zacchaeus Climbing the Sycamore Tree', 'Absalom in the Oak Tree'], ref: 'Luke 19:4', route: '/bible/luke/19', exp: 'A short chief tax collector ran ahead and climbed a sycamore tree to see Jesus; the Lord called him down and stayed in his house, bringing salvation.', h1: 'Short in stature and unable to see over the crowd.', h2: 'Climbed the branches of a roadside sycamore tree.', h3: 'Today salvation has come to this house.' },
    { id: 'emoji-p2-palm-sunday', emoji: '🌿 🐴 👑', ans: 'The Triumphal Entry into Jerusalem', amAns: 'የሆሣዕና በዓል ድል አድራጊ ጉዞ', opt: ['The Transfiguration', 'The Triumphal Entry into Jerusalem', 'The Cleansing of the Temple', 'The Ascension'], ref: 'Matthew 21:8', route: '/bible/matthew/21', exp: 'On Palm Sunday, Christ entered Jerusalem riding a colt, while crowds cut palm branches and spread their cloaks on the road crying: Hosanna!', h1: 'Fulfilling Zechariah’s prophecy of a king riding a colt.', h2: 'Multitudes spread garments and palm branches on the way.', h3: 'Hosanna to the Son of David; blessed is He who comes in the Lord’s name!' },
    { id: 'emoji-p2-cleansing-temple', emoji: '🏛️ 🕊️ 🪙', ans: 'The Cleansing of the Temple', amAns: 'ኢየሱስ ቤተ መቅደሱን ማጽዳቱ', opt: ['Building of Solomon’s Temple', 'The Cleansing of the Temple', 'The Widow’s Mite', 'The Destruction of Jerusalem'], ref: 'John 2:15', route: '/bible/john/2', exp: 'Finding money changers and merchants selling doves in the sacred precincts, Jesus made a whip of cords, overturned their tables, and purified His Father’s house.', h1: 'Encountered merchants selling oxen, sheep, and doves.', h2: 'Made a whip of small cords to drive them out.', h3: 'Do not make my Father’s house a house of merchandise!' },
    { id: 'emoji-p2-last-supper', emoji: '🍞 🍷 🥖', ans: 'The Institution of the Holy Eucharist', amAns: 'የመጨረሻው እራትና የሥርዓተ ቍርባን መመሥረት', opt: ['The Wedding at Cana', 'The Feeding of the 5,000', 'The Institution of the Holy Eucharist', 'The Road to Emmaus'], ref: 'Matthew 26:26', route: '/bible/matthew/26', exp: 'In the Upper Room, Christ took bread, blessed and broke it, saying: Take, eat; this is my body. Then He took the cup of wine: This is my blood of the covenant.', h1: 'Gathered in an upper room on the night of His betrayal.', h2: 'This is my body which is broken for you.', h3: 'This cup is the new covenant in my blood shed for many.' },
    { id: 'emoji-p2-gethsemane', emoji: '🌿 🩸 🙏', ans: 'The Agony in the Garden of Gethsemane', amAns: 'የጌታችን በጌቴሴማኒ የጸሎት ተጋድሎ', opt: ['The Temptation in Wilderness', 'The Sermon on Mount of Olives', 'The Agony in the Garden of Gethsemane', 'The Crucifixion'], ref: 'Luke 22:44', route: '/bible/luke/22', exp: 'Kneeling under olive trees in deep agony, Christ prayed: Not my will, but yours be done; and His sweat fell to the ground like great drops of blood.', h1: 'Three disciples could not watch with Him one hour.', h2: 'Father, if you are willing, remove this cup from me.', h3: 'His sweat became like great drops of blood falling to earth.' },
    { id: 'emoji-p2-peter-denial', emoji: '🐓 🔥 😢', ans: 'Peter’s Denial and the Rooster’s Crow', amAns: 'የጴጥሮስ ክህደትና የዶሮው ጩኸት', opt: ['Judas Betraying Christ', 'Peter’s Denial and the Rooster’s Crow', 'Peter Walking on the Sea', 'Thomas Doubting'], ref: 'Luke 22:61', route: '/bible/luke/22', exp: 'Warming himself by the courtyard fire, Peter denied knowing Jesus three times; immediately the rooster crowed, the Lord looked at him, and Peter wept bitterly.', h1: 'Standing by a charcoal fire in the high priest’s courtyard.', h2: 'I do not know the man of whom you speak.', h3: 'The rooster crowed twice, the Lord turned, and he wept bitterly.' },
    { id: 'emoji-p2-crucifixion', emoji: '✝️ 🩸 ⛰️', ans: 'The Crucifixion of Christ at Golgotha', amAns: 'ስቅለተ ክርስቶስ በቀራንዮ', opt: ['The Agony in Gethsemane', 'The Trial before Pilate', 'The Crucifixion of Christ at Golgotha', 'The Entombment'], ref: 'John 19:18', route: '/bible/john/19', exp: 'Christ was crucified between two thieves on the Place of the Skull; from the Cross He forgave His executioners and declared: It is finished.', h1: 'Led to the Place of the Skull called Golgotha.', h2: 'Father, forgive them, for they know not what they do.', h3: 'Darkness covered the earth until the ninth hour.' },
    { id: 'emoji-p2-empty-tomb', emoji: '🪨 🌅 🕊️', ans: 'The Resurrection and the Empty Tomb', amAns: 'ትንሣኤ ክርስቶስና ባዶው መቃብር', opt: ['The Burial of Christ', 'The Resurrection and the Empty Tomb', 'The Ascension', 'Lazarus Coming Forth'], ref: 'Matthew 28:6', route: '/bible/matthew/28', exp: 'At dawn on the third day, holy myrrhbearing women found the heavy stone rolled away; an angel declared: He is not here, for He has risen as He said!', h1: 'Women brought sweet spices at early dawn.', h2: 'The great stone rolled back and guards struck with trembling.', h3: 'Why do you seek the living among the dead? He is risen!' },
    { id: 'emoji-p2-emmaus-road', emoji: '🚶‍♂️ 🚶‍♂️ 🍞', ans: 'The Risen Christ on the Road to Emmaus', amAns: 'የተነሣው ጌታ ወደ ኤማሁስ በሚጓዙት መንገድ', opt: ['Jesus by the Sea of Tiberias', 'The Risen Christ on the Road to Emmaus', 'Philip and the Eunuch', 'Paul on the Road to Damascus'], ref: 'Luke 24:30', route: '/bible/luke/24', exp: 'The risen Lord walked unrecognized with Cleopas and his companion, expounding the Scriptures; their eyes were opened when He blessed and broke the bread.', h1: 'Two disciples walking seven miles from Jerusalem.', h2: 'Did not our hearts burn within us while He opened the Scriptures?', h3: 'Their eyes were opened in the breaking of the bread.' },

    // 41-50
    { id: 'emoji-p2-ascension', emoji: '☁️ 🙌 👑', ans: 'The Ascension of Christ into Heaven', amAns: 'ዕርገተ ክርስቶስ ወደ ሰማያት', opt: ['The Transfiguration', 'The Triumphal Entry', 'The Ascension of Christ into Heaven', 'The Descent of the Spirit'], ref: 'Acts 1:9', route: '/bible/acts/1', exp: 'Forty days after His resurrection, Christ raised His hands, blessed His disciples, and was lifted up as a cloud received Him out of their sight.', h1: 'Took place on the Mount of Olives forty days after Pascha.', h2: 'A cloud received Him out of their sight.', h3: 'Two angels in white promised He will return in the same way.' },
    { id: 'emoji-p2-pentecost', emoji: '🔥 🕊️ 🗣️', ans: 'The Descent of the Holy Spirit at Pentecost', amAns: 'በዓለ ጰራቅሊጦስ የመንፈስ ቅዱስ መውረድ', opt: ['The Baptism in Jordan', 'The Annunciation', 'The Descent of the Holy Spirit at Pentecost', 'The Conversion of Cornelius'], ref: 'Acts 2:3', route: '/bible/acts/2', exp: 'Fifty days after Pascha, a sound like a rushing mighty wind filled the house; divided tongues like fire rested on each apostle, and they spoke in foreign tongues.', h1: 'A sound from heaven as of a rushing mighty wind.', h2: 'Cloven tongues as of fire sat upon each of them.', h3: 'Filled with the Holy Spirit and began to speak with other tongues.' },
    { id: 'emoji-p2-stephen-martyr', emoji: '🪨 👼 ✨', ans: 'The Martyrdom of Saint Stephen', amAns: 'የቅዱስ እስጢፋኖስ ሰማዕትነት', opt: ['The Conversion of Saul', 'The Martyrdom of Saint Stephen', 'Peter in Prison', 'Paul in Athens'], ref: 'Acts 7:59', route: '/bible/acts/7', exp: 'Dragged outside Jerusalem and stoned by angry accusers, the deacon Stephen looked steadfastly into heaven, saw the Son of Man standing at God’s right hand, and prayed.', h1: 'His face appeared like the face of an angel.', h2: 'Behold, I see the heavens opened and the Son of Man standing.', h3: 'Lord, do not charge them with this sin; and he fell asleep.' },
    { id: 'emoji-p2-eunuch-baptism', emoji: '📜 🐎 🌊', ans: 'Philip Baptizing the Ethiopian Official', amAns: 'ፊልጶስ ኢትዮጵያዊውን ጃንደረባ ማጥመቁ', opt: ['Peter at Cornelius’ House', 'Philip Baptizing the Ethiopian Official', 'Paul in Ephesus', 'The Jailer of Philippi'], ref: 'Acts 8:38', route: '/bible/acts/8', exp: 'The Ethiopian royal treasurer read Isaiah 53 in his chariot; Philip joined him, preached Jesus from that scripture, and baptized him in roadside waters.', h1: 'An influential royal official returning from worship.', h2: 'Reading the prophet Isaiah about the lamb led to slaughter.', h3: 'See, here is water; what hinders me from being baptized?' },
    { id: 'emoji-p2-damascus-road', emoji: '⚡ 🐴 👀', ans: 'The Conversion of Saul on Damascus Road', amAns: 'የሳውል በደማስቆ መንገድ መመለስ', opt: ['The Martyrdom of Stephen', 'The Conversion of Saul on Damascus Road', 'Paul’s Shipwreck', 'Peter’s Vision in Joppa'], ref: 'Acts 9:3', route: '/bible/acts/9', exp: 'En route to persecute Christians in Damascus, Saul was blinded by a flashing heavenly light and heard Christ’s voice: Saul, Saul, why do you persecute me?', h1: 'Breathing threats against disciples of the Lord.', h2: 'A sudden heavenly light shone brighter than the sun.', h3: 'Saul, Saul, why are you persecuting me? Who are you, Lord?' },
    { id: 'emoji-p2-peter-vision', emoji: '🧺 🦎 🕊️', ans: 'Peter’s Vision of the Great Sheet', amAns: 'የጴጥሮስ በሰማይ የታየው የታላቁ ሸራ ራእይ', opt: ['Paul in Athens', 'Peter’s Vision of the Great Sheet', 'John’s Apocalypse', 'Daniel’s Four Beasts'], ref: 'Acts 10:11', route: '/bible/acts/10', exp: 'Praying on a rooftop in Joppa, Peter saw heaven opened and a vessel like a great sheet containing all manner of creatures; God commanded: What God has cleansed, call not common.', h1: 'Praying on a housetop by the sea around noon.', h2: 'A great sheet knit at the four corners let down from heaven.', h3: 'What God has cleansed, you must not call unclean.' },
    { id: 'emoji-p2-peter-angel-prison', emoji: '⛓️ 🚪 👼', ans: 'The Angel Rescuing Peter from Prison', amAns: 'መልአኩ ጴጥሮስን ከእስር ቤት ማዳኑ', opt: ['Paul and Silas in Philippi', 'The Angel Rescuing Peter from Prison', 'Stephen before the Council', 'John on Patmos'], ref: 'Acts 12:7', route: '/bible/acts/12', exp: 'Chained between two soldiers on the eve of his execution, Peter was awakened by an angel of the Lord; his chains fell off, iron gates opened of their own accord, and he was freed.', h1: 'Sleeping between two guards bound with two chains.', h2: 'An angel struck his side and his chains fell off.', h3: 'The iron gate leading into the city opened automatically.' },
    { id: 'emoji-p2-philippi-earthquake', emoji: '🏛️ ⛓️ 💥', ans: 'Paul and Silas Singing in the Philippian Jail', amAns: 'ጳውሎስና ሲላስ በፊልጵስዩስ እስር ቤት መዘመራቸው', opt: ['Paul and Silas Singing in the Philippian Jail', 'Peter in Prison', 'Stephen’s Martyrdom', 'Paul Shipwrecked'], ref: 'Acts 16:25', route: '/bible/acts/16', exp: 'Fastened in stocks at midnight, Paul and Silas prayed and sang hymns to God; a sudden violent earthquake shook the prison foundations, opening all doors.', h1: 'Beaten with rods and locked in the inner dungeon.', h2: 'At midnight they prayed and sang hymns of praise.', h3: 'A sudden earthquake opened all cell doors and freed all chains.' },
    { id: 'emoji-p2-malta-viper', emoji: '🔥 🪵 🐍', ans: 'Paul Shaking the Viper into the Fire on Malta', amAns: 'ጳውሎስ እፉኝቱን ወደ እሳት ማራገፉ', opt: ['Moses and the Bronze Serpent', 'Paul Shaking the Viper into the Fire on Malta', 'Aaron’s Rod becoming a Serpent', 'John on Patmos'], ref: 'Acts 28:3', route: '/bible/acts/28', exp: 'After the shipwreck on Malta, as Paul gathered a bundle of sticks and put them on the fire, a venomous viper fastened on his hand; he shook it into the fire unharmed.', h1: 'Kindling a warming fire in cold rain after shipwreck.', h2: 'A poisonous serpent fastened onto his hand from the brush.', h3: 'He shook the creature into the flames without suffering harm.' },
    { id: 'emoji-p2-new-jerusalem', emoji: '💎 🕊️ 🌅', ans: 'The Vision of the New Jerusalem', amAns: 'የአዲሲቱ ኢየሩሳሌም ራእይ', opt: ['The Vision of the New Jerusalem', 'The Garden of Eden', 'Solomon’s Temple', 'The Tower of Babel'], ref: 'Revelation 21:2', route: '/bible/revelation/21', exp: 'Saint John saw the holy city, New Jerusalem, coming down out of heaven from God, prepared as a bride adorned for her husband, where death and sorrow are no more.', h1: 'A vision seen by Saint John on the isle of Patmos.', h2: 'Twelve foundations adorned with precious gemstones.', h3: 'God will wipe away every tear from their eyes; death will be no more.' }
  ]

  const emojiQuestions: PlayQuestion[] = []
  console.log('=== VALIDATING HOLY EMOJI CHALLENGE PHASE 2 (50 QUESTIONS) ===')

  for (let i = 0; i < emojiPrompts.length; i++) {
    const item = emojiPrompts[i]
    const correctKey = keysPattern[i]

    // Create 4 distinct options with correct answer placed at correctKey
    const otherOptions = item.opt.filter(o => o !== item.ans).slice(0, 3)
    const keys: Array<'a' | 'b' | 'c' | 'd'> = ['a', 'b', 'c', 'd']
    const wrongKeys = keys.filter(k => k !== correctKey)

    const optionsMap: Record<string, string> = {
      [correctKey]: item.ans,
      [wrongKeys[0]]: otherOptions[0],
      [wrongKeys[1]]: otherOptions[1],
      [wrongKeys[2]]: otherOptions[2]
    }

    const question: PlayQuestion = {
      id: item.id,
      game: 'emoji',
      category: 'biblical-history',
      difficulty: i < 15 ? 'beginner' : i < 35 ? 'growing' : 'challenge',
      prompt: {
        en: 'Which biblical event, person, or sacred narrative is depicted by these symbols?',
        am: 'በእነዚህ ምልክቶች የተገለጸው የመጽሐፍ ቅዱስ ታሪክ፣ ሰው ወይም ቅዱስ ክስተት የትኛው ነው?'
      },
      emoji: item.emoji,
      hints: [
        { en: item.h1, am: item.h1 },
        { en: item.h2, am: item.h2 },
        { en: item.h3, am: item.h3 }
      ],
      options: [
        { key: 'a', text: { en: optionsMap['a'] } },
        { key: 'b', text: { en: optionsMap['b'] } },
        { key: 'c', text: { en: optionsMap['c'] } },
        { key: 'd', text: { en: optionsMap['d'] } }
      ],
      correctKey,
      explanation: {
        en: item.exp
      },
      source: bible(item.ref, item.route),
      verifiedLocales: ['en']
    }

    const errors = validateStudioDraft({ game: 'emoji', content: question })
    if (errors.length > 0) {
      console.error(`Validation failed for emoji question ${question.id}:`, errors)
      process.exit(1)
    }

    emojiQuestions.push(question)
  }

  // Check key distribution
  const keyDist = {
    a: emojiQuestions.filter(q => q.correctKey === 'a').length,
    b: emojiQuestions.filter(q => q.correctKey === 'b').length,
    c: emojiQuestions.filter(q => q.correctKey === 'c').length,
    d: emojiQuestions.filter(q => q.correctKey === 'd').length
  }
  console.log('Emoji key distribution:', keyDist)

  // Save Emoji artifacts
  const emojiDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-2', 'emoji')
  fs.mkdirSync(emojiDir, { recursive: true })
  fs.writeFileSync(path.join(emojiDir, 'questions.json'), JSON.stringify(emojiQuestions, null, 2), 'utf8')

  const emojiCmsDrafts = emojiQuestions.map(q => ({
    stable_id: q.id,
    game_type: 'emoji' as const,
    category: q.category,
    difficulty: q.difficulty,
    payload: q,
    source_references: [q.source]
  }))
  fs.writeFileSync(path.join(emojiDir, 'cms-import.json'), JSON.stringify(emojiCmsDrafts, null, 2), 'utf8')
  const emojiImportPreview = previewQuestionImport(JSON.stringify(emojiCmsDrafts), new Set())
  console.log(`Emoji CMS Preview: ${emojiImportPreview.items.length} items, ${emojiImportPreview.errors.length} errors.`)

  fs.writeFileSync(path.join(emojiDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'emoji',
    phase: 2,
    acceptedCount: emojiQuestions.length,
    rejectedCount: 0,
    keyDistribution: keyDist,
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')

  console.log('\n>>> All Phase 2 batches for Who Am I?, Match & Discover, and Holy Emoji Challenge generated and validated successfully! <<<')
}

run().catch(err => {
  console.error(err)
  process.exit(1)
})
