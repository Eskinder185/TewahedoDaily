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

  const emojiQuestions: PlayQuestion[] = [
    // 0: emoji-creation -> a
    {
      id: 'emoji-creation',
      game: 'emoji',
      category: 'Creation',
      difficulty: 'beginner',
      emoji: '🌌 ☀️ 🌙 🌿 🐋 👤',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'The Six Days of Creation', am: 'ስድስቱ ቀናት የፍጥረት ሥራ' } },
        { key: 'b', text: { en: 'The Tower of Babel', am: 'የባቢሎን ግንብ ሥራ' } },
        { key: 'c', text: { en: 'The Flood of Noah', am: 'የኖኅ የጥፋት ውኃ' } },
        { key: 'd', text: { en: 'The Exodus from Egypt', am: 'ከግብፅ የወጣው ጉዞ' } },
      ],
      correctKey: 'a',
      hints: [
        { en: 'It describes how the heavens and earth and living creatures were formed.', am: 'ሰማይና ምድር እንዲሁም ሕያዋን ፍጥረታት እንዴት እንደተፈጠሩ ይገልጻል።' },
        { en: 'God pronounced all things very good on the sixth day.', am: 'እግዚአብሔር በስድስተኛው ቀን የሠራውን ሁሉ እጅግ መልካም እንደሆነ አየ።' },
        { en: 'Read Genesis 1.', am: 'ኦሪት ዘፍጥረት ምዕራፍ 1ን ያንብቡ።' },
      ],
      explanation: {
        en: 'Genesis 1 records the creation of light, luminaries, plants, sea creatures, and man in God’s image.',
        am: 'በኦሪት ዘፍጥረት ምዕራፍ 1 ብርሃን፥ ፀሐይና ጨረቃ፥ ዕፅዋት፥ የባሕር ፍጥረታትና ሰው መፈጠራቸው ተመዝግቧል።',
      },
      source: { label: 'Genesis 1:31', route: '/bible/genesis/1', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 1: emoji-burning-bush -> b
    {
      id: 'emoji-burning-bush',
      game: 'emoji',
      category: 'Exodus',
      difficulty: 'beginner',
      emoji: '🏔️ 🥾 🪵 🔥 🗣️',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'Elijah on Mount Carmel', am: 'ኤልያስ በደብረ ቀርሜሎስ' } },
        { key: 'b', text: { en: 'The Burning Bush at Mount Horeb', am: 'በደብረ ኮሬብ የሚነደው ቍጥቋጦ' } },
        { key: 'c', text: { en: 'The Giving of the Law on Sinai', am: 'በሲና ሕጉ መሰጠቱ' } },
        { key: 'd', text: { en: 'The Waters of Marah', am: 'የመራ ውኃ መጣፈጥ' } },
      ],
      correctKey: 'b',
      hints: [
        { en: 'A bush was burning with fire yet was not consumed.', am: 'ቍጥቋጦው በእሳት ሲነድድ አልተቃጠለም ነበር።' },
        { en: 'Moses was commanded to remove his shoes because the ground was holy.', am: 'ስፍራው ቅዱስ መሬት ስለሆነ ሙሴ ጫማውን እንዲያወልቅ ታዘዘ።' },
        { en: 'Read Exodus 3.', am: 'ኦሪት ዘጸአት ምዕራፍ 3ን ያንብቡ።' },
      ],
      explanation: {
        en: 'Exodus 3:2 records the angel of the Lord appearing to Moses in a flame of fire out of the midst of a bush.',
        am: 'በኦሪት ዘጸአት 3፥2 የእግዚአብሔር መልአክ በእሳት ነበልባል በቍጥቋጦ መካከል ለሙሴ ታየው።',
      },
      source: { label: 'Exodus 3:2', route: '/bible/exodus/3', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 2: emoji-manna-wilderness -> c
    {
      id: 'emoji-manna-wilderness',
      game: 'emoji',
      category: 'Exodus',
      difficulty: 'growing',
      emoji: '⛺ 🌅 🍞 🫙 😋',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'The Wedding at Cana', am: 'የቃና ዘገሊላ ሠርግ' } },
        { key: 'b', text: { en: 'Feeding of the Five Thousand', am: 'አምስት ሺህ ሕዝብ መመገብ' } },
        { key: 'c', text: { en: 'Manna Falling from Heaven in the Wilderness', am: 'በምድረ በዳ ከሰማይ የወረደው መና' } },
        { key: 'd', text: { en: 'The Plagues of Egypt', am: 'የግብፅ አሥርቱ መቅሠፍቶች' } },
      ],
      correctKey: 'c',
      hints: [
        { en: 'White bread rained down every morning around the camp.', am: 'በየማለዳው በሰፈሩ ዙሪያ ነጭ እንጀራ ከሰማይ ይዘንብ ነበር።' },
        { en: 'The people asked “What is it?” and gathered it according to their eating.', am: 'ሕዝቡ “ይህ ምንድን ነው?” ብለው እንደየቤታቸው ሰበሰቡት።' },
        { en: 'Read Exodus 16.', am: 'ኦሪት ዘጸአት ምዕራፍ 16ን ያንብቡ።' },
      ],
      explanation: {
        en: 'Exodus 16:15 records God giving bread from heaven in the wilderness for forty years.',
        am: 'በኦሪት ዘጸአት 16፥15 እግዚአብሔር በምድረ በዳ ለአርባ ዓመት የሰማይ እንጀራ መና መገባቸው።',
      },
      source: { label: 'Exodus 16:15', route: '/bible/exodus/16', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 3: emoji-ten-commandments -> d
    {
      id: 'emoji-ten-commandments',
      game: 'emoji',
      category: 'The Law',
      difficulty: 'beginner',
      emoji: '⚡ ☁️ 🏔️ 📜 ✍️',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'David Anointed by Samuel', am: 'ዳዊት በሳሙኤል መቀባቱ' } },
        { key: 'b', text: { en: 'The Dedication of the Temple', am: 'የቤተ መቅደስ ምረቃ' } },
        { key: 'c', text: { en: 'The Vision of Isaiah', am: 'የኢሳይያስ ራእይ' } },
        { key: 'd', text: { en: 'The Giving of the Ten Commandments on Sinai', am: 'በሲና ተራራ አሥርቱ ትእዛዛት መሰጠታቸው' } },
      ],
      correctKey: 'd',
      hints: [
        { en: 'Thunder, lightning, and a thick cloud covered the sacred mountain.', am: 'ነጐድጓድ፥ መብረቅና ጥቅጥቅ ያለ ደመና ቅዱሱን ተራራ ሸፈነው።' },
        { en: 'God inscribed His holy statutes upon two tablets of stone.', am: 'እግዚአብሔር ቅዱሳን ትእዛዛቱን በሁለት የድንጋይ ጽላቶች ላይ ቀረጻቸው።' },
        { en: 'Read Exodus 20.', am: 'ኦሪት ዘጸአት ምዕራፍ 20ን ያንብቡ።' },
      ],
      explanation: {
        en: 'Exodus 20 records the Lord speaking the Ten Commandments to Moses and the assembly of Israel.',
        am: 'በኦሪት ዘጸአት ምዕራፍ 20 እግዚአብሔር አሥርቱን ቃላት ለሙሴና ለእስራኤል ማኅበር ተናገረ።',
      },
      source: { label: 'Exodus 20:1', route: '/bible/exodus/20', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 4: emoji-fall-of-jericho -> a
    {
      id: 'emoji-fall-of-jericho',
      game: 'emoji',
      category: 'Joshua',
      difficulty: 'growing',
      emoji: '🎺 🚶‍♂️ 🧱 💥 🏰',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'The Sounding of Trumpets and Fall of Jericho', am: 'የመለከት ድምፅና የኢያሪኮ ቅጥር መፍረስ' } },
        { key: 'b', text: { en: 'Gideon’s Victory over Midian', am: 'የጌዴዎን በምድያም ላይ ድል' } },
        { key: 'c', text: { en: 'The Ark Entering Jerusalem', am: 'ታቦቱ ወደ ኢየሩሳሌም መግባቱ' } },
        { key: 'd', text: { en: 'Nehemiah Rebuilding the Walls', am: 'ነህምያ ቅጥሩን ማደሱ' } },
      ],
      correctKey: 'a',
      hints: [
        { en: 'Priests carrying seven trumpets of rams’ horns marched around the city.', am: 'የበግ ቀንድ መለከት የያዙ ካህናት በከተማይቱ ዙሪያ ሰልፍ አደረጉ።' },
        { en: 'On the seventh day they shouted, and the massive stone walls collapsed flat.', am: 'በሰባተኛው ቀን እልል አሉ። የከተማይቱም ታላቅ ቅጥር ወደቀ።' },
        { en: 'Read Joshua 6.', am: 'መጽሐፈ ኢያሱ ምዕራፍ 6ን ያንብቡ።' },
      ],
      explanation: {
        en: 'Joshua 6:20 records the priests blowing the trumpets and the wall falling down flat.',
        am: 'በመጽሐፈ ኢያሱ 6፥20 ካህናቱ መለከት ሲነፉና ሕዝቡ ሲጮኽ ቅጥሩ ፈርሶ ወደቀ።',
      },
      source: { label: 'Joshua 6:20', route: '/bible/joshua/6', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 5: emoji-elijah-carmel -> b
    {
      id: 'emoji-elijah-carmel',
      game: 'emoji',
      category: 'Holy Prophets',
      difficulty: 'growing',
      emoji: '⛰️ 🐂 💧 ⚡ 🔥',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'Solomon’s Sacrifice at Gibeon', am: 'የሰሎሞን መሥዋዕት በገባዖን' } },
        { key: 'b', text: { en: 'Elijah’s Sacrifice Consumed by Fire on Carmel', am: 'በቀርሜሎስ ተራራ የኤልያስ መሥዋዕት በእሳት መበላቱ' } },
        { key: 'c', text: { en: 'The Offering of Abel', am: 'የአቤል መሥዋዕት' } },
        { key: 'd', text: { en: 'The Anointing of Jehu', am: 'ኢዩ በንጉሥነት መቀባቱ' } },
      ],
      correctKey: 'b',
      hints: [
        { en: 'Water was poured three times over the altar and trench.', am: 'በመሠዊያውና በጉድጓዱ ላይ ሦስት ጊዜ ውኃ ፈሰሰ።' },
        { en: 'The fire of the Lord fell and consumed the burnt offering and licked up the water.', am: 'የእግዚአብሔር እሳት ወርዳ መሥዋዕቱን በላች፤ ውኃውንም ላሰች።' },
        { en: 'Read 1 Kings 18.', am: '1ኛ ነገሥት ምዕራፍ 18ን ያንብቡ።' },
      ],
      explanation: {
        en: '1 Kings 18:38 records the fire of the Lord falling upon Elijah’s sacrifice on Mount Carmel.',
        am: 'በ1ኛ ነገሥት 18፥38 የእግዚአብሔር እሳት በደብረ ቀርሜሎስ በኤልያስ መሥዋዕት ላይ ወደቀች።',
      },
      source: { label: '1 Kings 18:38', route: '/bible/1-kings/18', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 6: emoji-fiery-chariot -> c
    {
      id: 'emoji-fiery-chariot',
      game: 'emoji',
      category: 'Holy Prophets',
      difficulty: 'growing',
      emoji: '🔥 🐎 🛞 🌪️ ⬆️',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'Pharaoh’s Chariots Drowned in the Sea', am: 'የፈርዖን ሰረገሎች በባሕር መስጠማቸው' } },
        { key: 'b', text: { en: 'The Vision of Zechariah', am: 'የዘካርያስ ራእይ' } },
        { key: 'c', text: { en: 'Elijah Taken up to Heaven in a Fiery Chariot', am: 'ኤልያስ በእሳት ሰረገላ ወደ ሰማይ ማረጉ' } },
        { key: 'd', text: { en: 'Philip and the Ethiopian Eunuch', am: 'ፊልጶስና የኢትዮጵያዊው ጃንደረባ' } },
      ],
      correctKey: 'c',
      hints: [
        { en: 'A chariot of fire and horses of fire parted Elijah and Elisha.', am: 'የእሳት ሰረገላና የእሳት ፈረሶች ኤልያስንና ኤልሳዕን ለዩአቸው።' },
        { en: 'The prophet went up by a whirlwind into heaven while his mantle fell.', am: 'ነቢዩ በዐውሎ ነፋስ ወደ ሰማይ ዐረገ፤ ካባውም ወደቀ።' },
        { en: 'Read 2 Kings 2.', am: '2ኛ ነገሥት ምዕራፍ 2ን ያንብቡ።' },
      ],
      explanation: {
        en: '2 Kings 2:11 records Elijah going up by a whirlwind into heaven in a chariot of fire.',
        am: 'በ2ኛ ነገሥት 2፥11 ኤልያስ በእሳት ሰረገላና በዐውሎ ነፋስ ወደ ሰማይ ዐረገ።',
      },
      source: { label: '2 Kings 2:11', route: '/bible/2-kings/2', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 7: emoji-jonah-great-fish -> d
    {
      id: 'emoji-jonah-great-fish',
      game: 'emoji',
      category: 'Holy Prophets',
      difficulty: 'beginner',
      emoji: '🚢 ⛈️ 🌊 🐋 🏝️',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'Paul Shipwrecked at Malta', am: 'ጳውሎስ በማልታ መርከቡ መሰበሩ' } },
        { key: 'b', text: { en: 'Noah Sailing on the Deep', am: 'ኖኅ በጥልቅ ውኃ ላይ መጓዙ' } },
        { key: 'c', text: { en: 'Christ Sleeping in the Boat', am: 'ጌታችን በታንኳ ውስጥ መተኛቱ' } },
        { key: 'd', text: { en: 'Jonah Swallowed by the Great Fish', am: 'ዮናስ በታላቁ ዓሣ መዋጡ' } },
      ],
      correctKey: 'd',
      hints: [
        { en: 'A fleeing prophet was cast overboard to calm a raging tempest.', am: 'የሚሸሽ ነቢይ ማዕበሉ እንዲቆም ወደ ባሕር ተጣለ።' },
        { en: 'He prayed inside the fish’s belly for three days and three nights.', am: 'ለሦስት ቀንና ለሦስት ሌሊት በዓሣው ሆድ ውስጥ ሆኖ ጸለየ።' },
        { en: 'Read Jonah 1.', am: 'ትንቢተ ዮናስ ምዕራፍ 1ን ያንብቡ።' },
      ],
      explanation: {
        en: 'Jonah 1:17 records the Lord preparing a great fish to swallow up Jonah for three days and nights.',
        am: 'በትንቢተ ዮናስ 1፥17 እግዚአብሔር ዮናስን የሚውጥ ታላቅ ዓሣ አዘጋጀ።',
      },
      source: { label: 'Jonah 1:17', route: '/bible/jonah/1', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 8: emoji-three-holy-children -> a
    {
      id: 'emoji-three-holy-children',
      game: 'emoji',
      category: 'Holy Prophets',
      difficulty: 'growing',
      emoji: '👑 🗿 🔥 3️⃣ 👼',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'The Three Holy Youths in the Fiery Furnace', am: 'ሦስቱ ሕፃናት በእቶን እሳት ውስጥ መዳናቸው' } },
        { key: 'b', text: { en: 'Moses and Aaron before Pharaoh', am: 'ሙሴና አሮን በፈርዖን ፊት' } },
        { key: 'c', text: { en: 'The Stoning of Saint Stephen', am: 'የቅዱስ እስጢፋኖስ በድንጋይ መወገር' } },
        { key: 'd', text: { en: 'The Vision of Patmos', am: 'የፍጥሞ ደሴት ራእይ' } },
      ],
      correctKey: 'a',
      hints: [
        { en: 'They refused to bow down to Nebuchadnezzar’s golden idol.', am: 'ለናቡከደነጾር የወርቅ ምስል አንሰግድም አሉ።' },
        { en: 'A fourth figure resembling the Son of God walked with them unharmed.', am: 'የእግዚአብሔርን ልጅ የሚመስል አራተኛ አካል አብሮአቸው ተመላለሰ።' },
        { en: 'Read Daniel 3.', am: 'ትንቢተ ዳንኤል ምዕራፍ 3ን ያንብቡ።' },
      ],
      explanation: {
        en: 'Daniel 3:25 records the three youths unhurt in the blazing furnace accompanied by an angel.',
        am: 'በትንቢተ ዳንኤል 3፥25 ሦስቱ ሕፃናት በእሳቱ ውስጥ ሳይቃጠሉ መልአኩ አዳናቸው።',
      },
      source: { label: 'Daniel 3:25', route: '/bible/daniel/3', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 9: emoji-annunciation -> b
    {
      id: 'emoji-annunciation',
      game: 'emoji',
      category: 'Gospel Events',
      difficulty: 'beginner',
      emoji: '👼 🕊️ 🌸 👑 🤰',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'The Presentation in the Temple', am: 'ጌታ ወደ ቤተ መቅደስ መግባቱ' } },
        { key: 'b', text: { en: 'The Annunciation to the Holy Virgin Mary', am: 'የቅዱስ ገብርኤል ብሥራት ለእመቤታችን' } },
        { key: 'c', text: { en: 'The Visit to Elizabeth', am: 'ማርያም ኤልሳቤጥን መጎብኘቷ' } },
        { key: 'd', text: { en: 'The Flight into Egypt', am: 'ወደ ግብፅ መሰደድ' } },
      ],
      correctKey: 'b',
      hints: [
        { en: 'Archangel Gabriel was sent from God to Nazareth.', am: 'ቅዱስ ገብርኤል ከእግዚአብሔር ወደ ናዝሬት ተላከ።' },
        { en: 'He declared: “Hail, thou that art highly favoured, the Lord is with thee.”', am: '“ደስ ይበልሽ፥ ጸጋ የሞላብሽ ሆይ፥ ጌታ ከአንቺ ጋር ነው” ብሎ አበሠራት።' },
        { en: 'Read Luke 1.', am: 'የሉቃስ ወንጌል ምዕራፍ 1ን ያንብቡ።' },
      ],
      explanation: {
        en: 'Luke 1:28–31 records the Annunciation of the Savior’s conception to the Virgin Mary.',
        am: 'በሉቃስ 1፥28-31 ቅዱስ ገብርኤል የዓለም መድኃኒት መፀነሱን ለድንግል ማርያም አበሠራት።',
      },
      source: { label: 'Luke 1:28', route: '/bible/luke/1', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 10: emoji-nativity-shepherds -> c
    {
      id: 'emoji-nativity-shepherds',
      game: 'emoji',
      category: 'Gospel Events',
      difficulty: 'beginner',
      emoji: '🌟 🐑 🌙 👼 👶',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'David Anointed Among Sheep', am: 'ዳዊት ከበጎች መካከል መቀባቱ' } },
        { key: 'b', text: { en: 'Jacob at Bethel', am: 'ያዕቆብ በቤቴል' } },
        { key: 'c', text: { en: 'The Angels Announcing Christ’s Birth to Shepherds', am: 'መላእክት ለእረኞች የክርስቶስን ልደት ማብሰራቸው' } },
        { key: 'd', text: { en: 'Peter’s Vision of the Sheet', am: 'የጴጥሮስ የሸማ ራእይ' } },
      ],
      correctKey: 'c',
      hints: [
        { en: 'Night-watch shepherds in Bethlehem fields were surrounded by the glory of the Lord.', am: 'በቤተልሔም ሜዳ ሌሊት በጎቻቸውን የሚጠብቁ እረኞች በጌታ ክብር ተከበቡ።' },
        { en: 'A multitude of the heavenly host praised God singing “Glory to God in the highest.”', am: 'የሰማይ ሠራዊት “ክብር ለእግዚአብሔር በአርያም ይሁን” እያሉ አከበሩ።' },
        { en: 'Read Luke 2.', am: 'የሉቃስ ወንጌል ምዕራፍ 2ን ያንብቡ።' },
      ],
      explanation: {
        en: 'Luke 2:8–14 records angels bringing the good tidings of great joy to the shepherds.',
        am: 'በሉቃስ 2፥8-14 መላእክት የጌታችንን ልደት የምሥራች ለእረኞች አበሠሩ።',
      },
      source: { label: 'Luke 2:8', route: '/bible/luke/2', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 11: emoji-wise-men-star -> d
    {
      id: 'emoji-wise-men-star',
      game: 'emoji',
      category: 'Gospel Events',
      difficulty: 'beginner',
      emoji: '🐪 🌟 👑 🪙 🏺',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'The Queen of Sheba Visiting Solomon', am: 'ንግሥተ ሳባ ሰሎሞንን መጎብኘቷ' } },
        { key: 'b', text: { en: 'Joseph’s Brothers Bringing Gifts', am: 'የዮሴፍ ወንድሞች ስጦታ ማምጣታቸው' } },
        { key: 'c', text: { en: 'The Building of the Tabernacle', am: 'የምስክሩ ድንኳን መሥራት' } },
        { key: 'd', text: { en: 'The Magi Following the Star with Gifts', am: 'ሰብአ ሰገል በኮከብ ተመርተው ስጦታ ማቅረባቸው' } },
      ],
      correctKey: 'd',
      hints: [
        { en: 'Wise men traveled from the East guided by an extraordinary heavenly star.', am: 'ሰብአ ሰገል ከምሥራቅ በድንቅ ኮከብ ተመርተው ተጓዙ።' },
        { en: 'They fell down and worshipped the Young Child, offering gold, frankincense, and myrrh.', am: 'ወድቀው ሰገዱለት፤ ወርቅ፥ ዕጣንና ከርቤም ስጦታ አቀረቡ።' },
        { en: 'Read Matthew 2.', am: 'የማቴዎስ ወንጌል ምዕራፍ 2ን ያንብቡ።' },
      ],
      explanation: {
        en: 'Matthew 2:11 records the wise men opening their treasures and presenting royal gifts to Christ.',
        am: 'በማቴዎስ 2፥11 ሰብአ ሰገል ሣጥኖቻቸውን ከፍተው ወርቅ፥ ዕጣንና ከርቤ አቀረቡለት።',
      },
      source: { label: 'Matthew 2:11', route: '/bible/matthew/2', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 12: emoji-baptism-trinity -> a
    {
      id: 'emoji-baptism-trinity',
      game: 'emoji',
      category: 'Gospel Events',
      difficulty: 'beginner',
      emoji: '🌊 🕊️ 🗣️ ☁️ ✝️',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'The Baptism of Christ in the Jordan River', am: 'የጌታችን በዮርዳኖስ ወንዝ መጠመቅ' } },
        { key: 'b', text: { en: 'The Cleansing of the Leper', am: 'የለምጻሙ ሰው መንጻት' } },
        { key: 'c', text: { en: 'The Pool of Siloam', am: 'የሰሊሆም መጠመቂያ' } },
        { key: 'd', text: { en: 'Peter Baptizing Cornelius', am: 'ጴጥሮስ ቆርኔሌዎስን ማጥመቁ' } },
      ],
      correctKey: 'a',
      hints: [
        { en: 'The Heavens opened over the Jordan as Christ came up from the water.', am: 'ጌታችን ከውኃ ሲወጣ ሰማያት በዮርዳኖስ ላይ ተከፈቱ።' },
        { en: 'The Spirit descended like a dove, and the Father testified from heaven.', am: 'መንፈስ ቅዱስ በርግብ አምሳል ወረደ፤ የአብ ድምፅም ከሰማይ መሰከረ።' },
        { en: 'Read Matthew 3.', am: 'የማቴዎስ ወንጌል ምዕራፍ 3ን ያንብቡ።' },
      ],
      explanation: {
        en: 'Matthew 3:16–17 records the revelation of the Holy Trinity at Christ’s baptism (Epiphany).',
        am: 'በማቴዎስ 3፥16-17 በጌታችን ጥምቀት ጊዜ ቅድስት ሥላሴ በግልጽ ተገለጡ።',
      },
      source: { label: 'Matthew 3:16', route: '/bible/matthew/3', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 13: emoji-calming-storm -> b
    {
      id: 'emoji-calming-storm',
      game: 'emoji',
      category: 'Miracles',
      difficulty: 'beginner',
      emoji: '⛵ 🌊 🌪️ 😴 ✋',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'Paul’s Voyage to Rome', am: 'የጳውሎስ ወደ ሮም ጉዞ' } },
        { key: 'b', text: { en: 'Christ Rebuking the Wind and Calming the Storm', am: 'ጌታችን ማዕበሉን ገሥጾ ባሕሩን ጸጥ ማድረጉ' } },
        { key: 'c', text: { en: 'Jonah Cast into the Sea', am: 'ዮናስ ወደ ባሕር መጣሉ' } },
        { key: 'd', text: { en: 'The Miraculous Catch of Fish', am: 'የተአምራዊው ዓሣ መረብ' } },
      ],
      correctKey: 'b',
      hints: [
        { en: 'A great tempest arose while the Lord was asleep in the stern of the boat.', am: 'ጌታችን በታንኳይቱ ኋላ ተኝቶ ሳለ ታላቅ ማዕበል ተነሣ።' },
        { en: 'He arose, rebuked the wind, and said unto the sea: “Peace, be still.”', am: 'ተነሥቶ ነፋሱን ገሠጸው፤ ባሕሩንም “ዝም በል፥ ጸጥ በል” አለው።' },
        { en: 'Read Mark 4.', am: 'የማርቆስ ወንጌል ምዕራፍ 4ን ያንብቡ።' },
      ],
      explanation: {
        en: 'Mark 4:39 records Christ stilling the wind and sea, demonstrating His sovereign authority over nature.',
        am: 'በማርቆስ 4፥39 ጌታችን ነፋሱንና ባሕሩን ገሥጾ ፍጹም ጸጥታ አደረገ።',
      },
      source: { label: 'Mark 4:39', route: '/bible/mark/4', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 14: emoji-walking-on-water -> c
    {
      id: 'emoji-walking-on-water',
      game: 'emoji',
      category: 'Miracles',
      difficulty: 'growing',
      emoji: '🌙 🌊 🚶‍♂️ ⛵ 🤲',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'Moses Parting the Red Sea', am: 'ሙሴ ቀይ ባሕርን መክፈሉ' } },
        { key: 'b', text: { en: 'Israel Crossing the Jordan', am: 'እስራኤል ዮርዳኖስን መሻገራቸው' } },
        { key: 'c', text: { en: 'Christ Walking on the Water and Saving Peter', am: 'ጌታችን በባሕር ላይ መራመዱና ጴጥሮስን ማዳኑ' } },
        { key: 'd', text: { en: 'The Healing at the Pool of Bethesda', am: 'የቤተሳይዳ ድውይ መፈወሱ' } },
      ],
      correctKey: 'c',
      hints: [
        { en: 'In the fourth watch of the night, Christ walked upon the waves of the sea.', am: 'በሌሊት በአራተኛው ክፍል ጌታችን በባሕሩ ማዕበል ላይ በእግሩ ተራመደ።' },
        { en: 'Peter walked toward Him on the water until fear made him begin to sink.', am: 'ጴጥሮስ በውኃው ላይ ተራምዶ ሊሄድ ሲል በፍርሃት መስጠም ጀመረ።' },
        { en: 'Read Matthew 14.', am: 'የማቴዎስ ወንጌል ምዕራፍ 14ን ያንብቡ።' },
      ],
      explanation: {
        en: 'Matthew 14:29–31 records Peter walking on water and Christ stretching out His hand to catch him.',
        am: 'በማቴዎስ 14፥29-31 ጴጥሮስ በባሕር ላይ ሄደ፤ ሲሰጥምም ጌታችን እጁን ዘርግቶ አዳነው።',
      },
      source: { label: 'Matthew 14:29', route: '/bible/matthew/14', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 15: emoji-transfiguration -> d
    {
      id: 'emoji-transfiguration',
      game: 'emoji',
      category: 'Gospel Events',
      difficulty: 'growing',
      emoji: '⛰️ ☀️ ☁️ 👤 🗣️',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'Moses on Mount Nebo', am: 'ሙሴ በናባው ተራራ' } },
        { key: 'b', text: { en: 'The Ascension from Olivet', am: 'ዕርገት ከደብረ ዘይት' } },
        { key: 'c', text: { en: 'The Agony in Gethsemane', am: 'በጌቴሴማኒ የነበረው ጸሎት' } },
        { key: 'd', text: { en: 'The Transfiguration of Christ on Mount Tabor', am: 'የጌታችን በደብረ ታቦር ክብሩን መግለጡ' } },
      ],
      correctKey: 'd',
      hints: [
        { en: 'The Lord took Peter, James, and John up into a high mountain apart.', am: 'ጌታችን ጴጥሮስን፥ ያዕቆብንና ዮሐንስን ወደ ረጅም ተራራ ይዞአቸው ወጣ።' },
        { en: 'His face shone like the sun, and Moses and Elijah appeared talking with Him.', am: 'ፊቱ እንደ ፀሐይ በራ፤ ሙሴና ኤልያስም አብረውት ሲነጋገሩ ታዩ።' },
        { en: 'Read Matthew 17.', am: 'የማቴዎስ ወንጌል ምዕራፍ 17ን ያንብቡ።' },
      ],
      explanation: {
        en: 'Matthew 17:2 records the Transfiguration of Christ where His divine glory was unveiled on Mount Tabor.',
        am: 'በማቴዎስ 17፥2 ጌታችን በደብረ ታቦር መለኮታዊ ክብሩን ለሐዋርያቱ ገለጠላቸው።',
      },
      source: { label: 'Matthew 17:2', route: '/bible/matthew/17', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 16: emoji-good-shepherd -> a
    {
      id: 'emoji-good-shepherd',
      game: 'emoji',
      category: 'Parables',
      difficulty: 'beginner',
      emoji: '🐑 🌿 🐺 🪵 ✝️',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'The Parable of the Good Shepherd', am: 'የመልካም እረኛ ምሳሌ' } },
        { key: 'b', text: { en: 'The Parable of the Sower', am: 'የዘሪው ምሳሌ' } },
        { key: 'c', text: { en: 'The Parable of the Ten Virgins', am: 'የአሥሩ ደናግል ምሳሌ' } },
        { key: 'd', text: { en: 'The Parable of the Talents', am: 'የመክሊት ምሳሌ' } },
      ],
      correctKey: 'a',
      hints: [
        { en: 'He knows His sheep by name and leads them to good pasture.', am: 'በጎቹን በስማቸው ያውቃቸዋል፤ ወደ በጎ መስክም ይመራቸዋል።' },
        { en: 'Unlike a hireling, He lays down His life to protect the sheep from the wolf.', am: 'እንደ ምንደኛ ሳይሆን ነፍሱን ስለ በጎቹ አሳልፎ ይሰጣል።' },
        { en: 'Read John 10.', am: 'የዮሐንስ ወንጌል ምዕራፍ 10ን ያንብቡ።' },
      ],
      explanation: {
        en: 'John 10:11 declares: “I am the good shepherd: the good shepherd giveth his life for the sheep.”',
        am: 'በዮሐንስ 10፥11 “እኔ መልካም እረኛ ነኝ፤ መልካም እረኛ ነፍሱን ስለ በጎቹ ይሰጣል” ተብሎ ተጽፏል።',
      },
      source: { label: 'John 10:11', route: '/bible/john/10', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 17: emoji-prodigal-son -> b
    {
      id: 'emoji-prodigal-son',
      game: 'emoji',
      category: 'Parables',
      difficulty: 'beginner',
      emoji: '💰 🐖 🚶‍♂️ 🫂 🐂',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'The Rich Man and Lazarus', am: 'የባለጸጋውና የአልዓዛር ታሪክ' } },
        { key: 'b', text: { en: 'The Parable of the Prodigal Son', am: 'የጠፋው ልጅ ምሳሌ' } },
        { key: 'c', text: { en: 'The Parable of the Unmerciful Servant', am: 'የምሕረት የሌለው አገልጋይ' } },
        { key: 'd', text: { en: 'The Parable of the Laborers in the Vineyard', am: 'የወይኑ አትክልት ሠራተኞች' } },
      ],
      correctKey: 'b',
      hints: [
        { en: 'A younger son wasted his inheritance in a far country feeding swine.', am: 'ታናሹ ልጅ ርስቱን በአሕዛብ ሀገር አባክኖ እሪያዎችን ይጠብቅ ነበር።' },
        { en: 'When he repented and returned, his father ran, fell on his neck, and kissed him.', am: 'ተመልሶ ሲመጣ አባቱ ሮጦ አቀፈው፥ ሳመውም፤ የሰባውንም ፍሪዳ አረደለት።' },
        { en: 'Read Luke 15.', am: 'የሉቃስ ወንጌል ምዕራፍ 15ን ያንብቡ።' },
      ],
      explanation: {
        en: 'Luke 15:20 illustrates God’s boundless mercy toward the repentant sinner.',
        am: 'በሉቃስ 15፥20 አባቱ ልጁን በምሕረት ተቀብሎ ታላቅ ደስታ አደረገ።',
      },
      source: { label: 'Luke 15:20', route: '/bible/luke/15', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 18: emoji-holy-resurrection -> c
    {
      id: 'emoji-holy-resurrection',
      game: 'emoji',
      category: 'Gospel Events',
      difficulty: 'beginner',
      emoji: '🪨 🌅 👼 ⛓️ 👑',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'The Raising of Lazarus', am: 'አልዓዛር ከሙታን መነሣቱ' } },
        { key: 'b', text: { en: 'The Burial in Joseph’s Tomb', am: 'በዮሴፍ መቃብር መቀበር' } },
        { key: 'c', text: { en: 'The Holy Resurrection of Jesus Christ', am: 'የጌታችን የኢየሱስ ክርስቶስ የከበረ ትንሣኤ' } },
        { key: 'd', text: { en: 'The Crucifixion on Golgotha', am: 'በጎልጎታ መሰቀል' } },
      ],
      correctKey: 'c',
      hints: [
        { en: 'Early on the first day of the week, the heavy stone was rolled away.', am: 'ከሳምንቱ በመጀመሪያው ቀን ማልዶ ታላቁ ድንጋይ ከመቃብሩ ተንከባለለ።' },
        { en: 'The angel proclaimed to the women: “He is not here: for he is risen.”', am: 'መልአኩ ለሴቶቹ “እንደ ተናገረ ተነሥቷልና በዚህ የለም” አላቸው።' },
        { en: 'Read Matthew 28.', am: 'የማቴዎስ ወንጌል ምዕራፍ 28ን ያንብቡ።' },
      ],
      explanation: {
        en: 'Matthew 28:6 proclaims the triumph of Christ over death on the glorious morning of the Resurrection.',
        am: 'በማቴዎስ 28፥6 ጌታችን ሞትን ድል አድርጎ በታላቅ ክብር ተነሣ።',
      },
      source: { label: 'Matthew 28:6', route: '/bible/matthew/28', kind: 'bible' },
      verifiedLocales: ['en'],
    },

    // 19: emoji-pentecost-tongues -> d
    {
      id: 'emoji-pentecost-tongues',
      game: 'emoji',
      category: 'Apostolic Church',
      difficulty: 'growing',
      emoji: '🏠 💨 🔥 🗣️ 👥',
      prompt: {
        en: 'Which biblical event do these clues represent?',
        am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?',
      },
      options: [
        { key: 'a', text: { en: 'The Council of Jerusalem', am: 'የኢየሩሳሌም ጉባኤ' } },
        { key: 'b', text: { en: 'The Martyrdom of Stephen', am: 'የእስጢፋኖስ ሰማዕትነት' } },
        { key: 'c', text: { en: 'The Healing of the Lame Man', am: 'ሽባው ሰው መፈወሱ' } },
        { key: 'd', text: { en: 'The Descent of the Holy Spirit at Pentecost', am: 'በበዓለ ኀምሳ የመንፈስ ቅዱስ መውረድ' } },
      ],
      correctKey: 'd',
      hints: [
        { en: 'A sound from heaven like a rushing mighty wind filled the whole house.', am: 'እንደሚነጥቅ ዐውሎ ነፋስ ድምፅ ከሰማይ መጥቶ ቤቱን ሞላው።' },
        { en: 'Cloven tongues like as of fire sat upon each of the apostles.', am: 'እንደ እሳት የተከፋፈሉ ልሳኖች ታዩአቸው፤ በየአንዳንዶቻቸውም ላይ ተቀመጡ።' },
        { en: 'Read Acts 2.', am: 'የሐዋርያት ሥራ ምዕራፍ 2ን ያንብቡ።' },
      ],
      explanation: {
        en: 'Acts 2:1–4 records the fulfillment of Christ’s promise as the Holy Spirit descended at Pentecost.',
        am: 'በሐዋርያት ሥራ 2፥1-4 በበዓለ ኀምሳ ቀን መንፈስ ቅዱስ በሐዋርያት ላይ ወረደ።',
      },
      source: { label: 'Acts 2:3', route: '/bible/acts/2', kind: 'bible' },
      verifiedLocales: ['en'],
    },
  ]

  console.log(`=== VALIDATING HOLY EMOJI PILOT (${emojiQuestions.length} QUESTIONS) ===`)

  // Check key distribution
  const counts: Record<string, number> = { a: 0, b: 0, c: 0, d: 0 }
  for (const q of emojiQuestions) {
    counts[q.correctKey]++
  }
  console.log('Emoji key distribution:', counts)
  if (counts.a !== 5 || counts.b !== 5 || counts.c !== 5 || counts.d !== 5) {
    throw new Error('Emoji keys are not balanced (need 5 of each)!')
  }

  const questionDrafts: Array<import('../../src/lib/play/questionLibrary').QuestionDraft> = []

  for (const [index, question] of emojiQuestions.entries()) {
    const studioErrors = validateStudioDraft({ game: 'emoji', content: question })
    if (studioErrors.length > 0) {
      throw new Error(`Emoji ${index + 1} (${question.id}) studio draft validation failed: ${studioErrors.join('; ')}`)
    }

    const qDraft = toQuestionDraft({ game: 'emoji', content: question })
    const draftErrors = validateQuestionDraft(qDraft)
    if (draftErrors.length > 0) {
      throw new Error(`Emoji ${index + 1} (${question.id}) question draft validation failed: ${draftErrors.join('; ')}`)
    }

    questionDrafts.push(qDraft)
  }

  // Preview import check
  const preview = previewQuestionImport(JSON.stringify(questionDrafts), new Set(APPROVED_QUESTIONS.map(q => q.id)))
  console.log(`CMS Import preview: ${preview.items.length} items, ${preview.errors.length} errors.`)
  if (preview.errors.length > 0) {
    throw new Error(`CMS import preview errors: ${preview.errors.join('; ')}`)
  }

  // Write artifacts
  const outDir = join(process.cwd(), 'artifacts/faith-challenges/emoji')
  mkdirSync(outDir, { recursive: true })

  writeFileSync(join(outDir, 'questions.json'), `${JSON.stringify(emojiQuestions, null, 2)}\n`, 'utf8')
  writeFileSync(join(outDir, 'cms-import.json'), `${JSON.stringify(questionDrafts, null, 2)}\n`, 'utf8')
  writeFileSync(join(outDir, 'report.json'), `${JSON.stringify({
    game: 'emoji',
    batch: 'pilot-001',
    count: emojiQuestions.length,
    keyDistribution: counts,
    categories: {
      'Creation': emojiQuestions.filter(q => q.category === 'Creation').length,
      'Exodus': emojiQuestions.filter(q => q.category === 'Exodus').length,
      'The Law': emojiQuestions.filter(q => q.category === 'The Law').length,
      'Joshua': emojiQuestions.filter(q => q.category === 'Joshua').length,
      'Holy Prophets': emojiQuestions.filter(q => q.category === 'Holy Prophets').length,
      'Gospel Events': emojiQuestions.filter(q => q.category === 'Gospel Events').length,
      'Miracles': emojiQuestions.filter(q => q.category === 'Miracles').length,
      'Parables': emojiQuestions.filter(q => q.category === 'Parables').length,
      'Apostolic Church': emojiQuestions.filter(q => q.category === 'Apostolic Church').length,
    },
    validation: {
      validateStudioDraft: 'PASS',
      validateQuestionDraft: 'PASS',
      previewQuestionImport: 'PASS',
      keyBalance: 'PASS',
    },
    generatedAt: new Date().toISOString(),
  }, null, 2)}\n`, 'utf8')

  console.log('Holy Emoji Challenge pilot batch successfully generated, validated, and saved to artifacts/faith-challenges/emoji!')
}

run().catch((err) => {
  console.error(err)
  process.exit(1)
})

