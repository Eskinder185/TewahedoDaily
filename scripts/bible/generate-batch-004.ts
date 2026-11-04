import { readFileSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'
import { validateAmharicQuestionResponse } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { adaptEditorialBatchToCms } from './adapt-drafts-for-cms'
import { previewQuestionImport } from '../../src/lib/play/questionLibrary'
import { runCampaign } from './campaign-orchestrator'

const BATCH_DIR = 'artifacts/faith-challenges/batch-004'
const sourceBatch = JSON.parse(readFileSync(join(BATCH_DIR, 'source-batch.json'), 'utf8'))
const sourceManifest = JSON.parse(readFileSync(join(BATCH_DIR, 'source-manifest.json'), 'utf8'))
const existingPrompts = JSON.parse(readFileSync(join(BATCH_DIR, 'existing-prompts.json'), 'utf8'))
const modelId = 'gemini-2.5-pro'

const questions = [
  // 0: am-genesis-1-4 -> a
  {
    passageId: 'am-genesis-1-4',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘፍጥረት 4፡2 መሠረት አቤል ምን ዓይነት ሥራ የሚሠራ ሰው ሆነ?',
      en: 'According to Genesis 4:2, what was Abel’s occupation?',
    },
    options: [
      { key: 'a', text: { am: 'በግ ጠባቂ ሆነ', en: 'a keeper of sheep' } },
      { key: 'b', text: { am: 'ድንኳን ሠሪ ሆነ', en: 'a tent maker' } },
      { key: 'c', text: { am: 'የከብት ነጋዴ ሆነ', en: 'a cattle merchant' } },
      { key: 'd', text: { am: 'አናጢ ሆነ', en: 'a carpenter' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘፍጥረት 4፡2 “አቤልም በግ ጠባቂ ሆነ፤ ቃየልም ምድርን የሚያርስ ሆነ” ተብሎ ተጽፏል።',
      en: 'Genesis 4:2 records: "And Abel was a keeper of sheep, but Cain was a tiller of the ground."',
    },
    evidence: {
      verseId: '66ac4f53-dee6-57ab-ae3e-9e3834e4d86b',
      quoteAm: 'በግ ጠባቂ ሆነ',
    },
    excerpt: null,
  },

  // 1: am-leviticus-3-5 -> b
  {
    passageId: 'am-leviticus-3-5',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘሌዋውያን 5፡5 መሠረት አንድ ሰው ከተጠቀሱት በደሎች በአንዲቱ በደለኛ ቢሆን ምን እንዲያደርግ ታዘዘ?',
      en: 'According to Leviticus 5:5, what shall a person do when he shall be guilty in one of these things?',
    },
    options: [
      { key: 'a', text: { am: 'ከአገር ውጭ ይሰደዳል', en: 'he shall be exiled from the country' } },
      { key: 'b', text: { am: 'የሠራውን ኀጢአት ይናዘዛል', en: 'he shall confess that he hath sinned' } },
      { key: 'c', text: { am: 'ሰባት ቀን ይጾማል', en: 'he shall fast for seven days' } },
      { key: 'd', text: { am: 'ከማኅበሩ ይገለላል', en: 'he shall be separated from the assembly' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘሌዋውያን 5፡5 “ከእነዚህ ነገሮች በአንዲቱ በደለኛ ቢሆን፥ የሠራውን ኀጢአት ይናዘዛል” በማለት መናዘዝን ያዛል።',
      en: 'Leviticus 5:5 commands confession: "And it shall be, when he shall be guilty in one of these things, that he shall confess that he hath sinned in that thing."',
    },
    evidence: {
      verseId: '1284c209-9b6a-5c1a-afa2-41d9add2ece9',
      quoteAm: 'የሠራውን ኀጢአት ይናዘዛል',
    },
    excerpt: null,
  },

  // 2: am-joshua-6-4 -> c [finish-the-verse]
  {
    passageId: 'am-joshua-6-4',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የመጽሐፈ ኢያሱን ቃል ባዶ ቦታ አሟሉ፦ “እንዲህም ሆነ፤ ሕዝቡ ሁሉ ዮርዳኖስን ፈጽመው በተሻገሩ ጊዜ ___” (ኢያሱ 4፡1)',
      en: 'Fill in the blank to complete the verse in Joshua: "And it came to pass, when all the people were clean passed over Jordan, that ___" (Joshua 4:1)',
    },
    options: [
      { key: 'a', text: { am: 'የዮርዳኖስ ውኃ ወዲያው ደረቀ', en: 'the water of Jordan dried up immediately' } },
      { key: 'b', text: { am: 'ካህናቱ በታቦቱ ዙሪያ ሰገዱ', en: 'the priests bowed around the ark' } },
      { key: 'c', text: { am: 'እግዚአብሔር ኢያሱን እንዲህ ብሎ ተናገረው', en: 'the LORD spake unto Joshua, saying' } },
      { key: 'd', text: { am: 'የእስራኤል ልጆች እልልታ አሰሙ', en: 'the children of Israel shouted for joy' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ኢያሱ 4፡1 “እንዲህም ሆነ፤ ሕዝቡ ሁሉ ዮርዳኖስን ፈጽመው በተሻገሩ ጊዜ እግዚአብሔር ኢያሱን እንዲህ ብሎ ተናገረው” ተብሎ ተጽፏል።',
      en: 'Joshua 4:1 records: "And it came to pass, when all the people were clean passed over Jordan, that the LORD spake unto Joshua, saying."',
    },
    evidence: {
      verseId: 'ca78dfec-013c-543f-a568-a0c9d878bf9d',
      quoteAm: 'እግዚአብሔር ኢያሱን እንዲህ ብሎ ተናገረው',
    },
    excerpt: {
      am: 'እንዲህም ሆነ፤ ሕዝቡ ሁሉ ዮርዳኖስን ፈጽመው በተሻገሩ ጊዜ',
      en: 'And it came to pass, when all the people were clean passed over Jordan, that',
    },
  },

  // 3: am-first-chronicles-13-4 -> d
  {
    passageId: 'am-first-chronicles-13-4',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በ1ኛ ዜና መዋዕል 4፡5 መሠረት ለቴቁሄ አባት ለአስሑር ስንት ሚስቶች ነበሩት?',
      en: 'According to 1 Chronicles 4:5, how many wives did Ashur the father of Tekoa have?',
    },
    options: [
      { key: 'a', text: { am: 'አራት ሚስቶች ነበሩት', en: 'he had four wives' } },
      { key: 'b', text: { am: 'አንዲት ሚስት ነበረችው', en: 'he had one wife' } },
      { key: 'c', text: { am: 'ሦስት ሚስቶች ነበሩት', en: 'he had three wives' } },
      { key: 'd', text: { am: 'ሁለት ሚስቶች ነበሩት', en: 'he had two wives' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በ1ኛ ዜና መዋዕል 4፡5 “ለቴቁሄም አባት ለአስሑር ሔላና ነዓራ የተባሉ ሁለት ሚስቶች ነበሩት” ይላል።',
      en: '1 Chronicles 4:5 states: "And Ashur the father of Tekoa had two wives, Helah and Naarah."',
    },
    evidence: {
      verseId: 'bd421da4-ee88-5ce5-accb-252250b27e32',
      quoteAm: 'ሁለት ሚስቶች ነበሩት',
    },
    excerpt: null,
  },

  // 4: am-enoch-16-6 -> a
  {
    passageId: 'am-enoch-16-6',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ሄኖክ 6፡2 መሠረት በመብረቅና በነጐድጓድ ላይ የተሾመው ቅዱስ መልአክ ማን እንደ ሆነ ተገልጧል?',
      en: 'According to 1 Enoch 6:2, which holy angel is appointed over thunder and lightning?',
    },
    options: [
      { key: 'a', text: { am: 'ዑርኤል', en: 'Uriel' } },
      { key: 'b', text: { am: 'ፋኑኤል', en: 'Phanuel' } },
      { key: 'c', text: { am: 'ሳቁኤል', en: 'Saraqael' } },
      { key: 'd', text: { am: 'ረሚኤል', en: 'Remiel' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ሄኖክ 6፡2 “ከቅዱሳን መላእክት አንዱ ዑርኤል በመብረቅና በነጐድጓድ የተሾመ ነው” በማለት የቅዱስ ዑርኤልን ሹመት ይመሰክራል።',
      en: '1 Enoch 6:2 records: "Uriel, one of the holy angels, who is over the world and over Tartarus, appointed over thunder and lightning."',
    },
    evidence: {
      verseId: '5bab3dd3-2029-5169-a667-cc6c50c697a3',
      quoteAm: 'ዑርኤል',
    },
    excerpt: null,
  },

  // 5: am-first-meqabyan-24-4 -> b
  {
    passageId: 'am-first-meqabyan-24-4',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 4፡5 መሠረት አውሬዎችና አሞሮች ሳይነኩት በክንፋቸው ጋርደዋቸው የሰማዕታቱ ሥጋ ለስንት ቀን ተቀመጠ?',
      en: 'According to 1 Meqabyan 4:5, for how many days did the bodies of the martyrs remain untouched and shielded by birds?',
    },
    options: [
      { key: 'a', text: { am: 'ሰባት ቀን', en: 'seven days' } },
      { key: 'b', text: { am: 'ዐሥራ አራት ቀን', en: 'fourteen days' } },
      { key: 'c', text: { am: 'ሠላሳ ቀን', en: 'thirty days' } },
      { key: 'd', text: { am: 'አርባ ቀን', en: 'forty days' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 4፡5 “አሞሮችና ወፎች በፀሐይ ከመቃጠል በክንፋቸው ጋርደዋቸው የአምስቱ ሰማዕታት ሬሳቸው ዐሥራ አራት ቀን ተቀመጠ” ተብሎ ተጽፏል።',
      en: '1 Meqabyan 4:5 records that the bodies of the five martyrs remained preserved for fourteen days.',
    },
    evidence: {
      verseId: 'e477a296-b5fc-5b52-a78c-7e5de32ab4c5',
      quoteAm: 'ዐሥራ አራት ቀን',
    },
    excerpt: null,
  },

  // 6: am-tegsats-30-4 -> c [finish-the-verse]
  {
    passageId: 'am-tegsats-30-4',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የመጽሐፈ ተግሣጽን ምሳሌ ባዶ ቦታ አሟሉ፦ “ኃጥእ ማንም ሳያሳድደው ___፤” (ተግሣጽ 4፡1)',
      en: 'Fill in the blank to complete the proverb: "The wicked flee when ___" (Tegsats 4:1)',
    },
    options: [
      { key: 'a', text: { am: 'ይወድቃል', en: 'falleth' } },
      { key: 'b', text: { am: 'ይደነግጣል', en: 'is terrified' } },
      { key: 'c', text: { am: 'ይሸሻል', en: 'fleeth' } },
      { key: 'd', text: { am: 'ይጠፋል', en: 'perisheth' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ተግሣጽ 4፡1 “ኃጥእ ማንም ሳያሳድደው ይሸሻል” በማለት የኃጥዕን ውስጣዊ ፍርሃት ያስተምራል።',
      en: 'Tegsats (Proverbs) 4:1 observes: "The wicked flee when no man pursueth."',
    },
    evidence: {
      verseId: 'cb6f0cef-0d41-5e6d-a736-2a8cf8bfe90c',
      quoteAm: 'ይሸሻል',
    },
    excerpt: {
      am: 'ኃጥእ ማንም ሳያሳድደው',
      en: 'The wicked flee when',
    },
  },

  // 7: am-song-of-songs-33-4 -> d [finish-the-verse]
  {
    passageId: 'am-song-of-songs-33-4',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የመኃልየ መኃልይን ምስጋና ባዶ ቦታ አሟሉ፦ “ከንፈሮችሽ እንደ ___ ንግግርሽም ያማረ ነው።” (መኃልይ 4፡3)',
      en: 'Fill in the blank to complete the verse: "Thy lips are like ___ and thy speech is comely." (Song of Songs 4:3)',
    },
    options: [
      { key: 'a', text: { am: 'የጽጌረዳ አበባ ናቸው', en: 'are like a rose flower' } },
      { key: 'b', text: { am: 'የወርቅ ሰንሰለት ናቸው', en: 'are like a golden chain' } },
      { key: 'c', text: { am: 'የብርሃን ጨረር ናቸው', en: 'are like a ray of light' } },
      { key: 'd', text: { am: 'ቀይ ሐር ፈትል ናቸው', en: 'a thread of scarlet' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመኃልየ መኃልይ ዘሰሎሞን 4፡3 ላይ “ከንፈሮችሽ እንደ ቀይ ሐር ፈትል ናቸው” በማለት ክብሯን ያወድሳል።',
      en: 'Song of Songs 4:3 praises: "Thy lips are like a thread of scarlet, and thy speech is comely."',
    },
    evidence: {
      verseId: 'b6ef570a-6944-5d16-a176-f66ffb932914',
      quoteAm: 'ቀይ ሐር ፈትል ናቸው',
    },
    excerpt: {
      am: 'ከንፈሮችሽ እንደ',
      en: 'Thy lips are like',
    },
  },

  // 8: am-hosea-43-4 -> a
  {
    passageId: 'am-hosea-43-4',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በትንቢተ ሆሴዕ 4፡1 መሠረት እግዚአብሔር በምድር ላይ የሚኖሩትን የሚወቅሰው እግዚአብሔርን ከማወቅ ጋር ምን በምድር ስለሌለ ነው?',
      en: 'According to Hosea 4:1, what along with the knowledge of God is lacking in the land, for which the LORD hath a controversy with the inhabitants?',
    },
    options: [
      { key: 'a', text: { am: 'እውነትና ምሕረት', en: 'truth and mercy' } },
      { key: 'b', text: { am: 'ወርቅና ብር', en: 'gold and silver' } },
      { key: 'c', text: { am: 'ሰላምና ጸጥታ', en: 'peace and quietness' } },
      { key: 'd', text: { am: 'ኃይልና ብርታት', en: 'strength and might' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በትንቢተ ሆሴዕ 4፡1 “እውነትና ምሕረት፥ እግዚአብሔርንም ማወቅ በምድር ስለሌለ እግዚአብሔር በምድር ላይ የሚኖሩትን ይወቅሳል” ተብሎ ተመዝግቧል።',
      en: 'Hosea 4:1 declares: "The LORD hath a controversy with the inhabitants of the land, because there is no truth, nor mercy, nor knowledge of God in the land."',
    },
    evidence: {
      verseId: '21bfcec4-cab0-586a-a18c-24206520c646',
      quoteAm: 'እውነትና ምሕረት',
    },
    excerpt: null,
  },

  // 9: am-malachi-54-4 -> b
  {
    passageId: 'am-malachi-54-4',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በትንቢተ ሚልክያስ 4፡5 መሠረት ታላቁና የሚያስፈራው የእግዚአብሔር ቀን ሳይመጣ እግዚአብሔር የትኛውን ነቢይ እንደሚልክ ተናገረ?',
      en: 'According to Malachi 4:5, which prophet did the LORD promise to send before the coming of the great and dreadful day of the LORD?',
    },
    options: [
      { key: 'a', text: { am: 'ነቢዩን ኤልሳዕን', en: 'Elisha the prophet' } },
      { key: 'b', text: { am: 'ነቢዩን ኤልያስን', en: 'Elijah the prophet' } },
      { key: 'c', text: { am: 'ነቢዩን ኢሳይያስን', en: 'Isaiah the prophet' } },
      { key: 'd', text: { am: 'ነቢዩን ሳሙኤልን', en: 'Samuel the prophet' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በትንቢተ ሚልክያስ 4፡5 “እነሆ፥ ታላቁና የሚያስፈራው የእግዚአብሔር ቀን ሳይመጣ ነቢዩን ኤልያስን እልክላችኋለሁ” ይላል።',
      en: 'Malachi 4:5 promises: "Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of the LORD."',
    },
    evidence: {
      verseId: 'c19b7f32-e951-5b9c-acdd-ff0a1d9a7c0a',
      quoteAm: 'ነቢዩን ኤልያስን',
    },
    excerpt: null,
  },

  // 10: am-mark-56-5 -> c
  {
    passageId: 'am-mark-56-5',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በማርቆስ ወንጌል 5፡1 መሠረት ጌታችን ኢየሱስ ክርስቶስና ደቀ መዛሙርቱ በባሕር ማዶ ወደ የትኛው አገር መጡ?',
      en: 'According to Mark 5:1, into which country did Jesus and His disciples come over unto the other side of the sea?',
    },
    options: [
      { key: 'a', text: { am: 'ወደ ጢሮስ አገር', en: 'into the country of Tyre' } },
      { key: 'b', text: { am: 'ወደ ሰማርያ አገር', en: 'into the country of Samaria' } },
      { key: 'c', text: { am: 'ወደ ጌርጌሴኖን አገር', en: 'into the country of the Gergasenes' } },
      { key: 'd', text: { am: 'ወደ ቂሣርያ አገር', en: 'into the country of Caesarea' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በማርቆስ ወንጌል 5፡1 ላይ “ወደ ባሕር ማዶም ወደ ጌርጌሴኖን አገር መጡ” ተብሎ ተጽፏል።',
      en: 'Mark 5:1 records: "And they came over unto the other side of the sea, into the country of the Gadarenes (Gergasenes)."',
    },
    evidence: {
      verseId: '9ba3cef7-4d64-54a4-ada3-d5c77e0935f3',
      quoteAm: 'ወደ ጌርጌሴኖን አገር',
    },
    excerpt: null,
  },

  // 11: am-acts-59-4 -> d
  {
    passageId: 'am-acts-59-4',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በሐዋርያት ሥራ 4፡4 መሠረት ቃሉን ሰምተው ያመኑት ወንዶች ቍጥር ስንት ያህል ሆነ?',
      en: 'According to Acts 4:4, what was the number of the men who heard the word and believed?',
    },
    options: [
      { key: 'a', text: { am: 'አንድ ሺህ ያህል', en: 'about one thousand' } },
      { key: 'b', text: { am: 'ሦስት ሺህ ያህል', en: 'about three thousand' } },
      { key: 'c', text: { am: 'አሥራ ሁለት ሺህ ያህል', en: 'about twelve thousand' } },
      { key: 'd', text: { am: 'አምስት ሺህ ያህል', en: 'about five thousand' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በሐዋርያት ሥራ 4፡4 “ቃሉንም ሰምተው ያመኑ ብዙ ሰዎች ናቸው፤ ያመኑት ወንዶች ቍጥርም አምስት ሺህ ያህል ሆነ” ይላል።',
      en: 'Acts 4:4 states: "Howbeit many of them which heard the word believed; and the number of the men was about five thousand."',
    },
    evidence: {
      verseId: '5a2acd5e-8f25-586b-ae72-fa7d1323626f',
      quoteAm: 'አምስት ሺህ ያህል',
    },
    excerpt: null,
  },

  // 12: am-second-corinthians-62-4 -> a
  {
    passageId: 'am-second-corinthians-62-4',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በ2ኛ ቆሮንቶስ 4፡5 መሠረት ሐዋርያት ራሳቸውን ሳይሆን ማን ጌታ እንደ ሆነ እንደሚሰብኩ መሰከሩ?',
      en: 'According to 2 Corinthians 4:5, who do the Apostles preach as Lord, and not themselves?',
    },
    options: [
      { key: 'a', text: { am: 'ኢየሱስ ክርስቶስን ጌታ እንደ ሆነ', en: 'Christ Jesus the Lord' } },
      { key: 'b', text: { am: 'የዚህን ዓለም ገዥ', en: 'the ruler of this world' } },
      { key: 'c', text: { am: 'የቀደሙትን ነገሥታት', en: 'the former kings' } },
      { key: 'd', text: { am: 'የፈሪሳውያንን አለቆች', en: 'the rulers of the Pharisees' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በ2ኛ ቆሮንቶስ 4፡5 “ኢየሱስ ክርስቶስን ጌታ እንደ ሆነ እንሰብካለን እንጂ ራሳችንን የምንሰብክ አይደለም” በማለት የሐዋርያዊ ስብከትን ማዕከል ይመሰክራል።',
      en: '2 Corinthians 4:5 teaches: "For we preach not ourselves, but Christ Jesus the Lord; and ourselves your servants for Jesus\' sake."',
    },
    evidence: {
      verseId: '7b8a7e0e-25f4-559f-aac2-e1d03c458e21',
      quoteAm: 'ኢየሱስ ክርስቶስን ጌታ እንደ ሆነ',
    },
    excerpt: null,
  },

  // 13: am-philippians-65-4 -> b [finish-the-verse]
  {
    passageId: 'am-philippians-65-4',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የሐዋርያው ጳውሎስን ምክር ባዶ ቦታ አሟሉ፦ “ፍጹምነታችሁም በሰው ሁሉ ዘንድ ይታወቅ። ___፤” (ፊልጵስዩስ 4፡5)',
      en: 'Fill in the blank to complete the apostolic exhortation: "Let your moderation be known unto all men. ___" (Philippians 4:5)',
    },
    options: [
      { key: 'a', text: { am: 'የእምነት ፍሬ ይብዛ', en: 'let the fruit of faith abound' } },
      { key: 'b', text: { am: 'እግዚአብሔር ቅርብ ነው', en: 'The Lord is at hand' } },
      { key: 'c', text: { am: 'ሰላም ከእናንተ ጋር ይሁን', en: 'peace be with you' } },
      { key: 'd', text: { am: 'ጸሎታችሁ ይሰማል', en: 'your prayer is heard' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በፊልጵስዩስ 4፡5 “ፍጹምነታችሁም በሰው ሁሉ ዘንድ ይታወቅ። እግዚአብሔር ቅርብ ነው” በማለት ተስፋንና ንጽሕናን ያሳስባል።',
      en: 'Philippians 4:5 encourages: "Let your moderation be known unto all men. The Lord is at hand."',
    },
    evidence: {
      verseId: 'ab137344-7476-5f05-abbc-67f7b6fbff31',
      quoteAm: 'እግዚአብሔር ቅርብ ነው',
    },
    excerpt: {
      am: 'ፍጹምነታችሁም በሰው ሁሉ ዘንድ ይታወቅ።',
      en: 'Let your moderation be known unto all men.',
    },
  },

  // 14: am-revelation-81-8 -> c
  {
    passageId: 'am-revelation-81-8',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በራእይ 8፡1 መሠረት ሰባተኛው ማኅተም በተፈታ ጊዜ በሰማይ ለምን ያህል ጊዜ ዝምታ ሆነ?',
      en: 'According to Revelation 8:1, when the seventh seal was opened, for about how long was there silence in heaven?',
    },
    options: [
      { key: 'a', text: { am: 'አንድ ቀን የሚያህል', en: 'about one day' } },
      { key: 'b', text: { am: 'አንድ ሰዓት ሙሉ', en: 'one full hour' } },
      { key: 'c', text: { am: 'ግማሽ ሰዓት የሚያህል', en: 'about the space of half an hour' } },
      { key: 'd', text: { am: 'ሰባት ሰዓት ያህል', en: 'about seven hours' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በራእይ 8፡1 “ሰባተኛውንም ማኅተም በፈታ ጊዜ ግማሽ ሰዓት የሚያህል ዝምታ በሰማይ ሆነ” ተብሎ ተጽፏል።',
      en: 'Revelation 8:1 records: "And when he had opened the seventh seal, there was silence in heaven about the space of half an hour."',
    },
    evidence: {
      verseId: '48b904dd-7492-5dcb-a762-304baa5e3b13',
      quoteAm: 'ግማሽ ሰዓት የሚያህል',
    },
    excerpt: null,
  },

  // 15: am-exodus-2-2 -> d
  {
    passageId: 'am-exodus-2-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘጸአት 2፡2 መሠረት የሙሴ እናት ልጇ መልካም እንደ ሆነ ባየች ጊዜ ለስንት ወር ያህል ሸሸገችው?',
      en: 'According to Exodus 2:2, for how many months did Moses’ mother hide him when she saw that he was a goodly child?',
    },
    options: [
      { key: 'a', text: { am: 'ስድስት ወር', en: 'six months' } },
      { key: 'b', text: { am: 'አንድ ወር', en: 'one month' } },
      { key: 'c', text: { am: 'ሰባት ወር', en: 'seven months' } },
      { key: 'd', text: { am: 'ሦስት ወር', en: 'three months' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በኦሪት ዘጸአት 2፡2 “ሴቲቱም ፀነሰች፤ ወንድ ልጅም ወለደች፤ መልካምም እንደሆነ በአዩ ጊዜ ሦስት ወር ሸሸጉት” ይላል።',
      en: 'Exodus 2:2 states: "And the woman conceived, and bare a son: and when she saw him that he was a goodly child, she hid him three months."',
    },
    evidence: {
      verseId: '39f59e2f-ae40-5a1b-a749-34d50699bb4a',
      quoteAm: 'ሦስት ወር',
    },
    excerpt: null,
  },

  // 16: am-numbers-4-2 -> a
  {
    passageId: 'am-numbers-4-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘኍልቍ 2፡3 መሠረት በምስክሩ ድንኳን ዙሪያ በመጀመሪያ በምሥራቅ በኩል የሚሰፍሩት የየትኛው ሰፈር ሰዎች እንደ ሆኑ ተነገረ?',
      en: 'According to Numbers 2:3, the people of which camp were commanded to pitch first on the east side of the tabernacle?',
    },
    options: [
      { key: 'a', text: { am: 'የይሁዳ ሰፈር ሰዎች', en: 'the people of the camp of Judah' } },
      { key: 'b', text: { am: 'የሮቤል ሰፈር ሰዎች', en: 'the people of the camp of Reuben' } },
      { key: 'c', text: { am: 'የኤፍሬም ሰፈር ሰዎች', en: 'the people of the camp of Ephraim' } },
      { key: 'd', text: { am: 'የዳን ሰፈር ሰዎች', en: 'the people of the camp of Dan' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘኍልቍ 2፡3 “በመጀመሪያ በምሥራቅ በኩል የሚሰፍሩት ከሠራዊቶቻቸው ጋር የይሁዳ ሰፈር ሰዎች ይሆናሉ” በማለት የይሁዳን ቅድምና ያመለክታል።',
      en: 'Numbers 2:3 directs: "And on the east side toward the rising of the sun shall they of the standard of the camp of Judah pitch throughout their armies."',
    },
    evidence: {
      verseId: '5cbc0223-2e52-5165-af8e-b3d53d7fb1ea',
      quoteAm: 'የይሁዳ ሰፈር ሰዎች',
    },
    excerpt: null,
  },

  // 17: am-deuteronomy-5-1 -> b
  {
    passageId: 'am-deuteronomy-5-1',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘዳግም 1፡2 መሠረት በሴይር ተራራ መንገድ ከኮሬብ እስከ ቃዴስ በርኔ ድረስ የስንት ቀን ጕዞ ነበር?',
      en: 'According to Deuteronomy 1:2, how many days’ journey is it from Horeb by the way of mount Seir unto Kadeshbarnea?',
    },
    options: [
      { key: 'a', text: { am: 'የሃያ ቀን ጕዞ', en: 'a twenty days’ journey' } },
      { key: 'b', text: { am: 'የዐሥራ አንድ ቀን ጕዞ', en: 'an eleven days’ journey' } },
      { key: 'c', text: { am: 'የአምስት ቀን ጕዞ', en: 'a five days’ journey' } },
      { key: 'd', text: { am: 'የስምንት ቀን ጕዞ', en: 'an eight days’ journey' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘዳግም 1፡2 “በሴይር ተራራ መንገድ ከኮሬብ እስከ ቃዴስ በርኔ ድረስ የዐሥራ አንድ ቀን ጕዞ ነው” ተብሎ ተጽፏል።',
      en: 'Deuteronomy 1:2 notes: "There are eleven days\' journey from Horeb by the way of mount Seir unto Kadeshbarnea."',
    },
    evidence: {
      verseId: '50236b6e-bd81-50bb-aec1-972867e8b8fb',
      quoteAm: 'የዐሥራ አንድ ቀን ጕዞ',
    },
    excerpt: null,
  },

  // 18: am-judges-7-1 -> c
  {
    passageId: 'am-judges-7-1',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በመጽሐፈ መሳፍንት 1፡4 መሠረት ይሁዳ በቤዜቅ ውስጥ ከጠላቶቹ ስንት ሰዎችን ገደለባቸው?',
      en: 'According to Judges 1:4, how many men did Judah slay in Bezek?',
    },
    options: [
      { key: 'a', text: { am: 'ሁለት ሺህ ሰዎችን', en: 'two thousand men' } },
      { key: 'b', text: { am: 'አምስት ሺህ ሰዎችን', en: 'five thousand men' } },
      { key: 'c', text: { am: 'ዐሥር ሺህ ሰዎችን', en: 'ten thousand men' } },
      { key: 'd', text: { am: 'ሃያ ሺህ ሰዎችን', en: 'twenty thousand men' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ መሳፍንት 1፡4 “እግዚአብሔርም ከነዓናውያንንና ፌርዜዎናውያንን በእጁ አሳልፎ ሰጣቸው፤ ከእነርሱም በቤዜቅ ውስጥ ዐሥር ሺህ ሰዎችን ገደለባቸው” ይላል።',
      en: 'Judges 1:4 records: "And Judah went up; and the LORD delivered the Canaanites and the Perizzites into their hand: and they slew of them in Bezek ten thousand men."',
    },
    evidence: {
      verseId: 'a18411c4-0366-5966-aead-bcaf848a1cc3',
      quoteAm: 'ዐሥር ሺህ ሰዎችን',
    },
    excerpt: null,
  },

  // 19: am-ruth-8-1 -> d
  {
    passageId: 'am-ruth-8-1',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በመጽሐፈ ሩት 1፡2 መሠረት በራብ ምክንያት ከቤተ ልሔም ይሁዳ ተነሥቶ ወደ ሞዓብ ምድር የሄደው የኑኃሚን ባል ስሙ ማን ነበረ?',
      en: 'According to Ruth 1:2, what was the name of Naomi’s husband who went from Bethlehemjudah to dwell in the country of Moab?',
    },
    options: [
      { key: 'a', text: { am: 'ቦዔዝ', en: 'Boaz' } },
      { key: 'b', text: { am: 'ኢዮቤድ', en: 'Obed' } },
      { key: 'c', text: { am: 'እሴይ', en: 'Jesse' } },
      { key: 'd', text: { am: 'አቤሜሌክ', en: 'Elimelech (Abimelech)' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመጽሐፈ ሩት 1፡2 “የሰውዮውም ስም አቤሜሌክ፥ የሚስቱም ስም ኑኃሚን፥ የሁለቱም ልጆች ስም መሐሎንና ኬሌዎን ነበረ” ተብሎ ተጽፏል።',
      en: 'Ruth 1:2 states: "And the name of the man was Elimelech, and the name of his wife Naomi, and the name of his two sons Mahlon and Chilion."',
    },
    evidence: {
      verseId: '54d4cad7-aab7-5930-a208-2bb0499143c5',
      quoteAm: 'አቤሜሌክ',
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

  console.log('Validating Batch 004 response through generator validator...')
  const validated = await validateAmharicQuestionResponse(sourceBatch, modelId, responseEnvelope, existingPrompts)
  console.log(`Generator validation PASSED! ${validated.drafts.length} drafts produced.`)

  // Write outputs to batch-004
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
  console.log('Batch 004 successfully generated, validated, and ingested into the library!')
}

run().catch((err) => {
  console.error(err)
  process.exit(1)
})
