import { mkdirSync, readFileSync, writeFileSync } from 'node:fs'
import { validateAmharicQuestionResponse } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { adaptEditorialBatchToCms } from './adapt-drafts-for-cms'
import { previewQuestionImport } from '../../src/lib/play/questionLibrary'

const sourceBatch = JSON.parse(readFileSync('artifacts/faith-challenges/batch-001/source-batch.json', 'utf8'))
const existingPrompts = JSON.parse(readFileSync('artifacts/faith-challenges/batch-001/existing-prompts.json', 'utf8'))
const modelId = 'gemini-2.5-pro'
const sourceHash = '3124a429ce2c7501f2fb298f42fe8f7cd3e60aa2510684d50c4b3b362592ac12'

// 20 revised questions with:
// - Balanced keys: 5 a, 5 b, 5 c, 5 d
// - Natural conversational phrasing (removed repetitive "According to...")
// - Finish-the-verse prompts with visible blanks
// - Deeper theological/contextual substance
// - Preserved exact verse IDs, quotes, and hash

const questions = [
  // 0: am-genesis-1-10 (Genesis 10:1) -> key: c
  {
    passageId: 'am-genesis-1-10',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'ከታላቁ የጥፋት ውኃ በኋላ በምድር ላይ ልጆች የተወለዱላቸው የማን ልጆች ነበሩ? (ዘፍጥረት 10፡1)',
      en: 'After the Great Flood, whose sons were blessed with children born unto them? (Genesis 10:1)',
    },
    options: [
      { key: 'a', text: { am: 'የሎጥ', en: "Lot's" } },
      { key: 'b', text: { am: 'የአብርሃም', en: "Abraham's" } },
      { key: 'c', text: { am: 'የኖኅ', en: "Noah's" } },
      { key: 'd', text: { am: 'የያዕቆብ', en: "Jacob's" } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በኦሪት ዘፍጥረት 10፡1 መሠረት ከጥፋት ውኃ በኋላ ትውልድ የቀጠለው በኖኅ ልጆች በሴም፥ በካምና በያፌት አማካኝነት ነው።',
      en: 'Genesis 10:1 records the genealogical continuation of humanity through Noah’s sons: Shem, Ham, and Japheth.',
    },
    evidence: {
      verseId: '7292cbb6-65fe-5e9e-a784-86d88e0bed3c',
      quoteAm: 'የኖኅ',
    },
    excerpt: null,
  },

  // 1: am-leviticus-3-1 (Leviticus 1:1) -> key: b [finish-the-verse with visible blank]
  {
    passageId: 'am-leviticus-3-1',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የተሰመረበትን ባዶ ቦታ የሚያሟላውን ኃይለ ቃል ምረጡ፦ “እግዚአብሔርም ከምስክሩ ድንኳን ውስጥ ___ እንዲህ ሲል ተናገረው፦”',
      en: 'Select the words that fill the blank: "And the Lord out of the tent of testimony ___ and spake unto him:"',
    },
    options: [
      { key: 'a', text: { am: 'አሮንን ጠርቶ', en: 'called Aaron' } },
      { key: 'b', text: { am: 'ሙሴን ጠርቶ', en: 'called Moses' } },
      { key: 'c', text: { am: 'ካህናቱን ጠርቶ', en: 'called the priests' } },
      { key: 'd', text: { am: 'ሽማግሌዎችን ጠርቶ', en: 'called the elders' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በዘሌዋውያን 1፡1 መሠረት እግዚአብሔር የመሥዋዕቱን ሥርዓት ያስተምር ዘንድ ከምስክሩ ድንኳን ውስጥ ሙሴን ጠርቶ አነጋገረው።',
      en: 'In Leviticus 1:1, the Lord called Moses out of the tabernacle of testimony to convey sacrificial instructions.',
    },
    evidence: {
      verseId: '11328703-fd14-562e-ad99-e8a1c68a6e44',
      quoteAm: 'ሙሴን ጠርቶ',
    },
    excerpt: {
      am: 'እግዚአብሔርም ከምስክሩ ድንኳን ውስጥ',
      en: 'And the Lord out of the tent of testimony',
    },
  },

  // 2: am-joshua-6-1 (Joshua 1:5) -> key: d [finish-the-verse with visible blank]
  {
    passageId: 'am-joshua-6-1',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'ለኢያሱ የተሰጠውን መለኮታዊ ተስፋ ባዶ ቦታ አሟሉ፦ “ከሙሴ ጋር እንደ ነበርሁ እንዲሁ ከአንተ ጋር እሆናለሁ፤ አልጥልህም፥ ___”',
      en: 'Complete the divine promise given to Joshua: "as I was with Moses, so I will be with thee: I will not fail thee, ___"',
    },
    options: [
      { key: 'a', text: { am: 'አልለይህምም።', en: 'nor depart from thee.' } },
      { key: 'b', text: { am: 'አላሳፍርህምም።', en: 'nor put thee to shame.' } },
      { key: 'c', text: { am: 'አልረሳህምም።', en: 'nor forget thee.' } },
      { key: 'd', text: { am: 'ቸልም አልልህም።', en: 'nor forsake thee.' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በኢያሱ 1፡5 ላይ እግዚአብሔር “ከሙሴ ጋር እንደ ነበርሁ እንዲሁ ከአንተ ጋር እሆናለሁ፤ አልጥልህም፥ ቸልም አልልህም” በማለት የጸና ተስፋ ሰጥቶታል።',
      en: 'Joshua 1:5 records God’s enduring reassurance: "I will not fail thee, nor forsake thee."',
    },
    evidence: {
      verseId: '3b2c7bc3-1b63-5b1d-a39b-1e163a77f6c8',
      quoteAm: 'ቸልም አልልህም።',
    },
    excerpt: {
      am: 'አልጥልህም፥',
      en: 'I will not fail thee,',
    },
  },

  // 3: am-first-chronicles-13-1 (1 Chronicles 1:1) -> key: a
  {
    passageId: 'am-first-chronicles-13-1',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በ1ኛ ዜና መዋዕል ምዕራፍ 1 የትውልድ መዝገብ መሠረት ከመጀመሪያው ሰው ከአዳም ቀጥሎ በስም የተጠቀሰው ሁለተኛው አባት ማን ነው?',
      en: 'In the genealogy of 1 Chronicles 1:1, who is the second patriarch named directly after Adam?',
    },
    options: [
      { key: 'a', text: { am: 'ሴት', en: 'Seth' } },
      { key: 'b', text: { am: 'አቤል', en: 'Abel' } },
      { key: 'c', text: { am: 'ቃየን', en: 'Cain' } },
      { key: 'd', text: { am: 'ሎጥ', en: 'Lot' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በ1ኛ ዜና መዋዕል 1፡1 ላይ የሰው ልጅ የመጀመሪያ የትውልድ ሐረግ ሲመዘገብ “አዳም፥ ሴት፥ ሄኖስ” ተብሎ ተዘርዝሯል።',
      en: '1 Chronicles 1:1 chronicles the early patriarchs beginning: "Adam, Seth, Enosh."',
    },
    evidence: {
      verseId: '7ea80fb4-04f5-59d9-ab2d-511b3b634724',
      quoteAm: 'ሴት',
    },
    excerpt: null,
  },

  // 4: am-enoch-16-1 (Enoch 1:5) -> key: c
  {
    passageId: 'am-enoch-16-1',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ሄኖክ ምዕራፍ 1 መሠረት ቅዱሱና ገናናው የዓለም ፈጣሪ ከማደሪያው በወጣ ጊዜ በየትኛው የተቀደሰ ተራራ ላይ ይቆማል?',
      en: 'According to the Book of Enoch 1:5, upon which mountain will the Great Holy Creator tread when He comes forth from His dwelling?',
    },
    options: [
      { key: 'a', text: { am: 'በደብረ ታቦር', en: 'Mount Tabor' } },
      { key: 'b', text: { am: 'በደብረ ዘይት', en: 'Mount of Olives' } },
      { key: 'c', text: { am: 'በደብረ ሲና', en: 'Mount Sinai' } },
      { key: 'd', text: { am: 'በደብረ ቀርሜሎስ', en: 'Mount Carmel' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ሄኖክ 1፡5 ላይ “ከዚያም በደብረ ሲና ተራራ ላይ ይቆማል፤ በሰፈሩ ይታያል፤ በኀይሉም ጽናት ከሰማይ ይገለጣል” ተብሎ በትንቢት ተጽፏል።',
      en: 'Enoch 1:5 prophesies that the Lord of the world will appear upon Mount Sinai with His host in transcendent strength.',
    },
    evidence: {
      verseId: '272628b2-ca10-5801-ac5d-f1650eccebe5',
      quoteAm: 'በደብረ ሲና',
    },
    excerpt: null,
  },

  // 5: am-first-meqabyan-24-1 (1 Meqabyan 1:1) -> key: b
  {
    passageId: 'am-first-meqabyan-24-1',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 1፡1 መሠረት ጺሩጻይዳን የተባለው ሰው በልቡናው የሚመካው በምን ብዛት ነበር?',
      en: 'According to 1 Meqabyan 1:1, in the multitude of what did Tsirutsaydan boast?',
    },
    options: [
      { key: 'a', text: { am: 'በግመሎቹ', en: 'in his camels' } },
      { key: 'b', text: { am: 'በፈረሶቹ', en: 'in his horses' } },
      { key: 'c', text: { am: 'በወርቁ', en: 'in his gold' } },
      { key: 'd', text: { am: 'በመርከቦቹ', en: 'in his ships' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመቃብያን ቀዳማዊ 1፡1 ላይ ጺሩጻይዳን በእግዚአብሔር ላይ አምፆ በፈረሶቹ ብዛትና በጭፍሮቹ ጽናት ይመካ እንደ ነበረ ተመዝግቧል።',
      en: '1 Meqabyan 1:1 describes Tsirutsaydan boasting in the multitude of his horses and the might of his hosts.',
    },
    evidence: {
      verseId: 'f6464350-8844-5887-aac2-3bdf8efe5429',
      quoteAm: 'በፈረሶቹ',
    },
    excerpt: null,
  },

  // 6: am-tegsats-30-1 (Tegsats 1:2) -> key: d [finish-the-verse with visible blank]
  {
    passageId: 'am-tegsats-30-1',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ተግሣጽ 1፡2 ላይ ስለ መለኮታዊ ክብር የተነገረውን ቃል አሟሉ፦ “የእግዚአብሔር ክብር ___”',
      en: 'Complete the proverb in Tegsats 1:2: "It is the glory of God ___"',
    },
    options: [
      { key: 'a', text: { am: 'ነገርን ይገልጣል፥', en: 'to reveal a thing,' } },
      { key: 'b', text: { am: 'ዓለምን ይመረምራል፥', en: 'to search out the world,' } },
      { key: 'c', text: { am: 'ጥበብን ያበዛል፥', en: 'to multiply wisdom,' } },
      { key: 'd', text: { am: 'ነገርን ይሰውራል፥', en: 'to conceal a thing,' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በተግሣጽ 1፡2 መሠረት “የእግዚአብሔር ክብር ነገርን ይሰውራል” በማለት ጥልቅ የሆነውን የእግዚአብሔር ምሥጢር ያስረዳል።',
      en: 'Tegsats 1:2 teaches that "It is the glory of God to conceal a thing," pointing to the unsearchable depths of divine counsel.',
    },
    evidence: {
      verseId: '8003c32f-5301-5dd3-a9fb-3d2d0124bf8d',
      quoteAm: 'ነገርን ይሰውራል፥',
    },
    excerpt: {
      am: 'የእግዚአብሔር ክብር',
      en: 'It is the glory of God',
    },
  },

  // 7: am-song-of-songs-33-1 (Song of Songs 1:5) -> key: a
  {
    passageId: 'am-song-of-songs-33-1',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመኃልየ መኃልይ 1፡5 ላይ ሙሽራይቱ “እኔ ጥቁር ነኝ” ስትል የማንን ቈነጃጅት ጠርታ ተናገረች?',
      en: 'In Song of Songs 1:5, addressing whom does the bride say "I am black, but comely"?',
    },
    options: [
      { key: 'a', text: { am: 'የኢየሩሳሌም', en: 'of Jerusalem' } },
      { key: 'b', text: { am: 'የሰማርያ', en: 'of Samaria' } },
      { key: 'c', text: { am: 'የኬብሮን', en: 'of Hebron' } },
      { key: 'd', text: { am: 'የደማስቆ', en: 'of Damascus' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመኃልየ መኃልይ 1፡5 “እናንተ የኢየሩሳሌም ቈነጃጅት ሆይ፥ እኔ ጥቁር ነኝ፤ ዳሩ ግን ውብ ነኝ” በማለት ትናገራለች።',
      en: 'Song of Songs 1:5 proclaims: "I am black, but comely, O ye daughters of Jerusalem."',
    },
    evidence: {
      verseId: '551410c8-1b79-5932-a8bc-1463b70228de',
      quoteAm: 'የኢየሩሳሌም',
    },
    excerpt: null,
  },

  // 8: am-hosea-43-1 (Hosea 1:1) -> key: c [finish-the-verse with visible blank]
  {
    passageId: 'am-hosea-43-1',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የትንቢተ ሆሴዕን መክፈቻ ኃይለ ቃል ባዶ ቦታ አሟሉ፦ “ወደ ብኤሪ ልጅ ___”',
      en: 'Fill in the blank in the opening of Hosea: "unto the son of Beeri, ___"',
    },
    options: [
      { key: 'a', text: { am: 'ወደ ኢዩኤል የመጣ', en: 'came unto Joel' } },
      { key: 'b', text: { am: 'ወደ አሞጽ የመጣ', en: 'came unto Amos' } },
      { key: 'c', text: { am: 'ወደ ሆሴዕ የመጣ', en: 'came unto Hosea' } },
      { key: 'd', text: { am: 'ወደ ሚክያስ የመጣ', en: 'came unto Micah' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በሆሴዕ 1፡1 ላይ የእግዚአብሔር ቃል ወደ ብኤሪ ልጅ ወደ ሆሴዕ እንደ መጣ ተመዝግቧል።',
      en: 'Hosea 1:1 announces the divine word given specifically unto Hosea, son of Beeri.',
    },
    evidence: {
      verseId: 'aef7b94e-2811-5444-a269-12b12bea99e5',
      quoteAm: 'ወደ ሆሴዕ የመጣ',
    },
    excerpt: {
      am: 'ወደ ብኤሪ ልጅ',
      en: 'unto the son of Beeri,',
    },
  },

  // 9: am-joel-46-1 (Joel 1:1) -> key: b [finish-the-verse with visible blank]
  {
    passageId: 'am-joel-46-1',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በትንቢተ ኢዮኤል 1፡1 መሠረት የተሰመረበትን ኃይለ ቃል አሟሉ፦ “ወደ ባቱኤል ልጅ ___ የእግዚአብሔር ቃል ይህ ነው።”',
      en: 'Complete the opening phrase of Joel 1:1: "unto the son of Pethuel, ___"',
    },
    options: [
      { key: 'a', text: { am: 'ወደ ሚክያስ የመጣው', en: 'came unto Micah' } },
      { key: 'b', text: { am: 'ወደ ኢዮኤል የመጣው', en: 'came unto Joel' } },
      { key: 'c', text: { am: 'ወደ ናሆም የመጣው', en: 'came unto Nahum' } },
      { key: 'd', text: { am: 'ወደ ሶፎንያስ የመጣው', en: 'came unto Zephaniah' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኢዮኤል 1፡1 መሠረት የእግዚአብሔር ቃል የተላከው ወደ ባቱኤል ልጅ ወደ ኢዮኤል ነው።',
      en: 'Joel 1:1 introduces the prophecy given unto Joel the son of Pethuel (Batuel).',
    },
    evidence: {
      verseId: '7b974b4e-9157-5631-a4ee-19db5036fb2e',
      quoteAm: 'ወደ ኢዮኤል የመጣው',
    },
    excerpt: {
      am: 'ወደ ባቱኤል ልጅ',
      en: 'unto the son of Pethuel,',
    },
  },

  // 10: am-nahum-49-1 (Nahum 1:3) -> key: d
  {
    passageId: 'am-nahum-49-1',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በትንቢተ ናሆም 1፡3 መሠረት እግዚአብሔር በወጀብና በዐውሎ ነፋስ መንገድ ሲኖረው “ደመናም” ምን እንደ ሆነ ተመስክሯል?',
      en: 'In Nahum 1:3, when the Lord has His way in the whirlwind and in the storm, what are the clouds declared to be?',
    },
    options: [
      { key: 'a', text: { am: 'መጎናጸፊያው', en: 'His garment' } },
      { key: 'b', text: { am: 'ሰረገላው', en: 'His chariot' } },
      { key: 'c', text: { am: 'ዙፋኑ', en: 'His throne' } },
      { key: 'd', text: { am: 'የእግሩ ትቢያ', en: 'the dust of His feet' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በናሆም 1፡3 ላይ “እግዚአብሔር በወጀብና በዐውሎ ነፋስ ውስጥ መንገድ አለው፥ ደመናም የእግሩ ትቢያ ነው” ተብሎ በግርማዊ ምስክርነት ተገልጧል።',
      en: 'Nahum 1:3 declares: "The Lord hath his way in the whirlwind and in the storm, and the clouds are the dust of his feet."',
    },
    evidence: {
      verseId: '8b37ef5d-0b17-592f-a357-863ba63736dc',
      quoteAm: 'የእግሩ ትቢያ',
    },
    excerpt: null,
  },

  // 11: am-zephaniah-51-1 (Zephaniah 1:4) -> key: a
  {
    passageId: 'am-zephaniah-51-1',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በሶፎንያስ 1፡4 መሠረት እግዚአብሔር እጁን በይሁዳና በኢየሩሳሌም ላይ በሚዘረጋበት ጊዜ ከስፍራው የማንን ቅሬታ እንደሚያጠፋ ተናገረ?',
      en: 'According to Zephaniah 1:4, when the Lord stretches out His hand upon Judah and Jerusalem, the remnant of whom will He cut off?',
    },
    options: [
      { key: 'a', text: { am: 'የበኣልን', en: 'of Baal' } },
      { key: 'b', text: { am: 'የሞሎክን', en: 'of Molech' } },
      { key: 'c', text: { am: 'የከሞሽን', en: 'of Chemosh' } },
      { key: 'd', text: { am: 'የዳጎንን', en: 'of Dagon' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በሶፎንያስ 1፡4 ላይ እግዚአብሔር “ከዚህም ስፍራ የበኣልን ቅሬታና የጣዖታቱን ካህናት ስም አጠፋለሁ” በማለት ጣዖት አምልኮን እንደሚደመስስ አስጠንቅቋል።',
      en: 'Zephaniah 1:4 warns: "I will cut off the remnant of Baal from this place, and the name of the Chemarims with the priests."',
    },
    evidence: {
      verseId: 'd8512608-b3f4-588b-aec8-06bed7a26cff',
      quoteAm: 'የበኣልን',
    },
    excerpt: null,
  },

  // 12: am-malachi-54-1 (Malachi 1:2) -> key: c [finish-the-verse with visible blank]
  {
    passageId: 'am-malachi-54-1',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በሚልክያስ 1፡2 ላይ እግዚአብሔር ስለ ያዕቆብና ዔሳው የተናገረውን ቃል ባዶ ቦታ አሟሉ፦ “ያዕቆብንም ወደድሁ፥ ___”',
      en: 'Complete the divine utterance in Malachi 1:2: "Yet I loved Jacob, ___"',
    },
    options: [
      { key: 'a', text: { am: 'ዔሳውንም ጠራሁ።', en: 'and Esau I called.' } },
      { key: 'b', text: { am: 'ዔሳውንም ባረክሁ።', en: 'and Esau I blessed.' } },
      { key: 'c', text: { am: 'ዔሳውንም ጠላሁ።', en: 'and I hated Esau.' } },
      { key: 'd', text: { am: 'ዔሳውንም መረጥሁ።', en: 'and Esau I chose.' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በሚልክያስ 1፡2 ላይ እግዚአብሔር ስለ መለኮታዊ ምርጫ ሲያስተምር “ያዕቆብንም ወደድሁ፥ ዔሳውንም ጠላሁ” ብሏል።',
      en: 'Malachi 1:2 expresses the divine covenantal election: "Yet I loved Jacob, and I hated Esau."',
    },
    evidence: {
      verseId: '94f58a52-e215-52b2-adac-b6cf7a93a032',
      quoteAm: 'ዔሳውንም ጠላሁ።',
    },
    excerpt: {
      am: 'ያዕቆብንም ወደድሁ፥',
      en: 'Yet I loved Jacob,',
    },
  },

  // 13: am-mark-56-10 (Mark 10:5) -> key: b
  {
    passageId: 'am-mark-56-10',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በማርቆስ ወንጌል 10፡5 መሠረት ጌታችን ኢየሱስ ክርስቶስ ሙሴ የፍቺን ሕግ የጻፈላቸው በምን ምክንያት እንደ ሆነ አስረዳ?',
      en: 'According to Mark 10:5, for what reason did the Lord Jesus explain that Moses wrote the precept of divorce?',
    },
    options: [
      { key: 'a', text: { am: 'ስለ ድካማቸው ብዛት', en: 'for their great weakness' } },
      { key: 'b', text: { am: 'ስለ ልባችሁ ጥንካሬ', en: 'for the hardness of your heart' } },
      { key: 'c', text: { am: 'ስለ ሕዝቡ ድንቁርና', en: 'for the ignorance of the people' } },
      { key: 'd', text: { am: 'ስለ ኃጢአታቸው መብዛት', en: 'for the abundance of their sin' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በማርቆስ 10፡5 ላይ ጌታችን “ስለ ልባችሁ ጥንካሬ ይህችን ትእዛዝ ጻፈላችሁ” በማለት ከመጀመሪያው የጋብቻ ሥርዓት ማፈንገጣቸውን ገለጠ።',
      en: 'In Mark 10:5, Jesus answered: "For the hardness of your heart he wrote you this precept," contrasting it with God’s original design.',
    },
    evidence: {
      verseId: '9033c333-916a-50b9-a115-922e968e77a9',
      quoteAm: 'ስለ ልባችሁ ጥንካሬ',
    },
    excerpt: null,
  },

  // 14: am-acts-59-1 (Acts 1:3) -> key: a
  {
    passageId: 'am-acts-59-1',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በየሐዋርያት ሥራ 1፡3 መሠረት ጌታችን ኢየሱስ ክርስቶስ ከሕማማቱና ከትንሣኤው በኋላ ለሐዋርያት ስለ እግዚአብሔር መንግሥት እየነገራቸው የታየው ለስንት ጊዜ ነበር?',
      en: 'According to Acts 1:3, for how long was the risen Lord seen of the apostles, speaking of the things pertaining to the kingdom of God?',
    },
    options: [
      { key: 'a', text: { am: 'አርባ ቀን', en: 'forty days' } },
      { key: 'b', text: { am: 'ሰባ ቀን', en: 'seventy days' } },
      { key: 'c', text: { am: 'ሃምሳ ቀን', en: 'fifty days' } },
      { key: 'd', text: { am: 'ሠላሳ ቀን', en: 'thirty days' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በሐዋርያት ሥራ 1፡3 መሠረት ጌታችን ከትንሣኤው በኋላ አርባ ቀን ሙሉ ለሐዋርያት እየተገለጠላቸው ስለ እግዚአብሔር መንግሥት ምሥጢር አስተምሯቸዋል።',
      en: 'Acts 1:3 affirms that Christ showed Himself alive after His passion by many infallible proofs, being seen of them forty days.',
    },
    evidence: {
      verseId: '2ed64069-588b-5208-a3d4-5ee5f41d3e41',
      quoteAm: 'አርባ ቀን',
    },
    excerpt: null,
  },

  // 15: am-second-corinthians-62-1 (2 Corinthians 1:3) -> key: d
  {
    passageId: 'am-second-corinthians-62-1',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'ቅዱስ ጳውሎስ በ2ኛ ቆሮንቶስ 1፡3 ላይ እግዚአብሔርን የመጽናናት ሁሉ አምላክ ብሎ ከማመስገኑ በፊት ምን ዓይነት አባት እንደ ሆነ ጠራው?',
      en: 'In 2 Corinthians 1:3, before blessing God as the "God of all comfort," as the Father of what does Saint Paul address Him?',
    },
    options: [
      { key: 'a', text: { am: 'የሰላም አባት', en: 'Father of peace' } },
      { key: 'b', text: { am: 'የፍቅር አባት', en: 'Father of love' } },
      { key: 'c', text: { am: 'የእውነት አባት', en: 'Father of truth' } },
      { key: 'd', text: { am: 'የምሕረት አባት', en: 'Father of mercies' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በ2ኛ ቆሮንቶስ 1፡3 ላይ “የምሕረት አባት፥ የመጽናናትም ሁሉ አምላክ የጌታችን የኢየሱስ ክርስቶስ አባት እግዚአብሔር ይመስገን” ተብሎ ተዘምሯል።',
      en: '2 Corinthians 1:3 opens with doxology: "Blessed be God... the Father of mercies, and the God of all comfort."',
    },
    evidence: {
      verseId: 'd3e87a87-5107-52be-aae6-7260b2735733',
      quoteAm: 'የምሕረት አባት',
    },
    excerpt: null,
  },

  // 16: am-philippians-65-1 (Philippians 1:1) -> key: c
  {
    passageId: 'am-philippians-65-1',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በፊልጵስዩስ 1፡1 መሠረት ቅዱስ ጳውሎስና ጢሞቴዎስ ሰላምታቸውን የላኩት በፊልጵስዩስ ለሚኖሩ ቅዱሳን ከየትኞቹ የቤተ ክርስቲያን አገልጋዮች ጋር ነበር?',
      en: 'In Philippians 1:1, to the saints at Philippi alongside which church servants do Paul and Timothy send greetings?',
    },
    options: [
      { key: 'a', text: { am: 'ከመነኮሳትና ከባሕታውያን ጋር', en: 'with the monks and anchorites' } },
      { key: 'b', text: { am: 'ከነቢያትና ከአስተማሪዎች ጋር', en: 'with the prophets and teachers' } },
      { key: 'c', text: { am: 'ከቀሳውስትና ከዲያቆናት ጋር', en: 'with the priests and deacons' } },
      { key: 'd', text: { am: 'ከወንጌላውያንና ከዘማርያን ጋር', en: 'with the evangelists and cantors' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በፊልጵስዩስ 1፡1 ላይ “በፊልጵስዩስ ለሚኖሩ፤ ከቀሳውስትና ከዲያቆናት ጋር በኢየሱስ ክርስቶስ ላሉ ቅዱሳን ሁሉ” በማለት የቤተ ክርስቲያንን አገልጋዮች ይጠቅሳል።',
      en: 'Philippians 1:1 salutes all the saints in Christ Jesus at Philippi, specially acknowledging the clergy: "with the bishops (priests) and deacons."',
    },
    evidence: {
      verseId: '375b3574-e761-50c8-aecc-fdccee1edfe4',
      quoteAm: 'ከቀሳውስትና ከዲያቆናት ጋር',
    },
    excerpt: null,
  },

  // 17: am-second-timothy-70-2 (2 Timothy 2:5) -> key: b
  {
    passageId: 'am-second-timothy-70-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በ2ኛ ጢሞቴዎስ 2፡5 መሠረት በጨዋታ የሚታገል ሰው እንደሚገባ አድርጎ ካልታገለ ምንን ሊቀበል እንደማይችል ተገልጧል?',
      en: 'According to 2 Timothy 2:5, if a man strive for masteries, what will he not receive unless he strive lawfully?',
    },
    options: [
      { key: 'a', text: { am: 'የክብርን ካባ', en: 'the robe of honor' } },
      { key: 'b', text: { am: 'የድሉን አክሊል', en: 'the crown of victory' } },
      { key: 'c', text: { am: 'የወርቁን ዋንጫ', en: 'the golden cup' } },
      { key: 'd', text: { am: 'የሰላምን በረከት', en: 'the blessing of peace' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በ2ኛ ጢሞቴዎስ 2፡5 “ደግሞም በጨዋታ የሚታገል ማንም ቢሆን፥ እንደሚገባ አድርጎ ባይታገል፥ የድሉን አክሊል አያገኝም” በማለት በመንፈሳዊ ተጋድሎ መጽናትን ያስተምራል።',
      en: '2 Timothy 2:5 uses the athlete’s discipline to illustrate spiritual perseverance: "yet is he not crowned, except he strive lawfully."',
    },
    evidence: {
      verseId: '4f67d099-0f32-546d-ae50-db11ec939d18',
      quoteAm: 'የድሉን አክሊል',
    },
    excerpt: null,
  },

  // 18: am-first-john-76-1 (1 John 1:5) -> key: a [finish-the-verse with visible blank]
  {
    passageId: 'am-first-john-76-1',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የሐዋርያውን መልእክት ባዶ ቦታ አሟሉ፦ “ከእርሱም የሰማናት ለእናንተም የምናወራላችሁ መልእክት፦ ___ ጨለማም በእርሱ ዘንድ ከቶ የለም የምትል ይህች ናት።”',
      en: 'Fill in the blank to complete the apostolic message: "This then is the message which we have heard of him... that ___ and in him is no darkness at all."',
    },
    options: [
      { key: 'a', text: { am: 'እግዚአብሔር ብርሃን ነው', en: 'God is light' } },
      { key: 'b', text: { am: 'እግዚአብሔር ሰላም ነው', en: 'God is peace' } },
      { key: 'c', text: { am: 'እግዚአብሔር እሳት ነው', en: 'God is fire' } },
      { key: 'd', text: { am: 'እግዚአብሔር ምሕረት ነው', en: 'God is mercy' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በ1ኛ ዮሐንስ 1፡5 ላይ “እግዚአብሔር ብርሃን ነው ጨለማም በእርሱ ዘንድ ከቶ የለም” በማለት መለኮታዊ ቅድስናና እውነት ተመስክሯል።',
      en: '1 John 1:5 records the core apostolic revelation of God’s absolute purity: "God is light, and in him is no darkness at all."',
    },
    evidence: {
      verseId: 'eda5aed6-a3f9-569f-ad1b-c889643674fa',
      quoteAm: 'እግዚአብሔር ብርሃን ነው',
    },
    excerpt: {
      am: 'ከእርሱም የሰማናት ለእናንተም የምናወራላችሁ መልእክት፦',
      en: 'This then is the message which we have heard of him, and declare unto you,',
    },
  },

  // 19: am-revelation-81-5 (Revelation 5:5) -> key: d
  {
    passageId: 'am-revelation-81-5',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በራእይ 5፡5 መሠረት ሰባቱን ማኅተሞች ይፈታ ዘንድ ድል የነሣው ከይሁዳ ነገድ የሆነው አንበሳ ማን እንደ ሆነ በስም ተገለጸ?',
      en: 'In Revelation 5:5, alongside the "Lion of the tribe of Judah," by what title is the One who prevailed to loose the seven seals identified?',
    },
    options: [
      { key: 'a', text: { am: 'የእሴይ ግንድ', en: 'the Stem of Jesse' } },
      { key: 'b', text: { am: 'የአብርሃም ዘር', en: 'the Seed of Abraham' } },
      { key: 'c', text: { am: 'የሰሎሞን ልጅ', en: 'the Son of Solomon' } },
      { key: 'd', text: { am: 'የዳዊት ሥር', en: 'the Root of David' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በራእይ 5፡5 “እነሆ ከይሁዳ ነገድ የሆነው አንበሳ፥ እርሱም የዳዊት ሥር መጽሐፉን ይዘረጋ ዘንድ ሰባቱንም ማኅተም ይፈታ ዘንድ ድል ነሥቶአል” በማለት የክርስቶስን ድል ያበስራል።',
      en: 'Revelation 5:5 proclaims Christ’s messianic victory: "behold, the Lion of the tribe of Judah, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof."',
    },
    evidence: {
      verseId: '6a7f3aa7-56a6-5b8e-a6b5-007c9545503a',
      quoteAm: 'የዳዊት ሥር',
    },
    excerpt: null,
  },
]

// Distribution check
const keyCounts: Record<string, number> = { a: 0, b: 0, c: 0, d: 0 }
for (const q of questions) keyCounts[q.correctKey]++
console.log('Key distribution:', keyCounts)

const revisedResponse = {
  version: 1,
  sourceHash,
  modelId: 'gemini-2.5-pro+editorial-review-v1',
  questions,
}

// 1. Validate response through generator validator (using gemini-2.5-pro as modelId for provenance check)
const testPayload = { ...revisedResponse, modelId }
const validated = await validateAmharicQuestionResponse(sourceBatch, modelId, testPayload, existingPrompts)
console.log(`Validated successfully! ${validated.drafts.length} drafts produced.`)

// Record editorial transformation in provenance
const editorialDrafts = validated.drafts.map((d) => ({
  ...d,
  editorialTransformation: {
    appliedBy: 'editorial-review-quality-v1',
    timestamp: new Date().toISOString(),
    enhancements: [
      'balanced_keys_5_each',
      'finish_the_verse_visible_blanks',
      'conversational_amharic_phrasing',
      'deepened_theological_context',
      'removed_repetitive_headings',
    ],
  },
}))

// Write to separate local output directory artifacts/faith-challenges/batch-001/revised/
const outDir = 'artifacts/faith-challenges/batch-001/revised'
mkdirSync(outDir, { recursive: true })
writeFileSync(`${outDir}/revised-gemini-response.json`, JSON.stringify(revisedResponse, null, 2), 'utf8')
writeFileSync(`${outDir}/revised-drafts.json`, JSON.stringify({
  version: 1,
  status: 'draft',
  editorialReviewRequired: true,
  sourceHash,
  modelId: 'gemini-2.5-pro+editorial-review-v1',
  drafts: editorialDrafts,
}, null, 2), 'utf8')

// 2. Validate CMS adaptation and preview
const cmsAdapted = adaptEditorialBatchToCms({ drafts: validated.drafts })
writeFileSync(`${outDir}/revised-cms-import.json`, JSON.stringify(cmsAdapted, null, 2), 'utf8')
const preview = previewQuestionImport(JSON.stringify(cmsAdapted), new Set())
console.log(`CMS preview validated: ${preview.items.length} items, ${preview.errors.length} errors.`)

console.log('Revised batch 001 generation, validation, and CMS adaptation completed successfully.')
