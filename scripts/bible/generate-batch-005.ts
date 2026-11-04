import { readFileSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'
import { validateAmharicQuestionResponse } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { adaptEditorialBatchToCms } from './adapt-drafts-for-cms'
import { previewQuestionImport } from '../../src/lib/play/questionLibrary'
import { runCampaign } from './campaign-orchestrator'

const BATCH_DIR = 'artifacts/faith-challenges/batch-005'
const sourceBatch = JSON.parse(readFileSync(join(BATCH_DIR, 'source-batch.json'), 'utf8'))
const sourceManifest = JSON.parse(readFileSync(join(BATCH_DIR, 'source-manifest.json'), 'utf8'))
const existingPrompts = JSON.parse(readFileSync(join(BATCH_DIR, 'existing-prompts.json'), 'utf8'))
const modelId = 'gemini-2.5-pro'

const questions = [
  // 0: am-genesis-1-5 -> a
  {
    passageId: 'am-genesis-1-5',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘፍጥረት 5፡5 መሠረት አዳም በምድር የኖረበት ዘመን ሁሉ ስንት ዓመት ሆነ?',
      en: 'According to Genesis 5:5, how many years were all the days that Adam lived?',
    },
    options: [
      { key: 'a', text: { am: 'ዘጠኝ መቶ ሠላሳ ዓመት', en: 'nine hundred and thirty years' } },
      { key: 'b', text: { am: 'ሰባት መቶ አርባ ዓመት', en: 'seven hundred and forty years' } },
      { key: 'c', text: { am: 'ስምንት መቶ ሃምሳ ዓመት', en: 'eight hundred and fifty years' } },
      { key: 'd', text: { am: 'አንድ ሺህ ዓመት', en: 'one thousand years' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘፍጥረት 5፡5 “አዳምም የኖረበት ዘመን ሁሉ ዘጠኝ መቶ ሠላሳ ዓመት ሆነ፤ ሞተም” ተብሎ ተመዝግቧል።',
      en: 'Genesis 5:5 records: "And all the days that Adam lived were nine hundred and thirty years: and he died."',
    },
    evidence: {
      verseId: '89c29c43-1146-518e-a3db-bbe0d8a56af3',
      quoteAm: 'ዘጠኝ መቶ ሠላሳ ዓመት',
    },
    excerpt: null,
  },

  // 1: am-leviticus-3-8 -> b
  {
    passageId: 'am-leviticus-3-8',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘሌዋውያን 8፡3 መሠረት እግዚአብሔር ሙሴን ማኅበሩን ሁሉ ወዴት እንዲሰበስባቸው አዘዘው?',
      en: 'According to Leviticus 8:3, where did the LORD command Moses to gather all the congregation together?',
    },
    options: [
      { key: 'a', text: { am: 'ወደ ሲና ተራራ ራስ', en: 'to the top of Mount Sinai' } },
      { key: 'b', text: { am: 'ወደ ምስክሩ ድንኳን ደጃፍ', en: 'unto the door of the tabernacle of the congregation' } },
      { key: 'c', text: { am: 'ወደ ተቀደሰው ሰፈር መሃል', en: 'to the midst of the holy camp' } },
      { key: 'd', text: { am: 'ወደ ካህናቱ መኖሪያ ስፍራ', en: 'to the dwelling place of the priests' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘሌዋውያን 8፡3 ላይ “ማኅበሩንም ሁሉ ወደ ምስክሩ ድንኳን ደጃፍ ሰብስባቸው” በማለት አዘዘ።',
      en: 'Leviticus 8:3 commands: "And gather thou all the congregation together unto the door of the tabernacle of the congregation."',
    },
    evidence: {
      verseId: '2c610309-0ea3-501b-a641-5851a6a6c18f',
      quoteAm: 'ወደ ምስክሩ ድንኳን ደጃፍ',
    },
    excerpt: null,
  },

  // 2: am-joshua-6-5 -> c
  {
    passageId: 'am-joshua-6-5',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ኢያሱ 5፡1 መሠረት እግዚአብሔር የዮርዳኖስን ውኃ እንዳደረቀ በሰሙ ጊዜ በአሞራውያንና በፊኒቃውያን ነገሥታት ላይ ምን ሆነ?',
      en: 'According to Joshua 5:1, what happened to the kings of the Amorites and Phoenicians when they heard that the LORD had dried up the waters of Jordan?',
    },
    options: [
      { key: 'a', text: { am: 'ጦራቸውን አዘጋጁ', en: 'they prepared their weapons' } },
      { key: 'b', text: { am: 'ከተማቸውን በቅጥር አጠነከሩ', en: 'they fortified their cities with walls' } },
      { key: 'c', text: { am: 'ልባቸው ቀለጠ', en: 'their heart melted' } },
      { key: 'd', text: { am: 'ስምምነት ለማድረግ ላኩ', en: 'they sent to make a treaty' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ኢያሱ 5፡1 “እግዚአብሔር ከእስራኤል ልጆች ፊት የዮርዳኖስን ውኃ እስኪሻገሩ ድረስ እንዳደረቀ በሰሙ ጊዜ፥ ልባቸው ቀለጠ” ተብሎ ተጽፏል።',
      en: 'Joshua 5:1 records: "When all the kings heard that the LORD had dried up the waters of Jordan... their heart melted, neither was there spirit in them any more."',
    },
    evidence: {
      verseId: '89f76484-da0f-5e46-ad87-ebde8c1c10c3',
      quoteAm: 'ልባቸው ቀለጠ',
    },
    excerpt: null,
  },

  // 3: am-first-chronicles-13-5 -> d
  {
    passageId: 'am-first-chronicles-13-5',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በ1ኛ ዜና መዋዕል 5፡2 መሠረት ይሁዳ በወንድሞቹ መካከል ቢበረታም በረከቱ ለማን እንደ ነበረ ተመዝግቧል?',
      en: 'According to 1 Chronicles 5:2, although Judah prevailed above his brethren, to whom did the blessing belong?',
    },
    options: [
      { key: 'a', text: { am: 'በረከት ግን ለሌዊ ነበረ', en: 'the blessing was unto Levi' } },
      { key: 'b', text: { am: 'በረከት ግን ለሮቤል ነበረ', en: 'the blessing was unto Reuben' } },
      { key: 'c', text: { am: 'በረከት ግን ለብንያም ነበረ', en: 'the blessing was unto Benjamin' } },
      { key: 'd', text: { am: 'በረከት ግን ለዮሴፍ ነበረ', en: 'the blessing was Joseph’s' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በ1ኛ ዜና መዋዕል 5፡2 “ይሁዳም በወንድሞቹ መካከል በረታ፥ አለቃም ከእርሱ ሆነ፤ በረከት ግን ለዮሴፍ ነበረ” ይላል።',
      en: '1 Chronicles 5:2 states: "For Judah prevailed above his brethren, and of him came the chief ruler; but the birthright was Joseph\'s."',
    },
    evidence: {
      verseId: 'd75bae48-711c-58f0-a07e-005371760be8',
      quoteAm: 'በረከት ግን ለዮሴፍ ነበረ',
    },
    excerpt: null,
  },

  // 4: am-enoch-16-8 -> a
  {
    passageId: 'am-enoch-16-8',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ሄኖክ 8፡1 መሠረት ሄኖክ በመድበራ ተራራ መካከል ወደ የትኛው አቅጣጫ እንደ ሄደ መስክሯል?',
      en: 'According to 1 Enoch 8:1, toward which direction did Enoch go in the midst of the mountain of Madbara?',
    },
    options: [
      { key: 'a', text: { am: 'ወደ ምሥራቅ', en: 'toward the east' } },
      { key: 'b', text: { am: 'ወደ ደቡብ', en: 'toward the south' } },
      { key: 'c', text: { am: 'ወደ ሰሜን', en: 'toward the north' } },
      { key: 'd', text: { am: 'ወደ ጠፈር', en: 'toward the firmament' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ሄኖክ 8፡1 ላይ “ከዚያም በመድበራ ተራራ መካከል ወደ ምሥራቅ ሄድሁ” በማለት የጉዞውን አቅጣጫ ይገልጻል።',
      en: '1 Enoch 8:1 records Enoch’s vision: "And thence I went towards the east in the midst of the mountain of Madbara."',
    },
    evidence: {
      verseId: '43568da5-7d6b-59f0-a67e-5a75b7c2979b',
      quoteAm: 'ወደ ምሥራቅ',
    },
    excerpt: null,
  },

  // 5: am-first-meqabyan-24-5 -> b
  {
    passageId: 'am-first-meqabyan-24-5',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 5፡4 መሠረት እግዚአብሔር የተኰራውን ናቡከደነጾርን ከሰው ለይቶ ወደ ምድረ በዳ ለስንት ዓመት ሰደደው?',
      en: 'According to 1 Meqabyan 5:4, for how many years did God send the proud Nebuchadnezzar into the wilderness away from men?',
    },
    options: [
      { key: 'a', text: { am: 'ሦስት ዓመት', en: 'three years' } },
      { key: 'b', text: { am: 'ሰባት ዓመት', en: 'seven years' } },
      { key: 'c', text: { am: 'ዐሥራ ሁለት ዓመት', en: 'twelve years' } },
      { key: 'd', text: { am: 'አርባ ዓመት', en: 'forty years' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 5፡4 “እግዚአብሔር ከሰው ለይቶ ሰባት ዓመት ወደ ምድረ በዳ ሰደደው፤ የፈጠረውም እግዚአብሔር እንደ ሆነ እስኪያውቅ ድረስ” ይላል።',
      en: '1 Meqabyan 5:4 teaches humility through Nebuchadnezzar’s seven years in the wilderness until he acknowledged the Creator.',
    },
    evidence: {
      verseId: '60e90721-6c22-5ed1-a94a-42ede797e292',
      quoteAm: 'ሰባት ዓመት',
    },
    excerpt: null,
  },

  // 6: am-tegsats-30-5 -> c [finish-the-verse]
  {
    passageId: 'am-tegsats-30-5',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የመጽሐፈ ተግሣጽን ቃል ባዶ ቦታ አሟሉ፦ “ጥበብን በሚወድድ ልጅ ___፤” (ተግሣጽ 5፡3)',
      en: 'Fill in the blank to complete the proverb: "Whoso loveth wisdom ___" (Tegsats 5:3)',
    },
    options: [
      { key: 'a', text: { am: 'ሀብቱ ይበዛል', en: 'his wealth multiplieth' } },
      { key: 'b', text: { am: 'ቤቱ ይከብራል', en: 'his house is honored' } },
      { key: 'c', text: { am: 'አባቱ ደስ ይለዋል', en: 'rejoiceth his father' } },
      { key: 'd', text: { am: 'ክብሩ ይታወቃል', en: 'his glory is known' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ተግሣጽ 5፡3 ላይ “ጥበብን በሚወድድ ልጅ አባቱ ደስ ይለዋል” በማለት የወላጅን ደስታና የጥበብን በረከት ያስተምራል።',
      en: 'Tegsats (Proverbs) 5:3 teaches: "Whoso loveth wisdom rejoiceth his father."',
    },
    evidence: {
      verseId: 'a27efe9d-621b-5d58-a621-35f7f3e4467c',
      quoteAm: 'አባቱ ደስ ይለዋል',
    },
    excerpt: {
      am: 'ጥበብን በሚወድድ ልጅ',
      en: 'Whoso loveth wisdom',
    },
  },

  // 7: am-song-of-songs-33-5 -> d [finish-the-verse]
  {
    passageId: 'am-song-of-songs-33-5',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የመኃልየ መኃልይን ምስጢራዊ ቃል ባዶ ቦታ አሟሉ፦ “እኔ ተኝቼ ነበር፥ ___፤” (መኃልይ 5፡2)',
      en: 'Fill in the blank to complete the verse: "I sleep, but ___" (Song of Songs 5:2)',
    },
    options: [
      { key: 'a', text: { am: 'ነፍሴ ግን ፈራች', en: 'but my soul was afraid' } },
      { key: 'b', text: { am: 'መንፈሴ ግን ተጨነቀ', en: 'but my spirit was troubled' } },
      { key: 'c', text: { am: 'ዐይኔ ግን ታወረች', en: 'but my eye was blinded' } },
      { key: 'd', text: { am: 'ልቤ ግን ነቅታ ነበር', en: 'my heart waketh' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመኃልየ መኃልይ ዘሰሎሞን 5፡2 “እኔ ተኝቼ ነበር፥ ልቤ ግን ነቅታ ነበር” በማለት የመንፈስን ንቃትና ተመስጦ ይገልጻል።',
      en: 'Song of Songs 5:2 declares spiritual vigilance: "I sleep, but my heart waketh."',
    },
    evidence: {
      verseId: 'f4324fc6-da47-5ced-ade9-f54847ac75c4',
      quoteAm: 'ልቤ ግን ነቅታ ነበር',
    },
    excerpt: {
      am: 'እኔ ተኝቼ ነበር፥',
      en: 'I sleep, but',
    },
  },

  // 8: am-hosea-43-5 -> a
  {
    passageId: 'am-hosea-43-5',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በትንቢተ ሆሴዕ 5፡1 መሠረት ካህናትና የንጉሥ ቤት በተዘረጋ አሽክላ የተመሰሉበት በየትኛው ተራራ ላይ እንደ ሆነ ተጠቀሰ?',
      en: 'According to Hosea 5:1, upon which mount were they likened to a net spread?',
    },
    options: [
      { key: 'a', text: { am: 'በታቦርም ላይ', en: 'upon Tabor' } },
      { key: 'b', text: { am: 'በቀርሜሎስም ላይ', en: 'upon Carmel' } },
      { key: 'c', text: { am: 'በደብረ ዘይትም ላይ', en: 'upon the Mount of Olives' } },
      { key: 'd', text: { am: 'በሄርሞንም ላይ', en: 'upon Hermon' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በትንቢተ ሆሴዕ 5፡1 “ለሚመለከት ወጥመድ፥ በታቦርም ላይ የተዘረጋ አሽክላ ሆናችኋልና ፍርድ በእናንተ ላይ ነው” ተብሎ ተጽፏል።',
      en: 'Hosea 5:1 charges: "Judgment is toward you, because ye have been a snare on Mizpah, and a net spread upon Tabor."',
    },
    evidence: {
      verseId: '8108d097-988e-5428-a29e-2d075b47bee3',
      quoteAm: 'በታቦርም ላይ',
    },
    excerpt: null,
  },

  // 9: am-mark-56-6 -> b
  {
    passageId: 'am-mark-56-6',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በማርቆስ ወንጌል 6፡3 መሠረት በገዛ አገሩ የነበሩ ሰዎች ጌታችን ኢየሱስ ክርስቶስን የየትኛው ሙያ ባለቤት አድርገው ጠሩት?',
      en: 'According to Mark 6:3, what trade did the people of His own country ascribe to Jesus?',
    },
    options: [
      { key: 'a', text: { am: 'ሸማኔው', en: 'the weaver' } },
      { key: 'b', text: { am: 'ጸራቢው', en: 'the carpenter' } },
      { key: 'c', text: { am: 'ሸክላ ሠሪው', en: 'the potter' } },
      { key: 'd', text: { am: 'አንጥረኛው', en: 'the smith' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በማርቆስ ወንጌል 6፡3 ላይ ሰዎች “ይህስ ጸራቢው የማርያም ልጅ... አይደለምን?” በማለት መጠየቃቸው ተመዝግቧል።',
      en: 'Mark 6:3 records the reaction in Nazareth: "Is not this the carpenter, the son of Mary?"',
    },
    evidence: {
      verseId: '3d4fc57e-77c2-5c4b-af2b-e677066d1fd5',
      quoteAm: 'ጸራቢው',
    },
    excerpt: null,
  },

  // 10: am-acts-59-5 -> c
  {
    passageId: 'am-acts-59-5',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በሐዋርያት ሥራ 5፡1 መሠረት መሬቱን ሸጦ የዋጋውን እኩሌታ ያስቀረው የሐናንያ ሚስት ስሟ ማን ነበረ?',
      en: 'According to Acts 5:1, what was the name of the wife of Ananias who sold a possession?',
    },
    options: [
      { key: 'a', text: { am: 'ጵርስቅላ', en: 'Priscilla' } },
      { key: 'b', text: { am: 'ጣቢታ', en: 'Tabitha' } },
      { key: 'c', text: { am: 'ሰጲራ', en: 'Sapphira' } },
      { key: 'd', text: { am: 'ልድያ', en: 'Lydia' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በሐዋርያት ሥራ 5፡1 “ሐናንያ የተባለ አንድ ሰው ነበረ፤ ሚስቱም ሰጲራ ትባል ነበር፤ መሬቱንም ሸጠ” ይላል።',
      en: 'Acts 5:1 states: "But a certain man named Ananias, with Sapphira his wife, sold a possession."',
    },
    evidence: {
      verseId: '55aab85f-be6c-571d-ab40-eff63c9af3c8',
      quoteAm: 'ሰጲራ',
    },
    excerpt: null,
  },

  // 11: am-second-corinthians-62-5 -> d
  {
    passageId: 'am-second-corinthians-62-5',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በ2ኛ ቆሮንቶስ 5፡5 መሠረት ለሰማያዊው ዘላለማዊ ቤት ያዘጋጀን እግዚአብሔር ምን እንደ ሰጠን ቅዱስ ጳውሎስ መሰከረ?',
      en: 'According to 2 Corinthians 5:5, what earnest hath God given unto us who wrought us for this selfsame thing?',
    },
    options: [
      { key: 'a', text: { am: 'የመልአኩን ሰይፍ', en: 'the sword of the angel' } },
      { key: 'b', text: { am: 'የጽድቅን ዘውድ', en: 'the crown of righteousness' } },
      { key: 'c', text: { am: 'የሰማይን መክፈቻ', en: 'the key of heaven' } },
      { key: 'd', text: { am: 'የመንፈስ ቅዱስን ፈለማ', en: 'the earnest of the Holy Spirit' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በ2ኛ ቆሮንቶስ 5፡5 “ለዚህም ያዘጋጀን እግዚአብሔር ነው፤ እርሱም የመንፈስ ቅዱስን ፈለማ ሰጠን” ተብሎ ተጽፏል።',
      en: '2 Corinthians 5:5 records: "Now he that hath wrought us for the selfsame thing is God, who also hath given unto us the earnest of the Spirit."',
    },
    evidence: {
      verseId: 'c9855108-cdd5-57f3-a2aa-09bf62e9a178',
      quoteAm: 'የመንፈስ ቅዱስን ፈለማ',
    },
    excerpt: null,
  },

  // 12: am-revelation-81-9 -> a
  {
    passageId: 'am-revelation-81-9',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በራእይ 9፡5 መሠረት ከጢሱ የወጡት አንበጣዎች የእግዚአብሔር ማኅተም የሌለባቸውን ሰዎች እንዲያሠቃዩ ለስንት ጊዜ ተሰጣቸው?',
      en: 'According to Revelation 9:5, for how long was it given to the locusts to torment those men which have not the seal of God?',
    },
    options: [
      { key: 'a', text: { am: 'አምስትም ወር', en: 'five months' } },
      { key: 'b', text: { am: 'አንድ ዓመት', en: 'one year' } },
      { key: 'c', text: { am: 'ሰባት ወር', en: 'seven months' } },
      { key: 'd', text: { am: 'አርባ ቀን', en: 'forty days' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በራእይ 9፡5 “አምስትም ወር ሊያሰቃዩአቸው ተሰጣቸው እንጂ ሊገድሉአቸው አይደለም” ተብሎ ተጽፏል።',
      en: 'Revelation 9:5 records: "And to them it was given that they should not kill them, but that they should be tormented five months."',
    },
    evidence: {
      verseId: '1568cd84-5849-59b2-a73e-3fedc2b6eaf5',
      quoteAm: 'አምስትም ወር',
    },
    excerpt: null,
  },

  // 13: am-exodus-2-3 -> b [finish-the-verse]
  {
    passageId: 'am-exodus-2-3',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'እግዚአብሔር ለሙሴ በደብረ ሲና የተናገረውን ቃል ባዶ ቦታ አሟሉ፦ “አንተ የቆምህባት ስፍራ የተቀደሰች መሬት ናትና፥ ___” (ዘጸአት 3፡5)',
      en: 'Fill in the blank to complete God’s command to Moses: "for the place whereon thou standest is holy ground: ___" (Exodus 3:5)',
    },
    options: [
      { key: 'a', text: { am: 'በግንባርህ ተደፋ', en: 'fall on thy face' } },
      { key: 'b', text: { am: 'ጫማህን ከእግርህ አውጣ', en: 'put off thy shoes from off thy feet' } },
      { key: 'c', text: { am: 'እጆችህን ወደ ሰማይ አንሣ', en: 'lift up thy hands unto heaven' } },
      { key: 'd', text: { am: 'ፊትን በመጎናጸፊያ ሸፍን', en: 'cover thy face with a mantle' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘጸአት 3፡5 “አንተ የቆምህባት ስፍራ የተቀደሰች መሬት ናትና፥ ጫማህን ከእግርህ አውጣ አለው” በማለት የመቅደሱን ቅድስና አስተማረ።',
      en: 'Exodus 3:5 commands: "Put off thy shoes from off thy feet, for the place whereon thou standest is holy ground."',
    },
    evidence: {
      verseId: '0f342240-c02f-5a33-a966-26a5e903a997',
      quoteAm: 'ጫማህን ከእግርህ አውጣ',
    },
    excerpt: {
      am: 'አንተ የቆምህባት ስፍራ የተቀደሰች መሬት ናትና፥',
      en: 'for the place whereon thou standest is holy ground,',
    },
  },

  // 14: am-numbers-4-9 -> c
  {
    passageId: 'am-numbers-4-9',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘኍልቍ 9፡3 መሠረት የእስራኤል ልጆች ፋሲካን በመጀመሪያው ወር በስንተኛው ቀን እንዲያደርጉ ታዘዙ?',
      en: 'According to Numbers 9:3, on which day of the first month at even were the children of Israel commanded to keep the passover?',
    },
    options: [
      { key: 'a', text: { am: 'በሰባተኛው ቀን', en: 'on the seventh day' } },
      { key: 'b', text: { am: 'በአሥረኛው ቀን', en: 'on the tenth day' } },
      { key: 'c', text: { am: 'በዐሥራ አራተኛው ቀን', en: 'on the fourteenth day' } },
      { key: 'd', text: { am: 'በሃያ አንደኛው ቀን', en: 'on the one and twentieth day' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በኦሪት ዘኍልቍ 9፡3 “በመጀመሪያው ወር በዐሥራ አራተኛው ቀን በመሸ ጊዜ በጊዜው አድርጉት” ተብሎ ተጽፏል።',
      en: 'Numbers 9:3 directs: "In the fourteenth day of this month, at even, ye shall keep it in his appointed season."',
    },
    evidence: {
      verseId: '7f3b16f1-35da-5dfb-a522-6e7f1728c8f6',
      quoteAm: 'በዐሥራ አራተኛው ቀን',
    },
    excerpt: null,
  },

  // 15: am-deuteronomy-5-2 -> d
  {
    passageId: 'am-deuteronomy-5-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘዳግም 2፡5 መሠረት እግዚአብሔር የሴይርን ተራራ ለማን ልጆች ርስት አድርጎ እንደ ሰጠው ተናገረ?',
      en: 'According to Deuteronomy 2:5, to whose children did the LORD give mount Seir for a possession?',
    },
    options: [
      { key: 'a', text: { am: 'ለሎጥ ልጆች', en: 'unto the children of Lot' } },
      { key: 'b', text: { am: 'ለእስማኤል ልጆች', en: 'unto the children of Ishmael' } },
      { key: 'c', text: { am: 'ለሞዓብ ልጆች', en: 'unto the children of Moab' } },
      { key: 'd', text: { am: 'ለዔሳው ልጆች', en: 'unto the children of Esau' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በኦሪት ዘዳግም 2፡5 “የሴይርን ተራራ ለዔሳው ልጆች ርስት አድርጌ ስለ ሰጠሁ እኔ ከምድራቸው የጫማ መርገጫ ታህል እንኳን አልሰጣችሁም” ይላል።',
      en: 'Deuteronomy 2:5 states: "Meddle not with them; for I will not give you of their land, no, not so much as a foot breadth; because I have given mount Seir unto Esau for a possession."',
    },
    evidence: {
      verseId: '775d727d-2d99-5119-adf5-dca7939182c6',
      quoteAm: 'ለዔሳው ልጆች',
    },
    excerpt: null,
  },

  // 16: am-judges-7-2 -> a
  {
    passageId: 'am-judges-7-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በመጽሐፈ መሳፍንት 2፡5 መሠረት ሕዝቡ ድምፃቸውን አንሥተው ካለቀሱ በኋላ የዚያ ስፍራ ስም ምን ተብሎ ተጠራ?',
      en: 'According to Judges 2:5, what was the name of that place called after the people lifted up their voice and wept?',
    },
    options: [
      { key: 'a', text: { am: 'መካነ ብካይ', en: 'Bochim (place of weeping)' } },
      { key: 'b', text: { am: 'መካነ ሰላም', en: 'place of peace' } },
      { key: 'c', text: { am: 'መካነ ጸሎት', en: 'place of prayer' } },
      { key: 'd', text: { am: 'መካነ ቅዱሳን', en: 'place of saints' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ መሳፍንት 2፡5 “የዚያም ስፍራ ስም መካነ ብካይ ተብሎ ተጠራ፤ በዚያም ለእግዚአብሔር ሠዉ” ተብሎ ተመዝግቧል።',
      en: 'Judges 2:5 records: "And they called the name of that place Bochim: and they sacrificed there unto the LORD."',
    },
    evidence: {
      verseId: '15417378-603a-58e5-a002-f86e61e03fd8',
      quoteAm: 'መካነ ብካይ',
    },
    excerpt: null,
  },

  // 17: am-ruth-8-2 -> b
  {
    passageId: 'am-ruth-8-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በመጽሐፈ ሩት 2፡1 መሠረት ከአቤሜሌክ ወገን የሆነውና ለኑኃሚን ባል የሚዛመደው ኃያል ሰው ስሙ ማን ነበረ?',
      en: 'According to Ruth 2:1, what was the name of the kinsman of Naomi’s husband, a mighty man of wealth of the family of Elimelech?',
    },
    options: [
      { key: 'a', text: { am: 'ኬሌዎን', en: 'Chilion' } },
      { key: 'b', text: { am: 'ቦዔዝ', en: 'Boaz' } },
      { key: 'c', text: { am: 'መሐሎን', en: 'Mahlon' } },
      { key: 'd', text: { am: 'ዮቶር', en: 'Jethro' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ ሩት 2፡1 “ለኑኃሚንም ባል የሚዛመደው ከአቤሜሌክ ወገን የሆነ ኃያል ሰው ስሙ ቦዔዝ የተባለ ሰው ነበረ” ተብሎ ተጽፏል።',
      en: 'Ruth 2:1 introduces Boaz: "And Naomi had a kinsman of her husband\'s, a mighty man of wealth, of the family of Elimelech; and his name was Boaz."',
    },
    evidence: {
      verseId: '098b3d39-e78d-59e3-a850-d01373e94dbc',
      quoteAm: 'ቦዔዝ',
    },
    excerpt: null,
  },

  // 18: am-second-chronicles-14-1 -> c [finish-the-verse]
  {
    passageId: 'am-second-chronicles-14-1',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የመጽሐፈ ዜና መዋዕል ካልዕን ቃል ባዶ ቦታ አሟሉ፦ “የዳዊት ልጅ ሰሎሞንም በመንግሥቱ በረታ፤ ___ እጅግም አከበረው፤” (2 ዜና 1፡1)',
      en: 'Fill in the blank to complete the verse in 2 Chronicles: "And Solomon the son of David was strengthened in his kingdom, and ___ and magnified him exceedingly." (2 Chronicles 1:1)',
    },
    options: [
      { key: 'a', text: { am: 'የጦር ሠራዊቱ በምድር ሞላ', en: 'his host of war filled the earth' } },
      { key: 'b', text: { am: 'ጠላቶቹም ሁሉ ተንበርከኩ', en: 'and all his enemies knelt down' } },
      { key: 'c', text: { am: 'አምላኩም እግዚአብሔር ከእርሱ ጋር ነበረ', en: 'and the LORD his God was with him' } },
      { key: 'd', text: { am: 'ወርቅና ብር በከተማው በዛ', en: 'and gold and silver abounded in his city' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በ2ኛ ዜና መዋዕል 1፡1 “የዳዊት ልጅ ሰሎሞንም በመንግሥቱ በረታ፤ አምላኩም እግዚአብሔር ከእርሱ ጋር ነበረ፤ እጅግም አከበረው፤ አገነነውም” ተብሎ ተጽፏል።',
      en: '2 Chronicles 1:1 records: "And Solomon the son of David was strengthened in his kingdom, and the LORD his God was with him, and magnified him exceedingly."',
    },
    evidence: {
      verseId: 'fa9efc30-a7b8-5ae3-a4f8-e29612474f63',
      quoteAm: 'አምላኩም እግዚአብሔር ከእርሱ ጋር ነበረ',
    },
    excerpt: {
      am: 'የዳዊት ልጅ ሰሎሞንም በመንግሥቱ በረታ፤',
      en: 'And Solomon the son of David was strengthened in his kingdom,',
    },
  },

  // 19: am-jubilees-15-1 -> d
  {
    passageId: 'am-jubilees-15-1',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ኩፋሌ 1፡4 መሠረት ሙሴ በተራራው ላይ ለምን ያህል ጊዜ ተቀመጠ?',
      en: 'According to Jubilees 1:4, how long was Moses upon the mount?',
    },
    options: [
      { key: 'a', text: { am: 'አሥራ አራት ቀንና ሌሊት', en: 'fourteen days and nights' } },
      { key: 'b', text: { am: 'ሃያ ቀንና ሃያ ሌሊት', en: 'twenty days and twenty nights' } },
      { key: 'c', text: { am: 'ሠላሳ ቀንና ሠላሳ ሌሊት', en: 'thirty days and thirty nights' } },
      { key: 'd', text: { am: 'አርባ ቀንና አርባ ሌሊት', en: 'forty days and forty nights' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመጽሐፈ ኩፋሌ 1፡4 “ሙሴም በተራራው ላይ አርባ ቀንና አርባ ሌሊት ተቀመጠ፤ እግዚአብሔርም ያለፈውንና የሚመጣውን... አመለከተው” ተብሎ ተጽፏል።',
      en: 'Jubilees 1:4 records: "And Moses was on the mount forty days and forty nights, and God instructed him in the past and the future."',
    },
    evidence: {
      verseId: '88a91a4d-20a8-5a85-a2b5-311de91a52a8',
      quoteAm: 'አርባ ቀንና አርባ ሌሊት',
    },
    excerpt: null,
  },
]

async function run() {
  const counts: Record<string, number> = { a: 0, b: 0, c: 0, d: 0 }
  for (const q of questions) {
    counts[q.correctKey]++
  }
  console.log('Checking key distribution:\n', counts)

  const responseEnvelope = {
    version: 1,
    sourceHash: sourceManifest.sourceHash,
    modelId,
    questions,
  }

  console.log('Validating Batch 005 response through generator validator...')
  const validated = await validateAmharicQuestionResponse(sourceBatch, modelId, responseEnvelope, existingPrompts)
  console.log(`Generator validation PASSED! ${validated.drafts.length} drafts produced.`)

  // Write outputs to batch-005
  writeFileSync(join(BATCH_DIR, 'gemini-response.json'), `${JSON.stringify(responseEnvelope, null, 2)}\n`, 'utf8')
  writeFileSync(join(BATCH_DIR, 'drafts.json'), `${JSON.stringify({
    version: 1,
    status: 'draft',
    editorialReviewRequired: true,
    sourceHash: validated.sourceHash,
    modelId,
    drafts: validated.drafts,
  }, null, 2)}\n`, 'utf8')

  writeFileSync(join(BATCH_DIR, 'report.json'), `${JSON.stringify({
    version: 1,
    accepted: validated.drafts.length,
    rejected: 0,
    sourceHash: validated.sourceHash,
    modelId,
    publication: 'not_allowed',
    editorialReviewRequired: true,
  }, null, 2)}\n`, 'utf8')

  // Adapt to CMS
  const cmsAdapted = adaptEditorialBatchToCms({ drafts: validated.drafts })
  writeFileSync(join(BATCH_DIR, 'cms-import.json'), `${JSON.stringify(cmsAdapted, null, 2)}\n`, 'utf8')

  // Preview CMS import
  const preview = previewQuestionImport(JSON.stringify(cmsAdapted), new Set())
  console.log(`CMS preview validated: ${preview.items.length} items, ${preview.errors.length} errors.`)
  if (preview.errors.length) {
    throw new Error(`CMS preview errors: ${preview.errors.join('; ')}`)
  }

  // Update campaign tracking manifest and content library
  console.log('Updating campaign tracking manifest and content library...')
  await runCampaign()
  console.log('Batch 005 successfully generated, validated, and ingested into the library!')
}

run().catch((err) => {
  console.error(err)
  process.exit(1)
})

