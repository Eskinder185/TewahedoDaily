/**
 * Generates and validates Bible Adventure pilot batch (6 stories).
 * Enriches all 6 story templates with complete bilingual texts (English + Amharic)
 * while preserving existing artwork templates, scene kinds, and exact IDs.
 */
import fs from 'node:fs'
import path from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const { validateStudioDraft } = await import('../../src/lib/play/contentStudio')
  const { bibleAdventureStories } = await import('../../src/lib/play/bibleAdventureStories')
  type BibleAdventureStory = import('../../src/lib/play/bibleAdventureStories').BibleAdventureStory

  // Enrich each template story with full bilingual (English + Amharic) content
  const enrichedStories: BibleAdventureStory[] = [
    // 1. Sea
    {
      id: 'sea',
      title: { en: 'A Way Through the Sea', am: 'በባሕር ውስጥ የተከፈተ መንገድ' },
      summary: { en: 'The people cross the sea and see the Lord’s deliverance.', am: 'እስራኤላውያን ባሕሩን ተሻግረው የእግዚአብሔርን ታላቅ ማዳን አዩ።' },
      passage: 'Exodus 14',
      art: 'sea',
      scenes: [
        {
          title: { en: 'The people were afraid', am: 'ሕዝቡ ፈሩ' },
          narrative: {
            en: 'The Israelites saw Pharaoh and his army approaching. Moses told the people not to be afraid and to see the deliverance of the Lord.',
            am: 'እስራኤላውያን ፈርዖንና ሠራዊቱ ሲቀርቡ አዩ። ሙሴ እንዳይፈሩና የእግዚአብሔርን ማዳን እንዲያዩ ነገራቸው።'
          },
          source: { book: 'Exodus', slug: 'exodus', chapter: 14, firstVerse: 10, lastVerse: 14 },
          interaction: {
            kind: 'discover',
            details: [
              {
                id: 'camp',
                label: { en: 'Inspect the camp', am: 'ሰፈሩን ይመርምሩ' },
                finding: { en: 'The Israelites saw the Egyptians coming and were afraid.', am: 'እስራኤላውያን ግብፃውያን ሲመጡ አይተው እጅግ ፈሩ።' }
              },
              {
                id: 'sea',
                label: { en: 'Look at the sea', am: 'ባሕሩን ይመልከቱ' },
                finding: { en: 'Moses told them to stand still and see the Lord’s deliverance.', am: 'ሙሴ ጸንተው እንዲቆሙና የእግዚአብሔርን ማዳን እንዲያዩ ነገራቸው።' }
              }
            ]
          }
        },
        {
          title: { en: 'A path through the sea', am: 'ባሕሩ ተከፈለ' },
          narrative: {
            en: 'Moses stretched out his hand, and the Lord drove the sea back with a strong east wind.',
            am: 'ሙሴ እጁን በባሕሩ ላይ ዘረጋ፤ እግዚአብሔርም ባሕሩን በኃይለኛ የምሥራቅ ነፋስ መለሰ።'
          },
          source: { book: 'Exodus', slug: 'exodus', chapter: 14, firstVerse: 21, lastVerse: 22 },
          interaction: {
            kind: 'question',
            prompt: { en: 'What did Moses do over the sea?', am: 'ሙሴ በባሕሩ ላይ ምን አደረገ?' },
            choices: [
              { id: 'hand', label: { en: 'He stretched out his hand', am: 'እጁን ዘረጋ' } },
              { id: 'ship', label: { en: 'He built a ship', am: 'መርከብ ሠራ' } },
              { id: 'stone', label: { en: 'He threw a stone', am: 'ድንጋይ ወረወረ' } }
            ],
            correctId: 'hand',
            explanation: {
              en: 'Moses stretched out his hand; the Lord drove the sea back with a strong east wind.',
              am: 'ሙሴ እጁን ዘረጋ፤ እግዚአብሔርም ባሕሩን በኃይለኛ ነፋስ ከፍሎ ደረቅ ምድር አደረገው።'
            }
          }
        },
        {
          title: { en: 'The people saw the deliverance', am: 'ሕዝቡ ማዳኑን አየ' },
          narrative: {
            en: 'Israel saw the great work the Lord had done. The people feared the Lord and believed in the Lord and in Moses his servant.',
            am: 'እስራኤል እግዚአብሔር ያደረገውን ታላቅ ሥራ አየ፤ ሕዝቡም እግዚአብሔርን ፈራ በእርሱና በባሪያው በሙሴም አመነ።'
          },
          source: { book: 'Exodus', slug: 'exodus', chapter: 14, firstVerse: 30, lastVerse: 31 },
          interaction: {
            kind: 'question',
            prompt: { en: 'After seeing the Lord’s great work, whom did the people believe in?', am: 'ሕዝቡ የእግዚአብሔርን ታላቅ ሥራ ካዩ በኋላ በማን አመኑ?' },
            choices: [
              { id: 'pharaoh', label: { en: 'Pharaoh and his army', am: 'በፈርዖንና በሠራዊቱ' } },
              { id: 'lord-moses', label: { en: 'The Lord and Moses', am: 'በእግዚአብሔርና በባሪያው በሙሴ' } },
              { id: 'egyptians', label: { en: 'The Egyptians', am: 'በግብፃውያን' } }
            ],
            correctId: 'lord-moses',
            explanation: {
              en: 'Exodus 14:31 says they believed in the Lord and in Moses his servant.',
              am: 'ዘፀአት 14:31 ሕዝቡ በእግዚአብሔርና በባሪያው በሙሴ እንዳመኑ ይናገራል።'
            }
          }
        }
      ]
    },
    // 2. Ark
    {
      id: 'ark',
      title: { en: 'Noah and the Ark', am: 'ኖኅና መርከቡ' },
      summary: { en: 'Noah follows God’s instructions, and God makes a covenant after the flood.', am: 'ኖኅ የእግዚአብሔርን ትእዛዝ ፈጸመ፤ ከጥፋት ውኃም በኋላ እግዚአብሔር ኪዳን አደረገ።' },
      passage: 'Genesis 6–9',
      art: 'ark',
      scenes: [
        {
          title: { en: 'Preparing the ark', am: 'መርከቡን ማዘጋጀት' },
          narrative: {
            en: 'God told Noah to build a ship, bring living creatures into it, and gather food. Noah did what God commanded.',
            am: 'እግዚአብሔር ኖኅን መርከብ እንዲሠራ፣ ሕያዋን ፍጥረታትን እንዲያስገባና ምግብ እንዲሰበስብ አዘዘው፤ ኖኅም የታዘዘውን ሁሉ አደረገ።'
          },
          source: { book: 'Genesis', slug: 'genesis', chapter: 6, firstVerse: 13, lastVerse: 22 },
          interaction: {
            kind: 'discover',
            details: [
              {
                id: 'ship',
                label: { en: 'Inspect the ship', am: 'መርከቡን ይመርምሩ' },
                finding: { en: 'God instructed Noah to make rooms and seal the ship with pitch.', am: 'እግዚአብሔር ኖኅን ክፍሎች እንዲሠራና መርከቡን በቅጥራን እንዲመርገው አዘዘው።' }
              },
              {
                id: 'food',
                label: { en: 'Inspect the supplies', am: 'ስንቁን ይመርምሩ' },
                finding: { en: 'God instructed Noah to gather food for his family and the creatures.', am: 'እግዚአብሔር ለቤተሰቡና ለእንስሳት የሚሆን ምግብ እንዲያዘጋጅ አዘዘው።' }
              }
            ]
          }
        },
        {
          title: { en: 'Entering the ark', am: 'ወደ መርከቡ መግባት' },
          narrative: {
            en: 'Noah, his family, and the animals entered the ship as God commanded.',
            am: 'እግዚአብሔር እንዳዘዘው ኖኅ፣ ቤተሰቡና እንስሳቱ ወደ መርከቡ ገቡ።'
          },
          source: { book: 'Genesis', slug: 'genesis', chapter: 7, firstVerse: 13, lastVerse: 16 },
          interaction: {
            kind: 'question',
            prompt: { en: 'According to Genesis 7:16, who shut Noah in the ship?', am: 'በኦሪት ዘፍጥረት 7:16 መሠረት ኖኅን በመርከቡ የዘጋው ማን ነው?' },
            choices: [
              { id: 'sons', label: { en: 'His sons', am: 'ልጆቹ' } },
              { id: 'noah', label: { en: 'Noah himself', am: 'ኖኅ ራሱ' } },
              { id: 'lord', label: { en: 'The Lord', am: 'እግዚአብሔር' } }
            ],
            correctId: 'lord',
            explanation: {
              en: 'The passage says the Lord shut him in.',
              am: 'የመጽሐፍ ቅዱስ ቃል እግዚአብሔር በስተኋላው እንደ ዘጋው ይናገራል።'
            }
          }
        },
        {
          title: { en: 'A sign of the covenant', am: 'የኪዳኑ ምልክት' },
          narrative: {
            en: 'God established a covenant with Noah and every living creature, promising that a flood would not again destroy all flesh.',
            am: 'እግዚአብሔር ከኖኅና ከሕያዋን ፍጥረታት ሁሉ ጋር ዳግመኛ ምድር በውኃ እንዳትጠፋ ኪዳን አደረገ።'
          },
          source: { book: 'Genesis', slug: 'genesis', chapter: 9, firstVerse: 8, lastVerse: 17 },
          interaction: {
            kind: 'question',
            prompt: { en: 'What sign did God set in the cloud for this covenant?', am: 'እግዚአብሔር ለዚህ ኪዳን በደመና ውስጥ ምን ምልክት አደረገ?' },
            choices: [
              { id: 'star', label: { en: 'A star', am: 'ኮከብ' } },
              { id: 'rainbow', label: { en: 'A rainbow', am: 'ቀስተ ደመና' } },
              { id: 'flame', label: { en: 'A flame', am: 'ነበልባል' } }
            ],
            correctId: 'rainbow',
            explanation: {
              en: 'Genesis 9:13 names the rainbow as the sign of the covenant.',
              am: 'ዘፍጥረት 9:13 ቀስተ ደመና የኪዳኑ ምልክት እንደ ሆነ ይገልጻል።'
            }
          }
        }
      ]
    },
    // 3. David
    {
      id: 'david',
      title: { en: 'David and Goliath', am: 'ዳዊትና ጎልያድ' },
      summary: { en: 'David trusts the Lord and faces the Philistine.', am: 'ዳዊት በእግዚአብሔር ታምኖ ፍልስጥኤማዊውን ጎልያድን ገጠመው።' },
      passage: '1 Samuel 17',
      art: 'valley',
      scenes: [
        {
          title: { en: 'David speaks to Saul', am: 'ዳዊት ከሳኦል ጋር ተነጋገረ' },
          narrative: {
            en: 'David offered to face the Philistine. He recalled how the Lord had delivered him when he protected his father’s sheep.',
            am: 'ዳዊት ፍልስጥኤማዊውን ለመግጠም ቀረበ፤ የአባቱን በጎች ሲጠብቅ እግዚአብሔር ከአንበሳና ከድብ እጅ እንዳዳነው አስታወሰ።'
          },
          source: { book: '1 Samuel', slug: 'samuel', chapter: 17, firstVerse: 32, lastVerse: 37 },
          interaction: {
            kind: 'discover',
            details: [
              {
                id: 'flock',
                label: { en: 'Recall the flock', am: 'የበጎቹን ጥበቃ አስታውስ' },
                finding: { en: 'David had kept his father’s sheep and rescued a lamb from a lion or a bear.', am: 'ዳዊት የአባቱን በጎች ሲጠብቅ ጠቦቱን ከአንበሳና ከድብ አድኖ ነበር።' }
              },
              {
                id: 'saul',
                label: { en: 'Hear Saul’s reply', am: 'የሳኦልን መልስ አድምጥ' },
                finding: { en: 'Saul told David to go and said the Lord would be with him.', am: 'ሳኦል ዳዊትን ሂድ እግዚአብሔርም ከአንተ ጋር ይሆናል አለው።' }
              }
            ]
          }
        },
        {
          title: { en: 'Choosing what to carry', am: 'የሚይዘውን መምረጥ' },
          narrative: {
            en: 'David took off Saul’s untested armor. He took his staff, sling, and stones from the brook.',
            am: 'ዳዊት ያልለመደውን የሳኦልን የጦር ትጥቅ አወለቀ፤ በትር፣ ወንጭፍና ከወንዝ የተመረጡ ድንጋዮችን ያዘ።'
          },
          source: { book: '1 Samuel', slug: 'samuel', chapter: 17, firstVerse: 38, lastVerse: 40 },
          interaction: {
            kind: 'question',
            prompt: { en: 'What did David choose from the brook?', am: 'ዳዊት ከወንዙ ምን መረጠ?' },
            choices: [
              { id: 'stones', label: { en: 'Five smooth stones', am: 'አምስት ድቡልቡል ድንጋዮች' } },
              { id: 'sword', label: { en: 'A sword', am: 'ሰይፍ' } },
              { id: 'helmet', label: { en: 'A brass helmet', am: 'የናስ ቆብ' } }
            ],
            correctId: 'stones',
            explanation: {
              en: '1 Samuel 17:40 says David chose five smooth stones from the brook.',
              am: '1 ሳሙኤል 17:40 ዳዊት ከወንዙ አምስት ድቡልቡል ድንጋዮችን እንደ መረጠ ይናገራል።'
            }
          }
        },
        {
          title: { en: 'The battle', am: 'ውጊያው' },
          narrative: {
            en: 'David said the battle belonged to the Lord. He struck the Philistine with a stone from his sling.',
            am: 'ዳዊት ሰልፉ የእግዚአብሔር እንደ ሆነ ተናገረ፤ ፍልስጥኤማዊውንም በወንጭፍ ድንጋይ መታው።'
          },
          source: { book: '1 Samuel', slug: 'samuel', chapter: 17, firstVerse: 45, lastVerse: 50 },
          interaction: {
            kind: 'question',
            prompt: { en: 'Whose battle did David say this was?', am: 'ዳዊት ሰልፉ የማን እንደ ሆነ ተናገረ?' },
            choices: [
              { id: 'saul', label: { en: 'Saul’s', am: 'የሳኦል' } },
              { id: 'david', label: { en: 'David’s alone', am: 'የዳዊት ብቻ' } },
              { id: 'lord', label: { en: 'The Lord’s', am: 'የእግዚአብሔር' } }
            ],
            correctId: 'lord',
            explanation: {
              en: 'David said, in 1 Samuel 17:47, that the battle is the Lord’s.',
              am: 'በ1 ሳሙኤል 17:47 ዳዊት ሰልፉ የእግዚአብሔር እንደ ሆነ አወጀ።'
            }
          }
        }
      ]
    },
    // 4. Daniel
    {
      id: 'daniel',
      title: { en: 'Daniel in the Lions’ Den', am: 'ዳንኤል በአንበሶች ጉድጓድ' },
      summary: { en: 'Daniel continues to pray and is delivered from the lions.', am: 'ዳንኤል ጸሎቱን አላቋረጠም፤ እግዚአብሔርም ከአንበሶች ጉድጓድ አዳነው።' },
      passage: 'Daniel 6',
      art: 'den',
      scenes: [
        {
          title: { en: 'The decree and the prayer', am: 'አዋጁና ጸሎቱ' },
          narrative: {
            en: 'A royal decree forbade petitions to anyone but the king for thirty days. Daniel continued to pray and give thanks to God.',
            am: 'ለሠላሳ ቀናት ከንጉሥ በቀር ማንም እንዳይጸልይ አዋጅ ወጣ፤ ዳንኤል ግን እንደ ቀድሞው ወደ አምላኩ ጸለየ።'
          },
          source: { book: 'Daniel', slug: 'daniel', chapter: 6, firstVerse: 7, lastVerse: 10 },
          interaction: {
            kind: 'discover',
            details: [
              {
                id: 'decree',
                label: { en: 'Read the decree', am: 'አዋጁን አንብብ' },
                finding: { en: 'The decree allowed petitions only to the king for thirty days.', am: 'አዋጁ ለሠላሳ ቀናት ወደ ንጉሥ ብቻ ልመና እንዲቀርብ አስገደደ።' }
              },
              {
                id: 'prayer',
                label: { en: 'Observe Daniel’s prayer', am: 'የዳንኤልን ጸሎት ተመልከት' },
                finding: { en: 'Daniel prayed and gave thanks three times a day, as before.', am: 'ዳንኤል በቀን ሦስት ጊዜ ተንበርክኮ ያመሰግንና ይጸልይ ነበር።' }
              }
            ]
          }
        },
        {
          title: { en: 'In the lions’ den', am: 'በአንበሶች ጉድጓድ ውስጥ' },
          narrative: {
            en: 'Daniel was placed in the den. The king returned early the next morning and called to him.',
            am: 'ዳንኤል ወደ አንበሶች ጉድጓድ ተጣለ፤ ንጉሡ በማግስቱ ማለዳ ወደ ጉድጓዱ ሮጦ በታላቅ ድምፅ ጠራው።'
          },
          source: { book: 'Daniel', slug: 'daniel', chapter: 6, firstVerse: 16, lastVerse: 23 },
          interaction: {
            kind: 'question',
            prompt: { en: 'How did Daniel say the lions were kept from hurting him?', am: 'ዳንኤል አንበሶቹ እንዳይጎዱት የተደረገው እንዴት እንደ ሆነ ተናገረ?' },
            choices: [
              { id: 'stone', label: { en: 'A stone blocked them', am: 'ድንጋይ ከለከላቸው' } },
              { id: 'angel', label: { en: 'God sent an angel', am: 'እግዚአብሔር መልአኩን ላከ' } },
              { id: 'king', label: { en: 'The king tied them up', am: 'ንጉሡ አሰረቻቸው' } }
            ],
            correctId: 'angel',
            explanation: {
              en: 'Daniel 6:22 says God sent his angel and shut the lions’ mouths.',
              am: 'ዳንኤል 6:22 እግዚአብሔር መልአኩን ልኮ የአንበሶቹን አፍ እንደ ዘጋ ይናገራል።'
            }
          }
        },
        {
          title: { en: 'The king’s message', am: 'የንጉሡ መልእክት' },
          narrative: {
            en: 'The king was glad Daniel was unharmed. He wrote to the peoples and nations about the God of Daniel.',
            am: 'ንጉሡ ዳንኤል ባለመጎዳቱ እጅግ ደስ አለው፤ በግዛቱ ላሉ አሕዛብ ሁሉ ስለ ዳንኤል አምላክ አዋጅ ጻፈ።'
          },
          source: { book: 'Daniel', slug: 'daniel', chapter: 6, firstVerse: 23, lastVerse: 27 },
          interaction: {
            kind: 'question',
            prompt: { en: 'What did King Darius do after Daniel was brought out unharmed?', am: 'ዳንኤል ሳይጎዳ ከወጣ በኋላ ንጉሥ ዳርዮስ ምን አደረገ?' },
            choices: [
              { id: 'letter', label: { en: 'He wrote to the peoples and nations', am: 'ለአሕዛብና ለሕዝቦች ሁሉ አዋጅ ጻፈ' } },
              { id: 'ship', label: { en: 'He sent Daniel away by ship', am: 'ዳንኤልን በመርከብ አሰናበተው' } },
              { id: 'palace', label: { en: 'He closed the palace', am: 'ቤተ መንግሥቱን ዘጋ' } }
            ],
            correctId: 'letter',
            explanation: {
              en: 'Daniel 6:25 says Darius wrote to all the peoples, nations, and languages.',
              am: 'ዳንኤል 6:25 ዳርዮስ በምድር ሁሉ ለሚኖሩ አሕዛብና ቋንቋዎች ሁሉ አዋጅ እንደ ጻፈ ይናገራል።'
            }
          }
        }
      ]
    },
    // 5. Feeding
    {
      id: 'feeding',
      title: { en: 'Feeding the Five Thousand', am: 'አምስት ሺህ ሰዎችን መመገብ' },
      summary: { en: 'Jesus has compassion on a crowd and feeds them.', am: 'ጌታችን መድኃኒታችን ኢየሱስ ክርስቶስ ሕዝቡን አዝኖላቸው በበረከት መገባቸው።' },
      passage: 'Matthew 14:13–21',
      art: 'bread',
      scenes: [
        {
          title: { en: 'A crowd follows', am: 'ሕዝቡ ተከተሉት' },
          narrative: {
            en: 'The crowd followed Jesus to a deserted place. He had compassion on them and healed their sick. Later, the disciples were concerned about food.',
            am: 'ሕዝቡ ጌታችንን ወደ ምድረ በዳ ተከተሉት፤ አዝኖላቸው ድውዮቻቸውን ፈወሰ፤ ደቀ መዛሙርቱም ስለ ምግባቸው ተጨነቁ።'
          },
          source: { book: 'Matthew', slug: 'matthew', chapter: 14, firstVerse: 13, lastVerse: 17 },
          interaction: {
            kind: 'discover',
            details: [
              {
                id: 'crowd',
                label: { en: 'Observe the crowd', am: 'ሕዝቡን ተመልከት' },
                finding: { en: 'Jesus saw the multitude, had compassion, and healed their sick.', am: 'ኢየሱስ ብዙ ሕዝብ አይቶ አዘነላቸው፤ ድውዮቻቸውንም ፈወሰ።' }
              },
              {
                id: 'food',
                label: { en: 'Check the food', am: 'ምግቡን መርምር' },
                finding: { en: 'The disciples had five loaves and two fish.', am: 'ደቀ መዛሙርቱ ከአምስት እንጀራና ከሁለት ዓሣ በቀር ምንም አልነበራቸውም።' }
              }
            ]
          }
        },
        {
          title: { en: 'Sharing the bread', am: 'እንጀራውን ማካፈል' },
          narrative: {
            en: 'Jesus blessed and broke the loaves, gave them to the disciples, and they gave them to the multitude.',
            am: 'ኢየሱስ እንጀራውን ባርኮ ቆረሰ፤ ለደቀ መዛሙርቱ ሰጠ፤ እነርሱም ለሕዝቡ አደሉ፤ ሁሉም በሉና ጠገቡ።'
          },
          source: { book: 'Matthew', slug: 'matthew', chapter: 14, firstVerse: 18, lastVerse: 19 },
          interaction: {
            kind: 'question',
            prompt: { en: 'After Jesus blessed and broke the loaves, who gave them to the multitude?', am: 'ኢየሱስ እንጀራውን ባርኮ ከቆረሰ በኋላ ለሕዝቡ ያደሉት እነማን ናቸው?' },
            choices: [
              { id: 'crowd', label: { en: 'The crowd itself', am: 'ሕዝቡ ራሱ' } },
              { id: 'disciples', label: { en: 'The disciples', am: 'ደቀ መዛሙርቱ' } },
              { id: 'villagers', label: { en: 'The villagers', am: 'የመንደሩ ነዋሪዎች' } }
            ],
            correctId: 'disciples',
            explanation: {
              en: 'Matthew 14:19 says the disciples gave the loaves to the multitudes.',
              am: 'ማቴዎስ 14:19 ደቀ መዛሙርቱ እንጀራውን ለሕዝቡ እንደ ሰጡ ይናገራል።'
            }
          }
        },
        {
          title: { en: 'Enough for everyone', am: 'ለሁሉም የተረፈ' },
          narrative: {
            en: 'All ate and were filled. The disciples collected what remained after the meal.',
            am: 'ሁሉም በልተው ጠገቡ፤ ደቀ መዛሙርቱም ከተረፈው ቍርስራሽ አነሡ።'
          },
          source: { book: 'Matthew', slug: 'matthew', chapter: 14, firstVerse: 20, lastVerse: 21 },
          interaction: {
            kind: 'question',
            prompt: { en: 'How many baskets of broken pieces remained?', am: 'የተረፈው ቍርስራሽ ስንት መሶብ ሙሉ ሆነ?' },
            choices: [
              { id: 'five', label: { en: 'Five baskets', am: 'አምስት መሶብ' } },
              { id: 'seven', label: { en: 'Seven baskets', am: 'ሰባት መሶብ' } },
              { id: 'twelve', label: { en: 'Twelve baskets', am: 'አሥራ ሁለት መሶብ' } }
            ],
            correctId: 'twelve',
            explanation: {
              en: 'Matthew 14:20 says twelve baskets were filled with the remaining pieces.',
              am: 'ማቴዎስ 14:20 አሥራ ሁለት መሶብ ሙሉ የተረፈ ቍርስራሽ እንደ ተነሣ ይናገራል።'
            }
          }
        }
      ]
    },
    // 6. Storm
    {
      id: 'storm',
      title: { en: 'Jesus Calms the Storm', am: 'ማዕበሉን ፀጥ ማሰኘት' },
      summary: { en: 'The disciples wake Jesus during a storm, and the sea becomes calm.', am: 'ደቀ መዛሙርቱ በማዕበል ወቅት ጌታን ቀሰቀሱት፤ እርሱም ባሕሩን ፀጥ አሰኘው።' },
      passage: 'Matthew 8:23–27',
      art: 'storm',
      scenes: [
        {
          title: { en: 'A storm on the sea', am: 'በባሕሩ ላይ ማዕበል ተነሣ' },
          narrative: {
            en: 'Jesus and his disciples were in a boat. A violent storm arose and waves covered the boat while Jesus slept.',
            am: 'ኢየሱስና ደቀ መዛሙርቱ በጀልባ ሳሉ በባሕሩ ላይ ታላቅ ማዕበል ተነሣ፤ ማዕበሉም ጀልባዋን እስኪሸፍናት ድረስ ሆነ፤ እርሱ ግን ተኝቶ ነበር።'
          },
          source: { book: 'Matthew', slug: 'matthew', chapter: 8, firstVerse: 23, lastVerse: 25 },
          interaction: {
            kind: 'discover',
            details: [
              {
                id: 'boat',
                label: { en: 'Inspect the boat', am: 'ጀልባዋን መርምር' },
                finding: { en: 'Jesus got into the boat, and his disciples followed him.', am: 'ኢየሱስ ወደ ጀልባው ገባ፤ ደቀ መዛሙርቱም ተከተሉት።' }
              },
              {
                id: 'waves',
                label: { en: 'Watch the waves', am: 'ማዕበሉን ተመልከት' },
                finding: { en: 'The storm covered the boat with waves while Jesus slept.', am: 'ማዕበሉ ጀልባዋን እስኪሸፍናት ተነሣ፤ ኢየሱስ ግን ተኝቶ ነበር።' }
              }
            ]
          }
        },
        {
          title: { en: 'Jesus responds', am: 'የጌታ መልስ' },
          narrative: {
            en: 'The disciples woke Jesus and called for help. Jesus spoke to them and then addressed the storm.',
            am: 'ደቀ መዛሙርቱ ቀስቅሰው አድነን ጠፋን አሉት፤ ኢየሱስም እናንተ እምነት የጎደላችሁ ስለምን ትፈራላችሁ አላቸው።'
          },
          source: { book: 'Matthew', slug: 'matthew', chapter: 8, firstVerse: 25, lastVerse: 26 },
          interaction: {
            kind: 'question',
            prompt: { en: 'What did Jesus rebuke?', am: 'ኢየሱስ ምንን ገሠፀ?' },
            choices: [
              { id: 'boat', label: { en: 'The boat and its sails', am: 'ጀልባዋንና ሸራዋን' } },
              { id: 'crowd', label: { en: 'The crowd on shore', am: 'በባሕሩ ዳር ያለውን ሕዝብ' } },
              { id: 'wind', label: { en: 'The wind and the sea', am: 'ነፋሱንና ባሕሩን' } }
            ],
            correctId: 'wind',
            explanation: {
              en: 'Matthew 8:26 says Jesus rebuked the wind and the sea.',
              am: 'ማቴዎስ 8:26 ኢየሱስ ነፋሱንና ባሕሩን እንደ ገሠፀ ይናገራል።'
            }
          }
        },
        {
          title: { en: 'A great calm', am: 'ታላቅ ፀጥታ' },
          narrative: {
            en: 'After Jesus rebuked the wind and sea, there was a great calm. The men marveled that even the wind and sea obeyed him.',
            am: 'ኢየሱስ ነፋሱንና ባሕሩን ከገሠፀ በኋላ ታላቅ ፀጥታ ሆነ፤ ሰዎቹም ነፋስና ባሕር የሚታዘዙለት ይህ ምን ዓይነት ሰው ነው እያሉ ተደነቁ።'
          },
          source: { book: 'Matthew', slug: 'matthew', chapter: 8, firstVerse: 26, lastVerse: 27 },
          interaction: {
            kind: 'question',
            prompt: { en: 'What happened immediately after Jesus rebuked the wind and sea?', am: 'ኢየሱስ ነፋሱንና ባሕሩን ከገሠፀ በኋላ ወዲያው ምን ሆነ?' },
            choices: [
              { id: 'calm', label: { en: 'A great calm followed', am: 'ታላቅ ፀጥታ ሆነ' } },
              { id: 'rain', label: { en: 'Heavy rain began', am: 'ኃይለኛ ዝናብ ጀመረ' } },
              { id: 'boat', label: { en: 'The boat reached shore', am: 'ጀልባዋ ዳርቻ ደረሰች' } }
            ],
            correctId: 'calm',
            explanation: {
              en: 'Matthew 8:26 says there was a great calm.',
              am: 'ማቴዎስ 8:26 ታላቅ ፀጥታ እንደ ሆነ ይመሰክራል።'
            }
          }
        }
      ]
    }
  ]

  console.log(`=== VALIDATING BIBLE ADVENTURES PILOT (${enrichedStories.length} STORIES) ===`)
  for (const story of enrichedStories) {
    const errors = validateStudioDraft({ game: 'adventures', content: story })
    if (errors.length > 0) {
      console.error(`Validation failed for adventure ${story.id}:`, errors)
      process.exit(1)
    }
  }

  const outDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'adventures')
  fs.mkdirSync(outDir, { recursive: true })

  fs.writeFileSync(path.join(outDir, 'stories.json'), JSON.stringify(enrichedStories, null, 2), 'utf8')

  const report = {
    generatedAt: new Date().toISOString(),
    game: 'adventures',
    totalStories: enrichedStories.length,
    storiesSummary: enrichedStories.map(s => ({
      id: s.id,
      title: s.title,
      art: s.art,
      passage: s.passage,
      scenesCount: s.scenes.length
    })),
    validation: {
      isValid: true,
      errors: []
    }
  }
  fs.writeFileSync(path.join(outDir, 'report.json'), JSON.stringify(report, null, 2), 'utf8')

  console.log('Bible Adventures pilot batch successfully generated, validated, and saved to artifacts/faith-challenges/adventures!')
}

run().catch(err => {
  console.error(err)
  process.exit(1)
})

