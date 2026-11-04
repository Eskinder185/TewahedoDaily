import { readFileSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'
import { validateAmharicQuestionResponse } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { adaptEditorialBatchToCms } from './adapt-drafts-for-cms'
import { previewQuestionImport } from '../../src/lib/play/questionLibrary'
import { runCampaign } from './campaign-orchestrator'

const BATCH_DIR = 'artifacts/faith-challenges/batch-003'
const sourceBatch = JSON.parse(readFileSync(join(BATCH_DIR, 'source-batch.json'), 'utf8'))
const sourceManifest = JSON.parse(readFileSync(join(BATCH_DIR, 'source-manifest.json'), 'utf8'))
const existingPrompts = JSON.parse(readFileSync(join(BATCH_DIR, 'existing-prompts.json'), 'utf8'))
const modelId = 'gemini-2.5-pro'

const questions = [
  // 0: am-genesis-1-3 -> a
  {
    passageId: 'am-genesis-1-3',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘፍጥረት 3፡1 መሠረት እግዚአብሔር አምላክ ከፈጠራቸው ከምድር አራዊት ሁሉ ይልቅ ምን ዓይነት ሆኖ የተገለጠው ፍጥረት እባብ ነበር?',
      en: 'According to Genesis 3:1, what character is attributed to the serpent above all the beasts of the field which the LORD God had made?',
    },
    options: [
      { key: 'a', text: { am: 'ተንኰለኛ', en: 'subtil (cunning)' } },
      { key: 'b', text: { am: 'ብርቱ', en: 'strong' } },
      { key: 'c', text: { am: 'ፈጣን', en: 'swift' } },
      { key: 'd', text: { am: 'መርዘኛ', en: 'venomous' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘፍጥረት 3፡1 ላይ “እባብም እግዚአብሔር አምላክ ከፈጠራቸው ከምድር አራዊት ሁሉ ይልቅ ተንኰለኛ ነበር” ተብሎ ተጽፏል።',
      en: 'Genesis 3:1 notes that the serpent was more subtil than any beast of the field which the LORD God had made.',
    },
    evidence: {
      verseId: '1b3d8b1b-bedc-5ca9-a21b-1054016ba1ee',
      quoteAm: 'ተንኰለኛ',
    },
    excerpt: null,
  },

  // 1: am-leviticus-3-4 -> b
  {
    passageId: 'am-leviticus-3-4',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘሌዋውያን 4፡3 መሠረት የተቀባው ሊቀ ካህናት ኀጢአት ቢሠራ ስለ ሠራው ኀጢአት ለእግዚአብሔር ምን ዓይነት መሥዋዕት እንዲያቀርብ ታዘዘ?',
      en: 'According to Leviticus 4:3, if the anointed priest do sin, what offering is he commanded to bring unto the LORD for his sin?',
    },
    options: [
      { key: 'a', text: { am: 'የበግ ጠቦት', en: 'a lamb of the sheep' } },
      { key: 'b', text: { am: 'ነውር የሌለበትን ወይፈን', en: 'a young bullock without blemish' } },
      { key: 'c', text: { am: 'የዋኖስ ጫጩቶች', en: 'young pigeons' } },
      { key: 'd', text: { am: 'የፍየል ሙክት', en: 'a male goat' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘሌዋውያን 4፡3 ላይ “የተቀባውም ሊቀ ካህናት... ኀጢአት ቢሠራ፥ ስለ ሠራው ስለ ኀጢአቱ ከመንጋው ነውር የሌለበትን ወይፈን ለእግዚአብሔር ለኀጢአት መሥዋዕት ያቀርበዋል” ይላል።',
      en: 'Leviticus 4:3 directs that the sin of an anointed priest required a young bullock without blemish as a sin offering.',
    },
    evidence: {
      verseId: 'a639e7b9-d800-5336-a0aa-ca0ea0b0ebc8',
      quoteAm: 'ነውር የሌለበትን ወይፈን',
    },
    excerpt: null,
  },

  // 2: am-joshua-6-3 -> c [finish-the-verse]
  {
    passageId: 'am-joshua-6-3',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የኢያሱን ጥሪ ባዶ ቦታ አሟሉ፦ “ኢያሱም ሕዝቡን፥ ___ አለ።” (ኢያሱ 3፡5)',
      en: 'Fill in the blank to complete Joshua’s exhortation: "And Joshua said unto the people, ___ for to morrow the LORD will do wonders among you." (Joshua 3:5)',
    },
    options: [
      { key: 'a', text: { am: 'ጦራችሁንና ጋሻችሁን አዘጋጁ', en: 'prepare your spears and shields' } },
      { key: 'b', text: { am: 'የተቀደሰውን መሠዊያ ገንቡ', en: 'build the holy altar' } },
      { key: 'c', text: { am: 'ነገ እግዚአብሔር በመካከላችሁ ድንቅ ነገር ያደርጋልና ራሳችሁን አንጹ', en: 'Sanctify yourselves: for to morrow the LORD will do wonders among you' } },
      { key: 'd', text: { am: 'የዮርዳኖስን ውኃ በጽዋ ቅዱ', en: 'draw the waters of the Jordan in a vessel' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ኢያሱ 3፡5 “ኢያሱም ሕዝቡን፥ ነገ እግዚአብሔር በመካከላችሁ ድንቅ ነገር ያደርጋልና ራሳችሁን አንጹ አለ” በማለት መንፈሳዊ ዝግጅትን አዘዘ።',
      en: 'Joshua 3:5 commands sanctification before God works wonders: "Sanctify yourselves: for to morrow the LORD will do wonders among you."',
    },
    evidence: {
      verseId: '382c2665-37fa-5718-a68b-440d42d73134',
      quoteAm: 'ነገ እግዚአብሔር በመካከላችሁ ድንቅ ነገር ያደርጋልና ራሳችሁን አንጹ',
    },
    excerpt: {
      am: 'ኢያሱም ሕዝቡን፥',
      en: 'And Joshua said unto the people,',
    },
  },

  // 3: am-first-chronicles-13-3 -> d
  {
    passageId: 'am-first-chronicles-13-3',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በ1ኛ ዜና መዋዕል 3፡4 መሠረት ንጉሥ ዳዊት በኬብሮን ለስንት ጊዜ ያህል ነገሠ?',
      en: 'According to 1 Chronicles 3:4, for how long did King David reign in Hebron?',
    },
    options: [
      { key: 'a', text: { am: 'አርባ ዓመት ሙሉ', en: 'forty full years' } },
      { key: 'b', text: { am: 'አሥራ ሁለት ዓመት', en: 'twelve years' } },
      { key: 'c', text: { am: 'ሦስት ዓመት ከሦስት ወር', en: 'three years and three months' } },
      { key: 'd', text: { am: 'ሰባት ዓመት ከስድስት ወር', en: 'seven years and six months' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በ1ኛ ዜና መዋዕል 3፡4 “በዚያም ሰባት ዓመት ከስድስት ወር ነገሠ፤ በኢየሩሳሌምም ሠላሳ ሦስት ዓመት ነገሠ” ተብሎ ተመዝግቧል።',
      en: '1 Chronicles 3:4 records that David reigned in Hebron seven years and six months, and in Jerusalem thirty and three years.',
    },
    evidence: {
      verseId: '6941595a-0e5e-5c65-a861-f24a9c66f64f',
      quoteAm: 'ሰባት ዓመት ከስድስት ወር',
    },
    excerpt: null,
  },

  // 4: am-enoch-16-4 -> a
  {
    passageId: 'am-enoch-16-4',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ሄኖክ 4፡1 መሠረት ከነገር ሁሉ አስቀድሞ በሕይወተ ሥጋ የተሰወረው ጻድቅ ማን እንደ ሆነ ተመዝግቧል?',
      en: 'According to 1 Enoch 4:1, who was hidden before all things so that no son of man knew where he was?',
    },
    options: [
      { key: 'a', text: { am: 'ሄኖክ', en: 'Enoch' } },
      { key: 'b', text: { am: 'ኤልያስ', en: 'Elijah' } },
      { key: 'c', text: { am: 'መልከ ጼዴቅ', en: 'Melchizedek' } },
      { key: 'd', text: { am: 'ኖኅ', en: 'Noah' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ሄኖክ 4፡1 ላይ “ከነገር ሁሉ አስቀድሞ ሄኖክ ተሰወረ፤ ከሰው ልጆችም የተሰወረበትንና ያለበትን ቦታ የሚያውቅ አልነበረም” ይላል።',
      en: '1 Enoch 4:1 records the translation of Enoch: "Before all these things Enoch was hidden, and no one of the children of men knew where he was hidden."',
    },
    evidence: {
      verseId: 'bec236d6-35d3-5393-ae26-709622e63b71',
      quoteAm: 'ሄኖክ',
    },
    excerpt: null,
  },

  // 5: am-first-meqabyan-24-3 -> b
  {
    passageId: 'am-first-meqabyan-24-3',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 3፡1 ላይ ከሰማይ በወረደው ቃል የልዑል እግዚአብሔር ባሮች ተብለው በስም የተጠሩት ሦስቱ ሰማዕታት እነማን ነበሩ?',
      en: 'In 1 Meqabyan 3:1, which three martyrs are addressed from heaven as the servants of the Most High God?',
    },
    options: [
      { key: 'a', text: { am: 'ሲድራቅ፥ ሚሳቅ፥ አብደናጎ', en: 'Shadrach, Meshach, Abednego' } },
      { key: 'b', text: { am: 'አብያ፥ ሲላ፥ ፈንቶስ', en: 'Abya, Sila, Phantice' } },
      { key: 'c', text: { am: 'ጴጥሮስ፥ ጳውሎስ፥ እንድርያስ', en: 'Peter, Paul, Andrew' } },
      { key: 'd', text: { am: 'ኤስድሮስ፥ መቃቢስ፥ ተክላ', en: 'Esdras, Meqabis, Thecla' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 3፡1 “ከሰማይም እንዲህ የሚል ቃል መጣ፤ የልዑል እግዚአብሔር ባሮች አብያ፥ ሲላ፥ ፈንቶስ... ፊታችሁም በመንግሥተ ሰማይ ይበራለ” በማለት የሰማዕታቱን ክብር ገለጠ።',
      en: '1 Meqabyan 3:1 names the holy young martyrs addressed from heaven: Abya, Sila, and Phantice.',
    },
    evidence: {
      verseId: '0e2b9004-a449-592a-a227-c14e348d01c9',
      quoteAm: 'አብያ፥ ሲላ፥ ፈንቶስ',
    },
    excerpt: null,
  },

  // 6: am-tegsats-30-3 -> c [finish-the-verse]
  {
    passageId: 'am-tegsats-30-3',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የጥበብን ምክር ባዶ ቦታ አሟሉ፦ “ሌላ ያመስግንህ እንጂ ___ እንግዳም እንጂ የገዛ ከንፈርህ አይደለም።” (ተግሣጽ 3፡2)',
      en: 'Fill in the blank to complete the proverb of humility: "Let another man praise thee, and not ___ a stranger, and not thine own lips." (Tegsats 3:2)',
    },
    options: [
      { key: 'a', text: { am: 'ወዳጅህ አይደለም', en: 'not thy friend' } },
      { key: 'b', text: { am: 'ዘመድህ አይደለም', en: 'not thy kinsman' } },
      { key: 'c', text: { am: 'አፍህ አይደለም', en: 'thine own mouth' } },
      { key: 'd', text: { am: 'ጠላትህ አይደለም', en: 'not thine enemy' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ተግሣጽ 3፡2 ላይ “ሌላ ያመስግንህ እንጂ አፍህ አይደለም” በማለት የትሕትናንና ራስን ያለማወደስን ጥበብ ይመክራል።',
      en: 'Tegsats (Proverbs) 3:2 teaches: "Let another man praise thee, and not thine own mouth; a stranger, and not thine own lips."',
    },
    evidence: {
      verseId: '6145c1a2-de1d-5448-ac6a-eac43b7ebb3e',
      quoteAm: 'አፍህ አይደለም',
    },
    excerpt: {
      am: 'ሌላ ያመስግንህ እንጂ',
      en: 'Let another man praise thee, and not',
    },
  },

  // 7: am-song-of-songs-33-3 -> d [finish-the-verse]
  {
    passageId: 'am-song-of-songs-33-3',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የመኃልየ መኃልይን ጥቅስ ባዶ ቦታ አሟሉ፦ “ከተማዪቱን የሚጠብቁት ___ ነፍሴ የወደደችውን አያችሁትን? አልኋቸው።” (መኃልይ 3፡3)',
      en: 'Fill in the blank to complete the verse of Song of Songs: "The watchmen that go about the city ___ to whom I said, Saw ye him whom my soul loveth?" (Song of Songs 3:3)',
    },
    options: [
      { key: 'a', text: { am: 'ጐልማሶች ጠየቁኝ', en: 'young men asked me' } },
      { key: 'b', text: { am: 'ካህናት ባረኩኝ', en: 'priests blessed me' } },
      { key: 'c', text: { am: 'ሽማግሌዎች አደነቁኝ', en: 'elders wondered at me' } },
      { key: 'd', text: { am: 'ጠባቂዎች አገኙኝ', en: 'found me' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመኃልየ መኃልይ ዘሰሎሞን 3፡3 ላይ “ከተማዪቱን የሚጠብቁት ጠባቂዎች አገኙኝ፤ ነፍሴ የወደደችውን አያችሁትን? አልኋቸው” ይላል።',
      en: 'Song of Songs 3:3 reads: "The watchmen that go about the city found me: to whom I said, Saw ye him whom my soul loveth?"',
    },
    evidence: {
      verseId: '104a8451-d738-597a-a49c-5b6e132507af',
      quoteAm: 'ጠባቂዎች አገኙኝ',
    },
    excerpt: {
      am: 'ከተማዪቱን የሚጠብቁት',
      en: 'The watchmen that go about the city',
    },
  },

  // 8: am-hosea-43-3 -> a
  {
    passageId: 'am-hosea-43-3',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በትንቢተ ሆሴዕ 3፡5 መሠረት በኋለኛው ዘመን የእስራኤል ልጆች ተመልሰው አምላካቸውን እግዚአብሔርንና የትኛውን ንጉሣቸውን እንደሚፈልጉ ተተንብዮአል?',
      en: 'According to Hosea 3:5, in the latter days afterward shall the children of Israel return, and seek the LORD their God, and which king?',
    },
    options: [
      { key: 'a', text: { am: 'ንጉሣቸውን ዳዊትን', en: 'David their king' } },
      { key: 'b', text: { am: 'ንጉሣቸውን ሰሎሞንን', en: 'Solomon their king' } },
      { key: 'c', text: { am: 'ንጉሣቸውን ሮብዓምን', en: 'Rehoboam their king' } },
      { key: 'd', text: { am: 'ንጉሣቸውን ሕዝቅያስን', en: 'Hezekiah their king' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በትንቢተ ሆሴዕ 3፡5 “ከዚያም በኋላ የእስራኤል ልጆች ተመልሰው አምላካቸውን እግዚአብሔርንና ንጉሣቸውን ዳዊትን ይፈልጋሉ” በማለት የክርስቶስን መንግሥት ያመለክታል።',
      en: 'Hosea 3:5 prophesies: "Afterward shall the children of Israel return, and seek the LORD their God, and David their king."',
    },
    evidence: {
      verseId: '0549df96-218e-5be6-af8a-db43a8b66ce0',
      quoteAm: 'ንጉሣቸውን ዳዊትን',
    },
    excerpt: null,
  },

  // 9: am-joel-46-3 -> b
  {
    passageId: 'am-joel-46-3',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በትንቢተ ኢዮኤል 3፡1 ላይ እግዚአብሔር በዚያ ወራትና በዚያ ዘመን የምን ምርኮ እንደሚመልስ ተናገረ?',
      en: 'In Joel 3:1, whose captivity does the LORD declare He will bring again in those days and at that time?',
    },
    options: [
      { key: 'a', text: { am: 'የባቢሎንንና የፋርስን', en: 'of Babylon and Persia' } },
      { key: 'b', text: { am: 'የይሁዳንና የኢየሩሳሌምን', en: 'of Judah and Jerusalem' } },
      { key: 'c', text: { am: 'የሶርያንና የግብፅን', en: 'of Syria and Egypt' } },
      { key: 'd', text: { am: 'የሰማርያንና የጢሮስን', en: 'of Samaria and Tyre' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኢዮኤል 3፡1 “እነሆም በዚያ ወራትና በዚያ ዘመን የይሁዳንና የኢየሩሳሌምን ምርኮ በምመልስበት ጊዜ” ተብሎ ተጽፏል።',
      en: 'Joel 3:1 declares: "For, behold, in those days, and in that time, when I shall bring again the captivity of Judah and Jerusalem."',
    },
    evidence: {
      verseId: '257c0dd4-174d-5a84-a535-d5e1ad706852',
      quoteAm: 'የይሁዳንና የኢየሩሳሌምን',
    },
    excerpt: null,
  },

  // 10: am-nahum-49-3 -> c
  {
    passageId: 'am-nahum-49-3',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በናሆም 3፡1 ላይ ነቢዩ በሁለንተናዋ ሐሰትና ቅሚያ ሞልቶባታል በማለት ወዮታ የተናገረባት ምን ተብላ የተጠራችው ከተማ ነበረች?',
      en: 'In Nahum 3:1, by what title does the prophet lament against the city that is all full of lies and robbery?',
    },
    options: [
      { key: 'a', text: { am: 'ለጨለማይቱ ከተማ', en: 'to the dark city' } },
      { key: 'b', text: { am: 'ለተረሳችው ከተማ', en: 'to the forgotten city' } },
      { key: 'c', text: { am: 'ለደም ከተማ', en: 'to the bloody city' } },
      { key: 'd', text: { am: 'ለድንጋይቱ ከተማ', en: 'to the stone city' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በናሆም 3፡1 “ለደም ከተማ ወዮላት! በሁለንተናዋ ሐሰትና ቅሚያ ሞልቶባታል” በማለት የነነዌን ጥፋት ይመሰክራል።',
      en: 'Nahum 3:1 warns: "Woe to the bloody city! it is all full of lies and robbery; the prey departeth not."',
    },
    evidence: {
      verseId: '5c0bb134-365a-5903-aa22-4fce449beb89',
      quoteAm: 'ለደም ከተማ',
    },
    excerpt: null,
  },

  // 11: am-malachi-54-3 -> d [finish-the-verse]
  {
    passageId: 'am-malachi-54-3',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'የትንቢቱን ቃል ባዶ ቦታ አሟሉ፦ “እነሆ፥ መልእክተኛዬን እልካለሁ፥ ___ እናንተም የምትፈልጉት ጌታ በድንገት ወደ መቅደሱ ይመጣል፤” (ሚልክያስ 3፡1)',
      en: 'Fill in the blank to complete the prophetic promise of the forerunner: "Behold, I will send my messenger, and ___ and the Lord, whom ye seek, shall suddenly come to his temple." (Malachi 3:1)',
    },
    options: [
      { key: 'a', text: { am: 'የጽዮንን ቅጥር ይጠብቃል', en: 'he shall keep the walls of Zion' } },
      { key: 'b', text: { am: 'ሕዝቡን ከጨለማ ያወጣል', en: 'he shall bring out the people from darkness' } },
      { key: 'c', text: { am: 'ቀስተ ደመናን በሰማይ ያቆማል', en: 'he shall set a rainbow in heaven' } },
      { key: 'd', text: { am: 'መንገድንም በፊቴ ያስተካክላል', en: 'he shall prepare the way before me' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በሚልክያስ 3፡1 ላይ “እነሆ፥ መልእክተኛዬን እልካለሁ፥ መንገድንም በፊቴ ያስተካክላል” በማለት የመጥምቁ ዮሐንስን አገልግሎት ያስተምራል።',
      en: 'Malachi 3:1 records the messianic herald: "Behold, I will send my messenger, and he shall prepare the way before me."',
    },
    evidence: {
      verseId: '94c62966-9fb3-5fe8-ad83-4f9e4599823c',
      quoteAm: 'መንገድንም በፊቴ ያስተካክላል',
    },
    excerpt: {
      am: 'እነሆ፥ መልእክተኛዬን እልካለሁ፥',
      en: 'Behold, I will send my messenger,',
    },
  },

  // 12: am-mark-56-3 -> a
  {
    passageId: 'am-mark-56-3',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በማርቆስ ወንጌል 3፡1 መሠረት ጌታችን ኢየሱስ ክርስቶስ ወደ ምኵራብ በገባ ጊዜ በዚያ የነበረው የታመመ ሰው ምን ሆነበት ነበር?',
      en: 'According to Mark 3:1, what ailment had the man who was in the synagogue when Jesus entered?',
    },
    options: [
      { key: 'a', text: { am: 'እጁ የሰለለች', en: 'which had a withered hand' } },
      { key: 'b', text: { am: 'ዓይኑ የታወረ', en: 'blind of eye' } },
      { key: 'c', text: { am: 'እግሩ ሽባ የሆነ', en: 'lame in feet' } },
      { key: 'd', text: { am: 'ጆሮው የደነቆረ', en: 'deaf of ear' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በማርቆስ 3፡1 ላይ “ደግሞም ወደ ምኵራብ ገባ፤ በዚያም እጁ የሰለለች ሰው ነበር” በማለት ጌታችን በሰንበት ያደረገውን ተአምር ይተርካል።',
      en: 'Mark 3:1 records: "And he entered again into the synagogue; and there was a man there which had a withered hand."',
    },
    evidence: {
      verseId: 'f3fa2a32-2528-5d7f-a86c-b51e68c7e5a8',
      quoteAm: 'እጁ የሰለለች',
    },
    excerpt: null,
  },

  // 13: am-acts-59-3 -> b
  {
    passageId: 'am-acts-59-3',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በሐዋርያት ሥራ 3፡1 መሠረት ጴጥሮስና ዮሐንስ ለጸሎት ወደ ቤተ መቅደስ የወጡት በስንት ሰዓት ነበር?',
      en: 'According to Acts 3:1, at what hour of prayer did Peter and John go up together into the temple?',
    },
    options: [
      { key: 'a', text: { am: 'በሦስት ሰዓት', en: 'at the third hour' } },
      { key: 'b', text: { am: 'በዘጠኝ ሰዓት', en: 'at the ninth hour' } },
      { key: 'c', text: { am: 'በስድስት ሰዓት', en: 'at the sixth hour' } },
      { key: 'd', text: { am: 'በአሥራ ሁለት ሰዓት', en: 'at the twelfth hour' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በሐዋርያት ሥራ 3፡1 “ጴጥሮስና ዮሐንስም በዘጠኝ ሰዓት ለጸሎት በአንድነት ወደ ቤተ መቅደስ ወጡ” ተብሎ ተጽፏል።',
      en: 'Acts 3:1 states: "Now Peter and John went up together into the temple at the hour of prayer, being the ninth hour."',
    },
    evidence: {
      verseId: '53ede3c1-c165-53cc-a540-5cd8d66a75f6',
      quoteAm: 'በዘጠኝ ሰዓት',
    },
    excerpt: null,
  },

  // 14: am-second-corinthians-62-3 -> c
  {
    passageId: 'am-second-corinthians-62-3',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'ቅዱስ ጳውሎስ በ2ኛ ቆሮንቶስ 3፡3 ላይ የክርስቶስ መልእክት የተጻፈችው በምን ላይ እንደ ሆነ መስክሯል?',
      en: 'In 2 Corinthians 3:3, upon what does Saint Paul declare that the epistle of Christ is written, not in tables of stone?',
    },
    options: [
      { key: 'a', text: { am: 'በብር ጽላት ላይ', en: 'on silver plates' } },
      { key: 'b', text: { am: 'በወርቅ ወረቀት ላይ', en: 'on golden scrolls' } },
      { key: 'c', text: { am: 'በሥጋ ልብ ሠሌዳነት', en: 'in fleshy tables of the heart' } },
      { key: 'd', text: { am: 'በእንጨት ሰሌዳ ላይ', en: 'on wooden tablets' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በ2ኛ ቆሮንቶስ 3፡3 “በሥጋ ልብ ሠሌዳነት ነው እንጂ በድንጋይ ሠሌዳም አይደለም” በማለት የመንፈስ ቅዱስን ሕያው ጸጋ ይገልጻል።',
      en: '2 Corinthians 3:3 contrasts the old and new: "written not with ink, but with the Spirit of the living God; not in tables of stone, but in fleshy tables of the heart."',
    },
    evidence: {
      verseId: 'ccf85a8e-50e0-5807-a51c-850cefbb18ec',
      quoteAm: 'በሥጋ ልብ ሠሌዳነት',
    },
    excerpt: null,
  },

  // 15: am-philippians-65-3 -> d
  {
    passageId: 'am-philippians-65-3',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በፊልጵስዩስ 3፡5 መሠረት ቅዱስ ጳውሎስ ከየትኛው የእስራኤል ነገድ ወገን እንደ ተወለደ ተናግሯል?',
      en: 'According to Philippians 3:5, of which tribe of Israel was Saint Paul by birth?',
    },
    options: [
      { key: 'a', text: { am: 'ከይሁዳ ነገድ', en: 'of the tribe of Judah' } },
      { key: 'b', text: { am: 'ከሌዊ ነገድ', en: 'of the tribe of Levi' } },
      { key: 'c', text: { am: 'ከዳን ነገድ', en: 'of the tribe of Dan' } },
      { key: 'd', text: { am: 'ከብንያም ነገድ', en: 'of the tribe of Benjamin' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በፊልጵስዩስ 3፡5 “ከእስራኤል ሕዝብ ከብንያም ነገድ ከዕብራውያን ዕብራዊ ነኝ፤ በኦሪትም ፈሪሳዊ ነበርሁ” በማለት የዘር ሐረጉን ይጠቅሳል።',
      en: 'Philippians 3:5 records Paul’s lineage: "Circumcised the eighth day, of the stock of Israel, of the tribe of Benjamin, an Hebrew of the Hebrews."',
    },
    evidence: {
      verseId: '8c8433c2-1a7e-5e54-a80a-d0b0f3e08150',
      quoteAm: 'ከብንያም ነገድ',
    },
    excerpt: null,
  },

  // 16: am-first-john-76-5 -> a
  {
    passageId: 'am-first-john-76-5',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በ1ኛ ዮሐንስ 5፡4 መሠረት ከእግዚአብሔር የተወለደው ሁሉ ዓለምን እንደሚያሸንፍ ከተነገረ በኋላ ዓለምን የሚያሸንፈው ድል ምን እንደ ሆነ ተገለጠ?',
      en: 'According to 1 John 5:4, what is the victory that overcometh the world?',
    },
    options: [
      { key: 'a', text: { am: 'እምነታችን', en: 'our faith' } },
      { key: 'b', text: { am: 'ሀብታችን', en: 'our wealth' } },
      { key: 'c', text: { am: 'ኃይላችን', en: 'our strength' } },
      { key: 'd', text: { am: 'ዕውቀታችን', en: 'our knowledge' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በ1ኛ ዮሐንስ 5፡4 “ከእግዚአብሔር የተወለደ ሁሉ ዓለምን ያሸንፋልና፤ ዓለምንም የሚያሸንፈው እምነታችን ነው” ተብሎ ተጽፏል።',
      en: '1 John 5:4 witnesses: "For whatsoever is born of God overcometh the world: and this is the victory that overcometh the world, even our faith."',
    },
    evidence: {
      verseId: '6d1cbc62-ef25-5edc-ad15-c823846582aa',
      quoteAm: 'እምነታችን',
    },
    excerpt: null,
  },

  // 17: am-revelation-81-6 -> b
  {
    passageId: 'am-revelation-81-6',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በራእይ 6፡2 መሠረት የመጀመሪያው ማኅተም በተፈታ ጊዜ አክሊል ተሰጥቶት ድል ለመንሣት የወጣው ጋላቢ የተቀመጠበት ፈረስ መልኩ ምን ዓይነት ነበረ?',
      en: 'According to Revelation 6:2, when the first seal was opened, what was the color of the horse that went forth conquering and to conquer?',
    },
    options: [
      { key: 'a', text: { am: 'ጥቁር ፈረስ', en: 'a black horse' } },
      { key: 'b', text: { am: 'አምባላይ ፈረስ', en: 'a white horse' } },
      { key: 'c', text: { am: 'ዳማ ፈረስ', en: 'a red horse' } },
      { key: 'd', text: { am: 'ሐመር ፈረስ', en: 'a pale horse' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በራእይ 6፡2 “አየሁም፤ እነሆም አምባላይ ፈረስ ወጣ፤ በእርሱም ላይ የተቀመጠው ቀስት ነበረው፤ አክሊልም ተሰጠው፤ ድልም እየነሣ ወጣ” ይላል።',
      en: 'Revelation 6:2 depicts: "And I saw, and behold a white horse: and he that sat on him had a bow; and a crown was given unto him: and he went forth conquering, and to conquer."',
    },
    evidence: {
      verseId: '7595e622-86d2-5129-a7e2-0cbfce865537',
      quoteAm: 'አምባላይ ፈረስ',
    },
    excerpt: null,
  },

  // 18: am-exodus-2-1 -> c
  {
    passageId: 'am-exodus-2-1',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘጸአት 1፡5 መሠረት ከያዕቆብ ጕልበት ወጥተው ወደ ግብፅ የገቡት ሰዎች ቁጥር ስንት ነፍሶች ነበሩ?',
      en: 'According to Exodus 1:5, how many souls in all came out of the loins of Jacob into Egypt?',
    },
    options: [
      { key: 'a', text: { am: 'አርባ ነፍሶች', en: 'forty souls' } },
      { key: 'b', text: { am: 'ሃምሳ ነፍሶች', en: 'fifty souls' } },
      { key: 'c', text: { am: 'ሰባ ነፍሶች', en: 'seventy souls' } },
      { key: 'd', text: { am: 'መቶ ነፍሶች', en: 'one hundred souls' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በኦሪት ዘጸአት 1፡5 “ከያዕቆብ ጕልበት የወጡት ሰዎች ሁሉ ሰባ ነፍሶች ነበሩ፤ ዮሴፍም አስቀድሞ በግብፅ ነበረ” ተብሎ ተጽፏል።',
      en: 'Exodus 1:5 records: "And all the souls that came out of the loins of Jacob were seventy souls: for Joseph was in Egypt already."',
    },
    evidence: {
      verseId: '58c207a7-eb60-57a7-aaa8-65e2a1b29570',
      quoteAm: 'ሰባ ነፍሶች',
    },
    excerpt: null,
  },

  // 19: am-numbers-4-1 -> d
  {
    passageId: 'am-numbers-4-1',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘኍልቍ 1፡1 መሠረት እግዚአብሔር ሙሴን የእስራኤልን ሕዝብ ቍጥር እንዲቈጥር ያነጋገረው በየትኛው ምድረ በዳ በነበረው ምስክሩ ድንኳን ውስጥ ነበር?',
      en: 'According to Numbers 1:1, in the tabernacle of the congregation in which wilderness did the LORD speak unto Moses to take the sum of Israel?',
    },
    options: [
      { key: 'a', text: { am: 'በፋራን ምድረ በዳ', en: 'in the wilderness of Paran' } },
      { key: 'b', text: { am: 'በቃዴስ ምድረ በዳ', en: 'in the wilderness of Kadesh' } },
      { key: 'c', text: { am: 'በሲን ምድረ በዳ', en: 'in the wilderness of Zin' } },
      { key: 'd', text: { am: 'በሲና ምድረ በዳ', en: 'in the wilderness of Sinai' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በኦሪት ዘኍልቍ 1፡1 “እግዚአብሔርም ሙሴን በሲና ምድረ በዳ በምስክሩ ድንኳን ውስጥ... እንዲህ ብሎ ተናገረው” በማለት ስፍራውን ይገልጻል።',
      en: 'Numbers 1:1 begins: "And the LORD spake unto Moses in the wilderness of Sinai, in the tabernacle of the congregation."',
    },
    evidence: {
      verseId: 'f94de262-e760-548a-a9e7-684ed594df60',
      quoteAm: 'በሲና ምድረ በዳ',
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
  console.log(`Validating Batch 003 response through generator validator...`)
  const validated = await validateAmharicQuestionResponse(sourceBatch, modelId, responsePayload, existingPrompts)
  console.log(`Generator validation PASSED! ${validated.drafts.length} drafts produced.`)

  // Write outputs to batch-003
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
  console.log(`Batch 003 successfully generated, validated, and ingested into the library!`)
}

run().catch((err) => {
  console.error(err)
  process.exit(1)
})

