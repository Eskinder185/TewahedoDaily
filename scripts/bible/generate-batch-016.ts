/**
 * Offline generator for Faith Challenges Batch 016
 * 20 source-grounded bilingual questions from verified Amharic Bible passages.
 */
import { readFileSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'
import { validateAmharicQuestionResponse } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { adaptEditorialBatchToCms } from './adapt-drafts-for-cms'
import { previewQuestionImport } from '../../src/lib/play/questionLibrary'
import { runCampaign } from './campaign-orchestrator'

const BATCH_DIR = 'artifacts/faith-challenges/batch-016'
const sourceBatch = JSON.parse(readFileSync(join(BATCH_DIR, 'source-batch.json'), 'utf8'))
const sourceManifest = JSON.parse(readFileSync(join(BATCH_DIR, 'source-manifest.json'), 'utf8'))
const existingPrompts = JSON.parse(readFileSync(join(BATCH_DIR, 'existing-prompts.json'), 'utf8'))
const modelId = 'copilot-agent-mode'

const questions = [
  // 0: am-genesis-1-18 -> a (trivia)
  {
    passageId: 'am-genesis-1-18',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘፍጥረት 18፡1 መሠረት አብርሃም በድንኳኑ ደጃፍ ተቀምጦ ሳለ እግዚአብሔር የተገለጠለት በየትኛው ዛፍ ሥር ነበረ?',
      en: 'According to Genesis 18:1, under which tree did the Lord appear to Abraham as he sat in the tent door?',
    },
    options: [
      { key: 'a', text: { am: 'በመምሬ ዛፍ ሥር', en: 'under the oaks of Mamre' } },
      { key: 'b', text: { am: 'በቤርሳቤህ ተምር ሥር', en: 'under the tamarisk tree in Beersheba' } },
      { key: 'c', text: { am: 'በደብረ ሲና ዛፍ ሥር', en: 'under the trees of Mount Sinai' } },
      { key: 'd', text: { am: 'በዮርዳኖስ ሸለቆ ሥር', en: 'in the valley of the Jordan' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘፍጥረት 18፡1 “በቀትርም ጊዜ አብርሃም በድንኳኑ ደጃፍ ተቀምጦ ሳለ እግዚአብሔር በመምሬ ዛፍ ሥር ተገለጠለት” ይላል።',
      en: 'Genesis 18:1 states: "And the Lord appeared unto him in the plains of Mamre: and he sat in the tent door in the heat of the day."',
    },
    evidence: {
      verseId: '9422d30c-6934-5dbc-ad44-87b64a3c4ef7',
      quoteAm: 'በመምሬ ዛፍ ሥር',
    },
    excerpt: null,
  },

  // 1: am-leviticus-3-20 -> b (finish-the-verse)
  {
    passageId: 'am-leviticus-3-20',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'ጥቅሱን ያጠናቅቁ፦ “ከእስራኤል ልጆች ወይም በእስራኤል ዘንድ ከሚቀመጡ እንግዶች ማናቸውም ሰው ዘሩን ለሞሎክ አገልግሎት ቢሰጥ ______፤ የሀገሩ ሕዝብ በድንጋይ ይውገሩት።” (ዘሌዋውያን 20፡2)',
      en: 'Complete the verse: "Whosoever he be of the children of Israel, or of the strangers that sojourn in Israel, that giveth any of his seed unto Molech; ______: the people of the land shall stone him with stones." (Leviticus 20:2)',
    },
    options: [
      { key: 'a', text: { am: 'ከከተማ ይውጣ', en: 'he shall depart the city' } },
      { key: 'b', text: { am: 'ፈጽሞ ይገደል', en: 'he shall surely be put to death' } },
      { key: 'c', text: { am: 'መሥዋዕት ያቅርብ', en: 'he shall offer sacrifice' } },
      { key: 'd', text: { am: 'በዕጣ ይለይ', en: 'he shall be separated by lot' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘሌዋውያን 20፡2 “ዘሩን ለሞሎክ አገልግሎት ቢሰጥ ፈጽሞ ይገደል፤ የሀገሩ ሕዝብ በድንጋይ ይውገሩት” ይላል።',
      en: 'Leviticus 20:2 commands: "he shall surely be put to death: the people of the land shall stone him with stones."',
    },
    evidence: {
      verseId: '43f98b35-5b4a-522d-a2bb-de5489cf513e',
      quoteAm: 'ፈጽሞ ይገደል',
    },
    excerpt: {
      am: '“ደግሞ የእስራኤልን ልጆች እንዲህ በላቸው፦ ከእስራኤል ልጆች ወይም በእስራኤል ዘንድ ከሚቀመጡ እንግዶች ማናቸውም ሰው ዘሩን ለሞሎክ አገልግሎት ቢሰጥ',
      en: 'Whosoever he be of the children of Israel, or of the strangers that sojourn in Israel, that giveth any of his seed unto Molech;',
    },
  },

  // 2: am-joshua-6-17 -> c (trivia)
  {
    passageId: 'am-joshua-6-17',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ኢያሱ 17፡1 መሠረት የምናሴ በኵር የገለዓድ አባት ማኪር ብርቱ ተዋጊ ስለ ነበረ የትኛውን ሀገር ወረሰ?',
      en: 'According to Joshua 17:1, which territory did Machir, the firstborn of Manasseh and father of Gilead, inherit because he was a man of war?',
    },
    options: [
      { key: 'a', text: { am: 'ኬብሮንንና ደቢርን', en: 'Hebron and Debir' } },
      { key: 'b', text: { am: 'ቤተልሔምንና ኬብሮንን', en: 'Bethlehem and Hebron' } },
      { key: 'c', text: { am: 'ገለዓድንና ባሳንን', en: 'Gilead and Bashan' } },
      { key: 'd', text: { am: 'ሴኬምንና ሰማርያን', en: 'Shechem and Samaria' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ኢያሱ 17፡1 “የምናሴም በኵር የገለዓድ አባት ማኪር ብርቱ ተዋጊ ስለ ነበረ ገለዓድንና ባሳንን ወረሰ” ይላል።',
      en: 'Joshua 17:1 states: "because he was a man of war, therefore he had Gilead and Bashan."',
    },
    evidence: {
      verseId: 'e1b367d1-0813-54a8-a7f2-42ed27b126ce',
      quoteAm: 'ገለዓድንና ባሳንን',
    },
    excerpt: null,
  },

  // 3: am-first-chronicles-13-16 -> d (finish-the-verse)
  {
    passageId: 'am-first-chronicles-13-16',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'ጥቅሱን ያጠናቅቁ፦ “የእግዚአብሔርንም ታቦት ይዘው ገቡ፤ ዳዊትም በተከለላት ድንኳን ውስጥ አኖሩአት፤ ______ በእግዚአብሔር ፊት አቀረቡ።” (1 ዜና 16፡1)',
      en: 'Complete the verse: "So they brought the ark of God, and set it in the midst of the tent that David had pitched for it: and they offered ______ before God." (1 Chronicles 16:1)',
    },
    options: [
      { key: 'a', text: { am: 'የእህል ስጦታንና ዘይትን', en: 'grain offerings and oil' } },
      { key: 'b', text: { am: 'የወርቅ ጽዋዎችንና ዕጣንን', en: 'golden cups and incense' } },
      { key: 'c', text: { am: 'የመጀመሪያውን ፍሬና በኵራትን', en: 'the firstfruits and tithes' } },
      { key: 'd', text: { am: 'የሚቃጠለውን መሥዋዕትና የደኅንነቱን መሥዋዕትም', en: 'burnt sacrifices and peace offerings' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በ1 ዜና 16፡1 “ዳዊትም በተከለላት ድንኳን ውስጥ አኖሩአት፤ የሚቃጠለውን መሥዋዕትና የደኅንነቱን መሥዋዕትም በእግዚአብሔር ፊት አቀረቡ” ይላል።',
      en: '1 Chronicles 16:1 records: "and they offered burnt sacrifices and peace offerings before God."',
    },
    evidence: {
      verseId: 'd9995e26-2339-5070-a238-6e87323b026f',
      quoteAm: 'የሚቃጠለውን መሥዋዕትና የደኅንነቱን መሥዋዕትም',
    },
    excerpt: {
      am: 'የእግዚአብሔርንም ታቦት ይዘው ገቡ፤ ዳዊትም በተከለላት ድንኳን ውስጥ አኖሩአት፤',
      en: 'So they brought the ark of God, and set it in the midst of the tent that David had pitched for it: and they offered',
    },
  },

  // 4: am-enoch-16-30 -> a (trivia)
  {
    passageId: 'am-enoch-16-30',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ሄኖክ 30፡2 መሠረት ሄኖክ ‘ልጄ፥ ነገሬን ስማኝ እልሃለሁ’ በማለት የተናገረው ለማን ነበረ?',
      en: 'According to Enoch 30:2, to which of his sons did Enoch speak, saying: "My son, hear my words"?',
    },
    options: [
      { key: 'a', text: { am: 'ለልጁ ማቱሳላ', en: 'to his son Methuselah' } },
      { key: 'b', text: { am: 'ለልጁ ላሜክ', en: 'to his son Lamech' } },
      { key: 'c', text: { am: 'ለልጁ ኖኅ', en: 'to his son Noah' } },
      { key: 'd', text: { am: 'ለልጁ ያሬድ', en: 'to his son Jared' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ሄኖክ 30፡2 “ሄኖክም ለልጁ ማቱሳላ መለሰለት፥ እንዲህም አለ- ‘ልጄ፥ ነገሬን ስማኝ እልሃለሁ’” ይላል።',
      en: 'Enoch 30:2 records: "And Enoch answered his son Methuselah, saying: My son, hear my words."',
    },
    evidence: {
      verseId: '9ff7c4c7-29fb-5298-ac4a-30302c0f382d',
      quoteAm: 'ለልጁ ማቱሳላ',
    },
    excerpt: null,
  },

  // 5: am-first-meqabyan-24-16 -> b (finish-the-verse)
  {
    passageId: 'am-first-meqabyan-24-16',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'ጥቅሱን ያጠናቅቁ፦ “ከእነርሱም ______ አሉ።” (1 መቃብያን 16፡3)',
      en: 'Complete the verse: "And among them there were those whose works were good and ______." (1 Meqabyan 16:3)',
    },
    options: [
      { key: 'a', text: { am: 'በምድረ በዳ የሚኖሩ', en: 'dwelling in the wilderness' } },
      { key: 'b', text: { am: 'ሥራቸው ያማረና እግዚአብሔርን የሚያውቁት', en: 'whose works were fair and who knew God' } },
      { key: 'c', text: { am: 'በጦርነት የበረቱ', en: 'valiant in battle' } },
      { key: 'd', text: { am: 'በከተማ የተሰበሰቡ', en: 'gathered in the city' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በ1 መቃብያን 16፡3 “ከእነርሱም ሥራቸው ያማረና እግዚአብሔርን የሚያውቁት አሉ።” ይላል።',
      en: '1 Meqabyan 16:3 states: "And among them there were those whose works were fair and who knew God."',
    },
    evidence: {
      verseId: '57a852f3-892f-50b5-a03f-a3e5977cd484',
      quoteAm: 'ሥራቸው ያማረና እግዚአብሔርን የሚያውቁት',
    },
    excerpt: {
      am: 'ከእነርሱም',
      en: 'And among them there were those',
    },
  },

  // 6: am-acts-59-16 -> c (trivia)
  {
    passageId: 'am-acts-59-16',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በሐዋርያት ሥራ 16፡1 መሠረት ጳውሎስ በደርቤንና በልስጥራን ያገኘው የአማኝ አይሁዳዊት ልጅ የሆነው ደቀ መዝሙር ማን ነበረ?',
      en: 'According to Acts 16:1, what was the name of the disciple, the son of a believing Jewess, whom Paul met at Derbe and Lystra?',
    },
    options: [
      { key: 'a', text: { am: 'አጵሎስ የተባለ ደቀ መዝሙር', en: 'a disciple named Apollos' } },
      { key: 'b', text: { am: 'ሲላስ የተባለ ደቀ መዝሙር', en: 'a disciple named Silas' } },
      { key: 'c', text: { am: 'ጢሞቴዎስ የሚባል አንድ ደቀ መዝሙር', en: 'a disciple named Timothy' } },
      { key: 'd', text: { am: 'በርናባስ የተባለ ደቀ መዝሙር', en: 'a disciple named Barnabas' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በሐዋርያት ሥራ 16፡1 “በዚያ የአንዲት ያመነች አይሁዳዊት ልጅ ጢሞቴዎስ የሚባል አንድ ደቀ መዝሙር ነበር” ይላል።',
      en: 'Acts 16:1 records: "behold, a certain disciple was there, named Timotheus, the son of a certain woman, which was a Jewess, and believed."',
    },
    evidence: {
      verseId: '8ab86c68-7ac2-5f1c-a411-0309da1f01b6',
      quoteAm: 'ጢሞቴዎስ የሚባል አንድ ደቀ መዝሙር',
    },
    excerpt: null,
  },

  // 7: am-exodus-2-15 -> d (finish-the-verse)
  {
    passageId: 'am-exodus-2-15',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'ጥቅሱን ያጠናቅቁ፦ “እግዚአብሔር ጦርነትን ያጠፋል፤ ______” (ኦሪት ዘጸአት 15፡3)',
      en: 'Complete the verse: "The Lord is a man of war: ______." (Exodus 15:3)',
    },
    options: [
      { key: 'a', text: { am: 'ኃይሉ ዘላለማዊ ነው', en: 'His power is everlasting' } },
      { key: 'b', text: { am: 'መንግሥቱ ለዘላለም ትኖራለች', en: 'His kingdom endures forever' } },
      { key: 'c', text: { am: 'ክብሩ በምድር ላይ ከፍ ከፍ አለ', en: 'His glory is exalted upon earth' } },
      { key: 'd', text: { am: 'ስሙም እግዚአብሔር ነው፤', en: 'the Lord is His name' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በኦሪት ዘጸአት 15፡3 “እግዚአብሔር ጦርነትን ያጠፋል፤ ስሙም እግዚአብሔር ነው፤” ይላል።',
      en: 'Exodus 15:3 proclaims: "The Lord is a man of war: the Lord is his name."',
    },
    evidence: {
      verseId: 'ce826ccf-aa95-50ae-afd2-af2a36925866',
      quoteAm: 'ስሙም እግዚአብሔር ነው፤',
    },
    excerpt: {
      am: 'እግዚአብሔር ጦርነትን ያጠፋል፤',
      en: 'The Lord is a man of war:',
    },
  },

  // 8: am-numbers-4-22 -> a (trivia)
  {
    passageId: 'am-numbers-4-22',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘኍልቍ 22፡2 መሠረት እስራኤል በአሞሬዎናውያን ላይ ያደረገውን ሁሉ የተመለከተው የሴፎር ልጅ ማን ነበረ?',
      en: 'According to Numbers 22:2, who was the son of Zippor who saw all that Israel had done to the Amorites?',
    },
    options: [
      { key: 'a', text: { am: 'የሴፎር ልጅ ባላቅ', en: 'Balak the son of Zippor' } },
      { key: 'b', text: { am: 'የቢዖር ልጅ በለዓም', en: 'Balaam the son of Beor' } },
      { key: 'c', text: { am: 'የምድያም ንጉሥ ሱር', en: 'Zur king of Midian' } },
      { key: 'd', text: { am: 'የሞዓብ አለቃ ኤግሎን', en: 'Eglon ruler of Moab' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘኍልቍ 22፡2 “የሴፎር ልጅ ባላቅ እስራኤል በአሞሬዎናውያን ላይ ያደረገውን ሁሉ አየ” ይላል።',
      en: 'Numbers 22:2 states: "And Balak the son of Zippor saw all that Israel had done to the Amorites."',
    },
    evidence: {
      verseId: 'baad931d-3b32-59e1-a959-97415b2efacf',
      quoteAm: 'የሴፎር ልጅ ባላቅ',
    },
    excerpt: null,
  },

  // 9: am-deuteronomy-5-13 -> b (finish-the-verse)
  {
    passageId: 'am-deuteronomy-5-13',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'ጥቅሱን ያጠናቅቁ፦ “አምላካችሁን እግዚአብሔርን ተከተሉ፤ ______፤ ትእዛዙንም ጠብቁ፤ ቃሉንም ስሙ፥ እርሱንም ተማጠኑት።” (ዘዳግም 13፡4)',
      en: 'Complete the verse: "Ye shall walk after the Lord your God, and ______ his commandments, and obey his voice, and ye shall serve him, and cleave unto him." (Deuteronomy 13:4)',
    },
    options: [
      { key: 'a', text: { am: 'ምድርንም ውረሱ', en: 'and inherit the land' } },
      { key: 'b', text: { am: 'እርሱንም ፍሩ', en: 'fear him, and keep' } },
      { key: 'c', text: { am: 'መሥዋዕትን አቅርቡ', en: 'and bring offerings' } },
      { key: 'd', text: { am: 'በሰላም ኑሩ', en: 'and dwell in safety' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘዳግም 13፡4 “አምላካችሁን እግዚአብሔርን ተከተሉ፤ እርሱንም ፍሩ፤ ትእዛዙንም ጠብቁ” ይላል።',
      en: 'Deuteronomy 13:4 commands: "Ye shall walk after the Lord your God, and fear him, and keep his commandments."',
    },
    evidence: {
      verseId: 'a6f35e70-69be-57c7-a69b-ba42ddb561ee',
      quoteAm: 'እርሱንም ፍሩ',
    },
    excerpt: {
      am: 'አምላካችሁን እግዚአብሔርን ተከተሉ፤',
      en: 'Ye shall walk after the Lord your God, and',
    },
  },

  // 10: am-judges-7-13 -> c (trivia)
  {
    passageId: 'am-judges-7-13',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በመጽሐፈ መሳፍንት 13፡2 መሠረት ከዳን ወገን የሆነ ሚስቱ መካን የነበረች የሶራሕ ሰው ስሙ ማን ነበረ?',
      en: 'According to Judges 13:2, what was the name of the man of Zorah from the family of the Danites whose wife was barren?',
    },
    options: [
      { key: 'a', text: { am: 'ኤልቃና የሚባል ሰው', en: 'a man named Elkanah' } },
      { key: 'b', text: { am: 'ቦዔዝ የሚባል ሰው', en: 'a man named Boaz' } },
      { key: 'c', text: { am: 'ማኑሄ የሚባል አንድ የሶራሕ ሰው', en: 'a certain man of Zorah, named Manoah' } },
      { key: 'd', text: { am: 'ጌዴዎን የሚባል ሰው', en: 'a man named Gideon' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ መሳፍንት 13፡2 “ከዳን ወገን የሆነ ማኑሄ የሚባል አንድ የሶራሕ ሰው ነበረ፤ ሚስቱም መካን ነበረች” ይላል።',
      en: 'Judges 13:2 states: "And there was a certain man of Zorah, of the family of the Danites, whose name was Manoah; and his wife was barren."',
    },
    evidence: {
      verseId: 'a1e4c83e-09ef-5a4a-a4f9-8206223a3522',
      quoteAm: 'ማኑሄ የሚባል አንድ የሶራሕ ሰው',
    },
    excerpt: null,
  },

  // 11: am-second-chronicles-14-12 -> d (finish-the-verse)
  {
    passageId: 'am-second-chronicles-14-12',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'ጥቅሱን ያጠናቅቁ፦ “እግዚአብሔር እንዲህ ይላል፦ እናንተ ተዋችሁኝ፤ ስለዚህ እኔ ደግሞ ______” (2 ዜና 12፡5)',
      en: 'Complete the verse: "Thus saith the Lord, Ye have forsaken me, and therefore have I also ______." (2 Chronicles 12:5)',
    },
    options: [
      { key: 'a', text: { am: 'ከተማይቱን አፈረሳለሁ', en: 'will destroy the city' } },
      { key: 'b', text: { am: 'ምድሪቱን አሳልፌ እሰጣለሁ', en: 'will deliver the land' } },
      { key: 'c', text: { am: 'በረከቴን አርቃለሁ', en: 'will remove my blessing' } },
      { key: 'd', text: { am: 'በግብፅ ንጉሥ በሱስቀም እጅ ተውኋችሁ።', en: 'left you in the hand of Shishak' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በ2 ዜና 12፡5 “እናንተ ተዋችሁኝ፤ ስለዚህ እኔ ደግሞ በግብፅ ንጉሥ በሱስቀም እጅ ተውኋችሁ” ይላል።',
      en: '2 Chronicles 12:5 records: "Ye have forsaken me, and therefore have I also left you in the hand of Shishak."',
    },
    evidence: {
      verseId: '71813beb-9ad2-5f70-a173-8a5fd25e8ca8',
      quoteAm: 'በግብፅ ንጉሥ በሱስቀም እጅ ተውኋችሁ።',
    },
    excerpt: {
      am: 'መጥቶ እንዲህ አላቸው፥ “እግዚአብሔር እንዲህ ይላል፦ እናንተ ተዋችሁኝ፤ ስለዚህ እኔ ደግሞ',
      en: 'Thus saith the Lord, Ye have forsaken me, and therefore have I also',
    },
  },

  // 12: am-jubilees-15-12 -> a (trivia)
  {
    passageId: 'am-jubilees-15-12',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ኩፋሌ 12፡4 መሠረት እግዚአብሔር አብራምን ወደ ውጭ አውጥቶ ወደ ሰማይ ተመልክቶ ምን አለው?',
      en: 'According to Jubilees 12:4, what did God say to Abram after bringing him outside and telling him to look toward heaven?',
    },
    options: [
      { key: 'a', text: { am: 'ከዋክብትን ቍጠር', en: 'count the stars' } },
      { key: 'b', text: { am: 'የባሕሩን አሸዋ ቍጠር', en: 'count the sand of the sea' } },
      { key: 'c', text: { am: 'የምድሩን አፈር ቍጠር', en: 'count the dust of the earth' } },
      { key: 'd', text: { am: 'የተራሮችን ብዛት ቍጠር', en: 'count the mountains' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ኩፋሌ 12፡4 “ወደ ውጭም አውጥቶ፥ ‘ወደ ሰማይ ተመልከት፤ መቍጠር ይቻልህ እንደ ሆነ ከዋክብትን ቍጠር’ አለው” ይላል።',
      en: 'Jubilees 12:4 states: "And He brought him forth abroad, and said: Look toward heaven, and tell the stars, if thou be able to number them."',
    },
    evidence: {
      verseId: 'e34fed2b-9405-5236-af7b-987c4fa600aa',
      quoteAm: 'ከዋክብትን ቍጠር',
    },
    excerpt: null,
  },

  // 13: am-tobit-21-10 -> b (finish-the-verse)
  {
    passageId: 'am-tobit-21-10',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'ጥቅሱን ያጠናቅቁ፦ “አባቱ ጦቢት ግን ______ ቀጠሮውም አልቆ ሳይመጡ በቀሩ ጊዜ፥” (ጦቢት 10፡1)',
      en: 'Complete the verse: "Now Tobit his father ______: and when the days of the journey were expired, and they came not," (Tobit 10:1)',
    },
    options: [
      { key: 'a', text: { am: 'መኝታውን አዘጋጀ፤', en: 'prepared his bed;' } },
      { key: 'b', text: { am: 'ቀኑን ይቈጥር ነበር።', en: 'counted every day:' } },
      { key: 'c', text: { am: 'ወደ ከተማ ወጣ፤', en: 'went out into the city;' } },
      { key: 'd', text: { am: 'በደስታ ተቀመጠ፤', en: 'sat down in joy;' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ ጦቢት 10፡1 “አባቱ ጦቢት ግን ቀኑን ይቈጥር ነበር። ቀጠሮውም አልቆ ሳይመጡ በቀሩ ጊዜ፥” ይላል።',
      en: 'Tobit 10:1 records: "Now Tobit his father counted every day: and when the days of the journey were expired, and they came not."',
    },
    evidence: {
      verseId: '83768dfe-ebed-5b2d-a4cc-8a2e2ee477c9',
      quoteAm: 'ቀኑን ይቈጥር ነበር።',
    },
    excerpt: {
      am: 'አባቱ ጦቢት ግን',
      en: 'Now Tobit his father',
    },
  },

  // 14: am-judith-22-9 -> c (trivia)
  {
    passageId: 'am-judith-22-9',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ዮዲት 9፡1 መሠረት ዮዲት በግንባሯ ተደፍታ በራሷ ላይ ትቢያ ነስንሳ ወደ እግዚአብሔር የጮኸችው በቤተ መቅደስ ምን በሚቀርብበት ጊዜ ነበረ?',
      en: 'According to Judith 9:1, at what time of service in the Jerusalem Temple did Judith prostrate herself and cry out unto the Lord?',
    },
    options: [
      { key: 'a', text: { am: 'የማለዳው መሥዋዕት በሚቀርብበት ጊዜ', en: 'at the time of the morning sacrifice' } },
      { key: 'b', text: { am: 'የእኩለ ቀን ጸሎት በሚደርስበት ጊዜ', en: 'at the noon hour of prayer' } },
      { key: 'c', text: { am: 'የሠርክ ዕጣን በሚቀርብበት ጊዜ', en: 'at the time when the evening incense was offered' } },
      { key: 'd', text: { am: 'የፋሲካ በግ በሚታረድበት ጊዜ', en: 'when the Passover lamb was slain' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ዮዲት 9፡1 “በኢየሩሳሌምም ባለው በእግዚአብሔር ቤተ መቅደስ የሠርክ ዕጣን በሚቀርብበት ጊዜ ዮዲት በታላቅ ቃል ወደ እግዚአብሔር ጮኸች” ይላል።',
      en: 'Judith 9:1 states: "about the time that the incense of that evening was offered in Jerusalem in the house of the Lord Judith cried with a loud voice."',
    },
    evidence: {
      verseId: 'c232d7f4-8f82-523b-a371-8fb857b56776',
      quoteAm: 'የሠርክ ዕጣን በሚቀርብበት ጊዜ',
    },
    excerpt: null,
  },

  // 15: am-job-27-9 -> d (finish-the-verse)
  {
    passageId: 'am-job-27-9',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'ጥቅሱን ያጠናቅቁ፦ “በልቡ ጠቢብ ነው፥ ______” (መጽሐፈ ኢዮብ 9፡4)',
      en: 'Complete the verse: "He is wise in heart, ______." (Job 9:4)',
    },
    options: [
      { key: 'a', text: { am: 'ሥራውም ሁሉ ቅዱስ ነው፤', en: 'and all His works are holy;' } },
      { key: 'b', text: { am: 'ቃሉም ለዘላለም ይኖራል፤', en: 'and His word abides forever;' } },
      { key: 'c', text: { am: 'ምሕረቱ ከሰማያት በላይ ናት፤', en: 'and His mercy is above the heavens;' } },
      { key: 'd', text: { am: 'ኀይለኛም፥ ታላቅም ነው፤', en: 'and mighty in strength:' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመጽሐፈ ኢዮብ 9፡4 “በልቡ ጠቢብ ነው፥ ኀይለኛም፥ ታላቅም ነው፤” ይላል።',
      en: 'Job 9:4 proclaims: "He is wise in heart, and mighty in strength: who hath hardened himself against him, and hath prospered?"',
    },
    evidence: {
      verseId: 'b7c354c4-5af3-5eb6-affc-f831dc24678b',
      quoteAm: 'ኀይለኛም፥ ታላቅም ነው፤',
    },
    excerpt: {
      am: 'በልቡ ጠቢብ ነው፥',
      en: 'He is wise in heart,',
    },
  },

  // 16: am-psalms-28-6 -> a (trivia)
  {
    passageId: 'am-psalms-28-6',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በመዝሙረ ዳዊት 6፡1 መሠረት ዳዊት ‘አቤቱ በቍጣኽ አትቅሠፈኝ’ ካለ በኋላ ምን በማለት ለመነ?',
      en: 'According to Psalm 6:1, what did David pray following: "O Lord, rebuke me not in thine anger"?',
    },
    options: [
      { key: 'a', text: { am: 'በመዓትኽም አትገሥጸኝ', en: 'neither chasten me in thy hot displeasure' } },
      { key: 'b', text: { am: 'ከጠላቶቼም አድነኝ', en: 'and deliver me from mine enemies' } },
      { key: 'c', text: { am: 'ልቤንም አጽናልኝ', en: 'and strengthen my heart' } },
      { key: 'd', text: { am: 'ብርሃንህንም ላክልኝ', en: 'and send forth thy light' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመዝሙረ ዳዊት 6፡1 “አቤቱ በቍጣኽ አትቅሠፈኝ በመዓትኽም አትገሥጸኝ” ይላል።',
      en: 'Psalm 6:1 records: "O Lord, rebuke me not in thine anger, neither chasten me in thy hot displeasure."',
    },
    evidence: {
      verseId: '30a19380-5f75-5dce-a00e-252ed4acaad2',
      quoteAm: 'በመዓትኽም አትገሥጸኝ',
    },
    excerpt: null,
  },

  // 17: am-wisdom-31-4 -> b (finish-the-verse)
  {
    passageId: 'am-wisdom-31-4',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'ጥቅሱን ያጠናቅቁ፦ “ከበጎነት ጋር አለመውለድ ፍጹም ሥራ ነው፤ ______ ስም አጠራሯ ሕይወት ነውና።” (ጥበብ 4፡1)',
      en: 'Complete the verse: "Better it is to have no children, and to have virtue: for the memorial thereof is immortal: because ______." (Wisdom 4:1)',
    },
    options: [
      { key: 'a', text: { am: 'በምድር ላይ ፍሬ ስላላት', en: 'because it yields fruit on earth' } },
      { key: 'b', text: { am: 'በእግአብሔር ዘንድ፥ በሰውም ዘንድ የታወቀች ስለ ሆነች', en: 'it is known with God, and with men' } },
      { key: 'c', text: { am: 'የጽድቅን መንገድ ስለምታሳይ', en: 'because it guides in righteous paths' } },
      { key: 'd', text: { am: 'ሰላምን ለሁሉ ስለምትሰጥ', en: 'because it gives peace to all' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ ጥበብ 4፡1 “በእግአብሔር ዘንድ፥ በሰውም ዘንድ የታወቀች ስለ ሆነች ስም አጠራሯ ሕይወት ነውና” ይላል።',
      en: 'Wisdom 4:1 states: "because it is known with God, and with men."',
    },
    evidence: {
      verseId: 'd427c22c-87f9-5b1c-a625-c93ebcaa2ef5',
      quoteAm: 'በእግአብሔር ዘንድ፥ በሰውም ዘንድ የታወቀች ስለ ሆነች',
    },
    excerpt: {
      am: 'ከበጎነት ጋር አለመውለድ ፍጹም ሥራ ነው፤',
      en: 'Better it is to have no children, and to have virtue: for',
    },
  },

  // 18: am-ecclesiastes-32-3 -> c (trivia)
  {
    passageId: 'am-ecclesiastes-32-3',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በመጽሐፈ መክብብ 3፡1 መሠረት ጠቢቡ ሰሎሞን ‘ለሁሉ ዘመን አለው’ ካለ በኋላ ከፀሐይ በታች ለሆነ ነገር ምን እንዳለው አስተማረ?',
      en: 'According to Ecclesiastes 3:1, what did the wise King teach concerning everything under heaven after saying: "To every thing there is a season"?',
    },
    options: [
      { key: 'a', text: { am: 'የማያልፍ ጥበብ አለው', en: 'it has enduring wisdom' } },
      { key: 'b', text: { am: 'የማይጠፋ ክብር አለው', en: 'it has unfading glory' } },
      { key: 'c', text: { am: 'ለሆነ ነገር ሁሉ ጊዜ አለው', en: 'a time to every purpose under the heaven' } },
      { key: 'd', text: { am: 'የተሰወረ ፍጻሜ አለው', en: 'it has a hidden end' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ መክብብ 3፡1 “ለሁሉ ዘመን አለው፥ ከፀሐይ በታችም ለሆነ ነገር ሁሉ ጊዜ አለው” ይላል።',
      en: 'Ecclesiastes 3:1 proclaims: "To every thing there is a season, and a time to every purpose under the heaven."',
    },
    evidence: {
      verseId: 'c7044701-0955-52c0-a09d-2b3064e59e82',
      quoteAm: 'ለሆነ ነገር ሁሉ ጊዜ አለው',
    },
    excerpt: null,
  },

  // 19: am-isaiah-35-2 -> d (finish-the-verse)
  {
    passageId: 'am-isaiah-35-2',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'ጥቅሱን ያጠናቅቁ፦ “ሕግ ከጽዮን፥ ______ ብዙዎች አሕዛብ መጥተው፥ ኑ፤ ወደ እግዚአብሔር ተራራ፥ ወደ ያዕቆብ አምላክ ቤት እንውጣ ... ይላሉ።” (ኢሳይያስ 2፡3)',
      en: 'Complete the verse: "for out of Zion shall go forth the law, ______ And many people shall go and say, Come ye, and let us go up to the mountain of the Lord..." (Isaiah 2:3)',
    },
    options: [
      { key: 'a', text: { am: 'በረከትም ከኢየሩሳሌም ይዘንባልና', en: 'and blessing shall pour from Jerusalem' } },
      { key: 'b', text: { am: 'ሰላምም በምድር ሁሉ ይሆናልና', en: 'and peace shall be upon all the earth' } },
      { key: 'c', text: { am: 'ብርሃንም ከአሕዛብ ይወጣልና', en: 'and light shall shine upon the nations' } },
      { key: 'd', text: { am: 'የእግዚአብሔርም ቃል ከኢየሩሳሌም ይወጣልና', en: 'and the word of the Lord from Jerusalem' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በትንቢተ ኢሳይያስ 2፡3 “ሕግ ከጽዮን፥ የእግዚአብሔርም ቃል ከኢየሩሳሌም ይወጣልና ብዙዎች አሕዛብ መጥተው ... ይላሉ” ይላል።',
      en: 'Isaiah 2:3 states: "for out of Zion shall go forth the law, and the word of the Lord from Jerusalem."',
    },
    evidence: {
      verseId: 'b096a7e3-8d37-542b-a0a2-200a7992d9fa',
      quoteAm: 'የእግዚአብሔርም ቃል ከኢየሩሳሌም ይወጣልና',
    },
    excerpt: {
      am: 'ሕግ ከጽዮን፥',
      en: 'for out of Zion shall go forth the law,',
    },
  },
]

async function main() {
  console.log('=== VALIDATING BATCH 016 ===')
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

  if (preview.errors.length > 0) {
    console.error('CMS Preview Errors:', preview.errors)
    process.exit(1)
  }

  console.log('Updating campaign tracking manifest and content library...')
  await runCampaign()
  console.log('Batch 016 successfully generated, validated, and ingested into the library!')
}

main().catch((err) => {
  console.error('Failed to validate batch 016:', err)
  process.exit(1)
})
