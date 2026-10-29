import type { MatchPair, PlayQuestion, WhoAmICard } from './types'

const bible = (label: string, route: string) => ({ label, route, kind: 'bible' as const })
const library = (label: string, route: string) => ({ label, route, kind: 'church-library' as const })

const option = (key: string, en: string, am?: string) => ({ key, text: { en, ...(am ? { am } : {}) } })

export const APPROVED_QUESTIONS: PlayQuestion[] = [
  {
    id: 'trivia-genesis-1-1', game: 'trivia', category: 'Bible', difficulty: 'beginner',
    prompt: { en: 'According to Genesis 1:1, what did God create in the beginning?', am: 'በዘፍጥረት 1፥1 መሠረት እግዚአብሔር በመጀመሪያ ምን ፈጠረ?' },
    options: [option('a', 'The heavens and the earth', 'ሰማይንና ምድርን'), option('b', 'Only the sea', 'ባሕርን ብቻ'), option('c', 'The city of Jerusalem', 'ኢየሩሳሌምን'), option('d', 'The ark', 'መርከቢቱን')], correctKey: 'a',
    explanation: { en: 'Genesis opens by declaring that God created the heavens and the earth.', am: 'ዘፍጥረት እግዚአብሔር ሰማይንና ምድርን እንደፈጠረ በመግለጽ ይጀምራል።' },
    source: bible('Genesis 1:1', '/bible/genesis/1'), verifiedLocales: ['en', 'am'],
  },
  {
    id: 'trivia-noah-wood', game: 'trivia', category: 'Biblical events', difficulty: 'growing',
    prompt: { en: 'What material was Noah told to use for the ship?', am: 'ኖኅ መርከቢቱን ከምን እንዲሠራ ታዘዘ?' },
    options: [option('a', 'Stone', 'ድንጋይ'), option('b', 'Gopher wood', 'ዕንጨት'), option('c', 'Bronze', 'ናስ'), option('d', 'Clay', 'ጭቃ')], correctKey: 'b',
    explanation: { en: 'Genesis 6:14 records the command to make the ship of gopher wood and seal it with pitch.', am: 'ዘፍጥረት 6፥14 መርከቢቱ ከዕንጨት ተሠርታ በቅጥራን እንድትለቀለቅ ይናገራል።' },
    source: bible('Genesis 6:14', '/bible/genesis/6'), verifiedLocales: ['en', 'am'],
  },
  {
    id: 'trivia-red-sea', game: 'trivia', category: 'Miracles', difficulty: 'beginner',
    prompt: { en: 'Who stretched out his hand over the sea before the waters divided?', am: 'ውኃው ከመከፈሉ በፊት በባሕሩ ላይ እጁን የዘረጋው ማን ነው?' },
    options: [option('a', 'Aaron', 'አሮን'), option('b', 'Joshua', 'ኢያሱ'), option('c', 'Moses', 'ሙሴ'), option('d', 'David', 'ዳዊት')], correctKey: 'c',
    explanation: { en: 'Exodus 14:21 says Moses stretched out his hand and the waters were divided.', am: 'ዘፀአት 14፥21 ሙሴ እጁን ከዘረጋ በኋላ ውኃው እንደተከፈለ ይገልጻል።' },
    source: bible('Exodus 14:21', '/bible/exodus/14'), verifiedLocales: ['en', 'am'],
  },
  {
    id: 'trivia-david-stone', game: 'trivia', category: 'Biblical people', difficulty: 'beginner',
    prompt: { en: 'What did David take from his bag before striking the Philistine?', am: 'ዳዊት ፍልስጥኤማዊውን ከመምታቱ በፊት ከኮሮጆው ምን ወሰደ?' },
    options: [option('a', 'A stone', 'ድንጋይ'), option('b', 'A scroll', 'መጽሐፍ'), option('c', 'A crown', 'አክሊል'), option('d', 'A lamp', 'መብራት')], correctKey: 'a',
    explanation: { en: 'David took a stone and used his sling, as recorded in 1 Samuel 17:49.', am: '1ኛ ሳሙኤል 17፥49 ዳዊት ድንጋይ ወስዶ እንደወነጨፈው ይናገራል።' },
    source: bible('1 Samuel 17:49', '/bible/1-samuel/17'), verifiedLocales: ['en', 'am'],
  },
  {
    id: 'trivia-daniel-lions', game: 'trivia', category: 'Biblical people', difficulty: 'beginner',
    prompt: { en: 'What did God’s angel shut when Daniel was in danger?', am: 'ዳንኤል በአደጋ ጊዜ የእግዚአብሔር መልአክ ምን ዘጋ?' },
    options: [option('a', 'The palace doors', 'የቤተ መንግሥቱን በር'), option('b', 'The lions’ mouths', 'የአንበሶችን አፍ'), option('c', 'The city gates', 'የከተማውን በር'), option('d', 'The prison window', 'የእስር ቤቱን መስኮት')], correctKey: 'b',
    explanation: { en: 'Daniel testified that God sent an angel who shut the lions’ mouths.', am: 'ዳንኤል እግዚአብሔር መልአኩን ልኮ የአንበሶችን አፍ እንደዘጋ መሰከረ።' },
    source: bible('Daniel 6:22', '/bible/daniel/6'), verifiedLocales: ['en', 'am'],
  },
  {
    id: 'trivia-jonah', game: 'trivia', category: 'Biblical events', difficulty: 'beginner',
    prompt: { en: 'How long was Jonah in the belly of the great fish?' },
    options: [option('a', 'One day'), option('b', 'Two days'), option('c', 'Three days and three nights'), option('d', 'Seven days')], correctKey: 'c',
    explanation: { en: 'Jonah 1:17 records three days and three nights.' }, source: bible('Jonah 1:17', '/bible/jonah/1'), verifiedLocales: ['en'],
  },
  {
    id: 'trivia-loaves', game: 'trivia', category: 'Miracles', difficulty: 'beginner',
    prompt: { en: 'How many loaves did Christ take before feeding the multitude in Matthew 14?', am: 'በማቴዎስ 14 ሕዝቡ ከመመገቡ በፊት ጌታችን ስንት እንጀራ ወሰደ?' },
    options: [option('a', 'Two', 'ሁለት'), option('b', 'Five', 'አምስት'), option('c', 'Seven', 'ሰባት'), option('d', 'Twelve', 'አሥራ ሁለት')], correctKey: 'b',
    explanation: { en: 'Matthew 14:19 names five loaves and two fish.', am: 'ማቴዎስ 14፥19 አምስት እንጀራና ሁለት ዓሣ እንደነበሩ ይገልጻል።' },
    source: bible('Matthew 14:19', '/bible/matthew/14'), verifiedLocales: ['en', 'am'],
  },
  {
    id: 'trivia-cana', game: 'trivia', category: 'Miracles', difficulty: 'growing',
    prompt: { en: 'Where did Christ perform the beginning of His signs described in John 2?', am: 'በዮሐንስ 2 የተገለጸውን የተአምራት መጀመሪያ ጌታችን የት አደረገ?' },
    options: [option('a', 'Bethlehem', 'ቤተልሔም'), option('b', 'Cana of Galilee', 'ቃና ዘገሊላ'), option('c', 'Jericho', 'ኢያሪኮ'), option('d', 'Nazareth', 'ናዝሬት')], correctKey: 'b',
    explanation: { en: 'John 2:11 identifies Cana of Galilee.', am: 'ዮሐንስ 2፥11 ቦታውን ቃና ዘገሊላ ብሎ ይገልጻል።' },
    source: bible('John 2:11', '/bible/john/2'), verifiedLocales: ['en', 'am'],
  },
  {
    id: 'trivia-jesus-wept', game: 'trivia', category: 'Bible', difficulty: 'growing',
    prompt: { en: 'Which verse records “Jesus wept”?', am: '“ጌታችን ኢየሱስም እንባውን አፈሰሰ” የሚለው የትኛው ጥቅስ ነው?' },
    options: [option('a', 'John 11:35', 'ዮሐንስ 11፥35'), option('b', 'Genesis 1:1', 'ዘፍጥረት 1፥1'), option('c', 'Matthew 14:19', 'ማቴዎስ 14፥19'), option('d', 'Daniel 6:22', 'ዳንኤል 6፥22')], correctKey: 'a',
    explanation: { en: 'The words occur in John 11:35.', am: 'ይህ ቃል በዮሐንስ 11፥35 ይገኛል።' }, source: bible('John 11:35', '/bible/john/11'), verifiedLocales: ['en', 'am'],
  },
  {
    id: 'trivia-thomas', game: 'trivia', category: 'Biblical people', difficulty: 'challenge',
    prompt: { en: 'To whom did Christ say, “Blessed are those who have not seen, and have believed”?', am: '“ብፁዓንስ ሳያዩ የሚያምኑ ናቸው” የተባለው ለማን ነው?' },
    options: [option('a', 'Peter', 'ጴጥሮስ'), option('b', 'Thomas', 'ቶማስ'), option('c', 'Philip', 'ፊልጶስ'), option('d', 'Andrew', 'እንድርያስ')], correctKey: 'b',
    explanation: { en: 'John 20:29 is Christ’s response to Thomas.', am: 'ዮሐንስ 20፥29 ጌታችን ለቶማስ የሰጠውን መልስ ይመዘግባል።' }, source: bible('John 20:29', '/bible/john/20'), verifiedLocales: ['en', 'am'],
  },
  ...[
    ['sacraments-count', 'How many sacraments does the reviewed Church Library text enumerate?', ['Five', 'Seven', 'Nine', 'Twelve'], 1, 'Seven Sacraments — Introduction'],
    ['sacraments-first', 'Which sacrament does the source identify as the first?', ['Holy Matrimony', 'Baptism', 'Ordination', 'Penance'], 1, 'Seven Sacraments — Baptism'],
    ['sacraments-myron', 'Which sacrament is also called Myron?', ['Confirmation', 'Penance', 'Matrimony', 'Unction'], 0, 'Seven Sacraments — Confirmation'],
    ['sacraments-culmination', 'Which sacrament is described as the culmination of all sacraments?', ['Baptism', 'Holy Communion', 'Ordination', 'Penance'], 1, 'Seven Sacraments — Holy Communion'],
    ['sacraments-bishop', 'Which sacrament is conferred by a bishop only?', ['Baptism', 'Confirmation', 'Ordination', 'Unction'], 2, 'Seven Sacraments — Introduction'],
    ['sacraments-marriage', 'Which sacrament joins Christian marriage with the grace of the Holy Spirit?', ['Holy Matrimony', 'Penance', 'Ordination', 'Unction'], 0, 'Seven Sacraments — Holy Matrimony'],
    ['sacraments-penance', 'Which sacrament concerns remorse, repentance, and cleansing from sin?', ['Confirmation', 'Penance', 'Holy Communion', 'Ordination'], 1, 'Seven Sacraments — Penance'],
    ['sacraments-sick', 'Which sacrament is an anointing administered to the sick?', ['Baptism', 'Holy Matrimony', 'Unction of the Sick', 'Ordination'], 2, 'Seven Sacraments — Unction of the Sick'],
    ['sacraments-proverbs', 'Which biblical passage is cited for the image of seven pillars?', ['Proverbs 9:1', 'Genesis 1:1', 'John 11:35', 'Daniel 6:22'], 0, 'Seven Sacraments — Introduction'],
    ['sacraments-trinity', 'In whose name does the reviewed Baptism chapter say Baptism is performed?', ['The apostles', 'The Trinity', 'The prophets', 'The kings'], 1, 'Seven Sacraments — Baptism'],
  ].map(([id, prompt, choices, correct, label], index) => ({
    id: `trivia-${id}`, game: 'trivia' as const, category: 'Seven Sacraments', difficulty: (index < 3 ? 'beginner' : index < 7 ? 'growing' : 'challenge') as PlayQuestion['difficulty'],
    prompt: { en: prompt as string }, options: (choices as string[]).map((text, choiceIndex) => option(String(choiceIndex), text)) as PlayQuestion['options'], correctKey: String(correct),
    explanation: { en: `The reviewed ${label as string} section provides this answer.` },
    source: library(label as string, '/library/read/seven-sacraments'), verifiedLocales: ['en' as const],
  })),
  {
    id: 'emoji-noah', game: 'emoji', category: 'Bible stories', difficulty: 'beginner', emoji: '🧔 🚢 🌧️ 🕊️ 🌈',
    prompt: { en: 'Which biblical story do these clues represent?', am: 'እነዚህ ምልክቶች የትኛውን የመጽሐፍ ቅዱስ ታሪክ ያመለክታሉ?' },
    options: [option('a', 'Noah’s ship', 'የኖኅ መርከብ'), option('b', 'The Exodus', 'ዘፀአት'), option('c', 'David and Goliath', 'ዳዊትና ጎልያድ'), option('d', 'Daniel in the lions’ den', 'ዳንኤል በአንበሶች ጉድጓድ')], correctKey: 'a',
    hints: [{ en: 'A ship was built.', am: 'መርከብ ተሠራ።' }, { en: 'Rain and a dove are part of the story.', am: 'ዝናብና ርግብ የታሪኩ ክፍል ናቸው።' }, { en: 'Read Genesis 6.', am: 'ዘፍጥረት 6ን ያንብቡ።' }],
    explanation: { en: 'The ship clue is directly grounded in Genesis 6:14.', am: 'የመርከቡ ፍንጭ በዘፍጥረት 6፥14 ላይ የተመሠረተ ነው።' }, source: bible('Genesis 6:14', '/bible/genesis/6'), verifiedLocales: ['en', 'am'],
  },
  ...[
    ['red-sea', '🌊 🪄 🚶‍♂️ 🚶‍♀️', 'The crossing of the sea', 'Exodus 14:21', '/bible/exodus/14'],
    ['david', '👦 🪨 🎯 🛡️', 'David and Goliath', '1 Samuel 17:49', '/bible/1-samuel/17'],
    ['daniel', '👨 🙏 🦁 👼', 'Daniel in the lions’ den', 'Daniel 6:22', '/bible/daniel/6'],
    ['loaves', '5️⃣ 🍞 2️⃣ 🐟 👥', 'Feeding the multitude', 'Matthew 14:19', '/bible/matthew/14'],
    ['cana', '💧 ➡️ 🍷 💒', 'The sign at Cana', 'John 2:11', '/bible/john/2'],
  ].map(([id, emoji, answer, label, route], index) => ({
    id: `emoji-${id}`, game: 'emoji' as const, category: index < 3 ? 'Bible stories' : 'Miracles', difficulty: index < 2 ? 'beginner' as const : 'growing' as const, emoji,
    prompt: { en: 'Which biblical event do these clues represent?' },
    options: [option('a', answer), option('b', 'Noah’s ship'), option('c', 'The Nativity'), option('d', 'The Ascension')], correctKey: 'a',
    hints: [{ en: `The source is ${label}.` }, { en: 'Look at the people, objects, and action.' }, { en: `The answer begins with “${answer.split(' ')[0]}”.` }],
    explanation: { en: `These symbols summarize the event recorded at ${label}.` }, source: bible(label, route), verifiedLocales: ['en' as const],
  })),
  ...[
    ['genesis-1-1', 'In the beginning God created the heavens and the ___.', 'earth', ['sea', 'earth', 'garden', 'city'], 'Genesis 1:1', '/bible/genesis/1', 'በመጀመሪያ እግዚአብሔር ሰማይንና ___ ፈጠረ።', 'ምድርን', ['ባሕርን', 'ምድርን', 'ገነትን', 'ከተማን']],
    ['exodus-14-21', 'Moses stretched out his hand over the ___.', 'sea', ['mountain', 'sea', 'city', 'altar'], 'Exodus 14:21', '/bible/exodus/14', 'ሙሴም በ___ ላይ እጁን ዘረጋ።', 'ባሕሩ', ['ተራራው', 'ባሕሩ', 'ከተማው', 'መሠዊያው']],
    ['daniel-6-22', 'My God has sent his angel, and has shut the ___ mouths.', 'lions’', ['lions’', 'kings’', 'soldiers’', 'priests’'], 'Daniel 6:22', '/bible/daniel/6', 'አምላኬ መልአኩን ልኮ የ___ አፍ ዘጋ።', 'አንበሶችን', ['አንበሶችን', 'ነገሥታትን', 'ወታደሮችን', 'ካህናትን']],
    ['john-11-35', 'Jesus ___.', 'wept', ['slept', 'wept', 'departed', 'wrote'], 'John 11:35', '/bible/john/11', 'ጌታችን ኢየሱስም ___።', 'እንባውን አፈሰሰ', ['ተኛ', 'እንባውን አፈሰሰ', 'ሄደ', 'ጻፈ']],
    ['john-20-29', 'Blessed are those who have not seen, and have ___.', 'believed', ['forgotten', 'believed', 'returned', 'spoken'], 'John 20:29', '/bible/john/20', 'ብፁዓንስ ሳያዩ የ___ ናቸው።', 'ሚያምኑ', ['ሚረሱ', 'ሚያምኑ', 'ሚመለሱ', 'ሚናገሩ']],
  ].map(([id, prompt, answer, choices, label, route, amPrompt, amAnswer, amChoices], index) => ({
    id: `verse-${id}`, game: 'finish-the-verse' as const, category: 'Bible verses', difficulty: index < 2 ? 'beginner' as const : 'growing' as const,
    prompt: { en: prompt as string, am: amPrompt as string }, excerpt: { en: prompt as string, am: amPrompt as string },
    options: (choices as string[]).map((text, i) => option(String(i), text, (amChoices as string[])[i])) as PlayQuestion['options'], correctKey: String((choices as string[]).indexOf(answer as string)),
    explanation: { en: `The missing text is “${answer}.”`, am: `የጎደለው ቃል “${amAnswer as string}” ነው።` }, source: bible(label as string, route as string), verifiedLocales: ['en' as const, 'am' as const],
  })),
  ...[
    ['ezana', 'Which king is associated in the reviewed Ethiopia history with the establishment of Christianity in Aksum?', ['King Ezana', 'Emperor Zeno', 'King David', 'King Solomon'], 0, 'Ethiopia Church History — Chapter One'],
    ['frumentius', 'Which figure is traditionally associated with the early organization of the Church in Aksum?', ['Saint Frumentius', 'Saint Mark', 'Saint Paul', 'Saint Peter'], 0, 'Ethiopia Church History — Chapter One'],
    ['nicea', 'Which council met in AD 325 according to the reviewed world Church history?', ['Nicaea', 'Ephesus', 'Chalcedon', 'Jerusalem'], 0, 'World Church History — Councils'],
    ['constantinople', 'Which council followed Nicaea in AD 381?', ['Ephesus', 'Constantinople', 'Chalcedon', 'Trent'], 1, 'World Church History — Councils'],
    ['ephesus', 'Which council is associated with Saint Cyril’s opposition to Nestorius?', ['Nicaea', 'Ephesus', 'Constantinople', 'Antioch'], 1, 'World Church History — Chapter Six'],
    ['geez', 'Which language is highlighted as preserving Ethiopian manuscripts across generations?', ['Latin', 'Geʽez', 'French', 'Syriac'], 1, 'Ethiopia Church History — Chapter One'],
  ].map(([id, prompt, choices, correct, label], index) => ({
    id: `history-${id}`, game: 'history' as const, category: index < 2 || index === 5 ? 'Ethiopian Church history' : 'World Church history', difficulty: index < 2 ? 'beginner' as const : index < 5 ? 'growing' as const : 'challenge' as const,
    prompt: { en: prompt as string }, options: (choices as string[]).map((text, i) => option(String(i), text)) as PlayQuestion['options'], correctKey: String(correct),
    explanation: { en: `This answer is linked to the reviewed ${label as string} source section.` }, source: library(label as string, index < 2 || index === 5 ? '/library/read/church-history-ethiopia' : '/library/read/church-history-worldwide'), verifiedLocales: ['en' as const],
  })),
]

export const WHO_AM_I_CARDS: WhoAmICard[] = [
  ['moses', 'Moses', 'ሙሴ', 'I stretched out my hand over the sea, and the waters divided.', 'Exodus 14:21', '/bible/exodus/14'],
  ['david', 'David', 'ዳዊት', 'I used a stone and sling against the Philistine.', '1 Samuel 17:49', '/bible/1-samuel/17'],
  ['daniel', 'Daniel', 'ዳንኤል', 'God’s angel shut the lions’ mouths while I was in danger.', 'Daniel 6:22', '/bible/daniel/6'],
  ['thomas', 'Thomas', 'ቶማስ', 'Christ spoke to me about believing after seeing.', 'John 20:29', '/bible/john/20'],
  ['noah', 'Noah', 'ኖኅ', 'I was commanded to build a ship of wood and seal it with pitch.', 'Genesis 6:14', '/bible/genesis/6'],
  ['cana', 'Cana of Galilee', 'ቃና ዘገሊላ', 'The beginning of Christ’s signs in John took place here.', 'John 2:11', '/bible/john/2'],
].map(([id, en, am, explanation, label, route]) => ({ id, category: id === 'cana' ? 'biblical-locations' as const : 'biblical-people' as const, answer: { en, am }, explanation: { en: explanation }, source: bible(label, route), verifiedLocales: ['en', 'am'] }))

export const MATCH_PAIRS: MatchPair[] = [
  ['david', 'David', 'Stone and sling', '1 Samuel 17:49', '/bible/1-samuel/17'],
  ['moses', 'Moses', 'The divided sea', 'Exodus 14:21', '/bible/exodus/14'],
  ['daniel', 'Daniel', 'Lions’ mouths shut', 'Daniel 6:22', '/bible/daniel/6'],
  ['noah', 'Noah', 'The wooden ship', 'Genesis 6:14', '/bible/genesis/6'],
  ['baptism', 'Baptism', 'Rebirth and entry into the Kingdom of God', 'Seven Sacraments — Baptism', '/library/read/seven-sacraments'],
  ['myron', 'Confirmation (Myron)', 'Gift of the Holy Spirit', 'Seven Sacraments — Confirmation', '/library/read/seven-sacraments'],
  ['eucharist', 'Holy Communion', 'Culmination of the sacraments', 'Seven Sacraments — Holy Communion', '/library/read/seven-sacraments'],
  ['unction', 'Unction of the Sick', 'Anointing administered to the sick', 'Seven Sacraments — Unction', '/library/read/seven-sacraments'],
].map(([id, left, right, label, route], index) => ({ id, category: index < 4 ? 'Biblical people' : 'Seven Sacraments', left: { en: left }, right: { en: right }, explanation: { en: `${left} is matched with ${right} in the cited source.` }, source: index < 4 ? bible(label, route) : library(label, route), verifiedLocales: ['en'] }))

export const HISTORY_TIMELINE = [
  { id: 'nicaea', year: 325, label: { en: 'Council of Nicaea' }, source: library('World Church History — Councils', '/library/read/church-history-worldwide') },
  { id: 'constantinople', year: 381, label: { en: 'Council of Constantinople' }, source: library('World Church History — Councils', '/library/read/church-history-worldwide') },
  { id: 'ephesus', year: 431, label: { en: 'Council of Ephesus' }, source: library('World Church History — Chapter Six', '/library/read/church-history-worldwide') },
]

export function questionsFor(game: PlayQuestion['game']) {
  return APPROVED_QUESTIONS.filter((question) => question.game === game)
}
