/**
 * Generates and validates Bible Timeline Challenge pilot batch (4 chains, 29 events).
 * Fully conforms to validateStudioDraft for 'bible-timeline'.
 */
import fs from 'node:fs'
import path from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const { validateStudioDraft } = await import('../../src/lib/play/contentStudio')
  const { buildTimelineBank } = await import('../../src/lib/play/bibleTimeline')
  type TlChain = import('../../src/lib/play/bibleTimeline').TlChain

  const chains: TlChain[] = [
    {
      id: 'judges-era',
      title: { en: 'The Period of the Judges', am: 'የመሳፍንት ዘመን' },
      events: [
        {
          id: 'jordan-crossing',
          title: { en: 'Israel crosses the Jordan River into the promised land', am: 'እስራኤል የዮርዳኖስን ወንዝ ተሻገሩ' },
          ref: 'Joshua 3:17',
          route: '/bible/joshua/3',
          note: 'The priests carrying the ark stepped into the Jordan, and the waters were cut off so the nation could cross on dry ground.'
        },
        {
          id: 'jericho-falls',
          title: { en: 'The walls of Jericho collapse after seven days', am: 'የኢያሪኮ ቅጥር ወደቀ' },
          ref: 'Joshua 6:20',
          route: '/bible/joshua/6',
          note: 'When the priests blew the trumpets and the people shouted, the walls of Jericho fell flat.'
        },
        {
          id: 'deborah-barak',
          title: { en: 'Deborah and Barak defeat Sisera at Mount Tabor', am: 'ዲቦራና ባራቅ ሲሳራን አሸነፉ' },
          ref: 'Judges 4:14',
          route: '/bible/judges/4',
          note: 'Deborah told Barak to advance against Sisera, and the Lord routed Sisera and his chariots.'
        },
        {
          id: 'gideon-victory',
          title: { en: 'Gideon defeats the Midianites with three hundred men', am: 'ጌዴዎን በሦስት መቶ ሰዎች ምድያማውያንን አሸነፈ' },
          ref: 'Judges 7:19',
          route: '/bible/judges/7',
          note: 'Gideon’s small force blew trumpets and smashed jars holding torches, causing confusion in the Midianite camp.'
        },
        {
          id: 'jephthah-deliverance',
          title: { en: 'Jephthah delivers Israel from the Ammonites', am: 'ዮፍታሔ እስራኤልን ከአሞናውያን ታደገ' },
          ref: 'Judges 11:32',
          route: '/bible/judges/11',
          note: 'The Spirit of the Lord came upon Jephthah, and he subdued the Ammonites before Israel.'
        },
        {
          id: 'samson-gaza',
          title: { en: 'Samson carries away the city gates of Gaza', am: 'ሶምሶን የጋዛን ከተማ በር ተሸከመ' },
          ref: 'Judges 16:3',
          route: '/bible/judges/16',
          note: 'Samson arose at midnight, pulled up the city gateposts and bars, and carried them to the top of the hill facing Hebron.'
        },
        {
          id: 'samson-temple',
          title: { en: 'Samson pulls down the pillars of the Philistine temple', am: 'ሶምሶን የፍልስጥኤማውያንን ምሰሶዎች አፈረሰ' },
          ref: 'Judges 16:30',
          route: '/bible/judges/16',
          note: 'Samson prayed for strength one last time, broke the central pillars, and brought down the house upon the Philistine rulers.'
        },
        {
          id: 'ruth-boaz',
          title: { en: 'Ruth gleans in the fields of Boaz in Bethlehem', am: 'ሩት በቦዔዝ እርሻ ቃረመች' },
          ref: 'Ruth 2:2',
          route: '/bible/ruth/2',
          note: 'During the days of the judges, Ruth found favor in the eyes of Boaz, leading to their marriage and King David’s lineage.'
        }
      ]
    },
    {
      id: 'prophets-and-exile',
      title: { en: 'Elijah to the Babylonian Exile', am: 'ከኤልያስ እስከ ባቢሎን ምርኮ' },
      events: [
        {
          id: 'elijah-cherith',
          title: { en: 'Elijah is fed by ravens at the brook Cherith', am: 'ኤልያስ በኮራት ፈፋ በቁራዎች ተመገበ' },
          ref: '1 Kings 17:5',
          route: '/bible/1-kings/17',
          note: 'During the drought announced to Ahab, God commanded ravens to bring Elijah bread and meat morning and evening.'
        },
        {
          id: 'elijah-whirlwind',
          title: { en: 'Elijah ascends to heaven in a whirlwind and chariot of fire', am: 'ኤልያስ በእሳት ሰረገላ ወደ ሰማይ ዐረገ' },
          ref: '2 Kings 2:11',
          route: '/bible/2-kings/2',
          note: 'As Elijah and Elisha walked and talked, a chariot of fire separated them, and Elijah went up into heaven.'
        },
        {
          id: 'elisha-naaman',
          title: { en: 'Elisha commands Naaman the Syrian to wash and be healed', am: 'ኤልሳዕ ንዕማንን ፈወሰው' },
          ref: '2 Kings 5:14',
          route: '/bible/2-kings/5',
          note: 'Naaman dipped seven times in the Jordan River and his flesh was restored clean like a young boy’s.'
        },
        {
          id: 'jonah-nineveh',
          title: { en: 'Jonah preaches repentance to Nineveh after the fish', am: 'ዮናስ በነነዌ ንስሐን ሰበከ' },
          ref: 'Jonah 3:4',
          route: '/bible/jonah/3',
          note: 'After being delivered from the great fish, Jonah proclaimed God’s warning to Nineveh, and the city repented.'
        },
        {
          id: 'isaiah-vision',
          title: { en: 'Isaiah sees the Lord high and lifted up in the Temple', am: 'ኢሳይያስ የጌታን ክብር በቤተ መቅደስ አየ' },
          ref: 'Isaiah 6:1',
          route: '/bible/isaiah/6',
          note: 'In the year King Uzziah died, Isaiah saw the Lord seated on a throne, with seraphim calling Holy, Holy, Holy.'
        },
        {
          id: 'hezekiah-deliverance',
          title: { en: 'King Hezekiah prays and the angel strikes Sennacherib’s army', am: 'ንጉሥ ሕዝቅያስ ጸለየ፤ የእግዚአብሔር መልአክም አዳነው' },
          ref: '2 Kings 19:35',
          route: '/bible/2-kings/19',
          note: 'Hezekiah laid Sennacherib’s threatening letter before the Lord, and that night the angel struck down the Assyrian camp.'
        },
        {
          id: 'jeremiah-call',
          title: { en: 'Jeremiah warns Jerusalem before the Babylonian destruction', am: 'ኤርምያስ ስለ ኢየሩሳሌም ጥፋት አስጠነቀቀ' },
          ref: 'Jeremiah 25:11',
          route: '/bible/jeremiah/25',
          note: 'Jeremiah prophesied that the land would become desolate and Judah would serve the king of Babylon seventy years.'
        },
        {
          id: 'daniel-lions-den',
          title: { en: 'Daniel is delivered unharmed from the lions’ den', am: 'ዳንኤል ከአንበሶች ጉድጓድ ዳነ' },
          ref: 'Daniel 6:22',
          route: '/bible/daniel/6',
          note: 'King Darius found Daniel alive because God sent His angel to shut the lions’ mouths.'
        }
      ]
    },
    {
      id: 'return-and-restoration',
      title: { en: 'The Return from Exile and Restoration', am: 'ተመላሾችና የኢየሩሳሌም ዳግም ግንባታ' },
      events: [
        {
          id: 'cyrus-proclamation',
          title: { en: 'Cyrus decrees the return of the exiles to build the house of God', am: 'ቂሮስ የተማረኩት እንዲመለሱ አዋጅ አወጣ' },
          ref: 'Ezra 1:1',
          route: '/bible/ezra/1',
          note: 'In fulfillment of Jeremiah’s prophecy, Cyrus king of Persia decreed that the exiles could return to Jerusalem to rebuild the Temple.'
        },
        {
          id: 'altar-rebuilt',
          title: { en: 'Zerubbabel and Jeshua restore the altar in Jerusalem', am: 'ዘሩባቤልና ኢያሱ መሠዊያውን እንደገና ሠሩ' },
          ref: 'Ezra 3:2',
          route: '/bible/ezra/3',
          note: 'The returning remnant rebuilt the altar of burnt offerings and resumed morning and evening sacrifices before laying the temple foundation.'
        },
        {
          id: 'temple-completed',
          title: { en: 'The Second Temple is completed under Darius', am: 'ሁለተኛው ቤተ መቅደስ ተጠናቀቀ' },
          ref: 'Ezra 6:15',
          route: '/bible/ezra/6',
          note: 'Encouraged by Haggai and Zechariah, the elders finished building the Temple in the sixth year of King Darius.'
        },
        {
          id: 'ezra-reads-law',
          title: { en: 'Ezra the scribe reads the Book of the Law to the gathered people', am: 'ዕዝራ የሕጉን መጽሐፍ ለሕዝቡ አነበበ' },
          ref: 'Nehemiah 8:3',
          route: '/bible/nehemiah/8',
          note: 'Ezra read the Law from morning until midday before the Water Gate, and the Levites explained the sense to the listeners.'
        },
        {
          id: 'nehemiah-walls',
          title: { en: 'Nehemiah finishes rebuilding the walls of Jerusalem in 52 days', am: 'ነህምያ የኢየሩሳሌምን ቅጥር በ52 ቀናት አጠናቀቀ' },
          ref: 'Nehemiah 6:15',
          route: '/bible/nehemiah/6',
          note: 'Despite intense opposition from Sanballat and Tobiah, the wall was completed in fifty-two days.'
        },
        {
          id: 'esther-deliverance',
          title: { en: 'Esther appeals to the king and saves her people from destruction', am: 'አስቴር ሕዝቧን ከጥፋት ታደገች' },
          ref: 'Esther 7:3',
          route: '/bible/esther/7',
          note: 'Queen Esther revealed Haman’s wicked plot to King Ahasuerus, securing deliverance for the Jewish people.'
        }
      ]
    },
    {
      id: 'paul-ministry',
      title: { en: 'The Journeys of Saint Paul', am: 'የቅዱስ ጳውሎስ ሐዋርያዊ ጉዞዎች' },
      events: [
        {
          id: 'antioch-sending',
          title: { en: 'The church at Antioch lays hands on Paul and Barnabas and sends them', am: 'የአንጾኪያ ቤተ ክርስቲያን ጳውሎስንና በርናባስን ላከች' },
          ref: 'Acts 13:3',
          route: '/bible/acts/13',
          note: 'Guided by the Holy Spirit, the prophets and teachers at Antioch fasted, prayed, laid hands on them, and sent them forth.'
        },
        {
          id: 'philippi-jail',
          title: { en: 'Paul and Silas sing hymns at midnight in the Philippian prison', am: 'ጳውሎስና ሲላስ በእስር ቤት ሳሉ እግዚአብሔርን አመሰገኑ' },
          ref: 'Acts 16:25',
          route: '/bible/acts/16',
          note: 'While they sang in bonds, a violent earthquake shook the prison foundations, opening all the doors.'
        },
        {
          id: 'athens-areopagus',
          title: { en: 'Paul proclaims the Unknown God to the philosophers at Athens', am: 'ጳውሎስ በአቴና ያልታወቀውን አምላክ ሰበከ' },
          ref: 'Acts 17:22',
          route: '/bible/acts/17',
          note: 'Paul stood in the midst of the Areopagus and revealed that the Creator who made the world needs nothing from human hands.'
        },
        {
          id: 'ephesus-revival',
          title: { en: 'Paul teaches daily in Ephesus and the word of the Lord spreads', am: 'ጳውሎስ በኤፌሶን የጌታን ቃል በስፋት አስተማረ' },
          ref: 'Acts 19:10',
          route: '/bible/acts/19',
          note: 'For two years Paul reasoned in the hall of Tyrannus, so that all residents of Asia heard the word.'
        },
        {
          id: 'jerusalem-arrest',
          title: { en: 'Paul is seized at the Temple in Jerusalem and rescued by tribunes', am: 'ጳውሎስ በኢየሩሳሌም ቤተ መቅደስ ተያዘ' },
          ref: 'Acts 21:30',
          route: '/bible/acts/21',
          note: 'A riot broke out at the Temple, and Roman soldiers rescued Paul from the crowd before escorting him to the barracks.'
        },
        {
          id: 'malta-shipwreck',
          title: { en: 'Paul survives the shipwreck and lands safely on Malta', am: 'ጳውሎስ በመርከብ መሰበር ወቅት በማልታ ደሴት ተረፈ' },
          ref: 'Acts 27:44',
          route: '/bible/acts/27',
          note: 'All 276 people on board escaped safely to the shore on planks and pieces of the ship, just as the angel had assured Paul.'
        },
        {
          id: 'rome-unhindered',
          title: { en: 'Paul preaches the kingdom of God under house arrest in Rome', am: 'ጳውሎስ በሮም የእግዚአብሔርን መንግሥት ያለ ከልካይ ሰበከ' },
          ref: 'Acts 28:31',
          route: '/bible/acts/28',
          note: 'For two full years Paul lived in his rented quarters, welcoming all who came to him and preaching with total boldness.'
        }
      ]
    }
  ]

  console.log('=== VALIDATING BIBLE TIMELINE PILOT (4 CHAINS, 29 EVENTS) ===')
  for (const chain of chains) {
    const draftErrors = validateStudioDraft({ game: 'bible-timeline', content: chain })
    if (draftErrors.length > 0) {
      console.error(`Validation errors in chain ${chain.id}:`, draftErrors)
      process.exit(1)
    }
  }

  // Verify that rounds can be built correctly
  const easyRounds = buildTimelineBank('easy', 5, Math.random, chains)
  const mediumRounds = buildTimelineBank('medium', 5, Math.random, chains)
  const hardRounds = buildTimelineBank('hard', 5, Math.random, chains)
  console.log(`Generated timeline rounds: Easy=${easyRounds.length}, Medium=${mediumRounds.length}, Hard=${hardRounds.length}`)

  const outDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'timeline')
  fs.mkdirSync(outDir, { recursive: true })

  fs.writeFileSync(path.join(outDir, 'chains.json'), JSON.stringify(chains, null, 2), 'utf8')

  const report = {
    generatedAt: new Date().toISOString(),
    game: 'bible-timeline',
    totalChains: chains.length,
    totalEvents: chains.reduce((sum, c) => sum + c.events.length, 0),
    chainsSummary: chains.map(c => ({
      id: c.id,
      title: c.title,
      eventCount: c.events.length,
      firstEvent: c.events[0].id,
      lastEvent: c.events[c.events.length - 1].id
    })),
    bankSimulation: {
      easyRounds: easyRounds.length,
      mediumRounds: mediumRounds.length,
      hardRounds: hardRounds.length
    },
    validation: {
      allChainsValid: true,
      errors: []
    }
  }
  fs.writeFileSync(path.join(outDir, 'report.json'), JSON.stringify(report, null, 2), 'utf8')

  console.log('Bible Timeline pilot successfully generated, validated, and saved to artifacts/faith-challenges/timeline!')
}

run().catch(err => {
  console.error(err)
  process.exit(1)
})

