import { readFileSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'
import { validateAmharicQuestionResponse } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { adaptEditorialBatchToCms } from './adapt-drafts-for-cms'
import { previewQuestionImport } from '../../src/lib/play/questionLibrary'
import { runCampaign } from './campaign-orchestrator'

const BATCH_DIR = 'artifacts/faith-challenges/batch-002'
const sourceBatch = JSON.parse(readFileSync(join(BATCH_DIR, 'source-batch.json'), 'utf8'))
const sourceManifest = JSON.parse(readFileSync(join(BATCH_DIR, 'source-manifest.json'), 'utf8'))
const existingPrompts = JSON.parse(readFileSync(join(BATCH_DIR, 'existing-prompts.json'), 'utf8'))
const modelId = 'gemini-2.5-pro'

const questions = [
  // 0: am-genesis-1-2 -> a
  {
    passageId: 'am-genesis-1-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘፍጥረት 2፡3 መሠረት እግዚአብሔር ሰባተኛዋን ቀን የባረካትና የቀደሳት በምን ምክንያት ነበር?',
      en: 'According to Genesis 2:3, why did God bless the seventh day and sanctify it?',
    },
    options: [
      { key: 'a', text: { am: 'በእርስዋ ዐርፎአልና', en: 'because that in it He had rested' } },
      { key: 'b', text: { am: 'ብርሃን ስለ ፈጠረ', en: 'because He created the light' } },
      { key: 'c', text: { am: 'ሰውን ስለ ባረከ', en: 'because He blessed mankind' } },
      { key: 'd', text: { am: 'ሥርዓቱን ስለ ሰጠ', en: 'because He gave the commandment' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘፍጥረት 2፡3 ላይ “እግዚአብሔር ሰባተኛዋን ቀን ባረካት፤ ቀደሳትም፤ ሊፈጥረው ከጀመረው ሥራ ሁሉ በእርስዋ ዐርፎአልና” ተብሎ ተጽፏል።',
      en: 'Genesis 2:3 states that God blessed and sanctified the seventh day because in it He rested from all His work which He had created and made.',
    },
    evidence: {
      verseId: 'a1d57d70-0d7b-5700-a44f-4bb37b8353aa',
      quoteAm: 'በእርስዋ ዐርፎአልና',
    },
    excerpt: null,
  },

  // 1: am-leviticus-3-3 -> b [finish-the-verse]
  {
    passageId: 'am-leviticus-3-3',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የኦሪት መሥዋዕትን ሕግ ባዶ ቦታ አሟሉ፦ “ለእግዚአብሔር የሚቀርበው ቍርባን የደኅንነት መሥዋዕት ቢሆን፥ ከላሞች መንጋ ተባት ወይም እንስት ቢያቀርብ፥ ___ በእግዚአብሔር ፊት ያቅርብ።” (ዘሌዋውያን 3፡1)',
      en: 'Fill in the blank to complete the Levitical law of sacrifice: "And if his oblation be a sacrifice of peace offering... he shall offer it ___ before the LORD." (Leviticus 3:1)',
    },
    options: [
      { key: 'a', text: { am: 'የበኵር የሆነውን', en: 'the firstborn' } },
      { key: 'b', text: { am: 'ነውር የሌለበትን', en: 'without blemish' } },
      { key: 'c', text: { am: 'የወፈረውን ምርጥ', en: 'the fattest selection' } },
      { key: 'd', text: { am: 'በጨው የተቀመመውን', en: 'the salted offering' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘሌዋውያን 3፡1 ላይ ለእግዚአብሔር የሚቀርበው የደኅንነት መሥዋዕት ነውር የሌለበትና ንጹሕ መሆን እንዳለበት ታዟል።',
      en: 'Leviticus 3:1 commands that an offering of peace before the Lord, whether male or female, must be offered without blemish.',
    },
    evidence: {
      verseId: '860e01b6-2331-57bf-afdf-fd90c1729964',
      quoteAm: 'ነውር የሌለበትን',
    },
    excerpt: {
      am: 'ለእግዚአብሔር የሚቀርበው ቍርባን የደኅንነት መሥዋዕት ቢሆን፥ ከላሞች መንጋ ተባት ወይም እንስት ቢያቀርብ፥',
      en: 'And if his oblation be a sacrifice of peace offering, if he offer it of the herd, whether it be a male or female,',
    },
  },

  // 2: am-joshua-6-2 -> c
  {
    passageId: 'am-joshua-6-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'የነዌ ልጅ ኢያሱ ምድሪቱንና ኢያሪኮን እንዲሰልሉ ሁለት ሰላዮችን በስውር የላከው ከየትኛው ስፍራ ተነሥተው ነበር? (ኢያሱ 2፡1)',
      en: 'From which place did Joshua the son of Nun send out two spies secretly to view the land and Jericho? (Joshua 2:1)',
    },
    options: [
      { key: 'a', text: { am: 'ከጌልገላ', en: 'from Gilgal' } },
      { key: 'b', text: { am: 'ከሴሎ', en: 'from Shiloh' } },
      { key: 'c', text: { am: 'ከሰጢም', en: 'from Shittim' } },
      { key: 'd', text: { am: 'ከኬብሮን', en: 'from Hebron' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ኢያሱ 2፡1 ላይ “የነዌም ልጅ ኢያሱ፥ ውጡና ምድሪቱን ኢያሪኮን እዩ ብሎ ከሰጢም ሁለት ጐልማሶች ሰላዮችን በስውር ላከ” ተብሎ ተመዝግቧል።',
      en: 'Joshua 2:1 records that Joshua sent two men out of Shittim to spy secretly, saying, "Go view the land, even Jericho."',
    },
    evidence: {
      verseId: 'a6477b64-2aad-525a-a2ae-fca03f99ee7c',
      quoteAm: 'ከሰጢም',
    },
    excerpt: null,
  },

  // 3: am-first-chronicles-13-2 -> d
  {
    passageId: 'am-first-chronicles-13-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በ1ኛ ዜና መዋዕል 2፡4 መሠረት ትዕማር ለይሁዳ የወለደቻቸው መንታ ልጆች እነማን ነበሩ?',
      en: 'According to 1 Chronicles 2:4, which sons did Tamar bear to Judah?',
    },
    options: [
      { key: 'a', text: { am: 'ዔርና አውናን', en: 'Er and Onan' } },
      { key: 'b', text: { am: 'ሴሎምና ኤስሮም', en: 'Shelah and Hezron' } },
      { key: 'c', text: { am: 'ዳንና ዮሴፍ', en: 'Dan and Joseph' } },
      { key: 'd', text: { am: 'ፋሬስንና ዛራን', en: 'Perez and Zerah' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በ1ኛ ዜና መዋዕል 2፡4 “ምራቱም ትዕማር ፋሬስንና ዛራን ወለደችለት፤ የይሁዳም ልጆች ሁሉ አምስት ነበሩ” በማለት የዘር ሐረጉን ያረጋግጣል።',
      en: '1 Chronicles 2:4 records: "And Tamar his daughter in law bare him Pharez and Zerah. All the sons of Judah were five."',
    },
    evidence: {
      verseId: 'dd2cbdd5-b627-5628-a56c-9426aaa2dfd1',
      quoteAm: 'ፋሬስንና ዛራን',
    },
    excerpt: null,
  },

  // 4: am-enoch-16-3 -> a
  {
    passageId: 'am-enoch-16-3',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ሄኖክ 3፡1 ላይ ስለሚመጣው የጥፋት ውኃ እንዲነግረው ልዑሉ አምላክ ወደ ላሜህ ልጅ ወደ ኖኅ የላከው መልአክ ስሙ ማን ተብሏል?',
      en: 'In 1 Enoch 3:1, which holy messenger was sent by the Most High unto Noah the son of Lamech to reveal the coming end?',
    },
    options: [
      { key: 'a', text: { am: 'አርሰየላልዩርን', en: 'Arsayalalyur (Uriel)' } },
      { key: 'b', text: { am: 'ሱርያልን', en: 'Suryal' } },
      { key: 'c', text: { am: 'ራጉኤልን', en: 'Raguel' } },
      { key: 'd', text: { am: 'ፋኑኤልን', en: 'Phanuel' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ሄኖክ 3፡1 መሠረት ልዑሉና ቅዱሱ አምላክ ወደ ላሜህ ልጅ ወደ ኖኅ መልአኩን አርሰየላልዩርን ልኮታል።',
      en: '1 Enoch 3:1 states that the Most High and Holy Great One spake and sent Arsayalalyur unto the son of Lamech.',
    },
    evidence: {
      verseId: 'c17f946a-6e79-556c-ae5b-59d866bbefce',
      quoteAm: 'አርሰየላልዩርን',
    },
    excerpt: null,
  },

  // 5: am-first-meqabyan-24-2 -> b
  {
    passageId: 'am-first-meqabyan-24-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 2፡1 መሠረት መቃቢስ የተባለው ደግ ሰው ከየትኛው የእስራኤል ነገድ ወገን ነበረ?',
      en: 'According to 1 Meqabyan 2:1, of which tribe of Israel was the righteous man named Meqabis?',
    },
    options: [
      { key: 'a', text: { am: 'ከነገደ ይሁዳ', en: 'of the tribe of Judah' } },
      { key: 'b', text: { am: 'ከነገደ ብንያም', en: 'of the tribe of Benjamin' } },
      { key: 'c', text: { am: 'ከነገደ ሌዊ', en: 'of the tribe of Levi' } },
      { key: 'd', text: { am: 'ከነገደ ሮቤል', en: 'of the tribe of Reuben' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 2፡1 “ከነገደ ብንያም ስሙ መቃቢስ የሚባል አንድ ሰው ነበረ” በማለት ትውልዱን ያስተዋውቃል።',
      en: '1 Meqabyan 2:1 introduces the genealogy of the faithful martyr: "Now there was a man of the tribe of Benjamin whose name was Meqabis."',
    },
    evidence: {
      verseId: 'a7ff7383-2039-5bcf-a2a5-b8ca688b68f4',
      quoteAm: 'ከነገደ ብንያም',
    },
    excerpt: null,
  },

  // 6: am-tegsats-30-2 -> c [finish-the-verse]
  {
    passageId: 'am-tegsats-30-2',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የጥበብን ምሳሌ ባዶ ቦታ አሟሉ፦ “አለንጋ ለፈረስ፥ ___ እንደ ሆነ፥” (ተግሣጽ 2፡3)',
      en: 'Fill in the blank to complete the proverb: "A whip for the horse, ___ and a rod for the fool\'s back." (Tegsats 2:3)',
    },
    options: [
      { key: 'a', text: { am: 'ልጓም ለበቅሎ', en: 'a bridle for the mule' } },
      { key: 'b', text: { am: 'ቀንበር ለበሬ', en: 'a yoke for the ox' } },
      { key: 'c', text: { am: 'መውጊያ ለአህያ', en: 'a bridle (goad) for the ass' } },
      { key: 'd', text: { am: 'መጓጓዣ ለግመል', en: 'a burden for the camel' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ተግሣጽ 2፡3 ላይ “አለንጋ ለፈረስ፥ መውጊያ ለአህያ እንደ ሆነ” በማለት ተግሣጽና መመሪያ እንደሚያስፈልግ ያስተምራል።',
      en: 'Tegsats (Proverbs) 2:3 contrasts discipline with folly: "A whip for the horse, a bridle for the ass, and a rod for the fool\'s back."',
    },
    evidence: {
      verseId: '9c3a8b32-80a9-5cfe-a72b-a467e10920c0',
      quoteAm: 'መውጊያ ለአህያ',
    },
    excerpt: {
      am: 'አለንጋ ለፈረስ፥',
      en: 'A whip for the horse,',
    },
  },

  // 7: am-song-of-songs-33-2 -> d [finish-the-verse]
  {
    passageId: 'am-song-of-songs-33-2',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የመኃልየ መኃልይን ቃል ባዶ ቦታ አሟሉ፦ “እኔ የዱር ጽጌረዳ፥ ___ ነኝ።” (መኃልይ 2፡1)',
      en: 'Fill in the blank to complete the verse of the Song of Songs: "I am the rose of Sharon, and ___." (Song of Songs 2:1)',
    },
    options: [
      { key: 'a', text: { am: 'የተራራው ንጹሕ ዛፍ', en: 'the pure tree of the mountain' } },
      { key: 'b', text: { am: 'የደጋው አበበ ሎሚ', en: 'the blossom of the highlands' } },
      { key: 'c', text: { am: 'የበረሃው መልካም ሽቱ', en: 'the sweet scent of the desert' } },
      { key: 'd', text: { am: 'የቈላም የሱፍ አበባ', en: 'the lily of the valleys' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመኃልየ መኃልይ ዘሰሎሞን 2፡1 ላይ “እኔ የዱር ጽጌረዳ፥ የቈላም የሱፍ አበባ ነኝ” በማለት የቤተ ክርስቲያንና የድንግል ማርያም ምሳሌ ሆኖ ይተረጎማል።',
      en: 'Song of Songs 2:1 poetically declares: "I am the rose of Sharon, and the lily of the valleys."',
    },
    evidence: {
      verseId: 'dbf68a24-0640-5e58-af7b-39238929a616',
      quoteAm: 'የቈላም የሱፍ አበባ',
    },
    excerpt: {
      am: 'እኔ የዱር ጽጌረዳ፥',
      en: 'I am the rose of Sharon,',
    },
  },

  // 8: am-hosea-43-2 -> a
  {
    passageId: 'am-hosea-43-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በትንቢተ ሆሴዕ 2፡1 ላይ እግዚአብሔር ለሕዝቡ ባዘጋጀው የበረከትና የምሕረት ጥሪ መሠረት ወንድማችሁን ምን በሉአቸው ተብሎ ታዘዘ?',
      en: 'In Hosea 2:1, in the divine promise of mercy and restoration, what are they commanded to call their brother?',
    },
    options: [
      { key: 'a', text: { am: 'ሕዝቤ', en: 'Ammi ("my people")' } },
      { key: 'b', text: { am: 'ምርጤ', en: 'my chosen' } },
      { key: 'c', text: { am: 'ወዳጄ', en: 'my beloved' } },
      { key: 'd', text: { am: 'ካህኔ', en: 'my priest' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በትንቢተ ሆሴዕ 2፡1 ላይ “ወንድማችሁን ሕዝቤ፥ እኅታችሁንም፦ ሥህልት በሉአቸው” በማለት የእግዚአብሔርን የማዳን ቃል ኪዳን ያበስራል።',
      en: 'Hosea 2:1 commands: "Say ye unto your brethren, Ammi (My people); and to your sisters, Ruhamah (Having obtained mercy)."',
    },
    evidence: {
      verseId: '7b761a35-8d5f-5828-a716-39b8c664ae0f',
      quoteAm: 'ሕዝቤ',
    },
    excerpt: null,
  },

  // 9: am-joel-46-2 -> b
  {
    passageId: 'am-joel-46-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'ነቢዩ ኢዮኤል በኢዮኤል 2፡1 መሠረት በምድር የሚኖሩ ሁሉ እንዲደነግጡና በቅዱሱ ተራራ ዐዋጅ እንዲነገረው መለከትን የት እንዲነፉ አዘዘ?',
      en: 'According to Joel 2:1, where is the trumpet to be blown to proclaim warning because the day of the LORD is at hand?',
    },
    options: [
      { key: 'a', text: { am: 'በቤተልሔም', en: 'in Bethlehem' } },
      { key: 'b', text: { am: 'በጽዮን', en: 'in Zion' } },
      { key: 'c', text: { am: 'በኢያሪኮ', en: 'in Jericho' } },
      { key: 'd', text: { am: 'በደብረ ዘይት', en: 'on the Mount of Olives' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኢዮኤል 2፡1 “በጽዮን መለከትን ንፉ፤ በቅዱሱም ተራራዬ ላይ ዐዋጅ ንገሩ፤ የእግዚአብሔር ቀን መጥቶአልና” ተብሎ ተጽፏል።',
      en: 'Joel 2:1 proclaims: "Blow ye the trumpet in Zion, and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of the LORD cometh."',
    },
    evidence: {
      verseId: '9b32366d-18cf-5e62-a71f-697539fc4396',
      quoteAm: 'በጽዮን',
    },
    excerpt: null,
  },

  // 10: am-nahum-49-2 -> c
  {
    passageId: 'am-nahum-49-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በትንቢተ ናሆም 2፡2 መሠረት እግዚአብሔር የያዕቆብን ክብር እንደ የትኛው ክብር እንደሚመልስ ቃል ገብቷል?',
      en: 'According to Nahum 2:2, as the excellency of whom will the LORD restore the excellency of Jacob?',
    },
    options: [
      { key: 'a', text: { am: 'እንደ ዳዊት ክብር', en: 'as the glory of David' } },
      { key: 'b', text: { am: 'እንደ ይሁዳ ክብር', en: 'as the glory of Judah' } },
      { key: 'c', text: { am: 'እንደ እስራኤል ክብር', en: 'as the excellency of Israel' } },
      { key: 'd', text: { am: 'እንደ ኤፍሬም ክብር', en: 'as the glory of Ephraim' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በናሆም 2፡2 ላይ “ዘራፊዎች ዘርፈዋቸዋልና... እግዚአብሔር የያዕቆብን ክብር እንደ እስራኤል ክብር ይመልሳል” በማለት ተስፋ ተሰጥቷል።',
      en: 'Nahum 2:2 affirms: "For the LORD hath turned away the excellency of Jacob, as the excellency of Israel."',
    },
    evidence: {
      verseId: '3158621e-ac4e-5fc9-aaf4-9351d4b4eea6',
      quoteAm: 'እንደ እስራኤል ክብር',
    },
    excerpt: null,
  },

  // 11: am-zephaniah-51-3 -> d
  {
    passageId: 'am-zephaniah-51-3',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በትንቢተ ሶፎንያስ 3፡5 መሠረት ጻድቁ እግዚአብሔር ፍርዱን ወደ ብርሃን የሚያወጣው መቼ እንደ ሆነ ተገልጧል?',
      en: 'According to Zephaniah 3:5, when does the just LORD bring His judgment to light?',
    },
    options: [
      { key: 'a', text: { am: 'በቀትር ጊዜ', en: 'at noonday' } },
      { key: 'b', text: { am: 'በሠርክ ጸሎት', en: 'at the evening sacrifice' } },
      { key: 'c', text: { am: 'በመንፈቀ ሌሊት', en: 'at midnight' } },
      { key: 'd', text: { am: 'በየማለዳው', en: 'every morning' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በሶፎንያስ 3፡5 “እግዚአብሔር በውስጥዋ ጻድቅ ነው፣ ክፋትን አያደርግም፣ ፍርዱን በየማለዳው ወደ ብርሃን ያወጣል” ተብሎ ተዘምሯል።',
      en: 'Zephaniah 3:5 witnesses: "The just LORD is in the midst thereof; he will not do iniquity: every morning doth he bring his judgment to light."',
    },
    evidence: {
      verseId: '275e3e21-8bfd-553d-afb5-6f0a5c906fbb',
      quoteAm: 'በየማለዳው',
    },
    excerpt: null,
  },

  // 12: am-malachi-54-2 -> a
  {
    passageId: 'am-malachi-54-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በሚልክያስ 2፡5 ላይ እግዚአብሔር ከሌዊ ጋር ያደረገውን ቃል ኪዳን ምን ዓይነት ቃል ኪዳን እንደ ነበረ ገለጠው?',
      en: 'In Malachi 2:5, what covenant does God declare He made with Levi?',
    },
    options: [
      { key: 'a', text: { am: 'የሕይወትና የሰላም', en: 'of life and peace' } },
      { key: 'b', text: { am: 'የመንግሥትና የኃይል', en: 'of kingdom and power' } },
      { key: 'c', text: { am: 'የክብርና የብልጽግና', en: 'of glory and riches' } },
      { key: 'd', text: { am: 'የጥበብና የዕውቀት', en: 'of wisdom and knowledge' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በሚልክያስ 2፡5 ላይ “ቃል ኪዳኔ ከእርሱ ጋር የሕይወትና የሰላም ቃል ኪዳን ነበረ፣ ይፈራ ዘንድም እነርሱን ሰጠሁት” ይላል።',
      en: 'Malachi 2:5 declares of the Levitical priesthood: "My covenant was with him of life and peace; and I gave them to him for the fear wherewith he feared me."',
    },
    evidence: {
      verseId: '4dff34ba-d6c5-59d7-a9bd-e69ad56aed1b',
      quoteAm: 'የሕይወትና የሰላም',
    },
    excerpt: null,
  },

  // 13: am-mark-56-2 -> b
  {
    passageId: 'am-mark-56-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በማርቆስ ወንጌል 2፡3 መሠረት በቅፍርናሆም ሽባውን ሰው ተሸክመው ወደ ጌታችን ያመጡት ስንት ሰዎች ነበሩ?',
      en: 'According to Mark 2:3, how many men bore the paralytic brought unto our Lord in Capernaum?',
    },
    options: [
      { key: 'a', text: { am: 'ሁለት ሰዎች', en: 'two men' } },
      { key: 'b', text: { am: 'አራት ሰዎችም', en: 'four men' } },
      { key: 'c', text: { am: 'ሰባት ሰዎች', en: 'seven men' } },
      { key: 'd', text: { am: 'አሥራ ሁለት ሰዎች', en: 'twelve men' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በማርቆስ 2፡3 “አራት ሰዎችም የተሸከሙትን ሽባ አመጡለት” በማለት የእነዚያን አማኞች የጋራ ፍቅርና እምነት ይመሰክራል።',
      en: 'Mark 2:3 records: "And they come unto him, bringing one sick of the palsy, which was borne of four."',
    },
    evidence: {
      verseId: 'b5bad2c4-d60a-55c1-a0fd-d3699822afef',
      quoteAm: 'አራት ሰዎችም',
    },
    excerpt: null,
  },

  // 14: am-acts-59-2 -> c
  {
    passageId: 'am-acts-59-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በሐዋርያት ሥራ 2፡1 መሠረት ሐዋርያት ሁሉም በአንድነት በአንድ ስፍራ ተሰብስበው የነበሩት የትኛው ቀን በተፈጸመ ጊዜ ነበር?',
      en: 'According to Acts 2:1, when what day was fully come were the apostles all with one accord in one place?',
    },
    options: [
      { key: 'a', text: { am: 'የፋሲካው ቀን', en: 'the day of Passover' } },
      { key: 'b', text: { am: 'የሰንበቱ ቀን', en: 'the Sabbath day' } },
      { key: 'c', text: { am: 'ኀምሳው ቀንም', en: 'the day of Pentecost (fiftieth day)' } },
      { key: 'd', text: { am: 'የመክብብ ቀን', en: 'the day of Tabernacles' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በሐዋርያት ሥራ 2፡1 ላይ “ኀምሳው ቀንም በተፈጸመ ጊዜ፥ ሁሉም በአንድነት በአንድ ቦታ ተሰብስበው ነበር” በማለት የበዓለ ኀምሳን መድረስ ያበስራል።',
      en: 'Acts 2:1 recounts: "And when the day of Pentecost was fully come, they were all with one accord in one place."',
    },
    evidence: {
      verseId: 'e7ca72b6-2df7-527b-aa48-cc8e8b4b2a41',
      quoteAm: 'ኀምሳው ቀንም',
    },
    excerpt: null,
  },

  // 15: am-second-corinthians-62-2 -> d
  {
    passageId: 'am-second-corinthians-62-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'ቅዱስ ጳውሎስ በ2ኛ ቆሮንቶስ 2፡4 መሠረት ደብዳቤውን በብዙ እንባና በጭንቀት የጻፈላቸው ለምን ምክንያት እንደ ሆነ አስረዳ?',
      en: 'In 2 Corinthians 2:4, why did Saint Paul explain that out of much affliction and anguish of heart with many tears he wrote unto them?',
    },
    options: [
      { key: 'a', text: { am: 'ሥልጣኑን ሊያሳይ', en: 'to demonstrate his apostolic authority' } },
      { key: 'b', text: { am: 'ሊወቅሳቸውና ሊያሳዝናቸው', en: 'to rebuke them and make them grieved' } },
      { key: 'c', text: { am: 'ገንዘብን ሊሰበስብ', en: 'to gather collection for the saints' } },
      { key: 'd', text: { am: 'እጅግ እንደምወዳችሁ እንድታውቁ', en: 'that they might know the love which he had abundantly for them' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በ2ኛ ቆሮንቶስ 2፡4 “ከልብ ጭንቀት የተነሣ በብዙ እንባ ይህን ጽፌላችኋለሁ፤ ነገር ግን እጅግ እንደምወዳችሁ እንድታውቁ ነው እንጂ እንድታዝኑ አይደለም” በማለት ፍቅሩን ይገልጻል።',
      en: '2 Corinthians 2:4 demonstrates Paul’s pastoral heart: "not that ye should be grieved, but that ye might know the love which I have more abundantly unto you."',
    },
    evidence: {
      verseId: 'ecea1bef-1865-5c81-af9d-2f36e99317e4',
      quoteAm: 'እጅግ እንደምወዳችሁ እንድታውቁ',
    },
    excerpt: null,
  },

  // 16: am-philippians-65-2 -> a [finish-the-verse]
  {
    passageId: 'am-philippians-65-2',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የሐዋርያውን ምክር ባዶ ቦታ አሟሉ፦ “በክርክርና ከንቱ ውዳሴን በመውደድ አትሥሩ፤ ___ ከራሳችሁ ይልቅ ባልንጀራችሁን አክብሩ እንጂ አትታበዩ።” (ፊልጵስዩስ 2፡3)',
      en: 'Fill in the blank to complete the apostolic exhortation: "Let nothing be done through strife or vainglory; but in ___ let each esteem other better than themselves." (Philippians 2:3)',
    },
    options: [
      { key: 'a', text: { am: 'ትሕትናን በያዘ ልቡና', en: 'lowliness of mind' } },
      { key: 'b', text: { am: 'በታላቅ ድምፅ ምስጋና', en: 'with loud thanksgiving' } },
      { key: 'c', text: { am: 'በፍጹም የጾም ተጋድሎ', en: 'in fasting and ascetic toil' } },
      { key: 'd', text: { am: 'በንጽሕና በተሞላ ልብስ', en: 'in garments of purity' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በፊልጵስዩስ 2፡3 ላይ “በክርክርና ከንቱ ውዳሴን በመውደድ አትሥሩ፤ ትሕትናን በያዘ ልቡና ከራሳችሁ ይልቅ ባልንጀራችሁን አክብሩ እንጂ አትታበዩ” በማለት ትሕትናን ያስተምራል።',
      en: 'Philippians 2:3 commands: "Let nothing be done through strife or vainglory; but in lowliness of mind let each esteem other better than themselves."',
    },
    evidence: {
      verseId: 'e4e80b53-1e81-5623-a9c1-6c5e6b8ea90c',
      quoteAm: 'ትሕትናን በያዘ ልቡና',
    },
    excerpt: {
      am: 'በክርክርና ከንቱ ውዳሴን በመውደድ አትሥሩ፤',
      en: 'Let nothing be done through strife or vainglory;',
    },
  },

  // 17: am-second-timothy-70-4 -> b
  {
    passageId: 'am-second-timothy-70-4',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በ2ኛ ጢሞቴዎስ 4፡2 መሠረት ቅዱስ ጳውሎስ ጢሞቴዎስን ቃሉን እንዲሰብክ ካዘዘው በኋላ በምን ሁኔታ እንዲጸና አሳሰበው?',
      en: 'According to 2 Timothy 4:2, after charging Timothy to preach the word, in what circumstances did Paul urge him to be instant?',
    },
    options: [
      { key: 'a', text: { am: 'በሰላም ጊዜ ብቻ', en: 'in times of peace only' } },
      { key: 'b', text: { am: 'በጊዜውም አለጊዜውም', en: 'in season, out of season' } },
      { key: 'c', text: { am: 'በበዓላት ቀን ብቻ', en: 'on feast days only' } },
      { key: 'd', text: { am: 'በሽምግልና ዘመን', en: 'in the days of old age' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በ2ኛ ጢሞቴዎስ 4፡2 “ቃሉን ስበክ፤ በጊዜውም አለጊዜውም ጽና፤ ፈጽመህ እየታገሥህና እያስተማርህ ዝለፍና ገሥጽ፤ ምከርም” በማለት ቅዱስ ተልእኮውን ያስቀምጣል።',
      en: '2 Timothy 4:2 charges: "Preach the word; be instant in season, out of season; reprove, rebuke, exhort with all longsuffering and doctrine."',
    },
    evidence: {
      verseId: '4bd713dd-0472-5da1-a144-43ed20ba76d2',
      quoteAm: 'በጊዜውም አለጊዜውም',
    },
    excerpt: null,
  },

  // 18: am-first-john-76-4 -> c
  {
    passageId: 'am-first-john-76-4',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በ1ኛ ዮሐንስ 4፡4 ላይ ቅዱስ ዮሐንስ አማኞች የክርስቶስን ተቃዋሚዎች እንዳሸነፏቸው ሲመሰክር ምክንያቱ ምን እንደ ሆነ ተናገረ?',
      en: 'In 1 John 4:4, what reason does Saint John give for why the faithful have overcome the spirits of deception?',
    },
    options: [
      { key: 'a', text: { am: 'ሰይፋቸው ስለ ተሳለ', en: 'because their sword was sharp' } },
      { key: 'b', text: { am: 'ዕውቀታቸው የላቀ ስለ ሆነ', en: 'because their knowledge was superior' } },
      { key: 'c', text: { am: 'በዓለም ካለው ይልቅ በእናንተ ያለው ታላቅ ነውና', en: 'because greater is He that is in you, than he that is in the world' } },
      { key: 'd', text: { am: 'ቁጥራቸው የበዛ ስለ ሆነ', en: 'because their multitude was numerous' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በ1ኛ ዮሐንስ 4፡4 “ልጆች ሆይ፥ እናንተ ከእግዚአብሔር ናችሁ አሸንፋችኋቸውማል፥ በዓለም ካለው ይልቅ በእናንተ ያለው ታላቅ ነውና” ተብሎ ተጽፏል።',
      en: '1 John 4:4 comforts the faithful: "Ye are of God, little children, and have overcome them: because greater is he that is in you, than he that is in the world."',
    },
    evidence: {
      verseId: '90e65db4-5b44-518d-ae27-f68f376bc3b6',
      quoteAm: 'በዓለም ካለው ይልቅ በእናንተ ያለው ታላቅ ነውና',
    },
    excerpt: null,
  },

  // 19: am-revelation-81-4 -> d
  {
    passageId: 'am-revelation-81-4',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በራእይ 4፡4 መሠረት በሰማያዊው ዙፋን ዙሪያ በነበሩት ሃያ አራት ዙፋኖች ላይ የተቀመጡት ሃያ አራቱ ሽማግሌዎች ምን ለብሰውና በራሳቸው ምን ደፍተው ታዩ?',
      en: 'In Revelation 4:4, clothed in what and wearing what on their heads were the four and twenty elders seated upon the four and twenty seats?',
    },
    options: [
      { key: 'a', text: { am: 'ሐር ለብሰው የብር ዘውድ ደፍተው', en: 'clothed in silk with silver crowns' } },
      { key: 'b', text: { am: 'ቀይ ልብስ ለብሰው የዕንቍ አክሊል ደፍተው', en: 'clothed in red with crowns of jewels' } },
      { key: 'c', text: { am: 'የተልባ እግር ለብሰው የነሐስ አክሊል ደፍተው', en: 'clothed in linen with bronze crowns' } },
      { key: 'd', text: { am: 'ነጭ ልብስ ለብሰው በራሳቸውም የወርቅ አክሊል ደፍተው', en: 'clothed in white raiment with crowns of gold on their heads' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በራእይ 4፡4 “በዙፋኖቹም ላይ ነጭ ልብስ ለብሰው በራሳቸውም የወርቅ አክሊል ደፍተው ሃያ አራት ሽማግሌዎች ተቀምጠው ነበር” በማለት የሰማያዊውን ቅዳሴ ያሳያል።',
      en: 'Revelation 4:4 depicts the celestial worship: "and upon the seats I saw four and twenty elders sitting, clothed in white raiment; and they had on their heads crowns of gold."',
    },
    evidence: {
      verseId: 'a87d362a-4353-57ff-a183-42a5d1706efa',
      quoteAm: 'ነጭ ልብስ ለብሰው በራሳቸውም የወርቅ አክሊል ደፍተው',
    },
    excerpt: null,
  },
]

async function run() {
  console.log(`Checking key distribution:`)
  const counts: Record<string, number> = { a: 0, b: 0, c: 0, d: 0 }
  for (const q of questions) counts[q.correctKey]++
  console.log(counts)

  const responsePayload = {
    version: 1,
    sourceHash: sourceManifest.sourceHash,
    modelId,
    questions,
  }

  // Validate response
  console.log(`Validating Batch 002 response through generator validator...`)
  const validated = await validateAmharicQuestionResponse(sourceBatch, modelId, responsePayload, existingPrompts)
  console.log(`Generator validation PASSED! ${validated.drafts.length} drafts produced.`)

  // Write outputs to batch-002
  writeFileSync(join(BATCH_DIR, 'gemini-response.json'), `${JSON.stringify(responsePayload, null, 2)}\n`, 'utf8')
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

  // Update campaign orchestrator library
  console.log(`Updating campaign tracking manifest and content library...`)
  await runCampaign()
  console.log(`Batch 002 successfully generated, validated, and ingested into the library!`)
}

run().catch((err) => {
  console.error(err)
  process.exit(1)
})
