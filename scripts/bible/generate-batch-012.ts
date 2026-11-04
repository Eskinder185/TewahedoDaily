/**
 * Offline generator for Faith Challenges Batch 012
 * 20 source-grounded bilingual questions from verified Amharic Bible passages.
 */
import { readFileSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'
import { validateAmharicQuestionResponse } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { adaptEditorialBatchToCms } from './adapt-drafts-for-cms'
import { previewQuestionImport } from '../../src/lib/play/questionLibrary'
import { runCampaign } from './campaign-orchestrator'

const BATCH_DIR = 'artifacts/faith-challenges/batch-012'
const sourceBatch = JSON.parse(readFileSync(join(BATCH_DIR, 'source-batch.json'), 'utf8'))
const sourceManifest = JSON.parse(readFileSync(join(BATCH_DIR, 'source-manifest.json'), 'utf8'))
const existingPrompts = JSON.parse(readFileSync(join(BATCH_DIR, 'existing-prompts.json'), 'utf8'))
const modelId = 'copilot-agent-mode'

const questions = [
  // 0: am-genesis-1-14 -> a (trivia)
  {
    passageId: 'am-genesis-1-14',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘፍጥረት 14፡4 መሠረት ለኮሎዶጎሞር ስንት ዓመት ተገዙ?',
      en: 'According to Genesis 14:4, how many years did they serve Chedorlaomer?',
    },
    options: [
      { key: 'a', text: { am: 'ዐሥራ ሁለት ዓመት', en: 'Twelve years' } },
      { key: 'b', text: { am: 'ዐሥራ አምስት ዓመት', en: 'fifteen years' } },
      { key: 'c', text: { am: 'ሰባት ዓመት', en: 'seven years' } },
      { key: 'd', text: { am: 'ሃያ ዓመት', en: 'twenty years' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘፍጥረት 14፡4 “ዐሥራ ሁለት ዓመት ለኮሎዶጎሞር ተገዙ፤ በዐሥራ ሦስተኛውም ዓመት ዐመፁ” ተብሎ ተጽፏል።',
      en: 'Genesis 14:4 states: "Twelve years they served Chedorlaomer, and in the thirteenth year they rebelled."',
    },
    evidence: {
      verseId: '5c41b9dd-8ebb-5bc5-ac36-5ef447b415b1',
      quoteAm: 'ዐሥራ ሁለት ዓመት',
    },
    excerpt: null,
  },

  // 1: am-leviticus-3-16 -> b (finish-the-verse)
  {
    passageId: 'am-leviticus-3-16',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘሌዋውያን 16፡3 ያለውን ኃይለ ቃል ያሟሉ፦ “እንዲሁ አሮን ለኀጢአት መሥዋዕት ከላሞች ወይፈን፥ ለሚቃጠል መሥዋዕትም ___”',
      en: 'Complete the verse in Leviticus 16:3: "Thus shall Aaron come into the holy place: with a young bullock for a sin offering, and ___"',
    },
    options: [
      { key: 'a', text: { am: 'የፍየል ጠቦት ይዞ ወደ መቅደስ ይግባ', en: 'a kid of the goats into the sanctuary' } },
      { key: 'b', text: { am: 'አውራ በግ ይዞ ወደ ተቀደሰው ስፍራ ይግባ', en: 'a ram for a burnt offering into the holy place' } },
      { key: 'c', text: { am: 'የዕጣን ጥና ይዞ ወደ ታቦቱ ይቅረብ', en: 'a censer of incense before the ark' } },
      { key: 'd', text: { am: 'የወርቅ ጽዋ ይዞ በካህናቱ ፊት ይቁም', en: 'a golden cup before the priests' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘሌዋውያን 16፡3 “እንዲሁ አሮን ለኀጢአት መሥዋዕት ከላሞች ወይፈን፥ ለሚቃጠል መሥዋዕትም አውራ በግ ይዞ ወደ ተቀደሰው ስፍራ ይግባ” ይላል።',
      en: 'Leviticus 16:3 specifies: "Thus shall Aaron come into the holy place: with a young bullock for a sin offering, and a ram for a burnt offering."',
    },
    evidence: {
      verseId: '0229bf70-59d5-5aed-a9c4-77182cb470a4',
      quoteAm: 'አውራ በግ ይዞ ወደ ተቀደሰው ስፍራ ይግባ',
    },
    excerpt: {
      am: 'እንዲሁ አሮን ለኀጢአት መሥዋዕት ከላሞች ወይፈን፥ ለሚቃጠል መሥዋዕትም',
      en: 'Thus shall Aaron come into the holy place: with a young bullock for a sin offering, and',
    },
  },

  // 2: am-joshua-6-13 -> c (trivia)
  {
    passageId: 'am-joshua-6-13',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ኢያሱ 13፡1 መሠረት ኢያሱ በሸመገለ ጊዜ እግዚአብሔር ለእርሱ ምን አለው?',
      en: 'According to Joshua 13:1, what did the LORD say unto Joshua when he was old and stricken in years?',
    },
    options: [
      { key: 'a', text: { am: 'የከነዓን ምድር ሁሉ ተወርሳ አልቃለች', en: 'all the land of Canaan is possessed' } },
      { key: 'b', text: { am: 'ወደ ተራራው ወጥተህ ሠራዊቱን አሰልፍ', en: 'go up to the mount and set the battle in array' } },
      { key: 'c', text: { am: 'ያልተወረሰች እጅግ ብዙ ምድር ገና ቀርታለች', en: 'there remaineth yet very much land to be possessed' } },
      { key: 'd', text: { am: 'ከተሞችን ሁሉ በእሳት አቃጥሏቸው', en: 'burn all the cities with fire' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ኢያሱ 13፡1 “እግዚአብሔርም ኢያሱን አለው፦ እነሆ ዘመንህ አለፈ፤ ያልተወረሰች እጅግ ብዙ ምድር ገና ቀርታለች” ይላል።',
      en: 'Joshua 13:1 states: "and the LORD said unto him, Thou art old and stricken in years, and there remaineth yet very much land to be possessed."',
    },
    evidence: {
      verseId: 'ba4c4f1c-e922-59cc-accb-30a4ef055ec3',
      quoteAm: 'ያልተወረሰች እጅግ ብዙ ምድር ገና ቀርታለች',
    },
    excerpt: null,
  },

  // 3: am-first-chronicles-13-12 -> d (finish-the-verse)
  {
    passageId: 'am-first-chronicles-13-12',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ዜና መዋዕል ቀዳማዊ 12፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “በሴቅላቅም ከቂስ ልጅ ከሳኦል በተሸሸገ ጊዜ ___”',
      en: 'Complete the verse in 1 Chronicles 12:1: "Now these are they that came to David to Ziklag, while he yet kept himself close because of Saul the son of Kish: ___"',
    },
    options: [
      { key: 'a', text: { am: 'የተሰበሰቡት ካህናት እነዚህ ናቸው', en: 'these are the priests that gathered' } },
      { key: 'b', text: { am: 'የሳኦል አገልጋዮች በሙሉ ሸሹ', en: 'all Saul’s servants fled' } },
      { key: 'c', text: { am: 'ከዳዊት ጋር የተማከሩት አለቆች ናቸው', en: 'these are chiefs that consulted with David' } },
      { key: 'd', text: { am: 'ወደ ዳዊት የመጡ እነዚህ ናቸው', en: 'these are they that came to David' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በ1 ዜና መዋዕል 12፡1 “በሴቅላቅም ከቂስ ልጅ ከሳኦል በተሸሸገ ጊዜ ወደ ዳዊት የመጡ እነዚህ ናቸው” ይላል።',
      en: '1 Chronicles 12:1 reads: "Now these are they that came to David to Ziklag, while he yet kept himself close because of Saul the son of Kish."',
    },
    evidence: {
      verseId: 'e2e85a40-0616-568a-a191-20928925fe6f',
      quoteAm: 'ወደ ዳዊት የመጡ እነዚህ ናቸው',
    },
    excerpt: {
      am: 'በሴቅላቅም ከቂስ ልጅ ከሳኦል በተሸሸገ ጊዜ',
      en: 'while he yet kept himself close because of Saul the son of Kish:',
    },
  },

  // 4: am-enoch-16-24 -> a (trivia)
  {
    passageId: 'am-enoch-16-24',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ሄኖክ 24፡1 መሠረት ከመኖሪያቸው ጋር ከማይለዩት ከስንት ከዋክብት ጋር እንደ ሆኑ ተጽፏል?',
      en: 'According to Enoch 24:1, with how many stars that are not separated from their dwelling are they joined?',
    },
    options: [
      { key: 'a', text: { am: 'ከአራቱ ከዋክብት ጋር', en: 'with the four stars' } },
      { key: 'b', text: { am: 'ከሰባቱ ከዋክብት ጋር', en: 'with the seven stars' } },
      { key: 'c', text: { am: 'ከዐሥራ ሁለቱ ከዋክብት ጋር', en: 'with the twelve stars' } },
      { key: 'd', text: { am: 'ከሦስቱ ከዋክብት ጋር', en: 'with the three stars' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ሄኖክ 24፡1 “ከመኖሪያቸው ጋር ከማይለዩት ከአራቱ ከዋክብት ጋር” ይላል።',
      en: 'Enoch 24:1 references the four stars that do not part from their stations.',
    },
    evidence: {
      verseId: '0807f8d9-8057-54ad-a246-543155a5eafb',
      quoteAm: 'ከአራቱ ከዋክብት ጋር',
    },
    excerpt: null,
  },

  // 5: am-first-meqabyan-24-12 -> b (finish-the-verse)
  {
    passageId: 'am-first-meqabyan-24-12',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 12፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “የኢየሩሳሌም ልጅ! በነቢዩ የተጻፈው ውርደትሽ ይህ ነው፤ የኢየሩሳሌም ልጅ! ___”',
      en: 'Complete the verse in 1 Meqabyan 12:1: "O daughter of Jerusalem! this is thy reproach written in the prophet; O daughter of Jerusalem! ___"',
    },
    options: [
      { key: 'a', text: { am: 'ምሕረትሽና በረከትሽ በምድር ላይ ፈሰሰ', en: 'thy mercy and blessing poured upon earth' } },
      { key: 'b', text: { am: 'ሥራሽና በደልሽ እንደ ሰዶምና ገሞራ ሰዎች ሥራና በደል ነውና', en: 'for thy work and transgression is as Sodom and Gomorrah' } },
      { key: 'c', text: { am: 'ከአሕዛብ ሁሉ ይልቅ ከፍ ከፍ አልሽ', en: 'thou art exalted above all Gentiles' } },
      { key: 'd', text: { am: 'የሰላምሽ ዜና በከተሞች ሁሉ ተሰማ', en: 'news of thy peace was heard in all cities' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 12፡1 “ሥራሽና በደልሽ እንደ ሰዶምና ገሞራ ሰዎች ሥራና በደል ነውና” ይላል።',
      en: '1 Meqabyan 12:1 compares the works and transgressions to Sodom and Gomorrah.',
    },
    evidence: {
      verseId: '227bde03-b756-5a87-a8ac-571607e0a599',
      quoteAm: 'ሥራሽና በደልሽ እንደ ሰዶምና ገሞራ ሰዎች ሥራና በደል ነውና',
    },
    excerpt: {
      am: 'የኢየሩሳሌም ልጅ! በነቢዩ የተጻፈው ውርደትሽ ይህ ነው፤ የኢየሩሳሌም ልጅ!',
      en: 'O daughter of Jerusalem! this is thy reproach written in the prophet; O daughter of Jerusalem!',
    },
  },

  // 6: am-hosea-43-12 -> c (trivia)
  {
    passageId: 'am-hosea-43-12',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በትንቢተ ሆሴዕ 12፡3 መሠረት እግዚአብሔር ያዕቆብን እንደ ምን ይበቀለዋል ተብሎ ተጽፏል?',
      en: 'According to Hosea 12:3, according to what will God recompense Jacob?',
    },
    options: [
      { key: 'a', text: { am: 'በጠላቶቹ እጅ አሳልፎ ይሰጠዋል', en: 'give him into the hand of enemies' } },
      { key: 'b', text: { am: 'ከምድሩ ፈጽሞ ያሳድደዋል', en: 'drive him utterly from the land' } },
      { key: 'c', text: { am: 'እንደ መንገዱ ይበቀለዋል', en: 'recompense him according to his ways' } },
      { key: 'd', text: { am: 'በረከቱን ሁሉ ይነሣዋል', en: 'take away all his blessings' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በትንቢተ ሆሴዕ 12፡3 “ያዕቆብንም እንደ መንገዱ ይበቀለዋል፤ እንደ ሥራውም ይከፍለዋል” ተብሎ ተጽፏል።',
      en: 'Hosea 12:3 states: "and will punish Jacob according to his ways; according to his doings will he recompense him."',
    },
    evidence: {
      verseId: '45fea452-7d70-5850-abaa-8c1102189abd',
      quoteAm: 'እንደ መንገዱ ይበቀለዋል',
    },
    excerpt: null,
  },

  // 7: am-acts-59-12 -> d (finish-the-verse)
  {
    passageId: 'am-acts-59-12',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በየሐዋርያት ሥራ 12፡2 ያለውን ኃይለ ቃል ያሟሉ፦ “የዮሐንስንም ወንድም ያዕቆብን ___”',
      en: 'Complete the verse in Acts 12:2: "And he killed James the brother of John ___"',
    },
    options: [
      { key: 'a', text: { am: 'ወደ ወኅኒ ቤት አገባው', en: 'put him in prison' } },
      { key: 'b', text: { am: 'በአደባባይ አቆመው', en: 'stood him in the street' } },
      { key: 'c', text: { am: 'ከሀገር አሳደደው', en: 'exiled him from the country' } },
      { key: 'd', text: { am: 'በሰይፍ ገደለው', en: 'with the sword' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በየሐዋርያት ሥራ 12፡2 “የዮሐንስንም ወንድም ያዕቆብን በሰይፍ ገደለው” ይላል።',
      en: 'Acts 12:2 records: "And he killed James the brother of John with the sword."',
    },
    evidence: {
      verseId: 'a07e6d07-7e3c-57f5-a2cb-8be5bd3498ac',
      quoteAm: 'በሰይፍ ገደለው',
    },
    excerpt: {
      am: 'የዮሐንስንም ወንድም ያዕቆብን',
      en: 'And he killed James the brother of John',
    },
  },

  // 8: am-second-corinthians-62-12 -> a (trivia)
  {
    passageId: 'am-second-corinthians-62-12',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በ2ኛ ቆሮንቶስ 12፡4 መሠረት ያ ሰው ወደ ገነት በተነጠቀ ጊዜ በዚያ ምን ሰማ?',
      en: 'According to 2 Corinthians 12:4, what did the man hear when he was caught up into paradise?',
    },
    options: [
      { key: 'a', text: { am: 'ሰው ሊናገረው የማይችለውን የማይተረጐም ነገር', en: 'unspeakable words, which it is not lawful for a man to utter' } },
      { key: 'b', text: { am: 'የመላእክትን የምስጋና ዝማሬ ብቻ', en: 'only the praises of the angels' } },
      { key: 'c', text: { am: 'የነቢያትን የትንቢት ቃል', en: 'the words of the prophets' } },
      { key: 'd', text: { am: 'ስለ ወደፊቱ ዓለም የተጻፈውን ሕግ', en: 'the laws written for the world to come' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በ2ኛ ቆሮንቶስ 12፡4 “ወደ ገነትም ነጥቀው ወሰዱት፤ በዚያም ሰው ሊናገረው የማይችለውን የማይተረጐም ነገር ሰማ” ይላል።',
      en: '2 Corinthians 12:4 states: "How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter."',
    },
    evidence: {
      verseId: '32b3396c-726c-5d78-aefd-84b7b652c618',
      quoteAm: 'ሰው ሊናገረው የማይችለውን የማይተረጐም ነገር',
    },
    excerpt: null,
  },

  // 9: am-revelation-81-22 -> b (finish-the-verse)
  {
    passageId: 'am-revelation-81-22',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በየዮሐንስ ራእይ 22፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “በአደባባይዋም መካከል ከእግዚአብሔርና ከበጉ ዙፋን የሚወጣውን ___”',
      en: 'Complete the verse in Revelation 22:1: "And he shewed me a pure river of water of life, clear as crystal, proceeding out of ___"',
    },
    options: [
      { key: 'a', text: { am: 'የሰማያትን ብርሃን በግልጽ ተመለከትሁ', en: 'the light of heaven seen clearly' } },
      { key: 'b', text: { am: 'እንደ ብርሌ የሚያንጸባርቀውን የሕይወትን ውሃ ወንዝ አሳየኝ', en: 'a pure river of water of life, clear as crystal' } },
      { key: 'c', text: { am: 'የካህናቱን ማኅበር በአንድነት አየሁ', en: 'the company of priests gathered' } },
      { key: 'd', text: { am: 'የወርቅ መቅረዞችን ተቀምጠው አገኘሁ', en: 'golden candlesticks set in order' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በራእይ 22፡1 “በአደባባይዋም መካከል ከእግዚአብሔርና ከበጉ ዙፋን የሚወጣውን እንደ ብርሌ የሚያንጸባርቀውን የሕይወትን ውሃ ወንዝ አሳየኝ” ይላል።',
      en: 'Revelation 22:1 reads: "And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of God and of the Lamb."',
    },
    evidence: {
      verseId: '345678b5-5424-5024-a27c-611d6da74580',
      quoteAm: 'እንደ ብርሌ የሚያንጸባርቀውን የሕይወትን ውሃ ወንዝ አሳየኝ',
    },
    excerpt: {
      am: 'በአደባባይዋም መካከል ከእግዚአብሔርና ከበጉ ዙፋን የሚወጣውን',
      en: 'proceeding out of the throne of God and of the Lamb',
    },
  },

  // 10: am-exodus-2-10 -> c (trivia)
  {
    passageId: 'am-exodus-2-10',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘፀአት 10፡4 መሠረት ፈርዖን ሕዝቡን ለመልቀቅ እንቢ ካለ እግዚአብሔር ምን እንደሚያመጣ አስጠነቀቀ?',
      en: 'According to Exodus 10:4, what did the LORD warn that He would bring upon the coast if Pharaoh refused to let His people go?',
    },
    options: [
      { key: 'a', text: { am: 'ጽኑዕ ቸነፈርን አመጣለሁ', en: 'bring a great pestilence' } },
      { key: 'b', text: { am: 'የእሳት ነበልባልን አወርዳለሁ', en: 'send down flames of fire' } },
      { key: 'c', text: { am: 'አንበጣን አመጣለሁ', en: 'bring the locusts into thy coast' } },
      { key: 'd', text: { am: 'የበረዶ ዝናብን አዘንባለሁ', en: 'rain down hailstones' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በኦሪት ዘፀአት 10፡4 “ሕዝቤን ለመልቀቅ እንቢ ብትል ግን፥ እነሆ፥ ነገ በዚህ ጊዜ በተራራዎችህ ሁሉ ላይ አንበጣን አመጣለሁ” ይላል።',
      en: 'Exodus 10:4 warns: "Else, if thou refuse to let my people go, behold, to morrow will I bring the locusts into thy coast."',
    },
    evidence: {
      verseId: '68725d3c-62bf-53e1-a33a-38b6804aa330',
      quoteAm: 'አንበጣን አመጣለሁ',
    },
    excerpt: null,
  },

  // 11: am-numbers-4-18 -> d (finish-the-verse)
  {
    passageId: 'am-numbers-4-18',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘኍልቍ 18፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “እግዚአብሔርም አሮንን እንዲህ ብሎ ነገረው፥ “አንተ ከአንተም ጋር ልጆችህና የአባቶችህ ወገኖች፥ ___”',
      en: 'Complete the verse in Numbers 18:1: "And the LORD said unto Aaron, Thou and thy sons and thy father’s house with thee ___"',
    },
    options: [
      { key: 'a', text: { am: 'በድንኳኑ ውስጥ ሁልጊዜ አገልግሉ', en: 'shall minister in the tent continually' } },
      { key: 'b', text: { am: 'መሥዋዕቱን ለሕዝቡ አቅርቡ', en: 'shall offer the sacrifice for the people' } },
      { key: 'c', text: { am: 'የመሠዊያውን ቅባት ጠብቁ', en: 'shall keep the anointing of the altar' } },
      { key: 'd', text: { am: 'የክህነታችሁን ኀጢአት ትሸከማላችሁ', en: 'shall bear the iniquity of the sanctuary' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በኦሪት ዘኍልቍ 18፡1 “እግዚአብሔርም አሮንን እንዲህ ብሎ ነገረው፥ “አንተ ከአንተም ጋር ልጆችህና የአባቶችህ ወገኖች፥ የክህነታችሁን ኀጢአት ትሸከማላችሁ” ይላል።',
      en: 'Numbers 18:1 states: "Thou and thy sons and thy father’s house with thee shall bear the iniquity of the sanctuary."',
    },
    evidence: {
      verseId: 'a55c207d-a4db-5ace-a7ab-2eae19d64a3c',
      quoteAm: 'የክህነታችሁን ኀጢአት ትሸከማላችሁ',
    },
    excerpt: {
      am: 'እግዚአብሔርም አሮንን እንዲህ ብሎ ነገረው፥ “አንተ ከአንተም ጋር ልጆችህና የአባቶችህ ወገኖች፥',
      en: 'And the LORD said unto Aaron, Thou and thy sons and thy father’s house with thee',
    },
  },

  // 12: am-deuteronomy-5-9 -> a (trivia)
  {
    passageId: 'am-deuteronomy-5-9',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘዳግም 9፡3 መሠረት አምላክህ እግዚአብሔር በፊትህ የሚያልፈው ምን ሆኖ እንደ ሆነ ተጽፏል?',
      en: 'According to Deuteronomy 9:3, as what does the LORD thy God go over before thee?',
    },
    options: [
      { key: 'a', text: { am: 'እርሱ የሚበላ እሳት ነው', en: 'as a consuming fire' } },
      { key: 'b', text: { am: 'የሰማይ ብርሃን ነው', en: 'as light of heaven' } },
      { key: 'c', text: { am: 'የኃይል ጋሻ ነው', en: 'as a shield of power' } },
      { key: 'd', text: { am: 'የጽድቅ አለት ነው', en: 'as a rock of righteousness' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘዳግም 9፡3 “አምላክህም እግዚአብሔር በፊትህ እንዲያልፍ ዛሬ ዕወቅ፤ እርሱ የሚበላ እሳት ነው” ይላል።',
      en: 'Deuteronomy 9:3 declares: "Understand therefore this day, that the LORD thy God is he which goeth over before thee; as a consuming fire he shall destroy them."',
    },
    evidence: {
      verseId: '3d7b96f8-06ee-5bb9-abc9-76df427a8ec0',
      quoteAm: 'እርሱ የሚበላ እሳት ነው',
    },
    excerpt: null,
  },

  // 13: am-judges-7-9 -> b (finish-the-verse)
  {
    passageId: 'am-judges-7-9',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ መሳፍንት 9፡4 ያለውን ኃይለ ቃል ያሟሉ፦ “ከበዓልም ቤት ሰባ ብር ሰጡት፤ በዚያም አቤሜሌክ ___”',
      en: 'Complete the verse in Judges 9:4: "And they gave him threescore and ten pieces of silver out of the house of Baal-berith, wherewith Abimelech ___"',
    },
    options: [
      { key: 'a', text: { am: 'አምስት መቶ ፈረሰኞችን አዘጋጀ', en: 'prepared five hundred horsemen' } },
      { key: 'b', text: { am: 'ወንበዴዎችንና አስደንጋጮችን ቀጠረበት', en: 'hired vain and light persons' } },
      { key: 'c', text: { am: 'የጦር መሣሪያዎችን ገዛ', en: 'bought weapons of war' } },
      { key: 'd', text: { am: 'የሰቂማን ሽማግሌዎች ሰበሰበ', en: 'gathered the elders of Shechem' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ መሳፍንት 9፡4 “ከበዓልም ቤት ሰባ ብር ሰጡት፤ በዚያም አቤሜሌክ ወንበዴዎችንና አስደንጋጮችን ቀጠረበት፤ እነርሱም ተከትለውት ሄዱ” ይላል።',
      en: 'Judges 9:4 states: "And they gave him threescore and ten pieces of silver out of the house of Baal-berith, wherewith Abimelech hired vain and light persons, which followed him."',
    },
    evidence: {
      verseId: 'e08bba94-a329-5ff3-a163-60750861e35d',
      quoteAm: 'ወንበዴዎችንና አስደንጋጮችን ቀጠረበት',
    },
    excerpt: {
      am: 'ከበዓልም ቤት ሰባ ብር ሰጡት፤ በዚያም አቤሜሌክ',
      en: 'And they gave him threescore and ten pieces of silver out of the house of Baal-berith, wherewith Abimelech',
    },
  },

  // 14: am-second-chronicles-14-8 -> c (trivia)
  {
    passageId: 'am-second-chronicles-14-8',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በ2ኛ ዜና መዋዕል 8፡1 መሠረት ሰሎሞን የእግዚአብሔርን ቤትና የራሱን ቤት የሠራበት ስንት ዓመት በተፈጸመ ጊዜ ተብሎ ተጽፏል?',
      en: 'According to 2 Chronicles 8:1, after how many years had Solomon built the house of the LORD and his own house?',
    },
    options: [
      { key: 'a', text: { am: 'ዐሥራ ሁለት ዓመት በተፈጸመ ጊዜ', en: 'at the end of twelve years' } },
      { key: 'b', text: { am: 'ሰባት ዓመት በተፈጸመ ጊዜ', en: 'at the end of seven years' } },
      { key: 'c', text: { am: 'ሃያ ዓመት በተፈጸመ ጊዜ', en: 'at the end of twenty years' } },
      { key: 'd', text: { am: 'ሠላሳ ዓመት በተፈጸመ ጊዜ', en: 'at the end of thirty years' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በ2 ዜና መዋዕል 8፡1 “እንዲህም ሆነ፤ ሰሎሞን የእግዚአብሔርን ቤትና የራሱን ቤት የሠራበት ሃያ ዓመት በተፈጸመ ጊዜ” ይላል።',
      en: '2 Chronicles 8:1 records: "And it came to pass at the end of twenty years, wherein Solomon had built the house of the LORD, and his own house."',
    },
    evidence: {
      verseId: '30f9bb9d-8c85-59c5-ad5c-2b97ddfb9959',
      quoteAm: 'ሃያ ዓመት በተፈጸመ ጊዜ',
    },
    excerpt: null,
  },

  // 15: am-jubilees-15-8 -> d (finish-the-verse)
  {
    passageId: 'am-jubilees-15-8',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ኩፋሌ 8፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “በዚህ ኢዮቤልዩ በሰባተኛው ሱባዔ በመጀመሪያው ዓመት መርከቢቱ ባረፈችበት ስሙ ሉባር በሚባል ከአራራት ተራሮች በአንዱ ተራራ ላይ ___”',
      en: 'Complete the verse in Jubilees 8:1: "In the seventh week in the first year thereof, in this jubilee, Noah planted vines on the mountain on which the ark had rested, named Lubar, ___"',
    },
    options: [
      { key: 'a', text: { am: 'መሠዊያን ሠራ', en: 'built an altar' } },
      { key: 'b', text: { am: 'ድንኳን ተከለ', en: 'pitched a tent' } },
      { key: 'c', text: { am: 'ከተማን መሠረተ', en: 'founded a city' } },
      { key: 'd', text: { am: 'ኖኅ ወይንን ተከለ', en: 'Noah planted vines' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመጽሐፈ ኩፋሌ 8፡1 “ከአራራት ተራሮች በአንዱ ተራራ ላይ ኖኅ ወይንን ተከለ” ይላል።',
      en: 'Jubilees 8:1 records that Noah planted vines on mount Lubar.',
    },
    evidence: {
      verseId: '394a5b1b-6983-5780-a98e-9fec4e243145',
      quoteAm: 'ኖኅ ወይንን ተከለ',
    },
    excerpt: {
      am: 'በዚህ ኢዮቤልዩ በሰባተኛው ሱባዔ በመጀመሪያው ዓመት መርከቢቱ ባረፈችበት ስሙ ሉባር በሚባል ከአራራት ተራሮች በአንዱ ተራራ ላይ',
      en: 'In the seventh week in the first year thereof, in this jubilee, on the mountain named Lubar of the mountains of Ararat,',
    },
  },

  // 16: am-tobit-21-6 -> a (trivia)
  {
    passageId: 'am-tobit-21-6',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በመጽሐፈ ጦቢት 6፡3 መሠረት መልአኩ ልጁን ከውኃው ውስጥ ስለ ወጣው ዓሣ ምን አለው?',
      en: 'According to Tobit 6:3, what did the angel say to the young man concerning the fish that leapt out of the water?',
    },
    options: [
      { key: 'a', text: { am: 'ያን ዓሣ ያዘው', en: 'Take the fish' } },
      { key: 'b', text: { am: 'ወደ ጥልቁ ጣለው', en: 'Cast it into the deep' } },
      { key: 'c', text: { am: 'በድንጋይ ምታው', en: 'Smite it with a stone' } },
      { key: 'd', text: { am: 'ከፊቱ ፈጥነህ ሽሽ', en: 'Flee quickly from it' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ጦቢት 6፡3 “መልአኩም፥ “ያን ዓሣ ያዘው” አለው፤ ያም ልጅ ዓሣውን ያዘው፤ ወደ የብስም አወጣው” ይላል።',
      en: 'Tobit 6:3 states: "Then the angel said unto him, Take the fish. And the young man laid hold of the fish, and drew it to land."',
    },
    evidence: {
      verseId: 'febb3315-94a5-5848-a884-5eced421ef6b',
      quoteAm: 'ያን ዓሣ ያዘው',
    },
    excerpt: null,
  },

  // 17: am-judith-22-5 -> b (finish-the-verse)
  {
    passageId: 'am-judith-22-5',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ዮዲት 5፡2 ያለውን ኃይለ ቃል ያሟሉ፦ “እርሱም ፈጽሞ ተቈጣ፤ የሞአብን አለቆችና የአሞንን ሹሞች፥ ___”',
      en: 'Complete the verse in Judith 5:2: "Then was he exceedingly wroth, and he called all the princes of Moab, and the captains of Ammon, and ___"',
    },
    options: [
      { key: 'a', text: { am: 'ሠራዊቱን በሙሉ ወደ ጦርነት ላከ', en: 'sent all his army to battle' } },
      { key: 'b', text: { am: 'በባሕር ዙሪያ ያሉ ገዢዎችንም ጠራቸው', en: 'all the governors of the sea coast' } },
      { key: 'c', text: { am: 'የከተማይቱን በሮች በሙሉ ዘጋ', en: 'shut all the gates of the city' } },
      { key: 'd', text: { am: 'የሰላም መልእክተኞችን ላከ', en: 'sent messengers of peace' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ ዮዲት 5፡2 “እርሱም ፈጽሞ ተቈጣ፤ የሞአብን አለቆችና የአሞንን ሹሞች፥ በባሕር ዙሪያ ያሉ ገዢዎችንም ጠራቸው” ይላል።',
      en: 'Judith 5:2 records Holofernes calling the leaders of Moab, Ammon, and the governors of the sea coast.',
    },
    evidence: {
      verseId: '338da077-4d58-545b-ab22-b18bf61f4e4a',
      quoteAm: 'በባሕር ዙሪያ ያሉ ገዢዎችንም ጠራቸው',
    },
    excerpt: {
      am: 'እርሱም ፈጽሞ ተቈጣ፤ የሞአብን አለቆችና የአሞንን ሹሞች፥',
      en: 'Then was he exceedingly wroth, and he called all the princes of Moab, and the captains of Ammon, and',
    },
  },

  // 18: am-job-27-5 -> c (trivia)
  {
    passageId: 'am-job-27-5',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ኢዮብ 5፡2 መሠረት ሰነፉን ሰው ምን ይገድለዋል ተብሎ ተጽፏል?',
      en: 'According to Job 5:2, what killeth the foolish man?',
    },
    options: [
      { key: 'a', text: { am: 'ድህነት ያጠፋዋልና', en: 'for poverty destroyeth him' } },
      { key: 'b', text: { am: 'ስንፍና ይጥለዋልና', en: 'for sloth casteth him down' } },
      { key: 'c', text: { am: 'ሰነፉን ሰው ቍጣ ይገድለዋልና', en: 'For wrath killeth the foolish man' } },
      { key: 'd', text: { am: 'ፍርሃት ያስጨንቀዋልና', en: 'for fear troubleth him' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ኢዮብ 5፡2 “ሰነፉን ሰው ቍጣ ይገድለዋልና፥” ይላል።',
      en: 'Job 5:2 states: "For wrath killeth the foolish man, and envy slayeth the silly one."',
    },
    evidence: {
      verseId: 'fe787528-3123-5a9c-a062-60fe6a900248',
      quoteAm: 'ሰነፉን ሰው ቍጣ ይገድለዋልና',
    },
    excerpt: null,
  },

  // 19: am-psalms-28-2 -> d (finish-the-verse)
  {
    passageId: 'am-psalms-28-2',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በመዝሙረ ዳዊት 2፡3 ያለውን ኃይለ ቃል ያሟሉ፦ “ማሰሪያቸውን እንበጥስ ___”',
      en: 'Complete the verse in Psalm 2:3: "Let us break their bands asunder, and ___"',
    },
    options: [
      { key: 'a', text: { am: 'ቀንበራቸውን እንሰብረው', en: 'break their yoke' } },
      { key: 'b', text: { am: 'ግዛታቸውን እናጥፋ', en: 'destroy their dominion' } },
      { key: 'c', text: { am: 'ድንበራቸውን እናፍርስ', en: 'demolish their borders' } },
      { key: 'd', text: { am: 'ገመዳቸውንም ከእኛ እንጣል', en: 'cast away their cords from us' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመዝሙረ ዳዊት 2፡3 “ማሰሪያቸውን እንበጥስ ገመዳቸውንም ከእኛ እንጣል” ተብሎ ተጽፏል።',
      en: 'Psalm 2:3 states: "Let us break their bands asunder, and cast away their cords from us."',
    },
    evidence: {
      verseId: '8a4ad3fe-7691-5908-a222-1d5ca697b254',
      quoteAm: 'ገመዳቸውንም ከእኛ እንጣል',
    },
    excerpt: {
      am: 'ማሰሪያቸውን እንበጥስ',
      en: 'Let us break their bands asunder, and',
    },
  },
]

async function run() {
  console.log('=== VALIDATING BATCH 012 ===')
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
  console.log('Batch 012 successfully generated, validated, and ingested into the library!')
}

run().catch((err) => {
  console.error(err)
  process.exit(1)
})

