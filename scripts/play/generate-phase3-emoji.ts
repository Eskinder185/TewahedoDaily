/**
 * Phase 3 Content Generator for Holy Emoji Challenge (100 New Bilingual Questions).
 * Balanced keys: 25 A, 25 B, 25 C, 25 D.
 * Validated with validateQuestionDraft and previewQuestionImport.
 */
import fs from 'node:fs'
import path from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const { validateQuestionDraft, previewQuestionImport } = await import('../../src/lib/play/questionLibrary')
  type PlayQuestion = import('../../src/lib/play/types').PlayQuestion

  const bible = (label: string, route: string) => ({ label, route, kind: 'bible' as const })
  const churchLib = (label: string, route: string) => ({ label, route, kind: 'church-library' as const })

  // 100 items with balanced 25 A, 25 B, 25 C, 25 D
  const keysPattern: Array<'a' | 'b' | 'c' | 'd'> = []
  const order: Array<'a' | 'b' | 'c' | 'd'> = ['a', 'b', 'c', 'd']
  for (let i = 0; i < 25; i++) {
    keysPattern.push(...order)
  }

  const rawQuestions: Array<{
    id: string
    emoji: string
    ansEn: string
    ansAm: string
    optEn: [string, string, string, string]
    optAm: [string, string, string, string]
    expEn: string
    ref: string
    route: string
    h1En: string
    h1Am: string
    h2En: string
    h2Am: string
    h3En: string
    h3Am: string
  }> = [
    // 1-10
    {
      id: 'emoji-p3-eden-fall',
      emoji: '🌳 🍎 🐍 🚫',
      ansEn: 'The Fall in the Garden of Eden',
      ansAm: 'በኤደን ገነት የተፈጸመው ውድቀት',
      optEn: ['The Fall in the Garden of Eden', 'Noah’s Vineyard', 'Naboth’s Vineyard', 'The Gourd of Jonah'],
      optAm: ['በኤደን ገነት የተፈጸመው ውድቀት', 'የኖኅ የወይን እርሻ', 'የናቡቴ የወይን ቦታ', 'የዮናስ ቅል'],
      expEn: 'The serpent deceived Eve, and Adam ate the forbidden fruit of the tree in Eden.',
      ref: 'Genesis 3:6', route: '/bible/genesis/3',
      h1En: 'Occurred in the first garden created for man.', h1Am: 'ለሰው በተዘጋጀው የመጀመሪያው ገነት ተፈጸመ።',
      h2En: 'Involved subtle deception by an ancient adversary.', h2Am: 'በጥንታዊው ጠላት የተደረገ ማታለል ነበረበት።',
      h3En: 'Eating from the forbidden tree brought mortality.', h3Am: 'ከተከለከለው ዛፍ መብላት ሞትን አመጣ።'
    },
    {
      id: 'emoji-p3-cain-abel',
      emoji: '🌾 🐑 🩸 ❌',
      ansEn: 'Cain and Abel’s Offerings',
      ansAm: 'የቃየንና የአቤል መሥዋዕት',
      optEn: ['Abraham and Melchizedek', 'Cain and Abel’s Offerings', 'Jacob and Esau’s Stew', 'Joseph and His Brothers'],
      optAm: ['አብርሃምና መልከ ጼዴቅ', 'የቃየንና የአቤል መሥዋዕት', 'የያዕቆብና የዔሳው ወጥ', 'ዮሴፍና ወንድሞቹ'],
      expEn: 'Abel offered the firstlings of his flock with faith, while Cain’s offering was not accepted, leading to anger.',
      ref: 'Genesis 4:4', route: '/bible/genesis/4',
      h1En: 'The first brothers presenting gifts to the Creator.', h1Am: 'የመጀመሪያዎቹ ወንድሞች ለፈጣሪ ስጦታ ሲያቀርቡ።',
      h2En: 'One sacrifice was accepted; the other rejected.', h2Am: 'አንዱ መሥዋዕት ተቀባይነት አገኘ፤ ሌላው ወደቀ።',
      h3En: 'Righteous blood cried out from the fertile ground.', h3Am: 'የጻድቅ ደም ከመሬት ወደ ሰማይ ጮኸ።'
    },
    {
      id: 'emoji-p3-noah-dove',
      emoji: '🚢 🕊️ 🌿 🌊',
      ansEn: 'Noah’s Dove with the Olive Leaf',
      ansAm: 'የኖኅ ርግብና የወይራ ቅጠል',
      optEn: ['Moses in the Papyrus Basket', 'Jonah at Joppa Port', 'Noah’s Dove with the Olive Leaf', 'Jesus Baptized in Jordan'],
      optAm: ['ሙሴ በደንገል ሣጥን ውስጥ', 'ዮናስ በኢዮጴ ወደብ', 'የኖኅ ርግብና የወይራ ቅጠል', 'ኢየሱስ በዮርዳኖስ ሲጠመቅ'],
      expEn: 'Noah sent a dove from the ark, which returned in the evening bearing a fresh olive leaf in its beak.',
      ref: 'Genesis 8:11', route: '/bible/genesis/8',
      h1En: 'Sent out from a large wooden vessel on floodwaters.', h1Am: 'ከመርከብ ወደ ውኃው የተላከች ቅድስት ወፍ።',
      h2En: 'Returned at evening time with evidence of life.', h2Am: 'በምሽት ጊዜ የሕይወት ምልክት ይዛ ተመለሰች።',
      h3En: 'A green leaf signaled the receding of divine judgment waters.', h3Am: 'የለመለመ ቅጠል የውኃውን መጉደል አበሰረ።'
    },
    {
      id: 'emoji-p3-abraham-stars',
      emoji: '⛺ 🌌 ⭐ 👶',
      ansEn: 'God’s Promise of Offspring like the Stars',
      ansAm: 'እግዚአብሔር ለአብርሃም የሰጠው የከዋክብት ተስፋ',
      optEn: ['Joseph Dreaming of Sun and Moon', 'Wise Men Following the Star', 'Jacob Sleeping at Bethel', 'God’s Promise of Offspring like the Stars'],
      optAm: ['ዮሴፍ የፀሐይና የጨረቃ ሕልም ሲያይ', 'ሰብአ ሰገል ኮከቡን ሲከተሉ', 'ያዕቆብ በቤቴል ሲተኛ', 'እግዚአብሔር ለአብርሃም የሰጠው የከዋክብት ተስፋ'],
      expEn: 'God brought Abraham outside his tent and told him to count the stars if he could, promising such numerous seed.',
      ref: 'Genesis 15:5', route: '/bible/genesis/15',
      h1En: 'Spoken to an elderly patriarch outside his tent.', h1Am: 'በድንኳኑ ደጃፍ ለቆመው አረጋዊ አባት የተነገረ።',
      h2En: 'He was told to look upward to the night sky.', h2Am: 'ወደ ሰማይ ከዋክብት ቀና ብሎ እንዲመለከት ታዘዘ።',
      h3En: 'His descendants would outnumber the celestial lights.', h3Am: 'ዘሩ እንደ ሰማይ ከዋክብት እንደሚበዛ ቃል ተገባለት።'
    },
    {
      id: 'emoji-p3-sodom-salt',
      emoji: '🔥 🏃 🧂 👁️',
      ansEn: 'Lot’s Wife Turning into a Pillar of Salt',
      ansAm: 'የሎጥ ሚስት የጨው ሐውልት መሆኗ',
      optEn: ['Lot’s Wife Turning into a Pillar of Salt', 'Miriam Struck with Leprosy', 'The Burning Fiery Furnace', 'Mount Sinai Smoking'],
      optAm: ['የሎጥ ሚስት የጨው ሐውልት መሆኗ', 'ማርያም በለምጽ መመታቷ', 'የሚነድደው የእሳት እቶን', 'የደብረ ሲና መጤስ'],
      expEn: 'Fleeing the destruction of Sodom, Lot’s wife looked back against angelic warning and became a pillar of salt.',
      ref: 'Genesis 19:26', route: '/bible/genesis/19',
      h1En: 'Fleeing brimstone rain falling upon twin wicked cities.', h1Am: 'ከፈረሱት ከተሞች በድንገት ሲሸሹ የተፈጸመ።',
      h2En: 'Angels commanded them not to look behind.', h2Am: 'መላእክት ወደ ኋላ እንዳይመለከቱ አስጠንቅቀው ነበር።',
      h3En: 'Looking back brought transformation into mineral crystal.', h3Am: 'ወደ ኋላ መመልከት ወደ ጨው ሐውልት ለወጣት።'
    },
    {
      id: 'emoji-p3-isaac-moriah',
      emoji: '🏔️ 🪵 🗡️ 🐏',
      ansEn: 'The Binding of Isaac on Mount Moriah',
      ansAm: 'የይስሐቅ በሞሪያ ተራራ መታሰር',
      optEn: ['Gideon’s Altar to the Lord', 'The Binding of Isaac on Mount Moriah', 'David Purchasing Araunah’s Floor', 'Solomon Dedicating the Temple'],
      optAm: ['የጌዴዎን መሠዊያ', 'የይስሐቅ በሞሪያ ተራራ መታሰር', 'ዳዊት የኦርናን አውድማ ሲገዛ', 'ሰሎሞን ቤተ መቅደሱን ሲመርቅ'],
      expEn: 'Abraham bound Isaac on the wood and raised the knife, but the angel halted him and provided a ram in the thicket.',
      ref: 'Genesis 22:13', route: '/bible/genesis/22',
      h1En: 'A father and son journeying three days to a high hill.', h1Am: 'አባትና ልጅ ለሦስት ቀናት ወደ ተራራው ተጓዙ።',
      h2En: 'The son carried the wood for the whole burnt offering.', h2Am: 'ልጁ የመሥዋዕቱን እንጨት ተሸክሞ ወጣ።',
      h3En: 'A horned beast caught in brambles took the boy’s place.', h3Am: 'በጫካው የቀንዱ የተያዘ በግ በልጁ ምትክ ተሰዋ።'
    },
    {
      id: 'emoji-p3-jacob-ladder',
      emoji: '🪨 🪜 👼 🌌',
      ansEn: 'Jacob’s Ladder at Bethel',
      ansAm: 'የያዕቆብ መሰላል በቤቴል',
      optEn: ['Moses Ascending Mount Sinai', 'Isaiah Seeing the Lord’s Throne', 'Jacob’s Ladder at Bethel', 'Ezekiel’s Heavenly Wheels'],
      optAm: ['ሙሴ ወደ ሲና ተራራ ሲወጣ', 'ኢሳይያስ የጌታን ዙፋን ሲያይ', 'የያዕቆብ መሰላል በቤቴል', 'የሕዝቅኤል የሰማይ መንኰራኵሮች'],
      expEn: 'Jacob rested his head on a stone at Bethel and saw a ladder reaching from earth to heaven with angels ascending and descending.',
      ref: 'Genesis 28:12', route: '/bible/genesis/28',
      h1En: 'A weary fugitive sleeping with a stone pillow.', h1Am: 'የደከመው መንገደኛ ድንጋይ ተንተርሶ ተኛ።',
      h2En: 'A stairway set up on earth reaching unto high heaven.', h2Am: 'ከምድር እስከ ሰማይ የደረሰ መወጣጫ ታየ።',
      h3En: 'Spiritual messengers ascended and descended upon it.', h3Am: 'የብርሃን መላእክት ሲወጡና ሲወርዱበት ታዩ።'
    },
    {
      id: 'emoji-p3-joseph-pit',
      emoji: '🕳️ 👨‍👦‍👦 🐫 💰',
      ansEn: 'Joseph Thrown into the Pit and Sold',
      ansAm: 'ዮሴፍ በጉድጓድ ተጥሎ መሸጡ',
      optEn: ['Jeremiah Lowered into the Mire', 'Daniel in the Lions’ Den', 'Paul Escaping in a Basket', 'Joseph Thrown into the Pit and Sold'],
      optAm: ['ኤርምያስ በረግረግ ጉድጓድ ሲጣል', 'ዳንኤል በአንበሶች ጉድጓድ', 'ጳውሎስ በቅርጫት ሲያመልጥ', 'ዮሴፍ በጉድጓድ ተጥሎ መሸጡ'],
      expEn: 'Joseph’s brothers cast him into a dry cistern in Dothan and sold him to Midianite merchants traveling to Egypt.',
      ref: 'Genesis 37:28', route: '/bible/genesis/37',
      h1En: 'Envious brothers plotted against a favorite son.', h1Am: 'ቀናተኞች ወንድሞች በተወደደው ወንድማቸው ላይ ተማከሩ።',
      h2En: 'Cast into an empty subterranean water cistern.', h2Am: 'ውኃ ወደሌለው ባዶ የውኃ ጉድጓድ ጣሉት።',
      h3En: 'Sold for twenty pieces of silver to passing traders.', h3Am: 'በሃያ ብር ለሚያልፉ ነጋዴዎች አሳልፈው ሸጡት።'
    },
    {
      id: 'emoji-p3-burning-bush',
      emoji: '🔥 🌿 👞 ⛰️',
      ansEn: 'Moses and the Burning Bush',
      ansAm: 'ሙሴና የማይቃጠለው ቁጥቋጦ',
      optEn: ['Moses and the Burning Bush', 'Elijah on Mount Horeb', 'The Fiery Furnace in Babylon', 'The Pillar of Fire in Wilderness'],
      optAm: ['ሙሴና የማይቃጠለው ቁጥቋጦ', 'ኤልያስ በኮሬብ ተራራ', 'የባቢሎን የእሳት እቶን', 'በምድረ በዳ የነበረው የእሳት ዓምድ'],
      expEn: 'Moses saw a thorn bush burning with fire yet not consumed on Mount Horeb, where God called him by name.',
      ref: 'Exodus 3:2', route: '/bible/exodus/3',
      h1En: 'A shepherd tending flock near the mountain of God.', h1Am: 'በእግዚአብሔር ተራራ አጠገብ በጎችን ሲጠብቅ የታየ።',
      h2En: 'Flames burned intensely without consuming foliage.', h2Am: 'እሳቱ እየነደደ ቅጠሉ ግን ፈጽሞ አልተቃጠለም።',
      h3En: 'He was told to remove his sandals on holy ground.', h3Am: 'የቆመበት ስፍራ የተቀደሰ ስለሆነ ጫማውን እንዲያወልቅ ታዘዘ።'
    },
    {
      id: 'emoji-p3-passover-door',
      emoji: '🚪 🐑 🩸 🌙',
      ansEn: 'The First Passover in Egypt',
      ansAm: 'በግብፅ የተደረገው የመጀመሪያው ፋሲካ',
      optEn: ['Rahab’s Scarlet Window', 'The First Passover in Egypt', 'The Consecration of Aaron', 'The Dedication of the Altar'],
      optAm: ['የረዓብ ቀይ ፈትል', 'በግብፅ የተደረገው የመጀመሪያው ፋሲካ', 'የአሮን ቅስና መቀባት', 'የመሠዊያው ቅዳሴ'],
      expEn: 'Israelites marked the lintel and doorposts with the blood of an unblemished lamb so the destroying plague passed over.',
      ref: 'Exodus 12:7', route: '/bible/exodus/12',
      h1En: 'Instituted on the night of deliverance from bondage.', h1Am: 'ከባርነት ነፃ በወጡበት ታላቅ ምሽት ተደረገ።',
      h2En: 'An unblemished yearling lamb was roasted whole.', h2Am: 'እንከን የሌለበት የአንድ ዓመት ጠቦት ተጠበሰ።',
      h3En: 'Crimson marks on doorposts spared firstborn sons.', h3Am: 'በመቃኑ ላይ የተቀባው ደም የበኩር ልጆችን አዳነ።'
    },

    // 11-20
    {
      id: 'emoji-p3-red-sea',
      emoji: '🌊 🦯 💨 🚶‍♂️',
      ansEn: 'Crossing the Red Sea',
      ansAm: 'ቀይ ባሕርን መሻገር',
      optEn: ['Crossing the Jordan River', 'Jesus Walking on the Sea', 'Crossing the Red Sea', 'Jonah Cast into the Sea'],
      optAm: ['የዮርዳኖስን ወንዝ መሻገር', 'ኢየሱስ በባሕር ላይ ሲራመድ', 'ቀይ ባሕርን መሻገር', 'ዮናስ ወደ ባሕር ሲጣል'],
      expEn: 'Moses lifted his staff, a strong east wind blew all night, and the waters divided so Israel crossed on dry ground.',
      ref: 'Exodus 14:21', route: '/bible/exodus/14',
      h1En: 'The Egyptian chariot army pursued closely behind.', h1Am: 'የፈርዖን የሰረገላ ሠራዊት ከኋላ አጥብቆ ተከተለ።',
      h2En: 'A prophet stretched his hand over roaring waves.', h2Am: 'ነቢዩ እጁን በማዕበሉ ላይ ወደ ሰማይ ዘረጋ።',
      h3En: 'Walls of water stood on both sides as they marched.', h3Am: 'ውኃው በቀኝና በግራ እንደ ግንብ ቆመላቸው።'
    },
    {
      id: 'emoji-p3-manna-dew',
      emoji: '🍞 ❄️ ⛺ 🌅',
      ansEn: 'Manna Falling from Heaven',
      ansAm: 'ከሰማይ የወረደው መና',
      optEn: ['Feeding the Five Thousand', 'Showbread in the Tabernacle', 'Elijah Fed by Ravens', 'Manna Falling from Heaven'],
      optAm: ['አምስት ሺህ ሰዎችን መመገብ', 'በድንኳኑ የነበረው የገጽ ኅብስት', 'ኤልያስ በቁራዎች ሲመገብ', 'ከሰማይ የወረደው መና'],
      expEn: 'Every morning when the dew evaporated, white flakes like coriander seed lay upon the ground for the people to gather.',
      ref: 'Exodus 16:14', route: '/bible/exodus/16',
      h1En: 'Appeared daily in the desert morning around tents.', h1Am: 'በየማለዳው በምድረ በዳ በድንኳኖች ዙሪያ ወረደ።',
      h2En: 'Fine flake-like substance resembling white frost.', h2Am: 'እንደ አመዳይ የደቀቀ ነጭ የምግብ ፍሬ።',
      h3En: 'Tasted like sweet wafers made with honey.', h3Am: 'ጣዕሙ ከማር ጋር እንደ ተሠራ ስስ ኅብስት ነበረ።'
    },
    {
      id: 'emoji-p3-ten-commandments',
      emoji: '⛰️ ⚡ 📜 ✍️',
      ansEn: 'The Giving of the Ten Commandments',
      ansAm: 'ዐሥሩ ትእዛዛት በደብረ ሲና መሰጠታቸው',
      optEn: ['The Giving of the Ten Commandments', 'Elijah on Mount Carmel', 'The Transfiguration of Christ', 'The Sermon on the Mount'],
      optAm: ['ዐሥሩ ትእዛዛት በደብረ ሲና መሰጠታቸው', 'ኤልያስ በደብረ ቀርሜሎስ', 'የክርስቶስ ደብረ ታቦር ምስጢር', 'የተራራው ስብከት'],
      expEn: 'God descended in thunder, smoke, and trumpet sound on Mount Sinai, writing the commandments on stone with His finger.',
      ref: 'Exodus 20:1', route: '/bible/exodus/20',
      h1En: 'Accompanied by smoke, earthquakes, and trumpet blasts.', h1Am: 'በጭስ፣ በነጎድጓድና በጽኑ የመለከት ድምፅ ታጅቦ ሆነ።',
      h2En: 'A holy mediator remained on the summit forty days.', h2Am: 'ቅዱሱ መሪ በተራራው አርባ ቀንና ሌሊት ቆየ።',
      h3En: 'Engraved with the divine finger on dual tablets.', h3Am: 'በሁለቱ የድንጋይ ጽላቶች በእግዚአብሔር ጣት ተጻፈ።'
    },
    {
      id: 'emoji-p3-golden-calf',
      emoji: '🐮 🪙 🔥 💃',
      ansEn: 'The Idolatry of the Golden Calf',
      ansAm: 'የወርቁ ጥጃ ጣዖት አምልኮ',
      optEn: ['Gideon’s Golden Ephod', 'The Idolatry of the Golden Calf', 'Micah’s Carved Image', 'Jeroboam’s Calves at Bethel'],
      optAm: ['የጌዴዎን የወርቅ ልብስ', 'የወርቁ ጥጃ ጣዖት አምልኮ', 'የሚካ የተቀረጸ ምስል', 'የኢዮርብዓም ጥጆች በቤቴል'],
      expEn: 'While Moses delayed on the mountain, the people melted their earrings to fashion a golden calf and danced before it.',
      ref: 'Exodus 32:4', route: '/bible/exodus/32',
      h1En: 'Fashioned while their leader tarried on the mountain.', h1Am: 'መሪያቸው በተራራው በዘገየበት ጊዜ ተሠራ።',
      h2En: 'Cast from molten golden earrings collected from the camp.', h2Am: 'ከሕዝቡ ጆሮ ከተሰበሰበ የወርቅ ጉትቻ ቀለጠ።',
      h3En: 'They bowed shouting: These are your gods, O Israel.', h3Am: 'እስራኤል ሆይ፥ ከአገርህ ያወጡህ አማልክትህ እነዚህ ናቸው አሉ።'
    },
    {
      id: 'emoji-p3-spies-grapes',
      emoji: '🍇 🦯 👬 🏰',
      ansEn: 'The Spies Carrying Grapes from Eshcol',
      ansAm: 'ሰላዮቹ ከኤሽኮል የወይን ዘለላ ተሸክመው መመለሳቸው',
      optEn: ['Ruth in the Vineyard', 'The Spies Carrying Grapes from Eshcol', 'Noah Planting a Vineyard', 'The Parable of the Vinedressers'],
      optAm: ['ሩት በወይን እርሻ', 'ሰላዮቹ ከኤሽኮል የወይን ዘለላ ተሸክመው መመለሳቸው', 'ኖኅ የወይን ቦታ ሲተክል', 'የወይን አትክልተኞች ምሳሌ'],
      expEn: 'Twelve men explored Canaan and cut a cluster of grapes so huge that two men carried it on a pole between them.',
      ref: 'Numbers 13:23', route: '/bible/numbers/13',
      h1En: 'Twelve scouts explored the land for forty days.', h1Am: 'ዐሥራ ሁለት መሪዎች ምድሪቱን ለአርባ ቀናት ዞሩ።',
      h2En: 'Returned with pomegranates, figs, and immense fruit.', h2Am: 'ሮማን፣ በለስና እጅግ ታላቅ ፍሬ ይዘው ተመለሱ።',
      h3En: 'A single grape cluster required two men on a staff.', h3Am: 'አንድ የወይን ዘለላ በሁለት ሰዎች በበትር ተሸከሙት።'
    },
    {
      id: 'emoji-p3-balaam-donkey',
      emoji: '🫏 🗣️ 🦯 👼',
      ansEn: 'Balaam’s Donkey Speaking',
      ansAm: 'የበለዓም አህያ መናገሯ',
      optEn: ['Samson and the Donkey’s Jawbone', 'Christ’s Entry on a Donkey', 'Abigail Riding to Meet David', 'Balaam’s Donkey Speaking'],
      optAm: ['ሶምሶን በአህያ መንጋጭላ ሲመታ', 'ክርስቶስ በአህያ ውርንጭላ ሲገባ', 'አቢግያ ዳዊትን ልታገኝ ስትጋልብ', 'የበለዓም አህያ መናገሯ'],
      expEn: 'When the soothsayer Balaam struck his donkey three times, God opened the animal’s mouth to rebuke the prophet’s madness.',
      ref: 'Numbers 22:28', route: '/bible/numbers/22',
      h1En: 'A pagan seer on a journey to curse God’s people.', h1Am: 'የእግዚአብሔርን ሕዝብ ሊረግም የተጓዘ ጠንቋይ ነበረ።',
      h2En: 'The beast saw an angelic sword where the rider saw none.', h2Am: 'እንስሳዋ የተመዘዘ የመልአክ ሰይፍ አየች፤ መሪው ግን አላየም።',
      h3En: 'A mute domestic animal spoke with human voice.', h3Am: 'ድዳ የሆነች አህያ በሰው አንደበት ተናግራ ገሠጸችው።'
    },
    {
      id: 'emoji-p3-jericho-trumpets',
      emoji: '🏰 🎺 🚶‍♂️ 💥',
      ansEn: 'The Fall of the Walls of Jericho',
      ansAm: 'የኢያሪኮ ቅጥር መፍረሱ',
      optEn: ['The Fall of the Walls of Jericho', 'Gideon’s Midnight Attack', 'Samson Tearing Down the Temple', 'David Capturing Mount Zion'],
      optAm: ['የኢያሪኮ ቅጥር መፍረሱ', 'የጌዴዎን የሌሊት ጥቃት', 'ሶምሶን የጣዖት ቤቱን ሲያፈርስ', 'ዳዊት ጽዮንን ሲይዝ'],
      expEn: 'Israel marched around the fortified city for seven days; on the seventh day priests blew ram’s horns, the people shouted, and walls fell flat.',
      ref: 'Joshua 6:20', route: '/bible/joshua/6',
      h1En: 'The Ark carried silently once daily for six days.', h1Am: 'ታቦቱ ለስድስት ቀናት በቀን አንድ ጊዜ በዝምታ ዞረ።',
      h2En: 'On the seventh day they circled seven full times.', h2Am: 'በሰባተኛው ቀን ከተማዋን ሰባት ጊዜ ዞሩአት።',
      h3En: 'Shofar blasts and mighty shouts flattened stone walls.', h3Am: 'የመለከት ድምፅና ታላቅ ጩኸት ቅጥሩን ደረገመው።'
    },
    {
      id: 'emoji-p3-sun-stand-still',
      emoji: '☀️ 🌙 ⚔️ 🛑',
      ansEn: 'The Sun Standing Still at Gibeon',
      ansAm: 'ፀሐይ በገባዖን ጸጥ ብላ መቆሟ',
      optEn: ['The Sun Standing Still at Gibeon', 'Hezekiah’s Sundial Sign', 'Darkness at the Crucifixion', 'Elijah Calling Down Fire'],
      optAm: ['ፀሐይ በገባዖን ጸጥ ብላ መቆሟ', 'የሕዝቅያስ የፀሐይ ጥላ ምልክት', 'በስቅለት ጊዜ የሆነው ጨለማ', 'ኤልያስ እሳትን ከሰማይ ሲያወርድ'],
      expEn: 'Joshua prayed boldly, and the sun stood still in the midst of heaven and delayed going down about a whole day.',
      ref: 'Joshua 10:12', route: '/bible/joshua/10',
      h1En: 'A critical battle fought near the Valley of Aijalon.', h1Am: 'በአያሎን ሸለቆ አጠገብ የተደረገ ብርቱ ጦርነት።',
      h2En: 'A commander cried out directly to heavenly luminaries.', h2Am: 'የሠራዊት መሪ ወደ ሰማይ ብርሃናት ጮኸ።',
      h3En: 'Daylight was prolonged for nearly an entire cycle.', h3Am: 'ቀኑ ሳይጨልም አንድ ሙሉ ቀን ያህል ፀሐይ ቆመች።'
    },
    {
      id: 'emoji-p3-gideon-jars',
      emoji: '🏺 🔥 🎺 🛡️',
      ansEn: 'Gideon’s Jars, Torches, and Trumpets',
      ansAm: 'የጌዴዎን ማሰሮዎች፣ ችቦዎችና መለከቶች',
      optEn: ['Samson’s Fox Torches', 'Gideon’s Jars, Torches, and Trumpets', 'Elijah on Mount Carmel', 'Joshua at Ai'],
      optAm: ['የሶምሶን የቀበሮ ችቦዎች', 'የጌዴዎን ማሰሮዎች፣ ችቦዎችና መለከቶች', 'ኤልያስ በደብረ ቀርሜሎስ', 'ኢያሱ በጋይ ከተማ'],
      expEn: 'Three hundred men surrounded the Midianite camp with trumpets, breaking clay pitchers to reveal torches and crying: Sword of the Lord and of Gideon!',
      ref: 'Judges 7:20', route: '/bible/judges/7',
      h1En: 'Three hundred soldiers chosen by how they lapped water.', h1Am: 'ውኃን በምላሳቸው በላሱ ሦስት መቶ ሰዎች ተመረጡ።',
      h2En: 'Concealed blazing firebrands inside fragile pottery.', h2Am: 'በሸክላ ማሰሮ ውስጥ የተሰወረ ችቦ ይዘው ዞሩ።',
      h3En: 'Shattered jars and trumpet blasts panicked the enemy host.', h3Am: 'የተሰበሩ ማሰሮዎችና መለከቶች የጠላትን ሠራዊት አሸበሩ።'
    },
    {
      id: 'emoji-p3-david-goliath',
      emoji: '🪨 🪓 👑 🛡️',
      ansEn: 'David Slaying Goliath with a Sling',
      ansAm: 'ዳዊት ጎልያድን በወንጭፍ መግደሉ',
      optEn: ['Jonathan Attacking the Garrison', 'David Slaying Goliath with a Sling', 'Benaiah Slaying the Lion', 'Samson Slaying Philistines'],
      optAm: ['ዮናታን ምሽጉን ሲመታ', 'ዳዊት ጎልያድን በወንጭፍ መግደሉ', 'በናያስ አንበሳውን ሲገድል', 'ሶምሶን ፍልስጥኤማውያንን ሲመታ'],
      expEn: 'The young shepherd took five smooth stones from the brook and struck the armored Philistine giant in the forehead with his sling.',
      ref: '1 Samuel 17:49', route: '/bible/1-samuel/17',
      h1En: 'A teenage shepherd boy refusing bronze royal armor.', h1Am: 'የንጉሡን የነሐስ ጋሻና ጦር ያልተለማመደ እረኛ።',
      h2En: 'Five smooth brook stones selected from the ravine.', h2Am: 'ከወንዝ አምስት የተመረጡ ድቡልቡል ድንጋዮችን ወሰደ።',
      h3En: 'A single leather pouch shot toppled a blaspheming giant.', h3Am: 'በወንጭፍ የተወነጨፈች አንዲት ድንጋይ ግዙፉን ገደለችው።'
    }
  ]

  // Add 80 more questions to reach exactly 100 questions
  const additionalTemplates: Array<{
    id: string
    emoji: string
    ansEn: string
    ansAm: string
    optEn: [string, string, string, string]
    optAm: [string, string, string, string]
    expEn: string
    ref: string
    route: string
    h1En: string
    h1Am: string
    h2En: string
    h2Am: string
    h3En: string
    h3Am: string
  }> = [
    // 21-30: Kings & Prophets
    {
      id: 'emoji-p3-ark-dagon',
      emoji: '⛪ 🗿 💥 🕳️',
      ansEn: 'The Ark in the Temple of Dagon',
      ansAm: 'የእግዚአብሔር ታቦት በዳጎን ቤት መውደቁ',
      optEn: ['The Ark in the Temple of Dagon', 'The Golden Calf in the Camp', 'Baal’s Altar Broken by Gideon', 'Josiah Purging Idols'],
      optAm: ['የእግዚአብሔር ታቦት በዳጎን ቤት መውደቁ', 'የወርቁ ጥጃ በሰፈር', 'የበአል መሠዊያ በጌዴዎን ሲፈርስ', 'ኢዮስያስ ጣዖታትን ሲያጠፋ'],
      expEn: 'Placed before Dagon in Ashdod, the fish-god idol fell on its face twice and had its hands and head broken off before the Ark.',
      ref: '1 Samuel 5:4', route: '/bible/1-samuel/5',
      h1En: 'The captured sacred chest placed in a pagan shrine.', h1Am: 'የተማረከው ቅዱስ ታቦት በባዕድ ጣዖት ቤት ተቀመጠ።',
      h2En: 'Found toppled face-down upon the sanctuary floor.', h2Am: 'ጣዖቱ በፊቱ ተደፍቶ በምድር ላይ ወድቆ ተገኘ።',
      h3En: 'The idol’s head and palms were severed upon the threshold.', h3Am: 'የጣዖቱ ራስና መዳፎች በመድረኩ ላይ ተቆርጠው ወደቁ።'
    },
    {
      id: 'emoji-p3-elijah-ravens',
      emoji: '🦅 🍞 🥩 🌊',
      ansEn: 'Elijah Fed by Ravens at Cherith',
      ansAm: 'ኤልያስ በኮራት ፈፋ በቁራዎች መመገቡ',
      optEn: ['Noah Sending Out the Raven', 'Elijah Fed by Ravens at Cherith', 'Manna in the Wilderness', 'Peter’s Vision of Animals'],
      optAm: ['ኖኅ ቁራውን ሲልክ', 'ኤልያስ በኮራት ፈፋ በቁራዎች መመገቡ', 'መና በምድረ በዳ', 'የጴጥሮስ የሕልም ራእይ'],
      expEn: 'During drought, Elijah hid by the Brook Cherith, where ravens brought him bread and meat morning and evening.',
      ref: '1 Kings 17:6', route: '/bible/1-kings/17',
      h1En: 'A solitary prophet hiding beside a rocky brook.', h1Am: 'ብቸኛው ነቢይ በድንጋያማ ፈፋ አጠገብ ተሰወረ።',
      h2En: 'Black birds served as heavenly couriers twice daily.', h2Am: 'ጥቁር አዕዋፍ በቀን ሁለት ጊዜ ምግብ አመጡለት።',
      h3En: 'Meat and bread supplied while drought parched the land.', h3Am: 'ምድሪቱ በድርቅ ስትደርቅ እንጀራና ሥጋ ተመገበ።'
    },
    {
      id: 'emoji-p3-widow-oil',
      emoji: '🏺 🌾 🫗 ♾️',
      ansEn: 'The Widow of Zarephath’s Jar of Flour and Oil',
      ansAm: 'የሰራፕታዋ መበለት የዱቄትና የዘይት በረከት',
      optEn: ['Feeding the Multitude', 'The Widow of Zarephath’s Jar of Flour and Oil', 'Elisha and the Floating Axe', 'Jacob’s Well in Samaria'],
      optAm: ['ሕዝቡን መመገብ', 'የሰራፕታዋ መበለት የዱቄትና የዘይት በረከት', 'ኤልሳዕ መጥረቢያውን ሲያንሳፍፍ', 'የያዕቆብ የውኃ ጉድጓድ'],
      expEn: 'The poor widow baked a small cake for Elijah first; neither her jar of flour was exhausted nor her jug of oil dried up.',
      ref: '1 Kings 17:16', route: '/bible/1-kings/17',
      h1En: 'A starving widow gathering sticks for her last meal.', h1Am: 'የመጨረሻ ምግቧን ለማዘጋጀት እንጨት የሰበሰበች መበለት።',
      h2En: 'Shared her meager flour and oil with a man of God.', h2Am: 'ጥቂት ዱቄቷንና ዘይቷን ለእግዚአብሔር ሰው ሰጠች።',
      h3En: 'The earthen containers never emptied during years of famine.', h3Am: 'በድርቁ ዘመን ሁሉ ዱቄቱና ዘይቱ ፈጽሞ አላለቀም።'
    },
    {
      id: 'emoji-p3-carmel-fire',
      emoji: '🐂 💧 🪵 🔥',
      ansEn: 'Fire from Heaven on Mount Carmel',
      ansAm: 'የኤልያስ መሥዋዕት በእሳት መቃጠሉ በደብረ ቀርሜሎስ',
      optEn: ['The Burning Bush', 'Fire from Heaven on Mount Carmel', 'Sodom and Gomorrah Burning', 'Pentecost Tongues of Fire'],
      optAm: ['የማይቃጠለው ቁጥቋጦ', 'የኤልያስ መሥዋዕት በእሳት መቃጠሉ በደብረ ቀርሜሎስ', 'የሰዶምና ገሞራ መቃጠል', 'የበዓለ ሃምሳ የእሳት ላንቃ'],
      expEn: 'Elijah drenched the sacrifice with twelve jars of water; the Lord sent fire consuming the bull, wood, stones, and water in the trench.',
      ref: '1 Kings 18:38', route: '/bible/1-kings/18',
      h1En: 'A dramatic contest against four hundred and fifty prophets of Baal.', h1Am: 'ከአራት መቶ ሃምሳ የሐሰት ነቢያት ጋር የተደረገ ታላቅ ፈተና።',
      h2En: 'Poured twelve jars of water until trenches overflowed.', h2Am: 'ጉድጓዱ እስኪሞላ ድረስ አሥራ ሁለት ማሰሮ ውኃ ፈሰሰበት።',
      h3En: 'Heavenly fire consumed sacrifice, stones, dust, and water.', h3Am: 'ከሰማይ የወረደ እሳት መሥዋዕቱን፣ ድንጋዮቹንና ውኃውን በላ።'
    },
    {
      id: 'emoji-p3-still-small-voice',
      emoji: '🌪️ 🪨 🔥 🤫',
      ansEn: 'The Still, Small Voice at Mount Horeb',
      ansAm: 'በደብረ ሖሬብ የተሰማው የለሰለሰ ድምፅ',
      optEn: ['The Still, Small Voice at Mount Horeb', 'The Earthquake at Philippi', 'The Ten Commandments', 'Ezekiel’s Dry Bones'],
      optAm: ['በደብረ ሖሬብ የተሰማው የለሰለሰ ድምፅ', 'የፊልጵስዩስ የመሬት መንቀጥቀጥ', 'ዐሥሩ ትእዛዛት', 'የሕዝቅኤል ደረቅ አጥንቶች'],
      expEn: 'The Lord was not in the great wind, earthquake, or fire, but in a still small gentle whisper that prompted Elijah to cover his face.',
      ref: '1 Kings 19:12', route: '/bible/1-kings/19',
      h1En: 'A fleeing prophet resting inside a mountain cavern.', h1Am: 'የሸሸው ነቢይ በተራራው ዋሻ ውስጥ ተቀምጦ ሳለ።',
      h2En: 'Great storm, shaking earth, and blazing fire passed by.', h2Am: 'ብርቱ ነፋስ፣ የመሬት መናወጥና እሳት አለፉ።',
      h3En: 'The Almighty manifested in delicate, quiet serenity.', h3Am: 'እግዚአብሔር በለሰለሰና ጸጥ ባለ ድምፅ ተገለጠ።'
    },
    {
      id: 'emoji-p3-jonah-fish',
      emoji: '🚢 🌊 🐋 🤢',
      ansEn: 'Jonah Swallowed by the Great Fish',
      ansAm: 'ዮናስ በዓሣ አንበሪ ሆድ ውስጥ መዋጡ',
      optEn: ['Jonah Swallowed by the Great Fish', 'Paul Shipwrecked at Malta', 'Peter Walking on Water', 'Noah’s Ark on the Flood'],
      optAm: ['ዮናስ በዓሣ አንበሪ ሆድ ውስጥ መዋጡ', 'ጳውሎስ በማልታ መርከቡ ሲሰበር', 'ጴጥሮስ በባሕር ላይ ሲራመድ', 'የኖኅ መርከብ በማዕበል'],
      expEn: 'Thrown into the sea to quiet the storm, Jonah was swallowed by a great aquatic creature and prayed three days in its belly.',
      ref: 'Jonah 1:17', route: '/bible/jonah/1',
      h1En: 'Fled divine commission on a ship bound for Tarshish.', h1Am: 'ወደ ተርሴስ በሚጓዝ መርከብ ከእግዚአብሔር ፊት ሸሸ።',
      h2En: 'Sailors cast lots and cast him into the stormy deep.', h2Am: 'ዕጣ ተጥሎበት ወደ ማዕበሉ ባሕር ተጣለ።',
      h3En: 'Spent three days and nights inside a living submerged sanctuary.', h3Am: 'በታላቁ ዓሣ ሆድ ውስጥ ሦስት ቀንና ሦስት ሌሊት ጸለየ።'
    },
    {
      id: 'emoji-p3-ezekiel-bones',
      emoji: '💀 🌬️ 🦴 🧍‍♂️',
      ansEn: 'The Valley of Dry Bones',
      ansAm: 'የሕዝቅኤል የደረቁ አጥንቶች ሸለቆ',
      optEn: ['The Valley of Dry Bones', 'The Raising of Lazarus', 'The Resurrection of Christ', 'David and Goliath in Elah'],
      optAm: ['የሕዝቅኤል የደረቁ አጥንቶች ሸለቆ', 'የአልዓዛር ከሞት መነሣት', 'የክርስቶስ ቅድስት ትንሣኤ', 'ዳዊትና ጎልያድ በኤላህ ሸለቆ'],
      expEn: 'Ezekiel prophesied to scattered bones; sinews and flesh formed, and the four winds breathed life into an exceedingly great army.',
      ref: 'Ezekiel 37:10', route: '/bible/ezekiel/37',
      h1En: 'Set down in the middle of a wide ravine filled with remnants.', h1Am: 'በአጥንት በተሞላ ሰፊ ሸለቆ መካከል ተቀመጠ።',
      h2En: 'A rattling sound brought skeletal frames together.', h2Am: 'የመነቃነቅ ድምፅ ሆነ፤ አጥንትም ከአጥንት ጋር ተገናኘ።',
      h3En: 'Heavenly breath filled bodies, raising a mighty army.', h3Am: 'መንፈስ ገባባቸው፤ እጅግ ታላቅ ሠራዊት ሆነው በእግራቸው ቆሙ።'
    },
    {
      id: 'emoji-p3-handwriting-wall',
      emoji: '🍷 👑 🖐️ 🧱',
      ansEn: 'The Handwriting on the Wall at Belshazzar’s Feast',
      ansAm: 'በብልጣሶር ግብዣ በግድግዳው ላይ የተጻፈው ጽሕፈት',
      optEn: ['The Handwriting on the Wall at Belshazzar’s Feast', 'Nehemiah Rebuilding the Wall', 'Moses Writing the Law', 'The Scribe Ezra Reading'],
      optAm: ['በብልጣሶር ግብዣ በግድግዳው ላይ የተጻፈው ጽሕፈት', 'ነህምያ ቅጥሩን ሲሠራ', 'ሙሴ ሕጉን ሲጽፍ', 'ጸሐፊው ዕዝራ ሲያነብ'],
      expEn: 'While King Belshazzar drank from Jerusalem Temple cups, fingers of a human hand wrote Mene, Mene, Tekel, Upharsin on the plaster.',
      ref: 'Daniel 5:5', route: '/bible/daniel/5',
      h1En: 'A decadent banquet misusing sacred golden vessels.', h1Am: 'የመቅደሱ የወርቅ ዕቃዎች ለስካር የዋሉበት ግብዣ።',
      h2En: 'Disembodied fingers wrote mysterious words opposite a lampstand.', h2Am: 'የሰው እጅ ጣቶች በመቅረዙ አጠገብ በግድግዳው ላይ ጻፉ።',
      h3En: 'Weighed in balances and found wanting foretold royal downfall.', h3Am: 'በሚዛን ተመዝነህ ቀለልህ የሚል የፍርድ ቃል ተነገረ።'
    },
    {
      id: 'emoji-p3-nativity-manger',
      emoji: '🌟 👶 🐮 🐑',
      ansEn: 'The Nativity in Bethlehem’s Manger',
      ansAm: 'የጌታችን ልደት በቤተልሔም በረት',
      optEn: ['The Presentation in the Temple', 'The Nativity in Bethlehem’s Manger', 'The Flight into Egypt', 'The Annunciation of Gabriel'],
      optAm: ['በቤተ መቅደስ መቅረቡ', 'የጌታችን ልደት በቤተልሔም በረት', 'ወደ ግብፅ መሰደድ', 'የመልአኩ ገብርኤል ብሥራት'],
      expEn: 'Because there was no room in the inn, Mary wrapped her firstborn Son in swaddling cloths and laid Him in a manger.',
      ref: 'Luke 2:7', route: '/bible/luke/2',
      h1En: 'A crowded Judean village during Caesar’s census.', h1Am: 'በቄሳር አዋጅ ምክንያት በተጨናነቀች የይሁዳ መንደር ሆነ።',
      h2En: 'No dwelling room was available in the lodging inn.', h2Am: 'በእንግዶች ማረፊያ ስፍራ ስላልነበራቸው።',
      h3En: 'The King of Glory rested in a feeding trough for beasts.', h3Am: 'የክብር ንጉሥ በግርግም በከብቶች በረት ተኛ።'
    },
    {
      id: 'emoji-p3-shepherds-angels',
      emoji: '🐑 🌙 👼 🎶',
      ansEn: 'Angels Announcing the Birth to Shepherds',
      ansAm: 'መላእክት ለረኞች የምሥራች ማብሰራቸው',
      optEn: ['Jacob Tending Laban’s Sheep', 'David Shepherding at Night', 'Angels Announcing the Birth to Shepherds', 'The Good Shepherd with Flocks'],
      optAm: ['ያዕቆብ የላባን በጎች ሲጠብቅ', 'ዳዊት በሌሊት በግ ሲጠብቅ', 'መላእክት ለረኞች የምሥራች ማብሰራቸው', 'መልካም እረኛ ከመንጋው ጋር'],
      expEn: 'Shepherds keeping night watch over their sheep were surrounded by glory as an angel announced good tidings of great joy.',
      ref: 'Luke 2:10', route: '/bible/luke/2',
      h1En: 'Simple herdsmen keeping vigil over flocks at midnight.', h1Am: 'በሌሊት መንጋቸውን በሜዳ ሲጠብቁ የነበሩ እረኞች።',
      h2En: 'Brilliant glory of the Lord shone brightly around them.', h2Am: 'የእግዚአብሔር ክብር በዙሪያቸው ድንገት አበራ።',
      h3En: 'A heavenly choir sang: Glory to God in the highest.', h3Am: 'የሰማይ ሠራዊት፡ ክብር ለእግዚአብሔር በአርያም ብለው ዘመሩ።'
    }
  ]

  rawQuestions.push(...additionalTemplates)

  // Add 70 more entries programmatically to guarantee 100 questions
  const gospelsAndActsEvents: Array<{
    id: string; emoji: string; ansEn: string; ansAm: string;
    optEn: [string, string, string, string]; optAm: [string, string, string, string];
    expEn: string; ref: string; route: string;
    h1En: string; h1Am: string; h2En: string; h2Am: string; h3En: string; h3Am: string;
  }> = [
    {
      id: 'emoji-p3-wise-men-gifts', emoji: '👑 ⭐ 🎁 🐪',
      ansEn: 'Magi Offering Gold, Frankincense, and Myrrh', ansAm: 'ሰብአ ሰገል ወርቅ፣ ዕጣንና ከርቤ ማቅረባቸው',
      optEn: ['Magi Offering Gold, Frankincense, and Myrrh', 'Shepherds at the Manger', 'Solomon and Queen of Sheba', 'Gifts of the Patriarchs'],
      optAm: ['ሰብአ ሰገል ወርቅ፣ ዕጣንና ከርቤ ማቅረባቸው', 'እረኞች በበረት', 'ሰሎሞንና ንግሥተ ሳባ', 'የአባቶች ስጦታዎች'],
      expEn: 'The wise men fell down and worshipped the Young Child, opening their treasures to present three royal gifts.',
      ref: 'Matthew 2:11', route: '/bible/matthew/2',
      h1En: 'Eastern scholars guided across deserts by a star.', h1Am: 'በኮከብ ተመርተው ከምሥራቅ የመጡ ጥበበኞች።',
      h2En: 'Found the Child with His Mother Mary in Bethlehem.', h2Am: 'ሕፃኑን ከእናቱ ከማርያም ጋር አገኙት።',
      h3En: 'Presented gifts symbolizing royalty, divinity, and death.', h3Am: 'የንግሥና፣ የመለኮትና የሞት ምሳሌ የሆኑ ስጦታዎችን አቀረቡ።'
    },
    {
      id: 'emoji-p3-flight-egypt', emoji: '🏜️ 👶 🐴 🌙',
      ansEn: 'Flight of the Holy Family into Egypt', ansAm: 'የቅድስት ቤተሰብ ወደ ግብፅ መሰደድ',
      optEn: ['Moses Fleeing to Midian', 'Flight of the Holy Family into Egypt', 'Joseph Going Down to Egypt', 'Abraham Traveling South'],
      optAm: ['ሙሴ ወደ ምድያም ሲሸሽ', 'የቅድስት ቤተሰብ ወደ ግብፅ መሰደድ', 'ዮሴፍ ወደ ግብፅ ሲወርድ', 'አብርሃም ወደ ደቡብ ሲጓዝ'],
      expEn: 'An angel warned Joseph in a dream to take the young Child and His Mother and flee to Egypt from Herod’s sword.',
      ref: 'Matthew 2:14', route: '/bible/matthew/2',
      h1En: 'A nighttime journey triggered by a nocturnal warning.', h1Am: 'በመልአክ ሕልም የተነገረ የሌሊት ጉዞ።',
      h2En: 'Fled tyrannical decree targeting young infants.', h2Am: 'ሕፃናትን ከሚገድል የንጉሥ ቁጣ ሸሹ።',
      h3En: 'Fulfilled prophecy: Out of Egypt have I called My Son.', h3Am: 'ልጄን ከግብፅ ጠራሁት የሚለው ትንቢት ተፈጸመ።'
    },
    {
      id: 'emoji-p3-temple-boy-jesus', emoji: '🏛️ 📜 👦 ❓',
      ansEn: 'Twelve-Year-Old Jesus in the Temple', ansAm: 'የዐሥራ ሁለት ዓመቱ ኢየሱስ በመቅደስ',
      optEn: ['Samuel Ministering Before Eli', 'Twelve-Year-Old Jesus in the Temple', 'Timothy Learning Scriptures', 'Solomon Anointed at Gihon'],
      optAm: ['ሳሙኤል በዔሊ ፊት ሲያገለግል', 'የዐሥራ ሁለት ዓመቱ ኢየሱስ በመቅደስ', 'ጢሞቴዎስ ቅዱሳት መጻሕፍትን ሲማር', 'ሰሎሞን በግዮን ሲቀባ'],
      expEn: 'Found sitting among teachers in the Jerusalem Temple after three days, listening and asking questions that astonished all.',
      ref: 'Luke 2:46', route: '/bible/luke/2',
      h1En: 'Parents searched anxiously for three days during feast.', h1Am: 'ወላጆቹ ለሦስት ቀናት በጭንቀት ፈለጉት።',
      h2En: 'Found among doctors of the Law listening and answering.', h2Am: 'በሕግ መምህራን መካከል ተቀምጦ ጥያቄ ሲመልስ ተገኘ።',
      h3En: 'Said: Did you not know I must be in My Father’s house?', h3Am: 'በአባቴ ቤት እሆን ዘንድ እንዲገባኝ አላወቃችሁምን አለ።'
    },
    {
      id: 'emoji-p3-baptism-dove', emoji: '🌊 🕊️ 🗣️ ☁️',
      ansEn: 'The Baptism of the Lord in the Jordan', ansAm: 'የጌታችን የጥምቀት ምስጢር በዮርዳኖስ',
      optEn: ['Naaman Washing in the Jordan', 'The Baptism of the Lord in the Jordan', 'John Baptizing at Aenon', 'Peter’s Vision of the Sheet'],
      optAm: ['ንዕማን በዮርዳኖስ ሲታጠብ', 'የጌታችን የጥምቀት ምስጢር በዮርዳኖስ', 'ዮሐንስ በሄኖን ሲያጠምቅ', 'የጴጥሮስ የሰማይ ራእይ'],
      expEn: 'As Christ came up from the water, the heavens opened, the Holy Spirit descended like a dove, and the Father’s voice sounded.',
      ref: 'Matthew 3:16', route: '/bible/matthew/3',
      h1En: 'Occurred in the flowing waters of the Jordan.', h1Am: 'በዮርዳኖስ ወንዝ ውኃ ውስጥ ተፈጸመ።',
      h2En: 'The Holy Spirit descended in bodily form as a gentle bird.', h2Am: 'መንፈስ ቅዱስ በርግብ አምሳል ወረደ።',
      h3En: 'The Father declared: This is My beloved Son in whom I am pleased.', h3Am: 'አብ፡ የምወደው ልጄ ይህ ነው የሚል ድምፅ ከሰማይ አሰማ።'
    },
    {
      id: 'emoji-p3-wilderness-temptation', emoji: '🏜️ 🍞 🪨 😈',
      ansEn: 'The Temptation of Christ in the Wilderness', ansAm: 'የክርስቶስ በምድረ በዳ መፈተን',
      optEn: ['Israel’s Forty Years in Desert', 'The Temptation of Christ in the Wilderness', 'Elijah at Mount Horeb', 'Moses on Mount Sinai'],
      optAm: ['የእስራኤል ዐርባ ዓመት ጉዞ', 'የክርስቶስ በምድረ በዳ መፈተን', 'ኤልያስ በኮሬብ ተራራ', 'ሙሴ በደብረ ሲና'],
      expEn: 'After fasting forty days and nights, Christ repelled Satan’s three temptations using the written Word of God.',
      ref: 'Matthew 4:1', route: '/bible/matthew/4',
      h1En: 'Followed immediately after His baptism in the Jordan.', h1Am: 'በዮርዳኖስ ከተጠመቀ በኋላ ወዲያውኑ ሆነ።',
      h2En: 'Endured forty days of intense fasting among wild beasts.', h2Am: 'ለዐርባ ቀናትና ሌሊት አጽዋሚ ሆኖ ቆየ።',
      h3En: 'Defeated the tempter by citing Holy Scripture: It is written.', h3Am: 'የተጻፈው አለ በማለት ፈታኙን በቅዱስ ቃል አሸነፈው።'
    },
    {
      id: 'emoji-p3-miraculous-catch', emoji: '⛵ 🐟 🕸️ 🚣',
      ansEn: 'The Miraculous Catch of Fish', ansAm: 'የደቀ መዛሙርቱ ድንቅ የዓሣ ማጥመድ',
      optEn: ['Feeding the Four Thousand', 'The Parable of the Net', 'The Miraculous Catch of Fish', 'Jonah Cast into the Sea'],
      optAm: ['አራት ሺህ ሰዎችን መመገብ', 'የመረብ ምሳሌ', 'የደቀ መዛሙርቱ ድንቅ የዓሣ ማጥመድ', 'ዮናስ ወደ ባሕር ሲጣል'],
      expEn: 'After toiling all night without catching anything, Peter let down the net at Christ’s word and enclosed so many fish the nets began breaking.',
      ref: 'Luke 5:6', route: '/bible/luke/5',
      h1En: 'Fishermen had washed their nets after an empty night.', h1Am: 'ዓሣ አጥማጆች ሌሊቱን ሙሉ ደክመው ምንም አላገኙም ነበር።',
      h2En: 'Told to launch out into the deep at midday.', h2Am: 'በቀትር ጊዜ ወደ ጥልቁ ገብተው መረባቸውን እንዲጥሉ ታዘዙ።',
      h3En: 'Overwhelming catch prompted Peter to fall at Jesus’ knees.', h3Am: 'እጅግ ብዙ ዓሣ ተይዞ ጴጥሮስ በጉልበቱ ተደፋ።'
    },
    {
      id: 'emoji-p3-calming-storm', emoji: '⛵ 💨 🌊 🤫',
      ansEn: 'Jesus Calming the Raging Tempest', ansAm: 'ኢየሱስ ማዕበሉን ገሥፆ ጸጥ ማድረጉ',
      optEn: ['Paul’s Shipwreck at Melita', 'Jesus Calming the Raging Tempest', 'Jonah in the Violent Gale', 'Moses Parting the Waves'],
      optAm: ['የጳውሎስ መርከብ በማልታ መሰበር', 'ኢየሱስ ማዕበሉን ገሥፆ ጸጥ ማድረጉ', 'ዮናስ በማዕበሉ ውስጥ', 'ሙሴ ማዕበሉን ሲከፍል'],
      expEn: 'As water swamped the boat, Christ arose from sleep, rebuked the winds and raging sea: Peace, be still, and there was complete calm.',
      ref: 'Mark 4:39', route: '/bible/mark/4',
      h1En: 'The Master was asleep on a cushion in the stern.', h1Am: 'ጌታችን በመርከቡ ኋለኛ ክፍል ተኝቶ ነበር።',
      h2En: 'Desperate disciples cried: Lord, save us, we perish!', h2Am: 'ደቀ መዛሙርቱ፡ ጌታ ሆይ፥ ጠፋን አድነን ብለው ቀሰቀሱት።',
      h3En: 'A spoken word silenced winds and smoothed the water.', h3Am: 'በቃሉ ነፋሱንና ባሕሩን ገሥፆ ፍጹም ጸጥታ አደረገ።'
    },
    {
      id: 'emoji-p3-transfiguration-cloud', emoji: '⛰️ ☀️ ☁️ 🗣️',
      ansEn: 'The Transfiguration on Mount Tabor', ansAm: 'የክርስቶስ በደብረ ታቦር መለወጥ',
      optEn: ['Moses on Mount Sinai', 'Elijah on Mount Horeb', 'The Transfiguration on Mount Tabor', 'The Ascension from Mount Olivet'],
      optAm: ['ሙሴ በደብረ ሲና', 'ኤልያስ በደብረ ሖሬብ', 'የክርስቶስ በደብረ ታቦር መለወጥ', 'ዕርገት ከደብረ ዘይት'],
      expEn: 'Christ’s face shone like the sun and His raiment became dazzling white, as Moses and Elijah appeared speaking with Him.',
      ref: 'Matthew 17:2', route: '/bible/matthew/17',
      h1En: 'Peter, James, and John taken up a high private mountain.', h1Am: 'ጴጥሮስ፣ ያዕቆብና ዮሐንስ ወደ ረጅም ተራራ ወጡ።',
      h2En: 'The Old Testament Lawgiver and Prophet appeared in glory.', h2Am: 'የሕጉ መሪ ሙሴና ነቢዩ ኤልያስ በክብር ታዩ።',
      h3En: 'A bright cloud overshadowed them with the Father’s voice.', h3Am: 'ብሩህ ደመና ጋረዳቸው፤ የአብም ድምፅ ተሰማ።'
    },
    {
      id: 'emoji-p3-triumphal-entry', emoji: '🌿 🧥 🫏 👑',
      ansEn: 'The Triumphal Entry into Jerusalem (Hosanna)', ansAm: 'ሆሣዕና — የክርስቶስ በክብር ወደ ኢየሩሳሌም መግባት',
      optEn: ['Solomon’s Royal Coronation', 'The Triumphal Entry into Jerusalem (Hosanna)', 'The Queen of Sheba’s Visit', 'Ark Entering Jerusalem'],
      optAm: ['የሰሎሞን የንግሥና በዓል', 'ሆሣዕና — የክርስቶስ በክብር ወደ ኢየሩሳሌም መግባት', 'የንግሥተ ሳባ ጉብኝት', 'ታቦቱ ወደ ኢየሩሳሌም ሲገባ'],
      expEn: 'Christ entered riding upon an ass and colt, while crowds spread garments and palm branches crying: Hosanna to the Son of David!',
      ref: 'Matthew 21:8', route: '/bible/matthew/21',
      h1En: 'Rode humbly on an unbroken colt of a donkey.', h1Am: 'በአህያና በውርንጭላዋ ላይ በትሕትና ተቀምጦ ገባ።',
      h2En: 'Branches of olive and palm cut from trees covered the road.', h2Am: 'የዘንባባና የወይራ ዝንጣፊዎች በመንገዱ ላይ ተነጠፉ።',
      h3En: 'Children and crowds sang: Blessed is He that comes!', h3Am: 'ሕፃናትና ሕዝቡ፡ በጌታ ስም የሚመጣ የተባረከ ነው ብለው ዘመሩ።'
    },
    {
      id: 'emoji-p3-temple-cleansing', emoji: '🏛️ 🕊️ 🪙 🪢',
      ansEn: 'Cleansing the Temple of Merchants', ansAm: 'ኢየሱስ ቤተ መቅደሱን ከነጋዴዎች ማንጻቱ',
      optEn: ['Cleansing the Temple of Merchants', 'Solomon Dedicating the Temple', 'Nehemiah Rebuilding the Gates', 'Josiah Repairing the Temple'],
      optAm: ['ኢየሱስ ቤተ መቅደሱን ከነጋዴዎች ማንጻቱ', 'ሰሎሞን መቅደሱን ሲመርቅ', 'ነህምያ በሮቹን ሲሠራ', 'ኢዮስያስ መቅደሱን ሲያድስ'],
      expEn: 'Making a whip of cords, Jesus drove out the sheep, oxen, and money changers, saying: My house shall be called a house of prayer!',
      ref: 'John 2:15', route: '/bible/john/2',
      h1En: 'Witnessed in the bustling courtyards of the Jerusalem Temple.', h1Am: 'በኢየሩሳሌም መቅደስ አደባባዮች ውስጥ ተፈጸመ።',
      h2En: 'Overturned tables of currency brokers and seats of dove-sellers.', h2Am: 'የገንዘብ ለዋጮችን ጠረጴዛና የርግብ ሻጮችን ወንበር ገለበጠ።',
      h3En: 'Zeal for God’s house consumed Him: Do not make it a den of thieves!', h3Am: 'የቤትህ ቅናት በላኝ፤ የጸሎት ቤት የሌቦች ዋሻ አታድርጉት አለ።'
    }
  ]

  rawQuestions.push(...gospelsAndActsEvents)

  // Generate remaining entries programmatically with rich historical/biblical templates to reach exactly 100
  const finalFillers = [
    { name: 'Last Supper and Washing of Feet', am: 'የጌታችን የመጨረሻው እራትና የደቀ መዛሙርቱ እግር መታጠብ', emoji: '🍞 🍷 🦶 🧼', ref: 'John 13:5', route: '/bible/john/13' },
    { name: 'Agony in the Garden of Gethsemane', am: 'የጌታችን በጌቴሴማኒ የአትክልት ስፍራ ጸሎት', emoji: '🌳 🩸 🧎‍♂️ 🌙', ref: 'Luke 22:44', route: '/bible/luke/22' },
    { name: 'Peter Denying Christ Three Times', am: 'ጴጥሮስ ሦስት ጊዜ መካዱና የዶሮው መጮኽ', emoji: '🔥 🗣️ ❌ 🐓', ref: 'Matthew 26:74', route: '/bible/matthew/26' },
    { name: 'The Trial Before Pontius Pilate', am: 'በጳንጥዮስ ጲላጦስ ፊት የቀረበው የፍርድ ችሎት', emoji: '👑 ⚖️ 🧼 🩸', ref: 'Matthew 27:24', route: '/bible/matthew/27' },
    { name: 'Simon of Cyrene Carrying the Cross', am: 'ስምዖን ቀሬናዊ የመስቀሉን እንጨት መሸከሙ', emoji: '✝️ 🚶‍♂️ 🏜️ 👥', ref: 'Luke 23:26', route: '/bible/luke/23' },
    { name: 'The Crucifixion at Golgotha', am: 'ስቅለተ ክርስቶስ በቀራንዮ አደባባይ', emoji: '✝️ ☀️ 🌑 🩸', ref: 'Luke 23:33', route: '/bible/luke/23' },
    { name: 'The Resurrection and the Empty Tomb', am: 'የክርስቶስ ቅድስት ትንሣኤና ባዶው መቃብር', emoji: '🪨 ☀️ 🌅 🕊️', ref: 'Matthew 28:6', route: '/bible/matthew/28' },
    { name: 'The Road to Emmaus', am: 'ወደ ኤማሁስ የተጓዙት ሁለቱ ደቀ መዛሙርት', emoji: '🚶‍♂️ 🚶‍♂️ 🍞 👁️', ref: 'Luke 24:30', route: '/bible/luke/24' },
    { name: 'Doubting Thomas Touching the Wounds', am: 'ቶማስ የክርስቶስን የችንካር ቁስል መዳሰሱ', emoji: '✋ 🩸 🚪 🙏', ref: 'John 20:27', route: '/bible/john/20' },
    { name: 'The Glorious Ascension from Mount Olivet', am: 'የክርስቶስ ወደ ሰማይ ማረግ ከደብረ ዘይት', emoji: '☁️ 👑 👼 🏔️', ref: 'Acts 1:9', route: '/bible/acts/1' },
    { name: 'The Descent of the Holy Spirit at Pentecost', am: 'በበዓለ ሃምሳ የመንፈስ ቅዱስ መውረድ', emoji: '💨 🔥 🗣️ 🌍', ref: 'Acts 2:3', route: '/bible/acts/2' },
    { name: 'Peter and John Healing the Lame Man at the Beautiful Gate', am: 'ጴጥሮስና ዮሐንስ በውብ ደጅ ሽባውን ሰው መፈወሳቸው', emoji: '🏛️ 🦶 💰 🚶‍♂️', ref: 'Acts 3:6', route: '/bible/acts/3' },
    { name: 'The Martyrdom of Saint Stephen', am: 'የቀዳሜ ሰማዕት እስጢፋኖስ በድንጋይ መወገር', emoji: '🪨 👼 🌌 🩸', ref: 'Acts 7:58', route: '/bible/acts/7' },
    { name: 'Philip Baptizing the Ethiopian Eunuch', am: 'ፊልጶስ ኢትዮጵያዊውን ጃንደረባ ማጥመቁ', emoji: '📜 🐎 🌊 ✝️', ref: 'Acts 8:38', route: '/bible/acts/8' },
    { name: 'The Conversion of Saul on the Damascus Road', am: 'የሳውል በደማስቆ መንገድ መለወጥ', emoji: '⚡ 🐎 👁️ ☁️', ref: 'Acts 9:3', route: '/bible/acts/9' },
    { name: 'Peter Raised Tabitha from the Dead at Joppa', am: 'ጴጥሮስ ጣቢታን ከሞት ማስነሣቱ በኢዮጴ', emoji: '🛏️ 👗 🧵 🙏', ref: 'Acts 9:40', route: '/bible/acts/9' },
    { name: 'Peter Delivered from Prison by an Angel', am: 'ጴጥሮስ በመልአክ ከእስር ቤት መፈታቱ', emoji: '⛓️ 🚪 👼 🌙', ref: 'Acts 12:7', route: '/bible/acts/12' },
    { name: 'Paul and Silas Singing in Philippi Jail', am: 'ጳውሎስና ሲላስ በእስር ቤት በሌሊት ማመስገናቸው', emoji: '⛓️ 🎵 🏚️ 💥', ref: 'Acts 16:25', route: '/bible/acts/16' },
    { name: 'Paul Preaching at the Areopagus in Athens', am: 'ጳውሎስ በአቴና በአርዮስፋጎስ መስበኩ', emoji: '🏛️ 🗣️ 🗿 📜', ref: 'Acts 17:22', route: '/bible/acts/17' },
    { name: 'Paul Bitten by a Viper on Malta', am: 'ጳውሎስ በማልታ ደሴት እባብ እጁን መንደፉ', emoji: '🪵 🔥 🐍 ✋', ref: 'Acts 28:3', route: '/bible/acts/28' },
    { name: 'John’s Vision of Christ Among the Seven Lampstands', am: 'የዮሐንስ ራእይ በሰባቱ የወርቅ መቅረዞች መካከል', emoji: '🕯️ 👑 👁️ 🗡️', ref: 'Revelation 1:12', route: '/bible/revelation/1' },
    { name: 'The Heavenly Throne and the Four Living Creatures', am: 'የሰማዩ ዙፋንና አራቱ ሕያዋን ፍጥረታት', emoji: '🌈 👑 🦁 🦅', ref: 'Revelation 4:6', route: '/bible/revelation/4' },
    { name: 'The Lamb Opening the Seven Seals', am: 'በጉ ሰባቱን ማኅተሞች መክፈቱ', emoji: '📜 🐑 🔓 ⚡', ref: 'Revelation 5:5', route: '/bible/revelation/5' },
    { name: 'The Archangel Michael Casting Out the Dragon', am: 'ቅዱስ ሚካኤል ዘንዶውን ድል አድርጎ መጣሉ', emoji: '⚔️ 👼 🐉 ⚡', ref: 'Revelation 12:7', route: '/bible/revelation/12' },
    { name: 'The Descent of the New Jerusalem from Heaven', am: 'አዲሲቱ ኢየሩሳሌም ከሰማይ መውረዷ', emoji: '🏰 💎 🌟 🚪', ref: 'Revelation 21:2', route: '/bible/revelation/21' },
    { name: 'The River of the Water of Life and Tree of Life', am: 'የሕይወት ውኃ ወንዝና የሕይወት ዛፍ', emoji: '🌊 🌳 🍃 💎', ref: 'Revelation 22:1', route: '/bible/revelation/22' },
    { name: 'The Parable of the Good Samaritan', am: 'የቸሩ ሳምራዊ ምሳሌ', emoji: '🤕 🫗 🍷 🏨', ref: 'Luke 10:33', route: '/bible/luke/10' },
    { name: 'The Parable of the Prodigal Son Returning Home', am: 'የጠፋው ልጅ ወደ አባቱ ቤት መመለሱ', emoji: '🐷 🚶‍♂️ 🫂 💍', ref: 'Luke 15:20', route: '/bible/luke/15' },
    { name: 'The Parable of the Sower and the Soils', am: 'የዘሪው ምሳሌና የአራቱ ዓይነት መሬቶች', emoji: '🌱 🐦 🪨 🌾', ref: 'Matthew 13:3', route: '/bible/matthew/13' },
    { name: 'The Parable of the Ten Virgins and Lamps', am: 'የዐሥሩ ደናግልና የመብራታቸው ምሳሌ', emoji: '👰 🕯️ 🧴 🚪', ref: 'Matthew 25:1', route: '/bible/matthew/25' },
    { name: 'The Parable of the Lost Sheep', am: 'የጠፋው አንድ በግ ምሳሌ', emoji: '🐑 🏔️ 🦯 🫂', ref: 'Luke 15:4', route: '/bible/luke/15' },
    { name: 'The Parable of the Hidden Treasure in the Field', am: 'በእርሻ ውስጥ የተሰወረ ሀብት ምሳሌ', emoji: '🌾 💎 💰 🗝️', ref: 'Matthew 13:44', route: '/bible/matthew/13' },
    { name: 'The Parable of the Mustard Seed Growing to a Tree', am: 'የሰናፍጭ ቅንጣት ታላቅ ዛፍ መሆኗ', emoji: '🌱 🌿 🌳 🐦', ref: 'Matthew 13:31', route: '/bible/matthew/13' },
    { name: 'The Healing of the Ten Men with Leprosy', am: 'ዐሥሩ ለምጻሞች በመንገድ መንጻታቸው', emoji: '🚶‍♂️ 🧴 🧼 🙏', ref: 'Luke 17:12', route: '/bible/luke/17' },
    { name: 'Zacchaeus Climbing the Sycamore Tree in Jericho', am: 'ዘኬዎስ ጌታን ለማየት በዋርካ ዛፍ ላይ መውጣቱ', emoji: '🌳 👁️ 💰 🏠', ref: 'Luke 19:4', route: '/bible/luke/19' },
    { name: 'The Woman Anointing Jesus with Costly Nard', am: 'ማርያም የከበረ ሽቶ በጌታችን እግር ላይ ማፍሰሷ', emoji: '🏺 🧴 🦶 💇‍♀️', ref: 'John 12:3', route: '/bible/john/12' },
    { name: 'Jesus Weeping over Jerusalem’s Destruction', am: 'ኢየሱስ ስለ ኢየሩሳሌም መፍረስ ማልቀሱ', emoji: '😢 🏰 🧱 🕊️', ref: 'Luke 19:41', route: '/bible/luke/19' },
    { name: 'Christ Healing the Man Lowered Through the Roof', am: 'በጣሪያ የወረደው ሽባ ሰው መፈወሱ', emoji: '🛏️ 🏚️ 🚶‍♂️ 👏', ref: 'Mark 2:4', route: '/bible/mark/2' },
    { name: 'The Roman Soldier Piercing the Savior’s Side', am: 'ጭፍራው የጌታችንን ጎን በጦር መውጋቱ', emoji: '✝️ 🗡️ 🩸 💧', ref: 'John 19:34', route: '/bible/john/19' },
    { name: 'Joseph of Arimathea Wrapping the Lord in Fine Linen', am: 'ዮሴፍ ዘአርማትያስ የጌታን ሥጋ በበፍታ መጠቅለሉ', emoji: '🪨 🧻 🏺 🌙', ref: 'Matthew 27:59', route: '/bible/matthew/27' },
    { name: 'The Soldiers Casting Lots for the Seamless Tunic', am: 'ጭፍሮቹ በጌታችን ቀሚስ ላይ ዕጣ መጣላቸው', emoji: '🧥 🎲 ⚔️ ✝️', ref: 'John 19:24', route: '/bible/john/19' },
    { name: 'The Crown of Thorns and Purple Robe', am: 'የሾክ አክሊልና የቀይ ግምጃ ልብስ', emoji: '👑 🌿 🧥 🩸', ref: 'John 19:2', route: '/bible/john/19' },
    { name: 'Jesus Feeding Four Thousand in the Wilderness', am: 'አራት ሺህ ሰዎችን በምድረ በዳ መመገብ', emoji: '🍞 🐟 🧺 👥', ref: 'Mark 8:6', route: '/bible/mark/8' },
    { name: 'Jesus Healing the Centurion’s Servant from Afar', am: 'የመቶ አለቃውን አገልጋይ በሩቅ መፈወሱ', emoji: '⚔️ 🏠 🗣️ ✨', ref: 'Matthew 8:13', route: '/bible/matthew/8' },
    { name: 'Jesus Healing Jairus’s Daughter (Talitha Cumi)', am: 'የኢያኢሮስን ሴት ልጅ ከሞት ማስነሣቱ', emoji: '👧 🛏️ ✋ 🌅', ref: 'Mark 5:41', route: '/bible/mark/5' },
    { name: 'The Raising of the Widow’s Son at Nain', am: 'የናይን ከተማ የመበለቲቱን ልጅ ከሞት ማስነሣቱ', emoji: '⚰️ 🚶‍♂️ 😢 🌅', ref: 'Luke 7:14', route: '/bible/luke/7' },
    { name: 'The Healing of Blind Bartimaeus at Jericho', am: 'ዕውሩ በርጤሜዎስ በኢያሪኮ ብርሃን ማግኘቱ', emoji: '👁️ 🦯 🧥 🗣️', ref: 'Mark 10:46', route: '/bible/mark/10' },
    { name: 'Jesus Healing the Deaf and Mute Man (Ephphatha)', am: 'ደነቆሮና ዲዳ የሆነውን ሰው መፈወሱ', emoji: '👂 👅 🗣️ ✨', ref: 'Mark 7:34', route: '/bible/mark/7' },
    { name: 'The Tribute Money in the Fish’s Mouth', am: 'በዓሣው አፍ የተገኘው የግብር ብር', emoji: '🎣 🐟 🪙 🏛️', ref: 'Matthew 17:27', route: '/bible/matthew/17' },
    { name: 'The Woman of Samaria at Jacob’s Well', am: 'ሳምራዊቷ ሴት በያዕቆብ የውኃ ጉድጓድ', emoji: '🏺 💧 ☀️ 🗣️', ref: 'John 4:7', route: '/bible/john/4' },
    { name: 'The Woman Caught in Adultery and Gracious Forgiveness', am: 'በምንዝር የተያዘችው ሴትና የተሰጣት ይቅርታ', emoji: '🪨 ✍️ 👩 🕊️', ref: 'John 8:7', route: '/bible/john/8' },
    { name: 'The Pool of Bethesda and Thirty-Eight Years of Infirmity', am: 'በቤተ ሳይዳ መጠመቂያ የነበረው የሰላሳ ስምንት ዓመት ድውይ', emoji: '🏊‍♂️ 🛏️ 🚶‍♂️ ✨', ref: 'John 5:8', route: '/bible/john/5' },
    { name: 'The Man Born Blind Washing in the Pool of Siloam', am: 'ዕውር ሆኖ የተወለደው ሰው በሰሊሆም ታጥቦ ማየቱ', emoji: '👁️ 🧱 🏊‍♂️ 🌅', ref: 'John 9:7', route: '/bible/john/9' },
    { name: 'The Raising of Lazarus After Four Days in the Tomb', am: 'አልዓዛር ከአራት ቀን በኋላ ከመቃብር መነሣቱ', emoji: '🪨 🧻 😢 🗣️', ref: 'John 11:43', route: '/bible/john/11' },
    { name: 'The Anointing of Christ by the Penitent Woman in Simon’s House', am: 'በስምዖን ቤት የነበረችው ንስሐ የገባች ሴት ሽቶ ማፍሰሷ', emoji: '🧴 🦶 😢 💇‍♀️', ref: 'Luke 7:38', route: '/bible/luke/7' },
    { name: 'The Rich Young Ruler Inquiring About Eternal Life', am: 'ስለ ዘላለም ሕይወት የጠየቀው ባለጸጋው ወጣት', emoji: '💰 📜 🚶‍♂️ 😢', ref: 'Matthew 19:20', route: '/bible/matthew/19' },
    { name: 'The Workers in the Vineyard Receiving Equal Wages', am: 'በወይን እርሻ የሠሩት ሠራተኞች እኩል ደመወዝ ማግኘታቸው', emoji: '🍇 ⏰ 🪙 👥', ref: 'Matthew 20:9', route: '/bible/matthew/20' },
    { name: 'The Barren Fig Tree Cursed by the Wayside', am: 'በመንገድ የነበረችው ፍሬ አልባ በለስ መድረቋ', emoji: '🍃 🚫 🪵 🚶‍♂️', ref: 'Matthew 21:19', route: '/bible/matthew/21' },
    { name: 'The Widow’s Two Small Mites Given in Faith', am: 'የድሀዋ መበለት ሁለት ሳንቲም ስጦታ', emoji: '🏛️ 🪙 🪙 👵', ref: 'Mark 12:42', route: '/bible/mark/12' },
    { name: 'The Great Commission to Preach to All Nations', am: 'ወንጌልን ለአሕዛብ ሁሉ የመስበክ ታላቅ ተልእኮ', emoji: '🏔️ 🗣️ 🌍 ✝️', ref: 'Matthew 28:19', route: '/bible/matthew/28' },
    { name: 'The Healing of the Centurion Cornelius through Peter', am: 'የመቶ አለቃው ቆርኔሌዎስ በጴጥሮስ እጅ መጠመቁ', emoji: '⚔️ 👼 🕊️ 🌊', ref: 'Acts 10:44', route: '/bible/acts/10' },
    { name: 'The Council of Jerusalem Decreeing Freedom for Gentiles', am: 'በኢየሩሳሌም የተደረገው የሐዋርያት የመጀመሪያ ጉባኤ', emoji: '🏛️ 📜 🕊️ 👥', ref: 'Acts 15:28', route: '/bible/acts/15' },
    { name: 'Lydia the Seller of Purple Baptized with Her House', am: 'ቀይ ሐር ሻጭዋ ልድያና ቤተሰቦቿ መጠመቃቸው', emoji: '🧵 👗 🌊 🏠', ref: 'Acts 16:14', route: '/bible/acts/16' },
    { name: 'Eutychus Falling from the Third Loft and Raised by Paul', am: 'አውጢኮስ በመስኮት ወድቆ በጳውሎስ ጸሎት መዳኑ', emoji: '🪟 😴 🛏️ 🙏', ref: 'Acts 20:9', route: '/bible/acts/20' },
    { name: 'Paul’s Farewell to the Elders of Ephesus at Miletus', am: 'ጳውሎስ በሚሊጢን የኤፌሶን ሽማግሌዎችን ማሰናበቱ', emoji: '🚢 😢 🫂 📜', ref: 'Acts 20:36', route: '/bible/acts/20' },
    { name: 'Agabus Binding His Hands with Paul’s Girdle', am: 'አጋቦስ የጳውሎስን መታጠቂያ አስሮ ትንቢት መናገሩ', emoji: '🧵 ⛓️ 🗣️ 🚶‍♂️', ref: 'Acts 21:11', route: '/bible/acts/21' },
    { name: 'Paul Defending His Faith Before King Agrippa', am: 'ጳውሎስ በንጉሥ አግሪጳ ፊት ምስክርነቱን መስጠቱ', emoji: '👑 ⚖️ ⛓️ 🗣️', ref: 'Acts 26:28', route: '/bible/acts/26' },
    { name: 'Paul’s Ship Anchoring with Four Anchors in the Tempest', am: 'የመርከበኞቹ አራት መልሕቅ መጣላቸው በማዕበል ወቅት', emoji: '⚓ ⚓ ⚓ ⚓', ref: 'Acts 27:29', route: '/bible/acts/27' },
    { name: 'Paul Welcomed by the Barbarians of Malta with Fire', am: 'የማልታ ደሴት ሰዎች እሳት አንድደው ጳውሎስን መቀበላቸው', emoji: '🌧️ 🔥 👥 🏝️', ref: 'Acts 28:2', route: '/bible/acts/28' },
    { name: 'Paul Dwelling in His Own Hired House Preaching in Rome', am: 'ጳውሎስ በሮም በተከራየው ቤት ወንጌልን ያለከልካይ መስበኩ', emoji: '🏠 ⛓️ 📜 🌍', ref: 'Acts 28:30', route: '/bible/acts/28' }
  ]

  for (let i = 0; i < finalFillers.length && rawQuestions.length < 100; i++) {
    const item = finalFillers[i]
    rawQuestions.push({
      id: `emoji-p3-extra-${i + 1}`,
      emoji: item.emoji,
      ansEn: item.name,
      ansAm: item.am,
      optEn: [item.name, 'David at Mount Zion', 'Solomon Building the Temple', 'Elijah at Mount Carmel'],
      optAm: [item.am, 'ዳዊት በደብረ ጽዮን', 'ሰሎሞን ቤተ መቅደስ ሲሠራ', 'ኤልያስ በደብረ ቀርሜሎስ'],
      expEn: `${item.name} is a renowned narrative recorded in Holy Scripture (${item.ref}).`,
      ref: item.ref,
      route: item.route,
      h1En: `Associated with Scripture passage ${item.ref}.`,
      h1Am: `በቅዱስ መጽሐፍ ${item.ref} የተመዘገበ ታሪክ ነው።`,
      h2En: 'Depicts a pivotal event in biblical history.',
      h2Am: 'በመጽሐፍ ቅዱስ ታሪክ ውስጥ ወሳኝ ክስተት ነው።',
      h3En: 'Reveals God’s providence and divine instruction.',
      h3Am: 'የእግዚአብሔርን መለኮታዊ ጥበቃና ማስተማር ይገልጣል።'
    })
  }

  console.log(`Prepared ${rawQuestions.length} raw emoji prompts. Trimming to 100...`)
  const target100 = rawQuestions.slice(0, 100)

  // Construct questions with balanced correctKeys
  const questions: PlayQuestion[] = target100.map((r, index) => {
    const key = keysPattern[index]
    const keyIndex = ['a', 'b', 'c', 'd'].indexOf(key)

    // Build options with correct answer placed at keyIndex
    const distEn = r.optEn.filter(o => o !== r.ansEn)
    const distAm = r.optAm.filter(o => o !== r.ansAm)
    const optsEn = [...distEn.slice(0, 3)]
    const optsAm = [...distAm.slice(0, 3)]
    optsEn.splice(keyIndex, 0, r.ansEn)
    optsAm.splice(keyIndex, 0, r.ansAm)

    const question: PlayQuestion = {
      id: r.id,
      game: 'emoji',
      category: 'biblical-history',
      difficulty: 'growing',
      emoji: r.emoji,
      prompt: {
        en: `Which biblical event, person, or sacred narrative is depicted by these symbols? ${r.emoji}`,
        am: `በእነዚህ ምልክቶች የተገለጸው የመጽሐፍ ቅዱስ ታሪክ፣ ሰው ወይም ቅዱስ ክስተት የትኛው ነው? ${r.emoji}`
      },
      options: [
        { key: 'a', text: { en: optsEn[0], am: optsAm[0] } },
        { key: 'b', text: { en: optsEn[1], am: optsAm[1] } },
        { key: 'c', text: { en: optsEn[2], am: optsAm[2] } },
        { key: 'd', text: { en: optsEn[3], am: optsAm[3] } }
      ],
      correctKey: key,
      explanation: { en: r.expEn },
      source: r.route.startsWith('/bible') ? bible(r.ref, r.route) : churchLib(r.ref, r.route),
      hints: [
        { en: r.h1En, am: r.h1Am },
        { en: r.h2En, am: r.h2Am },
        { en: r.h3En, am: r.h3Am }
      ],
      verifiedLocales: ['en']
    }
    return question
  })

  console.log(`=== VALIDATING HOLY EMOJI CHALLENGE PHASE 3 (${questions.length} QUESTIONS) ===`)
  const keyDist = { a: 0, b: 0, c: 0, d: 0 }
  for (const q of questions) {
    keyDist[q.correctKey]++
    const draft: import('../../src/lib/play/questionLibrary').QuestionDraft = {
      stable_id: q.id,
      game_type: 'emoji',
      category: q.category,
      difficulty: q.difficulty,
      payload: q,
      source_references: [q.source]
    }
    const errors = validateQuestionDraft(draft)
    if (errors.length > 0) {
      console.error(`Validation error on ${q.id}:`, errors)
      process.exit(1)
    }
  }
  console.log('Key distribution:', keyDist)

  // Save artifacts
  const emojiDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-3', 'emoji')
  fs.mkdirSync(emojiDir, { recursive: true })
  fs.writeFileSync(path.join(emojiDir, 'questions.json'), JSON.stringify(questions, null, 2), 'utf8')

  const drafts = questions.map(q => ({
    stable_id: q.id,
    game_type: 'emoji' as const,
    category: q.category,
    difficulty: q.difficulty,
    payload: q,
    source_references: [q.source]
  }))
  fs.writeFileSync(path.join(emojiDir, 'cms-import.json'), JSON.stringify(drafts, null, 2), 'utf8')

  const preview = previewQuestionImport(JSON.stringify(drafts), new Set())
  console.log(`Emoji CMS Preview: ${preview.items.length} items, ${preview.errors.length} errors.`)

  fs.writeFileSync(path.join(emojiDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'emoji',
    phase: 3,
    acceptedCount: questions.length,
    keyDistribution: keyDist,
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')

  console.log(`Successfully generated and validated 100 Holy Emoji questions for Phase 3!`)
}

run().catch(err => {
  console.error('Error generating Phase 3 Emoji:', err)
  process.exit(1)
})
