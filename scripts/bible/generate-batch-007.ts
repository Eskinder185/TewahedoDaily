/**
 * Offline generator for Faith Challenges Batch 007
 * 20 source-grounded bilingual questions from verified Amharic Bible passages.
 */
import { readFileSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'
import { validateAmharicQuestionResponse } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { adaptEditorialBatchToCms } from './adapt-drafts-for-cms'
import { previewQuestionImport } from '../../src/lib/play/questionLibrary'
import { runCampaign } from './campaign-orchestrator'

const BATCH_DIR = 'artifacts/faith-challenges/batch-007'
const sourceBatch = JSON.parse(readFileSync(join(BATCH_DIR, 'source-batch.json'), 'utf8'))
const existingPrompts = JSON.parse(readFileSync(join(BATCH_DIR, 'existing-prompts.json'), 'utf8'))
const modelId = 'copilot-agent-mode'

const questions = [
  // 0: am-genesis-1-8 -> a (trivia)
  {
    passageId: 'am-genesis-1-8',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘፍጥረት 8፡4 መሠረት መርከቢቱ በሰባተኛው ወር በየትኞቹ ተራሮች ላይ ተቀመጠች?',
      en: 'According to Genesis 8:4, upon which mountains did the ark rest in the seventh month?',
    },
    options: [
      { key: 'a', text: { am: 'በአራራት ተራሮች ላይ', en: 'upon the mountains of Ararat' } },
      { key: 'b', text: { am: 'በደብረ ሲና ተራራ ላይ', en: 'upon Mount Sinai' } },
      { key: 'c', text: { am: 'በደብረ ቀርሜሎስ ላይ', en: 'upon Mount Carmel' } },
      { key: 'd', text: { am: 'በደብረ ዘይት ተራራ ላይ', en: 'upon Mount Olivet' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘፍጥረት 8፡4 “መርከቢቱም በሰባተኛው ወር ከወሩም በሃያ ሰባተኛው ቀን በአራራት ተራሮች ላይ ተቀመጠች” ተብሎ ተጽፏል።',
      en: 'Genesis 8:4 states: "And the ark rested in the seventh month, on the seventeenth day of the month, upon the mountains of Ararat."',
    },
    evidence: {
      verseId: 'b04a5b86-ce20-53ec-a6bd-82c5005dde26',
      quoteAm: 'በአራራት ተራሮች ላይ',
    },
    excerpt: null,
  },

  // 1: am-leviticus-3-10 -> b (finish-the-verse)
  {
    passageId: 'am-leviticus-3-10',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘሌዋውያን 10፡2 ያለውን ኃይለ ቃል ያሟሉ፦ “እሳትም ከእግዚአብሔር ዘንድ ወጥቶ ___”',
      en: 'Complete the verse in Leviticus 10:2: "And there went out fire from the LORD, and ___"',
    },
    options: [
      { key: 'a', text: { am: 'መሠዊያውን አቃጠለ', en: 'burned the altar' } },
      { key: 'b', text: { am: 'በላቸው', en: 'devoured them' } },
      { key: 'c', text: { am: 'ምድሪቱን ከበበ', en: 'surrounded the land' } },
      { key: 'd', text: { am: 'ጭሱ ወደ ሰማይ ወጣ', en: 'the smoke went up' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘሌዋውያን 10፡2 “እሳትም ከእግዚአብሔር ዘንድ ወጥቶ በላቸው፤ በእግዚአብሔርም ፊት ሞቱ” ይላል።',
      en: 'Leviticus 10:2 reads: "And there went out fire from the LORD, and devoured them, and they died before the LORD."',
    },
    evidence: {
      verseId: '55cd715e-4acf-5911-adfe-8fa90a754b7f',
      quoteAm: 'በላቸው',
    },
    excerpt: {
      am: 'እሳትም ከእግዚአብሔር ዘንድ ወጥቶ',
      en: 'And there went out fire from the LORD, and',
    },
  },

  // 2: am-joshua-6-8 -> c (trivia)
  {
    passageId: 'am-joshua-6-8',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ኢያሱ ወልደ ነዌ 8፡3 መሠረት ኢያሱ ወደ ጋይ በሌሊት እንዲወጡ ስንት ጽኑዓን ተዋጊዎችን መረጠ?',
      en: 'According to Joshua 8:3, how many mighty men of valor did Joshua choose out to send away by night to Ai?',
    },
    options: [
      { key: 'a', text: { am: 'አሥር ሺህ ሰዎች', en: 'ten thousand men' } },
      { key: 'b', text: { am: 'ሃያ ሺህ ሰዎች', en: 'twenty thousand men' } },
      { key: 'c', text: { am: 'ሠላሳ ሺህ ሰዎች', en: 'thirty thousand men' } },
      { key: 'd', text: { am: 'አርባ ሺህ ሰዎች', en: 'forty thousand men' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ኢያሱ 8፡3 “ኢያሱም ጽኑዓን፥ ተዋጊዎችና ኀያላን የሆኑትን ሠላሳ ሺህ ሰዎች መረጠ፤ በሌሊትም ላካቸው” ይላል።',
      en: 'Joshua 8:3 records: "and Joshua chose out thirty thousand mighty men of valour, and sent them away by night."',
    },
    evidence: {
      verseId: '7f04bb0d-7a6e-5e37-a262-ac331cafdd9c',
      quoteAm: 'ሠላሳ ሺህ ሰዎች',
    },
    excerpt: null,
  },

  // 3: am-first-chronicles-13-7 -> d (finish-the-verse)
  {
    passageId: 'am-first-chronicles-13-7',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ዜና መዋዕል ቀዳማዊ 7፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “የይሳኮርም ልጆች፤ ቶላ፥ ፋዋ፥ ያሱብ፥ ሰምሮን፥ ___”',
      en: 'Complete the verse in 1 Chronicles 7:1: "Now the sons of Issachar were, Tola, and Puah, Jashub, and Shimron, ___"',
    },
    options: [
      { key: 'a', text: { am: 'ሁለት ናቸው', en: 'two' } },
      { key: 'b', text: { am: 'ሦስት ናቸው', en: 'three' } },
      { key: 'c', text: { am: 'አምስት ናቸው', en: 'five' } },
      { key: 'd', text: { am: 'አራት ናቸው', en: 'four' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በ1 ዜና መዋዕል 7፡1 “የይሳኮርም ልጆች፤ ቶላ፥ ፋዋ፥ ያሱብ፥ ሰምሮን፥ አራት ናቸው” ተብሎ ተጽፏል።',
      en: '1 Chronicles 7:1 records: "Now the sons of Issachar were, Tola, and Puah, Jashub, and Shimron, four."',
    },
    evidence: {
      verseId: 'dc8238a8-b45c-50fb-ab89-5b008cc6e665',
      quoteAm: 'አራት ናቸው',
    },
    excerpt: {
      am: 'የይሳኮርም ልጆች፤ ቶላ፥ ፋዋ፥ ያሱብ፥ ሰምሮን፥',
      en: 'Now the sons of Issachar were, Tola, and Puah, Jashub, and Shimron,',
    },
  },

  // 4: am-enoch-16-10 -> a (trivia)
  {
    passageId: 'am-enoch-16-10',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ሄኖክ 10፡2 መሠረት በመናፍስት ጌታ አራት ክንፎች ከሚቆሙት የተለዩ ሌሎች ምን አየ?',
      en: 'According to the Book of Enoch 10:2, what other figures did he see standing on the four wings of the Lord of Spirits?',
    },
    options: [
      { key: 'a', text: { am: 'አራት ገጻትን', en: 'four presences' } },
      { key: 'b', text: { am: 'አራት ሠረገሎችን', en: 'four chariots' } },
      { key: 'c', text: { am: 'አራት ከዋክብትን', en: 'four stars' } },
      { key: 'd', text: { am: 'አራት መብረቆችን', en: 'four lightnings' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ሄኖክ 10፡2 “በመናፍስት ጌታ አራት ክንፎችም ከሚቆሙት የተለዩ ሌሎች አራት ገጻትን አየሁ” ይላል።',
      en: 'The Book of Enoch 10:2 records: "And on the four wings of the Lord of Spirits I saw four presences, different from those that stand."',
    },
    evidence: {
      verseId: 'e60b1d0d-4f1a-5a94-ad61-34e73ea54547',
      quoteAm: 'አራት ገጻትን',
    },
    excerpt: null,
  },

  // 5: am-first-meqabyan-24-7 -> b (finish-the-verse)
  {
    passageId: 'am-first-meqabyan-24-7',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 7፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “አንተ ንጉሥም ብትሆን፥ ገዥም ብትሆን አንተ ምንድን ነህ? የፈጠረህ ___”',
      en: 'Complete the verse in 1 Meqabyan 7:1: "Though thou be a king, or a ruler, what art thou? Is it not ___ that made thee?"',
    },
    options: [
      { key: 'a', text: { am: 'የሰው ልጅ አይደለምን', en: 'the son of man' } },
      { key: 'b', text: { am: 'እግዚአብሔር አይደለምን', en: 'God that made thee' } },
      { key: 'c', text: { am: 'ንጉሥ አይደለምን', en: 'the king' } },
      { key: 'd', text: { am: 'የሠራዊት ጌታ አይደለምን', en: 'the Lord of hosts' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 7፡1 “አንተ ንጉሥም ብትሆን፥ ገዥም ብትሆን አንተ ምንድን ነህ? የፈጠረህ እግዚአብሔር አይደለምን” ይላል።',
      en: '1 Meqabyan 7:1 asks: "Though thou be a king, or a ruler, what art thou? Is it not God that made thee?"',
    },
    evidence: {
      verseId: '571fc8a9-5731-523c-adaa-508ab3f49e38',
      quoteAm: 'እግዚአብሔር አይደለምን',
    },
    excerpt: {
      am: 'አንተ ንጉሥም ብትሆን፥ ገዥም ብትሆን አንተ ምንድን ነህ? የፈጠረህ',
      en: 'Though thou be a king, or a ruler, what art thou? Is it not',
    },
  },

  // 6: am-song-of-songs-33-8 -> c (trivia)
  {
    passageId: 'am-song-of-songs-33-8',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመኃልየ መኃልይ ዘሰሎሞን 8፡2 መሠረት ሙሽራይቱ ውዷን ይዛ ወደ የት ለማግባት ወደደች?',
      en: 'According to Song of Songs 8:2, where did the bride desire to bring her beloved?',
    },
    options: [
      { key: 'a', text: { am: 'ወደ ገነቱ ስፍራ', en: 'into the garden' } },
      { key: 'b', text: { am: 'ወደ ንጉሡ አዳራሽ', en: 'into the king’s chamber' } },
      { key: 'c', text: { am: 'ወደ እናቴ ቤት', en: 'into my mother’s house' } },
      { key: 'd', text: { am: 'ወደ ወይኑ እርሻ', en: 'into the vineyard' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመኃልይ 8፡2 “ይዤ ወደ እናቴ ቤት፥ ወደ ወላጅ እናቴም እልፍኝ ባገባሁህ” ይላል።',
      en: 'Song of Songs 8:2 states: "I would lead thee, and bring thee into my mother’s house."',
    },
    evidence: {
      verseId: 'd3cc521f-2938-5dff-a9d3-c877bea5383e',
      quoteAm: 'ወደ እናቴ ቤት',
    },
    excerpt: null,
  },

  // 7: am-hosea-43-7 -> d (finish-the-verse)
  {
    passageId: 'am-hosea-43-7',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በትንቢተ ሆሴዕ 7፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “እስራኤልን እፈውስ ዘንድ በወደድሁ ጊዜ ___”',
      en: 'Complete the verse in Hosea 7:1: "When I would have healed Israel, then ___"',
    },
    options: [
      { key: 'a', text: { am: 'ምድሪቱ በሙሉ ሰላም አገኘች', en: 'the entire land found peace' } },
      { key: 'b', text: { am: 'ሕዝቡ ሁሉ በአንድነት እልል አሉ', en: 'all the people shouted together' } },
      { key: 'c', text: { am: 'ጠላቶቻቸው ሁሉ ድል ተነሡ', en: 'all their enemies were defeated' } },
      { key: 'd', text: { am: 'የኤፍሬም ኀጢአትና የሰማርያ ክፋት ተገለጠ', en: 'the iniquity of Ephraim was discovered, and the wickedness of Samaria' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በትንቢተ ሆሴዕ 7፡1 “እስራኤልን እፈውስ ዘንድ በወደድሁ ጊዜ የኤፍሬም ኀጢአትና የሰማርያ ክፋት ተገለጠ” ይላል።',
      en: 'Hosea 7:1 states: "When I would have healed Israel, then the iniquity of Ephraim was discovered, and the wickedness of Samaria."',
    },
    evidence: {
      verseId: '22ba0736-1fc8-5186-a219-4e97533458a2',
      quoteAm: 'የኤፍሬም ኀጢአትና የሰማርያ ክፋት ተገለጠ',
    },
    excerpt: {
      am: 'እስራኤልን እፈውስ ዘንድ በወደድሁ ጊዜ',
      en: 'When I would have healed Israel, then',
    },
  },

  // 8: am-mark-56-11 -> a (trivia)
  {
    passageId: 'am-mark-56-11',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በየማርቆስ ወንጌል 11፡1 መሠረት ኢየሱስና ደቀ መዛሙርቱ በደብረ ዘይት አጠገብ ወዳሉት ወደ የትኞቹ መንደሮች ቀረቡ?',
      en: 'According to Mark 11:1, when they came nigh to Jerusalem, unto which villages at the mount of Olives did they come?',
    },
    options: [
      { key: 'a', text: { am: 'ወደ ቤተ ፋጌና ወደ ቢታንያ', en: 'unto Bethphage and Bethany' } },
      { key: 'b', text: { am: 'ወደ ናዝሬትና ወደ ቃና', en: 'unto Nazareth and Cana' } },
      { key: 'c', text: { am: 'ወደ ኢያሪኮና ወደ ኤማሁስ', en: 'unto Jericho and Emmaus' } },
      { key: 'd', text: { am: 'ወደ ቅፍርናሆምና ወደ ጢባርያዶስ', en: 'unto Capernaum and Tiberias' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በማርቆስ 11፡1 “ወደ ኢየሩሳሌምም ከደብረ ዘይት አጠገብ ወዳሉት ወደ ቤተ ፋጌና ወደ ቢታንያ በቀረቡ ጊዜ፥ ከደቀ መዛሙርቱ ሁለቱን ልኮ” ይላል።',
      en: 'Mark 11:1 states: "And when they came nigh to Jerusalem, unto Bethphage and Bethany, at the mount of Olives, he sendeth forth two of his disciples."',
    },
    evidence: {
      verseId: 'fbb4ec10-ea6b-502d-a00e-2c04b7bef541',
      quoteAm: 'ወደ ቤተ ፋጌና ወደ ቢታንያ',
    },
    excerpt: null,
  },

  // 9: am-acts-59-7 -> b (finish-the-verse)
  {
    passageId: 'am-acts-59-7',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በየሐዋርያት ሥራ 7፡2 ያለውን ኃይለ ቃል ያሟሉ፦ “እርሱም እንዲህ አለ፥ “ወንድሞቻችንና አባቶቻችን ሆይ፥ ___”',
      en: 'Complete the verse in Acts 7:2: "And he said, Men, brethren, and fathers, ___"',
    },
    options: [
      { key: 'a', text: { am: 'ወደ መቅደሱ ግቡ', en: 'enter the sanctuary' } },
      { key: 'b', text: { am: 'ስሙ', en: 'hearken' } },
      { key: 'c', text: { am: 'ጸልዩ', en: 'pray' } },
      { key: 'd', text: { am: 'ተመልከቱ', en: 'behold' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በየሐዋርያት ሥራ 7፡2 “እርሱም እንዲህ አለ፥ “ወንድሞቻችንና አባቶቻችን ሆይ፥ ስሙ” በማለት እስጢፋኖስ ንግግሩን ጀመረ።',
      en: 'Acts 7:2 records Stephen’s words: "And he said, Men, brethren, and fathers, hearken."',
    },
    evidence: {
      verseId: '4db01dd7-62eb-56cf-a9c5-c431b8547578',
      quoteAm: 'ስሙ',
    },
    excerpt: {
      am: 'እርሱም እንዲህ አለ፥ “ወንድሞቻችንና አባቶቻችን ሆይ፥',
      en: 'And he said, Men, brethren, and fathers,',
    },
  },

  // 10: am-second-corinthians-62-7 -> c (trivia)
  {
    passageId: 'am-second-corinthians-62-7',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በ2ኛ ቆሮንቶስ 7፡5 መሠረት ጳውሎስና አብረውት የነበሩት ለሰውነታቸው ጥቂት ስንኳን ዕረፍት ያላገኙት መቼ ነበር?',
      en: 'According to 2 Corinthians 7:5, when did they have no rest for their flesh?',
    },
    options: [
      { key: 'a', text: { am: 'ወደ ኤፌሶን በገቡ ጊዜ', en: 'when they entered Ephesus' } },
      { key: 'b', text: { am: 'ወደ አቴና በሄዱ ጊዜ', en: 'when they went to Athens' } },
      { key: 'c', text: { am: 'ወደ መቄዶንያም በደረስን ጊዜ', en: 'when we were come into Macedonia' } },
      { key: 'd', text: { am: 'ወደ ሮሜ በተጓዙ ጊዜ', en: 'when they journeyed to Rome' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በ2ኛ ቆሮንቶስ 7፡5 “ወደ መቄዶንያም በደረስን ጊዜ ለሰውነታችን ጥቂት ስንኳን ዕረፍት አላገኘንም፤ በሁሉም መከራ አጸኑብን እንጂ” ይላል።',
      en: '2 Corinthians 7:5 states: "For, when we were come into Macedonia, our flesh had no rest, but we were troubled on every side."',
    },
    evidence: {
      verseId: 'a5547626-b37f-5528-aea5-eb05133d7f99',
      quoteAm: 'ወደ መቄዶንያም በደረስን ጊዜ',
    },
    excerpt: null,
  },

  // 11: am-revelation-81-13 -> d (finish-the-verse)
  {
    passageId: 'am-revelation-81-13',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በየዮሐንስ ራእይ 13፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “በቀንዶቹም ላይ ዐሥር ዘውዶች በራሶቹም ላይ ___”',
      en: 'Complete the verse in Revelation 13:1: "and upon his horns ten crowns, and upon his heads ___"',
    },
    options: [
      { key: 'a', text: { am: 'የእሳት ነበልባል ነበረ', en: 'flames of fire' } },
      { key: 'b', text: { am: 'ጽኑዕ ኃይል ነበረ', en: 'great power' } },
      { key: 'c', text: { am: 'የክብር አክሊል ነበረ', en: 'crown of glory' } },
      { key: 'd', text: { am: 'የስድብ ስም ነበረ', en: 'the name of blasphemy' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በራእይ 13፡1 “በቀንዶቹም ላይ ዐሥር ዘውዶች በራሶቹም ላይ የስድብ ስም ነበረ” ይላል።',
      en: 'Revelation 13:1 reads: "and upon his horns ten crowns, and upon his heads the name of blasphemy."',
    },
    evidence: {
      verseId: '794f323f-0022-5055-a4a2-f68925f9441f',
      quoteAm: 'የስድብ ስም ነበረ',
    },
    excerpt: {
      am: 'በቀንዶቹም ላይ ዐሥር ዘውዶች በራሶቹም ላይ',
      en: 'and upon his horns ten crowns, and upon his heads',
    },
  },

  // 12: am-exodus-2-5 -> a (trivia)
  {
    passageId: 'am-exodus-2-5',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘፀአት 5፡1 መሠረት ሙሴና አሮን ወደ ፈርዖን ገብተው የእስራኤል አምላክ እግዚአብሔር ምን እንዳለ ነገሩት?',
      en: 'According to Exodus 5:1, what did Moses and Aaron tell Pharaoh that the LORD God of Israel said?',
    },
    options: [
      { key: 'a', text: { am: 'በምድረ በዳ በዓል ያደርግልኝ ዘንድ ሕዝቤን ልቀቅ', en: 'Let my people go, that they may hold a feast unto me in the wilderness' } },
      { key: 'b', text: { am: 'የብርና የወርቅ እቃዎችን ሁሉ ስጠን', en: 'Give us all vessels of silver and gold' } },
      { key: 'c', text: { am: 'ሠራዊትህን ከምድሪቱ ፈጥነህ አስወጣ', en: 'Quickly remove your army from the land' } },
      { key: 'd', text: { am: 'የግብፅን መንግሥት ለእኛ አስረክብ', en: 'Surrender the kingdom of Egypt to us' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘፀአት 5፡1 “የእስራኤል አምላክ እግዚአብሔር እንዲህ ይላል፦ በምድረ በዳ በዓል ያደርግልኝ ዘንድ ሕዝቤን ልቀቅ” ተብሎ ተጽፏል።',
      en: 'Exodus 5:1 records: "Thus saith the LORD God of Israel, Let my people go, that they may hold a feast unto me in the wilderness."',
    },
    evidence: {
      verseId: '7801a266-f883-5a69-a81f-3a3ddf41d70b',
      quoteAm: 'በምድረ በዳ በዓል ያደርግልኝ ዘንድ ሕዝቤን ልቀቅ',
    },
    excerpt: null,
  },

  // 13: am-numbers-4-11 -> b (finish-the-verse)
  {
    passageId: 'am-numbers-4-11',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘኍልቍ 11፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “ሕዝቡም በክፋት በእግዚአብሔር ፊት አጕረመረሙ፤ ___”',
      en: 'Complete the verse in Numbers 11:1: "And when the people complained, it displeased the LORD: and ___"',
    },
    options: [
      { key: 'a', text: { am: 'የሰማይ መና ዘነበላቸው', en: 'manna rained upon them' } },
      { key: 'b', text: { am: 'እግዚአብሔርም ሰምቶ ተቈጣ', en: 'the LORD heard it; and his anger was kindled' } },
      { key: 'c', text: { am: 'ደመናው ከድንኳኑ ተነሣ', en: 'the cloud was taken up' } },
      { key: 'd', text: { am: 'ምድሪቱ በረከትን ሰጠች', en: 'the land gave forth blessing' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘኍልቍ 11፡1 “ሕዝቡም በክፋት በእግዚአብሔር ፊት አጕረመረሙ፤ እግዚአብሔርም ሰምቶ ተቈጣ” ይላል።',
      en: 'Numbers 11:1 states: "And when the people complained, it displeased the LORD: and the LORD heard it; and his anger was kindled."',
    },
    evidence: {
      verseId: '05a2f7f6-cb94-5894-a47e-f84281fc052c',
      quoteAm: 'እግዚአብሔርም ሰምቶ ተቈጣ',
    },
    excerpt: {
      am: 'ሕዝቡም በክፋት በእግዚአብሔር ፊት አጕረመረሙ፤',
      en: 'And when the people complained, it displeased the LORD: and',
    },
  },

  // 14: am-deuteronomy-5-4 -> c (trivia)
  {
    passageId: 'am-deuteronomy-5-4',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘዳግም 4፡2 መሠረት ሙሴ ለእስራኤል ሕዝብ ባዘዛቸው ቃል ላይ ምን እንዳያደርጉ አስጠነቀቃቸው?',
      en: 'According to Deuteronomy 4:2, what did Moses command Israel not to do regarding the word he commanded them?',
    },
    options: [
      { key: 'a', text: { am: 'በድንጋይ ጽላት ላይ ብቻ እንዳይጽፉ', en: 'not to write only on tablets' } },
      { key: 'b', text: { am: 'በየዓመቱ አዲስ ነገር እንዳይጨምሩ', en: 'not to add new things yearly' } },
      { key: 'c', text: { am: 'አትጨምሩም፤ ከእርሱም አታጐድሉም', en: 'Ye shall not add unto the word, neither shall ye diminish ought from it' } },
      { key: 'd', text: { am: 'ከሽማግሌዎች በቀር ለማንም እንዳይናገሩ', en: 'not to speak it except to elders' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በኦሪት ዘዳግም 4፡2 “የአምላካችሁን የእግዚአብሔርን ትእዛዝ ትጠብቃላችሁ እንጂ ባዘዝኋችሁ ቃል ላይ አትጨምሩም፤ ከእርሱም አታጐድሉም” ይላል።',
      en: 'Deuteronomy 4:2 states: "Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of the LORD your God."',
    },
    evidence: {
      verseId: 'a44857c8-84a2-502b-af6a-e66f7b7d79ea',
      quoteAm: 'አትጨምሩም፤ ከእርሱም አታጐድሉም',
    },
    excerpt: null,
  },

  // 15: am-judges-7-4 -> d (finish-the-verse)
  {
    passageId: 'am-judges-7-4',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ መሳፍንት 4፡4 ያለውን ኃይለ ቃል ያሟሉ፦ “በዚያም ወራት ነቢይቱ የለፊዶት ሚስት ዲቦራ ___”',
      en: 'Complete the verse in Judges 4:4: "And Deborah, a prophetess, the wife of Lapidoth, ___"',
    },
    options: [
      { key: 'a', text: { am: 'የሠራዊት መሪ ነበረች', en: 'was leader of the host' } },
      { key: 'b', text: { am: 'በድንኳን ውስጥ ተቀመጠች', en: 'sat within the tent' } },
      { key: 'c', text: { am: 'የዕጣን መሥዋዕት አቀረበች', en: 'offered incense' } },
      { key: 'd', text: { am: 'እስራኤልን ትገዛቸው ነበረች', en: 'she judged Israel at that time' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመጽሐፈ መሳፍንት 4፡4 “በዚያም ወራት ነቢይቱ የለፊዶት ሚስት ዲቦራ እስራኤልን ትገዛቸው ነበረች” ይላል።',
      en: 'Judges 4:4 states: "And Deborah, a prophetess, the wife of Lapidoth, she judged Israel at that time."',
    },
    evidence: {
      verseId: 'd40cb6b7-2c6b-5118-afc6-fd5f5d9d4d24',
      quoteAm: 'እስራኤልን ትገዛቸው ነበረች',
    },
    excerpt: {
      am: 'በዚያም ወራት ነቢይቱ የለፊዶት ሚስት ዲቦራ',
      en: 'And Deborah, a prophetess, the wife of Lapidoth,',
    },
  },

  // 16: am-ruth-8-4 -> a (trivia)
  {
    passageId: 'am-ruth-8-4',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ሩት 4፡2 መሠረት ቦዔዝ ከከተማይቱ ሽማግሌዎች ስንት ሰዎች ጠርቶ ተቀመጡ አላቸው?',
      en: 'According to Ruth 4:2, how many men of the elders of the city did Boaz take to sit down?',
    },
    options: [
      { key: 'a', text: { am: 'አሥር ሰዎች', en: 'ten men' } },
      { key: 'b', text: { am: 'ሰባት ሰዎች', en: 'seven men' } },
      { key: 'c', text: { am: 'አሥራ ሁለት ሰዎች', en: 'twelve men' } },
      { key: 'd', text: { am: 'አምስት ሰዎች', en: 'five men' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ሩት 4፡2 “ቦዔዝም ከከተማይቱ ሽማግሌዎች አሥር ሰዎች ጠርቶ፦ በዚህ ተቀመጡ አላቸው። እነርሱም ተቀመጡ” ይላል።',
      en: 'Ruth 4:2 states: "And he took ten men of the elders of the city, and said, Sit ye down here. And they sat down."',
    },
    evidence: {
      verseId: '5f799d87-5a14-5121-a6cd-0f896fdc61c4',
      quoteAm: 'አሥር ሰዎች',
    },
    excerpt: null,
  },

  // 17: am-second-chronicles-14-3 -> b (finish-the-verse)
  {
    passageId: 'am-second-chronicles-14-3',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ዜና መዋዕል ካልዕ 3፡2 ያለውን ኃይለ ቃል ያሟሉ፦ “በነገሠም በአራተኛው ዓመት ___”',
      en: 'Complete the verse in 2 Chronicles 3:2: "And he began to build in the fourth year of his reign, ___"',
    },
    options: [
      { key: 'a', text: { am: 'በመጀመሪያው ወር መሥራት ጀመረ', en: 'in the first month' } },
      { key: 'b', text: { am: 'በሁለተኛው ወር መሥራት ጀመረ', en: 'in the second month' } },
      { key: 'c', text: { am: 'በሰባተኛው ወር መሥራት ጀመረ', en: 'in the seventh month' } },
      { key: 'd', text: { am: 'በዐሥረኛው ወር መሥራት ጀመረ', en: 'in the tenth month' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በ2 ዜና መዋዕል 3፡2 “በነገሠም በአራተኛው ዓመት በሁለተኛው ወር መሥራት ጀመረ” ይላል።',
      en: '2 Chronicles 3:2 states: "And he began to build in the second day of the second month, in the fourth year of his reign."',
    },
    evidence: {
      verseId: 'f0b11bbe-14b2-5801-a38e-d410dfb7c2a0',
      quoteAm: 'በሁለተኛው ወር መሥራት ጀመረ',
    },
    excerpt: {
      am: 'በነገሠም በአራተኛው ዓመት',
      en: 'And he began to build in the fourth year of his reign,',
    },
  },

  // 18: am-jubilees-15-3 -> c (trivia)
  {
    passageId: 'am-jubilees-15-3',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ኩፋሌ 3፡3 መሠረት ስድስት ቀን ሥራ ሠርተን በሰባተኛዪቱ ቀን ከሥራ ሁሉ እናርፍ ዘንድ ታላቅ ምልክት ተደርጋ የተሰጠችን የትኛዋ ቀን ናት?',
      en: 'According to Jubilees 3:3, which day was given as a great sign that we should work six days and rest on the seventh from all work?',
    },
    options: [
      { key: 'a', text: { am: 'የመጀመሪያዪቱን ቀን', en: 'the first day' } },
      { key: 'b', text: { am: 'የአዲሱ ወር መባቻን', en: 'the new moon' } },
      { key: 'c', text: { am: 'ሰባተኛዪቱን ቀን', en: 'the seventh day' } },
      { key: 'd', text: { am: 'የዓመቱን መጀመሪያ', en: 'the beginning of the year' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ኩፋሌ 3፡3 “ስድስት ቀን ሥራ ሠርተን በሰባተኛዪቱ ቀን ከሥራ ሁሉ እናርፍ ዘንድ ታላቅ ምልክት ሰባተኛዪቱን ቀን ሰጠን” ይላል።',
      en: 'Jubilees 3:3 records that the seventh day was given as a great sign of rest.',
    },
    evidence: {
      verseId: '645cb8c4-96cc-5fb3-afb7-675c1507e037',
      quoteAm: 'ሰባተኛዪቱን ቀን',
    },
    excerpt: null,
  },

  // 19: am-tobit-21-1 -> d (finish-the-verse)
  {
    passageId: 'am-tobit-21-1',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ጦቢት 1፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “ከንፍታሌም ነገድ ከአሳሄል ወገን የገባኤል ልጅ የጦብኤል ልጅ ___”',
      en: 'Complete the verse in Tobit 1:1: "The book of the words of Tobit, son of Tobiel, the son of Gabael, of the tribe of Naphtali, ___"',
    },
    options: [
      { key: 'a', text: { am: 'የካህናት አለቃ ነበረ', en: 'was chief of priests' } },
      { key: 'b', text: { am: 'በኢየሩሳሌም ተቀመጠ', en: 'dwelt in Jerusalem' } },
      { key: 'c', text: { am: 'በደስታ ተጓዘ', en: 'journeyed with joy' } },
      { key: 'd', text: { am: 'የጦቢት የነገሩ መጽሓፍ ይህ ነው', en: 'this is the book of the words of Tobit' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመጽሐፈ ጦቢት 1፡1 “ከንፍታሌም ነገድ ከአሳሄል ወገን የገባኤል ልጅ የጦብኤል ልጅ የጦቢት የነገሩ መጽሓፍ ይህ ነው” በማለት ይጀምራል።',
      en: 'Tobit 1:1 opens: "The book of the words of Tobit, son of Tobiel, the son of Gabael, of the tribe of Naphtali."',
    },
    evidence: {
      verseId: 'f7f17a7c-6ffd-5048-a01c-e6b64110e368',
      quoteAm: 'የጦቢት የነገሩ መጽሓፍ ይህ ነው',
    },
    excerpt: {
      am: 'ከንፍታሌም ነገድ ከአሳሄል ወገን የገባኤል ልጅ የጦብኤል ልጅ',
      en: 'The book of the words of Tobit, son of Tobiel, the son of Gabael, of the tribe of Naphtali,',
    },
  },
]

async function run() {
  console.log('=== VALIDATING BATCH 007 ===')
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
    sourceHash: sourceBatch.sourceHash || JSON.parse(readFileSync(join(BATCH_DIR, 'source-manifest.json'), 'utf8')).sourceHash,
    modelId,
    questions,
  }

  const validated = await validateAmharicQuestionResponse(sourceBatch, modelId, responseEnvelope, existingPrompts)
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

  const preview = previewQuestionImport(JSON.stringify(cmsAdapted), new Set())
  console.log(`CMS preview validated: ${preview.items.length} items, ${preview.errors.length} errors.`)
  if (preview.errors.length) {
    throw new Error(`CMS preview errors: ${preview.errors.join('; ')}`)
  }

  console.log('Updating campaign tracking manifest and content library...')
  await runCampaign()
  console.log('Batch 007 successfully generated, validated, and ingested into the library!')
}

run().catch((err) => {
  console.error(err)
  process.exit(1)
})
