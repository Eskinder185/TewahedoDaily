/**
 * Offline generator for Faith Challenges Batch 014
 * 20 source-grounded bilingual questions from verified Amharic Bible passages.
 */
import { readFileSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'
import { validateAmharicQuestionResponse } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { adaptEditorialBatchToCms } from './adapt-drafts-for-cms'
import { previewQuestionImport } from '../../src/lib/play/questionLibrary'
import { runCampaign } from './campaign-orchestrator'

const BATCH_DIR = 'artifacts/faith-challenges/batch-014'
const sourceBatch = JSON.parse(readFileSync(join(BATCH_DIR, 'source-batch.json'), 'utf8'))
const sourceManifest = JSON.parse(readFileSync(join(BATCH_DIR, 'source-manifest.json'), 'utf8'))
const existingPrompts = JSON.parse(readFileSync(join(BATCH_DIR, 'existing-prompts.json'), 'utf8'))
const modelId = 'copilot-agent-mode'

const questions = [
  // 0: am-genesis-1-16 -> a (trivia)
  {
    passageId: 'am-genesis-1-16',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘፍጥረት 16፡1 መሠረት የሦራ ግብፃዊት አገልጋይ ስሟ ማን ነበረ?',
      en: 'According to Genesis 16:1, what was the name of Sarai’s Egyptian handmaid?',
    },
    options: [
      { key: 'a', text: { am: 'ስምዋ አጋር የተባለ', en: 'whose name was Hagar' } },
      { key: 'b', text: { am: 'ኬጡራ የተባለች', en: 'named Keturah' } },
      { key: 'c', text: { am: 'ዲና የተባለች', en: 'named Dinah' } },
      { key: 'd', text: { am: 'ዘልፋ የተባለች', en: 'named Zilpah' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘፍጥረት 16፡1 “የአብራም ሚስት ሦራ ግን ልጅ አልወለደችለትም ነበር፤ ስምዋ አጋር የተባለ ግብፃዊት አገልጋይም ነበረቻት” ይላል።',
      en: 'Genesis 16:1 states: "Now Sarai Abram’s wife bare him no children: and she had an handmaid, an Egyptian, whose name was Hagar."',
    },
    evidence: {
      verseId: 'a42aa7c4-c2f1-539c-a263-3aba29e3994b',
      quoteAm: 'ስምዋ አጋር የተባለ',
    },
    excerpt: null,
  },

  // 1: am-leviticus-3-18 -> b (finish-the-verse)
  {
    passageId: 'am-leviticus-3-18',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘሌዋውያን 18፡4 ያለውን ኃይለ ቃል ያሟሉ፦ “ፍርዴን አድርጉ፤ በእርስዋም ትሄዱ ዘንድ ሥርዐቴን ጠብቁ፤ ___”',
      en: 'Complete the verse in Leviticus 18:4: "Ye shall do my judgments, and keep mine ordinances, to walk therein: ___"',
    },
    options: [
      { key: 'a', text: { am: 'ምድሪቱ በረከቷን ትሰጣለች', en: 'the land shall yield her increase' } },
      { key: 'b', text: { am: 'እኔ እግዚአብሔር አምላካችሁ ነኝ', en: 'I am the LORD your God' } },
      { key: 'c', text: { am: 'ከጠላቶቻችሁም ትድናላችሁ', en: 'ye shall be saved from your enemies' } },
      { key: 'd', text: { am: 'በሕይወትም ትኖራላችሁ', en: 'ye shall live in safety' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘሌዋውያን 18፡4 “ፍርዴን አድርጉ፤ በእርስዋም ትሄዱ ዘንድ ሥርዐቴን ጠብቁ፤ እኔ እግዚአብሔር አምላካችሁ ነኝ” ይላል።',
      en: 'Leviticus 18:4 commands: "Ye shall do my judgments, and keep mine ordinances, to walk therein: I am the LORD your God."',
    },
    evidence: {
      verseId: '539d44c0-3e1e-57c8-a0a3-1fa01d1272bd',
      quoteAm: 'እኔ እግዚአብሔር አምላካችሁ ነኝ',
    },
    excerpt: {
      am: 'ፍርዴን አድርጉ፤ በእርስዋም ትሄዱ ዘንድ ሥርዐቴን ጠብቁ፤',
      en: 'Ye shall do my judgments, and keep mine ordinances, to walk therein:',
    },
  },

  // 2: am-joshua-6-15 -> c (trivia)
  {
    passageId: 'am-joshua-6-15',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ኢያሱ 15፡1 መሠረት የይሁዳ ነገድ ድንበር በዐዜብ በኩል እስከ የት ድረስ ነው?',
      en: 'According to Joshua 15:1, unto where did the border of the tribe of Judah extend toward the south?',
    },
    options: [
      { key: 'a', text: { am: 'እስከ ዮርዳኖስ ወንዝ', en: 'unto the river Jordan' } },
      { key: 'b', text: { am: 'እስከ አርኖን ሸለቆ', en: 'unto the valley of Arnon' } },
      { key: 'c', text: { am: 'እስከ ቃዴስ ድረስ ነው', en: 'unto Kadesh' } },
      { key: 'd', text: { am: 'እስከ ደብረ ሲና', en: 'unto Mount Sinai' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ኢያሱ 15፡1 “የይሁዳም ነገድ ድንበር በየወገናቸው ከኤዶምያስ ዳርቻ፥ ከጺን ምድረ በዳ ጀምሮ በዐዜብ በኩል እስከ ቃዴስ ድረስ ነው” ይላል።',
      en: 'Joshua 15:1 states: "This then was the lot of the tribe of the children of Judah ... even to the wilderness of Zin southward was the uttermost part of the south coast."',
    },
    evidence: {
      verseId: '435e16b8-6d09-5822-a1b4-d1ae29755eef',
      quoteAm: 'እስከ ቃዴስ ድረስ ነው',
    },
    excerpt: null,
  },

  // 3: am-first-chronicles-13-14 -> d (finish-the-verse)
  {
    passageId: 'am-first-chronicles-13-14',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ዜና መዋዕል ቀዳማዊ 14፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “የጢሮስም ንጉሥ ኪራም ቤት ይሠሩለት ዘንድ መልእክተኞችን፥ የዝግባ እንጨትንም፥ ___”',
      en: 'Complete the verse in 1 Chronicles 14:1: "Now Hiram king of Tyre sent messengers to David, and timber of cedars, with ___"',
    },
    options: [
      { key: 'a', text: { am: 'የወርቅ እቃዎችንና ሽቱዎችን ላከ', en: 'vessels of gold and spices' } },
      { key: 'b', text: { am: 'ሠራዊቱንና ፈረሶቹን አዘጋጀ', en: 'prepared his host and horses' } },
      { key: 'c', text: { am: 'የሰላም ቃል ኪዳን ሰጠው', en: 'made a covenant of peace' } },
      { key: 'd', text: { am: 'ጠራቢዎችንም፥ አናጢዎችንም ወደ ዳዊት ላከ', en: 'masons and carpenters, to build him an house' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በ1 ዜና መዋዕል 14፡1 “የጢሮስም ንጉሥ ኪራም ቤት ይሠሩለት ዘንድ መልእክተኞችን፥ የዝግባ እንጨትንም፥ ጠራቢዎችንም፥ አናጢዎችንም ወደ ዳዊት ላከ” ይላል።',
      en: '1 Chronicles 14:1 reads: "Now Hiram king of Tyre sent messengers to David, and timber of cedars, with masons and carpenters, to build him an house."',
    },
    evidence: {
      verseId: '6033e33e-c22f-5f0c-acb6-b0aa0fe8cab2',
      quoteAm: 'ጠራቢዎችንም፥ አናጢዎችንም ወደ ዳዊት ላከ',
    },
    excerpt: {
      am: 'የጢሮስም ንጉሥ ኪራም ቤት ይሠሩለት ዘንድ መልእክተኞችን፥ የዝግባ እንጨትንም፥',
      en: 'Now Hiram king of Tyre sent messengers to David, and timber of cedars, with',
    },
  },

  // 4: am-enoch-16-26 -> a (trivia)
  {
    passageId: 'am-enoch-16-26',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ሄኖክ 26፡1 መሠረት የፀሐይ ስሞች ማን ማን እንደሆኑ ተጽፏል?',
      en: 'According to Enoch 26:1, what are the names of the sun?',
    },
    options: [
      { key: 'a', text: { am: 'አንዱ ኦርያሬስ፥ ሁለተኛውም ቶማስስ ይባላል', en: 'one is called Oryares, and the second Tomas' } },
      { key: 'b', text: { am: 'አንዱ አሶንያ፥ ሁለተኛውም ዕብላ ይባላል', en: 'one is called Asonya, and the second Ebla' } },
      { key: 'c', text: { am: 'አንዱ ብናሴ፥ ሁለተኛውም ኤራዕ ይባላል', en: 'one is called Benase, and the second Era' } },
      { key: 'd', text: { am: 'አንዱ ዑርኤል፥ ሁለተኛውም ሩፋኤል ይባላል', en: 'one is called Uriel, and the second Raphael' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ሄኖክ 26፡1 “የፀሐይ ስሙ እንደዚህ ነው፤ አንዱ ኦርያሬስ፥ ሁለተኛውም ቶማስስ ይባላል” ይላል።',
      en: 'Enoch 26:1 states: "And this is the law and the course of the sun ... one is named Oryares, and the second Tomas."',
    },
    evidence: {
      verseId: '5ebcc2e2-0b03-5234-a120-5ca615d61254',
      quoteAm: 'አንዱ ኦርያሬስ፥ ሁለተኛውም ቶማስስ ይባላል',
    },
    excerpt: null,
  },

  // 5: am-first-meqabyan-24-14 -> b (finish-the-verse)
  {
    passageId: 'am-first-meqabyan-24-14',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 14፡2 ያለውን ኃይለ ቃል ያሟሉ፦ ““ሰውን ስለ ፈጠርሁት አዘንሁ” ብሏልና በደለኞችን ሁሉ አጠፋ። ___”',
      en: 'Complete the verse in 1 Meqabyan 14:2: "Because He said, It repenteth me that I have made man, He destroyed all the transgressors: ___"',
    },
    options: [
      { key: 'a', text: { am: 'ምድሪቱንም ሁሉ ለዘላለም ባዶ አደረጋት', en: 'and made the earth desolate forever' } },
      { key: 'b', text: { am: 'ከስምንት ሰዎችም በቀር አላስቀረም፤ ሁሉንም አጠፋ', en: 'and saved none save eight persons, and destroyed all' } },
      { key: 'c', text: { am: 'ከጻድቃኑ ወገን ሰባት ሰዎችን ብቻ አዳነ', en: 'and saved only seven of the righteous' } },
      { key: 'd', text: { am: 'ለኖኅ ልጆች አዲስ ከተማን መሠረተላቸው', en: 'and founded a new city for Noah’s sons' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 14፡2 “ከስምንት ሰዎችም በቀር አላስቀረም፤ ሁሉንም አጠፋ” ይላል።',
      en: '1 Meqabyan 14:2 states that except eight persons, all were destroyed in the flood.',
    },
    evidence: {
      verseId: '9a6bdc79-e9e7-5815-a1e8-09eb7cd71f54',
      quoteAm: 'ከስምንት ሰዎችም በቀር አላስቀረም፤ ሁሉንም አጠፋ',
    },
    excerpt: {
      am: '“ሰውን ስለ ፈጠርሁት አዘንሁ” ብሏልና በደለኞችን ሁሉ አጠፋ።',
      en: 'Because He said, It repenteth me that I have made man, He destroyed all the transgressors:',
    },
  },

  // 6: am-hosea-43-14 -> c (trivia)
  {
    passageId: 'am-hosea-43-14',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በትንቢተ ሆሴዕ 14፡2 መሠረት እስራኤል በምን ምክንያት ወደ አምላኩ ወደ እግዚአብሔር እንዲመለስ ተጠራ?',
      en: 'According to Hosea 14:2, why was Israel called to return unto the LORD his God?',
    },
    options: [
      { key: 'a', text: { am: 'ጠላቶችህ ከበውሃልና', en: 'for thine enemies encompass thee' } },
      { key: 'b', text: { am: 'ምድርህ ተቃጥላለችና', en: 'for thy land is burned' } },
      { key: 'c', text: { am: 'በኀጢአትህ ወድቀሃልና', en: 'for thou hast fallen by thine iniquity' } },
      { key: 'd', text: { am: 'ዘመንህ አልፏልና', en: 'for thy days are spent' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በትንቢተ ሆሴዕ 14፡2 “እስራኤል ሆይ! በኀጢአትህ ወድቀሃልና ወደ አምላክህ ወደ እግዚአብሔር ተመለስ” ይላል።',
      en: 'Hosea 14:2 states: "O Israel, return unto the LORD thy God; for thou hast fallen by thine iniquity."',
    },
    evidence: {
      verseId: 'faf90173-3e4c-509d-a4b8-8e9baed314a0',
      quoteAm: 'በኀጢአትህ ወድቀሃልና',
    },
    excerpt: null,
  },

  // 7: am-acts-59-14 -> d (finish-the-verse)
  {
    passageId: 'am-acts-59-14',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በየሐዋርያት ሥራ 14፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “ኢቆንዮን በምትባል ከተማም እንደ ሁልጊዜው ወደ አይሁድ ምኵራብ ገቡ፤ ___”',
      en: 'Complete the verse in Acts 14:1: "And it came to pass in Iconium, that they went both together into the synagogue of the Jews, and ___"',
    },
    options: [
      { key: 'a', text: { am: 'የከተማው አለቆችም በደስታ ተቀበሉአቸው', en: 'the rulers of the city received them gladly' } },
      { key: 'b', text: { am: 'ተአምራትንም ብቻ እያደረጉ ዝም አሉ', en: 'held their peace doing only miracles' } },
      { key: 'c', text: { am: 'ከአይሁድ በቀር ለማንም አልተናገሩም', en: 'spoke to none but Jews only' } },
      { key: 'd', text: { am: 'ከአይሁድና ከአረማውያንም ብዙ ሰዎች እስኪያምኑ ድረስ አስተማሩ', en: 'so spake, that a great multitude both of the Jews and also of the Greeks believed' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በየሐዋርያት ሥራ 14፡1 “ኢቆንዮን በምትባል ከተማም እንደ ሁልጊዜው ወደ አይሁድ ምኵራብ ገቡ፤ ከአይሁድና ከአረማውያንም ብዙ ሰዎች እስኪያምኑ ድረስ አስተማሩ” ይላል።',
      en: 'Acts 14:1 records: "they went both together into the synagogue of the Jews, and so spake, that a great multitude both of the Jews and also of the Greeks believed."',
    },
    evidence: {
      verseId: '2dd9301f-944c-51fe-ac7f-61d0fa78bb0d',
      quoteAm: 'ከአይሁድና ከአረማውያንም ብዙ ሰዎች እስኪያምኑ ድረስ አስተማሩ',
    },
    excerpt: {
      am: 'ኢቆንዮን በምትባል ከተማም እንደ ሁልጊዜው ወደ አይሁድ ምኵራብ ገቡ፤',
      en: 'they went both together into the synagogue of the Jews, and',
    },
  },

  // 8: am-exodus-2-12 -> a (trivia)
  {
    passageId: 'am-exodus-2-12',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘፀአት 12፡2 መሠረት እግዚአብሔር ስለዚያ ወር ለእስራኤል ምን እንዲሆናቸው አዘዘ?',
      en: 'According to Exodus 12:2, what did the LORD declare that month should be to Israel?',
    },
    options: [
      { key: 'a', text: { am: 'የዓመቱም መጀመሪያ ወር ይሁናችሁ', en: 'it shall be the first month of the year to you' } },
      { key: 'b', text: { am: 'የሰባተኛው ወር በዓል ይሁንላችሁ', en: 'a feast of the seventh month' } },
      { key: 'c', text: { am: 'የበረከትና የዕረፍት ወር ይሁንላችሁ', en: 'a month of blessing and rest' } },
      { key: 'd', text: { am: 'የጾምና የሐዘን ወር ይሁንላችሁ', en: 'a month of fasting and mourning' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘፀአት 12፡2 “ይህ ወር የወሮች መጀመሪያ ይሁናችሁ፤ የዓመቱም መጀመሪያ ወር ይሁናችሁ” ይላል።',
      en: 'Exodus 12:2 states: "This month shall be unto you the beginning of months: it shall be the first month of the year to you."',
    },
    evidence: {
      verseId: 'db733ca1-b290-51f7-a7fa-894919c88d5e',
      quoteAm: 'የዓመቱም መጀመሪያ ወር ይሁናችሁ',
    },
    excerpt: null,
  },

  // 9: am-numbers-4-20 -> b (finish-the-verse)
  {
    passageId: 'am-numbers-4-20',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘኍልቍ 20፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “የእስራኤልም ልጆች ማኅበር ሁሉ በመጀመሪያው ወር ወደ ጺን ምድረ በዳ መጡ፤ ሕዝቡም በቃዴስ ተቀመጡ፤ ___”',
      en: 'Complete the verse in Numbers 20:1: "Then came the children of Israel, even the whole congregation, into the desert of Zin in the first month: and the people abode in Kadesh; and ___"',
    },
    options: [
      { key: 'a', text: { am: 'ሙሴም መሠዊያን በዚያ ሠራ', en: 'Moses built an altar there' } },
      { key: 'b', text: { am: 'ማርያምም በዚያ ሞተች፤ ተቀበረችም', en: 'Miriam died there, and was buried there' } },
      { key: 'c', text: { am: 'አሮንም ወደ ተራራው ወጣ', en: 'Aaron went up into the mount' } },
      { key: 'd', text: { am: 'የሰማይ መናም በዚያ ዘነበላቸው', en: 'manna rained upon them there' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘኍልቍ 20፡1 “የእስራኤልም ልጆች ማኅበር ሁሉ በመጀመሪያው ወር ወደ ጺን ምድረ በዳ መጡ፤ ሕዝቡም በቃዴስ ተቀመጡ፤ ማርያምም በዚያ ሞተች፤ ተቀበረችም” ይላል።',
      en: 'Numbers 20:1 records: "and the people abode in Kadesh; and Miriam died there, and was buried there."',
    },
    evidence: {
      verseId: '42aaeff8-72e2-543b-afff-27b3224db409',
      quoteAm: 'ማርያምም በዚያ ሞተች፤ ተቀበረችም',
    },
    excerpt: {
      am: 'የእስራኤልም ልጆች ማኅበር ሁሉ በመጀመሪያው ወር ወደ ጺን ምድረ በዳ መጡ፤ ሕዝቡም በቃዴስ ተቀመጡ፤',
      en: 'Then came the children of Israel into the desert of Zin in the first month: and the people abode in Kadesh; and',
    },
  },

  // 10: am-deuteronomy-5-11 -> c (trivia)
  {
    passageId: 'am-deuteronomy-5-11',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘዳግም 11፡1 መሠረት ሰው አምላኩን እግዚአብሔርን በመውደድ በዘመኑ ሁሉ ምን ማድረግ እንዳለበት ተጽፏል?',
      en: 'According to Deuteronomy 11:1, what should one keep always loving the LORD God?',
    },
    options: [
      { key: 'a', text: { am: 'የዓመቱን መሥዋዕት ብቻ አቅርብ', en: 'offer only the yearly sacrifice' } },
      { key: 'b', text: { am: 'ከከተማው ሽማግሌዎች ጋር ብቻ ተማከር', en: 'consult only with city elders' } },
      { key: 'c', text: { am: 'ሕጉንም፥ ሥርዐቱንም፥ ትእዛዙንም፥ ፍርዱንም በዘመንህ ሁሉ ጠብቅ', en: 'keep his charge, and his statutes, and his judgments, and his commandments, alway' } },
      { key: 'd', text: { am: 'የወርቅና የብር ዕቃዎችን አኑር', en: 'lay up gold and silver vessels' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በኦሪት ዘዳግም 11፡1 “አምላክህን እግዚአብሔርን ውደድ፤ ሕጉንም፥ ሥርዐቱንም፥ ትእዛዙንም፥ ፍርዱንም በዘመንህ ሁሉ ጠብቅ” ይላል።',
      en: 'Deuteronomy 11:1 instructs: "Therefore thou shalt love the LORD thy God, and keep his charge, and his statutes, and his judgments, and his commandments, alway."',
    },
    evidence: {
      verseId: 'bf8c5e44-7b51-556c-a44d-6ef1a6a15cad',
      quoteAm: 'ሕጉንም፥ ሥርዐቱንም፥ ትእዛዙንም፥ ፍርዱንም በዘመንህ ሁሉ ጠብቅ',
    },
    excerpt: null,
  },

  // 11: am-judges-7-11 -> d (finish-the-verse)
  {
    passageId: 'am-judges-7-11',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ መሳፍንት 11፡3 ያለውን ኃይለ ቃል ያሟሉ፦ “ዮፍታሔም ከወንድሞቹ ፊት ሸሽቶ በጦብ ምድር ተቀመጠ፤ ___”',
      en: 'Complete the verse in Judges 11:3: "Then Jephthah fled from his brethren, and dwelt in the land of Tob: and ___"',
    },
    options: [
      { key: 'a', text: { am: 'የአሞን ልጆችም በዚያ ወጉት', en: 'the children of Ammon fought against him' } },
      { key: 'b', text: { am: 'የገለዓድ ሰዎችም ፈለጉት', en: 'the men of Gilead sought him' } },
      { key: 'c', text: { am: 'በዚያም ብቻውን አደረ', en: 'dwelt there alone' } },
      { key: 'd', text: { am: 'ድሆች ሰዎችም ተሰብስበው ዮፍታሔን ተከተሉት', en: 'there were gathered vain men to Jephthah, and went out with him' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመጽሐፈ መሳፍንት 11፡3 “ዮፍታሔም ከወንድሞቹ ፊት ሸሽቶ በጦብ ምድር ተቀመጠ፤ ድሆች ሰዎችም ተሰብስበው ዮፍታሔን ተከተሉት” ይላል።',
      en: 'Judges 11:3 records: "Then Jephthah fled from his brethren, and dwelt in the land of Tob: and there were gathered vain men to Jephthah, and went out with him."',
    },
    evidence: {
      verseId: 'd70be484-1fb5-536d-ab68-7ddad23f766b',
      quoteAm: 'ድሆች ሰዎችም ተሰብስበው ዮፍታሔን ተከተሉት',
    },
    excerpt: {
      am: 'ዮፍታሔም ከወንድሞቹ ፊት ሸሽቶ በጦብ ምድር ተቀመጠ፤',
      en: 'Then Jephthah fled from his brethren, and dwelt in the land of Tob: and',
    },
  },

  // 12: am-second-chronicles-14-10 -> a (trivia)
  {
    passageId: 'am-second-chronicles-14-10',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በ2ኛ ዜና መዋዕል 10፡1 መሠረት እስራኤል ሁሉ ሮብዓምን ሊያነግሡት ወደ የት መጥተው ነበር?',
      en: 'According to 2 Chronicles 10:1, to which place did all Israel come to make Rehoboam king?',
    },
    options: [
      { key: 'a', text: { am: 'ወደ ሴኬም ሄደ', en: 'went to Shechem' } },
      { key: 'b', text: { am: 'ወደ ኬብሮን ሄደ', en: 'went to Hebron' } },
      { key: 'c', text: { am: 'ወደ ሰማርያ ሄደ', en: 'went to Samaria' } },
      { key: 'd', text: { am: 'ወደ ኢያሪኮ ሄደ', en: 'went to Jericho' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በ2 ዜና መዋዕል 10፡1 “እስራኤልም ሁሉ ያነግሡት ዘንድ ወደ ሴኬም መጥተው ነበርና ሮብዓም ወደ ሴኬም ሄደ” ይላል።',
      en: '2 Chronicles 10:1 records: "And Rehoboam went to Shechem: for to Shechem were all Israel come to make him king."',
    },
    evidence: {
      verseId: '3900f85e-62b7-58f2-ae31-b839ec5c4743',
      quoteAm: 'ወደ ሴኬም ሄደ',
    },
    excerpt: null,
  },

  // 13: am-jubilees-15-10 -> b (finish-the-verse)
  {
    passageId: 'am-jubilees-15-10',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ኩፋሌ 10፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “በዚህ ኢዮቤልዩ በሦስተኛው ሱባዔ ርኩሳን አጋንንት ___”',
      en: 'Complete the verse in Jubilees 10:1: "And in the third week of this jubilee the unclean demons began to ___"',
    },
    options: [
      { key: 'a', text: { am: 'ወደ ጥልቁ ባሕር ተጣሉ', en: 'be cast into the deep' } },
      { key: 'b', text: { am: 'የኖኅን የልጅ ልጆች ያስቱአቸውና አእምሮአቸውን እያሳጡ ያጠፉአቸው ጀመሩ', en: 'lead astray the children of the sons of Noah, and to make them to err and destroy them' } },
      { key: 'c', text: { am: 'ከሰው ልጆች ፊት ፈጽመው ሸሹ', en: 'flee utterly from the face of men' } },
      { key: 'd', text: { am: 'በምድረ በዳ ብቻ ተቀመጡ', en: 'dwell only in the wilderness' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ ኩፋሌ 10፡1 “ርኩሳን አጋንንት የኖኅን የልጅ ልጆች ያስቱአቸውና አእምሮአቸውን እያሳጡ ያጠፉአቸው ጀመሩ” ይላል።',
      en: 'Jubilees 10:1 tells of the unclean demons leading astray the grandchildren of Noah.',
    },
    evidence: {
      verseId: 'd2a4ece2-ec48-5854-a082-7a6c79c7ff6f',
      quoteAm: 'የኖኅን የልጅ ልጆች ያስቱአቸውና አእምሮአቸውን እያሳጡ ያጠፉአቸው ጀመሩ',
    },
    excerpt: {
      am: 'በዚህ ኢዮቤልዩ በሦስተኛው ሱባዔ ርኩሳን አጋንንት',
      en: 'And in the third week of this jubilee the unclean demons began to',
    },
  },

  // 14: am-tobit-21-8 -> c (trivia)
  {
    passageId: 'am-tobit-21-8',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ጦቢት 8፡2 መሠረት ጦብያ ወደ እርሷ በገባ ጊዜ የማንን ነገር አሰበ?',
      en: 'According to Tobit 8:2, whose advice did Tobias remember when he went in unto her?',
    },
    options: [
      { key: 'a', text: { am: 'የአባቱን ጦቢትን ምክር ብቻ', en: 'only the counsel of his father Tobit' } },
      { key: 'b', text: { am: 'የእናቱን ሐናን ቃል', en: 'the words of his mother Anna' } },
      { key: 'c', text: { am: 'የሩፋኤልን ነገር አሰበ', en: 'remembered the words of Raphael' } },
      { key: 'd', text: { am: 'የራጉኤልን ንግግር', en: 'the words of Raguel' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ጦቢት 8፡2 “ወደ እርሷም በገባ ጊዜ የሩፋኤልን ነገር አሰበ፤ የዕጣን ዕራሪ ወሰደ፤ ከዚያም ዓሣ ከልቡና ከጉበቱ ጨምሮ አጤሰው” ይላል።',
      en: 'Tobit 8:2 states: "And as he went, he remembered the words of Raphael, and took the ashes of the perfumes, and put the heart and the liver of the fish thereupon, and made a smoke therewith."',
    },
    evidence: {
      verseId: '68abe192-566e-555c-a093-d0f99efb0942',
      quoteAm: 'የሩፋኤልን ነገር አሰበ',
    },
    excerpt: null,
  },

  // 15: am-judith-22-7 -> d (finish-the-verse)
  {
    passageId: 'am-judith-22-7',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ዮዲት 7፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “በማግሥቱም ሆሎፎርኒስ ወደ ቤጤልዋ ይጓዙ ዘንድ፥ ___”',
      en: 'Complete the verse in Judith 7:1: "The next day Holofernes commanded all his army, and all his people which were come to take his part, that they should remove their camp against Bethulia, to ___"',
    },
    options: [
      { key: 'a', text: { am: 'ወደ ኢየሩሳሌምም በሰላም እንዲገቡ አዘዘ', en: 'and enter Jerusalem in peace' } },
      { key: 'b', text: { am: 'ከከተማይቱ ሽማግሌዎች ጋር እንዲነጋገሩ ላከ', en: 'and speak with the elders' } },
      { key: 'c', text: { am: 'የምድሪቱን አዝመራ ብቻ እንዲሰበስቡ አዘዘ', en: 'and gather the harvest of the land' } },
      { key: 'd', text: { am: 'ቀድመውም የአንባዎቹን መግቢያ ይይዙና የእስራኤልን ልጆች ይዋጓቸው ዘንድ ከእርሱ ጋራ የተሰለፉ ጭፍሮቹንና ወገኖቹን ሁሉ አዘዛቸው', en: 'take beforehand the ascents of the hill country, and to make war against the children of Israel' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመጽሐፈ ዮዲት 7፡1 “በማግሥቱም ሆሎፎርኒስ ወደ ቤጤልዋ ይጓዙ ዘንድ፥ ቀድመውም የአንባዎቹን መግቢያ ይይዙና የእስራኤልን ልጆች ይዋጓቸው ዘንድ ከእርሱ ጋራ የተሰለፉ ጭፍሮቹንና ወገኖቹን ሁሉ አዘዛቸው” ይላል።',
      en: 'Judith 7:1 commands his troops to take the ascents of the hill country against Bethulia.',
    },
    evidence: {
      verseId: '9a7cddd8-e080-51f8-a85e-8509974d76ca',
      quoteAm: 'ቀድመውም የአንባዎቹን መግቢያ ይይዙና የእስራኤልን ልጆች ይዋጓቸው ዘንድ ከእርሱ ጋራ የተሰለፉ ጭፍሮቹንና ወገኖቹን ሁሉ አዘዛቸው',
    },
    excerpt: {
      am: 'በማግሥቱም ሆሎፎርኒስ ወደ ቤጤልዋ ይጓዙ ዘንድ፥',
      en: 'The next day Holofernes commanded all his army, that they should remove against Bethulia,',
    },
  },

  // 16: am-job-27-7 -> a (trivia)
  {
    passageId: 'am-job-27-7',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ኢዮብ 7፡1 መሠረት በምድር ላይ የሰው ሕይወት ምን እንደ ሆነ ተጠይቋል?',
      en: 'According to Job 7:1, what is man’s life upon earth likened unto?',
    },
    options: [
      { key: 'a', text: { am: 'ጥላ አይደለምን', en: 'Is there not an appointed time' } },
      { key: 'b', text: { am: 'ብርሃን አይደለምን', en: 'is it not light' } },
      { key: 'c', text: { am: 'አለት አይደለምን', en: 'is it not rock' } },
      { key: 'd', text: { am: 'ዘላለማዊ አይደለምን', en: 'is it not eternal' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ኢዮብ 7፡1 “ጥንቱን በምድር ላይ የሰው ሕይወት ጥላ አይደለምን?” ይላል።',
      en: 'Job 7:1 asks: "Is there not an appointed time to man upon earth? are not his days also like the days of an hireling?"',
    },
    evidence: {
      verseId: '3b69e49c-f302-552a-a949-9e24c3725fab',
      quoteAm: 'ጥላ አይደለምን',
    },
    excerpt: null,
  },

  // 17: am-psalms-28-4 -> b (finish-the-verse)
  {
    passageId: 'am-psalms-28-4',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በመዝሙረ ዳዊት 4፡5 ያለውን ኃይለ ቃል ያሟሉ፦ “የጽድቅን መሥዋዕት ሠዉ ___”',
      en: 'Complete the verse in Psalm 4:5: "Offer the sacrifices of righteousness, and ___"',
    },
    options: [
      { key: 'a', text: { am: 'በሰው ኃይል አትደገፉ', en: 'lean not on human strength' } },
      { key: 'b', text: { am: 'በእግዚአብሔርም ታመኑ', en: 'put your trust in the LORD' } },
      { key: 'c', text: { am: 'በአደባባዩም ዘምሩ', en: 'sing in his courts' } },
      { key: 'd', text: { am: 'ከክፋትም ራቁ', en: 'depart from evil' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመዝሙረ ዳዊት 4፡5 “የጽድቅን መሥዋዕት ሠዉ በእግዚአብሔርም ታመኑ” ተብሎ ተጽፏል።',
      en: 'Psalm 4:5 states: "Offer the sacrifices of righteousness, and put your trust in the LORD."',
    },
    evidence: {
      verseId: 'd29c75fa-6f1e-5d09-a016-2975f47f58b7',
      quoteAm: 'በእግዚአብሔርም ታመኑ',
    },
    excerpt: {
      am: 'የጽድቅን መሥዋዕት ሠዉ',
      en: 'Offer the sacrifices of righteousness, and',
    },
  },

  // 18: am-wisdom-31-2 -> c (trivia)
  {
    passageId: 'am-wisdom-31-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ጥበብ 2፡3 መሠረት ከሞተ በኋላ ሥጋችን ምን እንደሚሆን ተጽፏል?',
      en: 'According to Wisdom 2:3, what shall our body be turned into after death?',
    },
    options: [
      { key: 'a', text: { am: 'ወደ ሰማይ ይወጣል', en: 'ascend to heaven' } },
      { key: 'b', text: { am: 'በክብር ይኖራል', en: 'abide in glory' } },
      { key: 'c', text: { am: 'ሥጋችን ትቢያ ይሆናል', en: 'our body shall be turned into ashes' } },
      { key: 'd', text: { am: 'እንደ ድንጋይ ይጸናል', en: 'stand firm like stone' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ጥበብ 2፡3 “ከሞተ በኋላ ሥጋችን ትቢያ ይሆናል፤ መንፈሳችንም እንደ ጉም ተን ይበተናልና” ይላል።',
      en: 'Wisdom 2:3 states: "Which being extinguished, our body shall be turned into ashes, and our spirit shall vanish as the soft air."',
    },
    evidence: {
      verseId: 'd4d51640-ac5e-5b9f-a044-409d417a1ece',
      quoteAm: 'ሥጋችን ትቢያ ይሆናል',
    },
    excerpt: null,
  },

  // 19: am-ecclesiastes-32-1 -> d (finish-the-verse)
  {
    passageId: 'am-ecclesiastes-32-1',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በመጽሐፈ መክብብ 1፡4 ያለውን ኃይለ ቃል ያሟሉ፦ “ትውልድ ያልፋል፥ ትውልድም ይመጣል፤ ___”',
      en: 'Complete the verse in Ecclesiastes 1:4: "One generation passeth away, and another generation cometh: but ___"',
    },
    options: [
      { key: 'a', text: { am: 'የሰማይ ከዋክብትም ይረግፋሉ', en: 'the stars of heaven fall' } },
      { key: 'b', text: { am: 'የሰውም ሥራ ሁሉ ያልቃል', en: 'all work of man perisheth' } },
      { key: 'c', text: { am: 'ፀሐይም ለዘላለም ይቆማል', en: 'the sun standeth still forever' } },
      { key: 'd', text: { am: 'ምድር ግን ለዘለዓለም ጸንታ ትኖራለች', en: 'the earth abideth for ever' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመጽሐፈ መክብብ 1፡4 “ትውልድ ያልፋል፥ ትውልድም ይመጣል፤ ምድር ግን ለዘለዓለም ጸንታ ትኖራለች” ተብሎ ተጽፏል።',
      en: 'Ecclesiastes 1:4 declares: "One generation passeth away, and another generation cometh: but the earth abideth for ever."',
    },
    evidence: {
      verseId: '3a518cba-fc0b-5dbe-aa89-cfbbfd94515b',
      quoteAm: 'ምድር ግን ለዘለዓለም ጸንታ ትኖራለች',
    },
    excerpt: {
      am: 'ትውልድ ያልፋል፥ ትውልድም ይመጣል፤',
      en: 'One generation passeth away, and another generation cometh: but',
    },
  },
]

async function run() {
  console.log('=== VALIDATING BATCH 014 ===')
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
  console.log('Batch 014 successfully generated, validated, and ingested into the library!')
}

run().catch((err) => {
  console.error(err)
  process.exit(1)
})

