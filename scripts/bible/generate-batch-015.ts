/**
 * Offline generator for Faith Challenges Batch 015
 * 20 source-grounded bilingual questions from verified Amharic Bible passages.
 */
import { readFileSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'
import { validateAmharicQuestionResponse } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { adaptEditorialBatchToCms } from './adapt-drafts-for-cms'
import { previewQuestionImport } from '../../src/lib/play/questionLibrary'
import { runCampaign } from './campaign-orchestrator'

const BATCH_DIR = 'artifacts/faith-challenges/batch-015'
const sourceBatch = JSON.parse(readFileSync(join(BATCH_DIR, 'source-batch.json'), 'utf8'))
const sourceManifest = JSON.parse(readFileSync(join(BATCH_DIR, 'source-manifest.json'), 'utf8'))
const existingPrompts = JSON.parse(readFileSync(join(BATCH_DIR, 'existing-prompts.json'), 'utf8'))
const modelId = 'copilot-agent-mode'

const questions = [
  // 0: am-genesis-1-17 -> a (trivia)
  {
    passageId: 'am-genesis-1-17',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በኦሪት ዘፍጥረት 17፡5 መሠረት እግዚአብሔር ለአብራም ስሙ ማን እንደሚባል ነገረው?',
      en: 'According to Genesis 17:5, what did God declare Abram’s name should be called?',
    },
    options: [
      { key: 'a', text: { am: '‘አብርሃም’ ይባላል እንጂ', en: 'thy name shall be Abraham' } },
      { key: 'b', text: { am: '‘እስራኤል’ ይባላል', en: 'shall be called Israel' } },
      { key: 'c', text: { am: '‘ይስሐቅ’ ይባላል', en: 'shall be called Isaac' } },
      { key: 'd', text: { am: '‘መልከ ጼዴቅ’ ይባላል', en: 'shall be called Melchizedek' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘፍጥረት 17፡5 “እንግዲህ ስምህ አብራም አይባልም ‘አብርሃም’ ይባላል እንጂ፤ ለብዙ አሕዛብ አባት አድርጌሃለሁና” ተብሎ ተጽፏል።',
      en: 'Genesis 17:5 states: "Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee."',
    },
    evidence: {
      verseId: '9dcc9f0b-2ced-5473-aa26-f61155d11579',
      quoteAm: '‘አብርሃም’ ይባላል እንጂ',
    },
    excerpt: null,
  },

  // 1: am-leviticus-3-19 -> b (finish-the-verse)
  {
    passageId: 'am-leviticus-3-19',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘሌዋውያን 19፡2 ያለውን ኃይለ ቃል ያሟሉ፦ ““ለእስራኤል ልጆች ማኅበር ሁሉ እንዲህ በላቸው፦ ___”',
      en: 'Complete the verse in Leviticus 19:2: "Speak unto all the congregation of the children of Israel, and say unto them, ___"',
    },
    options: [
      { key: 'a', text: { am: 'ትእዛዜን ሁሉ በልባችሁ ጠብቁ', en: 'keep all my commandments in your heart' } },
      { key: 'b', text: { am: 'እኔ እግዚአብሔር አምላካችሁ ቅዱስ ነኝና እናንተ ቅዱሳን ሁኑ', en: 'Ye shall be holy: for I the LORD your God am holy' } },
      { key: 'c', text: { am: 'ወደ ተስፋይቱ ምድር በሰላም ግቡ', en: 'enter the promised land in peace' } },
      { key: 'd', text: { am: 'በየወሩ አዲስ መሥዋዕት አቅርቡ', en: 'offer new sacrifices every month' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘሌዋውያን 19፡2 “እኔ እግዚአብሔር አምላካችሁ ቅዱስ ነኝና እናንተ ቅዱሳን ሁኑ” ይላል።',
      en: 'Leviticus 19:2 states: "Ye shall be holy: for I the LORD your God am holy."',
    },
    evidence: {
      verseId: 'd45968c5-4241-5dd0-a94c-c9181768d892',
      quoteAm: 'እኔ እግዚአብሔር አምላካችሁ ቅዱስ ነኝና እናንተ ቅዱሳን ሁኑ',
    },
    excerpt: {
      am: '“ለእስራኤል ልጆች ማኅበር ሁሉ እንዲህ በላቸው፦',
      en: 'Speak unto all the congregation of the children of Israel, and say unto them,',
    },
  },

  // 2: am-joshua-6-16 -> c (trivia)
  {
    passageId: 'am-joshua-6-16',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ኢያሱ 16፡4 መሠረት ርስታቸውን የወረሱት የዮሴፍ ልጆች እነማን ናቸው?',
      en: 'According to Joshua 16:4, which children of Joseph took their inheritance?',
    },
    options: [
      { key: 'a', text: { am: 'ሮቤልና ስምዖን', en: 'Reuben and Simeon' } },
      { key: 'b', text: { am: 'ይሁዳና ብንያም', en: 'Judah and Benjamin' } },
      { key: 'c', text: { am: 'ምናሴና ኤፍሬም', en: 'Manasseh and Ephraim' } },
      { key: 'd', text: { am: 'ዛብሎንና ንፍታሌም', en: 'Zebulun and Naphtali' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ኢያሱ 16፡4 “የዮሴፍም ልጆች ምናሴና ኤፍሬም ርስታቸውን ወረሱ” ይላል።',
      en: 'Joshua 16:4 states: "So the children of Joseph, Manasseh and Ephraim, took their inheritance."',
    },
    evidence: {
      verseId: '206d2471-1588-56ed-a01e-9ae3cc4bef09',
      quoteAm: 'ምናሴና ኤፍሬም',
    },
    excerpt: null,
  },

  // 3: am-first-chronicles-13-15 -> d (finish-the-verse)
  {
    passageId: 'am-first-chronicles-13-15',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ዜና መዋዕል ቀዳማዊ 15፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “ዳዊትም በከተማው ለራሱ ቤቶችን ሠራ፤ ለእግዚአብሔርም ታቦት ስፍራ አዘጋጀ፤ ___”',
      en: 'Complete the verse in 1 Chronicles 15:1: "And David made him houses in the city of David, and prepared a place for the ark of God, and ___"',
    },
    options: [
      { key: 'a', text: { am: 'መሠዊያም አቆመ', en: 'and set up an altar' } },
      { key: 'b', text: { am: 'የወርቅ ሳጥን አደረገ', en: 'and made a chest of gold' } },
      { key: 'c', text: { am: 'ካህናቱንም ሰበሰበ', en: 'and gathered the priests' } },
      { key: 'd', text: { am: 'ድንኳንም ተከለላት', en: 'pitched for it a tent' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በ1 ዜና መዋዕል 15፡1 “ዳዊትም በከተማው ለራሱ ቤቶችን ሠራ፤ ለእግዚአብሔርም ታቦት ስፍራ አዘጋጀ፤ ድንኳንም ተከለላት” ይላል።',
      en: '1 Chronicles 15:1 reads: "And David made him houses in the city of David, and prepared a place for the ark of God, and pitched for it a tent."',
    },
    evidence: {
      verseId: '5e1eb251-0c42-5983-ab8b-c0f8e2b4d0ea',
      quoteAm: 'ድንኳንም ተከለላት',
    },
    excerpt: {
      am: 'ዳዊትም በከተማው ለራሱ ቤቶችን ሠራ፤ ለእግዚአብሔርም ታቦት ስፍራ አዘጋጀ፤',
      en: 'And David made him houses in the city of David, and prepared a place for the ark of God, and',
    },
  },

  // 4: am-enoch-16-27 -> a (trivia)
  {
    passageId: 'am-enoch-16-27',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ሄኖክ 27፡1 መሠረት በኃጥኣን ወራት ምን እንደሚሆን ተጽፏል?',
      en: 'According to Enoch 27:1, what happens to the winters in the days of the sinners?',
    },
    options: [
      { key: 'a', text: { am: 'ክረምቶች ያጥራሉ', en: 'their years shall be shortened' } },
      { key: 'b', text: { am: 'ክረምቶች ይረዝማሉ', en: 'their winters shall lengthen' } },
      { key: 'c', text: { am: 'ዝናብ ያለ ልክ ይዘንባል', en: 'rain shall fall without measure' } },
      { key: 'd', text: { am: 'ቀናት ሁሉ ይጨልማሉ', en: 'all days shall darken' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ሄኖክ 27፡1 “በኃጥኣንም ወራት ክረምቶች ያጥራሉ፤ በእርሻቸውና በመሰምሪያቸው ያለ አዝመራቸውም በኋላ ይደርሳል” ይላል።',
      en: 'Enoch 27:1 states that in the days of the sinners their years and seasons shall be altered.',
    },
    evidence: {
      verseId: '30452c73-f64b-5cd2-a611-feddb8fc4133',
      quoteAm: 'ክረምቶች ያጥራሉ',
    },
    excerpt: null,
  },

  // 5: am-first-meqabyan-24-15 -> b (finish-the-verse)
  {
    passageId: 'am-first-meqabyan-24-15',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 15፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “ያንጊዜም የምድያም ሰዎች በጠላትነት ተነሡባቸው፤ እስራኤልንም ይወጓቸው ዘንድ ሠራዊቶቻቸውን አስነሡባቸው፤ ___”',
      en: 'Complete the verse in 1 Meqabyan 15:1: "At that time the men of Midian rose up in enmity against them, and stirred up their host to fight against Israel: ___"',
    },
    options: [
      { key: 'a', text: { am: 'የንጉሣቸውም ስሙ አንቲኦኮስ ይባላል', en: 'and the name of their king was Antiochus' } },
      { key: 'b', text: { am: 'የንጉሣቸውም ስሙ አክራንድዮስ ይባላል', en: 'and the name of their king was Akrandyos' } },
      { key: 'c', text: { am: 'የንጉሣቸውም ስሙ አርዮክ ይባላል', en: 'and the name of their king was Arioch' } },
      { key: 'd', text: { am: 'የንጉሣቸውም ስሙ ዴሜጥሮስ ይባላል', en: 'and the name of their king was Demetrius' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ መቃብያን ቀዳማዊ 15፡1 “የንጉሣቸውም ስሙ አክራንድዮስ ይባላል፤ የሶርያንና የኪልቅያን፥ የደማስቆንም ብዙ ሠራዊት በጧት ሰበሰበ” ይላል።',
      en: '1 Meqabyan 15:1 records the name of their king as Akrandyos.',
    },
    evidence: {
      verseId: 'c3da9e6e-60ac-5647-aeee-877477365373',
      quoteAm: 'የንጉሣቸውም ስሙ አክራንድዮስ ይባላል',
    },
    excerpt: {
      am: 'ያንጊዜም የምድያም ሰዎች በጠላትነት ተነሡባቸው፤ እስራኤልንም ይወጓቸው ዘንድ ሠራዊቶቻቸውን አስነሡባቸው፤',
      en: 'At that time the men of Midian rose up in enmity against them, and stirred up their host to fight against Israel:',
    },
  },

  // 6: am-acts-59-15 -> c (trivia)
  {
    passageId: 'am-acts-59-15',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በየሐዋርያት ሥራ 15፡1 መሠረት ከይሁዳ የወረዱት ሰዎች ወንድሞችን ምን እያሉ ያስተምሩ ነበር?',
      en: 'According to Acts 15:1, what did the men which came down from Judaea teach the brethren?',
    },
    options: [
      { key: 'a', text: { am: 'ወደ ኢየሩሳሌም ካልወጣችሁ ልትድኑ አትችሉም', en: 'except ye go up to Jerusalem ye cannot be saved' } },
      { key: 'b', text: { am: 'መሥዋዕት ካላቀረባችሁ በረከት አታገኙም', en: 'except ye sacrifice ye have no blessing' } },
      { key: 'c', text: { am: 'እንደ ሙሴ ሕግ ካልተገዘራችሁ ልትድኑ አትችሉም', en: 'Except ye be circumcised after the manner of Moses, ye cannot be saved' } },
      { key: 'd', text: { am: 'የአባቶችን ወግ ካልጠበቃችሁ አትከብሩም', en: 'except ye keep elders’ tradition ye cannot be honored' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በየሐዋርያት ሥራ 15፡1 “ከይሁዳ ሀገርም የወረዱ ሰዎች፥ “እንደ ሙሴ ሕግ ካልተገዘራችሁ ልትድኑ አትችሉም” እያሉ ወንድሞችን ያስተምሩ ነበር” ይላል።',
      en: 'Acts 15:1 states: "And certain men which came down from Judaea taught the brethren, and said, Except ye be circumcised after the manner of Moses, ye cannot be saved."',
    },
    evidence: {
      verseId: '7775a5b8-4fae-51aa-a11b-40f8f248ce4c',
      quoteAm: 'እንደ ሙሴ ሕግ ካልተገዘራችሁ ልትድኑ አትችሉም',
    },
    excerpt: null,
  },

  // 7: am-exodus-2-13 -> d (finish-the-verse)
  {
    passageId: 'am-exodus-2-13',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘፀአት 13፡2 ያለውን ኃይለ ቃል ያሟሉ፦ “በእስራኤል ልጆች ዘንድ ከሰውም፥ ከእንስሳም መጀመሪያ የተወለደውን ማሕፀንን የሚከፍት በኵር ሁሉ ለእኔ ለይልኝ፤ ___”',
      en: 'Complete the verse in Exodus 13:2: "Sanctify unto me all the firstborn, whatsoever openeth the womb among the children of Israel, both of man and of beast: ___"',
    },
    options: [
      { key: 'a', text: { am: 'የካህኑ ድርሻ ነው', en: 'it is the priest’s portion' } },
      { key: 'b', text: { am: 'የመሠዊያው በረከት ነው', en: 'it is the blessing of the altar' } },
      { key: 'c', text: { am: 'የተቀደሰ ስጦታ ነው', en: 'it is a holy gift' } },
      { key: 'd', text: { am: 'የእኔ ነው።', en: 'it is mine' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በኦሪት ዘፀአት 13፡2 “በእስራኤል ልጆች ዘንድ ከሰውም፥ ከእንስሳም መጀመሪያ የተወለደውን ማሕፀንን የሚከፍት በኵር ሁሉ ለእኔ ለይልኝ፤ የእኔ ነው” ይላል።',
      en: 'Exodus 13:2 records: "Sanctify unto me all the firstborn, whatsoever openeth the womb among the children of Israel, both of man and of beast: it is mine."',
    },
    evidence: {
      verseId: '82f81bf4-8ee6-5f4d-a574-34780c444f52',
      quoteAm: 'የእኔ ነው።',
    },
    excerpt: {
      am: 'በእስራኤል ልጆች ዘንድ ከሰውም፥ ከእንስሳም መጀመሪያ የተወለደውን ማሕፀንን የሚከፍት በኵር ሁሉ ለእኔ ለይልኝ፤',
      en: 'Sanctify unto me all the firstborn, whatsoever openeth the womb among the children of Israel, both of man and of beast:',
    },
  },

  // 8: am-numbers-4-21 -> a (trivia)
  {
    passageId: 'am-numbers-4-21',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘኍልቍ 21፡3 መሠረት ከነዓናውያንን ካጠፉ በኋላ የዚያን ስፍራ ስም ማን ብለው ጠሩት?',
      en: 'According to Numbers 21:3, what did they call the name of the place after destroying the Canaanites?',
    },
    options: [
      { key: 'a', text: { am: '“ሕርም” ብለው ጠሩት', en: 'called the name of the place Hormah' } },
      { key: 'b', text: { am: '“መካነ ውዕየት” ብለው ጠሩት', en: 'called the name Taberah' } },
      { key: 'c', text: { am: '“ጊልጋል” ብለው ጠሩት', en: 'called the name Gilgal' } },
      { key: 'd', text: { am: '“ኤሊም” ብለው ጠሩት', en: 'called the name Elim' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በኦሪት ዘኍልቍ 21፡3 “እነርሱንም፥ ከተሞቻቸውንም ሕርም ብለው አጠፉአቸው፤ የዚያን ስፍራ ስም “ሕርም” ብለው ጠሩት” ይላል።',
      en: 'Numbers 21:3 states: "and they utterly destroyed them and their cities: and he called the name of the place Hormah."',
    },
    evidence: {
      verseId: 'b568bfa0-0dca-5093-a4e1-ed5d0a91aef8',
      quoteAm: '“ሕርም” ብለው ጠሩት',
    },
    excerpt: null,
  },

  // 9: am-deuteronomy-5-12 -> b (finish-the-verse)
  {
    passageId: 'am-deuteronomy-5-12',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በኦሪት ዘዳግም 12፡3 ያለውን ኃይለ ቃል ያሟሉ፦ “መሠዊያቸውንም አፍርሱ፤ ሐውልቶቻቸውንም ሰባብሩ፤ የማምለኪያ ዐጸዶቻቸውንም ቁረጡ፤ ___”',
      en: 'Complete the verse in Deuteronomy 12:3: "And ye shall overthrow their altars, and break their pillars, and burn their groves with fire; and ___"',
    },
    options: [
      { key: 'a', text: { am: 'ወርቃቸውንና ብራቸውን ውሰዱ', en: 'take their silver and gold' } },
      { key: 'b', text: { am: 'የአማልክቶቻቸውንም ምስሎች በእሳት አቃጥሉ', en: 'ye shall burn the graven images of their gods with fire' } },
      { key: 'c', text: { am: 'ቤቶቻቸውንም በሙሉ ደምስሱ', en: 'utterly destroy their dwellings' } },
      { key: 'd', text: { am: 'ለካህናቱ ምንም አትስጡ', en: 'give nothing unto their priests' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በኦሪት ዘዳግም 12፡3 “መሠዊያቸውንም አፍርሱ፤ ሐውልቶቻቸውንም ሰባብሩ፤ የማምለኪያ ዐጸዶቻቸውንም ቁረጡ፤ የአማልክቶቻቸውንም ምስሎች በእሳት አቃጥሉ” ይላል።',
      en: 'Deuteronomy 12:3 commands: "And ye shall overthrow their altars, and break their pillars, and burn their groves with fire; and ye shall hew down the graven images of their gods."',
    },
    evidence: {
      verseId: 'c0783df6-0063-5b1f-a91b-44ca90ffb18f',
      quoteAm: 'የአማልክቶቻቸውንም ምስሎች በእሳት አቃጥሉ',
    },
    excerpt: {
      am: 'መሠዊያቸውንም አፍርሱ፤ ሐውልቶቻቸውንም ሰባብሩ፤ የማምለኪያ ዐጸዶቻቸውንም ቁረጡ፤',
      en: 'And ye shall overthrow their altars, and break their pillars, and burn their groves with fire; and',
    },
  },

  // 10: am-judges-7-12 -> c (trivia)
  {
    passageId: 'am-judges-7-12',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ መሳፍንት 12፡4 መሠረት ዮፍታሔም የገለዓድን ሰዎች ሁሉ ሰብስቦ ከማን ጋር ተዋጋ?',
      en: 'According to Judges 12:4, with whom did Jephthah and the men of Gilead fight?',
    },
    options: [
      { key: 'a', text: { am: 'ከአሞራውያን ጋር ተዋጋ', en: 'fought with the Amorites' } },
      { key: 'b', text: { am: 'ከምድያማውያን ጋር ተዋጋ', en: 'fought with the Midianites' } },
      { key: 'c', text: { am: 'ከኤፍሬምም ጋር ተዋጋ', en: 'fought with Ephraim' } },
      { key: 'd', text: { am: 'ከሞአባውያን ጋር ተዋጋ', en: 'fought with the Moabites' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ መሳፍንት 12፡4 “ዮፍታሔም የገለዓድን ሰዎች ሁሉ ሰበሰበ፤ ከኤፍሬምም ጋር ተዋጋ” ይላል።',
      en: 'Judges 12:4 states: "Then Jephthah gathered together all the men of Gilead, and fought with Ephraim."',
    },
    evidence: {
      verseId: '4f9ab41a-b11c-5ec1-a854-8e3fe318e6e6',
      quoteAm: 'ከኤፍሬምም ጋር ተዋጋ',
    },
    excerpt: null,
  },

  // 11: am-second-chronicles-14-11 -> d (finish-the-verse)
  {
    passageId: 'am-second-chronicles-14-11',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ዜና መዋዕል ካልዕ 11፡5 ያለውን ኃይለ ቃል ያሟሉ፦ “ሮብዓምም በኢየሩሳሌም ተቀመጠ፤ ___”',
      en: 'Complete the verse in 2 Chronicles 11:5: "And Rehoboam dwelt in Jerusalem, and ___"',
    },
    options: [
      { key: 'a', text: { am: 'ከግብፅም ጋር ታላቅ ሰላም አደረገ', en: 'made great peace with Egypt' } },
      { key: 'b', text: { am: 'የእስራኤልን ነገዶች በሙሉ ሰበሰበ', en: 'gathered all tribes of Israel' } },
      { key: 'c', text: { am: 'የሠራዊቱን አለቆች ሾመ', en: 'appointed captains of his host' } },
      { key: 'd', text: { am: 'በይሁዳም የተመሸጉትን ከተሞች ሠራ', en: 'built cities for defence in Judah' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በ2 ዜና መዋዕል 11፡5 “ሮብዓምም በኢየሩሳሌም ተቀመጠ፤ በይሁዳም የተመሸጉትን ከተሞች ሠራ” ይላል።',
      en: '2 Chronicles 11:5 states: "And Rehoboam dwelt in Jerusalem, and built cities for defence in Judah."',
    },
    evidence: {
      verseId: '70fe16f4-0cee-58d4-ad31-f5a045b4a6fb',
      quoteAm: 'በይሁዳም የተመሸጉትን ከተሞች ሠራ',
    },
    excerpt: {
      am: 'ሮብዓምም በኢየሩሳሌም ተቀመጠ፤',
      en: 'And Rehoboam dwelt in Jerusalem, and',
    },
  },

  // 12: am-jubilees-15-11 -> a (trivia)
  {
    passageId: 'am-jubilees-15-11',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'challenge',
    prompt: {
      am: 'በመጽሐፈ ኩፋሌ 11፡1 መሠረት አብራም በስድሳኛው ዓመቱ ሌሊት ተነሥቶ ምን አደረገ?',
      en: 'According to Jubilees 11:1, what did Abram do in his sixtieth year when he arose by night?',
    },
    options: [
      { key: 'a', text: { am: 'የጣዖታቱን ቤት አቃጠለ', en: 'burned the house of the idols' } },
      { key: 'b', text: { am: 'ወደ ካራን ምድር ተጓዘ', en: 'journeyed unto the land of Haran' } },
      { key: 'c', text: { am: 'አዲስ መሠዊያ ቀደሰ', en: 'sanctified a new altar' } },
      { key: 'd', text: { am: 'ከከነዓን ሰዎች ጋር ተነጋገረ', en: 'spoke with the men of Canaan' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመጽሐፈ ኩፋሌ 11፡1 “አብራም ሌሊት ተነሥቶ የጣዖታቱን ቤት አቃጠለ” ይላል።',
      en: 'Jubilees 11:1 records Abram rising by night and burning the house of idols.',
    },
    evidence: {
      verseId: '38c8bb43-af97-5eb9-a355-84c795319e18',
      quoteAm: 'የጣዖታቱን ቤት አቃጠለ',
    },
    excerpt: null,
  },

  // 13: am-tobit-21-9 -> b (finish-the-verse)
  {
    passageId: 'am-tobit-21-9',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ጦቢት 9፡5 ያለውን ኃይለ ቃል ያሟሉ፦ “ሩፋኤልም ሄደ፤ በገባኤልም ቤት አደረ፤ ደብዳቤውንም ሰጠው፤ ___”',
      en: 'Complete the verse in Tobit 9:5: "So Raphael went out, and lodged with Gabael, and gave him the handwriting: who ___"',
    },
    options: [
      { key: 'a', text: { am: 'የሰርጉንም በዓል አብረው አከበሩ', en: 'and celebrated the feast of marriage together' } },
      { key: 'b', text: { am: 'እነዚያንም ከረጢቶች እንደታተሙ አምጥቶ ለሩፋኤል ሰጠው', en: 'brought forth bags which were sealed up, and gave them to him' } },
      { key: 'c', text: { am: 'ወዲያውም ወደ ጦቢት ቤት ተመለሰ', en: 'and returned straightway unto the house of Tobit' } },
      { key: 'd', text: { am: 'የብሩን መክሊት በሙሉ ለካህናቱ ሰጠ', en: 'and delivered the talents of silver unto the priests' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ ጦቢት 9፡5 “ሩፋኤልም ሄደ፤ በገባኤልም ቤት አደረ፤ ደብዳቤውንም ሰጠው፤ እነዚያንም ከረጢቶች እንደታተሙ አምጥቶ ለሩፋኤል ሰጠው” ይላል።',
      en: 'Tobit 9:5 states: "who brought forth bags which were sealed up, and gave them to him."',
    },
    evidence: {
      verseId: 'f5bfc810-d694-560f-a759-c6756782a9b9',
      quoteAm: 'እነዚያንም ከረጢቶች እንደታተሙ አምጥቶ ለሩፋኤል ሰጠው',
    },
    excerpt: {
      am: 'ሩፋኤልም ሄደ፤ በገባኤልም ቤት አደረ፤ ደብዳቤውንም ሰጠው፤',
      en: 'So Raphael went out, and lodged with Gabael, and gave him the handwriting: who',
    },
  },

  // 14: am-judith-22-8 -> c (trivia)
  {
    passageId: 'am-judith-22-8',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ዮዲት 8፡4 መሠረት ዮዲት መበለት ሆና በቤቷ ስንት ጊዜ ተቀመጠች?',
      en: 'According to Judith 8:4, how long was Judith a widow in her house?',
    },
    options: [
      { key: 'a', text: { am: 'ሰባት ዓመት ሙሉ', en: 'seven full years' } },
      { key: 'b', text: { am: 'ሁለት ዓመት ከስድስት ወር', en: 'two years and six months' } },
      { key: 'c', text: { am: 'ሦስት ዓመት ከአራት ወር', en: 'three years and four months' } },
      { key: 'd', text: { am: 'አምስት ዓመት', en: 'five years' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ ዮዲት 8፡4 “ዮዲትም መበለት ሆና ሦስት ዓመት ከአራት ወር በቤትዋ ተቀመጠች” ይላል።',
      en: 'Judith 8:4 records: "And she was a widow in her house three years and four months."',
    },
    evidence: {
      verseId: '9734efd4-a4fc-5daa-a15f-1664057c75c5',
      quoteAm: 'ሦስት ዓመት ከአራት ወር',
    },
    excerpt: null,
  },

  // 15: am-job-27-8 -> d (finish-the-verse)
  {
    passageId: 'am-job-27-8',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ኢዮብ 8፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “አውኬናዊው በልዳዶስ መለሰ፥ ___”',
      en: 'Complete the verse in Job 8:1: "Then answered Bildad the Shuhite, and ___"',
    },
    options: [
      { key: 'a', text: { am: 'በፍርሃትም ዝም አለ', en: 'and held his peace in fear' } },
      { key: 'b', text: { am: 'ፈጽሞም አለቀሰ', en: 'and wept bitterly' } },
      { key: 'c', text: { am: 'ድምፁን ከፍ አደረገ', en: 'and lifted up his voice' } },
      { key: 'd', text: { am: 'እንዲህም አለ', en: 'and said' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በመጽሐፈ ኢዮብ 8፡1 “አውኬናዊው በልዳዶስ መለሰ፥ እንዲህም አለ” ይላል።',
      en: 'Job 8:1 opens: "Then answered Bildad the Shuhite, and said."',
    },
    evidence: {
      verseId: '026e45ed-f91d-5ee2-acf7-67a8f928f052',
      quoteAm: 'እንዲህም አለ',
    },
    excerpt: {
      am: 'አውኬናዊው በልዳዶስ መለሰ፥',
      en: 'Then answered Bildad the Shuhite, and',
    },
  },

  // 16: am-psalms-28-5 -> a (trivia)
  {
    passageId: 'am-psalms-28-5',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'beginner',
    prompt: {
      am: 'በመዝሙረ ዳዊት 5፡1 መሠረት ዳዊት እግዚአብሔር ቃሉን እንዲያደምጥና ምንን እንዲያስተውል ጸለየ?',
      en: 'According to Psalm 5:1, what did David pray for the LORD to consider?',
    },
    options: [
      { key: 'a', text: { am: 'ጩኸቴንም አስተውል', en: 'consider my meditation' } },
      { key: 'b', text: { am: 'መሥዋዕቴን ተቀበል', en: 'accept my offering' } },
      { key: 'c', text: { am: 'ምሕረትህን ላክ', en: 'send thy mercy' } },
      { key: 'd', text: { am: 'መንገዴን ጠብቅ', en: 'keep my ways' } },
    ],
    correctKey: 'a',
    explanation: {
      am: 'በመዝሙረ ዳዊት 5፡1 “አቤቱ ቃሌን አድምጥ ጩኸቴንም አስተውል” ተብሎ ተጽፏል።',
      en: 'Psalm 5:1 states: "Give ear to my words, O LORD, consider my meditation."',
    },
    evidence: {
      verseId: 'fc66366a-bdaa-5b75-a255-e99e1c7e61ae',
      quoteAm: 'ጩኸቴንም አስተውል',
    },
    excerpt: null,
  },

  // 17: am-wisdom-31-3 -> b (finish-the-verse)
  {
    passageId: 'am-wisdom-31-3',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ ጥበብ 3፡1 ያለውን ኃይለ ቃል ያሟሉ፦ “የጻድቃን ነፍስ ግን በእግዚአብሔር እጅ ናት፤ ___”',
      en: 'Complete the verse in Wisdom 3:1: "But the souls of the righteous are in the hand of God, and ___"',
    },
    options: [
      { key: 'a', text: { am: 'ከሞትም አያመልጡም', en: 'shall not escape death' } },
      { key: 'b', text: { am: 'መከራም አያገኛቸውም', en: 'there shall no torment touch them' } },
      { key: 'c', text: { am: 'በምድርም ብቻ ይኖራሉ', en: 'dwell only upon earth' } },
      { key: 'd', text: { am: 'ተስፋቸውም ይጠፋል', en: 'their hope shall perish' } },
    ],
    correctKey: 'b',
    explanation: {
      am: 'በመጽሐፈ ጥበብ 3፡1 “የጻድቃን ነፍስ ግን በእግዚአብሔር እጅ ናት፤ መከራም አያገኛቸውም” ይላል።',
      en: 'Wisdom 3:1 declares: "But the souls of the righteous are in the hand of God, and there shall no torment touch them."',
    },
    evidence: {
      verseId: '183dbf52-c570-542b-a788-2b860392dd33',
      quoteAm: 'መከራም አያገኛቸውም',
    },
    excerpt: {
      am: 'የጻድቃን ነፍስ ግን በእግዚአብሔር እጅ ናት፤',
      en: 'But the souls of the righteous are in the hand of God, and',
    },
  },

  // 18: am-ecclesiastes-32-2 -> c (trivia)
  {
    passageId: 'am-ecclesiastes-32-2',
    game: 'trivia',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በመጽሐፈ መክብብ 2፡4 መሠረት ሰባኪው ሥራውን ሲያበዛ ለራሱ ምን እንደ ሠራ ተናገረ?',
      en: 'According to Ecclesiastes 2:4, what did the preacher build for himself when he made great works?',
    },
    options: [
      { key: 'a', text: { am: 'ታላላቅ መርከቦችን ሠራሁ', en: 'made great ships' } },
      { key: 'b', text: { am: 'የወርቅ ቤተ መቅደስ ሠራሁ', en: 'built a golden temple' } },
      { key: 'c', text: { am: 'ቤቶችንም ለእኔ ሠራሁ', en: 'I builded me houses' } },
      { key: 'd', text: { am: 'የድንጋይ ቅጥሮችን አቆምሁ', en: 'set up walls of stone' } },
    ],
    correctKey: 'c',
    explanation: {
      am: 'በመጽሐፈ መክብብ 2፡4 “እኔ ሥራዬን አበዛሁ፥ ቤቶችንም ለእኔ ሠራሁ፥ ወይንም ተከልሁ” ይላል።',
      en: 'Ecclesiastes 2:4 states: "I made me great works; I builded me houses; I planted me vineyards."',
    },
    evidence: {
      verseId: '95a7bb28-663d-5ce9-ac06-9ffcdd180334',
      quoteAm: 'ቤቶችንም ለእኔ ሠራሁ',
    },
    excerpt: null,
  },

  // 19: am-isaiah-35-1 -> d (finish-the-verse)
  {
    passageId: 'am-isaiah-35-1',
    game: 'finish-the-verse',
    category: 'Bible',
    difficulty: 'growing',
    prompt: {
      am: 'በትንቢተ ኢሳይያስ 1፡3 ያለውን ኃይለ ቃል ያሟሉ፦ “በሬ ገዢውን አህያም የጌታውን ጋጥ ዐወቀ፤ ___”',
      en: 'Complete the verse in Isaiah 1:3: "The ox knoweth his owner, and the ass his master’s crib: but ___"',
    },
    options: [
      { key: 'a', text: { am: 'ከመንገዴም ፈጽመው አልራቁም', en: 'departed not from my way' } },
      { key: 'b', text: { am: 'ስሜንም ሁልጊዜ ጠሩ', en: 'called upon my name alway' } },
      { key: 'c', text: { am: 'በመቅደሴም ደስ አላቸው', en: 'rejoiced in my sanctuary' } },
      { key: 'd', text: { am: 'እስራኤል ግን አላወቁኝም፤ ሕዝቤም አላስተዋሉኝም', en: 'Israel doth not know, my people doth not consider' } },
    ],
    correctKey: 'd',
    explanation: {
      am: 'በትንቢተ ኢሳይያስ 1፡3 “በሬ ገዢውን አህያም የጌታውን ጋጥ ዐወቀ፤ እስራኤል ግን አላወቁኝም፤ ሕዝቤም አላስተዋሉኝም” ተብሎ ተጽፏል።',
      en: 'Isaiah 1:3 declares: "The ox knoweth his owner, and the ass his master’s crib: but Israel doth not know, my people doth not consider."',
    },
    evidence: {
      verseId: 'c19b4958-a81a-526c-a3ce-4fa98d28782e',
      quoteAm: 'እስራኤል ግን አላወቁኝም፤ ሕዝቤም አላስተዋሉኝም',
    },
    excerpt: {
      am: 'በሬ ገዢውን አህያም የጌታውን ጋጥ ዐወቀ፤',
      en: 'The ox knoweth his owner, and the ass his master’s crib: but',
    },
  },
]

async function run() {
  console.log('=== VALIDATING BATCH 015 ===')
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
  console.log('Batch 015 successfully generated, validated, and ingested into the library!')
}

run().catch((err) => {
  console.error(err)
  process.exit(1)
})

