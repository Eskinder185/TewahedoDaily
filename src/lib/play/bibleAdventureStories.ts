/** Story claims and answer keys checked against the local public-domain WEB snapshot. */
export type AdventureText = { en: string; am?: string }

export type AdventureSource = {
  book: string
  slug: string
  chapter: number
  firstVerse: number
  lastVerse: number
}

export type AdventureScene = {
  title: AdventureText
  narrative: AdventureText
  source: AdventureSource
  interaction: {
    kind: 'discover'
    details: [
      { id: string; label: AdventureText; finding: AdventureText },
      { id: string; label: AdventureText; finding: AdventureText },
    ]
  } | {
    kind: 'question'
    prompt: AdventureText
    choices: { id: string; label: AdventureText }[]
    correctId: string
    explanation: AdventureText
  }
}

export type BibleAdventureStory = {
  id: string
  title: AdventureText
  summary: AdventureText
  passage: string
  art: 'sea' | 'ark' | 'valley' | 'den' | 'bread' | 'storm'
  scenes: [AdventureScene, AdventureScene, AdventureScene]
}

const source = (book: string, slug: string, chapter: number, firstVerse: number, lastVerse: number): AdventureSource =>
  ({ book, slug, chapter, firstVerse, lastVerse })

export const bibleAdventureStories: BibleAdventureStory[] = [
  {
    id: 'sea', title: { en: 'A Way Through the Sea', am: 'በባሕር ዳር ያለው መንገድ' },
    summary: { en: 'The people cross the sea and see the Lord’s deliverance.' }, passage: 'Exodus 14', art: 'sea',
    scenes: [
      {
        title: { en: 'The people were afraid', am: 'ሕዝቡ ፈሩ' },
        narrative: { en: 'The Israelites saw Pharaoh and his army approaching. Moses told the people not to be afraid and to see the deliverance of the Lord.', am: 'እስራኤላውያን ፈርዖንና ሠራዊቱ ሲቀርቡ አዩ። ሙሴ እንዳይፈሩና የእግዚአብሔርን ማዳን እንዲያዩ ነገራቸው።' },
        source: source('Exodus', 'exodus', 14, 10, 14),
        interaction: { kind: 'discover', details: [
          { id: 'camp', label: { en: 'Inspect the camp', am: 'ሰፈሩን ይመርምሩ' }, finding: { en: 'The Israelites saw the Egyptians coming and were afraid.' } },
          { id: 'sea', label: { en: 'Look at the sea', am: 'ባሕሩን ይመልከቱ' }, finding: { en: 'Moses told them to stand still and see the Lord’s deliverance.' } },
        ] },
      },
      {
        title: { en: 'A path through the sea', am: 'ባሕሩ ተከፈለ' },
        narrative: { en: 'Moses stretched out his hand, and the Lord drove the sea back with a strong east wind.', am: 'ሙሴ እጁን በባሕሩ ላይ ዘረጋ፤ እግዚአብሔርም ባሕሩን በኃይለኛ ነፋስ መለሰ።' },
        source: source('Exodus', 'exodus', 14, 21, 22),
        interaction: { kind: 'question', prompt: { en: 'What did Moses do over the sea?', am: 'ሙሴ በባሕሩ ላይ ምን አደረገ?' },
          choices: [
            { id: 'hand', label: { en: 'He stretched out his hand', am: 'እጁን ዘረጋ' } },
            { id: 'ship', label: { en: 'He built a ship', am: 'መርከብ ሠራ' } },
            { id: 'stone', label: { en: 'He threw a stone', am: 'ድንጋይ ወረወረ' } },
          ], correctId: 'hand', explanation: { en: 'Moses stretched out his hand; the Lord drove the sea back with a strong east wind.', am: 'ሙሴ እጁን ዘረጋ፤ እግዚአብሔርም ባሕሩን በኃይለኛ ነፋስ መለሰ።' } },
      },
      {
        title: { en: 'The people saw the deliverance', am: 'ሕዝቡ ማዳኑን አየ' },
        narrative: { en: 'Israel saw the great work the Lord had done. The people feared the Lord and believed in the Lord and in Moses his servant.', am: 'እስራኤል እግዚአብሔር ያደረገውን ታላቅ ሥራ አየ፤ ሕዝቡም እግዚአብሔርን ፈራ በእርሱና በባሪያው በሙሴም አመነ።' },
        source: source('Exodus', 'exodus', 14, 30, 31),
        interaction: { kind: 'question', prompt: { en: 'After seeing the Lord’s great work, whom did the people believe in?' },
          choices: [
            { id: 'pharaoh', label: { en: 'Pharaoh and his army' } },
            { id: 'lord-moses', label: { en: 'The Lord and Moses' } },
            { id: 'egyptians', label: { en: 'The Egyptians' } },
          ], correctId: 'lord-moses', explanation: { en: 'Exodus 14:31 says they believed in the Lord and in Moses his servant.' } },
      },
    ],
  },
  {
    id: 'ark', title: { en: 'Noah and the Ark' }, summary: { en: 'Noah follows God’s instructions, and God makes a covenant after the flood.' }, passage: 'Genesis 6–9', art: 'ark',
    scenes: [
      {
        title: { en: 'Preparing the ark' }, narrative: { en: 'God told Noah to build a ship, bring living creatures into it, and gather food. Noah did what God commanded.' },
        source: source('Genesis', 'genesis', 6, 13, 22),
        interaction: { kind: 'discover', details: [
          { id: 'ship', label: { en: 'Inspect the ship' }, finding: { en: 'God instructed Noah to make rooms and seal the ship with pitch.' } },
          { id: 'food', label: { en: 'Inspect the supplies' }, finding: { en: 'God instructed Noah to gather food for his family and the creatures.' } },
        ] },
      },
      {
        title: { en: 'Entering the ark' }, narrative: { en: 'Noah, his family, and the animals entered the ship as God commanded.' },
        source: source('Genesis', 'genesis', 7, 13, 16),
        interaction: { kind: 'question', prompt: { en: 'According to Genesis 7:16, who shut Noah in the ship?' },
          choices: [
            { id: 'sons', label: { en: 'His sons' } },
            { id: 'noah', label: { en: 'Noah himself' } },
            { id: 'lord', label: { en: 'The Lord' } },
          ], correctId: 'lord', explanation: { en: 'The passage says the Lord shut him in.' } },
      },
      {
        title: { en: 'A sign of the covenant' }, narrative: { en: 'God established a covenant with Noah and every living creature, promising that a flood would not again destroy all flesh.' },
        source: source('Genesis', 'genesis', 9, 8, 17),
        interaction: { kind: 'question', prompt: { en: 'What sign did God set in the cloud for this covenant?' },
          choices: [
            { id: 'star', label: { en: 'A star' } },
            { id: 'rainbow', label: { en: 'A rainbow' } },
            { id: 'flame', label: { en: 'A flame' } },
          ], correctId: 'rainbow', explanation: { en: 'Genesis 9:13 names the rainbow as the sign of the covenant.' } },
      },
    ],
  },
  {
    id: 'david', title: { en: 'David and Goliath' }, summary: { en: 'David trusts the Lord and faces the Philistine.' }, passage: '1 Samuel 17', art: 'valley',
    scenes: [
      {
        title: { en: 'David speaks to Saul' }, narrative: { en: 'David offered to face the Philistine. He recalled how the Lord had delivered him when he protected his father’s sheep.' },
        source: source('1 Samuel', 'samuel', 17, 32, 37),
        interaction: { kind: 'discover', details: [
          { id: 'flock', label: { en: 'Recall the flock' }, finding: { en: 'David had kept his father’s sheep and rescued a lamb from a lion or a bear.' } },
          { id: 'saul', label: { en: 'Hear Saul’s reply' }, finding: { en: 'Saul told David to go and said the Lord would be with him.' } },
        ] },
      },
      {
        title: { en: 'Choosing what to carry' }, narrative: { en: 'David took off Saul’s untested armor. He took his staff, sling, and stones from the brook.' },
        source: source('1 Samuel', 'samuel', 17, 38, 40),
        interaction: { kind: 'question', prompt: { en: 'What did David choose from the brook?' },
          choices: [
            { id: 'stones', label: { en: 'Five smooth stones' } },
            { id: 'sword', label: { en: 'A sword' } },
            { id: 'helmet', label: { en: 'A brass helmet' } },
          ], correctId: 'stones', explanation: { en: '1 Samuel 17:40 says David chose five smooth stones from the brook.' } },
      },
      {
        title: { en: 'The battle' }, narrative: { en: 'David said the battle belonged to the Lord. He struck the Philistine with a stone from his sling.' },
        source: source('1 Samuel', 'samuel', 17, 45, 50),
        interaction: { kind: 'question', prompt: { en: 'Whose battle did David say this was?' },
          choices: [
            { id: 'saul', label: { en: 'Saul’s' } },
            { id: 'david', label: { en: 'David’s alone' } },
            { id: 'lord', label: { en: 'The Lord’s' } },
          ], correctId: 'lord', explanation: { en: 'David said, in 1 Samuel 17:47, that the battle is the Lord’s.' } },
      },
    ],
  },
  {
    id: 'daniel', title: { en: 'Daniel in the Lions’ Den' }, summary: { en: 'Daniel continues to pray and is delivered from the lions.' }, passage: 'Daniel 6', art: 'den',
    scenes: [
      {
        title: { en: 'The decree and the prayer' }, narrative: { en: 'A royal decree forbade petitions to anyone but the king for thirty days. Daniel continued to pray and give thanks to God.' },
        source: source('Daniel', 'daniel', 6, 7, 10),
        interaction: { kind: 'discover', details: [
          { id: 'decree', label: { en: 'Read the decree' }, finding: { en: 'The decree allowed petitions only to the king for thirty days.' } },
          { id: 'prayer', label: { en: 'Observe Daniel’s prayer' }, finding: { en: 'Daniel prayed and gave thanks three times a day, as before.' } },
        ] },
      },
      {
        title: { en: 'In the lions’ den' }, narrative: { en: 'Daniel was placed in the den. The king returned early the next morning and called to him.' },
        source: source('Daniel', 'daniel', 6, 16, 23),
        interaction: { kind: 'question', prompt: { en: 'How did Daniel say the lions were kept from hurting him?' },
          choices: [
            { id: 'stone', label: { en: 'A stone blocked them' } },
            { id: 'angel', label: { en: 'God sent an angel' } },
            { id: 'king', label: { en: 'The king tied them up' } },
          ], correctId: 'angel', explanation: { en: 'Daniel 6:22 says God sent his angel and shut the lions’ mouths.' } },
      },
      {
        title: { en: 'The king’s message' }, narrative: { en: 'The king was glad Daniel was unharmed. He wrote to the peoples and nations about the God of Daniel.' },
        source: source('Daniel', 'daniel', 6, 23, 27),
        interaction: { kind: 'question', prompt: { en: 'What did King Darius do after Daniel was brought out unharmed?' },
          choices: [
            { id: 'letter', label: { en: 'He wrote to the peoples and nations' } },
            { id: 'ship', label: { en: 'He sent Daniel away by ship' } },
            { id: 'palace', label: { en: 'He closed the palace' } },
          ], correctId: 'letter', explanation: { en: 'Daniel 6:25 says Darius wrote to all the peoples, nations, and languages.' } },
      },
    ],
  },
  {
    id: 'feeding', title: { en: 'Feeding the Five Thousand' }, summary: { en: 'Jesus has compassion on a crowd and feeds them.' }, passage: 'Matthew 14:13–21', art: 'bread',
    scenes: [
      {
        title: { en: 'A crowd follows' }, narrative: { en: 'The crowd followed Jesus to a deserted place. He had compassion on them and healed their sick. Later, the disciples were concerned about food.' },
        source: source('Matthew', 'matthew', 14, 13, 17),
        interaction: { kind: 'discover', details: [
          { id: 'crowd', label: { en: 'Observe the crowd' }, finding: { en: 'Jesus saw the multitude, had compassion, and healed their sick.' } },
          { id: 'food', label: { en: 'Check the food' }, finding: { en: 'The disciples had five loaves and two fish.' } },
        ] },
      },
      {
        title: { en: 'Sharing the bread' }, narrative: { en: 'Jesus blessed and broke the loaves, gave them to the disciples, and they gave them to the multitude.' },
        source: source('Matthew', 'matthew', 14, 18, 19),
        interaction: { kind: 'question', prompt: { en: 'After Jesus blessed and broke the loaves, who gave them to the multitude?' },
          choices: [
            { id: 'crowd', label: { en: 'The crowd itself' } },
            { id: 'disciples', label: { en: 'The disciples' } },
            { id: 'villagers', label: { en: 'The villagers' } },
          ], correctId: 'disciples', explanation: { en: 'Matthew 14:19 says the disciples gave the loaves to the multitudes.' } },
      },
      {
        title: { en: 'Enough for everyone' }, narrative: { en: 'All ate and were filled. The disciples collected what remained after the meal.' },
        source: source('Matthew', 'matthew', 14, 20, 21),
        interaction: { kind: 'question', prompt: { en: 'How many baskets of broken pieces remained?' },
          choices: [
            { id: 'five', label: { en: 'Five baskets' } },
            { id: 'seven', label: { en: 'Seven baskets' } },
            { id: 'twelve', label: { en: 'Twelve baskets' } },
          ], correctId: 'twelve', explanation: { en: 'Matthew 14:20 says twelve baskets were filled with the remaining pieces.' } },
      },
    ],
  },
  {
    id: 'storm', title: { en: 'Jesus Calms the Storm' }, summary: { en: 'The disciples wake Jesus during a storm, and the sea becomes calm.' }, passage: 'Matthew 8:23–27', art: 'storm',
    scenes: [
      {
        title: { en: 'A storm on the sea' }, narrative: { en: 'Jesus and his disciples were in a boat. A violent storm arose and waves covered the boat while Jesus slept.' },
        source: source('Matthew', 'matthew', 8, 23, 25),
        interaction: { kind: 'discover', details: [
          { id: 'boat', label: { en: 'Inspect the boat' }, finding: { en: 'Jesus got into the boat, and his disciples followed him.' } },
          { id: 'waves', label: { en: 'Watch the waves' }, finding: { en: 'The storm covered the boat with waves while Jesus slept.' } },
        ] },
      },
      {
        title: { en: 'Jesus responds' }, narrative: { en: 'The disciples woke Jesus and called for help. Jesus spoke to them and then addressed the storm.' },
        source: source('Matthew', 'matthew', 8, 25, 26),
        interaction: { kind: 'question', prompt: { en: 'What did Jesus rebuke?' },
          choices: [
            { id: 'boat', label: { en: 'The boat and its sails' } },
            { id: 'crowd', label: { en: 'The crowd on shore' } },
            { id: 'wind', label: { en: 'The wind and the sea' } },
          ], correctId: 'wind', explanation: { en: 'Matthew 8:26 says Jesus rebuked the wind and the sea.' } },
      },
      {
        title: { en: 'A great calm' }, narrative: { en: 'After Jesus rebuked the wind and sea, there was a great calm. The men marveled that even the wind and sea obeyed him.' },
        source: source('Matthew', 'matthew', 8, 26, 27),
        interaction: { kind: 'question', prompt: { en: 'What happened immediately after Jesus rebuked the wind and sea?' },
          choices: [
            { id: 'calm', label: { en: 'A great calm followed' } },
            { id: 'rain', label: { en: 'Heavy rain began' } },
            { id: 'boat', label: { en: 'The boat reached shore' } },
          ], correctId: 'calm', explanation: { en: 'Matthew 8:26 says there was a great calm.' } },
      },
    ],
  },
]

export function adventureSourceLink(source: AdventureSource) {
  return `/bible/${source.slug}/${source.chapter}?edition=web#verse-${source.firstVerse}`
}

export function adventureSourceLabel(source: AdventureSource) {
  return `${source.book} ${source.chapter}:${source.firstVerse}–${source.lastVerse}`
}
