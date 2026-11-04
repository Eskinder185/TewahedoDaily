/**
 * Offline generator for Faith Challenges Batch 011
 * 20 source-grounded bilingual questions from verified Amharic Bible passages.
 */
import { readFileSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'
import { validateAmharicQuestionResponse } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { adaptEditorialBatchToCms } from './adapt-drafts-for-cms'
import { previewQuestionImport } from '../../src/lib/play/questionLibrary'
import { runCampaign } from './campaign-orchestrator'

const BATCH_DIR = 'artifacts/faith-challenges/batch-011'
const sourceBatch = JSON.parse(readFileSync(join(BATCH_DIR, 'source-batch.json'), 'utf8'))
const sourceManifest = JSON.parse(readFileSync(join(BATCH_DIR, 'source-manifest.json'), 'utf8'))
const existingPrompts = JSON.parse(readFileSync(join(BATCH_DIR, 'existing-prompts.json'), 'utf8'))
const modelId = 'copilot-agent-mode'

const questions = [
  // 0: am-genesis-1-13 -> a (trivia)
  {
    passageId: 'am-genesis-1-13',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘፍጥረት 13፡2 መሠረት አብራም በምን እጅግ በለጸገ?',
      en: 'According to Genesis 13:2, in what was Abram very rich?',
    },
    options: [
      { key: 'a', text: { am: 'በከብት፥ በብርና በወርቅ', en: 'in cattle, in silver, and in gold' } },
      { key: 'b', text: { am: 'በፈረሶችና በሠረገሎች', en: 'in horses and in chariots' } },
      { key: 'c', text: { am: 'በወይኑ እርሻና በዘይት', en: 'in vineyards and in oil' } },
      { key: 'd', text: { am: 'በዕንቍና በከበረ ድንጋይ', en: 'in pearls and precious stones' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘፍጥረት 13፡2 “አብራምም በከብት፥ በብርና በወርቅ እጅግ በለጸገ” ተብሎ ተጽፏል።',
      en: 'Genesis 13:2 states: "And Abram was very rich in cattle, in silver, and in gold."',
    },
    evidence: {
      verseId: 'c84c8815-77de-59e4-acb5-456f9e6c07bd',
      quoteAm: 'በከብት፥ በብርና በወርቅ',
    },
    excerpt: null,
  },

  // 1: am-leviticus-3-15 -> b (finish-the-verse)
  {
    passageId: 'am-leviticus-3-15',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘሌዋውያን 15፡2 ያለውን ኃይለ ቃል ያሟሉ፦ “ለእስራኤል ልጆች እንዲህ ብላችሁ ንገሩአቸው፦ ከሰውነቱ ዘር የሚፈስሰው ሰው ቢኖር ስለሚፈስሰው ነገር ___”',
      en: 'Complete the verse in Leviticus 15:2: "Speak unto the children of Israel, and say unto them, When any man hath a running issue out of his flesh, because of his issue he is ___"',
    },
    options: [
      { key: 'a', text: { am: 'ንጹሕ ነው', en: 'is clean' } },
      { key: 'b', text: { am: 'ርኩስ ነው', en: 'is unclean' } },
      { key: 'c', text: { am: 'የተባረከ ነው', en: 'is blessed' } },
      { key: 'd', text: { am: 'የተለየ ነው', en: 'is separated' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘሌዋውያን 15፡2 “ለእስራኤል ልጆች እንዲህ ብላችሁ ንገሩአቸው፦ ከሰውነቱ ዘር የሚፈስሰው ሰው ቢኖር ስለሚፈስሰው ነገር ርኩስ ነው” ይላል።',
      en: 'Leviticus 15:2 states: "When any man hath a running issue out of his flesh, because of his issue he is unclean."',
    },
    evidence: {
      verseId: '4dc0b3ec-b0ed-586f-af8c-59fbfdf15d48',
      quoteAm: 'ርኩስ ነው',
    },
    excerpt: {
      am: 'ለእስራኤል ልጆች እንዲህ ብላችሁ ንገሩአቸው፦ ከሰውነቱ ዘር የሚፈስሰው ሰው ቢኖር ስለሚፈስሰው ነገር',
      en: 'Speak unto the children of Israel, and say unto them, When any man hath a running issue out of his flesh, because of his issue he is',
    },
  },

  // 2: am-joshua-6-12 -> c (trivia)
  {
    passageId: 'am-joshua-6-12',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ኢያሱ 12፡5 መሠረት የባሳን ንጉሥ ተብሎ የተጠቀሰው ማን ነው?',
      en: 'According to Joshua 12:5, who is named as the king of Bashan?',
    },
    options: [
      { key: 'a', text: { am: 'የአሞራውያን ንጉሥ ሴዎን', en: 'Sihon king of the Amorites' } },
      { key: 'b', text: { am: 'የኢያሪኮ ንጉሥ', en: 'the king of Jericho' } },
      { key: 'c', text: { am: 'የባሳን ንጉሥ ዐግ', en: 'Og king of Bashan' } },
      { key: 'd', text: { am: 'የጋይ ንጉሥ', en: 'the king of Ai' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ኢያሱ 12፡5 “የባሳን ንጉሥ ዐግ” ተብሎ ተመዝግቧል።',
      en: 'Joshua 12:5 identifies "Og king of Bashan."',
    },
    evidence: {
      verseId: 'd75e7174-7de9-5002-a403-e4e62b58eaec',
      quoteAm: 'የባሳን ንጉሥ ዐግ',
    },
    excerpt: null,
  },

  // 3: am-first-chronicles-13-11 -> d (finish-the-verse)
  {
    passageId: 'am-first-chronicles-13-11',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ዜና መዋዕል ቀዳማዊ 11፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “እስራኤልም ሁሉ በኬብሮን ወደ ዳዊት ተሰብስበው እንዲህ አሉት፥ “እነሆ፥ እኛ ___”',
      en: 'Complete the verse in 1 Chronicles 11:1: "Then all Israel gathered themselves to David unto Hebron, saying, Behold, we ___"',
    },
    options: [
      { key: 'a', text: { am: 'የአባቶችህ ልጆች ነን', en: 'are sons of thy fathers' } },
      { key: 'b', text: { am: 'የሠራዊትህ አገልጋዮች ነን', en: 'are servants of thy host' } },
      { key: 'c', text: { am: 'የቀደሙት ወገኖችህ ነን', en: 'are thy ancient people' } },
      { key: 'd', text: { am: 'የአጥንትህ ፍላጭ የሥጋህ ቍራጭ ነን', en: 'are thy bone and thy flesh' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በ1 ዜና መዋዕል 11፡1 “እስራኤልም ሁሉ በኬብሮን ወደ ዳዊት ተሰብስበው እንዲህ አሉት፥ “እነሆ፥ እኛ የአጥንትህ ፍላጭ የሥጋህ ቍራጭ ነን” ይላል።',
      en: '1 Chronicles 11:1 reads: "Then all Israel gathered themselves to David unto Hebron, saying, Behold, we are thy bone and thy flesh."',
    },
    evidence: {
      verseId: '7cef20f6-873b-5f26-a440-64f1ac10dc49',
      quoteAm: 'የአጥንትህ ፍላጭ የሥጋህ ቍራጭ ነን',
    },
    excerpt: {
      am: 'እስራኤልም ሁሉ በኬብሮን ወደ ዳዊት ተሰብስበው እንዲህ አሉት፥ “እነሆ፥ እኛ',
      en: 'Then all Israel gathered themselves to David unto Hebron, saying, Behold, we',
    },
  },

  // 4: am-enoch-16-23 -> a (trivia)
  {
    passageId: 'am-enoch-16-23',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ሄኖክ 23፡2 መሠረት የሁሉም መሪያቸው የሆነውና ለሄኖክ ሁሉን ያሳየው ቅዱስ መልአክ ማን ነው?',
      en: 'According to the Book of Enoch 23:2, which holy angel who was the leader of them all showed Enoch everything?',
    },
    options: [
      { key: 'a', text: { am: 'ቅዱስ መልአክ ዑርኤል', en: 'the holy angel Uriel' } },
      { key: 'b', text: { am: 'ቅዱስ ሚካኤል', en: 'Holy Michael' } },
      { key: 'c', text: { am: 'ቅዱስ ገብርኤል', en: 'Holy Gabriel' } },
      { key: 'd', text: { am: 'ቅዱስ ሩፋኤል', en: 'Holy Raphael' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ሄኖክ 23፡2 “የሁሉም መሪያቸው የሆነው ቅዱስ መልአክ ዑርኤል ሁሉን አሳየኝ” ይላል።',
      en: 'Enoch 23:2 states: "Uriel, one of the holy angels who was with me and was their leader, showed me all things."',
    },
    evidence: {
      verseId: '13f03f30-9843-593d-aa50-afc1f07b40fb',
      quoteAm: 'ቅዱስ መልአክ ዑርኤል',
    },
    excerpt: null,
  },

  // 5: am-first-meqabyan-24-11 -> b (finish-the-verse)
  {
    passageId: 'am-first-meqabyan-24-11',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 11፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “አርሞንና ቅጥሮችዋ ወደቁ፤ እግዚአብሔርም እንደ ክፋታቸውና በእጃቸው እንደ ሠሩት ሥራ ___”',
      en: 'Complete the verse in 1 Meqabyan 11:1: "Armon and its walls fell; and God according to their wickedness and the work of their hands ___"',
    },
    options: [
      { key: 'a', text: { am: 'አጥፍቶአቸዋልና', en: 'for he destroyed them' } },
      { key: 'b', text: { am: 'ከፍሎአቸዋልና', en: 'for he recompensed them' } },
      { key: 'c', text: { am: 'ምሮአቸዋልና', en: 'for he showed them mercy' } },
      { key: 'd', text: { am: 'ጠርቶአቸዋልና', en: 'for he called them' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 11፡1 “አርሞንና ቅጥሮችዋ ወደቁ፤ እግዚአብሔርም እንደ ክፋታቸውና በእጃቸው እንደ ሠሩት ሥራ ከፍሎአቸዋልና” ይላል።',
      en: '1 Meqabyan 11:1 records God’s recompense according to their works.',
    },
    evidence: {
      verseId: 'a7be08af-d424-58a5-a087-67c474cd32d0',
      quoteAm: 'ከፍሎአቸዋልና',
    },
    excerpt: {
      am: 'አርሞንና ቅጥሮችዋ ወደቁ፤ እግዚአብሔርም እንደ ክፋታቸውና በእጃቸው እንደ ሠሩት ሥራ',
      en: 'Armon and its walls fell; and God according to their wickedness and the work of their hands',
    },
  },

  // 6: am-hosea-43-11 -> c (trivia)
  {
    passageId: 'am-hosea-43-11',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በትንቢተ ሆሴዕ 11፡1 መሠረት እግዚአብሔር ልጁን ከየት እንደ ጠራው ተጽፏል?',
      en: 'According to Hosea 11:1, from where did God call His son?',
    },
    options: [
      { key: 'a', text: { am: 'ከባቢሎን ምድር', en: 'from the land of Babylon' } },
      { key: 'b', text: { am: 'ከምድረ በዳ ስፍራ', en: 'from the wilderness place' } },
      { key: 'c', text: { am: 'ልጄንም ከግብፅ ጠራሁት', en: 'called my son out of Egypt' } },
      { key: 'd', text: { am: 'ከከነዓን ምድር', en: 'from the land of Canaan' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በትንቢተ ሆሴዕ 11፡1 “እስራኤል ሕፃን በነበረ ጊዜ ወደድሁት፤ ልጄንም ከግብፅ ጠራሁት” ተብሎ ተጽፏል።',
      en: 'Hosea 11:1 states: "When Israel was a child, then I loved him, and called my son out of Egypt."',
    },
    evidence: {
      verseId: '280986a4-6959-5f84-ab8a-8918d1e447c7',
      quoteAm: 'ልጄንም ከግብፅ ጠራሁት',
    },
    excerpt: null,
  },

  // 7: am-acts-59-11 -> d (finish-the-verse)
  {
    passageId: 'am-acts-59-11',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በየሐዋርያት ሥራ 11፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “ሐዋርያትና በይሁዳ የነበሩ ወንድሞችም አሕዛብ የእግዚአብሔርን ቃል ___”',
      en: 'Complete the verse in Acts 11:1: "And the apostles and brethren that were in Judaea heard that the Gentiles ___"',
    },
    options: [
      { key: 'a', text: { am: 'እንዳስተማሩ አዩ', en: 'saw that they taught' } },
      { key: 'b', text: { am: 'እንዳደነቁ ተረዱ', en: 'understood that they marveled' } },
      { key: 'c', text: { am: 'እንደ ጠበቁ ተመለከቱ', en: 'observed that they kept' } },
      { key: 'd', text: { am: 'እንደ ተቀበሉ ሰሙ', en: 'had also received the word of God' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በየሐዋርያት ሥራ 11፡1 “ሐዋርያትና በይሁዳ የነበሩ ወንድሞችም አሕዛብ የእግዚአብሔርን ቃል እንደ ተቀበሉ ሰሙ” ይላል።',
      en: 'Acts 11:1 states: "And the apostles and brethren that were in Judaea heard that the Gentiles had also received the word of God."',
    },
    evidence: {
      verseId: '95f6d4fd-432d-5440-a685-8272a3c5631b',
      quoteAm: 'እንደ ተቀበሉ ሰሙ',
    },
    excerpt: {
      am: 'ሐዋርያትና በይሁዳ የነበሩ ወንድሞችም አሕዛብ የእግዚአብሔርን ቃል',
      en: 'And the apostles and brethren that were in Judaea heard that the Gentiles had also received the word of God',
    },
  },

  // 8: am-second-corinthians-62-11 -> a (trivia)
  {
    passageId: 'am-second-corinthians-62-11',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በ2ኛ ቆሮንቶስ 11፡3 መሠረት ጳውሎስ የቆሮንቶስ ሰዎች አሳብ እንዳይለወጥ ሲያስጠነቅቅ ማን ማንን በተንኰሉ እንዳሳታት በማሳሰቢያነት ጠቀሰ?',
      en: 'According to 2 Corinthians 11:3, whom did the serpent beguile through his subtilty as referenced by Paul?',
    },
    options: [
      { key: 'a', text: { am: 'እባብ ሔዋንን በተንኰሉ እንዳሳታት', en: 'the serpent beguiled Eve through his subtilty' } },
      { key: 'b', text: { am: 'ፈርዖን እስራኤልን እንዳስጨነቀ', en: 'Pharaoh oppressed Israel' } },
      { key: 'c', text: { am: 'ሳኦል ዳዊትን እንዳሳደደ', en: 'Saul pursued David' } },
      { key: 'd', text: { am: 'ዮናስ ከእግዚአብሔር እንደ ሸሸ', en: 'Jonah fled from God' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በ2ኛ ቆሮንቶስ 11፡3 “ነገር ግን እባብ ሔዋንን በተንኰሉ እንዳሳታት፥ አሳባችሁ ከክርስቶስ የዋህነትና ንጽሕና ምናልባት እንዳይለወጥ ብዬ እፈራለሁ” ይላል።',
      en: '2 Corinthians 11:3 states: "But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted."',
    },
    evidence: {
      verseId: 'c4b3886e-b47f-5934-aad9-8676d7e7ac4f',
      quoteAm: 'እባብ ሔዋንን በተንኰሉ እንዳሳታት',
    },
    excerpt: null,
  },

  // 9: am-revelation-81-20 -> b (finish-the-verse)
  {
    passageId: 'am-revelation-81-20',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በየዮሐንስ ራእይ 20፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “የጥልቁንም መክፈቻና ታላቁን ሰንሰለት በእጁ የያዘ መልአክ ___”',
      en: 'Complete the verse in Revelation 20:1: "And I saw an angel ___ having the key of the bottomless pit and a great chain in his hand"',
    },
    options: [
      { key: 'a', text: { am: 'በዙፋኑ ፊት ቆመ', en: 'stood before the throne' } },
      { key: 'b', text: { am: 'ከሰማይ ሲወርድ አየሁ', en: 'come down from heaven' } },
      { key: 'c', text: { am: 'ድምፁን ከፍ አደረገ', en: 'lifted up his voice' } },
      { key: 'd', text: { am: 'በምድር ላይ ቆመ', en: 'stood upon the earth' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በራእይ 20፡1 “የጥልቁንም መክፈቻና ታላቁን ሰንሰለት በእጁ የያዘ መልአክ ከሰማይ ሲወርድ አየሁ” ይላል።',
      en: 'Revelation 20:1 reads: "And I saw an angel come down from heaven, having the key of the bottomless pit and a great chain in his hand."',
    },
    evidence: {
      verseId: '8ad7ca30-e53d-515b-ac3d-8aee8c857739',
      quoteAm: 'ከሰማይ ሲወርድ አየሁ',
    },
    excerpt: {
      am: 'የጥልቁንም መክፈቻና ታላቁን ሰንሰለት በእጁ የያዘ መልአክ',
      en: 'having the key of the bottomless pit and a great chain in his hand',
    },
  },

  // 10: am-exodus-2-9 -> c (trivia)
  {
    passageId: 'am-exodus-2-9',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘፀአት 9፡1 መሠረት እግዚአብሔር ሙሴን ወደ ፈርዖን ገብቶ ሕዝቡን እንዲለቅ ሲያዘው ምክንያቱ ምን እንደ ሆነ ተናገረ?',
      en: 'According to Exodus 9:1, for what purpose did the LORD tell Pharaoh to let His people go?',
    },
    options: [
      { key: 'a', text: { am: 'ምድሪቱን እንዲወርሱ', en: 'that they may inherit the land' } },
      { key: 'b', text: { am: 'ከተሞችን እንዲሠሩ', en: 'that they may build cities' } },
      { key: 'c', text: { am: 'ያመልኩኝ ዘንድ ሕዝቤን ልቀቅ', en: 'Let my people go, that they may serve me' } },
      { key: 'd', text: { am: 'ጦርነት እንዳይገጥሙ', en: 'that they may not face war' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በኦሪት ዘፀአት 9፡1 “የዕብራውያን አምላክ እግዚአብሔር እንዲህ ይላል፦ ያመልኩኝ ዘንድ ሕዝቤን ልቀቅ” ተብሎ ተጽፏል።',
      en: 'Exodus 9:1 states: "Thus saith the LORD God of the Hebrews, Let my people go, that they may serve me."',
    },
    evidence: {
      verseId: 'b3cb3b74-fb31-591c-afed-9321892831cd',
      quoteAm: 'ያመልኩኝ ዘንድ ሕዝቤን ልቀቅ',
    },
    excerpt: null,
  },

  // 11: am-numbers-4-17 -> d (finish-the-verse)
  {
    passageId: 'am-numbers-4-17',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘኍልቍ 17፡3 ያለውን ኃይለ ቃል ያሟሉ፦ “ለየአባቶቻቸው ቤት ወገን አንድ በትር ይሰጣሉና በሌዊ በትር ላይ ___”',
      en: 'Complete the verse in Numbers 17:3: "And thou shalt write Aaron’s name upon the rod of Levi: for one rod shall be ___"',
    },
    options: [
      { key: 'a', text: { am: 'የሙሴን ስም ጻፍ', en: 'write the name of Moses' } },
      { key: 'b', text: { am: 'የካህኑን ስም ጻፍ', en: 'write the priest’s name' } },
      { key: 'c', text: { am: 'የነገዱን ስም ጻፍ', en: 'write the tribe’s name' } },
      { key: 'd', text: { am: 'የአሮንን ስም ጻፍ', en: 'write Aaron’s name' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በኦሪት ዘኍልቍ 17፡3 “ለየአባቶቻቸው ቤት ወገን አንድ በትር ይሰጣሉና በሌዊ በትር ላይ የአሮንን ስም ጻፍ” ይላል።',
      en: 'Numbers 17:3 commands to write Aaron’s name upon the rod of Levi.',
    },
    evidence: {
      verseId: 'd2027587-96f8-55ea-a098-c201f5b17dae',
      quoteAm: 'የአሮንን ስም ጻፍ',
    },
    excerpt: {
      am: 'ለየአባቶቻቸው ቤት ወገን አንድ በትር ይሰጣሉና በሌዊ በትር ላይ',
      en: 'for one rod shall be for the head of the house of their fathers. And thou shalt write upon the rod of Levi',
    },
  },

  // 12: am-deuteronomy-5-8 -> a (trivia)
  {
    passageId: 'am-deuteronomy-5-8',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘዳግም 8፡3 መሠረት ሰው በእንጀራ ብቻ ሳይሆን በምን በሕይወት እንደሚኖር ተጽፏል?',
      en: 'According to Deuteronomy 8:3, by what doth man live besides bread only?',
    },
    options: [
      { key: 'a', text: { am: 'ከእግዚአብሔር አፍ በሚወጣ ነገር ሁሉ', en: 'by every word that proceedeth out of the mouth of the LORD' } },
      { key: 'b', text: { am: 'በወርቅና በብር ብዛት', en: 'by abundance of gold and silver' } },
      { key: 'c', text: { am: 'በሰራዊትና በጦር ኃይል', en: 'by hosts and strength of arms' } },
      { key: 'd', text: { am: 'በጥበበኞች ምክር ብቻ', en: 'by wise counsel alone' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘዳግም 8፡3 “ሰው በእንጀራ ብቻ በሕይወት እንዳይኖር ሰው ከእግዚአብሔር አፍ በሚወጣ ነገር ሁሉ በሕይወት እንዲኖር” ይላል።',
      en: 'Deuteronomy 8:3 declares: "man doth not live by bread only, but by every word that proceedeth out of the mouth of the LORD doth man live."',
    },
    evidence: {
      verseId: 'f5a2977b-48c1-554b-addf-65bd0c0c83a1',
      quoteAm: 'ከእግዚአብሔር አፍ በሚወጣ ነገር ሁሉ',
    },
    excerpt: null,
  },

  // 13: am-judges-7-8 -> b (finish-the-verse)
  {
    passageId: 'am-judges-7-8',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ መሳፍንት 8፡4 ያለውን ኃይለ ቃል ያሟሉ፦ “ጌዴዎንም ወደ ዮርዳኖስ መጥቶ ተሻገረ፤ ከእርሱም ጋር ያሉት ___”',
      en: 'Complete the verse in Judges 8:4: "And Gideon came to Jordan, and passed over, he, and the ___ that were with him"',
    },
    options: [
      { key: 'a', text: { am: 'አንድ ሺህ ሰዎች ተሻገሩ', en: 'one thousand men passed over' } },
      { key: 'b', text: { am: 'ሦስት መቶ ሰዎች ተሻገሩ', en: 'three hundred men that were with him' } },
      { key: 'c', text: { am: 'ሰባት መቶ ሰዎች ተሻገሩ', en: 'seven hundred men passed over' } },
      { key: 'd', text: { am: 'አምስት መቶ ሰዎች ተሻገሩ', en: 'five hundred men passed over' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ መሳፍንት 8፡4 “ጌዴዎንም ወደ ዮርዳኖስ መጥቶ ተሻገረ፤ ከእርሱም ጋር ያሉት ሦስት መቶ ሰዎች ተሻገሩ” ይላል።',
      en: 'Judges 8:4 states: "And Gideon came to Jordan, and passed over, he, and the three hundred men that were with him, faint, yet pursuing them."',
    },
    evidence: {
      verseId: '27cfd581-a8c5-5fc9-afc5-a5b929668a01',
      quoteAm: 'ሦስት መቶ ሰዎች ተሻገሩ',
    },
    excerpt: {
      am: 'ጌዴዎንም ወደ ዮርዳኖስ መጥቶ ተሻገረ፤ ከእርሱም ጋር ያሉት',
      en: 'And Gideon came to Jordan, and passed over, he, and the',
    },
  },

  // 14: am-second-chronicles-14-7 -> c (trivia)
  {
    passageId: 'am-second-chronicles-14-7',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በ2ኛ ዜና መዋዕል 7፡1 መሠረት ሰሎሞን ጸሎቱን በፈጸመ ጊዜ ከሰማይ የወረደውና መሥዋዕቱን የበላው ምንድን ነው?',
      en: 'According to 2 Chronicles 7:1, what came down from heaven and consumed the burnt offering when Solomon had made an end of praying?',
    },
    options: [
      { key: 'a', text: { am: 'የብርሃን ደመና መጥቶ', en: 'a cloud of light came' } },
      { key: 'b', text: { am: 'ኃይለኛ ነፋስ ነፍሶ', en: 'a mighty wind blew' } },
      { key: 'c', text: { am: 'እሳት ከሰማይ ወርዶ', en: 'the fire came down from heaven' } },
      { key: 'd', text: { am: 'የበረከት ዝናብ ዘንቦ', en: 'rain of blessing fell' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በ2 ዜና መዋዕል 7፡1 “ሰሎሞንም ይህን ጸሎት በፈጸመ ጊዜ እሳት ከሰማይ ወርዶ የሚቃጠለውን ቍርባንና መሥዋዕቱን ሁሉ በላ፤ የእግዚአብሔርም ክብር ቤቱን ሞላ” ይላል።',
      en: '2 Chronicles 7:1 records: "Now when Solomon had made an end of praying, the fire came down from heaven, and consumed the burnt offering and the sacrifices."',
    },
    evidence: {
      verseId: 'd69210af-a457-57ff-a396-79cf671b7dc7',
      quoteAm: 'እሳት ከሰማይ ወርዶ',
    },
    excerpt: null,
  },

  // 15: am-jubilees-15-7 -> d (finish-the-verse)
  {
    passageId: 'am-jubilees-15-7',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ኩፋሌ 7፡4 ያለውን ኃይለ ቃል ያሟሉ፦ “ደሙንና ወይኑንም አምጥቶ በሁሉ ላይ ዕጣን ጨመረበት። እግዚአብሔርም የሚወደውን ___”',
      en: 'Complete the verse in Jubilees 7:4: "And he brought the blood and the wine and put incense upon all, and offered ___"',
    },
    options: [
      { key: 'a', text: { am: 'አዲስ ቃል ኪዳን ሰጠ', en: 'gave a new covenant' } },
      { key: 'b', text: { am: 'ምልክት አድርጎ አኖረ', en: 'set as a sign' } },
      { key: 'c', text: { am: 'የተቀደሰ ስም አወጣለት', en: 'gave a holy name' } },
      { key: 'd', text: { am: 'በጎ መዓዛ አድርጎ አቀረበ', en: 'an acceptable sweet savor unto the LORD' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመጽሐፈ ኩፋሌ 7፡4 “ደሙንና ወይኑንም አምጥቶ በሁሉ ላይ ዕጣን ጨመረበት። እግዚአብሔርም የሚወደውን በጎ መዓዛ አድርጎ አቀረበ” ይላል።',
      en: 'Jubilees 7:4 states Noah offered an acceptable sweet savor unto the LORD.',
    },
    evidence: {
      verseId: '43bc9177-a0ad-5a11-affd-821d89e5ed28',
      quoteAm: 'በጎ መዓዛ አድርጎ አቀረበ',
    },
    excerpt: {
      am: 'ደሙንና ወይኑንም አምጥቶ በሁሉ ላይ ዕጣን ጨመረበት። እግዚአብሔርም የሚወደውን',
      en: 'And he brought the blood and the wine and put incense upon all, and offered',
    },
  },

  // 16: am-tobit-21-5 -> a (trivia)
  {
    passageId: 'am-tobit-21-5',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በመጽሐፈ ጦቢት 5፡4 መሠረት ጦብያ አብሮት የሚሄድ ሰውን ሊፈልግ ሄዶ ያገኘው መልአክ ማን ነበር?',
      en: 'According to Tobit 5:4, which angel did Tobias find when he went to seek a man to go with him?',
    },
    options: [
      { key: 'a', text: { am: 'መልአኩን ሩፋኤልን', en: 'Raphael that was an angel' } },
      { key: 'b', text: { am: 'መልአኩን ሚካኤልን', en: 'the angel Michael' } },
      { key: 'c', text: { am: 'መልአኩን ገብርኤልን', en: 'the angel Gabriel' } },
      { key: 'd', text: { am: 'መልአኩን ዑርኤልን', en: 'the angel Uriel' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ጦቢት 5፡4 “እርሱም ሰውን ሊፈልግ ሄዶ መልአኩን ሩፋኤልን አገኘው፤ ነገር ግን መልአክ እንደ ሆነ አላወቀም” ይላል።',
      en: 'Tobit 5:4 states: "Therefore when he went to seek a man, he found Raphael that was an angel: but he knew not."',
    },
    evidence: {
      verseId: 'a9387691-93a9-56b5-ad99-0e4bd97ce0b5',
      quoteAm: 'መልአኩን ሩፋኤልን',
    },
    excerpt: null,
  },

  // 17: am-judith-22-4 -> b (finish-the-verse)
  {
    passageId: 'am-judith-22-4',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ዮዲት 4፡2 ያለውን ኃይለ ቃል ያሟሉ፦ “ከመቅረቡም የተነሣ ስለ ኢየሩሳሌምና ስለ አምላካቸው ስለ እግዚአብሔር ቤተ መቅደስ ___”',
      en: 'Complete the verse in Judith 4:2: "Therefore they were exceedingly afraid of him, and were troubled for Jerusalem, and ___"',
    },
    options: [
      { key: 'a', text: { am: 'እልል አሉ።', en: 'shouted with joy' } },
      { key: 'b', text: { am: 'ፈጽመው ፈሩ', en: 'for the temple of the Lord their God' } },
      { key: 'c', text: { am: 'በሰላም ዐረፉ', en: 'rested in peace' } },
      { key: 'd', text: { am: 'ደስታን አደረጉ', en: 'made great celebration' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ ዮዲት 4፡2 “ከመቅረቡም የተነሣ ስለ ኢየሩሳሌምና ስለ አምላካቸው ስለ እግዚአብሔር ቤተ መቅደስ ፈጽመው ፈሩ” ይላል።',
      en: 'Judith 4:2 describes how they were exceedingly afraid for Jerusalem and the temple.',
    },
    evidence: {
      verseId: 'fc390ba4-0660-5b7e-a4d8-4779ed610dae',
      quoteAm: 'ፈጽመው ፈሩ',
    },
    excerpt: {
      am: 'ከመቅረቡም የተነሣ ስለ ኢየሩሳሌምና ስለ አምላካቸው ስለ እግዚአብሔር ቤተ መቅደስ',
      en: 'Therefore they were exceedingly afraid of him, and were troubled for Jerusalem, and',
    },
  },

  // 18: am-job-27-4 -> c (trivia)
  {
    passageId: 'am-job-27-4',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ኢዮብ 4፡1 መሠረት ለኢዮብ መልስ የሰጠው ቴማናዊው ሰው ማን ነው?',
      en: 'According to Job 4:1, who was the Temanite that answered Job?',
    },
    options: [
      { key: 'a', text: { am: 'ሹሐዊው በልዳዶስ', en: 'Bildad the Shuhite' } },
      { key: 'b', text: { am: 'ናዕማታዊው ሶፋር', en: 'Zophar the Naamathite' } },
      { key: 'c', text: { am: 'ቴማናዊውም ኤልፋዝ', en: 'Eliphaz the Temanite' } },
      { key: 'd', text: { am: 'ቡዛዊው ኤሊሁ', en: 'Elihu the Buzite' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ኢዮብ 4፡1 “ቴማናዊውም ኤልፋዝ መለሰ፥ እንዲህም አለ” ይላል።',
      en: 'Job 4:1 begins: "Then Eliphaz the Temanite answered and said."',
    },
    evidence: {
      verseId: 'd5cdb30e-6e57-546d-aacb-f8f858eee260',
      quoteAm: 'ቴማናዊውም ኤልፋዝ',
    },
    excerpt: null,
  },

  // 19: am-psalms-28-1 -> d (finish-the-verse)
  {
    passageId: 'am-psalms-28-1',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በመዝሙረ ዳዊት 1፡2 ያለውን ኃይለ ቃል ያሟሉ፦ “ነገር ግን በእግዚአብሔር ሕግ ደስ ይለዋል ሕጉንም ___”',
      en: 'Complete the verse in Psalm 1:2: "But his delight is in the law of the LORD; and in his law ___"',
    },
    options: [
      { key: 'a', text: { am: 'በወር አንድ ጊዜ ያነበዋል', en: 'reads once a month' } },
      { key: 'b', text: { am: 'በመቅደሱ ውስጥ ብቻ ይናገራል', en: 'speaks only in the sanctuary' } },
      { key: 'c', text: { am: 'ከሽማግሌዎች ጋር ይማረዋል', en: 'learns with the elders' } },
      { key: 'd', text: { am: 'በቀንና በሌሊት ያስባል', en: 'doth he meditate day and night' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመዝሙረ ዳዊት 1፡2 “ነገር ግን በእግዚአብሔር ሕግ ደስ ይለዋል ሕጉንም በቀንና በሌሊት ያስባል” ተብሎ ተጽፏል።',
      en: 'Psalm 1:2 states: "But his delight is in the law of the LORD; and in his law doth he meditate day and night."',
    },
    evidence: {
      verseId: '56cf8615-e799-5a6b-a467-7bba7f2ac5a6',
      quoteAm: 'በቀንና በሌሊት ያስባል',
    },
    excerpt: {
      am: 'ነገር ግን በእግዚአብሔር ሕግ ደስ ይለዋል ሕጉንም',
      en: 'But his delight is in the law of the LORD; and in his law',
    },
  },
]

async function run() {
  console.log('=== VALIDATING BATCH 011 ===')
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

  // Cap existing prompts window to 450 items if needed to stay under 500 limit
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
  console.log('Batch 011 successfully generated, validated, and ingested into the library!')
}

run().catch((err) => {
  console.error(err)
  process.exit(1)
})
