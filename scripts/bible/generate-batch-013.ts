/**
 * Offline generator for Faith Challenges Batch 013
 * 20 source-grounded bilingual questions from verified Amharic Bible passages.
 */
import { readFileSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'
import { validateAmharicQuestionResponse } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { adaptEditorialBatchToCms } from './adapt-drafts-for-cms'
import { previewQuestionImport } from '../../src/lib/play/questionLibrary'
import { runCampaign } from './campaign-orchestrator'

const BATCH_DIR = 'artifacts/faith-challenges/batch-013'
const sourceBatch = JSON.parse(readFileSync(join(BATCH_DIR, 'source-batch.json'), 'utf8'))
const sourceManifest = JSON.parse(readFileSync(join(BATCH_DIR, 'source-manifest.json'), 'utf8'))
const existingPrompts = JSON.parse(readFileSync(join(BATCH_DIR, 'existing-prompts.json'), 'utf8'))
const modelId = 'copilot-agent-mode'

const questions = [
  // 0: am-genesis-1-15 -> a (trivia)
  {
    passageId: 'am-genesis-1-15',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘፍጥረት 15፡1 መሠረት እግዚአብሔር ለአብራም በራእይ ምን እሆንሃለሁ አለው?',
      en: 'According to Genesis 15:1, what did the LORD say He would be to Abram in a vision?',
    },
    options: [
      { key: 'a', text: { am: 'እኔ ጋሻ እሆንሃለሁ', en: 'I am thy shield' } },
      { key: 'b', text: { am: 'እኔ ጽኑዕ ግንብ እሆንሃለሁ', en: 'I am thy strong tower' } },
      { key: 'c', text: { am: 'እኔ ታላቅ ንጉሥ እሆንሃለሁ', en: 'I am thy great king' } },
      { key: 'd', text: { am: 'እኔ አገልጋይ እልክልሃለሁ', en: 'I will send thee a servant' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘፍጥረት 15፡1 “አብራም ሆይ፥ አትፍራ፤ እኔ ጋሻ እሆንሃለሁ፤ ዋጋህም በእኔ ዘንድ እጅግ ብዙ ነው” ተብሎ ተጽፏል።',
      en: 'Genesis 15:1 states: "Fear not, Abram: I am thy shield, and thy exceeding great reward."',
    },
    evidence: {
      verseId: 'da9fa3ba-6639-5a89-a2a3-d020320d8a34',
      quoteAm: 'እኔ ጋሻ እሆንሃለሁ',
    },
    excerpt: null,
  },

  // 1: am-leviticus-3-17 -> b (finish-the-verse)
  {
    passageId: 'am-leviticus-3-17',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘሌዋውያን 17፡4 ያለውን ኃይለ ቃል ያሟሉ፦ “ደሙ በዚያ ሰው ላይ ይቈጠርበታል፤ ደም አፍስሶአልና፤ ___”',
      en: 'Complete the verse in Leviticus 17:4: "blood shall be imputed unto that man; he hath shed blood; and ___"',
    },
    options: [
      { key: 'a', text: { am: 'ከሰፈሩም ውጭ ይወሰድ', en: 'he shall be taken outside the camp' } },
      { key: 'b', text: { am: 'ያም ከሕዝቡ ተለይቶ ይጥፋ', en: 'that man shall be cut off from among his people' } },
      { key: 'c', text: { am: 'መሥዋዕቱም አይሠምርለትም', en: 'his offering shall not be accepted' } },
      { key: 'd', text: { am: 'ካህናቱ ይገሥጹት', en: 'the priests shall rebuke him' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘሌዋውያን 17፡4 “ደሙ በዚያ ሰው ላይ ይቈጠርበታል፤ ደም አፍስሶአልና፤ ያም ከሕዝቡ ተለይቶ ይጥፋ” ይላል።',
      en: 'Leviticus 17:4 declares that the man who shed blood unlawfully shall be cut off from among his people.',
    },
    evidence: {
      verseId: '9736cd11-d87a-56a4-a423-c17176787035',
      quoteAm: 'ያም ከሕዝቡ ተለይቶ ይጥፋ',
    },
    excerpt: {
      am: 'ደሙ በዚያ ሰው ላይ ይቈጠርበታል፤ ደም አፍስሶአልና፤',
      en: 'blood shall be imputed unto that man; he hath shed blood; and',
    },
  },

  // 2: am-joshua-6-14 -> c (trivia)
  {
    passageId: 'am-joshua-6-14',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ኢያሱ 14፡2 መሠረት ምድሪቱን በዕጣ ያከፋፈሏቸው ለስንት ነገድና ለእኩሌታው ነበር?',
      en: 'According to Joshua 14:2, for how many tribes and the half tribe was the inheritance divided by lot?',
    },
    options: [
      { key: 'a', text: { am: 'ለዐሥራ ሁለቱ ነገዶች በሙሉ', en: 'for all twelve tribes' } },
      { key: 'b', text: { am: 'ለሰባቱ ነገዶችና ለእኩሌታው', en: 'for seven tribes and the half tribe' } },
      { key: 'c', text: { am: 'ለዘጠኙ ነገድና ለእኩሌታው', en: 'for the nine tribes, and for the half tribe' } },
      { key: 'd', text: { am: 'ለአምስቱ ነገዶች ብቻ', en: 'for five tribes only' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ኢያሱ 14፡2 “እግዚአብሔር በሙሴ እጅ እንዳዘዘ ለዘጠኙ ነገድና ለእኩሌታው በየርስታቸው በዕጣ አከፋፈሉአቸው” ይላል።',
      en: 'Joshua 14:2 states: "By lot was their inheritance, as the LORD commanded by the hand of Moses, for the nine tribes, and for the half tribe."',
    },
    evidence: {
      verseId: 'ab51b1b6-14c5-5107-a9cd-4023a140893e',
      quoteAm: 'ለዘጠኙ ነገድና ለእኩሌታው',
    },
    excerpt: null,
  },

  // 3: am-first-chronicles-13-13 -> d (finish-the-verse)
  {
    passageId: 'am-first-chronicles-13-13',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ዜና መዋዕል ቀዳማዊ 13፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “ዳዊትም ከሻለቆችና ከመቶ አለቆች፥ ___”',
      en: 'Complete the verse in 1 Chronicles 13:1: "And David consulted with the captains of thousands and hundreds, and ___"',
    },
    options: [
      { key: 'a', text: { am: 'ሠራዊቱን በሙሉ አሰለፈ', en: 'set all his host in array' } },
      { key: 'b', text: { am: 'ታቦቱን ሊያመጣ ተነሣ', en: 'arose to bring the ark' } },
      { key: 'c', text: { am: 'የምሥጋና ዝማሬን ጀመረ', en: 'began songs of praise' } },
      { key: 'd', text: { am: 'ከአለቆቹም ሁሉ ጋር ተማከረ', en: 'with every leader' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በ1 ዜና መዋዕል 13፡1 “ዳዊትም ከሻለቆችና ከመቶ አለቆች፥ ከአለቆቹም ሁሉ ጋር ተማከረ” ይላል።',
      en: '1 Chronicles 13:1 reads: "And David consulted with the captains of thousands and hundreds, and with every leader."',
    },
    evidence: {
      verseId: 'adbc040d-8f33-5e65-a6c9-24015a4a2c48',
      quoteAm: 'ከአለቆቹም ሁሉ ጋር ተማከረ',
    },
    excerpt: {
      am: 'ዳዊትም ከሻለቆችና ከመቶ አለቆች፥',
      en: 'And David consulted with the captains of thousands and hundreds, and',
    },
  },

  // 4: am-enoch-16-25 -> a (trivia)
  {
    passageId: 'am-enoch-16-25',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ሄኖክ 25፡1 መሠረት ለነፋሳት ሁሉ የተከፈቱ ስንት መስኮቶችን በምድር ዳርቻ አየ?',
      en: 'According to Enoch 25:1, how many portals open for all the winds did Enoch see at the ends of the earth?',
    },
    options: [
      { key: 'a', text: { am: 'ዐሥራ ሁለት መስኮቶችን', en: 'twelve portals' } },
      { key: 'b', text: { am: 'ሰባት መስኮቶችን', en: 'seven portals' } },
      { key: 'c', text: { am: 'አራት መስኮቶችን', en: 'four portals' } },
      { key: 'd', text: { am: 'ሃያ አራት መስኮቶችን', en: 'twenty-four portals' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ሄኖክ 25፡1 “ለነፋስት ሁሉ የተከፈቱ ዐሥራ ሁለት መስኮቶችን በምድር ዳርቻ አየሁ” ይላል።',
      en: 'Enoch 25:1 records twelve portals open for all the winds at the ends of the earth.',
    },
    evidence: {
      verseId: '2af3537b-ce83-5cc4-a55e-48d3b30a01b6',
      quoteAm: 'ዐሥራ ሁለት መስኮቶችን',
    },
    excerpt: null,
  },

  // 5: am-first-meqabyan-24-13 -> b (finish-the-verse)
  {
    passageId: 'am-first-meqabyan-24-13',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 13፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “በቍጣዬ በያዝኋቸው ጊዜ ይዋረዳሉና፥ ይቀሠፋሉምና ዛሬ ራሳቸውን ለሚያስታብዩ ___”',
      en: 'Complete the verse in 1 Meqabyan 13:1: "For when I hold them in my wrath they shall be brought low and plagued; therefore today to those that magnify themselves ___"',
    },
    options: [
      { key: 'a', text: { am: 'ለባቢሎንና ለግብፅ ሰዎች ሁሉ ወዮላቸው', en: 'woe to all people of Babylon and Egypt' } },
      { key: 'b', text: { am: 'ለጢሮስና ለሲዶና፥ ለይሁዳ ሀገር አውራጃዎችም ሁሉ ወዮላቸው', en: 'woe to Tyre and Sidon and all provinces of Judah' } },
      { key: 'c', text: { am: 'ለከነዓንና ለአሞጽ አውራጃዎች ወዮላቸው', en: 'woe to the districts of Canaan and Ammon' } },
      { key: 'd', text: { am: 'ለሰማርያና ለገሊላ ከተሞች ወዮላቸው', en: 'woe to cities of Samaria and Galilee' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 13፡1 “ዛሬ ራሳቸውን ለሚያስታብዩ ለጢሮስና ለሲዶና፥ ለይሁዳ ሀገር አውራጃዎችም ሁሉ ወዮላቸው” ይላል።',
      en: '1 Meqabyan 13:1 proclaims woe unto Tyre and Sidon and the districts of Judah.',
    },
    evidence: {
      verseId: '03e8b3b9-f43e-5a91-af62-2abc0650a204',
      quoteAm: 'ለጢሮስና ለሲዶና፥ ለይሁዳ ሀገር አውራጃዎችም ሁሉ ወዮላቸው',
    },
    excerpt: {
      am: 'በቍጣዬ በያዝኋቸው ጊዜ ይዋረዳሉና፥ ይቀሠፋሉምና ዛሬ ራሳቸውን ለሚያስታብዩ',
      en: 'For when I hold them in my wrath they shall be brought low and plagued; therefore today to those that magnify themselves',
    },
  },

  // 6: am-hosea-43-13 -> c (trivia)
  {
    passageId: 'am-hosea-43-13',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በትንቢተ ሆሴዕ 13፡4 መሠረት ከእግዚአብሔር በቀር ሌላ ማን እንደሌለ ተጽፏል?',
      en: 'According to Hosea 13:4, who else is there besides God?',
    },
    options: [
      { key: 'a', text: { am: 'በሰማይና በምድር የሚገዛ የለምና', en: 'none that ruleth in heaven and earth' } },
      { key: 'b', text: { am: 'የሚረዳህ ኃያል የለምና', en: 'no mighty one that helpeth thee' } },
      { key: 'c', text: { am: 'ከእኔ በቀር የሚያድንህ የለምና', en: 'for there is no saviour beside me' } },
      { key: 'd', text: { am: 'ወደ ሕይወት የሚመራህ የለምና', en: 'none that leadeth thee to life' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በትንቢተ ሆሴዕ 13፡4 “ከእኔ በቀር ሌላ አምላክ አትወቅ፤ ከእኔ በቀር የሚያድንህ የለምና” ተብሎ ተጽፏል።',
      en: 'Hosea 13:4 states: "and thou shalt know no god but me: for there is no saviour beside me."',
    },
    evidence: {
      verseId: '9dcd4969-386d-5ff4-a7ff-a7dd74853842',
      quoteAm: 'ከእኔ በቀር የሚያድንህ የለምና',
    },
    excerpt: null,
  },

  // 7: am-acts-59-13 -> d (finish-the-verse)
  {
    passageId: 'am-acts-59-13',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በየሐዋርያት ሥራ 13፡2 ያለውን ኃይለ ቃል ያሟሉ፦ “የእግዚአብሔርን ሥራ ሲሠሩ፥ ሲጾሙም መንፈስ ቅዱስ፥ ___”',
      en: 'Complete the verse in Acts 13:2: "As they ministered to the Lord, and fasted, the Holy Ghost said, ___"',
    },
    options: [
      { key: 'a', text: { am: 'ወደ ኢየሩሳሌም ፈጥናችሁ ሂዱ አላቸው', en: 'go quickly unto Jerusalem' } },
      { key: 'b', text: { am: 'የወንጌልን ቃል ለአሕዛብ አስተምሩ አላቸው', en: 'teach the word of the Gospel to the Gentiles' } },
      { key: 'c', text: { am: 'በጸሎትና በምልጃ ተግታችሁ ኑሩ አላቸው', en: 'continue steadfast in prayer and supplication' } },
      { key: 'd', text: { am: '“በርናባስንና ሳውልን እኔ ለፈለግኋቸው ሥራ ለዩልኝ” አላቸው', en: 'Separate me Barnabas and Saul for the work whereunto I have called them' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በየሐዋርያት ሥራ 13፡2 “የእግዚአብሔርን ሥራ ሲሠሩ፥ ሲጾሙም መንፈስ ቅዱስ፥ “በርናባስንና ሳውልን እኔ ለፈለግኋቸው ሥራ ለዩልኝ” አላቸው” ይላል።',
      en: 'Acts 13:2 records the Holy Spirit saying: "Separate me Barnabas and Saul for the work whereunto I have called them."',
    },
    evidence: {
      verseId: '13fffcc3-2bce-5aba-a9f1-8c0506ae21d0',
      quoteAm: '“በርናባስንና ሳውልን እኔ ለፈለግኋቸው ሥራ ለዩልኝ” አላቸው',
    },
    excerpt: {
      am: 'የእግዚአብሔርን ሥራ ሲሠሩ፥ ሲጾሙም መንፈስ ቅዱስ፥',
      en: 'As they ministered to the Lord, and fasted, the Holy Ghost said,',
    },
  },

  // 8: am-second-corinthians-62-13 -> a (trivia)
  {
    passageId: 'am-second-corinthians-62-13',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በ2ኛ ቆሮንቶስ 13፡1 መሠረት ነገር ሁሉ በስንት ምስክሮች አፍ እንደሚጸና ተጠቅሷል?',
      en: 'According to 2 Corinthians 13:1, in the mouth of how many witnesses shall every word be established?',
    },
    options: [
      { key: 'a', text: { am: 'በሁለት ወይም በሦስት ምስክር አፍ', en: 'in the mouth of two or three witnesses' } },
      { key: 'b', text: { am: 'በሰባት ምስክሮች ፊት', en: 'before seven witnesses' } },
      { key: 'c', text: { am: 'በአንድ እውነተኛ ምስክር', en: 'by one true witness' } },
      { key: 'd', text: { am: 'በአሥራ ሁለት ሐዋርያት ፊት', en: 'before the twelve apostles' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በ2ኛ ቆሮንቶስ 13፡1 “ነገር ሁሉ፥ በሁለት ወይም በሦስት ምስክር አፍ የሚጸና አይደለምን?” ይላል።',
      en: '2 Corinthians 13:1 states: "In the mouth of two or three witnesses shall every word be established."',
    },
    evidence: {
      verseId: 'f99a18e9-6cdd-5549-a6fd-1e38e2c4b309',
      quoteAm: 'በሁለት ወይም በሦስት ምስክር አፍ',
    },
    excerpt: null,
  },

  // 9: am-exodus-2-11 -> b (finish-the-verse)
  {
    passageId: 'am-exodus-2-11',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘፀአት 11፡5 ያለውን ኃይለ ቃል ያሟሉ፦ “በግብፅም ሀገር ያለ በኵር ሁሉ፥ በዙፋኑ ከሚቀመጠው ከፈርዖን በኵር ጀምሮ በወፍጮ እግር እስካለችው እስከ አገልጋዪቱ በኵር ድረስ፥ ___”',
      en: 'Complete the verse in Exodus 11:5: "And all the firstborn in the land of Egypt shall die, from the firstborn of Pharaoh that sitteth upon his throne, even unto the firstborn of the maidservant that is behind the mill; and ___"',
    },
    options: [
      { key: 'a', text: { am: 'የምድሪቱ ንብረት ሁሉ ይጠፋል', en: 'all wealth of the land shall perish' } },
      { key: 'b', text: { am: 'የከብቱም በኵር ሁሉ ይሞታል', en: 'all the firstborn of beasts' } },
      { key: 'c', text: { am: 'የግብፅ ሠራዊት ሁሉ ይደነግጣል', en: 'all Egypt’s army shall be dismayed' } },
      { key: 'd', text: { am: 'የከተማይቱ ቅጥሮች ሁሉ ይፈርሳሉ', en: 'all walls of the city shall crumble' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘፀአት 11፡5 “በግብፅም ሀገር ያለ በኵር ሁሉ፥ በዙፋኑ ከሚቀመጠው ከፈርዖን በኵር ጀምሮ በወፍጮ እግር እስካለችው እስከ አገልጋዪቱ በኵር ድረስ፥ የከብቱም በኵር ሁሉ ይሞታል” ይላል።',
      en: 'Exodus 11:5 declares the death of all firstborn in Egypt, from Pharaoh’s firstborn unto the maidservant’s and of beasts.',
    },
    evidence: {
      verseId: 'd2f4357b-e13a-5f96-a82b-07e06a2f6f2c',
      quoteAm: 'የከብቱም በኵር ሁሉ ይሞታል',
    },
    excerpt: {
      am: 'በግብፅም ሀገር ያለ በኵር ሁሉ፥ በዙፋኑ ከሚቀመጠው ከፈርዖን በኵር ጀምሮ በወፍጮ እግር እስካለችው እስከ አገልጋዪቱ በኵር ድረስ፥',
      en: 'from the firstborn of Pharaoh that sitteth upon his throne, even unto the firstborn of the maidservant that is behind the mill; and',
    },
  },

  // 10: am-numbers-4-19 -> c (trivia)
  {
    passageId: 'am-numbers-4-19',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘኍልቍ 19፡2 መሠረት ለእስራኤል ልጆች እንዲያመጡ የታዘዘችው ጊደር ምን ዓይነት ነበረች?',
      en: 'According to Numbers 19:2, what kind of heifer were the children of Israel commanded to bring?',
    },
    options: [
      { key: 'a', text: { am: 'ነጭ ጊደር', en: 'a white heifer' } },
      { key: 'b', text: { am: 'ጥቁር ላም', en: 'a black cow' } },
      { key: 'c', text: { am: 'ቀይ ጊደር', en: 'a red heifer' } },
      { key: 'd', text: { am: 'የተዥጎረጎረች ወይፈን', en: 'a speckled heifer' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በኦሪት ዘኍልቍ 19፡2 “መልካሚቱን፥ ነውርም የሌለባትን፥ ቀንበርም ያልተጫነባትን ቀይ ጊደር ያመጡልህ ዘንድ ለእስራኤል ልጆች ንገራቸው” ይላል።',
      en: 'Numbers 19:2 commands: "that they bring thee a red heifer without spot, wherein is no blemish, and upon which never came yoke."',
    },
    evidence: {
      verseId: '33611a4f-1afe-531b-ad76-37710705f038',
      quoteAm: 'ቀይ ጊደር',
    },
    excerpt: null,
  },

  // 11: am-deuteronomy-5-10 -> d (finish-the-verse)
  {
    passageId: 'am-deuteronomy-5-10',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘዳግም 10፡4 ያለውን ኃይለ ቃል ያሟሉ፦ “እግዚአብሔርም በተራራው ላይ በእሳት መካከል የተናገራችሁን ዐሠርቱን ቃላት ቀድሞ ተጽፈው እንደ ነበረ በጽላቱ ላይ ጻፈ፤ ___”',
      en: 'Complete the verse in Deuteronomy 10:4: "And he wrote on the tables, according to the first writing, the ten commandments, which the LORD spake unto you in the mount out of the midst of the fire: and ___"',
    },
    options: [
      { key: 'a', text: { am: 'ሕዝቡም ሁሉ በአንድነት ሰሙ', en: 'and all the people heard together' } },
      { key: 'b', text: { am: 'በታቦቱም ውስጥ አኖራቸው', en: 'and laid them in the ark' } },
      { key: 'c', text: { am: 'ካህናቱም በፊቱ አከበሩት', en: 'and the priests sanctified it' } },
      { key: 'd', text: { am: 'እግዚአብሔርም እነርሱን ለእኔ ሰጠኝ', en: 'the LORD gave them unto me' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በኦሪት ዘዳግም 10፡4 “እግዚአብሔርም በተራራው ላይ በእሳት መካከል የተናገራችሁን ዐሠርቱን ቃላት ቀድሞ ተጽፈው እንደ ነበረ በጽላቱ ላይ ጻፈ፤ እግዚአብሔርም እነርሱን ለእኔ ሰጠኝ” ይላል።',
      en: 'Deuteronomy 10:4 records: "and the LORD gave them unto me."',
    },
    evidence: {
      verseId: '82d333e6-139a-52e7-a042-7973c8a3c3bc',
      quoteAm: 'እግዚአብሔርም እነርሱን ለእኔ ሰጠኝ',
    },
    excerpt: {
      am: 'እግዚአብሔርም በተራራው ላይ በእሳት መካከል የተናገራችሁን ዐሠርቱን ቃላት ቀድሞ ተጽፈው እንደ ነበረ በጽላቱ ላይ ጻፈ፤',
      en: 'the ten commandments, which the LORD spake unto you in the mount out of the midst of the fire: and',
    },
  },

  // 12: am-judges-7-10 -> a (trivia)
  {
    passageId: 'am-judges-7-10',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ መሳፍንት 10፡2 መሠረት ቶላ እስራኤልን ስንት ዓመት ገዛ?',
      en: 'According to Judges 10:2, how many years did Tola judge Israel?',
    },
    options: [
      { key: 'a', text: { am: 'ሃያ ሦስት ዓመት ገዛ', en: 'twenty and three years' } },
      { key: 'b', text: { am: 'አርባ ዓመት ገዛ', en: 'forty years' } },
      { key: 'c', text: { am: 'ዐሥራ ሁለት ዓመት ገዛ', en: 'twelve years' } },
      { key: 'd', text: { am: 'ሠላሳ ዓመት ገዛ', en: 'thirty years' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ መሳፍንት 10፡2 “እስራኤልንም ሃያ ሦስት ዓመት ገዛ፤ ሞተም፤ በሳምርም ተቀበረ” ይላል።',
      en: 'Judges 10:2 states: "And he judged Israel twenty and three years, and died, and was buried in Shamir."',
    },
    evidence: {
      verseId: 'ac6d647b-5fe3-5e61-a0a2-bec6bbfe751f',
      quoteAm: 'ሃያ ሦስት ዓመት ገዛ',
    },
    excerpt: null,
  },

  // 13: am-second-chronicles-14-9 -> b (finish-the-verse)
  {
    passageId: 'am-second-chronicles-14-9',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ዜና መዋዕል ካልዕ 9፡2 ያለውን ኃይለ ቃል ያሟሉ፦ “ሰሎሞንም የጠየቀችውን ሁሉ ፈታላት፤ ___”',
      en: 'Complete the verse in 2 Chronicles 9:2: "And Solomon told her all her questions: and ___"',
    },
    options: [
      { key: 'a', text: { am: 'ንግሥቲቱም እጅግ ተደነቀች', en: 'and the queen was greatly amazed' } },
      { key: 'b', text: { am: 'ሰሎሞንም ያልፈታው ነገር አልነበረም', en: 'there was nothing hid from Solomon which he told her not' } },
      { key: 'c', text: { am: 'የወርቅ ስጦታዎችንም ሰጣት', en: 'and gave her golden gifts' } },
      { key: 'd', text: { am: 'በሰላምም ወደ ሀገሯ ተመለሰች', en: 'and she returned in peace to her land' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በ2 ዜና መዋዕል 9፡2 “ሰሎሞንም የጠየቀችውን ሁሉ ፈታላት፤ ሰሎሞንም ያልፈታው ነገር አልነበረም” ይላል።',
      en: '2 Chronicles 9:2 states: "And Solomon told her all her questions: and there was nothing hid from Solomon which he told her not."',
    },
    evidence: {
      verseId: '11946862-a3f3-5f04-a73d-152d45e70c9b',
      quoteAm: 'ሰሎሞንም ያልፈታው ነገር አልነበረም',
    },
    excerpt: {
      am: 'ሰሎሞንም የጠየቀችውን ሁሉ ፈታላት፤',
      en: 'And Solomon told her all her questions: and',
    },
  },

  // 14: am-jubilees-15-9 -> c (trivia)
  {
    passageId: 'am-jubilees-15-9',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ኩፋሌ 9፡1 መሠረት ርስት የተከፋፈሉት ለየትኞቹ የኖኅ ልጆች እንደ ሆነ ተጽፏል?',
      en: 'According to Jubilees 9:1, to which sons of Noah was the inheritance divided?',
    },
    options: [
      { key: 'a', text: { am: 'ለአብርሃምና ለሎጥ ብቻ', en: 'to Abraham and Lot only' } },
      { key: 'b', text: { am: 'ለይስሐቅና ለያዕቆብ', en: 'to Isaac and Jacob' } },
      { key: 'c', text: { am: 'ለካምና ለሴም ለያፌትም', en: 'to Ham and Shem and Japheth' } },
      { key: 'd', text: { am: 'ለይሁዳና ለዮሴፍ', en: 'to Judah and Joseph' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ኩፋሌ 9፡1 “ለካምና ለሴም ለያፌትም ርስት ልትሆናቸው” ተብሎ ተጽፏል።',
      en: 'Jubilees 9:1 records the partition of the earth among Ham, Shem, and Japheth.',
    },
    evidence: {
      verseId: 'd2426042-aa7c-5e5d-ad4b-b5f36c159a90',
      quoteAm: 'ለካምና ለሴም ለያፌትም',
    },
    excerpt: null,
  },

  // 15: am-tobit-21-7 -> d (finish-the-verse)
  {
    passageId: 'am-tobit-21-7',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ጦቢት 7፡5 ያለውን ኃይለ ቃል ያሟሉ፦ “እነርሱም፥ “አዎ ደኅና ነው” አሉት፤ ጦብያም፥ ___”',
      en: 'Complete the verse in Tobit 7:5: "And they said, He is in good health: and Tobias said, ___"',
    },
    options: [
      { key: 'a', text: { am: '“ወንድሜ ነው” አለው', en: 'He is my brother' } },
      { key: 'b', text: { am: '“ጌታዬ ነው” አለው', en: 'He is my lord' } },
      { key: 'c', text: { am: '“አጎቴ ነው” አለው', en: 'He is my uncle' } },
      { key: 'd', text: { am: '“አባቴ ነው” አለው', en: 'He is my father' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመጽሐፈ ጦቢት 7፡5 “እነርሱም፥ “አዎ ደኅና ነው” አሉት፤ ጦብያም፥ “አባቴ ነው” አለው” ይላል።',
      en: 'Tobit 7:5 records: "And they said, He is in good health: and Tobias said, He is my father."',
    },
    evidence: {
      verseId: '0aa40156-e986-5409-a08b-9c84c0ff2b7d',
      quoteAm: '“አባቴ ነው” አለው',
    },
    excerpt: {
      am: 'እነርሱም፥ “አዎ ደኅና ነው” አሉት፤ ጦብያም፥',
      en: 'And they said, He is in good health: and Tobias said,',
    },
  },

  // 16: am-judith-22-6 -> a (trivia)
  {
    passageId: 'am-judith-22-6',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ዮዲት 6፡1 መሠረት የአሦር ሠራዊት አለቃ ማን ተብሎ ተጠርቷል?',
      en: 'According to Judith 6:1, who is named as the chief captain of the army of Assur?',
    },
    options: [
      { key: 'a', text: { am: 'የአሦር ሠራዊት አለቃ ሆሎፎርኒስ', en: 'Holofernes, the chief captain of the army of Assur' } },
      { key: 'b', text: { am: 'የባቢሎን ንጉሥ ናቡከደነፆር', en: 'Nebuchadnezzar king of Babylon' } },
      { key: 'c', text: { am: 'የሞአብ አለቃ አክዮር', en: 'Achior the leader of Moab' } },
      { key: 'd', text: { am: 'የፋርስ ንጉሥ ቂሮስ', en: 'Cyrus king of Persia' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ዮዲት 6፡1 “የአሦር ሠራዊት አለቃ ሆሎፎርኒስ አክዮርን ... እንዲህ አለው” ይላል።',
      en: 'Judith 6:1 identifies Holofernes as the chief captain of the army of Assur.',
    },
    evidence: {
      verseId: '6522efaa-b463-59cf-a51a-594ff19f2c7c',
      quoteAm: 'የአሦር ሠራዊት አለቃ ሆሎፎርኒስ',
    },
    excerpt: null,
  },

  // 17: am-job-27-6 -> b (finish-the-verse)
  {
    passageId: 'am-job-27-6',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ኢዮብ 6፡4 ያለውን ኃይለ ቃል ያሟሉ፦ “እነሆ፥ የእግዚአብሔር ፍላጻ ___”',
      en: 'Complete the verse in Job 6:4: "For the arrows of the Almighty are ___"',
    },
    options: [
      { key: 'a', text: { am: 'ከሩቅ ተወርውሯል', en: 'cast from afar' } },
      { key: 'b', text: { am: 'በሥጋዬ ላይ ነው', en: 'within me' } },
      { key: 'c', text: { am: 'በልቤ ውስጥ ተተክሏል', en: 'planted in my heart' } },
      { key: 'd', text: { am: 'በፊቴ ወድቋል', en: 'fallen before me' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ ኢዮብ 6፡4 “እነሆ፥ የእግዚአብሔር ፍላጻ በሥጋዬ ላይ ነው፤” ይላል።',
      en: 'Job 6:4 states: "For the arrows of the Almighty are within me, the poison whereof drinketh up my spirit."',
    },
    evidence: {
      verseId: 'eca8f4ad-4c9e-5ac9-a8fa-b7d285232932',
      quoteAm: 'በሥጋዬ ላይ ነው',
    },
    excerpt: {
      am: 'እነሆ፥ የእግዚአብሔር ፍላጻ',
      en: 'For the arrows of the Almighty are',
    },
  },

  // 18: am-psalms-28-3 -> c (trivia)
  {
    passageId: 'am-psalms-28-3',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በመዝሙረ ዳዊት 3፡3 መሠረት ዳዊት ለእግዚአብሔር ምን ብሎ ጠራው?',
      en: 'According to Psalm 3:3, what did David call the LORD?',
    },
    options: [
      { key: 'a', text: { am: 'የፍርድ ዙፋኔ ነህ', en: 'thou art my throne of judgment' } },
      { key: 'b', text: { am: 'የሕይወቴ ፀሐይ ነህ', en: 'thou art the sun of my life' } },
      { key: 'c', text: { am: 'አንተ ግን አቤቱ መጠጊያዬ ነኽ', en: 'But thou, O LORD, art a shield for me' } },
      { key: 'd', text: { am: 'የምሥጋና መዝሙሬ ነህ', en: 'thou art my song of praise' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመዝሙረ ዳዊት 3፡3 “አንተ ግን አቤቱ መጠጊያዬ ነኽ ክብሬንና ራሴንም ከፍ ከፍ የምታደርገው አንተ ነኽ” ይላል።',
      en: 'Psalm 3:3 states: "But thou, O LORD, art a shield for me; my glory, and the lifter up of mine head."',
    },
    evidence: {
      verseId: 'ad8090cb-75b2-5360-a584-44d213667b4a',
      quoteAm: 'አንተ ግን አቤቱ መጠጊያዬ ነኽ',
    },
    excerpt: null,
  },

  // 19: am-wisdom-31-1 -> d (finish-the-verse)
  {
    passageId: 'am-wisdom-31-1',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ጥበብ 1፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “የምድር ገዥዎች ሆይ፥ ጽድቅን ውደዷት፥ የእግዚአብሔርንም ኀይል በበጎ ዕውቀት አስቡት፥ ___”',
      en: 'Complete the verse in Wisdom 1:1: "Love righteousness, ye that be judges of the earth: think of the Lord with a good (heart), and ___"',
    },
    options: [
      { key: 'a', text: { am: 'በፍርሃት ተገዙለት', en: 'serve him in fear' } },
      { key: 'b', text: { am: 'በመቅደሱ ውስጥ አመስግኑት', en: 'praise him in his holy place' } },
      { key: 'c', text: { am: 'ትእዛዙንም ዘወትር ጠብቁ', en: 'keep his commandments always' } },
      { key: 'd', text: { am: 'በቅን ልቡናም ፈልጉት', en: 'in simplicity of heart seek him' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመጽሐፈ ጥበብ 1፡1 “የምድር ገዥዎች ሆይ፥ ጽድቅን ውደዷት፥ የእግዚአብሔርንም ኀይል በበጎ ዕውቀት አስቡት፥ በቅን ልቡናም ፈልጉት” ይላል።',
      en: 'Wisdom 1:1 advises: "Love righteousness, ye that be judges of the earth: think of the Lord with a good (heart), and in simplicity of heart seek him."',
    },
    evidence: {
      verseId: '05d0fde4-5d33-5aec-a04a-383d14513952',
      quoteAm: 'በቅን ልቡናም ፈልጉት',
    },
    excerpt: {
      am: 'የምድር ገዥዎች ሆይ፥ ጽድቅን ውደዷት፥ የእግዚአብሔርንም ኀይል በበጎ ዕውቀት አስቡት፥',
      en: 'Love righteousness, ye that be judges of the earth: think of the Lord with a good (heart), and',
    },
  },
]

async function run() {
  console.log('=== VALIDATING BATCH 013 ===')
  // Check key distribution
  const keys = questions.map(q => q.correctKey)
  const dist = {
    a: keys.filter(k => k === 'a').length,
    b: keys.filter(k => k === 'b').length,
    c: keys.filter(k => k === 'c').length,
    d: keys.filter(k => k === 'd').length,
  }
  console.log('Key distribution:', dist)

  const responseEnvelope = {
    version: 1,
    sourceHash: sourceManifest.sourceHash,
    modelId,
    questions,
  }

  const library = JSON.parse(readFileSync('artifacts/faith-challenges/library/all-drafts.json', 'utf8'))
  const completedPrompts = library.drafts.map((draft: any) => draft.question.prompt.am)
  const mergedPrompts = [...new Set([...completedPrompts, ...existingPrompts])].slice(-450)

  const validated = await validateAmharicQuestionResponse(sourceBatch, modelId, responseEnvelope, mergedPrompts)
  console.log(`Generator validation PASSED! ${validated.drafts.length} drafts produced.`)

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

  const cmsAdapted = adaptEditorialBatchToCms({ drafts: validated.drafts })
  writeFileSync(join(BATCH_DIR, 'cms-import.json'), `${JSON.stringify(cmsAdapted, null, 2)}\n`, 'utf8')

  const preview = previewQuestionImport(JSON.stringify(cmsAdapted), new Set(library.drafts.map((d: any) => d.question.id)))
  console.log(`CMS preview validated: ${preview.items.length} items, ${preview.errors.length} errors.`)
  if (preview.errors.length) {
    throw new Error(`CMS preview errors: ${preview.errors.join('; ')}`)
  }

  console.log('Updating campaign tracking manifest and content library...')
  await runCampaign()
  console.log('Batch 013 successfully generated, validated, and ingested into the library!')
}

run().catch((err) => {
  console.error(err)
  process.exit(1)
})

